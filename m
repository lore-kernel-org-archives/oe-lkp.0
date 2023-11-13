Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8799208AE
	for <oe-lkp@lists.linux.dev>; Mon, 13 Nov 2023 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyuwpIRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699889510; x=1731425510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMuxw+SsVXVtINGgT6ZbKgS78j7dkLq01nixbqbLutc=;
  b=AyuwpIRNDXAk0TqYl3jD6KrNiJfvPpyNDYZG0Obg5oT/5BqX8BfVsXOE
   Pi0cefkITkSG0z8Jm5Gw+7xH/pRaPkNmte/yggoUA6lIOHfa89b5cwb4u
   66OlH4WyteI2HmnC5d+TEx+B78jthFKDz3tc0vlWR2noKv1r11qWf4rgB
   49zs2T/HPOGi2s1ndFKxNahqj6gvyRldwDp6JQ60hgLA56QByaNgztbc/
   eqMs8/jEa5oEMW5I754M4FJE89JKw+HNaHrDZM53blYx75zDqsRSfW1IJ
   aE4cIIn1pYUT1mnCqHgUwHeDMWa0FKuJ3Hke6aa6kaOkJUk9wiblFR85/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454746040"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="454746040"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793465010"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793465010"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 07:31:49 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 07:31:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 07:31:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 07:31:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayFVJAntvye/nsNlnulpjRFYijrEI/BoM+NrX5cLYPwMJ3dkRjFoXUkBIRvpjx1jfFUX++Om+OEpHWOEHXyaRMHQIGGYMnbIXe6x+0khFCc7MsczPrPtNZc6mXbhqCS6z0GCDWXXvYKiqh6yxAnfJCDAV4J2kPoO5lNXspjI+/FCvEUGgo7Oq6Ax4qK9K2GtPWY2dcH0BHSv3gOYueYhRfF9PzHweS+mkGIWPrHEuQ9ZN3j+8EL3cUdhET9wCrdBnHioPknnlBviLglcwMPPhE/F0g7zpQ6rpaDwaMStgNwuVvH4dVC3Jzpcz4SULvVTDHQRwGmh0ALUf4nUFpgeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gtGmEy4lGju1B3O8ZhA4tVaCCEevTLIdzTRHeVwytw=;
 b=TQQED+KTC+P+JcS0cMRy/W95gndgfqEc25j7HEmyBJiBf1TA4hF5+soaiPsfJgLYmK+qy0VdphjKVpi1BorkUWf9ZgYEu0yC2lBncGC2UdI1nbb28qqjcwBjtoSoHas3LeUWCHUl5TNoSd77oBsgzrX/VEjNcHWTwQ2tX/fGgrireEQV1OUbuOWN3OEBUWfm8bVHR0U0XTBy3eafNhLQvRpD2Nq/+olinmtQPCwZTqea4bMCGBoF6QUIYAYFTLRd2W8IK69fPq662/3kppf+TWsSlBZPOQAFwNh2/djFBaxeRT1IfQgTL88DYwmS8D/YdOspDOVmdAxhr4cOFg31fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DM4PR11MB5520.namprd11.prod.outlook.com (2603:10b6:5:39f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 15:31:45 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:31:45 +0000
Date: Mon, 13 Nov 2023 23:31:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/eevdf] [sched/rt]  2ce96d77ad:
 WARNING:at_kernel/sched/rt.c:#__disable_runtime
