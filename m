Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D13D3B1
	for <oe-lkp@lists.linux.dev>; Tue,  5 Dec 2023 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RALKPSPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701765250; x=1733301250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skEwvXE/WOAu72v/7Ybi8UTPi1ENfrtVfaSSwY9g/ng=;
  b=RALKPSPaXe0UErTuSbuy2OgIKG8RvenBuKwIHEFbGDQm/nntWrhS+qCL
   AgSB8cDINB/Sl+pdLtnsaZqaSEX25ByCS/t59Z9qFmq438dQY6FpZVNxB
   z8ph6Aj3tWBy7rgsFcEWEZrVv53fFfHOvvLVjgxs/cihIfX8SQ5o7RIGb
   b0Koyw1PnigHbzHMEFMke6GaWEDFPZn5nTi9pby44ptKAKMdUYVvIMAcv
   N9flKUfwB+sa8JUHyzs26QHPySCv4E1p2y2MSKS6Tq7GUHVcxshIZYPRt
   0MVxl4fzHc3Fqv0KBlEsQRBbnxF/WSmNBLrQJgnQR9phcmPsyjIZ4dKE7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="753364"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="753364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 00:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764253111"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764253111"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Dec 2023 00:34:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 00:34:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 00:34:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 00:34:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEVGkZ+Pigaq4xyY4NLoV4RZYxouxYz0nYLjicMsFAZCsOpp89fwelqVoN0uyFY7itpCJ/ZPhW4P5L9pTqhfMI00EQJvct1MML/yq3+gE1SWhaeNMFBqT0vFfHVZ73PNaWtLFyaHr43r2wGlvwbmiqkTxq0SOpNF6UjvedefqXrdH5B3gusa6ODm58rp3o1eTT0LEjhwyFTWtJ2U/FINvJU4b30n+mmlo6/1c42jn5RxdTj2ijV9e5QruPGt5P46kXUp3CBXGMGv6ioPNVlxvDFSLX13XI/9qG9ZBEvt8J+Abg1hsQNNAfqOz0m4OnIPNU+ic4CHhX5dgUAuO/JOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahAAyfIk2FlQKPDxHMSvjxDwVLtwbdMP3bkUu9jHut4=;
 b=g8T9rpkE/8fCElkavYAv14H+osT2ac/uxVSYtZgp5kWY7drnY49trhTuwm7TdElurbysl6Y+ioh+0Vw9YTKxrG/yAn0se3EwgcL5zwWno6VhtimhgktWrLKTKIP/0aJ/ycnzNrrYcLGtqzQobomrutvroTnzXvgtRaMKkDnrN0/ncA3TjamczU/e5lJodFTmTPXm5mRVV4+eK45TbRcw5q1MutvvVkdT+Imip/WaiMZD7/EUVkJ5J/Kbo6WY4QxraZeDmE+YAbGYOsyCmk6jt0IOjzfYucZSvOaCG6yrSoBHqkbLeL952hLrrOZy5o8OJe2rZ7WdvjteiTC6isOz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 08:33:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 08:33:58 +0000
Date: Tue, 5 Dec 2023 16:33:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/pushpull] [timers]  f7012466ef:
 WARNING:at_kernel/time/timer_migration.c:#tmigr_cpu_activate
