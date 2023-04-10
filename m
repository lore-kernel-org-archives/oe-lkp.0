Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEC17D4
	for <oe-lkp@lists.linux.dev>; Mon, 10 Apr 2023 02:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681095211; x=1712631211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDbhf43ZNvAtct5NCZvyW1dNsGXhdBYchJj24KAfzaI=;
  b=ZWB/lDJHfLdyKfTLD2UguIrXFJFlBPkrJd/3ATLpewXmeADeBEvRvp5H
   8GVpjJPJ7ktOz463gU4wHTJhSn0jZjEAafmHythwJuAzMQ7kpnx/+2Ppf
   M/b8cZVMFc/50o7+39TcIYSOpEpoP/O+6Dct7UmYveEs76TL2jqtejlEW
   gNrv94T46fLyLbf90kJgK/A5OhAS/7tEzxnQu5wABJKD9akDQhRYcWDbx
   VAMc9oLrO5IzKIisRbUGS2f/WauZxcBYMHJ2SV6IfxqAV3LgjKCVL4oEF
   AoEtfYb8w5VduDuXEyVZtLpVpwd6L1KFJDLfRQRfHsT1yl5YXgqapQ0RO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="345057382"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="xz'341?yaml'341?scan'341,208,341";a="345057382"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 19:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="638327094"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="xz'341?yaml'341?scan'341,208,341";a="638327094"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 09 Apr 2023 19:53:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 9 Apr 2023 19:53:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 9 Apr 2023 19:53:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 9 Apr 2023 19:53:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 9 Apr 2023 19:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfXg6WvJ/deRNgjohJUQPgiJvCGbGnedSAL0L+f4Nv76C2xdjrFyZTW2PKuVPN1MWW9GN6xyLipP+hfJkpFdEybqEDKthySuEWBoeO6nrRxPbuLYrgxdjIi0eXfO8Ed9As3nBHu70re91DtZulp08Lxnv4vnkr/uZIJ1T7D86coecDjseEpwerczpWdGAd8Dbqst4sfiD7t9H2cI+P0Ee6ASgxcdBqPQ/4UltmC0RrylYDaNYRemQouPhofArqMGVU9yHvshdQTakCsgUXayxQacgcPWHLhQ2WKg5ggaBI9BblgLK/AeU83/dzfdgbhUvrlAFjGfwCuEI3GwKH2XIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PM3aX6OyTd0pfjh2VOmFOU4R9IuJOWQ5iOgGCcur8A=;
 b=AvdRcMKlde7WPXQBv1c0ueEHCaB9jedB93tH2fzoTo0Fv8+SjJ0Pas5q3q8CZoKG7X/ZTf0uUAeQ+8s+PMbIpOsGnNEib4qFj8nHW6LKg/YKx9xMqpJVY0FwVzuS9d10OUochmoRWwPCK2LtwES5vh0RsB8u9NqGpYWd6Ao8bO6V2kug+txIzzMCImTAqEl19+OQYa1L0J30KGjz2vvHGDX1Alkvtk+1/PJnLTWeTw3isfTq9632cuQjItxXbt64Oi/9xScgMgIHl0yJe4oCSp6K+3pDMk4fr5S2jljtWqiLIr6ahkNiOhy9j58eyPN9i8ypFUySEMidBOOeZhskxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Mon, 10 Apr
 2023 02:53:21 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e073:f89a:39f9:bbf]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e073:f89a:39f9:bbf%8]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 02:53:20 +0000
Date: Mon, 10 Apr 2023 10:53:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jeff Layton
	<jlayton@kernel.org>, <linux-mm@kvack.org>
