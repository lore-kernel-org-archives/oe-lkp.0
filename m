Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61B6ADB
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jan 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rcl8wEN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704185091; x=1735721091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPBA/5R3spvp4d7FFW5C4tMIkE6HUCHj1fAHMLwsFiQ=;
  b=Rcl8wEN37CZqEImj80gSLMYw6jyWD3C2QMbGVHJECVMEPHSFYLElccSS
   YdXpIpCnM+zXfgPmJjNa5ZESGvYFjRGyb6P8hFsTCSUsBlzg/6PUxkVqJ
   MrgzkFju/Px/jwaGgx7Wy7USl/RuBMwC6KlH3vfGwoK5BjRk29+4DhnYq
   UaQODUUFAxaAwnhKl2O7kSWLm1c4bLmogJfqwoX82X6lH51w43DlyFEOY
   yPDsxXPVBfvrpqY0vaiVJAdfGwmztYceqNbVsIHOuLgQ7TwsPDzVR/nfS
   xi9Wp/+LuUC0ITPzQ/J5092PJwueccg9xE23YoUEvdh03EB7RyHiE6B4c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="4188508"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="4188508"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 00:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="813866145"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="813866145"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2024 00:44:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 00:44:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 00:44:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 00:44:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 00:44:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK+MBj3Ix4CFfUS9iMdOVNqGdC3wXaYlfcNtEID3YolvzIoMrSonRXig+TYL3OE60stIF1qt324f6aTVZTfZhhTC6BiWC8PKFaNwcSk7npEU/tLLucpon2hGAER4iL4l7C8Nrm20Ogv2HDBRfxLqnc9qsZtfyVu548vQA7f/Ip+tezPiabuhSrahgX1XL4D+Ayvr3tecpAKQgEFjjY/O4hzgYuhd0XmQxWnuoW3uiujqdmCnAwk/tXJ5UhNNAOIHYArMEeui5L2LITDz5JtyUV2ujII0MpatANCh0QNIScNLoxRRhkoMWEL9r+h/h3dycOeQN48EK25Sp+UmMbKLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v6kq5JKMgbmtn5oLOwREMMoYSIUr0xOtD79cFxUUOA=;
 b=FTLEF5/lrEeuRk7jOya2vUjRaLQ77WCDjnC0gk2+Dmsx0a4TWBx28reN0fC1ypstseyfPeFIs4Gxs6EMvpyEkRdnUl4Z6sD07YqqzLctugd+cO3iPYt4CdLoBaQAFFbHRcIADU4ogoafxxVrrhuG4Na6e6uoWd9Y8HsOaQbOrE1H4r10GMPnHfZE7bd5+KH+bqdyYwbcibRlTbs5VjDMFAVJ47Y9tP83iJ25VvS/XBYKoMRrbcqyMoPeN0WtNC28nMaHd0WctHm/75sUcVQK04Al9IAAiyN5wVgEGG0NI6dXHV5Lf+lGjAL/lIfHq3EPxQ4p4YK4/D8UU+8AAvaTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7026.namprd11.prod.outlook.com (2603:10b6:510:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 08:44:44 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 08:44:44 +0000
Date: Tue, 2 Jan 2024 16:44:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-12262023-yi] [iommu/vt]
 1ccf743ca1: canonical_address#:#[##]
