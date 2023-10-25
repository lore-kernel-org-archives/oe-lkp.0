Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE512AB50
	for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwWjyM4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698244898; x=1729780898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/NI8n6Tg+5140JvwE2b4d58DjylhSmit1l1A1Oeb+a4=;
  b=QwWjyM4FyQMPU5s2zKlx1TOpOuoH3dwnc6CS8wUK+Xp2rBOBUT2FPx68
   sZDh6jJvTCjSFS2zKfAMcaViiwTW6ynVsLZzdlKtVM4+IE2By9cx3k/wy
   TejyFOSMXuBnEulRho0nDmtEwWBAcxO2or8wc66aQ+6FuMIc/KJmccqCg
   sjVFv3T3PqK0Ycessv2h9EWDnSUAwhckvU/k4IxxwnYlg6gk72gUXKdP1
   PyDe/X9WnaULki46YBUHx0WOZY5XTOchAnwqvD4Rb6EhJTjkjZDW6wMS+
   DHKvrb3EHH5bXUdTzVgwW3wYwEovc+tyWL+7aAWg9T2r1XLFN4zLflmqe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386202271"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="386202271"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 07:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735413538"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="735413538"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2023 07:41:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 07:41:36 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 07:36:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 07:36:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 07:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9ZOUh3ZcfKpIEoUdphHUrrr6qyYNcAPpE/GRuPrdHH6ZJ2Pvv+YkSKz1MDWqckDD8CR2J0VIi1EeSesGhD0b7Cd1HAQAHx8IJp5W+7ulPWha12cVw/fJ6ShFFIjsrJrQoQezpnHiAgc3NN9YWjq6eRLhab+HKdRpXl6wlqvb11xqlv4Xz14leZaAbLh4N244JRQHr8FdNKBPhdhtJhrZPJ6T0Zs5XL0LnCF//9EOp2CCve9Pjq4wsf6ihE9+nDGNA92yn7xrWHGe8KWPO/CMFb2IlX84O3JNkoto68yhzijLrSvgvm6yg2hSDTFqCHovijF48WxxdeBZ7f4p0dadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLwViJxyld5kbiMB2vEqRsH6i/9zakIxB9RDJADfETw=;
 b=mEeo3UVbmFYlVjcBW3+X2qJvmHaaQGD5ScnjR6VntYsE85ocEfdVwkMJ0GGpRcPDRlyqNNszAetU6DCP+lfCet0aRHC3iJYSzuYJwwClnJHpFmBZ56pktMSZ1+brtXRwumP19YakYhnujucvD+kOX/KfNMCtI+3l0DPnetqnraDDgpUsThVZ2X5r0ZdC6jnWnYBKfOiCFl0xqaAbMveSWiDnbKpU50IbF+lSHm7UIr3i8c4pdPfSn5fZO2qI9o7cTZDDhectpSHQ68LmgdjZbx2YtFKZYlRhORvhW7+2ivJhXYalrGE0+NTvkG0ojzjYNyQ19zof69BffF2IyxdBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 14:36:33 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 14:36:32 +0000