Subject: [jlayton:tmpfs] [shmem]  1dbf9cad31: WARNING:inconsistent_lock_state
Message-ID: <202304101018.4e0ba3fd-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="Hn3OHUiQ1SejRh/K"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 870b2cde-b117-4f99-ea4a-08db396ebde4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYyRz9HBHxTcQPS6RA5qZesBjOuTrr2+wIP5jibEKF8qjNh2JNmfwj541NUWdSXnHSt4ciZiIdKUvUvrQWuyfZ+qTC12ijwQUz5J3vJoEm//bru0IUQflGVHmNHiXmOdW+sSGooe3fkzCzvM52GZF3bgGaMIsLg11n1qVddDSadrFJNJi9Vglx7qBmgTW9PyCTiJPRw6yyHPUyT0gfpa5m0tpP9CpOhZhm2YqEouH+REJvsT8diQc6by+i7G+LJ9lc8xQxttawDeVz3oYvdb9y/CwPdqEmD6pBzJ9fcwTX3c4MFbwBY42w23zQ+D6Ob71KExMz5+QyGNQKtRLoB63dFyAd8WUZBwwldgv6QmiQrlYf9YCnI4gkbyMlGQpLeepEiEk7yY3CJn2Bq8IrLVFAHXrtZ9/nFGQhxV1BBHDv7VYPf+2ZiTwc4XXSOC3+ukvSZDKGznivsFHn0JF14Eg2IThp5yuyxmPo50yVjfXoQ/w4VqrA7+qLs3F4hAQfdWAqzudAnu71SdL4diFw620kR51TyM+3guD+ZX3Bs9zWJJQgUXYSXTB+UZvMiaRU3TauPKIrJfP4fnsqzt+3HjQR4/Ik/kUkgs0otA6iUfwLcF7Pefvv80UEjIMg7viKW07nnLID1wh2wW6Mls7U4TaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199021)(235185007)(5660300002)(86362001)(6506007)(186003)(83380400001)(6512007)(2616005)(6486002)(1076003)(82960400001)(26005)(966005)(38100700002)(21490400003)(44144004)(6666004)(8936002)(41300700001)(4326008)(66946007)(66476007)(8676002)(66556008)(478600001)(316002)(6916009)(36756003)(2906002)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rv9k+NDUmWTvny33L852yExkNdRIy7lZ0OsNLbL8dfanP7k9xoRGIq4fVSaR?=
 =?us-ascii?Q?/xMYCtnrdnBSLMTGtrj71WqoeaaeFp7ECyGoME30xwoFJRZ0snc2X++s5/3O?=
 =?us-ascii?Q?rcYif7tRWmLP1NwTBotvABKxFX5tqWwlzcxi3ym8DXKTL7J8pe3xEMssfUP1?=
 =?us-ascii?Q?aN11TEvv6aqZj4RGIUrp/NWIz4pGpnMSK/E7ulzPzo7iCe/ZWwpvu2BgERBl?=
 =?us-ascii?Q?EVVvdy7JyFVumPh6TPT1RvcwvdNYw4rQ/PWLqcmawBbSeV+7F8pveSoS8NWc?=
 =?us-ascii?Q?pi/5A51N81ReDpvdO/8NkgWNKHVEzn7a6wQA9VqVk9zbzfbN/RuiXVachr8f?=
 =?us-ascii?Q?tQyD3lYYTuuFiLOvzGP1JezdoRPXk0gHQv37p02ZS8ivo47NDudUlvSA/gYL?=
 =?us-ascii?Q?I3k3sw9qSEXoIHFMhuWl0QEmUvBUf1SIbGMvfSiLsAt213sxp0EUgZnLc528?=
 =?us-ascii?Q?Nco2r1M0gDYKZmsdT+jcyzAbFOOZzuViTZnGybRjuWzhTVbeXvmErfETn5HQ?=
 =?us-ascii?Q?TL7MCJB+VZm2cY4X2OGdLkap31M+RNqXLw4nKs/gadzUjxnQ3fBD0NNzRgQO?=
 =?us-ascii?Q?qy0ANIZ3rDWGVf4yHvFZkiTppZRR445tnqy1niF451H7U7TWSOelUa1cXkQn?=
 =?us-ascii?Q?z4uVtiamEVmd2HRhDeeqtyM+1K4c9zQrqvsZBIa/aFVIPMgEaxR9MH4Px5nw?=
 =?us-ascii?Q?ExnG+ZUoHonbn9H58fd3oDc6sjAWn2QvuDLIp6hCWlVKW+dQVkHnPZl9wOt8?=
 =?us-ascii?Q?y8qeNxpGqHEcRYPau/4w7alWmUSPgC7k0c/yefEYwmyw6kgQoEL0+iMx7fYN?=
 =?us-ascii?Q?oxKWotQTDzzpy3WBoeOIII1vG080qoXG4QIfv9LBpciO6C0KtY4+cYarz8np?=
 =?us-ascii?Q?VGvcKtIHm37FIyKvZOudZy7KxRUa/jg4AxfOPJlT1RJsdYNp7XEvae8qztdh?=
 =?us-ascii?Q?fXD6Uo+GP+LhC5NfaWVNvCo563X/wECPSIxePNFA13w90gVaVQ39WGFdKWCE?=
 =?us-ascii?Q?Hq2KtKTuKGfwZnHXLzxx3Yuxb/ZO0AeaEeOg1yFNEQS6Ay03a42AZf7hvgsd?=
 =?us-ascii?Q?naeb7bLLAI6Xkz5ztLGm4ifbKgdgmxAqm90R6ZBJ/tcsPrvFc7eUkRJ1C5iO?=
 =?us-ascii?Q?aURgvq3i4VqqD2WFOkUF9auQCYibeXYrLZboHrds5cDXNDito2PyAnU0AkVQ?=
 =?us-ascii?Q?aFeBfwCkIi0r2hVoBCLg2rvPR73UGevoV/cQTG18+xTf0CLwyEgaXouVCtM+?=
 =?us-ascii?Q?cSrf5QLP2jq/AtC0SB8Zs+WCAp0qlO7/IqSdAjzBt86xrT4gUjOHbpBrhDLS?=
 =?us-ascii?Q?+rZxaMrFGSqEmDpE2AbgGBOrGrsAV6sw9QaXZwfj7k9hw2I7fcFgqG7Ramd4?=
 =?us-ascii?Q?SfM9tijut7NH5519vzJkGqeH+DFKmy8+zKzboByuGqMzkOFCtKp2/kJOZnOv?=
 =?us-ascii?Q?oKIjOTA03xdOgRVVMGxI1rDIwbfIgbGLwawY/rk/Rq574XnDOvIleVYHY/e8?=
 =?us-ascii?Q?bQEBEhJbwqGGF2mjR6ckMqxzKh+Nw7mHiwPBPsi4djrCxDe4TkcPGZbjKazW?=
 =?us-ascii?Q?l6zdBPd/fIVOyLrGc/hsn79HzqfwY+zpJlorMZf3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 870b2cde-b117-4f99-ea4a-08db396ebde4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 02:53:20.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfaJoCFpoiodDBR3TLI9mGIOu/S6xOI/XTSvS5yydeWWjKJ4puII5xFV3DEkw7AeRjWWllz43ONDTWFwa30kfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
