Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705E15C1
	for <oe-lkp@lists.linux.dev>; Tue, 11 Apr 2023 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681173584; x=1712709584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixfhs3AgO4PLXHZxajcJkCMzhiGg61BkJ9+Ly3Q6qsg=;
  b=h0G3M/bI+rkRJsZqDlfxto2UdmdTXbeEnvv/BvOQ+CPqHJfdmO7q1z8C
   FpacX4ccgawE/9yf05MHsFOJ+AlYKtsU9Rb4KPdvmpPcmZyVh7N/bfJZK
   goly6S/yj3IbvwmkUxXaedluRxkMMjptrBZbn8lzRYVttgREv1pUOirvs
   JqyHVN9IsUb5Ar87rwkOc/ywwxKD/H5uuMb38LBB9KAYaDso0maY5CA29
   tAYBoOUcdjpjVu6u573XIoAosw/U5a6+f1XISECBI5nKpQ5gPc+1eF58c
   MvZ2OiW0V60y8Sr0/oTqG7KqICqDeklB2zNuIU9gDTffFlMmrzjy8FcM1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406319845"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="xz'341?scan'341,208,341";a="406319845"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 17:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777706220"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="xz'341?scan'341,208,341";a="777706220"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Apr 2023 17:39:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 17:39:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 17:39:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 17:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/aXrHWnlex3SE6ExQnAeJr/uwmiXYG67EGmKJosgzoeiLIpoZ4P6twlBK3oK3lCMzmZ0t/sOY6SVNpaVryddAwOGTH3vPg0L8WELkIwalhvsMa4d+ZoH5PasJmHv9QJJW1iMvidgiO11yAEbib5TIDGmGPAS9LCkZnf1LhXajuTT4R+8JX4qLMCHgL/g5nz0IuotWjk2TKsCDsB7kWl5HWK1SQYCvHNKMAdMtxQGVWX2nO86shKYcSGkIc6wNgyGVQ+m2/YFqWskvh8JT0zAe6MUBbaXLu+AqEYmMpmFd0OxWa7zBjVHVGRTylO72fRt0ie+kW4N4ZgqvmHg/T+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oAIfJ4oIdZIZrauFcfClt3nuT4ZeuziHcxZEmViJ3Y=;
 b=CuKCtOsQN45M0HCo1S+/cFET7PhlipUuK7l58cQNsx0aKbMHOIsd3V1THbE5qQCWz8+DxOM7wCD/YVBXcIersf1urKCdt6M9KAEja1dDevc3KT5FRukpGgUeUUMc1hr0cO3m/CCrQ9S5MeEiv28b/Zx3uT3EAFolsr0TKPIGeVJf07mWNto/yKeApDsVzfwvaWpGWu0TdXk5Pxf4V+5SAOMWKN7H0cBJpMyL+cEYwiYIr0y65QVQKZYrgv2Lckx67IvrfTUVTXL/Ik6rdVLfK3bPhbya1v+E2ieV7kUCGRYpBYFebw98ZvCXfnixtUJjF99vXTB919picEwi3SLitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 00:39:37 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5ac7:aae0:92aa:74f0]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5ac7:aae0:92aa:74f0%8]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 00:39:37 +0000
Date: Tue, 11 Apr 2023 08:36:29 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>
Subject: [cel:topic-shmem-stable-dir-cookies] [shmem] 5fd403eb6c:
 WARNING:inconsistent_lock_state
Message-ID: <202304101606.79aea62f-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="Sp2+hUHD8ZEZgQ8R"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 9061c28b-9e97-4adf-3495-08db3a2539d7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ct+alI+HbEKif8VSwaqspWBr2/qBBKMtep67YHaE53F1W83EX703mMPsN84nKofnNmd80TpAGMbO1b6XmrSVf7WSShFLljaQc0hQtIkVJzegaX5AzfcBYQ0StZmyO3QNBku4QxNoOtRO/1vUtpsjTTRLz+F7Xsie5cZZK1+PQnnAGzSWxnSAILKakJXl+l4qe9tpoLCOrmwq8r6k7ImDNRbW0J+F3CXnlcSATe1+2REwIoCq+Lr1pfKzP4827Jn0xU57nFcTewoE7GrGb54FGmh9iiz0yyVrI1BYu95eyfgvhEq2IKjet57mRZIdrNqajasO26/H0kCFBnnemodGkbHlkhczQsG3kXPaI2KjSKUya4PohAJgEwG5VPZtfOFbOjwpXE2kPWuZaDRjS3j2oC2Gq8MY/jgbatIkIrYv04583m0LQr/BKtwRp9HDjz0njvn7UT9dgD9IcFvKqHGoiLr90cKKKD8xRACic0A14xsr+fmSxCGP27YT7BqvSdBEQyVRmxllso0Cgz4dmJqUwHFLJ+qr+nPsTcOKtbGDnJa6bsu4nw/3IlqKIO+KGA6YqHVfvbZLCF2G0JqKLgs6jDc0RKqlw1/PTAAf4Osel2Zl+EF/ht/fNPbKt89ZncIIwqI7SgUbgsdHz3jqu50spg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(38100700002)(82960400001)(66556008)(66476007)(8676002)(66946007)(86362001)(478600001)(6916009)(4326008)(66574015)(2616005)(186003)(26005)(41300700001)(316002)(36756003)(2906002)(44144004)(1076003)(6512007)(6506007)(83380400001)(8936002)(6666004)(235185007)(5660300002)(6486002)(966005)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmPHf5hIlX9MDAzd7Xc538fHwl7Nb10Xk4vd0R9zYh9Xa5rHA65y5ttrlRIs?=
 =?us-ascii?Q?7LCiVwgxnr07FqW19/W3KF/q2teh/x3BepKTSg2UPGdDBeGxW2ZVg2px0Tsn?=
 =?us-ascii?Q?DP/MRdv+6k2zuwgG5M7F2iaXAsHVtn4nA1py1lM216pyiZtCmFg8AGPmQZrz?=
 =?us-ascii?Q?e+eIRS3eDkjTY+Ft5QkYcBdxWrMv3VK45QiU7H1PboegnVLkglY04MUIFw2I?=
 =?us-ascii?Q?LpASndSQgaOsyrLA8gLNfKFq2PCY3XyOUK7weZIyBOoA6C56AMOXk/4fhgDX?=
 =?us-ascii?Q?J21YkjjjN1/zuToNygkx4BOKDje8iCiRQXSa0xJm5cWJWIRnak0oz+H64Mi/?=
 =?us-ascii?Q?Nch+jCWPPT/u1a5FXSBG3TYcQbQ9B0k4bGtO158DcgYHTmiNVArEJz48moia?=
 =?us-ascii?Q?53oPPuuC+RvmzGlAQFPVvA24mC3smzary/eij/RxjTe+mRyphIQAqaKBiyyD?=
 =?us-ascii?Q?TMoq8iRGOQIUZHUeDYRf19yWVBSFKEU4mcGuhqHY1VXvu+GUeASXWnBKHP1g?=
 =?us-ascii?Q?8CeS3zWEooWzTfyGbQel69VhM42djdenW7mNjhmXPO/a3xq+vBr9Il/bJG0t?=
 =?us-ascii?Q?uPYLInlU4U8OulwusD4DsfvflYQIMuPUoXJK0spWwlKhUcW9A5GotZzbDqhD?=
 =?us-ascii?Q?58mvaZJ9qCnCdDb7PTIAwemOOC/Lmv9Ohm7WwprdJmilY7z2NrxI67Pss0FU?=
 =?us-ascii?Q?hbjSChZuNMpUoniHt8CESMXnq54QxrVrRhjtfgn35HZCAcwq+yTJPqMq/7Bw?=
 =?us-ascii?Q?lB+WbvpXSze5tz4yNR271xb+3YmA7WbVb7xeEX0Qkd3+0rCGVKOPwscUeKfj?=
 =?us-ascii?Q?SQmuhzCD5WwmT8QhH2iXUjkkerQ1OHu96KW8bDiAFoAcNcGPwvZwRqM+SlUs?=
 =?us-ascii?Q?dQgq6Hfo1opXGdMgDoJXs8vQu2atG7RsBvZPpARdfqwouYfkZ1AwWuyrE5NX?=
 =?us-ascii?Q?m54bFzLX/lHHBPiX722hwpQbpkuWYNgbgiLuzVEhF+a4V7TAyMaGue4nykKb?=
 =?us-ascii?Q?6wsbT3BYYdW59ZfPV9QMloN7WcHHAnwX0SI/BGWbwVJ6Upy8bjHWldsIoq0q?=
 =?us-ascii?Q?0nIYMeJud9CN9h/Hc/QVvk+YT2oBjOIyk0YgDjxfc9dBKCKrMhjZQmPrI/zq?=
 =?us-ascii?Q?V7hPzkF04A8GU51L+XDaRv36udicU3ZbO3uC2f+9/g4N1r3ZgvC5iK+461vF?=
 =?us-ascii?Q?gxdEpWFrUFMVYa9Nqao8IEbO7eqdR9DyaAGelQPUn7feb2XHxlksv2Wcsqxx?=
 =?us-ascii?Q?H9tp1EHcuyB6SfiplESI/k/He3rfGcwrDN4oYYJqm2upROLcZzSlXCdrVQsc?=
 =?us-ascii?Q?na67/HRBAxvDRWbqpLbxP+uOmLvkVTjiyG2hOsHy4OCCkcSQJYQ8Vn5KZOT6?=
 =?us-ascii?Q?m/TYSZ6FSlqOmt61krmNC3oebApihY3gm8QzJLoKraKNxw6xpw4Z2NZXSDmZ?=
 =?us-ascii?Q?neSGRcbJ5YKdmDINi4V5FZJj7DkllTdqKBrbKnHt05M22P8PD1dLJoEXt1ps?=
 =?us-ascii?Q?KH+8YdNH0JOnOAOLPQY3MaSPG/o8USIkYViyMZrJjL/ewvHrr9S4OIwBP2Px?=
 =?us-ascii?Q?gQrCCRYC9+GZdoNUJGvLPfwgPN4Fz+cVqbGWhkZx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9061c28b-9e97-4adf-3495-08db3a2539d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 00:39:36.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1DKYH4WLbWL3LU/ITPJKXlEg3ks3DtWZR2GTW4EnP2x55PfqSoIl92diSLu5neK8Sv8HV5q46y9JTR53gFycA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-OriginatorOrg: intel.com

--Sp2+hUHD8ZEZgQ8R
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: 5fd403eb6c181c63a3aacd55d92b80256a0670cf ("shmem: stable directory cookies")
git://git.kernel.org/cgit/linux/kernel/git/cel/linux topic-shmem-stable-dir-cookies

in testcase: boot

compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202304101606.79aea62f-yujie.liu@intel.com