Message-ID: <202312051651.df1c0db1-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe4904e-fafb-4469-7a2f-08dbf56cec1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BSVzzpGtl7TgD8d5c7IlMzyV4M1uYZlwMdB1exPEmXyc04x/o+JUkuXRc5sz3PfzvNXRCLmldW6xtdXRRyfyZWbQMSRkkAjOYwmPebnaOgUwoIm+nCnLt55h8aLkSur3p+BVi6sTYXUmAB7Zi1D/tqTQxcMcr89Hsxu0dVpOMGQAFBhopL8Esw46gdVbac9UPMMt/Ybwwx31yk+RuuyIYXZbg/XI+U8BYB+2lr7yK4HWdN0VCei/amFV342VToX3WvtMcLZjXEeOZceo4QPS3rltvsf+Fka6X0R4tiPYuJb+NY+sb4m+RCzjIKGZnVnuG52Mu39wU3VLlCafiVev3NXaXbRTolNLYNXReZmlQzKI9h9k3NJwxVf0SH4G8asrGZX1yVgsms/E6WAyWEeQ34b6LL+woI8R2GI9r8eu0kpt2m9dXPb/s3HgE3tgKZ3ENO3Xui5kcl4wCW8vih5vMCHPXb5icBywEjNnp4PQWDTPNXSORA4q721Pin/Fm0faMvHJNR88t2RDVlRONxXAcNfiAq28TGa+vvHhhMiKzcAY/+jYZlHBBlC/6VEGHYW7ZUThusSn3d5MWaT/H5y7RjnPeW1g4bO98Gsbkr/QGTfUQwB5mTH7LuhWbL6y69faqcxlXzOGIGSK7KQgqmt7rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(1800799012)(64100799003)(6666004)(2616005)(6512007)(6506007)(107886003)(1076003)(316002)(66556008)(66476007)(66946007)(6916009)(45080400002)(83380400001)(26005)(8676002)(4326008)(478600001)(38100700002)(6486002)(82960400001)(966005)(8936002)(2906002)(5660300002)(41300700001)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GS5yi2amddzg/btu7OXmXnJLUi/vj70dbQ8hPrcCuqzoO4Qy/LxgruCNdslC?=
 =?us-ascii?Q?etiZw0u+w53QetJU2XzW+stiMb60ZqaDgnOdU/Uc/RGVYlP3FICjnIT+OiXy?=
 =?us-ascii?Q?IAL2fAEUu35yqU3QBBjt8LfvODnNK6duVPWMM5K4vnbWZOdzn9h4MKo4URut?=
 =?us-ascii?Q?x52FDfrlVsb+Bgic0jNTrctv1pGoZwHxjymiYc2jylOAda3ukiTVShmJcxp6?=
 =?us-ascii?Q?e3hRwJjnV5WVbEKCy2twiWroyXem3bcQhD4kXjoupm+QWC9Ads971zZaJ/eA?=
 =?us-ascii?Q?24PkPVWvXMe9rOHMlHerZu2eQ43A3a7pOhYJfR8YueK+239yqZDX5Lwaueqx?=
 =?us-ascii?Q?7KpEZVF8laZlugNLeZuFfIwzZZH6K4x2PT4PtlBP1f/L1c56SB9iAPJRN7Ko?=
 =?us-ascii?Q?nVMtPiY8NkxpGzi5CUwYHCnO79V49h1hptWVRuz6t3Zi1ZwGid6XqRmni8wF?=
 =?us-ascii?Q?ZHCE1l0/XC+FDM47Ir2fmr/R1HmZQzX14O0fkOTUlDFlvF2+BDmfiY9qHRtR?=
 =?us-ascii?Q?EYazkpwwZNgv9KLs7RXhf1qq39Gfov2yH6QmQFOwte/mYnjRzgQlJ3TMP992?=
 =?us-ascii?Q?FGYVmoEjol06jNAhszLZ4/FrzseO6tWC1tHuM4cpLCqymHYerSAE7wBvFjUY?=
 =?us-ascii?Q?+LcSDcqVDxCuy/muOac8gXU3QGHhFbh3W1hhDAp5Q79xKE2VV+6cQavSbH0y?=
 =?us-ascii?Q?jhlbiE05GOraaNIQg94rY9YBYP4idI3qLJSfd8E4fFEeR5SWJxw1hmA6jhoh?=
 =?us-ascii?Q?euwcOTim75+HAu851oFcPz8g6gGi73Cgc8SZfqHj2otaSO+11TpFEhnxE2nX?=
 =?us-ascii?Q?JjtHydjE4f6UF4M5MPuUeXWmosphe8BDWff9GsxlviZuRywvrlGkduf1VeI3?=
 =?us-ascii?Q?acEXaTyHr9fBFjSvcX8ZgeNnqg801N97aWNj3TRfQpNsTRmnAk8RbZPpK3dV?=
 =?us-ascii?Q?bE43rXRa8coQ4pMp9KPaX/nic2TBk0/MuCHzwiWKeaPYNQs2EnXMEGRwS39p?=
 =?us-ascii?Q?LM2DbGrwZKd/oZ+VUJA9voXkBY0vrWTZvOrmI3AV1+725rbbXXRODcms7uDy?=
 =?us-ascii?Q?pUITwQz77ESkhQBkzWY+/B1FaeFrA/DkUvK6w2f1KdUmgyHW7qEFExTuM35D?=
 =?us-ascii?Q?5Cx33Zrcy+inr2nc9O9e+dEbDgUapBtprcHuK293xySUnGMT3gsQOLUo0woH?=
 =?us-ascii?Q?Pwer7uPi6k80YFkD19gmLfCWVhd2qfk9Y/monE6xjB648SgRRFhSgwgN0LS8?=
 =?us-ascii?Q?pQ7O/l3LChNOnJ4vRr4wcHDMkXIuKHcV9l8tCCBmkd8uxqOfyrCLhysf8GPP?=
 =?us-ascii?Q?4l/r3OuAjHgB7reOZ5lWTpUI7D3CgKXFsdBYSVegfIJP1eZjXK0VJ0eAQQbQ?=
 =?us-ascii?Q?TVJOqBz8h9GfcSLy2uXD7fK4IdQkzMTC5Oz7E5AkqiMIKbN/9cWWXaMlKUtL?=
 =?us-ascii?Q?lNlMoHxxMloVxPcY9zWew2JVsXY79ieV9maiyKFKHDnPsXv8TE+pCaCvTszo?=
 =?us-ascii?Q?erxD6qSJtQ22/hkaAwXX8SsMHVTYE42u54kiUZjVlmVbg4z37Uk8a5QaEWqg?=
 =?us-ascii?Q?55inOTUS46UHUt5WTRLbfxUHojgLQyKAUtBZqx3vsT97zNeEktbnIK3pGo3P?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe4904e-fafb-4469-7a2f-08dbf56cec1d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 08:33:57.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zel0XYnntuLl4X/HMxnfv/bUBU9Qu6WE0fcjr7Sd1X0AaKQ2Mxzx7v99SE1VroFhCj6ezi4RUqO+1al+pb6JYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/time/timer_migration.c:#tmigr_cpu_activate" on:

commit: f7012466efc3b7e5a3220e702ada7e51245caf20 ("timers: Implement the hierarchical pull model")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/pushpull

in testcase: boot

compiler: clang-16
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G


we found this issue does not always happen, it happens 5 times from 12 runs.

2d179dd1eb10c403 f7012466efc3b7e5a3220e702ad
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :12          42%           5:12    dmesg.RIP:tmigr_cpu_activate
           :12          42%           5:12    dmesg.WARNING:at_kernel/time/timer_migration.c:#tmigr_cpu_activate



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202312051651.df1c0db1-oliver.sang@intel.com


[    9.780668][    T0] ------------[ cut here ]------------
[ 9.781494][ T0] WARNING: CPU: 1 PID: 0 at kernel/time/timer_migration.c:543 tmigr_cpu_activate (kernel/time/timer_migration.c:543) 
[    9.782846][    T0] Modules linked in:
[    9.783422][    T0] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.7.0-rc2-00030-gf7012466efc3 #1
[    9.784598][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 9.785955][ T0] RIP: 0010:tmigr_cpu_activate (kernel/time/timer_migration.c:543) 
[ 9.786734][ T0] Code: 8b 46 08 48 85 c0 74 96 40 80 ff ff 75 90 8b 50 04 0f b6 4e 50 c6 46 34 01 eb 8d 0f 0b eb 9c 48 89 df c6 07 00 0f 1f 00 5b c3 <0f> 0b 5b c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
All code
========
   0:	8b 46 08             	mov    0x8(%rsi),%eax
   3:	48 85 c0             	test   %rax,%rax
   6:	74 96                	je     0xffffffffffffff9e
   8:	40 80 ff ff          	cmp    $0xff,%dil
   c:	75 90                	jne    0xffffffffffffff9e
   e:	8b 50 04             	mov    0x4(%rax),%edx
  11:	0f b6 4e 50          	movzbl 0x50(%rsi),%ecx
  15:	c6 46 34 01          	movb   $0x1,0x34(%rsi)
  19:	eb 8d                	jmp    0xffffffffffffffa8
  1b:	0f 0b                	ud2    
  1d:	eb 9c                	jmp    0xffffffffffffffbb
  1f:	48 89 df             	mov    %rbx,%rdi
  22:	c6 07 00             	movb   $0x0,(%rdi)
  25:	0f 1f 00             	nopl   (%rax)
  28:	5b                   	pop    %rbx
  29:	c3                   	retq   
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	5b                   	pop    %rbx
  2d:	c3                   	retq   
  2e:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  35:	84 00 00 00 00 00 
  3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	5b                   	pop    %rbx
   3:	c3                   	retq   
   4:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
   b:	84 00 00 00 00 00 
  11:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