X-OriginatorOrg: intel.com

--Hn3OHUiQ1SejRh/K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: 1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61 ("shmem: stable directory cookies")
https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git tmpfs

in testcase: kernel-selftests
version: kernel-selftests-x86_64-60acb023-1_20230329
with following parameters:

	group: sgx

test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
test-url: https://www.kernel.org/doc/Documentation/kselftest.txt


compiler: gcc-11
test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz (Coffee Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202304101018.4e0ba3fd-oliver.sang@intel.com


[   38.672635][    C0] WARNING: inconsistent lock state
[   38.677619][    C0] 6.3.0-rc5-00001-g1dbf9cad3182 #1 Not tainted
[   38.683656][    C0] --------------------------------
[   38.688647][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   38.695368][    C0] systemd/1 [HC0[0]:SC1[1]:HE0:SE0] takes:
[ 38.701058][ C0] ffff888877549bd8 (&xa->xa_lock#3){+.?.}-{2:2}, at: xa_destroy (lib/xarray.c:2214) 
[   38.709532][    C0] {SOFTIRQ-ON-W} state was registered at:
[ 38.715131][ C0] __lock_acquire (kernel/locking/lockdep.c:5010) 
[ 38.719875][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634) 
[ 38.724339][ C0] _raw_spin_lock (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 38.728812][ C0] shmem_doff_add (include/linux/xarray.h:965 mm/shmem.c:2943) 
[ 38.733376][ C0] shmem_mknod (mm/shmem.c:3014) 
[ 38.737676][ C0] vfs_mknod (fs/namei.c:3916) 
[ 38.741885][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228 drivers/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408) 
[ 38.746876][ C0] devtmpfsd (devtmpfs.c:?) 
[ 38.750913][ C0] kthread (kernel/kthread.c:376) 
[ 38.754950][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314) 
[   38.759333][    C0] irq event stamp: 3472493
[ 38.763625][ C0] hardirqs last enabled at (3472492): kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1) mm/kasan/quarantine.c:242 (discriminator 1)) 
[ 38.773551][ C0] hardirqs last disabled at (3472493): _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108 kernel/locking/spinlock.c:162) 
[ 38.783580][ C0] softirqs last enabled at (3471804): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:415 kernel/softirq.c:600) 
[ 38.792916][ C0] softirqs last disabled at (3472447): __irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:650) 
[   38.802453][    C0]
[   38.802453][    C0] other info that might help us debug this:
[   38.810393][    C0]  Possible unsafe locking scenario:
[   38.810393][    C0]
[   38.817760][    C0]        CPU0
[   38.820931][    C0]        ----
[   38.824096][    C0]   lock(&xa->xa_lock#3);
[   38.828306][    C0]   <Interrupt>
[   38.831644][    C0]     lock(&xa->xa_lock#3);
[   38.836027][    C0]
[   38.836027][    C0]  *** DEADLOCK ***
[   38.836027][    C0]
[   38.844049][    C0] 1 lock held by systemd/1:
[ 38.848459][ C0] #0: ffffffff84b2b740 (rcu_callback){....}-{0:0}, at: rcu_do_batch (include/linux/rcupdate.h:327 kernel/rcu/tree.c:2107) 
[   38.857460][    C0]
[   38.857460][    C0] stack backtrace:
[   38.863234][    C0] CPU: 0 PID: 1 Comm: systemd Not tainted 6.3.0-rc5-00001-g1dbf9cad3182 #1
[   38.871704][    C0] Hardware name: Intel Corporation Mehlow UP Server Platform/Moss Beach Server, BIOS CNLSE2R1.R00.X188.B13.1903250419 03/25/2019
[   38.884840][    C0] Call Trace:
[   38.888010][    C0]  <IRQ>
[ 38.890738][ C0] dump_stack_lvl (lib/dump_stack.c:108) 
[ 38.895121][ C0] mark_lock_irq (kernel/locking/lockdep.c:3934 kernel/locking/lockdep.c:3976 kernel/locking/lockdep.c:4179) 
[ 38.899596][ C0] ? print_usage_bug+0x660/0x660 
[ 38.905015][ C0] ? stack_trace_save (kernel/stacktrace.c:123) 
[ 38.909748][ C0] ? filter_irq_stacks (kernel/stacktrace.c:114) 
[ 38.914565][ C0] ? is_bpf_text_address (include/linux/rcupdate.h:332 include/linux/rcupdate.h:806 kernel/bpf/core.c:721) 
[ 38.919648][ C0] ? lock_release (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5691) 
[ 38.924117][ C0] ? save_trace (kernel/locking/lockdep.c:586) 
[ 38.928440][ C0] mark_lock+0x4ce/0xac0 
[ 38.933183][ C0] ? mark_lock_irq (kernel/locking/lockdep.c:4594) 
[ 38.937830][ C0] mark_usage (kernel/locking/lockdep.c:4530) 
[ 38.941956][ C0] __lock_acquire (kernel/locking/lockdep.c:5010) 
[ 38.946603][ C0] ? mark_lock_irq (kernel/locking/lockdep.c:4594) 
[ 38.951247][ C0] ? slab_free_freelist_hook (mm/slub.c:1807) 
[ 38.956668][ C0] ? mark_usage (kernel/locking/lockdep.c:4914) 
[ 38.961057][ C0] ? __irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:650) 
[ 38.965786][ C0] ? irq_exit_rcu (kernel/softirq.c:664) 
[ 38.970086][ C0] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1107 (discriminator 14)) 
[ 38.975775][ C0] ? mark_usage (kernel/locking/lockdep.c:4560) 
[ 38.980160][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634) 
[ 38.984544][ C0] ? xa_destroy (lib/xarray.c:2214) 
[ 38.988843][ C0] ? lock_release (kernel/locking/lockdep.c:5637) 
[ 38.993398][ C0] ? mark_usage (kernel/locking/lockdep.c:4914) 
[ 38.997819][ C0] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
[ 39.002900][ C0] ? xa_destroy (lib/xarray.c:2214) 
[ 39.007192][ C0] xa_destroy (lib/xarray.c:2214) 
[ 39.011312][ C0] ? xas_free_nodes (lib/xarray.c:2208) 
[ 39.016048][ C0] ? lock_release (kernel/locking/lockdep.c:5637) 
[ 39.020607][ C0] ? kmem_cache_free (mm/slub.c:3787 mm/slub.c:3809) 
[ 39.025460][ C0] shmem_free_in_core_inode (mm/shmem.c:2989 mm/shmem.c:4061) 
[ 39.030712][ C0] rcu_do_batch (include/linux/rcupdate.h:332 kernel/rcu/tree.c:2114) 
[ 39.035099][ C0] ? rcu_check_gp_kthread_starvation (kernel/rcu/tree.c:2051) 
[ 39.041300][ C0] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4599 kernel/locking/lockdep.c:4530) 
[ 39.047762][ C0] ? note_gp_changes (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1) kernel/rcu/tree.c:1234 (discriminator 1)) 
[ 39.052579][ C0] rcu_core (kernel/rcu/tree.c:2374) 
[ 39.056616][ C0] __do_softirq (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:572) 
[ 39.060996][ C0] __irq_exit_rcu (kernel/softirq.c:445 kernel/softirq.c:650) 
[ 39.065551][ C0] irq_exit_rcu (kernel/softirq.c:664) 
[ 39.069674][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1107 (discriminator 14)) 
[   39.075188][    C0]  </IRQ>
[   39.078013][    C0]  <TASK>
[ 39.080833][ C0] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:645) 
[ 39.086690][ C0] RIP: 0010:_raw_spin_unlock_irqrestore (kernel/locking/spinlock.c:195) 
[ 39.092983][ C0] Code: 89 f3 48 8b 74 24 10 48 83 c7 18 e8 81 e6 a6 fd 48 89 ef e8 e9 4e a7 fd 80 e7 02 74 06 e8 ef 70 cb fd fb 65 ff 0d 3f b3 75 7c <5b> 5d c3 0f 1f 40 00 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 fd 65 ff
All code
========
   0:	89 f3                	mov    %esi,%ebx
   2:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   7:	48 83 c7 18          	add    $0x18,%rdi
   b:	e8 81 e6 a6 fd       	callq  0xfffffffffda6e691
  10:	48 89 ef             	mov    %rbp,%rdi
  13:	e8 e9 4e a7 fd       	callq  0xfffffffffda74f01
  18:	80 e7 02             	and    $0x2,%bh
  1b:	74 06                	je     0x23
  1d:	e8 ef 70 cb fd       	callq  0xfffffffffdcb7111
  22:	fb                   	sti    
  23:	65 ff 0d 3f b3 75 7c 	decl   %gs:0x7c75b33f(%rip)        # 0x7c75b369
  2a:*	5b                   	pop    %rbx		<-- trapping instruction
  2b:	5d                   	pop    %rbp
  2c:	c3                   	retq   
  2d:	0f 1f 40 00          	nopl   0x0(%rax)
  31:	f3 0f 1e fa          	endbr64 
  35:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  3a:	55                   	push   %rbp
  3b:	48 89 fd             	mov    %rdi,%rbp
  3e:	65                   	gs
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	5b                   	pop    %rbx
   1:	5d                   	pop    %rbp
   2:	c3                   	retq   
   3:	0f 1f 40 00          	nopl   0x0(%rax)
   7:	f3 0f 1e fa          	endbr64 
   b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  10:	55                   	push   %rbp
  11:	48 89 fd             	mov    %rdi,%rbp
  14:	65                   	gs
  15:	ff                   	.byte 0xff


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



