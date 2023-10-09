Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D0B66D
	for <oe-lkp@lists.linux.dev>; Mon,  9 Oct 2023 06:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQrI4p5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696832173; x=1728368173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ruBEkdH9g9mwP1YGHgQ5Yaj74/HhtMtMuHvz/7Zl/Ds=;
  b=QQrI4p5xvv1Ceme/QX86yUddJGJN6rqnohQfBu8KWfS/tvKQwqqONfNp
   Ru9JfllpTcG3ylQRVSx4z3KK8k4RM8hkZi6A6mlCAbD+CNYVnXc8vPr4d
   ig3cOZ68R9OaCx1Ecu39xaQw8+hzOS1vCGBot9PBSrpSGUjqi/Rsr6J/L
   WBVwrgmJV4cfY9Odeug8NypJsFWhAPbs5yGd1wz8VrZFlePf26EMV8W6M
   LsMMST0v7TY0jaby3RL5bspGq+eOzS/b9uDjFj0GBmkx+0C3/WuO7Wzpo
   Iu4aj47m9uCYvka/yXezGx7PIy+oKz9HqKhURiHD/IeKV0eWk8Z5doYeA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="383955039"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="383955039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 23:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="869122018"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="869122018"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Oct 2023 23:16:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 23:16:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 23:16:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 8 Oct 2023 23:16:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 8 Oct 2023 23:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALKzhYKCEia/aJVJKL3LQssuu/0ArEorVeC+wjxhYSlPzBact5T3Gf2DS2N22QWZ4TI2kjMgPWLhgfJn5V/b2lu0AJZKXlnS8RFUR2k2fXfR+wp2y78vVEF0HF3ArnUWAAuVWo4dje1YJaKqCBjvlvmL8RjsyRk/PDMu1knTxCIafTbt4s0Usp9bHAgd9lP0AW1yUICZHZO8lZVo7oDN4InGtXaCV8iU+JoePJIgVckOU8pE4au21vHYAQNIfLwU3+7JXRWzTMeXM/NCsKyAdAwi1T2zrTinE4b90U6Tr1qYE+knFJIRMPEkmA+524ze4tLHarFJYrZqOPAfcfM0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbgoYFalCSqUX5Vq4ebJtGVcWUWFSCpkMEPk2+RdUCU=;
 b=UrflXXMnKWELTCZJe8vwU8kMAg00JZZvsL961HbNrxBBDAYQ5gBpxfka5xqIE9dOvcR6S6qLhFEKx9YS2h8JrQ5wPKucpp5K49YRIOdAhkwX6lF3PVsdn1zm7DPBea0ZDYTKTpvX3pGcu9DrQx3pLWJ8TbhOxlg7YQeqZSh4JhoSCe5ejW70P3Kx4AiKBwMRwAcWdqEdk8h4Xt6VFZlsx6JyVZImg4SphjLF9ZOfRW6XCDYyK6S4jTY8c9mtolMYmT/KnuBgrkh53FixNQWqDzQq6INsposK1EMmupVw9FQYeAGgErvTVleH5KRMhbSsV3EUvr9xf48ENZ+4WnSr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 06:16:07 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6838.029; Mon, 9 Oct 2023
 06:16:06 +0000
