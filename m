Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B2933D4
	for <oe-lkp@lists.linux.dev>; Thu, 16 Nov 2023 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhN+bdf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700123067; x=1731659067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkTkQUhG24orMVypECQmkgEY73IOV1bVX4WzFEV7+Z0=;
  b=UhN+bdf/MtCp/yP1/O2jutLQ0rmDVYu57vAy1FBtcKP3NKMMVir9kF+h
   E3X+d71ivr+luMXs4FmHhHoAEBCceAwJRKUb7N3Ag1F9Xf9Zsy6+aA7es
   4SBhGXgomaD8KaMHnDUneb1i4nlMmsxd2mGXibPfgdFL8jsA5pD/rS9GW
   JDwjNRTOmgFyaGqEXeu7Fso2AreNcmK7iWjCYejFMThmwjFeEEqtqyas8
   X05RFDkx9edRXZuC1ZFUvmoU1hqxchvVFCQwpeTrmmSshZnIBoeZRmA7E
   qZ2I/gZRAz4jvsVCBG9jDPMJ51q3eprpMKxbOPubOgIVPGK4zLpSwN1lA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455333398"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="455333398"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 00:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831197397"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="831197397"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Nov 2023 00:24:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 00:24:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 00:24:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 00:24:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awjWzULth1nUjh+Ah1qryNp7VDx+05BRFC6h8J4XF6nD7H/EJA08DcfjYpRsBcfw8B9Xtes8OCoZ4gxKAEAY/FFN0PEm0T89SNtepEze8paqMSqnfgP9itQR28YE5YOleSEi/d16HjsyPzjqD47JF6DChUrvdTQMsrPMgE202P20yRdainsNw+E+unwcKPYwdmQBmbL8350UvEX0kVM0sbNBmbkC0zoRVMQts4mP6rXABHc17czJ79fRWF+392SdKR3EJoKDHwpvNtrXnBcvdhtNG995kSIbj3sGKiHAyyWwFyR1mOiVBWIfApeMsj3hDnTjFxfHzQMEGxHE2h8qtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC7J62innAmyfjCUHkGKmozCiYdjgoReB8WU9VT++Ko=;
 b=mV2QinhgkkfXH56cBskpYZIxf6KdzwLN2ItqKkS5Dh7fx/z2A+lF3yzQsbY4LxZDUI/Rjy63x29joDWDgeTSxHX1RctNbrpjPwHbVqvOon7cY/gYx7D1a1iH7Z8DqfWC1WpB4r1eBF0PvIF/6erNIxeLxQHRR7QB3hUNQw971cgTe4cwWD9foQu4+tBfOoDQeSySOAAHIcV/NADhtb+/jspVc6rkfzVtPSZwau1XYrfiZXxMFE56rWu15VquwKyvpQAvOS4FMuw0WvBEUAqKvNObfGxEWjDdXY/hhoh0oRHJAUkV8ZdgO+8jM4k08sAX2dte2ypWXyDW842D+6EvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA3PR11MB7416.namprd11.prod.outlook.com (2603:10b6:806:316::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26; Thu, 16 Nov
 2023 08:24:21 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 08:24:21 +0000
Date: Thu, 16 Nov 2023 16:24:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:x86/core] [x86/entry]  cbdf82dcb3:
 BUG:ENTRY_TRAMPOLINE_stack_guard_page_was_hit_at(____ptrval____)(stack_is(____ptrval____)..(____ptrval____))
