Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744F374
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jul 2023 04:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688358998; x=1719894998;
  h=date:from:to:cc:subject:message-id:reply-to:mime-version;
  bh=YXIGxLaUWgiOlSggJVP80Ald3+i+SR4RMGGz81rv0Ss=;
  b=RFeklz1MnSW+rKn/rMyI6EGc/48DEChSe3m3FQXvn1wOE/Elx/4HUU4g
   JZmfXPzKZckU1DkweMLNe9uhnC0ok50L7VmKeCQ6Pf6QuQkocNzyXhF/1
   IYoGHFvpccWUoTNxnWn8HOB8Iuk0jok/gMWy2z6Mw230vDX6gNI+gaNq7
   7LF5Ups3mEkTPAzfmcYz95Nn5hGZ8WcNXAiW+vx+NB/Yc8KqAeyqGNByc
   XIdtzKoQXk98Lk3Gso7tb+wHVnLc+auFelOLtlpsWMe7uc/za/DlM0ERT
   yeCATfoub8AUjXM+41XpvjHX+xE7C4qNpc8JqLSe1XtZOAobtO17m3Fl5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="347570312"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="xz'341?scan'341,208,341";a="347570312"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 21:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="721639280"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="xz'341?scan'341,208,341";a="721639280"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jul 2023 21:36:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 2 Jul 2023 21:36:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 2 Jul 2023 21:36:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 2 Jul 2023 21:36:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 2 Jul 2023 21:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzVdJ4mR6IF8ye31qnHrXYxNnw+fHYdCFOwHhHcCqDZ83gar8aT2QVW4Sztr/NmKMbhqBBthGIYIV6ksu2KKHt3Xi+XTt+isjlAASUSz0CmBHigZecBUKkW0hbg32yVc5F2A0HyjiGwjXaVl0WgxR3GrkGKCOGwBoaUf/9D0NncNxNqrSiU2UNter+IyWaJz5sPyMX/wySgAvh5ewNoebZkfFIvsfOtkTRMuS2Mg5le6698M8iYBrleFbshEfQfqQa+GK/gph+6HQyKgMBrREVdfDUQwWK5qvlB3BILYV5a7o51bHjCHWvFSx7WY92KgM6tMrURzztsi0c+E+R2OQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqWLVeWDrTxo69lypLJ6/fHz32NaNJCT5ukBsehBtQY=;
 b=iPQ/XrfzvF2A0bjJzXxtY5/AiIbfk/Jq+L2afSeXeeYr32dDBdqj5qtY17fVH5r/8sS8iKGQEJCgoe+LHuQhLXJKXSOZBeNpuGgTwEcoX0SC8eTxRaM7apucJR9z8yvliXgnQSkHrhH1sY2MQ3hJGLK+pjnUdGENoDa6WUZbCi3R+xZ9ekdSaNUM0sYNCzMBjr4SCKt0eRzJyoY1Gmedab73t3rgeri+txQ5Tu3v9Ydf4GjVucr4YK6zKtzv78lGsERHZ4M1se/AYmDYoiaK3uVfZzXcJ5tliKtLIR92p+XavLTiDeXHs2ueFVlxAFbSzvfWxMSML/bpVLnXhdDqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB6792.namprd11.prod.outlook.com (2603:10b6:a03:485::22)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 04:36:30 +0000
Received: from SJ0PR11MB6792.namprd11.prod.outlook.com
 ([fe80::b6b6:4109:345a:2aab]) by SJ0PR11MB6792.namprd11.prod.outlook.com
 ([fe80::b6b6:4109:345a:2aab%4]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 04:36:30 +0000
Date: Mon, 3 Jul 2023 12:36:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [perf]  c73cfb9741:
 WARNING:at_kernel/events/callchain.c:#get_callchain_buffers
Message-ID: <ZKJQRUkVdtlPgSSW@xsang-OptiPlex-9020>
Reply-To: lkp <oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="VavDzlno0Iki4VjV"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To SJ0PR11MB6792.namprd11.prod.outlook.com (2603:10b6:a03:485::22)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB6792:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 987fddb7-d049-473c-ca73-08db7b7f11f6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INPihy64JyqjCT/SndQbXv7BJNJ6Yb7WXy2ebC/ez9U7dY9HlyoKpA+T30grQ9zqUvgpPS2pat29u+nvs5x1wCvF9Y6gf4ZiLJWpNxNJ6u5NOqv++v3xH+gfP2ibOeDBrcH0PHTbywkABarEmvoeIPKw6hF0hfJDHmo048ibE4uE54kEcRT+/ogrJ4yzdiragfQGti9kF1N0mwUdtAGJqSWIGPg+6V0TlF/eEMpgphjcoCqnkLXTOY2t/p4sFMMfJHwsGjbKLbH3xTYjInDzobgzqSjbxlh3pTB0NjTJLqhyeV55XA1Fsyj3RY14qf2qgjjTBZUxrrqvVlxBThofbKKB4BRAudPaTZU+/R34o8k8SeZkMy6SLbCAipIb+AZZVvXP3V1HfMKd3etdoM4uknEr81xRuSB9GvKbkE0PSq3U9AWjnhgEO6MIiVgcoRGgtwgZkM91tQ11AGbIUlkhwMYH4VBXQDJ+QOQQmUe9TwuV8b6vcCKBAIwqnp7UW+9s7XEd42zjlv1uy3104AciG5BfMsTiaB3ksjCB22iMXmC8rzdIGWo8AdMZuCl7lYSdcJ9T615mKpqNis+IuZPspMtvPP8fOlsYLEYPMY3SJMutYNXV354iavpbBH2bUgVi4XDBH9r/UpvOfWR6rmRyeJbxeotQqKYHwTxIeUg7uSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199021)(2906002)(478600001)(26005)(9686003)(6666004)(6486002)(86362001)(966005)(44144004)(3450700001)(41300700001)(8676002)(8936002)(235185007)(5660300002)(316002)(66556008)(66476007)(66946007)(38100700002)(45080400002)(6916009)(4326008)(6506007)(82960400001)(6512007)(33716001)(186003)(83380400001)(107886003)(2700100001)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H/kpYKB5V6g2SWcFTqajbav3QZb0XNan4JSCsk9sZlvCf7iLMsiEUUcCTbze?=
 =?us-ascii?Q?sC6N71j7lSt7KTImBdyNrCA05qQT+QkpB+te/bWdM4VRp3uRRbY6TwQJZiod?=
 =?us-ascii?Q?SyS6llWU1WHXYF01U46qXn3E2782hcqS2vXmBXyuZTfi2wH+g/V3nd2mHIhM?=
 =?us-ascii?Q?geSMbU1oRNsfJP4aFwF7sfgnut/rvcQbScfDnVyL55X1T96p6wyYN1ryRmLh?=
 =?us-ascii?Q?tA0U+rDh3o7zfgdMTfiPWuetu65JvO1Q9G85aLhVF1vTQrY5XExzWjdenRDM?=
 =?us-ascii?Q?JZATd7hJscFFSu+/lDkI7ytNP1aQPcJEmYafSFksqyx+8Cvmtr8/J07MpLpG?=
 =?us-ascii?Q?fAHp0wtCirhCof3kl4RYg7cpTIB3GpfOUsrTzEWQrAjx7jjrKz85/pRtisci?=
 =?us-ascii?Q?0Udjoz/E1jSknBb3VQdR/sxV4gDC/nmH5w78VTI3+MrcmiqSoItduHVtH+P9?=
 =?us-ascii?Q?dts11wrDPF/boEwdR4zgN4YSzyMZUDTNWUcjwzFZZm7ISCqNoSm60NJPe9Zy?=
 =?us-ascii?Q?14q4AfaPeTZCQYrKCgOtFSenePBcoq6wegp7uSYFzYdDZ+lBvhnehqTtG8su?=
 =?us-ascii?Q?Pk3LXk8jqLXSRzwSnE8clWc7MWZQ/Jwjv9U7joUZ7smAHFOiLqzP27Kj49i1?=
 =?us-ascii?Q?0zFDdsm6VrWubkfGFv7fyTLH3CY7hEniYuo28MW/yRKn8jo/OTlejOdw1kkG?=
 =?us-ascii?Q?PnoxIOfeSw1fMw9IJWOMsAiIub8k6hD7KbKNJW7Qx/RycElMvS9P+j8/oaVZ?=
 =?us-ascii?Q?erbn32TdP1o03ESkGmhGRky2uOJpReVSZLNpgpowYVAv2qBIrpsda/6AqP5E?=
 =?us-ascii?Q?3r5H2T01BH4kx27Ttt7qdcjhDen+5nb/xo1EMBo+hZwRiIOO8XOMHps+V1wt?=
 =?us-ascii?Q?qgG4Ak1PnUCDE9GwSuWgwcTuzMJoni6JwXjeWlBnH/cOBMU3hOq1c8lV/RGr?=
 =?us-ascii?Q?WTTKd+MkYjYZ+/Ci3IFlNIgHU2EDp5sLMePs1EQue6SfSjE+nJJr5O4oVRY5?=
 =?us-ascii?Q?mb+w720r/LaRKQkS5kBNrbdEA7Fc92QcVGX1C2tRQaQaw1YvT+b0GjfRJr7B?=
 =?us-ascii?Q?juOFoXNSXCcAZGhM9LBpJbVD8M3+P9bQSexRiMfVHYfu6tNmRJsU+PP6wPh9?=
 =?us-ascii?Q?cqVGY8tIncxPECcrWX7TDnOG5UGjfv+GtsVwGZO3waRD5bfOb4FzYNZAkds2?=
 =?us-ascii?Q?vpUKQfdTBPeuD4dIyfq6u7LZyIC0dbQJbOeMl9UDCW9kP/9x5bZxyqPPImDA?=
 =?us-ascii?Q?d/stpsaf+UMmGu4fa16i3+X3d0oDgR+EDC+bqu+k2sft784GIKuiOUkZ+nTL?=
 =?us-ascii?Q?vTFttenJ2TZVPr81Nj9aXBAW9bu/5DdroItIkXKb1FR1pogBok64xWW/moA/?=
 =?us-ascii?Q?8wFW4BmhToR7vX1qa7BXT9jC35iIDDvi7I6eZtL0j8vQgqM9AFvshEIdZDPM?=
 =?us-ascii?Q?yclKn4xg6JEKO0nHyzaXGcNK7F9BVCeEEuefD5wZ0e9ERFCBx+TP10a9lCTb?=
 =?us-ascii?Q?uQqZkm89aUOS7vJFHUl8LZ1o1cjuV/GodPJAiy42VA3Imr+GDaFD3Vr7myHN?=
 =?us-ascii?Q?TrCg2kJSbRupAAxYIrg9byYToH3Agrv2SGpQl28emdut8Nx9cf4MWj55hEAt?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 987fddb7-d049-473c-ca73-08db7b7f11f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 04:36:30.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hohnbP2wdEyc6V6x3oWUzUXJjiHLtfw9i/9Yl0jGgjuQIqGQQbJl0u+beMqBfl9Kq6NYgcazLRwFkJXFNGWblQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