--Hn3OHUiQ1SejRh/K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.3.0-rc5-00001-g1dbf9cad3182"

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
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

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
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
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
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
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
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
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
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
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
CONFIG_EXPERT=y
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
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

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
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
CONFIG_INTEL_TDX_GUEST=y
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
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
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
CONFIG_X86_SGX=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_HANDOVER_PROTOCOL=y
CONFIG_EFI_MIXED=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_RETPOLINE is not set
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
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
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
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
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
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
# CONFIG_X86_SGX_KVM is not set
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
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_IMA_KEXEC=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
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
CONFIG_STACKPROTECTOR_STRONG=y
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
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
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
CONFIG_HAVE_ARCH_NODE_DEV_GROUP=y
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
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
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
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB_DEPRECATED is not set
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_MEM_SOFT_DIRTY=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_HMM_MIRROR=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
CONFIG_DAMON_PADDR=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_DBGFS=y
# CONFIG_DAMON_RECLAIM is not set
# CONFIG_DAMON_LRU_SORT is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
# CONFIG_NET_KEY is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_IPV6_IOAM6_LWTUNNEL=y
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=m
CONFIG_MPTCP_IPV6=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CONNTRACK_OVS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_FLOW_OFFLOAD=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
CONFIG_NFT_TPROXY=m
CONFIG_NFT_SYNPROXY=m
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
CONFIG_NF_FLOW_TABLE_INET=m
CONFIG_NF_FLOW_TABLE=m
# CONFIG_NF_FLOW_TABLE_PROCFS is not set
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
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
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
CONFIG_NET_SCH_CBS=m
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_MQPRIO_LIB=m
CONFIG_NET_SCH_TAPRIO=m
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_NETEM=y
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
CONFIG_NET_SCH_SKBPRIO=m
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=m
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
CONFIG_NET_SCH_FQ_PIE=m
CONFIG_NET_SCH_INGRESS=y
CONFIG_NET_SCH_PLUG=m
CONFIG_NET_SCH_ETS=m
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_FQ_PIE is not set
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
CONFIG_NET_EMATCH_CANID=m
CONFIG_NET_EMATCH_IPSET=m
CONFIG_NET_EMATCH_IPT=m
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
CONFIG_NET_ACT_MPLS=m
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
CONFIG_NET_ACT_CONNMARK=m
CONFIG_NET_ACT_CTINFO=m
CONFIG_NET_ACT_SKBMOD=m
CONFIG_NET_ACT_IFE=m
CONFIG_NET_ACT_TUNNEL_KEY=m
CONFIG_NET_ACT_CT=m
CONFIG_NET_ACT_GATE=m
CONFIG_NET_IFE_SKBMARK=m
CONFIG_NET_IFE_SKBPRIO=m
CONFIG_NET_IFE_SKBTCINDEX=m
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
CONFIG_NFC=m
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=m
# CONFIG_NFC_NCI_SPI is not set
# CONFIG_NFC_NCI_UART is not set
# CONFIG_NFC_HCI is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_VIRTUAL_NCI=m
# CONFIG_NFC_FDP is not set
# CONFIG_NFC_PN533_USB is not set
# CONFIG_NFC_PN533_I2C is not set
# CONFIG_NFC_MRVL_USB is not set
# CONFIG_NFC_ST_NCI_I2C is not set
# CONFIG_NFC_ST_NCI_SPI is not set
# CONFIG_NFC_NXP_NCI is not set
# CONFIG_NFC_S3FWRN5_I2C is not set
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=m
CONFIG_NET_IFE=m
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
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
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
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
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION is not set
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
# CONFIG_ZRAM_MULTI_COMP is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_SGI_XP is not set
CONFIG_HP_ILO=m
# CONFIG_SGI_GRU is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_UACCE is not set
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
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set
# CONFIG_PATA_PARPORT is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
CONFIG_DUMMY=m
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
CONFIG_IFB=m
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
CONFIG_BAREUDP=m
# CONFIG_GTP is not set
CONFIG_AMT=m
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
CONFIG_NET_VRF=y
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_NCN26000_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
# CONFIG_WLAN is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_HYPERV_NET=y
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
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
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
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
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
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
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=m
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_ACPI=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=m
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

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
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_AUO_A030JTN01 is not set
# CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_HYPERV is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
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
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
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
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
# CONFIG_UIO is not set
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
# CONFIG_EFI_SECRET is not set
CONFIG_TDX_GUEST_DRIVER=m
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=y
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set
# CONFIG_LTE_GDM724X is not set
# CONFIG_FB_TFT is not set
# CONFIG_KS7010 is not set
# CONFIG_PI433 is not set
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_IOMMU_SVA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
CONFIG_INTEL_IOMMU_SVM=y
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
CONFIG_IOMMUFD=m
CONFIG_IOMMUFD_TEST=y
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

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

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
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
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
# CONFIG_NFSD_V2 is not set
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
CONFIG_SUNRPC_DEBUG=y
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
# CONFIG_IMA_KEXEC is not set
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
CONFIG_IMA_ARCH_POLICY=y
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=y
# CONFIG_IMA_DISABLE_HTABLE is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
CONFIG_GCC_PLUGIN_STACKLEAK=y
# CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE is not set
CONFIG_STACKLEAK_TRACK_MIN_SIZE=100
# CONFIG_STACKLEAK_METRICS is not set
# CONFIG_STACKLEAK_RUNTIME_DISABLE is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
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
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
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
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
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
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
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
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_INTERVAL_TREE_SPAN_ITER=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
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

