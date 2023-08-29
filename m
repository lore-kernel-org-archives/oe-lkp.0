Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954E23D2
	for <oe-lkp@lists.linux.dev>; Tue, 29 Aug 2023 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693295986; x=1724831986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Inqgc7fn1Dr1XKZ0bQ4AeNrFVhA0m7EQI7bCvQfgVNM=;
  b=cnETJiXiRXT3aPEyFNz2Fv9aFb5CVdoabimFCIuDjFB4HFAdtqsjf682
   p6ejRCpsw2vcKELbV4uZrqMD1/Efphceljx2dgwxaZeqXXfW9gJTZqFJw
   6UMX9C8Z5+lpVJlA5+1pAO5c/qguBAkpz/79HiMpNp8AM9sLb6CRsDgYu
   f0tlAgD9z8yzZ/MSByLFdW+diXldlef2dLiGDfatPBSDN5HFGSn8/C7oq
   NXwNl6BlrpMME0Kqr9Y3CVD9ttyxajNLYVskwOaew/uLhZXAT6UCKpU0V
   +hMv+0A2WQMOilupMw0AaguAXzG7OXbJX/+0wyytOUejBh+5ILzi+/mk3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441653226"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="441653226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 00:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="828690195"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="828690195"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 00:59:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 00:59:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 00:59:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 00:59:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 00:59:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+4LFeNO13Wz11TM50fa/nLV3114EW8J3vzb2y4SEQmesjFrYIl0kaCMMfwo3UcSFV2fqf3bo7oNYKssVWtYyfvP445v7gPnseuvChamb9tRaCaFZmdb0dGEZemD5Wur5yJmzSUHYtHCC3RHaSrEcseV2IlNfoFkkdCFkol5tzZvkhqMOmBrR8d/EPnPbft+mMrG8wdAW+5teiYTGJERO7mSNI5ecu5Ed+VQ2sn52imvEzY/oYB6QIc+OKrZltMl5ggXlktM+sSHuIpIW1n5VahH+oWpiRTm6ctN3ePvaRwls/6dHayBlrd3f00IiG48+9/6kO3MgbDa2Q8DmagoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImpatpZ8Bisy/Vvp/SQKlAHHvtH4UIhY0pWUhisgKus=;
 b=h0Y+oJICprg2DepHlWcxdtPUOu7AMERtPs8jMSJbWQO8rjdeEpCd5M3fltXnoD0tVyQcCnBJnsHhfDuO0dezgwc7hD1zNW89MNEpQ9RKwlMezetecP9sRJOVtH3ssHkm1HrXFgxIcGoD+9Jv6xRexU48YJzyMqntAI+d2Tg181hCm6Gv7umTbUWOZdsxXAp1X/AekgBzgpOLJIrNjHrGSRrNpfnfhW7+vu3OYq8+rGiF3YTI/WGP8mDYkgi3LPGq/uHBE00F4dpbAhlvw6ejmgzbcdkIDc/efu35gA6PtsixpL/j6q6hRA4h3NbhMIiD9Z+OKIvqxyTpsNMuN/5z9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 07:59:40 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 07:59:40 +0000
