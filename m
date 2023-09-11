Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAEE23CC
	for <oe-lkp@lists.linux.dev>; Mon, 11 Sep 2023 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694414282; x=1725950282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mtgmROzL/wkk89u1ZiEs8sFiFEeOMP6qpzpoKAQuPg=;
  b=E+xn8x6Crtu3n14S+MU+xH6ldkoWd+CHYU5del934eWlS371dyaFPzyH
   PfN1zNILPX0HwbYKTfYGOUifOowuKdW6j3ORHqqKptOJPvFQEAZ6IduKt
   vLB/4girZSiLVtvZENutY3uN3kTLfe/4c2msIE45/EoMKEJkce3L+8gub
   TbzN/LMwUaqZ4E6DtjgcwnsNpxffSRU4KaCeue2rkNDwe1H3IOdfokHHR
   R97bOuPJTRLxnwFr7xZDEEPVZWXEPbS1RoEqA9Zm+emPhzc6GlrVpbpmk
   W9wBoCpqfShWTR9x6TnxcR4YSlr6mmEBkDQLnWAFHlUJz1DG2r80To/mh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381808810"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="381808810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 23:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="692980866"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="692980866"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2023 23:38:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 23:38:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 23:38:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 10 Sep 2023 23:38:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 10 Sep 2023 23:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjLVTxKUdZXh5GHSMpYMz9ByVVIm79t22z+vLEmvcNhyBLHvmdjfgzAwxxgAXzERkUVGqCYos51++mheM9qEfw0uvWqoMhlp1zjIotjelf575ZBsFYDGklBxApT0qaB4JGqyNs2n3BzOTuRjlwq8bDC5b/APzxniMHVYwUgeS5fprWICxNbEJSfdjx2KvFP3ItGIzuOUysfl8t/Rt2rTIwMRt0fAhqoDv6KB5DUFc5e3pdQKMMiPv/+dYubsYVY5W0ADQO6kRoSFc50qJi707B0l1OmPusq+hlqS2PK04W7DWEYK40qmRoi7lQFpJoBSqFw4RKaBvQajuD9wfQ/37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd1OmE6FE4v5qlcmQvj2He+RjwdhbpTvrxh8zz+rZx4=;
 b=CbL4JmBQ6Vqlxy7Hc9ngR3tOztUkegZW2Qw64pBXyYWZc2wOodu/X3mZnO1V5wFyEaPzUJqfpwqPchtnnEavkHxiMV/9tbjnHrfi8cQB93OyIZZlOTvRkq09+5QDo7Cb8ILlRXMS60pl+vXpNJ7YmEmRl2A+xWw/yxRXC8z2Orbti8EVH5MgGsZw6Yw1EFA9fw4Or0MKXlLTcYGOoG8MgBmMAhq8rIMdD68jw7cIakLeVGbBRbLyOSVO/3MVy+WZMWVJQPTGKBSxmR0dPtFefsD0ljpy0vTKdlwIbQHUJmLdScUG1iTzgCPDplo73XP19PiQCxsTzhOL8pI5jZNgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Mon, 11 Sep
 2023 06:37:59 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 06:37:58 +0000