CONFIG_ASN1_ENCODER=y

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
CONFIG_BOOT_PRINTK_DELAY=y
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
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
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
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
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
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
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
CONFIG_SLUB_DEBUG_ON=y
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
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
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
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

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
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

# CONFIG_DEBUG_TIMEKEEPING is not set

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
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=m
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
CONFIG_DEBUG_PLIST=y
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
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
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
CONFIG_RING_BUFFER_ALLOW_SWAP=y
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
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
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
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
CONFIG_PREEMPTIRQ_DELAY_TEST=m
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
CONFIG_SAMPLE_TRACE_PRINTK=m
CONFIG_SAMPLE_FTRACE_DIRECT=m
# CONFIG_SAMPLE_FTRACE_DIRECT_MULTI is not set
# CONFIG_SAMPLE_FTRACE_OPS is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_LIVEPATCH is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
# CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
# CONFIG_SAMPLE_WATCHDOG is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
# CONFIG_FAIL_MAKE_REQUEST is not set
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
CONFIG_LKDTM=y
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_SCANF=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_SYSCTL=y
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
# CONFIG_TEST_DYNAMIC_DEBUG is not set
CONFIG_TEST_KMOD=m
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_HMM=m
# CONFIG_TEST_FREE_PAGES is not set
CONFIG_TEST_FPU=m
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--Hn3OHUiQ1SejRh/K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='kernel-selftests'
	export testcase='kernel-selftests'
	export category='functional'
	export need_memory='3G'
	export job_origin='kernel-selftests-sgx.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-cfl-e1'
	export tbox_group='lkp-cfl-e1'
	export submit_id='6432333c9e7707061e781635'
	export job_file='/lkp/jobs/scheduled/lkp-cfl-e1/kernel-selftests-sgx-debian-12-x86_64-20220629.cgz-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61-20230409-67102-1oxe677-3.yaml'
	export id='d9d9438864e3aa6ec681635cf29915ea2f1bf834'
	export queuer_version='/zday/lkp'
	export model='Coffee Lake'
	export nr_node=1
	export nr_cpu=16
	export memory='32G'
	export nr_hdd_partitions=1
	export hdd_partitions='/dev/disk/by-id/ata-ST1000DM010-2EP102_W9APNAR5-part2'
	export swap_partitions='LABEL=SWAP'
	export rootfs_partition='/dev/disk/by-id/ata-ST1000DM010-2EP102_W9APNAR5-part1'
	export brand='Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz'
	export commit='1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61'
	export ucode='0xf4'
	export need_kconfig_hw='{"PTP_1588_CLOCK"=>"y"}
{"IGB"=>"y"}
SATA_AHCI'
	export need_kernel_version=
	export need_kconfig='{"BLOCK"=>"y"}
{"BTRFS_FS"=>"m"}
{"EFI"=>"y"}
EFIVAR_FS
{"FTRACE"=>"y"}
{"IP_ADVANCED_ROUTER"=>"y"}
{"IP_MULTIPLE_TABLES"=>"y"}
RC_CORE
{"RC_DECODERS"=>"y"}
{"RC_DEVICES"=>"y"}
{"RC_LOOPBACK"=>"m"}
{"RUNTIME_TESTING_MENU"=>"y"}
{"STAGING"=>"y"}
{"SYNC_FILE"=>"y"}
TEST_FIRMWARE
{"TEST_KMOD"=>"m"}
{"TEST_LKM"=>"m"}
TEST_USER_COPY
{"TUN"=>"m"}
{"XFS_FS"=>"m"}
{"GPIO_CDEV"=>"y"}
OVERLAY_FS
{"PERF_EVENTS"=>"y"}
{"SCHED_DEBUG"=>"y"}
{"SHMEM"=>"y"}
{"TMPFS_XATTR"=>"y"}
{"TMPFS"=>"y"}'
	export rootfs='debian-12-x86_64-20220629.cgz'
	export initrds='linux_headers
