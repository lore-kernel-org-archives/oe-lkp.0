Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4C23C2
	for <oe-lkp@lists.linux.dev>; Fri, 16 Jun 2023 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686900940; x=1718436940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EaqzzVQ3PTIz8KajKoj8ZmCZP1E/fuFO77cGw4Ur9w=;
  b=hnnGGiTPp+SjWgrFG1Wi7ZkurBENcF4XT3E/ClIHtbq+fP5zQL9k7zwm
   uepeMFpHFLunVwQYj5uI61UzJpAh0W8ta9ZTxRmqz/5GGZ7UpdhDCZky1
   Mvmo99p87KYNMaSdXX5tnQpd78VGn8mEBY+zNsgqeZ/qowb2mpZiIbQOr
   87URzwWnBHIGo/7eMrPwkymujCxAqVZtUgsU/BY9jrjV8z5Xd2eRji+Yf
   BmyPvtppAsqs1jZTelFIrRy6QjBmpmiEmCnA7L5r6uxJiAZUlTLUEVkXs
   earJhVCCPdYhimd8lgN910eSm5BWHqrXlmTGJqS6i/iPELregv5a3T4+J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425087744"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="xz'341?scan'341,208,341";a="425087744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 00:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="802737434"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="xz'341?scan'341,208,341";a="802737434"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 00:35:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 00:35:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 00:35:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 00:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKhbZaW0IWrecHdit7Muzohwjli+mMQkA9zlx4UDlZwSJKT0xxBtbLazZq6jAIAAabmT0qCVBVXSzwCrKr7h1/FQSwVerfpncrZ/Hx/pwynqFsmVJ5q2bWBqF5jA/31u2t2jQxXA7JAPg3rzm1AXIPQmt4xWFhPw1OkIqJxLKVoRkWwj6oj2nMaC94zM+qrbA9Zm4D4wWMnuY+XlUpBXbyRubaErMat76ji9R9uqRtwN5fyyM4bgH4ebroPG7CrK6cSgM4v5NxdEY23EhHavmxIB845HRxkukJHRqA2fdoRRMmRQnhOdtU6CQgfdnId0g/aglndjSBJFsGK74KaN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSwJS6V7n3hHrU2js0QYoFC2aWUGr+xl2/ktgp1xyNQ=;
 b=SzlRYDgD0HqhoDtP36DgFQwTEgzsk/26wRx8i+ZqW5Iudx5hKZTewqLhENtT3iQU52BsbBJGuWkLRIXBJKNcvjUIDTUj4xhM36rDNtsWY8OP3dL7JWFLfGOWsWJbFVhdqW4ENsWS3U1tuUsE6uMxUNtcU6PDXbKdIJyNITmjjPS5LnUrHhywv3f6J8Wpl2VOJbjAYkBDzRWuebHw559fJuYLSnalu5JDjTdgD/rKtLPOTnHUHMCjTKPrstCFhGo3YxvOJG/THBVFMb2SedottbpSfVSf1c2SrPSXo5cnKdVKsTtGSSsQVKa0dkTgWXu+t7/nEz5n4lE7eAclhif/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH8PR11MB6829.namprd11.prod.outlook.com (2603:10b6:510:22f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 07:35:27 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%6]) with mapi id 15.20.6455.028; Fri, 16 Jun 2023
 07:35:27 +0000
Date: Fri, 16 Jun 2023 15:35:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [chrome-os:chromeos-5.4] [BACKPORT]  4c67e3f845:
 WARNING:bad_unlock_balance_detected
Message-ID: <202306161530.2c64db65-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="Hn06Is6wPKeAOQ1i"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH8PR11MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e5aa39-7ae9-488b-171a-08db6e3c40b3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDTtHY/SZJ6+GFEuFeeGGwsnvSANng0vzvKN+bAHRZwhaL3cf1IfUW8KYhwIlIrFiv/4aHXOCfaN14Hw3rTWeBbWPWeqnnMEYLKdywhvGNLqjkEgb9HeGmEmoDO8LZzaBUwk+wHzEHkUeQ0I4oghZZgKXf5rusrjFKjaxdeAGG7NZeWIChb2E4afnUZfE4qelSDZbW/RYRiw00stKCuviyK2gFWwGG8UrrM7L0YFzX7tsGZD4mQW4DRF2jEmQ8KijyxhmdUWK42sxTw/jgO2HAqpLj2fi8XaAvz3Z4RLJT/3ntSyhvWr+ogpHVcZZGaqRydvQUAFzhC1yf9HwYBrP2lILEMn6McuLOz6eQGOnNIFekNyUuNa+Nh4d38Xi7tNJK8Bz6G8Qfi3dD2fgoiIDkXd2iV6EvrOINGB9w2d61JS6AVb/Z/WRAdQs1atpu1hpNpflNz1TmFg5rveFbnQuyUK6j14ldmCeNg+UPdA99tx4rMkTF+qrQE4W8ggN25T0A17KyGWBWaTBMrpKdfXy05aWZdA9TVgMtIAV57YPRqHuK87TyoF8hMH6207YYokDKfssSCEHREREYDI53VQ7SA4JBi9Iuu51Br32kIqq+UuC7FHbTD2OwfHNtkJyy/SXh6kmS9Rm+hPg1MLoerhiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199021)(6486002)(44144004)(2906002)(6666004)(8936002)(8676002)(41300700001)(966005)(316002)(66476007)(2616005)(66556008)(6916009)(4326008)(66946007)(82960400001)(36756003)(186003)(38100700002)(45080400002)(86362001)(235185007)(5660300002)(83380400001)(478600001)(107886003)(6512007)(1076003)(26005)(6506007)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?di+zN7yXkjUXD5RhPq+fkl1rGf8mM0OmU4sNb9LPkcRFbAZMeKZ854T8nOBN?=
 =?us-ascii?Q?gNhCXjvcxnzUhUynV1LxEguUpsMfvYpEe8BaG0hqx7ieas5E3hFU7uRmKWdE?=
 =?us-ascii?Q?3OXnyo0HCyH6625N+bIGIces7eTxGl9RHyoYTEpr9wbOQ3+Ch5cfLnmTYGTu?=
 =?us-ascii?Q?PJY4mPL65cMenDejz1CCuwoSFq+q1JKTRKzSfJanHYIIEiWsXN1ZddkyP7Lr?=
 =?us-ascii?Q?M2vVXhouGWHvP/zW2dAU/WZDcDxQL8S482NIpdEVUBIcp5pffAtyPf+xMrZa?=
 =?us-ascii?Q?rSiU6bmNWmdnHROcQzz6wSmOWxNXVWPOPTRkxrZiUtAqUzyguxYEGNAOk45f?=
 =?us-ascii?Q?S8SFtSBbppG55zG8fyiVtbUlnurFKpZnxCfcMgBHIyfWLwxBo2wnBeSVyAin?=
 =?us-ascii?Q?ZJwms7ly9WjCh+s0AvyEiKWKT2MdXDV39mhXy7OsEWB147Aozkrb6BEic3pu?=
 =?us-ascii?Q?kLogy1zJ9+km5Hgztci2rZuxstU5v2pny8Ih7M1kytLJ5o+L4QTr7uNXPGJy?=
 =?us-ascii?Q?i1fM3Pw9M35Wo/Mb5Oi/OSyCw2rVKmFRg9RAFpMVwQ++hZBdqI0tKCqRrRRJ?=
 =?us-ascii?Q?luNlg8TBcKbkvX1gSyhyTvQ/gx5PXF2Kt1UjsRunPfBnH/gSBB90fD1QLDOJ?=
 =?us-ascii?Q?7OCooC4lQedsMhDuWzRPhlDeZH3hwQkfWQR+cm2OHxkFdkn8szrFsHv7mIny?=
 =?us-ascii?Q?TJ7kD+y8308nVZ8qOaZE2IqgHPSofuB3YFvex6HSgWwyKfeSl2Y7k/11GI8Q?=
 =?us-ascii?Q?IWM+x7yB1hjRD5R7fYSem7rKczqhiJPc6UsAbC/V+JLUvNMNk8Zyh5MZnsKC?=
 =?us-ascii?Q?DSIRt6DsriXvv77fMKQp5W2rJs9LBelJcg6mLIC06yo4nv9wgbQHlkyO0S4x?=
 =?us-ascii?Q?M3fYwYIv7BcKJSsh6s+Wk/XJJKItB5vsZrEltm8m3jEUP32ictuBNhLNaFW/?=
 =?us-ascii?Q?eEHP2+3Q2YU6DoP4Bxw0XBrwgAoB3WDP7QJnDwl/gAeg5TSN35+ytzfqGtg3?=
 =?us-ascii?Q?zbYhifIoe08OlcyykqMwlS0okjlJ5+85tVsAzbGv8SFnB3wQAoKvanVc1sk+?=
 =?us-ascii?Q?w1jUlj3wNoqwD842Yo/hQH44i11DCI+Eb42HOfuEzwgzR2OyftZmoDw0XnCW?=
 =?us-ascii?Q?Ybc30+ce2xHoG9Oqk9wJ2QrNpL42VUvMNirrM+iCw1G7LX4PgPcGI0hpQ2cT?=
 =?us-ascii?Q?JqC7U+dezB7b4CwS3IQCdjtY/QscJmYXPhj3lshCO5qlmmo6p87tSG2t04DC?=
 =?us-ascii?Q?iveSu3tBZ6eAV+eHDmRW7LmF5PxjfuJ8ZoNUkQGcdBHqip8TYwtgrWNBlJNS?=
 =?us-ascii?Q?FojUWeDQtJa8t5eKZKqBFhvuCEgV45qzX6RBAImv/I4yIB2QbSlts8zKE+EN?=
 =?us-ascii?Q?GahFiD9Va8JOYClA2+SZ0VO1t40IQLyOMUZka2kQ4cyDiK7Jk6khO1dd5VIl?=
 =?us-ascii?Q?TKJuisklaNnCHWLPF7WRISdht53iaV3mSFAnzN8075BIwO0QJrVF6/c3JpJd?=
 =?us-ascii?Q?uoLOHX0ADkxRaEQkOpII8qqwx45+ER2ZGSncTwS9y2KJyj3vRu+jZ5OuXQ20?=
 =?us-ascii?Q?cWy4UYcgNT9RshSLR0srnPWXcJ1WxMf8L1N+pRruxnnb2h315gcBvbWLGDt7?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e5aa39-7ae9-488b-171a-08db6e3c40b3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 07:35:27.3328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayCuxTT/Mkd49A7+DXc11e4agc7ApYskLjRXJwE+TM8g/bM6u2tz3NLGykX2IW7s3DWCHlpb/wvLUDnm7Y1cMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