X-OriginatorOrg: intel.com

--VavDzlno0Iki4VjV
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Greeting,

FYI, we noticed the following commit (built with clang-15):

commit: c73cfb97418ba174e8b5c7a3544a803d35874daa ("perf: Simplify perf_event_alloc() error path")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git core/guards2

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 600s

test-description: Trinity is a linux system call fuzz tester.
test-url: http://codemonkey.org.uk/projects/trinity/


on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):



If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


[ 23.305564][ T391] WARNING: CPU: 0 PID: 391 at kernel/events/callchain.c:116 get_callchain_buffers (kernel/events/callchain.c:116) 
[   23.306412][  T391] Modules linked in: bochs crc32_pclmul aesni_intel libaes drm_vram_helper drm_ttm_helper ttm input_leds drm_kms_helper intel_agp intel_gtt serio_raw i2c_piix4 i6300esb agpgart evdev drm drm_panel_orientation_quirks
[   23.308125][  T391] CPU: 0 PID: 391 Comm: trinity-main Not tainted 6.4.0-00031-gc73cfb97418b #1
[   23.308867][  T391] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 23.309751][ T391] RIP: 0010:get_callchain_buffers (kernel/events/callchain.c:116) 
[ 23.310265][ T391] Code: 89 c5 39 2d 9a 0e 98 01 76 12 48 63 c5 49 8b 7c c4 10 e8 93 70 04 00 48 ff c5 eb ce 4c 89 e7 e8 86 70 04 00 e9 cf fe ff ff 90 <0f> 0b 90 41 be ea ff ff ff e9 c0 fe ff ff 00 00 48 c7 c7 00 69 08
All code
========
   0:	89 c5                	mov    %eax,%ebp
   2:	39 2d 9a 0e 98 01    	cmp    %ebp,0x1980e9a(%rip)        # 0x1980ea2
   8:	76 12                	jbe    0x1c
   a:	48 63 c5             	movslq %ebp,%rax
   d:	49 8b 7c c4 10       	mov    0x10(%r12,%rax,8),%rdi
  12:	e8 93 70 04 00       	call   0x470aa
  17:	48 ff c5             	inc    %rbp
  1a:	eb ce                	jmp    0xffffffffffffffea
  1c:	4c 89 e7             	mov    %r12,%rdi
  1f:	e8 86 70 04 00       	call   0x470aa
  24:	e9 cf fe ff ff       	jmp    0xfffffffffffffef8
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
  33:	e9 c0 fe ff ff       	jmp    0xfffffffffffffef8
  38:	00 00                	add    %al,(%rax)
  3a:	48                   	rex.W
  3b:	c7                   	.byte 0xc7
  3c:	c7                   	.byte 0xc7
  3d:	00 69 08             	add    %ch,0x8(%rcx)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
   9:	e9 c0 fe ff ff       	jmp    0xfffffffffffffece
   e:	00 00                	add    %al,(%rax)
  10:	48                   	rex.W
  11:	c7                   	.byte 0xc7
  12:	c7                   	.byte 0xc7
  13:	00 69 08             	add    %ch,0x8(%rcx)
[   23.311888][  T391] RSP: 0018:ffff888149cc7d78 EFLAGS: 00010a12
[   23.312405][  T391] RAX: 00000000fffffffc RBX: 000000000000007f RCX: ffff88842fa1c660
[   23.313050][  T391] RDX: ffffffff834757d0 RSI: ffffffff82ad7f00 RDI: ffff888149cc0e80
[   23.313700][  T391] RBP: ffffffff82ad6b50 R08: 0000000000049ee0 R09: 0000000000000000
[   23.314362][  T391] R10: ffffffff83a24078 R11: 0000000000000000 R12: 0000000000000000
[   23.314989][  T391] R13: ffff888149cc7e58 R14: 00000000000000ff R15: ffff88814e32e5b0
[   23.315629][  T391] FS:  0000000000000000(0000) GS:ffff88842fa00000(0063) knlGS:00000000f7f55280
[   23.316344][  T391] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   23.316879][  T391] CR2: 000000005726700c CR3: 0000000143488000 CR4: 00000000000406f0
[   23.317552][  T391] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   23.318222][  T391] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   23.318863][  T391] Call Trace:
[   23.319158][  T391]  <TASK>
[ 23.319400][ T391] ? __warn (kernel/panic.c:235 kernel/panic.c:673) 
[ 23.319746][ T391] ? get_callchain_buffers (kernel/events/callchain.c:116) 
[ 23.320198][ T391] ? report_bug (lib/bug.c:?) 
[ 23.320570][ T391] ? handle_bug (arch/x86/kernel/traps.c:324) 
[ 23.320926][ T391] ? exc_invalid_op (arch/x86/kernel/traps.c:345) 
[ 23.321319][ T391] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 23.321737][ T391] ? get_callchain_buffers (kernel/events/callchain.c:116) 
[ 23.322193][ T391] ? get_callchain_buffers (kernel/events/callchain.c:?) 
[ 23.322633][ T391] perf_event_alloc (kernel/events/core.c:12037) 
[ 23.323046][ T391] __se_sys_perf_event_open (kernel/events/core.c:12462) 
[ 23.323542][ T391] ? local_clock (kernel/sched/clock.c:301) 
[ 23.323911][ T391] __do_fast_syscall_32 (arch/x86/entry/common.c:112) 
[ 23.324334][ T391] do_fast_syscall_32 (arch/x86/entry/common.c:203) 
[ 23.324736][ T391] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:122) 
[   23.325264][  T391] RIP: 0023:0xf7f5a539
[ 23.325594][ T391] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
All code
========
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
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
  32:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  39:	00 00 00 
  3c:	0f                   	.byte 0xf
  3d:	1f                   	(bad)
  3e:	44                   	rex.R
	...

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
   8:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   f:	00 00 00 
  12:	0f                   	.byte 0xf
  13:	1f                   	(bad)
  14:	44                   	rex.R
	...
[   23.327132][  T391] RSP: 002b:00000000ff8f03ec EFLAGS: 00000286 ORIG_RAX: 0000000000000150
[   23.327811][  T391] RAX: ffffffffffffffda RBX: 0000000057267610 RCX: 0000000000000187
[   23.328457][  T391] RDX: 00000000ffffffff RSI: 00000000ffffffff RDI: 0000000000000008
[   23.329129][  T391] RBP: 00000000f7d82525 R08: 0000000000000000 R09: 0000000000000000
[   23.329795][  T391] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[   23.330469][  T391] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   23.331162][  T391]  </TASK>
[   23.331433][  T391] irq event stamp: 2862543
[ 23.331800][ T391] hardirqs last enabled at (2862551): __up_console_sem (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 kernel/printk/printk.c:347) 
[ 23.332595][ T391] hardirqs last disabled at (2862560): __up_console_sem (kernel/printk/printk.c:345) 
[ 23.333391][ T391] softirqs last enabled at (2862030): __irq_exit_rcu (kernel/softirq.c:630) 
[ 23.334181][ T391] softirqs last disabled at (2862025): __irq_exit_rcu (kernel/softirq.c:630) 
[   23.334954][  T391] ---[ end trace 0000000000000000 ]---
[   23.522897][  T391] UDPLite: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
[  OK  ] Started System Logging Service.
[   23.775407][  T391] UDPLite6: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
[   25.125915][  T206] is_virt=true
[   25.125934][  T206]
[   26.251982][  T206] lkp: kernel tainted state: 0
[   26.252000][  T206]
[   27.020544][  T206] LKP: stdout: 191: Kernel tests: Boot OK!
[   27.020567][  T206]
[   30.212021][  T206] LKP: stdout: 191: HOSTNAME vm-snb, MAC 52:54:00:12:34:56, kernel 6.4.0-00031-gc73cfb97418b 1
[   30.212043][  T206]
[   30.546764][  T206] install debs round one: dpkg -i --force-confdef --force-depends /opt/deb/gawk_1%3a5.1.0-1_i386.deb
[   30.546808][  T206]
[   30.549373][  T206] Selecting previously unselected package gawk.
[   30.549388][  T206]
[   30.552482][  T206] (Reading database ... 16439 files and directories currently installed.)
[   30.552500][  T206]
[   30.555536][  T206] Preparing to unpack .../deb/gawk_1%3a5.1.0-1_i386.deb ...
[   30.555549][  T206]
[   30.557328][  T206] Unpacking gawk (1:5.1.0-1) ...
[   30.557339][  T206]
[   30.558904][  T206] Setting up gawk (1:5.1.0-1) ...
[   30.558915][  T206]
[   30.560804][  T206] NO_NETWORK=