linux_selftests'
	export kconfig='x86_64-rhel-8.3-kselftests'
	export enqueue_time='2023-04-09 11:38:36 +0800'
	export _id='6432333c9e7707061e781635'
	export _rt='/result/kernel-selftests/sgx/lkp-cfl-e1/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='b50e7bea4b44ccac189cad24762c338a028c7a93'
	export base_commit='7e364e56293bb98cae1b55fd835f5991c4e96e7d'
	export branch='jlayton/tmpfs'
	export result_root='/result/kernel-selftests/sgx/lkp-cfl-e1/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-12-x86_64-20220629.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/kernel-selftests/sgx/lkp-cfl-e1/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/vmlinuz-6.3.0-rc5-00001-g1dbf9cad3182
branch=jlayton/tmpfs
job=/lkp/jobs/scheduled/lkp-cfl-e1/kernel-selftests-sgx-debian-12-x86_64-20220629.cgz-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61-20230409-67102-1oxe677-3.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-kselftests
commit=1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61
initcall_debug
nmi_watchdog=0
max_uptime=1200
LKP_SERVER=internal-lkp-server
nokaslr
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/modules.cgz'
	export linux_headers_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/linux-headers.cgz'
	export linux_selftests_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/linux-selftests.cgz'
	export bm_initrd='/osimage/deps/debian-12-x86_64-20220629.cgz/run-ipconfig_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/lkp_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/rsync-rootfs_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/kernel-selftests_20230329.cgz,/osimage/pkg/debian-12-x86_64-20220629.cgz/kernel-selftests-x86_64-60acb023-1_20230329.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/hw_20230326.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20230406.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='6.3.0-rc5-wt-ath-10056-g5ad9916e5231'
	export repeat_to=6
	export stop_repeat_if_found='dmesg.WARNING:inconsistent_lock_state'
	export kbuild_queue_analysis=1
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/vmlinuz-6.3.0-rc5-00001-g1dbf9cad3182'
	export dequeue_time='2023-04-09 11:39:34 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-cfl-e1/kernel-selftests-sgx-debian-12-x86_64-20220629.cgz-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61-20230409-67102-1oxe677-3.cgz'

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

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test group='sgx' $LKP_SRC/tests/wrapper kernel-selftests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env group='sgx' $LKP_SRC/stats/wrapper kernel-selftests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time kernel-selftests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--Hn3OHUiQ1SejRh/K
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
2gABse4CzqYTw0T8yLHEZ/sCAAAAAARZWg==

