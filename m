Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF0160
	for <oe-lkp@lists.linux.dev>; Mon,  5 Jun 2023 00:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685924519; x=1717460519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ra+/nkMGRgT0DR9c2K4rfin8eT8ODV4EMM+rYDzkXZk=;
  b=Ok8a9jQHyQ/ndXJWbI++yacB0tnR5MSnXRGMP7FiKpz+U1Bx3Mw5itoW
   xSptYq+l/YuFgn1WSvR/r7v4h5dpmL6iZldKXtnEaVm9Wmf/PYHH9OTPf
   fCPLnOPKlvl1EAFEQoQw9avqvMS15MFLpzYaQXi4M8kLWjuNRXhajbeJl
   pawT9lhqvvfYXNkOgFWGZDXnSRbH0PgUttD2cTugFGDrqUrTGZiYVx458
   N3WfksFhlUadygW6Wk8ud/5GirBuCrqmmAgZ/FySrknI/I0MTrebPjMdg
   9DSwtchJ8Ijimiig1hfFmYo+yWTVz4UQbfFGz54Qx2IxYdcmB+uGRLtGj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="345836808"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="xz'341?scan'341,208,341";a="345836808"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 17:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="778341998"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="xz'341?scan'341,208,341";a="778341998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2023 17:21:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 17:21:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 4 Jun 2023 17:21:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 4 Jun 2023 17:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghUPFdgXddGzYit38QWJmU28ev9pWIKdW63mGvTExhOpJyASCEhNrmlw+j2NUe9u0OQby0gKw8L2JBbjM3K9wcfThC1YBk2eUTHJYKGsS0EbkDwhWC3Ny4yYANNlWn6yMeLI0lr4XVZ00Ymdy5BEOylQ9iLwl+vefleCEjfFAAdz+m5eAdqH685pBjp3DztWWrgwskBZ6OmI4YiKJ/L2JYdhDlP+FAG3ibhl0ilNQ3QkELMGvmCGg8FF/OLNLrkaNVpClqBCdwFHRSLxmE2NWQIvWR/KPB/EaUYJhOz6019eIj9DUARp3OCW9P24Hv3YtAYoVbEL1ofTnVFqM6M12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOIW0A7C3y97HI6pFmrcMxpdK+wuZ2bROuaIAA28LLk=;
 b=SpMSut6jzixKDzTre5XJDgciaukqrQdvFretW2eQvEO7Yi2s5OKxRvKX7WX6NvG3bsamJaDySbW26emuwMrhoMEolAjJdkKQmaYeIXSGulqVD92le3Pa81M4fEFJGhuytd3jFQ+odpdFPSiogGZ4PmfsdvLA9WIkvVDHvenXglQg1n9XSeORtRwPirlpMp4M2u/Zvo40SjnkpMjFGLPvVz0MgaTHgRNZXL2/RuLbOWBpCO35Ang2ICJTWplYMguk1UV7cPIwMbyBbLI0LXOjwuVuknpBm/lTdLbs/Qmtp/lLiqM089f9mwNY6bfXW4LAejDxRf1y1muL2vGzO8WXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA1PR11MB6492.namprd11.prod.outlook.com (2603:10b6:208:3a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 00:21:51 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%6]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 00:21:51 +0000
Date: Mon, 5 Jun 2023 08:21:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [cel:topic-shmem-stable-dir-cookies] [shmem] 3d84f19334:
 WARNING:suspicious_RCU_usage
Message-ID: <202306042250.f8189e92-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="GqVfbZ+TKO1Nn9Yc"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0138.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::18) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA1PR11MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e40d73-0585-4079-cbfe-08db655adaf9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EHQxxEKXgMdbsZ9NyQkR3DiBJK2G1u1Mqjv11CRfJlGmirKP1veof1mO1QbkuMm4ZXIFnCvbEKV3EiUvPkNujfDFGyESoyxFkYq5rJY2R0DaxRzqMCyGrHruLsXrikzDrALBh3PjoPIo4JhLSYQ/aWZG7AvdjRSNVbeRGmgkXnz07/t8P2RIn4Q2bs0qHlBl65b2InV1pmT/jlW04iYe5S+N/pn3mIr5ybPj0RkyQhUrMsjdk2mmSm9FLLr6CigTJCHdGEJuKrneWFYzxNIj0dLW5xj58WxWd4Q9dwG8TVlZ/866QLWlauXfOzoq8yYsXcAiaECSgD7chrdoS1GaTvobnKEuJkhIl+ilSoqILMdJa6fnfJwjdMRUeAtdSKZNVvVmMGRW1U4fBrEpuHrLIrb5AZL7Ne1nXn7tMDpqtNUeZPF4UdGEWEP7K0XkM755kWjr+ei9WY6jn1aWygkUCLX8OOG9+mr/pNb5lonmoKAdhWzscVLxAKGBYp4zQpAqumBY3ayNbKw1fO+ssUjkQ7/OxBYzgZgBmT9L1BLT7Af1ddCGjlgi7LyyKgx1fhWDWkmNDzCgQk8UACfHlpA0X3QwZXo5t5fnnO+rfnLGhHSd4IUR3+ul9+LRSu4LT7EurYtY16jrs5IjJ3GTbeYj/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(36756003)(30864003)(2906002)(86362001)(5660300002)(235185007)(83380400001)(6666004)(6486002)(44144004)(966005)(186003)(1076003)(26005)(6506007)(6512007)(107886003)(82960400001)(478600001)(6916009)(316002)(38100700002)(66476007)(4326008)(66946007)(2616005)(41300700001)(66556008)(8936002)(8676002)(2700100001)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E4YVAg8PWux7Gez2+gXZZDuqFM2T+4eEzBQrZ1Q5++9AGWXjcn8gBPr4kUuT?=
 =?us-ascii?Q?iNvL+dOQ88IBZc3SJrnExkqR6ohcrfUrmh4plNFsm+EiVY4ohiIVZ5M9uLxi?=
 =?us-ascii?Q?1Ksd3P6VaARUKf/pTql4I3uc0OCj3URyxsm80jnkbRjFMAoZjvRhwJIcAkNw?=
 =?us-ascii?Q?+ydfDFjyQI8kDfWVDVrW63u/WASRiij4qoZ0XClQ6FedMfgDlwByq/iwqhfc?=
 =?us-ascii?Q?YKqZUJ6syHt5QMYpAVMHBKT7RB9Cgke9D48gFMCvCKpaSsz598mDomBlNVFZ?=
 =?us-ascii?Q?qiJosl2a/U8S2kywr3bUZiv5O/f054P+tTUL8O3Pb0lAvzyu9Gfz8WclL2k3?=
 =?us-ascii?Q?TxKHufD3DwPBpCRVzYuYS0fcvCZAaseonpOwJdTYMvuYGIcaumNX9rPxUpvD?=
 =?us-ascii?Q?gelDN7l1/m4zHXha9Vx8OdU7uA33rVqC7oM2WhuUYSwyq7ayWwIQvtxK0/LK?=
 =?us-ascii?Q?g5jIR/ul394fWkJlzik2guZS3wSHoQFsn0r5RMDkEf1gxzTC2u8yuaVoF98j?=
 =?us-ascii?Q?pBIie4hRWFdr4q1Mgib7MdEs1xtwLc+R1IcteQYGuleV+uASilI4kNCFfgwv?=
 =?us-ascii?Q?bMpf5FXZTvNeLSz+3j7rEmXQL9yycOyXXj2RimI6zUUG02XuNZGxEjMXdT9I?=
 =?us-ascii?Q?g7RpY3t2dO4GcCmZ9rVModgGvUDMZTi6UvEeQPmJRIRNoh3tLbksQ0nvgx54?=
 =?us-ascii?Q?1xO9QH8YKzkKyDi7z7LHr3yAdxpm57A/U4Wk9wPOB8yq1L2KHXgGau5kiylS?=
 =?us-ascii?Q?oyHwgCEQIYUBPpkzsYe9CF8xD9X3o3ZHcD1H2XecoOjqpVQN5yTJHOxz3d+b?=
 =?us-ascii?Q?9c880itgS+/10z2pJDtR48PPFIm2QqClC9Q1xzKGqbs8r6EfldXv1tG8B2BH?=
 =?us-ascii?Q?Tp+DLXK6lVi10yBxSLDMQaZojeTRikTr25ZMrKSwUqcLA8XG9r9sZ3543PuA?=
 =?us-ascii?Q?49Ns0dUflbRNBImbQWocpHRodN6zs3bUcb++AQ4Xn1Mcf44ejiwjz4sy5k+4?=
 =?us-ascii?Q?wswhDro7Xow9T+68gHLi6VEt+6F4OhQeewjcAnuH6YMFg1QdaoKRsTl1+CJO?=
 =?us-ascii?Q?NXRIGa0ySQpUSxLeGGa+QeS75SY3EFz22/l3Pa5R/RuESxAylq/lpQjnBwOQ?=
 =?us-ascii?Q?ZIGNoOZcYmitjU8Htd0rVwRW0SDTtNyc4mbw3jFLD3FJonEK48wjWAOwnCEj?=
 =?us-ascii?Q?GxivvPJp4G6ZaijdhRVSSDHSh1bablzZ5NJJQuu4PP/HESRXp6oi4KJuWCbN?=
 =?us-ascii?Q?S/YUhI+9504w0JGXIu4hMRq7g8qjUaWtR3DMpGe3hLDtUwliHtZUurjQLun9?=
 =?us-ascii?Q?zjNAPP0Nv/zsT2BRtgP4RNkbO2934vGBWhqda2sJytptlUi1EOrw3AXwfwYl?=
 =?us-ascii?Q?GtUvFuV0imFvA35U4YZMwZbnr6C3VbesNNkC9TO1zJzWSYCCuTeMQS+2KqcO?=
 =?us-ascii?Q?ZmCGtIwaQNy2sj1rcLqc3Nb+ybNTk5267ij/gG7LdMI/yKjMaBZMyw/CDah+?=
 =?us-ascii?Q?R8AkaZHSgq2FdN9Ey7oam/ArEAvUFAobi7yXBDfDxCqJGAu6Ks9xf7sLQ0su?=
 =?us-ascii?Q?akLjv6KGmDGCvk8KxR6+/KmyCN6aNvDQPyAqiXm2N5g//eS0tbfaTVx63TPt?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e40d73-0585-4079-cbfe-08db655adaf9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 00:21:50.8066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQ0kdCu3gzogcPJ8bLAfpVatJtKsLpbBTsajN1+eq62trAB5ssssdCwlkuR7ThSozthvw9kGokl5xf/ryfsBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6492
X-OriginatorOrg: intel.com

--GqVfbZ+TKO1Nn9Yc
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 3d84f19334fc2f70310ebaf8926fc5fdd90dec69 ("shmem: stable directory offsets")
git://git.kernel.org/cgit/linux/kernel/git/cel/linux topic-shmem-stable-dir-cookies

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202306042250.f8189e92-oliver.sang@intel.com


