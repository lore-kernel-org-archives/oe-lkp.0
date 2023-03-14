Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210A19F
	for <oe-lkp@lists.linux.dev>; Tue, 14 Mar 2023 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678782826; x=1710318826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVFdzlKxD49WWY3HpjUvy/wWoqjvOI2sZAhlf5vQ9m4=;
  b=B7l/bM73aozQs/gqGDC9D/pUjQTnzDA162H7T+HsmDLUPYNPHFx0D/5T
   ZkAZurqw1FrU2QLHDMD6ENzmlK25u0rpztA6f/8gNVbpF//YTaL5X5vbX
   qCQUnaLi7mtipeAvl4/EIlxrOQThaGfKX/fpBgQvViaIkV4nox2yU53fQ
   LGHru8m92L7Dqp8kyCtiZZfhFs8TBwSKgG3L7af42fsBRjsCfFgwmrnbC
   oCxASGh1G9lLl2tYHiZDnqtzclrdfQdC8vmP0nABggpLMvthlc4GnuQ6e
   H+jXncxDwZQdHKO6tNeNhKOGnGmowaxDJYC0SaCOA8eRdFgHgqrzSMYiY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338908073"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="xz'341?scan'341,208,341";a="338908073"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 01:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802762007"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="xz'341?scan'341,208,341";a="802762007"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 01:33:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 01:33:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 01:33:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 01:33:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 01:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRL/nXxzRDFJV5leDhpk3odW8eTx73RGPqX0vAZ8+NThQKN0wXgy07dRmBhtWW06TcoPmydAKedQUPHmq8f5LRZqFa+Ab9L+csHff/JqheydXzyXF2l2IpTDZpyu598JZ2RyV2oUZGjQKOuRmGn3jaDZrnhV89rw6+jAIAFuWa0RnwcVKk+rb3GUMS27pS6vcwgU28LPEIFD/5msjEIUAJBOA2lZ5V2f2Y/R0Xh6iCV2p0bcpSRsoP0vKNjpl6Kj7bhsg+vB/J4p5S2h6aO3F00q8qGKBrAl4PSGiwPYemzpxfUP2dslc/lTdnzXQdeK3yIjySTd480YbwaZ2xmDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnaNZ+XVZngHnLkiviFw12VXzCc5G5Y92T2BdK8P1so=;
 b=mul4O4tmXSU9xd5/H9dWmg1ynhphNPoZJs3EfmC7NDwSyqkEJ8XV+snZ6tblJh5OcXxuyS8H/T8Eva8Id3kDQkOyoQ8M7jhy0y7xyPruGYstKN53ZQ904HKlSqWe2BxbkVgES+3p/A6J828JxFfc+v/VTgJ4N6L3OgepQ4x5BlashsfVFGZ5W3kblgM+lh1rELk+nRQTDyZm9i0nqEDCYhfLCwFe0Aiw+++1VoepZ2TjDozYqTRX01/LKoWjk3fvmdgOucjPeBwOpkyJeeplzdgl5UZFlXlzLUJE/X/4ubGxwu7RT+Rb+C6rwRGTdjBa+vLqamYgKevmHUcKbdwY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 08:33:40 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e783:1ee2:e6e2:e1e4]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e783:1ee2:e6e2:e1e4%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:33:40 +0000
Date: Tue, 14 Mar 2023 16:33:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: [peterz-queue:sched/eevdf] [sched/fair]  fa34ab8cb9:
 UBSAN:array-index-out-of-bounds_in_kernel/sched/fair.c
Message-ID: <202303141546.dda966f3-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="ukAIFu4geGdc+3A1"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f8d127-65be-4285-08f0-08db2466cfe2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdxWrsl2hTdV0W1AcMrM9IkIZO8/2VKqKUEsmn5ZCwVzBsZX51Pc09K8Y9fR6NkHc5HC/72fr5T/I1RWyvxaBr6PnvP1TESemgKgNBcj2liRajUwTePnSmaK9pjCpEUKlThg94/4WeYsk7kZVlCIoAhQO3+9Y79c7gbdoEkcm/0Lfq+fnSD85eqI7PxU6ivUDv0lYpAxkFOcUnn3BZCLkOu11yhuM0EBItKlVdBUVVM8+oHp6u7Hqj8S4KHqxoS7f1cHiIqFkhHVIStUHWEXJJXbZTbrjF8Y9LQrI3uqJPmpUhH8fJ39Pa2X4KcQHoLCViWMJJVo/ifPbdUvuJikeNheRUpN9Bu9k/gPlze7Pamz/n+J1+A0eQCPjXqIf3iiu+rxwMt7HFFdjx3Y6yqJCT7OTxPb331km5b45raPAq3AeXj/fAFIlAgY4lV4Up/fcYAo1nd5uuusV7AO84bzw66TMJlU0aLSk5sBMLNJ/oTUDfPabBqLXQgOz1qKGjw69L/eL57KGrVe5DupcoMCO/oxkKAkc0CsAP9L71fc29VdPXWAPCge5wXvHNA8vk39n8cHPc0gmeIWQ1rXQFJSw24EiN8ZhPhyYtCwODczKJw8KTrZmmSYTxQWeSbRRHZW9UORkYMFM0+Rx7vR/FDGs8XNDObJmpgOAyVQL0YWBTXKlPV1c+Tk9XarJ/fVPLYhoFvj41aPBibVl9u/bcdRprNMqRtlVbcNw9dYkZbzVdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199018)(86362001)(36756003)(38100700002)(82960400001)(8936002)(66556008)(8676002)(66476007)(4326008)(41300700001)(478600001)(6916009)(316002)(2906002)(5660300002)(30864003)(66946007)(2616005)(83380400001)(6486002)(235185007)(26005)(186003)(107886003)(6666004)(6512007)(44144004)(6506007)(1076003)(966005)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KliG4nqKNIRxXAov/Emrqwpg25QQBwEGEVmjXI3DoAHtq6XsgcCkLZy2eEAt?=
 =?us-ascii?Q?PUl0zOYOKRRIvOesOLnD0gI29ARFxH7GYFfqFRrj5mPZhDz15IdQjXe5aeBq?=
 =?us-ascii?Q?Wefxf4FAbG5OZ8nJZ9imDNhlKMaY3DozCQqzbQW/i4ktZirGNpXs6cyksJmT?=
 =?us-ascii?Q?glEAwpacWqQc+vmc74A2tNzsV3RdOJC0CdznjB21C9YSbhGN1SToe4oe6ee9?=
 =?us-ascii?Q?QrQZKyJuKjtJwneSbBBCA/c7jeE/1K/qF2W7ImVMptGkWBZ/ssTne0xmbRqa?=
 =?us-ascii?Q?rs44sQeb8vD6bi8rgvnEWpSobBuIs0dOZd9LyBZoVu9J4kOECO/HR3LyE5fi?=
 =?us-ascii?Q?IbCQHUkPl/eMlpAvQjtQKes8Nt/4nwskOj1ksUQsbuDsjrqVYdgw9rWF3gdh?=
 =?us-ascii?Q?xOBps99rAt8Iiu1bxGVHiuGNL6ongYXpxmmpajhve4xxiuAMWpeWuYEL02A3?=
 =?us-ascii?Q?nTNhA6Jrq3Mrrart0u+NBC4pA+oJc5dzcW82iHGNyxxvPVBVUHZgiOrPeDjb?=
 =?us-ascii?Q?ve9gIT9bfNtGE2vdjlsbtvTyEWX1FrQA54B7+PnPvs+c9a5bL5YYAf3rNORP?=
 =?us-ascii?Q?WUC1e+nmfLW9lYUkDW2FOfgjwVV4PerGetOEV/6+98jUMRVBerOdx3hNu3hK?=
 =?us-ascii?Q?ZQmAibCISiIpOhFFDeoB6PyPyuUaSmu4llTv1WxXFIbQRDBOQ4oL0Ae2Qlxb?=
 =?us-ascii?Q?Ou8SmqUFRz0tltoiVg52Wm5ylJu/zZknEeAOjrMVbjaUycFivLP94BrKoCwU?=
 =?us-ascii?Q?89Gu3qOiSpJiLAkfltj3Wj1RDppRb0cxne3VaWI9VbSZkDn7BzgZirBRyBBm?=
 =?us-ascii?Q?z6XBnIeN2kA9kia696HO4BmqQhdpnyaFupv/RL6wqu6jZ7TsKWqoNjYOhcoC?=
 =?us-ascii?Q?oIdMV4vvds7EYb0C91JzH5dGwZelZ1+P/nG8RNaCLO9NrAk9u6V4As/VVT1T?=
 =?us-ascii?Q?+ecLzNKOcdv+edLrmYMz8oovMgZOa5jbn78GC+/TmUND2himbB1USUzvYfST?=
 =?us-ascii?Q?QDoRaabIccycC14OY6JM5/5qldxWERotW25S4BjApKZs+Vre866NHqd1juPX?=
 =?us-ascii?Q?luJ5IE7dJzNykiqoSBNlwwy9SI1hOA7NLn1A0Oy6WJcnx1Vu0JwAlfAmG7Xr?=
 =?us-ascii?Q?ROX1POALR9w7lp3vNidX1b602EO54L/e6JwjrUNXvEX+Ldr9lhgp4UhYQoru?=
 =?us-ascii?Q?e9eKU8pdJvSBaIeLQt5/RyEgL0niSEVCxWRoGS3wNhtNrF3PqLSUn1T+WZbX?=
 =?us-ascii?Q?5cr51TcDgpwdi99Bh7ij4+eY5v5enrFpxuNuUeR/BQpsLe8TxtMLx2uoW6FN?=
 =?us-ascii?Q?oPeQ/YOtu+3gv28dCI0hUohLI59qiM/4mo4M68Y0sogTa11V+VfqMOFdInPt?=
 =?us-ascii?Q?z1iteFOQgEUdM5Q/6BMSYXu1Pltm+HpPikMP9tDuWKdcQWnCRNFm3nTLi9JM?=
 =?us-ascii?Q?NaHU7nxkCBexiFTADFOmAB+4xEv+QpBWVrieK1xRTnwAAXMy/wcQXD1IbKQj?=
 =?us-ascii?Q?eOkNicsLmGtYLKwATsIbtF71lmHmmqD9vGFF+dmyuS0XHOMLaJE+lpsrKJI9?=
 =?us-ascii?Q?mZvQapbQ0Q6om8YkHAD7i4eaeYZ/ySPDNeDBPQNKIPaC56qLE2pEG9h4Mxbm?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f8d127-65be-4285-08f0-08db2466cfe2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 08:33:40.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnVNCnoeSydZ4nEhWdmhSsRa3ke+R7XOJjXJhUtbW7Pkx5U9CwH3UGBOqFoDWArgnxXZjhAfd8KicQYLzS/5og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-OriginatorOrg: intel.com