Date: Wed, 25 Oct 2023 22:36:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:rcu/dev] [rcu/tasks]  f9a3a161b4:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202310251741.f6261138-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 848e6fa8-31ad-4fea-8db2-08dbd567c892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fgqP3YMonvc+UwdlXvahJSG+96M03ZpGD0lE9FGDvi1BwoR5vZFjsvLE8NoWuTF5MSy5sLTxeiJIfklqwrMT6g48tcW/N3AAlEGoEZSoRgwXT4+B6l80cjjrQ7eeWMe//ifsD94RT38Y2IOQKLoS6Ozb4HEl2FEXAv9kvWjVOzMUHm3B1vFQCds/9Q9m0pltWt6L+yhLNXO8gu4tQWkXG4IL1Vra7kVNZU3zNzmcK5B+Cw1kjcWmXXrsNWwWb211CqFBU6q8zHpWSgb/zcYSxmzFbD8lZg390Sqsek3pi5/DLbq5KccuVWKbJW1txOmJyNveV9mTrQ2nykBQG8A9GuFGuwlth7HUmfSHi4nOnYDJMIUGJ22Qvv49kkLJrFcM+pUCpmvnSekPcB9qhajGgdBqBG8fWIn0Rue72z8A/ok2I+y6sNcqd4sOIjWgmPkTiQuxmJDrhKrY5A2leGvdLC2SJUh7WDy0vZlbbZHG8bRZCVvbcqegwPNf9ULDk3npqHgjUBN+uHtARMYKSwQ7L0Yc9AJZo+ISS5UqlLF+Ag+QLomer5yDt6/JmwpF3yeLqlxHMHfA4x31ZjwnwQ51bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(5660300002)(41300700001)(83380400001)(26005)(82960400001)(38100700002)(4326008)(8676002)(8936002)(2616005)(107886003)(6512007)(66556008)(66476007)(36756003)(316002)(6916009)(66946007)(1076003)(6506007)(6666004)(45080400002)(478600001)(86362001)(966005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BnrGwuwOAMxTrAaZ/lqw6hmE525pzs7jl7Br3jfMjfxIY1r0IGPhiNDhkGj0?=
 =?us-ascii?Q?shUNctnzpmV+a026U9qfeNFb6w3Wq8q56OG/YJR0fSx2ZAkAgP+1rfZCPgc3?=
 =?us-ascii?Q?vYY+jvb8Bx9cG4yeDMoHA+Rd76zZF6r+IGpoXfgFAD9zRjWkb2cpLnRUrHKS?=
 =?us-ascii?Q?na+qRicXeOJJN62Y/AGgNP4VhXlTaPkRy33qS3EP640ySMI5Af+haVKLn8Tm?=
 =?us-ascii?Q?sbup3n2vl2cVfA+Oq/OgSdp5b/acE8pYc+n1IZwjYQKZBWS9XPWGE9DFSBtP?=
 =?us-ascii?Q?B75tdD9P6yscvq4x5nOhvg6diXCwZ55x8PNaE889mk6GYxn+GL3N5e3ov1fC?=
 =?us-ascii?Q?YxbrsUu/M28fdpNA6P/dc0yUk+3Q4Z8MRCTyweaL/I1C9XkNsJE9QdC7NIVX?=
 =?us-ascii?Q?Idi2dfqT4WcRtLsM+E2rL5oRVFE8LXgw2dw9veiT6Ll208uf0zqQhbV1zDzx?=
 =?us-ascii?Q?wWfh1pE557tRVwVXnLJvBMmEdebvuaD5346NV0x9HO8xRIOkOVvhSsBOKJZ7?=
 =?us-ascii?Q?f3hz76Ks+qvj8rKjeEKM+O2NrO8CHp0/jT6mSfqZeBg4Icomg7KfcQw4ONkr?=
 =?us-ascii?Q?FmLxemJHaItfbuO92xQZxIJw5LhnqEZ4j582ViWaQ4bq3TekwPhZDORWXAQw?=
 =?us-ascii?Q?cbBZwIR8InftFJx107T2zjS15AZQPhqglEqnhPtJXwHPdUdsU7A1YwwXDcyE?=
 =?us-ascii?Q?OZV3LF8hplnDiYnKqY9MBeeINOokb5dAPD1jWH03wGlQvXvaKwSNnOgqPpHX?=
 =?us-ascii?Q?ZYY4jTHRGS4LxUdKHJnTFShH3Lwt7N9JJbHo/UqpnsMAozg8A6ClGgzFdTXc?=
 =?us-ascii?Q?vKlgZbbPyGg5Z/cYrnRZr3yd8k+oXthHBjp4UoJiqBljDspHnZ0Vlq1hLZtv?=
 =?us-ascii?Q?DqF/pdUuEOwLX4aHslGt/2e0nNxjeL0cooudmH05BZ9bMwTUkKhLfFf7G4Gq?=
 =?us-ascii?Q?kOXoRdDNn18cuHieHBMxmrnqtLQm21VPUShNRBjU1gK/eOLFoVOTfhHlqXPJ?=
 =?us-ascii?Q?zagPPoMB+sRpq1Ejr/FV0tOSX3o0yHgteyXy/Wz5xqKbheQxGmeDuL+FnxxG?=
 =?us-ascii?Q?Dt4Rtawn/YMw6V9swehJmGzYYWZcoqVEg+5DTPdmspjiq1WTvrumOhv6AI7y?=
 =?us-ascii?Q?FguXD2pQkcGfj+wqEBqhAkRI+xPGvRGBwKh7XzOl6PeCu4BZ5CNVEEiglf0b?=
 =?us-ascii?Q?y2EeNwAMep0oAj56EbO8zl0BPqArDngXv6To+ux9x6Wtb/A15I+9OsPpWK/f?=
 =?us-ascii?Q?MY7Zf1rxvw6iGqa0xsYawQp5zGhwJOQa//fdbkL3cN4reIr6ZO93NOmVgAcw?=
 =?us-ascii?Q?Nwr98YnwB04szLwP0Bfoi4OmDZHXSUz6K7b5WVlluToAYUrkW0VWOFGsvsSi?=
 =?us-ascii?Q?GSWoS2YvsptTHxhHbcNEq+Lc6w0iJr83F28gSKqr7ITV9u+UCcLmLhcL5Jmv?=
 =?us-ascii?Q?FL4a2UX4gDkPxDhbC0Vyi2WmY0fQYgludRf0avlDDpRCFYn7xIGOV09SsiSk?=
 =?us-ascii?Q?mnODXB+1rzTwnmNBytiuyAm0Of4sK4XAu0QB0vCjZRauYDfbZMDljTjHkbaI?=
 =?us-ascii?Q?UldBWFv1yRqiSF9SczazKNKyuuwg8w7ja5VL5aaf156u11Uv+5oUtBnF8+ND?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 848e6fa8-31ad-4fea-8db2-08dbd567c892
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 14:36:32.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjgdrGrwui6L+bNqVLGpqFBofHXavM4PciysTM4u5zyB62FCgBNjBRyLt9l/6elSHuDzwGnuShBaQPULhhwa1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: f9a3a161b4eb14012fe048077374c34046b770a3 ("rcu/tasks: Delay creation of RCU-Tasks gp kthread to real idle code")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git rcu/dev

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------+------------+------------+
|                                                    | 5a1837afae | f9a3a161b4 |
+----------------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address        | 0          | 6          |
| Oops:#[##]                                         | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception           | 0          | 6          |
+----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310251741.f6261138-oliver.sang@intel.com


