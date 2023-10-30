Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E191376
	for <oe-lkp@lists.linux.dev>; Mon, 30 Oct 2023 05:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUfdLHF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698645598; x=1730181598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bOl/rsJGkR4erhinzyUnsj3zYJcJ4WVSxZd0Yw6eqkY=;
  b=fUfdLHF+Qay7Pq3ViQKAiUbhD0b3Sdi0o4R6Dd+zZrtLV7j4t65BLmzN
   B3hOz21rqcN0SYmQRePhCzDyRswZGowCeUS+y3wUVBCVcAtXxBc/vDuRV
   8eAlUvUvppP0sV9wlNdRxwEJiF3122t1QQsXhaiGqSaMGq0TgfbEGXwBP
   95V7uMEc28VBPgfZRXSF4gRDYjvngxcO9G5p+JE2nAUV/js2h6DjtGb4A
   vwHCReGi2YjDAs18NtVffBKYyCGUCcyoP83Nae8G+1K/jv91ACrCLj+R6
   gDrEmU1DIEs+cZ86azIgss05vj6jt6Y6VPJBrXtZOkxaFz2pGj4gX7rYG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="378392021"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="378392021"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 22:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="8225014"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2023 22:59:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 22:59:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 22:59:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 29 Oct 2023 22:59:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 29 Oct 2023 22:59:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUTMkWhyXbFxRXilBDfK3JKrEdHk7TSKONpDdECLsYm0YqaGQFWytZNoj6ut3GpW5jrMiMWzv1lSCkLXamAsFW19V8kuqvRm5eyWHLv3vqmrGIDvr49vuNfQ1iIh/Rsz8RUCDTyZ38JDfAZ1hSHFUcS7atUT5n/uDGpnpBO+O7xaWu05JpzErgm2qcj52odNE94y4nVwImMPxJp95s8F7qx66X/8DrhzKgbW86TmDRpk1aRm+Ze8Na/GYrvpHu1zicGAF8Ccgos0EvRNZfVcLBpvdcGQAoUU1VUWKhrwMyDZHz4C8bAx+JZVHkkiDqnMk/xkG6m2Q3vajii32jIEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntRY27WLtU8Lua/Gfa4xVml9PJdhwvZSkoajPd1m6no=;
 b=WdGLoRfotBxsFSST8XgRCKSVNy1O/YCDPq0XTaQKpvs4DeYt30bdmOvzEGIg+b/mNj6tNTFIfykApVCs9lPZ/07S4aPIh+y7TGAUpHY6PoSalcdnk0SWlxYrhGyr1MbZvBsauZEKaKNmrwsCGAkoegM85Azh4F9yXTQVVFTlBXweN1MoLPzKz77YnqMjZdZd6DxhHu7gniC4y8lqLJ3RVRuw1PwVbjFhod6OKqmdnpf9GXNJuwZDvDQMiLZy5OhjDy0PMRvF3kVZYXG1yLD5ncpuCP2m9CzF8uUlj825amMlQ8PtYbDkJFjSB6uVe3ICQ3cFtiujvfMHQg/lF8bgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 05:59:44 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 05:59:44 +0000
Date: Mon, 30 Oct 2023 13:59:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:rcu/tasks-dev] [sched] afb666ef0f:
 WARNING:at_kernel/context_tracking.c:#ct_kernel_exit