[   14.465262][    T1] WARNING: suspicious RCU usage
[   14.465904][    T1] 6.4.0-rc4-00003-g3d84f19334fc #23 Not tainted
[   14.466724][    T1] -----------------------------
[   14.467376][    T1] include/linux/xarray.h:1182 suspicious rcu_dereference_check() usage!
[   14.468381][    T1]
[   14.468381][    T1] other info that might help us debug this:
[   14.468381][    T1]
[   14.469654][    T1]
[   14.469654][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   14.470702][    T1] 2 locks held by systemd/1:
[ 14.475442][ T1] #0: b795b2c0 (&type->i_mutex_dir_key#4){++++}-{3:3}, at: iterate_dir (??:?) 
[ 14.476677][ T1] #1: b90e2f18 (&dentry->d_lock){+.+.}-{2:2}, at: stable_readdir (libfs.c:?) 
[   14.477879][    T1]
[   14.477879][    T1] stack backtrace:
[   14.478657][    T1] CPU: 1 PID: 1 Comm: systemd Not tainted 6.4.0-rc4-00003-g3d84f19334fc #23
[   14.479802][    T1] Call Trace:
[ 14.480268][ T1] dump_stack_lvl (??:?) 
[ 14.480902][ T1] dump_stack (??:?) 
[ 14.481473][ T1] lockdep_rcu_suspicious (??:?) 
[ 14.482234][ T1] xas_start (xarray.c:?) 
[ 14.482824][ T1] xas_load (??:?) 
[ 14.483336][ T1] xas_find (??:?) 
[ 14.483878][ T1] ? stable_readdir (libfs.c:?) 
[ 14.484525][ T1] xas_next_entry (filemap.c:?) 
[ 14.485227][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.485920][ T1] stable_readdir (libfs.c:?) 
[ 14.486538][ T1] iterate_dir (??:?) 
[ 14.487163][ T1] __ia32_sys_getdents64 (??:?) 
[ 14.487834][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.488547][ T1] __do_fast_syscall_32 (common.c:?) 
[ 14.489212][ T1] do_fast_syscall_32 (??:?) 
[ 14.489860][ T1] do_SYSENTER_32 (??:?) 
[ 14.490463][ T1] entry_SYSENTER_32 (??:?) 
[   14.491134][    T1] EIP: 0xa7f61579
[ 14.491628][ T1] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
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
  2d:	c3                   	retq   
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
   3:	c3                   	retq   
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
[   14.494213][    T1] EAX: ffffffda EBX: 00000010 ECX: 00602eec EDX: 00008000
[   14.495172][    T1] ESI: 00602eec EDI: 0000001c EBP: 00602ed0 ESP: afe56e78
[   14.496018][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200206
[   14.498430][    T1]
[   14.501167][    T1] =============================
[   14.501798][    T1] WARNING: suspicious RCU usage
[   14.502464][    T1] 6.4.0-rc4-00003-g3d84f19334fc #23 Not tainted
[   14.503247][    T1] -----------------------------
[   14.503823][    T1] include/linux/xarray.h:1198 suspicious rcu_dereference_check() usage!
[   14.504812][    T1]
[   14.504812][    T1] other info that might help us debug this:
[   14.504812][    T1]
[   14.506017][    T1]
[   14.506017][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   14.507034][    T1] 2 locks held by systemd/1:
[ 14.507596][ T1] #0: b7969fd8 (&type->i_mutex_dir_key#4){++++}-{3:3}, at: iterate_dir (??:?) 
[ 14.508679][ T1] #1: b90ed148 (&dentry->d_lock){+.+.}-{2:2}, at: stable_readdir (libfs.c:?) 
[   14.509684][    T1]
[   14.509684][    T1] stack backtrace:
[   14.510325][    T1] CPU: 0 PID: 1 Comm: systemd Not tainted 6.4.0-rc4-00003-g3d84f19334fc #23
[   14.511358][    T1] Call Trace:
[ 14.511778][ T1] dump_stack_lvl (??:?) 
[ 14.512288][ T1] dump_stack (??:?) 
[ 14.512755][ T1] lockdep_rcu_suspicious (??:?) 
[ 14.513378][ T1] xas_descend (xarray.c:?) 
[ 14.513902][ T1] xas_load (??:?) 
[ 14.514376][ T1] xas_find (??:?) 
[ 14.514842][ T1] ? stable_readdir (libfs.c:?) 
[ 14.515413][ T1] xas_next_entry (filemap.c:?) 
[ 14.516100][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.516812][ T1] stable_readdir (libfs.c:?) 
[ 14.517462][ T1] iterate_dir (??:?) 
[ 14.518036][ T1] __ia32_sys_getdents64 (??:?) 
[ 14.518838][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.519479][ T1] __do_fast_syscall_32 (common.c:?) 
[ 14.520038][ T1] do_fast_syscall_32 (??:?) 
[ 14.520635][ T1] do_SYSENTER_32 (??:?) 
[ 14.521388][ T1] entry_SYSENTER_32 (??:?) 
[   14.522097][    T1] EIP: 0xa7f61579
[ 14.522609][ T1] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
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
  2d:	c3                   	retq   
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
   3:	c3                   	retq   
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
[   14.525199][    T1] EAX: ffffffda EBX: 00000010 ECX: 00602eec EDX: 00008000
[   14.526082][    T1] ESI: 00602eec EDI: 0000001c EBP: 00602ed0 ESP: afe56e78
[   14.526990][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200206
[   14.528059][    T1]
[   14.528346][    T1] =============================
[   14.528908][    T1] WARNING: suspicious RCU usage
[   14.529500][    T1] 6.4.0-rc4-00003-g3d84f19334fc #23 Not tainted
[   14.530236][    T1] -----------------------------
[   14.530832][    T1] include/linux/xarray.h:1198 suspicious rcu_dereference_check() usage!
[   14.531935][    T1]
[   14.531935][    T1] other info that might help us debug this:
[   14.531935][    T1]
[   14.533311][    T1]
[   14.533311][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   14.534270][    T1] 2 locks held by systemd/1:
[ 14.534757][ T1] #0: b7969fd8 (&type->i_mutex_dir_key#4){++++}-{3:3}, at: iterate_dir (??:?) 
[ 14.535946][ T1] #1: b90ed148 (&dentry->d_lock){+.+.}-{2:2}, at: stable_readdir (libfs.c:?) 
[   14.537137][    T1]
[   14.537137][    T1] stack backtrace:
[   14.537897][    T1] CPU: 0 PID: 1 Comm: systemd Not tainted 6.4.0-rc4-00003-g3d84f19334fc #23
[   14.539026][    T1] Call Trace:
[ 14.539414][ T1] dump_stack_lvl (??:?) 
[ 14.539932][ T1] dump_stack (??:?) 
[ 14.540411][ T1] lockdep_rcu_suspicious (??:?) 
[ 14.541037][ T1] xas_next_entry (filemap.c:?) 
[ 14.541702][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.542302][ T1] stable_readdir (libfs.c:?) 
[ 14.542846][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.543472][ T1] iterate_dir (??:?) 
[ 14.543967][ T1] __ia32_sys_getdents64 (??:?) 
[ 14.544581][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.545202][ T1] __do_fast_syscall_32 (common.c:?) 
[ 14.545857][ T1] do_fast_syscall_32 (??:?) 
[ 14.546506][ T1] do_SYSENTER_32 (??:?) 
[ 14.547136][ T1] entry_SYSENTER_32 (??:?) 
[   14.547702][    T1] EIP: 0xa7f61579
[ 14.548124][ T1] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
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
  2d:	c3                   	retq   
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
   3:	c3                   	retq   
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
[   14.550300][    T1] EAX: ffffffda EBX: 00000010 ECX: 00602eec EDX: 00008000
[   14.551107][    T1] ESI: 00602eec EDI: 0000001c EBP: 00602ed0 ESP: afe56e78
[   14.551894][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200206
[   14.552958][    T1]
[   14.553303][    T1] =============================
[   14.553989][    T1] WARNING: suspicious RCU usage
[   14.554677][    T1] 6.4.0-rc4-00003-g3d84f19334fc #23 Not tainted
[   14.555885][    T1] -----------------------------
[   14.556430][    T1] include/linux/xarray.h:1215 suspicious rcu_dereference_check() usage!
[   14.557400][    T1]
[   14.557400][    T1] other info that might help us debug this:
[   14.557400][    T1]
[   14.558645][    T1]
[   14.558645][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   14.559706][    T1] 2 locks held by systemd/1:
[ 14.560624][ T1] #0: b7969fd8 (&type->i_mutex_dir_key#4){++++}-{3:3}, at: iterate_dir (??:?) 
[ 14.561826][ T1] #1: b90ed148 (&dentry->d_lock){+.+.}-{2:2}, at: stable_readdir (libfs.c:?) 
[   14.562879][    T1]
[   14.562879][    T1] stack backtrace:
[   14.563632][    T1] CPU: 0 PID: 1 Comm: systemd Not tainted 6.4.0-rc4-00003-g3d84f19334fc #23
[   14.564793][    T1] Call Trace:
[ 14.565261][ T1] dump_stack_lvl (??:?) 
[ 14.565878][ T1] dump_stack (??:?) 
[ 14.566454][ T1] lockdep_rcu_suspicious (??:?) 
[ 14.567204][ T1] xas_find (??:?) 
[ 14.567724][ T1] xas_next_entry (filemap.c:?) 
[ 14.568426][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.569037][ T1] stable_readdir (libfs.c:?) 
[ 14.569555][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.570158][ T1] iterate_dir (??:?) 
[ 14.570719][ T1] __ia32_sys_getdents64 (??:?) 
[ 14.571362][ T1] ? __ia32_sys_getdents (readdir.c:?) 
[ 14.572067][ T1] __do_fast_syscall_32 (common.c:?) 
[ 14.572751][ T1] do_fast_syscall_32 (??:?) 
[ 14.573424][ T1] do_SYSENTER_32 (??:?) 
[ 14.574053][ T1] entry_SYSENTER_32 (??:?) 
[   14.574725][    T1] EIP: 0xa7f61579
[ 14.575221][ T1] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
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
  2d:	c3                   	retq   
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
   3:	c3                   	retq   
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
[   14.577644][    T1] EAX: ffffffda EBX: 00000010 ECX: 00602eec EDX: 00008000
[   14.578583][    T1] ESI: 00602eec EDI: 0000001c EBP: 00602ed0 ESP: afe56e78
[   14.579786][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200206
[   17.272277][    C0] random: crng init done
[  OK  ] Created slice system-getty.slice.
[  OK  ] Created slice system-modprobe.slice.
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Local Encrypted Volumes.
[  OK  ] Reached target Paths.
[  OK  ] Reached target Slices.
[  OK  ] Reached target Swap.
[  OK  ] Listening on RPCbind Server Activation Socket.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Listening on initctl Compatibility Named Pipe.
[  OK  ] Listening on Journal Audit Socket.
[  OK  ] Listening on Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket.
[  OK  ] Listening on udev Control Socket.
[  OK  ] Listening on udev Kernel Socket.
Mounting Huge Pages File System...
Mounting RPC Pipe File System...
Mounting Kernel Trace File System...
Starting Load Kernel Module configfs...
Starting Load Kernel Module drm...
Starting Load Kernel Module fuse...
Starting Journal Service...
Starting Load Kernel Modules...
Starting Remount Root and Kernel File Systems...
Starting Coldplug All udev Devices...
[  OK  ] Mounted Huge Pages File System.
[FAILED] Failed to mount RPC Pipe File System.
See 'systemctl status run-rpc_pipefs.mount' for details.
[  OK  ] Mounted Kernel Trace File System.
[  OK  ] Finished Load Kernel Module configfs.
[  OK  ] Finished Load Kernel Module drm.
[  OK  ] Finished Load Kernel Module fuse.
[  OK  ] Finished Load Kernel Modules.
[  OK  ] Finished Remount Root and Kernel File Systems.
[  OK  ] Reached target NFS client services.
Mounting Kernel Configuration File System...
Starting Load/Save Random Seed...
Starting Apply Kernel Variables...
Starting Create System Users...
[  OK  ] Mounted Kernel Configuration File System.
[  OK  ] Finished Load/Save Random Seed.
[  OK  ] Finished Apply Kernel Variables.
[  OK  ] Finished Create System Users.
Starting Create Static Device Nodes in /dev...
[  OK  ] Finished Create Static Device Nodes in /dev.
[  OK  ] Reached target Local File Systems (Pre).
[  OK  ] Reached target Local File Systems.
Starting Preprocess NFS configuration...
[  OK  ] Finished Preprocess NFS configuration.
[  OK  ] Started Rule-based Manager for Device Events and Files.
[  OK  ] Started Journal Service.
Starting Flush Journal to Persistent Storage...
[  OK  ] Finished Flush Journal to Persistent Storage.
Starting Create Volatile Files and Directories...
[  OK  ] Finished Create Volatile Files and Directories.
Starting RPC bind portmap service...
Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started RPC bind portmap service.
[  OK  ] Reached target Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems.
[  OK  ] Reached target RPC Port Mapper.
[  OK  ] Finished Update UTMP about System Boot/Shutdown.
[  OK  ] Finished Coldplug All udev Devices.
[  OK  ] Reached target System Initialization.
[  OK  ] Started Daily apt download activities.
[  OK  ] Started Daily apt upgrade and clean activities.
[  OK  ] Started Discard unused blocks once a week.
[  OK  ] Started Daily rotation of log files.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target Timers.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
[  OK  ] Started Regular background program processing daemon.
[  OK  ] Started D-Bus System Message Bus.
Starting Helper to synchronize boot up for ifupdown...


To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-rc4-00003-g3d84f19334fc .config
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



--GqVfbZ+TKO1Nn9Yc
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc4-00003-g3d84f19334fc"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.4.0-rc4 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-12 (Debian 12.2.0-14) 12.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24000
CONFIG_LLD_VERSION=0
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
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
CONFIG_KERNEL_LZO=y
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

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
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
CONFIG_BPF_PRELOAD_UMD=y
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
# CONFIG_TASK_DELAY_ACCT is not set
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
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
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_EXP_KTHREAD=y
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_FORCE is not set
# CONFIG_BOOT_CONFIG_EMBED is not set
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
# CONFIG_UID16 is not set
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_PCSPKR_PLATFORM is not set
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
# CONFIG_EVENTFD is not set
CONFIG_SHMEM=y
CONFIG_AIO=y
# CONFIG_IO_URING is not set
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
# CONFIG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
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
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_X86_32_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_BIGSMP=y
CONFIG_X86_EXTENDED_PLATFORM=y
CONFIG_X86_GOLDFISH=y
# CONFIG_X86_INTEL_MID is not set
# CONFIG_X86_INTEL_QUARK is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
CONFIG_X86_RDC321X=y
CONFIG_X86_32_NON_STANDARD=y
# CONFIG_STA2X11 is not set
CONFIG_X86_32_IRIS=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486SX is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
CONFIG_MWINCHIP3D=y
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
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_MINIMUM_CPU_FAMILY=4
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_CYRIX_32 is not set
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
# CONFIG_DMI is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=64
CONFIG_NR_CPUS_DEFAULT=32
CONFIG_NR_CPUS=32
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# end of Performance monitoring

# CONFIG_X86_LEGACY_VM86 is not set
# CONFIG_X86_16BIT is not set
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_TOSHIBA=y
CONFIG_X86_REBOOTFIXUPS=y
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=y
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_VMSPLIT_3G is not set
CONFIG_VMSPLIT_3G_OPT=y
# CONFIG_VMSPLIT_2G is not set
# CONFIG_VMSPLIT_2G_OPT is not set
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=0xB0000000
CONFIG_HIGHMEM=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
# CONFIG_HIGHPTE is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
# CONFIG_MTRR is not set
# CONFIG_X86_UMIP is not set
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
CONFIG_EFI=y
# CONFIG_EFI_STUB is not set
CONFIG_EFI_FAKE_MEMMAP=y
CONFIG_EFI_MAX_FAKE_MEM=8
CONFIG_EFI_RUNTIME_MAP=y
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_SPECULATION_MITIGATIONS=y
# CONFIG_RETPOLINE is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_SUSPEND_SKIP_SYNC=y
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=y
# CONFIG_ACPI_BATTERY is not set
# CONFIG_ACPI_BUTTON is not set
CONFIG_ACPI_TINY_POWER_BUTTON=y
CONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=38
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=y
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=y
# CONFIG_ACPI_THERMAL is not set
CONFIG_ACPI_PLATFORM_PROFILE=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_TABLE_UPGRADE is not set
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=y
CONFIG_ACPI_HED=y
CONFIG_ACPI_CUSTOM_METHOD=y
# CONFIG_ACPI_BGRT is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
CONFIG_ACPI_DPTF=y
# CONFIG_DPTF_POWER is not set
# CONFIG_DPTF_PCH_FIVR is not set
CONFIG_ACPI_CONFIGFS=y
# CONFIG_ACPI_FFH is not set
CONFIG_PMIC_OPREGION=y
# CONFIG_BXT_WC_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y
CONFIG_X86_APM_BOOT=y
CONFIG_APM=y
CONFIG_APM_IGNORE_USER_SUSPEND=y
CONFIG_APM_DO_ENABLE=y
# CONFIG_APM_CPU_IDLE is not set
CONFIG_APM_DISPLAY_BLANK=y
# CONFIG_APM_ALLOW_INTS is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_CPUFREQ_DT=y
CONFIG_CPUFREQ_DT_PLATDEV=y
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=y
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=y
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_SPEEDSTEP_ICH is not set
CONFIG_X86_SPEEDSTEP_SMI=y
CONFIG_X86_P4_CLOCKMOD=y
CONFIG_X86_CPUFREQ_NFORCE2=y
CONFIG_X86_LONGRUN=y
# CONFIG_X86_LONGHAUL is not set
CONFIG_X86_E_POWERSAVER=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y
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
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOOLPC is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_OLPC=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
CONFIG_SCx200HR_TIMER=y
CONFIG_OLPC=y
CONFIG_OLPC_XO15_SCI=y
CONFIG_ALIX=y
# CONFIG_NET5501 is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
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
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
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
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y

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
# CONFIG_MODULE_DEBUG is not set
# CONFIG_MODULE_FORCE_LOAD is not set
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
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_ICQ=y
# CONFIG_BLK_DEV_BSGLIB is not set
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
# CONFIG_ACORN_PARTITION_CUMANA is not set
# CONFIG_ACORN_PARTITION_EESOX is not set
# CONFIG_ACORN_PARTITION_ICS is not set
CONFIG_ACORN_PARTITION_ADFS=y
CONFIG_ACORN_PARTITION_POWERTEC=y
# CONFIG_ACORN_PARTITION_RISCIX is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

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
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_BALLOON_COMPACTION is not set
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_BOUNCE=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=y
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
CONFIG_TLS=y
# CONFIG_TLS_DEVICE is not set
CONFIG_TLS_TOE=y
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=y
# CONFIG_NET_KEY_MIGRATE is not set
CONFIG_XFRM_ESPINTCP=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=y
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
# CONFIG_IP_MULTIPLE_TABLES is not set
# CONFIG_IP_ROUTE_MULTIPATH is not set
# CONFIG_IP_ROUTE_VERBOSE is not set
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
# CONFIG_NET_IPGRE is not set
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
# CONFIG_IP_MROUTE_MULTIPLE_TABLES is not set
CONFIG_IP_PIMSM_V1=y
# CONFIG_IP_PIMSM_V2 is not set
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=y
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
CONFIG_INET_ESP_OFFLOAD=y
CONFIG_INET_ESPINTCP=y
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=y
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=y
CONFIG_TCP_CONG_HTCP=y
CONFIG_TCP_CONG_HSTCP=y
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=y
CONFIG_TCP_CONG_NV=y
CONFIG_TCP_CONG_SCALABLE=y
# CONFIG_TCP_CONG_LP is not set
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=y
CONFIG_TCP_CONG_ILLINOIS=y
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=y
# CONFIG_TCP_CONG_BBR is not set
# CONFIG_DEFAULT_BIC is not set
# CONFIG_DEFAULT_CUBIC is not set
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_HYBLA is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_WESTWOOD is not set
CONFIG_DEFAULT_DCTCP=y
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="dctcp"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=y
CONFIG_INET6_ESP=y
CONFIG_INET6_ESP_OFFLOAD=y
CONFIG_INET6_ESPINTCP=y
CONFIG_INET6_IPCOMP=y
CONFIG_IPV6_MIP6=y
CONFIG_INET6_XFRM_TUNNEL=y
CONFIG_INET6_TUNNEL=y
# CONFIG_IPV6_VTI is not set
# CONFIG_IPV6_SIT is not set
CONFIG_IPV6_TUNNEL=y
# CONFIG_IPV6_GRE is not set
CONFIG_IPV6_FOU=y
CONFIG_IPV6_FOU_TUNNEL=y
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
# CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_RPL_LWTUNNEL=y
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
# CONFIG_MPTCP_IPV6 is not set
CONFIG_NETWORK_SECMARK=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
# CONFIG_IP_DCCP_CCID3 is not set
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
CONFIG_IP_DCCP_DEBUG=y
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=y
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
CONFIG_L2TP=y
# CONFIG_L2TP_DEBUGFS is not set
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=y
# CONFIG_L2TP_ETH is not set
CONFIG_STP=y
CONFIG_MRP=y
CONFIG_BRIDGE=y
CONFIG_BRIDGE_IGMP_SNOOPING=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_BRIDGE_MRP=y
CONFIG_BRIDGE_CFM=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
CONFIG_LLC2=y
# CONFIG_ATALK is not set
CONFIG_X25=y
CONFIG_LAPB=y
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=y
CONFIG_6LOWPAN_DEBUGFS=y
CONFIG_6LOWPAN_NHC=y
# CONFIG_6LOWPAN_NHC_DEST is not set
# CONFIG_6LOWPAN_NHC_FRAGMENT is not set
CONFIG_6LOWPAN_NHC_HOP=y
# CONFIG_6LOWPAN_NHC_IPV6 is not set
CONFIG_6LOWPAN_NHC_MOBILITY=y
# CONFIG_6LOWPAN_NHC_ROUTING is not set
CONFIG_6LOWPAN_NHC_UDP=y
CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=y
CONFIG_6LOWPAN_GHC_UDP=y
# CONFIG_6LOWPAN_GHC_ICMPV6 is not set
CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=y
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=y
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=y
CONFIG_NET_SCH_HFSC=y
CONFIG_NET_SCH_PRIO=y
CONFIG_NET_SCH_MULTIQ=y
# CONFIG_NET_SCH_RED is not set
CONFIG_NET_SCH_SFB=y
CONFIG_NET_SCH_SFQ=y
CONFIG_NET_SCH_TEQL=y
CONFIG_NET_SCH_TBF=y
# CONFIG_NET_SCH_CBS is not set
CONFIG_NET_SCH_ETF=y
CONFIG_NET_SCH_MQPRIO_LIB=y
# CONFIG_NET_SCH_TAPRIO is not set
# CONFIG_NET_SCH_GRED is not set
CONFIG_NET_SCH_NETEM=y
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=y
# CONFIG_NET_SCH_QFQ is not set
CONFIG_NET_SCH_CODEL=y
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=y
CONFIG_NET_SCH_HHF=y
# CONFIG_NET_SCH_PIE is not set
# CONFIG_NET_SCH_INGRESS is not set
CONFIG_NET_SCH_PLUG=y
CONFIG_NET_SCH_ETS=y
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
# CONFIG_DEFAULT_FQ_CODEL is not set
# CONFIG_DEFAULT_SFQ is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_ROUTE4=y
CONFIG_NET_CLS_FW=y
# CONFIG_NET_CLS_U32 is not set
# CONFIG_NET_CLS_FLOW is not set
CONFIG_NET_CLS_CGROUP=y
# CONFIG_NET_CLS_BPF is not set
CONFIG_NET_CLS_FLOWER=y
# CONFIG_NET_CLS_MATCHALL is not set
# CONFIG_NET_EMATCH is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=y
CONFIG_NET_ACT_GACT=y
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=y
CONFIG_NET_ACT_SAMPLE=y
CONFIG_NET_ACT_NAT=y
CONFIG_NET_ACT_PEDIT=y
# CONFIG_NET_ACT_SIMP is not set
CONFIG_NET_ACT_SKBEDIT=y
CONFIG_NET_ACT_CSUM=y
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=y
CONFIG_NET_ACT_BPF=y
CONFIG_NET_ACT_SKBMOD=y
CONFIG_NET_ACT_IFE=y
# CONFIG_NET_ACT_TUNNEL_KEY is not set
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_IFE_SKBMARK is not set
# CONFIG_NET_IFE_SKBPRIO is not set
# CONFIG_NET_IFE_SKBTCINDEX is not set
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=y
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
CONFIG_VSOCKETS_LOOPBACK=y
CONFIG_VIRTIO_VSOCKETS=y
CONFIG_VIRTIO_VSOCKETS_COMMON=y
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=y
CONFIG_HSR=y
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=y
CONFIG_QRTR_TUN=y
# CONFIG_QRTR_MHI is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
# CONFIG_CAN_RAW is not set
# CONFIG_CAN_BCM is not set
CONFIG_CAN_GW=y
CONFIG_CAN_J1939=y
CONFIG_CAN_ISOTP=y
CONFIG_BT=y
# CONFIG_BT_BREDR is not set
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
CONFIG_BT_MTK=y
CONFIG_BT_HCIBTSDIO=y
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIBCM4377 is not set
CONFIG_BT_HCIDTL1=y
CONFIG_BT_HCIBT3C=y
CONFIG_BT_HCIBLUECARD=y
CONFIG_BT_HCIVHCI=y
# CONFIG_BT_MRVL is not set
# CONFIG_BT_MTKSDIO is not set
CONFIG_BT_MTKUART=y
CONFIG_BT_VIRTIO=y
# CONFIG_BT_NXPUART is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=y
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_RDMA is not set
CONFIG_NET_9P_DEBUG=y
CONFIG_CAIF=y
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=y
# CONFIG_CAIF_USB is not set
CONFIG_CEPH_LIB=y
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=y
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=y
# CONFIG_ETHTOOL_NETLINK is not set

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
CONFIG_EISA_VLB_PRIMING=y
CONFIG_EISA_PCI_EISA=y
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
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set

#
# Cadence-based PCIe controllers
#
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCI_J721E_HOST is not set
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
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
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
CONFIG_I82365=y
CONFIG_TCIC=y
CONFIG_PCMCIA_PROBE=y
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
CONFIG_FW_LOADER_DEBUG=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_CACHE is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SOUNDWIRE=y
CONFIG_REGMAP_SOUNDWIRE_MBQ=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_FW_CS_DSP=y
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
CONFIG_EFI_CAPSULE_LOADER=y
# CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH is not set
# CONFIG_EFI_TEST is not set
# CONFIG_EFI_RCI2_TABLE is not set
CONFIG_EFI_DISABLE_PCI_DMA=y
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_PROMTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_PC_SUPERIO=y
CONFIG_PARPORT_PC_PCMCIA=y
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
# CONFIG_PNPBIOS is not set
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
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_RDMA=y
# CONFIG_NVME_FC is not set
CONFIG_NVME_TCP=y
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_PASSTHRU=y
# CONFIG_NVME_TARGET_LOOP is not set
CONFIG_NVME_TARGET_RDMA=y
# CONFIG_NVME_TARGET_FC is not set
CONFIG_NVME_TARGET_TCP=y
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HI6421V600_IRQ=y
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=y
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_PCH_PHUB is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
# CONFIG_VCPU_STALL_DETECTOR is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
# CONFIG_SCSI is not set
# end of SCSI device support

# CONFIG_ATA is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
# CONFIG_TCM_IBLOCK is not set
# CONFIG_TCM_FILEIO is not set
CONFIG_TCM_USER2=y
# CONFIG_ISCSI_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
# CONFIG_CAIF_DRIVERS is not set
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
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
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
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_ISA is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_GEMINI_ETHERNET is not set
CONFIG_NET_VENDOR_DAVICOM=y
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
# CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_LITEX_LITEETH is not set
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
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
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
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCA7000_UART is not set
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
CONFIG_NET_VENDOR_VERTEXCOM=y
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
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=y
CONFIG_CAN_VCAN=y
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
# CONFIG_CAN_CALC_BITTIMING is not set
CONFIG_CAN_RX_OFFLOAD=y
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_FLEXCAN is not set
CONFIG_CAN_GRCAN=y
# CONFIG_CAN_KVASER_PCIEFD is not set
# CONFIG_CAN_SLCAN is not set
CONFIG_CAN_C_CAN=y
CONFIG_CAN_C_CAN_PLATFORM=y
# CONFIG_CAN_C_CAN_PCI is not set
CONFIG_CAN_CC770=y
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=y
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_CTUCANFD_PLATFORM is not set
# CONFIG_CAN_IFI_CANFD is not set
CONFIG_CAN_M_CAN=y
# CONFIG_CAN_M_CAN_PCI is not set
# CONFIG_CAN_M_CAN_PLATFORM is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
# CONFIG_CAN_SJA1000 is not set
CONFIG_CAN_SOFTING=y
CONFIG_CAN_SOFTING_CS=y
# CONFIG_CAN_DEBUG_DEVICES is not set
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
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
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
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TC3589X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADC=y
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
# CONFIG_JOYSTICK_GRIP_MP is not set
# CONFIG_JOYSTICK_GUILLEMOT is not set
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
# CONFIG_JOYSTICK_IFORCE is not set
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_DB9=y
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=y
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
CONFIG_JOYSTICK_WALKERA0701=y
# CONFIG_JOYSTICK_PXRC is not set
# CONFIG_JOYSTICK_QWIIC is not set
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_JOYSTICK_SENSEHAT is not set
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_88PM860X is not set
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_AR1021_I2C is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_BU21029=y
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=y
CONFIG_TOUCHSCREEN_CHIPONE_ICN8505=y
CONFIG_TOUCHSCREEN_CY8CTMA140=y
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=y
# CONFIG_TOUCHSCREEN_CYTTSP5 is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
CONFIG_TOUCHSCREEN_EXC3000=y
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_HIDEEP=y
CONFIG_TOUCHSCREEN_HYCON_HY46XX=y
# CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX is not set
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_ILITEK=y
CONFIG_TOUCHSCREEN_S6SY761=y
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=y
CONFIG_TOUCHSCREEN_ELAN=y
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=y
CONFIG_TOUCHSCREEN_WACOM_I2C=y
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
CONFIG_TOUCHSCREEN_MMS114=y
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
# CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS is not set
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=y
# CONFIG_TOUCHSCREEN_HTCPEN is not set
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
CONFIG_TOUCHSCREEN_WM831X=y
CONFIG_TOUCHSCREEN_WM97XX=y
CONFIG_TOUCHSCREEN_WM9705=y
# CONFIG_TOUCHSCREEN_WM9712 is not set
CONFIG_TOUCHSCREEN_WM9713=y
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_TOUCHIT213=y
CONFIG_TOUCHSCREEN_TSC_SERIO=y
# CONFIG_TOUCHSCREEN_TSC2004 is not set
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
CONFIG_TOUCHSCREEN_SIS_I2C=y
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=y
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
CONFIG_TOUCHSCREEN_ZFORCE=y
# CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
CONFIG_TOUCHSCREEN_IQS5XX=y
# CONFIG_TOUCHSCREEN_ZINITIX is not set
# CONFIG_TOUCHSCREEN_HIMAX_HX83112B is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM860X_ONKEY is not set
CONFIG_INPUT_88PM80X_ONKEY=y
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
CONFIG_INPUT_ATC260X_ONKEY=y
CONFIG_INPUT_ATMEL_CAPTOUCH=y
CONFIG_INPUT_BMA150=y
# CONFIG_INPUT_E3X0_BUTTON is not set
CONFIG_INPUT_MAX77650_ONKEY=y
CONFIG_INPUT_MAX8925_ONKEY=y
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
# CONFIG_INPUT_APANEL is not set
CONFIG_INPUT_GPIO_BEEPER=y
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_WISTRON_BTNS is not set
CONFIG_INPUT_ATLAS_BTNS=y
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
CONFIG_INPUT_KXTJ9=y
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
# CONFIG_INPUT_RETU_PWRBUTTON is not set
# CONFIG_INPUT_TPS65218_PWRBUTTON is not set
CONFIG_INPUT_TWL6040_VIBRA=y
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PCF8574=y
# CONFIG_INPUT_RK805_PWRKEY is not set
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
CONFIG_INPUT_DA7280_HAPTICS=y
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_WM831X_ON=y
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IBM_PANEL is not set
CONFIG_INPUT_IQS269A=y
CONFIG_INPUT_IQS626A=y
# CONFIG_INPUT_IQS7222 is not set
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
CONFIG_INPUT_IDEAPAD_SLIDEBAR=y
# CONFIG_INPUT_DRV260X_HAPTICS is not set
CONFIG_INPUT_DRV2665_HAPTICS=y
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_INPUT_RAVE_SP_PWRBUTTON=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PARKBD=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=y
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
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
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
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
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# CONFIG_SERIAL_SPRD is not set
# CONFIG_SERIAL_LITEUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_GOLDFISH_TTY is not set
# CONFIG_IPWIRELESS is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
# CONFIG_TTY_PRINTK is not set
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_SSIF_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
# CONFIG_HW_RANDOM is not set
CONFIG_DTLK=y
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set
# CONFIG_MWAVE is not set
# CONFIG_SCx200_GPIO is not set
# CONFIG_PC8736x_GPIO is not set
CONFIG_NSC_GPIO=y
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=y
# CONFIG_DEVPORT is not set
CONFIG_HPET=y
# CONFIG_HPET_MMAP is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_I2C_CR50=y
CONFIG_TCG_TIS_I2C_ATMEL=y
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_NSC=y
CONFIG_TCG_ATMEL=y
CONFIG_TCG_INFINEON=y
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TELCLOCK=y
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_OF=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=y
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_DEMUX_PINCTRL=y
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
# CONFIG_I2C_KEMPLD is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_PXA is not set
CONFIG_I2C_RK3X=y
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_TAOS_EVM is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_PCA_ISA=y
# CONFIG_SCx200_ACB is not set
CONFIG_I2C_FSI=y
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=y
CONFIG_MIPI_I3C_HCI=y
# CONFIG_SPI is not set
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
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_PARPORT=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
CONFIG_PINCTRL_DA9062=y
# CONFIG_PINCTRL_EQUILIBRIUM is not set
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OCELOT=y
CONFIG_PINCTRL_RK805=y
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_STMFX=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L85=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
CONFIG_PINCTRL_CHERRYVIEW=y
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=y
CONFIG_PINCTRL_BROXTON=y
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=y
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
CONFIG_PINCTRL_EMMITSBURG=y
CONFIG_PINCTRL_GEMINILAKE=y
CONFIG_PINCTRL_ICELAKE=y
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=y
CONFIG_PINCTRL_TIGERLAKE=y
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_OF_GPIO_MM_GPIOCHIP=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_CADENCE=y
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_FTGPIO010=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=y
CONFIG_GPIO_HLWD=y
# CONFIG_GPIO_LOGICVC is not set
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_SIFIVE=y
CONFIG_GPIO_SIOX=y
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_WCD934X=y
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_I8255=y
CONFIG_GPIO_104_DIO_48E=y
CONFIG_GPIO_104_IDIO_16=y
CONFIG_GPIO_104_IDI_48=y
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_GPIO_MM=y
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH311X is not set
CONFIG_GPIO_WINBOND=y
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_GW_PLD is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_BD71815=y
CONFIG_GPIO_BD71828=y
CONFIG_GPIO_BD9571MWV=y
# CONFIG_GPIO_ELKHARTLAKE is not set
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_LP3943 is not set
# CONFIG_GPIO_LP873X is not set
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_MAX77650=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_TC3589X=y
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65218 is not set
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TPS65912=y
# CONFIG_GPIO_TWL6040 is not set
CONFIG_GPIO_WHISKEY_COVE=y
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# CONFIG_GPIO_SODAVILLE is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_ATC260X is not set
CONFIG_POWER_RESET_GPIO=y
# CONFIG_POWER_RESET_GPIO_RESTART is not set
CONFIG_POWER_RESET_LTC2952=y
CONFIG_POWER_RESET_REGULATOR=y
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_TPS65086 is not set
# CONFIG_POWER_RESET_SYSCON is not set
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_REBOOT_MODE=y
CONFIG_SYSCON_REBOOT_MODE=y
# CONFIG_NVMEM_REBOOT_MODE is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_MAX8925_POWER is not set
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_OLPC=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_WM97XX is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_88PM860X=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_LP8788=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_DETECTOR_MAX14656=y
# CONFIG_CHARGER_MAX77650 is not set
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_MAX8997=y
CONFIG_CHARGER_MP2629=y
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
# CONFIG_CHARGER_RK817 is not set
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65090=y
CONFIG_CHARGER_TPS65217=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_RT9467 is not set
# CONFIG_CHARGER_RT9471 is not set
CONFIG_CHARGER_UCS1002=y
CONFIG_CHARGER_BD99954=y
# CONFIG_BATTERY_SURFACE is not set
CONFIG_CHARGER_SURFACE=y
# CONFIG_BATTERY_UG3105 is not set
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_OF=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
CONFIG_CPU_THERMAL=y
# CONFIG_CPU_FREQ_THERMAL is not set
# CONFIG_CPU_IDLE_THERMAL is not set
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y
# CONFIG_THERMAL_MMIO is not set
CONFIG_DA9062_THERMAL=y

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=y
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=y
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_BXT_PMIC_THERMAL=y
# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_AS3711=y
# CONFIG_MFD_SMPRO is not set
# CONFIG_MFD_AS3722 is not set
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
# CONFIG_MFD_MAX597X is not set
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
# CONFIG_MFD_CS47L92 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_MFD_HI6421_SPMI=y
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC_BXTWC=y
CONFIG_INTEL_SOC_PMIC_MRFLD=y
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
CONFIG_MFD_INTEL_PMC_BXT=y
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=y
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77714 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=y
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=y
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_RK808=y
CONFIG_MFD_RN5T618=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
CONFIG_TPS65010=y
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TI_LP87565 is not set
CONFIG_MFD_TPS65218=y
# CONFIG_MFD_TPS65219 is not set
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_LOCHNAGAR is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
# CONFIG_MFD_ROHM_BD718XX is not set
CONFIG_MFD_ROHM_BD71828=y
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STPMIC1 is not set
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_QCOM_PM8008=y
CONFIG_RAVE_SP_CORE=y
# CONFIG_MFD_INTEL_M10_BMC_PMCI is not set
CONFIG_MFD_RSMU_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_88PM8607=y
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_ARIZONA_LDO1=y
CONFIG_REGULATOR_ARIZONA_MICSUPP=y
# CONFIG_REGULATOR_AS3711 is not set
CONFIG_REGULATOR_ATC260X=y
# CONFIG_REGULATOR_BD71815 is not set
CONFIG_REGULATOR_BD71828=y
# CONFIG_REGULATOR_BD9571MWV is not set
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9063=y
# CONFIG_REGULATOR_DA9121 is not set
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_FAN53880=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_HI6421V600=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP873X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77650=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8973=y
CONFIG_REGULATOR_MAX8997=y
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX20411 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MCP16502=y
CONFIG_REGULATOR_MP5416=y
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MP886X=y
CONFIG_REGULATOR_MPQ7920=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=y
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RK808=y
CONFIG_REGULATOR_RN5T618=y
CONFIG_REGULATOR_ROHM=y
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT4803 is not set
# CONFIG_REGULATOR_RT4831 is not set
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5739 is not set
# CONFIG_REGULATOR_RT5759 is not set
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6190 is not set
CONFIG_REGULATOR_RT6245=y
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65090=y
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS65217=y
# CONFIG_REGULATOR_TPS65218 is not set
CONFIG_REGULATOR_TPS65910=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=y
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=y
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=y
CONFIG_IR_NEC_DECODER=y
CONFIG_IR_RC5_DECODER=y
CONFIG_IR_RC6_DECODER=y
CONFIG_IR_RCMM_DECODER=y
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_SONY_DECODER=y
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=y
# CONFIG_IR_FINTEK is not set
CONFIG_IR_GPIO_CIR=y
# CONFIG_IR_HIX5HD2 is not set
CONFIG_IR_ITE_CIR=y
CONFIG_IR_NUVOTON=y
CONFIG_IR_SERIAL=y
# CONFIG_IR_SERIAL_TRANSMITTER is not set
CONFIG_IR_WINBOND_CIR=y
# CONFIG_RC_LOOPBACK is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

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
# CONFIG_VIDEO_DEV is not set
# CONFIG_MEDIA_CONTROLLER is not set
CONFIG_DVB_CORE=y
# end of Media core support

#
# Digital TV options
#
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
CONFIG_SDR_PLATFORM_DRIVERS=y
CONFIG_DVB_PLATFORM_DRIVERS=y

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

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=y
# CONFIG_DVB_TEST_DRIVERS is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_SMS_SIANO_MDTV=y
CONFIG_SMS_SIANO_RC=y
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_FC0011=y
# CONFIG_MEDIA_TUNER_FC0012 is not set
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_IT913X=y
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_MC44S803=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=y
# CONFIG_MEDIA_TUNER_MT20XX is not set
CONFIG_MEDIA_TUNER_MT2131=y
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=y
# CONFIG_MEDIA_TUNER_MXL5007T is not set
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_R820T=y
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
# CONFIG_MEDIA_TUNER_TDA8290 is not set
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_XC2028=y
# CONFIG_MEDIA_TUNER_XC4000 is not set
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
# CONFIG_DVB_MXL5XX is not set
CONFIG_DVB_STB0899=y
# CONFIG_DVB_STB6100 is not set
CONFIG_DVB_STV090x=y
# CONFIG_DVB_STV0910 is not set
CONFIG_DVB_STV6110x=y
CONFIG_DVB_STV6111=y

#
# Multistandard (cable + terrestrial) frontends
#
# CONFIG_DVB_DRXK is not set
CONFIG_DVB_MN88472=y
# CONFIG_DVB_MN88473 is not set
# CONFIG_DVB_SI2165 is not set
# CONFIG_DVB_TDA18271C2DD is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=y
CONFIG_DVB_CX24116=y
# CONFIG_DVB_CX24117 is not set
CONFIG_DVB_CX24120=y
CONFIG_DVB_CX24123=y
# CONFIG_DVB_DS3000 is not set
# CONFIG_DVB_MB86A16 is not set
CONFIG_DVB_MT312=y
CONFIG_DVB_S5H1420=y
CONFIG_DVB_SI21XX=y
# CONFIG_DVB_STB6000 is not set
CONFIG_DVB_STV0288=y
# CONFIG_DVB_STV0299 is not set
CONFIG_DVB_STV0900=y
# CONFIG_DVB_STV6110 is not set
CONFIG_DVB_TDA10071=y
# CONFIG_DVB_TDA10086 is not set
CONFIG_DVB_TDA8083=y
CONFIG_DVB_TDA8261=y
CONFIG_DVB_TDA826X=y
CONFIG_DVB_TS2020=y
# CONFIG_DVB_TUA6100 is not set
CONFIG_DVB_TUNER_CX24113=y
CONFIG_DVB_TUNER_ITD1000=y
# CONFIG_DVB_VES1X93 is not set
# CONFIG_DVB_ZL10036 is not set
CONFIG_DVB_ZL10039=y

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_AF9013 is not set
CONFIG_DVB_CX22700=y
# CONFIG_DVB_CX22702 is not set
CONFIG_DVB_CXD2820R=y
CONFIG_DVB_CXD2841ER=y
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=y
CONFIG_DVB_DIB7000M=y
# CONFIG_DVB_DIB7000P is not set
CONFIG_DVB_DIB9000=y
# CONFIG_DVB_DRXD is not set
CONFIG_DVB_EC100=y
CONFIG_DVB_L64781=y
CONFIG_DVB_MT352=y
CONFIG_DVB_NXT6000=y
# CONFIG_DVB_RTL2830 is not set
# CONFIG_DVB_RTL2832 is not set
# CONFIG_DVB_S5H1432 is not set
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_SP887X=y
CONFIG_DVB_STV0367=y
# CONFIG_DVB_TDA10048 is not set
CONFIG_DVB_TDA1004X=y
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_ZL10353=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=y
CONFIG_DVB_TDA10021=y
CONFIG_DVB_TDA10023=y
CONFIG_DVB_VES1820=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LG2160=y
CONFIG_DVB_LGDT3305=y
CONFIG_DVB_LGDT3306A=y
CONFIG_DVB_LGDT330X=y
CONFIG_DVB_MXL692=y
CONFIG_DVB_NXT200X=y
CONFIG_DVB_OR51132=y
# CONFIG_DVB_OR51211 is not set
CONFIG_DVB_S5H1409=y
CONFIG_DVB_S5H1411=y

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
# CONFIG_DVB_MB86A20S is not set
CONFIG_DVB_S921=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_MN88443X is not set
CONFIG_DVB_TC90522=y

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
CONFIG_DVB_AF9033=y
CONFIG_DVB_ASCOT2E=y
CONFIG_DVB_ATBM8830=y
CONFIG_DVB_HELENE=y
CONFIG_DVB_HORUS3A=y
# CONFIG_DVB_ISL6405 is not set
CONFIG_DVB_ISL6421=y
CONFIG_DVB_ISL6423=y
CONFIG_DVB_IX2505V=y
CONFIG_DVB_LGS8GL5=y
CONFIG_DVB_LGS8GXX=y
CONFIG_DVB_LNBH25=y
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=y
# CONFIG_DVB_LNBP22 is not set
# CONFIG_DVB_M88RS2000 is not set
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_DRX39XYJ=y

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
CONFIG_DVB_SP2=y
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=y
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
# CONFIG_FB_VESA is not set
# CONFIG_FB_EFI is not set
CONFIG_FB_N411=y
CONFIG_FB_HGA=y
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
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
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SIMPLE=y
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_KTZ8866 is not set
CONFIG_BACKLIGHT_MAX8925=y
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_SAHARA=y
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_AAT2870=y
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_TPS65217 is not set
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=y
# CONFIG_BACKLIGHT_RAVE_SP is not set
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_PCM=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
# CONFIG_SND_PCM_TIMER is not set
# CONFIG_SND_HRTIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_AC97_CODEC=y
# CONFIG_SND_DRIVERS is not set
# CONFIG_SND_ISA is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CS5530 is not set
# CONFIG_SND_CS5535AUDIO is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SE6X is not set
# CONFIG_SND_SIS7019 is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
# CONFIG_SND_PCMCIA is not set
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_ADI=y
CONFIG_SND_SOC_ADI_AXI_I2S=y
# CONFIG_SND_SOC_ADI_AXI_SPDIF is not set
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
# CONFIG_SND_SOC_AMD_ACP5x is not set
# CONFIG_SND_SOC_AMD_ACP6x is not set
# CONFIG_SND_AMD_ACP_CONFIG is not set
# CONFIG_SND_SOC_AMD_ACP_COMMON is not set
# CONFIG_SND_SOC_AMD_RPL_ACP6x is not set
# CONFIG_SND_SOC_AMD_PS is not set
CONFIG_SND_ATMEL_SOC=y
CONFIG_SND_SOC_MIKROE_PROTO=y
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
CONFIG_SND_DESIGNWARE_I2S=y
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
CONFIG_SND_SOC_FSL_AUDMIX=y
CONFIG_SND_SOC_FSL_SSI=y
CONFIG_SND_SOC_FSL_SPDIF=y
CONFIG_SND_SOC_FSL_ESAI=y
# CONFIG_SND_SOC_FSL_MICFIL is not set
CONFIG_SND_SOC_FSL_EASRC=y
CONFIG_SND_SOC_FSL_XCVR=y
CONFIG_SND_SOC_FSL_UTILS=y
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# end of SoC Audio for Freescale CPUs

# CONFIG_SND_I2S_HI6210_I2S is not set
# CONFIG_SND_SOC_IMG is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
# CONFIG_SND_SOC_INTEL_AVS is not set
# CONFIG_SND_SOC_INTEL_MACH is not set
CONFIG_SND_SOC_MTK_BTCVSD=y
CONFIG_SND_SOC_SOF_TOPLEVEL=y
# CONFIG_SND_SOC_SOF_PCI is not set
# CONFIG_SND_SOC_SOF_ACPI is not set
CONFIG_SND_SOC_SOF_OF=y
# CONFIG_SND_SOC_SOF_AMD_TOPLEVEL is not set
CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=y

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
# CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
# CONFIG_SND_SOC_XILINX_SPDIF is not set
# CONFIG_SND_SOC_XTFPGA_I2S is not set
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_WM_ADSP=y
CONFIG_SND_SOC_AC97_CODEC=y
CONFIG_SND_SOC_ADAU_UTILS=y
CONFIG_SND_SOC_ADAU1372=y
CONFIG_SND_SOC_ADAU1372_I2C=y
CONFIG_SND_SOC_ADAU1701=y
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
# CONFIG_SND_SOC_ADAU7002 is not set
CONFIG_SND_SOC_ADAU7118=y
CONFIG_SND_SOC_ADAU7118_HW=y
CONFIG_SND_SOC_ADAU7118_I2C=y
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4375 is not set
# CONFIG_SND_SOC_AK4458 is not set
CONFIG_SND_SOC_AK4554=y
CONFIG_SND_SOC_AK4613=y
CONFIG_SND_SOC_AK4642=y
CONFIG_SND_SOC_AK5386=y
# CONFIG_SND_SOC_AK5558 is not set
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_AW8738 is not set
# CONFIG_SND_SOC_AW88395 is not set
CONFIG_SND_SOC_BD28623=y
CONFIG_SND_SOC_BT_SCO=y
CONFIG_SND_SOC_CS35L32=y
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
# CONFIG_SND_SOC_CS35L36 is not set
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
CONFIG_SND_SOC_CS35L41_I2C=y
# CONFIG_SND_SOC_CS35L45_I2C is not set
# CONFIG_SND_SOC_CS35L56_I2C is not set
# CONFIG_SND_SOC_CS35L56_SDW is not set
CONFIG_SND_SOC_CS42L42_CORE=y
CONFIG_SND_SOC_CS42L42=y
# CONFIG_SND_SOC_CS42L42_SDW is not set
CONFIG_SND_SOC_CS42L51=y
CONFIG_SND_SOC_CS42L51_I2C=y
CONFIG_SND_SOC_CS42L52=y
CONFIG_SND_SOC_CS42L56=y
CONFIG_SND_SOC_CS42L73=y
# CONFIG_SND_SOC_CS42L83 is not set
CONFIG_SND_SOC_CS4234=y
# CONFIG_SND_SOC_CS4265 is not set
CONFIG_SND_SOC_CS4270=y
CONFIG_SND_SOC_CS4271=y
CONFIG_SND_SOC_CS4271_I2C=y
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
# CONFIG_SND_SOC_CS43130 is not set
CONFIG_SND_SOC_CS4341=y
CONFIG_SND_SOC_CS4349=y
CONFIG_SND_SOC_CS53L30=y
CONFIG_SND_SOC_CX2072X=y
CONFIG_SND_SOC_DA7213=y
CONFIG_SND_SOC_DMIC=y
CONFIG_SND_SOC_ES7134=y
CONFIG_SND_SOC_ES7241=y
CONFIG_SND_SOC_ES8316=y
CONFIG_SND_SOC_ES8326=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
CONFIG_SND_SOC_GTM601=y
# CONFIG_SND_SOC_HDA is not set
# CONFIG_SND_SOC_ICS43432 is not set
# CONFIG_SND_SOC_INNO_RK3036 is not set
CONFIG_SND_SOC_MAX98088=y
# CONFIG_SND_SOC_MAX98090 is not set
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98504=y
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=y
# CONFIG_SND_SOC_MAX98520 is not set
# CONFIG_SND_SOC_MAX98363 is not set
CONFIG_SND_SOC_MAX98373=y
CONFIG_SND_SOC_MAX98373_I2C=y
CONFIG_SND_SOC_MAX98373_SDW=y
CONFIG_SND_SOC_MAX98390=y
# CONFIG_SND_SOC_MAX98396 is not set
CONFIG_SND_SOC_MAX9860=y
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
CONFIG_SND_SOC_PCM1681=y
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
# CONFIG_SND_SOC_PCM179X_I2C is not set
# CONFIG_SND_SOC_PCM186X_I2C is not set
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
# CONFIG_SND_SOC_PCM3168A_I2C is not set
CONFIG_SND_SOC_PCM5102A=y
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RK817=y
CONFIG_SND_SOC_RL6231=y
# CONFIG_SND_SOC_RT1308_SDW is not set
CONFIG_SND_SOC_RT1316_SDW=y
# CONFIG_SND_SOC_RT1318_SDW is not set
CONFIG_SND_SOC_RT5616=y
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=y
CONFIG_SND_SOC_RT5659=y
CONFIG_SND_SOC_RT5682=y
CONFIG_SND_SOC_RT5682_SDW=y
# CONFIG_SND_SOC_RT700_SDW is not set
CONFIG_SND_SOC_RT711=y
CONFIG_SND_SOC_RT711_SDW=y
CONFIG_SND_SOC_RT711_SDCA_SDW=y
# CONFIG_SND_SOC_RT712_SDCA_SDW is not set
# CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW is not set
CONFIG_SND_SOC_RT715=y
CONFIG_SND_SOC_RT715_SDW=y
# CONFIG_SND_SOC_RT715_SDCA_SDW is not set
# CONFIG_SND_SOC_RT9120 is not set
CONFIG_SND_SOC_SDW_MOCKUP=y
# CONFIG_SND_SOC_SGTL5000 is not set
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
CONFIG_SND_SOC_SIMPLE_MUX=y
# CONFIG_SND_SOC_SMA1303 is not set
CONFIG_SND_SOC_SPDIF=y
# CONFIG_SND_SOC_SRC4XXX_I2C is not set
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2518=y
# CONFIG_SND_SOC_SSM2602_I2C is not set
# CONFIG_SND_SOC_SSM4567 is not set
CONFIG_SND_SOC_STA32X=y
CONFIG_SND_SOC_STA350=y
CONFIG_SND_SOC_STI_SAS=y
CONFIG_SND_SOC_TAS2552=y
CONFIG_SND_SOC_TAS2562=y
CONFIG_SND_SOC_TAS2764=y
CONFIG_SND_SOC_TAS2770=y
# CONFIG_SND_SOC_TAS2780 is not set
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=y
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS5805M is not set
CONFIG_SND_SOC_TAS6424=y
CONFIG_SND_SOC_TDA7419=y
CONFIG_SND_SOC_TFA9879=y
CONFIG_SND_SOC_TFA989X=y
# CONFIG_SND_SOC_TLV320ADC3XXX is not set
CONFIG_SND_SOC_TLV320AIC23=y
CONFIG_SND_SOC_TLV320AIC23_I2C=y
# CONFIG_SND_SOC_TLV320AIC31XX is not set
CONFIG_SND_SOC_TLV320AIC32X4=y
CONFIG_SND_SOC_TLV320AIC32X4_I2C=y
CONFIG_SND_SOC_TLV320AIC3X=y
CONFIG_SND_SOC_TLV320AIC3X_I2C=y
CONFIG_SND_SOC_TLV320ADCX140=y
CONFIG_SND_SOC_TS3A227E=y
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
CONFIG_SND_SOC_UDA1334=y
# CONFIG_SND_SOC_WCD9335 is not set
CONFIG_SND_SOC_WCD_MBHC=y
CONFIG_SND_SOC_WCD934X=y
CONFIG_SND_SOC_WCD938X=y
CONFIG_SND_SOC_WCD938X_SDW=y
# CONFIG_SND_SOC_WM8510 is not set
CONFIG_SND_SOC_WM8523=y
CONFIG_SND_SOC_WM8524=y
CONFIG_SND_SOC_WM8580=y
CONFIG_SND_SOC_WM8711=y
CONFIG_SND_SOC_WM8728=y
CONFIG_SND_SOC_WM8731=y
# CONFIG_SND_SOC_WM8731_I2C is not set
# CONFIG_SND_SOC_WM8737 is not set
# CONFIG_SND_SOC_WM8741 is not set
# CONFIG_SND_SOC_WM8750 is not set
# CONFIG_SND_SOC_WM8753 is not set
CONFIG_SND_SOC_WM8776=y
CONFIG_SND_SOC_WM8782=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
CONFIG_SND_SOC_WM8903=y
CONFIG_SND_SOC_WM8904=y
# CONFIG_SND_SOC_WM8940 is not set
CONFIG_SND_SOC_WM8960=y
# CONFIG_SND_SOC_WM8961 is not set
CONFIG_SND_SOC_WM8962=y
# CONFIG_SND_SOC_WM8974 is not set
CONFIG_SND_SOC_WM8978=y
CONFIG_SND_SOC_WM8985=y
# CONFIG_SND_SOC_WSA881X is not set
# CONFIG_SND_SOC_WSA883X is not set
CONFIG_SND_SOC_MAX9759=y
CONFIG_SND_SOC_MT6351=y
# CONFIG_SND_SOC_MT6358 is not set
CONFIG_SND_SOC_MT6660=y
CONFIG_SND_SOC_NAU8315=y
CONFIG_SND_SOC_NAU8540=y
# CONFIG_SND_SOC_NAU8810 is not set
# CONFIG_SND_SOC_NAU8821 is not set
CONFIG_SND_SOC_NAU8822=y
# CONFIG_SND_SOC_NAU8824 is not set
# CONFIG_SND_SOC_TPA6130A2 is not set
CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
CONFIG_SND_SOC_LPASS_VA_MACRO=y
CONFIG_SND_SOC_LPASS_RX_MACRO=y
CONFIG_SND_SOC_LPASS_TX_MACRO=y
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
# CONFIG_SND_AUDIO_GRAPH_CARD is not set
# CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
# CONFIG_SND_TEST_COMPONENT is not set
# CONFIG_SND_X86 is not set
CONFIG_SND_VIRTIO=y
CONFIG_AC97_BUS=y
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=y
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
CONFIG_HID_AUREAL=y
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_CHERRY is not set
CONFIG_HID_COUGAR=y
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=y
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EVISION is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=y
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
# CONFIG_HID_PICOLCD_BACKLIGHT is not set
# CONFIG_HID_PICOLCD_LCD is not set
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PICOLCD_CIR is not set
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=y
CONFIG_PLAYSTATION_FF=y
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=y
CONFIG_HID_SPEEDLINK=y
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_WIIMOTE is not set
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

CONFIG_I2C_HID=y
# CONFIG_I2C_HID_ACPI is not set
CONFIG_I2C_HID_OF=y
# CONFIG_I2C_HID_OF_ELAN is not set
CONFIG_I2C_HID_OF_GOODIX=y
CONFIG_I2C_HID_CORE=y

#
# Surface System Aggregator Module HID support
#
# CONFIG_SURFACE_HID is not set
CONFIG_SURFACE_KBD=y
# end of Surface System Aggregator Module HID support

CONFIG_SURFACE_HID_CORE=y
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
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SIMPLE=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=y
# CONFIG_MMC_SDHCI_PCI is not set
# CONFIG_MMC_SDHCI_ACPI is not set
# CONFIG_MMC_SDHCI_PLTFM is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_CQHCI=y
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_MTK=y
# CONFIG_MMC_LITEX is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=y
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_88PM860X is not set
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_BCM6328=y
# CONFIG_LEDS_BCM6358 is not set
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
CONFIG_LEDS_LP5523=y
# CONFIG_LEDS_LP5562 is not set
CONFIG_LEDS_LP8501=y
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_WM8350=y
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_MAX77650 is not set
CONFIG_LEDS_MAX8997=y
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_OT200=y
# CONFIG_LEDS_IS31FL319X is not set
# CONFIG_LEDS_IS31FL32XX is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
CONFIG_LEDS_NIC78BX=y
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
CONFIG_LEDS_LM36274=y
CONFIG_LEDS_TPS6105X=y
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=y
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_KTD2692=y
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_RT4505 is not set
# CONFIG_LEDS_RT8515 is not set
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

CONFIG_INFINIBAND=y
CONFIG_INFINIBAND_USER_MAD=y
CONFIG_INFINIBAND_USER_ACCESS=y
CONFIG_INFINIBAND_USER_MEM=y
# CONFIG_INFINIBAND_ON_DEMAND_PAGING is not set
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_IPOIB is not set
CONFIG_INFINIBAND_SRPT=y
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
# CONFIG_HD44780 is not set
CONFIG_KS0108=y
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_CFAG12864B=y
CONFIG_CFAG12864B_RATE=20
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=y
# CONFIG_LCD2S is not set
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_PANEL=y
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=y
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
# CONFIG_UIO_MF624 is not set
# CONFIG_UIO_DFL is not set
# CONFIG_VFIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
CONFIG_COMEDI_ISA_DRIVERS=y
# CONFIG_COMEDI_PCL711 is not set
CONFIG_COMEDI_PCL724=y
# CONFIG_COMEDI_PCL726 is not set
CONFIG_COMEDI_PCL730=y
CONFIG_COMEDI_PCL812=y
# CONFIG_COMEDI_PCL816 is not set
CONFIG_COMEDI_PCL818=y
CONFIG_COMEDI_PCM3724=y
CONFIG_COMEDI_AMPLC_DIO200_ISA=y
# CONFIG_COMEDI_AMPLC_PC236_ISA is not set
CONFIG_COMEDI_AMPLC_PC263_ISA=y
CONFIG_COMEDI_RTI800=y
# CONFIG_COMEDI_RTI802 is not set
CONFIG_COMEDI_DAC02=y
CONFIG_COMEDI_DAS16M1=y
# CONFIG_COMEDI_DAS08_ISA is not set
CONFIG_COMEDI_DAS16=y
CONFIG_COMEDI_DAS800=y
CONFIG_COMEDI_DAS1800=y
CONFIG_COMEDI_DAS6402=y
CONFIG_COMEDI_DT2801=y
# CONFIG_COMEDI_DT2811 is not set
# CONFIG_COMEDI_DT2814 is not set
CONFIG_COMEDI_DT2815=y
CONFIG_COMEDI_DT2817=y
CONFIG_COMEDI_DT282X=y
# CONFIG_COMEDI_DMM32AT is not set
# CONFIG_COMEDI_FL512 is not set
CONFIG_COMEDI_AIO_AIO12_8=y
CONFIG_COMEDI_AIO_IIRO_16=y
# CONFIG_COMEDI_II_PCI20KC is not set
CONFIG_COMEDI_C6XDIGIO=y
# CONFIG_COMEDI_MPC624 is not set
CONFIG_COMEDI_ADQ12B=y
# CONFIG_COMEDI_NI_AT_A2150 is not set
CONFIG_COMEDI_NI_AT_AO=y
CONFIG_COMEDI_NI_ATMIO=y
CONFIG_COMEDI_NI_ATMIO16D=y
# CONFIG_COMEDI_NI_LABPC_ISA is not set
# CONFIG_COMEDI_PCMAD is not set
CONFIG_COMEDI_PCMDA12=y
# CONFIG_COMEDI_PCMMIO is not set
CONFIG_COMEDI_PCMUIO=y
# CONFIG_COMEDI_MULTIQ3 is not set
CONFIG_COMEDI_S526=y
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=y
CONFIG_COMEDI_CB_DAS16_CS=y
# CONFIG_COMEDI_DAS08_CS is not set
# CONFIG_COMEDI_NI_DAQ_700_CS is not set
CONFIG_COMEDI_NI_DAQ_DIO24_CS=y
CONFIG_COMEDI_NI_LABPC_CS=y
# CONFIG_COMEDI_NI_MIO_CS is not set
CONFIG_COMEDI_QUATECH_DAQP_CS=y
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=y
CONFIG_COMEDI_ISADMA=y
CONFIG_COMEDI_NI_LABPC=y
CONFIG_COMEDI_NI_TIO=y
CONFIG_COMEDI_NI_ROUTING=y
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH_PIPE is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_ACPI is not set
# CONFIG_CHROMEOS_PSTORE is not set
CONFIG_CHROMEOS_TBMC=y
# CONFIG_CROS_EC is not set
CONFIG_CROS_KBD_LED_BACKLIGHT=y
# CONFIG_CROS_HPS_I2C is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_OLPC_EC=y
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE_3_POWER_OPREGION is not set
CONFIG_SURFACE_ACPI_NOTIFY=y
# CONFIG_SURFACE_AGGREGATOR_CDEV is not set
# CONFIG_SURFACE_AGGREGATOR_HUB is not set
CONFIG_SURFACE_AGGREGATOR_REGISTRY=y
# CONFIG_SURFACE_AGGREGATOR_TABLET_SWITCH is not set
CONFIG_SURFACE_DTX=y
CONFIG_SURFACE_HOTPLUG=y
CONFIG_SURFACE_PLATFORM_PROFILE=y
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_SURFACE_AGGREGATOR=y
CONFIG_SURFACE_AGGREGATOR_BUS=y
# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACPI_WMI is not set
CONFIG_ACERHDF=y
CONFIG_ACER_WIRELESS=y
CONFIG_ADV_SWBUTTON=y
# CONFIG_APPLE_GMUX is not set
CONFIG_ASUS_LAPTOP=y
CONFIG_ASUS_WIRELESS=y
# CONFIG_ASUS_TF103C_DOCK is not set
CONFIG_X86_PLATFORM_DRIVERS_DELL=y
# CONFIG_DCDBAS is not set
# CONFIG_DELL_RBU is not set
CONFIG_DELL_RBTN=y
CONFIG_DELL_SMBIOS=y
# CONFIG_DELL_SMO8800 is not set
CONFIG_AMILO_RFKILL=y
CONFIG_FUJITSU_LAPTOP=y
CONFIG_FUJITSU_TABLET=y
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
CONFIG_WIRELESS_HOTKEY=y
# CONFIG_IBM_RTL is not set
# CONFIG_IDEAPAD_LAPTOP is not set
CONFIG_SENSORS_HDAPS=y
# CONFIG_INTEL_ATOMISP2_LED is not set
CONFIG_INTEL_SAR_INT1092=y
# CONFIG_INTEL_SKL_INT3472 is not set
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_INTEL_HID_EVENT is not set
CONFIG_INTEL_VBTN=y
CONFIG_INTEL_INT0002_VGPIO=y
# CONFIG_INTEL_OAKTRAIL is not set
CONFIG_INTEL_BXTWC_PMIC_TMU=y
CONFIG_INTEL_MRFLD_PWRBTN=y
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=y
CONFIG_INTEL_SMARTCONNECT=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=y
# CONFIG_XO15_EBOOK is not set
CONFIG_XO1_RFKILL=y
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=y
CONFIG_SAMSUNG_Q10=y
CONFIG_TOSHIBA_BT_RFKILL=y
CONFIG_TOSHIBA_HAPS=y
# CONFIG_ACPI_CMPC is not set
CONFIG_PANASONIC_LAPTOP=y
# CONFIG_SONY_LAPTOP is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_MLX_PLATFORM is not set
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
# CONFIG_INTEL_SCU_PCI is not set
CONFIG_INTEL_SCU_PLATFORM=y
CONFIG_INTEL_SCU_IPC_UTIL=y
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_RK808 is not set
CONFIG_COMMON_CLK_SI5341=y
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI514=y
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_SI570=y
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_CLK_TWL6040=y
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_COMMON_CLK_RS9_PCIE is not set
# CONFIG_COMMON_CLK_SI521XX is not set
CONFIG_COMMON_CLK_VC5=y
# CONFIG_COMMON_CLK_VC7 is not set
CONFIG_COMMON_CLK_BD718XX=y
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#
# CONFIG_SOUNDWIRE_AMD is not set
CONFIG_SOUNDWIRE_CADENCE=y
CONFIG_SOUNDWIRE_INTEL=y
CONFIG_SOUNDWIRE_QCOM=y
CONFIG_SOUNDWIRE_GENERIC_ALLOCATION=y

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
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

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
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_INTEL_MRFLD=y
CONFIG_EXTCON_MAX14577=y
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_FPGA_DFL_EMIF=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
# CONFIG_IIO_SW_TRIGGER is not set
# CONFIG_IIO_TRIGGERED_EVENT is not set

#
# Accelerometers
#
# CONFIG_ADXL313_I2C is not set
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
# CONFIG_ADXL355_I2C is not set
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
CONFIG_DA311=y
CONFIG_DMARD06=y
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
# CONFIG_HID_SENSOR_ACCEL_3D is not set
# CONFIG_IIO_KX022A_I2C is not set
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
# CONFIG_MSA311 is not set
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
CONFIG_STK8312=y
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=y
# CONFIG_AD7291 is not set
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
CONFIG_AD799X=y
CONFIG_ADI_AXI_ADC=y
# CONFIG_CC10001_ADC is not set
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_HX711=y
CONFIG_INA2XX_ADC=y
# CONFIG_INTEL_MRFLD_ADC is not set
CONFIG_LP8788_ADC=y
# CONFIG_LTC2471 is not set
CONFIG_LTC2485=y
CONFIG_LTC2497=y
CONFIG_MAX1363=y
# CONFIG_MAX9611 is not set
CONFIG_MCP3422=y
CONFIG_MP2629_ADC=y
# CONFIG_NAU7802 is not set
CONFIG_QCOM_VADC_COMMON=y
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=y
CONFIG_QCOM_SPMI_ADC5=y
# CONFIG_RN5T618_ADC is not set
# CONFIG_RICHTEK_RTQ6056 is not set
# CONFIG_SD_ADC_MODULATOR is not set
CONFIG_TI_ADC081C=y
CONFIG_TI_ADS1015=y
# CONFIG_TI_ADS7924 is not set
# CONFIG_TI_ADS1100 is not set
# CONFIG_VF610_ADC is not set
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# CONFIG_STX104 is not set
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
# CONFIG_ATLAS_EZO_SENSOR is not set
CONFIG_BME680=y
CONFIG_BME680_I2C=y
CONFIG_CCS811=y
CONFIG_IAQCORE=y
CONFIG_PMS7003=y
CONFIG_SCD30_CORE=y
# CONFIG_SCD30_I2C is not set
CONFIG_SCD30_SERIAL=y
# CONFIG_SCD4X is not set
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
CONFIG_SPS30_SERIAL=y
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
CONFIG_AD5380=y
CONFIG_AD5446=y
# CONFIG_AD5593R is not set
# CONFIG_AD5696_I2C is not set
CONFIG_CIO_DAC=y
CONFIG_DPOT_DAC=y
# CONFIG_DS4424 is not set
CONFIG_M62332=y
CONFIG_MAX517=y
CONFIG_MAX5821=y
CONFIG_MCP4725=y
CONFIG_TI_DAC5571=y
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_SIMPLE_DUMMY=y
# CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
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
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
# CONFIG_FXAS21002C is not set
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
# CONFIG_DHT11 is not set
CONFIG_HDC100X=y
CONFIG_HDC2010=y
# CONFIG_HID_SENSOR_HUMIDITY is not set
# CONFIG_HTS221 is not set
CONFIG_HTU21=y
CONFIG_SI7005=y
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
# CONFIG_BOSCH_BNO055_SERIAL is not set
# CONFIG_BOSCH_BNO055_I2C is not set
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_KMX61=y
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ACPI_ALS=y
CONFIG_ADJD_S311=y
CONFIG_ADUX1020=y
CONFIG_AL3010=y
CONFIG_AL3320A=y
# CONFIG_APDS9300 is not set
CONFIG_APDS9960=y
# CONFIG_AS73211 is not set
CONFIG_BH1750=y
CONFIG_BH1780=y
CONFIG_CM32181=y
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
CONFIG_CM3605=y
CONFIG_CM36651=y
# CONFIG_GP2AP002 is not set
CONFIG_GP2AP020A00F=y
CONFIG_IQS621_ALS=y
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=y
# CONFIG_HID_SENSOR_ALS is not set
# CONFIG_HID_SENSOR_PROX is not set
# CONFIG_JSA1212 is not set
# CONFIG_ROHM_BU27034 is not set
CONFIG_RPR0521=y
CONFIG_LTR501=y
# CONFIG_LTRF216A is not set
CONFIG_LV0104CS=y
# CONFIG_MAX44000 is not set
CONFIG_MAX44009=y
CONFIG_NOA1305=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
CONFIG_SI1133=y
# CONFIG_SI1145 is not set
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=y
CONFIG_TCS3472=y
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=y
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=y
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=y
CONFIG_VCNL4035=y
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_MAG3110=y
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_TI_TMAG5273 is not set
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=y
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
CONFIG_IQS624_POS=y
CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=y
CONFIG_MCP4018=y
CONFIG_MCP4531=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=y
# CONFIG_DPS310 is not set
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_HP03=y
# CONFIG_ICP10100 is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
# CONFIG_MPL3115 is not set
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
# CONFIG_T5403 is not set
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
CONFIG_SRF04=y
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
CONFIG_SX9500=y
CONFIG_SRF08=y
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
# CONFIG_HID_SENSOR_TEMP is not set
CONFIG_MLX90614=y
CONFIG_MLX90632=y
CONFIG_TMP006=y
CONFIG_TMP007=y
CONFIG_TMP117=y
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
# CONFIG_MAX30208 is not set
# end of Temperature sensors

# CONFIG_NTB is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
# CONFIG_XILINX_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_INTEL_GW=y
# CONFIG_RESET_SIMPLE is not set
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_TI_TPS380X is not set

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

# CONFIG_PHY_CADENCE_TORRENT is not set
# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=y
# CONFIG_PHY_CADENCE_SALVO is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_LAN966X_SERDES is not set
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
CONFIG_PHY_OCELOT_SERDES=y
# CONFIG_PHY_INTEL_LGM_COMBO is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_IDLE_INJECT=y
# CONFIG_DTPM is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

# CONFIG_NVMEM_RAVE_SP_EEPROM is not set
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_SPMI_SDAM=y

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=y
# CONFIG_STM_SOURCE_CONSOLE is not set
# CONFIG_STM_SOURCE_HEARTBEAT is not set
# CONFIG_STM_SOURCE_FTRACE is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
CONFIG_INTEL_TH_ACPI=y
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_STH=y
# CONFIG_INTEL_TH_MSU is not set
CONFIG_INTEL_TH_PTI=y
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_ALTERA_PR_IP_CORE_PLAT=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
CONFIG_OF_FPGA_REGION=y
CONFIG_FPGA_DFL=y
CONFIG_FPGA_DFL_AFU=y
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=y
# CONFIG_FPGA_DFL_PCI is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
CONFIG_FSI_MASTER_GPIO=y
CONFIG_FSI_MASTER_HUB=y
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_SCOM=y
CONFIG_FSI_SBEFIFO=y
# CONFIG_FSI_OCC is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
# CONFIG_MUX_MMIO is not set
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
CONFIG_INTERCONNECT=y
# CONFIG_COUNTER is not set
CONFIG_MOST=y
CONFIG_MOST_CDEV=y
CONFIG_MOST_SND=y
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
# CONFIG_XFS_SUPPORT_V4 is not set
CONFIG_XFS_SUPPORT_ASCII_CI=y
CONFIG_XFS_QUOTA=y
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
CONFIG_XFS_DRAIN_INTENTS=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=y
CONFIG_OCFS2_FS=y
CONFIG_OCFS2_FS_O2CB=y
CONFIG_OCFS2_FS_STATS=y
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
CONFIG_BTRFS_FS_REF_VERIFY=y
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_ZONEFS_FS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
# CONFIG_NETFS_STATS is not set
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=y
CONFIG_CACHEFILES_DEBUG=y
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
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
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
CONFIG_NTFS_DEBUG=y
CONFIG_NTFS_RW=y
CONFIG_NTFS3_FS=y
CONFIG_NTFS3_LZX_XPRESS=y
# CONFIG_NTFS3_FS_POSIX_ACL is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_LSM_MMAP_MIN_ADDR=65536
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
CONFIG_SECURITY_SMACK=y
# CONFIG_SECURITY_SMACK_BRINGUP is not set
CONFIG_SECURITY_SMACK_APPEND_SIGNALS=y
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
# CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER is not set
CONFIG_SECURITY_TOMOYO_POLICY_LOADER="/sbin/tomoyo-init"
CONFIG_SECURITY_TOMOYO_ACTIVATION_TRIGGER="/sbin/init"
# CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_DEBUG=y
CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS=y
CONFIG_SECURITY_APPARMOR_DEBUG_MESSAGES=y
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
# CONFIG_SECURITY_APPARMOR_HASH is not set
CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y
CONFIG_SECURITY_APPARMOR_PARANOID_LOAD=y
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_EVM=y
# CONFIG_EVM_ATTR_FSUUID is not set
CONFIG_EVM_EXTRA_SMACK_XATTRS=y
CONFIG_EVM_ADD_XATTRS=y
# CONFIG_DEFAULT_SECURITY_SELINUX is not set
# CONFIG_DEFAULT_SECURITY_SMACK is not set
# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_GCC_PLUGIN_STACKLEAK=y
# CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE is not set
CONFIG_STACKLEAK_TRACK_MIN_SIZE=100
# CONFIG_STACKLEAK_METRICS is not set
# CONFIG_STACKLEAK_RUNTIME_DISABLE is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
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
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
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
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=y
# CONFIG_CRYPTO_CCM is not set
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_VMAC is not set
CONFIG_CRYPTO_WP512=y
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_STATS=y
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_SERPENT_SSE2_586=y
CONFIG_CRYPTO_TWOFISH_586=y
CONFIG_CRYPTO_CRC32C_INTEL=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
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
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
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
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
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
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
CONFIG_CMA_SIZE_SEL_PERCENTAGE=y
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONT_8x16=y
CONFIG_FONT_AUTOSELECT=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
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
CONFIG_SYMBOLIC_ERRNAME=y
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
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_VMLINUX_MAP is not set
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
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
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
# CONFIG_SLUB_DEBUG is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
CONFIG_PTDUMP_DEBUGFS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
CONFIG_DEBUG_OBJECTS_WORK=y
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
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
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
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

# CONFIG_DEBUG_TIMEKEEPING is not set
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
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
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
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
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
# CONFIG_BLK_DEV_IO_TRACE is not set
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
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
CONFIG_SAMPLE_AUXDISPLAY=y
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
CONFIG_SAMPLE_WATCHDOG=y
# CONFIG_SAMPLE_KMEMLEAK is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_PM_NOTIFIER_ERROR_INJECT=y
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
CONFIG_FAIL_IO_TIMEOUT=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
# CONFIG_FAULT_INJECTION_CONFIGFS is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DYNAMIC_DEBUG is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--GqVfbZ+TKO1Nn9Yc
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
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='cel/topic-shmem-stable-dir-cookies'
	export commit='3d84f19334fc2f70310ebaf8926fc5fdd90dec69'
	export kconfig='i386-randconfig-i056-20230531'
	export repeat_to=6
	export nr_vm=300
	export submit_id='6479ef913f3acc272f12b7c3'
	export job_file='/lkp/jobs/scheduled/vm-meta-45/boot-1-debian-11.1-i386-20220923.cgz-3d84f19334fc2f70310ebaf8926fc5fdd90dec69-20230602-75567-8da9gs-4.yaml'
	export id='166dec7d8189b23ca9659a88fb9b56b70643e8f9'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='gcc-12'
	export enqueue_time='2023-06-02 21:33:06 +0800'
	export _id='6479efa73f3acc272f12b7c5'
	export _rt='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i056-20230531/gcc-12/3d84f19334fc2f70310ebaf8926fc5fdd90dec69'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i056-20230531/gcc-12/3d84f19334fc2f70310ebaf8926fc5fdd90dec69/3'
	export scheduler_version='/lkp/lkp/.src-20230602-160545'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i056-20230531/gcc-12/3d84f19334fc2f70310ebaf8926fc5fdd90dec69/3
BOOT_IMAGE=/pkg/linux/i386-randconfig-i056-20230531/gcc-12/3d84f19334fc2f70310ebaf8926fc5fdd90dec69/vmlinuz-6.4.0-rc4-00003-g3d84f19334fc
branch=cel/topic-shmem-stable-dir-cookies
job=/lkp/jobs/scheduled/vm-meta-45/boot-1-debian-11.1-i386-20220923.cgz-3d84f19334fc2f70310ebaf8926fc5fdd90dec69-20230602-75567-8da9gs-4.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-i056-20230531
commit=3d84f19334fc2f70310ebaf8926fc5fdd90dec69
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
	export modules_initrd='/pkg/linux/i386-randconfig-i056-20230531/gcc-12/3d84f19334fc2f70310ebaf8926fc5fdd90dec69/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export stop_repeat_if_found='dmesg.include/linux/xarray.h:#suspicious_rcu_dereference_check()usage'
	export kbuild_queue_analysis=1
	export meta_host='vm-meta-45'
	export kernel='/pkg/linux/i386-randconfig-i056-20230531/gcc-12/3d84f19334fc2f70310ebaf8926fc5fdd90dec69/vmlinuz-6.4.0-rc4-00003-g3d84f19334fc'
	export dequeue_time='2023-06-02 21:33:41 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-45/boot-1-debian-11.1-i386-20220923.cgz-3d84f19334fc2f70310ebaf8926fc5fdd90dec69-20230602-75567-8da9gs-4.cgz'

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

--GqVfbZ+TKO1Nn9Yc
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
h+Fgu7HEZ/sCAAAAAARZWg==

--GqVfbZ+TKO1Nn9Yc--