X-OriginatorOrg: intel.com

--Hn06Is6wPKeAOQ1i
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:bad_unlock_balance_detected" on:

commit: 4c67e3f8457f3e21b4a9c73a22823093d90146ee ("BACKPORT: FROMLIST: drm/print: Add tracefs support to the drm logging helpers")
https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | b8896701af | 4c67e3f845 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 6          | 0          |
| boot_failures                               | 0          | 12         |
| WARNING:bad_unlock_balance_detected         | 0          | 12         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 12         |
| Oops:#[##]                                  | 0          | 12         |
| EIP:print_lockdep_cache                     | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202306161530.2c64db65-oliver.sang@intel.com


[    5.455303][    T1] WARNING: bad unlock balance detected!
[    5.456274][    T1] 5.4.57-07396-g4c67e3f8457f3 #1 Not tainted
[    5.456694][    T1] -------------------------------------
[    5.456694][    T1] swapper/1 is trying to release lock (
[    5.456694][    T1] BUG: kernel NULL pointer dereference, address: 000000d0
[    5.456694][    T1] #PF: supervisor read access in kernel mode
[    5.456694][    T1] #PF: error_code(0x0000) - not-present page
[    5.456694][    T1] *pde = 00000000
[    5.456694][    T1] Oops: 0000 [#1] PREEMPT
[    5.456694][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.57-07396-g4c67e3f8457f3 #1
[    5.456694][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 5.456694][ T1] EIP: print_lockdep_cache (kernel/locking/lockdep.c:664) 
[ 5.456694][ T1] Code: 00 00 68 79 ff f6 c1 e8 e5 7e 00 00 83 c4 18 8d 65 f4 5b 5e 5f 5d c3 55 89 e5 81 ec 84 00 00 00 65 8b 15 14 00 00 00 89 55 fc <8b> 50 0c 85 d2 75 0f 8b 00 8d 95 7c ff ff ff e8 b7 cc ff ff 89 c2
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	68 79 ff f6 c1       	pushq  $0xffffffffc1f6ff79
   7:	e8 e5 7e 00 00       	callq  0x7ef1
   c:	83 c4 18             	add    $0x18,%esp
   f:	8d 65 f4             	lea    -0xc(%rbp),%esp
  12:	5b                   	pop    %rbx
  13:	5e                   	pop    %rsi
  14:	5f                   	pop    %rdi
  15:	5d                   	pop    %rbp
  16:	c3                   	retq   
  17:	55                   	push   %rbp
  18:	89 e5                	mov    %esp,%ebp
  1a:	81 ec 84 00 00 00    	sub    $0x84,%esp
  20:	65 8b 15 14 00 00 00 	mov    %gs:0x14(%rip),%edx        # 0x3b
  27:	89 55 fc             	mov    %edx,-0x4(%rbp)
  2a:*	8b 50 0c             	mov    0xc(%rax),%edx		<-- trapping instruction
  2d:	85 d2                	test   %edx,%edx
  2f:	75 0f                	jne    0x40
  31:	8b 00                	mov    (%rax),%eax
  33:	8d 95 7c ff ff ff    	lea    -0x84(%rbp),%edx
  39:	e8 b7 cc ff ff       	callq  0xffffffffffffccf5
  3e:	89 c2                	mov    %eax,%edx

Code starting with the faulting instruction
===========================================
   0:	8b 50 0c             	mov    0xc(%rax),%edx
   3:	85 d2                	test   %edx,%edx
   5:	75 0f                	jne    0x16
   7:	8b 00                	mov    (%rax),%eax
   9:	8d 95 7c ff ff ff    	lea    -0x84(%rbp),%edx
   f:	e8 b7 cc ff ff       	callq  0xffffffffffffcccb
  14:	89 c2                	mov    %eax,%edx
[    5.456694][    T1] EAX: 000000c4 EBX: ea9030c0 ECX: c10bee00 EDX: 4fd5f495
[    5.456694][    T1] ESI: c125be2b EDI: 000000c4 EBP: ea8fde4c ESP: ea8fddc8
[    5.456694][    T1] DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010082
[    5.456694][    T1] CR0: 80050033 CR2: 000000d0 CR3: 02355000 CR4: 00040690
[    5.456694][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    5.456694][    T1] DR6: fffe0ff0 DR7: 00000400
[    5.456694][    T1] Call Trace:
[ 5.456694][ T1] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:94 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:183) 
[ 5.456694][ T1] ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:46) 
[ 5.456694][ T1] ? vprintk_emit (kernel/printk/printk.c:2005 (discriminator 1)) 
[ 5.456694][ T1] ? tracefs_remove_recursive (fs/tracefs/inode.c:618) 
[ 5.456694][ T1] ? vprintk_default (kernel/printk/printk.c:2051) 
[ 5.456694][ T1] ? vprintk_func (kernel/printk/printk_safe.c:385) 
[ 5.456694][ T1] ? console_unlock (kernel/printk/printk.c:2527) 
[ 5.456694][ T1] print_unlock_imbalance_bug (kernel/locking/lockdep.c:4004 kernel/locking/lockdep.c:3987) 
[ 5.456694][ T1] ? tracefs_remove_recursive (fs/tracefs/inode.c:618) 
[ 5.456694][ T1] __lock_release+0x59/0x103 
[ 5.456694][ T1] ? tracefs_remove_recursive (fs/tracefs/inode.c:618) 
[ 5.456694][ T1] lock_release (kernel/locking/lockdep.c:4511) 
[ 5.456694][ T1] up_write (kernel/locking/rwsem.c:1587) 
[ 5.456694][ T1] tracefs_remove_recursive (fs/tracefs/inode.c:618) 
[ 5.456694][ T1] trace_array_create (kernel/trace/trace.c:8484) 
[ 5.456694][ T1] trace_array_get_by_name (kernel/trace/trace.c:8559) 
[ 5.456694][ T1] ? drm_fb_helper_modinit (drivers/gpu/drm/drm_drv.c:1127) 
[ 5.456694][ T1] drm_trace_init (drivers/gpu/drm/drm_print.c:432) 
[ 5.456694][ T1] drm_core_init (drivers/gpu/drm/drm_drv.c:1132) 
[ 5.456694][ T1] ? drm_fb_helper_modinit (drivers/gpu/drm/drm_drv.c:1127) 
[ 5.456694][ T1] do_one_initcall (init/main.c:940) 
[ 5.456694][ T1] ? do_early_param (init/main.c:252) 
[ 5.456694][ T1] ? debug_mutex_unlock (kernel/locking/mutex-debug.c:75 (discriminator 9)) 
[ 5.456694][ T1] ? lock_is_held (include/linux/lockdep.h:363) 
[ 5.456694][ T1] ? rcu_read_lock_sched_held (kernel/rcu/update.c:122 kernel/rcu/update.c:116) 
[ 5.456694][ T1] do_initcall_level (init/main.c:1007) 
[ 5.456694][ T1] kernel_init_freeable (init/main.c:1015 init/main.c:1033 init/main.c:1193) 
[ 5.456694][ T1] ? rest_init (init/main.c:1108) 
[ 5.456694][ T1] kernel_init (init/main.c:1113) 
[ 5.456694][ T1] ? rest_init (init/main.c:1108) 
[ 5.456694][ T1] ret_from_fork (arch/x86/entry/entry_32.S:819) 
[    5.456694][    T1] Modules linked in:
[    5.456694][    T1] CR2: 00000000000000d0
[    5.456694][    T1] ---[ end trace dd7eb5c1e2f4b2f4 ]---
[ 5.456694][ T1] EIP: print_lockdep_cache (kernel/locking/lockdep.c:664) 
[ 5.456694][ T1] Code: 00 00 68 79 ff f6 c1 e8 e5 7e 00 00 83 c4 18 8d 65 f4 5b 5e 5f 5d c3 55 89 e5 81 ec 84 00 00 00 65 8b 15 14 00 00 00 89 55 fc <8b> 50 0c 85 d2 75 0f 8b 00 8d 95 7c ff ff ff e8 b7 cc ff ff 89 c2
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	68 79 ff f6 c1       	pushq  $0xffffffffc1f6ff79
   7:	e8 e5 7e 00 00       	callq  0x7ef1
   c:	83 c4 18             	add    $0x18,%esp
   f:	8d 65 f4             	lea    -0xc(%rbp),%esp
  12:	5b                   	pop    %rbx
  13:	5e                   	pop    %rsi
  14:	5f                   	pop    %rdi
  15:	5d                   	pop    %rbp
  16:	c3                   	retq   
  17:	55                   	push   %rbp
  18:	89 e5                	mov    %esp,%ebp
  1a:	81 ec 84 00 00 00    	sub    $0x84,%esp
  20:	65 8b 15 14 00 00 00 	mov    %gs:0x14(%rip),%edx        # 0x3b
  27:	89 55 fc             	mov    %edx,-0x4(%rbp)
  2a:*	8b 50 0c             	mov    0xc(%rax),%edx		<-- trapping instruction
  2d:	85 d2                	test   %edx,%edx
  2f:	75 0f                	jne    0x40
  31:	8b 00                	mov    (%rax),%eax
  33:	8d 95 7c ff ff ff    	lea    -0x84(%rbp),%edx
  39:	e8 b7 cc ff ff       	callq  0xffffffffffffccf5
  3e:	89 c2                	mov    %eax,%edx

Code starting with the faulting instruction
===========================================
   0:	8b 50 0c             	mov    0xc(%rax),%edx
   3:	85 d2                	test   %edx,%edx
   5:	75 0f                	jne    0x16
   7:	8b 00                	mov    (%rax),%eax
   9:	8d 95 7c ff ff ff    	lea    -0x84(%rbp),%edx
   f:	e8 b7 cc ff ff       	callq  0xffffffffffffcccb
  14:	89 c2                	mov    %eax,%edx


To reproduce:

        # build kernel
	cd linux
	cp config-5.4.57-07396-g4c67e3f8457f3 .config
	make HOSTCC=gcc-12 CC=gcc-12 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-12 CC=gcc-12 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--Hn06Is6wPKeAOQ1i
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-5.4.57-07396-g4c67e3f8457f3"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 5.4.57 Kernel Configuration
#

#
# Compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120200
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_BSD_PROCESS_ACCT=y
# CONFIG_BSD_PROCESS_ACCT_V3 is not set
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_PREEMPT_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_HUGETLB=y
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_SYSCALL is not set
# CONFIG_USERFAULTFD is not set
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
CONFIG_X86_GOLDFISH=y
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=m
# CONFIG_IOSF_MBI_DEBUG is not set
# CONFIG_X86_RDC321X is not set
# CONFIG_X86_32_IRIS is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_KVM_DEBUG_FS is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
CONFIG_MPENTIUMII=y
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=5
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=6
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1
CONFIG_UP_LATE_INIT=y
CONFIG_X86_UP_APIC=y
CONFIG_X86_UP_IOAPIC=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

# CONFIG_X86_LEGACY_VM86 is not set
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
CONFIG_TOSHIBA=m
CONFIG_I8K=y
CONFIG_X86_REBOOTFIXUPS=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=m
# CONFIG_X86_CPUID is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_HIGHMEM64G is not set
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_HIGHMEM=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
# CONFIG_HIGHPTE is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_X86_RESERVE_LOW=64
# CONFIG_MATH_EMULATION is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_INTEL_UMIP=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_SECCOMP is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# end of Processor type and features

CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
# CONFIG_ACPI_CONTAINER is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_DPTF_POWER is not set
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_X86_PM_TIMER=y
# CONFIG_SFI is not set
# CONFIG_APM is not set

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
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
CONFIG_PCI_GOMMCONFIG=y
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOANY is not set
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
# CONFIG_SCx200HR_TIMER is not set
# CONFIG_OLPC is not set
CONFIG_ALIX=y
# CONFIG_NET5501 is not set
CONFIG_GEOS=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y

#
# Firmware Drivers
#
CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_SMI is not set
# CONFIG_GOOGLE_COREBOOT_TABLE is not set
# CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
CONFIG_EFI_EARLYCON=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
# CONFIG_KVM_MMU_AUDIT is not set
CONFIG_VHOST_NET=y
# CONFIG_VHOST_VSOCK is not set
CONFIG_VHOST=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_HAVE_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_64BIT_TIME=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_REFCOUNT=y
# CONFIG_REFCOUNT_FULL is not set
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_PLUGIN_HOSTCC=""
CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
CONFIG_MODULE_SIG_SHA384=y
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha384"
# CONFIG_MODULE_COMPRESS is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_UNUSED_SYMBOLS=y
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=m
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=m
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_MMAP_NOEXEC_TAINT=1
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_TRANSPARENT_HUGE_PAGECACHE=y
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
CONFIG_ZSMALLOC=m
# CONFIG_PGTABLE_MAPPING is not set
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_FRAME_VECTOR=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_LOW_MEM_NOTIFY is not set
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
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
# CONFIG_NETLABEL is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=m
CONFIG_MRP=y
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=m
CONFIG_DEV_APPLETALK=m
# CONFIG_LTPC is not set
# CONFIG_COPS is not set
CONFIG_IPDDP=m
CONFIG_IPDDP_ENCAP=y
CONFIG_X25=m
CONFIG_LAPB=y
CONFIG_PHONET=y
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
# CONFIG_VMWARE_VMCI_VSOCKETS is not set
# CONFIG_VIRTIO_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_NET_NCSI is not set
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
# CONFIG_BPF_JIT is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
CONFIG_CAN_BCM=m
# CONFIG_CAN_GW is not set
CONFIG_CAN_J1939=m

#
# CAN Device Drivers
#
# CONFIG_CAN_VCAN is not set
# CONFIG_CAN_VXCAN is not set
# CONFIG_CAN_SLCAN is not set
# CONFIG_CAN_DEV is not set
# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=y
# CONFIG_BT_BREDR is not set
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_FEATURE_DEBUG is not set

#
# Bluetooth device drivers
#
CONFIG_BT_BCM=m
CONFIG_BT_QCA=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_SERDEV=y
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_NOKIA=m
# CONFIG_BT_HCIUART_BCSP is not set
# CONFIG_BT_HCIUART_ATH3K is not set
# CONFIG_BT_HCIUART_LL is not set
# CONFIG_BT_HCIUART_3WIRE is not set
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_RTL is not set
CONFIG_BT_HCIUART_QCA=y
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIUART_MRVL=y
CONFIG_BT_HCIDTL1=m
# CONFIG_BT_HCIBT3C is not set
# CONFIG_BT_HCIBLUECARD is not set
# CONFIG_BT_HCIVHCI is not set
# CONFIG_BT_MRVL is not set
# CONFIG_BT_WILINK is not set
CONFIG_BT_MTKUART=y
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_SPY=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=y
CONFIG_NL80211_TESTMODE=y
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
# CONFIG_CFG80211_DEFAULT_PS is not set
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_LIB80211=m
# CONFIG_LIB80211_DEBUG is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
# CONFIG_MAC80211_DEBUGFS is not set
CONFIG_MAC80211_MESSAGE_TRACING=y
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=m
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_FAILOVER=y
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_PCIEAER=y
# CONFIG_PCIEAER_INJECT is not set
# CONFIG_PCIE_ECRC is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEBUG is not set
# CONFIG_PCIEASPM_DEFAULT is not set
# CONFIG_PCIEASPM_POWERSAVE is not set
CONFIG_PCIEASPM_POWER_SUPERSAVE=y
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=m
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
# CONFIG_PCI_EPF_TEST is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=m
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
CONFIG_I82365=m
# CONFIG_TCIC is not set
CONFIG_PCMCIA_PROBE=y
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=m
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
CONFIG_RAPIDIO_DMA_ENGINE=y
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=m
# CONFIG_RAPIDIO_CHMAN is not set
CONFIG_RAPIDIO_MPORT_CDEV=m

#
# RapidIO Switch drivers
#
# CONFIG_RAPIDIO_TSI57X is not set
CONFIG_RAPIDIO_CPS_XX=m
# CONFIG_RAPIDIO_TSI568 is not set
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=m
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
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
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# end of Bus devices

CONFIG_CONNECTOR=m
# CONFIG_GNSS is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
CONFIG_MTD_BLOCK_RO=m
# CONFIG_FTL is not set
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=m
# CONFIG_RFD_FTL is not set
CONFIG_SSFDC=m
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=m
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=m
CONFIG_MTD_PHYSMAP_COMPAT=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
# CONFIG_MTD_SBC_GXX is not set
CONFIG_MTD_SCx200_DOCFLASH=m
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=m
CONFIG_MTD_ESB2ROM=m
CONFIG_MTD_CK804XROM=m
CONFIG_MTD_SCB2_FLASH=m
CONFIG_MTD_NETtel=m
CONFIG_MTD_L440GX=m
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set
CONFIG_MTD_INTEL_VR_NOR=m
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_PHRAM=m
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=m

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

CONFIG_MTD_NAND_CORE=m
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_NAND_ECC_SW_HAMMING=m
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
CONFIG_MTD_RAW_NAND=m
# CONFIG_MTD_NAND_ECC_SW_BCH is not set

#
# Raw/parallel NAND flash controllers
#
# CONFIG_MTD_NAND_DENALI_PCI is not set
CONFIG_MTD_NAND_CAFE=m
# CONFIG_MTD_NAND_CS553X is not set
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_GPIO=m
# CONFIG_MTD_NAND_PLATFORM is not set

#
# Misc
#
CONFIG_MTD_SM_COMMON=m
CONFIG_MTD_NAND_NANDSIM=m
CONFIG_MTD_NAND_RICOH=m
CONFIG_MTD_NAND_DISKONCHIP=m
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_MTD_HYPERBUS=m
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
# CONFIG_PNPBIOS is not set
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=y
CONFIG_CDROM=m
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=y
CONFIG_ZRAM=m
# CONFIG_ZRAM_WRITEBACK is not set
CONFIG_ZRAM_MEMORY_TRACKING=y
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
CONFIG_ATA_OVER_ETH=m
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
# CONFIG_NVME_MULTIPATH is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=m
CONFIG_IBM_ASM=m
CONFIG_PHANTOM=m
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_HP_ILO=m
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=m
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_VMWARE_BALLOON is not set
CONFIG_PCH_PHUB=m
CONFIG_SRAM=y
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
# CONFIG_PVPANIC is not set
CONFIG_C2PORT=y
CONFIG_C2PORT_DURAMAR_2150=y

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=m
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=y
# CONFIG_INTEL_MEI_ME is not set
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#
# CONFIG_VOP_BUS is not set

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# end of Intel MIC & related support

CONFIG_ECHO=m
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
# CONFIG_HABANA_AI is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=m
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=m
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
# CONFIG_CHR_DEV_SG is not set
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
CONFIG_ISCSI_BOOT_SYSFS=m
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
CONFIG_BE2ISCSI=m
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
CONFIG_SCSI_3W_9XXX=m
# CONFIG_SCSI_3W_SAS is not set
CONFIG_SCSI_ACARD=m
CONFIG_SCSI_AHA152X=m
CONFIG_SCSI_AHA1542=m
CONFIG_SCSI_AACRAID=m
# CONFIG_SCSI_AIC7XXX is not set
CONFIG_SCSI_AIC79XX=m
CONFIG_AIC79XX_CMDS_PER_DEVICE=32
CONFIG_AIC79XX_RESET_DELAY_MS=5000
# CONFIG_AIC79XX_BUILD_FIRMWARE is not set
# CONFIG_AIC79XX_DEBUG_ENABLE is not set
CONFIG_AIC79XX_DEBUG_MASK=0
# CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
CONFIG_SCSI_AIC94XX=m
# CONFIG_AIC94XX_DEBUG is not set
CONFIG_SCSI_MVSAS=m
# CONFIG_SCSI_MVSAS_DEBUG is not set
CONFIG_SCSI_MVSAS_TASKLET=y
CONFIG_SCSI_MVUMI=m
# CONFIG_SCSI_DPT_I2O is not set
CONFIG_SCSI_ADVANSYS=m
CONFIG_SCSI_ARCMSR=m
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
CONFIG_SCSI_SMARTPQI=m
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFSHCD_PCI=m
CONFIG_SCSI_UFS_DWC_TC_PCI=m
CONFIG_SCSI_UFSHCD_PLATFORM=m
# CONFIG_SCSI_UFS_CDNS_PLATFORM is not set
# CONFIG_SCSI_UFS_DWC_TC_PLATFORM is not set
# CONFIG_SCSI_UFS_BSG is not set
# CONFIG_SCSI_UFS_CRYPTO is not set
# CONFIG_SCSI_HPTIOP is not set
CONFIG_SCSI_BUSLOGIC=m
CONFIG_SCSI_FLASHPOINT=y
CONFIG_SCSI_MYRB=m
# CONFIG_SCSI_MYRS is not set
CONFIG_VMWARE_PVSCSI=m
CONFIG_LIBFC=m
# CONFIG_LIBFCOE is not set
CONFIG_SCSI_SNIC=m
# CONFIG_SCSI_SNIC_DEBUG_FS is not set
# CONFIG_SCSI_DMX3191D is not set
CONFIG_SCSI_FDOMAIN=m
CONFIG_SCSI_FDOMAIN_PCI=m
CONFIG_SCSI_FDOMAIN_ISA=m
# CONFIG_SCSI_GDTH is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_GENERIC_NCR5380 is not set
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_INITIO=m
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_STEX=m
CONFIG_SCSI_SYM53C8XX_2=m
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
CONFIG_SCSI_SYM53C8XX_MMIO=y
CONFIG_SCSI_IPR=m
# CONFIG_SCSI_IPR_TRACE is not set
CONFIG_SCSI_IPR_DUMP=y
# CONFIG_SCSI_QLOGIC_FAS is not set
CONFIG_SCSI_QLOGIC_1280=m
CONFIG_SCSI_QLA_FC=m
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
CONFIG_SCSI_DC395x=m
CONFIG_SCSI_AM53C974=m
CONFIG_SCSI_NSP32=m
CONFIG_SCSI_WD719X=m
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_PMCRAID=m
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
CONFIG_SCSI_VIRTIO=m
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
CONFIG_PCMCIA_AHA152X=m
CONFIG_PCMCIA_FDOMAIN=m
CONFIG_PCMCIA_NINJA_SCSI=m
# CONFIG_PCMCIA_QLOGIC is not set
# CONFIG_PCMCIA_SYM53C500 is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=m
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
# CONFIG_SATA_AHCI_PLATFORM is not set
CONFIG_SATA_INIC162X=m
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
# CONFIG_ATA_SFF is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
CONFIG_MD_LINEAR=m
# CONFIG_MD_RAID0 is not set
CONFIG_MD_RAID1=m
# CONFIG_MD_RAID10 is not set
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
CONFIG_DM_DEBUG_BLOCK_STACK_TRACING=y
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
# CONFIG_DM_VERITY_CHROMEOS is not set
CONFIG_DM_SNAPSHOT=m
# CONFIG_DM_THIN_PROVISIONING is not set
CONFIG_DM_CACHE=m
# CONFIG_DM_CACHE_SMQ is not set
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_ERA is not set
# CONFIG_DM_CLONE is not set
# CONFIG_DM_MIRROR is not set
# CONFIG_DM_RAID is not set
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
# CONFIG_DM_MULTIPATH_QL is not set
# CONFIG_DM_MULTIPATH_ST is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
# CONFIG_DM_FLAKEY is not set
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_AVB is not set
# CONFIG_DM_VERITY_FEC is not set
# CONFIG_DM_SWITCH is not set
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
# CONFIG_DM_BOW is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
# CONFIG_FIREWIRE_SBP2 is not set
# CONFIG_FIREWIRE_NET is not set
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
# CONFIG_NET_CORE is not set
CONFIG_ARCNET=m
# CONFIG_ARCNET_1201 is not set
CONFIG_ARCNET_1051=m
CONFIG_ARCNET_RAW=m
CONFIG_ARCNET_CAP=m
CONFIG_ARCNET_COM90xx=m
CONFIG_ARCNET_COM90xxIO=m
CONFIG_ARCNET_RIM_I=m
CONFIG_ARCNET_COM20020=m
# CONFIG_ARCNET_COM20020_ISA is not set
CONFIG_ARCNET_COM20020_PCI=m
CONFIG_ARCNET_COM20020_CS=m

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
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
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0 is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HP=y
# CONFIG_HP100 is not set
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2000 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
# CONFIG_ULTRA is not set
# CONFIG_WD80x3 is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_PCH_GBE is not set
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC9194 is not set
# CONFIG_PCMCIA_SMC91C92 is not set
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
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
CONFIG_FDDI=y
CONFIG_DEFXX=m
# CONFIG_DEFXX_MMIO is not set
CONFIG_SKFP=m
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_MDIO_DEVICE is not set
# CONFIG_PHYLIB is not set
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOE=m
CONFIG_PPP_ASYNC=m
# CONFIG_PPP_SYNC_TTY is not set
CONFIG_SLIP=y
CONFIG_SLHC=y
CONFIG_SLIP_COMPRESSED=y
# CONFIG_SLIP_SMART is not set
# CONFIG_SLIP_MODE_SLIP6 is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_ADM8211=m
# CONFIG_WLAN_VENDOR_ATH is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_ATMEL=y
CONFIG_PCI_ATMEL=y
CONFIG_PCMCIA_ATMEL=m
# CONFIG_WLAN_VENDOR_BROADCOM is not set
# CONFIG_WLAN_VENDOR_CISCO is not set
# CONFIG_WLAN_VENDOR_INTEL is not set
# CONFIG_WLAN_VENDOR_INTERSIL is not set
# CONFIG_WLAN_VENDOR_MARVELL is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
# CONFIG_WLAN_VENDOR_RALINK is not set
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_RTL8180=m
CONFIG_RTL_CARDS=m
CONFIG_RTL8192CE=m
CONFIG_RTL8192SE=m
# CONFIG_RTL8192DE is not set
CONFIG_RTL8723AE=m
# CONFIG_RTL8723BE is not set
CONFIG_RTL8188EE=m
CONFIG_RTL8192EE=m
# CONFIG_RTL8821AE is not set
CONFIG_RTLWIFI=m
CONFIG_RTLWIFI_PCI=m
CONFIG_RTLWIFI_DEBUG=y
CONFIG_RTL8192C_COMMON=m
CONFIG_RTL8723_COMMON=m
CONFIG_RTLBTCOEXIST=m
CONFIG_RTW88=m
# CONFIG_RTW88_8822BE is not set
# CONFIG_RTW88_8822CE is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
# CONFIG_WLAN_VENDOR_ST is not set
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WL1251=m
CONFIG_WL12XX=m
CONFIG_WL18XX=m
CONFIG_WLCORE=m
# CONFIG_WLAN_VENDOR_ZYDAS is not set
# CONFIG_WLAN_VENDOR_QUANTENNA is not set
CONFIG_PCMCIA_RAYCS=m
# CONFIG_PCMCIA_WL3501 is not set
CONFIG_MAC80211_HWSIM=m
CONFIG_VIRT_WIFI=m

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=y
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_CAPI_TRACE=y
# CONFIG_ISDN_CAPI_CAPI20 is not set
# CONFIG_MISDN is not set
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5520 is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=y
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=y
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_INPORT=m
CONFIG_MOUSE_ATIXL=y
# CONFIG_MOUSE_LOGIBM is not set
# CONFIG_MOUSE_PC110PAD is not set
CONFIG_MOUSE_VSXXXAA=y
CONFIG_MOUSE_GPIO=m
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADI=m
CONFIG_JOYSTICK_COBRA=m
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=m
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=y
CONFIG_JOYSTICK_IFORCE_232=y
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=m
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=m
# CONFIG_JOYSTICK_STINGER is not set
CONFIG_JOYSTICK_TWIDJOY=y
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_AS5011=m
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_FSIA6B=m
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=m
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
CONFIG_INPUT_ARIZONA_HAPTICS=m
CONFIG_INPUT_BMA150=m
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_MSM_VIBRATOR is not set
# CONFIG_INPUT_PCSPKR is not set
CONFIG_INPUT_MAX8925_ONKEY=m
CONFIG_INPUT_MC13783_PWRBUTTON=m
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=m
# CONFIG_INPUT_GP2A is not set
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=m
CONFIG_INPUT_GPIO_VIBRA=y
CONFIG_INPUT_WISTRON_BTNS=m
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
# CONFIG_INPUT_REGULATOR_HAPTIC is not set
CONFIG_INPUT_RETU_PWRBUTTON=m
# CONFIG_INPUT_AXP20X_PEK is not set
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PALMAS_PWRBUTTON=m
CONFIG_INPUT_PCF8574=m
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA9063_ONKEY=m
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_CMA3000=y
# CONFIG_INPUT_CMA3000_I2C is not set
CONFIG_INPUT_IDEAPAD_SLIDEBAR=m
CONFIG_INPUT_DRV260X_HAPTICS=m
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=m
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
CONFIG_GAMEPORT_FM801=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
# CONFIG_CYCLADES is not set
CONFIG_MOXA_INTELLIO=m
CONFIG_MOXA_SMARTIO=y
# CONFIG_SYNCLINK is not set
# CONFIG_SYNCLINKMP is not set
CONFIG_SYNCLINK_GT=m
CONFIG_NOZOMI=m
# CONFIG_ISI is not set
# CONFIG_N_HDLC is not set
CONFIG_N_GSM=y
# CONFIG_TRACE_SINK is not set
CONFIG_NULL_TTY=m
CONFIG_LDISC_AUTOLOAD=y
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=y
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=m
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_PCH_UART=m
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=y
CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
# CONFIG_IPMI_SSIF is not set
CONFIG_IPMI_WATCHDOG=m
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_GEODE=m
CONFIG_HW_RANDOM_VIA=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_NVRAM=y
CONFIG_DTLK=y
CONFIG_APPLICOM=y
# CONFIG_SONYPI is not set

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
# CONFIG_CARDMAN_4000 is not set
# CONFIG_CARDMAN_4040 is not set
# CONFIG_SCR24X is not set
CONFIG_IPWIRELESS=m
# end of PCMCIA character devices

# CONFIG_MWAVE is not set
CONFIG_SCx200_GPIO=m
# CONFIG_PC8736x_GPIO is not set
CONFIG_NSC_GPIO=m
# CONFIG_RAW_DRIVER is not set
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=y
# CONFIG_TCG_CR50_I2C is not set
# CONFIG_TCG_INFINEON is not set
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_VIRTIO_VTPM is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TELCLOCK is not set
CONFIG_DEVPORT=y
CONFIG_XILLYBUS=y
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

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
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
CONFIG_I2C_PIIX4=m
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=m
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=m
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EG20T=y
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_KEMPLD=m
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT_LIGHT is not set
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_ELEKTOR=m
CONFIG_I2C_PCA_ISA=y
CONFIG_SCx200_ACB=y
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=m

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_PCH=m
CONFIG_PTP_1588_CLOCK_KVM=m
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_SX150X=y
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_LYNXPOINT is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_SIOX is not set
CONFIG_GPIO_VX855=y
# CONFIG_GPIO_XILINX is not set
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
CONFIG_GPIO_WS16C48=m
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=m
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5520 is not set
# CONFIG_GPIO_ARIZONA is not set
# CONFIG_GPIO_BD9571MWV is not set
# CONFIG_GPIO_CRYSTAL_COVE is not set
CONFIG_GPIO_JANZ_TTL=m
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_MADERA=m
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_TIMBERDALE is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TQMX86=m
# CONFIG_GPIO_WM8350 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=y
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=m
CONFIG_GPIO_PCIE_IDIO_24=y
CONFIG_GPIO_RDC321X=m
# end of PCI GPIO expanders

CONFIG_GPIO_MOCKUP=y
CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=m
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=m
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_MAX8925_POWER is not set
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=m
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9150=y
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=m
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=m
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_MAX77693=m
CONFIG_CHARGER_BQ2415X=m
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_BATTERY_GAUGE_LTC2941=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=y
# CONFIG_SENSORS_ABITUGURU3 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=m
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AS370=m
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_K8TEMP=y
# CONFIG_SENSORS_K10TEMP is not set
CONFIG_SENSORS_FAM15H_POWER=y
CONFIG_SENSORS_APPLESMC=y
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DELL_SMM=y
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=y
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_MC13783_ADC is not set
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=m
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_I5500 is not set
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=y
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=m
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=m
# CONFIG_SENSORS_NCT7904 is not set
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_PCF8591=m
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC6W201 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_VIA_CPUTEMP=y
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=m
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_WM8350=y

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
# CONFIG_THERMAL_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
# CONFIG_MFD_AS3711 is not set
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
# CONFIG_MFD_CS47L92 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=y
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
# CONFIG_LPC_ICH is not set
CONFIG_LPC_SCH=y
CONFIG_INTEL_SOC_PMIC=y
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=y
CONFIG_MFD_JANZ_CMODIO=m
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=m
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77693=m
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=m
CONFIG_MFD_RETU=m
# CONFIG_MFD_PCF50633 is not set
# CONFIG_UCB1400_CORE is not set
CONFIG_MFD_RDC321X=m
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=m
# CONFIG_MFD_SMSC is not set
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=m
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=m
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS68470 is not set
CONFIG_MFD_TI_LP873X=m
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=m
# CONFIG_MFD_LM3533 is not set
CONFIG_MFD_TIMBERDALE=y
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
# CONFIG_RAVE_SP_CORE is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=m
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
CONFIG_REGULATOR_ARIZONA_MICSUPP=m
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BD9571MWV is not set
CONFIG_REGULATOR_DA9062=m
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=y
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=m
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LTC3589=m
CONFIG_REGULATOR_LTC3676=m
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8925=y
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8997 is not set
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
# CONFIG_REGULATOR_MC13892 is not set
# CONFIG_REGULATOR_MT6311 is not set
CONFIG_REGULATOR_PALMAS=y
# CONFIG_REGULATOR_PFUZE100 is not set
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=m
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_SKY81452 is not set
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=m
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=m
# CONFIG_REGULATOR_TPS65086 is not set
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_WM8350 is not set
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_RC_CORE=y
# CONFIG_RC_MAP is not set
# CONFIG_LIRC is not set
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_IR_ENE=y
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_ITE_CIR=y
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=y
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_WINBOND_CIR=y
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_TTUSBIR is not set
# CONFIG_RC_LOOPBACK is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_SIR is not set
# CONFIG_RC_XBOX_DVD is not set
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_CEC_RC=y
CONFIG_MEDIA_CONTROLLER=y
# CONFIG_MEDIA_CONTROLLER_DVB is not set
CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_V4L2=y
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
# CONFIG_VIDEO_PCI_SKELETON is not set
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_V4L2_FWNODE=y
CONFIG_DVB_CORE=y
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_VIDEO_CAFE_CCIC=y
# CONFIG_VIDEO_CADENCE is not set
CONFIG_VIDEO_ASPEED=y
CONFIG_V4L_MEM2MEM_DRIVERS=y
CONFIG_VIDEO_MEM2MEM_DEINTERLACE=m
# CONFIG_VIDEO_SH_VEU is not set
# CONFIG_V4L_TEST_DRIVERS is not set
CONFIG_DVB_PLATFORM_DRIVERS=y
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=m
CONFIG_RADIO_SI470X=m
# CONFIG_I2C_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_RADIO_SI476X is not set
CONFIG_RADIO_MAXIRADIO=m
CONFIG_RADIO_TEA5764=m
CONFIG_RADIO_SAA7706H=m
CONFIG_RADIO_TEF6862=m
CONFIG_RADIO_TIMBERDALE=m
CONFIG_RADIO_WL1273=m

#
# Texas Instruments WL128x FM driver (ST based)
#
CONFIG_RADIO_WL128X=m
# end of Texas Instruments WL128x FM driver (ST based)

CONFIG_V4L_RADIO_ISA_DRIVERS=y
CONFIG_RADIO_ISA=m
CONFIG_RADIO_CADET=m
CONFIG_RADIO_RTRACK=m
# CONFIG_RADIO_RTRACK2 is not set
# CONFIG_RADIO_AZTECH is not set
# CONFIG_RADIO_GEMTEK is not set
# CONFIG_RADIO_MIROPCM20 is not set
# CONFIG_RADIO_SF16FMI is not set
CONFIG_RADIO_SF16FMR2=m
CONFIG_RADIO_TERRATEC=m
CONFIG_RADIO_TRUST=m
CONFIG_RADIO_TYPHOON=m
CONFIG_RADIO_ZOLTRIX=m
# CONFIG_VIRTIO_VIDEO is not set

#
# Supported FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_TDA7432=m
CONFIG_VIDEO_TDA9840=y
# CONFIG_VIDEO_TDA1997X is not set
CONFIG_VIDEO_TEA6415C=y
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_MSP3400=y
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=y
# CONFIG_VIDEO_CS53L32A is not set
CONFIG_VIDEO_TLV320AIC23B=m
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_WM8775=m
# CONFIG_VIDEO_WM8739 is not set
CONFIG_VIDEO_VP27SMPX=y
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
# CONFIG_VIDEO_ADV7183 is not set
CONFIG_VIDEO_ADV7604=y
CONFIG_VIDEO_ADV7604_CEC=y
CONFIG_VIDEO_ADV7842=y
# CONFIG_VIDEO_ADV7842_CEC is not set
CONFIG_VIDEO_BT819=y
CONFIG_VIDEO_BT856=m
CONFIG_VIDEO_BT866=m
# CONFIG_VIDEO_KS0127 is not set
CONFIG_VIDEO_ML86V7667=y
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=y
CONFIG_VIDEO_TC358743=y
# CONFIG_VIDEO_TC358743_CEC is not set
CONFIG_VIDEO_TVP514X=y
CONFIG_VIDEO_TVP5150=y
# CONFIG_VIDEO_TVP7002 is not set
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=y
# CONFIG_VIDEO_TW9910 is not set
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
# CONFIG_VIDEO_CX25840 is not set

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
CONFIG_VIDEO_ADV7393=m
CONFIG_VIDEO_ADV7511=y
# CONFIG_VIDEO_ADV7511_CEC is not set
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_AK881X=m
CONFIG_VIDEO_THS8200=m

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
# CONFIG_VIDEO_IMX214 is not set
CONFIG_VIDEO_IMX258=y
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX319=y
CONFIG_VIDEO_IMX355=m
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=m
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
CONFIG_VIDEO_OV2740=m
# CONFIG_VIDEO_OV5647 is not set
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV5670=m
# CONFIG_VIDEO_OV5675 is not set
CONFIG_VIDEO_OV5695=y
CONFIG_VIDEO_OV7251=y
# CONFIG_VIDEO_OV772X is not set
CONFIG_VIDEO_OV7640=y
CONFIG_VIDEO_OV7670=y
CONFIG_VIDEO_OV7740=y
CONFIG_VIDEO_OV8856=m
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_OV9650 is not set
CONFIG_VIDEO_OV13858=m
# CONFIG_VIDEO_VS6624 is not set
CONFIG_VIDEO_MT9M001=m
# CONFIG_VIDEO_MT9M032 is not set
CONFIG_VIDEO_MT9M111=y
CONFIG_VIDEO_MT9P031=m
# CONFIG_VIDEO_MT9T001 is not set
CONFIG_VIDEO_MT9T112=y
CONFIG_VIDEO_MT9V011=y
CONFIG_VIDEO_MT9V032=m
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_M5MOLS is not set
# CONFIG_VIDEO_RJ54N1 is not set
# CONFIG_VIDEO_S5K6AA is not set
CONFIG_VIDEO_S5K6A3=m
# CONFIG_VIDEO_S5K4ECGX is not set
CONFIG_VIDEO_S5K5BAF=m
# CONFIG_VIDEO_SMIAPP is not set
CONFIG_VIDEO_ET8EK8=y

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
CONFIG_VIDEO_AK7375=m
CONFIG_VIDEO_DW9714=y
CONFIG_VIDEO_DW9807_VCM=y

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=y

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_THS7303=m
CONFIG_VIDEO_M52790=m
CONFIG_VIDEO_I2C=y
# CONFIG_VIDEO_ST_MIPID02 is not set
# end of I2C Encoders, decoders, sensors and other helper chips

#
# SPI helper chips
#
# end of SPI helper chips

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=y
# CONFIG_MEDIA_TUNER_TEA5761 is not set
CONFIG_MEDIA_TUNER_TEA5767=m
# CONFIG_MEDIA_TUNER_MT20XX is not set
CONFIG_MEDIA_TUNER_MT2060=y
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_QT1010=m
# CONFIG_MEDIA_TUNER_XC2028 is not set
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=m
# CONFIG_MEDIA_TUNER_MXL5005S is not set
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_MC44S803=y
# CONFIG_MEDIA_TUNER_MAX2165 is not set
# CONFIG_MEDIA_TUNER_TDA18218 is not set
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=y
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_E4000=y
# CONFIG_MEDIA_TUNER_FC2580 is not set
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_IT913X=y
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_QM1D1C0042=y
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=y
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=y
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=y
CONFIG_DVB_STV6111=m
CONFIG_DVB_MXL5XX=y
CONFIG_DVB_M88DS3103=y

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=y
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=y
# CONFIG_DVB_MN88473 is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
# CONFIG_DVB_CX24123 is not set
CONFIG_DVB_MT312=m
# CONFIG_DVB_ZL10036 is not set
# CONFIG_DVB_ZL10039 is not set
# CONFIG_DVB_S5H1420 is not set
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=y
# CONFIG_DVB_STV0299 is not set
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=y
# CONFIG_DVB_TDA8083 is not set
# CONFIG_DVB_TDA10086 is not set
CONFIG_DVB_TDA8261=y
CONFIG_DVB_VES1X93=y
# CONFIG_DVB_TUNER_ITD1000 is not set
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TDA826X=y
CONFIG_DVB_TUA6100=y
# CONFIG_DVB_CX24116 is not set
# CONFIG_DVB_CX24117 is not set
# CONFIG_DVB_CX24120 is not set
CONFIG_DVB_SI21XX=y
CONFIG_DVB_TS2020=m
# CONFIG_DVB_DS3000 is not set
CONFIG_DVB_MB86A16=y
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=m
CONFIG_DVB_SP887X=y
CONFIG_DVB_CX22700=y
CONFIG_DVB_CX22702=y
CONFIG_DVB_S5H1432=m
# CONFIG_DVB_DRXD is not set
# CONFIG_DVB_L64781 is not set
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=y
CONFIG_DVB_MT352=y
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
# CONFIG_DVB_DIB3000MC is not set
CONFIG_DVB_DIB7000M=y
# CONFIG_DVB_DIB7000P is not set
CONFIG_DVB_DIB9000=y
CONFIG_DVB_TDA10048=m
# CONFIG_DVB_AF9013 is not set
CONFIG_DVB_EC100=y
CONFIG_DVB_STV0367=y
# CONFIG_DVB_CXD2820R is not set
CONFIG_DVB_CXD2841ER=m
# CONFIG_DVB_RTL2830 is not set
CONFIG_DVB_RTL2832=m
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_ZD1301_DEMOD=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=y
CONFIG_DVB_STV0297=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=y
# CONFIG_DVB_OR51211 is not set
# CONFIG_DVB_OR51132 is not set
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LGDT330X=m
# CONFIG_DVB_LGDT3305 is not set
CONFIG_DVB_LGDT3306A=y
CONFIG_DVB_LG2160=y
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_AU8522_DTV is not set
# CONFIG_DVB_AU8522_V4L is not set
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=y
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_TC90522 is not set
CONFIG_DVB_MN88443X=y

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
# CONFIG_DVB_TUNER_DIB0070 is not set
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_DRX39XYJ is not set
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBH29=y
CONFIG_DVB_LNBP21=y
CONFIG_DVB_LNBP22=y
# CONFIG_DVB_ISL6405 is not set
CONFIG_DVB_ISL6421=m
# CONFIG_DVB_ISL6423 is not set
# CONFIG_DVB_A8293 is not set
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=y
CONFIG_DVB_ATBM8830=y
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_IX2505V=m
# CONFIG_DVB_M88RS2000 is not set
CONFIG_DVB_AF9033=y
CONFIG_DVB_HORUS3A=y
CONFIG_DVB_ASCOT2E=m
CONFIG_DVB_HELENE=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
CONFIG_DVB_SP2=m

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Customise DVB Frontends

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_BO_WAIT_TIMEOUT=15
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_VM=y
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=y
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
# end of ACP (Audio CoProcessor) Configuration

# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=m
CONFIG_DRM_ATI_PCIGART=y
# CONFIG_DRM_EVDI is not set
CONFIG_DRM_VMWGFX=m
# CONFIG_DRM_VMWGFX_FBCON is not set
CONFIG_DRM_GMA500=y
# CONFIG_DRM_GMA600 is not set
# CONFIG_DRM_GMA3600 is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_AST is not set
CONFIG_DRM_MGAG200=m
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
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
# CONFIG_DRM_ETNAVIV_THERMAL is not set
CONFIG_DRM_VBOXVIDEO=y
CONFIG_DRM_LEGACY=y
# CONFIG_DRM_TDFX is not set
# CONFIG_DRM_R128 is not set
# CONFIG_DRM_MGA is not set
# CONFIG_DRM_VIA is not set
# CONFIG_DRM_SAVAGE is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# ARM GPU Configuration
#
CONFIG_MALI_VALHALL_REAL_HW=y
# end of ARM GPU Configuration

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
# CONFIG_FB_VESA is not set
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
CONFIG_BACKLIGHT_MAX8925=m
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_PM8941_WLED is not set
CONFIG_BACKLIGHT_SAHARA=m
# CONFIG_BACKLIGHT_ADP5520 is not set
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_SKY81452=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=y
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
# CONFIG_VGACON_SOFT_SCROLLBACK is not set
CONFIG_MDA_CONSOLE=m
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQUENCER_OSS=m
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_MIDI_EMUL=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=y
CONFIG_SND_OPL3_LIB=y
CONFIG_SND_OPL4_LIB=y
CONFIG_SND_OPL3_LIB_SEQ=m
CONFIG_SND_OPL4_LIB_SEQ=m
CONFIG_SND_AC97_CODEC=m
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_WSS_LIB=y
CONFIG_SND_SB_COMMON=y
CONFIG_SND_SB8_DSP=m
CONFIG_SND_SB16_DSP=y
CONFIG_SND_ISA=y
CONFIG_SND_ADLIB=y
# CONFIG_SND_AD1816A is not set
CONFIG_SND_AD1848=y
# CONFIG_SND_ALS100 is not set
CONFIG_SND_AZT1605=m
CONFIG_SND_AZT2316=y
# CONFIG_SND_AZT2320 is not set
CONFIG_SND_CMI8328=m
CONFIG_SND_CMI8330=y
CONFIG_SND_CS4231=y
CONFIG_SND_CS4236=y
CONFIG_SND_ES1688=y
# CONFIG_SND_ES18XX is not set
CONFIG_SND_SC6000=y
# CONFIG_SND_GUSCLASSIC is not set
# CONFIG_SND_GUSEXTREME is not set
CONFIG_SND_GUSMAX=m
# CONFIG_SND_INTERWAVE is not set
# CONFIG_SND_INTERWAVE_STB is not set
CONFIG_SND_JAZZ16=m
# CONFIG_SND_OPL3SA2 is not set
CONFIG_SND_OPTI92X_AD1848=y
CONFIG_SND_OPTI92X_CS4231=y
CONFIG_SND_OPTI93X=y
CONFIG_SND_MIRO=y
# CONFIG_SND_SB8 is not set
CONFIG_SND_SB16=m
CONFIG_SND_SBAWE=m
CONFIG_SND_SBAWE_SEQ=m
# CONFIG_SND_SB16_CSP is not set
# CONFIG_SND_SSCAPE is not set
CONFIG_SND_WAVEFRONT=m
# CONFIG_SND_MSND_PINNACLE is not set
CONFIG_SND_MSND_CLASSIC=y
# CONFIG_SND_PCI is not set

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
# CONFIG_SND_FIREWIRE is not set
# CONFIG_SND_PCMCIA is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_ACPI=m
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
CONFIG_SND_ATMEL_SOC=m
CONFIG_SND_BCM63XX_I2S_WHISTLER=m
# CONFIG_SND_DESIGNWARE_I2S is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=m
CONFIG_SND_SOC_FSL_AUDMIX=m
CONFIG_SND_SOC_FSL_SSI=m
CONFIG_SND_SOC_FSL_SPDIF=m
# CONFIG_SND_SOC_FSL_ESAI is not set
CONFIG_SND_SOC_FSL_MICFIL=m
CONFIG_SND_SOC_IMX_AUDMUX=m
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=m
CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=m
CONFIG_SND_SOC_IMG_I2S_OUT=m
CONFIG_SND_SOC_IMG_PARALLEL_OUT=m
CONFIG_SND_SOC_IMG_SPDIF_IN=m
CONFIG_SND_SOC_IMG_SPDIF_OUT=m
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=m
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SST_IPC=m
CONFIG_SND_SST_IPC_PCI=m
CONFIG_SND_SST_IPC_ACPI=m
# CONFIG_SND_SOC_INTEL_HASWELL is not set
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=m
# CONFIG_SND_SOC_INTEL_SKYLAKE is not set
# CONFIG_SND_SOC_INTEL_SKL is not set
# CONFIG_SND_SOC_INTEL_APL is not set
# CONFIG_SND_SOC_INTEL_KBL is not set
# CONFIG_SND_SOC_INTEL_GLK is not set
# CONFIG_SND_SOC_INTEL_CNL is not set
# CONFIG_SND_SOC_INTEL_CFL is not set
# CONFIG_SND_SOC_INTEL_CML_H is not set
# CONFIG_SND_SOC_INTEL_CML_LP is not set
CONFIG_SND_SOC_ACPI_INTEL_MATCH=m
CONFIG_SND_SOC_INTEL_MACH=y
CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES=y
CONFIG_SND_SOC_MTK_BTCVSD=m
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

CONFIG_SND_SOC_XILINX_I2S=m
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
# CONFIG_SND_SOC_XTFPGA_I2S is not set
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_ADAU1701=m
# CONFIG_SND_SOC_ADAU1761_I2C is not set
# CONFIG_SND_SOC_ADAU7002 is not set
CONFIG_SND_SOC_AK4118=m
CONFIG_SND_SOC_AK4458=m
CONFIG_SND_SOC_AK4554=m
# CONFIG_SND_SOC_AK4613 is not set
CONFIG_SND_SOC_AK4642=m
# CONFIG_SND_SOC_AK5386 is not set
CONFIG_SND_SOC_AK5558=m
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_BD28623 is not set
CONFIG_SND_SOC_BT_SCO=m
CONFIG_SND_SOC_CS35L32=m
CONFIG_SND_SOC_CS35L33=m
# CONFIG_SND_SOC_CS35L34 is not set
CONFIG_SND_SOC_CS35L35=m
CONFIG_SND_SOC_CS35L36=m
CONFIG_SND_SOC_CS42L42=m
CONFIG_SND_SOC_CS42L51=m
CONFIG_SND_SOC_CS42L51_I2C=m
# CONFIG_SND_SOC_CS42L52 is not set
CONFIG_SND_SOC_CS42L56=m
# CONFIG_SND_SOC_CS42L73 is not set
# CONFIG_SND_SOC_CS4265 is not set
CONFIG_SND_SOC_CS4270=m
# CONFIG_SND_SOC_CS4271_I2C is not set
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
# CONFIG_SND_SOC_CS4349 is not set
CONFIG_SND_SOC_CS53L30=m
CONFIG_SND_SOC_CX2072X=m
CONFIG_SND_SOC_DMIC=m
CONFIG_SND_SOC_HDMI_CODEC=m
CONFIG_SND_SOC_ES7134=m
CONFIG_SND_SOC_ES7241=m
CONFIG_SND_SOC_ES8316=m
CONFIG_SND_SOC_ES8328=m
CONFIG_SND_SOC_ES8328_I2C=m
CONFIG_SND_SOC_GTM601=m
# CONFIG_SND_SOC_INNO_RK3036 is not set
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98357A=m
# CONFIG_SND_SOC_MAX98504 is not set
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=m
CONFIG_SND_SOC_MAX98373=m
CONFIG_SND_SOC_MAX9860=m
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
CONFIG_SND_SOC_PCM1681=m
CONFIG_SND_SOC_PCM1789=m
CONFIG_SND_SOC_PCM1789_I2C=m
# CONFIG_SND_SOC_PCM179X_I2C is not set
# CONFIG_SND_SOC_PCM186X_I2C is not set
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
CONFIG_SND_SOC_PCM3168A=m
CONFIG_SND_SOC_PCM3168A_I2C=m
CONFIG_SND_SOC_PCM512x=m
CONFIG_SND_SOC_PCM512x_I2C=m
CONFIG_SND_SOC_RK3328=m
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT5616=m
CONFIG_SND_SOC_RT5631=m
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SIGMADSP=m
CONFIG_SND_SOC_SIGMADSP_I2C=m
# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
# CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
# CONFIG_SND_SOC_SPDIF is not set
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2602=m
CONFIG_SND_SOC_SSM2602_I2C=m
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
CONFIG_SND_SOC_STA350=m
CONFIG_SND_SOC_STI_SAS=m
CONFIG_SND_SOC_TAS2552=m
# CONFIG_SND_SOC_TAS5086 is not set
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
CONFIG_SND_SOC_TAS6424=m
# CONFIG_SND_SOC_TDA7419 is not set
CONFIG_SND_SOC_TFA9879=m
CONFIG_SND_SOC_TLV320AIC23=m
CONFIG_SND_SOC_TLV320AIC23_I2C=m
CONFIG_SND_SOC_TLV320AIC31XX=m
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
CONFIG_SND_SOC_TLV320AIC3X=m
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
CONFIG_SND_SOC_TSCS454=m
CONFIG_SND_SOC_UDA1334=m
# CONFIG_SND_SOC_WM8510 is not set
# CONFIG_SND_SOC_WM8523 is not set
CONFIG_SND_SOC_WM8524=m
CONFIG_SND_SOC_WM8580=m
CONFIG_SND_SOC_WM8711=m
# CONFIG_SND_SOC_WM8728 is not set
CONFIG_SND_SOC_WM8731=m
# CONFIG_SND_SOC_WM8737 is not set
CONFIG_SND_SOC_WM8741=m
# CONFIG_SND_SOC_WM8750 is not set
CONFIG_SND_SOC_WM8753=m
# CONFIG_SND_SOC_WM8776 is not set
CONFIG_SND_SOC_WM8782=m
CONFIG_SND_SOC_WM8804=m
CONFIG_SND_SOC_WM8804_I2C=m
CONFIG_SND_SOC_WM8903=m
CONFIG_SND_SOC_WM8904=m
CONFIG_SND_SOC_WM8960=m
# CONFIG_SND_SOC_WM8962 is not set
# CONFIG_SND_SOC_WM8974 is not set
CONFIG_SND_SOC_WM8978=m
CONFIG_SND_SOC_WM8985=m
# CONFIG_SND_SOC_ZX_AUD96P22 is not set
# CONFIG_SND_SOC_MAX9759 is not set
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6358=m
CONFIG_SND_SOC_NAU8540=m
CONFIG_SND_SOC_NAU8810=m
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_TPA6130A2=m
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
CONFIG_SND_X86=y
CONFIG_SND_SYNTH_EMUX=m
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_PRODIKEYS is not set
# CONFIG_HID_CMEDIA is not set
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELECOM is not set
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LOGITECH=y
# CONFIG_HID_LOGITECH_HIDPP is not set
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

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
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_NET48XX is not set
CONFIG_LEDS_WRAP=m
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=m
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_CLEVO_MAIL is not set
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=m
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_INTEL_SS4200=y
# CONFIG_LEDS_ADP5520 is not set
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_TCA6507=m
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_MAX8997 is not set
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_OT200=y
CONFIG_LEDS_MENF21BMC=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=y
# CONFIG_LEDS_LM36274 is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_DISK=y
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=m
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=m
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_ACCESSIBILITY=y
CONFIG_A11Y_BRAILLE_CONSOLE=y
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=m
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
# CONFIG_EDAC_AMD76X is not set
CONFIG_EDAC_E7XXX=m
# CONFIG_EDAC_E752X is not set
CONFIG_EDAC_I82875P=m
# CONFIG_EDAC_I82975X is not set
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I82860 is not set
CONFIG_EDAC_R82600=m
# CONFIG_EDAC_I5000 is not set
# CONFIG_EDAC_I5100 is not set
CONFIG_EDAC_I7300=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_ALTERA_MSGDMA=m
# CONFIG_INTEL_IDMA64 is not set
CONFIG_PCH_DMA=y
CONFIG_TIMB_DMA=y
CONFIG_QCOM_HIDMA_MGMT=y
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
CONFIG_HSU_DMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_SELFTESTS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
CONFIG_UIO=y
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
CONFIG_UIO_AEC=y
CONFIG_UIO_SERCOS3=y
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=y
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_STAGING=y
CONFIG_COMEDI=m
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
# CONFIG_COMEDI_BOND is not set
# CONFIG_COMEDI_TEST is not set
# CONFIG_COMEDI_PARPORT is not set
CONFIG_COMEDI_SSV_DNP=m
# CONFIG_COMEDI_ISA_DRIVERS is not set
CONFIG_COMEDI_PCI_DRIVERS=m
CONFIG_COMEDI_8255_PCI=m
CONFIG_COMEDI_ADDI_WATCHDOG=m
CONFIG_COMEDI_ADDI_APCI_1032=m
CONFIG_COMEDI_ADDI_APCI_1500=m
CONFIG_COMEDI_ADDI_APCI_1516=m
# CONFIG_COMEDI_ADDI_APCI_1564 is not set
CONFIG_COMEDI_ADDI_APCI_16XX=m
CONFIG_COMEDI_ADDI_APCI_2032=m
# CONFIG_COMEDI_ADDI_APCI_2200 is not set
CONFIG_COMEDI_ADDI_APCI_3120=m
CONFIG_COMEDI_ADDI_APCI_3501=m
CONFIG_COMEDI_ADDI_APCI_3XXX=m
CONFIG_COMEDI_ADL_PCI6208=m
CONFIG_COMEDI_ADL_PCI7X3X=m
# CONFIG_COMEDI_ADL_PCI8164 is not set
CONFIG_COMEDI_ADL_PCI9111=m
CONFIG_COMEDI_ADL_PCI9118=m
CONFIG_COMEDI_ADV_PCI1710=m
# CONFIG_COMEDI_ADV_PCI1720 is not set
CONFIG_COMEDI_ADV_PCI1723=m
CONFIG_COMEDI_ADV_PCI1724=m
# CONFIG_COMEDI_ADV_PCI1760 is not set
# CONFIG_COMEDI_ADV_PCI_DIO is not set
# CONFIG_COMEDI_AMPLC_DIO200_PCI is not set
# CONFIG_COMEDI_AMPLC_PC236_PCI is not set
CONFIG_COMEDI_AMPLC_PC263_PCI=m
CONFIG_COMEDI_AMPLC_PCI224=m
# CONFIG_COMEDI_AMPLC_PCI230 is not set
CONFIG_COMEDI_CONTEC_PCI_DIO=m
# CONFIG_COMEDI_DAS08_PCI is not set
CONFIG_COMEDI_DT3000=m
# CONFIG_COMEDI_DYNA_PCI10XX is not set
CONFIG_COMEDI_GSC_HPDI=m
# CONFIG_COMEDI_MF6X4 is not set
CONFIG_COMEDI_ICP_MULTI=m
CONFIG_COMEDI_DAQBOARD2000=m
CONFIG_COMEDI_JR3_PCI=m
# CONFIG_COMEDI_KE_COUNTER is not set
CONFIG_COMEDI_CB_PCIDAS64=m
CONFIG_COMEDI_CB_PCIDAS=m
CONFIG_COMEDI_CB_PCIDDA=m
CONFIG_COMEDI_CB_PCIMDAS=m
CONFIG_COMEDI_CB_PCIMDDA=m
# CONFIG_COMEDI_ME4000 is not set
CONFIG_COMEDI_ME_DAQ=m
CONFIG_COMEDI_NI_6527=m
CONFIG_COMEDI_NI_65XX=m
CONFIG_COMEDI_NI_660X=m
CONFIG_COMEDI_NI_670X=m
# CONFIG_COMEDI_NI_LABPC_PCI is not set
CONFIG_COMEDI_NI_PCIDIO=m
CONFIG_COMEDI_NI_PCIMIO=m
CONFIG_COMEDI_RTD520=m
CONFIG_COMEDI_S626=m
CONFIG_COMEDI_MITE=m
CONFIG_COMEDI_NI_TIOCMD=m
# CONFIG_COMEDI_PCMCIA_DRIVERS is not set
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=m
CONFIG_RTLLIB=m
# CONFIG_RTLLIB_CRYPTO_CCMP is not set
# CONFIG_RTLLIB_CRYPTO_TKIP is not set
CONFIG_RTLLIB_CRYPTO_WEP=m
# CONFIG_RTL8192E is not set
CONFIG_RTS5208=m
CONFIG_VT6655=m
# CONFIG_FB_SM750 is not set

#
# Speakup console speech
#
CONFIG_SPEAKUP=m
# CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
CONFIG_SPEAKUP_SYNTH_ACNTPC=m
CONFIG_SPEAKUP_SYNTH_APOLLO=m
# CONFIG_SPEAKUP_SYNTH_AUDPTR is not set
CONFIG_SPEAKUP_SYNTH_BNS=m
CONFIG_SPEAKUP_SYNTH_DECTLK=m
CONFIG_SPEAKUP_SYNTH_DECEXT=m
# CONFIG_SPEAKUP_SYNTH_DECPC is not set
# CONFIG_SPEAKUP_SYNTH_DTLK is not set
CONFIG_SPEAKUP_SYNTH_KEYPC=m
CONFIG_SPEAKUP_SYNTH_LTLK=m
CONFIG_SPEAKUP_SYNTH_SOFT=m
# CONFIG_SPEAKUP_SYNTH_SPKOUT is not set
CONFIG_SPEAKUP_SYNTH_TXPRT=m
CONFIG_SPEAKUP_SYNTH_DUMMY=m
# end of Speakup console speech

CONFIG_STAGING_MEDIA=y
CONFIG_VIDEO_IPU3_IMGU=y

#
# soc_camera sensor drivers
#

#
# Android
#
# end of Android

# CONFIG_FIREWIRE_SERIAL is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_MOST is not set

#
# Gasket devices
#
# end of Gasket devices

CONFIG_FIELDBUS_DEV=y
# CONFIG_KPC2000 is not set

#
# ISDN CAPI drivers
#
# CONFIG_CAPI_AVM is not set
# CONFIG_ISDN_DRV_GIGASET is not set
# CONFIG_HYSDN is not set
# end of ISDN CAPI drivers

# CONFIG_UWB is not set
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DONT_MOUNT_VFAT=y
CONFIG_EXFAT_DISCARD=y
# CONFIG_EXFAT_DELAYED_SYNC is not set
# CONFIG_EXFAT_KERNEL_DEBUG is not set
# CONFIG_EXFAT_DEBUG_MSG is not set
CONFIG_EXFAT_DEFAULT_CODEPAGE=437
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_QLGE is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
CONFIG_PMC_ATOM=y
# CONFIG_MFD_CROS_EC is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CHROMEOS_LAPTOP=m
CONFIG_CHROMEOS_PSTORE=y
# CONFIG_CHROMEOS_TBMC is not set
# CONFIG_CROS_EC is not set
# CONFIG_CROS_KBD_LED_BACKLIGHT is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_SI5341=m
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI544=m
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
CONFIG_COMMON_CLK_PALMAS=y
# end of Common Clock Framework

# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=m
CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
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
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
CONFIG_XILINX_VCU=y
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ARIZONA is not set
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_MAX77693=m
CONFIG_EXTCON_MAX8997=m
CONFIG_EXTCON_PALMAS=m
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=m
CONFIG_MEMORY=y
# CONFIG_IIO is not set
# CONFIG_NTB is not set
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
# CONFIG_VME_CA91CX42 is not set
# CONFIG_VME_TSI148 is not set
CONFIG_VME_FAKE=m

#
# VME Board Drivers
#
# CONFIG_VMIVME_7805 is not set

#
# VME Device Drivers
#
# CONFIG_VME_USER is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=y
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=m
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_TI_SYSCON=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=m
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
CONFIG_STM=m
CONFIG_STM_PROTO_BASIC=m
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_INTEL_TH=m
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
CONFIG_INTEL_TH_GTH=m
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=m
# CONFIG_INTEL_TH_PTI is not set
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
CONFIG_FPGA_DFL=y
CONFIG_FPGA_DFL_FME=y
CONFIG_FPGA_DFL_FME_MGR=y
# CONFIG_FPGA_DFL_FME_BRIDGE is not set
CONFIG_FPGA_DFL_FME_REGION=y
# CONFIG_FPGA_DFL_AFU is not set
CONFIG_FPGA_DFL_PCI=m
CONFIG_PM_OPP=y
CONFIG_SIOX=m
CONFIG_SIOX_BUS_GPIO=m
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
# CONFIG_COUNTER is not set
# CONFIG_PKGLIST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
CONFIG_EXT3_FS=m
CONFIG_EXT3_FS_POSIX_ACL=y
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=m
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=m
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=m
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
CONFIG_JFS_DEBUG=y
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
# CONFIG_XFS_ONLINE_SCRUB is not set
CONFIG_XFS_DEBUG=y
# CONFIG_XFS_ASSERT_FATAL is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=m
# CONFIG_F2FS_STAT_FS is not set
# CONFIG_F2FS_FS_XATTR is not set
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=m
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=m
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_NTFS_FS=y
CONFIG_NTFS_DEBUG=y
# CONFIG_NTFS_RW is not set
# end of DOS/FAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
# CONFIG_PROC_UID is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITY_PERF_EVENTS_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
CONFIG_SECURITY_LOCKDOWN_LSM=y
# CONFIG_SECURITY_LOCKDOWN_LSM_EARLY is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
CONFIG_SECURITY_CHROMIUMOS_READONLY_PROC_SELF_MEM=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
CONFIG_INTEGRITY_PLATFORM_KEYRING=y
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
# CONFIG_IMA_TEMPLATE is not set
# CONFIG_IMA_NG_TEMPLATE is not set
CONFIG_IMA_SIG_TEMPLATE=y
CONFIG_IMA_DEFAULT_TEMPLATE="ima-sig"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
CONFIG_IMA_DEFAULT_HASH_SHA512=y
CONFIG_IMA_DEFAULT_HASH="sha512"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
# CONFIG_IMA_APPRAISE is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
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
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECRDSA is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_NHPOLY1305=m
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=y
CONFIG_CRYPTO_XXHASH=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=m
# CONFIG_CRYPTO_STREEBOG is not set
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
CONFIG_CRYPTO_AES_NI_INTEL=y
# CONFIG_CRYPTO_ANUBIS is not set
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_ARC4=m
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=y
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
CONFIG_CRYPTO_SM4=m
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_586=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=m
CONFIG_CRYPTO_USER_API_RNG=m
CONFIG_CRYPTO_USER_API_AEAD=m
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
# CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
# CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
CONFIG_CRYPTO_DEV_GEODE=y
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=y
CONFIG_CRYPTO_DEV_SP_CCP=y
# CONFIG_CRYPTO_DEV_CCP_CRYPTO is not set
CONFIG_CRYPTO_DEV_CCP_DEBUGFS=y
CONFIG_CRYPTO_DEV_QAT=y
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
CONFIG_CRYPTO_DEV_QAT_C3XXX=y
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=m
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=m
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_BTREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_CMA=y

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
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_TEST is not set
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_KASAN_STACK=1
# end of Memory Debugging

CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_DETECTOR_CORE=y
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=0
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# end of Debug Lockups and Hangs

CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_TIMEKEEPING is not set
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
CONFIG_RCU_PERF_TEST=y
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
# CONFIG_LATENCYTOP is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_PREEMPTIRQ_EVENTS is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_PREEMPT_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_MMIOTRACE is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_MEMTEST=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
CONFIG_SAMPLE_KOBJECT=y
# CONFIG_SAMPLE_KPROBES is not set
CONFIG_SAMPLE_HW_BREAKPOINT=m
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_RPMSG_CLIENT is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN_NO_ALIGNMENT=y
# CONFIG_TEST_UBSAN is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set
# CONFIG_ERROR_ON_WARNING is not set
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_X86_PTDUMP_CORE=y
# CONFIG_X86_PTDUMP is not set
CONFIG_DEBUG_WX=y
CONFIG_DOUBLEFAULT=y
CONFIG_DEBUG_TLBFLUSH=y
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
CONFIG_PUNIT_ATOM_DEBUG=m
CONFIG_UNWINDER_FRAME_POINTER=y
# end of Kernel hacking

--Hn06Is6wPKeAOQ1i
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys=
	export queue='vip'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='chrome-os/chromeos-5.4'
	export commit='4c67e3f8457f3e21b4a9c73a22823093d90146ee'
	export kconfig='i386-randconfig-i006-20230614'
	export nr_vm=300
	export submit_id='648bbae00b9a934b22451772'
	export job_file='/lkp/jobs/scheduled/vm-meta-206/boot-1-yocto-i386-minimal-20190520.cgz-i386-randconfig-i006-20230614-4c67e3f8457f-20230616-19234-cpznr0-3.yaml'
	export id='3cb286003c41435ef1508790553198ea6dddbbb8'
	export queuer_version='/lkp/xsang/.src-20230616-091947'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='yocto-i386-minimal-20190520.cgz'
	export compiler='gcc-12'
	export enqueue_time='2023-06-16 09:29:04 +0800'
	export _id='648bbae40b9a934b22451775'
	export _rt='/result/boot/1/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-i006-20230614/gcc-12/4c67e3f8457f3e21b4a9c73a22823093d90146ee'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-i006-20230614/gcc-12/4c67e3f8457f3e21b4a9c73a22823093d90146ee/8'
	export scheduler_version='/lkp/lkp/.src-20230616-090702'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/yocto/yocto-i386-minimal-20190520.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-i006-20230614/gcc-12/4c67e3f8457f3e21b4a9c73a22823093d90146ee/8
BOOT_IMAGE=/pkg/linux/i386-randconfig-i006-20230614/gcc-12/4c67e3f8457f3e21b4a9c73a22823093d90146ee/vmlinuz-5.4.57-07396-g4c67e3f8457f3
branch=chrome-os/chromeos-5.4
job=/lkp/jobs/scheduled/vm-meta-206/boot-1-yocto-i386-minimal-20190520.cgz-i386-randconfig-i006-20230614-4c67e3f8457f-20230616-19234-cpznr0-3.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-i006-20230614
commit=4c67e3f8457f3e21b4a9c73a22823093d90146ee
initcall_debug
mem=4G
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
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
	export modules_initrd='/pkg/linux/i386-randconfig-i006-20230614/gcc-12/4c67e3f8457f3e21b4a9c73a22823093d90146ee/modules.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export stop_repeat_if_found='dmesg.Kernel_panic-not_syncing:Fatal_exception'
	export kbuild_queue_analysis=1
	export meta_host='vm-meta-206'
	export kernel='/pkg/linux/i386-randconfig-i006-20230614/gcc-12/4c67e3f8457f3e21b4a9c73a22823093d90146ee/vmlinuz-5.4.57-07396-g4c67e3f8457f3'
	export dequeue_time='2023-06-16 10:46:10 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-206/boot-1-yocto-i386-minimal-20190520.cgz-i386-randconfig-i006-20230614-4c67e3f8457f-20230616-19234-cpznr0-3.cgz'

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

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--Hn06Is6wPKeAOQ1i
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
BFla

--Hn06Is6wPKeAOQ1i--
