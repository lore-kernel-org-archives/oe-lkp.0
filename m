Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32581B
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo+dynmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697771241; x=1729307241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mTUGNUtSMkQfWOV8yrzbLq7f0XBEZ/DPGdQ4i9S3Jk=;
  b=Lo+dynmgOIWb4JckpiAtWdKtEfT4Xt53HtxlIsf5VwWeM9Ci4uilW6Mc
   SnqhlMd94wBuWf5S/Fi/h3NTTLxps5TthF+8aJpX6V9XDPArUbOvtOl40
   lQyUPYNPHIFlrNsxOYn0qHMMM5dBjV0L8xa0g3GhTMaEfjDq/iMc+1Umt
   dBC0SdHQdawGwITKNEf6fhj0NgDzxCTAXrj7EBTffQaAKs6aYy6qkWyjw
   k8QYzRJe9MNInSmoUAHmaXXZgjZGBciUuGKsK6AID6/c+b2hyGnZlnBFR
   6pnkMMi2CFfDKl+fO8nK142X5vrq6ba2BRzVv4x9jCqKxvgsPj08SFgvx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417551043"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="417551043"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 20:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847939888"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="847939888"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Oct 2023 20:07:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 20:07:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 20:07:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 20:07:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 20:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCH3nD9yiC59LO88w3AIq9AMTv2/h8OMZOSK3KSCkascYnmu9ejoY5UajR3AIjblEl4+/RVZAEHDUOv4i2hK0EWUTtvBfA5zdpa7NS4xrMKnwtKegccLKxdc3XE6Mrt6xPLjtDHJJUJ29YDyGQs0tTRVPynsXtAwVMHAhPPFwiFfRaMGvG7HrL3pgCeLGDTfKY8ERxjFA+6utRKMzv699+b7W6lcHZ9P7C2G7YKUZAhndyaRx6ogQNiDQTBHWfiU6cCJAMe24UK5Kccfeixtg3sYXzNkYQw7IKcw24ogoRetMsfyVhJ+s5eOiB4/KN/nOLPod4SdXogehLK1MBqYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN9Jcco+gNCgV8xcZw8lEUI6WlvpTTQ6ePmhpTVPE9o=;
 b=NKxTJpBGUBUkP1iNhz4RRFl2rQ5twZOLnoIke4GiBx+PEHsmTsfWDENo+ML5/eR/f1//zT6dgGBR0wVbt3BaUDVHwHDRTAVRAHKVrp9tbsgLNfEM/LUXT9w0g7KPVjAGZnsdPcbkj7Q+UKmGcS0Ge0MQapcq37IhulKpgn52DAER3JX0TKCmHIq+AfE+0TRe+pOaytbrto9usFscCUokTLEeT+MQf+XJGTBefKMFEwlqOXaEKQwU+4pGbNzd4By70pfRQWTF1eRzThqTZhY9uObkMjaybaFDVJLmmafxzJtamFd8pxjxdF2blZulbtCptqj6neJEo0jz4TT6UU32dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 03:07:15 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Fri, 20 Oct 2023
 03:07:14 +0000
