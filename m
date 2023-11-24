Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65639621
	for <oe-lkp@lists.linux.dev>; Fri, 24 Nov 2023 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClVDR+lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700789634; x=1732325634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QR7hEh8KTAGiRmab7UXOYSjdlOX0DUp9Z9tz54l1aI=;
  b=ClVDR+lS1DSZdj/kWMQJlAwJyezO5cvFxuljCVF0jTctrjK/RedGSSuP
   OHsETuN9TJ3rFJveA9YmOzuX96jPhW8dXzMVoDl2jXuUg3s353YHeL0b4
   IBc6EjDVzBKepg9YNF9qZigSXjw4sUIzaXreG9fJdlCnlxjAYOMMX8Wbc
   8ytmyIDoAxOe4C74o4pNKs1fqDcYLBgy5VKOJGF/JzzTkjDhMvL2orpOp
   ZwKdduzuyI55fTUFHm0XyHO62/t3/ZoGkLdCx8+oo4Kdq39caiK5Qix7K
   d/i6OcMDWlyFJZLRRIsnfp7o3D5qls6KcT3/QpCLic6CdGNbhbUZ9j3gr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389502154"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="389502154"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 17:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098945426"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="1098945426"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 17:33:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 17:33:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 17:33:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 17:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgSqA01rQji/86HUdITvTgHkV6FKI5o+MCbbHDNFKdtjNb15H7hLc+Z9IJD0mC06GkwnNKDXMbIZ3d/POWz+4Wn0iI5/BOM0kJRb4/gYQspIssE1Z/e0tiKrW8AsY8xyy9HmVHGAaPd8SYbf496lESf5ouzIT1J/WKu5Kr69hjZl5uE6tiK0FWi1Y5CphGIJNx+NSlSMtIK0+UScvp6FWrQkHQAO94ztgTaeBhj5RWnzMq2WdqR3Ddtk6FBlFc4N/sUmytbSH/7Mqv3BS5FOoWiN3ZVOgOuQjXeG/h+/fc9hEC4oJClJ3kkIBoPYqeuuVHe7M2iShBK2WIGs40M5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAbQGxNddzNvTyv0rBk/NfFjqWr7/P10mR/Dbr4f67I=;
 b=gt+SbKR8LPrvaGqDMxmT7MY5LelZ/kLUoOtI4kXITMIT5QnwcLJsOJ5rl244upBTysXthkJOICa4guvHVnoVHoYXkvEtMcf9VfEGeKdvzBG5XeLepSCqwi5zRbjIomFdBS9GLQbymjpvMMQmhjkWakBDOegPbHTTHJyvcwyB+utUNHDb7HUpGD34ZnyM0lTlQnZ1PuIVHMPhUAU/2a3W8vIFEo56Anz8zVG2v0PShOiHy5+29mRrjxeylBa6l9XE9qgC6IFnnEpNz6RCK1hvq+e4ZPUDUWBcBCLQHiSPLVNFeEStbtb5eUlpKM7F3l9Z1f6pm3/c1dOD9NOK+/EXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 01:33:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7002.027; Fri, 24 Nov 2023
 01:33:50 +0000
Date: Fri, 24 Nov 2023 09:33:44 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-trc-11b] [dyndbg]  c378d2f0ff:
 kernel_BUG_at_lib/dynamic_debug.c
