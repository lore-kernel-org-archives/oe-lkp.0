Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C334811737
	for <oe-lkp@lists.linux.dev>; Mon,  9 Oct 2023 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEDi4Wh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696839896; x=1728375896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UeN0H2stXwfUpNbtMCZCN/ICH3Q3Ma92eFDjrJ8Bwzk=;
  b=fEDi4Wh2S8l71gggc8h77cJ/yqZno0hDVv7TSYEgtcEVreamfNFpHVA1
   ktQ60+2MBJl6twAHxLAZNqj6kmQd1GrbK0MmiZjOwzBcXMAKtjCM25Fcu
   r5xHAf4Zu+XHCRRXYyEKa4PX279X/UG3e9VKsv/iSvl8W+5L8h0b+SyvF
   r/C/8Bixxxe/A/RwJ57gvozzDHPsV9zhkVhUeAIflKqng0EmbVh62sAq2
   Xy0IohBe0FCi3jTd7pqvHHUpOxNKCzM+0qAsMM/tELnRqm98+o3sdWlo+
   OMQPmGJw3ntLewfZX6TQUS6ZShiWAkWUzJ2yNNVX90YK6l6RMqljjzgs8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382971600"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="382971600"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 01:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="729593249"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="729593249"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 01:24:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 01:24:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 01:24:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 01:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9v7XBIxWBqSotmqapSbF/FUX6f4bGygkKZFB3E8rFUkvxSJFrXHuFxtPc+CfCaifQF+k3KET+uwDIsPuYGhheE8r5Jr/NVgn3W9f4HsKKwATZ+rGcr399ezRllECzsvCLnP01pKlMFsDDaHK8NDgLhVWA9XGp2SX9AKya71Y94WS9Z2jErkOMQhZP2922W0GNGYSTFEUPNFtfUd1kgUJMGMLA5V8qWvlcGs23M3Pal1trNsGvz1JCmql8n+KZ8J/ZxoDFfxO9BLjzXqREePca80xcsTJYm62HT4FVhpVAx6BL5ybyVV+FCCwjqYs3/2ecJREIEFCAuUvfS6w38txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8D7kwY63dpHkiLB+5flFGdKnCr5syTJthcdfHVM35E=;
 b=CpRxQPYL09TcohuxSmaUZDXJQzySt2Zyik9iDu+oSPLQOuuQm8+JN8yFkd9fuaG/KGN3zuvM2twItc02LJtygQgZSFJbOGAYNgUtVgzoFt7gTky/1wAai9buw7tU28zGiuNnSdb7W40x99zY/Rr2PjF6/qeaq07mqGnEzU7xp6cDNGW4GymwVZgdsUcMduzAuNKoc5QRflwTmPGEn9OOAw3Hyq5KUNYS2eN42H5fXU/wAa6gw1EUBi/0B5R0Cdql1UbEymsaKiaw/SCWO/T17/c781Pbftw64kJdzNmfKCw6ZpqZoORalU1TlwrdykLscs5hMVCFdnrvyiU2wTRELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 08:24:51 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6838.029; Mon, 9 Oct 2023
 08:24:50 +0000
Date: Mon, 9 Oct 2023 16:24:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:rcu/test] [srcu]  6f1b1c9d95:
 WARNING:at_kernel/rcu/srcutree.c:#srcu_gp_start_if_needed