--Hn3OHUiQ1SejRh/K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="kernel-selftests"

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61
2023-04-09 03:41:31 ln -sf /usr/bin/clang
2023-04-09 03:41:31 ln -sf /usr/sbin/iptables-nft /usr/bin/iptables
2023-04-09 03:41:31 ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables
2023-04-09 03:41:31 sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
2023-04-09 03:41:31 make -C sgx
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx'
gcc -Wall -Werror -g -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -fPIC -z noexecstack -c main.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/main.o
gcc -Wall -Werror -g -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -fPIC -z noexecstack -c load.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/load.o
gcc -Wall -Werror -g -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -fPIC -z noexecstack -c sigstruct.c -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/sigstruct.o
gcc -Wall -Werror -g -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -fPIC -z noexecstack -c call.S -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/call.o
gcc -Wall -Werror -g -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -fPIC -z noexecstack -c sign_key.S -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/sign_key.o
gcc -Wall -Werror -g -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -fPIC -z noexecstack -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/test_sgx /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/main.o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/load.o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/sigstruct.o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/call.o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/sign_key.o -lcrypto
gcc -Wall -Werror -static -nostdlib -nostartfiles -fPIC -fno-stack-protector -mrdrnd -I/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/../../../tools/include -T test_encl.lds test_encl.c test_encl_bootstrap.S -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx/test_encl.elf -Wl,--build-id=none
/usr/bin/ld: warning: /tmp/lkp/ccnqxdJu.o: missing .note.GNU-stack section implies executable stack
/usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx'
2023-04-09 03:41:33 make quicktest=1 run_tests -C sgx
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx'
TAP version 13
1..1
# selftests: sgx: test_sgx
# TAP version 13
# 1..16
# # Starting 16 tests from 1 test cases.
# #  RUN           enclave.unclobbered_vdso ...
# #            OK  enclave.unclobbered_vdso
# ok 1 enclave.unclobbered_vdso
# #  RUN           enclave.unclobbered_vdso_oversubscribed ...
# #            OK  enclave.unclobbered_vdso_oversubscribed
# ok 2 enclave.unclobbered_vdso_oversubscribed
# #  RUN           enclave.unclobbered_vdso_oversubscribed_remove ...
# # main.c:402:unclobbered_vdso_oversubscribed_remove:Creating an enclave with 198705152 bytes heap may take a while ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.unclobbered_vdso_oversubscribed_remove
# ok 3 # SKIP System does not support SGX2
# #  RUN           enclave.clobbered_vdso ...
# #            OK  enclave.clobbered_vdso
# ok 4 enclave.clobbered_vdso
# #  RUN           enclave.clobbered_vdso_and_user_function ...
# #            OK  enclave.clobbered_vdso_and_user_function
# ok 5 enclave.clobbered_vdso_and_user_function
# #  RUN           enclave.tcs_entry ...
# #            OK  enclave.tcs_entry
# ok 6 enclave.tcs_entry
# #  RUN           enclave.pte_permissions ...
# #            OK  enclave.pte_permissions
# ok 7 enclave.pte_permissions
# #  RUN           enclave.tcs_permissions ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.tcs_permissions
# ok 8 # SKIP System does not support SGX2
# #  RUN           enclave.epcm_permissions ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.epcm_permissions
# ok 9 # SKIP System does not support SGX2
# #  RUN           enclave.augment ...
# #      SKIP      SGX2 not supported
# #            OK  enclave.augment
# ok 10 # SKIP SGX2 not supported
# #  RUN           enclave.augment_via_eaccept ...
# #      SKIP      SGX2 not supported
# #            OK  enclave.augment_via_eaccept
# ok 11 # SKIP SGX2 not supported
# #  RUN           enclave.tcs_create ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.tcs_create
# ok 12 # SKIP System does not support SGX2
# #  RUN           enclave.remove_added_page_no_eaccept ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.remove_added_page_no_eaccept
# ok 13 # SKIP System does not support SGX2
# #  RUN           enclave.remove_added_page_invalid_access ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.remove_added_page_invalid_access
# ok 14 # SKIP System does not support SGX2
# #  RUN           enclave.remove_added_page_invalid_access_after_eaccept ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.remove_added_page_invalid_access_after_eaccept
# ok 15 # SKIP System does not support SGX2
# #  RUN           enclave.remove_untouched_page ...
# #      SKIP      System does not support SGX2
# #            OK  enclave.remove_untouched_page
# ok 16 # SKIP System does not support SGX2
# # PASSED: 16 / 16 tests passed.
# # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:10 error:0
ok 1 selftests: sgx: test_sgx
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/tools/testing/selftests/sgx'

