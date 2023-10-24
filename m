Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C073714B
	for <oe-lkp@lists.linux.dev>; Tue, 24 Oct 2023 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZFBO9My"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698161800; x=1729697800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMFG6kWzF915Q3XTO+JQNqemNCvMb9416BJntUvxE6A=;
  b=QZFBO9Mytd/B+5QnaPERxVq4/bYdcwyYmjF5HCvVkHIFfoSda2Hhfm2N
   belLyG48rRVFe2csJzCQbc1TsEdA7GyTlUDwYUIu9pu0Q2wVESTdiKzek
   alkNf9Cn4G/45iqKboinNtCxMAkbSYTcZC1mHpWOgQo3rIFYgjCyAKzXt
   LrqyIpfzfvDLsJUbqIIgfwVd0pswh/EE3hawH++fxvTuF/aWWntZ17JGv
   pe22IiasDGqtC35PolmPxj+o6OMKOPozjod0OQKJzN3xv74sejv4u9SPK
   tj0IVmK1B/oZUuqWbrU1Km7CDpwzLYF/KtTiVtKOB3RHoQjdt2j/vhoFv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="8644654"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="8644654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902231187"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="902231187"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2023 08:34:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 08:36:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 08:36:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 08:36:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpEQMtLZdKqKS3W11znBQitf+ImS/yj3y95NscVeOUP7vy9frrWBmZP/J9MvNa4aqg/SdGlLCRAQwVfkmVjP2manyTO0BN26rlHDTtLNWv5IJnljBRFbPowM40rxSJmz/xduO/F4/T9+jNUWx6ckNcvADLeO/i2UMsjhKJXcuQ1miogN7e9ui2kgeagx2H51+IGQlcMxmODN8cKjOxY00a2qvPbBP2GnWp9H7kWa9c5pAckj2Fiwu5tBQ1ygmeATIB8VmGPRPky8bwfdiVii3VcSuB3JsrLKNYslIup5cvxMnNw1+K7B1W6GsUFIP/pT9zm9qoiV1AIICzaQH4wf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhuO2P3kHJw8CIzCJP+wYz+9ccOuevTlzgXVz01xZcY=;
 b=Usu2zSR9VDCoWLTcp92/SJ6DjfPE/Ta6t1dcjE4V2fRMN6mRxu6CxaJlNOqHGDFaQzQcmue/aIbvrfQNIHwlO5hn1GATKPCBaOjkIblzRiooawKaJVlvWMVrYLbgxWEIjLyRdG9BPME2boZU0avmfTudGYNULh8JiLJHf/uSQ5t6WdzaASj+DB5IKouHp8Iit2tZyiFyo/Zn+29KlRHSb+LS8VPX05vxUkR+1vOgu/NmK6mHtZY2HPoPUW/3XkRX6iUbdMqx+uSf7Rcmabc2XssH6Zhu3oUZ0xOmMm/gLJ65AfVvCnIg0lhLh+0s+ypfPTRqowhE9PeXZBpnTKn4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 15:36:36 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 15:36:35 +0000