To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-00031-gc73cfb97418b .config
	make HOSTCC=clang-15 CC=clang-15 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=clang-15 CC=clang-15 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



--VavDzlno0Iki4VjV
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="config-6.4.0-00031-gc73cfb97418b"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.4.0 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=150007
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=150007
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=150007
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
CONFIG_KERNEL_BZIP2=y
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
CONFIG_CONTEXT_TRACKING_USER_FORCE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_BOOST is not set
CONFIG_RCU_NOCB_CPU=y
CONFIG_RCU_NOCB_CPU_DEFAULT_ALL=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
# CONFIG_NUMA_BALANCING_DEFAULT_ENABLED is not set
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_SCHED_MM_CID=y
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
# CONFIG_RD_ZSTD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_ELF_CORE is not set
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
# CONFIG_RUST is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
CONFIG_X86_CPU_RESCTRL=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
CONFIG_ACRN_GUEST=y
# CONFIG_INTEL_TDX_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=y
# CONFIG_X86_MCELOG_LEGACY is not set
# CONFIG_X86_MCE_INTEL is not set
CONFIG_X86_MCE_INJECT=y

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
# CONFIG_PERF_EVENTS_INTEL_RAPL is not set
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
# CONFIG_MICROCODE_INTEL is not set
# CONFIG_MICROCODE_LATE_LOADING is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
# CONFIG_X86_PAT is not set
# CONFIG_X86_UMIP is not set
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
CONFIG_X86_SGX=y
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_ADDRESS_MASKING=y
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
CONFIG_DEBUG_HOTPLUG_CPU0=y
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
# CONFIG_ACPI_HOTPLUG_MEMORY is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_LTO=y
CONFIG_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_HAS_LTO_CLANG=y
# CONFIG_LTO_NONE is not set
# CONFIG_LTO_CLANG_FULL is not set
CONFIG_LTO_CLANG_THIN=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_HAVE_ARCH_NODE_DEV_GROUP=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_TRIM_UNUSED_KSYMS=y
CONFIG_UNUSED_KSYMS_WHITELIST=""
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLUB_TINY=y
CONFIG_SLAB_MERGE_DEFAULT=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_MEMORY_FAILURE is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
# CONFIG_SECRETMEM is not set
# CONFIG_USERFAULTFD is not set
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
CONFIG_LRU_GEN_STATS=y
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_PER_VMA_LOCK=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
# CONFIG_BPF_STREAM_PARSER is not set
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_PCIEAER is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
CONFIG_PCIEASPM_POWERSAVE=y
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
# CONFIG_PCIE_BUS_DEFAULT is not set
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
CONFIG_PCIE_BUS_PEER2PEER=y
# CONFIG_VGA_ARB is not set
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
CONFIG_VMD=y

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCI_MESON=y
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
CONFIG_YENTA=y
# CONFIG_YENTA_O2 is not set
# CONFIG_YENTA_RICOH is not set
# CONFIG_YENTA_TI is not set
CONFIG_YENTA_TOSHIBA=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
CONFIG_RAPIDIO_DMA_ENGINE=y
# CONFIG_RAPIDIO_DEBUG is not set
# CONFIG_RAPIDIO_ENUM_BASIC is not set
# CONFIG_RAPIDIO_CHMAN is not set
CONFIG_RAPIDIO_MPORT_CDEV=y

#
# RapidIO Switch drivers
#
# CONFIG_RAPIDIO_CPS_XX is not set
# CONFIG_RAPIDIO_CPS_GEN2 is not set
# CONFIG_RAPIDIO_RXS_GEN3 is not set
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_DEBUG=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=m
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=m
CONFIG_MHI_BUS_DEBUG=y
# CONFIG_MHI_BUS_PCI_GENERIC is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=m
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_SMI is not set
# CONFIG_GOOGLE_COREBOOT_TABLE is not set
# CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
# CONFIG_MTD is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_AD525X_DPOT_SPI=m
CONFIG_DUMMY_IRQ=m
CONFIG_IBM_ASM=m
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=m
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
# CONFIG_DS1682 is not set
# CONFIG_VMWARE_BALLOON is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_93XX46=m
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=y
# CONFIG_INTEL_MEI_ME is not set
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=y
# CONFIG_UACCE is not set
# CONFIG_PVPANIC is not set
CONFIG_GP_PCI1XXXX=m
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NTB_NETDEV is not set
# CONFIG_RIONET is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGBE is not set
# CONFIG_IXGBEVF is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_USB4_NET is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=m
CONFIG_KEYBOARD_QT1070=y
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_DLINK_DIR685=m
CONFIG_KEYBOARD_LKKBD=m
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
CONFIG_KEYBOARD_TCA6416=m
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=y
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
CONFIG_KEYBOARD_STOWAWAY=y
CONFIG_KEYBOARD_SUNKBD=m
# CONFIG_KEYBOARD_IQS62X is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=m
CONFIG_KEYBOARD_TWL4030=y
CONFIG_KEYBOARD_XTKBD=y
CONFIG_KEYBOARD_MTK_PMIC=m
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=m
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_ADS7846=m
CONFIG_TOUCHSCREEN_AD7877=m
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=m
# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
CONFIG_TOUCHSCREEN_BU21013=m
CONFIG_TOUCHSCREEN_BU21029=y
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
CONFIG_TOUCHSCREEN_CY8CTMA140=m
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
CONFIG_TOUCHSCREEN_CYTTSP_I2C=m
CONFIG_TOUCHSCREEN_CYTTSP_SPI=m
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP5 is not set
# CONFIG_TOUCHSCREEN_DA9052 is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=m
CONFIG_TOUCHSCREEN_GOODIX=m
CONFIG_TOUCHSCREEN_HIDEEP=y
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=m
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_ILITEK=y
CONFIG_TOUCHSCREEN_S6SY761=m
CONFIG_TOUCHSCREEN_GUNZE=m
CONFIG_TOUCHSCREEN_EKTF2127=y
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=m
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=m
CONFIG_TOUCHSCREEN_MCS5000=y
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=m
CONFIG_TOUCHSCREEN_MSG2638=m
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS=y
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=m
CONFIG_TOUCHSCREEN_PENMOUNT=m
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
CONFIG_TOUCHSCREEN_PIXCIR=y
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
CONFIG_TOUCHSCREEN_WM831X=y
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
CONFIG_TOUCHSCREEN_MC13783=m
CONFIG_TOUCHSCREEN_TOUCHIT213=y
CONFIG_TOUCHSCREEN_TSC_SERIO=m
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
CONFIG_TOUCHSCREEN_TSC2005=m
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_PCAP=y
# CONFIG_TOUCHSCREEN_RM_TS is not set
CONFIG_TOUCHSCREEN_SILEAD=m
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
# CONFIG_TOUCHSCREEN_STMFTS is not set
CONFIG_TOUCHSCREEN_SURFACE3_SPI=y
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_TOUCHSCREEN_IQS5XX=m
CONFIG_TOUCHSCREEN_ZINITIX=m
# CONFIG_TOUCHSCREEN_HIMAX_HX83112B is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PARKBD=m
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
CONFIG_GAMEPORT_EMU10K1=m
CONFIG_GAMEPORT_FM801=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DFL is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_GOLDFISH_TTY is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
# CONFIG_VIRTIO_CONSOLE is not set
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_WATCHDOG=y
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_HW_RANDOM is not set
CONFIG_APPLICOM=m
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=m
# CONFIG_TCG_TPM is not set
# CONFIG_TELCLOCK is not set
# CONFIG_XILLYBUS is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
CONFIG_I2C_ALI1535=y
CONFIG_I2C_ALI1563=m
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
CONFIG_I2C_ISCH=y
CONFIG_I2C_ISMT=y
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=y
# CONFIG_I2C_NFORCE2_S4985 is not set
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=m
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
CONFIG_I2C_VIA=m
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_OCORES=m
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=m
CONFIG_I2C_PCI1XXXX=m
# CONFIG_I2C_TAOS_EVM is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=y
# CONFIG_MIPI_I3C_HCI is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
CONFIG_SPI_ALTERA_CORE=m
CONFIG_SPI_ALTERA_DFL=m
# CONFIG_SPI_AXI_SPI_ENGINE is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=y
CONFIG_SPI_CADENCE=y
CONFIG_SPI_DESIGNWARE=m
CONFIG_SPI_DW_DMA=y
CONFIG_SPI_DW_PCI=m
CONFIG_SPI_DW_MMIO=m
CONFIG_SPI_GPIO=y
CONFIG_SPI_LM70_LLP=m
CONFIG_SPI_MICROCHIP_CORE=m
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
CONFIG_SPI_LANTIQ_SSC=y
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_PCI1XXXX=y
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_SC18IS602=y
# CONFIG_SPI_SIFIVE is not set
CONFIG_SPI_MXIC=y
CONFIG_SPI_XCOMM=m
CONFIG_SPI_XILINX=m
CONFIG_SPI_ZYNQMP_GQSPI=m
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=y
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_PARPORT=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_DFL_TOD is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
CONFIG_PINCTRL_DA9062=y
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08_SPI=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=m
CONFIG_GPIO_ICH=y
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_VX855=m
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=m
# CONFIG_GPIO_SCH is not set
CONFIG_GPIO_SCH311X=m
CONFIG_GPIO_WINBOND=y
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=m
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_DA9052 is not set
# CONFIG_GPIO_ELKHARTLAKE is not set
# CONFIG_GPIO_LP873X is not set
CONFIG_GPIO_MADERA=m
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_TPS65910=y
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_TWL4030=m
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=m
# CONFIG_GPIO_ML_IOH is not set
CONFIG_GPIO_PCI_IDIO_16=m
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=m
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=m
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_LATCH=m
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_GPIO=m
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_GENERIC_ADC_BATTERY=m
# CONFIG_IP5XXX_POWER is not set
CONFIG_MAX8925_POWER=y
# CONFIG_WM831X_BACKUP is not set
# CONFIG_WM831X_POWER is not set
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=m
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9052=y
CONFIG_AXP20X_POWER=m
# CONFIG_AXP288_FUEL_GAUGE is not set
CONFIG_BATTERY_MAX17040=m
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=m
CONFIG_BATTERY_TWL4030_MADC=y
# CONFIG_CHARGER_PCF50633 is not set
# CONFIG_BATTERY_RX51 is not set
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_TWL4030=m
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_LP8788=m
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_LT3651=m
CONFIG_CHARGER_LTC4162L=m
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77693=m
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MP2629 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ2515X=m
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
CONFIG_SENSORS_AD7314=m
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=m
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_AXI_FAN_CONTROL=m
# CONFIG_SENSORS_K8TEMP is not set
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
# CONFIG_SENSORS_DA9052_ADC is not set
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_IIO_HWMON=m
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2947_SPI=m
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX1111=m
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX31760=m
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MC34VR500=m
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_TPS23861=m
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM70=m
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=m
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ACBEL_FSG032 is not set
CONFIG_SENSORS_ADM1266=m
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_BEL_PFE=m
CONFIG_SENSORS_BPA_RS600=m
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
CONFIG_SENSORS_FSP_3Y=m
CONFIG_SENSORS_IBM_CFFPS=m
# CONFIG_SENSORS_DPS920AB is not set
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LT7182S is not set
# CONFIG_SENSORS_LTC2978 is not set
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX16601=m
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_MP2888=m
CONFIG_SENSORS_MP2975=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_MPQ7932=m
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PLI1209BC=m
CONFIG_SENSORS_PM6764TR=m
# CONFIG_SENSORS_PXE1610 is not set
CONFIG_SENSORS_Q54SJ108A2=m
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TDA38640 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_TPS546D24 is not set
# CONFIG_SENSORS_UCD9000 is not set
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_XDPE152=m
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_SY7636A=m
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
CONFIG_SENSORS_STTS751=m
CONFIG_SENSORS_SMM665=m
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP464=m
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_WM8350=m
CONFIG_SENSORS_INTEL_M10_BMC_HWMON=m

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_ACPI=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=y
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
CONFIG_DA9052_WATCHDOG=y
# CONFIG_DA9062_WATCHDOG is not set
# CONFIG_WDAT_WDT is not set
CONFIG_WM831X_WATCHDOG=y
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=m
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_TWL4030_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_RETU_WATCHDOG=m
# CONFIG_ACQUIRE_WDT is not set
CONFIG_ADVANTECH_WDT=y
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=y
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_EXAR_WDT=y
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=y
# CONFIG_IBMASR is not set
CONFIG_WAFER_WDT=m
CONFIG_I6300ESB_WDT=m
CONFIG_IE6XX_WDT=y
CONFIG_ITCO_WDT=m
# CONFIG_ITCO_VENDOR_SUPPORT is not set
CONFIG_IT8712F_WDT=y
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
# CONFIG_HPWDT_NMI_DECODING is not set
CONFIG_SC1200_WDT=m
# CONFIG_PC87413_WDT is not set
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=m
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
CONFIG_SMSC37B787_WDT=m
CONFIG_TQMX86_WDT=y
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=y
# CONFIG_W83977F_WDT is not set
# CONFIG_MACHZ_WDT is not set
CONFIG_SBC_EPX_C3_WATCHDOG=m
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
CONFIG_MEN_A21_WDT=y

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
CONFIG_WDTPCI=m
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_AS3711=y
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_MADERA=m
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_MADERA_SPI=m
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6370=m
CONFIG_MFD_MT6397=m
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
CONFIG_EZX_PCAP=y
CONFIG_MFD_RETU=m
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
CONFIG_MFD_SY7636A=y
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT4831=y
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RT5120=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
CONFIG_MFD_TI_AM335X_TSCADC=m
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
CONFIG_TPS6507X=m
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
CONFIG_MFD_TPS65912_SPI=m
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=m
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_INTEL_M10_BMC_CORE=m
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
CONFIG_MFD_INTEL_M10_BMC_PMCI=m
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=y
# CONFIG_BPF_LIRC_MODE2 is not set
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
# CONFIG_IR_IMON_DECODER is not set
CONFIG_IR_JVC_DECODER=y
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_RCMM_DECODER=y
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
# CONFIG_RC_DEVICES is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_CEC_PIN=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_CEC_PIN_ERROR_INJ is not set
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
CONFIG_CEC_GPIO=y
CONFIG_CEC_SECO=y
CONFIG_CEC_SECO_RC=y
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_SUPPORT=y
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
# CONFIG_VIDEO_TW5864 is not set
# CONFIG_VIDEO_TW68 is not set
CONFIG_VIDEO_ZORAN=y
# CONFIG_VIDEO_ZORAN_DC30 is not set
# CONFIG_VIDEO_ZORAN_ZR36060 is not set
# CONFIG_VIDEO_IPU3_CIO2 is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_V4L_MEM2MEM_DRIVERS=y
# CONFIG_VIDEO_MEM2MEM_DEINTERLACE is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#
CONFIG_VIDEO_CADENCE_CSI2RX=m
CONFIG_VIDEO_CADENCE_CSI2TX=y

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#

