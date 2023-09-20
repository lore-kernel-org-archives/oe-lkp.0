Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3723DDCF
	for <oe-lkp@lists.linux.dev>; Wed, 20 Sep 2023 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695198201; x=1726734201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/uJAdh8/zEwsYFr5wxybT7lRefGOa9W7u2MO3zBWDA=;
  b=Lj1yFIQTheW9wtlQBeW/fWQnmYU1HgLdl0F4A2pvs3uqgDjEgaCREejf
   JMAsND6qfB4f466GIekUCbZ+CEJe8WTprOCFYOQsN591KUoALFOeuqM8X
   RvihUV8A0qXV7J5kc6sABWTaDxwOJ+fAGgOIIA2R9kp/ePUoR0LufrbIk
   7gkoF73ZGTqn57WCpzJle2Fr5d8QJ+4K3kzTS7dZYWfF2WXvQ1LwGNvH/
   YkQwpsC3r0100YcSkQTl8p+T4OEjK3WO9S4ZOM9z9h2xkZlNzOIN/2c8K
   bKu5ewG/KvHklc8DHLpzSIwi26I1u/r3nviifN5FS5rFOxGnr2FfxzxMe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377467782"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="377467782"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870278280"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="870278280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Sep 2023 01:22:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 01:22:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 01:22:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 01:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMMkC6cbn6jjLG6boMG1Y9+bXeu49n/R7+llyV79NODkX092ANuw5gHDEcBftlM0TSluT9qESQoRYPFB6UBlHjM6IZBIFv8SPdYp2zwOn8y8BtGNjhDa8vGfXH3iPFVqkx5TIUI3Owjk5e+SrVq2KiiByt1ebhzh2OpZAsFiMuXKvpk9KzKf4UlDW0OWVs3Gg9AibxW9BnVJ3c+yZjFm5FOPFGi9Ht40WXUUv3+vD46rgumcj22Xp0s24+zxqVbynSg80WiATXCymaMFpW2x7kTTEusqNGYpOMyq8E5BHtAnKuFxfNxYHSQsVG0s9mkkSBAusktbsh5O7eHHgmpwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exzqMu4uE8PQjgZu5jdQXKBSjrP89NVcG4B6V+Ccfp0=;
 b=dMlb+9eiTGUWmSnFZ++km4fcAMB5rGvnB5VCfv2LDHf9iuTWwOWPoGRw4AIHZHoYwdzON92glZp289o3DqwQT1QrXQur4501pzReDM+rVYXKmZZH3r8fOP+G3BxNR+clfTmyFFSUsb9OFv1tGYW2WREH4kfLOU1JLEVYoV7z15v6Gf1lZZqfRTAjEhXKH8gyygjdPM0n4o4Vjq91Kxr76EUMfezgP2O0mJNN+80VqLP98EzuSUGqbRcsFaSbeGDda0zI4EjO6wEM0WHzKJUo78/TiVBqwNOt6xIULvNazuKUAHbwu2o++r0dn3BPstIFHIm2eYcWMTOERZCgFbFf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 20 Sep
 2023 08:22:32 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:22:32 +0000
Date: Wed, 20 Sep 2023 16:22:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [mcgrof-next:20230914-shmem] [shmem]  9486b9f36d:
 UBSAN:shift-out-of-bounds_in_include/linux/pagemap.h