[   21.279213][    C0] WARNING: inconsistent lock state
[   21.279668][    C0] 6.3.0-rc5-00001-g5fd403eb6c18 #1 Not tainted
[   21.280199][    C0] --------------------------------
[   21.280657][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   21.281238][    C0] swapper/0/0 [HC0[0]:SC1[1]:HE0:SE0] takes:
[ 21.281773][ C0] ffff8881102e9b50 (&xa->xa_lock#3){+.?.}-{2:2}, at: xa_destroy (lib/xarray.c:2214) 
[   21.283140][    C0] {SOFTIRQ-ON-W} state was registered at:
[ 21.283640][ C0] __lock_acquire (kernel/locking/lockdep.c:5010) 
[ 21.284089][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634) 
[ 21.284513][ C0] _raw_spin_lock (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 21.284937][ C0] shmem_doff_add (include/linux/xarray.h:965 mm/shmem.c:2943) 
[ 21.285375][ C0] shmem_mknod (mm/shmem.c:3014) 
[ 21.285791][ C0] vfs_mknod (fs/namei.c:3916) 
[ 21.286195][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228 drivers/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408) 
[ 21.286653][ C0] devtmpfsd (devtmpfs.c:?) 
[ 21.287046][ C0] kthread (kernel/kthread.c:376) 
[ 21.287441][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314) 
[   21.287864][    C0] irq event stamp: 167451
[ 21.288264][ C0] hardirqs last enabled at (167450): kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1) mm/kasan/quarantine.c:242 (discriminator 1)) 
[ 21.289095][ C0] hardirqs last disabled at (167451): _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108 kernel/locking/spinlock.c:162) 
[ 21.289969][ C0] softirqs last enabled at (167330): __do_softirq (kernel/softirq.c:415 kernel/softirq.c:600) 
[ 21.290755][ C0] softirqs last disabled at (167355): irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662) 
[   21.291540][    C0]
[   21.291540][    C0] other info that might help us debug this:
[   21.292230][    C0]  Possible unsafe locking scenario:
[   21.292230][    C0]
[   21.292905][    C0]        CPU0
[   21.293235][    C0]        ----
[   21.293575][    C0]   lock(&xa->xa_lock#3);
[   21.293987][    C0]   <Interrupt>
[   21.294327][    C0]     lock(&xa->xa_lock#3);
[   21.294753][    C0]
[   21.294753][    C0]  *** DEADLOCK ***
[   21.294753][    C0]
[   21.295483][    C0] 1 lock held by swapper/0/0:
[ 21.295914][ C0] #0: ffffffff8597a260 (rcu_callback){....}-{0:0}, at: rcu_do_batch (kernel/rcu/tree.c:2104) 
[   21.296705][    C0]
[   21.296705][    C0] stack backtrace:
[   21.297254][    C0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.3.0-rc5-00001-g5fd403eb6c18 #1
[   21.298007][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[   21.298867][    C0] Call Trace:
[   21.299199][    C0]  <IRQ>
[ 21.299503][ C0] dump_stack_lvl (lib/dump_stack.c:107) 
[ 21.299926][ C0] mark_lock_irq (kernel/locking/lockdep.c:232 kernel/locking/lockdep.c:3976 kernel/locking/lockdep.c:4179) 
[ 21.300362][ C0] ? secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:358) 
[ 21.300888][ C0] ? __pfx_mark_lock_irq (kernel/locking/lockdep.c:4170) 
[ 21.301353][ C0] ? __pfx_stack_trace_save (kernel/stacktrace.c:114) 
[ 21.302659][ C0] ? orc_find+0x23b/0x4d0 
[ 21.303106][ C0] ? save_trace (kernel/locking/lockdep.c:586) 
[ 21.303519][ C0] ? secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:358) 
[ 21.304046][ C0] ? kernel_text_address (kernel/extable.c:99) 
[ 21.304507][ C0] mark_lock+0x4b8/0x13a0 
[ 21.304959][ C0] ? __pfx_mark_lock+0x10/0x10 
[ 21.305445][ C0] mark_usage (kernel/locking/lockdep.c:4530) 
[ 21.305844][ C0] __lock_acquire (kernel/locking/lockdep.c:5010) 
[ 21.306285][ C0] ? mark_lock+0xbc/0x13a0 
[ 21.306741][ C0] ? kasan_save_stack (mm/kasan/common.c:46) 
[ 21.307182][ C0] ? __pfx___lock_acquire (kernel/locking/lockdep.c:4914) 
[ 21.307647][ C0] ? rcu_do_batch (include/linux/rcupdate.h:332 kernel/rcu/tree.c:2114) 
[ 21.308082][ C0] ? rcu_core (kernel/rcu/tree.c:2374) 
[ 21.308489][ C0] ? __do_softirq (arch/x86/include/asm/atomic.h:29 include/linux/jump_label.h:260 include/linux/jump_label.h:270 include/trace/events/irq.h:142 kernel/softirq.c:572) 
[ 21.308922][ C0] ? irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662) 
[ 21.309353][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634) 
[ 21.309771][ C0] ? xa_destroy (lib/xarray.c:2214) 
[ 21.310185][ C0] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5637) 
[ 21.310639][ C0] ? __pfx___lock_acquire (kernel/locking/lockdep.c:4914) 
[ 21.311104][ C0] ? ftrace_likely_update (arch/x86/include/asm/smap.h:56 kernel/trace/trace_branch.c:229) 
[ 21.311571][ C0] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
[ 21.312040][ C0] ? xa_destroy (lib/xarray.c:2214) 
[ 21.312457][ C0] xa_destroy (lib/xarray.c:2214) 
[ 21.312859][ C0] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634) 
[ 21.313290][ C0] ? __pfx_xa_destroy (lib/xarray.c:2208) 
[ 21.313746][ C0] shmem_free_in_core_inode (mm/shmem.c:2989 mm/shmem.c:4061) 
[ 21.314231][ C0] ? __pfx_shmem_free_in_core_inode (mm/shmem.c:4058) 
[ 21.314763][ C0] i_callback (fs/inode.c:252) 
[ 21.315154][ C0] rcu_do_batch (include/linux/rcupdate.h:332 kernel/rcu/tree.c:2114) 
[ 21.315580][ C0] ? __pfx_rcu_do_batch (kernel/rcu/tree.c:2051) 
[ 21.316037][ C0] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 arch/x86/include/asm/irqflags.h:135 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 21.316550][ C0] ? rcu_report_qs_rdp (kernel/rcu/tree.c:2002) 
[ 21.317012][ C0] rcu_core (kernel/rcu/tree.c:2374) 
[ 21.317414][ C0] __do_softirq (arch/x86/include/asm/atomic.h:29 include/linux/jump_label.h:260 include/linux/jump_label.h:270 include/trace/events/irq.h:142 kernel/softirq.c:572) 
[ 21.317836][ C0] irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662) 
[ 21.318251][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1107 (discriminator 14)) 
[   21.318749][    C0]  </IRQ>
[   21.319052][    C0]  <TASK>
[ 21.319355][ C0] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:645) 
[ 21.319880][ C0] RIP: 0010:default_idle (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:72 arch/x86/kernel/process.c:704) 
[ 21.320344][ C0] Code: ff ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 8b 05 f6 b4 a8 03 85 c0 7e 07 0f 00 2d 8b 96 3d 00 fb f4 <fa> c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	ff                   	(bad)
   1:	ff                   	(bad)
   2:	ff 90 90 90 90 90    	call   *-0x6f6f6f70(%rax)
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	f3 0f 1e fa          	endbr64
  17:	8b 05 f6 b4 a8 03    	mov    0x3a8b4f6(%rip),%eax        # 0x3a8b513
  1d:	85 c0                	test   %eax,%eax
  1f:	7e 07                	jle    0x28
  21:	0f 00 2d 8b 96 3d 00 	verw   0x3d968b(%rip)        # 0x3d96b3
  28:	fb                   	sti
  29:	f4                   	hlt
  2a:*	fa                   	cli		<-- trapping instruction
  2b:	c3                   	ret
  2c:	cc                   	int3
  2d:	cc                   	int3
  2e:	cc                   	int3
  2f:	cc                   	int3
  30:	0f 1f 00             	nopl   (%rax)
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	fa                   	cli
   1:	c3                   	ret
   2:	cc                   	int3
   3:	cc                   	int3
   4:	cc                   	int3
   5:	cc                   	int3
   6:	0f 1f 00             	nopl   (%rax)
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--Sp2+hUHD8ZEZgQ8R
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.3.0-rc5-00001-g5fd403eb6c18"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.3.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23990
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23990
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
# CONFIG_UAPI_HEADER_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_KERNEL_LZ4=y
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ_FULL is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
CONFIG_USERMODE_DRIVER=y
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
# CONFIG_TASK_IO_ACCOUNTING is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_NUMA_BALANCING is not set
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_TIME_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=4
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
# CONFIG_X86_MPPARSE is not set
CONFIG_GOLDFISH=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_VSMP is not set
# CONFIG_X86_GOLDFISH is not set
CONFIG_X86_INTEL_MID=y
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
CONFIG_IOSF_MBI_DEBUG=y
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
# CONFIG_X86_MCELOG_LEGACY is not set
# CONFIG_X86_MCE_INTEL is not set
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
# CONFIG_X86_5LEVEL is not set
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
CONFIG_SCHED_HRTICK=y
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_COMPAT_VDSO=y
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
# CONFIG_LIVEPATCH is not set
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_CALL_PADDING=y
CONFIG_HAVE_CALL_THUNKS=y
CONFIG_CALL_THUNKS=y
CONFIG_PREFIX_SYMBOLS=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_RETPOLINE=y
CONFIG_RETHUNK=y
CONFIG_CPU_UNRET_ENTRY=y
CONFIG_CALL_DEPTH_TRACKING=y
# CONFIG_CALL_THUNKS_DEBUG is not set
CONFIG_CPU_IBPB_ENTRY=y
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
# CONFIG_HIBERNATION_SNAPSHOT_DEV is not set
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_NFIT is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_EXTLOG is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_CPUFREQ_DT=m
CONFIG_CPUFREQ_DT_PLATDEV=y
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
# CONFIG_PCI_MMCONFIG is not set
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_WBT is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=m
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
# CONFIG_HWPOISON_INJECT is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=y
# CONFIG_TLS_DEVICE is not set
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
# CONFIG_NET_KEY is not set
CONFIG_SMC=m
CONFIG_SMC_DIAG=m
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
# CONFIG_IP_MULTIPLE_TABLES is not set
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=y
# CONFIG_INET_ESP_OFFLOAD is not set
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=y
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
# CONFIG_TCP_CONG_CUBIC is not set
CONFIG_TCP_CONG_WESTWOOD=m
# CONFIG_TCP_CONG_HTCP is not set
# CONFIG_TCP_CONG_HSTCP is not set
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=y
CONFIG_TCP_CONG_NV=y
CONFIG_TCP_CONG_SCALABLE=y
CONFIG_TCP_CONG_LP=m
# CONFIG_TCP_CONG_VENO is not set
CONFIG_TCP_CONG_YEAH=y
CONFIG_TCP_CONG_ILLINOIS=y
# CONFIG_TCP_CONG_DCTCP is not set
CONFIG_TCP_CONG_CDG=y
CONFIG_TCP_CONG_BBR=m
# CONFIG_DEFAULT_HYBLA is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_CDG is not set
CONFIG_DEFAULT_RENO=y
CONFIG_DEFAULT_TCP_CONG="reno"
CONFIG_TCP_MD5SIG=y
# CONFIG_IPV6 is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
# CONFIG_BPFILTER_UMH is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
# CONFIG_IP_DCCP_CCID3 is not set
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_BRIDGE=y
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
CONFIG_LLC=y
CONFIG_LLC2=m
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=y
CONFIG_IPDDP=y
CONFIG_IPDDP_ENCAP=y
# CONFIG_X25 is not set
CONFIG_LAPB=m
# CONFIG_PHONET is not set
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=y
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=y
# CONFIG_NET_SCH_MULTIQ is not set
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=y
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=y
CONFIG_NET_SCH_TBF=y
# CONFIG_NET_SCH_CBS is not set
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_MQPRIO_LIB=y
CONFIG_NET_SCH_TAPRIO=m
# CONFIG_NET_SCH_GRED is not set
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
# CONFIG_NET_SCH_CHOKE is not set
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=y
# CONFIG_NET_SCH_FQ_CODEL is not set
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=y
CONFIG_NET_SCH_HHF=m
# CONFIG_NET_SCH_PIE is not set
# CONFIG_NET_SCH_PLUG is not set
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
# CONFIG_DEFAULT_SFQ is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_ROUTE4=y
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=y
# CONFIG_CLS_U32_PERF is not set
# CONFIG_CLS_U32_MARK is not set
# CONFIG_NET_CLS_FLOW is not set
# CONFIG_NET_CLS_CGROUP is not set
# CONFIG_NET_CLS_BPF is not set
# CONFIG_NET_CLS_FLOWER is not set
CONFIG_NET_CLS_MATCHALL=m
# CONFIG_NET_EMATCH is not set
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
# CONFIG_BATMAN_ADV_BLA is not set
# CONFIG_BATMAN_ADV_DAT is not set
CONFIG_BATMAN_ADV_NC=y
# CONFIG_BATMAN_ADV_MCAST is not set
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_BATMAN_ADV_TRACING is not set
CONFIG_OPENVSWITCH=y
CONFIG_OPENVSWITCH_GRE=m
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=m
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
CONFIG_BT=m
# CONFIG_BT_BREDR is not set
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
CONFIG_BT_MSFTEXT=y
# CONFIG_BT_AOSPEXT is not set
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_HCIBTUSB=m
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
CONFIG_BT_HCIBTUSB_POLL_SYNC=y
CONFIG_BT_HCIBTUSB_BCM=y
# CONFIG_BT_HCIBTUSB_MTK is not set
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
# CONFIG_BT_HCIUART_BCSP is not set
# CONFIG_BT_HCIUART_ATH3K is not set
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIBCM203X=m
# CONFIG_BT_HCIBCM4377 is not set
# CONFIG_BT_HCIBPA10X is not set
CONFIG_BT_HCIBFUSB=m
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_ATH3K=m
# CONFIG_BT_VIRTIO is not set
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=m
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_INJECT_RX_DELAY is not set
CONFIG_AF_RXRPC_DEBUG=y
# CONFIG_RXKAD is not set
# CONFIG_RXPERF is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
# CONFIG_WIRELESS is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=m
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_RDMA is not set
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=m
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=m
CONFIG_CAIF_USB=m
CONFIG_CEPH_LIB=y
CONFIG_CEPH_LIB_PRETTYDEBUG=y
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
CONFIG_NFC=m
CONFIG_NFC_DIGITAL=m
CONFIG_NFC_NCI=m
CONFIG_NFC_NCI_SPI=m
# CONFIG_NFC_NCI_UART is not set
CONFIG_NFC_HCI=m
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_TRF7970A=m
# CONFIG_NFC_MEI_PHY is not set
CONFIG_NFC_SIM=m
CONFIG_NFC_PORT100=m
# CONFIG_NFC_VIRTUAL_NCI is not set
CONFIG_NFC_FDP=m
# CONFIG_NFC_FDP_I2C is not set
CONFIG_NFC_PN533=m
CONFIG_NFC_PN533_USB=m
CONFIG_NFC_PN533_I2C=m
CONFIG_NFC_MRVL=m
CONFIG_NFC_MRVL_USB=m
CONFIG_NFC_MRVL_I2C=m
# CONFIG_NFC_MRVL_SPI is not set
CONFIG_NFC_ST_NCI=m
# CONFIG_NFC_ST_NCI_I2C is not set
CONFIG_NFC_ST_NCI_SPI=m
# CONFIG_NFC_NXP_NCI is not set
CONFIG_NFC_S3FWRN5=m
CONFIG_NFC_S3FWRN5_I2C=m
CONFIG_NFC_ST95HF=m
# end of Near Field Communication (NFC) devices

# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
# CONFIG_FAILOVER is not set
# CONFIG_ETHTOOL_NETLINK is not set

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
CONFIG_EISA_VLB_PRIMING=y
CONFIG_EISA_PCI_EISA=y
CONFIG_EISA_VIRTUAL_ROOT=y
CONFIG_EISA_NAMES=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
CONFIG_PCIEASPM_PERFORMANCE=y
CONFIG_PCIE_PTM=y
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_ACPI is not set
CONFIG_HOTPLUG_PCI_CPCI=y
# CONFIG_HOTPLUG_PCI_CPCI_ZT5550 is not set
# CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#
CONFIG_PCI_FTPCI100=y
# CONFIG_PCI_HOST_GENERIC is not set
CONFIG_PCIE_XILINX=y
CONFIG_VMD=y
# CONFIG_PCIE_MICROCHIP_HOST is not set

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
# CONFIG_PCIE_DW_PLAT_HOST is not set
CONFIG_PCIE_INTEL_GW=y
CONFIG_PCI_MESON=y
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
CONFIG_PCI_J721E=y
CONFIG_PCI_J721E_HOST=y
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
CONFIG_RAPIDIO_DEBUG=y
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=y
CONFIG_RAPIDIO_MPORT_CDEV=m

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_CPS_GEN2=y
# CONFIG_RAPIDIO_RXS_GEN3 is not set
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MOXTET=y
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=m

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=m
CONFIG_FW_CFG_SYSFS_CMDLINE=y
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_SMI is not set
# CONFIG_GOOGLE_CBMEM is not set
CONFIG_GOOGLE_COREBOOT_TABLE=m
CONFIG_GOOGLE_MEMCONSOLE=m
# CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=m
CONFIG_GOOGLE_VPD=m

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
# CONFIG_GNSS_USB is not set
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_OF_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
CONFIG_FTL=m
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=y
# CONFIG_MTD_SWAP is not set
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=m
# CONFIG_MTD_CFI_AMDSTD is not set
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=m
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_INTEL_VR_NOR=y
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_DATAFLASH is not set
CONFIG_MTD_MCHP23K256=m
# CONFIG_MTD_MCHP48L640 is not set
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=m
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
CONFIG_MTD_ONENAND_GENERIC=m
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
# CONFIG_MTD_NAND_DENALI_PCI is not set
CONFIG_MTD_NAND_DENALI_DT=y
CONFIG_MTD_NAND_CAFE=y
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
CONFIG_MTD_NAND_CADENCE=m
CONFIG_MTD_NAND_ARASAN=y
# CONFIG_MTD_NAND_INTEL_LGM is not set

#
# Misc
#
CONFIG_MTD_SM_COMMON=y
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_NAND_RICOH=y
CONFIG_MTD_NAND_DISKONCHIP=m
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
CONFIG_MTD_SPI_NAND=m

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_SPI_NOR is not set
# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_PC_SUPERIO=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
CONFIG_BLK_DEV_FD=m
# CONFIG_BLK_DEV_FD_RAWCMD is not set
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=y
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
CONFIG_BLK_DEV_DRBD=y
CONFIG_DRBD_FAULT_INJECTION=y
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_ATA_OVER_ETH=m
CONFIG_VIRTIO_BLK=m
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set
# CONFIG_BLK_DEV_RNBD_CLIENT is not set
# CONFIG_BLK_DEV_RNBD_SERVER is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=m
CONFIG_NVME_RDMA=m
# CONFIG_NVME_FC is not set
CONFIG_NVME_TCP=m
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_LOOP is not set
CONFIG_NVME_TARGET_RDMA=m
CONFIG_NVME_TARGET_FC=y
CONFIG_NVME_TARGET_TCP=y
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
# CONFIG_AD525X_DPOT_SPI is not set
# CONFIG_DUMMY_IRQ is not set
CONFIG_IBM_ASM=y
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=m
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_HP_ILO=y
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
# CONFIG_DS1682 is not set
CONFIG_LATTICE_ECP3_CONFIG=m
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=m
# CONFIG_HISI_HIKEY_USB is not set
# CONFIG_OPEN_DICE is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_C2PORT=m
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=m
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=m
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
# CONFIG_INTEL_MEI_ME is not set
CONFIG_INTEL_MEI_TXE=y
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
CONFIG_ECHO=m
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_MISC_RTSX_USB=m
CONFIG_UACCE=m
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
# CONFIG_SCSI is not set
# end of SCSI device support