#
# Microchip Technology, Inc. media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
# end of Media drivers

#
# Media ancillary drivers
#
# CONFIG_VIDEO_IR_I2C is not set

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=y
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=m
CONFIG_VIDEO_HI846=m
CONFIG_VIDEO_HI847=y
# CONFIG_VIDEO_IMX208 is not set
CONFIG_VIDEO_IMX214=y
# CONFIG_VIDEO_IMX219 is not set
CONFIG_VIDEO_IMX258=y
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX290=m
CONFIG_VIDEO_IMX296=y
# CONFIG_VIDEO_IMX319 is not set
CONFIG_VIDEO_IMX355=m
CONFIG_VIDEO_MAX9271_LIB=y
CONFIG_VIDEO_MT9M001=m
CONFIG_VIDEO_MT9M111=y
CONFIG_VIDEO_MT9P031=y
# CONFIG_VIDEO_MT9T112 is not set
CONFIG_VIDEO_MT9V011=y
# CONFIG_VIDEO_MT9V032 is not set
CONFIG_VIDEO_MT9V111=m
# CONFIG_VIDEO_OG01A1B is not set
CONFIG_VIDEO_OV02A10=m
CONFIG_VIDEO_OV08D10=y
CONFIG_VIDEO_OV08X40=y
# CONFIG_VIDEO_OV13858 is not set
CONFIG_VIDEO_OV13B10=m
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=y
# CONFIG_VIDEO_OV2680 is not set
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV4689 is not set
CONFIG_VIDEO_OV5647=m
CONFIG_VIDEO_OV5648=y
# CONFIG_VIDEO_OV5670 is not set
CONFIG_VIDEO_OV5675=y
CONFIG_VIDEO_OV5693=m
CONFIG_VIDEO_OV5695=m
# CONFIG_VIDEO_OV6650 is not set
CONFIG_VIDEO_OV7251=m
CONFIG_VIDEO_OV7640=m
# CONFIG_VIDEO_OV7670 is not set
CONFIG_VIDEO_OV772X=y
CONFIG_VIDEO_OV7740=m
CONFIG_VIDEO_OV8856=y
# CONFIG_VIDEO_OV8858 is not set
CONFIG_VIDEO_OV8865=y
# CONFIG_VIDEO_OV9640 is not set
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_RDACM20=y
# CONFIG_VIDEO_RDACM21 is not set
CONFIG_VIDEO_RJ54N1=m
CONFIG_VIDEO_S5C73M3=y
CONFIG_VIDEO_S5K5BAF=m
# CONFIG_VIDEO_S5K6A3 is not set
CONFIG_VIDEO_ET8EK8=y
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
# CONFIG_VIDEO_DW9714 is not set
CONFIG_VIDEO_DW9768=y
CONFIG_VIDEO_DW9807_VCM=m
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=y
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=y
# end of Flash devices

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=m
# CONFIG_VIDEO_CS5345 is not set
# CONFIG_VIDEO_CS53L32A is not set
CONFIG_VIDEO_MSP3400=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set
CONFIG_VIDEO_TDA7432=y
CONFIG_VIDEO_TDA9840=m
# CONFIG_VIDEO_TEA6415C is not set
CONFIG_VIDEO_TEA6420=y
CONFIG_VIDEO_TLV320AIC23B=y
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_UDA1342=m
CONFIG_VIDEO_VP27SMPX=y
CONFIG_VIDEO_WM8739=y
CONFIG_VIDEO_WM8775=y
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
# CONFIG_VIDEO_ADV7183 is not set
CONFIG_VIDEO_ADV7604=y
CONFIG_VIDEO_ADV7604_CEC=y
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
CONFIG_VIDEO_BT866=y
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_ML86V7667=y
CONFIG_VIDEO_SAA7110=y
CONFIG_VIDEO_SAA711X=m
CONFIG_VIDEO_TC358743=m
# CONFIG_VIDEO_TC358743_CEC is not set
CONFIG_VIDEO_TC358746=y
CONFIG_VIDEO_TVP514X=m
CONFIG_VIDEO_TVP5150=y
CONFIG_VIDEO_TVP7002=y
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=m
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
# CONFIG_VIDEO_CX25840 is not set
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_ADV7170 is not set
CONFIG_VIDEO_ADV7175=y
CONFIG_VIDEO_ADV7343=m
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_ADV7511=m
CONFIG_VIDEO_ADV7511_CEC=y
# CONFIG_VIDEO_AK881X is not set
CONFIG_VIDEO_SAA7127=m
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_THS8200=m
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
CONFIG_VIDEO_UPD64083=y
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_ST_MIPID02=y
CONFIG_VIDEO_THS7303=y
# end of Miscellaneous helper chips