Date: Fri, 20 Oct 2023 11:07:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-shrink-3b] [dyndbg]  ea66e05042:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202310201027.471f187c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: afb4dcc4-b7f9-4eea-91ce-08dbd119a8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5G5CklWwCVOhuPPayjbzA5r4NQmnROmiZ9m/0EAegTgenFPgzio5SJueSP+AzoPiVV5minO2XZLYZuV+AgPXWDbxqYnFxrs/1J5EqIe6SwzKckzf/Y5X+AZjwpRxXitBNxRXhbyusyv3ytfve6LC6vGXAHidzs6iqOkdB9dL8ASjpOLh0ynrNwpULwOSUmUFg0RWuN5+PZFOz/gC0+vVdXjK0ATK6KEaeVDMfTPom7+pqBlyo+aq/NJr8nKFKE+3PvAgZAl5p4dh/qnYoZA5WzDqAAxKZeVIODFLi/UFiD5NWbgi+hykaNjkiBjzUwAR+aCrqTKqSaMUdx4+X9f2nfgiknrDNF6v+HyK5lm1O2TjsjP57j/huLyC9zyMcsSCn8F1qKw+EjECiAsOsAd1lD2Hgcjyck0nvW96x2arO1yqKq2mPznuIZTLBbMumWi9+QmbeA+l9Gq6xRBPULMRM5jw9avQp07/oA7R2MmfaA5ZWovEDXiXf9FfBB4ITQMbf6I41AFtqAdOrNsdlnVDu72TbOwx7dKr9FlB86TsbXefRmsCe/kToESRI8b/zqvsL5IyZjml+XmkU61I1HnMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(38100700002)(2616005)(6506007)(36756003)(41300700001)(5660300002)(4326008)(86362001)(83380400001)(1076003)(26005)(6512007)(82960400001)(107886003)(6486002)(966005)(6666004)(45080400002)(8676002)(478600001)(8936002)(66946007)(66476007)(6916009)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Oj8v5KWxM0Z3r5cfl8zBC/CyM5XWYDraqu/Sn3tYFW5pyC1c6vWRn7DfQAu?=
 =?us-ascii?Q?PimsDe6DLXgZEU3vZK06Z/qNE5S+5coq450oG5zXNLNYXrcQWrXFVxqffQ2n?=
 =?us-ascii?Q?mbSiyMJDe+EuxsjNssD7YAoz8DoaVpb5YJGW3ZOY5bveCnegKavToJzbuF1H?=
 =?us-ascii?Q?LrrXrTjCvj21iF4qGiu8WYItZhtsHi38JZrVhrsdrcCb7DqQmf0CShXcGeas?=
 =?us-ascii?Q?2KaC95o0pnhWH1F2lb+nwiCPKZ6Ul8zFLTux1QkWQ1/pahs+KNN0V6MwCaMY?=
 =?us-ascii?Q?jIXhMzcUZmM/sdo3/ThpAM7Jx4p0jsUXJDluAqwwn1DrvCLswQvcUK5uZXfc?=
 =?us-ascii?Q?9GyjoRpvnv+gl2Clz5b4l1zYn3tgX7+8QYj3aSYaH7N+BgnLSMWtYlS5lL27?=
 =?us-ascii?Q?zdDsJzx4vSvmjGc1QU0Blku10zRoIr7zmYOlRgnlA9a22aKgZTKb/0eocjZa?=
 =?us-ascii?Q?zKAyACdI3Rh4uHVxR64wVyNsoAjQIpR7pELbpSmehS+wg+2RuCh7FcZxxbRs?=
 =?us-ascii?Q?J/6eEkgRA9S2SrUMlvK8GzYG5pLnyf9ZJJ7mfs2daz7EcAycAVnth7HHgdOw?=
 =?us-ascii?Q?Wbn7Ax7cfE8EipmruOGXx/9wxJufNSnZBqzAyIsE7r7MuCOzqlTmI4o2yvIs?=
 =?us-ascii?Q?poUK1M2cpPcKauG2g8j1QqLDwD8om+hcpG01D6G9/foKdHcpRMMRuoUS7CR9?=
 =?us-ascii?Q?35JZRwZtAJI2K95C2cJzf/C0sc68wYhk54x8ns9Od+6OcdEdj1Rghvm1AqPT?=
 =?us-ascii?Q?lvJfgFo3qQRtW+VrFgLiVq7OoHh3OerbmJ1NPugxFRDBvkQMA71z60wne363?=
 =?us-ascii?Q?FNS9r3Xxx8XksR1sS0oFWGd3YdiBypWVNFMiSw4nlitA1bR2MdBVZDKok3Po?=
 =?us-ascii?Q?7TawW0BD+MWIv9GYN7p2aZ8ozrK4w3nFp6zY4zGvoRkMNnQFlco9RBJHI2ix?=
 =?us-ascii?Q?dZY7Q2mMbBr/XbXFJMjyfezh2L274vlhX9W1Y3tfMowIY5SZ4IdvQauhb9f6?=
 =?us-ascii?Q?Q6JEehD6x+cNzU42JyNp0KGDL+xGCQ444aIm273zOXD8sh/8n8DtfUrHteIl?=
 =?us-ascii?Q?MPUd3QDO/XYa4ecLRjVJVdAYrvA0ewUqSrle0+5sjzmSmdW4zUrJdPoFAe2P?=
 =?us-ascii?Q?4KMmKgdy5cj9HK6Nbv2AgguF2J/arE+zjp/yVTS6kv5kpDF3/hpLaumiEUQb?=
 =?us-ascii?Q?rlpBkTcNoUrXrR39T+Y5kEPGXyPSsTA3QU2dImhKoMkPn2HE1fv7V6hF+OXM?=
 =?us-ascii?Q?bRXTiij5RBowyH3cwWND9Y86G/pK4CT3kxrAtsem48rBRJWR/CWOrkE9FK6K?=
 =?us-ascii?Q?OkJZ06YWmVbXHik+ZHJalA1ghcEro9o1W1VkP6+GAScJNTXuK82WoxqKf5Dk?=
 =?us-ascii?Q?myS0V19oJvRv4cAwox9GeiAQKiLZ+RHhehhNGHqDLrfZB9ludh+2WYuooIag?=
 =?us-ascii?Q?S29RMRHWjYx7Gh+AmVl2gPDGQQ3Bm2BjlSouyBtI6Mup00EPlkk3DB4Jr6DU?=
 =?us-ascii?Q?aAmGTUVYCf6rzD8OH3QYbE1LI8Cix5Qfg6AEFWWLaejjT0gbG2/zmNuUv9Hf?=
 =?us-ascii?Q?J/+DNYdp1ykB711VVDOpKxbzR+O/Z85CIY+GelvY25x3Cgmxo6mtq2qoOgJb?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afb4dcc4-b7f9-4eea-91ce-08dbd119a8f2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 03:07:14.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0Y3Ik+zkR8xECgtZcRQA99QqxZhuD0fdhIOnESVqusmmQLI9q+4QyK3og5jp2N+3wkXN0PE4gZ6zqnTfBGZYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: ea66e050422403171470a295e67a46b75890feab ("dyndbg: add site_*() macros to avoid using _ddebug.site")