# CONFIG_ATA is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
# CONFIG_TCM_IBLOCK is not set
CONFIG_TCM_FILEIO=y
CONFIG_TCM_USER2=y
CONFIG_ISCSI_TARGET=y
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_NET is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
# CONFIG_NET_CORE is not set
CONFIG_SUNGEM_PHY=y
CONFIG_ARCNET=m
# CONFIG_ARCNET_1201 is not set
CONFIG_ARCNET_1051=m
CONFIG_ARCNET_RAW=m
CONFIG_ARCNET_CAP=m
CONFIG_ARCNET_COM90xx=m
CONFIG_ARCNET_COM90xxIO=m
# CONFIG_ARCNET_RIM_I is not set
CONFIG_ARCNET_COM20020=m
CONFIG_ARCNET_COM20020_PCI=m
CONFIG_CAIF_DRIVERS=y
CONFIG_CAIF_TTY=m
CONFIG_CAIF_VIRTIO=m
CONFIG_ETHERNET=y
CONFIG_MDIO=m
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
CONFIG_ADAPTEC_STARFIRE=m
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
CONFIG_ALTERA_TSE=m
# CONFIG_NET_VENDOR_AMAZON is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_AQTION=y
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
CONFIG_BCMGENET=m
CONFIG_BNX2=m
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
CONFIG_BNX2X=m
CONFIG_SYSTEMPORT=m
CONFIG_BNXT=m
CONFIG_BNXT_FLOWER_OFFLOAD=y
# CONFIG_BNXT_DCB is not set
CONFIG_BNXT_HWMON=y
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_MACB=m
CONFIG_MACB_USE_HWSTAMP=y
# CONFIG_MACB_PCI is not set
# CONFIG_NET_VENDOR_CAVIUM is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CIRRUS is not set
# CONFIG_NET_VENDOR_CISCO is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_GEMINI_ETHERNET=m
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
CONFIG_DL2K=y
CONFIG_SUNDANCE=y
# CONFIG_SUNDANCE_MMIO is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
# CONFIG_BE2NET_HWMON is not set
CONFIG_BE2NET_BE2=y
CONFIG_BE2NET_BE3=y
# CONFIG_BE2NET_LANCER is not set
# CONFIG_BE2NET_SKYHAWK is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
# CONFIG_NET_VENDOR_GOOGLE is not set
# CONFIG_NET_VENDOR_HUAWEI is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_IXGBEVF is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_JME=m
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_LITEX_LITEETH is not set
# CONFIG_NET_VENDOR_MARVELL is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=m
# CONFIG_MLX4_EN_DCB is not set
CONFIG_MLX4_CORE=m
CONFIG_MLX4_DEBUG=y
# CONFIG_MLX4_CORE_GEN2 is not set
CONFIG_MLX5_CORE=m
CONFIG_MLX5_FPGA=y
CONFIG_MLX5_CORE_EN=y
# CONFIG_MLX5_EN_ARFS is not set
# CONFIG_MLX5_EN_RXNFC is not set
# CONFIG_MLX5_MPFS is not set
CONFIG_MLX5_ESWITCH=y
CONFIG_MLX5_BRIDGE=y
CONFIG_MLX5_CORE_EN_DCB=y
CONFIG_MLX5_CORE_IPOIB=y
CONFIG_MLX5_SW_STEERING=y
# CONFIG_MLX5_SF is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
CONFIG_KS8851=m
CONFIG_KS8851_MLL=m
CONFIG_KSZ884X_PCI=m
CONFIG_NET_VENDOR_MICROCHIP=y
CONFIG_ENC28J60=m
CONFIG_ENC28J60_WRITEVERIFY=y
# CONFIG_ENCX24J600 is not set
CONFIG_LAN743X=m
# CONFIG_LAN966X_SWITCH is not set
# CONFIG_VCAP is not set
# CONFIG_NET_VENDOR_MICROSEMI is not set
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
CONFIG_MYRI10GE=y
CONFIG_FEALNX=m
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
CONFIG_NATSEMI=m
CONFIG_NS83820=y
CONFIG_NET_VENDOR_NETERION=y
CONFIG_S2IO=m
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_NET_VENDOR_8390=y
CONFIG_NE2K_PCI=y
# CONFIG_NET_VENDOR_NVIDIA is not set
CONFIG_NET_VENDOR_OKI=y
CONFIG_ETHOC=y
# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
# CONFIG_NET_VENDOR_PENSANDO is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
CONFIG_QLCNIC=y
CONFIG_QLCNIC_DCB=y
# CONFIG_QLCNIC_HWMON is not set
CONFIG_NETXEN_NIC=m
CONFIG_QED=m
# CONFIG_QEDE is not set
CONFIG_NET_VENDOR_BROCADE=y
CONFIG_BNA=m
# CONFIG_NET_VENDOR_QUALCOMM is not set
# CONFIG_NET_VENDOR_RDC is not set
CONFIG_NET_VENDOR_REALTEK=y
CONFIG_ATP=m
# CONFIG_8139CP is not set
CONFIG_8139TOO=y
# CONFIG_8139TOO_PIO is not set
CONFIG_8139TOO_TUNE_TWISTER=y
CONFIG_8139TOO_8129=y
CONFIG_8139_OLD_RX_RESET=y
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
# CONFIG_NET_VENDOR_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
CONFIG_SXGBE_ETH=m
CONFIG_NET_VENDOR_SEEQ=y
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_SFC=m
CONFIG_SFC_MTD=y
CONFIG_SFC_MCDI_MON=y
# CONFIG_SFC_MCDI_LOGGING is not set
CONFIG_SFC_FALCON=m
CONFIG_SFC_FALCON_MTD=y
# CONFIG_SFC_SIENA is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_SOCIONEXT is not set
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=m
# CONFIG_STMMAC_SELFTESTS is not set
CONFIG_STMMAC_PLATFORM=m
# CONFIG_DWMAC_DWC_QOS_ETH is not set
CONFIG_DWMAC_GENERIC=m
# CONFIG_DWMAC_INTEL_PLAT is not set
CONFIG_DWMAC_INTEL=m
# CONFIG_DWMAC_LOONGSON is not set
CONFIG_STMMAC_PCI=m
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=m
CONFIG_SUNGEM=y
CONFIG_CASSINI=y
CONFIG_NIU=y
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=m
CONFIG_DWC_XLGMAC_PCI=m
CONFIG_NET_VENDOR_TEHUTI=y
CONFIG_TEHUTI=y
# CONFIG_NET_VENDOR_TI is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
CONFIG_VIA_RHINE=y
# CONFIG_VIA_RHINE_MMIO is not set
CONFIG_VIA_VELOCITY=m
CONFIG_NET_VENDOR_WIZNET=y
CONFIG_WIZNET_W5100=m
# CONFIG_WIZNET_W5300 is not set
CONFIG_WIZNET_BUS_DIRECT=y
# CONFIG_WIZNET_BUS_INDIRECT is not set
# CONFIG_WIZNET_BUS_ANY is not set
# CONFIG_NET_VENDOR_XILINX is not set
CONFIG_FDDI=m
# CONFIG_DEFXX is not set
CONFIG_SKFP=m
CONFIG_HIPPI=y
CONFIG_ROADRUNNER=m
CONFIG_ROADRUNNER_LARGE_RINGS=y
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=m
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_LED_TRIGGER_PHY=y
CONFIG_FIXED_PHY=y
CONFIG_SFP=m

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
CONFIG_ADIN_PHY=m
# CONFIG_ADIN1100_PHY is not set
CONFIG_AQUANTIA_PHY=y
# CONFIG_AX88796B_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
CONFIG_BCM7XXX_PHY=m
CONFIG_BCM84881_PHY=m
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=m
CONFIG_CICADA_PHY=m
CONFIG_CORTINA_PHY=y
CONFIG_DAVICOM_PHY=m
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=y
CONFIG_MARVELL_PHY=m
CONFIG_MARVELL_10G_PHY=m
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MICREL_PHY=m
CONFIG_MICROCHIP_PHY=m
CONFIG_MICROCHIP_T1_PHY=y
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
CONFIG_NATIONAL_PHY=y
# CONFIG_NXP_C45_TJA11XX_PHY is not set
CONFIG_NXP_TJA11XX_PHY=y
# CONFIG_NCN26000_PHY is not set
# CONFIG_AT803X_PHY is not set
CONFIG_QSEMI_PHY=y
CONFIG_REALTEK_PHY=y
CONFIG_RENESAS_PHY=m
CONFIG_ROCKCHIP_PHY=y
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=m
CONFIG_TERANETICS_PHY=m
CONFIG_DP83822_PHY=m
CONFIG_DP83TC811_PHY=m
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
CONFIG_DP83869_PHY=m
# CONFIG_DP83TD510_PHY is not set
CONFIG_VITESSE_PHY=y
CONFIG_XILINX_GMII2RGMII=m
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_BCM_UNIMAC=y
CONFIG_MDIO_CAVIUM=m
CONFIG_MDIO_GPIO=m
CONFIG_MDIO_HISI_FEMAC=y
CONFIG_MDIO_I2C=m
CONFIG_MDIO_MVUSB=y
CONFIG_MDIO_MSCC_MIIM=y
# CONFIG_MDIO_OCTEON is not set
CONFIG_MDIO_IPQ4019=y
# CONFIG_MDIO_IPQ8064 is not set
CONFIG_MDIO_THUNDER=m

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=y
# CONFIG_MDIO_BUS_MUX_GPIO is not set
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set

#
# PCS device drivers
#
CONFIG_PCS_XPCS=m
CONFIG_PCS_ALTERA_TSE=m
# end of PCS device drivers