Message-ID: <202310301259.1cfdb893-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0227.apcprd06.prod.outlook.com
 (2603:1096:4:68::35) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CH0PR11MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: cc210a85-6719-4ac5-0f0d-08dbd90d69fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mb/XkzkOSS7HkPvaKnKTc6dQLd0hjlxzdus6FGieX0FUoloQgfG77UmiESjb/NYGTAea4akMP9L8TYMIT7N1b3TVnRiCxaLu1N98c+J4NwpsFJ4XPrwFv4u6ryzob9YFleS4fynmhtN5gqDpMnkjaFMgap/Q1AyWjHmQ27Z4zrXj2kktmgEJMGH6jQO5qYs62vTqHyQWZ0NkphFhUZs1f4RjEdiGBtzEu6fk4lXfxm/tN5pfyng/kyCmOjmc1okTfSVpyTxx+AE3TVlwcW2TvRI4GYlGl//WfmP7bvucMa+rb+A2rRRA9KV3D8RJD/waf7HF8XNXYDqsTJF7p9FUd6kJiplQyUeZ66gsKz/LToczJ4F4383pPlKQdg7yy0Z1fT75CMCxO9fZLd9MdUECUTFI794HOfvAGlOAsEC/zWZGIZAzocEDRiXxCNLwViqQjQJWQwbRTKR1v5cTZbX7Wj8auukZwDqSQJpIxc6kDcOb84c2otSbFJN96tvIZ+hFqWE3BfFXzFZNrj+vlQyVB3rDVDhRlfCEYcU3kS7o9ntnI7xg7vH+X5DG8QMhmVZUfGP+VQblN+AtR9i6GMV3JkP7kVOM0Tr//ozz4HRgdNXJJET+sHOMVNVeN4u5ob7FvRh4KFyCB08izAEu5njhiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(1800799009)(64100799003)(6512007)(6666004)(6506007)(38100700002)(478600001)(966005)(6486002)(36756003)(66946007)(26005)(2616005)(83380400001)(82960400001)(1076003)(45080400002)(107886003)(66476007)(66556008)(6916009)(316002)(8936002)(8676002)(4326008)(5660300002)(86362001)(2906002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rMibVhN6FTIrSWS3lhPRceondMBwm/1Y9QUtAk1sZXuoTk0P+ZGjLbETePHd?=
 =?us-ascii?Q?/qE1Dldi4fYEbBZrFBAvAC5Iv7LJEYh4KdDlv+dNKfKoHGSffdKF8vTTs5q4?=
 =?us-ascii?Q?q7E4uSHT7sl5grJcD7qRVPaXxynDSYpLEPKxkyrxoGCAdOaymR9B0vjNoZ7I?=
 =?us-ascii?Q?EV4ZyZPAt+SY1stJd4mhYUK9chh+h1wicAdnSJZCcsNPDTO2t3CU2Q0BoJcW?=
 =?us-ascii?Q?/5rFjOTfk1ZPcd3wos5X7SSGONrB+8pAaxzajuxwfccq3YkHOFexMWw/6Mke?=
 =?us-ascii?Q?8DSQERazDRIEYFASfmo7GcvrQe4/HrtGREuH4Wgb6s4CfSKNWx14X/Qfyojz?=
 =?us-ascii?Q?MK3KGoEsKA0clT0fJmmSeB+x8tJzfFKr2wSzYAYaI+ONFVWJgZoO/8gPdheS?=
 =?us-ascii?Q?b0wWKgUTbrH2+xjDesPZvS4k/bIvwSwfaOQTCX7I0rxMFhiNfV3rzXZ+TH/W?=
 =?us-ascii?Q?wRpzEIYDN9Rzt3uTbKyCLnL6pbHohC8GLZw3P7Xv2Jk/Lzw1HfF6Iz4Uu6KQ?=
 =?us-ascii?Q?dwpEUPGiETZ9EtNPYA9/UOaz+0WspyfdFIQveGjD84p0VQ40XzO0WVKH/Wwe?=
 =?us-ascii?Q?v/rYiEuvdXwfTankjroriSXY4iO/We1k+PbmFrblcsh0xbB9OryGJOTiE9si?=
 =?us-ascii?Q?adFKP5WzGo85kGquz6Y6whpfVmAOaFFyQKS6oQXUT6asbkqyyPluCp0GcjDk?=
 =?us-ascii?Q?ESxo8PKBIIN258OfJxgxd66awKKeYXFn+l8FateqSfAJbFB8UV0filB3hThr?=
 =?us-ascii?Q?hvB7WU3PU9VsCKQSSrjzm+tIAs32Pm+7I2xLEQugckm7l2M+F2vPRQXoSBgB?=
 =?us-ascii?Q?wE3c9joGj1K/b+YvzpATObYPc9ElBdW57HhSXM747YYdMc/TbWCgkBsIXW0f?=
 =?us-ascii?Q?ofWfZAVF+FAl+T1ofm7V1gAiYhiUJ4YShYX7/skZXucDvBm/xfUhT7uXC13l?=
 =?us-ascii?Q?4ao3zq69v91UPGQqjntbOaZjkgjdK0VixLypct+9XLMPp5u9rsFRy8WdP5dU?=
 =?us-ascii?Q?frDLoQLU+t2oBBkhSlFFrs9p+GWZyuY+nDvmpVbesdxJhztC9x4Be3d4dEDX?=
 =?us-ascii?Q?f/7cJMN3EMsiqlb7oCW/qg9OB2TBBdXSd8c4JaqKyrIYF8CilVul7XPsQfdB?=
 =?us-ascii?Q?nnSsulUpGsHEMFUXQExHl2LYOZEI/IIDrHf+kghrnacH1pz34pb+3Nk/F6cL?=
 =?us-ascii?Q?nImopscSeuEc1uqkMTYzmsBTTMl+4xRhT7gfkrjI3cyfm5KH1A78KDbBJ+7w?=
 =?us-ascii?Q?tUKgP8/NTF/LZYJEaEGIswXHVPs17tEOaIugjlNyLIzpHl3EHjk5nhRLHDDa?=
 =?us-ascii?Q?7ypbGPXkGTHnSKTrK/yYMY0/BlL+TUypgIbYysoQCs2VtBtBgS82pfxsn/fB?=
 =?us-ascii?Q?6dKgwDrvGoQ76UkwPRg/xsIzvllTYqYCYjDUS3OLjUmslEZkFIwnhw7rNCwU?=
 =?us-ascii?Q?quzrMgRY31poCp98qh0oCXgNeQfRN9Tpr2Qdb8RRm7xhj/we6jVtkEWJvE/f?=
 =?us-ascii?Q?p2/BmYt+Gg1T9Hr+ibJkrhsK/Hzx6LAbleQ+OB5KAgNEbiLcvhF/kHEE96dQ?=
 =?us-ascii?Q?gpM2WKv/wPFI5D7319BYuY9ghKE+b8Xfknn+2rNr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc210a85-6719-4ac5-0f0d-08dbd90d69fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 05:59:44.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0izEJ29bk5rxdyBJY3WPRUxqSrhf30Ip9GzDhdVELMYAwkg6BaLNoUavP+ccWcf0WZk7ngEygpKC5hcCf7U45Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/context_tracking.c:#ct_kernel_exit" on:

commit: afb666ef0fcde0b2ec30b007b0b30e5622ea30f0 ("sched: Exclude CPU boot code from PF_IDLE area")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git rcu/tasks-dev

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310301259.1cfdb893-oliver.sang@intel.com


[   46.030484][    T0] ------------[ cut here ]------------
[ 46.031260][ T0] WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:141 ct_kernel_exit+0x94/0xe0 
[   46.032715][    T0] Modules linked in:
[   46.033026][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc3-00117-gafb666ef0fcd #2
[ 46.033026][ T0] RIP: ct_kernel_exit+0x94/0xe0 
[ 46.033026][ T0] Code: c0 74 02 0f 0b be 04 00 00 00 48 c7 c7 20 ae f8 9e e8 a0 a3 b6 fe 8b 05 4a a5 0d 01 48 8b 04 25 40 ca 4b 9f f6 40 2c 02 75 02 <0f> 0b 48 8b 3c 25 40 ca 4b 9f e8 ed d3 83 fe 48 c7 c7 20 ae f8 9e
All code
========
   0:	c0 74 02 0f 0b       	shlb   $0xb,0xf(%rdx,%rax,1)
   5:	be 04 00 00 00       	mov    $0x4,%esi
   a:	48 c7 c7 20 ae f8 9e 	mov    $0xffffffff9ef8ae20,%rdi
  11:	e8 a0 a3 b6 fe       	call   0xfffffffffeb6a3b6
  16:	8b 05 4a a5 0d 01    	mov    0x10da54a(%rip),%eax        # 0x10da566
  1c:	48 8b 04 25 40 ca 4b 	mov    0xffffffff9f4bca40,%rax
  23:	9f 
  24:	f6 40 2c 02          	testb  $0x2,0x2c(%rax)
  28:	75 02                	jne    0x2c
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 8b 3c 25 40 ca 4b 	mov    0xffffffff9f4bca40,%rdi
  33:	9f 
  34:	e8 ed d3 83 fe       	call   0xfffffffffe83d426
  39:	48 c7 c7 20 ae f8 9e 	mov    $0xffffffff9ef8ae20,%rdi

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 8b 3c 25 40 ca 4b 	mov    0xffffffff9f4bca40,%rdi
   9:	9f 
   a:	e8 ed d3 83 fe       	call   0xfffffffffe83d3fc
   f:	48 c7 c7 20 ae f8 9e 	mov    $0xffffffff9ef8ae20,%rdi
[   46.033026][    T0] RSP: 0000:ffffffff9ea07e30 EFLAGS: 00010046
[   46.033026][    T0] RAX: ffffffff9ea403c0 RBX: 0000000000000000 RCX: ffffffff9deb08d0
[   46.033026][    T0] RDX: fffffbfff3df15c5 RSI: 0000000000000004 RDI: ffffffff9ef8ae20
[   46.033026][    T0] RBP: 0000000000000000 R08: 0000000000000000 R09: fffffbfff3df15c4
[   46.033026][    T0] R10: ffffffff9ef8ae23 R11: 0000000000000000 R12: 1ffffffff3d40fc9
[   46.033026][    T0] R13: ffffffff9ea403c0 R14: dffffc0000000000 R15: 0000000000013b30
[   46.033026][    T0] FS:  0000000000000000(0000) GS:ffffffff9ead7000(0000) knlGS:0000000000000000
[   46.033026][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   46.033026][    T0] CR2: ffff88843ffff000 CR3: 000000019ecae000 CR4: 00000000000406f0
[   46.033026][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   46.033026][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   46.033026][    T0] Call Trace:
[   46.033026][    T0]  <TASK>
[ 46.033026][ T0] ? __warn (kbuild/src/rand-x86_64-3/kernel/panic.c:673) 
[ 46.033026][ T0] ? ct_kernel_exit+0x94/0xe0 
[ 46.033026][ T0] ? report_bug (kbuild/src/rand-x86_64-3/lib/bug.c:180 kbuild/src/rand-x86_64-3/lib/bug.c:219) 
[ 46.033026][ T0] ? handle_bug (kbuild/src/rand-x86_64-3/arch/x86/kernel/traps.c:237) 
[ 46.033026][ T0] ? exc_invalid_op (kbuild/src/rand-x86_64-3/arch/x86/kernel/traps.c:258 (discriminator 1)) 
[ 46.033026][ T0] ? asm_exc_invalid_op (kbuild/src/rand-x86_64-3/arch/x86/include/asm/idtentry.h:568) 
[ 46.033026][ T0] ? ct_kernel_exit+0x80/0xe0 
[ 46.033026][ T0] ? ct_kernel_exit+0x94/0xe0 
[ 46.033026][ T0] default_idle_call (kbuild/src/rand-x86_64-3/include/linux/cpuidle.h:135 kbuild/src/rand-x86_64-3/kernel/sched/idle.c:96) 
[ 46.033026][ T0] cpuidle_idle_call (kbuild/src/rand-x86_64-3/kernel/sched/idle.c:171) 
[ 46.033026][ T0] ? sched_clock_cpu (kbuild/src/rand-x86_64-3/kernel/sched/clock.c:270 kbuild/src/rand-x86_64-3/kernel/sched/clock.c:405) 
[ 46.033026][ T0] ? __pfx_cpuidle_idle_call (kbuild/src/rand-x86_64-3/kernel/sched/idle.c:147) 
[ 46.033026][ T0] ? __pfx_sched_clock_cpu (kbuild/src/rand-x86_64-3/kernel/sched/clock.c:389) 
[ 46.033026][ T0] ? __pfx_tsc_verify_tsc_adjust (kbuild/src/rand-x86_64-3/arch/x86/kernel/tsc_sync.c:50) 
[ 46.033026][ T0] ? lockdep_hardirqs_on_prepare (kbuild/src/rand-x86_64-3/kernel/locking/lockdep.c:4299 kbuild/src/rand-x86_64-3/kernel/locking/lockdep.c:4358) 
[ 46.033026][ T0] do_idle (kbuild/src/rand-x86_64-3/kernel/sched/idle.c:282) 
[ 46.033026][ T0] cpu_startup_entry (kbuild/src/rand-x86_64-3/kernel/sched/idle.c:378 (discriminator 1)) 
[ 46.033026][ T0] rest_init (kbuild/src/rand-x86_64-3/include/linux/rcupdate.h:745 kbuild/src/rand-x86_64-3/init/main.c:697) 
[ 46.033026][ T0] arch_call_rest_init+0xe/0x30 
[ 46.033026][ T0] start_kernel (kbuild/src/rand-x86_64-3/init/main.c:992 (discriminator 1)) 
[ 46.033026][ T0] x86_64_start_reservations (kbuild/src/rand-x86_64-3/arch/x86/kernel/head64.c:544) 
[ 46.033026][ T0] x86_64_start_kernel (kbuild/src/rand-x86_64-3/arch/x86/kernel/head64.c:486 (discriminator 17)) 
[ 46.033026][ T0] secondary_startup_64_no_verify (kbuild/src/rand-x86_64-3/arch/x86/kernel/head_64.S:433) 
[   46.033026][    T0]  </TASK>
[   46.033026][    T0] irq event stamp: 104566
[ 46.033026][ T0] hardirqs last enabled at (104565): tick_nohz_idle_enter (kbuild/src/rand-x86_64-3/arch/x86/include/asm/irqflags.h:42 (discriminator 3) kbuild/src/rand-x86_64-3/arch/x86/include/asm/irqflags.h:77 (discriminator 3) kbuild/src/rand-x86_64-3/kernel/time/tick-sched.c:1174 (discriminator 3)) 
[ 46.033026][ T0] hardirqs last disabled at (104566): do_idle (kbuild/src/rand-x86_64-3/kernel/sched/idle.c:261 (discriminator 1)) 
[ 46.033026][ T0] softirqs last enabled at (104160): __do_softirq (kbuild/src/rand-x86_64-3/arch/x86/include/asm/preempt.h:27 kbuild/src/rand-x86_64-3/kernel/softirq.c:400 kbuild/src/rand-x86_64-3/kernel/softirq.c:582) 
[ 46.033026][ T0] softirqs last disabled at (104153): irq_exit_rcu (kbuild/src/rand-x86_64-3/kernel/softirq.c:427 kbuild/src/rand-x86_64-3/kernel/softirq.c:632 kbuild/src/rand-x86_64-3/kernel/softirq.c:644) 
[   46.033026][    T0] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231030/202310301259.1cfdb893-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