Message-ID: <202311231614.aa339b71-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0185.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 17743516-9802-415b-0a30-08dbec8d6966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBsRjVZs0TmNMke4rGyNmj2iYxtjHRT72Ez5+Adgb1UCAz3rJKHaD3aCCICF/FDGyfltW9DAqq5BcbyYLw6YT/tg2ztuiZX267sj88zuC2jo/JyK+pf5QJ0ZnEES7p03T1QdwUxU7rJB+XJ0lCT1YrnOOpT8d5H+lYxc7wFZ4TyjSIeLCw/ywrLH2jSsl/DpwN4XykDdnoODgiD8EkzJuXbRFupId6cv0EI9M3kiW9DP5vyafpAS6xARDUuYml3QlMzO6pnvRvEzN772yGr4QLUuu21lJTS5WsVAJmCJpY3qc/ywaS2IR5gjN7PmdvipF+OnTmAnZOgbSkIxXgCDUy2V8Sg6JytIJFssuhJ7mMQk0Uzru/lbZNqbJWiuuNa2XVahlzzZNKijA4d/VhWj4Gz8osoXUj09KvDUFry+2qULHTYrNEo5tBrwjUUIX/A6vh71mhGHt3ErGHn4XI7zLJnFuiuYSJkNBlbJ2jICR/d2xIFKzN5KNL5+37bad8aFYPzO7IEn+1tXwGeL1Jc6IwD34tEOMm5bfkL3053iZdSkULN4LyVhw33OgA7RBl9jWY3NoJIJApw21OBgEQA23A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(83380400001)(966005)(6486002)(478600001)(45080400002)(6666004)(316002)(6916009)(66946007)(66556008)(66476007)(6512007)(6506007)(82960400001)(36756003)(4326008)(8676002)(8936002)(5660300002)(2906002)(107886003)(1076003)(26005)(2616005)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1OnAJo5Nyvks/3yQ5xuwDxn/obe/H/9s5zZGaZLELyUpwYNs/GICjZif7Y/+?=
 =?us-ascii?Q?t8OJSBCi0vJx5pCjdFGvz3v/MQAwOkRzNO9M+TypNWBgokXuGtUwmqgdFezl?=
 =?us-ascii?Q?BVxVwjLM81YIxwSIVX4S0CVeT4HqqUp8AI73S+EX9Oktw1CbY6BsSutX2Rs6?=
 =?us-ascii?Q?6RWkD8+0VqrtDbBtCAJ/QkTY0V5Xso6a52Ak5pxaUXS6v8tQBbqcpYzLLsSF?=
 =?us-ascii?Q?nAZ0JXYre+CyBqFYQYcb3OOIdm5lfbQlGYk60XUwQebBAIdwWl7mC/PUxX2f?=
 =?us-ascii?Q?xp6rDAvBO705F2Y+F59tAJMXB6zHyJOWXkWzhPEasKtWMCRzhuHYbSmP5fwf?=
 =?us-ascii?Q?yLujSjC+fNgJa27RtUh1gzlxfjlCwOVE2wTgby3xW1mmqFWxaUl0WaCa0ams?=
 =?us-ascii?Q?Q8g61BG38ZZPSHimlme7+1ind4MjJtjsFy0eoiWRhFkaxEXidGxEa8n/f7BV?=
 =?us-ascii?Q?p+h6XTsBF38CkgSt5mcC/v+kh7JmKUJQKRmMsbv4WRbyEXrRbAZKuYf6rDcQ?=
 =?us-ascii?Q?xC5icrUN0UAzAPl+gdPFGyUfYUyqR7uTBaYQa5LUd8BFsChKwslf5WdzsBGu?=
 =?us-ascii?Q?KfGRUN5tMthYVck8SyQpnmisa88GOR/5umgXJvDoYJZ+jLz8qqdpDrjiTtRp?=
 =?us-ascii?Q?41dEJ+S+JfuEYmNgCHYRdSESPg2qWCTxdGWk3DQ0Vvt+x+5/+SGmP1KgRYpx?=
 =?us-ascii?Q?JdJAOE8ZW3Yq2yaANIbvMY/zj99PfLgVoNjmru6lhejt9wmnzVAQax15GINU?=
 =?us-ascii?Q?mL2s/MX6rPkmtl/qWAYkcCeCNfOWYs6YSpHQB+Iy20US2Bm01Z/51psmdZQm?=
 =?us-ascii?Q?hAg7e1pqolWjCeX3Aflcle/7olTXpbo+gGUI8616xjyPS1eXxFWDS86Zt0NA?=
 =?us-ascii?Q?KCIwo7ioMzZnmCb6fvzUZ718hgG/IRS3/ZFUG9zNq4cnwMDEdVGOcj3Vewnf?=
 =?us-ascii?Q?VMsbVGs5HsUv5CJsosZCeiTzGIEpUYrtF21rZHYveHPpAwMKkXfUc/j8mI1K?=
 =?us-ascii?Q?wVsIFrQgYi9JosVIkMAky+nDvf4j8h0HBIJY03q5futIgN1wOo10dAg1Cev1?=
 =?us-ascii?Q?AlkvICOPIecmdrpxrzrRviYbSnIKxUSOaP+voHTcbKfqe+h5l3PySbOy+Psu?=
 =?us-ascii?Q?b2vqdx5qVanC1fkmmb1ncFpXS8Xe65EyqxrFeVGxe/PYgiVgrqgoeSb48fhj?=
 =?us-ascii?Q?x3htj6InKbwDew+ew+4EfJBl1kgtK/ZjyzSi6Bii8aaPh0jTqVtkEOEMQUA7?=
 =?us-ascii?Q?UgwhBD/yS4ioZfRjcJvG0T9f/bPhkivhOZVTFSvN3GNWuNve83SWTAxq5sIa?=
 =?us-ascii?Q?GEmQr+u3JeQJMzfUiJsJSKoDWYXb0F5+VCt94orE6cX2BtOBvLaP4AHvb8lQ?=
 =?us-ascii?Q?PlJO4HRbQt15e7bsp1VHq2j2CPoH2gUl4Ngzz0nMDj9KQBn48QB5/3T3o8rh?=
 =?us-ascii?Q?CJCmnG9TNWmDDPdvofs+srJbtXycg1QT1MGX0bEt5uu0wzNzaAxXSDWmiK2H?=
 =?us-ascii?Q?La8Bwllw+9LKMUBMPv3XqExbzeZR/LxsL2Wa1aFxTp2uQHX5LnxtQ+TSSbFE?=
 =?us-ascii?Q?Xg2qh0ggROkgkmQ4dCM6d6KO2cuRCko5A4YvJl0DApEyf8eeud/h+7bI3NAa?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17743516-9802-415b-0a30-08dbec8d6966
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 01:33:50.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Of5EHmGKVDlvDBoxcinjeAJ/StqpqNsdjD2YwNQWWpAIxrSUlDGeSt4waUIF+xG4Vcdakov7ddLLVgExGfiuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_lib/dynamic_debug.c" on:

commit: c378d2f0ffa86c0c8d6191613977b9efdfe9bac7 ("dyndbg: add 2nd cursor to init-fn")
https://github.com/jimc/linux.git dd-trc-11b

in testcase: boot

compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------+------------+------------+
|                                                    | 2462125ff1 | c378d2f0ff |
+----------------------------------------------------+------------+------------+
| kernel_BUG_at_lib/dynamic_debug.c                  | 0          | 21         |
| invalid_opcode:#[##]                               | 0          | 21         |
| EIP:dynamic_debug_init                             | 0          | 21         |
| Kernel_panic-not_syncing:Fatal_exception           | 0          | 21         |
+----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311231614.aa339b71-oliver.sang@intel.com


[    1.026602][    T1] ------------[ cut here ]------------
[    1.027345][    T1] kernel BUG at lib/dynamic_debug.c:1509!
[    1.027633][    T1] invalid opcode: 0000 [#1] PREEMPT SMP
[    1.028378][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc3-00027-gc378d2f0ffa8 #1 0e1f5907193d690f063eefb6f69ae4fab94dd986
[ 1.030049][ T1] EIP: dynamic_debug_init (lib/dynamic_debug.c:1509 (discriminator 1)) 
[ 1.030797][ T1] Code: fe ff ff 8d b4 26 00 00 00 00 c7 04 24 54 91 6d d6 e8 50 c0 b9 fc 8b 45 bc 83 c4 50 5b 5e 5f 5d 31 d2 31 c9 e9 25 ba 6a fe 90 <0f> 0b b8 80 84 df d6 e8 20 8a 1c fd c7 04 24 90 91 6d d6 e8 24 c0
All code
========
   0:	fe                   	(bad)
   1:	ff                   	(bad)
   2:	ff 8d b4 26 00 00    	decl   0x26b4(%rbp)
   8:	00 00                	add    %al,(%rax)
   a:	c7 04 24 54 91 6d d6 	movl   $0xd66d9154,(%rsp)
  11:	e8 50 c0 b9 fc       	call   0xfffffffffcb9c066
  16:	8b 45 bc             	mov    -0x44(%rbp),%eax
  19:	83 c4 50             	add    $0x50,%esp
  1c:	5b                   	pop    %rbx
  1d:	5e                   	pop    %rsi
  1e:	5f                   	pop    %rdi
  1f:	5d                   	pop    %rbp
  20:	31 d2                	xor    %edx,%edx
  22:	31 c9                	xor    %ecx,%ecx
  24:	e9 25 ba 6a fe       	jmp    0xfffffffffe6aba4e
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 80 84 df d6       	mov    $0xd6df8480,%eax
  31:	e8 20 8a 1c fd       	call   0xfffffffffd1c8a56
  36:	c7 04 24 90 91 6d d6 	movl   $0xd66d9190,(%rsp)
  3d:	e8                   	.byte 0xe8
  3e:	24 c0                	and    $0xc0,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 80 84 df d6       	mov    $0xd6df8480,%eax
   7:	e8 20 8a 1c fd       	call   0xfffffffffd1c8a2c
   c:	c7 04 24 90 91 6d d6 	movl   $0xd66d9190,(%rsp)
  13:	e8                   	.byte 0xe8
  14:	24 c0                	and    $0xc0,%al
[    1.031540][    T1] EAX: 555594bd EBX: d7177a60 ECX: 0000000b EDX: 00002f8e
[    1.031540][    T1] ESI: 00000003 EDI: 00000000 EBP: c0287ef4 ESP: c0287e98
[    1.031540][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010287
[    1.031540][    T1] CR0: 80050033 CR2: ffd38000 CR3: 1738b000 CR4: 00040690
[    1.031540][    T1] Call Trace:
[ 1.031540][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 1.031540][ T1] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 1.031540][ T1] ? atomic_notifier_call_chain (kernel/notifier.c:235) 
[ 1.031540][ T1] ? do_trap (arch/x86/kernel/traps.c:112 arch/x86/kernel/traps.c:153) 
[ 1.031540][ T1] ? do_error_trap (arch/x86/include/asm/traps.h:59 arch/x86/kernel/traps.c:174) 
[ 1.031540][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1509 (discriminator 1)) 
[ 1.031540][ T1] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 1.031540][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:265) 
[ 1.031540][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1509 (discriminator 1)) 
[ 1.031540][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1504) 
[ 1.031540][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1049) 
[ 1.031540][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1504) 
[ 1.031540][ T1] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 1.031540][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1509 (discriminator 1)) 
[ 1.031540][ T1] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 1.031540][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1509 (discriminator 1)) 
[ 1.031540][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1504) 
[ 1.031540][ T1] ? rest_init (init/main.c:1429) 
[ 1.031540][ T1] do_one_initcall (init/main.c:1232) 
[ 1.031540][ T1] ? call_rcu_tasks_generic (include/linux/rcupdate.h:780 kernel/rcu/tasks.h:377) 
[ 1.031540][ T1] ? rest_init (init/main.c:1429) 
[ 1.031540][ T1] kernel_init_freeable (init/main.c:1337 init/main.c:1537) 
[ 1.031540][ T1] kernel_init (init/main.c:1439) 
[ 1.031540][ T1] ? schedule_tail (kernel/sched/core.c:5318) 
[ 1.031540][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 1.031540][ T1] ? rest_init (init/main.c:1429) 
[ 1.031540][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 1.031540][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[    1.031540][    T1] Modules linked in:
[    1.031568][    T1] ---[ end trace 0000000000000000 ]---
[ 1.032312][ T1] EIP: dynamic_debug_init (lib/dynamic_debug.c:1509 (discriminator 1)) 
[ 1.033074][ T1] Code: fe ff ff 8d b4 26 00 00 00 00 c7 04 24 54 91 6d d6 e8 50 c0 b9 fc 8b 45 bc 83 c4 50 5b 5e 5f 5d 31 d2 31 c9 e9 25 ba 6a fe 90 <0f> 0b b8 80 84 df d6 e8 20 8a 1c fd c7 04 24 90 91 6d d6 e8 24 c0
All code
========
   0:	fe                   	(bad)
   1:	ff                   	(bad)
   2:	ff 8d b4 26 00 00    	decl   0x26b4(%rbp)
   8:	00 00                	add    %al,(%rax)
   a:	c7 04 24 54 91 6d d6 	movl   $0xd66d9154,(%rsp)
  11:	e8 50 c0 b9 fc       	call   0xfffffffffcb9c066
  16:	8b 45 bc             	mov    -0x44(%rbp),%eax
  19:	83 c4 50             	add    $0x50,%esp
  1c:	5b                   	pop    %rbx
  1d:	5e                   	pop    %rsi
  1e:	5f                   	pop    %rdi
  1f:	5d                   	pop    %rbp
  20:	31 d2                	xor    %edx,%edx
  22:	31 c9                	xor    %ecx,%ecx
  24:	e9 25 ba 6a fe       	jmp    0xfffffffffe6aba4e
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 80 84 df d6       	mov    $0xd6df8480,%eax
  31:	e8 20 8a 1c fd       	call   0xfffffffffd1c8a56
  36:	c7 04 24 90 91 6d d6 	movl   $0xd66d9190,(%rsp)
  3d:	e8                   	.byte 0xe8
  3e:	24 c0                	and    $0xc0,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 80 84 df d6       	mov    $0xd6df8480,%eax
   7:	e8 20 8a 1c fd       	call   0xfffffffffd1c8a2c
   c:	c7 04 24 90 91 6d d6 	movl   $0xd66d9190,(%rsp)
  13:	e8                   	.byte 0xe8
  14:	24 c0                	and    $0xc0,%al


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231123/202311231614.aa339b71-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