Date: Mon, 9 Oct 2023 14:15:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-kitchen-sink] [dyndbg]  4800de5cd5:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202310090909.cb63dd5e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: d8425332-fcdd-46f9-ab84-08dbc88f38ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1NeUcnlEr7+a1Kapqu0QUVFmcDbmqab/Gg5eYEjr37RyhP4oiBBx/w0xkRJX6+O2k6pq0d0mmNnBJgIas9y2fYQdJvWAf5FIL5aAIWmF/YuPbsKXzidaqECxB1EDqzOm+iYgiIrUW/BYrNfriicOALone48QKoDtEkVf4b1T4R6Yjj4a7U4APh7HZMJH/IFzDqXrl/H2EEarivpIev/LXjb5VabbLnsfBw+2S7bCfKgwBdDZXUJryz7jqSTJL9EX+3x/vjEY7ZhsZYpQivy0J1jKQtxRZqC97dgE2V0lmuwzxGWSubQ/J4GHitM1cG1cjKvO+Y8aeDcoASAjBxaSH7XYSeJGP6rwh4YuYQazavNeT5MkoRU2UwSYz0OkBU10DNJF6OfNALSfiXi7TSiAcnVdGW+fky9jCmzpZbuUg/MTlPBAggZuqKIVRbkKlWqrFkRmHXaOOTE27qdzdeW8Us1DAavNAOG8sQ3fPO6HLUweupa/3hKq0dnWh1Q89KG+pp4HMXmwxjcsQJ7Po1AFuRF/7DT55FnFChib7bx7TUrkn0rgnX1vnu2seKXe8OORG1e3qCAR1VxWDJ4Yl0qpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(45080400002)(478600001)(6506007)(6512007)(6666004)(107886003)(83380400001)(8936002)(30864003)(2906002)(4326008)(8676002)(66946007)(66476007)(66556008)(966005)(6486002)(41300700001)(5660300002)(6916009)(316002)(82960400001)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jnpYFqaVUbYmRZURulBHA0e9jy1DdUbhug9z3BYmVDCJnS9gsP9oR2Emg7Y6?=
 =?us-ascii?Q?2z8AJahxAiJJly0ps99fjNp+I7LZsC8eAcptmNyBpLLbW7m87p+Fh/zitGDP?=
 =?us-ascii?Q?FFJ5nypuzCzF53SMdxD4Q5jAwEcE567PDg0JNmqWviZTOKmUUdAltAtBMC2U?=
 =?us-ascii?Q?m7wBtzKqDicYd0NhdYS0E97+nCRn4Pj5sjONOH8hbyGofb4uN1r4jceJookC?=
 =?us-ascii?Q?I8GlkSehE1BhFGOHSC5L+yDmMVpb9utcXxoBX9xnFFEu/pnHPcBWRF+v83Vj?=
 =?us-ascii?Q?YNo1pWMrcCoTmmIJ99QJNBwoTzUFv0Qx6/qZ4YvW21PSWseRu3d8VgvRWABg?=
 =?us-ascii?Q?GvOdIvcl6sM3e4CICxccpE4eUNWt76QY9gA/p4XYBNwvDUMA1qnHYdsqW6JW?=
 =?us-ascii?Q?X8SPxjd/quO+i/XRlFf7MdSovHNQCnb3xb3JfEXTWlzTgcuqVH7Q0vqZVUPc?=
 =?us-ascii?Q?3pXspESJx6HTjVrBBghBbXQ413OfXRD0ILAGo1c1AfOmYagMFrGR8e23h7MR?=
 =?us-ascii?Q?II7OHxL4ZLnHtIfOd0eXpE9RpcmdN5F2MfbSqVP3wYh7QGmz6yscobkfdSbE?=
 =?us-ascii?Q?4A2Gb/CdukXqUH7rdsWn5ujmtciRI/ItF7C5lQbvKGbsZKfvbaXj/pyq1X1N?=
 =?us-ascii?Q?nrkQ+Sib7fsM+psPdNTt7kReL1lby1SzKHFFcKJF1VrtzfyGimd4dDb9VsWO?=
 =?us-ascii?Q?NQIIX+NFwnaqo1y9jcV5lKQ3hrXVC/0VJ0u3CWLMquu8pgYAWUR588uqkdxY?=
 =?us-ascii?Q?1pSNACC/XhR2U7gApvWTtABGu8Zb8l6uzScOS0l1wp5ShfXgRR3HlWUJLFQa?=
 =?us-ascii?Q?uOpsf94EzrYev0moYXfBqCy8i3z4NJk7vfp5LOA6HfRGeZ9KPlIx6DBXKVeD?=
 =?us-ascii?Q?HXG/pBkL1NysCHjLufn9GxAo76jwPx8bwfKLA/CdSuKIb6xUiRnCvDkEA2gR?=
 =?us-ascii?Q?4QDbVpFMfx9+6wkvvTz7w5R0OIq4MHCXAA1udZ1dF5529HZKGj2ET7jjfhWU?=
 =?us-ascii?Q?TNkEtNV9Au7sVZ0onC3osLkAliL4PSJCNTMMP2oy7nirkaJI4QLoWpudk6bm?=
 =?us-ascii?Q?aWfzaV7wK73e142lpKBQo/yiXUMpj0GOXzyyDRYo6mgG36oqcBk8G+teL36W?=
 =?us-ascii?Q?nbhu/XTH1DNK1pEV2qzPZQE/ROA4z5zejDW9vKn6TV4mlR+dreYqfPuskf1D?=
 =?us-ascii?Q?HVnUhgI7EwMJRACmk8/X1Pf/kr09sjCYe2xOix/+V/9hMQh9ENOWWe4pLpEE?=
 =?us-ascii?Q?eK8dxFDQiHTvj2bQaK0gb5Jeq61mTLfUVjbFYgsC8xNLTvMZOYeH2lelMm70?=
 =?us-ascii?Q?lb1rlTWcQ7tHkUL4PVCSoAeRPxo4daB3F36bQ4zOtkrinS6kQI5/I2ikjnCu?=
 =?us-ascii?Q?X8mdX8nLnYKDJhwabCy5DgPT42URA9jS7sEP20q/jDZ+5TqqUCFk1juAM+4T?=
 =?us-ascii?Q?03t+uvt3UvbLogPxG6Sqny8wHJB85qWQaN5d4+GYHPk7fC0fBMHlyoAPZrkI?=
 =?us-ascii?Q?hstQ0IRIgT33en6Gpx1WlBTqnleb/6bYbvANkpupKbliwtNSbZINizGMXci9?=
 =?us-ascii?Q?PEOMByYU7zSpEhEAdyV9tsvk+pwv2eegaOb9h8iVjNRPN3pv91+xqjKURDE9?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8425332-fcdd-46f9-ab84-08dbc88f38ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 06:16:06.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l15nobvezZHSEBYKg0U3/rh71h1SuxFeEXEJ742XxLiv+Y1z2+PP3JCEyU8RTv8ttpiDtpA4yt5fBk6O8RR7Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 4800de5cd505a9ec00f61a9c0d44ebef79d156e8 ("dyndbg: drop _ddebug.site member")