CONFIG_PLIP=m
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPP_ASYNC=m
# CONFIG_PPP_SYNC_TTY is not set
CONFIG_SLIP=y
CONFIG_SLHC=m
# CONFIG_SLIP_COMPRESSED is not set
CONFIG_SLIP_SMART=y
CONFIG_SLIP_MODE_SLIP6=y
CONFIG_USB_NET_DRIVERS=m
CONFIG_USB_CATC=m
CONFIG_USB_KAWETH=m
CONFIG_USB_PEGASUS=m
CONFIG_USB_RTL8150=m
# CONFIG_USB_RTL8152 is not set
CONFIG_USB_LAN78XX=m
CONFIG_USB_USBNET=m
# CONFIG_USB_NET_AX8817X is not set
CONFIG_USB_NET_AX88179_178A=m
CONFIG_USB_NET_CDCETHER=m
CONFIG_USB_NET_CDC_EEM=m
CONFIG_USB_NET_CDC_NCM=m
CONFIG_USB_NET_HUAWEI_CDC_NCM=m
CONFIG_USB_NET_CDC_MBIM=m
CONFIG_USB_NET_DM9601=m
# CONFIG_USB_NET_SR9700 is not set
CONFIG_USB_NET_SR9800=m
# CONFIG_USB_NET_SMSC75XX is not set
CONFIG_USB_NET_SMSC95XX=m
CONFIG_USB_NET_GL620A=m
# CONFIG_USB_NET_NET1080 is not set
CONFIG_USB_NET_PLUSB=m
CONFIG_USB_NET_MCS7830=m
# CONFIG_USB_NET_RNDIS_HOST is not set
CONFIG_USB_NET_CDC_SUBSET_ENABLE=m
CONFIG_USB_NET_CDC_SUBSET=m
# CONFIG_USB_ALI_M5632 is not set
CONFIG_USB_AN2720=y
# CONFIG_USB_BELKIN is not set
# CONFIG_USB_ARMLINUX is not set
# CONFIG_USB_EPSON2888 is not set
CONFIG_USB_KC2190=y
# CONFIG_USB_NET_ZAURUS is not set
CONFIG_USB_NET_CX82310_ETH=m
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
CONFIG_USB_HSO=m
CONFIG_USB_NET_INT51X1=m
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_VL600 is not set
CONFIG_USB_NET_CH9200=m
# CONFIG_USB_NET_AQC111 is not set
CONFIG_USB_RTL8153_ECM=m
# CONFIG_WLAN is not set
CONFIG_WAN=y
# CONFIG_HDLC is not set
CONFIG_IEEE802154_DRIVERS=m
CONFIG_IEEE802154_FAKELB=m
CONFIG_IEEE802154_AT86RF230=m
# CONFIG_IEEE802154_MRF24J40 is not set
CONFIG_IEEE802154_CC2520=m
CONFIG_IEEE802154_ATUSB=m
CONFIG_IEEE802154_ADF7242=m
CONFIG_IEEE802154_CA8210=m
# CONFIG_IEEE802154_CA8210_DEBUGFS is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_USB4_NET=y
CONFIG_NETDEVSIM=y
# CONFIG_NET_FAILOVER is not set
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=m
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=y
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=m
CONFIG_KEYBOARD_GPIO=m
CONFIG_KEYBOARD_GPIO_POLLED=y
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=m
CONFIG_KEYBOARD_MAX7359=m
# CONFIG_KEYBOARD_MCS is not set
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_NEWTON=m
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
CONFIG_KEYBOARD_SAMSUNG=y
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
CONFIG_KEYBOARD_STOWAWAY=m
# CONFIG_KEYBOARD_SUNKBD is not set
CONFIG_KEYBOARD_STMPE=m
CONFIG_KEYBOARD_IQS62X=y
CONFIG_KEYBOARD_OMAP4=y
CONFIG_KEYBOARD_TC3589X=y
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_TWL4030=y
CONFIG_KEYBOARD_XTKBD=m
CONFIG_KEYBOARD_CAP11XX=y
CONFIG_KEYBOARD_BCM=y
CONFIG_KEYBOARD_MTK_PMIC=m
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_HANWANG=y
CONFIG_TABLET_USB_KBTAB=m
CONFIG_TABLET_USB_PEGASUS=y
# CONFIG_TABLET_SERIAL_WACOM4 is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
# CONFIG_RMI4_SPI is not set
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_CT82C710=y
CONFIG_SERIO_PARKBD=m
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=m
CONFIG_SERIO_ARC_PS2=m
CONFIG_SERIO_APBPS2=y
CONFIG_SERIO_GPIO_PS2=m
CONFIG_USERIO=m
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=m
CONFIG_SERIAL_8250_EXAR=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250_DETECT_IRQ=y
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y
CONFIG_SERIAL_OF_PLATFORM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_MAX3100=m
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_SIFIVE=y
# CONFIG_SERIAL_SIFIVE_CONSOLE is not set
CONFIG_SERIAL_LANTIQ=m
CONFIG_SERIAL_SCCNXP=m
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_XILINX_PS_UART=y
CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=m
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
CONFIG_MOXA_SMARTIO=y
CONFIG_SYNCLINK_GT=y
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=m
CONFIG_N_GSM=y
CONFIG_NOZOMI=m
CONFIG_NULL_TTY=m
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
# CONFIG_IPMI_IPMB is not set
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
# CONFIG_SSIF_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_CCTRNG is not set
CONFIG_HW_RANDOM_XIPHERA=y
CONFIG_APPLICOM=m
CONFIG_MWAVE=y
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=m
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=m
# CONFIG_TCG_TIS is not set
CONFIG_TCG_TIS_SPI=m
CONFIG_TCG_TIS_SPI_CR50=y
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=m
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_PCIE=y
CONFIG_XILLYBUS_OF=y
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=m
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=m
CONFIG_I2C_ALI1535=y
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=m
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=y
CONFIG_I2C_ISMT=m
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=m
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=m
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=m
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EMEV2=m
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_RK3X=m
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
# CONFIG_I2C_DLN2 is not set
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PARPORT is not set
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=m
CONFIG_I2C_TAOS_EVM=m
CONFIG_I2C_TINY_USB=m
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
CONFIG_I2C_FSI=y
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
CONFIG_CDNS_I3C_MASTER=m
# CONFIG_DW_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
# CONFIG_MIPI_I3C_HCI is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_BUTTERFLY is not set
CONFIG_SPI_CADENCE=m
# CONFIG_SPI_CADENCE_QUADSPI is not set
# CONFIG_SPI_CADENCE_XSPI is not set
# CONFIG_SPI_DESIGNWARE is not set
CONFIG_SPI_DLN2=m
CONFIG_SPI_FSI=y
CONFIG_SPI_NXP_FLEXSPI=m
CONFIG_SPI_GPIO=m
# CONFIG_SPI_INTEL_PCI is not set
# CONFIG_SPI_INTEL_PLATFORM is not set
CONFIG_SPI_LM70_LLP=m
# CONFIG_SPI_FSL_SPI is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
CONFIG_SPI_LANTIQ_SSC=y
CONFIG_SPI_OC_TINY=m
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=y
CONFIG_SPI_SC18IS602=y
CONFIG_SPI_SIFIVE=m
# CONFIG_SPI_SN_F_OSPI is not set
CONFIG_SPI_MXIC=m
CONFIG_SPI_XCOMM=y
# CONFIG_SPI_XILINX is not set
CONFIG_SPI_ZYNQMP_GQSPI=y
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=m
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=m
CONFIG_PTP_1588_CLOCK_OPTIONAL=m
CONFIG_DP83640_PHY=m
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
CONFIG_PTP_1588_CLOCK_IDT82P33=m
CONFIG_PTP_1588_CLOCK_IDTCM=m
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_1588_CLOCK_OCP is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AS3722=m
CONFIG_PINCTRL_AXP209=m
# CONFIG_PINCTRL_CY8C95X0 is not set
CONFIG_PINCTRL_DA9062=m
CONFIG_PINCTRL_EQUILIBRIUM=m
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08_SPI=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
# CONFIG_PINCTRL_OCELOT is not set
CONFIG_PINCTRL_RK805=m
# CONFIG_PINCTRL_SINGLE is not set
# CONFIG_PINCTRL_STMFX is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_LOCHNAGAR=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_MERRIFIELD is not set
# CONFIG_PINCTRL_MOOREFIELD is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
# CONFIG_GPIO_ALTERA is not set
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_CADENCE is not set
CONFIG_GPIO_DWAPB=m
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HLWD is not set
CONFIG_GPIO_ICH=y
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_SIFIVE=y
CONFIG_GPIO_SIOX=m
CONFIG_GPIO_SYSCON=m
CONFIG_GPIO_VX855=m
# CONFIG_GPIO_WCD934X is not set
CONFIG_GPIO_XILINX=m
CONFIG_GPIO_AMD_FCH=m
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH=m
CONFIG_GPIO_SCH311X=m
CONFIG_GPIO_WINBOND=m
CONFIG_GPIO_WS16C48=m
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADNP is not set
CONFIG_GPIO_GW_PLD=m
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
# CONFIG_GPIO_PCA953X_IRQ is not set
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_DA9052=m
CONFIG_GPIO_DLN2=m
CONFIG_GPIO_JANZ_TTL=y
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_LP873X=y
# CONFIG_GPIO_LP87565 is not set
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_RC5T583=y
# CONFIG_GPIO_STMPE is not set
# CONFIG_GPIO_TC3589X is not set
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_TQMX86 is not set
CONFIG_GPIO_TWL4030=m
CONFIG_GPIO_TWL6040=m
CONFIG_GPIO_WM831X=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_MERRIFIELD is not set
CONFIG_GPIO_ML_IOH=y
# CONFIG_GPIO_PCI_IDIO_16 is not set
CONFIG_GPIO_PCIE_IDIO_24=y
CONFIG_GPIO_RDC321X=m
CONFIG_GPIO_SODAVILLE=y
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=y
CONFIG_GPIO_MAX3191X=m
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=m
CONFIG_GPIO_PISOSR=m
# CONFIG_GPIO_XRA1403 is not set
# CONFIG_GPIO_MOXTET is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=m
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_MAX8925_POWER is not set
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_88PM860X is not set
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=m
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9030=y
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_DA9150=m
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_ISP1704=m
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=m
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_DETECTOR_MAX14656=m
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MAX8997 is not set
# CONFIG_CHARGER_MAX8998 is not set
# CONFIG_CHARGER_MT6360 is not set
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=m
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=m
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_RK817 is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_CHARGER_TPS65217=m
CONFIG_BATTERY_GAUGE_LTC2941=m
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_RT9467 is not set
# CONFIG_CHARGER_RT9471 is not set
# CONFIG_CHARGER_UCS1002 is not set
CONFIG_CHARGER_BD99954=y
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
# CONFIG_SENSORS_AD7314 is not set
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=m
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7310=m
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=y
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
# CONFIG_SENSORS_K10TEMP is not set
CONFIG_SENSORS_FAM15H_POWER=y
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DELL_SMM=m
# CONFIG_I8K is not set
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=y
# CONFIG_SENSORS_FSCHMD is not set
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
# CONFIG_SENSORS_GPIO_FAN is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
CONFIG_SENSORS_I5500=m
# CONFIG_SENSORS_CORETEMP is not set
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LOCHNAGAR is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2947_SPI=y
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX1111=y
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_MLXREG_FAN=m
CONFIG_SENSORS_TC654=m
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_MR75203=m
# CONFIG_SENSORS_ADCXX is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NCT6683 is not set
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OCC_P9_SBE is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1266=m
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_BEL_PFE=m
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=m
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
CONFIG_SENSORS_IR35221=m
# CONFIG_SENSORS_IR36021 is not set
CONFIG_SENSORS_IR38064=m
# CONFIG_SENSORS_IR38064_REGULATOR is not set
CONFIG_SENSORS_IRPS5401=m
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=m
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
# CONFIG_SENSORS_MAX16064 is not set
CONFIG_SENSORS_MAX16601=m
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TDA38640 is not set
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
# CONFIG_SENSORS_SHT15 is not set
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=y
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
# CONFIG_SENSORS_EMC2305 is not set
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=m
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=y
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=m
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=y
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=y
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
# CONFIG_THERMAL_OF is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_DEVFREQ_THERMAL is not set
CONFIG_THERMAL_EMULATION=y
CONFIG_THERMAL_MMIO=m
CONFIG_DA9062_THERMAL=m

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=y
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=m
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
CONFIG_DA9052_WATCHDOG=m
CONFIG_DA9062_WATCHDOG=m
CONFIG_GPIO_WATCHDOG=m
CONFIG_MENF21BMC_WATCHDOG=m
# CONFIG_WDAT_WDT is not set
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=m
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_DW_WATCHDOG=m
CONFIG_RN5T618_WATCHDOG=m
# CONFIG_TWL4030_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=m
CONFIG_STPMIC1_WATCHDOG=m
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=y
# CONFIG_ADVANTECH_EC_WDT is not set
# CONFIG_ALIM1535_WDT is not set
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
CONFIG_IBMASR=m
CONFIG_WAFER_WDT=y
CONFIG_I6300ESB_WDT=m
CONFIG_IE6XX_WDT=y
CONFIG_INTEL_MID_WATCHDOG=y
# CONFIG_ITCO_WDT is not set
# CONFIG_IT8712F_WDT is not set
# CONFIG_IT87_WDT is not set
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_KEMPLD_WDT is not set
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=y
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
CONFIG_SMSC37B787_WDT=m
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=y
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=y
CONFIG_W83977F_WDT=m
# CONFIG_MACHZ_WDT is not set
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
CONFIG_MEN_A21_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
CONFIG_MFD_AS3722=m
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_ATMEL_FLEXCOM=m
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_MADERA_SPI is not set
# CONFIG_MFD_CS47L15 is not set
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=m
# CONFIG_MFD_GATEWORKS_GSC is not set
CONFIG_MFD_MC13XXX=y
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_MFD_HI6421_PMIC=m
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC_MRFLD is not set
CONFIG_MFD_INTEL_LPSS=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
CONFIG_MFD_IQS62X=y
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=m
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77650 is not set
CONFIG_MFD_MAX77686=m
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77714 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=m
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=m
# CONFIG_MFD_OCELOT is not set
CONFIG_EZX_PCAP=y
# CONFIG_MFD_CPCAP is not set
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_NTXEC is not set
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RDC321X=m
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_RK808=m
CONFIG_MFD_RN5T618=y
CONFIG_MFD_SEC_CORE=m
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=m
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
CONFIG_STMPE_I2C=y
CONFIG_STMPE_SPI=y
# end of STMicroelectronics STMPE Interface Drivers

CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=m
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TI_LP87565=y
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS65219 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_MFD_TPS65912_SPI is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=y
CONFIG_MFD_TC3589X=y
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
CONFIG_MFD_LOCHNAGAR=y
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ROHM_BD718XX is not set
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_ROHM_BD957XMUF is not set
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=m
CONFIG_MFD_WCD934X=m
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_QCOM_PM8008 is not set
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# CONFIG_MFD_RSMU_I2C is not set
# CONFIG_MFD_RSMU_SPI is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_88PM800=m
CONFIG_REGULATOR_88PM8607=y
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_AAT2870 is not set
CONFIG_REGULATOR_AS3722=m
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_DA903X=m
CONFIG_REGULATOR_DA9052=y
# CONFIG_REGULATOR_DA9062 is not set
# CONFIG_REGULATOR_DA9121 is not set
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_HI6421 is not set
CONFIG_REGULATOR_HI6421V530=m
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LOCHNAGAR=y
CONFIG_REGULATOR_LP3971=m
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP873X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP87565=m
# CONFIG_REGULATOR_LP8788 is not set
CONFIG_REGULATOR_LTC3589=m
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=y
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX8649=m
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8925=y
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX8997=m
CONFIG_REGULATOR_MAX8998=y
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX20411 is not set
CONFIG_REGULATOR_MAX77686=m
CONFIG_REGULATOR_MAX77802=m
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MCP16502 is not set
# CONFIG_REGULATOR_MP5416 is not set
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MP886X=m
CONFIG_REGULATOR_MPQ7920=m
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6331 is not set
# CONFIG_REGULATOR_MT6332 is not set
# CONFIG_REGULATOR_MT6357 is not set
CONFIG_REGULATOR_MT6358=m
# CONFIG_REGULATOR_MT6359 is not set
CONFIG_REGULATOR_MT6360=m
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCAP=m
CONFIG_REGULATOR_PCF50633=y
# CONFIG_REGULATOR_PF8X00 is not set
CONFIG_REGULATOR_PFUZE100=m
# CONFIG_REGULATOR_PV88060 is not set
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=m
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=m
CONFIG_REGULATOR_RC5T583=m
# CONFIG_REGULATOR_RK808 is not set
CONFIG_REGULATOR_RN5T618=y
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5759 is not set
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6190 is not set
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=m
# CONFIG_REGULATOR_RTQ6752 is not set
CONFIG_REGULATOR_S2MPA01=m
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
CONFIG_REGULATOR_SKY81452=m
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_STPMIC1=y
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_SY8827N is not set
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS62360=m
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=m
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=m
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_TPS65217 is not set
# CONFIG_REGULATOR_TPS6524X is not set
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TWL4030=m
CONFIG_REGULATOR_VCTRL=m
CONFIG_REGULATOR_WM831X=m
CONFIG_RC_CORE=y
CONFIG_BPF_LIRC_MODE2=y
CONFIG_LIRC=y
# CONFIG_RC_MAP is not set
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=m

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_VIDEO_TUNER=m
# CONFIG_V4L2_FLASH_LED_CLASS is not set
CONFIG_V4L2_FWNODE=m
CONFIG_V4L2_ASYNC=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
CONFIG_VIDEO_TW5864=m
CONFIG_VIDEO_TW68=m
# CONFIG_VIDEO_ZORAN is not set

#
# Media capture/analog TV support
#
CONFIG_VIDEO_DT3155=m
CONFIG_VIDEO_IVTV=m
# CONFIG_VIDEO_HEXIUM_GEMINI is not set
CONFIG_VIDEO_HEXIUM_ORION=m
CONFIG_VIDEO_MXB=m

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_BT848=m
CONFIG_VIDEO_CX25821=m
# CONFIG_VIDEO_CX88 is not set
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_RC=y
# CONFIG_VIDEO_IPU3_CIO2 is not set
CONFIG_RADIO_ADAPTERS=m
CONFIG_RADIO_MAXIRADIO=m
# CONFIG_RADIO_SAA7706H is not set
CONFIG_RADIO_SHARK=m
CONFIG_RADIO_SHARK2=m
CONFIG_RADIO_SI4713=m
CONFIG_RADIO_TEA575X=m
CONFIG_RADIO_TEA5764=m
CONFIG_RADIO_TEF6862=m
CONFIG_RADIO_WL1273=m
# CONFIG_USB_DSBR is not set
CONFIG_USB_KEENE=m
# CONFIG_USB_MA901 is not set
CONFIG_USB_MR800=m
CONFIG_USB_RAREMONO=m
# CONFIG_RADIO_SI470X is not set
CONFIG_USB_SI4713=m
CONFIG_PLATFORM_SI4713=m
CONFIG_I2C_SI4713=m
CONFIG_RADIO_WL128X=m
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_VIDEO_SAA7146=m
CONFIG_VIDEO_SAA7146_VV=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
# CONFIG_VIDEO_AR0521 is not set
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_HI846 is not set
# CONFIG_VIDEO_HI847 is not set
# CONFIG_VIDEO_IMX208 is not set
CONFIG_VIDEO_IMX214=m
# CONFIG_VIDEO_IMX219 is not set
CONFIG_VIDEO_IMX258=m
# CONFIG_VIDEO_IMX274 is not set
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX296 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX334 is not set
# CONFIG_VIDEO_IMX335 is not set
# CONFIG_VIDEO_IMX355 is not set
# CONFIG_VIDEO_IMX412 is not set
# CONFIG_VIDEO_IMX415 is not set
CONFIG_VIDEO_MAX9271_LIB=m
# CONFIG_VIDEO_MT9M001 is not set
CONFIG_VIDEO_MT9M032=m
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9P031 is not set
CONFIG_VIDEO_MT9T001=m
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
CONFIG_VIDEO_MT9V032=m
CONFIG_VIDEO_MT9V111=m
CONFIG_VIDEO_NOON010PC30=m
# CONFIG_VIDEO_OG01A1B is not set
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV08D10 is not set
# CONFIG_VIDEO_OV08X40 is not set
CONFIG_VIDEO_OV13858=m
# CONFIG_VIDEO_OV13B10 is not set
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=m
# CONFIG_VIDEO_OV2680 is not set
CONFIG_VIDEO_OV2685=m
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV4689 is not set
# CONFIG_VIDEO_OV5640 is not set
CONFIG_VIDEO_OV5645=m
CONFIG_VIDEO_OV5647=m
# CONFIG_VIDEO_OV5648 is not set
CONFIG_VIDEO_OV5670=m
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5693 is not set
CONFIG_VIDEO_OV5695=m
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=m
CONFIG_VIDEO_OV772X=m
CONFIG_VIDEO_OV7740=m
CONFIG_VIDEO_OV8856=m
# CONFIG_VIDEO_OV8858 is not set
# CONFIG_VIDEO_OV8865 is not set
# CONFIG_VIDEO_OV9282 is not set
# CONFIG_VIDEO_OV9640 is not set
CONFIG_VIDEO_OV9650=m
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_RDACM20=m
# CONFIG_VIDEO_RDACM21 is not set
CONFIG_VIDEO_RJ54N1=m
# CONFIG_VIDEO_S5C73M3 is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_S5K6A3 is not set
CONFIG_VIDEO_S5K6AA=m
CONFIG_VIDEO_SR030PC30=m
# CONFIG_VIDEO_ST_VGXY61 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_CCS is not set
CONFIG_VIDEO_ET8EK8=m
CONFIG_VIDEO_M5MOLS=m
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
CONFIG_VIDEO_AK7375=m
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9768 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_CS3308 is not set
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_SONY_BTF_MPX=m
CONFIG_VIDEO_TDA7432=m
CONFIG_VIDEO_TDA9840=m
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_TLV320AIC23B=m
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_UDA1342=m
CONFIG_VIDEO_VP27SMPX=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=m
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_ADV748X is not set
# CONFIG_VIDEO_ADV7604 is not set
CONFIG_VIDEO_ADV7842=m
CONFIG_VIDEO_ADV7842_CEC=y
CONFIG_VIDEO_BT819=m
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_ISL7998X is not set
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_MAX9286=m
CONFIG_VIDEO_ML86V7667=m
# CONFIG_VIDEO_SAA7110 is not set
CONFIG_VIDEO_SAA711X=m
# CONFIG_VIDEO_TC358743 is not set
# CONFIG_VIDEO_TC358746 is not set
# CONFIG_VIDEO_TVP514X is not set
CONFIG_VIDEO_TVP5150=m
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
CONFIG_VIDEO_TW9906=m
CONFIG_VIDEO_TW9910=m
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_AD9389B=m
CONFIG_VIDEO_ADV7170=m
CONFIG_VIDEO_ADV7175=m
CONFIG_VIDEO_ADV7343=m
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_ADV7511 is not set
CONFIG_VIDEO_AK881X=m
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
CONFIG_VIDEO_THS8200=m
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_I2C=m
CONFIG_VIDEO_M52790=m
# CONFIG_VIDEO_ST_MIPID02 is not set
CONFIG_VIDEO_THS7303=m
# end of Miscellaneous helper chips

#
# Media SPI Adapters
#
CONFIG_VIDEO_GS1662=m
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC0011=m
# CONFIG_MEDIA_TUNER_FC0012 is not set
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_FC2580=m
# CONFIG_MEDIA_TUNER_IT913X is not set
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_MAX2165=m
# CONFIG_MEDIA_TUNER_MC44S803 is not set
CONFIG_MEDIA_TUNER_MSI001=m
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT20XX=m
# CONFIG_MEDIA_TUNER_MT2131 is not set
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_MXL5005S=m
# CONFIG_MEDIA_TUNER_MXL5007T is not set
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_SI2157=m
# CONFIG_MEDIA_TUNER_SIMPLE is not set
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m
# end of Customize TV tuners
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_AGP=m
# CONFIG_AGP_AMD64 is not set
CONFIG_AGP_INTEL=m
CONFIG_AGP_SIS=m
CONFIG_AGP_VIA=m
CONFIG_INTEL_GTT=m
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_L4F00242T03=m
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=m
CONFIG_LCD_ILI9320=m
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
# CONFIG_LCD_PLATFORM is not set
# CONFIG_LCD_AMS369FG06 is not set
CONFIG_LCD_LMS501KF03=m
CONFIG_LCD_HX8357=m
CONFIG_LCD_OTM3225A=m
CONFIG_BACKLIGHT_CLASS_DEVICE=m
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_DA903X=m
CONFIG_BACKLIGHT_DA9052=m
CONFIG_BACKLIGHT_MAX8925=m
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_SAHARA=m
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_88PM860X=m
CONFIG_BACKLIGHT_PCF50633=m
CONFIG_BACKLIGHT_AAT2870=m
CONFIG_BACKLIGHT_LM3639=m
CONFIG_BACKLIGHT_PANDORA=m
CONFIG_BACKLIGHT_SKY81452=m
CONFIG_BACKLIGHT_TPS65217=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=m
CONFIG_BACKLIGHT_LED=m
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=y
# CONFIG_HID_CHERRY is not set
CONFIG_HID_COUGAR=m
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=y
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=m
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
# CONFIG_HID_VIVALDI is not set
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
CONFIG_HID_WALTOP=m
CONFIG_HID_VIEWSONIC=y
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=m
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=m
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
CONFIG_HID_SAITEK=y
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
# CONFIG_GREENASIA_FF is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=m
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
# CONFIG_USB_HID is not set
# CONFIG_HID_PID is not set
# end of USB HID support