#
# Media SPI Adapters
#
# CONFIG_VIDEO_GS1662 is not set
# end of Media SPI Adapters
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
CONFIG_AGP=m
CONFIG_AGP_INTEL=m
CONFIG_AGP_SIS=m
CONFIG_AGP_VIA=m
CONFIG_INTEL_GTT=m
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=m
CONFIG_DRM_MIPI_DBI=m
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
# CONFIG_DRM_FBDEV_EMULATION is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_DMA_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
CONFIG_DRM_VMWGFX_MKSSTATS=y
# CONFIG_DRM_GMA500 is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_AUO_A030JTN01=m
CONFIG_DRM_PANEL_ORISETECH_OTA5601A=m
CONFIG_DRM_PANEL_WIDECHIPS_WS2401=m
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=m
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_PANEL_MIPI_DBI is not set
CONFIG_DRM_SIMPLEDRM=m
CONFIG_TINYDRM_HX8357D=m
CONFIG_TINYDRM_ILI9163=m
CONFIG_TINYDRM_ILI9225=m
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
CONFIG_TINYDRM_MI0283QT=m
# CONFIG_TINYDRM_REPAPER is not set
CONFIG_TINYDRM_ST7586=m
# CONFIG_TINYDRM_ST7735R is not set
CONFIG_DRM_VBOXVIDEO=m
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_SVGALIB=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=m
CONFIG_FB_PM2=m
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_CYBER2000=m
CONFIG_FB_CYBER2000_DDC=y
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_VESA is not set
CONFIG_FB_N411=m
CONFIG_FB_HGA=y
CONFIG_FB_OPENCORES=m
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_NVIDIA=m
# CONFIG_FB_NVIDIA_I2C is not set
# CONFIG_FB_NVIDIA_DEBUG is not set
CONFIG_FB_NVIDIA_BACKLIGHT=y
CONFIG_FB_RIVA=m
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=m
CONFIG_FB_LE80578=y
CONFIG_FB_CARILLO_RANCH=y
CONFIG_FB_INTEL=m
# CONFIG_FB_INTEL_DEBUG is not set
# CONFIG_FB_INTEL_I2C is not set
CONFIG_FB_MATROX=m
# CONFIG_FB_MATROX_MILLENIUM is not set
CONFIG_FB_MATROX_MYSTIQUE=y
CONFIG_FB_MATROX_G=y
CONFIG_FB_MATROX_I2C=m
# CONFIG_FB_MATROX_MAVEN is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
# CONFIG_FB_ATY128_BACKLIGHT is not set
# CONFIG_FB_ATY is not set
CONFIG_FB_S3=m
CONFIG_FB_S3_DDC=y
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
CONFIG_FB_KYRO=y
CONFIG_FB_3DFX=m
CONFIG_FB_3DFX_ACCEL=y
# CONFIG_FB_3DFX_I2C is not set
CONFIG_FB_VOODOO1=m
CONFIG_FB_VT8623=y
CONFIG_FB_TRIDENT=m
CONFIG_FB_ARK=y
CONFIG_FB_PM3=m
CONFIG_FB_CARMINE=m
CONFIG_FB_CARMINE_DRAM_EVAL=y
# CONFIG_CARMINE_DRAM_CUSTOM is not set
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=y
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
CONFIG_FB_MB862XX_I2C=y
CONFIG_FB_SIMPLE=m
# CONFIG_FB_SSD1307 is not set
CONFIG_FB_SM712=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_L4F00242T03=m
CONFIG_LCD_LMS283GF05=m
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=m
# CONFIG_LCD_ILI9320 is not set
CONFIG_LCD_TDO24M=m
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
CONFIG_LCD_AMS369FG06=m
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
CONFIG_LCD_OTM3225A=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_KTZ8866=m
# CONFIG_BACKLIGHT_CARILLO_RANCH is not set
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA9052=m
# CONFIG_BACKLIGHT_MAX8925 is not set
CONFIG_BACKLIGHT_MT6370=m
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_SAHARA=m
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_PCF50633=m
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_LP8788=m
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_AS3711 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=m
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_HDMI=y
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
# CONFIG_HID is not set

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB dual-mode controller drivers
#

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_TAHVO_USB is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PCI is not set
# CONFIG_MMC_SDHCI_ACPI is not set
# CONFIG_MMC_SDHCI_PLTFM is not set
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_TIFM_SD=m
# CONFIG_MMC_SPI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_PCI=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
# CONFIG_MEMSTICK_JMICRON_38X is not set
CONFIG_MEMSTICK_R592=m
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=m
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_MT6323=m
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=m
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=m
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_WM831X_STATUS=m
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA9052=m
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_PWM=y
# CONFIG_LEDS_BD2606MVV is not set
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_INTEL_SS4200=y
# CONFIG_LEDS_LT3593 is not set
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_TCA6507=m
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=y
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=y
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=m
# CONFIG_LEDS_LM36274 is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#
CONFIG_LEDS_PWM_MULTICOLOR=m
CONFIG_LEDS_MT6370_RGB=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM80X=m
CONFIG_RTC_DRV_ABB5ZES3=m
CONFIG_RTC_DRV_ABEOZ9=y
CONFIG_RTC_DRV_ABX80X=m
CONFIG_RTC_DRV_DS1307=m
CONFIG_RTC_DRV_DS1307_CENTURY=y
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=y
# CONFIG_RTC_DRV_LP8788 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_MAX8907 is not set
# CONFIG_RTC_DRV_MAX8925 is not set
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=m
# CONFIG_RTC_DRV_ISL12022 is not set
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=y
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
# CONFIG_RTC_DRV_M41T80_WDT is not set
# CONFIG_RTC_DRV_BQ32K is not set
CONFIG_RTC_DRV_PALMAS=y
CONFIG_RTC_DRV_TPS65910=m
CONFIG_RTC_DRV_RC5T583=y
CONFIG_RTC_DRV_S35390A=m
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
CONFIG_RTC_DRV_RV3028=y
CONFIG_RTC_DRV_RV3032=y
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
CONFIG_RTC_DRV_M41T94=y
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
CONFIG_RTC_DRV_MAX6916=m
CONFIG_RTC_DRV_R9701=m
# CONFIG_RTC_DRV_RX4581 is not set
CONFIG_RTC_DRV_RS5C348=m
CONFIG_RTC_DRV_MAX6902=m
CONFIG_RTC_DRV_PCF2123=y
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=y
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
# CONFIG_RTC_DRV_DS1511 is not set
CONFIG_RTC_DRV_DS1553=m
CONFIG_RTC_DRV_DS1685_FAMILY=m
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
CONFIG_RTC_DRV_DS17885=y
CONFIG_RTC_DRV_DS1742=y
CONFIG_RTC_DRV_DS2404=y
# CONFIG_RTC_DRV_DA9052 is not set
CONFIG_RTC_DRV_DA9063=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_WM831X=m
CONFIG_RTC_DRV_WM8350=y
CONFIG_RTC_DRV_PCF50633=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_PCAP is not set
CONFIG_RTC_DRV_MC13XXX=y
CONFIG_RTC_DRV_MT6397=m

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
# CONFIG_DMADEVICES_VDEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=y
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
CONFIG_PLX_DMA=y
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
CONFIG_DW_DMAC_PCI=m
CONFIG_DW_EDMA=y
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
CONFIG_DMABUF_HEAPS_SYSTEM=y
CONFIG_DMABUF_HEAPS_CMA=y
# end of DMABUF options