--Hn3OHUiQ1SejRh/K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/kernel-selftests-sgx.yaml
suite: kernel-selftests
testcase: kernel-selftests
category: functional
need_memory: 3G
kernel-selftests:
  group: sgx
job_origin: kernel-selftests-sgx.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-cfl-e1
tbox_group: lkp-cfl-e1
submit_id: 64320ed4fb733aa8a51cbaa8
job_file: "/lkp/jobs/scheduled/lkp-cfl-e1/kernel-selftests-sgx-debian-12-x86_64-20220629.cgz-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61-20230409-43173-w8en9a-0.yaml"
id: a98c422e4a4f1ccc7137668267f902ba57b6a8de
queuer_version: "/zday/lkp"

#! /db/releases/20230407192341/lkp-src/hosts/lkp-cfl-e1
model: Coffee Lake
nr_node: 1
nr_cpu: 16
memory: 32G
nr_hdd_partitions: 1
hdd_partitions: "/dev/disk/by-id/ata-ST1000DM010-2EP102_W9APNAR5-part2"
swap_partitions: LABEL=SWAP
rootfs_partition: "/dev/disk/by-id/ata-ST1000DM010-2EP102_W9APNAR5-part1"
brand: Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz

#! /db/releases/20230407192341/lkp-src/include/category/functional
kmsg:
heartbeat:
meminfo:

#! /db/releases/20230407192341/lkp-src/include/queue/cyclic
commit: 1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61

#! /db/releases/20230407192341/lkp-src/include/testbox/lkp-cfl-e1
ucode: '0xf4'
need_kconfig_hw:
- PTP_1588_CLOCK: y
- IGB: y
- SATA_AHCI

#! /db/releases/20230407192341/lkp-src/include/kernel-selftests
need_kernel_version:
need_kconfig:
- BLOCK: y
- BTRFS_FS: m
- EFI: y
- EFIVAR_FS
- FTRACE: y
- IP_ADVANCED_ROUTER: y
- IP_MULTIPLE_TABLES: y
- RC_CORE
- RC_DECODERS: y
- RC_DEVICES: y
- RC_LOOPBACK: m
- RUNTIME_TESTING_MENU: y
- STAGING: y
- SYNC_FILE: y
- TEST_FIRMWARE
- TEST_KMOD: m
- TEST_LKM: m
- TEST_USER_COPY
- TUN: m
- XFS_FS: m
- GPIO_CDEV: y
- OVERLAY_FS
- PERF_EVENTS: y
- SCHED_DEBUG: y
- SHMEM: y
- TMPFS_XATTR: y
- TMPFS: y
rootfs: debian-12-x86_64-20220629.cgz
initrds:
- linux_headers
- linux_selftests
kconfig: x86_64-rhel-8.3-kselftests
enqueue_time: 2023-04-09 09:03:17.508772338 +08:00
_id: 64320ed4fb733aa8a51cbaa8
_rt: "/result/kernel-selftests/sgx/lkp-cfl-e1/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: b50e7bea4b44ccac189cad24762c338a028c7a93
base_commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
branch: linux-devel/devel-hourly-20230406-233729
result_root: "/result/kernel-selftests/sgx/lkp-cfl-e1/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/0"
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 1200
initrd: "/osimage/debian/debian-12-x86_64-20220629.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/kernel-selftests/sgx/lkp-cfl-e1/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/vmlinuz-6.3.0-rc5-00001-g1dbf9cad3182
- branch=linux-devel/devel-hourly-20230406-233729
- job=/lkp/jobs/scheduled/lkp-cfl-e1/kernel-selftests-sgx-debian-12-x86_64-20220629.cgz-1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61-20230409-43173-w8en9a-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-kselftests
- commit=1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61
- initcall_debug
- nmi_watchdog=0
- max_uptime=1200
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw

#! runtime status
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/modules.cgz"
linux_headers_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/linux-headers.cgz"
linux_selftests_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/linux-selftests.cgz"
bm_initrd: "/osimage/deps/debian-12-x86_64-20220629.cgz/lkp_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/run-ipconfig_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/rsync-rootfs_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/kernel-selftests_20230329.cgz,/osimage/pkg/debian-12-x86_64-20220629.cgz/kernel-selftests-x86_64-60acb023-1_20230329.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/hw_20230326.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20230406.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /db/releases/20230407192341/lkp-src/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 6.3.0-rc4-01522-g2ac2299c508e
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/1dbf9cad3182c9decb9aba874dfd3f3f7f5dcf61/vmlinuz-6.3.0-rc5-00001-g1dbf9cad3182"
dequeue_time: 2023-04-09 09:26:36.111878468 +08:00
job_state: finished
loadavg: 1.83 0.63 0.22 2/260 2030
start_time: '1681003744'
end_time: '1681003747'
version: "/lkp/lkp/.src-20230407-184353:a4d7aa577a5a:3ae0bb9b9345"

--Hn3OHUiQ1SejRh/K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

ln -sf /usr/bin/clang
ln -sf /usr/sbin/iptables-nft /usr/bin/iptables
ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables
sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
make -C sgx
make quicktest=1 run_tests -C sgx

--Hn3OHUiQ1SejRh/K--