Date: Tue, 24 Oct 2023 23:36:29 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-kitchen-sink] [dyndbg]  689e13e838:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202310242300.11a295ad-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0091.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::31) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7331bf-0ad3-4081-8a63-08dbd4a701ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wa5k31XTPeer+1GVneTrS3nLLJdxxI02KAjo7hiZ4IbJAjBqN7KrVbXoj39Cd89CprYb4s/RZkk4Q7y/45ejEPG8UQpsiwAcP1DS857h7ras2HhAanIPER/mtfC0lAKOUwg1TbLPymeBRlFiqhT1Oki2t+abRRm4bWhl4wnZuk/kBC52/R1khWYhYM8YMZw6NpbGHOIFtOjqexQlmFK+n8lr4eRJCtXVAV/ZFnuWHP1KwzM615coQJSO0LieTPjHF2end/DumWnUEVj/9Di8DCligiGPkg7/7g0rpJg0W1GO1lksvWK3Y9xLrnc6322sGbl83haQrimSGghdcg0TB5LeDLgKQxQDADmL3gZyf8Op11BksyUBPrl8ptOxNalvLjKvNbEjrRzAxQaR3jF4PaFYH3nbp28EVL0vhiExWaNTYqzvUianUzyb9FWwVjg0NgFBD11zudojiCwYusdMCFOoLCNtSF/65dxmlbpzFhWOIfLXAS+wVZa6ZoKUW4dZ48YlT+QH3evHWl81QtRRbAYyBWBG9+NJ5EeFaKEkuckDTmrKkj7nZHkS428RTZ3y4PoNfLlgQN02NxVb8lsmjbpRzreumv/SEx8pcIRBUKEQ2Od31pQVhkQIqaCw1flM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(36756003)(66556008)(66476007)(83380400001)(966005)(66946007)(41300700001)(316002)(6916009)(6486002)(478600001)(86362001)(2906002)(82960400001)(8936002)(6512007)(38100700002)(4326008)(8676002)(26005)(6666004)(1076003)(2616005)(6506007)(45080400002)(107886003)(5660300002)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nzzCqU1aQZo4hEl6Q9HUbhpsG0Yld0keryEK3q5T9JfbqOK8OnpLckhf1xq?=
 =?us-ascii?Q?ullZgddtEzQ1iY4msPIGBtHTd0ADnsgpcpykT5szUUQL51Bj6x7zfMcxuNQa?=
 =?us-ascii?Q?djxyJSAri9QItPIQuLinodRXJFropncpMq0C/fQ1fKaMPgbqpAvqiGOXNK4B?=
 =?us-ascii?Q?Ckt8PcF7Uhcby9H06V5JWYSjGS3P9KHQpfWvEnFOQGtjYUPkdwzqdHHnU7jm?=
 =?us-ascii?Q?duzXowo1P4VFNkRavrRXOq5hfxomxT3AslW1MDE0gzuFkwYIKyZi/Y6Jshef?=
 =?us-ascii?Q?bY7axjabFe/vR7X3CQNuiqh0hrHW8C3CCzQzfVls51WsBjiV/8JEbjmkiSmN?=
 =?us-ascii?Q?Bl3h5uanUQujSkztgK+sn3izmH7JkKNWAnLNBcZPnN+e/xFthw53yU5LgXFq?=
 =?us-ascii?Q?pHgJr8xUP9vgrJMny4c6GHw+vfpqCWbX3zimeuC01tSY3sjnIs9W7+bRvVn2?=
 =?us-ascii?Q?xDGzQ1AxS0z7a12HYjqqLtOWoeC1+190b4d45LL7cEMik6NQcJKYCnV9myfk?=
 =?us-ascii?Q?077yEMFFR7CBO9CGjdMy+3AYcg7dT+CD52htIzjlZoLHQz0l9jZWqmZmBgQW?=
 =?us-ascii?Q?/MGlW8Gea8GbAtHlShuTRCJxNTP0USLWXrky8YBor6GPkjMMQGCdxiDSVM5I?=
 =?us-ascii?Q?2OzOQoBoc2jc7GqBm55XOmyG1guPEsquMz6n7GA3x0uHrwvUYla2zhhEgGW9?=
 =?us-ascii?Q?rXu5oTnAq36aJYn2eU9T41Hk6PxiKKizaOE/ywN/8orZvcBg8va1zm7H1gU/?=
 =?us-ascii?Q?dBYmAfJRXbpDpJffyhfd/Tnf4tF/ocsc5b1vTS5Z204dl9T6T6qyANx30kAz?=
 =?us-ascii?Q?aSW+ZSNVFTmokyBftizrx/sNDPzEULvOFjhgy5bk6pRKydqURj6GFt2OfB/2?=
 =?us-ascii?Q?yg7I9mfUfZxmE/jgXiBiQL3dGoHjb/6vLDIKTRrS5PQSKtZ0ACzMqISqHsG2?=
 =?us-ascii?Q?VzgoALLm/pdiIZ7w4ZjlSM1pyJ9WVadq7f0kl4/A4zdRLO/5gTDJYVPnZ89V?=
 =?us-ascii?Q?2KNwL0ff4AXSKsXh0CMKassmyLzgxPiR42CVZ6IbhUmsc9+AzdnI49nSLa1/?=
 =?us-ascii?Q?UkuXv/MVtSN+AsgCOuMumwr3NL5Y6b6RrFa8TRLHA4TliEYnDhWNx+pZsoZc?=
 =?us-ascii?Q?6smhlfbKOzoekvkPvZz3fazCZcM3sjm/xiTo8PRsY6Pdbq3gfYpL/ugKQC/g?=
 =?us-ascii?Q?KeXi3NEzk2M0XgtdDztHTTcNvjJz+j9CTjhitkP252EFPrQIsgHmYW4TXPj8?=
 =?us-ascii?Q?a/U0600l9KxJitMfMOTywJmi8nlYLz6mRDknY4A4hbqozUcPX/tSpSxN3DrQ?=
 =?us-ascii?Q?LKtoBqz/IEImIoWP9IVfGhrWcsMv+T5Xen7qkJTKcVWcB++CQIRgL5uFufvk?=
 =?us-ascii?Q?08R4JDug8y924CCBu9nMTtCvhvZ1oEvRuWlY2jH0SmUmrwyTcr6OYq2alBF/?=
 =?us-ascii?Q?vClS2VXgwQMechixKn4k+Foe3P0veTw0STIGl6HZcSQuA0Bi9NcbpR3Llaz5?=
 =?us-ascii?Q?Nn3zN1bUc/M4rzVpuceSrCFkA80R8kI6GV+QIs6GRh2J7PvlmHXM9C3bTt09?=
 =?us-ascii?Q?keD7S7uhQyHb74IEAeIMHBqXLj6MsH67kaxRHctdPW/+mCk7uQU9dKZoG+2E?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7331bf-0ad3-4081-8a63-08dbd4a701ab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 15:36:35.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIo8773HDpOdzzhS3FBl2bk9NYUT3Q3jRrdukWP7x0Z85Qxyzi38MENhLmyMskS+QYVwQCfQWihc9dumpiYLcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
