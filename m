Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258F1C2B0
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iw0zqdJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697815049; x=1729351049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWl7dd7GB82wq6DEhfcVdWeHxECdBX2eeVyrD7dsZBk=;
  b=iw0zqdJdhuz5/9A5RK4aL7fNy5bK/d8OC+9gUNPKMW8rXtprDcvUpLzU
   MtakKtF3YDgVqthq88tOtQljC9o9ylZ3PKJ/GsoZRpDInEkvC1qSojWKG
   AK3ATEN2GtLCuR++d6QXqmWP/uzXkxXZL6ZvdyUbO0DniVOYxXl+fzeN1
   yGhKn2icGeVOF7Pypvpx0t4VFCeweEjEoX6riqJ/pLYMNG/9bhVb4AI0I
   tUlJNeOclZho/1I7IcuBstrQvjMzEcg9zrVgWJLIaeBHRVKQb6Wn6oN3X
   tiGSvmrvQ5vB3q5gmIl+plqWDUA4JJ9wnEn1YFRUnysvYpTPiVo7HLWnO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="5126037"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5126037"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827755758"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="827755758"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2023 08:17:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 08:17:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 08:17:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 08:17:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 08:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9vJ+ZVPLNXIEn9PW66xltXBnDrjDzSTcw2JukksHtuZFIm28CC+fHLfL9C4Wd2cohDRtiAYqe516HMHh+GlRbFNZAa5SH3Mpg7gEyRqujqidsiEx3O5yZiVW5V0KbnCUlAYAkaeoMlZxFabR6YgyltBd8T8wWGIg05seIl/Dka+/E7OCLWp1Mt8aohY3FgF2I5/JAsY5XZzLzn5gTvdVkBW5AoSOBD+UmRhix2daXGiUT8wu47U2y3ZEyfpS6QzDUI6OBQHQ2O09eX6FIwDCE+vNpxGOyZkieEDl7aQhYjXn8uADHncgR60vq8UhUbvWKRlg0TiYr0TMOPtgyWqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Xo8G79w+qhNHZhxg6tb2WwoF8WXOa3qxbJxGdy19CE=;
 b=K1T7vKrh2ZrB5NNhhSExElkmHCboCSS6pRudw7alAk+yMtgcYB6vYMlOtIncb6xxOOq53SGxzNGfSZxEmhBQumq55+TtuFuiESUHB1Th8zZAckduXfjLBDEhEnf8l82nwgMw+QBmviRv6/itqaS3pUHpeVxE4drOA4NocduAPk3gyd3F2BdVlOPBfaTqC/cjSyaVrjKBz6rE5zqhdZOQHLSkEMPPREJXsMWYQ88WrI8bBGtqFuWvoSKTF21qqnFDj/rQRmF0lIEwoV3rMW7stwVOpkf4AZBAY2HhzZGakuBtagfDrmtTFIQlI8Zr3q5xKetqD9gzcWj/lCVbGLbJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 15:17:23 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Fri, 20 Oct 2023
 15:17:23 +0000
Date: Fri, 20 Oct 2023 23:17:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-kitchen-sink] [dyndbg]  64261c3ad0:
 BUG:TASK_stack_guard_page_was_hit_at#(stack_is#..#)