--ukAIFu4geGdc+3A1
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Greeting,

FYI, we noticed UBSAN:array-index-out-of-bounds_in_kernel/sched/fair.c due to commit (built with gcc-11):

commit: fa34ab8cb95611bb73d6dac030ce42a843a0a231 ("sched/fair: Add sched group latency support")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


+--------------------------------------------------------+------------+------------+
|                                                        | 39328767ed | fa34ab8cb9 |
+--------------------------------------------------------+------------+------------+
| boot_successes                                         | 10         | 0          |
| boot_failures                                          | 0          | 10         |
| UBSAN:array-index-out-of-bounds_in_kernel/sched/fair.c | 0          | 10         |
| BUG:KASAN:global-out-of-bounds_in_init_tg_cfs_entry    | 0          | 10         |
| divide_error:#[##]                                     | 0          | 10         |
| RIP:init_tg_cfs_entry                                  | 0          | 10         |
| Kernel_panic-not_syncing:Fatal_exception               | 0          | 10         |
+--------------------------------------------------------+------------+------------+


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202303141546.dda966f3-oliver.sang@intel.com


[   31.013453][    T1] UBSAN: array-index-out-of-bounds in kernel/sched/fair.c:708:35
[   31.014839][    T1] index 120 is out of range for type 'int [40]'
[   31.015737][    T1] CPU: 0 PID: 1 Comm: systemd Tainted: G                T  6.3.0-rc1-00003-gfa34ab8cb956 #1 c46146409bedf9d97ebbb81c23bb5ebd6090726a
[   31.017533][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[   31.018963][    T1] Call Trace:
[   31.019536][    T1]  <TASK>
[ 31.020050][ T1] dump_stack_lvl (??:?) 
[ 31.020765][ T1] dump_stack (??:?) 
[ 31.021407][ T1] __ubsan_handle_out_of_bounds (??:?) 
[ 31.022240][ T1] ? kasan_save_alloc_info (??:?) 
[ 31.023029][ T1] init_tg_cfs_entry (??:?) 
[ 31.023763][ T1] ? kmalloc_node_trace (??:?) 
[ 31.024509][ T1] alloc_fair_sched_group (??:?) 
[ 31.025307][ T1] sched_create_group (??:?) 
[ 31.026041][ T1] sched_autogroup_create_attach (??:?) 
[ 31.026872][ T1] ksys_setsid (??:?) 
[ 31.027547][ T1] __do_sys_setsid (sys.c:?) 
[ 31.028235][ T1] do_syscall_64 (??:?) 
[ 31.028928][ T1] ? tracer_hardirqs_on (??:?) 
[ 31.029687][ T1] ? syscall_exit_to_user_mode (??:?) 
[ 31.030499][ T1] ? do_syscall_64 (??:?) 
[ 31.033379][ T1] ? syscall_exit_to_user_mode (??:?) 
[ 31.034203][ T1] ? do_syscall_64 (??:?) 
[ 31.034913][ T1] ? exc_page_fault (??:?) 
[ 31.035630][ T1] entry_SYSCALL_64_after_hwframe (??:?) 
[   31.036483][    T1] RIP: 0033:0x7fb07f5903e7
[ 31.037166][ T1] Code: 73 01 c3 48 8b 0d a9 1a 0f 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 70 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 79 1a 0f 00 f7 d8 64 89 01 48
All code
========
   0:	73 01                	jae    0x3
   2:	c3                   	retq   
   3:	48 8b 0d a9 1a 0f 00 	mov    0xf1aa9(%rip),%rcx        # 0xf1ab3
   a:	f7 d8                	neg    %eax
   c:	64 89 01             	mov    %eax,%fs:(%rcx)
   f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  13:	c3                   	retq   
  14:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  1b:	00 00 00 
  1e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  23:	b8 70 00 00 00       	mov    $0x70,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 79 1a 0f 00 	mov    0xf1a79(%rip),%rcx        # 0xf1ab3
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 79 1a 0f 00 	mov    0xf1a79(%rip),%rcx        # 0xf1a89
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[   31.039684][    T1] RSP: 002b:00007fff520e7548 EFLAGS: 00000202 ORIG_RAX: 0000000000000070
[   31.040882][    T1] RAX: ffffffffffffffda RBX: 00007fb07ede56c8 RCX: 00007fb07f5903e7
[   31.042034][    T1] RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000000
[   31.043176][    T1] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000558750efe9c8
[   31.044321][    T1] R10: 00007fff520e74e0 R11: 0000000000000202 R12: 00007fff520e75c0
[   31.045432][    T1] R13: 00007fff520e77c8 R14: 0000000000000000 R15: 00007fff520e75d0
[   31.046621][    T1]  </TASK>
[   31.047326][    T1] ================================================================================
[   31.048713][    T1] ==================================================================
[ 31.049805][ T1] BUG: KASAN: global-out-of-bounds in init_tg_cfs_entry (??:?) 
[   31.050915][    T1] Read of size 4 at addr ffffffff83e8fb40 by task systemd/1
[   31.051865][    T1]
[   31.052282][    T1] CPU: 0 PID: 1 Comm: systemd Tainted: G                T  6.3.0-rc1-00003-gfa34ab8cb956 #1 c46146409bedf9d97ebbb81c23bb5ebd6090726a
[   31.053959][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[   31.055309][    T1] Call Trace:
[   31.055837][    T1]  <TASK>
[ 31.056318][ T1] dump_stack_lvl (??:?) 
[ 31.056975][ T1] print_address_description+0x57/0x390 
[ 31.057845][ T1] print_report (report.c:?) 
[ 31.058495][ T1] ? kasan_complete_mode_report_info (??:?) 
[ 31.059351][ T1] ? init_tg_cfs_entry (??:?) 
[ 31.060093][ T1] kasan_report (??:?) 
[ 31.060751][ T1] ? init_tg_cfs_entry (??:?) 
[ 31.061514][ T1] __asan_report_load4_noabort (??:?) 
[ 31.062298][ T1] init_tg_cfs_entry (??:?) 
[ 31.063017][ T1] ? kmalloc_node_trace (??:?) 
[ 31.063742][ T1] alloc_fair_sched_group (??:?) 
[ 31.064499][ T1] sched_create_group (??:?) 
[ 31.065188][ T1] sched_autogroup_create_attach (??:?) 
[ 31.065986][ T1] ksys_setsid (??:?) 
[ 31.066646][ T1] __do_sys_setsid (sys.c:?) 
[ 31.067321][ T1] do_syscall_64 (??:?) 
[ 31.067980][ T1] ? tracer_hardirqs_on (??:?) 
[ 31.068709][ T1] ? syscall_exit_to_user_mode (??:?) 
[ 31.069490][ T1] ? do_syscall_64 (??:?) 
[ 31.070173][ T1] ? syscall_exit_to_user_mode (??:?) 
[ 31.070976][ T1] ? do_syscall_64 (??:?) 
[ 31.071644][ T1] ? exc_page_fault (??:?) 
[ 31.072335][ T1] entry_SYSCALL_64_after_hwframe (??:?) 
[   31.073161][    T1] RIP: 0033:0x7fb07f5903e7
[ 31.073822][ T1] Code: 73 01 c3 48 8b 0d a9 1a 0f 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 70 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 79 1a 0f 00 f7 d8 64 89 01 48
All code
========
   0:	73 01                	jae    0x3
   2:	c3                   	retq   
   3:	48 8b 0d a9 1a 0f 00 	mov    0xf1aa9(%rip),%rcx        # 0xf1ab3
   a:	f7 d8                	neg    %eax
   c:	64 89 01             	mov    %eax,%fs:(%rcx)
   f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  13:	c3                   	retq   
  14:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  1b:	00 00 00 
  1e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  23:	b8 70 00 00 00       	mov    $0x70,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 79 1a 0f 00 	mov    0xf1a79(%rip),%rcx        # 0xf1ab3
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 79 1a 0f 00 	mov    0xf1a79(%rip),%rcx        # 0xf1a89
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[   31.076269][    T1] RSP: 002b:00007fff520e7548 EFLAGS: 00000202 ORIG_RAX: 0000000000000070
[   31.077417][    T1] RAX: ffffffffffffffda RBX: 00007fb07ede56c8 RCX: 00007fb07f5903e7
[   31.078522][    T1] RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000000
[   31.079644][    T1] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000558750efe9c8
[   31.080749][    T1] R10: 00007fff520e74e0 R11: 0000000000000202 R12: 00007fff520e75c0
[   31.081877][    T1] R13: 00007fff520e77c8 R14: 0000000000000000 R15: 00007fff520e75d0
[   31.083020][    T1]  </TASK>
[   31.083518][    T1]
[   31.083940][    T1] The buggy address belongs to the variable:
[ 31.084750][ T1] sched_prio_to_weight+0x1e0/0x1c80 
[   31.085506][    T1]
[   31.085926][    T1] The buggy address belongs to the physical page:
[   31.086796][    T1] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3e8f
[   31.088201][    T1] flags: 0x4000000000001000(reserved|zone=1)
[   31.088980][    T1] raw: 4000000000001000 ffffea00000fa3c8 ffffea00000fa3c8 0000000000000000
[   31.090142][    T1] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[   31.091310][    T1] page dumped because: kasan: bad access detected
[   31.092169][    T1] page_owner info is not present (never set?)
[   31.092993][    T1]
[   31.093409][    T1] Memory state around the buggy address:
[   31.094183][    T1]  ffffffff83e8fa00: f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
[   31.095292][    T1]  ffffffff83e8fa80: 06 f9 f9 f9 f9 f9 f9 f9 00 00 00 00 07 f9 f9 f9
[   31.096349][    T1] >ffffffff83e8fb00: f9 f9 f9 f9 00 00 00 00 01 f9 f9 f9 f9 f9 f9 f9
[   31.097403][    T1]                                            ^
[   31.098173][    T1]  ffffffff83e8fb80: 04 f9 f9 f9 f9 f9 f9 f9 00 01 f9 f9 f9 f9 f9 f9
[   31.099205][    T1]  ffffffff83e8fc00: 06 f9 f9 f9 f9 f9 f9 f9 00 00 00 f9 f9 f9 f9 f9
[   31.100208][    T1] ==================================================================
[   31.102796][    T1] Disabling lock debugging due to kernel taint
[   31.103650][    T1] divide error: 0000 [#1] KASAN
[   31.104348][    T1] CPU: 0 PID: 1 Comm: systemd Tainted: G    B           T  6.3.0-rc1-00003-gfa34ab8cb956 #1 c46146409bedf9d97ebbb81c23bb5ebd6090726a
[   31.106047][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[ 31.107403][ T1] RIP: 0010:init_tg_cfs_entry (??:?) 
[ 31.108201][ T1] Code: 83 c0 03 38 d0 7c 08 84 d2 0f 85 26 01 00 00 8b 05 1b 8b 96 03 31 d2 42 8b 0c a5 60 f9 e8 83 48 8d bb 90 00 00 00 48 c1 e0 0a <48> f7 f1 48 ba 00 00 00 00 00 fc ff df 48 89 f9 48 c1 e9 03 80 3c
All code
========
   0:	83 c0 03             	add    $0x3,%eax
   3:	38 d0                	cmp    %dl,%al
   5:	7c 08                	jl     0xf
   7:	84 d2                	test   %dl,%dl
   9:	0f 85 26 01 00 00    	jne    0x135
   f:	8b 05 1b 8b 96 03    	mov    0x3968b1b(%rip),%eax        # 0x3968b30
  15:	31 d2                	xor    %edx,%edx
  17:	42 8b 0c a5 60 f9 e8 	mov    -0x7c1706a0(,%r12,4),%ecx
  1e:	83 
  1f:	48 8d bb 90 00 00 00 	lea    0x90(%rbx),%rdi
  26:	48 c1 e0 0a          	shl    $0xa,%rax
  2a:*	48 f7 f1             	div    %rcx		<-- trapping instruction
  2d:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  34:	fc ff df 
  37:	48 89 f9             	mov    %rdi,%rcx
  3a:	48 c1 e9 03          	shr    $0x3,%rcx
  3e:	80                   	.byte 0x80
  3f:	3c                   	.byte 0x3c

Code starting with the faulting instruction
===========================================
   0:	48 f7 f1             	div    %rcx
   3:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
   a:	fc ff df 
   d:	48 89 f9             	mov    %rdi,%rcx
  10:	48 c1 e9 03          	shr    $0x3,%rcx
  14:	80                   	.byte 0x80
  15:	3c                   	.byte 0x3c


To reproduce:

        # build kernel
	cd linux
	cp config-6.3.0-rc1-00003-gfa34ab8cb956 .config
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



--ukAIFu4geGdc+3A1
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.3.0-rc1-00003-gfa34ab8cb956"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.3.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23990
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23990
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
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
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_KERNEL_LZ4=y
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
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

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# CONFIG_BPF_JIT is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_TIME_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
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
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
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
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
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

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
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
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=m
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
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
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1
CONFIG_UP_LATE_INIT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_THRESHOLD=y
# CONFIG_X86_MCE_INJECT is not set

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
CONFIG_PERF_EVENTS_INTEL_RAPL=y
# CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=m
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
CONFIG_X86_CPA_STATISTICS=y
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
# CONFIG_KEXEC is not set
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_KEXEC_SIG=y
# CONFIG_KEXEC_SIG_FORCE is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
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
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_USERSPACE_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_TABLE_LIB=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
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
# CONFIG_ACPI_NFIT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_VIOT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=m
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set

#
# CPU frequency scaling drivers
#
# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set
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
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
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
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
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
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
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
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_RQ_ALLOC_TIME=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_CGROUP_IOLATENCY=y
# CONFIG_BLK_CGROUP_FC_APPID is not set
CONFIG_BLK_CGROUP_IOCOST=y
CONFIG_BLK_CGROUP_IOPRIO=y
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=m
CONFIG_BFQ_GROUP_IOSCHED=y
CONFIG_BFQ_CGROUP_DEBUG=y
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_MEMORY_FAILURE is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
CONFIG_LRU_GEN_STATS=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
# CONFIG_DAMON_PADDR is not set
CONFIG_DAMON_SYSFS=y
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
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

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
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
# CONFIG_EISA_VLB_PRIMING is not set
# CONFIG_EISA_PCI_EISA is not set
CONFIG_EISA_VIRTUAL_ROOT=y
CONFIG_EISA_NAMES=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_ACPI is not set
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
# CONFIG_VMD is not set

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=m
CONFIG_CXL_PCI=m
CONFIG_CXL_MEM_RAW_COMMANDS=y
CONFIG_CXL_ACPI=m
# CONFIG_CXL_MEM is not set
CONFIG_CXL_PORT=m
# CONFIG_CXL_REGION is not set
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
CONFIG_PD6729=m
CONFIG_I82092=m
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=y
CONFIG_MHI_BUS_EP=y
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=m
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=m
CONFIG_MTD_CMDLINE_PARTS=m
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=m

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
# CONFIG_FTL is not set
CONFIG_NFTL=m
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=y
CONFIG_RFD_FTL=m
CONFIG_SSFDC=y
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=y
# CONFIG_MTD_PSTORE is not set
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
CONFIG_MTD_PMC551_BUGFIX=y
# CONFIG_MTD_PMC551_DEBUG is not set
# CONFIG_MTD_DATAFLASH is not set
CONFIG_MTD_MCHP23K256=m
CONFIG_MTD_MCHP48L640=m
CONFIG_MTD_SST25L=m
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_PCI=m
CONFIG_MTD_NAND_CAFE=m
CONFIG_MTD_NAND_MXIC=m
CONFIG_MTD_NAND_GPIO=m
# CONFIG_MTD_NAND_PLATFORM is not set
CONFIG_MTD_NAND_ARASAN=m

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=y
# CONFIG_MTD_NAND_RICOH is not set
CONFIG_MTD_NAND_DISKONCHIP=m
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
# CONFIG_MTD_SPI_NAND is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=y
# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=m
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
# CONFIG_PARPORT_1284 is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_VERBOSE_ERRORS=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_AD525X_DPOT_SPI=m
# CONFIG_DUMMY_IRQ is not set
CONFIG_IBM_ASM=m
CONFIG_PHANTOM=m
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=m
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_HP_ILO=y
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
# CONFIG_VMWARE_BALLOON is not set
CONFIG_LATTICE_ECP3_CONFIG=m
CONFIG_SRAM=y
CONFIG_DW_XDATA_PCIE=y
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=m
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
CONFIG_EEPROM_AT25=m
CONFIG_EEPROM_LEGACY=m
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_93XX46=m
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

CONFIG_CB710_CORE=m
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m

#
# Altera FPGA firmware download module (requires I2C)
#
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=m
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y
CONFIG_GENWQE=m
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=m
# CONFIG_BCM_VK is not set
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
CONFIG_UACCE=m
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
CONFIG_PVPANIC_PCI=m
CONFIG_GP_PCI1XXXX=y
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=m
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=m
CONFIG_SCSI=m
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=m
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=m
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=m
CONFIG_AHCI_DWC=m
CONFIG_SATA_INIC162X=m
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
# CONFIG_ATA_SFF is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
# CONFIG_MD_LINEAR is not set
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
# CONFIG_MD_FAULTY is not set
CONFIG_BCACHE=m
# CONFIG_BCACHE_DEBUG is not set
# CONFIG_BCACHE_CLOSURES_DEBUG is not set
CONFIG_BCACHE_ASYNC_REGISTRATION=y
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
CONFIG_DM_UNSTRIPED=m
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
CONFIG_DM_CLONE=m
CONFIG_DM_MIRROR=m
# CONFIG_DM_LOG_USERSPACE is not set
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
# CONFIG_DM_MULTIPATH is not set
# CONFIG_DM_DELAY is not set
CONFIG_DM_DUST=m
CONFIG_DM_UEVENT=y
# CONFIG_DM_FLAKEY is not set
CONFIG_DM_VERITY=m
CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=y
CONFIG_DM_VERITY_FEC=y
CONFIG_DM_SWITCH=m
# CONFIG_DM_LOG_WRITES is not set
CONFIG_DM_INTEGRITY=m
CONFIG_DM_ZONED=m
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
# CONFIG_TCM_USER2 is not set
CONFIG_LOOPBACK_TARGET=m
# CONFIG_ISCSI_TARGET is not set
CONFIG_SBP_TARGET=m
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_OHCI=m
# CONFIG_FIREWIRE_SBP2 is not set
# CONFIG_FIREWIRE_NET is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
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
# CONFIG_MACB is not set
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
CONFIG_NET_VENDOR_CIRRUS=y
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
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
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
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_IXGBEVF is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
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
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
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
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
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
# CONFIG_PCMCIA_RAYCS is not set
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
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
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
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_IQS62X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=m
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADC=y
# CONFIG_JOYSTICK_ADI is not set
CONFIG_JOYSTICK_COBRA=m
CONFIG_JOYSTICK_GF2K=m
# CONFIG_JOYSTICK_GRIP is not set
# CONFIG_JOYSTICK_GRIP_MP is not set
CONFIG_JOYSTICK_GUILLEMOT=m
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=m
# CONFIG_JOYSTICK_IFORCE_232 is not set
# CONFIG_JOYSTICK_WARRIOR is not set
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=y
# CONFIG_JOYSTICK_STINGER is not set
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_DB9 is not set
CONFIG_JOYSTICK_GAMECON=m
CONFIG_JOYSTICK_TURBOGRAFX=m
CONFIG_JOYSTICK_AS5011=m
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
# CONFIG_JOYSTICK_PSXPAD_SPI is not set
# CONFIG_JOYSTICK_PXRC is not set
# CONFIG_JOYSTICK_QWIIC is not set
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=m
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM80X_ONKEY is not set
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
# CONFIG_INPUT_AD714X_SPI is not set
CONFIG_INPUT_ATC260X_ONKEY=m
CONFIG_INPUT_BMA150=m
# CONFIG_INPUT_E3X0_BUTTON is not set
CONFIG_INPUT_PCSPKR=y
CONFIG_INPUT_MC13783_PWRBUTTON=m
CONFIG_INPUT_MMA8450=m
CONFIG_INPUT_APANEL=m
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_RETU_PWRBUTTON=m
CONFIG_INPUT_AXP20X_PEK=m
CONFIG_INPUT_UINPUT=m
CONFIG_INPUT_PCF50633_PMU=m
CONFIG_INPUT_PCF8574=m
CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
CONFIG_INPUT_DA7280_HAPTICS=m
# CONFIG_INPUT_DA9052_ONKEY is not set
CONFIG_INPUT_DA9063_ONKEY=m
CONFIG_INPUT_WM831X_ON=m
CONFIG_INPUT_ADXL34X=m
CONFIG_INPUT_ADXL34X_I2C=m
CONFIG_INPUT_ADXL34X_SPI=m
CONFIG_INPUT_IBM_PANEL=m
CONFIG_INPUT_IQS269A=m
# CONFIG_INPUT_IQS626A is not set
CONFIG_INPUT_IQS7222=m
CONFIG_INPUT_CMA3000=m
# CONFIG_INPUT_CMA3000_I2C is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
CONFIG_INPUT_DRV260X_HAPTICS=m
CONFIG_INPUT_DRV2665_HAPTICS=m
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
# CONFIG_RMI4_SPI is not set
# CONFIG_RMI4_SMB is not set
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F30 is not set
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_CT82C710=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_GPIO_PS2=m
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
# CONFIG_GAMEPORT_L4 is not set
CONFIG_GAMEPORT_EMU10K1=y
# CONFIG_GAMEPORT_FM801 is not set
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
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
# CONFIG_SERIAL_8250_EXAR is not set
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_PCI1XXXX=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=m
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
# CONFIG_SERIAL_8250_MID is not set
# CONFIG_SERIAL_8250_PERICOM is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
CONFIG_SERIAL_MAX310X=y
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=m
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_SC16IS7XX_SPI=y
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_SPRD=m
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
CONFIG_MOXA_SMARTIO=y
# CONFIG_SYNCLINK_GT is not set
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=m
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
# CONFIG_SSIF_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=m
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=m
CONFIG_HW_RANDOM_VIA=m
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_XIPHERA=m
CONFIG_APPLICOM=m

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
# CONFIG_SCR24X is not set
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

CONFIG_MWAVE=y
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=m
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
# CONFIG_TCG_TIS is not set
CONFIG_TCG_TIS_SPI=y
# CONFIG_TCG_TIS_SPI_CR50 is not set
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
# CONFIG_TCG_NSC is not set
CONFIG_TCG_ATMEL=y
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TCG_TIS_ST33ZP24_SPI=y
# CONFIG_TELCLOCK is not set
# CONFIG_XILLYBUS is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=m
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=m
CONFIG_I2C_ALI1535=m
CONFIG_I2C_ALI1563=m
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=m
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_PCI=m
CONFIG_I2C_EMEV2=m
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_OCORES=m
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_PCI1XXXX=m
CONFIG_I2C_TAOS_EVM=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
# CONFIG_CDNS_I3C_MASTER is not set
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=m
# CONFIG_MIPI_I3C_HCI is not set
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
CONFIG_SPI_AXI_SPI_ENGINE=y
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_BUTTERFLY is not set
CONFIG_SPI_CADENCE=m
CONFIG_SPI_DESIGNWARE=m
# CONFIG_SPI_DW_DMA is not set
# CONFIG_SPI_DW_PCI is not set
CONFIG_SPI_DW_MMIO=m
# CONFIG_SPI_NXP_FLEXSPI is not set
CONFIG_SPI_GPIO=y
CONFIG_SPI_INTEL=m
CONFIG_SPI_INTEL_PCI=m
CONFIG_SPI_INTEL_PLATFORM=m
CONFIG_SPI_LM70_LLP=m
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
CONFIG_SPI_LANTIQ_SSC=m
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_PCI1XXXX=m
CONFIG_SPI_PXA2XX=m
CONFIG_SPI_PXA2XX_PCI=m
CONFIG_SPI_ROCKCHIP=m
CONFIG_SPI_SC18IS602=m
CONFIG_SPI_SIFIVE=m
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=m
CONFIG_SPI_ZYNQMP_GQSPI=m
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=m
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=m
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=m
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=m
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=m

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
# CONFIG_PTP_1588_CLOCK_OCP is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
CONFIG_PINCTRL_DA9062=m
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08_SPI=y
CONFIG_PINCTRL_MCP23S08=y

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
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_MAX730X=m
CONFIG_GPIO_IDIO_16=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=m
# CONFIG_GPIO_GENERIC_PLATFORM is not set
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
# CONFIG_GPIO_SCH311X is not set
CONFIG_GPIO_WINBOND=y
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=m
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_JANZ_TTL=m
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_WM831X is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
CONFIG_GPIO_PCI_IDIO_16=m
CONFIG_GPIO_PCIE_IDIO_24=m
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=y
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=y
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=y
# end of SPI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_LATCH=y
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=m
CONFIG_POWER_RESET_MT6323=y
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_RESET_TPS65086=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=m
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
CONFIG_BATTERY_CW2015=m
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
CONFIG_MANAGER_SBS=m
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9052=m
CONFIG_CHARGER_DA9150=m
CONFIG_BATTERY_DA9150=m
# CONFIG_CHARGER_AXP20X is not set
CONFIG_BATTERY_AXP20X=m
CONFIG_AXP20X_POWER=m
# CONFIG_AXP288_FUEL_GAUGE is not set
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
CONFIG_CHARGER_PCF50633=m
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX14577 is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MT6370 is not set
CONFIG_CHARGER_BQ2415X=m
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=m
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=m
CONFIG_CHARGER_BQ256XX=m
CONFIG_CHARGER_SMB347=m
CONFIG_BATTERY_GAUGE_LTC2941=m
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_RT9467=m
CONFIG_CHARGER_RT9471=m
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=m
CONFIG_SENSORS_AD7314=m
CONFIG_SENSORS_AD7414=m
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7310=m
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_AXI_FAN_CONTROL=m
# CONFIG_SENSORS_K8TEMP is not set
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_CORSAIR_CPRO=m
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_DA9052_ADC=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=m
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
# CONFIG_SENSORS_GL518SM is not set
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IIO_HWMON=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2947_SPI=m
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=m
CONFIG_SENSORS_LTC4151=m
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX1111=m
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX31730=m
CONFIG_SENSORS_MAX31760=m
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MC34VR500 is not set
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_MLXREG_FAN=m
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
CONFIG_SENSORS_MR75203=m
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
# CONFIG_PMBUS is not set
CONFIG_SENSORS_SBTSI=m
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_SY7636A=m
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=m
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=m
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=m
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=m
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83773G=m
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_WM831X=m

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
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=m
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
# CONFIG_DA9063_WATCHDOG is not set
# CONFIG_DA9062_WATCHDOG is not set
# CONFIG_MENF21BMC_WATCHDOG is not set
# CONFIG_WDAT_WDT is not set
CONFIG_WM831X_WATCHDOG=y
# CONFIG_XILINX_WATCHDOG is not set
CONFIG_ZIIRAVE_WATCHDOG=m
# CONFIG_MLX_WDT is not set
CONFIG_CADENCE_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_RETU_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
CONFIG_ADVANTECH_WDT=m
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=y
# CONFIG_EBC_C384_WDT is not set
CONFIG_EXAR_WDT=m
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=y
CONFIG_IBMASR=m
CONFIG_WAFER_WDT=m
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=m
# CONFIG_ITCO_VENDOR_SUPPORT is not set
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=y
CONFIG_HP_WATCHDOG=m
# CONFIG_HPWDT_NMI_DECODING is not set
# CONFIG_KEMPLD_WDT is not set
CONFIG_SC1200_WDT=m
CONFIG_PC87413_WDT=m
CONFIG_NV_TCO=y
# CONFIG_60XX_WDT is not set
CONFIG_CPU5_WDT=m
CONFIG_SMSC_SCH311X_WDT=m
CONFIG_SMSC37B787_WDT=m
CONFIG_TQMX86_WDT=y
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=y
CONFIG_W83877F_WDT=y
CONFIG_W83977F_WDT=m
# CONFIG_MACHZ_WDT is not set
CONFIG_SBC_EPX_C3_WATCHDOG=m
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
CONFIG_MEN_A21_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_PCI is not set
# CONFIG_BCMA_SFLASH is not set
CONFIG_BCMA_DRIVER_GMAC_CMN=y
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_SMPRO is not set
CONFIG_MFD_BCM590XX=m
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=m
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_SPI=m
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=m
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
CONFIG_MFD_INTEL_LPSS=m
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=m
CONFIG_MFD_IQS62X=m
CONFIG_MFD_JANZ_CMODIO=m
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=m
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX8907=m
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6370=m
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=m
CONFIG_MFD_OCELOT=m
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_RETU=m
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
CONFIG_MFD_SY7636A=m
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=m
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=m
# CONFIG_MFD_TI_LMU is not set
CONFIG_TPS6105X=m
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
CONFIG_MFD_TI_LP873X=m
CONFIG_MFD_TPS65912=m
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=m
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_ARIZONA_SPI=y
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_SPI=y
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_88PM800 is not set
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=m
# CONFIG_REGULATOR_ATC260X is not set
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BCM590XX is not set
# CONFIG_REGULATOR_BD9571MWV is not set
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9062=m
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
# CONFIG_REGULATOR_LP8755 is not set
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=m
# CONFIG_REGULATOR_MAX14577 is not set
CONFIG_REGULATOR_MAX1586=m
CONFIG_REGULATOR_MAX8649=m
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX20086=m
CONFIG_REGULATOR_MAX20411=m
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MP8859=m
CONFIG_REGULATOR_MT6311=m
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_MT6323=m
CONFIG_REGULATOR_MT6331=m
CONFIG_REGULATOR_MT6332=y
CONFIG_REGULATOR_MT6357=m
# CONFIG_REGULATOR_MT6358 is not set
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6370=m
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PCA9450=m
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RT4801=m
CONFIG_REGULATOR_RT5190A=m
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=m
CONFIG_REGULATOR_RT6190=m
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=m
CONFIG_REGULATOR_RTMV20=m
CONFIG_REGULATOR_RTQ6752=m
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_SY7636A=m
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS6105X=m
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=m
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=m
CONFIG_REGULATOR_TPS65132=m
CONFIG_REGULATOR_TPS6524X=y
CONFIG_REGULATOR_TPS65912=m
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_QCOM_LABIBB=m
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
# CONFIG_RC_MAP is not set
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_NUVOTON is not set
CONFIG_IR_SERIAL=y
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_WINBOND_CIR is not set
CONFIG_RC_LOOPBACK=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_V4L2_FLASH_LED_CLASS=m
CONFIG_V4L2_FWNODE=m
CONFIG_V4L2_ASYNC=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
CONFIG_VIDEO_TW5864=m
CONFIG_VIDEO_TW68=m
CONFIG_VIDEO_ZORAN=m
# CONFIG_VIDEO_ZORAN_DC30 is not set
CONFIG_VIDEO_ZORAN_ZR36060=y
CONFIG_VIDEO_ZORAN_BUZ=y
# CONFIG_VIDEO_ZORAN_DC10 is not set
CONFIG_VIDEO_ZORAN_LML33=y
CONFIG_VIDEO_ZORAN_LML33R10=y
# CONFIG_VIDEO_ZORAN_AVS6EYES is not set

#
# Media capture/analog TV support
#
CONFIG_VIDEO_DT3155=m
CONFIG_VIDEO_IVTV=m
CONFIG_VIDEO_HEXIUM_GEMINI=m
# CONFIG_VIDEO_HEXIUM_ORION is not set
CONFIG_VIDEO_MXB=m

#
# Media capture/analog/hybrid TV support
#
# CONFIG_VIDEO_BT848 is not set
# CONFIG_VIDEO_CX18 is not set
CONFIG_VIDEO_CX25821=m
CONFIG_VIDEO_CX88=m
# CONFIG_VIDEO_CX88_BLACKBIRD is not set
# CONFIG_VIDEO_CX88_DVB is not set
CONFIG_VIDEO_SAA7134=m
# CONFIG_VIDEO_SAA7134_RC is not set
CONFIG_VIDEO_SAA7134_DVB=m
CONFIG_VIDEO_SAA7164=m

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_B2C2_FLEXCOP_PCI=m
# CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
CONFIG_DVB_DDBRIDGE=m
CONFIG_DVB_DDBRIDGE_MSIENABLE=y
CONFIG_DVB_DM1105=m
CONFIG_MANTIS_CORE=m
CONFIG_DVB_MANTIS=m
# CONFIG_DVB_HOPPER is not set
# CONFIG_DVB_NETUP_UNIDVB is not set
CONFIG_DVB_NGENE=m
# CONFIG_DVB_PLUTO2 is not set
# CONFIG_DVB_PT1 is not set
CONFIG_DVB_PT3=m
CONFIG_DVB_SMIPCIE=m
CONFIG_DVB_BUDGET_CORE=m
# CONFIG_DVB_BUDGET is not set
# CONFIG_DVB_BUDGET_CI is not set
# CONFIG_DVB_BUDGET_AV is not set
# CONFIG_VIDEO_IPU3_CIO2 is not set
# CONFIG_RADIO_ADAPTERS is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
# CONFIG_SDR_PLATFORM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set

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
CONFIG_VIDEO_CADENCE_CSI2TX=m

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#
CONFIG_VIDEO_CAFE_CCIC=m

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

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
CONFIG_TTPCI_EEPROM=m
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_DVB_B2C2_FLEXCOP=m
CONFIG_VIDEO_SAA7146=m
CONFIG_VIDEO_SAA7146_VV=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
CONFIG_VIDEOBUF2_DVB=m
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=m

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
CONFIG_VIDEO_CCS_PLL=m
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=m
CONFIG_VIDEO_HI846=m
CONFIG_VIDEO_HI847=m
CONFIG_VIDEO_IMX208=m
# CONFIG_VIDEO_IMX214 is not set
CONFIG_VIDEO_IMX219=m
CONFIG_VIDEO_IMX258=m
CONFIG_VIDEO_IMX274=m
CONFIG_VIDEO_IMX290=m
# CONFIG_VIDEO_IMX296 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX355 is not set
CONFIG_VIDEO_MAX9271_LIB=m
# CONFIG_VIDEO_MT9M001 is not set
# CONFIG_VIDEO_MT9M032 is not set
CONFIG_VIDEO_MT9M111=m
CONFIG_VIDEO_MT9P031=m
CONFIG_VIDEO_MT9T001=m
# CONFIG_VIDEO_MT9T112 is not set
CONFIG_VIDEO_MT9V011=m
CONFIG_VIDEO_MT9V032=m
CONFIG_VIDEO_MT9V111=m
CONFIG_VIDEO_NOON010PC30=m
CONFIG_VIDEO_OG01A1B=m
# CONFIG_VIDEO_OV02A10 is not set
CONFIG_VIDEO_OV08D10=m
CONFIG_VIDEO_OV08X40=m
CONFIG_VIDEO_OV13858=m
CONFIG_VIDEO_OV13B10=m
CONFIG_VIDEO_OV2640=m
CONFIG_VIDEO_OV2659=m
# CONFIG_VIDEO_OV2680 is not set
CONFIG_VIDEO_OV2685=m
# CONFIG_VIDEO_OV2740 is not set
CONFIG_VIDEO_OV4689=m
CONFIG_VIDEO_OV5647=m
CONFIG_VIDEO_OV5648=m
# CONFIG_VIDEO_OV5670 is not set
# CONFIG_VIDEO_OV5675 is not set
CONFIG_VIDEO_OV5693=m
# CONFIG_VIDEO_OV5695 is not set
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=m
CONFIG_VIDEO_OV772X=m
CONFIG_VIDEO_OV7740=m
CONFIG_VIDEO_OV8856=m
CONFIG_VIDEO_OV8858=m
# CONFIG_VIDEO_OV8865 is not set
CONFIG_VIDEO_OV9640=m
CONFIG_VIDEO_OV9650=m
# CONFIG_VIDEO_OV9734 is not set
CONFIG_VIDEO_RDACM20=m
# CONFIG_VIDEO_RDACM21 is not set
CONFIG_VIDEO_RJ54N1=m
CONFIG_VIDEO_S5C73M3=m
CONFIG_VIDEO_S5K5BAF=m
CONFIG_VIDEO_S5K6A3=m
CONFIG_VIDEO_S5K6AA=m
CONFIG_VIDEO_SR030PC30=m
CONFIG_VIDEO_VS6624=m
CONFIG_VIDEO_CCS=m
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
# CONFIG_VIDEO_AK7375 is not set
CONFIG_VIDEO_DW9714=m
CONFIG_VIDEO_DW9768=m
CONFIG_VIDEO_DW9807_VCM=m
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
# CONFIG_VIDEO_LM3560 is not set
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_TDA9840=m
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_VP27SMPX=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=m
CONFIG_VIDEO_SAA6588=m
CONFIG_VIDEO_BT819=m
CONFIG_VIDEO_BT856=m
CONFIG_VIDEO_SAA711X=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m
CONFIG_VIDEO_ADV7170=m
CONFIG_VIDEO_SAA7127=m
CONFIG_VIDEO_SAA7185=m
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m
CONFIG_VIDEO_SAA6752HS=m
CONFIG_VIDEO_M52790=m

#
# SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=m
# CONFIG_VIDEO_GS1662 is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Tuner drivers auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m

#
# DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_M88DS3103=m
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_MT312=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_MT352=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_ZL10353=m

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_NXT200X=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_LNBH25=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_TDA665x=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_AGP=m
# CONFIG_AGP_AMD64 is not set
CONFIG_AGP_INTEL=m
CONFIG_AGP_SIS=m
CONFIG_AGP_VIA=m
CONFIG_INTEL_GTT=m
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_KTD253=m
CONFIG_BACKLIGHT_KTZ8866=m
CONFIG_BACKLIGHT_DA9052=m
# CONFIG_BACKLIGHT_MT6370 is not set
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_PCF50633=m
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_SKY81452=m
CONFIG_BACKLIGHT_GPIO=m
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=m
# end of Backlight & LCD device support

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_AUREAL=m
# CONFIG_HID_BELKIN is not set
CONFIG_HID_CHERRY=m
CONFIG_HID_COUGAR=y
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CYPRESS is not set
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELECOM=y
# CONFIG_HID_EVISION is not set
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
CONFIG_HID_KEYTOUCH=m
# CONFIG_HID_KYE is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_VRC2=y
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=m
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=m
# CONFIG_HID_LENOVO is not set
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MALTRON=m
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NINTENDO=m
CONFIG_NINTENDO_FF=y
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=y
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=m
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_PXRC=y
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=y
CONFIG_HID_SAITEK=y
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=m
# CONFIG_STEAM_FF is not set
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=y
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=m
CONFIG_HID_TOPRE=y
CONFIG_HID_THINGM=m
CONFIG_HID_UDRAW_PS3=m
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
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
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_ALCOR is not set
CONFIG_MMC_TIFM_SD=m
CONFIG_MMC_SPI=m
CONFIG_MMC_SDRICOH_CS=m
CONFIG_MMC_CB710=m
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_USDHI6ROL0=m
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
CONFIG_MMC_TOSHIBA_PCI=m
CONFIG_MMC_MTK=m
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFS_BSG=y
# CONFIG_SCSI_UFS_HPB is not set
CONFIG_SCSI_UFS_FAULT_INJECTION=y
# CONFIG_SCSI_UFS_HWMON is not set
# CONFIG_SCSI_UFSHCD_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=m
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_APU=m
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_MT6323=m
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
CONFIG_LEDS_LP3952=m
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_WM831X_STATUS=m
CONFIG_LEDS_DA9052=m
CONFIG_LEDS_DAC124S085=m
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_MC13783=m
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set
CONFIG_LEDS_TPS6105X=m

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_LM3601X=m
CONFIG_LEDS_RT8515=m
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=y
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=m
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_ALTERA_MSGDMA=y
# CONFIG_INTEL_IDMA64 is not set
CONFIG_INTEL_IDXD_BUS=y
CONFIG_INTEL_IDXD_COMPAT=y
CONFIG_INTEL_IOATDMA=y
CONFIG_PLX_DMA=m
CONFIG_XILINX_XDMA=y
# CONFIG_AMD_PTDMA is not set
CONFIG_QCOM_HIDMA_MGMT=y
CONFIG_QCOM_HIDMA=m
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
CONFIG_DW_DMAC_PCI=m
# CONFIG_DW_EDMA is not set
CONFIG_SF_PDMA=m
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

CONFIG_DCA=y
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=m
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=m
CONFIG_HD44780=m
CONFIG_IMG_ASCII_LCD=m
CONFIG_LCD2S=m
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
CONFIG_UIO=y
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=y
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=y
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=m
CONFIG_UIO_PRUSS=y
CONFIG_UIO_MF624=y
CONFIG_VFIO=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
CONFIG_VBOXGUEST=m
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
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
# CONFIG_RTLLIB is not set
CONFIG_RTS5208=m

#
# IIO staging drivers
#

#
# Accelerometers
#
# CONFIG_ADIS16203 is not set
CONFIG_ADIS16240=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7816=y
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=m
CONFIG_ADT7316_SPI=m
CONFIG_ADT7316_I2C=m
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
CONFIG_AD9832=m
CONFIG_AD9834=m
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
CONFIG_AD2S1210=y
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_STAGING_MEDIA=y
# CONFIG_DVB_AV7110 is not set
# CONFIG_VIDEO_IPU3_IMGU is not set
CONFIG_STAGING_MEDIA_DEPRECATED=y

#
# Atmel media platform drivers
#
CONFIG_MOST_COMPONENTS=y
# CONFIG_MOST_NET is not set
CONFIG_MOST_VIDEO=m
CONFIG_MOST_I2C=m
# CONFIG_KS7010 is not set
CONFIG_GREYBUS_BOOTROM=m
CONFIG_GREYBUS_FIRMWARE=m
# CONFIG_GREYBUS_HID is not set
CONFIG_GREYBUS_LIGHT=m
# CONFIG_GREYBUS_LOG is not set
CONFIG_GREYBUS_LOOPBACK=m
CONFIG_GREYBUS_POWER=m
CONFIG_GREYBUS_RAW=m
# CONFIG_GREYBUS_VIBRATOR is not set
# CONFIG_GREYBUS_BRIDGED_PHY is not set
# CONFIG_PI433 is not set
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
# CONFIG_GOLDFISH_PIPE is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
CONFIG_MLXREG_IO=m
CONFIG_MLXREG_LC=m
# CONFIG_NVSW_SN2201 is not set
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y
CONFIG_LMK04832=y
CONFIG_COMMON_CLK_MAX9485=m
CONFIG_COMMON_CLK_SI5341=m
CONFIG_COMMON_CLK_SI5351=m
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_CDCE706=m
# CONFIG_COMMON_CLK_CS2000_CP is not set
CONFIG_XILINX_VCU=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
# CONFIG_INTEL_IOMMU is not set
# CONFIG_IOMMUFD is not set
# CONFIG_IRQ_REMAP is not set
CONFIG_VIRTIO_IOMMU=m

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
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=m
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=m
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

CONFIG_WPCM450_SOC=m

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

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_FSA9480=m
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_INTEL_INT3496 is not set
# CONFIG_EXTCON_MAX14577 is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_RT8973A=m
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=m
CONFIG_IIO_BUFFER_DMAENGINE=m
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
CONFIG_ADIS16209=m
CONFIG_ADXL313=m
CONFIG_ADXL313_I2C=m
CONFIG_ADXL313_SPI=m
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
CONFIG_ADXL355_SPI=m
CONFIG_ADXL367=y
CONFIG_ADXL367_SPI=y
CONFIG_ADXL367_I2C=m
# CONFIG_ADXL372_SPI is not set
# CONFIG_ADXL372_I2C is not set
CONFIG_BMA220=y
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_BMC150_ACCEL_SPI=m
CONFIG_BMI088_ACCEL=y
CONFIG_BMI088_ACCEL_SPI=y
CONFIG_DA280=m
CONFIG_DA311=m
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=m
CONFIG_DMARD10=m
# CONFIG_FXLS8962AF_I2C is not set
# CONFIG_FXLS8962AF_SPI is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=m
CONFIG_IIO_KX022A=y
CONFIG_IIO_KX022A_SPI=y
CONFIG_IIO_KX022A_I2C=m
CONFIG_KXSD9=y
# CONFIG_KXSD9_SPI is not set
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=m
CONFIG_MC3230=m
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7455_SPI=m
CONFIG_MMA7660=m
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
CONFIG_MSA311=m
CONFIG_MXC4005=m
CONFIG_MXC6255=m
# CONFIG_SCA3000 is not set
# CONFIG_SCA3300 is not set
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
CONFIG_AD4130=y
CONFIG_AD7091R5=m
CONFIG_AD7124=m
# CONFIG_AD7192 is not set
CONFIG_AD7266=m
CONFIG_AD7280=m
# CONFIG_AD7291 is not set
CONFIG_AD7292=m
# CONFIG_AD7298 is not set
CONFIG_AD7476=m
CONFIG_AD7606=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=y
CONFIG_AD7766=y
# CONFIG_AD7768_1 is not set
# CONFIG_AD7780 is not set
CONFIG_AD7791=y
# CONFIG_AD7793 is not set
CONFIG_AD7887=y
CONFIG_AD7923=m
# CONFIG_AD7949 is not set
# CONFIG_AD799X is not set
CONFIG_AXP20X_ADC=m
CONFIG_AXP288_ADC=m
CONFIG_CC10001_ADC=y
CONFIG_DA9150_GPADC=m
# CONFIG_ENVELOPE_DETECTOR is not set
CONFIG_HI8435=y
CONFIG_HX711=m
CONFIG_INA2XX_ADC=m
CONFIG_LTC2471=m
# CONFIG_LTC2485 is not set
CONFIG_LTC2496=y
CONFIG_LTC2497=m
CONFIG_MAX1027=y
# CONFIG_MAX11100 is not set
# CONFIG_MAX1118 is not set
CONFIG_MAX11205=m
CONFIG_MAX11410=m
CONFIG_MAX1241=m
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
CONFIG_MCP3422=m
CONFIG_MCP3911=m
CONFIG_MEDIATEK_MT6370_ADC=m
# CONFIG_MP2629_ADC is not set
CONFIG_NAU7802=m
CONFIG_QCOM_VADC_COMMON=y
# CONFIG_QCOM_SPMI_IADC is not set
# CONFIG_QCOM_SPMI_VADC is not set
CONFIG_QCOM_SPMI_ADC5=y
CONFIG_RICHTEK_RTQ6056=m
CONFIG_SD_ADC_MODULATOR=m
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
CONFIG_TI_ADC084S021=y
# CONFIG_TI_ADC12138 is not set
CONFIG_TI_ADC108S102=y
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=y
# CONFIG_TI_ADS1015 is not set
CONFIG_TI_ADS7924=m
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_ADS8344 is not set
CONFIG_TI_ADS8688=m
CONFIG_TI_ADS124S08=y
CONFIG_TI_ADS131E08=m
# CONFIG_TI_AM335X_ADC is not set
CONFIG_TI_LMP92064=m
CONFIG_TI_TLC4541=y
CONFIG_TI_TSC2046=y
CONFIG_VF610_ADC=y
CONFIG_XILINX_XADC=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74115=y
# CONFIG_AD74413R is not set
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=m
CONFIG_ADA4250=y
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
CONFIG_AD7746=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
CONFIG_ATLAS_EZO_SENSOR=m
# CONFIG_BME680 is not set
CONFIG_CCS811=m
CONFIG_IAQCORE=m
CONFIG_SCD30_CORE=y
# CONFIG_SCD30_I2C is not set
# CONFIG_SCD4X is not set
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=m
# CONFIG_SPS30_I2C is not set
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=m
CONFIG_IIO_SSP_SENSORHUB=y
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R=y
CONFIG_AD5064=m
# CONFIG_AD5360 is not set
# CONFIG_AD5380 is not set
# CONFIG_AD5421 is not set
CONFIG_AD5446=m
CONFIG_AD5449=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
CONFIG_AD5593R=m
CONFIG_AD5504=m
CONFIG_AD5624R_SPI=y
CONFIG_LTC2688=y
CONFIG_AD5686=m
# CONFIG_AD5686_SPI is not set
CONFIG_AD5696_I2C=m
# CONFIG_AD5755 is not set
# CONFIG_AD5758 is not set
# CONFIG_AD5761 is not set
CONFIG_AD5764=m
CONFIG_AD5766=y
CONFIG_AD5770R=y
# CONFIG_AD5791 is not set
CONFIG_AD7293=m
CONFIG_AD7303=y
# CONFIG_AD8801 is not set
CONFIG_DPOT_DAC=y
CONFIG_DS4424=m
# CONFIG_LTC1660 is not set
CONFIG_LTC2632=m
CONFIG_M62332=m
CONFIG_MAX517=m
# CONFIG_MAX5522 is not set
CONFIG_MAX5821=m
CONFIG_MCP4725=m
CONFIG_MCP4922=y
# CONFIG_TI_DAC082S085 is not set
CONFIG_TI_DAC5571=m
# CONFIG_TI_DAC7311 is not set
# CONFIG_TI_DAC7612 is not set
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
CONFIG_ADMV8818=m
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=m
CONFIG_ADF4371=y
CONFIG_ADF4377=m
CONFIG_ADMV1013=y
CONFIG_ADMV1014=y
CONFIG_ADMV4420=y
CONFIG_ADRF6780=y
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
CONFIG_ADIS16136=y
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS290 is not set
CONFIG_ADXRS450=y
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=m
CONFIG_FXAS21002C_SPI=y
CONFIG_HID_SENSOR_GYRO_3D=m
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
CONFIG_IIO_ST_GYRO_3AXIS=m
# CONFIG_IIO_ST_GYRO_I2C_3AXIS is not set
CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
# CONFIG_AFE4404 is not set
CONFIG_MAX30100=m
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
CONFIG_HDC100X=m
CONFIG_HDC2010=m
# CONFIG_HID_SENSOR_HUMIDITY is not set
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
CONFIG_ADIS16460=y
# CONFIG_ADIS16475 is not set
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=m
# CONFIG_BMI160_I2C is not set
CONFIG_BMI160_SPI=m
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
CONFIG_FXOS8700_SPI=m
CONFIG_KMX61=m
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
CONFIG_INV_ICM42600_SPI=m
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_INV_MPU6050_SPI is not set
# CONFIG_IIO_ST_LSM6DSX is not set
# CONFIG_IIO_ST_LSM9DS0 is not set
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
# CONFIG_ADUX1020 is not set
CONFIG_AL3010=m
# CONFIG_AL3320A is not set
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
CONFIG_AS73211=m
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
CONFIG_CM3232=m
# CONFIG_CM3323 is not set
CONFIG_CM3605=m
# CONFIG_CM36651 is not set
CONFIG_GP2AP002=m
# CONFIG_GP2AP020A00F is not set
CONFIG_IQS621_ALS=m
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=m
CONFIG_ISL29125=m
CONFIG_HID_SENSOR_ALS=m
CONFIG_HID_SENSOR_PROX=m
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=m
CONFIG_LTR501=m
CONFIG_LTRF216A=m
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=m
# CONFIG_MAX44009 is not set
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=m
# CONFIG_PA12203001 is not set
CONFIG_SI1133=m
CONFIG_SI1145=m
CONFIG_STK3310=m
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=m
CONFIG_ST_UVIS25_SPI=y
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
# CONFIG_SENSORS_TSL2563 is not set
# CONFIG_TSL2583 is not set
CONFIG_TSL2591=m
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=m
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
# CONFIG_BMC150_MAGN_SPI is not set
# CONFIG_MAG3110 is not set
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_HMC5843_SPI=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_SENSORS_RM3100_SPI=m
# CONFIG_TI_TMAG5273 is not set
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
# CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
# CONFIG_HID_SENSOR_DEVICE_ROTATION is not set
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
# CONFIG_IQS624_POS is not set
# CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
CONFIG_AD5272=m
CONFIG_DS1803=m
CONFIG_MAX5432=m
# CONFIG_MAX5481 is not set
# CONFIG_MAX5487 is not set
CONFIG_MCP4018=m
CONFIG_MCP4131=m
CONFIG_MCP4531=m
CONFIG_MCP41010=y
CONFIG_TPL0102=m
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_BMP280=y
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=y
CONFIG_DLHL60D=m
# CONFIG_DPS310 is not set
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_HP03=m
# CONFIG_ICP10100 is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=m
CONFIG_MPL115_SPI=y
CONFIG_MPL3115=m
# CONFIG_MS5611 is not set
CONFIG_MS5637=m
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=m
CONFIG_HP206C=m
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=m
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=m
CONFIG_PING=y
CONFIG_RFD77402=m
CONFIG_SRF04=m
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
CONFIG_SX9324=m
CONFIG_SX9360=m
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
CONFIG_VCNL3020=m
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=y
# CONFIG_AD2S1200 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
CONFIG_LTC2983=m
# CONFIG_MAXIM_THERMOCOUPLE is not set
# CONFIG_HID_SENSOR_TEMP is not set
CONFIG_MLX90614=m
CONFIG_MLX90632=m
CONFIG_TMP006=m
CONFIG_TMP007=m
# CONFIG_TMP117 is not set
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=m
CONFIG_MAX30208=m
# CONFIG_MAX31856 is not set
CONFIG_MAX31865=y
# end of Temperature sensors

CONFIG_NTB=y
CONFIG_NTB_MSI=y
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
CONFIG_NTB_INTEL=y
CONFIG_NTB_EPF=m
CONFIG_NTB_SWITCHTEC=m
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=y
# CONFIG_NTB_MSI_TEST is not set
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=y
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_USB4=m
CONFIG_USB4_DEBUGFS_WRITE=y
CONFIG_USB4_DEBUGFS_MARGINING=y
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_SPMI_SDAM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_ADGS1408=y
# CONFIG_MUX_GPIO is not set
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=y
# CONFIG_INTEL_QEP is not set
CONFIG_INTERRUPT_CNT=y
CONFIG_MOST=y
# CONFIG_MOST_CDEV is not set
CONFIG_PECI=y
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
# CONFIG_REISERFS_FS_SECURITY is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=m
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
CONFIG_BTRFS_FS_REF_VERIFY=y
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
CONFIG_F2FS_FAULT_INJECTION=y
CONFIG_F2FS_FS_COMPRESSION=y
CONFIG_F2FS_FS_LZO=y
# CONFIG_F2FS_FS_LZORLE is not set
CONFIG_F2FS_FS_LZ4=y
# CONFIG_F2FS_FS_LZ4HC is not set
# CONFIG_F2FS_FS_ZSTD is not set
# CONFIG_F2FS_IOSTAT is not set
CONFIG_F2FS_UNFAIR_RWSEM=y
CONFIG_ZONEFS_FS=m
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=y
CONFIG_ADFS_FS_RW=y
# CONFIG_AFFS_FS is not set
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_HFS_FS=m
CONFIG_HFSPLUS_FS=y
CONFIG_BEFS_FS=y
# CONFIG_BEFS_DEBUG is not set
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=y
# CONFIG_JFFS2_FS is not set
CONFIG_UBIFS_FS=m
# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_FS_ZSTD=y
# CONFIG_UBIFS_ATIME_SUPPORT is not set
# CONFIG_UBIFS_FS_XATTR is not set
CONFIG_UBIFS_FS_AUTHENTICATION=y
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_CRAMFS_MTD=y
CONFIG_SQUASHFS=y
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
# CONFIG_SQUASHFS_ZLIB is not set
CONFIG_SQUASHFS_LZ4=y
CONFIG_SQUASHFS_LZO=y
# CONFIG_SQUASHFS_XZ is not set
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=m
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=y
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=m
CONFIG_QNX6FS_FS=y
CONFIG_QNX6FS_DEBUG=y
CONFIG_ROMFS_FS=m
# CONFIG_ROMFS_BACKED_BY_BLOCK is not set
# CONFIG_ROMFS_BACKED_BY_MTD is not set
CONFIG_ROMFS_BACKED_BY_BOTH=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_ROMFS_ON_MTD=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_LZ4HC_COMPRESS=m
CONFIG_PSTORE_842_COMPRESS=y
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4hc"
# CONFIG_PSTORE_CONSOLE is not set
CONFIG_PSTORE_PMSG=y
CONFIG_PSTORE_RAM=y
CONFIG_PSTORE_ZONE=y
CONFIG_PSTORE_BLK=y
CONFIG_PSTORE_BLK_BLKDEV=""
CONFIG_PSTORE_BLK_KMSG_SIZE=64
CONFIG_PSTORE_BLK_MAX_REASON=2
CONFIG_PSTORE_BLK_PMSG_SIZE=64
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
CONFIG_EROFS_FS=y
CONFIG_EROFS_FS_DEBUG=y
CONFIG_EROFS_FS_XATTR=y
# CONFIG_EROFS_FS_POSIX_ACL is not set
# CONFIG_EROFS_FS_SECURITY is not set
CONFIG_EROFS_FS_ZIP=y
CONFIG_EROFS_FS_ZIP_LZMA=y
# CONFIG_EROFS_FS_PCPU_KTHREAD is not set
CONFIG_VBOXSF_FS=m
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
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=m
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=m
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=m
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=m
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_KEY_NOTIFICATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_YAMA=y
CONFIG_SECURITY_SAFESETID=y
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
# CONFIG_EVM_ATTR_FSUUID is not set
# CONFIG_EVM_ADD_XATTRS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

# CONFIG_RANDSTRUCT_NONE is not set
# CONFIG_RANDSTRUCT_FULL is not set
CONFIG_RANDSTRUCT_PERFORMANCE=y
CONFIG_RANDSTRUCT=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
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
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=y
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=m
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=m
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=m
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
# CONFIG_CRYPTO_WP512 is not set
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=m
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
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
# CONFIG_CRYPTO_CURVE25519_X86 is not set
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_BLOWFISH_X86_64=y
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES3_EDE_X86_64=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
CONFIG_CRYPTO_NHPOLY1305_SSE2=y
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=m
# CONFIG_CRYPTO_SHA256_SSSE3 is not set
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
CONFIG_CRYPTO_SM3_AVX_X86_64=m
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PADLOCK is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=m
# CONFIG_CRYPTO_DEV_CCP is not set
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
CONFIG_CRYPTO_DEV_QAT_C3XXX=y
CONFIG_CRYPTO_DEV_QAT_C62X=y
CONFIG_CRYPTO_DEV_QAT_4XXX=y
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=m
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
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
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_CMA is not set
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

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
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
CONFIG_READABLE_ASM=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_OBJTOOL=y
# CONFIG_STACK_VALIDATION is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
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
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_TABLE_CHECK=y
# CONFIG_PAGE_TABLE_CHECK_ENFORCED is not set
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
CONFIG_PTDUMP_DEBUGFS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
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

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
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
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_LATENCYTOP=y
CONFIG_DEBUG_CGROUP_REF=y
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
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
CONFIG_TRACEPOINT_BENCHMARK=y
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
CONFIG_PUNIT_ATOM_DEBUG=m
# CONFIG_UNWINDER_ORC is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
# CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_MAKE_REQUEST is not set
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--ukAIFu4geGdc+3A1
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
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='peterz-queue/sched/eevdf2'
	export commit='fa34ab8cb95611bb73d6dac030ce42a843a0a231'
	export kconfig='x86_64-randconfig-a005-20230313'
	export nr_vm=300
	export submit_id='640ecc1a16cf3a35f4556110'
	export job_file='/lkp/jobs/scheduled/vm-meta-268/boot-1-debian-11.1-x86_64-20220510.cgz-fa34ab8cb95611bb73d6dac030ce42a843a0a231-20230313-13812-ssmg9e-0.yaml'
	export id='a7a16b4565f0d2dcc9d115c24634dd809682a84d'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export compiler='gcc-11'
	export enqueue_time='2023-03-13 15:09:14 +0800'
	export _id='640ecc1a16cf3a35f4556110'
	export _rt='/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-randconfig-a005-20230313/gcc-11/fa34ab8cb95611bb73d6dac030ce42a843a0a231'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-randconfig-a005-20230313/gcc-11/fa34ab8cb95611bb73d6dac030ce42a843a0a231/3'
	export scheduler_version='/lkp/lkp/.src-20230307-105906'
	export arch='x86_64'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-randconfig-a005-20230313/gcc-11/fa34ab8cb95611bb73d6dac030ce42a843a0a231/3
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a005-20230313/gcc-11/fa34ab8cb95611bb73d6dac030ce42a843a0a231/vmlinuz-6.3.0-rc1-00003-gfa34ab8cb956
branch=peterz-queue/sched/eevdf2
job=/lkp/jobs/scheduled/vm-meta-268/boot-1-debian-11.1-x86_64-20220510.cgz-fa34ab8cb95611bb73d6dac030ce42a843a0a231-20230313-13812-ssmg9e-0.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a005-20230313
commit=fa34ab8cb95611bb73d6dac030ce42a843a0a231
initcall_debug
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
	export modules_initrd='/pkg/linux/x86_64-randconfig-a005-20230313/gcc-11/fa34ab8cb95611bb73d6dac030ce42a843a0a231/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export meta_host='vm-meta-268'
	export kernel='/pkg/linux/x86_64-randconfig-a005-20230313/gcc-11/fa34ab8cb95611bb73d6dac030ce42a843a0a231/vmlinuz-6.3.0-rc1-00003-gfa34ab8cb956'
	export dequeue_time='2023-03-13 15:22:38 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-268/boot-1-debian-11.1-x86_64-20220510.cgz-fa34ab8cb95611bb73d6dac030ce42a843a0a231-20230313-13812-ssmg9e-0.cgz'

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

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--ukAIFu4geGdc+3A1
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--ukAIFu4geGdc+3A1--