[    9.789140][    T0] RSP: 0018:ffffae4ac00a3e20 EFLAGS: 00010046
[    9.789949][    T0] RAX: 0000000000000000 RBX: ffff8fe5afd23e80 RCX: 00000002432da740
[    9.791058][    T0] RDX: 0000000000000001 RSI: 00000002431e6501 RDI: 00000000fffb9101
[    9.792147][    T0] RBP: 00000000fffb9164 R08: 0000000000000000 R09: 000000029cefd4df
[    9.793259][    T0] R10: 000003fffffffc00 R11: 000000000000005e R12: 0000000000000000
[    9.794348][    T0] R13: 00000000fffb9163 R14: ffff8fe5afd200c0 R15: ffff8fe5afd21340
[    9.796056][    T0] FS:  0000000000000000(0000) GS:ffff8fe5afd00000(0000) knlGS:0000000000000000
[    9.797260][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.798114][    T0] CR2: 0000000000000000 CR3: 000000030001a000 CR4: 00000000000406f0
[    9.799220][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    9.800321][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    9.801412][    T0] Call Trace:
[    9.801941][    T0]  <TASK>
[ 9.802414][ T0] ? __warn (kernel/panic.c:236 kernel/panic.c:677) 
[ 9.803020][ T0] ? tmigr_cpu_activate (kernel/time/timer_migration.c:543) 
[ 9.803723][ T0] ? report_bug (lib/bug.c:? lib/bug.c:219) 
[ 9.804369][ T0] ? handle_bug (arch/x86/kernel/traps.c:237) 
[ 9.804985][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:258) 
[ 9.805637][ T0] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 9.806335][ T0] ? tmigr_cpu_activate (kernel/time/timer_migration.c:543) 
[ 9.807049][ T0] __get_next_timer_interrupt (arch/x86/include/asm/paravirt.h:591 arch/x86/include/asm/qspinlock.h:57 include/linux/spinlock.h:204 include/linux/spinlock_api_smp.h:142 kernel/time/timer.c:2251) 
[ 9.807813][ T0] tick_nohz_stop_tick (kernel/time/tick-sched.c:912) 
[ 9.808506][ T0] tick_nohz_idle_stop_tick (kernel/time/tick-sched.c:1175) 
[ 9.809231][ T0] do_idle (kernel/sched/idle.c:170 kernel/sched/idle.c:282) 
[ 9.809819][ T0] cpu_startup_entry (kernel/sched/idle.c:379) 
[ 9.810487][ T0] start_secondary (arch/x86/kernel/smpboot.c:336) 
[ 9.811142][ T0] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:432) 
[    9.811946][    T0]  </TASK>
[    9.812432][    T0] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231205/202312051651.df1c0db1-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