CONFIG_I2C_HID=y
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set
# CONFIG_I2C_HID_OF_ELAN is not set
# CONFIG_I2C_HID_OF_GOODIX is not set

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=m
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
CONFIG_USB_OTG_PRODUCTLIST=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
# CONFIG_USB_EHCI_HCD is not set
# CONFIG_USB_OXU210HP_HCD is not set
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_MAX3421_HCD=m
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_OHCI_HCD_PCI=m
CONFIG_USB_OHCI_HCD_SSB=y
CONFIG_USB_OHCI_HCD_PLATFORM=m
CONFIG_USB_UHCI_HCD=m
CONFIG_USB_U132_HCD=m
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_SSB=m
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=m
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
# CONFIG_USB_DWC2_DUAL_ROLE is not set
CONFIG_USB_DWC2_PCI=m
# CONFIG_USB_DWC2_DEBUG is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_PCI=m
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_IMX=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_CHIPIDEA_TEGRA=y
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=m
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=m
CONFIG_USB_SERIAL_AIRCABLE=m
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=m
CONFIG_USB_SERIAL_IPAQ=m
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
CONFIG_USB_SERIAL_EDGEPORT_TI=m
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=m
# CONFIG_USB_SERIAL_GARMIN is not set
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
CONFIG_USB_SERIAL_MCT_U232=m
CONFIG_USB_SERIAL_METRO=m
CONFIG_USB_SERIAL_MOS7720=m
# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
CONFIG_USB_SERIAL_MOS7840=m
CONFIG_USB_SERIAL_MXUPORT=m
CONFIG_USB_SERIAL_NAVMAN=m
CONFIG_USB_SERIAL_PL2303=m
# CONFIG_USB_SERIAL_OTI6858 is not set
CONFIG_USB_SERIAL_QCAUX=m
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
CONFIG_USB_SERIAL_SAFE=m
# CONFIG_USB_SERIAL_SAFE_PADDED is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=m
CONFIG_USB_SERIAL_WWAN=m
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
CONFIG_USB_SERIAL_OPTICON=m
CONFIG_USB_SERIAL_XSENS_MT=m
CONFIG_USB_SERIAL_WISHBONE=m
CONFIG_USB_SERIAL_SSU100=m
CONFIG_USB_SERIAL_QT2=m
CONFIG_USB_SERIAL_UPD78F0730=m
# CONFIG_USB_SERIAL_XR is not set
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=m
CONFIG_USB_CYPRESS_CY7C63=m
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=m
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_LD=m
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=m
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=m
# CONFIG_USB_ONBOARD_HUB is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=m
CONFIG_USB_GPIO_VBUS=m
CONFIG_USB_ISP1301=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
CONFIG_USB_GADGET_DEBUG_FILES=y
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
# CONFIG_USB_GR_UDC is not set
CONFIG_USB_R8A66597=m
CONFIG_USB_PXA27X=m
CONFIG_USB_MV_UDC=y
# CONFIG_USB_MV_U3D is not set
CONFIG_USB_SNP_CORE=y
CONFIG_USB_SNP_UDC_PLAT=y
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=y
# CONFIG_USB_AMD5536UDC is not set
CONFIG_USB_NET2272=m
# CONFIG_USB_NET2272_DMA is not set
CONFIG_USB_NET2280=m
CONFIG_USB_GOKU=y
# CONFIG_USB_EG20T is not set
# CONFIG_USB_GADGET_XILINX is not set
CONFIG_USB_MAX3420_UDC=y
CONFIG_USB_DUMMY_HCD=m
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=m
CONFIG_USB_F_SERIAL=m
CONFIG_USB_F_OBEX=m
CONFIG_USB_F_ECM=m
CONFIG_USB_F_RNDIS=m
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_FS=m
CONFIG_USB_F_TCM=y
# CONFIG_USB_CONFIGFS is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
# CONFIG_USB_ETH is not set
# CONFIG_USB_G_NCM is not set
CONFIG_USB_GADGETFS=y
CONFIG_USB_FUNCTIONFS=m
# CONFIG_USB_FUNCTIONFS_ETH is not set
CONFIG_USB_FUNCTIONFS_RNDIS=y
# CONFIG_USB_FUNCTIONFS_GENERIC is not set
# CONFIG_USB_MASS_STORAGE is not set
CONFIG_USB_GADGET_TARGET=y
CONFIG_USB_G_SERIAL=m
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
CONFIG_USB_G_ACM_MS=y
CONFIG_USB_G_MULTI=m
# CONFIG_USB_G_MULTI_RNDIS is not set
CONFIG_USB_G_MULTI_CDC=y
# CONFIG_USB_G_HID is not set
CONFIG_USB_G_DBGP=y
CONFIG_USB_G_DBGP_PRINTK=y
# CONFIG_USB_G_DBGP_SERIAL is not set
# CONFIG_USB_G_WEBCAM is not set
# CONFIG_USB_RAW_GADGET is not set
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
# CONFIG_USB_ROLES_INTEL_XHCI is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
# CONFIG_MSPRO_BLOCK is not set
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_MEMSTICK_REALTEK_USB=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_AN30259A=y
CONFIG_LEDS_APU=m
CONFIG_LEDS_AW2013=m
CONFIG_LEDS_BCM6328=m
# CONFIG_LEDS_BCM6358 is not set
CONFIG_LEDS_CR0014114=y
CONFIG_LEDS_EL15203000=m
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=m
CONFIG_LEDS_MT6323=m
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=m
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=m
CONFIG_LEDS_LP55XX_COMMON=y
# CONFIG_LEDS_LP5521 is not set
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8788 is not set
CONFIG_LEDS_LP8860=m
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM831X_STATUS=m
# CONFIG_LEDS_DA903X is not set
CONFIG_LEDS_DA9052=m
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_REGULATOR=m
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_INTEL_SS4200 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_MC13783=y
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX8997=m
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_MENF21BMC is not set
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_SPI_BYTE is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_KTD2692 is not set
CONFIG_LEDS_LM3601X=m
# CONFIG_LEDS_MT6360 is not set
# CONFIG_LEDS_RT4505 is not set
# CONFIG_LEDS_RT8515 is not set
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
# CONFIG_INFINIBAND_ON_DEMAND_PAGING is not set
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
CONFIG_INFINIBAND_BNXT_RE=m
CONFIG_INFINIBAND_EFA=m
# CONFIG_INFINIBAND_ERDMA is not set
# CONFIG_INFINIBAND_HFI1 is not set
CONFIG_MLX4_INFINIBAND=m
# CONFIG_MLX5_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
CONFIG_INFINIBAND_OCRDMA=m
CONFIG_INFINIBAND_QIB=m
CONFIG_INFINIBAND_RDMAVT=m
# CONFIG_RDMA_RXE is not set
# CONFIG_RDMA_SIW is not set
# CONFIG_INFINIBAND_IPOIB is not set
CONFIG_INFINIBAND_SRPT=m
CONFIG_INFINIBAND_ISERT=m
CONFIG_INFINIBAND_RTRS=m
CONFIG_INFINIBAND_RTRS_CLIENT=m
CONFIG_INFINIBAND_RTRS_SERVER=m
# CONFIG_INFINIBAND_OPA_VNIC is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=m
# CONFIG_EDAC_LEGACY_SYSFS is not set
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_E752X=m
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
CONFIG_EDAC_IE31200=m
# CONFIG_EDAC_X38 is not set
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_DEBUG=y
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
# CONFIG_RTC_INTF_PROC is not set
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=m
CONFIG_RTC_DRV_88PM80X=m
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=m
CONFIG_RTC_DRV_AS3722=m
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
# CONFIG_RTC_DRV_DS1374 is not set
CONFIG_RTC_DRV_DS1672=y
# CONFIG_RTC_DRV_HYM8563 is not set
CONFIG_RTC_DRV_LP8788=y
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_MAX8925 is not set
# CONFIG_RTC_DRV_MAX8998 is not set
CONFIG_RTC_DRV_MAX8997=y
CONFIG_RTC_DRV_MAX77686=m
# CONFIG_RTC_DRV_NCT3018Y is not set
CONFIG_RTC_DRV_RK808=m
# CONFIG_RTC_DRV_RS5C372 is not set
CONFIG_RTC_DRV_ISL1208=m
# CONFIG_RTC_DRV_ISL12022 is not set
CONFIG_RTC_DRV_ISL12026=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
CONFIG_RTC_DRV_PCF85063=m
CONFIG_RTC_DRV_PCF85363=m
CONFIG_RTC_DRV_PCF8563=y
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=y
CONFIG_RTC_DRV_TWL4030=m
CONFIG_RTC_DRV_RC5T583=y
CONFIG_RTC_DRV_RC5T619=y
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=y
# CONFIG_RTC_DRV_RX8025 is not set
CONFIG_RTC_DRV_EM3027=y
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
CONFIG_RTC_DRV_RV8803=m
CONFIG_RTC_DRV_S5M=m
CONFIG_RTC_DRV_SD3078=m

#
# SPI RTC drivers
#
CONFIG_RTC_DRV_M41T93=y
CONFIG_RTC_DRV_M41T94=y
CONFIG_RTC_DRV_DS1302=m
# CONFIG_RTC_DRV_DS1305 is not set
CONFIG_RTC_DRV_DS1343=y
CONFIG_RTC_DRV_DS1347=y
CONFIG_RTC_DRV_DS1390=m
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=y
CONFIG_RTC_DRV_RS5C348=m
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
CONFIG_RTC_DRV_MCP795=y
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=y
CONFIG_RTC_DRV_RV3029_HWMON=y
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=m
CONFIG_RTC_DRV_DS1685_FAMILY=m
# CONFIG_RTC_DRV_DS1685 is not set
CONFIG_RTC_DRV_DS1689=y
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=y
CONFIG_RTC_DRV_DS2404=y
CONFIG_RTC_DRV_DA9052=y
# CONFIG_RTC_DRV_DA9063 is not set
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=m
CONFIG_RTC_DRV_M48T35=m
# CONFIG_RTC_DRV_M48T59 is not set
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
# CONFIG_RTC_DRV_RP5C01 is not set
CONFIG_RTC_DRV_WM831X=m
CONFIG_RTC_DRV_PCF50633=m
# CONFIG_RTC_DRV_ZYNQMP is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_CADENCE=y
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_PCAP is not set
CONFIG_RTC_DRV_MC13XXX=m
# CONFIG_RTC_DRV_MT6397 is not set
CONFIG_RTC_DRV_R7301=m

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=m
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_LINEDISP=m
# CONFIG_HD44780 is not set
# CONFIG_KS0108 is not set
CONFIG_IMG_ASCII_LCD=m
# CONFIG_LCD2S is not set
# CONFIG_PARPORT_PANEL is not set
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
# CONFIG_PANEL is not set
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
# CONFIG_UIO_PDRV_GENIRQ is not set
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=y
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
CONFIG_UIO_NETX=y
CONFIG_UIO_PRUSS=y
CONFIG_UIO_MF624=y
CONFIG_VFIO=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=y
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
# CONFIG_MLX5_VFIO_PCI is not set
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VDPA=m
# CONFIG_VDPA_USER is not set
# CONFIG_IFCVF is not set
CONFIG_MLX5_VDPA=y
CONFIG_MLX5_VDPA_NET=m
# CONFIG_MLX5_VDPA_STEERING_DEBUG is not set
# CONFIG_VP_VDPA is not set
# CONFIG_ALIBABA_ENI_VDPA is not set
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=m
CONFIG_VHOST=y
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_SCSI=y
# CONFIG_VHOST_VDPA is not set
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
# CONFIG_GREYBUS_ES2 is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH_PIPE is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_ACPI is not set
CONFIG_CHROMEOS_LAPTOP=m
# CONFIG_CHROMEOS_PSTORE is not set
# CONFIG_CHROMEOS_TBMC is not set
# CONFIG_CROS_EC is not set
# CONFIG_CROS_KBD_LED_BACKLIGHT is not set
# CONFIG_CROS_HPS_I2C is not set
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_MLXREG_HOTPLUG is not set
# CONFIG_MLXREG_IO is not set
# CONFIG_MLXREG_LC is not set
# CONFIG_NVSW_SN2201 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACPI_WMI is not set
# CONFIG_ACERHDF is not set
# CONFIG_ACER_WIRELESS is not set
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
# CONFIG_AMD_HSMP is not set
# CONFIG_ADV_SWBUTTON is not set
# CONFIG_APPLE_GMUX is not set
# CONFIG_ASUS_LAPTOP is not set
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
# CONFIG_EEEPC_LAPTOP is not set
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
# CONFIG_AMILO_RFKILL is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_IBM_RTL=y
# CONFIG_IDEAPAD_LAPTOP is not set
CONFIG_SENSORS_HDAPS=y
# CONFIG_INTEL_ATOMISP2_LED is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
# CONFIG_INTEL_SKL_INT3472 is not set
CONFIG_INTEL_PMC_CORE=y

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