X-OriginatorOrg: intel.com


hi, Jim Cromie,

we reported similar
"[jimc:dd-shrink-3b] [dyndbg]  ea66e05042: BUG:kernel_NULL_pointer_dereference,address"
in
https://lore.kernel.org/all/202310201027.471f187c-oliver.sang@intel.com/
when this commit is on another branch. FYI.


Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 689e13e8383a5a1bfacabe62e1e8080e96128405 ("dyndbg: add site_*() macros to avoid using _ddebug.site")
https://github.com/jimc/linux.git dd-kitchen-sink

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 0f2bbac497 | 689e13e838 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 6          | 0          |
| boot_failures                               | 0          | 7          |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 7          |
| Oops:#[##]                                  | 0          | 7          |
| EIP:strcmp                                  | 0          | 7          |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 7          |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310242300.11a295ad-oliver.sang@intel.com


[    6.329007][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    6.329085][    T1] #PF: supervisor read access in kernel mode
[    6.329085][    T1] #PF: error_code(0x0000) - not-present page
[    6.329085][    T1] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
[    6.329085][    T1] Oops: 0000 [#1] PREEMPT SMP PTI
[    6.329085][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc6-00030-g689e13e8383a #1
[    6.329085][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 6.329085][ T1] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 6.329085][ T1] Code: c0 f2 ae 4f 89 d1 49 78 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d c3 66 90 3e 8d 74 26 00 55 89 e5 57 89 d7 56 89 c6 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 66 90 3e
All code
========
   0:	c0 f2 ae             	shl    $0xae,%dl
   3:	4f 89 d1             	rex.WRXB mov %r10,%r9
   6:	49 78 06             	rex.WB js 0xf
   9:	ac                   	lods   %ds:(%rsi),%al
   a:	aa                   	stos   %al,%es:(%rdi)
   b:	84 c0                	test   %al,%al
   d:	75 f7                	jne    0x6
   f:	31 c0                	xor    %eax,%eax
  11:	aa                   	stos   %al,%es:(%rdi)
  12:	89 d8                	mov    %ebx,%eax
  14:	5b                   	pop    %rbx
  15:	5e                   	pop    %rsi
  16:	5f                   	pop    %rdi
  17:	5d                   	pop    %rbp
  18:	c3                   	ret
  19:	66 90                	xchg   %ax,%ax
  1b:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  20:	55                   	push   %rbp
  21:	89 e5                	mov    %esp,%ebp
  23:	57                   	push   %rdi
  24:	89 d7                	mov    %edx,%edi
  26:	56                   	push   %rsi
  27:	89 c6                	mov    %eax,%esi
  29:	ac                   	lods   %ds:(%rsi),%al
  2a:*	ae                   	scas   %es:(%rdi),%al		<-- trapping instruction
  2b:	75 08                	jne    0x35
  2d:	84 c0                	test   %al,%al
  2f:	75 f8                	jne    0x29
  31:	31 c0                	xor    %eax,%eax
  33:	eb 04                	jmp    0x39
  35:	19 c0                	sbb    %eax,%eax
  37:	0c 01                	or     $0x1,%al
  39:	5e                   	pop    %rsi
  3a:	5f                   	pop    %rdi
  3b:	5d                   	pop    %rbp
  3c:	c3                   	ret
  3d:	66 90                	xchg   %ax,%ax
  3f:	3e                   	ds

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
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5d                   	pop    %rbp
  12:	c3                   	ret
  13:	66 90                	xchg   %ax,%ax
  15:	3e                   	ds
[    6.329085][    T1] EAX: c8db5e6d EBX: c9385344 ECX: 00000000 EDX: 00000000
[    6.329085][    T1] ESI: c8db5e49 EDI: 00000000 EBP: c1245ebc ESP: c1245eb4
[    6.329085][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010297
[    6.329085][    T1] CR0: 80050033 CR2: 00000000 CR3: 094d4000 CR4: 000406f0
[    6.329085][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    6.329085][    T1] DR6: fffe0ff0 DR7: 00000400
[    6.329085][    T1] Call Trace:
[ 6.329085][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479 arch/x86/kernel/dumpstack.c:465) 
[ 6.329085][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 6.329085][ T1] ? page_fault_oops (arch/x86/mm/fault.c:707) 
[ 6.329085][ T1] ? kernelmode_fixup_or_oops+0x73/0xc0 
[ 6.329085][ T1] ? __bad_area_nosemaphore+0xe0/0x1d8 
[ 6.329085][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:867) 
[ 6.329085][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1476) 
[ 6.329085][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:72 arch/x86/mm/fault.c:1513 arch/x86/mm/fault.c:1561) 
[ 6.329085][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 6.329085][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1056) 
[ 6.329085][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 6.329085][ T1] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 6.329085][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 6.329085][ T1] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 6.329085][ T1] dynamic_debug_init (lib/dynamic_debug.c:1692) 
[ 6.329085][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1649) 
[ 6.329085][ T1] do_one_initcall (init/main.c:1232) 
[ 6.329085][ T1] kernel_init_freeable (init/main.c:1337 init/main.c:1537) 
[ 6.329085][ T1] ? rest_init (init/main.c:1429) 
[ 6.329085][ T1] kernel_init (init/main.c:1439) 
[ 6.329085][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 6.329085][ T1] ? rest_init (init/main.c:1429) 
[ 6.329085][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 6.329085][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[    6.329085][    T1] Modules linked in:
[    6.329085][    T1] CR2: 0000000000000000
[    6.329085][    T1] ---[ end trace 0000000000000000 ]---
[ 6.329085][ T1] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 6.329085][ T1] Code: c0 f2 ae 4f 89 d1 49 78 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d c3 66 90 3e 8d 74 26 00 55 89 e5 57 89 d7 56 89 c6 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 66 90 3e
All code
========
   0:	c0 f2 ae             	shl    $0xae,%dl
   3:	4f 89 d1             	rex.WRXB mov %r10,%r9
   6:	49 78 06             	rex.WB js 0xf
   9:	ac                   	lods   %ds:(%rsi),%al
   a:	aa                   	stos   %al,%es:(%rdi)
   b:	84 c0                	test   %al,%al
   d:	75 f7                	jne    0x6
   f:	31 c0                	xor    %eax,%eax
  11:	aa                   	stos   %al,%es:(%rdi)
  12:	89 d8                	mov    %ebx,%eax
  14:	5b                   	pop    %rbx
  15:	5e                   	pop    %rsi
  16:	5f                   	pop    %rdi
  17:	5d                   	pop    %rbp
  18:	c3                   	ret
  19:	66 90                	xchg   %ax,%ax
  1b:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  20:	55                   	push   %rbp
  21:	89 e5                	mov    %esp,%ebp
  23:	57                   	push   %rdi
  24:	89 d7                	mov    %edx,%edi
  26:	56                   	push   %rsi
  27:	89 c6                	mov    %eax,%esi
  29:	ac                   	lods   %ds:(%rsi),%al
  2a:*	ae                   	scas   %es:(%rdi),%al		<-- trapping instruction
  2b:	75 08                	jne    0x35
  2d:	84 c0                	test   %al,%al
  2f:	75 f8                	jne    0x29
  31:	31 c0                	xor    %eax,%eax
  33:	eb 04                	jmp    0x39
  35:	19 c0                	sbb    %eax,%eax
  37:	0c 01                	or     $0x1,%al
  39:	5e                   	pop    %rsi
  3a:	5f                   	pop    %rdi
  3b:	5d                   	pop    %rbp
  3c:	c3                   	ret
  3d:	66 90                	xchg   %ax,%ax
  3f:	3e                   	ds

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
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5d                   	pop    %rbp
  12:	c3                   	ret
  13:	66 90                	xchg   %ax,%ax
  15:	3e                   	ds


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231024/202310242300.11a295ad-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