Date: Mon, 11 Sep 2023 14:37:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-fix-5g] [dyndbg]  6c815b1b62: canonical_address#:#[##]
Message-ID: <202309111435.deacfb92-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: b00d9978-0c43-446c-b963-08dbb291a347
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6ODVJ4Hw8MlKukuKwKXompWzOu+6vBljK7eoqIpizWNTD1b24ynH5jBI5NCui1lWkV0+s6xER/rDAeryvSFTXtVJcPGCwDa2aXXoYbc9EUSh8ylq6c5KoLmKOh8K8Q1DjZcgB7FOXGpxDLhQoLkmV2qyJ7NnfoL0nXImLjPsjPRnXAT47ky8x6g+1iP4yK88dyC6o2Lmjf36OHiUjkayT2itmrBrqorYtEdbE0zupu8PkABetrmzNgWqcnRPdr8DGLesr36sshbqO4k8XL7kZ9ezxpBK47LEnct99pLjjcl/LSWSgH6xFq6TexPSDQtLOaOv9FR83oHVbmi9JECYHOrwIQmMvFuTRyuJFmhzXBKYBHL6+Ui2K84cG8k4Fwsoz689gNkfsIUBWAJLd1tS0nZtRASZl77Q51ibui7JlVxMSEAnoOqB64CkdgJeXwYHrOTqbAey/t70LTEvcoL8fV6/Dy9qlmCilyQ2meIqLLA8mQS/NOpQCEfDd4pKohdld+2m2h3mpdlJi1V6LiBw91ZYLBFPHYF7aTFJEWMNHjDzs3iK42dTZyz0sC85a3aEGxu71yvaEeZdgaa8cRfiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(186009)(1800799009)(451199024)(41300700001)(6666004)(6486002)(6506007)(82960400001)(36756003)(86362001)(38100700002)(1076003)(107886003)(2616005)(2906002)(966005)(45080400002)(6512007)(83380400001)(478600001)(316002)(8936002)(8676002)(4326008)(5660300002)(26005)(6916009)(66946007)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SG8CtWfFoRvsvwofJPs2JZkof54uqDhIbbFYHl2u3k+KNB3REHnAqfQmr7+D?=
 =?us-ascii?Q?vfP4dmjRnI/o30dxHHp+6FSFcVM3B62aP0+mLn94cCQMp+wG66AVo7+leFw6?=
 =?us-ascii?Q?w0DprmbCqtTA+5UfL7ufsAfE4XBPDE4UewCUjg1sm/FthtnWvD8DAHCR1Gcc?=
 =?us-ascii?Q?FqHT2EhmgXfP52i4a/71RaEeWxj5pXOq67VlFkGtI3q1d9x5FybFs717lG0b?=
 =?us-ascii?Q?DtRVHZWvFpFapwdGmArYrp1oH/r/U0oh7crUPtcpg2qDFkKKuVrW7VDzcMYF?=
 =?us-ascii?Q?vic7Rdfgdixf/BR3PHHEzoNm9maCfSQ7UGfTyLl2k5mGl1tJVz5BdB14vuTM?=
 =?us-ascii?Q?QGpQx8O88oI/c5NoFEgDQWHvZoxqKzdGQPl/LU7U2ZJjtxeExr2i/BnCXo+y?=
 =?us-ascii?Q?ky2c+rS8denebWlSw1yzh7Oo5p1Dqk9+j0Uy4VWMx9fFiys6eNg7X4TKyOHy?=
 =?us-ascii?Q?WOuLbTCz8K+U/oWu0oL58VzclvthG105qggtAqLMhwxCv4UPdxm83i9DTpFK?=
 =?us-ascii?Q?Y3ihp2Ixf3IM1vkoqgIHb9UnbYWU5lvn9tYv+msGqkbwB8sjp+6CNGyx0h8i?=
 =?us-ascii?Q?a3ihlCGuuxv7vVSCpfFhCjSXECDZdkltu2WMLF7tw87leoLWg61CZZqgGc+Z?=
 =?us-ascii?Q?coU82ERy3AL618BPQlx8QEvOB4f+QdXCom6MjKK2UkRp+05I+DSy63C9L21t?=
 =?us-ascii?Q?b+lNG69J0is29kGCJG8nzPCu4eWjWDYkB+aqPFuXucV4kYziX7kbhtWW1c+B?=
 =?us-ascii?Q?uoz3R47dVu33OCO/Y4qtp0o+eXVuV73yUR92mV6dpafO8NoFDqXBWSJSZOHN?=
 =?us-ascii?Q?4DMYqhTDDiueS0aL/TwjgxcfrbwMlPG1JYywVbEgQ3CQBrl6agGfw3XNKqvB?=
 =?us-ascii?Q?19imYyx67+z/VjKqU0J44/c2Uh0E1EbI6ydhB8qnWnDKKPBnq5LjfSd/TEe2?=
 =?us-ascii?Q?mslqxYfF9SFsZLVeZIZXRHZ//3AQDuAVjZwJH2gaCsjXwViHL10rUxJmpx3Z?=
 =?us-ascii?Q?p5NRGibY9H9Rq8GgbRTYEvFTrSAQL3xposfvRJWm8Fc6uvLUO87wctK7KZwX?=
 =?us-ascii?Q?MlB1EpQo+UhWMFQyihje3qLSsAy9ol1IGq1de7C6HJW4gKaqaelqpLg04Giq?=
 =?us-ascii?Q?LaSmQpcLZpxK5UGUJTgTfvFWHBnW3EUW9ctjfcZFn7MSTvJpCxC2L8SKQK2n?=
 =?us-ascii?Q?EzSbn5jieyz9SmkS3xSnN3JFjuL9iFptY+5693NG6offIiq9+EO4itom93d8?=
 =?us-ascii?Q?5RvWF2fDgk4Vx1AteI04f5+9/qKqkSP6By1UOAN9vACAbJ7tRVHt7uNL1MAM?=
 =?us-ascii?Q?fEw21ejaxNYK2rYDmSZI/yDZoKGBDYriia9zxs7lLhTbocwQovj4lpX+B3jc?=
 =?us-ascii?Q?lw2ZqaO0OFELmVKgPL0Cj5SLq4y8+HttVejGLQD2uHWub6IlzkQQfVYUvZ7X?=
 =?us-ascii?Q?91/yyjrYluFf7AbI4X6/9jLb9GTVtlnkVm6zYSUrJCaXqw4qTBgbvpIYV0KQ?=
 =?us-ascii?Q?p0eZEuh9V3DJKlCT1kAnuHoK1UC5jYCS7SBdMJ8AmzhA2GUoVNlKzRV88r67?=
 =?us-ascii?Q?pQLesWmfVi5d9ExQp9hhJOCpH0Mgz1X3mF3t7CXWXXvcepTTDN3ob04cI3r6?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b00d9978-0c43-446c-b963-08dbb291a347
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 06:37:58.8770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrZ6aljDSJU0zz+ESsCrxHvWuX1yNqcrVGEwNnXvdrQsNa4UJtRywukf8CrqehK1SlgnCWQSGqLFVK4O64M3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "canonical_address#:#[##]" on:

commit: 6c815b1b62257b8e71192ae19276461928a7746d ("dyndbg: add for_each_boxed_vector")
https://github.com/jimc/linux.git dd-fix-5g

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------------+------------+------------+
|                                                         | c6e33415a9 | 6c815b1b62 |
+---------------------------------------------------------+------------+------------+
| canonical_address#:#[##]                                | 0          | 14         |
| RIP:ddebug_apply_params                                 | 0          | 14         |
| Kernel_panic-not_syncing:Fatal_exception                | 0          | 14         |
+---------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309111435.deacfb92-oliver.sang@intel.com


[    5.164978][    T1] ------------[ cut here ]------------
[ 5.166015][ T1] WARNING: CPU: 0 PID: 1 at lib/dynamic_debug.c:1257 ddebug_add_module (lib/dynamic_debug.c:1257 lib/dynamic_debug.c:1316) 
[    5.166687][    T1] Modules linked in:
[    5.167451][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.5.0-00015-g6c815b1b6225 #1 cd2200472f193696f75b814e47a4c91c568f9ba9
[    5.170077][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 5.171858][ T1] RIP: 0010:ddebug_add_module (lib/dynamic_debug.c:1257 lib/dynamic_debug.c:1316) 
[ 5.173165][ T1] Code: 0f b6 04 28 84 c0 74 08 3c 03 0f 8e 6f 06 00 00 48 8b 44 24 20 8b 50 20 41 39 d6 0f 83 f6 00 00 00 4d 85 e4 0f 85 48 ff ff ff <0f> 0b eb c0 48 8b 44 24 30 80 38 00 0f 85 41 08 00 00 4c 89 63 28
All code
========
   0:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
   4:	84 c0                	test   %al,%al
   6:	74 08                	je     0x10
   8:	3c 03                	cmp    $0x3,%al
   a:	0f 8e 6f 06 00 00    	jle    0x67f
  10:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  15:	8b 50 20             	mov    0x20(%rax),%edx
  18:	41 39 d6             	cmp    %edx,%r14d
  1b:	0f 83 f6 00 00 00    	jae    0x117
  21:	4d 85 e4             	test   %r12,%r12
  24:	0f 85 48 ff ff ff    	jne    0xffffffffffffff72
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	eb c0                	jmp    0xffffffffffffffee
  2e:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  33:	80 38 00             	cmpb   $0x0,(%rax)
  36:	0f 85 41 08 00 00    	jne    0x87d
  3c:	4c 89 63 28          	mov    %r12,0x28(%rbx)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	eb c0                	jmp    0xffffffffffffffc4
   4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   9:	80 38 00             	cmpb   $0x0,(%rax)
   c:	0f 85 41 08 00 00    	jne    0x853
  12:	4c 89 63 28          	mov    %r12,0x28(%rbx)
[    5.176173][    T1] RSP: 0000:ffff8881108c7ca0 EFLAGS: 00010246
[    5.177276][    T1] RAX: 1ffffffff1716087 RBX: ffff888110a31400 RCX: 1ffff11022118fb4
[    5.178722][    T1] RDX: 1ffff11022146285 RSI: 0000000000000002 RDI: ffffffff8b8b0440
[    5.179968][    T1] RBP: ffffffff8788d260 R08: 0000000000000000 R09: ffffed1022118f67
[    5.181399][    T1] R10: ffff888110a31428 R11: ffffffff8a11cb20 R12: ffffffff8b8b0438
[    5.183291][    T1] R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
[    5.184763][    T1] FS:  0000000000000000(0000) GS:ffffffff8953c000(0000) knlGS:0000000000000000
[    5.186674][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.187832][    T1] CR2: ffff88843ffff000 CR3: 000000000950c000 CR4: 00000000000406f0
[    5.189264][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    5.189960][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    5.191407][    T1] Call Trace:
[    5.192840][    T1]  <TASK>
[ 5.193452][ T1] ? __warn (kernel/panic.c:673) 
[ 5.194246][ T1] ? ddebug_add_module (lib/dynamic_debug.c:1257 lib/dynamic_debug.c:1316) 
[ 5.195192][ T1] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 5.196177][ T1] ? handle_bug (arch/x86/kernel/traps.c:324) 
[ 5.196990][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:345 (discriminator 1)) 
[ 5.197885][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 5.198831][ T1] ? ddebug_add_module (lib/dynamic_debug.c:1257 lib/dynamic_debug.c:1316) 
[ 5.199834][ T1] dynamic_debug_init (lib/dynamic_debug.c:1502) 
[ 5.200759][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1458) 
[ 5.201798][ T1] ? rng_is_initialized (drivers/char/random.c:918) 
[ 5.202845][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1458) 
[ 5.203895][ T1] do_one_initcall (init/main.c:1232) 
[ 5.204784][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1223) 
[ 5.206005][ T1] ? native_apic_msr_write (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/jump_label.h:260 include/linux/jump_label.h:270 arch/x86/include/asm/msr.h:147 arch/x86/include/asm/msr.h:254 arch/x86/include/asm/apic.h:207 arch/x86/include/asm/apic.h:201) 
[ 5.206485][ T1] ? arch_irq_work_raise (arch/x86/include/asm/apic.h:414 arch/x86/kernel/irq_work.c:32) 
[ 5.209511][ T1] kernel_init_freeable (init/main.c:1337 init/main.c:1537) 
[ 5.210455][ T1] ? rest_init (init/main.c:1429) 
[ 5.213131][ T1] kernel_init (init/main.c:1439) 
[ 5.213980][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 5.214979][ T1] ret_from_fork (arch/x86/kernel/process.c:151) 
[ 5.216172][ T1] ? rest_init (init/main.c:1429) 
[ 5.217041][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[    5.217993][    T1]  </TASK>
[    5.218623][    T1] irq event stamp: 2571
[ 5.219504][ T1] hardirqs last enabled at (2583): __up_console_sem (arch/x86/include/asm/irqflags.h:26 (discriminator 1) arch/x86/include/asm/irqflags.h:67 (discriminator 1) arch/x86/include/asm/irqflags.h:127 (discriminator 1) kernel/printk/printk.c:347 (discriminator 1)) 
[ 5.221156][ T1] hardirqs last disabled at (2592): __up_console_sem (kernel/printk/printk.c:345 (discriminator 1)) 
[ 5.222719][ T1] softirqs last enabled at (1378): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:400 kernel/softirq.c:582) 
[ 5.224385][ T1] softirqs last disabled at (1369): irq_exit_rcu (kernel/softirq.c:642) 
[    5.225899][    T1] ---[ end trace 0000000000000000 ]---
[    5.226487][    T1] general protection fault, probably for non-canonical address 0xedcf288bee8e6ce1: 0000 [#1] KASAN PTI
[    5.228235][    T1] KASAN: maybe wild-memory-access in range [0x6e79645f74736708-0x6e79645f7473670f]
[    5.229499][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G        W          6.5.0-00015-g6c815b1b6225 #1 cd2200472f193696f75b814e47a4c91c568f9ba9
[    5.229499][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 5.229499][ T1] RIP: 0010:ddebug_apply_params (lib/dynamic_debug.c:1201) 
[ 5.229499][ T1] Code: 48 85 ed 0f 84 ad 02 00 00 83 f8 01 0f 8f 1e 01 00 00 48 8d bd 98 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 8e 05 00 00 48 8d bd a0 01 00 00 48 8b 9d 98 01
All code
========
   0:	48 85 ed             	test   %rbp,%rbp
   3:	0f 84 ad 02 00 00    	je     0x2b6
   9:	83 f8 01             	cmp    $0x1,%eax
   c:	0f 8f 1e 01 00 00    	jg     0x130
  12:	48 8d bd 98 01 00 00 	lea    0x198(%rbp),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df 
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 85 8e 05 00 00    	jne    0x5c2
  34:	48 8d bd a0 01 00 00 	lea    0x1a0(%rbp),%rdi
  3b:	48                   	rex.W
  3c:	8b                   	.byte 0x8b
  3d:	9d                   	popfq  
  3e:	98                   	cwtl   
  3f:	01                   	.byte 0x1

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 8e 05 00 00    	jne    0x598
   a:	48 8d bd a0 01 00 00 	lea    0x1a0(%rbp),%rdi
  11:	48                   	rex.W
  12:	8b                   	.byte 0x8b
  13:	9d                   	popfq  
  14:	98                   	cwtl   
  15:	01                   	.byte 0x1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230911/202309111435.deacfb92-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