CONFIG_DCA=m
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=y
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=m
CONFIG_UIO_PRUSS=m
CONFIG_UIO_MF624=m
CONFIG_UIO_DFL=m
CONFIG_VFIO=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
CONFIG_COMEDI_ISA_DRIVERS=y
CONFIG_COMEDI_PCL711=m
CONFIG_COMEDI_PCL724=y
# CONFIG_COMEDI_PCL726 is not set
# CONFIG_COMEDI_PCL730 is not set
CONFIG_COMEDI_PCL812=m
# CONFIG_COMEDI_PCL816 is not set
CONFIG_COMEDI_PCL818=m
CONFIG_COMEDI_PCM3724=y
CONFIG_COMEDI_AMPLC_DIO200_ISA=m
# CONFIG_COMEDI_AMPLC_PC236_ISA is not set
# CONFIG_COMEDI_AMPLC_PC263_ISA is not set
CONFIG_COMEDI_RTI800=y
CONFIG_COMEDI_RTI802=y
CONFIG_COMEDI_DAC02=m
CONFIG_COMEDI_DAS16M1=m
CONFIG_COMEDI_DAS08_ISA=y
CONFIG_COMEDI_DAS16=y
CONFIG_COMEDI_DAS800=y
# CONFIG_COMEDI_DAS1800 is not set
CONFIG_COMEDI_DAS6402=y
# CONFIG_COMEDI_DT2801 is not set
CONFIG_COMEDI_DT2811=y
CONFIG_COMEDI_DT2814=m
# CONFIG_COMEDI_DT2815 is not set
CONFIG_COMEDI_DT2817=y
CONFIG_COMEDI_DT282X=m
# CONFIG_COMEDI_DMM32AT is not set
# CONFIG_COMEDI_FL512 is not set
CONFIG_COMEDI_AIO_AIO12_8=m
# CONFIG_COMEDI_AIO_IIRO_16 is not set
CONFIG_COMEDI_II_PCI20KC=y
# CONFIG_COMEDI_C6XDIGIO is not set
# CONFIG_COMEDI_MPC624 is not set
CONFIG_COMEDI_ADQ12B=y
# CONFIG_COMEDI_NI_AT_A2150 is not set
CONFIG_COMEDI_NI_AT_AO=y
CONFIG_COMEDI_NI_ATMIO=y
CONFIG_COMEDI_NI_ATMIO16D=m
# CONFIG_COMEDI_NI_LABPC_ISA is not set
CONFIG_COMEDI_PCMAD=m
# CONFIG_COMEDI_PCMDA12 is not set
CONFIG_COMEDI_PCMMIO=y
CONFIG_COMEDI_PCMUIO=y
CONFIG_COMEDI_MULTIQ3=m
CONFIG_COMEDI_S526=m
CONFIG_COMEDI_PCI_DRIVERS=y
CONFIG_COMEDI_8255_PCI=m
CONFIG_COMEDI_ADDI_WATCHDOG=y
CONFIG_COMEDI_ADDI_APCI_1032=y
# CONFIG_COMEDI_ADDI_APCI_1500 is not set
CONFIG_COMEDI_ADDI_APCI_1516=y
CONFIG_COMEDI_ADDI_APCI_1564=m
# CONFIG_COMEDI_ADDI_APCI_16XX is not set
CONFIG_COMEDI_ADDI_APCI_2032=m
CONFIG_COMEDI_ADDI_APCI_2200=m
CONFIG_COMEDI_ADDI_APCI_3120=m
CONFIG_COMEDI_ADDI_APCI_3501=m
CONFIG_COMEDI_ADDI_APCI_3XXX=m
CONFIG_COMEDI_ADL_PCI6208=m
CONFIG_COMEDI_ADL_PCI7X3X=y
# CONFIG_COMEDI_ADL_PCI8164 is not set
CONFIG_COMEDI_ADL_PCI9111=m
CONFIG_COMEDI_ADL_PCI9118=m
CONFIG_COMEDI_ADV_PCI1710=y
CONFIG_COMEDI_ADV_PCI1720=y
CONFIG_COMEDI_ADV_PCI1723=y
CONFIG_COMEDI_ADV_PCI1724=y
CONFIG_COMEDI_ADV_PCI1760=y
# CONFIG_COMEDI_ADV_PCI_DIO is not set
CONFIG_COMEDI_AMPLC_DIO200_PCI=m
# CONFIG_COMEDI_AMPLC_PC236_PCI is not set
CONFIG_COMEDI_AMPLC_PC263_PCI=m
# CONFIG_COMEDI_AMPLC_PCI224 is not set
CONFIG_COMEDI_AMPLC_PCI230=m
CONFIG_COMEDI_CONTEC_PCI_DIO=m
CONFIG_COMEDI_DAS08_PCI=m
# CONFIG_COMEDI_DT3000 is not set
CONFIG_COMEDI_DYNA_PCI10XX=m
# CONFIG_COMEDI_GSC_HPDI is not set
CONFIG_COMEDI_MF6X4=m
CONFIG_COMEDI_ICP_MULTI=y
# CONFIG_COMEDI_DAQBOARD2000 is not set
# CONFIG_COMEDI_JR3_PCI is not set
CONFIG_COMEDI_KE_COUNTER=m
CONFIG_COMEDI_CB_PCIDAS64=y
CONFIG_COMEDI_CB_PCIDAS=y
CONFIG_COMEDI_CB_PCIDDA=y
# CONFIG_COMEDI_CB_PCIMDAS is not set
CONFIG_COMEDI_CB_PCIMDDA=m
CONFIG_COMEDI_ME4000=y
CONFIG_COMEDI_ME_DAQ=m
CONFIG_COMEDI_NI_6527=m
CONFIG_COMEDI_NI_65XX=m
CONFIG_COMEDI_NI_660X=m
CONFIG_COMEDI_NI_670X=y
# CONFIG_COMEDI_NI_LABPC_PCI is not set
CONFIG_COMEDI_NI_PCIDIO=y
CONFIG_COMEDI_NI_PCIMIO=y
CONFIG_COMEDI_RTD520=y
# CONFIG_COMEDI_S626 is not set
CONFIG_COMEDI_MITE=y
CONFIG_COMEDI_NI_TIOCMD=y
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_ISADMA=y
CONFIG_COMEDI_NI_TIO=y
CONFIG_COMEDI_NI_ROUTING=y
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y
# CONFIG_RTLLIB is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
CONFIG_ADIS16203=y
# CONFIG_ADIS16240 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7816=m
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=m
CONFIG_ADT7316_SPI=m
# CONFIG_ADT7316_I2C is not set
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
CONFIG_AD9832=m
CONFIG_AD9834=y
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=y
# end of Network Analyzer, Impedance Converters