Message-ID: <202310091634.19a7d9b7-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8ddc94-bfef-4e8f-7c7b-08dbc8a134d0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoIsMkBOP97q1lw2uY1I2EQLBU1tj3GPuWFnXOqn2xxOr0ahiYhOhcNq0/scMFHwcOjYfAAWwLvIz9U1ez5Ky+81PI4NVdow1mDW/KkYl/ljm1WP8y5boGkdl3nCy0H9NuGvV2Y5lmWu8yCCCWVbDScY1AxdeaB+qYf7dVmhF80+A4QVnEqzECgOb9tVX+0dCWqYUY30OvVeqJftwuc4qvKtpq14lx+XnD0Nk4z9f9zxHUEVTolKWwO8TIRc/P6IrjNO4hU1z+nIsVsr4bVZhulfvvYvb8KVk10BRgvm8l0q9KKvkVsQ/N96PzJeRySuU8NLI69EqJtTnWk4CraByWgQVOmzfU9DtZoYj9pQoVhLa8RlkUQqV4651c8mr7eX3SuzBm+DPYLq7wdkGB4BcCdSKw5ELArEhXOhe6qbJ2AQNp5S4i1yQ2vKkVW/n5+3EmO5bkqzJPpbFj6VqAZjRBg6BkSJiBx2PbldrQvT/OYafoFq9R4GENngzBJVkjqY9+tPufG2Egnw3POZkEgaeECPpc4BptKu9+ykp7+yjFW80xrjeb/Ceo0A79hdNy/vLs1W5bP8pv+G6TaURwm5RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(82960400001)(86362001)(36756003)(2906002)(6512007)(478600001)(6486002)(966005)(45080400002)(41300700001)(8936002)(5660300002)(4326008)(8676002)(6666004)(6506007)(83380400001)(1076003)(2616005)(107886003)(66556008)(66476007)(316002)(66946007)(6916009)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6n0ppe5agQg2iF2RKh5+4tJj7djNXGIW5cBcSjP9yoQ/9g60yMQqckgYVmfM?=
 =?us-ascii?Q?uDhMimZSqwRzYsnXMnYI5XB1kdqrtBnmUI8QyVy+u9bZbyLuh0o+dZ80qg66?=
 =?us-ascii?Q?edWeoW0BT6jspPEy5kToL6rye7CL+l7rIhIyM9DVtYpLz/cKketMXM3jxGfM?=
 =?us-ascii?Q?J8yAG4qJfk2Xc6O2qDb+s3bw1vBohqiIlcviV4DPEoahOsJcw9x//kRzS93k?=
 =?us-ascii?Q?O5cG8mLsjzlzISrMSyG37+GN1mqF7EI9VqKwYXW4loUqWslyeVEZOguj9hXX?=
 =?us-ascii?Q?8eI49B4Ej1htdnTV/IYrneKPZPC3i4vpFh31D0OZj/AX03KgQVrXcNGzW9gL?=
 =?us-ascii?Q?vDbf6pfiBC34exrwUO8rcMcg38uzXr+pISTT+eiFgMH/cZkrasLtgl0pcBrx?=
 =?us-ascii?Q?OEIwdHlVi8eOFOZGNZn7ApBNXufLTg1wUWXRHUZ9Zr2fpsnS+mJ9r0h/3c8Y?=
 =?us-ascii?Q?BOQ5fRDAXovFdMf2aNVHp51mNcdo/yj9eAbSNvQNsOZGwDS/usAuW/w/AEB0?=
 =?us-ascii?Q?cJGIImolEgh39GGc5Di+2FZCEwDOCkIwa5+4Hdys7gk0Huc1NsPzhlWM87om?=
 =?us-ascii?Q?r7OOaUgUezBzP5Ed7Zq/HAE2YafrJreH2iFmu5/kZwtQ2EyC10KSvlwAD8dX?=
 =?us-ascii?Q?1ug33KFN9FFmHJnc0hNyfDLvF0NDR6h6ALZIBNBpqCFQJ++/+kHGIJEE59GB?=
 =?us-ascii?Q?wbOUk7P7ZTs2Buz1WBwgSBjOGUUGMJpz7L5EBIPDgZYnzX7xxxHHEL2WPg30?=
 =?us-ascii?Q?+kFgHe0+Oy+AtIf2YCS2IBJEJYWdoZafT1cPp6YQYlyarR9j5sC+FI9yfygH?=
 =?us-ascii?Q?5mnbxQSFhke1BPbmDm6UNDix2emgr0bRtFyzwyVc7Fe17yBkDmmcTVXY4M3d?=
 =?us-ascii?Q?P3pjH1lLwJIon2oBrKkpZWSZulsF6gkRI6VNxHhk0+YKW+DUDEHOTUjZk4r0?=
 =?us-ascii?Q?e3cYzt2XBNzoUZvBPfXNunYxrZoNzXMhmdjKHhTy5AFDa6VifHski2Ex+xGc?=
 =?us-ascii?Q?n+aujrUojhgMAO587FxuBNZ3xsT0qB0kds0Wn7dptKi4cT3KUssf9joPkZ+Y?=
 =?us-ascii?Q?orl9B2PHiEVkM9FWdTVjGYdLKtjFP21i5nPJfqBD5N4XqDJpUYHkfaqfaA8X?=
 =?us-ascii?Q?Wuq6sj1J1cy0xUqn2M3W+ID8ZpEgTy1wJSKbjvwx6MV8lBtcSKG5OcMIVEFn?=
 =?us-ascii?Q?xAhlug3ff8IawPJmOXbsMK0gakeVyXAfkisDBqrkhj+cRQEjJy2kWwL//YVF?=
 =?us-ascii?Q?wgwyBNVVnlLCfIE4jFgqgCWhsunDodsI0tAJBAfNngL985vNWHfEk32uMPSJ?=
 =?us-ascii?Q?JgC80hqDrpRircbX/iVDI0Qmsz1t4a3FSmWpJs1SFOm1G5AKjAprotltfojU?=
 =?us-ascii?Q?LBZGb+wTEtOZp2zgeuLzvdr00nTZ5DIReuIv6zZWZMzZwWOnlkdap/+G2I2Y?=
 =?us-ascii?Q?puRSGSPmdSW32OGCUA6jP+DKhH/nNF30XHANifrL/Ew6A4+7X+QMiV55NRjz?=
 =?us-ascii?Q?VW/Hw7efgSq7fjPQCnWOBBvglUvIIhYtu7O3IsMZYa3rCKUmC71cHQUPpCEq?=
 =?us-ascii?Q?klzqhfRiRURVtwQ4g9LA7wmOzlddHP1n2Pyer3oI6DHNz+74QpakpUKduqZt?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8ddc94-bfef-4e8f-7c7b-08dbc8a134d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 08:24:50.7797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5yj4oOXZ1lPqcaWdNzmUyPzX/gF36Uunv2Pw1UQGncLGE/yx3ozu1OepZyL+VTfeM0A0vOkueMPf83s6MpSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/srcutree.c:#srcu_gp_start_if_needed" on:

commit: 6f1b1c9d95a2b601f3d9794319870528db3d2f37 ("srcu: Fix callbacks acceleration mishandling")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git rcu/test

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------------+------------+------------+
|                                                           | ee742b92d3 | 6f1b1c9d95 |
+-----------------------------------------------------------+------------+------------+
| WARNING:at_kernel/rcu/srcutree.c:#srcu_gp_start_if_needed | 0          | 24         |
| RIP:srcu_gp_start_if_needed                               | 0          | 24         |
+-----------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310091634.19a7d9b7-oliver.sang@intel.com


[    2.693789][    T1] ------------[ cut here ]------------
[ 2.695075][ T1] WARNING: CPU: 0 PID: 1 at kernel/rcu/srcutree.c:1278 srcu_gp_start_if_needed (kernel/rcu/srcutree.c:1278 (discriminator 1)) 
[    2.696976][    T1] Modules linked in:
[    2.697498][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.6.0-rc1-00071-g6f1b1c9d95a2 #1
[    2.697498][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 2.697498][ T1] RIP: 0010:srcu_gp_start_if_needed (kernel/rcu/srcutree.c:1278 (discriminator 1)) 
[ 2.697498][ T1] Code: 75 39 fb e9 cc fc ff ff 0f b6 4c 24 18 4c 89 e2 4c 89 ee 48 89 df e8 9d f1 ff ff e9 2f ff ff ff 90 0f 0b 90 e9 8b fe ff ff 90 <0f> 0b 90 e9 51 fe ff ff 90 0f 0b 90 e9 5e fe ff ff e8 08 3b a6 02
All code
========
   0:	75 39                	jne    0x3b
   2:	fb                   	sti
   3:	e9 cc fc ff ff       	jmp    0xfffffffffffffcd4
   8:	0f b6 4c 24 18       	movzbl 0x18(%rsp),%ecx
   d:	4c 89 e2             	mov    %r12,%rdx
  10:	4c 89 ee             	mov    %r13,%rsi
  13:	48 89 df             	mov    %rbx,%rdi
  16:	e8 9d f1 ff ff       	call   0xfffffffffffff1b8
  1b:	e9 2f ff ff ff       	jmp    0xffffffffffffff4f
  20:	90                   	nop
  21:	0f 0b                	ud2
  23:	90                   	nop
  24:	e9 8b fe ff ff       	jmp    0xfffffffffffffeb4
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	e9 51 fe ff ff       	jmp    0xfffffffffffffe83
  32:	90                   	nop
  33:	0f 0b                	ud2
  35:	90                   	nop
  36:	e9 5e fe ff ff       	jmp    0xfffffffffffffe99
  3b:	e8 08 3b a6 02       	call   0x2a63b48

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	e9 51 fe ff ff       	jmp    0xfffffffffffffe59
   8:	90                   	nop
   9:	0f 0b                	ud2
   b:	90                   	nop
   c:	e9 5e fe ff ff       	jmp    0xfffffffffffffe6f
  11:	e8 08 3b a6 02       	call   0x2a63b1e
[    2.697498][    T1] RSP: 0000:ffffc9000001fb50 EFLAGS: 00010046
[    2.697498][    T1] RAX: 0000000000000000 RBX: ffffffff85540500 RCX: 0000000000000000
[    2.697498][    T1] RDX: 1ffffffff0aa80da RSI: 0000000000000000 RDI: ffffffff855406d0
[    2.697498][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[    2.697498][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000004
[    2.697498][    T1] R13: ffffffff85540900 R14: ffffffff85540968 R15: ffffffff85540560
[    2.697498][    T1] FS:  0000000000000000(0000) GS:ffffffff850c2000(0000) knlGS:0000000000000000
[    2.697498][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.697498][    T1] CR2: ffff88843ffff000 CR3: 000000000507a000 CR4: 00000000000406f0
[    2.697498][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.697498][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.697498][    T1] Call Trace:
[    2.697498][    T1]  <TASK>
[ 2.697498][ T1] ? __warn (kernel/panic.c:673) 
[ 2.697498][ T1] ? srcu_gp_start_if_needed (kernel/rcu/srcutree.c:1278 (discriminator 1)) 
[ 2.697498][ T1] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 2.697498][ T1] ? handle_bug (arch/x86/kernel/traps.c:237) 
[ 2.697498][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator 1)) 
[ 2.697498][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 2.697498][ T1] ? srcu_gp_start_if_needed (kernel/rcu/srcutree.c:1278 (discriminator 1)) 
[ 2.697498][ T1] tracepoint_remove_func (kernel/tracepoint.c:54 kernel/tracepoint.c:426) 
[ 2.697498][ T1] ? tracing_stop_cmdline_record (kernel/trace/trace_sched_switch.c:119 kernel/trace/trace_sched_switch.c:139) 
[ 2.697498][ T1] ? trace_pid_list_free (kernel/trace/trace_sched_switch.c:27) 
[ 2.697498][ T1] tracepoint_probe_unregister (kernel/tracepoint.c:552) 
[ 2.697498][ T1] ? tracepoint_remove_func (kernel/tracepoint.c:544) 
[ 2.697498][ T1] ? trace_pid_list_free (kernel/trace/trace_sched_switch.c:27) 
[ 2.697498][ T1] tracing_stop_cmdline_record (include/trace/events/sched.h:185 kernel/trace/trace_sched_switch.c:87 kernel/trace/trace_sched_switch.c:128 kernel/trace/trace_sched_switch.c:139) 
[ 2.697498][ T1] function_trace_reset (kernel/trace/trace_functions.c:163) 
[ 2.697498][ T1] trace_selftest_startup_function (kernel/trace/trace_selftest.c:727) 
[ 2.697498][ T1] ? tracer_alloc_buffers+0x5f0/0x5f0 
[ 2.697498][ T1] ? latency_fsnotify (kernel/trace/trace.c:2235) 
[ 2.697498][ T1] run_tracer_selftest (kernel/trace/trace.c:2026) 
[ 2.697498][ T1] init_trace_selftests (kernel/trace/trace.c:2092) 
[ 2.697498][ T1] ? disable_tracing_selftest (kernel/trace/trace.c:2070) 
[ 2.697498][ T1] do_one_initcall (init/main.c:1232) 
[ 2.697498][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1223) 
[ 2.697498][ T1] ? kasan_set_track (mm/kasan/common.c:52) 
[ 2.697498][ T1] ? __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 2.697498][ T1] do_initcalls (init/main.c:1293 init/main.c:1310) 
[ 2.697498][ T1] kernel_init_freeable (init/main.c:1551) 
[ 2.697498][ T1] ? rest_init (init/main.c:1429) 
[ 2.697498][ T1] kernel_init (init/main.c:1439) 
[ 2.697498][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:160 kernel/locking/spinlock.c:202) 
[ 2.697498][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 2.697498][ T1] ? rest_init (init/main.c:1429) 
[ 2.697498][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[    2.697498][    T1]  </TASK>
[    2.697498][    T1] irq event stamp: 5404
[ 2.697498][ T1] hardirqs last enabled at (5403): _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 2.697498][ T1] hardirqs last disabled at (5404): srcu_gp_start_if_needed (kernel/rcu/srcutree.c:373 kernel/rcu/srcutree.c:1244) 
[ 2.697498][ T1] softirqs last enabled at (5072): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:400 kernel/softirq.c:582) 
[ 2.697498][ T1] softirqs last disabled at (5051): irq_exit_rcu (kernel/softirq.c:427 kernel/softirq.c:632 kernel/softirq.c:644) 
[    2.697498][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231009/202310091634.19a7d9b7-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