Message-ID: <202401021646.b98512d4-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 90be774a-6d4f-4b58-6840-08dc0b6f117b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3Ln03W1BtvijnNRL3uj209rZqHeF8WhN36jZnZp6bsNBTQtk+V1ZTcYZqw0bdNWAyGJUeZXnZI8XKFIlLrIK3cN9DQ8tdEQ6rkSyjLzAxfpF66RVIFWuRNeUXikPmQAsQDMJBZ61Dvyvk8nvKsO7Im/qDKWU2GbcN1zv9pvhSJVmayjijsnZ3IVTsTBl+rQoFMawLzICJoiFeNtHbPX7V2zroNaw076ktl4XkBqbemGT2QeP/iGQGzgfKSGaj2nOENBzhddVNXEKXduUcxuf4hJdZ1ttq4nLpLXmuiwX4Ko9tKLWiMs8KbGnoJSe059ksknvhAWNoZ5GjMCVFOlg1vsX3uvDdgwAVasQGvZR/dCtIonZXc4USY/35GdLJtLquj4Y3JAppgHPq1Q7jfrfWDrrwu3FjgL5PJNx0nFeRWRZrqUvxBNCf6M1QBsZmUoRFIIjvwEyDlLqHzQNpHJNUqPe3oYycbvIs6STpJj/4IkyT9q9n1ukirB7wSx2sX8K3FNTO/pSolIv9jMxiOIrlAZhmFlzw5h79DyRC2sIU4j5Wi1YJMWajQ3GddLNJPFkMIKy/3Kroj6LGtDb8UX6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(346002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(26005)(107886003)(83380400001)(86362001)(36756003)(38100700002)(6666004)(82960400001)(8676002)(4326008)(5660300002)(2616005)(6506007)(6512007)(8936002)(110136005)(66946007)(66476007)(316002)(66556008)(6636002)(2906002)(6486002)(41300700001)(966005)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGUIXc5ZOCnc9ouVKRr5dwkKHW3fvd0WD1Ql5e27Nx3JjrxoWi9PJ7Kw5g6s?=
 =?us-ascii?Q?ba1rdsyf9Hybi22H+KQrHa6DwnE8P9zzejeMR4ZeLdLgcRFqydNCQxsbdfl4?=
 =?us-ascii?Q?kfGjdrDXMWWZPB/Y1AOPrPXjk2zLh4Nlp6nrZuCyWT31I+dxCqFwx1s0cKwg?=
 =?us-ascii?Q?ywhKNLfi7XxA2QEygkHuwRX0gwjUsLAETpWp0JmeN5QbD/V8/+9O2j02ELwj?=
 =?us-ascii?Q?+rr2QYKdyy8SUsT+Fhr6cZ3uAn9Uvnkai0UCVsHi9BWUcjZIdE1nyTu7GJCG?=
 =?us-ascii?Q?vjsJA5/ibaE2xO2JyUMX3CjK5FVlo5nBepLKBeDpfeAtsKJE2jVgIjweOW/q?=
 =?us-ascii?Q?pii58dfR4cglcv5jP2Kbi8efhUS57dRKbnoP7VpXgozcWMJaAhk2B3xIVkm4?=
 =?us-ascii?Q?EGDSzoEQxHmM8jM/NUh04qNkUFzTFXS3v+3Yc7mLisR/T0BaXcKuYgeJOZH+?=
 =?us-ascii?Q?L092okYFRZ1vE2LZGDRiAk+FEAsw5a1wo17krCcHDc41XawUlWrMQhFtd29Z?=
 =?us-ascii?Q?F23ychgL4Vz/OUHYgDs6lWOObTgMSHDKmkMdgjj2kVeq84xCY/tNW1STzcW9?=
 =?us-ascii?Q?cFrqC7/+wydAYpvu3A2afBLQ5SeCFiTWmwIAB2FvUA+iPenqOqHN6idVGhm0?=
 =?us-ascii?Q?2KIfMrQQuxH63XbTF5JACd0XGatV8tmqRzISNKYDcUZuyshwEg9y8+PamMn+?=
 =?us-ascii?Q?99BTtLbQUr8rJweyMTvz/VgRpovsgU/xCbaB7r+3OCBW2/xcuWVzHNHDEheu?=
 =?us-ascii?Q?OMuYhmTzy8i+JaPPPBKbrpb09hM9moGQbhMHDyPmYwAjgscSTvs9HN8OkEMJ?=
 =?us-ascii?Q?mi8i/K2BSJjNVjlVF0SjMIOK8dRAhBGo2+7g9PhhTZRv2ijQH/aDLSE7tQv6?=
 =?us-ascii?Q?zwPFvDl3Lq2Ve0y/B4KIBkg6tjWdWpvmlZh1JdYa4VFAfJqYtVwTSX9VCMCU?=
 =?us-ascii?Q?3ymnwetwcU9BFoBVjkBpfOOFaXX/A/KZV9Vh8R8Lkk8AbTjsZ7aL3U5/7Y9/?=
 =?us-ascii?Q?4Sqs9d2dG0bnpTeHB22Tn9WCXmbK5jeOEYlytt4OIOh2apgtYOURwFdz9tQi?=
 =?us-ascii?Q?OVOJ8q0ZBINf6QinD0C1TL2tGIEL+qKTO3gnTIQA3/sFCd1JlW3lBDLXll7z?=
 =?us-ascii?Q?lcrvzJm72NXMbQmzBt5+gnhP6xz1mj7ImxEJa77uN+Jd2iNxcJxzPzfqwCbY?=
 =?us-ascii?Q?Xl1ZDTTcYHWsK1BoS+QW4EuC2ZsHVBW/cwTvx97MFHAuENQO6XpwnyUpKpv5?=
 =?us-ascii?Q?rzHbYUECT7J+FkTjoaOXQoP2D5LTGC90CktpN3Tqfvdm1geOTkyoaap/0Ayt?=
 =?us-ascii?Q?tSi9HjT41exisBfNJFAMq41/RzFsW5KkLcJE8uAjZaZQnTxuor6iQttbH5Ae?=
 =?us-ascii?Q?dTwo0RwFMghe0yKx8+AMyMJHMtllls9m0URMbRJkUYbixBGpOkjno6O+WmOr?=
 =?us-ascii?Q?TWKF1N3vV/VPjSA0YxdqJVfh0Q1GZkDrl6+N9s26GH2IrwkPZqlpj4LqC7gk?=
 =?us-ascii?Q?f40wjXZqN5yeh6HfuDz5drJ8TkPvkdES2yG96FxlViN+u2sRwDWwuIy2VH3z?=
 =?us-ascii?Q?S0rNiNK/+2s6U+/kIknGzLf+IzMyn3OIcllE8/nkfh3QXQlIoQF07ZgzN76E?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90be774a-6d4f-4b58-6840-08dc0b6f117b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 08:44:44.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7MfzdyqoQs4WJvW7OK0Gs32R4IOiQBOuf+llccfXx7JxTk1haRW8kRVI0xnHDjPWbjJYXK9v4zcyWjABb2GJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7026
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "canonical_address#:#[##]" on:

commit: 1ccf743ca10b9f23c2afda4c814ae3a4005d6c18 ("iommu/vt-d: Allow qi_submit_sync() to return the QI faults")
https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-12262023-yi

in testcase: hwsim
version: hwsim-x86_64-717e5d7-1_20231228
with following parameters:

	test: group-37



compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790 v3 @ 3.60GHz (Haswell) with 6G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202401021646.b98512d4-oliver.sang@intel.com


[    1.803579][    T0] DMAR: RMRR base: 0x000000dd000000 end: 0x000000df1fffff
[    1.810499][    T0] DMAR-IR: IOAPIC id 8 under DRHD base  0xfed91000 IOMMU 1
[    1.817494][    T0] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    1.823540][    T0] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    1.833237][    T0] DMAR-IR: IRQ remapping was enabled on dmar0 but we are not in kdump mode
[    1.841618][    T0] general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
[    1.853421][    T0] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[    1.861612][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc6-00017-g1ccf743ca10b #1
[    1.870146][    T0] Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A11 04/01/2015
[ 1.877993][ T0] RIP: 0010:qi_submit_sync (kbuild/src/consumer/drivers/iommu/intel/dmar.c:1386) 
[ 1.883262][ T0] Code: 00 48 c1 e8 03 48 89 5c 24 60 4c 01 f8 49 8d 5e 1c 48 89 9c 24 88 00 00 00 48 89 44 24 08 48 8b 5c 24 50 48 89 d8 48 c1 e8 03 <42> 0f b6 14 38 48 89 d8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85
All code
========
   0:	00 48 c1             	add    %cl,-0x3f(%rax)
   3:	e8 03 48 89 5c       	call   0x5c89480b
   8:	24 60                	and    $0x60,%al
   a:	4c 01 f8             	add    %r15,%rax
   d:	49 8d 5e 1c          	lea    0x1c(%r14),%rbx
  11:	48 89 9c 24 88 00 00 	mov    %rbx,0x88(%rsp)
  18:	00 
  19:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  1e:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	42 0f b6 14 38       	movzbl (%rax,%r15,1),%edx		<-- trapping instruction
  2f:	48 89 d8             	mov    %rbx,%rax
  32:	83 e0 07             	and    $0x7,%eax
  35:	83 c0 03             	add    $0x3,%eax
  38:	38 d0                	cmp    %dl,%al
  3a:	7c 08                	jl     0x44
  3c:	84 d2                	test   %dl,%dl
  3e:	0f                   	.byte 0xf
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction
===========================================
   0:	42 0f b6 14 38       	movzbl (%rax,%r15,1),%edx
   5:	48 89 d8             	mov    %rbx,%rax
   8:	83 e0 07             	and    $0x7,%eax
   b:	83 c0 03             	add    $0x3,%eax
   e:	38 d0                	cmp    %dl,%al
  10:	7c 08                	jl     0x1a
  12:	84 d2                	test   %dl,%dl
  14:	0f                   	.byte 0xf
  15:	85                   	.byte 0x85
[    1.902553][    T0] RSP: 0000:ffffffff84607bb0 EFLAGS: 00010246
[    1.908420][    T0] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88810d093800
[    1.916183][    T0] RDX: 00000002000000a5 RSI: ffffffff84607d48 RDI: ffff88810d0938c8
[    1.923943][    T0] RBP: 1ffffffff08c0f8e R08: ffffffff84607c90 R09: fffffbfff08c0f5d
[    1.931702][    T0] R10: ffffffff84607aef R11: 0000000000000001 R12: ffffea0004344000
[    1.939465][    T0] R13: ffff88810d098000 R14: ffff88810d071100 R15: dffffc0000000000
[    1.947228][    T0] FS:  0000000000000000(0000) GS:ffff888143e00000(0000) knlGS:0000000000000000
[    1.955934][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.962320][    T0] CR2: ffff88819de01000 CR3: 000000019ba5a001 CR4: 00000000000200b0
[    1.970080][    T0] Call Trace:
[    1.973192][    T0]  <TASK>
[ 1.975961][ T0] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:460) 
[ 1.979936][ T0] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:700 kbuild/src/consumer/arch/x86/kernel/traps.c:642) 
[ 1.985291][ T0] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:564) 
[ 1.990813][ T0] ? qi_submit_sync (kbuild/src/consumer/drivers/iommu/intel/dmar.c:1386) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240102/202401021646.b98512d4-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