https://github.com/jimc/linux.git dd-kitchen-sink

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310090909.cb63dd5e-oliver.sang@intel.com


[   41.276917][    T1] signal: max sigframe size: 1760
[   41.277486][    T1] rcu: Hierarchical SRCU implementation.
[   41.278185][    T1] rcu: 	Max phase no-delay instances is 1000.
[   41.280772][    T1] dyndbg: di.num_sites:19313 != di.num_descs:14485
[   41.281332][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[   41.282179][    T1] #PF: supervisor read access in kernel mode
[   41.282886][    T1] #PF: error_code(0x0000) - not-present page
[   41.283602][    T1] *pde = 00000000
[   41.284063][    T1] Oops: 0000 [#1] PREEMPT SMP
[   41.284649][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc3-00035-g4800de5cd505 #1 f8475d0cc4ef27da86708ed4446a0eaec1ab739e
[ 41.285183][ T1] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 41.285183][ T1] Code: 8b 75 f8 89 d8 8b 5d f4 8b 7d fc 89 ec 5d 31 d2 31 c9 e9 de bf 04 00 66 90 55 89 e5 83 ec 08 89 75 f8 89 c6 89 7d fc 89 d7 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 8b 75 f8 8b 7d fc 89
All code
========
   0:	8b 75 f8             	mov    -0x8(%rbp),%esi
   3:	89 d8                	mov    %ebx,%eax
   5:	8b 5d f4             	mov    -0xc(%rbp),%ebx
   8:	8b 7d fc             	mov    -0x4(%rbp),%edi
   b:	89 ec                	mov    %ebp,%esp
   d:	5d                   	pop    %rbp
   e:	31 d2                	xor    %edx,%edx
  10:	31 c9                	xor    %ecx,%ecx
  12:	e9 de bf 04 00       	jmp    0x4bff5
  17:	66 90                	xchg   %ax,%ax
  19:	55                   	push   %rbp
  1a:	89 e5                	mov    %esp,%ebp
  1c:	83 ec 08             	sub    $0x8,%esp
  1f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  22:	89 c6                	mov    %eax,%esi
  24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  27:	89 d7                	mov    %edx,%edi
  29:	ac                   	lods   %ds:(%rsi),%al
  2a:*	ae                   	scas   %es:(%rdi),%al		<-- trapping instruction
  2b:	75 08                	jne    0x35
  2d:	84 c0                	test   %al,%al
  2f:	75 f8                	jne    0x29
  31:	31 c0                	xor    %eax,%eax
  33:	eb 04                	jmp    0x39
  35:	19 c0                	sbb    %eax,%eax
  37:	0c 01                	or     $0x1,%al
  39:	8b 75 f8             	mov    -0x8(%rbp),%esi
  3c:	8b 7d fc             	mov    -0x4(%rbp),%edi
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	ae                   	scas   %es:(%rdi),%al
   1:	75 08                	jne    0xb
   3:	84 c0                	test   %al,%al
   5:	75 f8                	jne    0xffffffffffffffff
   7:	31 c0                	xor    %eax,%eax
   9:	eb 04                	jmp    0xf
   b:	19 c0                	sbb    %eax,%eax
   d:	0c 01                	or     $0x1,%al
   f:	8b 75 f8             	mov    -0x8(%rbp),%esi
  12:	8b 7d fc             	mov    -0x4(%rbp),%edi
  15:	89                   	.byte 0x89
[   41.285183][    T1] EAX: d1ad926d EBX: d2297504 ECX: 00000000 EDX: 00000000
[   41.285183][    T1] ESI: d1ad92f2 EDI: 00000000 EBP: c0287e8c ESP: c0287e84
[   41.285183][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[   41.285183][    T1] CR0: 80050033 CR2: 00000000 CR3: 125a9000 CR4: 00040690
[   41.285183][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   41.285183][    T1] DR6: fffe0ff0 DR7: 00000400
[   41.285183][    T1] Call Trace:
[ 41.285183][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 41.285183][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 41.285183][ T1] ? oops_enter (kernel/panic.c:567 kernel/panic.c:625) 
[ 41.285183][ T1] ? page_fault_oops (arch/x86/mm/fault.c:707) 
[ 41.285183][ T1] ? kernelmode_fixup_or_oops+0xa0/0x108 
[ 41.285183][ T1] ? __bad_area_nosemaphore+0x147/0x278 
[ 41.285183][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:867) 
[ 41.285183][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1476) 
[ 41.285183][ T1] ? rcu_is_watching (kernel/rcu/tree.c:702 (discriminator 1)) 
[ 41.285183][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1513 arch/x86/mm/fault.c:1561) 
[ 41.285183][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 41.285183][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1049) 
[ 41.285183][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 41.285183][ T1] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 41.285183][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 41.285183][ T1] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 41.285183][ T1] dynamic_debug_init (lib/dynamic_debug.c:1698) 
[ 41.285183][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1666) 
[ 41.285183][ T1] ? rest_init (init/main.c:1429) 
[ 41.285183][ T1] do_one_initcall (init/main.c:1232) 
[ 41.285183][ T1] ? call_rcu_tasks_generic (include/linux/rcupdate.h:780 kernel/rcu/tasks.h:377) 
[ 41.285183][ T1] ? rest_init (init/main.c:1429) 
[ 41.285183][ T1] kernel_init_freeable (init/main.c:1337 init/main.c:1537) 
[ 41.285183][ T1] kernel_init (init/main.c:1439) 
[ 41.285183][ T1] ? schedule_tail (kernel/sched/core.c:5318) 
[ 41.285183][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 41.285183][ T1] ? rest_init (init/main.c:1429) 
[ 41.285183][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 41.285183][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[   41.285183][    T1] Modules linked in:
[   41.285183][    T1] CR2: 0000000000000000
[   41.285183][    T1] ---[ end trace 0000000000000000 ]---
[ 41.285183][ T1] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 41.285183][ T1] Code: 8b 75 f8 89 d8 8b 5d f4 8b 7d fc 89 ec 5d 31 d2 31 c9 e9 de bf 04 00 66 90 55 89 e5 83 ec 08 89 75 f8 89 c6 89 7d fc 89 d7 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 8b 75 f8 8b 7d fc 89
All code
========
   0:	8b 75 f8             	mov    -0x8(%rbp),%esi
   3:	89 d8                	mov    %ebx,%eax
   5:	8b 5d f4             	mov    -0xc(%rbp),%ebx
   8:	8b 7d fc             	mov    -0x4(%rbp),%edi
   b:	89 ec                	mov    %ebp,%esp
   d:	5d                   	pop    %rbp
   e:	31 d2                	xor    %edx,%edx
  10:	31 c9                	xor    %ecx,%ecx
  12:	e9 de bf 04 00       	jmp    0x4bff5
  17:	66 90                	xchg   %ax,%ax
  19:	55                   	push   %rbp
  1a:	89 e5                	mov    %esp,%ebp
  1c:	83 ec 08             	sub    $0x8,%esp
  1f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  22:	89 c6                	mov    %eax,%esi
  24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  27:	89 d7                	mov    %edx,%edi
  29:	ac                   	lods   %ds:(%rsi),%al
  2a:*	ae                   	scas   %es:(%rdi),%al		<-- trapping instruction
  2b:	75 08                	jne    0x35
  2d:	84 c0                	test   %al,%al
  2f:	75 f8                	jne    0x29
  31:	31 c0                	xor    %eax,%eax
  33:	eb 04                	jmp    0x39
  35:	19 c0                	sbb    %eax,%eax
  37:	0c 01                	or     $0x1,%al
  39:	8b 75 f8             	mov    -0x8(%rbp),%esi
  3c:	8b 7d fc             	mov    -0x4(%rbp),%edi
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	ae                   	scas   %es:(%rdi),%al
   1:	75 08                	jne    0xb
   3:	84 c0                	test   %al,%al
   5:	75 f8                	jne    0xffffffffffffffff
   7:	31 c0                	xor    %eax,%eax
   9:	eb 04                	jmp    0xf
   b:	19 c0                	sbb    %eax,%eax
   d:	0c 01                	or     $0x1,%al
   f:	8b 75 f8             	mov    -0x8(%rbp),%esi
  12:	8b 7d fc             	mov    -0x4(%rbp),%edi
  15:	89                   	.byte 0x89



we also observed parent crash at the same position like below:


[    1.513152][    T1] signal: max sigframe size: 1760
[    1.514116][    T1] rcu: Hierarchical SRCU implementation.
[    1.514840][    T1] rcu:     Max phase no-delay instances is 1000.
[    1.517930][    T1] ------------[ cut here ]------------
[    1.518640][    T1] kernel BUG at lib/dynamic_debug.c:1670!
[    1.519453][    T1] invalid opcode: 0000 [#1] PREEMPT SMP
[    1.520200][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc3-00034-g865080844494 #1 cb7bf5f3075e829952fe3d71614b0ccb0a823c5f
[    1.521100][    T1] EIP: dynamic_debug_init+0x2e0/0x330
[    1.521100][    T1] Code: ff e9 da fe ff ff 8d 74 26 00 c7 04 24 d4 86 8d cd e8 50 e0 b9 fc 8b 45 b8 83 c4 54 5b 5e 5f 5d 31 d2 31 c9 e9 e5 de 6a fe 90 <0f>
 0b b8 80 64 ff cd e8 f0 ae 1c fd c7 04 24 10 87 8d cd e8 24 e0
[    1.521100][    T1] EAX: 555594bd EBX: ce375a60 ECX: 0000000b EDX: 00002f8e
[    1.521100][    T1] ESI: cca11134 EDI: 00000003 EBP: c0287ef4 ESP: c0287e94
[    1.521100][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010287
[    1.521100][    T1] CR0: 80050033 CR2: ffd38000 CR3: 0e589000 CR4: 00040690
[    1.521100][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    1.521100][    T1] DR6: fffe0ff0 DR7: 00000400
[    1.521100][    T1] Call Trace:
[    1.521100][    T1]  ? show_regs+0x82/0x94
[    1.521100][    T1]  ? die+0x2f/0x9c
[    1.521100][    T1]  ? atomic_notifier_call_chain+0x7f/0x114
[    1.521100][    T1]  ? do_trap+0x95/0x124
[    1.521100][    T1]  ? do_error_trap+0x6c/0x108
[    1.521100][    T1]  ? dynamic_debug_init+0x2e0/0x330
[    1.521100][    T1]  ? rest_init+0x184/0x184
[    1.521100][    T1]  ? exc_overflow+0x5c/0x5c
[    1.521100][    T1]  ? exc_invalid_op+0x68/0x84
[    1.521100][    T1]  ? dynamic_debug_init+0x2e0/0x330
[    1.521100][    T1]  ? dynamic_debug_init_control+0x94/0x94
[    1.521100][    T1]  ? handle_exception+0x11e/0x11e
[    1.521100][    T1]  ? dynamic_debug_init_control+0x94/0x94
[    1.521100][    T1]  ? rest_init+0x184/0x184
[    1.521100][    T1]  ? exc_overflow+0x5c/0x5c
[    1.521100][    T1]  ? dynamic_debug_init+0x2e0/0x330
[    1.521100][    T1]  ? exc_overflow+0x5c/0x5c
[    1.521100][    T1]  ? dynamic_debug_init+0x2e0/0x330
[    1.521100][    T1]  ? dynamic_debug_init_control+0x94/0x94
[    1.521100][    T1]  ? rest_init+0x184/0x184
[    1.521100][    T1]  do_one_initcall+0x69/0x3a4
[    1.521100][    T1]  ? call_rcu_tasks_generic+0x199/0x3d8
[    1.521100][    T1]  ? rest_init+0x184/0x184
[    1.521100][    T1]  kernel_init_freeable+0x9c/0x1c0
[    1.521100][    T1]  kernel_init+0x15/0x1dc
[    1.521100][    T1]  ? schedule_tail+0x50/0x6c
[    1.521100][    T1]  ret_from_fork+0x40/0x4c
[    1.521100][    T1]  ? rest_init+0x184/0x184
[    1.521100][    T1]  ret_from_fork_asm+0x12/0x1c
[    1.521100][    T1]  entry_INT80_32+0x10d/0x10d
[    1.521100][    T1] Modules linked in:
[    1.521139][    T1] ---[ end trace 0000000000000000 ]---
[    1.521830][    T1] EIP: dynamic_debug_init+0x2e0/0x330
[    1.522518][    T1] Code: ff e9 da fe ff ff 8d 74 26 00 c7 04 24 d4 86 8d cd e8 50 e0 b9 fc 8b 45 b8 83 c4 54 5b 5e 5f 5d 31 d2 31 c9 e9 e5 de 6a fe 90 <0f>
 0b b8 80 64 ff cd e8 f0 ae 1c fd c7 04 24 10 87 8d cd e8 24 e0
[    1.525078][    T1] EAX: 555594bd EBX: ce375a60 ECX: 0000000b EDX: 00002f8e
[    1.525115][    T1] ESI: cca11134 EDI: 00000003 EBP: c0287ef4 ESP: c0287e94
[    1.526091][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010287
[    1.527087][    T1] CR0: 80050033 CR2: ffd38000 CR3: 0e589000 CR4: 00040690
[    1.527984][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    1.528930][    T1] DR6: fffe0ff0 DR7: 00000400
[    1.529104][    T1] Kernel panic - not syncing: Fatal exception


FYI.


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231009/202310090909.cb63dd5e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