https://github.com/jimc/linux.git dd-shrink-3b

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310201027.471f187c-oliver.sang@intel.com


[    9.012926][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    9.014505][    T1] #PF: supervisor read access in kernel mode
[    9.015267][    T1] #PF: error_code(0x0000) - not-present page
[    9.015267][    T1] *pde = 00000000
[    9.015267][    T1] Oops: 0000 [#1] SMP
[    9.015267][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc6-00030-gea66e0504224 #1 8299f0ff7cbd3e77c1b0f2e5b7aed3e4d29ee5e1
[    9.015267][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 9.015267][ T1] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 9.015267][ T1] Code: f7 31 c0 aa 8b 75 f8 89 d8 8b 5d f4 8b 7d fc 89 ec 5d 31 d2 31 c9 c3 66 90 55 89 e5 83 ec 08 89 75 f8 89 c6 89 7d fc 89 d7 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 8b 75 f8 8b 7d fc 89
All code
========
   0:	f7 31                	divl   (%rcx)
   2:	c0 aa 8b 75 f8 89 d8 	shrb   $0xd8,-0x76078a75(%rdx)
   9:	8b 5d f4             	mov    -0xc(%rbp),%ebx
   c:	8b 7d fc             	mov    -0x4(%rbp),%edi
   f:	89 ec                	mov    %ebp,%esp
  11:	5d                   	pop    %rbp
  12:	31 d2                	xor    %edx,%edx
  14:	31 c9                	xor    %ecx,%ecx
  16:	c3                   	ret
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
[    9.015267][    T1] EAX: c2a04b64 EBX: c3036514 ECX: 00000000 EDX: 00000000
[    9.015267][    T1] ESI: c2a04bf4 EDI: 00000000 EBP: c3e83e88 ESP: c3e83e80
[    9.015267][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010282
[    9.015267][    T1] CR0: 80050033 CR2: 00000000 CR3: 031c2000 CR4: 00040690
[    9.015267][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    9.015267][    T1] DR6: fffe0ff0 DR7: 00000400
[    9.015267][    T1] Call Trace:
[ 9.015267][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 9.015267][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 9.015267][ T1] ? oops_enter (kernel/panic.c:627) 
[ 9.015267][ T1] ? page_fault_oops (arch/x86/mm/fault.c:707) 
[ 9.015267][ T1] ? kernelmode_fixup_or_oops+0x98/0xf8 
[ 9.015267][ T1] ? __bad_area_nosemaphore+0x147/0x270 
[ 9.015267][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:867) 
[ 9.015267][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1476) 
[ 9.015267][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1513 arch/x86/mm/fault.c:1561) 
[ 9.015267][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 9.015267][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1049) 
[ 9.015267][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 9.015267][ T1] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 9.015267][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 9.015267][ T1] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 9.015267][ T1] dynamic_debug_init (lib/dynamic_debug.c:1690) 
[ 9.015267][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1647) 
[ 9.015267][ T1] ? rest_init (init/main.c:1429) 
[ 9.015267][ T1] do_one_initcall (init/main.c:1232) 
[ 9.015267][ T1] ? call_rcu_tasks_generic (include/linux/rcupdate.h:308 include/linux/rcupdate.h:782 kernel/rcu/tasks.h:377) 
[ 9.015267][ T1] ? rest_init (init/main.c:1429) 
[ 9.015267][ T1] kernel_init_freeable (init/main.c:1337 init/main.c:1537) 
[ 9.015267][ T1] kernel_init (init/main.c:1439) 
[ 9.015267][ T1] ? schedule_tail (kernel/sched/core.c:5318) 
[ 9.015267][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 9.015267][ T1] ? rest_init (init/main.c:1429) 
[ 9.015267][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 9.015267][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[    9.015267][    T1] Modules linked in:
[    9.015267][    T1] CR2: 0000000000000000
[    9.015267][    T1] ---[ end trace 0000000000000000 ]---
[ 9.015267][ T1] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 9.015267][ T1] Code: f7 31 c0 aa 8b 75 f8 89 d8 8b 5d f4 8b 7d fc 89 ec 5d 31 d2 31 c9 c3 66 90 55 89 e5 83 ec 08 89 75 f8 89 c6 89 7d fc 89 d7 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 8b 75 f8 8b 7d fc 89
All code
========
   0:	f7 31                	divl   (%rcx)
   2:	c0 aa 8b 75 f8 89 d8 	shrb   $0xd8,-0x76078a75(%rdx)
   9:	8b 5d f4             	mov    -0xc(%rbp),%ebx
   c:	8b 7d fc             	mov    -0x4(%rbp),%edi
   f:	89 ec                	mov    %ebp,%esp
  11:	5d                   	pop    %rbp
  12:	31 d2                	xor    %edx,%edx
  14:	31 c9                	xor    %ecx,%ecx
  16:	c3                   	ret
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


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231020/202310201027.471f187c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