Message-ID: <202311132310.6114861f-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DM4PR11MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f046e24-511e-4547-fce8-08dbe45da487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnKYX7tJ/De5ENORUiUG6p8UIoiE8uD4YaIqhW69eQwDs72U0eOV7tecEfRqKhHxOtYb4NHJLYNnbE2qRkNaaULw6QlNjFJrqFceC7L5/oWVrVJol+Y8gade1GHnT5waBpU5T/ZEOK6QByfgMuCzwBiddEdR6yvra4m6Hhq5ewjBTUDFRncmf3DQQ9GPjmuc6Vz7FAjjF6ySXAoJ1q/gwX7ApKIEQX5YR3B3sEHHBK+7CpUYxyXqlGpDavV4ZsHLBPYE5FCsbfAfRlbDKsgC1vn1EgSFDCOqhehzlFv5WUy4KdVcyRLpdIgJYQNvkvDj30wiMAbeU9HdvwvimEmw32G3AH8yYAmaj+M/E6NlkfkYlGC7zwSMsuidJit9lwt67pa/5bsVFJ0UqBxrvRyi21Yp4ApaUIVjV2ogz9KahAmzCy0JMv+uQffM73fvMsteGG7G3og/bll4xZh55Vd7GUJ/9SybKQ0ur6mP6gv5p5TxP6kn4el2V51csNK5t93PxiBf9uktzcWlkxbf59rfPFPpXuMJWjNXdQ+D1SUJzf02IGRebRB4M4Pip8pvlINXxKarzj5b/n1Qe9lEp8i831pd/HmwVYFyoUGXrbWjOegDaichir123315PXFp8mgK4ojIn0kf3eens4024hcyNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(66476007)(6512007)(66556008)(5660300002)(86362001)(1076003)(316002)(6916009)(38100700002)(8936002)(8676002)(4326008)(83380400001)(41300700001)(66946007)(6666004)(82960400001)(26005)(2616005)(45080400002)(6506007)(966005)(6486002)(478600001)(107886003)(2906002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJVFE5oIy12LnoEeMq0lqjVicW7spExilkPS4y1Mvbr13mRNSGKSOiI7ySbQ?=
 =?us-ascii?Q?Dp3dX9tYjJxruvyyfCFFBY9xyRZAVD3NMOtR4dBYBlietsZq8rSVuc8yS4Vs?=
 =?us-ascii?Q?qpPvgrfxB5Ya/VNUWf2RATLg36gsi9x30KLS2J4eQhwd4APFBZECSpfsdVdt?=
 =?us-ascii?Q?xt/e1ooGP+UFw1dRVDHm9W+SsFARQ5Dc8sShw0WSXxGVJ+g4nLtHcXwlFQRs?=
 =?us-ascii?Q?f0T7FWEFg5HpGn25BYDJPkjcLnVxq0f9VNCRHRUCuW7eadgytEWBRVmXTG0m?=
 =?us-ascii?Q?loyGWs9+qn3vOOs/cmumAqN/dX+NqITyA7W+v53FhNiWmS42eIR26f/bexOo?=
 =?us-ascii?Q?Txx2IYy+uX4DRarAJr1XbVOYA4EUjJNI4+EbIBG9vyIwYspEgrMct1xwRd3P?=
 =?us-ascii?Q?bznF73WpcHlaNCrAdj/0emG2aG4xgd0BaVDNTLWZySpAbcbld07rpvvke517?=
 =?us-ascii?Q?GKUAZlk1I9sH2VHl/ulJgdMsfGjVX5NBjxBdfN93QLrN33rY3YkMxyigMLPW?=
 =?us-ascii?Q?3uQ2ARefDoD4SHpROawbdk2ZbnSoVOlb0MsXUK3EyYHGDUEQnPVv2vKP2VNt?=
 =?us-ascii?Q?RUgaW7NRekGSUywka5PQN7EnERW1BKk3eLTg3bjSJka8gu8hJeQv5WTTh2W0?=
 =?us-ascii?Q?KQ6bfDzU01aU76imt63Wl10UR/lsQeW99fbjA/vRjG4qyMnIwMGch3LMpVqz?=
 =?us-ascii?Q?/Ew13Y2PBmaMzBpenfP2f1OMjA4zUIoGswtX/oi2aCs8pPueofTFOuQ5d1RL?=
 =?us-ascii?Q?/tMM3om0PAR2s9Afplj9Qt/HN1W8qtOvZeOZ87jFuPzJbI/118WnuxSvRGz1?=
 =?us-ascii?Q?Yu33Kmqy0bpnZw5I3ZQTkFDS169LHJkAYPrZ8+Wy0SebUwyHYJK7uNGj8rtR?=
 =?us-ascii?Q?7HXiVi9IsxhBiUskaS9/FaY6vAy/wnGqSN1MG0x9WXOq/85U//HPvc5ffIYa?=
 =?us-ascii?Q?B5L3RqZ27ibmMzEJNcxYMaMwDvHN6pFAGQ+uk8IOzAyieEeSDnEmhsnmNc07?=
 =?us-ascii?Q?JfP47Md95cxAcEckl/NfpyqIsDK4OLAPpTgdgbFnJsTwD95HRwQF3joPiBkY?=
 =?us-ascii?Q?aztTF5NOgcCBB3zsoFJO4rsxMGFqFY924VJrEIjvEN/DODgAV+WPTaOnoh19?=
 =?us-ascii?Q?Gppp6L9xgjBpk9EmEPfDiUXn852ly2jNWaCvla4RK0bUzH4I+k1IeBX17DTu?=
 =?us-ascii?Q?Sb0w987EMwt7Qf3yjpK7K1cvl2uVM/y8CH4kZaSTtBFxXb2XG0FmtLnFbbJr?=
 =?us-ascii?Q?fH9Nji61h5TuDqi8kyo/xyVDe9ZT7tWzZZDwmqwz3e3X2n2m56Pi63R0Xl1E?=
 =?us-ascii?Q?QU1rUNEAg7ZqdWsdc49t14Nm8vhabNTAqTm97/MGPnpHC2CAzw7/KQBtDJ32?=
 =?us-ascii?Q?MEyagJUejRTw7bRX1W+Q3Udc33KL0Ve4WLOC7O2628t7m7Zp833Y/MlGB7Tj?=
 =?us-ascii?Q?dpAimLJs50RZ1EgpJWl8deA05fhg8lOgHPB1lkwLMbYxjuX8MvS5ZFVJ40xJ?=
 =?us-ascii?Q?fi7KwS7zJ5KRa24+IZB4UtHaaF118ckReArljnI73Z+fElvolbLdBugdBGzo?=
 =?us-ascii?Q?9JkBXi6ha4gbmC3QKOMzAaZpaTpV6E5lCUnlwvSVo7HSkrGo7KCs67FpqGxN?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f046e24-511e-4547-fce8-08dbe45da487
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 15:31:44.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYCIBlWL1eSpdt3Yz+1V6q23PlvXe+J2+afwKsLx4YPEBWQcoCKLgUNSXVypvyNjb6K2/TE9VVzu4O1ZEVV2ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5520
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/sched/rt.c:#__disable_runtime" on:

commit: 2ce96d77ad3d39abba2debd88c5d4bd91f9a25ab ("sched/rt: Remove default bandwidth control")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311132310.6114861f-oliver.sang@intel.com


[    1.234766][    T1] ------------[ cut here ]------------
[ 1.235863][ T1] WARNING: CPU: 0 PID: 1 at kernel/sched/rt.c:736 __disable_runtime (kernel/sched/rt.c:736 (discriminator 1)) 
[    1.237519][    T1] Modules linked in:
[    1.238308][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.6.0-00100-g2ce96d77ad3d #1
[    1.238461][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 1.238461][ T1] RIP: 0010:__disable_runtime (kernel/sched/rt.c:736 (discriminator 1)) 
[ 1.238461][ T1] Code: 3c 30 00 0f 85 83 02 00 00 48 8b 44 24 18 48 8b 40 18 48 85 c0 75 1a 48 8b 7c 24 30 e8 56 da 79 05 4d 85 ed 0f 84 c9 fe ff ff <0f> 0b e9 c2 fe ff ff f3 48 0f bc c0 89 c1 83 f8 3f 77 da 48 8d 95
All code
========
   0:	3c 30                	cmp    $0x30,%al
   2:	00 0f                	add    %cl,(%rdi)
   4:	85 83 02 00 00 48    	test   %eax,0x48000002(%rbx)
   a:	8b 44 24 18          	mov    0x18(%rsp),%eax
   e:	48 8b 40 18          	mov    0x18(%rax),%rax
  12:	48 85 c0             	test   %rax,%rax
  15:	75 1a                	jne    0x31
  17:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  1c:	e8 56 da 79 05       	call   0x579da77
  21:	4d 85 ed             	test   %r13,%r13
  24:	0f 84 c9 fe ff ff    	je     0xfffffffffffffef3
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 c2 fe ff ff       	jmp    0xfffffffffffffef3
  31:	f3 48 0f bc c0       	tzcnt  %rax,%rax
  36:	89 c1                	mov    %eax,%ecx
  38:	83 f8 3f             	cmp    $0x3f,%eax
  3b:	77 da                	ja     0x17
  3d:	48                   	rex.W
  3e:	8d                   	.byte 0x8d
  3f:	95                   	xchg   %eax,%ebp

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 c2 fe ff ff       	jmp    0xfffffffffffffec9
   7:	f3 48 0f bc c0       	tzcnt  %rax,%rax
   c:	89 c1                	mov    %eax,%ecx
   e:	83 f8 3f             	cmp    $0x3f,%eax
  11:	77 da                	ja     0xffffffffffffffed
  13:	48                   	rex.W
  14:	8d                   	.byte 0x8d
  15:	95                   	xchg   %eax,%ebp
[    1.238461][    T1] RSP: 0000:ffff8881009d7b80 EFLAGS: 00010002
[    1.238461][    T1] RAX: 0000000000000000 RBX: ffff8883ae53b0c0 RCX: ffffed102013af62
[    1.238461][    T1] RDX: 1ffff11075ca76ec RSI: 0000000000000004 RDI: ffff8881009d7b10
[    1.238461][    T1] RBP: 0000000000000001 R08: ffffffff8137f992 R09: ffffed102013af62
[    1.238461][    T1] R10: 0000000000000003 R11: 0000000000000001 R12: 00000000389fd980
[    1.238461][    T1] R13: 00000000389fd980 R14: dffffc0000000000 R15: dffffc0000000000
[    1.238461][    T1] FS:  0000000000000000(0000) GS:ffff8883ae400000(0000) knlGS:0000000000000000
[    1.238461][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.238461][    T1] CR2: ffff88843ffff000 CR3: 0000000008edd000 CR4: 00000000000406f0
[    1.238461][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    1.238461][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    1.238461][    T1] Call Trace:
[    1.238461][    T1]  <TASK>
[ 1.238461][ T1] ? __warn (kernel/panic.c:673) 
[ 1.238461][ T1] ? __disable_runtime (kernel/sched/rt.c:736 (discriminator 1)) 
[ 1.238461][ T1] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 1.238461][ T1] ? handle_bug (arch/x86/kernel/traps.c:237) 
[ 1.238461][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator 1)) 
[ 1.238461][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 1.238461][ T1] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:115 include/linux/atomic/atomic-arch-fallback.h:2151 include/linux/atomic/atomic-instrumented.h:1296 include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:115) 
[ 1.238461][ T1] ? __disable_runtime (kernel/sched/rt.c:736 (discriminator 1)) 
[ 1.238461][ T1] rq_offline_rt (kernel/sched/rt.c:2435) 
[ 1.238461][ T1] set_rq_offline (kernel/sched/core.c:9526) 
[ 1.238461][ T1] rq_attach_root (kernel/sched/topology.c:500) 
[ 1.238461][ T1] cpu_attach_domain (kernel/sched/topology.c:779) 
[ 1.238461][ T1] build_sched_domains (kernel/sched/sched.h:1873 (discriminator 3) kernel/sched/topology.c:2521 (discriminator 3)) 
[ 1.238461][ T1] ? cpu_attach_domain (kernel/sched/topology.c:2384) 
[ 1.238461][ T1] ? kasan_set_track (mm/kasan/common.c:52) 
[ 1.238461][ T1] ? __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 1.238461][ T1] sched_init_smp (kernel/sched/core.c:9806) 
[ 1.238461][ T1] ? sched_init (kernel/sched/core.c:9796) 
[ 1.238461][ T1] ? rcuwait_wake_up (include/linux/rcupdate.h:308 include/linux/rcupdate.h:782 kernel/exit.c:312) 
[ 1.238461][ T1] ? lock_release (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5775) 
[ 1.238461][ T1] ? rcuwait_wake_up (kernel/exit.c:315) 
[ 1.238461][ T1] ? cpus_read_unlock (include/linux/percpu-rwsem.h:119 kernel/cpu.c:501) 
[ 1.238461][ T1] kernel_init_freeable (init/main.c:1543) 
[ 1.238461][ T1] ? rest_init (init/main.c:1429) 
[ 1.238461][ T1] kernel_init (init/main.c:1439) 
[ 1.238461][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 1.238461][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 1.238461][ T1] ? rest_init (init/main.c:1429) 
[ 1.238461][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[    1.238461][    T1]  </TASK>
[    1.238461][    T1] irq event stamp: 5120
[ 1.238461][ T1] hardirqs last enabled at (5119): kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1) mm/kasan/quarantine.c:240 (discriminator 1)) 
[ 1.238461][ T1] hardirqs last disabled at (5120): rq_attach_root (kernel/sched/sched.h:1398 kernel/sched/sched.h:1678 kernel/sched/topology.c:494) 
[ 1.238461][ T1] softirqs last enabled at (4964): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:400 kernel/softirq.c:582) 
[ 1.238461][ T1] softirqs last disabled at (4955): irq_exit_rcu (kernel/softirq.c:427 kernel/softirq.c:632 kernel/softirq.c:644) 
[    1.238461][    T1] ---[ end trace 0000000000000000 ]---
[    1.315566][   T14] Callback from call_rcu_tasks_rude() invoked.
[    1.319695][   T25] node 0 deferred pages initialised in 80ms



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231113/202311132310.6114861f-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