Message-ID: <202309201657.3a7cf480-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f442be3-8b15-49c0-8ad5-08dbb9b2bc47
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cDPkeypPV1cT9FW4QTXhrFtNPn8cl4vK8t/l+YU+QY8X3lyoF6lUGKXGdAUNRHkz148SyEBM6qMaag/ePUoinoykAfm86S5NCbjxO/bPktbLC1c4hW3ie6pPGCY6YBLEG/rm5+PM/U251tF1O/dtALMr9CQvJj44UsWT1gG/KKvgNC5krqhK77Op1UaV8HJaJqwSKeWqd4nKmA9go2Cw+iwdWpqwTY6XB+qiYO9tIlBHLR0tel70GRdp+Fdd0AtoK+vRJlywcjNSnXpJtZ7adO/H8OZmsijzhQeqr8HO3BbasmIBQ8VIFGYliFFmwsbdLVx7Be0QZwn5EUiEPSxpZxbewOD4JrjuTaCrVTqmsGVdXYZz64XfKtpP6iIo17rOFECA6L9Zz8WXKnpB5U2E/1VrIMmSzpRDMSsO76IgucYmThWH7DTbHVIlCsI9WgjymoZePXPO72BdBvC4n4PFnrbBq4QhvMh9kpA64aY0k8ovyD6A7Rb+3Vnu5wgFNjTDXrSqL79QyQoIVOkqFiRKze6j1R9gbAA+EhjattopQFgUNoZYhMfLl1dRojfbm6McZHMELlFQ9mqwnHhuAGrhkw7LimrAUVPj1oF57IWv6OBkgN4G3tRakX32lMKfbbzoEYjRcnxyG76KxedngECnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199024)(186009)(1800799009)(66476007)(6486002)(6506007)(966005)(66556008)(66946007)(6512007)(316002)(6916009)(41300700001)(478600001)(6666004)(1076003)(8936002)(4326008)(8676002)(107886003)(2616005)(26005)(5660300002)(38100700002)(82960400001)(83380400001)(36756003)(2906002)(86362001)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wbMbnzjA4p8o1PyGx/ikcbXxupWNzTiFXyhNfKL9HGjYMxZvs1Lbr6NBiAAd?=
 =?us-ascii?Q?3R/LFeKkmMkbPyps8dtJZnUVyfLH1WUgz2uX2DpJa9qXzq74e/Px2NzjTbIT?=
 =?us-ascii?Q?NmIKouKSN+zGJuV0tlBReGX7QyQpTRdLZTK16Dw/nvwMv3lh3cGFBBqOps4E?=
 =?us-ascii?Q?+Vo5BNJHxWgoj54sez5xiQE0cU8tXTmosqfjFM2XrWfwYhU7K/PPo0hKH1Qf?=
 =?us-ascii?Q?GAEM2yidOnHqVFlbEyk55oNNr8D9U4WCkJNFIpXSYzh3HBr+tBXhY3xl5491?=
 =?us-ascii?Q?HxYGP3LU3Q+60C6d87ExBpT2Xhp/+usYuho2tQBGeGgh6lzwtW3BmaFa9ktk?=
 =?us-ascii?Q?n3ZhLxln7CA/SBAq8uNdJuVZbeO5/xe+l4UG9RRMEjaQvy2eIM1svl0h/qS7?=
 =?us-ascii?Q?SQI+s8/iV2xZnlnsR5iy77IVg+yBEDGhGHrZlaoHs8o3Y9Q851lPJAPGvFkK?=
 =?us-ascii?Q?bhUVLipK3ktMQecZOmLlCeeXa0snI2Fnqp9KWac5+DY9LS2S8sfAVvANhNNh?=
 =?us-ascii?Q?UJDcTQVWxT0T5MDCniQzkwZiNI0UeVzvwEsaITojZ9mo94JlQBndwXt+7vew?=
 =?us-ascii?Q?HVx4h3ClwF3MTovWlkpdE4VpyTIp8+D35Sq6m/5562eZzoOZuebijKWdmNBs?=
 =?us-ascii?Q?fp/yAW+FOZpJ3uUeMP19IvHuErA/a0yB8G4tVCGN/R9PxKfv4lEpu8cotnpx?=
 =?us-ascii?Q?/3Q3WtxgpxTDofvAPU6sjFVk2KmSKi2j1Q1k1R0TrsEdgrt/m/k+2b8emzSW?=
 =?us-ascii?Q?Y71mv1FgbtU2T5IdbjiaF310SK8tG2gekYL1YHIRFwWO2VVC4VW8ks1omItA?=
 =?us-ascii?Q?sS2at+Tr3ezdSVGyxP8v9J3svv93zhHKM/YRf5oPs/SeW1LJn2937y9FTHf9?=
 =?us-ascii?Q?srJV0kY15yr0qlZrE+dJ/t3+0r92kPek3dvbfy2SUJgnMkxSIV/ng9499vMl?=
 =?us-ascii?Q?jJLi8m/4YXgnX1Babesa5V8HK4pseu3yqsBkZgzi3/fFyVzMKYW44+oosX6B?=
 =?us-ascii?Q?08JQJ1Zzc7j7M6/uEYB7RWVvwbKlm+jsnh9CTCc8z3E8CNrYsXbBYbtrpQm8?=
 =?us-ascii?Q?T4DV7TAA+uKPyv+kGxMAky18rs4dRzbbmCV25umwE8naLOuBq+ki5TdhePpw?=
 =?us-ascii?Q?wvFb3jC2PmbnKQ/VOjL2XOYB0WPIg1NnldC4SNDxPmLNc0mgJzfAf9EQyCtk?=
 =?us-ascii?Q?DlLxiG11PGYZM5SKH/xNJC2zmv3dsMYzX0YK6qkBOLzYQ7B+Q/jnpoxtCv0B?=
 =?us-ascii?Q?uEpAXQhTi9J2ELVC6JZo5+QrhJedBJUsNZoSAB/ttLcFespCp83LHy6tYN0Y?=
 =?us-ascii?Q?fpd1xho0Dn3DgWF0TTa8zcMB+oUHo4j/0/J7q09HscoiqSfGPDvEnibHVuRe?=
 =?us-ascii?Q?WOGZ+Pa2Tr0k/NYo8DimJ5K9DuMi76JmBPKU2CndIt38aE+swaQhQQim9/ML?=
 =?us-ascii?Q?cZrDwlKoCYsXqFV5PtxBcRmkZjcLk4Y9OdwFQ3zP+KothuDzNVo03hWu4psq?=
 =?us-ascii?Q?kCmXNl8VmEKl4NPuJC5piu2lAER4jvArhVwzhiCDX6laaU2ItdSV6gRLABDM?=
 =?us-ascii?Q?P0Fo9Q++ARGe4HMiZf1epnT+UO5o9xpwI+chWEEX0K3g7kVpsfW8xZd3Qhfm?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f442be3-8b15-49c0-8ad5-08dbb9b2bc47
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:22:31.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9WUuB9iSrfgYglfKN17rKTyzS/+ZgSOibri6+lgSlckgnJgafjor5iY7xa9xbM85y/wAA4ZxutYHTnc+iArLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_include/linux/pagemap.h" on:

commit: 9486b9f36d02819ec82732253049539d1ef3ea47 ("shmem: add large folios support to the write path")
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git 20230914-shmem

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309201657.3a7cf480-oliver.sang@intel.com



[   73.775649][  T100] ================================================================================
[   73.777573][  T100] UBSAN: shift-out-of-bounds in include/linux/pagemap.h:603:20
[   73.782539][  T100] shift exponent 4294967283 is too large for 64-bit type 'long unsigned int'
[   73.784008][  T100] CPU: 1 PID: 100 Comm: systemd-journal Tainted: G        W       TN 6.6.0-rc1-next-20230915-00006-g9486b9f36d02 #7
[   73.785858][  T100] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   73.787493][  T100] Call Trace:
[   73.788106][  T100]  <TASK>
[ 73.788682][ T100] dump_stack_lvl (kbuild/src/rand-x86_64-2/lib/dump_stack.c:107) 
[ 73.789502][ T100] __ubsan_handle_shift_out_of_bounds (kbuild/src/rand-x86_64-2/lib/ubsan.c:218 kbuild/src/rand-x86_64-2/lib/ubsan.c:387) 
[ 73.790612][ T100] ? __folio_lock_or_retry (kbuild/src/rand-x86_64-2/mm/filemap.c:1815) 
[ 73.791602][ T100] shmem_get_folio_gfp.cold+0x13/0x26 
[ 73.792689][ T100] ? __lock_release+0xf6/0x410 
[ 73.793638][ T100] ? shmem_fallocate (kbuild/src/rand-x86_64-2/mm/shmem.c:3147) 
[ 73.794562][ T100] ? shmem_getattr (kbuild/src/rand-x86_64-2/mm/shmem.c:1956) 
[ 73.795395][ T100] ? do_raw_spin_lock (kbuild/src/rand-x86_64-2/arch/x86/include/asm/atomic.h:115 kbuild/src/rand-x86_64-2/include/linux/atomic/atomic-arch-fallback.h:2155 kbuild/src/rand-x86_64-2/include/linux/atomic/atomic-instrumented.h:1296 kbuild/src/rand-x86_64-2/include/asm-generic/qspinlock.h:111 kbuild/src/rand-x86_64-2/kernel/locking/spinlock_debug.c:115) 
[ 73.796255][ T100] ? shmem_fallocate (kbuild/src/rand-x86_64-2/mm/shmem.c:3147) 
[ 73.797162][ T100] shmem_fallocate (kbuild/src/rand-x86_64-2/mm/shmem.c:3165) 
[ 73.798055][ T100] ? shmem_setattr (kbuild/src/rand-x86_64-2/mm/shmem.c:3068) 
[ 73.798786][ T100] ? lock_sync (kbuild/src/rand-x86_64-2/kernel/locking/lockdep.c:5718) 
[ 73.799409][ T100] vfs_fallocate (kbuild/src/rand-x86_64-2/fs/open.c:324) 
[ 73.800098][ T100] ksys_fallocate (kbuild/src/rand-x86_64-2/include/linux/file.h:45 kbuild/src/rand-x86_64-2/fs/open.c:348) 
[ 73.800877][ T100] __ia32_sys_ia32_fallocate (kbuild/src/rand-x86_64-2/arch/x86/kernel/sys_ia32.c:119) 
[ 73.801847][ T100] __do_fast_syscall_32 (kbuild/src/rand-x86_64-2/arch/x86/entry/common.c:123 kbuild/src/rand-x86_64-2/arch/x86/entry/common.c:189) 
[ 73.802823][ T100] ? ct_kernel_exit+0xb6/0xd0 
[ 73.803818][ T100] ? __ct_user_enter (kbuild/src/rand-x86_64-2/kernel/context_tracking.c:454 kbuild/src/rand-x86_64-2/kernel/context_tracking.c:542) 
[ 73.804666][ T100] ? __do_fast_syscall_32 (kbuild/src/rand-x86_64-2/arch/x86/entry/common.c:194) 
[ 73.805561][ T100] ? __do_fast_syscall_32 (kbuild/src/rand-x86_64-2/arch/x86/entry/common.c:194) 
[ 73.806497][ T100] ? __do_fast_syscall_32 (kbuild/src/rand-x86_64-2/arch/x86/entry/common.c:194) 
[ 73.807427][ T100] ? ct_kernel_exit+0xb6/0xd0 
[ 73.808436][ T100] do_fast_syscall_32 (kbuild/src/rand-x86_64-2/arch/x86/entry/common.c:214) 
[ 73.809315][ T100] entry_SYSENTER_compat_after_hwframe (kbuild/src/rand-x86_64-2/arch/x86/entry/entry_64_compat.S:122) 
[   73.810435][  T100] RIP: 0023:0xf7fb8579
[ 73.811206][ T100] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
All code
========
   0:	b8 01 10 06 03       	mov    $0x3061001,%eax
   5:	74 b4                	je     0xffffffffffffffbb
   7:	01 10                	add    %edx,(%rax)
   9:	07                   	(bad)
   a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   e:	10 08                	adc    %cl,(%rax)
  10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
[   73.816556][  T100] RSP: 002b:00000000fff244e0 EFLAGS: 00200286 ORIG_RAX: 0000000000000144
[   73.818061][  T100] RAX: ffffffffffffffda RBX: 000000000000000a RCX: 0000000000000000
[   73.819423][  T100] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
[   73.820771][  T100] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   73.822172][  T100] R10: 0000000000000000 R11: 0000000000200246 R12: 0000000000000000
[   73.823544][  T100] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   73.824918][  T100]  </TASK>
[   73.825662][  T100] ================================================================================



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230920/202309201657.3a7cf480-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