Message-ID: <202311161506.5aec9e53-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA3PR11MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 3266d4bd-4dc2-489e-5d14-08dbe67d6e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzW1ALmX8cIGRKaCnm1IdfwrbwWnGfPjDGZMTm1CXpliVzcMO4EfVYyDnZaRUdvkok25TqIiD+2UKBzQ68MU1u32ngXLQ5bCky2zq1WHhsIOnEW1h+So2IHUy5boktSSBjHVd6wvWWnJtTRYGW4e/Xp9ZPKrVpZSlZAkA4FTmHPZqwMWR8yDDr+/tJmbGyU2VSW2EUBYaIrzJIQOrr33QWrO6rI28rdgzV0r4uR7tADSbn0JPB9mENPR+XWM39xQwxElmgxq+ybSzUa+gChwf3J9VzJN1IaDyT+WH0d1a5iaXIEb2O7/JX/3UJ7WJg4dD3f4Vz7qrS/6wb2gIKOnYY82IO6+Y7ya0QPJbAoX2+rKW4zfxgnzBO7NBwY4n7tmvn5XuCaFb7WzHDpLPs6EpikJ7ZFLewSHMXw9eEKnF9nMQYaTPPJYynqsb0DK/MNrex6mP8oV+8Mrcp6liD8kUfsFReZIYtxgO0/acqqa8EpGelCqQLT46W6Yys37cTTLnXCMZoKbB0px6PrhTBxpfae/gALHP0z7JW1lYFedYfQIP8uxV1uKEifzKBa1KKb0FQNv/0CsMjwbjj90p1bnge8McI1kga29nL1keBqqWgFlYXf8djVjdbu7EOXohLM0bhC3RJ5J/VpWuyLlRbKw/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(107886003)(1076003)(38100700002)(2616005)(6506007)(6512007)(83380400001)(26005)(82960400001)(6486002)(316002)(478600001)(966005)(66946007)(6666004)(66556008)(6916009)(66476007)(41300700001)(8936002)(4326008)(8676002)(36756003)(2906002)(86362001)(5660300002)(101420200003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C3sHYxvDxSrB2SSsr7ESCiss8Umo20GsT/KfGSo+n7uRs3+gIyeIMCkb+pxi?=
 =?us-ascii?Q?QRstPcVpO8NnHQOypusXvsoYMcKUmNuj+3REbWShe4zNKLUIdXkZPI4FU6kz?=
 =?us-ascii?Q?sR6QfFjM1yTtURfkwHK2BCB8iHUgx9IcOKMEVfBdP5TCoZgXFO8CdE5wwEmP?=
 =?us-ascii?Q?jFzSef4gRZKTwj134XeZDddRcjpZE5bbi2dUWj8dTRG7yqRneJ2rV6QG1uMb?=
 =?us-ascii?Q?RvPuEKCsPPcbZC+B4MVD3hjO+1HZcf70Dn+gos8WtMa9qCjUqXPtKML2wSmF?=
 =?us-ascii?Q?OoGrTbKpHKjd4mSu6/zcov7E76RYq68A0VjGPojTTNPt2pgYagWCQsRkcXb7?=
 =?us-ascii?Q?4lEELGE0rOGoctQWDxmVL+wjNN5G656/BOeH75h8PVE0Q5V+7fYVEqRIxPzd?=
 =?us-ascii?Q?NJZPIFCeB5C+7Ih+egag5VCpgpKoXR3C6F+NAbmwJeZBRCp3Q0oBz5vb8PPv?=
 =?us-ascii?Q?6GuZRh+l3XqihAeXfqfoaUQ+AB57gKlhroR5U0x68ydw5PJ+0kfeMpmK5Gc1?=
 =?us-ascii?Q?OR8Wn7AU/O1Ul87GXLiSUMuySp+UoZGnZUgsUNnLn4h5+iNNjupl0xhMAYmH?=
 =?us-ascii?Q?i44Dfd1F5TnAPloOwZbJ2A4hDmpAcjX4xo4qEvlnIvVIjRPhfXDYQzi8B58j?=
 =?us-ascii?Q?08tBmoiSSt1nl2Yj3qsze7Fw8LIi8YDmqFwzbszbneEYG2D1NCWp5LIaIl0o?=
 =?us-ascii?Q?mBO6AxRCYA3ki3XMOTc2YF5hhsua4xp8iQH/svxOsfwp/gfeb+a/FyUs146q?=
 =?us-ascii?Q?Q9un3I3YauTsPS2uPzRZzTu1KpWV8cJl/XDSd2doT8gZzq1kAFYB+57n0EZj?=
 =?us-ascii?Q?3FqFlXM+BErvXHnjmh8J9vHkPHbmxhYTb044Iz8hyXmIMdKUmfKOhOJ8WcnV?=
 =?us-ascii?Q?rnmn4Ernf1FVP8PRaVjvzp7cH518TDyhUkUHGT2AUpXPj39bYt2Ei640pSSo?=
 =?us-ascii?Q?r59wShuOpjq7mG7Dx7qzdbw9r5Vixaczw5+i098d4Wbj7uW8YhGTF8ZTDnXo?=
 =?us-ascii?Q?Y1nEDf7M3G7VO7MNHgjpyW2qNhrKOTlF/A6AGsvjHpLcdoHw2fj/ybvcIHmt?=
 =?us-ascii?Q?+iQwfCUGI05HtmK4615BA76cbaDysQxTxoOQWKixvCm/LXbiyG2zkXrRB7Tv?=
 =?us-ascii?Q?OYCLZTFi3fYrBqQfWWqBRnJVmR11LGP/1H/NnOASDhfgdCUUx03CsyN+fY8u?=
 =?us-ascii?Q?Ikut1tHc9n0HoU4UFaIlIhHB2iUHXfIYKy/IK1wnIcaTPNihFMRKwD71P53Q?=
 =?us-ascii?Q?Ani0rF6F5fwAU+/lgnifzP4owEg/VWJfCdNYGTz+7omlEWcY0yoSznAvMtGT?=
 =?us-ascii?Q?sRb2vRNdkU0WozjZ/Ke+/a5blHz1YbGLOXztNskxsC84H1Wi/Ab+ko7kbVQn?=
 =?us-ascii?Q?axvIS95qOSQUr+Wnddh5vPdwQSHyqd7KUb+m5PRg5YtfiEwp/Fy3u9FMeJKK?=
 =?us-ascii?Q?tqTHNPchBgbs0STzxtrKYQkbexP9TIn5mJNYsdlGY8eLHmLmn3FhQwyj2ik8?=
 =?us-ascii?Q?HVMvGQmILJc8qSF6zetHe4qtulIgCoGs1V3d807gjD7iy8mJIvXyiDZKtKGK?=
 =?us-ascii?Q?W5RgjoLIznQ48lg6NoF6hQCj3h1yqo+GjvCLOOEq5jesVrpUMAZj8kK2yobx?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3266d4bd-4dc2-489e-5d14-08dbe67d6e80
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 08:24:20.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aICq5+Ouh1NCjpU0GU5672RPZVxY4mAh7m1vi9fcVC8459YF6IGMMEwmVKpINIeFpoJq5royCuqE5eYu6WzZow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7416
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:ENTRY_TRAMPOLINE_stack_guard_page_was_hit_at(____ptrval____)(stack_is(____ptrval____)..(____ptrval____))" on:

commit: cbdf82dcb37795a009dd3086903d5c51830deb07 ("x86/entry: Harder return-to-user")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git x86/core

in testcase: boot

compiler: clang-16
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------------------------------------------------+------------+------------+
|                                                                                                              | 64591a17b3 | cbdf82dcb3 |
+--------------------------------------------------------------------------------------------------------------+------------+------------+
| boot_successes                                                                                               | 16         | 0          |
| boot_failures                                                                                                | 0          | 13         |
| BUG:ENTRY_TRAMPOLINE_stack_guard_page_was_hit_at(____ptrval____)(stack_is(____ptrval____)..(____ptrval____)) | 0          | 13         |
| stack_guard_page:#[##]                                                                                       | 0          | 13         |
| RIP:exc_page_fault                                                                                           | 0          | 13         |
| RIP:exc_invalid_op                                                                                           | 0          | 13         |
| RIP:common_interrupt_return                                                                                  | 0          | 13         |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt                                                        | 0          | 13         |
+--------------------------------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311161506.5aec9e53-oliver.sang@intel.com


[    5.724602][    C0] BUG: ENTRY_TRAMPOLINE stack guard page was hit at (____ptrval____) (stack is (____ptrval____)..(____ptrval____))
[    5.724608][    C0] stack guard page: 0000 [#1] SMP PTI
[    5.724611][    C0] CPU: 0 PID: 67 Comm: modprobe Not tainted 6.7.0-rc1-00053-gcbdf82dcb377 #1
[    5.724614][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 5.724615][ C0] RIP: 0010:exc_page_fault (arch/x86/mm/fault.c:1518) 
[ 5.724621][ C0] Code: 05 0d 75 56 01 48 39 c1 76 0d f0 48 0f b1 0d ff 74 56 01 74 05 eb ee 48 89 c1 48 89 c8 59 c3 cc cc cc cc cc cc cc cc cc cc cc <55> 41 57 41 56 53 49 89 f7 48 89 fb 41 0f 20 d6 65 48 8b 04 25 80
All code
========
   0:	05 0d 75 56 01       	add    $0x156750d,%eax
   5:	48 39 c1             	cmp    %rax,%rcx
   8:	76 0d                	jbe    0x17
   a:	f0 48 0f b1 0d ff 74 	lock cmpxchg %rcx,0x15674ff(%rip)        # 0x1567512
  11:	56 01 
  13:	74 05                	je     0x1a
  15:	eb ee                	jmp    0x5
  17:	48 89 c1             	mov    %rax,%rcx
  1a:	48 89 c8             	mov    %rcx,%rax
  1d:	59                   	pop    %rcx
  1e:	c3                   	retq   
  1f:	cc                   	int3   
  20:	cc                   	int3   
  21:	cc                   	int3   
  22:	cc                   	int3   
  23:	cc                   	int3   
  24:	cc                   	int3   
  25:	cc                   	int3   
  26:	cc                   	int3   
  27:	cc                   	int3   
  28:	cc                   	int3   
  29:	cc                   	int3   
  2a:*	55                   	push   %rbp		<-- trapping instruction
  2b:	41 57                	push   %r15
  2d:	41 56                	push   %r14
  2f:	53                   	push   %rbx
  30:	49 89 f7             	mov    %rsi,%r15
  33:	48 89 fb             	mov    %rdi,%rbx
  36:	41 0f 20 d6          	mov    %cr2,%r14
  3a:	65                   	gs
  3b:	48                   	rex.W
  3c:	8b                   	.byte 0x8b
  3d:	04 25                	add    $0x25,%al
  3f:	80                   	.byte 0x80

Code starting with the faulting instruction
===========================================
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	53                   	push   %rbx
   6:	49 89 f7             	mov    %rsi,%r15
   9:	48 89 fb             	mov    %rdi,%rbx
   c:	41 0f 20 d6          	mov    %cr2,%r14
  10:	65                   	gs
  11:	48                   	rex.W
  12:	8b                   	.byte 0x8b
  13:	04 25                	add    $0x25,%al
  15:	80                   	.byte 0x80
[    5.724624][    C0] RSP: 0000:fffffe5de61b7000 EFLAGS: 00010093
[    5.724626][    C0] RAX: fffffe5de61b7008 RBX: 0000000000000000 RCX: ffffffffbc400f97
[    5.724627][    C0] RDX: 0000000000000000 RSI: 0000000000000010 RDI: fffffe5de61b7008
[    5.724628][    C0] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[    5.724629][    C0] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    5.724630][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    5.724631][    C0] FS:  0000000000000000(0000) GS:ffff9aa32fc00000(0000) knlGS:0000000000000000
[    5.724632][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.724633][    C0] CR2: fffffe5de61b6ff8 CR3: 000000010109a000 CR4: 00000000000406f0
[    5.724638][    C0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    5.724639][    C0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    5.724640][    C0] Call Trace:
[    5.724650][    C0]  <#DF>
[ 5.724652][ C0] ? __die_body (arch/x86/kernel/dumpstack.c:421) 
[ 5.724655][ C0] ? die (arch/x86/kernel/dumpstack.c:? arch/x86/kernel/dumpstack.c:447) 
[ 5.724656][ C0] ? handle_stack_overflow (arch/x86/kernel/traps.c:327) 
[ 5.724660][ C0] ? exc_double_fault (arch/x86/kernel/traps.c:464) 
[ 5.724664][ C0] ? asm_exc_double_fault (arch/x86/include/asm/idtentry.h:611) 
[ 5.724667][ C0] ? restore_regs_and_return_to_kernel (arch/x86/entry/entry_64.S:659) 
[ 5.724670][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[    5.724672][    C0]  </#DF>
[    5.724672][    C0]  <ENTRY_TRAMPOLINE>
[ 5.724673][ C0] asm_exc_page_fault (arch/x86/include/asm/idtentry.h:570) 
[ 5.724676][ C0] RIP: 0010:exc_page_fault (arch/x86/mm/fault.c:1518) 
[ 5.724678][ C0] Code: 05 0d 75 56 01 48 39 c1 76 0d f0 48 0f b1 0d ff 74 56 01 74 05 eb ee 48 89 c1 48 89 c8 59 c3 cc cc cc cc cc cc cc cc cc cc cc <55> 41 57 41 56 53 49 89 f7 48 89 fb 41 0f 20 d6 65 48 8b 04 25 80
All code
========
   0:	05 0d 75 56 01       	add    $0x156750d,%eax
   5:	48 39 c1             	cmp    %rax,%rcx
   8:	76 0d                	jbe    0x17
   a:	f0 48 0f b1 0d ff 74 	lock cmpxchg %rcx,0x15674ff(%rip)        # 0x1567512
  11:	56 01 
  13:	74 05                	je     0x1a
  15:	eb ee                	jmp    0x5
  17:	48 89 c1             	mov    %rax,%rcx
  1a:	48 89 c8             	mov    %rcx,%rax
  1d:	59                   	pop    %rcx
  1e:	c3                   	retq   
  1f:	cc                   	int3   
  20:	cc                   	int3   
  21:	cc                   	int3   
  22:	cc                   	int3   
  23:	cc                   	int3   
  24:	cc                   	int3   
  25:	cc                   	int3   
  26:	cc                   	int3   
  27:	cc                   	int3   
  28:	cc                   	int3   
  29:	cc                   	int3   
  2a:*	55                   	push   %rbp		<-- trapping instruction
  2b:	41 57                	push   %r15
  2d:	41 56                	push   %r14
  2f:	53                   	push   %rbx
  30:	49 89 f7             	mov    %rsi,%r15
  33:	48 89 fb             	mov    %rdi,%rbx
  36:	41 0f 20 d6          	mov    %cr2,%r14
  3a:	65                   	gs
  3b:	48                   	rex.W
  3c:	8b                   	.byte 0x8b
  3d:	04 25                	add    $0x25,%al
  3f:	80                   	.byte 0x80

Code starting with the faulting instruction
===========================================
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	53                   	push   %rbx
   6:	49 89 f7             	mov    %rsi,%r15
   9:	48 89 fb             	mov    %rdi,%rbx
   c:	41 0f 20 d6          	mov    %cr2,%r14
  10:	65                   	gs
  11:	48                   	rex.W
  12:	8b                   	.byte 0x8b
  13:	04 25                	add    $0x25,%al
  15:	80                   	.byte 0x80


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231116/202311161506.5aec9e53-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