Date: Tue, 29 Aug 2023 15:59:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:x86/microcode] [x86/microcode/32] 7f1f6ace4c:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202308291502.2d535a18-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ed5439-2d8b-4874-212d-08dba865e59d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J11WdhDhB5VelwjONZAIy+wfFQV6cS/Z6cSFFMXn2f/9si6rNaYl7wIs7fspA6IzAorMSIZJ4nYtpoOMSdUi3reI0A7vFp/9sxNbRNtDjUu23VwVPPgeJyTD7SioQt5c/iqmHx5zvq5qWgdDtPaN7PHz16n+QdZ6VqEorXO7LR0q2RrP1923Siyhiz3jTQqAqVkvNBYeJ4ir0/H/bhHK/L23oFHTPgcMxuxkNBqf09uwELCMUrQ1ghy8XsEWMohYadsMwOr6+AycwZ1V/8TMDA2X83xwCL5VSkAOZ6Fe3i0bQwR7VnzzQuKPTWjbehMH4pAOSy0UAHp3iQK3Nn4D2RWJ/U6f7tSzOhSzYMuNOE5g8dqNoXEHxMfsyrJZ2BCw4jLSXSOlR8uLy1iLhb+0qwa3SXxuG2aH4ToTEhN+vdajVIWVxE1NFYAqhGcxTTCJXzVq4Wj6o1vlHO0feO/wW8lkh/3GnE86/XyLfHrCH4fhTTubAKxETxUAg7GllBCSgS6Gs2W39UHpuri0Xk7OUrLJoTExoIw1yK50JIVxFlXzbMAFmZzl8ixjCACk24mJwoLYzJdUEhkqlAkX32PQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(186009)(451199024)(1800799009)(6506007)(6666004)(6486002)(5660300002)(36756003)(2616005)(86362001)(38100700002)(82960400001)(1076003)(66556008)(2906002)(83380400001)(107886003)(478600001)(45080400002)(26005)(966005)(66946007)(8676002)(8936002)(66476007)(6512007)(41300700001)(6916009)(316002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yk0StwoSyOi3wurcX5/y7Nw5hNFdyTbiaHUp/YohnMYckBQUZHIw8L61CpHE?=
 =?us-ascii?Q?1y1PLkKIbE/JGmj+PdV3nhLQtVn5lrME0Fdt+RoOTCjCvcddhaGX6bnvLMct?=
 =?us-ascii?Q?4hHFm7LoOFIix1bwOK5BVJUxkjjL2Ww/voc2GHKu3B36R7ofWTiIEEfZDPAj?=
 =?us-ascii?Q?za+jadKHbYYWKG/AYbPd/MihY1GptuLX3v75+UhPl9es7AEt8PydNcZ/nX+6?=
 =?us-ascii?Q?RRpUnRurF6UNXijt5P/R9hqNAYkwwKgrvpb16SAIFPpO5YHQVxE+VxibFFx7?=
 =?us-ascii?Q?MzWe7lT793FK9X9qzipPosEzS+IVTLmaRcNWJwM+rUJoqyzO5CkGd8LL0DbS?=
 =?us-ascii?Q?XMbyFIzjv6nztiyZoCNCimx8gsqp674fN9FPS1j/aQDfT6doTHOJ/vCWUrc2?=
 =?us-ascii?Q?O9GKMbLixttEp4vGQBv+e9POHYQkRCBi/U3AKohERNWsJCGf+ylm+mx/2xzm?=
 =?us-ascii?Q?awvkRUIhzNKMSKPWr+8YJrHsu7wRuz93zCSBxwJNeyaDBmlnIq2Pxv0AxHEA?=
 =?us-ascii?Q?5UC4RQ3Q0qC1Ra08DJTmyzFzjbf42tbhSzfWT4rOHxgjdjMzCjOY+Ic7TJJY?=
 =?us-ascii?Q?kDn3+Li6rq8YHaP6IODWU2Zb668wmPne9ZsBPPacMybDTreMMM9T5bLP1Rx1?=
 =?us-ascii?Q?B/8g6YSVFNJI6vVT5eEZYfeBe9IuUvtCjXaqizVOa5veJZH1EezzLlC+cfVW?=
 =?us-ascii?Q?XN/zszA0/69nUYPziDIYnbRfP20c9GTJl7AROJIq4gjfwTAB6j0MvKqd+xgz?=
 =?us-ascii?Q?YTgwEwTSA9A5pKXQYn8PEz4SrJfdRcArK5y2QEMDyBkCLuIWeoLeyVsEqY6+?=
 =?us-ascii?Q?d0rsagyMvjCD4f1+5ozStgbjsZLWBaRagokEHVY9DecLPYfX8g4QdzzyQsIp?=
 =?us-ascii?Q?U+ICv0oIJRAYIXAnnPS4ynkV87XsSzUxa+dGe/nwdqGmkJPGt1GRnVcsl9BG?=
 =?us-ascii?Q?WKPS/mr3rgzdc2u+fxlGp3FOKFnd51RPzH7F41TxZGWcfOZRoUbQ70TMnWI5?=
 =?us-ascii?Q?yrJeqrkV0FZJWjhsNS2A7z3NUewKx2IeLiElFhTEC8tLfdutCjM8HjcPBfo5?=
 =?us-ascii?Q?KO8CjBiDd81JfXs+mayobSpixLSz52Q5EU4a57bois7lR33uhTQsvX7E3f4X?=
 =?us-ascii?Q?ckG4MOidAPO3pERRtRb6L2LBlw+z5LsBj+gJfUtr8WXYwOjnbqBVQBM0QlcF?=
 =?us-ascii?Q?rc/3YGPKMXag43yDEgHgz5Y4oMk6mVO23ZOn9xChbPg6oiK+3QoVl8QgAlLK?=
 =?us-ascii?Q?YGzFWH0uPWXCt+/pkl5b8/ZMMloMfh1WF6dAihWyOxJJNlKHxjacVGm6I+Oc?=
 =?us-ascii?Q?ya1BZSOVv1K/NRI9fHo1Xwc2rhqxIr5Hdn++bFDdGbCUdqY4KnSr+ic9lpn9?=
 =?us-ascii?Q?RfNFKhb+Fj81emCftZwN6ZhcchjnFLLcm31pSM2+Kv9q0x69xgRnc7tSyYgD?=
 =?us-ascii?Q?sfe28+yJ2R9Oo8VOBFrvudYNBw/9ZJaAXvJmG58HqUrCbsK5jaSnuJ9BFjms?=
 =?us-ascii?Q?lHbjkLTCm5Vl2n9ZtglxWUkooT7cmchnUdlbO83eXHmtG2oH5piC2JcTGI/t?=
 =?us-ascii?Q?xQb7kENdO4jL/qcC29ZggkpHY+60WWXZ70oBZxqnZqMoWq8eKseM22ay7znH?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ed5439-2d8b-4874-212d-08dba865e59d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 07:59:40.3150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1NiaEyVVB6fEP2SJm8zchDxUHwPfb/6vrp07gWXHJL4s+zzwT6DfIEYR1wv8AJASPqjfi152yprsp+VrQF4cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 7f1f6ace4ce1c337bb7c10592ba522e8a91836e3 ("x86/microcode/32: Move early loading after paging enable")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git x86/microcode

in testcase: boot

compiler: clang-16
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | d2700f4067 | 7f1f6ace4c |
+---------------------------------------------+------------+------------+
| boot_successes                              | 13         | 0          |
| boot_failures                               | 0          | 12         |
| BUG:unable_to_handle_page_fault_for_address | 0          | 12         |
| Oops:#[##]                                  | 0          | 12         |
| EIP:load_ucode_ap                           | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308291502.2d535a18-oliver.sang@intel.com


[    0.139017][    T0] BUG: unable to handle page fault for address: 027025c4
[    0.139017][    T0] #PF: supervisor read access in kernel mode
[    0.139017][    T0] #PF: error_code(0x0000) - not-present page
[    0.139017][    T0] *pde = 00000000
[    0.139017][    T0] Oops: 0000 [#1] PREEMPT SMP
[    0.139017][    T0] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.5.0-rc3-00012-g7f1f6ace4ce1 #1 0b760317710af5cd94fc9e004982f482d14400de
[    0.139017][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.139017][ T0] EIP: load_ucode_ap (arch/x86/kernel/cpu/microcode/core.c:177 arch/x86/kernel/cpu/microcode/core.c:187) 
[ 0.139017][ T0] Code: c2 a1 34 69 ce c2 eb c7 83 c4 04 5e 5f 5b 5d c3 00 00 cc cc 00 00 cc cc 00 00 cc cc 00 00 cc 3e 8d 74 26 00 55 89 e5 53 57 56 <80> 3d c4 25 70 02 00 74 05 5e 5f 5b 5d c3 b8 01 00 00 00 31 c9 0f
All code
========
   0:	c2 a1 34             	retq   $0x34a1
   3:	69 ce c2 eb c7 83    	imul   $0x83c7ebc2,%esi,%ecx
   9:	c4                   	(bad)  
   a:	04 5e                	add    $0x5e,%al
   c:	5f                   	pop    %rdi
   d:	5b                   	pop    %rbx
   e:	5d                   	pop    %rbp
   f:	c3                   	retq   
  10:	00 00                	add    %al,(%rax)
  12:	cc                   	int3   
  13:	cc                   	int3   
  14:	00 00                	add    %al,(%rax)
  16:	cc                   	int3   
  17:	cc                   	int3   
  18:	00 00                	add    %al,(%rax)
  1a:	cc                   	int3   
  1b:	cc                   	int3   
  1c:	00 00                	add    %al,(%rax)
  1e:	cc                   	int3   
  1f:	3e 8d 74 26 00       	lea    %ds:0x0(%rsi,%riz,1),%esi
  24:	55                   	push   %rbp
  25:	89 e5                	mov    %esp,%ebp
  27:	53                   	push   %rbx
  28:	57                   	push   %rdi
  29:	56                   	push   %rsi
  2a:*	80 3d c4 25 70 02 00 	cmpb   $0x0,0x27025c4(%rip)        # 0x27025f5		<-- trapping instruction
  31:	74 05                	je     0x38
  33:	5e                   	pop    %rsi
  34:	5f                   	pop    %rdi
  35:	5b                   	pop    %rbx
  36:	5d                   	pop    %rbp
  37:	c3                   	retq   
  38:	b8 01 00 00 00       	mov    $0x1,%eax
  3d:	31 c9                	xor    %ecx,%ecx
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	80 3d c4 25 70 02 00 	cmpb   $0x0,0x27025c4(%rip)        # 0x27025cb
   7:	74 05                	je     0xe
   9:	5e                   	pop    %rsi
   a:	5f                   	pop    %rdi
   b:	5b                   	pop    %rbx
   c:	5d                   	pop    %rbp
   d:	c3                   	retq   
   e:	b8 01 00 00 00       	mov    $0x1,%eax
  13:	31 c9                	xor    %ecx,%ecx
  15:	0f                   	.byte 0xf
[    0.139017][    T0] EAX: 00000000 EBX: 01020800 ECX: ff008983 EDX: ff000000
[    0.139017][    T0] ESI: 00000000 EDI: 00000000 EBP: c405df9c ESP: c405df90
[    0.139017][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
[    0.139017][    T0] CR0: 80050033 CR2: 027025c4 CR3: 02cdf000 CR4: 00000090
[    0.139017][    T0] Call Trace:
[ 0.139017][ T0] ? __die_body (arch/x86/kernel/dumpstack.c:478 arch/x86/kernel/dumpstack.c:420) 
[ 0.139017][ T0] ? __die (arch/x86/kernel/dumpstack.c:434) 
[ 0.139017][ T0] ? page_fault_oops (arch/x86/mm/fault.c:703) 
[ 0.139017][ T0] ? kernelmode_fixup_or_oops (arch/x86/mm/fault.c:761) 
[ 0.139017][ T0] ? __bad_area_nosemaphore (arch/x86/mm/fault.c:817) 
[ 0.139017][ T0] ? bad_area_nosemaphore (arch/x86/mm/fault.c:866) 
[ 0.139017][ T0] ? do_user_addr_fault (arch/x86/mm/fault.c:?) 
[ 0.139017][ T0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1494 arch/x86/mm/fault.c:1542) 
[ 0.139017][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1499) 
[ 0.139017][ T0] ? handle_exception (init_task.c:?) 
[ 0.139017][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1499) 
[ 0.139017][ T0] ? load_ucode_ap (arch/x86/kernel/cpu/microcode/core.c:177 arch/x86/kernel/cpu/microcode/core.c:187) 
[ 0.139017][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1499) 
[ 0.139017][ T0] ? load_ucode_ap (arch/x86/kernel/cpu/microcode/core.c:177 arch/x86/kernel/cpu/microcode/core.c:187) 
[ 0.139017][ T0] start_secondary (arch/x86/kernel/smpboot.c:283) 
[ 0.139017][ T0] startup_32_smp (??:?) 
[    0.139017][    T0] Modules linked in:
[    0.139017][    T0] CR2: 00000000027025c4
[    0.139017][    T0] ---[ end trace 0000000000000000 ]---
[ 0.139017][ T0] EIP: load_ucode_ap (arch/x86/kernel/cpu/microcode/core.c:177 arch/x86/kernel/cpu/microcode/core.c:187) 
[ 0.139017][ T0] Code: c2 a1 34 69 ce c2 eb c7 83 c4 04 5e 5f 5b 5d c3 00 00 cc cc 00 00 cc cc 00 00 cc cc 00 00 cc 3e 8d 74 26 00 55 89 e5 53 57 56 <80> 3d c4 25 70 02 00 74 05 5e 5f 5b 5d c3 b8 01 00 00 00 31 c9 0f
All code
========
   0:	c2 a1 34             	retq   $0x34a1
   3:	69 ce c2 eb c7 83    	imul   $0x83c7ebc2,%esi,%ecx
   9:	c4                   	(bad)  
   a:	04 5e                	add    $0x5e,%al
   c:	5f                   	pop    %rdi
   d:	5b                   	pop    %rbx
   e:	5d                   	pop    %rbp
   f:	c3                   	retq   
  10:	00 00                	add    %al,(%rax)
  12:	cc                   	int3   
  13:	cc                   	int3   
  14:	00 00                	add    %al,(%rax)
  16:	cc                   	int3   
  17:	cc                   	int3   
  18:	00 00                	add    %al,(%rax)
  1a:	cc                   	int3   
  1b:	cc                   	int3   
  1c:	00 00                	add    %al,(%rax)
  1e:	cc                   	int3   
  1f:	3e 8d 74 26 00       	lea    %ds:0x0(%rsi,%riz,1),%esi
  24:	55                   	push   %rbp
  25:	89 e5                	mov    %esp,%ebp
  27:	53                   	push   %rbx
  28:	57                   	push   %rdi
  29:	56                   	push   %rsi
  2a:*	80 3d c4 25 70 02 00 	cmpb   $0x0,0x27025c4(%rip)        # 0x27025f5		<-- trapping instruction
  31:	74 05                	je     0x38
  33:	5e                   	pop    %rsi
  34:	5f                   	pop    %rdi
  35:	5b                   	pop    %rbx
  36:	5d                   	pop    %rbp
  37:	c3                   	retq   
  38:	b8 01 00 00 00       	mov    $0x1,%eax
  3d:	31 c9                	xor    %ecx,%ecx
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	80 3d c4 25 70 02 00 	cmpb   $0x0,0x27025c4(%rip)        # 0x27025cb
   7:	74 05                	je     0xe
   9:	5e                   	pop    %rsi
   a:	5f                   	pop    %rdi
   b:	5b                   	pop    %rbx
   c:	5d                   	pop    %rbp
   d:	c3                   	retq   
   e:	b8 01 00 00 00       	mov    $0x1,%eax
  13:	31 c9                	xor    %ecx,%ecx
  15:	0f                   	.byte 0xf


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230829/202308291502.2d535a18-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