Message-ID: <202310202332.2a4dcca1-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU1PR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:802:18::33) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f8ac8a-29e0-45b0-c9c6-08dbd17fa8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yDOo+EAiLGs+WZ6q5c9vXRkBo5XgALG7f/IVLZV+Gm6S6uLHyHtuRpnrCFTUHv8XTzTj9Bl90C8hkPI22T2LxMseSBstWNztiRb9sgqHM485Ingaiq8+T31WVObf/l+H3/z6o2F9VI2VKI2P16EnpozyVKRKroBZKpeaegFnZXg+VS+sdi8ZWuxg+PGgpcN6KbdZST1ojttEJUZ3ZQiWabfg243+x2sTefWH52bgCCucDvfRlv7lVURjUtKuzR+G8s2a2fmwRgw3MTOiOQeJP5LCtkSMRdx14R5tKWZw+wY7cL5Whmi82lav5le8+0IkOf12CsFt8zi2r7DpGAiq+Jd3kkgDB5h6otzoQlFDii6CH9PxUvogWobWyDGU+h0VNnta0AhcY5qMZiBogrXYFl7z1rGxQPUYaTTiQsFOwl4p1pnCHov10c1MvNc+f/6FKpLrnrQr4ndmfcPCbASXIW5ue+DpYJMluZFBAqeBZ4LVBb8BOFETykpPF2wVGBezHjDJ6dNGJbbNZq8calPne/mzo5/SEssHg4iwPHXoAo5cq9CJkIKUBA4c3MvGko+8iUiG+qlxMFk7+oCTxNuYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(83380400001)(1076003)(107886003)(2616005)(26005)(4326008)(8676002)(2906002)(30864003)(36756003)(86362001)(8936002)(82960400001)(5660300002)(6916009)(6512007)(6666004)(6506007)(6486002)(316002)(66946007)(66476007)(66556008)(41300700001)(966005)(478600001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f1DcRCVY4NFpUZWD50q+bBzkgN+gnP7Kcva2amXg03GjQadbKTMaPoUF8E8N?=
 =?us-ascii?Q?KMiXPmoLr17mvszsPd0jDqLAQeaYukRUGhuhuq161u6a6O7vT4aMGsHGnu8u?=
 =?us-ascii?Q?EEOYtdRbsOtFdg5wS8Pp01ttuJirgldLQoMwcJHT1/OyLOo9rPfCcQKjOSm5?=
 =?us-ascii?Q?n+YREu1ucfDmLZKX5QO/JdfmKU5+s1Rk/Ia6yAnmy9xnRbqtltGPiieUvhrq?=
 =?us-ascii?Q?HxAVLDPRr3KmRBlNoV6l4t5xOgj0ByDkVsVQnhzNTrNE+l0WwVI+1/wn/VAD?=
 =?us-ascii?Q?Kicz8RJIR5mgnxlQCdOgE3f8kdk59FoMYTN4NlzItjXyCnzE7yfp8EDCrthx?=
 =?us-ascii?Q?aCtav1Sy+ElD91THP4UU7N7jFdcrXLtO82Ztp3+Av7mEez+ThCazqqRwQkOk?=
 =?us-ascii?Q?Yslvu7e7h4PMJN1A4dr5rCX7ayBfwMaM5ihNIVKTwgGwQsatAKvzQxHB+d2E?=
 =?us-ascii?Q?qT8luTbPwTKDO3SvTX7iUlaL/vAd7IJqPd1g9x/ma/PCG4uIp3mUKCv8VsBf?=
 =?us-ascii?Q?TMw+In3GbQSB8T5S57yLet0o7UggyPTu6Yu/ZYKvHlfMHEkEHdwNLCUkJCSH?=
 =?us-ascii?Q?AXsEKBsKtgNXBpPAAiC8p7LRTEe9DhqnBDW+mTsE2t/mu880BrkJeeqiBptq?=
 =?us-ascii?Q?oT6sjOqwIKpWcOdLbLzZtBRXheIpXJPS21g4MlYcJaAPmHXhRdqtVtV99WEH?=
 =?us-ascii?Q?2cbthkBsxHmc3H1R+W2MfYP18UF5WaS3bGy1ZQMkwCWZ9hQ3LQ3rCo87jb8V?=
 =?us-ascii?Q?e2dPodHX7t6t/iw7+ejsSwQQssfgaZr5roWmLaUnW+ngWuvz2x5YUPHfUm5H?=
 =?us-ascii?Q?IMmNanhm7ZqfInZCbB9vfS5tmaKuRRgu0afuEf1GhcwHWulTSRDa4VtZbusD?=
 =?us-ascii?Q?gJ1aAWoedPFV2QjXOKeAfRAUpK0LhjrSbjMg64h34MzJjogEpaEQP3H8xR29?=
 =?us-ascii?Q?LNvk4rwU1DBcKiPrBaLN4cn6HxqbIqnWGZ8Ee8WgSauk39CZ5LG4TM4cx4Bj?=
 =?us-ascii?Q?uq2AAzneCe4pAgfSS6IWWSZu+BRFUpqDIjdCS/p2mwHLwaYfLVTJ1eCQdX4n?=
 =?us-ascii?Q?MCw+0sMHWUksz78vH833Vzle5OO/5kktjJqBEiq+TPGh/uzq5utFjOkCYNYl?=
 =?us-ascii?Q?NV0iFiixc5vdNL8/S1JTkPtDwKn0mR6Vwva1RlcFgNaAgFoNqXYFYffcJugX?=
 =?us-ascii?Q?ETGhQDS6BG/nN/NceGZEyy1MOTF+1tdgEmXsG+kNa10FD/+Aknp9mvqSyPGM?=
 =?us-ascii?Q?93fZpee3Saa8ni1FZBlUgeUpYBjGVv6/njSYW6GIOB/aw55ZlV14gN8d4wdv?=
 =?us-ascii?Q?54fyPeBoofBdglMA0rws6KLhgLn/KrM2pcE8lqyCEUibiMMRNVq80ElFKZye?=
 =?us-ascii?Q?/FHoQdmvqR6Cv/wTWVX6/j8B92REwM4Dsfc6jRjIoI0zzA9GRAh7oDmIgyFG?=
 =?us-ascii?Q?Ai4eMIPjtCbFaqgfSGas4zxor4c3sTxi1JUuzqkBj0X2UvkD8yHnWEJqXhGe?=
 =?us-ascii?Q?DVEI/RGUGfwJidrAG3yELNzLgGvOE4imlGkaTyeIwU1V/EpfG1LqoYIrz+LA?=
 =?us-ascii?Q?dBJd2OsyKFZ3LPp+EwtbJEQB2WHSDOl0mHM2lDhGHf5wpST21pEUpkTWoytl?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f8ac8a-29e0-45b0-c9c6-08dbd17fa8a9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 15:17:22.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AbNAsDenAjFyIrZiyAE0Ho7+vi7r4waiSIpoxzVds8S/LjJ5HBrPR614aAkUtj/NPY4QhZ+Jm/etuAgWTKWNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:TASK_stack_guard_page_was_hit_at#(stack_is#..#)" on:

commit: 64261c3ad071780c4b9455ebf4767f105ddc2b79 ("dyndbg: cache the dynamically generated prefixes per callsite")
https://github.com/jimc/linux.git dd-kitchen-sink

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20230715
with following parameters:

	test: tracing



compiler: gcc-12
test machine: 16 threads 1 sockets Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz (Broadwell-DE) with 48G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310202332.2a4dcca1-oliver.sang@intel.com


[  378.654196][    C3] BUG: TASK stack guard page was hit at 000000005b787114 (stack is 0000000024ca83b8..000000000d3fb8a1)
[  378.654204][    C3] stack guard page: 0000 [#1] PREEMPT SMP KASAN PTI
[  378.654209][    C3] CPU: 3 PID: 1667 Comm: in:imklog Tainted: G S                 6.6.0-rc6-00034-g64261c3ad071 #1
[  378.654214][    C3] Hardware name: Supermicro SYS-5018D-FN4T/X10SDV-8C-TLN4F, BIOS 1.1 03/02/2016
[ 378.654217][ C3] RIP: 0010:format_decode (lib/vsprintf.c:2526) 
[ 378.654227][ C3] Code: 90 48 b8 00 00 00 00 00 fc ff df 41 57 4c 8d 7e 07 41 56 4c 89 f9 41 55 48 c1 e9 03 49 89 f5 41 54 55 48 89 fd 53 48 83 ec 68 <48> c7 44 24 08 b3 8a b5 41 4c 8d 64 24 08 48 c7 44 24 10 b0 6b 44
All code
========
   0:	90                   	nop
   1:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   8:	fc ff df 
   b:	41 57                	push   %r15
   d:	4c 8d 7e 07          	lea    0x7(%rsi),%r15
  11:	41 56                	push   %r14
  13:	4c 89 f9             	mov    %r15,%rcx
  16:	41 55                	push   %r13
  18:	48 c1 e9 03          	shr    $0x3,%rcx
  1c:	49 89 f5             	mov    %rsi,%r13
  1f:	41 54                	push   %r12
  21:	55                   	push   %rbp
  22:	48 89 fd             	mov    %rdi,%rbp
  25:	53                   	push   %rbx
  26:	48 83 ec 68          	sub    $0x68,%rsp
  2a:*	48 c7 44 24 08 b3 8a 	movq   $0x41b58ab3,0x8(%rsp)		<-- trapping instruction
  31:	b5 41 
  33:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
  38:	48                   	rex.W
  39:	c7                   	.byte 0xc7
  3a:	44 24 10             	rex.R and $0x10,%al
  3d:	b0 6b                	mov    $0x6b,%al
  3f:	44                   	rex.R

Code starting with the faulting instruction
===========================================
   0:	48 c7 44 24 08 b3 8a 	movq   $0x41b58ab3,0x8(%rsp)
   7:	b5 41 
   9:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
   e:	48                   	rex.W
   f:	c7                   	.byte 0xc7
  10:	44 24 10             	rex.R and $0x10,%al
  13:	b0 6b                	mov    $0x6b,%al
  15:	44                   	rex.R
[  378.654230][    C3] RSP: 0018:ffffc90001737fc8 EFLAGS: 00010292
[  378.654237][    C3] RAX: dffffc0000000000 RBX: ffffc90001738148 RCX: 1ffff920002e7016
[  378.654240][    C3] RDX: 0000000000000000 RSI: ffffc900017380b0 RDI: ffffffff83e4c360
[  378.654243][    C3] RBP: ffffffff83e4c360 R08: 0000000000000008 R09: 0000000000000001
[  378.654246][    C3] R10: ffff888c7398cc3b R11: 000000000000000a R12: ffffc900017380b0
[  378.654249][    C3] R13: ffffc900017380b0 R14: 0000000000000008 R15: ffffc900017380b7
[  378.654252][    C3] FS:  00007f74749046c0(0000) GS:ffff888bcab80000(0000) knlGS:0000000000000000
[  378.654255][    C3] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  378.654258][    C3] CR2: ffffc90001737fb8 CR3: 0000000c71652002 CR4: 00000000003706e0
[  378.654261][    C3] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  378.654264][    C3] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  378.654267][    C3] Call Trace:
[  378.654270][    C3]  <#DF>
[ 378.654274][ C3] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 378.654284][ C3] ? handle_stack_overflow (arch/x86/kernel/traps.c:327) 
[ 378.654295][ C3] ? exc_double_fault (arch/x86/kernel/traps.c:378) 
[ 378.654311][ C3] ? asm_exc_double_fault (arch/x86/include/asm/idtentry.h:611) 
[ 378.654331][ C3] ? format_decode (lib/vsprintf.c:2526) 
[  378.654340][    C3]  </#DF>
[  378.654342][    C3]  <TASK>
[ 378.654349][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.654361][ C3] vsnprintf (lib/vsprintf.c:2772) 
[ 378.654370][ C3] ? __task_pid_nr_ns (kernel/pid.c:497) 
[ 378.654380][ C3] ? pointer (lib/vsprintf.c:2749) 
[ 378.654385][ C3] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:419) 
[ 378.654393][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.654398][ C3] ? __task_pid_nr_ns (kernel/pid.c:497) 
[ 378.654412][ C3] snprintf (lib/vsprintf.c:2948) 
[ 378.654420][ C3] ? vsprintf (lib/vsprintf.c:2948) 
[ 378.654434][ C3] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:419) 
[ 378.654447][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:911) 
[ 378.654460][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2)) 
[ 378.654469][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926) 
[ 378.654477][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125) 
[ 378.654488][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.654510][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.654517][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654531][ C3] kmemleak_alloc (mm/kmemleak.c:978) 
[ 378.654541][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 378.654547][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654558][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654567][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043) 
[ 378.654578][ C3] kstrdup (mm/util.c:62) 
[ 378.654588][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654599][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914) 
[ 378.654610][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2)) 
[ 378.654618][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926) 
[ 378.654627][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125) 
[ 378.654638][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.654660][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.654667][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654681][ C3] kmemleak_alloc (mm/kmemleak.c:978) 
[ 378.654690][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 378.654694][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654706][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654714][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043) 
[ 378.654725][ C3] kstrdup (mm/util.c:62) 
[ 378.654733][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654745][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914) 
[ 378.654755][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2)) 
[ 378.654763][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926) 
[ 378.654772][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125) 
[ 378.654783][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.654805][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.654812][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654826][ C3] kmemleak_alloc (mm/kmemleak.c:978) 
[ 378.654835][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 378.654840][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654851][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654859][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043) 
[ 378.654870][ C3] kstrdup (mm/util.c:62) 
[ 378.654878][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654890][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914) 
[ 378.654900][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2)) 
[ 378.654908][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926) 
[ 378.654917][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125) 
[ 378.654928][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.654950][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.654957][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654971][ C3] kmemleak_alloc (mm/kmemleak.c:978) 
[ 378.654980][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 378.654984][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.654996][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655004][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043) 
[ 378.655014][ C3] kstrdup (mm/util.c:62) 
[ 378.655023][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655034][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914) 
[ 378.655052][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2)) 
[ 378.655067][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926) 
[ 378.655082][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125) 
[ 378.655104][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.655149][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.655161][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655175][ C3] kmemleak_alloc (mm/kmemleak.c:978) 
[ 378.655184][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 378.655189][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655201][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655209][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043) 
[ 378.655220][ C3] kstrdup (mm/util.c:62) 
[ 378.655228][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655240][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914) 
[ 378.655251][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2)) 
[ 378.655259][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926) 
[ 378.655267][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125) 
[ 378.655278][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142) 
[ 378.655300][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649) 
[ 378.655308][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887) 
[ 378.655322][ C3] kmemleak_alloc (mm/kmemleak.c:978) 
[ 378.655330][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231020/202310202332.2a4dcca1-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