[    1.092624][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    1.093807][    T1] #PF: supervisor read access in kernel mode
[    1.094772][    T1] #PF: error_code(0x0000) - not-present page
[    1.095097][    T1] *pde = 00000000
[    1.095097][    T1] Oops: 0000 [#1] SMP
[    1.095097][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc1-00110-gf9a3a161b4eb #10
[    1.095097][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    1.095097][    T1] EIP: 0x0
[ 1.095097][ T1] Code: Unable to access opcode bytes at 0xffffffd6.

Code starting with the faulting instruction
===========================================
[    1.095097][    T1] EAX: c1857efc EBX: 00000001 ECX: c18c8000 EDX: cdb2d11f
[    1.095097][    T1] ESI: d01309c0 EDI: 00000000 EBP: c1857f10 ESP: c1857edc
[    1.095097][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010282
[    1.095097][    T1] CR0: 80050033 CR2: ffffffd6 CR3: 10789000 CR4: 000406d0
[    1.095097][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    1.095097][    T1] DR6: fffe0ff0 DR7: 00000400
[    1.095097][    T1] Call Trace:
[ 1.095097][ T1] ? show_regs (kbuild/src/rand-i386/arch/x86/kernel/dumpstack.c:479 kbuild/src/rand-i386/arch/x86/kernel/dumpstack.c:465) 
[ 1.095097][ T1] ? __die (kbuild/src/rand-i386/arch/x86/kernel/dumpstack.c:421 kbuild/src/rand-i386/arch/x86/kernel/dumpstack.c:434) 
[ 1.095097][ T1] ? page_fault_oops (kbuild/src/rand-i386/arch/x86/mm/fault.c:707) 
[ 1.095097][ T1] ? kernelmode_fixup_or_oops+0x80/0xd8 
[ 1.095097][ T1] ? __bad_area_nosemaphore+0x118/0x1f0 
[ 1.095097][ T1] ? __lock_acquire (kbuild/src/rand-i386/kernel/locking/lockdep.c:5136) 
[ 1.095097][ T1] ? bad_area_nosemaphore (kbuild/src/rand-i386/arch/x86/mm/fault.c:867) 
[ 1.095097][ T1] ? do_user_addr_fault (kbuild/src/rand-i386/arch/x86/mm/fault.c:1476) 
[ 1.095097][ T1] ? exc_page_fault (kbuild/src/rand-i386/arch/x86/include/asm/irqflags.h:26 kbuild/src/rand-i386/arch/x86/include/asm/irqflags.h:67 kbuild/src/rand-i386/arch/x86/include/asm/irqflags.h:127 kbuild/src/rand-i386/arch/x86/mm/fault.c:1513 kbuild/src/rand-i386/arch/x86/mm/fault.c:1561) 
[ 1.095097][ T1] ? pvclock_clocksource_read_nowd (kbuild/src/rand-i386/arch/x86/mm/fault.c:1518) 
[ 1.095097][ T1] ? handle_exception (kbuild/src/rand-i386/arch/x86/entry/entry_32.S:1056) 
[ 1.095097][ T1] ? rcu_tasks_one_gp (kbuild/src/rand-i386/kernel/rcu/tasks.h:573) 
[ 1.095097][ T1] ? pvclock_clocksource_read_nowd (kbuild/src/rand-i386/arch/x86/mm/fault.c:1518) 
[ 1.095097][ T1] rcu_tasks_wait_gp (kbuild/src/rand-i386/kernel/rcu/tasks.h:222 kbuild/src/rand-i386/kernel/rcu/tasks.h:756) 
[ 1.095097][ T1] rcu_tasks_one_gp (kbuild/src/rand-i386/kernel/rcu/rcu.h:110 kbuild/src/rand-i386/kernel/rcu/tasks.h:590) 
[ 1.095097][ T1] ? rest_init (kbuild/src/rand-i386/init/main.c:1429) 
[ 1.095097][ T1] synchronize_rcu_tasks_generic (kbuild/src/rand-i386/kernel/rcu/tasks.h:646) 
[ 1.095097][ T1] ? rest_init (kbuild/src/rand-i386/init/main.c:1429) 
[ 1.095097][ T1] ? vprintk_default (kbuild/src/rand-i386/kernel/printk/printk.c:2323) 
[ 1.095097][ T1] ? vprintk (kbuild/src/rand-i386/kernel/printk/printk_safe.c:46) 
[ 1.095097][ T1] ? _printk (kbuild/src/rand-i386/kernel/printk/printk.c:2336) 
[ 1.095097][ T1] rcu_init_tasks_generic (kbuild/src/rand-i386/kernel/rcu/tasks.h:1050 kbuild/src/rand-i386/kernel/rcu/tasks.h:1989 kbuild/src/rand-i386/kernel/rcu/tasks.h:2074) 
[ 1.095097][ T1] kernel_init_freeable (kbuild/src/rand-i386/arch/x86/include/asm/atomic.h:23 kbuild/src/rand-i386/include/linux/atomic/atomic-arch-fallback.h:444 kbuild/src/rand-i386/include/linux/jump_label.h:260 kbuild/src/rand-i386/include/linux/jump_label.h:270 kbuild/src/rand-i386/include/trace/events/initcall.h:10 kbuild/src/rand-i386/init/main.c:1336 kbuild/src/rand-i386/init/main.c:1537) 
[ 1.095097][ T1] kernel_init (kbuild/src/rand-i386/init/main.c:1439) 
[ 1.095097][ T1] ret_from_fork (kbuild/src/rand-i386/arch/x86/kernel/process.c:153) 
[ 1.095097][ T1] ? rest_init (kbuild/src/rand-i386/init/main.c:1429) 
[ 1.095097][ T1] ret_from_fork_asm (kbuild/src/rand-i386/arch/x86/entry/entry_32.S:741) 
[ 1.095097][ T1] entry_INT80_32 (kbuild/src/rand-i386/arch/x86/entry/entry_32.S:947) 
[    1.095097][    T1] Modules linked in:
[    1.095097][    T1] CR2: 0000000000000000
[    1.095097][    T1] ---[ end trace 0000000000000000 ]---
[    1.095097][    T1] EIP: 0x0
[ 1.095097][ T1] Code: Unable to access opcode bytes at 0xffffffd6.

Code starting with the faulting instruction
===========================================


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231025/202310251741.f6261138-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