#
# Intel Uncore Frequency Control
#
CONFIG_INTEL_UNCORE_FREQ_CONTROL=y
# end of Intel Uncore Frequency Control

# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_VBTN is not set
# CONFIG_INTEL_INT0002_VGPIO is not set
# CONFIG_INTEL_OAKTRAIL is not set
# CONFIG_INTEL_ISHTP_ECLITE is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_VSEC is not set
# CONFIG_MSI_LAPTOP is not set
CONFIG_PCENGINES_APU2=m
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_COMPAL_LAPTOP is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_SONY_LAPTOP is not set
# CONFIG_SYSTEM76_ACPI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
CONFIG_INTEL_SCU_PCI=y
# CONFIG_INTEL_SCU_PLATFORM is not set
CONFIG_INTEL_SCU_WDT=y
CONFIG_INTEL_SCU_IPC_UTIL=m
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=m
# CONFIG_LMK04832 is not set
CONFIG_COMMON_CLK_MAX77686=m
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_RK808=m
CONFIG_COMMON_CLK_SI5341=m
CONFIG_COMMON_CLK_SI5351=y
# CONFIG_COMMON_CLK_SI514 is not set
CONFIG_COMMON_CLK_SI544=m
CONFIG_COMMON_CLK_SI570=m
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_CDCE925=y
CONFIG_COMMON_CLK_CS2000_CP=m
# CONFIG_COMMON_CLK_S2MPS11 is not set
# CONFIG_CLK_TWL6040 is not set
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_COMMON_CLK_LOCHNAGAR is not set
# CONFIG_COMMON_CLK_RS9_PCIE is not set
CONFIG_COMMON_CLK_VC5=m
# CONFIG_COMMON_CLK_VC7 is not set
CONFIG_COMMON_CLK_FIXED_MMIO=y
CONFIG_CLK_LGM_CGU=y
CONFIG_XILINX_VCU=y
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
CONFIG_DW_APB_TIMER=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PLATFORM_MHU=m
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=m
# CONFIG_MAILBOX_TEST is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

CONFIG_IOMMU_DEBUGFS=y
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
CONFIG_OF_IOMMU=y
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
# CONFIG_INTEL_IOMMU is not set
# CONFIG_IOMMUFD is not set
# CONFIG_IRQ_REMAP is not set
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_INTEL_INT3496 is not set
# CONFIG_EXTCON_MAX14577 is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=y
# CONFIG_EXTCON_USB_GPIO is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_AL_FIC=y
CONFIG_MADERA_IRQ=y
# CONFIG_XILINX_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=m
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_INTEL_GW=y
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_TI_TPS380X is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_USB_LGM_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=m
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=m
CONFIG_PHY_CADENCE_DPHY=m
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=m
CONFIG_PHY_PXA_28NM_HSIC=m
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_LAN966X_SERDES is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
CONFIG_PHY_OCELOT_SERDES=m
CONFIG_PHY_QCOM_USB_HS=m
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_SAMSUNG_USB2=m
CONFIG_PHY_TUSB1210=y
# CONFIG_PHY_INTEL_LGM_COMBO is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_INTEL_RAPL is not set
CONFIG_IDLE_INJECT=y
# CONFIG_DTPM is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_RAS_CEC=y
# CONFIG_RAS_CEC_DEBUG is not set
CONFIG_USB4=y
CONFIG_USB4_DEBUGFS_WRITE=y
# CONFIG_USB4_DEBUGFS_MARGINING is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=y
CONFIG_BLK_DEV_PMEM=m
# CONFIG_BTT is not set
CONFIG_OF_PMEM=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set
# CONFIG_NVMEM_U_BOOT_ENV is not set

#
# HW tracing support
#
# CONFIG_STM is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_FSI=y
# CONFIG_FSI_NEW_DEV_NODE is not set
CONFIG_FSI_MASTER_GPIO=y
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_SCOM=y
CONFIG_FSI_SBEFIFO=m
CONFIG_FSI_OCC=m
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_ADGS1408=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=m
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=m
CONFIG_SLIM_QCOM_CTRL=m
CONFIG_INTERCONNECT=y
# CONFIG_COUNTER is not set
CONFIG_MOST=m
# CONFIG_MOST_USB_HDM is not set
CONFIG_MOST_CDEV=m
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=m
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
CONFIG_REISERFS_FS=m
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
# CONFIG_REISERFS_FS_SECURITY is not set
CONFIG_JFS_FS=m
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
CONFIG_JFS_DEBUG=y
# CONFIG_JFS_STATISTICS is not set
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=m
# CONFIG_F2FS_STAT_FS is not set
# CONFIG_F2FS_FS_XATTR is not set
CONFIG_F2FS_CHECK_FS=y
CONFIG_F2FS_FAULT_INJECTION=y
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
CONFIG_ZONEFS_FS=m
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
# CONFIG_PRINT_QUOTA_WARNING is not set
CONFIG_QUOTA_DEBUG=y
CONFIG_QFMT_V1=m
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
# CONFIG_CUSE is not set
CONFIG_VIRTIO_FS=m
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
# CONFIG_NETFS_STATS is not set
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_CACHEFILES is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_VMCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=m
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
# CONFIG_NFS_DISABLE_UDP_SUPPORT is not set
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
# CONFIG_SUNRPC_DEBUG is not set
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=y
CONFIG_CEPH_FSCACHE=y
# CONFIG_CEPH_FS_POSIX_ACL is not set
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
CONFIG_AFS_FS=m
# CONFIG_AFS_DEBUG is not set
CONFIG_AFS_FSCACHE=y
CONFIG_AFS_DEBUG_CURSOR=y
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=m
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=m
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=m
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
CONFIG_DLM_DEBUG=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=m
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_INFINIBAND is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
# CONFIG_CRYPTO_CRC64_ROCKSOFT is not set
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=m
CONFIG_CRYPTO_ZSTD=m
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=m
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_CURVE25519_X86=m
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
CONFIG_CRYPTO_DES3_EDE_X86_64=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=m
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
CONFIG_CRYPTO_BLAKE2S_X86=y
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=m
# CONFIG_CRYPTO_SHA256_SSSE3 is not set
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y
CONFIG_CRYPTO_CRC32C_INTEL=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_RESTRICTED_POOL is not set
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_LRU_CACHE=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_OBJTOOL=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_NMI_CHECK_CPU is not set
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
# CONFIG_FUNCTION_PROFILER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
CONFIG_MMIOTRACE=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
# CONFIG_BRANCH_TRACER is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_MMIOTRACE_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
CONFIG_PUNIT_ATOM_DEBUG=y
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--Sp2+hUHD8ZEZgQ8R
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='linux-devel/devel-hourly-20230406-090450'
	export commit='5fd403eb6c181c63a3aacd55d92b80256a0670cf'
	export kconfig='x86_64-randconfig-a013-20220228'
	export nr_vm=300
	export submit_id='64310167930776708013e845'
	export job_file='/lkp/jobs/scheduled/vm-meta-85/boot-1-openwrt-i386-generic-20190428.cgz-5fd403eb6c181c63a3aacd55d92b80256a0670cf-20230408-28800-1chdqee-1.yaml'
	export id='c6568f87de4b461b0f5c57e7c4452ea0b6cf59a1'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='openwrt-i386-generic-20190428.cgz'
	export compiler='gcc-11'
	export enqueue_time='2023-04-08 13:53:43 +0800'
	export _id='6431084a930776708013e846'
	export _rt='/result/boot/1/vm-snb/openwrt-i386-generic-20190428.cgz/x86_64-randconfig-a013-20220228/gcc-11/5fd403eb6c181c63a3aacd55d92b80256a0670cf'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/openwrt-i386-generic-20190428.cgz/x86_64-randconfig-a013-20220228/gcc-11/5fd403eb6c181c63a3aacd55d92b80256a0670cf/0'
	export scheduler_version='/lkp/lkp/.src-20230407-184316'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/openwrt/openwrt-i386-generic-20190428.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/openwrt-i386-generic-20190428.cgz/x86_64-randconfig-a013-20220228/gcc-11/5fd403eb6c181c63a3aacd55d92b80256a0670cf/0
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a013-20220228/gcc-11/5fd403eb6c181c63a3aacd55d92b80256a0670cf/vmlinuz-6.3.0-rc5-00001-g5fd403eb6c18
branch=linux-devel/devel-hourly-20230406-090450
job=/lkp/jobs/scheduled/vm-meta-85/boot-1-openwrt-i386-generic-20190428.cgz-5fd403eb6c181c63a3aacd55d92b80256a0670cf-20230408-28800-1chdqee-1.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a013-20220228
commit=5fd403eb6c181c63a3aacd55d92b80256a0670cf
initcall_debug
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-randconfig-a013-20220228/gcc-11/5fd403eb6c181c63a3aacd55d92b80256a0670cf/modules.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export meta_host='vm-meta-85'
	export kernel='/pkg/linux/x86_64-randconfig-a013-20220228/gcc-11/5fd403eb6c181c63a3aacd55d92b80256a0670cf/vmlinuz-6.3.0-rc5-00001-g5fd403eb6c18'
	export dequeue_time='2023-04-08 14:24:26 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-85/boot-1-openwrt-i386-generic-20190428.cgz-5fd403eb6c181c63a3aacd55d92b80256a0670cf-20230408-28800-1chdqee-1.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--Sp2+hUHD8ZEZgQ8R
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--Sp2+hUHD8ZEZgQ8R--