#
# Resolver to digital converters
#
CONFIG_AD2S1210=m
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_FB_SM750=m
# CONFIG_STAGING_MEDIA is not set
# CONFIG_FB_TFT is not set
# CONFIG_KS7010 is not set
# CONFIG_GREYBUS_BOOTROM is not set
# CONFIG_GREYBUS_FIRMWARE is not set
CONFIG_GREYBUS_LIGHT=m
CONFIG_GREYBUS_LOG=m
# CONFIG_GREYBUS_LOOPBACK is not set
CONFIG_GREYBUS_POWER=m
CONFIG_GREYBUS_RAW=m
CONFIG_GREYBUS_VIBRATOR=m
CONFIG_GREYBUS_BRIDGED_PHY=m
# CONFIG_GREYBUS_GPIO is not set
CONFIG_GREYBUS_I2C=m
CONFIG_GREYBUS_PWM=m
# CONFIG_GREYBUS_SDIO is not set
# CONFIG_GREYBUS_SPI is not set
# CONFIG_GREYBUS_UART is not set
CONFIG_PI433=m
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
CONFIG_GOLDFISH_PIPE=m
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
CONFIG_P2SB=y
# CONFIG_COMMON_CLK is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=m
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX77843=m
CONFIG_EXTCON_PALMAS=m
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=m
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADIS16201=m
# CONFIG_ADIS16209 is not set
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
# CONFIG_ADXL313_SPI is not set
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL345_SPI is not set
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
# CONFIG_ADXL355_SPI is not set
CONFIG_ADXL367=y
# CONFIG_ADXL367_SPI is not set
CONFIG_ADXL367_I2C=y
# CONFIG_ADXL372_SPI is not set
# CONFIG_ADXL372_I2C is not set
CONFIG_BMA180=m
CONFIG_BMA220=m
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_BMC150_ACCEL_SPI=m
# CONFIG_BMI088_ACCEL is not set
CONFIG_DA280=m
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=y
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_FXLS8962AF_SPI=y
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=m
CONFIG_IIO_KX022A=y
CONFIG_IIO_KX022A_SPI=y
CONFIG_IIO_KX022A_I2C=m
CONFIG_KXSD9=m
CONFIG_KXSD9_SPI=m
CONFIG_KXSD9_I2C=m
CONFIG_KXCJK1013=m
CONFIG_MC3230=m
CONFIG_MMA7455=y
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7455_SPI=y
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
CONFIG_MMA9551=m
CONFIG_MMA9553=m
# CONFIG_MSA311 is not set
CONFIG_MXC4005=m
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
CONFIG_SCA3300=y
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
CONFIG_AD7091R5=m
# CONFIG_AD7124 is not set
CONFIG_AD7192=m
CONFIG_AD7266=y
CONFIG_AD7280=y
CONFIG_AD7291=m
# CONFIG_AD7292 is not set
CONFIG_AD7298=y
# CONFIG_AD7476 is not set
CONFIG_AD7606=m
CONFIG_AD7606_IFACE_PARALLEL=m
# CONFIG_AD7606_IFACE_SPI is not set
CONFIG_AD7766=y
CONFIG_AD7768_1=m
CONFIG_AD7780=m
# CONFIG_AD7791 is not set
CONFIG_AD7793=y
# CONFIG_AD7887 is not set
CONFIG_AD7923=y
# CONFIG_AD7949 is not set
CONFIG_AD799X=y
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=m
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_HI8435=m
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
CONFIG_LP8788_ADC=m
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
CONFIG_LTC2496=y
CONFIG_LTC2497=y
CONFIG_MAX1027=m
CONFIG_MAX11100=m
CONFIG_MAX1118=m
CONFIG_MAX11205=m
CONFIG_MAX11410=y
# CONFIG_MAX1241 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
CONFIG_MCP3422=m
CONFIG_MCP3911=m
CONFIG_MEDIATEK_MT6370_ADC=m
CONFIG_MP2629_ADC=y
# CONFIG_NAU7802 is not set
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
CONFIG_RICHTEK_RTQ6056=y
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
CONFIG_TI_ADC084S021=y
CONFIG_TI_ADC12138=y
CONFIG_TI_ADC108S102=m
# CONFIG_TI_ADC128S052 is not set
CONFIG_TI_ADC161S626=m
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7924=y
CONFIG_TI_ADS1100=m
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_ADS8344 is not set
CONFIG_TI_ADS8688=m
# CONFIG_TI_ADS124S08 is not set
# CONFIG_TI_ADS131E08 is not set
CONFIG_TI_AM335X_ADC=m
CONFIG_TI_LMP92064=y
# CONFIG_TI_TLC4541 is not set
# CONFIG_TI_TSC2046 is not set
CONFIG_TWL4030_MADC=y
CONFIG_TWL6030_GPADC=m
# CONFIG_VF610_ADC is not set
CONFIG_XILINX_XADC=y
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74115=y
CONFIG_AD74413R=m
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
# CONFIG_ADA4250 is not set
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_ATLAS_EZO_SENSOR is not set
CONFIG_BME680=y
CONFIG_BME680_I2C=y
CONFIG_BME680_SPI=y
# CONFIG_CCS811 is not set
# CONFIG_IAQCORE is not set
CONFIG_SCD30_CORE=y
CONFIG_SCD30_I2C=m
CONFIG_SCD4X=m
CONFIG_SENSIRION_SGP30=y
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=m
CONFIG_IIO_SSP_SENSORHUB=m
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD3552R is not set
CONFIG_AD5064=m
# CONFIG_AD5360 is not set
CONFIG_AD5380=m
# CONFIG_AD5421 is not set
CONFIG_AD5446=y
CONFIG_AD5449=y
CONFIG_AD5592R_BASE=y
# CONFIG_AD5592R is not set
CONFIG_AD5593R=y
CONFIG_AD5504=y
# CONFIG_AD5624R_SPI is not set
CONFIG_LTC2688=y
CONFIG_AD5686=m
CONFIG_AD5686_SPI=m
CONFIG_AD5696_I2C=m
CONFIG_AD5755=y
# CONFIG_AD5758 is not set
CONFIG_AD5761=m
CONFIG_AD5764=y
CONFIG_AD5766=y
CONFIG_AD5770R=m
CONFIG_AD5791=y
# CONFIG_AD7293 is not set
CONFIG_AD7303=y
CONFIG_AD8801=y
CONFIG_DPOT_DAC=y
CONFIG_DS4424=m
# CONFIG_LTC1660 is not set
CONFIG_LTC2632=y
CONFIG_M62332=m
CONFIG_MAX517=m
CONFIG_MAX5522=y
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=m
CONFIG_MCP4922=y
CONFIG_TI_DAC082S085=y
CONFIG_TI_DAC5571=y
CONFIG_TI_DAC7311=m
# CONFIG_TI_DAC7612 is not set
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=y
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=y
CONFIG_ADF4371=y
# CONFIG_ADMV4420 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
CONFIG_ADIS16130=m
CONFIG_ADIS16136=y
CONFIG_ADIS16260=m
# CONFIG_ADXRS290 is not set
CONFIG_ADXRS450=m
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_FXAS21002C_SPI=y
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
# CONFIG_IIO_ST_GYRO_SPI_3AXIS is not set
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
CONFIG_AFE4404=m
CONFIG_MAX30100=m
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
CONFIG_DHT11=y
# CONFIG_HDC100X is not set
CONFIG_HDC2010=m
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTS221_SPI=m
# CONFIG_HTU21 is not set
CONFIG_SI7005=y
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
CONFIG_ADIS16460=y
CONFIG_ADIS16475=m
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=y
CONFIG_BMI160_I2C=m
CONFIG_BMI160_SPI=y
CONFIG_BOSCH_BNO055=y
CONFIG_BOSCH_BNO055_I2C=y
CONFIG_FXOS8700=m
# CONFIG_FXOS8700_I2C is not set
CONFIG_FXOS8700_SPI=m
# CONFIG_KMX61 is not set
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=m
CONFIG_INV_ICM42600_SPI=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
CONFIG_INV_MPU6050_SPI=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_SPI=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
CONFIG_IIO_ST_LSM9DS0_SPI=m
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
CONFIG_ADUX1020=y
CONFIG_AL3010=m
CONFIG_AL3320A=y
CONFIG_APDS9300=m
# CONFIG_APDS9960 is not set
CONFIG_AS73211=y
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
# CONFIG_CM3232 is not set
CONFIG_CM3323=m
CONFIG_CM3605=y
CONFIG_CM36651=m
CONFIG_GP2AP002=y
# CONFIG_GP2AP020A00F is not set
# CONFIG_IQS621_ALS is not set
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=m
# CONFIG_ISL29125 is not set
CONFIG_JSA1212=m
# CONFIG_ROHM_BU27034 is not set
CONFIG_RPR0521=y
CONFIG_LTR501=m
CONFIG_LTRF216A=m
CONFIG_LV0104CS=m
CONFIG_MAX44000=m
# CONFIG_MAX44009 is not set
# CONFIG_NOA1305 is not set
# CONFIG_OPT3001 is not set
CONFIG_PA12203001=m
CONFIG_SI1133=m
# CONFIG_SI1145 is not set
CONFIG_STK3310=m
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_ST_UVIS25_SPI=y
CONFIG_TCS3414=m
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=m
CONFIG_TSL2583=m
CONFIG_TSL2591=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=m
# CONFIG_VCNL4035 is not set
CONFIG_VEML6030=y
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_BMC150_MAGN_SPI=m
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
# CONFIG_SENSORS_HMC5843_SPI is not set
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
# CONFIG_SENSORS_RM3100_SPI is not set
CONFIG_TI_TMAG5273=y
CONFIG_YAMAHA_YAS530=m
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
# CONFIG_AD5272 is not set
# CONFIG_DS1803 is not set
CONFIG_MAX5432=y
CONFIG_MAX5481=y
CONFIG_MAX5487=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4131=y
CONFIG_MCP4531=m
CONFIG_MCP41010=m
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=m
# CONFIG_DLHL60D is not set
# CONFIG_DPS310 is not set
# CONFIG_HP03 is not set
CONFIG_ICP10100=m
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL115_SPI=m
CONFIG_MPL3115=m
# CONFIG_MS5611 is not set
CONFIG_MS5637=y
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=y
CONFIG_HP206C=y
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=y
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=m
CONFIG_LIDAR_LITE_V2=y
CONFIG_MB1232=y
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
CONFIG_SRF04=y
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
CONFIG_SX9500=y
# CONFIG_SRF08 is not set
# CONFIG_VCNL3020 is not set
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=m
# CONFIG_AD2S1200 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
CONFIG_LTC2983=y
CONFIG_MAXIM_THERMOCOUPLE=y
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=y
CONFIG_TMP006=m
CONFIG_TMP007=m
CONFIG_TMP117=y
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
CONFIG_MAX30208=m
CONFIG_MAX31856=y
# CONFIG_MAX31865 is not set
# end of Temperature sensors

CONFIG_NTB=y
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
CONFIG_NTB_IDT=m
CONFIG_NTB_INTEL=m
CONFIG_NTB_EPF=m
CONFIG_NTB_SWITCHTEC=m
# CONFIG_NTB_PINGPONG is not set
CONFIG_NTB_TOOL=m
# CONFIG_NTB_PERF is not set
CONFIG_NTB_TRANSPORT=m
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_DWC=m
# CONFIG_PWM_IQS620A is not set
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PCI=y
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_PCA9685 is not set
CONFIG_PWM_TWL=y
CONFIG_PWM_TWL_LED=m

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=m
# end of IRQ chip support

CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
# CONFIG_SERIAL_IPOCTAL is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=m
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=m
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
CONFIG_USB4=m
# CONFIG_USB4_DEBUGFS_WRITE is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
# CONFIG_ANDROID_BINDERFS is not set
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
CONFIG_NVMEM_LAYOUT_SL28_VPD=m
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

# CONFIG_NVMEM_RMEM is not set
CONFIG_NVMEM_SPMI_SDAM=m

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=m
# CONFIG_STM_SOURCE_FTRACE is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
# CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_MGR_XILINX_SPI=m
# CONFIG_FPGA_MGR_MACHXO2_SPI is not set
CONFIG_FPGA_BRIDGE=m
CONFIG_ALTERA_FREEZE_BRIDGE=m
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=m
CONFIG_FPGA_DFL=m
CONFIG_FPGA_DFL_FME=m
CONFIG_FPGA_DFL_FME_MGR=m
# CONFIG_FPGA_DFL_FME_BRIDGE is not set
# CONFIG_FPGA_DFL_FME_REGION is not set
CONFIG_FPGA_DFL_AFU=m
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=m
CONFIG_FPGA_DFL_PCI=m
CONFIG_FPGA_M10_BMC_SEC_UPDATE=m
# CONFIG_FPGA_MGR_MICROCHIP_SPI is not set
CONFIG_FPGA_MGR_LATTICE_SYSCONFIG=y
CONFIG_FPGA_MGR_LATTICE_SYSCONFIG_SPI=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
# CONFIG_MUX_ADGS1408 is not set
CONFIG_MUX_GPIO=m
# end of Multiplexer drivers

# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_INTEL_QEP=m
CONFIG_INTERRUPT_CNT=y
# CONFIG_MOST is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_FUSE_FS=y
CONFIG_CUSE=m
CONFIG_VIRTIO_FS=m
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=m
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=m
CONFIG_USER_DECRYPTED_DATA=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
# CONFIG_CRYPTO_AUTHENC is not set
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
# CONFIG_CRYPTO_DH is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=m
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_SM4_GENERIC=m
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=m
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=m
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
# CONFIG_CRYPTO_BLAKE2B is not set
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_CURVE25519_X86=m
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_BLOWFISH_X86_64=y
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=y
CONFIG_CRYPTO_DES3_EDE_X86_64=y
# CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64=m
CONFIG_CRYPTO_CHACHA20_X86_64=y
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
CONFIG_CRYPTO_BLAKE2S_X86=y
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=y
CONFIG_CRYPTO_SM3_AVX_X86_64=m
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32_PCLMUL=m
# CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=m
CONFIG_CRC_T10DIF=m
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
# CONFIG_CRC64 is not set
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
CONFIG_CMA_SIZE_SEL_MAX=y
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
CONFIG_NOINSTR_VALIDATION=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
CONFIG_PTDUMP_DEBUGFS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
CONFIG_PER_VMA_LOCK_STATS=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_MEMORY_NOTIFIER_ERROR_INJECT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
CONFIG_HAVE_KMSAN_COMPILER=y
# CONFIG_KMSAN is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_NMI_CHECK_CPU is not set
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_CPU_STALL_CPUTIME=y
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_PREEMPT_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_USER_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
# CONFIG_SAMPLE_KPROBES is not set
CONFIG_SAMPLE_HW_BREAKPOINT=m
# CONFIG_SAMPLE_KFIFO is not set
CONFIG_SAMPLE_RPMSG_CLIENT=m
CONFIG_SAMPLE_CONFIGFS=m
CONFIG_SAMPLE_VFIO_MDEV_MTTY=m
# CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB=y
# CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
# CONFIG_SAMPLE_WATCHDOG is not set
# CONFIG_SAMPLE_KMEMLEAK is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
CONFIG_PUNIT_ATOM_DEBUG=y
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_FAULT_INJECTION_CONFIGFS=y
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--VavDzlno0Iki4VjV
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='trinity'
	export testcase='trinity'
	export category='functional'
	export need_memory='300MB'
	export runtime=600
	export job_origin='trinity.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='linux-devel/devel-catchup-20230629-133501'
	export commit='c73cfb97418ba174e8b5c7a3544a803d35874daa'
	export kconfig='x86_64-randconfig-x002-20230629'
	export nr_vm=300
	export submit_id='649f714b1e7a308be84e97c8'
	export job_file='/lkp/jobs/queued/bisect/vm-snb/trinity-600s-debian-11.1-i386-20220923.cgz-x86_64-randconfig-x002-20230629-c73cfb97418b-20230701-35816-hybbsx-2.yaml'
	export id='14f3a4c524bc996b339344406f713ea7fe2562d0'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='clang-15'
	export enqueue_time='2023-07-01 08:20:27 +0800'
	export _id='649f76c51e7a308be84e97ca'
	export _rt='/result/trinity/600s/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-x002-20230629/clang-15/c73cfb97418ba174e8b5c7a3544a803d35874daa'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export scheduler_version='/lkp/lkp/.src-20230630-230453'
	export arch='i386'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/trinity/600s/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-x002-20230629/clang-15/c73cfb97418ba174e8b5c7a3544a803d35874daa/2
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-x002-20230629/clang-15/c73cfb97418ba174e8b5c7a3544a803d35874daa/vmlinuz-6.4.0-00031-gc73cfb97418b
branch=linux-devel/devel-catchup-20230629-133501
job=/lkp/jobs/scheduled/vm-meta-151/trinity-600s-debian-11.1-i386-20220923.cgz-x86_64-randconfig-x002-20230629-c73cfb97418b-20230701-35816-hybbsx-2.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-x002-20230629
commit=c73cfb97418ba174e8b5c7a3544a803d35874daa
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=1200
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-randconfig-x002-20230629/clang-15/c73cfb97418ba174e8b5c7a3544a803d35874daa/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz,/osimage/pkg/debian-11.1-i386-20220923.cgz/trinity-i386-abe9de86-1_20230429.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export job_initrd='/lkp/jobs/scheduled/vm-meta-151/trinity-600s-debian-11.1-i386-20220923.cgz-x86_64-randconfig-x002-20230629-c73cfb97418b-20230701-35816-hybbsx-2.cgz'
	export kernel='/pkg/linux/x86_64-randconfig-x002-20230629/clang-15/c73cfb97418ba174e8b5c7a3544a803d35874daa/vmlinuz-6.4.0-00031-gc73cfb97418b'
	export result_root='/result/trinity/600s/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-x002-20230629/clang-15/c73cfb97418ba174e8b5c7a3544a803d35874daa/2'
	export meta_host='vm-meta-151'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_setup $LKP_SRC/setup/sanity-check

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper trinity
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time trinity.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--VavDzlno0Iki4VjV
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--VavDzlno0Iki4VjV
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="trinity"

Seeding trinity by 1609686058 based on vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-x002-20230629
2023-07-01 08:48:16 chroot --userspec nobody:nogroup / trinity -q -q -l off -s 1609686058 -x get_robust_list -x remap_file_pages -N 999999999
Trinity 2023.01  Dave Jones <davej@codemonkey.org.uk>
shm:0xf7f50000-0x46fce14 (4 pages)
[main] Marking syscall get_robust_list (312) as to be disabled.
[main] Marking syscall remap_file_pages (257) as to be disabled.
[main] Couldn't chmod tmp/ to 0777.
[main] Using user passed random seed: 1609686058.
Marking all syscalls as enabled.
[main] Disabling syscalls marked as disabled by command line options
[main] Marked syscall remap_file_pages (257) as deactivated.
[main] Marked syscall get_robust_list (312) as deactivated.
[main] Enabled 426 syscalls. Disabled 3 syscalls.
[main] Using pid_max = 32768
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] Reserved/initialized 10 futexes.
[main] sysv_shm: id:0 size:4096 flags:7b0 ptr:(nil) global:1
[main] sysv_shm: id:1 size:28672 flags:17b0 ptr:(nil) global:1
[main] Added 19 filenames from /dev
[main] Added 18300 filenames from /proc
[main] Added 10043 filenames from /sys
[main] Couldn't open socket (5:2:0). Address family not supported by protocol
[main] Couldn't open socket (12:2:4). Address family not supported by protocol
[main] Couldn't open socket (5:2:0). Address family not supported by protocol
[main] Couldn't open socket (38:5:0). Address family not supported by protocol
[main] Couldn't open socket (30:1:0). Address family not supported by protocol
[main] Couldn't open socket (33:2:2). Address family not supported by protocol
[main] Couldn't open socket (11:5:3). Address family not supported by protocol
[main] Couldn't open socket (23:5:3). Address family not supported by protocol
[main] Couldn't open socket (16:3:8). Protocol not supported
[main] Couldn't open socket (10:6:33). Socket type not supported
Can't do protocol KEY
[main] Couldn't open socket (10:5:0). Socket type not supported
Can't do protocol KEY
Can't do protocol SNA
[main] Couldn't open socket (31:3:3). Address family not supported by protocol
[main] Couldn't open socket (38:5:0). Address family not supported by protocol
[main] Couldn't open socket (11:5:10). Address family not supported by protocol
Can't do protocol BRIDGE
Can't do protocol PACKET
[main] Couldn't open socket (39:3:1). Address family not supported by protocol
[main] Couldn't open socket (31:3:0). Address family not supported by protocol
[main] Couldn't open socket (37:5:2). Address family not supported by protocol
Can't do protocol NETBEUI
[main] Couldn't open socket (36:5:2). Address family not supported by protocol
[main] Couldn't open socket (42:2:0). Address family not supported by protocol
[main] Couldn't open socket (5:2:0). Address family not supported by protocol
[main] Couldn't open socket (28:2:3). Address family not supported by protocol
Can't do protocol SECURITY
[main] Couldn't open socket (6:5:0). Address family not supported by protocol
Can't do protocol WANPIPE
[main] Couldn't open socket (4:2:0). Address family not supported by protocol
Can't do protocol SNA
[main] Couldn't open socket (9:5:0). Address family not supported by protocol
[main] Couldn't open socket (2:1:132). Protocol not supported
Can't do protocol LLC
[main] Couldn't open socket (37:1:3). Address family not supported by protocol
[main] Couldn't open socket (11:1:1). Address family not supported by protocol
[main] Couldn't open socket (28:1:2). Address family not supported by protocol
[main] Couldn't open socket (29:3:1). Address family not supported by protocol
[main] Couldn't open socket (11:3:6). Address family not supported by protocol
Can't do protocol SECURITY
[main] Couldn't open socket (37:5:0). Address family not supported by protocol
[main] Couldn't open socket (30:1:0). Address family not supported by protocol
[main] Couldn't open socket (34:1:5). Address family not supported by protocol
[main] Couldn't open socket (8:2:0). Address family not supported by protocol
Can't do protocol WANPIPE
[main] Couldn't open socket (6:5:0). Address family not supported by protocol
[main] Couldn't open socket (24:2:2). Address family not supported by protocol
[main] Couldn't open socket (12:2:4). Address family not supported by protocol
[main] Couldn't open socket (28:2:6). Address family not supported by protocol
[main] Couldn't open socket (37:5:5). Address family not supported by protocol
Can't do protocol PACKET
Can't do protocol UNSPEC
[main] Couldn't open socket (12:5:2). Address family not supported by protocol
[main] Couldn't open socket (36:5:6). Address family not supported by protocol
Can't do protocol ASH
[main] Couldn't open socket (36:5:3). Address family not supported by protocol
[main] Couldn't open socket (6:5:0). Address family not supported by protocol
[main] Couldn't open socket (38:5:0). Address family not supported by protocol
Can't do protocol PACKET
[main] Couldn't open socket (3:5:207). Address family not supported by protocol
Can't do protocol SNA
[main] Couldn't open socket (11:5:10). Address family not supported by protocol
[main] Couldn't open socket (11:5:10). Address family not supported by protocol
[main] Couldn't open socket (42:2:0). Address family not supported by protocol
[main] Couldn't open socket (4:2:0). Address family not supported by protocol
[main] Couldn't open socket (39:3:0). Address family not supported by protocol
[main] Enabled 14/14 fd providers. initialized:14.
[main] Error opening tracing_on : Permission denied
[main] kernel became tainted! (512/0) Last seed was 1609686058
trinity: Detected kernel tainting. Last seed was 1609686058
[main] exit_reason=7, but 6 children still running.
[main] Bailing main loop because kernel became tainted..
[main] Ran 1 syscalls. Successes: 0  Failures: 0

--VavDzlno0Iki4VjV--
