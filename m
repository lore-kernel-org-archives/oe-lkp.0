Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE511FAF
	for <oe-lkp@lists.linux.dev>; Sun,  8 Jan 2023 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673168729; x=1704704729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bWleu3q8u2A2Sg8k3axcMNoKfYkLFCiw5ba7E2HZio=;
  b=VlG0V0pSShFap49A3r18z1VH7ZRKoh8ksPSUBwrR/qaylQivdUJ/Hqbe
   e5XMJb1K0wnAGz7iPkNoHiOOnYu4nGuk8C0wmcz7jDiNUuV9hPT/dgumN
   BBfWHmdSvACj/ks1JBgc8/gERgCuyXIgLXJju07ca5JzjjM3IOTHQ72cP
   JkxRD+uEfzBw+Zo+nKFBlQfDCihKCyWqU1bSglbLpb44vI0QuXNWyPCsQ
   Td88SZQGbvwIOyMIojv9MKylBYUkM6RiWpYxJoyuJwto15KcGybbkU01M
   ePpZFO79o0v+yX4fn6t9S9g3ZoILOrcuG+AIrjXm0KKfwsS5MT+lXDDiS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="323952319"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="xz'?yaml'?scan'208";a="323952319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 01:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="688727079"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="xz'?yaml'?scan'208";a="688727079"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2023 01:05:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 8 Jan 2023 01:05:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 8 Jan 2023 01:05:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 8 Jan 2023 01:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUQZoYrjVTRjJXDQe5DKHG4gJvlYDe+jwlPbohzfj983wbrbaWy0uivN87yolkxMqNIJ9oMRA6cT4/1UQUFKUp/MFNid8578wCD2xQEPYGpXTVrTacY2LgnYflmPiyXE4iCQGbU1CgSo7Q1r6gqMY9aG73CufUmrxsxxZwa9inKQuMwc2XTidtvZzLGuxK5FTdM5N07SU9SOhQOxAfxq20eWRo8X24K3ooDXmRor9s60UFWOHeA8sSdXM485xhe/aXlYpy44ZCu40MpYQnNKBlbqhrKv+Kal59+BIzEmUU4EfXeplDJ1xLj76SWYw+q/VI4fDNvLWJFrHmy9HS2vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6SiSZGH5avhJ+MIP/0yLsHq7TY0I5GXaT5rGgCPD+M=;
 b=XYvepUxSfk3xeGMPOu98yLKc6XDHOpioUZLK28Jtsi0klsK2RSQecYu4bzPk6OTmwgIxYs8hggN7ilLYTuw+zjR1/K9Fo8KhQnyL52VqSktcSUR1n9Qjuse12ep4zW/smw6WTqk6w89OnpRRYp4y1vTZiDUTbY2ltCdQXAJ61ZspXaDCxRIUCyhRo5Jtl78ACJKTQVRddq3PXNkvcfd4h6tZElgmx5ejjBdM+lVW8x+jzIAcRXHsh1xtmDBLW5wGAwsTjE7mj05d9FRY3RCFcARXsDu3X03GWQhJ0FSEnaysQtMfbsoTwFSz5AItBAZToPrpWBaJ+Un5dxsh2HEkGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Sun, 8 Jan 2023 09:05:17 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::fb8:ef5c:625b:725c]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::fb8:ef5c:625b:725c%9]) with mapi id 15.20.5986.018; Sun, 8 Jan 2023
 09:05:17 +0000
Date: Sun, 8 Jan 2023 17:03:16 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: [peterz-queue:sched/idle] [trace,hardirq] d0067447fa:
 WARNING:suspicious_RCU_usage
Message-ID: <202301081615.bae9b833-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="viJYB+6GwMZTqtAj"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e13528-374c-48dc-5738-08daf157754f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWRA6o/ee2+R/0yQzv3oMo3OajB1hXZ/XUXPQp/YoqalBFK7soSD10x/Tf0tkeb8DKF0PzXwj667NmbZxayoR5YIEau+RJglNP3zFJFR6Eql4xFJXmijI8iCa7j8JE6+2jDkjDjubfDVBcFJ/CZO7j7JdirV//THO50QgTn5tnBhSxeRCX8yGnHz8T/hfFnqvLIo8CULsySoyArq5Z0mAcFy+dM2zFaQmFsoP+1WysutazJymJYGzhtzR47U8fh6aP7AszmNq/UvmTwllGHzeSeCauhrpkYz2ni6ldfMwWj6QrY9ze4cQwy9Qj8BAXRTOZ4j2M2oIRb526LG/rMVLS6KjxWcjyk2ARN0lozYYXM6jyuJOzlLq8tLe7T6i4dzq9nsj3HEP4enXkHL1TvkGx33lMnGAjt7hB6a/KuDP58+MYBUbwqdZrBq/Pbzw+Akg5Z7yAQN3qSPJfgq2jPIEdHvJqODQwg/SdMxH1FIDra+XMlR1G4DL6DIZ257GKV8spfHKCoDY3/gqnqcxNNggESNmLlSTaMF5VenulmHIIsS6yQu6I0TL/DCIqH7tX5D1/Tcyg52T1Q2F1bEmVSi/ANcDu1tll2quPVo4NuS5FKfJMFZzG5EFRmsHnA+XPX1U1Xz3jD8P9pmvyMLw1U1sknZG6aAkeZEvZH1B/8SQlCI0+Aztz8Gr5Q7efFhOqIrfsDEy29xmbOarsEox2oZUOzQeMMDpWWE6b5QP2ixg34txC/J500yIbOh8wHCG7DPFcf+KmSNB9WNY7UvcuEUAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(1076003)(30864003)(5660300002)(316002)(235185007)(186003)(6512007)(26005)(966005)(6486002)(478600001)(2616005)(41300700001)(45080400002)(66946007)(66556008)(66476007)(4326008)(6916009)(8676002)(83380400001)(8936002)(21490400003)(86362001)(36756003)(107886003)(6506007)(44144004)(82960400001)(38100700002)(2906002)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5srj6CxiwkamKIIlhLYlT1QuFGpk7thKxoZtR7pmBclDXYuki8bAUtynEWFi?=
 =?us-ascii?Q?gIGBKc4wDekdB9+gAUJDPVtmgy0LOzopUyrhJHMgWdKRzDExpd6nJRP38kZJ?=
 =?us-ascii?Q?OECzy/beLcF8zJQWX0UlS71gxyRsPoXcD/Cw8YXLBg0sRkL6cfSL1BIiwduC?=
 =?us-ascii?Q?ms4f6tnJQPnGx/4xh7303XBlBTd3fue4ZfsKSP5hvTI70HbLDeF1BLH9autW?=
 =?us-ascii?Q?U3Umz+RgD32EseV83kAIYN36UOlnphsudG3w0znbmtcjhGtSVGccaTu4MlJO?=
 =?us-ascii?Q?RnQGKDwd/23yPw0PrjJX3Km0ppptugo3iuasq7/O5UWND92BxO7vQaCVjwLv?=
 =?us-ascii?Q?gE7ZXE/7g7bnS0/hXFY4+sRtK+AEcdClWFkRgjhmBEa4bCLkucsBkwOI9FjV?=
 =?us-ascii?Q?t8HeAcC3Ja6KyYWZrTgyql8VN6FcF8spUyPDaVM+xIPlsGd9xwfCV9i3M/V5?=
 =?us-ascii?Q?GKsYoWSHgn1AsBgbXLuQdCuTWeuy1iKcJtkVlXdgDLKnCAQqhU6LiuN/vYm/?=
 =?us-ascii?Q?aiZ4606mJOMDNJ+6b1q9Cuq7r/TnBg8NMHWykTpIkWBCdTSvuQrl/yVqilJs?=
 =?us-ascii?Q?YCO+NhTAmzvU+PuLpYzczr1e4niGQF2GCDGDuzgpWnl9UE9sEp6quwkzdR0c?=
 =?us-ascii?Q?QTEvUeTELYTCSrU/tRpyngBZvxfP57wZWXeZXouIhotrKDXG1R8OX3imVNzS?=
 =?us-ascii?Q?boiGmfKmvCPHpVeBnS1wAffRHqibYano5yahfyz9rrkNx8Ls6OxpayKthDMV?=
 =?us-ascii?Q?YYFpznfAi119flChE4pm3gi0Vh8Y7J8Sp3jDzzNjUAHr6x6bn+5Vdfv19+dX?=
 =?us-ascii?Q?M+oNzAhQs2G0BfAcc//pcL6PO+TIr9rfZx4zl9Y0x4Ov+iAc99V4FbpUa5Bm?=
 =?us-ascii?Q?AwmBj4BpZa4GHibwIkNo7KKgpskoEgZeJWt9/mY9P4XVlryJ8Ifp08FN1x8t?=
 =?us-ascii?Q?CkIdQ4PVFqVzdLJqfXMIcv/LSamP7mgvMbCMLv4UZ/QMLq1Vd6blBbsGIE9J?=
 =?us-ascii?Q?Ai6/7nHmLY69iUunZ1XJqaZnWVrttwJijDZqzdj0G9uIJT4e/LQ20LA6iUU7?=
 =?us-ascii?Q?5Y5U2RLIBksn1y7XfW2vG09VkgZn2vHjPYjQIFZNNohafeu1jJdMhG8Nc6zI?=
 =?us-ascii?Q?PU88FNTGzYbnd3dY7SBt3lVOK3dxSXiEoGh1CFvW7hzZzjz85Q9r4+OVgIAG?=
 =?us-ascii?Q?1USykW5pv45hj4/iBWXu5NkTiJn/bquXgWPP1Bhh+aNMvbph8vwEZFlWijsQ?=
 =?us-ascii?Q?tvLMc8BZOrrbA/YoXN+1cMhPNTn963DkS1h+iXjrmg3/PGE6DYn9LCH5ewri?=
 =?us-ascii?Q?yiXlTh+1ayTCtxRT9pz9GGBvO8deA6Yl3PKza9PRAzZ7RcTA5Typ0G8gqbRL?=
 =?us-ascii?Q?AbgljpizL8hhoDrQbsWn3yDpvNSla0n2bYXyhn3ELF9Z/LfM1iwTWZ4tQ1Tz?=
 =?us-ascii?Q?DuUFZniGUeBOYWBAgGnB3xCjnnDhwEZ0GR0K5+YqSyAO941gKgcL8qE3UZ4H?=
 =?us-ascii?Q?UezdBbA12+JQ9q/YF3sJnbTrYp2PWOd9+nu8m7fWXaTk3FH7jqewmnhY59IY?=
 =?us-ascii?Q?HtPvYWUbEb0OKj79DxBXVwjgSJfsi3y7BJE4Eslt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e13528-374c-48dc-5738-08daf157754f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 09:05:16.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BiBk86IjRUsud2aKcmNQDJdSfM77BowscsZ1lEnX/LK6GUgKa7trRDQU0zFxA6p3krh8Mph/Rxr3jkZ7zqsQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
X-OriginatorOrg: intel.com

--viJYB+6GwMZTqtAj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Greeting,

FYI, we noticed WARNING:suspicious_RCU_usage due to commit (built with gcc-11):

commit: d0067447fa5bdd65ec4f7a5737581362641f7611 ("trace,hardirq: No moar _rcuidle() tracing")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/idle

in testcase: kernel-selftests
version: kernel-selftests-x86_64-2ed09c3b-1_20221128
with following parameters:

	group: ftrace

test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
test-url: https://www.kernel.org/doc/Documentation/kselftest.txt

on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


[  136.210797][    T0] WARNING: suspicious RCU usage
[  136.210812][    T0] 6.2.0-rc1-00035-gd0067447fa5b #1 Not tainted
[  136.210828][    T0] -----------------------------
[  136.210843][    T0] include/trace/events/lock.h:24 suspicious rcu_dereference_check() usage!
[  136.210858][    T0]
[  136.210858][    T0] other info that might help us debug this:
[  136.210858][    T0]
[  136.210874][    T0]
[  136.210874][    T0] rcu_scheduler_active = 2, debug_locks = 1
[  136.210890][    T0] RCU used illegally from extended quiescent state!
[  136.210904][    T0] no locks held by swapper/3/0.
[  136.210934][    T0]
[  136.210934][    T0] stack backtrace:
[  136.210952][    T0] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
[  136.210983][    T0] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[  136.211001][    T0] Call Trace:
[  136.211028][    T0]  <TASK>
[ 136.211118][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.211147][ T0] dump_stack_lvl (??:?) 
[ 136.211216][ T0] lock_acquire.cold (lockdep.c:?) 
[ 136.211323][ T0] ? rcu_read_unlock (main.c:?) 
[  136.211443][    T0] ------------[ cut here ]------------
[ 136.211457][ T0] WARNING: CPU: 3 PID: 0 at kernel/module/internal.h:115 __module_address (??:?) 
[  136.211486][    T0] Modules linked in: openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 btrfs blake2b_generic xor intel_rapl_msr raid6_pq intel_rapl_common zstd_compress libcrc32c x86_pkg_temp_thermal intel_powerclamp coretemp sd_mod t10_pi kvm_intel crc64_rocksoft_generic crc64_rocksoft crc64 kvm sg irqbypass i915 crct10dif_pclmul crc32_pclmul drm_buddy crc32c_intel ghash_clmulni_intel drm_display_helper mei_wdt ahci sha512_ssse3 ttm libahci rapl wmi_bmof ipmi_devintf intel_cstate drm_kms_helper libata mei_me i2c_i801 syscopyarea intel_uncore ipmi_msghandler i2c_smbus sysfillrect serio_raw intel_pch_thermal mei sysimgblt intel_gtt ie31200_edac agpgart video wmi intel_pmc_core tpm_infineon acpi_pad binfmt_misc drm fuse ip_tables [last unloaded: ftrace_direct]
[  136.212580][    T0] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
[  136.212597][    T0] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[ 136.212615][ T0] RIP: 0010:__module_address (??:?) 
[ 136.212645][ T0] Code: 01 00 00 48 01 ea 48 39 d3 0f 82 69 ff ff ff 0f 0b be ff ff ff ff 48 c7 c7 e8 5b 1f 85 e8 36 2b 51 02 85 c0 0f 85 d1 fe ff ff <0f> 0b e9 ca fe ff ff 48 83 c4 08 31 c0 5b 5d c3 48 c7 c7 4c d0 ac
All code
========
   0:	01 00                	add    %eax,(%rax)
   2:	00 48 01             	add    %cl,0x1(%rax)
   5:	ea                   	(bad)  
   6:	48 39 d3             	cmp    %rdx,%rbx
   9:	0f 82 69 ff ff ff    	jb     0xffffffffffffff78
   f:	0f 0b                	ud2    
  11:	be ff ff ff ff       	mov    $0xffffffff,%esi
  16:	48 c7 c7 e8 5b 1f 85 	mov    $0xffffffff851f5be8,%rdi
  1d:	e8 36 2b 51 02       	callq  0x2512b58
  22:	85 c0                	test   %eax,%eax
  24:	0f 85 d1 fe ff ff    	jne    0xfffffffffffffefb
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	e9 ca fe ff ff       	jmpq   0xfffffffffffffefb
  31:	48 83 c4 08          	add    $0x8,%rsp
  35:	31 c0                	xor    %eax,%eax
  37:	5b                   	pop    %rbx
  38:	5d                   	pop    %rbp
  39:	c3                   	retq   
  3a:	48                   	rex.W
  3b:	c7                   	.byte 0xc7
  3c:	c7                   	(bad)  
  3d:	4c                   	rex.WR
  3e:	d0                   	.byte 0xd0
  3f:	ac                   	lods   %ds:(%rsi),%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e9 ca fe ff ff       	jmpq   0xfffffffffffffed1
   7:	48 83 c4 08          	add    $0x8,%rsp
   b:	31 c0                	xor    %eax,%eax
   d:	5b                   	pop    %rbx
   e:	5d                   	pop    %rbp
   f:	c3                   	retq   
  10:	48                   	rex.W
  11:	c7                   	.byte 0xc7
  12:	c7                   	(bad)  
  13:	4c                   	rex.WR
  14:	d0                   	.byte 0xd0
  15:	ac                   	lods   %ds:(%rsi),%al
[  136.212663][    T0] RSP: 0018:ffffc9000018eb10 EFLAGS: 00010046
[  136.212692][    T0] RAX: 0000000000000000 RBX: ffffffffa027e086 RCX: 0000000000000001
[  136.212708][    T0] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffffffff851f5be8
[  136.212723][    T0] RBP: ffffffffa027e086 R08: 0000000000000000 R09: ffff8883aa7bfa83
[  136.212739][    T0] R10: ffffed10754f7f50 R11: ffff88812ac63190 R12: ffffc9000018ec00
[  136.212754][    T0] R13: ffffffffa027e086 R14: ffffc9000018ec40 R15: ffffc9000018ec20
[  136.212770][    T0] FS:  0000000000000000(0000) GS:ffff8883aa780000(0000) knlGS:0000000000000000
[  136.212786][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  136.212801][    T0] CR2: 0000560366a55000 CR3: 000000043cc2a003 CR4: 00000000003706e0
[  136.212817][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  136.212832][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  136.212848][    T0] Call Trace:
[  136.212871][    T0]  <TASK>
[  136.212942][    T0]
[  136.212957][    T0] =============================
[  136.212972][    T0] WARNING: suspicious RCU usage
[  136.212988][    T0] 6.2.0-rc1-00035-gd0067447fa5b #1 Not tainted
[  136.213003][    T0] -----------------------------
[  136.213018][    T0] include/linux/rcupdate.h:765 rcu_read_lock() used illegally while idle!
[  136.213034][    T0]
[  136.213034][    T0] other info that might help us debug this:
[  136.213034][    T0]
[  136.213050][    T0]
[  136.213050][    T0] rcu_scheduler_active = 2, debug_locks = 1
[  136.213065][    T0] RCU used illegally from extended quiescent state!
[  136.213080][    T0] 1 lock held by swapper/3/0:
[ 136.213096][ T0] #0: ffffffff85125e40 (rcu_read_lock){....}-{1:2}, at: __bpf_address_lookup (??:?) 
[  136.213198][    T0]
[  136.213198][    T0] stack backtrace:
[  136.213216][    T0] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
[  136.213232][    T0] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[  136.213249][    T0] Call Trace:
[  136.213276][    T0]  <TASK>
[ 136.213366][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.213388][ T0] dump_stack_lvl (??:?) 
[  136.213422][    T0]  ? 0xffffffffa027e085
[ 136.218789][ T0] __bpf_address_lookup (??:?) 
[  136.218888][    T0]  ? 0xffffffffa027e085
[ 136.218994][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.219016][ T0] kallsyms_lookup_buildid (kallsyms.c:?) 
[  136.219104][    T0]  ? 0xffffffffa027e086
[ 136.219191][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.219213][ T0] __sprint_symbol+0xae/0x1c0 
[ 136.219242][ T0] ? prepare_ftrace_return (??:?) 
[ 136.219303][ T0] ? kallsyms_lookup_buildid (kallsyms.c:?) 
[  136.219408][    T0]  ? 0xffffffffa027e087
[ 136.219458][ T0] ? ftrace_return_to_handler (??:?) 
[  136.219692][    T0]  ? 0xffffffffa027e086
[ 136.219871][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.219893][ T0] symbol_string (vsprintf.c:?) 
[ 136.219996][ T0] ? ip6_addr_string (vsprintf.c:?) 
[ 136.220127][ T0] ? __rb_reserve_next (ring_buffer.c:?) 
[ 136.220528][ T0] ? __rb_reserve_next (ring_buffer.c:?) 
[ 136.220866][ T0] ? ring_buffer_lock_reserve (??:?) 
[ 136.221151][ T0] ? __rb_reserve_next (ring_buffer.c:?) 
[ 136.221361][ T0] ? __rb_reserve_next (ring_buffer.c:?) 
[ 136.221630][ T0] ? __rb_reserve_next (ring_buffer.c:?) 
[ 136.221942][ T0] ? move_right (vsprintf.c:?) 
[  136.222170][    T0]  ? 0xffffffffa027e086
[ 136.222219][ T0] pointer (vsprintf.c:?) 
[ 136.222368][ T0] ? resource_string+0x1590/0x1590 
[ 136.222448][ T0] ? rb_commit (ring_buffer.c:?) 
[ 136.222686][ T0] vsnprintf (??:?) 
[ 136.222876][ T0] ? pointer (??:?) 
[ 136.222971][ T0] ? __trace_graph_entry (??:?) 
[ 136.223175][ T0] vprintk_store (??:?) 
[ 136.223342][ T0] ? ftrace_graph_stop (??:?) 
[ 136.223403][ T0] ? printk_sprint (??:?) 
[ 136.223427][ T0] ? vprintk (??:?) 
[ 136.223590][ T0] ? vprintk_store (??:?) 
[ 136.223667][ T0] ? prepare_ftrace_return (??:?) 
[  136.223786][    T0]  ? 0xffffffffa027e086
[  136.223840][    T0]  ? 0xffffffffa027e087
[  136.224244][    T0]  ? 0xffffffffa027e086
[ 136.224304][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.224326][ T0] vprintk (??:?) 
[ 136.224370][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.224391][ T0] _printk (??:?) 
[ 136.224455][ T0] ? record_print_text.cold (??:?) 
[  136.224680][    T0]  ? 0xffffffffa027e086
[  136.224805][    T0]  ? 0xffffffffa027e086
[ 136.224907][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.224928][ T0] show_trace_log_lvl (dumpstack.c:?) 
[  136.224998][    T0]  ? 0xffffffffa027e086
[  136.225330][    T0]  ? 0xffffffffa027e086
[ 136.225362][ T0] ? module_address_lookup (??:?) 
[ 136.225512][ T0] ? __module_address (??:?) 
[ 136.225574][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.225595][ T0] __warn (??:?) 
[ 136.225677][ T0] ? __module_address (??:?) 
[ 136.225756][ T0] ? ftrace_regs_caller_end (??:?) 
[ 136.225777][ T0] report_bug (??:?) 
[ 136.225965][ T0] handle_bug (traps.c:?) 
[ 136.226011][ T0] exc_invalid_op (??:?) 
[ 136.226075][ T0] asm_exc_invalid_op (??:?) 
[ 136.226102][ T0] RIP: 0010:__module_address (??:?) 
[ 136.226108][ T0] Code: 01 00 00 48 01 ea 48 39 d3 0f 82 69 ff ff ff 0f 0b be ff ff ff ff 48 c7 c7 e8 5b 1f 85 e8 36 2b 51 02 85 c0 0f 85 d1 fe ff ff <0f> 0b e9 ca fe ff ff 48 83 c4 08 31 c0 5b 5d c3 48 c7 c7 4c d0 ac


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202301081615.bae9b833-yujie.liu@intel.com


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--viJYB+6GwMZTqtAj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.2.0-rc1-00035-gd0067447fa5b"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.2.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
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
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
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
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
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
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
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
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
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
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
CONFIG_BPF_PRELOAD_UMD=y
CONFIG_BPF_LSM=y
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
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
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
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
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
CONFIG_INTEL_TDX_GUEST=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
CONFIG_MCORE2=y
# CONFIG_MATOM is not set
# CONFIG_GENERIC_CPU is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_P6_NOP=y
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
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_X86_SGX=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_HANDOVER_PROTOCOL=y
CONFIG_EFI_MIXED=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x1000000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_RETPOLINE is not set
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
# CONFIG_ACPI_FFH is not set
CONFIG_PMIC_OPREGION=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
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
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
# CONFIG_X86_SGX_KVM is not set
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_IMA_KEXEC=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
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
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
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
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
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
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
CONFIG_BLK_CGROUP_IOLATENCY=y
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
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
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
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
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB_DEPRECATED is not set
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
CONFIG_MEM_SOFT_DIRTY=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_HMM_MIRROR=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
CONFIG_DAMON_PADDR=y
# CONFIG_DAMON_SYSFS is not set
CONFIG_DAMON_DBGFS=y
# CONFIG_DAMON_RECLAIM is not set
# CONFIG_DAMON_LRU_SORT is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
# CONFIG_DEFAULT_CUBIC is not set
CONFIG_DEFAULT_RENO=y
CONFIG_DEFAULT_TCP_CONG="reno"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=y
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=y
CONFIG_IPV6_GRE=y
CONFIG_IPV6_FOU=y
CONFIG_IPV6_FOU_TUNNEL=y
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_SEG6_BPF=y
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_IPV6_IOAM6_LWTUNNEL=y
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=m
CONFIG_MPTCP_IPV6=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_FLOW_OFFLOAD=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
CONFIG_NFT_TPROXY=m
CONFIG_NFT_SYNPROXY=m
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
CONFIG_NF_FLOW_TABLE_INET=m
CONFIG_NF_FLOW_TABLE=m
# CONFIG_NF_FLOW_TABLE_PROCFS is not set
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
CONFIG_BPFILTER=y
CONFIG_BPFILTER_UMH=m
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=y
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
CONFIG_NET_SCH_CBS=m
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_TAPRIO=m
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=y
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
CONFIG_NET_SCH_SKBPRIO=m
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=m
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
CONFIG_NET_SCH_FQ_PIE=m
CONFIG_NET_SCH_INGRESS=y
CONFIG_NET_SCH_PLUG=m
CONFIG_NET_SCH_ETS=m
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_FQ_PIE is not set
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
CONFIG_NET_EMATCH_CANID=m
CONFIG_NET_EMATCH_IPSET=m
CONFIG_NET_EMATCH_IPT=m
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
CONFIG_NET_ACT_MPLS=m
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
CONFIG_NET_ACT_CONNMARK=m
CONFIG_NET_ACT_CTINFO=m
CONFIG_NET_ACT_SKBMOD=m
CONFIG_NET_ACT_IFE=m
CONFIG_NET_ACT_TUNNEL_KEY=m
CONFIG_NET_ACT_CT=m
CONFIG_NET_ACT_GATE=m
CONFIG_NET_IFE_SKBMARK=m
CONFIG_NET_IFE_SKBPRIO=m
CONFIG_NET_IFE_SKBTCINDEX=m
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
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
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
CONFIG_NFC=m
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=m
# CONFIG_NFC_NCI_SPI is not set
# CONFIG_NFC_NCI_UART is not set
# CONFIG_NFC_HCI is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_VIRTUAL_NCI=m
# CONFIG_NFC_FDP is not set
# CONFIG_NFC_PN533_USB is not set
# CONFIG_NFC_PN533_I2C is not set
# CONFIG_NFC_MRVL_USB is not set
# CONFIG_NFC_ST_NCI_I2C is not set
# CONFIG_NFC_ST_NCI_SPI is not set
# CONFIG_NFC_NXP_NCI is not set
# CONFIG_NFC_S3FWRN5_I2C is not set
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=m
CONFIG_NET_IFE=m
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
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
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y

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
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
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

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION is not set
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
# CONFIG_ZRAM_MULTI_COMP is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
CONFIG_VMWARE_VMCI=m
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
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
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=m
CONFIG_DUMMY=m
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
CONFIG_IFB=m
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=y
CONFIG_GENEVE=y
CONFIG_BAREUDP=m
# CONFIG_GTP is not set
CONFIG_AMT=m
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
CONFIG_NET_VRF=y
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
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
CONFIG_CAVIUM_PTP=y
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
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
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
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
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
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=m
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
# CONFIG_CAN_SJA1000_PLATFORM is not set
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_PURELIFI=y
# CONFIG_PLFXLC is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
# CONFIG_RTW89 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_SILABS=y
# CONFIG_WFX is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
# CONFIG_MAC80211_HWSIM is not set
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
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
# CONFIG_KEYBOARD_CYPRESS_SF is not set
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
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
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
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=32
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250_DETECT_IRQ=y
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
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
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
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
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

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
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
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
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

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
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=m
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
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
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=y
CONFIG_BPF_LIRC_MODE2=y
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=m
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
CONFIG_AGP=m
CONFIG_AGP_INTEL=m
# CONFIG_AGP_SIS is not set
# CONFIG_AGP_VIA is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=m
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_PRIVACY_SCREEN=y

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
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

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
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_INTEL is not set
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
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

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
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
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
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
CONFIG_DMABUF_HEAPS_SYSTEM=y
# CONFIG_DMABUF_HEAPS_CMA is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
# CONFIG_EFI_SECRET is not set
# CONFIG_TDX_GUEST_DRIVER is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
# CONFIG_PRISM2_USB is not set
# CONFIG_RTL8192U is not set
# CONFIG_RTLLIB is not set
# CONFIG_RTL8723BS is not set
# CONFIG_R8712U is not set
# CONFIG_R8188EU is not set
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_VT6656 is not set
# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set
# CONFIG_LTE_GDM724X is not set
# CONFIG_FB_TFT is not set
# CONFIG_KS7010 is not set
# CONFIG_PI433 is not set
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
# CONFIG_MLXREG_LC is not set
# CONFIG_NVSW_SN2201 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_ISHTP_ECLITE is not set
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_IOMMU_SVA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
CONFIG_INTEL_IOMMU_SVM=y
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
# CONFIG_IOMMUFD is not set
CONFIG_IRQ_REMAP=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
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

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
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
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
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
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
CONFIG_NFS_V4_2_READ_PLUS=y
CONFIG_NFSD=m
# CONFIG_NFSD_V2 is not set
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
CONFIG_9P_FS_SECURITY=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
# CONFIG_IMA_KEXEC is not set
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
CONFIG_IMA_WRITE_POLICY=y
CONFIG_IMA_READ_POLICY=y
CONFIG_IMA_APPRAISE=y
CONFIG_IMA_ARCH_POLICY=y
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=y
# CONFIG_IMA_DISABLE_HTABLE is not set
# CONFIG_EVM is not set
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
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
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
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=m
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
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
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
CONFIG_CRYPTO_DEV_VIRTIO=m
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
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
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
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
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
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
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
CONFIG_FONT_MINI_4x6=y
# CONFIG_FONT_6x10 is not set
# CONFIG_FONT_10x18 is not set
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_FONT_TER16x32 is not set
# CONFIG_FONT_6x8 is not set
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

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
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
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
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
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
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
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

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
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
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=m
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
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
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
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
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
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
CONFIG_BOOTTIME_TRACING=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_FPROBE=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
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
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
CONFIG_PREEMPTIRQ_DELAY_TEST=m
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
CONFIG_SAMPLE_TRACE_PRINTK=m
CONFIG_SAMPLE_FTRACE_DIRECT=m
# CONFIG_SAMPLE_FTRACE_DIRECT_MULTI is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_FPROBE is not set
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_LIVEPATCH is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
# CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
# CONFIG_SAMPLE_WATCHDOG is not set
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
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
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
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
# CONFIG_FAIL_MAKE_REQUEST is not set
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FAIL_FUNCTION=y
# CONFIG_FAIL_MMC_REQUEST is not set
# CONFIG_FAIL_SUNRPC is not set
# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_SCANF=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_SYSCTL=y
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
# CONFIG_TEST_DYNAMIC_DEBUG is not set
CONFIG_TEST_KMOD=m
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_HMM=m
# CONFIG_TEST_FREE_PAGES is not set
CONFIG_TEST_FPU=m
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--viJYB+6GwMZTqtAj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='kernel-selftests'
	export testcase='kernel-selftests'
	export category='functional'
	export need_memory='2G'
	export need_cpu=2
	export kernel_cmdline='kvm-intel.unrestricted_guest=0'
	export job_origin='kernel-selftests.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-skl-d06'
	export tbox_group='lkp-skl-d06'
	export submit_id='63b7ad8ed2ddbf53fb543136'
	export job_file='/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml'
	export id='8acef1f0a812fba05b33e8e184a2eb921173ead6'
	export queuer_version='/zday/lkp'
	export model='Skylake'
	export nr_cpu=4
	export memory='16G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export hdd_partitions='/dev/disk/by-id/ata-WDC_WD10EARS-00Y5B1_WD-WCAV5F059074-part*'
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402M81P2GGN-part2'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402M81P2GGN-part1'
	export brand='Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz'
	export commit='d0067447fa5bdd65ec4f7a5737581362641f7611'
	export need_kconfig_hw='{"PTP_1588_CLOCK"=>"y"}
{"E1000E"=>"y"}
SATA_AHCI
DRM_I915'
	export ucode='0xf0'
	export bisect_dmesg=true
	export need_kconfig=\{\"FTRACE\"\=\>\"y\"\}'
'\{\"KPROBES\"\=\>\"y\"\}'
'\{\"FUNCTION_PROFILER\"\=\>\"y\"\}'
'\{\"TRACER_SNAPSHOT\"\=\>\"y\"\}'
'\{\"STACK_TRACER\"\=\>\"y\"\}'
'\{\"HIST_TRIGGERS\"\=\>\"y\"\}'
'\{\"SCHED_TRACER\"\=\>\"y\"\}'
'\{\"IRQSOFF_TRACER\"\=\>\"y\"\}'
'\{\"PREEMPTIRQ_DELAY_TEST\"\=\>\"m\"\}'
'\{\"MODULES\"\=\>\"y\"\}'
'\{\"MODULE_UNLOAD\"\=\>\"y\"\}'
'\{\"SAMPLES\"\=\>\"y\"\}'
'\{\"SAMPLE_FTRACE_DIRECT\"\=\>\"m\"\}'
'\{\"SAMPLE_TRACE_PRINTK\"\=\>\"m\"\}'
'\{\"KALLSYMS_ALL\"\=\>\"y\"\}
	export rootfs='debian-12-x86_64-20220629.cgz'
	export initrds='linux_headers
linux_selftests'
	export kconfig='x86_64-rhel-8.3-kselftests'
	export enqueue_time='2023-01-06 13:11:43 +0800'
	export _id='63b7ada5d2ddbf53fb543138'
	export _rt='/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='3d2e24559dfd0f232b94f0e6005ab346f50b92b2'
	export base_commit='1b929c02afd37871d5afb9d498426f83432e71c2'
	export branch='peterz-queue/sched/idle'
	export result_root='/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-12-x86_64-20220629.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b
branch=peterz-queue/sched/idle
job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-kselftests
commit=d0067447fa5bdd65ec4f7a5737581362641f7611
kvm-intel.unrestricted_guest=0
initcall_debug
nmi_watchdog=0
max_uptime=1200
LKP_SERVER=internal-lkp-server
nokaslr
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/modules.cgz'
	export linux_headers_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/linux-headers.cgz'
	export linux_selftests_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/linux-selftests.cgz'
	export bm_initrd='/osimage/deps/debian-12-x86_64-20220629.cgz/lkp_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/run-ipconfig_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/rsync-rootfs_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/kernel-selftests_20221205.cgz,/osimage/pkg/debian-12-x86_64-20220629.cgz/kernel-selftests-x86_64-2ed09c3b-1_20221128.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/hw_20221125.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220804.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='6.1.0-wt-ath-19953-gc5358032dcc5'
	export repeat_to=6
	export schedule_notify_address=
	export stop_repeat_if_found='dmesg.include/linux/rcupdate.h:#rcu_read_lock()used_illegally_while_idle'
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b'
	export dequeue_time='2023-01-06 13:25:11 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.cgz'

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

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test group='ftrace' $LKP_SRC/tests/wrapper kernel-selftests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env group='ftrace' $LKP_SRC/stats/wrapper kernel-selftests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time kernel-selftests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--viJYB+6GwMZTqtAj
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj5QK8vd5dACIZSGcigsEOvS5SJPSSiEZN91kUwkoEoc4C
r7bBXWVIIX3QflT+sKzVYooFrJJ/12Zhr+XMQhsyCZsZGNDDisloEmuBKnh/AISsDW1y4NagGYvq
WhhdqtLqKPfUSXzUUWAxLAlasJqjHwr/W7dnIN+qFFSGsPAVsyUMtC1pfpkj1UmNudE9sb1EYpln
nARReCT6rmqA7B/WGyWw1lGHk4USr0eu8kRkQEEiSZS0evQw6owLFjgwQU2VjQoEPv9zMZMJZOGz
8maQNC0LBAHNvp8EVCrDxE6BD170RIKTkrydP4Uql1up2RuCNP0T46WPne+spgTUETI1R5xINtiQ
CyM49sUFYZXzrL/KqOGZK6zRPa4Y7amxLUPOPTQq3HszTImQ16/Srx2UlIbHu9pWSJoaO/L+efiD
JwW0DqUxfX2KtmOcnzve5SuR3DoRZHRW5f0PBDGgbcBKHCZkjOwg/zxv5Au7uOTX4/O++y+aE88U
iud/ltWU9i1q7lb18LwvualNHGER4U6JfwmL8W7729dxdFO/5atfwDQj3RT5UUPDgRiDo3BBzbiG
ZFTuxuh5y22FLzy+9KenWeYQ0xxIQt+4bSG+7hp5ruXN+7GINWIjUE6g45Wxk6B5hXZAA3JmHS5L
9gYaH4wUJ18lIjZAwTNprH4ZGJ+vzrK7hDOHyKgtdFwXv5Svh1bG9/qD4XiT9A3xnEJmJcksw4q2
MCxFAm6Qv9ogeMdi5i/ktxkbiuAcWsA/5zMtx2oz3ZmVSIFe1D/Mm+ZLvgTOCm72VgGu6WmPXc+B
aWFYFY5rBUF3NF7cjoYoLDxOBFjxsKvwnaEDafYqmaWZgwreI2Q8jdmYcHFCm5rChhYTrWu8B3+N
wzx8k3RFeKWJvhn0LPMJHFbGuEFcgMA95+P/8HbeZsEgqSPTkJv3s+64d38eqYB1BtVm/xuHPZKR
nZLEZ5SNA14ErLzy6zN3DLApMAikJl87a2qmXc8y0BkQZxMUu7I5D7R14F72HdqmOiiiWj0HZvmQ
mzTe0iF9znUz5wKOTyLm7/pMgqd1POMHZ3tytALZlDMGLMVY59/vrcVVck58EYtDBo3JnS6bH5Hx
ioXnmEEPd9fwFbirVKskhtOkyxfrsUsZSOQwnU7FKD9Tr8fcKkJYEHkQzqVt9kyjGUEt5eCFNArj
KXULU9INtkZLM9/9uAFRqsMAqaDnY5CAtErchQ230RdofBuZR5d1AFoat5gVR/vb2Hcec8SSdwaz
8dSk3xIcscTdCBmTdvcbMRswqubhKBudqduP7bO61VvQmjVdmZQXxrbJT4QZIYxbfzGZ2PqijUmr
7IADZkVg7R5He2bIgt2sVbWO95rQJnI6db/LGedU8WjN8tYSFyKLihf+uDCcpEEm/wQSxi8veexj
Bz18zsRxjl8ApoTbBCeXTOjAeC7GXSW/KTmaCGah+9rfe99iwYqXmVQpsqa4EBttathqUsj9nP26
mERLJuUVjShpTRGG0obEflS3f52PzBfbn90tMERaSxYkkxSInhwladhID9Leb+eOusQUVdRxF4gF
suXABS9ZgX0v5uNdehqEeDVSqdpx5EmL0XPNKw9RVeLawf99XQcScn1Jxy9BL/qHxaQo3hivL/7s
i1RVL9W1WJiBj+bIdYwzL0v51/rnNWrZasFh0xpRlPGO/X9pFsSZMCH3CczBUP/Qv2xfcO6VIpUs
vyBu44EeSnIdE4ZTJSbNDm8L/hblC0D91vFRggZ/IeWMTsL7yulTqUOvzQ5sz9bjkI1QXw7SSHXP
bW5rxQRJEzc8gEqtTZ5R0W9P/36ju8EO7gj0CM1yIYbjgBBG/0//OaAwncu7eh9y5hIi6WwrN1qX
whG1v2EKphxnhl8hhdPlak7SvpogkfdvWZ5EoJ8CVKTZk05vQrqp7Up+ufZPjbu6AQdbieW8B/PV
peL+I/WPywCQRhcAIVCKZDJsREdrVNjh8asyb9GCt3Od6uBfKgYLabxjDuNUO7X6PDvaFEF4X0LF
tIkGuMyO5U0XVu5AQAEFrsNenleEe+tbqo3ZG0zZbc4wb5SqszY8jYpjtSMhyyHPTA597/jbwge+
xVV2vgUdLYX1Sg5hjJ67Fe2jpuvp0Kkt0X4ZveBN1+4EnH5lc/oh3xa/iArMKbgZ9wBzK//ERjKz
sWohJmgFyYTvlKhk/l0vmeh2B9sdSRE9KEegf5+iB/j5NwPHpxXbCZD6VEeUkq47PXHbpcycDe06
GZHE1x+BJd10iI2UNP3FW4Uu/E+d4eg+4T8C3H0COsRT/3TYgLnMHzsg+RZhzKiFUE8v02t7W6Sg
YUWviZoyXtkZuSQCDzQTDJJ1HucMJxqH6n/l6s8GAbW+gkBxYyGO2hdsXTUBU/OpgDvMpaj2cIA5
bmWIH4L/vQ910v+WbjGHCeQrZREE+UazelBE3uKLfpSy27y4SL90PWe/85qMWPJBagSTk5j6avZs
fSJAanw7OLP4dnsNbT5v5CQlFFJOjEPnUg/D8FnCYtp8cAl/5N0HfBE1DyKDqoM2k7jjzIkqGQ8X
mXIhyklrbQSHcvM395iACD1z0L5bf3WCLe6obdq95AeQfjrw8cTe6ZkJ5NLMGDdW6DY9OS5af0ww
uI90EMCRiud/45ak4zrtWU60QuzjaSzG4klsy7H3t0K47R8Ia4g8SniU8POq7MYkoOpRdP80MGif
Y/icgBM44xl74LooJhpWXGo2ohrOOQyuvtbKr3P6IC5lcgzVhv+uV8i3JalkIX2uVCbhiGnTaZcx
VDCmQ8r8qpetPWIsRIxuZRtBsvjs/s62GjdHhW4rNwTONlHvqhQQJwAQk/5BgW4GRyfZWq7XN4yN
S1Gv8of/kBplZVv/ZIII920LA4AoJQL5e5yuxBeI+jcbtNHVQIQCdkVmGW9VsYMZ0mG51UZr0hrk
C2IE2aV1+hewrTbAOpfcAvD9L9fWB7+jgjvnKXdtkftDNV9TbNfccR0dFWj4gEK4EdgIFxID5gpZ
7u4Hvfe8j+9H97pdf5/XGSwdoltGVR9l+IgE02ELnNpoNKY0DGTCxPFAoS1STj9dUCpZ6rnSF9R8
aQmSo4Gnj6Ig2k/Xy2Jd6GrlFtZJo2J+TlrledhKONTdcFQDmPM0S0oTr50P7TKrIiotu88u92fh
h6jhRgiw8x+V+frral8T1ZVa/Ni48m4eXq0fllrcNjSKeGko1051DMVDP7nJikucdxF2niCFruCU
pXvm1ZKGHCoE6Vy09iRSHnfonMBYDveuL55W0KGnwHo8+kYxHrdICla4O1T+z6QloFsajpfdvgNZ
vwUPinJYiGhlH+Ags/gVhXMWjCT22Cu6aC2ffoENgbY1cYw3T/HTKOddsdXHMIIxsto1AmoKsFOP
yaICVC7nIconvOeeoqQ78EdjxIWD3bGFWvbUPjQVFkgKWXW31JAGRTLTh0lN/itZgukHJu0u/oFa
EuUKMzZkVMQX99luY97vPivqMv5CiEEFZltNu8IWav0q13mA1eLDpeRuX0y9XxDK75takgjRFeGq
ptqwEP9sG7QKTyipoRPDpg3G4BLAJYLivVUqKprcUOasUHAWxWSPHG858f9jqmOBQbe/BHNRXdWg
JzcK5IF1zLPuue+WQOLnhV4unCBhvLC3ySmnYKcGTZ+1yuPCLJif6vsRTofFaeTwFL6MbOKNEIax
8avJr2hmH/DUzafvQO35+HVF0FV/XDhP5MgLSYZHxogijbhpmutsVCXEHyGWoAW2luaMzrQeviic
eWYKXFfyp+8YUhtkY3casUh1ABmfusPnH9gMTR55bZm9pEYsZuCiozk+54vvIx5kLPkp3TjWEFGE
qaY3nR70COJ3JVjU7D3ZWybBk8/x5eUnuUkaTH2epvC9PMmlndTi9YSFu/PJg2Eccno9HRObG/m1
KTdM16JX1sMb7vytGrtOZQ9p4QiJFDPupmQlepUeeTL/1YtmWpEAa9uuh0dCtv+LfPHClczlVpZE
iYnX5sqWK7cAPzyyYf08gc63f0pHhaVBC4IXALJ5lmPYuNuZYlprU+74pm2mF4iww8SMEKqVeOq+
4a5Pc8OSxtsJLYF0Q9h53XpOYfnFxgOSA75AhurdcA6sXxuHAncho4yHgIapnGhgoB70jHe2AneL
1soj7I2SmcnKn/qJF0y2d/69Q3W8S7cSYVwhoTyLSDiTTan3uYQ3uaccVGHO+ep0ALdo6xkmnS4W
KQAiMjmkpzoip07k83BPq12qabstIZniBc1MA+kYONAlkA+OpFOUDqEXuR5bYOqHdz/dXKIN1E/x
14BuYYq6Io+VfuS7xNVnDV63wSJionYwd7iwaqeNNBx1lqeklGt/pl1r+L9zJRLz7hU4HaaJh5QN
hE74ZNiAenEvDd6VKkOviaAkKlustVf8pt/ojlNr/aTiuZJ+2XaO6Jf1I9DujKjzPZCWrvxiH7pb
bs/Cb/njxYk2blEunKgRwT8JjaIyNSn6YR9pZ6+oTkVZXB3TFUVL//VuP82G27eDC3f5dAVQ8qJb
yHpUNmZLXA1+y92N4iho50bxt42iLDG6TlKNiokfnX84vPmbavyWY5ASM8dkvvBHROF3Mh7bmxco
nzLVozc7djrEHhncDlW1OHQSwsqG8xn9uU1c1dVsxKxC4nr7rBk4G5QuC/5W9zS1yVi6UycVOAN7
xhPfMAcKOeJDIKit3xVZaKA6NC844jtmTgarR86yzP4dXvgZ8Z+APqi1tmh7dXQdlFDzJtcIzVol
l85eMFCkYmwmhqt//y2tGN92HgR57Hp4NkvM8a4478tBJ7R3iLy9jGqyUMAzIf5Bu02HLGaqmSUb
iZSLTsJurrZChQIWaucKzL+wtpqSt43ELeXn3bB8/m8HRel0miiHwPDmBXqBg56SwmWxq9cUHG4I
jHM/zLqKSHXnwbOG5+yqTyLIlhMVlA0nyTmnxBmoRhvfXfBOYhgO7F9JYDTIU+W6GcfUZWTgS829
swwpT5H3t5aivNCU6s7HKXZCH7P5qQEMeoK0MB3GBgOUykBm0wsZuLm4w6CmeE8XpqC5mnyg/1C9
xG3T4Fl0jjkI/sdQ3mXtdTa3T/Bmw1/DsUxfa7LQNEO0aEsc9bS9iFXByGzForx9d6ofd4QRqfOt
1c6ZZzWPiEbb15oBPOMdlJotbgCjwXBLvSbNJA1u2lEPta4eZOipRdlf8Zj0K1ATUUsquIe7DGWk
k1tjFVZ2lZZ9MTcboQEvpebQ+ZQVuKrWMPGaZjdmssOCKywriTNnehUChsQ6Efljy85rEHDb9phR
z8VEmxt9drWx8O0lpminSkuQQz9Wvucfi2PNTFh2iDVj0HFxZ/zJEPK4VDrTTvzpQ8njSujNypes
kyM9OBqIUq2Yh/u+5BgEkFLOUODm3Zz7I4C3I6KiI7GmLTafLFFOszC95exFFhmCcddnCz1TlDUc
D0Cs7BcSWkHBNxp3jqJS0mGtrGgnClMYBbaa7au8fMtxswd9ORQ2UAU9LNc5YkQmed0hSsYh75c3
XQ6pUDvIKtdmdkWRF/ALHjosaOixjUmEGPslnoaqewpjxzk6uo3ZIn3lFp2pKdlVn0rBrfj0FPBu
mtscqirLvILx8VW4qspUXy6WaYTAVek16xVVHkz8Y5fBcyD/6E5VdhuQNbX+WZG6ZE/f9DJRZrNu
dg1gw1/+yGJ5+KwL8YGCQt8DdE7kQ1emhM1i2mLZTEb+TXFQzyXAbsnb5PElKuXTtWomAMzH26VM
SfbR/wyLBnSaX9YzBSyoIuE51zmfSUmzArvG+2dixeTE+lwz4+kiGQHxqCEMrT0cFNvSFX5CGL9g
c39VI+0QOPrI6GXIi42nhCpM9sVtxf32wfin/a58oDS+bWOwMrUDi7tgonpggXtNw3E2QMgphIec
zTbmSu6JpL/wS7WjZ2iWSq8yFG1KpJjZkMJF2u/8/o3rvgLcHEOMfZd0Sl7lelL5elygPogAVqBe
qkz+KSyZaZ0zwlqlL7ES7kR5ekU4xfBIg6XapM9V6Blr+OK3l7T/BLNNIrVEy0vUYSwiCpi72XI0
BViwvxspukqE7wZpHzWn+EGgd7rnhagZq74SPuzlpLtIUgL0Xz7lOWF8sBePx9tbnREakCMl+6hg
ZBJgZDNvMxFHJfHUY5AJaxOlowrh/tu1CUArTOC12vIC8Tt9dXXXAErWyj5C957e0m/6w8qJtEnJ
9mX0dTqaM3xbBLwIpjaVmqTCjBpiRYZVpC9xnu6fNzUfLwTkf4QD8kxTzKA1eq6JmQXsWP4x1exR
JdC8wEAT00odL8q4DQ11uOYX6LKEPeTJyU/bRdQ7TMQjsMm2lHLHkxsw7Tgb/o6ajWpwUV2Ie7BD
imRpU7rY5t9ZHmoKXQptunEcXwvQldYKlj+3yQ1CH+REhYzfDcF+nxiRS4PF53EQzURT6k6Idxxi
szq2Yl5mp9C1CRK1lE+7qjZd7Z+lwS2EOqLXqYaCBgv1gpS9wAPtM+MDxbpJGxBp/9Jjow+WGLTG
4VoSW0bFOEy08567H61wigTOmJoKV53nHagGJjZtSEYYv1r16OYmLVXqx5+Lo9u35/b71NlvDd4d
DeDRHqYI9eqPeM2usenA4Izllj8tWEexyksbj/g9Wj8w3od08cuuAS6Trk4OwCXp5+N5eLosQahG
e/2CLNpf+m0ATYTAdUwAleE4l/EhfJ5LHdtNLN6R7aRmhjkacFViFOykX8UfikFrxidAdpzDd4Le
4AAX3JnrJRYlJelMt88IEyhyBhUdvrKwSN3duks/S9pEH8lkoDfdXvAk/wPxoRKIyN9IaiDSmGde
lnRa8NrKkgTcjoobxO3Deegccg9c/nxGy5DP8Msc0P86qmHHBG42b94slKeO7kA4z8c9HKk4SW+0
nAcK1F75gTvaqCHAzcYCbEdf44tW3UGi/Kg0OzPJ4CEOrihOuzs82NZ6NhwRDEusv8FP0vYQVbUV
0gL2LO2nBMA8cAuaMNG65WJtvc+SSkNc2Hkm/Fv8jdO9TamTaAFGUUt+exPr2rSuHK/N9agzf9qe
aI7Drr4x6fsMPH1updnYRvF873VIScEhbZpuWyzq2GDB/kE9xZhMQCh7T5xDPDsSyviknsAfOpl7
Cb8XZX5ex1T+sdckPOsYb3o0s7LDmeEnq2MKpfzinYfchbGeOTkBG/TxTq3t94MN3KpFshWMS/kQ
Wlon4Wb/J0gbhpXc45uCrFXsTAfXdwKG4IwkrR0wNNrklq9BrVP5NaLKr+QnSsci3nK0zvE8MdXV
fY1IMb37/H+yUw1CATDFLz5xYH1GH9tsprwxo5sbjVaDgTCpWtSRvej8srpXGNvvzTWwshG42rtr
xJbrkF6jzuIOX2nneosI2PpB7DOCP5c53AzxpyVeWzct6Bib3xpe5SEkw9gMtui6zsrFs1Xs7vrN
wj/NCRMN1WwXDs4V2fh+ci7PAWvp12OrdXTIebeiO+mIRL3Sv2IesdYadaGbaVIWy1rnNwZOPrlg
CPhxkjH8mjcqy/0rIXWpkPoZzlEBUU6kcBQy18aA963EYxsElQ1w+dTLDm21VQ1f0F/4J2wLeqj3
IhNb7OmPrZCgsIvpVMB0N+5Q9Kfba/TYrFk+Ec79qzkbUt9TnjVuWBZzCbs/Hp+IjYWkHyCbgPEW
xhXVAXbKHmWwBOahDTkxdb7LDmzmJxN9wcOytnFl7jvMD89yAAyrzuOP39T2g+jPeIlqh0YPu4T2
faBhDe8LJ+PVs3qVu9MQY+4Bg+iCMEJmAdEn2nvaSgcA0J5w0K5gOrTsViali+A919OmAoaC/4Rc
ftT0+SXgdRqI72VfxIS+Hip/QZz5K2ErxoEpA+3vn0AbmfVMJjJEBzuGfLRqfCJkntpCIxkr2fvk
mtZrqiTsyX0mEuO2v3XRZIR2lmiCoczaPxUToat8Xg4OK/oRys13s2dE7bES+bV0IlhmFVe21kb2
AM2pbAKTi75yAXRTVqiy7iFgW+oKBH9gk9ysyDoEbU4AK7/BppwkDne6ZRiycNKYi6u/J9ZZRjae
Ed7TRefKqdSwvRzhuVEb2QMjpboofPvhBKkiBWfR6zeA/QUf7nY0A7Uj175tL7MLRRWGM2EvCkAV
auChiO7Stco7K49KO1jEbkO6/U2lTx0tCZ0MUl6T66XhZE96WTyWUyvc6ByoECOVgyE6QAPKO4X7
6va8+Iat9vxEswnMO6xYucF2IlCaPnKQtrwetUbTt7wwllRIP5LsrfBJlvHvEs56IzUttb+WD/5r
LU0CbE0BLhqnmAxihZx6B6uiIYhNcTFzyfM36PEVFVVbh1XW3IKoJXr7rbwNo7s1MjBOj0zlAi3x
Ort3LBDHv5AhVBqBgXCIwu4hhMsDI9qm3Vag0ynAiXu+EZQ5HcMsPV+XysugFVZ7SiW6XTBkdH+a
UEutdrdsRUqVMbdwKAbnA+2ikqbapacHqyTiSyUNMuNC+Jy8jjwRGvpfyzyO90Zo8bEj5lY9/5LZ
OQGLh93qTYkHj9SHCXopLri/58s057vSMdGmVdzJmI/JyYoFH3Dql8VNGYjAewkOtTERRI3e2xYe
6lurR0KfteKUxa1JVPZjAj7yqf2W7P0PxziOPYt5RO99uo7osy5PMnCDkWK4HCpWRiDcMB/SxFSG
W1MXRXpc5CY3CtrcGiD6ivX0MNNtQU4m3jaPRdm/XEk9MqoNTYrYwBkzKRYbXT6l7Y4LbgVMC1oc
G7nft707v6XCnKkYPksaNMssxR4NC4JmUQz1URJtJa+QJmajO0wQP39ON3ljiCgtq5YK8kOroAYA
uZE9CUHWG5Zjh89EdLIG2ioex5tEzAqaVT6B+sQEXu3FVky5uXjKDJfOW7ButZ3G2eUleVGJsjEK
rlP1Vql+EHH+hJTKfIJ5G56nq0I1bEsHYbfEjI3Ibh7iHQ+ixbX4216BAZ8cRmPm2+j4wTnR9JVE
HW410hqA0vwDOBSkp+VwvKGdIaT0xx3y/9ZBabrAUshlr18+nu92WyeEb0vmwym7zV2cCO3sDxML
7BQ+iQu5bvTXLohyJ0/FHMsRzwUw3Qp1XFbT/TMUJtc1gwLWpZlYKVuGLLwJcqIQd1TTUVEvP+Zt
1hBxiVLs56xKPN6Hk8YtQfw9Gr/wlT3lfrgU2c9aevBnKqD9aXJOdpfqUjKQtEO7LX5unOPeKP5M
9zuWzvkDXKNMS3Guk4AqZSNtcqoZ0E9qRqCPyP8TnsJbY75iDWuNtgqhwx0eZ7c/jtokFGyyj+/o
FEGQ6IIXLSvi9zn7NtUJrq1eoTKssF7vtrM/UmAVSksLaH09AC2hIMOj9Uy+Lo0rojeaD0nH6aQF
8R4CwFkQpnGBbxAkHA4Qi/rKPI+R1DHHZpQlP23MIk1eWurcxF+Gm2uXeAUJRitgnXNVUF+n0WMm
Wf6IWQ1UkO5O33j1do2fp+jY4sYA+hnn0Bvko3Kh8GSCC5OK3ePePPNddj/M8EbZMr4e8fwl/RvT
HbhmBdg8latSOkzsxajWy/ESzyv2Krq1cc3DlgXGx9tMc6Nv/g96Fe4bHirk1Bqof9PRLKSdU86g
OV1CX7pYeUFrUiE/rhY9BDI+UxXhuQ1CAEZRuPB9Oe/PlvqZ+dEJH5H8piIV2/u6N8ahQBOPGT1p
qgU4VBOHBjuMS0uSyUDG8uBiYKDVtO1VKzsoXX9sNSOJxrSp2APj3H+isJd2QfVMADD2iVKQ/zJ9
vB0xJ4Svurg84xLfe84RX8a2bSW4FF7UpqmbKlCtHsoTG4syj07DYieX1IjXg1p+Xb0AI/y0qeDe
c5F+sfd9LkrvKB5hVvhFe6521trIRECRAbBBmwrE6JtoVKbxSIzJ0rsQu6XPnq1j9gmrKps9RZYp
fs2aj1ikzACHZ+/jt67aa3efv4UL3unjCrU1JfA/vSs8U28Jz7KGQOxwElmIeVLSfeYVzAnPfVjp
QpFh2XI/MPwmEx1iGwmZb4sXPRQxuZd6dqVTlQ0bsCJMM30uFF4Hq7NwAjKMaBOGtRRDsLWPpz/l
Xx9j+YRl3xCPqW+hO7AS7kYoPjB039UK0ye4GfdY0JOOXJnhh273AdLRBIZCK82e7C+KpF2NEhPB
iJTnAaT0R6TOwsmGYzC1CGDC4QYbp4TnoKCISecoWkJETN5uPnxAatslNxRWlcHW89RN5Scs/EnH
bp+auGITYanwd0bDhfXOTK3ybFFMdYnYVJte8eOItr/CLpDcRrU9YbnCPBl+LPPcLI1Lhym9Hr+y
6xahjTbdNm+H1Zz91Ctdc+fgiUESM3yOX4HrhhBXOkDAFZ8r60HDEolhLWCR5Ckcjg6lzKqHRev1
dFXs/zeHn27YqnUCmG1EcCqwPfPa1XDDXOYpYK/EkIvzijRFfAhPkXrnKb1HtqXBCP85TJSvwG/i
wDxUzxnc7wZYCmlQKjsJ5rG/RQzBfTm0vviv4adZo5o43iwDiXP+lcbwCsWq8bo6prBuoKd8EFfW
c4XlFhlaeEk7iEP9GQHu7Qji1zZM/WE1oKCGKylaEhW91fyNyG6jkU3KlaZJmtcoM1f7r5JvAP1F
8MVK3d4BjjA3oxW3UTLgaOqURXdSVUMx9v3lpaJq9LwWtNfQrh56HLZNnOCVQLyEcZL9ANHLiitw
BlZXbWJ2qrVJQ0K1daIKNSb/C6FeXlhcK24z0QSG8ntt92MlH1Hc/SEQbhbHN2zyP6qFfg3VWbqC
Vg1pxsoxJ5DkfhkZI9Bs3HABP9a3pUI1a94Vbcz1U1drye11YPislf+aaiJ569IMIPwq9vfR1TLy
jgWdDmX7zByPQ8yO7US+PHRefdYltgy08nunVjeKEfGGi8zDAMUI1CkQJEokcOPqvkiPKvURt1/g
Ux6OYNkSgjlXMczR28TZ8oDBcugvvfMRnUQOKXajrWkkfEUYBtZ3+bgVjDeIQN5XrVdvUETg6IdU
yVuQzGg/QLtjq5oFcYxraNDORRXfhSgS3dvSzQXYRyUMMfvNnuA35ZhnQq9+rr6WS63y7SW864Xn
vrMNxcuW9ElLZuzl92/ribt7ucy11GoSn9hQo/17rOlUttLV1CbDrOGzEvshILFVy6ipIUolKxg/
8NlquJATOHVsIvb6CF4Kf6rfk1kFKzVFY4hf7oD6YFlRBxZWsUZNkoGb1y7KxLVPi/Hf8Ux8VJ1S
fE2jjnXJvh3Twb+qN3rqHpgBUx4wY/Fi7j7i2GAIjfk+0gFZkc6DLcLWC5ZDOd+6RIQjU9fGBdte
BMs/cyJEkHFmwrt1SreGvdqVMEaXN2FQgF2dpDsZrSpibPoqii03NNbAL5TGAHsMRlpxiDHI/BtS
mENWnJ6slfiQ40jzichne8mn7jtEuCugt17/F/fHhvYL86xKZ2r7U2XsSvug4gsEBoEw8OiY8mo4
PxkFFSseiXetpKvw2hdFjFMjT66ZgbdNvEMak00tQS5vw+kZ+OCkKESInDwa2kNqq0uxlnfGlykh
iPy48OmK/cMZ6zI0oupsmWY8OChN1Ee/8rc5m+KyvE4YBkQIgiqR79P+ymrgcPVsmSQ8jDklNkwq
Ke6BwjFDIxECaXXUuxeNeZtZgENFoBFVqkabyA7t+CkNy+cvZ3Wke9Ll6PNbQOQ6J9+18LOXtlvu
CvfSqL7BJWqczqyTcmI1/MACQ1omq4fgDkk5+TlMYPimjC9IewWYy22njzhPr0EJj9lr/AN+TKTW
wTk0VMZobW6d+OUGphuWIEvXIUtv6/L49r9HSs3+VAKViT+Mp7tl3cUJQ4ZAcm2yOzBcHyuWJXsz
5+FTSpENrRCJQ7limesg8Y3370a/zZK3Y9uAXtDAGe/1DqQjIYqAv27EYtXYja7fd94BS+77Vmge
05NO2sUEMXXLv+3mDtdSx1gBNSAWRYFmyMSiojdVumSsLSKdaVoIadLw1BEnHTiqrjo10/D4F3Z0
e1aJtfdZeerpo2lr9xzCV5XZ45lrzgixKxnx0TMtQz91CU9sLYzA8oM3ixHuJveAWkWoxcrf2pRv
Pidd2P4Vz5FnYi+9tR9I6+v5gnTNMSTET5dM1qeitHnCL8HGW3CMERpiGeQVH9itryLc/T1IqTVl
7xn9+mz5XTsKQj3SS1ZzXXYLakDFQhVPVchLlFqgnl6fXCZ1ox6jY/XkcCUf6Mtd8Z6oe6DlTKQe
loBx9dCTfIxtZ7O89RqLxC8OsXh4s7trgtTy+LZ8XB3E7Q92pmUihAADpdgTflh3ViKUzx8HT4RH
vdRdN5YWSFdSsJzI6J10O4ZnB43TU7AlrtuunNlW9tUAYmiLTwYua+uvTPEselcYi93PZTBb9L0c
eMgpVQrhtKzrmUE79bGsjH8lTRuhSVlBdMuKc62vo1TQGNGOso1XWC1YpXaR8b46BSED+XwiQUhk
nM/m58qdApoC4hp0Y6HBVvMEqd9ae5Mq35LYhd5ooW3RX7NYtooAaIG1A1nFLwS6HbWd5IBfeZpe
qZmFnvWEiP4Vmnc4neXuSOc0EJ38Vr9lBBMC2Zl/ow6G7odIZWQlgOeNd/55/AmsYkhuR2J2C4Re
NXYcYw8AV9dMXb4MX59rqf3Oi1Ix9qwrGn0g/JBFMvXOz/RT5YGNwTleJ0YL0qANSFLXcdtWtg6m
CfGrs64cU4GMISQB9B16Nw0Yp2RepfePnLs0ztUVH+ecVs8zd0nwrPXm+hM0P24t5xc8dDHdWbxs
sQBSwJtpzr73ESZRGqyk1ZLItIrtQFCJxPd9XTOFAsBZgW6RHpzYcJU/ekrnuwNYSHtWrmwJy2mD
QFCMwYTgsZEjs947P4ew2VUd5ox3fOLLnY90HMfCR4thxW3y0rfHW0WVNcrPC4OJHwlLo026AzZo
IXzCSssLqjzZhMOn/Gb6auD1gyzqfY98gEEHAJLERpxxS3WnDMaK/XwA4nB3j56egwxDXF0FEHzk
wlEZyk8xjZfI6q85g/X8CZl0bYucU2/Va4QCByC5tMetsWk8cF/hE4x59bJX9Qx9Y2u2797BdZig
fCPjyz8Nxcxm79X9oS+v4TbO22GEBjA4cC0xcgaLZ4HTjWVUd2z7h7XC78AhGjIm37mqQEZVzj+a
pperm3lrSgrJ9WrA4g/QfNp0FGz3ADT/8nJfkBvK0HKTHjwspOgPDGSkpjoL8kiU/FmPTHU0YqLQ
p0GEL4rQPiS4yyj5yVdY8uyMU0z/tlXbamMTJnLCSpnvOfBb4cLJtYVtdGSdlzYeKp5a3WdlTSia
MuQY0NlpDSaR7jYihY9GDhBJgvwlIzRFG0P44QsvzTuO0LjkdABndixeDb5c+UZHvhhPJKF5Cbta
ST9YyjX1VbuwMe02WN9eFgz5LOLbl8hS+Rf467J7z40Id/7bfGLNZ76x0FYKOQjpq09aEajG57/b
GKo1KB+fKXXC3zFyEo+ATZ3f3YWgaAMPnbN0EtoHJqzwfEc0QJku46sbge1NcJVLfdLCc9wCOUt7
tCiVWfj1Gyk7dBiUKp9PbIlolXUq/UNXVZk5IngrN8b0xuHNoqMkOI62ARwrGn8GHcpAPTmDTW/F
CZwPt51uqlQi6hAB9lm2FSiqrqVB6BbFgKTzL198Z1bqNhRQ+q7k3MCT8M2x9WTNXqtDhdFLrpsc
L68ErmTTcD5KdTU1fmhgJOKY2J+n+7A2SifvXU33K5Yy/dfrAwoP1uJnmV+DbneFSdZzK8iaNzWm
Ry0I4S7abtM4T/7ntqvTMwwHWSgY6rziiyU1ojKEa0QFHgGmOZSRVScHFPJtzP0h3ODI8bQ/ZyZd
W2rq50tjDG618HH+AYbv8Caua1o9ho/t/f9zO4zgpfWsCFku2WYfKVqccG14lLBXNT5h/bCAZryH
7BMdHD/XPvM+VRzv3c7/+QPQ6aW0iz6UyUjjgEFsQdvPzodJWRbScPTxBwLBBV6lrjTQ1q+KEp4p
XD03EC847dmp1lptTsrfV9aIQVy6XVhXUVhuaAUdrDteM0F5ahL1LXPHVA6IDHAfYg7tBfhykVvm
BL2oVOg5KVgLlUya2K5O9rvuj8LhtduO6Puxwf9+w7ncqVW3zHKJ6akIDbxAvt6mb/X7iXS2gelg
96eJFPpB0OtM1YfStMfvZJfA28NDam+5maGnK6Bq6iOj3jzlpcS+nrP5cadl6uUy6J2DYQiHQ85B
jqryzoZVT/xOqeeICSUmZ5sBMOYOqy5pl3r/R8cUUPUx2InJQpicjsgmqrElQzXLh+Wjcrdnrt9C
ucKCaH3oH+x012Gy+7ofxAqzYpwLIC56EISpS/w6cNzI4oM67NTN7SS+4p5cCrTVsKvt2IlVeVn1
iGF+kNKrBv0yv6weHSjdLhaLfQkkIdd+a5WDeqHqK+IKhUi130gG4ZBq1b5oc2wY9P2Bs/GzMfZd
XgEzTRMR4OYkWCbyoPxDkjvHNDhU7hgtVOJlu1BPUA6PDuB7I1+TTTCZSzk37Ircw24mI8L8rnz/
4CqILSf+y8VawJQwim6vrTPj6tbcN7SImPzluVNxmxi+PdyHvQUbywEMrW/OfYNvN4pj1zEo+P+I
o88oncB02BvHJsaKCWgkPKa8vOgZlK+x+0K/LTAoEl0IofKk6n7E0aWU4A60lmkA0shUxtudO5vj
EDRNMnImhdzwtbVyOBEF2K/oO79hARQroCNZFXGoNGg6ACzaATJ2Myf6xenZTkz7vEucTwz0MSnm
7R4Bq+WcLVtCjKtWKs9+DQOBE6Dfp6Ur59LtluB8loEKSJ+xc/QiC9uDlkNGABp+rOwk1cAqgJ68
eCD2uj5/3SGiVLlyac8/Tg5ZA7DEv9Bdv7kOaPzx5SyKVI0caCCbFB9nUvJHZJHPXq/tzghhNA+c
mdcehlo5wXtmvRI0Et+zNQDjue3CSttpBI+L/X0nho+GSPExijTdQz6x5OO/78UlOjn/KSuss3AJ
EMa5/Mr6D7vRjkozaXWMBPqk1LDGsECYeyRrH+07EfjybsZmu+9BJp/MVoZhya20TrJlJowplew/
9co461es94TQqKgMgMkCoVAl6mtTAtyvXHhTXsxQVRuEAYiR+16U7DHoz8CPsh3sv96XubJ5t2la
ov4Y4l8u6d3kF9jzXgEhSRlta684QoGMSa8KCxwNi+BAE5qxF4DSjgznRv32spY2oyBcZ7+8X4Ni
8ya4HY/3cZ1bNDSNkMxOP0guhgpu+4U5NXlcCEaKqPLNNDBv79pgZJC/AeGpXPKVOnjyVSIF6hHK
1I6qu3VyehIUZVy+eFweO5pLqBgQrWPVb5hioXmIAdbpuA1lg30gP8fxp4QE+VLyDdj/y1ifdlh5
mqC5kYfSTej8jd6ULHGvaf1j+WFJfTZkyEmd5StcZSFk57MWAi4XHsIvCIZe1pTcAe/4w+1Mp7zq
9lgxrMl++CBzDngRJ/UfHfE+2bz77/8oFzNCRHlMJpI1j9344MKBjA47S4qQIIYZPZLf3eiJfDtK
SZiMT9VUNqrWmpcudxg8CQj7+8QLt/qSujz3p2Y1985zqWjy3+rpfnZN1Xg3VfSjG3xBfB83mb5W
pAnWJi5zx1+/6sV86n+9tfJG6ba801cfUb7c2XeSI4VpRgNpAwBxNdgSUJnmlBBGK8lys+qggoyt
3qFJStgEHDkl+XiFg+k4A+HoqnVXGEpsnoRwdrQ+KAUjRWUMWKccCukYLtHIehUSCkgjsnhy5B6b
EuaCw3bQnMNIBKxLPqfIiZzHGCG+U5pFNiF3IFWhBeztnVqEf9g5aaMjl+UeX4N0eu98emQWXm6Y
rtCZJg9iqNXHvn/8UYl0qi0SFal5a22mYPtk0Qb2wOQrgN8KVah1p6Mg966bggvaNjFlOrwwR69N
DHFVyoEbamOpZewyutMr7ZXueISmGzOJ8J6pqGm/yQE8Jfk2+2HQQCqvzTM3JAzbEQ9+qhGXpn34
ZO4pJ1+sUR+KQ81qtevcIq+Y1HNf62XfCIEVvAVjwSJwD84n5kHqy1RSO5Mfhb02eakYcH6c+wEQ
eSNJxL7ApxB6kkIlkeaghDf/3Yf1QDderW+1HxklctBSnGa/pI+2foqNlvE0KyunFg3iqK6N4lnx
/pLain5BgeGCbnHZuUY5JetfFOo6vl91cythIDvTcKkoMXPqGzVy/AiXUmiB8QzKUDWxpavIoxGm
LjAXJNKDidNom/K4ssYefP/vQ+c2YoiRVHFZtX7pZrPrfaoEZ25Uz1y1B/BM8oBVR2JAryRgTpTb
ajXo6st9srgXYqHjfhcyJ6Gkzg2vzKMXM070Y7bVN/zHQmeMuzZKMcxOyK00rfpByhDlNZCqe7kz
g+83+KEtWTraiv5qUlP+Ki6Df0lU5CfIPswXPGfaXw0MMNkRroRJf81c7BmhPjdv9WPrpESW965K
dWKtSAKH9nldav2Aa6v/6KdrOQ07FDEJH4gsGBe937vPopkC2iDXJEnGpwPdA7Dtjng55xNccH88
fVW6qbGKHYURK5NZWjJaDKJKVvh/950aFW5rjH0DF9yx411yZVCBMHsJ0saZNN4KXoUOgcwbpup/
nVYFfHvpqbaFiKXx5iNYSCxWiabOceTTaU71eoM9ZUB6NA0Dk4g1MxX/q4p91s8E68Z0/vgZL9wV
i4PSfDhM9GVC/u+lAuW4uhVOsbaIh7mt6vkpWe5ky3iWlLaTjQk3zuYF038MxYWOVZnqkps9EnKX
UeAwXqP01l2f47uy6ZSLCDSNEJbT3piCS8V74PojX00N4j9v3QPjhosnckxqDs1+cKwaONbPTw3r
lFuSaRjscitwTPwU26Z3ouXO7ZWVqBB8zBY8Ka3/zygNrQvUYD2695ITpxVT2TzdxhrSmDVL4kYe
05QwRJZh8Qf2BxrH7TcxtL5YX2F2j7PYZZx/Vq+xPCI3vDarL+6yPpxRbYMWM0imPa4JvWe/WJkL
WNvA+MkCeP6Kjoi7xBhEVEDI34vBuT2P0eZnYgxonV5bIjsVGl4khY6Sqe+tFRkQ9wXlTiFfXrRs
231hHPh32/QxKxlsGnOTwSks2DgP+aIVfBz22g8CbRZtnRvgv4dWoqXo0ksIWjGE57GQIdKyZZ6c
7iDv1Uk+li22Ur7RLNlGrQVYu2Ns3pjvzwdmK9r0ft+IzoMo1uJVfo8TIM21kk7+SKbHkQB8A7yV
06o9R8MkHDK3Vv7GAUbf3FrC+OZZ3tW5a0j3tJi+bqnJebREAE3BVtYyq27MhrR3tBnsaGE6da+W
xPxBupPIOW5TjaUS1j7ePDcrKVhhDLXX+6Zq9VIJ01F9TzKV89KqYDDRD5g60/bjQhpM1Bp26aLu
3QH68u2NBBT3mcWEFVM6U5HVNBmx3g1K+a/mZwQJ9wcNbov77qkyTdfbWbndrJBSQtFQAUvDueHt
d+kXJrvUhAld7CpUoHZhNhNx+Uje/1lwZ/Gu4P28g64HppauGHOahi+7ijCJkfY6y3QzrXN19mQq
JpgPy3p0mB2sQbwLbQKGXSfQn7dLtNFzRrki4XnJIM+SShGi0IjPZKzCeEhbZ96N+p+EPgK/un91
1a9MM+0D372tRZizSd17l+gZKGrrGrYadXO7SnbfwTi6OAKHtpW6TWqxzWOKAz/p0J8x95r+tStQ
Ky8RkHUJu0JvjjUFW0Q4+2ZCQerqD5ExzMHPt+FwW/7bhFXCYPTyK5PdDXtOUVgxwj1ScGiBWoW+
HQCYCJdyG4OS9pCSdCoBBEaCyMbeS406JakaOJXAwbhh/RgmlbjDZFUmr9uA3tMD2kAnmK93xKIE
7GXj3+sm2g4vfV1Djrw27gX3CWIcm723DsULGi69XQn3z4kWb6brBaYtA2YR/av+yRui7W2ltQUC
QC2atwrfqXDoSK2xQIzFtU0aVNLZNaQ8kzW7uG/BPnuV9C2RsIVUIbauyGe8PwOtL2k5mkROC/Tq
tOxi4KlwDlL3xZK9BeVr9+ym3KC/Ot8wx/sAsV9QMjQKTiv3qMfgRfjoy4g1TAwrnHyf777UJ/YV
cliMe3l0bIe3gNQMs5rEO1Ww0X9E4jZg2XDDcmV5vO3pJl6Q8+zV7uz2JrAXpDs3O+dmsFFr8yA5
yAgLx/Ec2d4uAyBMwZlCfStlG3FETR4/Vn051wAaVcrHdy/ib7l0U9nVU3WJSa+TZLPgYq9X6Aze
1eDcvQpzlGxHWNURz2G81dJ869oEBFS1w3nqh6fb0vb+sTGM2QRCX8XvjeB2y3CBy0QaivWpOXwR
oHXNBkHF3UMGNcXfLTiPYTcX58eqixP5EEunnafYdJ17uDQht/VmruT40RvVbvbXXFqJYgUT8rTL
uNSCLTrc61hBUJ5k2G9wF6qK3u4OLmH2w6VjPGunPYXrMIYn7kDuYBb6Uq/6s045b6M/5GuwbSll
DwgR1CgOITLc18eFwv6N+Wi55Wp6SJKyofXbSrHg1OlfhKVC81Qdh55QYHzHADERnJ5pFSJTn2UO
OAbQxywVVZd+KqCXFrpiMKdTiND1+uJPR380ZUPlfpSwulpAw4qyjT74Gq8MpojAfTXGxwPxlK74
V355h7UTncsOZK8vdM65INhznBqiGSpbTIJUNsokGwdbjz0qImMNg6ur727Q1TNdfkySl+j3CEW8
89DnkHXRz+yi7GJIApopSbfx/m88i3LYtjGuKSGYJchxRDsg+c0ijStxLmGifhpoojwBzW4u4Z8c
U6aIAWdoAdggVFJW3dPdt4DhcyTlH/r464QACK3gz3qBBPSOgg4PT2bWWp4XvxI/1Owu+y7JpL3v
VKr7YIajqaNs4KxTvSdnthBwGwSaX2/VoTAP98Lh2pveqnoDzvt+03JVqfrXbpcqjlvHOiEPBLAq
vsODY+FpsAGy7Caz4wL5nZ3NGwiv5DbdNGHcP5EMasH1O3QO5zt0tlV2TWvIVk3UKauIzvkpCFIX
t3IzX+hadlVnZxDMwIYyU4FVEz9GwS68+obsrJYuqlQtQMVjSaTAhUlcuBrXxqEoH6tmKKFytoZ4
/qnOQSJgO1Mun5nn3NOnRRkQpnNT4uIV/pYeieJUAqNp/1BwPj8T7gzlGqmGlodug71HMEds/aRI
XmOiTRagcbicxL3T+KswXttLaaAceRE3LU0Ra5Z851OIarCrQXN8FlYYiO8nO9vxQPG2kH90xxH6
9OSXCpr1pQNgDU7VwIS13CUSqs/ZKV62I5MfiFthzP7rIS+LOyK9kZiN7VBWRSnaPSXq2fPAzvR8
JIPnXqULN1kY+7FOoeCixbmrNk6YxfQGZASJnZkZJ8JX6p3s20jWVqOzTW04QXSDPRpY7zFX2Tp9
ChFmeLxHr+CR1V+Qm8PCUjQl2JVwPGLACKFpt+T20u+wxS8eeqcSaKfRz62n9iuuIvBKSTJrzOgh
JBRvPyO2CxNutCqK49TUzSzuXdtYIUueG+xlsZAxPv9glAYOy3cMSV061mvIHxm9GeIhtVRlNHD+
O5vCCdbv2t9Bh+B3wsriaSWOpicllpGpw3t7uTTsmJbLYT11S6lLxJf3kVrDQY99s3n4IVcqz2i4
u4mVzZ/sD+gKTMoSdKyDju3orw9C9vvPgYESP1wV/05HlwPL8rFT0ljFhx9x9c1ixEdioWSNfn4o
3VEYhi6bv2UZOpS4PrYji9zSGV8JBsThAX5pEQNEhNpropOFI/VukUDza8K2ZSJU49LfyywtK4Tc
5+9oeC5k5wfMPuHTykoNSEITeIOKOYarDK9nQyAwIkWMGE1uOXJh+dXoKsdy8HXlfrps1fyf59IA
eyZ+8TRw6V7RM2L4J1cxwZ7zRzs2emUj93MGFbOkWzWJ83gtpQsuTEVE8JdTo4uG+XauETD0JSm2
mo81SMKtanx6/78+a3N8wbeTOQcSXTAqEqzSweyBRLuQhJg/geTV4T6wFI280HGKKubQL5jyn1LO
qXFntQnRE8FfXD1le1TYQy0JPdUpg8Vsgs52aY0X3Tc1hwaJnhyc6w5z8dKDvWXXh8swa/GycAa2
+P6w67qRwpAwIeS3m9usNPr/TkPQ21N0Ab7yReeb8YOumMeg88vPghNf7eyEN2SOMqwEMvC0AOqL
pw0UaYx2rrgzIMBTP7e7hZ3SPclPVLS4uKhSOPIOGuCB5gE5SoIi2+ZCffnr7n+lIHmYc5/erPnx
CF5AthzkGhYAcwKkzgpv/7c9zHQgV1IaNAg5ddVCyIFtU9w93qhNF9GJ2OzsrhdxQGXtObvIusRW
KB5AzEDF1lYXRkMixG/QKnngfpMh9OwRTHgWmawoXdxbDmG6inMoVxFATcxzphQO6bampqwjOixe
34g3/w4tSwGc09RrozxW1MZd37YgvfyykOd/lRFwRMpthyIcZ7K2b5cD8dZlvvotgX5fUBq3aUJ+
vVBe4mauVZNj+9jDjAvQsvkdepLbKaQjlm5Z62lLwS0zCMM587jpCZdpUfE9/VJIVeZYJgIB3/bd
FtDmx0ZjfQz3U817yaogMrZvuYVCKzNQ5E4E/pSkGikYh/ZOzrFNNqEsArzKdJppVQ0yeFZ5TGLI
FUwIr7kkeelTHr9MCPF2nGlcJi2yGES0gJGoFhau5vQZ+eyBKyNZ5om6UWUJNJ1f9ihVkARuP/T1
mxRc3fLPr+iBUEMJqpV3zTnbvvl0+JF1CWIkHdQGlfwxRFyk/Yqnbgegli/pmMQ99DpJ/D4T+Kod
ak1HWz3famPdQa9gKSgg2DJmqidNmmT/6xPDMvIbA9Zsk2Mj/wBw1kjSe22CZN9HUIMQEVvmxhee
KDNqVqPU542PCYUkHbYjx9fQOxCtRVe8/aypx94gNrYxR3lfUd2vOJb1sYsXsc8FIMvv/FqsIU6H
rMa2PuTFcwbXbX/Fv5seMB7zY5uIzDk2Y+DwDKGTxCnR6jxzGP8H2wEHCrIXlAguY+SKlieDAzz1
PdxPceAAsELzt7hf0pk6rV3vX/v7sLm+Zw8dFuauluRRJ/Br6PRHazkC7nvQfXD/oC1lQUcuU4Ck
1rUA4Ju6B9ouf0MJPK2fg1pEv4AK9ru2lecaBw9AKiXRpIm9M+tBy2foBP8YHPBfs9UqGj7Zpiy2
DbpbxoxgMCFl/8utznR9BzzqNzKZGSR7eCIaXJA2qQFv8frjDGAsbIkXUBkzzQgctbNoR/E196Me
HkI/FRbH+h7IrKVWG8PMEg88G0TwUZs7LTV/WbIVI+XjbIbKremIWplRs9I75YsmhTfPu1D9mdZx
XwQ9eipShjXd7TWbKIhKyv+Kd3ggQvUMfOb/r2olWKvB2GH5b+D4kkHYFZsjHxZ/XKgV9RN1UcgF
rdfrbjGXAAMu2+WQSMluG38X8EvjpCe+/sW14JEKhHOYmJvjbffLvHQ36GRZKWAafng5LDlb5c2O
Xv4VefzTWedASxUiXTGdDxwJGccejTx1pX5l3UVGbApZOB65pn4bwBppxMsjxX9IhqZvfmD3AlF9
kU9OHkEKs8Hy48bsmWUlNRyiWEQi2P4gsamCSE4AplXr87TQ9jz5LCr8jnKinPClEYsFxEELk9Sk
08lSjYC4jcbdddAuw32GAo1lgyObhrUau5y7OB5n7qMH8NYyzdjJOP2eHvIlRwbC69PLlooNY/iw
1R3oXllJZpBjc0HxjCC6hqY7PJFL4G3rFwwSiqRY31e+QEO76muXbmIgEGzrnIdJmRJa8Kpu+ajI
eNzDe6uOmCCgrOHNJuZ8RinimQHDS8HSR0mq1YRN+D+wdun3aqDAULTC9XH9/HrlHOgFT2dciwzP
MvO9hI92Rr9n+D388CGB4yUb/QFs89OWkevH8oOIWUjLicOkPCy7PgHjP8DOUMnJUhNglphaxaua
J4lWKHNvH3oRstC0pV0nVuV8zkQlskJPibuLKrLkVdYvM5Zp2+jLgCX0vD8qprcgNKko7klzlLIm
s2XzZR3v7Z8NrEdRfQTmYx2G5ZOriYa/GGJCBFeOBvqAC/02aK0yUY2eGcQ9VXK2dYE9QbVwfnti
d2CKb5L4qJ5fyJW9JPzgJwMc2s4NUeFCo4fToCwTC5LMlFHeKLgtp18rkDjczljudgHaVp1hroQe
T34eU2QmFdBwXMYLrgBBAuoGH6Qf2YqTP17OFaxhib35SztyGmZue32fEv05getsOLMjYmnsFHyl
7CBmsL14ZjRwPM282K/C/DDl6naqIoDjMeurvGxAOA9Z4xvePJ0dVH+FN3mK8i2SaVMGIX5cYf3j
utQ4EEZA+5/3IwHq59Ksnb0ja3gG0rSj8XD2NSk1J3Vy9Ltr1tVUDNLnCBkgYQaC0P4CO589BjMy
ME3uQPsjmEK552t+FsxYlH/tObl6M6DUjf6NaYZt7qa+qHsqT0mjiy3TBpC3AP1sRX+t8PcBfEZV
UxjA8OAhpuG5V2REOJ/SlZ4dZwjpHtig0RSyaGjAiu26gsWtyw+vHogRhDGbpoGwKMmXt0s/Bcld
7Kv7YsD/FsigIvg8IBF7TvUkwR3QSlkf72G5ItIxCZQfRlpdFXG0Kq0bhUyvD4n0SNj6akZowNCI
JlUO/z2p0lqjixOCmud+Hxagy1dcv8g0TJvtpMiay7OxD/88x/0zKueYMARmTAxW+X9SOZoRKm5f
dSCZNHU92A9Uiz4ULogA8iMTGInlYSZIwp3IYMMsaullZTwPBWlcKLg0jcItkM7qf2yaDp8aGpXe
0iwxYA8wWXVc3agfDPA+T9p2z8vV+FjDR5o7rVa+ou5f95dgiAFgDYozTyyeIUIq/c+3FjHEOCER
4LvrYz9tF7Gw06thd4rInzrqjkjih46jxjuAasD2W1k1oIVkmnWoxXS/YKMoj0Kzi6/Tn5X8tpxG
XoT5z0zsSIfDwYUGSc2ByFXa4XvlEV1eQe5ov40e0XR1ty5i2vHD0X4bdR85hkSiwbjPdaaHl0js
N5tdj1tVVmo+FZvYuMSwDSVI9FtWqA/D1Sv/cJHcd3sNSNg7uzVpjQ0Z9M3mjtJqenAUW4b1XWHq
B9b8fyLcL/AG2xO3YrAvuv6e9oLohb643xPH4ZinT8GaoQlDdCoDV6yBnTVha9Nhoo6pTZ4lSt25
jjKsfVEO051peK8OY2CHcvIOmA5Fsw4WISLVkqh+QWTus5RlbaUnASh5YwV5Yp1hBIGOttB1H+PK
fnbWEaummXMpPOLIkK0qsN4xFnrpWQf4Cqk5OMnhAoN0fyGj7Vj2xcVw5jhul3gspgOADmi6208s
JaQNObmt+I+copGFqhMLAnPN6HDN0zgJ7S/cGZYlxhRmaMpG+B/PklkfmI+WzwCSCZ0/0gFqRxRZ
J6z+DJr6JwtDzXaWnqzZzcluEeIVL3uEM3ca/WGIc+q5venbm1/qoK+wf8PcsytFRPaTZV0KISN8
cqrtlJj0J/S4SbJaVYK9SxhYAmyCnqQvXf5tE6Xx4NtpvZvGrCqrL79c1k8Z5kvoQkkFniKLhr3T
gvo1gdYas7gf3MEfr5HzKQl6uY991MEdiFsflWDSGtg8p23McdiXyQbAGftqhWpgwUdiT8jviE+4
vRNZsZ69noFMZmlw/bp+tCErE9cUgMqJ8m4y+n0jED49a+m5Vcm6GAEDG5ut2hiy7RY29RFU6KGb
huinEsRXVbnBJDpy/k/oRkRjyTWmAdGLCU2vflZY3AbcItZ7zDb4y0v/V6HD0pt8euPySeHCbstE
2xStrebSW/JTUPm/k2N3lEyr6M2fWFPJibhy87oLf2zUuWUCALyWAEVlZdtJTMLqlH5iNVM/WfMg
ketNo0P6dqZOs1H6PXV3awnUng56xeetAN88HHGRF1mBSOju6oN2df8iCLwJKZPofIZ42o0aBcsp
Hh0cTHC6d60NzGuVBHEHqxJXf4RaU+n3S9Op2NDNX9CXcXG0INj+MZcXergDvE7B2CQR82rvr3nu
3pzqMkoFl2pQj4GdC++8bPfD2kWpk0OqdxOPyEWl6/W4FWxmzvPzm3cpgEV0IIcw5ZTjSmRiQRHj
cX+ZRmGxFO1C0PktZeDKsw/7mOL5VytBntSDXDyozbXh9g9NQezOtH+3Jl1cgA9V0ZQwUVkuFwx8
ySLcOFdyV//NM7m9ZV+zMfWw0r9tZ/On07vzQJt0si+7b1uvzF7POfxWaTrSChefwQ4Sv4s8Zr0o
xRGfYRbzN72CEgBo8W8PBQLPAXNcrtuYp5G/GJMNjGtev5H9XEYw9ntDTjq62OllAbdX7mxE/57y
p3Y3FZMGKJSpLmBQxiXQUZ+yqfzbjCKzoPOTfMfrXU0c+Ex8Css8R7qZH7wwZcV4JVsyS78WqKnA
W9aJY8eO2ud6iQVnZvkCyx6j7BzubbgIr9PYSbLvuanmmQSTBgrzuIuMzohZwOxFGqBNA/+IFptF
AqHmg+fQzkaNCpax6FjFAnJP9SwBlx7D+bfR8W0CkIK40vZtVW2w7Wgd2uc05NxjQWT12hs139qO
HgZ+XATyf6Ctdp99bbrhRxFFa6xGeknuYDosTJyeR9Du0KFK5vb7V+VSloK9bEJfaovOhehluo3T
1s+6fZTLsqUzex8xBFhmMEUYp3OX57/RGxDEfQzr2xK5oTenYWntoB6vkWjX3seIsuMCSllo2K6c
WYrisYJ0f9KrzjXQrYA4Hf44RPqY5yqXq2+mpClLnkXXlGoKZsbUpVHJdAhLyIyvfhxBckI3W2rd
tq/SElN/DXMqdgHG7uj7O4clkfJaxKpbSGwV3sxGlC138Ft9W4NjQAsRG5YZszhBM3lvP2sEO36B
TjnJbnnGRcZNJXPY8zZq3B9qDxqK/JYNutRGiL+oSrtWUGHY+/NrfkJi/kxnsO9ZDTlEfvt4xEPA
rOnjY4vcj/xfPkV8f1Cy39espQUYje4RSETIVrAgCZLMVVdD0dyllq4kKYCHyK2NAKlH65aiWqpi
IhHMyMULQg5etAgxYXfXj2ZpnWbTCsCuVFKrsV/5HwBEvZpO4jqgXKQY7joSV3cfszNkJFgGuA7i
0Jhvg6NQldeh4swXjEuV/fPVk4I1I26eH2sg45aW7swMfqHtSzOxl+FJJPmvpkb6WRDnXDD70fNy
WxFQlanC9XFVzfuSP8eHFip0KQ8tRPs80oryPgAzBUAZtFmpesD+sZVQSfIsW2p7AJsqzLffw4Rr
1hi18cHyVGbRZfYkatWl0gzhGjB0dBm6uY0cqItM+VIwyLYa5HWnHxOGpGP3HxTzrmWJnH9yXhMq
41J+87K+P3hgyQ09cfqqSPa0ZND8P8nwcZoQ2ofj9LRG2FxidVQf/sDEC14Qh7qGwWougtUb4SyI
1F8+OZxTKkLT1JIMPqLOpjr+TtlcVY/kbQ5GZRa/Evk1GrPNE9nmtus/L98cTptHgYflSxcXyWZS
Lf4KKpAkoYOahKw4afGX7j/F4za+FFIm35ZHd2jJIG6s3Dc2UPraruZrdpyFmlDsdsm+uzBWJv46
Wa+AoEPGnS4NXG0vadWEbGzTWZldi7teKrwmT+hQVFtbBfjglx/Xgk7Vn7vcxHv9GvlWrhTKiWp4
GU8ebb+Fwzg6DxX+sVGX+g14QgJiHz33zI6JVLV9OfiqRQxk/ydwEX4NL/OGQbNqWPt/J7qUhpBT
0l7eI+ItjbwVtRxStMzYCdFhkB0Tio9LnAroyhy2QV84FViK1SktGs1E5gJ1rLK32k6r+pzFaRuf
l7DJGiBYwZjqWhhIwAb76EWxk9Z10wL+PBwLv1Zok1qXq+JtawkhJzUIcck6uEXbg4MbFCPAgG5J
vRMPcbidpB9ShJsyicUdQf2CfrsWEZRKWeB4RufzuIqXg8TK234JYxkiUDherJpzBy4nOK34OPKI
8MfD5UZbpTaHGjWxmT2ybHoglV/k2L2hj83+T0OVGxWsNHdyz8gz66xC2Een3aKWuHzZ+rhIX7DR
KX1W5vGJoVUZAwejNCFqm+uVw5A2d2lBj8BAajdVaRjL7hQOtpg+AKA6k/6NNX8LHlArsMNtPhTD
Hsj0xUqdKlktGKeDPnKBKfxdxdSpAjHGClJIrAje5peWXdES2SYTjS/YiRotnOC6qrJlCFwPoHp9
nccbEmCHjazk9prXYIzqrGUGm/Nurb7CNDuijD/PnTaL1mK6tqg4+fx64jbbfjKaS0IAzmi8r+Uf
DzwqHD/TbC7O4wFB4SPeEXbwCwuAl7CLNJzJS4EP76tnaKsHlsTBeV/jvN2S1HDFkmMsepm/6+80
MSQ/KEC2w24SWuv3I2gAVsJNjTrrLsF9hftpqhzYwS/xp9tQTO5BVfu0upWpFoDv0MRbUw1mDJN/
7ZEllv/IsuBdj1mdpf85kUPNiOIs0TNIcEaoCqetj7JNaAOHTZAirEKxfqk3PGu+egpCNKh748LI
5Y71KHJrnBthjvzTtzn3tvCCNkn6YIAeGJWNhiDHA6SE8mVRa3ETkpJIE9C4hu/Z02np3vlRclwK
9EHasPcIs3lQ7tyE16uM9AiTxxa87T3P1fcVwzVV6y0uln54ZqQGw3k+ypSABtFGiWSWtUkw0suZ
8Exo8has/0EWcCbeLnMKVSHez/avF5QKxKIbWj0J1cJ8Zy7upGy02HlTlQ+/rdOGHjulGyVPkt/0
2Zw7exAklS3dR25jDB6Ly/VMWAmJvUCo0jkfX50oCS48uP+ColWY3OsUxYvROJ5vKVt9PhlxjSDk
lBl5V1kdRtYVxuwAUoKojcNwq8bVg/6BRQKpi60IjxB5CmYO+Zv5wOpP8wVpmkKMx3JmJ/nLD+y4
0FowsLNTeqeRefLul47KfVrC9SDnrLgraZ4JjYPz4YzMZMwq9nttHET2FiW6Xkvf3wLzgtxmLthO
DAn2GsnwxN0dlFeJwss1tX3Z5BGGHv15OKW8lSvRZ6lXO11U+0mYHVrVeK0//3fqwDjoibJBH7Kt
rnZzwjF78mZwqVEXnnsGqD5j4ziCDPM3sEGP/VgSIy9dggsmZ+fUrlVe8PNZXObxRZlj4vvRItfU
CJsqCyRFz4GvTV3X1dezv8xcA6FRcAN7AFbM+9TSwunm27vaRpsYh1ZitnlsbXQ+UdoVoVgMQ7Gw
kGVj5/zMVOyNWVEdtUJN7FjohQS7Iz67y9xiO8aCXfBuR0T8Fm9QCSQphCWEW93Ko4ckVC0T5Lny
BhAJq8ZKf66Fd61G8Dne9/jrD+FDp9CiLLkCb7UGIVrqaKpqhz4yOwliftLGa9UocLzWpFNKFxKK
safPXwrpnm0sq7A7MeJH9bIrZxE28/BVzYs4QhYpqs5YxIdklw1mXNcPOAqCyC/wKXZ7v0XcJVPy
xf0v3bVlLq026KzQdSfC/F8Q6kmlZ0CzqCEtIkslRBZTl7xBklCT091J7fsrOOPFZiF6toLMDjuw
xFJq3Z0msproPYRq537PC0sY9rn43jj9+fHJVPreauoD8pEdwjOoqkQOHVTm2X/9cj7g1bBM9jp7
k55ZYxbDNxOyFJtE1HiRvdpgBNvCPibIn9AKFEfjhSjJZNJAm+UHHI2kTnI+eDLwy4/CAurRCwwj
h/OQoki2Cmctd9HKcmf5fdYp8y834zSTuuZGZovq9y8p0g9/BdEkMcpsoqiNXUyBK7VwG9mqo41z
/kRU8ugLx1tgin+++fpKcMyBJv4kylY02itpmW06UT1UTyKakteT0k/c9TKkm7uFffoOPDy/iAIo
vyTHNwhj/nP/HFasT265x/nca11tNOk0xgHORm4UfzsipPbZT6RaKF9AteJcnHqp9lfifr4xPdsN
EvksaJ1tZqIRlfq7XG6QgWcCWs7IM/cnncLltBBoWzQoRhl0vyKeafYN45TpAez7PZ1x5fh0Jij2
FS56LDKLvcLIKmR4qfRdVAXt+YsMZssDHAEZ5HjWhIflGPT2XO2vawftd20Tul2wZ16S4nlXOgzq
mWKz+inOY+xdAphw9rRwtKbCbo87XeiqgGaMMOZ+s9i0cPyV7kHh+ae6AzIXSE9GVoWhxFTmRosa
s3ZHlUcXSghbOUSx5DtFQ5ZHa4FlFPxsFJ9hIsTrxhSgtIRfvz44xZLyLbf2QQjzsaoodrk1WJ2V
9te5UWno8w2/zvWN9r+S+Tn0g6pcppF2CFe37cG9xjwYewRTydlsOi1cgj5LoVposPj0DndwCdEE
yDNz7EVou3IOK8+cRA75xRVAv4SjJuRFC18aYwF1XIcaxiectmXOcis/Z55E0hPDVub1gaLOC5em
JIHLJVwGS5NGVicwzsIGB04SHeTxR7eMO+NAY5DBsIP5kt7To8frhmQ5nhkyB+/6oaRRDvf6isGn
16fL46SAuDrthqwwpgZQufI+SXr+5qgxvN/RA55rkQngVnV5AdfPXaTktM/+XXs3eq+n5WcreO8k
yASOmUJf17uP4ek+z7ZbfS64JsXyaHnpWqxlKdhrkpHgNxPdOnr1QMsjk4KPQexKaRnhZdDqbmJS
5VFVqfv++emaOECdlwu90BPtI/6cvrZYYPHW+zq40ZCexc2gHAssCL1rj3QrjnvapUzZnebl6r9O
+MUa6nTO2XLqYWe7OJtcSICavRiJUl4u/KXTlm9AXVJJhcPDnreEPOdDUh5pvy67HakMtTFOE3y9
V09mPeCI8pDTqYOPxDvumS0Il/DKdhr/+kivDJnwiwAU0vp7b3fLSguntBfDbvDl+xVma8VMXXeY
Qw0muhvOE+jBpo2T4nkmXXw+E+hlNPUdKtb0ocNFo2iF9DcMLxLaftGDOX3od4k0ehSjRr80EisL
Og8TFcyIb8QlNxbEJjOrDQIbc41FK/a/uMn0jQcBX2Zb1DK4Kw8vZSqY8PQ4h4TDH4IB4ziVrZyi
Efq5qHZbyUOGFBQ+4zvHNJItHsE33Al4RIdd+jodpGZyRyOIfmK4aX/7urcPaRaSSeN8eyCDBa4I
fSSgxL8WuQ1eZGMvkhcSr9gm+3eAQfBdLJdFDL/cNX4JpJ12AKrc8iZM/cDn1KdZWoctaL/k9i6T
Ru8IsFb/tdJL7j0MiAsOCb61D7nDii20OYPZaS/Vdz6MG5d6+qxgjVrP5qOrfa3FNI96CPqahW0U
UppwMf52BC/IfexMlz5tSYPeP4AcqVh1poqQO2ka5r3SQW8t74sOdTsbUEzS53tL11rUq4so3a74
7C8k7nAh2xDTbiqrYqJSoSrkIpD0FDqZdd9rvjMwHtl9nRIGVYQcoSya3WtOM7LQVucHH1dR9WS9
4mwByLmmBaH0lB0g3mDKyPYWpSTOGRrv7PmeL0JbMoQdCFk3cWLF3gwXrP4R5SM17mIy3FdTNqNK
BoPRtgPwPRuUBhPwSgDCmGQood5aYOCszw2Yg6lnhKJ+VBM+4NsUERVsKAA4hQM8dt0Z9e2d2/yX
RGu7/GqCfv5/801iWy6I8/UnYf2HxQH5Jr2s/2l1Yec5tKT61SUGDgnoJhsr56VSvdnZUBJMBYDL
w1+y1EpIO1PTTnm+NTPRSvxo9sUf3tGea7GjvrF5do/toh9yKCLBAJyzmV3c6GIIpn7vWJgcJeBI
ndvcKjYw8t0Ui0dB82yt0CbXZ3hA7e9zA5PbgLw3D3HTzoMb6gbsOvQHeuII7ksfuvxTlUdaztLL
wkfd4rTiS6McVcaN0GdcTItZbYupSh5eFsqxBWVVssjv70pVP0AVB4dpk+lnZ9Olr4NfYTG6y4l9
GgSVk7R5djztibtSG5dOgUX3X3qUEmxf6ZZ26IET13w1KDS28Np/ZdMBqjmwB9pboRweKr5rE+BU
vNNc/opae0LCPISy19zNM9IgKNDZ5GVXDrfUGtux9hznJDw5gEAQV1Mpk6kQ5gwzObnUm3AW2DSg
9Lvj22UCCLk0i0SguC+lNiRtxzyB97vd66TptZBmN0PoAiqgjstMJO0JHL6uwV59nCebBlZaQp7o
/9dOHnUNCWB7wkdqE0/VqRoPoGtrEOSmxgmGoCOZU36g42KRgXhUXM6DWwq/YSG9ciXxg17BOkIE
cwep9Vs2aeIPsZkKosk6QC5BSs3jB+TU0LlP9qIXPxZn/QY+tmuXKo9QEBkrc/XSAKalphLnVUec
4B1wdiAAbnVnswrz1IPO1CFv+rY7UaUhqjJp1KclS8R2s/OI6FKQq9yO29hKaBf2OnRq/n7O3gAb
CBjTpV8Rr4SKIYUbHZo88q4Wn0PaybJHTw2F45F+FS5wlQQz+oDAyjA2PeWrvVPVctzVO/TnatJO
HOyK1h6BI9JLZdhsDkbQv/K14foBT8SiiDNyfYuLNXjjt2nMJZ+8a3PiAxJnrFTXvfwipPEmPJQy
0YeXEiOPXRYc7pMWP/lUmY77ZYenetODbNDAPoehQAtJnxDEPeRM5n+wALSYw/e6lU+d0okiALVf
3rm6D/NtE94p+0fi/aVc6NBVlIpWzuyBgMPwQuG1xw4lgoOfTA0+AysTsUlz15GopzcRXHD1f2eS
xuZBJu6KxCCqvJ9stFlGfTLYSyAJQVOXi+nvXCnzFGIc41DycJ6Wr65eIzqJAxmaFSKAIECph2eY
ZDpGZsO07VfvW70V6bahFjMiHe8Z0xpFz6LDmFOqLBclVoWIkRvq2OzSosObBoV7mmgy1s076+OT
Yyle4TEBjYGe4lnSBDbJ34fyctWGpxYYIMEiJvL+paokV5x65Rlq1SX3T8q96e/Jy8f0mVA7txAO
EsoTipg+yF+Bzu6mMDw2l13qO6+JaHZqfJbbumdV3OTrha8BYjKML32JBC/kd71u8eDmT01DquPQ
eqYRyVVdd4wk+fBn2gnuoSnIykdFXAjHMghuxPDGVV0Hf67neuHb5G4yAHg7psjtH0biD04RvU3e
m887xd/Ct/BnREmZiiabi3rvk681SOGef0ZoB0TyvfW/kRTirBSs4LrZEJEAXrLYq9B13VW74R1Y
vLU8PO+olhmjKmfQYSczqVWOMZPhw49qBYAoqMFcUqINT+H+5XBL1Nv29nGxUprmSFUUurd9U1X2
UCtGATkXfdm63JE+L1V1iv9jr3KbDqmKNp0G681HYdhoZjM8x5c3j/MSccisdY3nyXAyCD23gq/B
NQeB+k875hMXBC0IYlnqpuvlDohA83RHqv75A6/feADw02DYgQHyQOYY9AcjCekacGV8i2MERD0b
6OY82eClDzu2syJcbDi4Lh8Fr1Ly09Gh19UQKiWA5DMM7wcKGyOEQK3zvbT5eGVIlXgQNWbkELhs
fdT8TXiJywJF7uC6VXv+zBHHMtWKNr+WhyUmCW8sfXIrm+s9O3m80IxPV2/EUaRy5euRW7iDddQ4
DB/SiUMyJ2hF8j5rqVU8ZLx5uTpWx/eM8dkOacx8UWTcLYwTYXJBWOAw9ph0TLfelfLXs4ekjUAd
+Phic5Askig3QoFpINfH9yXFEF9XBl3M6ppcEqBNCeZl6fBQJwYkmbYeVGGyRg29IY2k2gwNAE8o
Go4lhNhvAruxt9DJHrp/omXIpYdzQ8PPx7VO+lyzhgWMDmZ/SIBGpSOLrilKtslFdBJgtjfw3s9l
wG0OcMiI5eMIl+fiQAq/3p85Y4wTqOQl7arfSgO7qX8devZQahYRj//LCWHX7T/weRz5UnGzVfzb
p7soZqO5Y7TXw8zeYLZEJToj7Zjd2Kq+q24IxaHQRHVN9ti2wW0MzpTebukQ+eGA5QCnPjzi4c1Y
7fbrzq5U3P25vkUeYmmWJwOeS3OmUGKNzmn8ZCqUifueN5VVroigXHuTRgoVlJivLu6xOIdYVHwk
8PxizVAIHBcNxpmlG//xfQ4xlLSyQt1zcmlaiAqEM9RuaR89Z1Xot9D9Uz4irJQAv8OB5jSRn6Kb
BNwI+HnX5DGuVn9LaMgeXA+dFmpic0w4elrO/icXwelR+ytG4lZ3OfigrFisZTYyA5xGj2ZU9K+a
4R1g1TCxE8prKvkyZVG3J5VHUlj9I/6O+PRX7MpbHbZ53wf0914/YKl9suP3d2ZLMYUakbQXEaeL
wdcQdFHezD5C2zaYB166DPg1b+/d0aV8EcBW2s8/0xwtFpN13i4qijYdKhBhxVx39TXnfaGkJRcG
84ZyUbSUwe4nXokxUNpb1up25y3j28duYpTf8uO5fPylWDXjfijndIKMyu4dnktlj8WMRqa7jFYV
380tV/gmOY8ti2QMrOSj0zCbxorMSy34VlL9PUEsq+tod46X6K57d7md6aOmTC4PffZXMPCF5mIF
FbWdpxp6g0XzZi0ps8NQUK3fkVEqVz+DJyQOhEBICFtDETd7e2cpPuwy+qLND2GK7G+M/A5OWHnh
QCJCouWRPHNoqsEVtLE6sKLfQLorQRcboMTh9bmPOyLxkc1grAR2vzn3reWNyFULcKACwHc/GghF
Dei2GiznAPWgxddk4h25lj0m9kp8vVMlfrH5YVkFRsPdO9eAK+kbrMG40KHR5J65cjuBChaZvbKT
1h5twJ03m/juxrbT2Zh3uYd/OCyUHgKXR968hb58J6Kq/7IXCJ/IiON1IXE9pTq2fiX1XD5GO4nr
Fo6n3i6nup2iNGVIVFlisJM/uj92CK8Yhg6WwZnTrq3SXCa5oWK/TPntx9ymCOgwMWZUiwS2txv7
AwW+f+2emzFkghTWcfeodM1AEBmLxpkeq9/u+mzlQ0p+0KfKOm/g9H5dCdWnGXbP3kBnVFqJ1voj
C8v0TdsDNMtkPuau34kcMqt1Px3aQsrXHOMXdhxc67EBBcMB7ifBtXYyilk01HKypSIBRuiIthlb
oMFRmYpAXs2dUPk4/3tp68MH4kIRbdlDpDYS3Y2LpYWzk0MgeZmV/m6LGkT3vFbdJQtFUmKfs4+3
6wxZph0dFuobzNsivOYXjlYEkSTkaRYp8xVWiYcN5E0hCI9pYtBLRrW1dpcJbFI6+c57Lh/vczgr
5/XigOVUGZ8a/RCpT+6bxfv+J8nIOTZZjE+qB2mIz9SxdVb1TLgzxCUDqwI9Jr5J4QQl9nQTxcsH
9e3JdbDQl8b/frnwXHTl3ozSQQPHaIm87K5D9fT8RgVZQkKkH0FMkpb5Ib3LRVR78I/DxCYu5QAP
AJlwaHFH88WfYEwgMEuiWC1UFGgjttwHtg5hBJB25bT/DY3kaOKsqZOi8cfxYYCBg9fpjfUEMVPI
O213oKGKf1xgtdoGQbUpbw8JMQ/dsvU507UitLhdOXMnjycSodBgkIF6WQSOofSIMZczdjbE3UGw
w0KHPoKYkrwWLy7Ufl4a3Cy5WcZkaMYKkL6PkKXrHpXzwP/JD51sOXmsVJHobs21jM30teiJPAdP
Dzww7+JyxB/EMIosCBx8OI6RTpSbJqTpLcuDIiG4ezmY89k2x0F5vx73Nj3eIdrveC4pCkKZkvFV
VrpuQbsUj6Oy0PbgUsVflnPrEpwYSciXjc/bUDXGzmVw0W3Gg3HyPmG3EIiMCTU1e1CwjI6GJLiQ
Ga6mJRweGsTWY3OqpcOMH5uy3DpaYpE9miBcs6Sj4LebUvMmKm6l/XkEvzdhGLIxG5R1w06XB5yQ
DsddXcrh68b+tOq1lrpe5qp/3/06v6U5H2spOkVEiyfJwsvuGQ7NDu7tVhJBiS6lbP3uxAQ07XNh
xRQXyLNUyooi2LFqM00utpBb8zuICDu/mwGCFQguFuj7taShjDgfA1KPWyU0erSTDqYk0U5Mi43V
vhmnnWTy4bvIOFv79+tUGlWSb3VDiRcplF4MrBcSzTEPEQhm7kFMX7Em5i65jyOLPQYNzfk+6NES
SGHBGj2GI1MKd5wqFU8daGiVBU1Jmgg1GoQ23DBkkl3zrCW6CxibJq3MnY0hXcQt6mBGcdg1pxGV
rBryrIiszynkLdQ5jm+Usliq7qdP7GgWaE3sfEcD9VnEwG6FO7dIyGZHLxNT01tDDWbmeCZZkIJe
N2AgfX9ywq6Vh0uhbcNl66ckbQEPv1dv630Pxeo83vVeIS7M2ZNdJDsZdeVBuDdrvRWhYBdSVsJm
gt6bLvnxR0hBPhmC/AFxzwvlaX/pPizcFlmX/GTd41TKK6gxGhbxllg5og6ceJDvOYACrqVRe68P
lgh/if0Jq+v/75YHDlmz0TX+fvac9s3cYuPVeHU6vqR6oY8tdsTlLDxNgdJ3xbVFJ10/RXAOrAyE
l0R1hopGDIt0EXO9aBDdzPqovHzhddOlOKVGzLWJUi132cetLs99zH/EAx9yQHj16s4GYudovbVO
Vx4lJy/vVPXv/rpikUlYPth3PZRZgf4vfPIKBaC+2uycWi4W+QhBd/VVc+rv/Dt7vQH1DpuURW3z
crXHLtCmNWLPmlduRScLc5CRdFpdMkZQt2vtqBnW8svKdyDuG7hEVm1jF4p3APnypc6ouF0c8C5G
xqZ/RTAY8xa78qS/Up8R9EddQo7gdtjzKKtjExib1F0ptzK2QNTTD6WGmcBZufnuAFJ3TpUDIBiG
ulxxz7041V3xqDft1xyafEkry96gTmZgduulr6RaseNevgWuEnrN4AO6KtoF27QEov+3uiQbfp4c
Y1SEYO5E5waW5fATQ1B7LX/MRitApb/iknPzNTAJ4OggyErCSV82NWZq7rAd/yGhvq8a4mskGzUL
jv0bbCZis7ZbffyRwK+SI02gLMpy2/gMbdwAlzdoQJw7xxsUGkSvltCYjcu9cTpds/NQ/lxWLrgp
REvgfZwIgVZwDmL6n7Tdci+hHKZzsphQLnL7WiQrBZJ9VrhE4qqX96W5mZU0K85uRzKARH0jwnJb
clop3HJF5TTvgwe8YlsF1oUw7UquOi03ManTSPSRLDSQiVkfZAvN1v+Kpz//R/AE+SgY2RRaWymO
hUZgV3cTXdS1tygIKfoLLvV9/fpodFE7dLXO3hce9kPXtWhYUeffTZ5nu8vX9RIRD67j5qjXmL5i
QaFu1jGsAHn7JsT+GV5cKVg8S/lPtTluK/gKMZAS/AECZb26lHOWW+ui1uZ96S1Q8KG5YoHMezhD
ySmATyignfpL7932T3dnHYEFn50NUeopvf/VmayKslgior9KHqlVSLNEtSwEqJMjfxo+uJ2G/CcX
R6wwf0NAMJ8FbeebPZfIL9U2u7KBiB+aZg8ML1H9rD1ox8SoZVTfQzYBchghHC8jHVrJXyjpQcUK
v7u1t+J8hbVBuojq0KjD9kGSQyEFFMPM//nG662kRPoiTNG1RxoMk0QBU00POmnm3QXeavq7kcmL
Kfqab7twNl8Lm4kAuWObghmsTXGWXoSsHaZk1A0Cqwg5U8SKDRsmkrdRjGf0dcrXlH1TI0RIloI2
4WznOjdd2GUn8uwwUNZmV6hTm90P0vpfbnqTWZsaiVG7nTfIlEgGMGcuEguZVI0j6NBnnS0orRxW
Doqix8keL/qqmwpCs/FHinY4+NeqhbcsEquoIk/9koxW6JHbzHKiWkt87/NHbdjPxplpTfWVnyFm
J0IxHk268RdHuSfioXVZJEP6vM9QbPF8RUpw7kr1y5sTJv3Pp1HkX/uJGheVBGy9ogIGnXaHQDIK
zQbZDk7HHnrQK9KpqFrDFkbGmTTZQXxVB4Pq2KmRKQb0ZI3/seXgwJgeR8DVPfcepQci4P29he8l
mi3qPSDJb6LBrm+fDOX4TelYp1psVLVYOfeUpYTh+uUDXy4sA2vXeIe702fwa6W8ML3Hy0D9Hzaj
v6uW9av8fQHjv00ZnYRuJDIK+c0Sk0+LjtP+fkxfc3kN6A+lF5T7vgMqBkqmPx0Ka7PDY33oVJue
JYeI525u7HuRnbSCsflS4FyfbolwpaTZqXGWaDhoQ3KOERs9gwoXYfe6L4myN7b5dWNq+xvjbt2b
/9L6ZmoiaEXamxCI6pFu081S2tBBMF6aoLHChaYMGhcMR4X/suQZHJn2/YmlPydesGJIyuq3sgYO
pkfVydXzCVVv4lpxORpagN/D+qpMkb7lpJkhADu+K6g19LEW2JLeMwsaLpp+QaX3uiPK0D3Gc+JW
oxnvqqk+CdxU/iMeyzkChL3ychu9A2GRzXeExOPBLksmkxqLOaB9P3sgvCD6X6A1hqKE2mluBTSN
PP6yWBtv1UYzkQJ+H15DhAieDT4p2tF4sfZaQAn8rUZQIumnpqNTw8gL6LrBMikJ4GB+N+hKvk4o
SAQtq1zRogVCsui915lkCzwX4d+KO6rAe8dqjsABhg6B3QfoUUJ1pnh5nBMCQKFAE2Uu8Tri6lKM
rj/PxyBCVqP7AuLA9Q0WR+RRzYIfXK4DpDNufXNVjXXaLDJVyYZ2FM4E6IDjTlpGlPSFfLDHBqAy
Po3GErAkQTqvQDa2uc6YiCRn7gs+nWQfeVM3pdEEfaKxsA3JC4lR1G8lzMHgg1sw6PS4SmXYp+Kg
UE3j/VLAFGGqeCMFEYxNWh4rrUaYX3DWMi/9CBW2YG1bVzmPrP8cNWI6U7AH6DNmLn23EvRmDuFr
9WcXFDcs0Du0wCps5lxBX6VIBhuzyt5rMKqjJ0IerJp7OTRfeNx0SbLXjr2aDHfZOB2ampSwAt8a
AwZVze528CJ0a0Jr2yRXN4R19DpN9/m87Uj4LYyynRic7D1DLzJqnOzrp0YqyiCsYcj+KBvD7zZ2
5BJcSZD48S1FTDkafh0KoxTqaEUZnCdqnqlqrtKg833qqDQWeaGVohRX32WF9Gldu3SzxJJYSDB1
emomizWCunxnlKtJ1POGGSbfL9okVoOYRArYkJym1MfBO53Ef0fHS2jsiRXL8YeEYDqgtWijd37l
5dKjTkgDycarWeWHyQreJnNQbAGMxpsHXhC8no9FZKzw8jU9wnlFmB4vSoas3xYkdwYteTfWDO6G
Ef6yxSdeVRJLa2SwnROJkh4PuqDviIUTUJyT8Js6IR7uUagPDmVlHpQKwGx2vh7RVxV+I2nYAq0W
1E8zmE93cde5GKJ9DWBQdXQd/AWSJSKTAuP7JSD7Ezf5PnucPIo3ynpd3nrTAzb1wnL4FwA3vuwa
gFWG3gUjXVe+Ay+U7//pLuGFweBN/4MW4d9bJLQLytGfpGTwOFW9rV4nlqvejoXfjKWTDchJLAZ4
aM3zAWqkDUh6gC1UvdhbKfFYJjO98ka1BrPGuwuVqI/tAZSICRQubyA1RtCu0OO30ajCQdveVpcj
yvS0shjjvuqveV6PEhEeU0LS/UDaVkb03nL62A7R2sIuBllh/ySu6HS+xRZQ1SIAM0o03owmjMrV
NwBWsaGJCn7x+m3iQRV+8QdUW9IjZLkIZGNmeosCOeCYnw29jWB+wiV4CBsutSB+ZSRti3INeZLP
6agPoowU7XbCEd6EbjipRU3Qd0fBqjNwZnLsQLaSPMx2p8rvxeegLTCHD2gxWj5DNVaxWzWKGtyd
Ad2fNDz4EcU1uffZ8Ms6hdmAC/Fa7C364MNRWVfB9+SNg9feJouxM02Tlnd2PiGEMzAW36R79Ay6
QD56CbcHPaQS6rDuVq3VVh5mqeBx3Sy0YcKnqcBE8wGRXC+BEvLlR7q9lPKdjVQekriWoT4X51Xk
THRk+xMMqw8ycdFtzvwFYlOcR9kORRQz8PFMlqLcJBRMdx69rJkjLtBMcAfX5BNFMITvacZ32rXI
2r8HfMCA1t9IMyeyO3pe46sE8+K7/2npD26zQCSL23tTy4R7AQlIKBm5oGMeMY+NrlTUS257IyUf
rcW5oR64JBpj7th2WKFgBQw7KjtIeWcrrvpQvdlkySEyMRF0L7Q3BaeAINcOciDJfjjVu3toMmKt
l0dnGt6Vtvpcj/wEnIYMObRwnSIWz2Gm4lkeSrnlP2RigIkTd3Wrs9uF8MU7QoW1fV3YLkp1GcaY
+aOI/wRjbUOhsZ39OV8NveAmo83IzeJ4rVKtgkz1RPlnGVUTntVZaHeJ4cCWocwsjkGuqpvm15sK
hZsp3NfW89O87e0Rek8sEoy9A71/cVMtf5GbaPJVR3/v9a1z10FgfQ2ZksH2SDsv7DHIrGQPysUa
kAViG29u3cVnfyOSlF365Gd5/gH/KCK30fVFrIwGDgdMeiRIrVK8Heftp/tWOYerm/x1w79QxQnN
1TBXqHjy2h9UGJkzVIVDcb3l0CIi4OQJWsrpghoqHcszlt78WBIjptKQeY+CDv54LWQtLsUH1wCE
FL4ezAT5zHkZPrbfbjN8QEKgaLyzgFR+8Z7CioLdz0bn63xD0nimDYtqcAc9wFdjZXMo5qaGJ0KK
EfZMkhBGbREIetLOm/AbwSJ3d0vLV5U1F8FNI68dwFsTYTCDvGGBPeiGbXMXuDLEuIiHRk8K3mCR
Nv6hT2S5Fn7gvKGSLYowhg4cbPfHiL1fZyCnKDna53UBOhWTvwOZfYWm8gFCuwjPuWRWh4sSO0VN
t8a9Je6o8kuVjsIFUPOjz127yUIGgsRfUH6fIOV4ZECrZbuWxnwQ0SO1gXAcDXUFJ0j+x3czRRDL
FzyBSq5UH2NLSQ4x1xOWdWi7+rSF+snzvnHbs8tN1TZTz8PX8HAzMQPoZVYO52TW3h5J6BcjmwXd
Rp4jO/7Z/KGK2ImVohMgXxw9PlUMTVWlUG+rLSRDCvdsdun2CuOg+2IqURsDhtLHsmFN7o5X02PL
IqdzFCiIXTPUjVlCqHvwWvo4F7uAIGtRkndlETk5IPx+APVmNN1yS+VKd7Dfh41p3qcduYf8bMX3
RyNj82kXBIE4BbQBrmhTql7oEuQUbUOF6rRh7ht2jQw55/k4qdFjvbzYmLH2/gru4fGVQvQUA6tw
WtOwXNx8codYab6c0XV4nrrPCm/9eyXS9EEEq7m7HTiN3EFa+ollgTWwcvJSrBB2dUgyqroG5hoR
weevaz04Y2+JVQFBBexUs9SgLWWgthDWv3/1DewGsx/YFCnUJzircRrQSErxTrVA8+q5wPazqzeG
Fhlv8lji851K7VaZkQ/B7SfntpiM2+fYFCo3GuOHvdMd5HbdRNXzjsGCw0apOTRG2GnNzrMmkfy+
vC6UEQeOKomEoELwkH4Fok8wvYtpyEAskypvqjBcf59Gua7Xlg7m8DyGZiuB8cXj7zyRtwHesQyq
0Ji2AbEHxBgm4MMAkpElNt9VEJljmorb7nFXwtehw0/Q6/J64t972N0nQzh7OYF6QhVxQdu55XyL
NEIo1H3tXPj5Lw91ZGwn3iKzeuoQoS9rviVG62Ffi44jitNZFuVd9fThROPEukfwjjVlPUSsh7PP
Oste7JebJDRhRZSdLjB5+d04xKqq0EevW0uLjmHi2nXVa8vLaQCAAJAhBtBJRHE47DccgH5eRo2n
ZEIaO8MJrizryJE83+8tKhgAb2jCPW56hXgOWyZ/tG6roG90HL4sgPTLQNksu5ocdet7m1tX3kAQ
wQwzUK5hJGYqjDafcH0+C1F7CpQaENI3Ede6dTEeUZfK9id/0iFD+6TlNJkKNQCg9xqGKtI4cH3/
PnR2NSyxSjWrMwO6c4MtYpq7cBLyoJHUZXLXF5pByk0MeWj2GKgJhBsr3HxYqKOCEy1XistfnMDI
4RkV8/a+iR0GYMXz10qJQdeARPlnYjdDIN+MC0wgo/YHsfYjYlYal9xCmt1dGDsQ64gpiwE3KC0k
W1T7YdnC60+JCx2FJI/+9q40Mkf3VjxhR87bCsEc4IV7P+WksR+/Z07dp1XGbWSFN8bXyzSgCDdW
pBOIKR++xRhyosBfqRjbMZgA1igTMdPz/prmXsYF8umbLXJwuqnGLHhDNErsP55cZTerNSpDEQ6M
ieNN4ye2/pAJ6ZeJfoxxi1mM330Iln7ee0RtMMvM1S34LzNaswivNGUsHcvm14NU5ZxpMwa1DHFb
bz/wlBWRBLyQGpaolIOi52d22e/dqHDfhDI5HVNROIGAN2g+Tho+xGTufSxe7OUkHM83Gzj19Cum
t/oqE8K5vTGG1V0ANGwWbvYUs4ebdWzrjRBPPn0uVH0+33mWtZSGeJuSbAma7M6BY+7TugFoTLBg
VJISVzefq+5v/ERXaNzerItKTPzO8y4MVGWDOTt9qs/Vrqt6EgKfOk9vopZOPbLYDQqeeyYBZnfb
gnpG0qwG7l+4mcTMnJ5o3PI8Ya8UDsVtFmJaRyatoOVGfM24Mtj5QiGWozIskytz4Fhe9L1nXamR
Q32xNUSuM0hjxP6ae9iDgLoLzXFsp56O3+XGZgnhTFRiUCgT2vc7LkNhOEZcgDuAd5o4oclu+BLy
vnvfmDHAWoGkQo7hNWLM+z2y8gl25P5zDeGQjszAxKrHtlShGc3TyQ3HQZ36uVssiPvg9Aakmfwz
WNnKPMmFqXGhpGcLMBaVqaBUG3MgU0N1mTypuhzygLAfYnh3ZPh8NNRFu5emHYV5n1dWOCXWs5lO
Ns56moKPyxx/EhiUKnXUV8QMua8oqd0nXl0qEk18jidmGzm3VhwlShHUYEsIBRwKg+lFwrXhPAMK
RNa8lWJHlriNLkC1ryohVxUugEpNr5oYafaZr5pyHvsY51GQlS6jEIU5Ec/IoJZOt9Rr9tmDVpdy
FKnqMmeC36GL7c9w+tm90Z7Rxv/jBYAXctO/O8yfiU3Kqx8L3FwX8N5TydBjcqiJ7+nQ2yZr2sWN
oSWf5zpTaaBRRJ9NP5EF75abvtPsPsxg8XQl62TwBIlS+z4VlgcujKn3gOeH+Y/bZw1gxV/sd4HS
7wttEJtS4ibMkChTlGuohf6+ROLlXMrezO4DvRQdGDKST5MgU4/vrMKNb4Kp+QOsSNjEuPSs6amR
d5XHUcS2pbk8wLIiCkKYGmDysXLU0qTaDZCVwqJ1IEBpKt200YWCM/d1iFVXuzoCgRAPoVlBpoku
OKRxFOFaL8kV7dwkOhAsvu+z9NO5NgblwRf8pLieoCWctLntFVV0+IJ2iImJPkIFqwC9zVUC1P92
WhpY/J4Nn4BL32oD+QxZPu/qwHT5k0NYLj2gG+JxwR3hRxNhIsdM/u+fYPOz0vZBohz+1IlQPYJF
zq9nco0g6JYRPmsMHUMhyKL28hO2F/+8zM7sDwSAeAwgbbeiiCmyNrbVVP8oaVteaT403FcSRrsR
GLeefk8WrBE8jFuir3gIz8fLVMltO+zAT4XCGTOT8MSqwJ1FSR3BTFHdRVkTQSNn0iofByi6zuZG
C8ZesIja6k5FvDrII6i0i5pK7mB8jRkLwLb3eQ2dwzrEavtDft8HM1iqx/8UWMHY6L1uQtN1xlji
fk8/72u2G/o/pkoHfwWiJXIVtjU0FS5Jno2Eyc3fm4oOaBW9xMrUzYqJUEwm1d2S/A7en1EiHxOk
ArpiNrddHnwqI5fCKa0gZALYcBNnRaqekm/UzwsEgQpR1tB/XqZyZalausrTfAbWX/VjRE6uyONy
k3Eyq+GlCnfi+BffFvud8MsUXeHozilT5xDQsN/WuFzUzbP3phCqQlqN1AB+bFek2iXVhKI1ff0m
oM99drD7eVKH6UHT1Wn1iT0d0Are8ho4dFr4PfWH4mDy1hfUD/PhDXCr/xlcYMh3glY2wF3gwp2O
WRGfFnZDy4iWGR6tk8g7sVxZrfkIuthrgOrOabZbrKJRGuKVGi5bFsBWJpuggWT1tHJmZWHDC1r5
nMLyn4AcNW4cpjXhkGOnAyYzp77qZSAzP0d8uJAULfBK36VbVv259fRU2ct506LMZFsRJPHcVjyE
bpSxYmhrrqdbrdlRg7u/GPvHFadXJmGapjjEumjCBLjdEgb3siyLZLFWE3h2p4enaHTfT2BDDONg
XCq+HplagRgTbMk2RGmRRDgKkBLGC4h9XqH8dx5njIgnEv42+uKX+PmTAylbujliOTXnFWqHI9t4
mDN2QaLzHRCCrfXt3rfXoNX356xkC+R+T7bsSYuW//tPKXyU6gE4mrIGdqkg7ud9nKhBdlkhKAeH
BoAv3Xp1sSj3ppB5OTmmEBrxrMWctTPTgMFy+150Pr79jtBNjvBFmBTkZBz2s66x9cbDwZVoXFD5
aW4RhqIYxhK0yJN+hXxkU2ezutNrqFNTppg0IjguavMtgHEDhrSaaqbZTXSvb4zW6hPQiDVLEI7h
59nXzISAqPUKMrPcl2bs0qzNMNzrbyQ+M0aODiIVCP55ONGR+etg3K9jz6vfIVUldURi7r/nH/A1
J59fhEu4y8uSg/7XIZkvjb+2G/Y/dTkKrNTYFhSNUNYrlvAVRcEBkjzZ7+NoUFH1eZeqOGj7M/Cw
Dx1EuBdHswEi2XwGEFTezWcsoBEIdXsG8hLisJMADZWZBGeJXLsFKdClK0qre15CHeeQGQLMDvnl
9OlXJv1StZUEcc031w3uhjCTzYEfndim0avXAgHxk/E2EtPmAQrFSDHgSYRR9gu1TjtAUSMrpN2l
C2ocZLCmRe6+fIBoDvRbEO1Zpn3+pokfU6fb1IXYFyEA+RNsl246n1/Zj46gVW/8Wa4jBz9+4S35
aqVEq9U616uspnulaB+KoWYqGo3iOlAH+oiViuJ6KjiPVM/9SW5Ll3zNV+ZjL1SFIYVUjdTU39t7
/wrE9bOGNzIJcDVnOMAlZbGBHu34Q3L7uNF1O8DCROXvWd388/6VbPTmdDWOgqL31gvlZ7uT9sAb
Ei21/Xs2Lhdkczl0UFBgpyL6fhfLQ0TWL5lbwrZ3fZeOJnNi8Jhqnp0N9eTzh0ue87RivQeLRdXx
hICAFiS6wemF34Sg6VA3b9s5zT+05ll1lCOwFkbnjcyBE4TYaHeqoT0Qst59MIBMdtzugxTKyC0r
GLfHKXfm1l1M6AWebqyjzs/U6e9E2Pgd0ahBYcMAgpQ2QL5zlzW7uYs7sNvMk/pG+5xz2WcJvzr6
X35hCDDOCc5ba5UIM/G/eBcLdnxwPQNx7KZFXuXhnWJFRpMKpGtGEQbrwt0unohgMH5GYNYMTixQ
XOAYg2sAhI5oFndi2Uauw5AH4pUKWdi76MT+CgYcrPHeWYD+tGD97iRtGBs3FbgEZcKR6zT5RIHp
HOAV1BjChGdb+uhvRAMX0sy+k/20s2stlgsNlQJ43RJzOMyhzFosPTDnCW/ClTKF1w5uIPLl+XeD
fyTCTwwG9Wpas+4D/GWhqXYjPYKLMhlqQIY5oi7XD+/lfVuvjWsKlC63uOI+RzBI4ZflEiQVD4cj
35KQZpXQe9K40VyVRpX+U9fiouCgOX2Plh4pwGGgFivBeiDH/K5QNjYKiy79SRovvAm5FQW9OsMn
samFGAiG1ccMmKlJah+tcDNvV0+5rc4iqGZ0rv3PA3/+Wkfcgyv4QRLpKDobHzdnxxrIVNaFc6ZN
IknV94gopxBjx6SRqVCmT51I1s0CpdnRuEi+sZLIxhXzp3WmIvA8+A7U/kIq/Cgv1/otb/L6UOio
bReroDk1hwqlCFuenCS1FC3xa8VesWjUeK346PFQ2Ap7bQ8Tv+F6G5XZk6csZB+TBnnaXbscdZcy
SpVSEUHZt9k+S3DF22ox7n0ELAqS6crFBli63OKZaEin9+KmqJfLkgtNctDL01k3sw+DhXEptrdO
QNYHbPoVPKK9IEIC+2pPU1IhcB1f0GYDcY9hX5R6GtXycyx+V8cTGvfZuUFi6XhkAhuSDJVBg8VJ
CUAGLCExaKbuesB24HndW3cutidsJ9pNCcoHKy5V5RsEFN1c5ZEQ8pyoBDzBmTaltKuVgIYqxxMI
vlWsGcvbbaBPjXJLJEiFcc6naRRX9fHR7oD1x+mkzk9l74iiVR/FBO++WM7sukxvD/hucQuD1O2I
zAy20tmWl3swcynAp5sTbM9K89Jh46UdGy6TI6waFcH97wHDzYJ8vpW9bEGU0tuXq06FVJ7EjZeA
wSFBtzSQaVhpzs0odjXlS7NuMPd77A3rSm4uj543dD+hnqQ5zccfbz5L29b/i5SvleZzgkwaQXHR
st9oy5ozwPV7/t8lM725nOKAEnmAGPiUWuilD8lE5LWWDJHq8wPiOT/LW3lJLjw/xgpUq6tFeYM4
Hv+kEaGlHC1tFJ340ZyFJSLJY/7IFLPkKljawdzdjYKdtXzXBhf24lOEbVbwYBhmM1lAiBoEn142
6pszWNTIC2DUfjmsXfuEyobgnM61RcQiFMlRCCpI63x0F4fz//sUtvwelS8jeUCTcbcMIf/bZdjy
WHRle52j9Zqhqi6UpwG2kt6gG9wb36OJMZKz/fFnBsqZQTgta4/1JP+W1rYEA4RMGFCgsYjcSNHE
8pG1PvvTPGLQzWEXjlT0rc2rMQsvk8VJUHdZPGeUAljtH75EjASmgik12KxFmGLu91FLP0b5Bvxm
RPMfJyt+PrCCMyQ3FO0U0F5b2h6/tqJSxysZ8+7rWn853byH4RYXTc2PJ+AVEnCukUtC1FieW9HN
wSO3sXEtV+EuMlSmL2JIXKrALQaBpRBC+oGGUrNkPxGkE+8AqhBxJXflXH/YFW5Wt2xcORLnc47P
KdKzm00vcVTwzEyqKkadAMrWhnWE3XmTyXbo4i8twHKyvzOAQbeH5g1fVusCinx116AvO1nfqI+L
guxRWD2M3dm/7Ykb3WjFl5ldEzU1tpzAEzaKKp0l0hgLGQRuatcxM5H2g7YmV/Vjz5vr9FBdefk2
+9bXX+hmMH+SSoQ5Xb+gaaN91RTyMS+yrGCHldtf0dTPtqGupwJc1ZFWAgMYPEJnEnDnsAlIsjPE
slLbKxU7k97qkDZt8+4hysZllNlP9BciHQp/pEVbBYu+jN1jI4/NiQNM0zLGlTg01kIVzRByujEC
6tOuWvSoaf/KGZe0G2SSpN2YBqserjwBteMSoljn9yvgbV2yZOGkfABQhkUPbsFC99/rFDNlKXHP
DzbO7FY8jJ6RB8Q5UDuPw0cXdMmR8aAzjSCp7E/Ek7FMs4d6jEgJl0M6naGikUYMpc2heFliypmt
ElXA7wfSfpB33edoWDhVWB1JLh+WnQVoen/oVBsVSal86QGCzccCBkJ6ldLYo83u9xlnWJRvUvht
DSa0NbnIgkn/nd5ynFjCdG318O/0sR3A3HCKkNhKvOLHvPJqHp8JELCh1Q/xiSeBwHiim/QOkk1e
td1GmYZqjokACA+oDW+K546toAQN2Mkty5+4PkV7A2mWsVU2Pp/JQpnaX3KbSaHtojjn2vhpTStR
Y+5cu+gIun5Oh7+5DU1pV0rvk/ZjlvU+gj4CU0K5F3CwaofolrSNWdoPIL7ayi6fwzpC3yBfJPWg
NdpeKRsr6ZZyPqlxMIgIMme2lAWBk0Y8MW9bP+y/+cdgZbQ8HY1gIw3SMyE21Yj1jMx+iCAuHgCo
JCFxEM7Sl7J0qHJU1dHmPHMgMftWKPr0h3gmqWSeuw7HrfPGsK4NNGnnGNdC14yy4EjwsWFYICV3
B/s8md210+qCUhMuAnWqiPvZE2hoH0lEeWs4HU29ACT+ItDNnS9k2XiZ0uOrVy+P3d0hRvAI5n+Q
lAP7981p6bxj/1SDuG5OdrFS6dAnbOiz47zEe3HJWrMaHuTF/mya8nUSNV/6ItXRDTNa2nKK2ZGd
w2y/YR34FwbyIEhKz91iYPbLMy8MNGzOHIJ9Q7BzMNfTucmfL86hELBP7ZeEmxhKOhO+f6vTyStS
0i9+QcX7GydJCEpWB9eDQctzrElKPAOAASmkH7jdtXhIF92h7O3m8YPG5uudlqTauj4QPAD+Tc3j
bReyzFfm+re15Hs/HePjGKK9NnqMq4PeIrmFV9wwy+kFwDn/knuarN8LDjMUNt23zI//UTX13lIu
L9bC5/hkm5aY6SDvalhTp43PY/M6s8fdU9fYKHjaABuE2a33pXP2MN+H1t5RYcxbiu7C+/j16Oeq
mCa+4AORaFNhSG3S3dccMKu6vE4s96HvwwSrQf6+Xn2drqoQARDcw1WcPNs/fTgUtF6XYkWI+Yo0
pDPrrnAlaa1nwC8Id9HXDqHwGuVyASV2QDw9NPvn81u0r1dJy4yyHIJTfo72oy18DKNOvtGi8NnT
lqZveNh1RUjk7gcbj9jfygBB/rmlyBCN8huLp7kRtCP17JwFVtZWGK/iCQGkUIhECpgl86sOKsHo
iIqzB5Da2OqRYKjLXbA1LsfODPMXmO+aZKaqmWybW1XPRHvdosCfVckkiTo5JBodeR1hzHqOitK0
KrubEdHpLXgKnaCwRmy4MFip/M9vkcTJBNacyBjYN4/1QNCTBjWW08UsANK+1AM5y940jH7HYwC+
N3bIqjVtgoS5OTCTl3/feW6mcdIH5R2ZjkAzeZpOpJOXSkaIccjNmLXjvL+DtzImVuRaWyWa4X6Y
dpgSv6bwRYKCaqKBG817Y0Da9xpY2C86nN10gCMf0C+smrDIMJCe0wp/LxxuviArpVUHacvvDh3c
mNwAQVd6J4H8odZZlN8wZTFF+PzJZrX7hmQ4Z2gUaRm7iCeJHzci2mrI7Lm+0RzS5VVsdAMkJvE/
4aBp7U2CxjZtpX5auaY0RvKLZVUX/vmzAbqfflrKVfKfib9WlO5kp/pKaZo8Jqfrh9IsZnbA20iq
jL82I4L0W4WUO7VngGp8Ub5lfLZND1UR2ljFW94Rrmu01b/MDW0t8SKH6Dmi0A36iIlBxM1cyeKD
vk+1ZzYaFAW/Ccd/sR438CaD8EOenb8m31omNtNzWx67+INT76WrxCUikuBVyHyXgH0JQBNMkOeR
h3NqZOFSbB0Y0sX4MyGMIsJPTjuC187EOUVTFjUfYNGQ2+7BE5Gm+mDQ4ssJFVtiG03ZcQt4pVs/
8sFC8ulVThSZeEwd7sTRAgvzxKZgVkgyNgzXf7Juz429CZzL0cRIIL7v/pna4lxKMYGDscb14+zw
T15CKkczJrkYcHzdZYwdu4C7bXjbkHtW8nruvrJHi4zUHuZJKO9HPHugOOnjXEsm4S/P2QBbXRn6
un7fv4o7nCaF5KQx9ys78Uukboljtku6qY3TeP2AezAeUvjsVIQhTMGy79FCS3iGw1fcWJAtbPOx
Xr3jODYF8Xw8y+L4cKig+B8PYNPUOxMIktP64ROJd5VQcpqaPZg7998kZtL0S/HdRBkecEqhvWjb
/Mub/KyIvgP5x7mHAw9J2BaKzl4wWQ7+M2GK8TgJ+Pv1vVRNYXM6FgMf4jn5JGBt6ckZkknhMctL
hRUKf4teTTHntmyIJ6lOzg12imueimlCclvfwWTVssRhQn1ligfT7QorztzqRc10hCD/vZePzngh
lpGjG6aaZuqJe67qmbFTKyUh7kTXidNx3CkosFEL3qBe2op/olWQvBuw/rvUVBp/sFL4Xnzwyrh7
TvoN7LOTVn3Aq/JLXoghMrcAx9LO9bFy/gOMMejCzuq4aQ0nsI/AETA0YWf+fscupv+DmaR3eLby
0A0a81xBP9YWAtQXk5/vfsZ8lNoORooJ9LVoTCf99sEynU99ibFA0Hb2A+sEWGI1lSyDtm2+1Xm7
U+gSJ1rVPLQJ+zaNnJ6jlnKpb8MEoY0Ufa7v0+5ZPvYy2FqXQmlyyWYYBxr9Q5CLD6ObzG5ZOFVA
U5/L00Uv1Qa32EjqsgYmwUpCbKcQoCsswtkvzIRS1ApXyJ9QBywdsSp/RB3YlzgBFZkVCK7myWB9
sWk8/5xQ8fKAkrubT41aLs/1/fn/wHlTPtWlGuVXeYKYBwGeHzkmxDSzg/e3pPA39+GlwWcGqBov
HOeZTDGZPZM+yUuvKBY/C5BGhWU+199ht1gwTSo7vcgMsM/uyacSo+ugHcEHsq1Ndo0lPYd0DSTD
hPrw3qjF9deJ55KOU8OuVqiIOSOSBLW+zBHVcHBd18te598PI1FmojF5TB4YmVuiC2R7tokuVuvp
NhyKeIuMb35l9UiOa8AjwvJIEmAReOKEczcwjzytV/4983J3Pt5tjCkrBgm/42vfDoKiE85zlYr6
GJ5PgFXwLsVQ/q6r7hZ/9/5+GVddxLK2HjcfFPlmai10tYdZAttt3C5aGceo5QpTimDy39Qvqt5H
ThRkcpildK/HxXl5gPufmlUlcHEv5q28ZQUThVCFUUiqdd7ozMP+aIgizJ8HTyrU6JtT8YcWG+Jp
FeP87uU669vc3RFZt1ymElPKnuGMhxAmeDL1v1DwtH04PZx+qlSweEw6IN7Lkeuudbwj9I2YpPEN
UW7l0ZVJUEx8iCakEEIvyjxC8iRfZaflUE1QDWEr9+5ZBoQnq4LVvfaI4WtJ+Euc7+3X+ummd9HT
h1zE2LogIaUmGiEl8ijv4ZSVP58grsx+MYLEAbQnmWn9KwZZNlORB0BtxaDdmBwla+oNqjB86OPX
mOtB+tPdcLKS7+XNgJu3HBWHu6UXA7zFOj3tkAZ/iDC6OLXnPrmoNLVqlofpqgRukWqSJXfBVinR
xmDebvFa8TEQM62uJcfu0eT7KLVDPDOz7eEtG7DQod6/EG3fqMjYWWquEednGZKl1kwSI1dibvsA
4A2YzZwG12LOWKidJ8qo9AmRuGfl+d3QKCN6n5pF0mjhYTjCF6+JCQDsS+7Nn9yWQYeV9p+3p02U
mHTDXwIT9vT6Xg5d3zP/EKW408z0Omv49bF4pXHsjaoauuJUYrXwNw26lzX6UOzXqw2qqqg+x0aW
fkdVzjlk8SMfakvbmmExmVo2hixVdkWukC5HhZ1M8+rLIBMYZYZ6ZhhLLqa+mboQhvVo6hFUk5nJ
8V2clVSe3b/Cx7BdzAcw3Mh1oqnrQANTQIdjVbLjT/EBZjfQm0zWBfC7RGqN2qZYPFKo3fnHUenu
ywjF4sTlK898t/XLwvwJv1DICtKD5I+gdIWjfBs0unwzO+EJZX1s7nlBUA4jim3kR8BejZX2J/TS
8+ZZnYO0LLdsu2Y94x4tRdbvT6kX/JePx4ZSfyCwwH0ruHYD39JUsz9fyemAqaRSwSz5d2fzmLdB
Hf6fp8tsg+TsyncoAQrifW5x+YkgkUsGGVehVBnEagObQfgChcWtRI26NuKZVRdXOd09BTfa6WD9
RRII833l+EkrSMjo1RgKerICDWHIkoKnzt+UfdF7ExPDJodp2jG11Y2P2dTrSl61SbLrjRj4QHdF
pScV4ba2ll5JFqlg5Gqv9LPctp43YKqtfu+FcvKTOKXtyPAvpos2WB/Gh1lCD8GBi6cqQfj/CJZP
ts7wy8uwkcu7v7uC7vNgxA6FMTEsRlEwrBGFtYlKLbndXXZPWnGFg/j/9/JIbHWsB17yAPnkB+G4
LmrMlj57nH3e6uLWLoUVFnt4UBJW06EHTNi4I+mEIFAbmoJN2J7Mm3S2xQoCwH5BAegoE5/s55qQ
2pEJDrgqnCwKMqBrs6XukopHMFBaW/bUWvb5C5vg63K0CWyuGndgQ9brQ7VntirUcirUCmQZN32j
v5ZaR4Q2dDhW8tIXbwxEtcrKVRywqaIa1+iRl6EQkqOXuJBw5+c653jTIoubd35ABU6QjKXVfYzy
/ZyUBmBy8oH6cQHXqSeVt56wz9tsEd12lBew3WUyuVBUEFD1ukrADwXpSrrw8uMmlVlQvpdKScUh
vfk7Y37SbBM0I4d3qUsLKqXTvIjT2MUCwdyFDZfqStlxS46IMZdc+P7x2+2OmHw4yq96zzqfS0ay
x9GP26FMUBjHonZsdaoY/2MwJ/oSt7yKGLa4jBAW3xxUuve5B6tqD/HAjO+2h3kwGEd+SZXkGNC4
/Yv80Pw2+VLlXwVhd4k+nPhet8RqqNE0NvfCwCwu4Txy+oRYn+8VgcpEb/L7NQjA4n4uviK6wd18
oa2LiiqVEgRWL8iRPs4JaL4zndDM3DJDOB6jZNVk79b0AEileQZKGo4b5fASnpkszTeztBXbZPBG
++H9CiAAAzCyEx3pr/eSXUEMU9PSNtou11oFchdaI6SXCog0N/AblLd+cWL6R86xL0nteu+nLVjK
bOGuwiDTXTqrNAXtTi4QfvCF0VFYJPgdPSH8XrTJPfluYVDabfXRfBu9j/GLp4pw1ocsqZNtbmZ/
wfFyK7F9QDZb5AbNOchRvIrwBECcbeGODJoQ0yjDhIDVsfpeiaZlWpPEGX/6Je5bBS4gcuMxKkOl
+eqGg8McuPKKvmsYZvE+yFbWIPZSCTBCpUsVS155pKkI4JR2hZxvtYYD7BDF+JtWaDrqOat/EkHr
avoClLd1fof0dZVo+XvZwclS8WWLqVyDkIXmX3JffvnPfUffrI64by0MM0LGRPRJ7hvismyGqPPy
VpKoMPrI1lA8O/GPxzvi6Q4L4W5mba+Fxt/innKE+n5xEBlPSdu6a4ITuH8GVrbZ8Lg7ZL5EFh5w
7R9lDBqlFj6fat/UlX2kYpqzX1UH6cPF162WU1WeWhn2psKGOr8W00Dn7xoZ9DHS3WPI5xgc3iID
vEpZc3yArEE8Cr/UUkTTOhyDsJklJzUk20Z4f+hcvClgbQYFvOr8x5u96k16cwB7kJrAfO9v4TLX
0uKtfuxvL10MX3BRF+rPpTr/0fGmVYs45hZC3p2GnkXvtemjnfaILaEA+zQ5/Zr3QyKvKp4IOEnG
aFCYEWQF3XYyf7FnfYto/520DpG0iABoovHqXm+wuQErWz0GFhYKA0huBatNOFJuOyxLMJmIOye9
cKv80OJsPP7mA4gOlAq3FwqytTxBCOAkNz+lvfpEiKkhvAJVDbShFwljc1Y7i9vMLBOIwfBNkKFr
FxX6UAaE/ZomTlyzy806tGkyMYahdryXUvMDko7I4l9Jith3Y1eMQXU3qL+ZaCsykIqbeYSZ+2sx
0ZmNwpyWe/5Xp2nsk+vsp8xkI6pcS50Y0PFlEZveSM/LM3cSObelH2jDr74pjVH+jCJ2fpvklaJy
KxkZVibYDTrGLHrQv9tN6yIQeMPud08G5poIceul1P+kPFl+OqTmFNX5cwnd8satFLlELDLchSeN
lTZr8nzLLd8w+46atQQzLTWABrKsIGSusGOhPU1EDRZcfHEn7FmpmFTw/fpO4Bskokz4FWMYhtwq
0dH2+UkDpIVlk16+R0vCHPYKUSzJAtdgK55gb3ev0VzOBBG+/+l9DfNjsT80g0J6VVRO4W7jdh+e
S/c+uIt0KC+3e6UMf3fNv/sgo4DLmylu0mvhYvbNDGuv+s49qaCtH0lkRakrBN1qybI1zMvhINN1
aB9z132t1VLsgvGR9OccRzBU9atZjdTNIu9UQrW8GeRQ5yzNxOtCj++0kV8m1coT6JABJoJeMbQB
4utskKWJP7JtieE9dc0JVNuqotqQr3FHwv3vhnwgj7XTKCEr2mmzM8L3jnY0IJ84EzU0LI7wcQqk
lvW8Fwr/3rUswR31ojZ0dY6uDxJrpe9zbgNZWzCgsKRc4nUhH9a/3pnEKPxpYoyBx0rei6aUm+qr
5YHjA0Lob4IDmjtGrka1aHt9zqZVHY0DOrKIXBHgGAz4IjE7uipz+Vw7VwYR2lbDlKMyBruOQmOT
lQY3JGzqU0zyoxBWGydo4/tX63jNAvLYrvSaw4svbS+AyabwHwh8uGwSKWr+JQ6q3fDjMv+tqV8a
uOd1tD8eQS5bGxadgQatLPjHpAqa++sRoYV0zV5mBNE7IzHq0o4c7Z9zUtfWmvKY3MEBD/aLAlki
UgQP8QVcd9ugWzctyL2vZfT1O1SOpUumpU7eaOVWCzL5p2DObPLuuXCkSJapG2zLf039N/VLwCnq
Pec9oRBJ6gumHNiAI5zi1mvSafv7KcfYRuZGHP3TpObTaO2AcyNT2bqKXulsmXr4Lf61JSJwSYA/
blzyWVi8FUkRnebQ82bTU6uPxrEOZFyvZ98sJKfQASMVrjzy1nRA6ScGj6m/GNqlUvvGK+dGhDbC
Iu6Js/txbE3AcveYtNQ1JYzSxaOhY6CI01H7zJs8a1Z/tGqRLV/2smMJci41bhFYupNpehD+lGkw
lHgWSUij+XlzlZyOt8lRpcjTJDYcNKyqiMlMdEHMJiykC4/4pZaOc1QsYODKwyjk+k2doLG8WVcx
HJBIfD6FADXBraJvD2VIUrOm6zjPmhX2dS4BOqsNtEeXU37sG25dQjXrZ7X+JxgIVGfxGJKLsbJv
0XXTx4aAByoVw4Ei7PslP5JAiBHcOzS817HNbOBxr6y5naU1LvM3oOKiWZYrCsiBBkytMEzlj3ay
7YF8NYu2uHHe4Wz+rwzJtFVreG27PbkpGKbVB2E9MzEAzo3flSkeW1PwbcB2hHXJvY7bC9JXD+rY
ihrQRYU+If04vILwnmj48aOH7Hg1viYHJSzjYVWPpBsHsmUoBVPqDSWoNa0a6EDJ09AMbB/l3HJ+
nudscAmjxbDu/wjHbWN4dm3Z0LoAR/Gsoc5bAwypOo1x0O2wATKEiT7A/pHPFPd1HZ7Zd4dzDWvW
jwLZlBE/GuU8O3I+vCGdMO0AmNR+oB9S2CetfFBfOm+cJE2RnB90t8g17XlIUviMe9WUd3OzkRtl
r4G7BRQWlK6qhGUI0ie6biVmwnsIuzWAaUVgNZ3VsyOI7lq4jq4RneethF0RWUJBEMD84UfEj1ZC
lC3ZV2PT0cin63kPFw8ATKO4LaG6JMwWvuScvMNnfJKSat8hJDl48lBZvMdzsFlWdzeYIuroWKfM
Z+0wza0FCaRz/z9a7e+IV9g0EZWefFKNXKpyxdkjP1c2mZLbqcdSsx204Z3MM1pERav/t8QhZUCu
zxqfbJXuFN9Zb4D87T8jMhthIJCqj+t+T18vgniODSHWQ7MTcWva82GSqccKrpIWnxsi8+aGgXPS
oxpUSgi0UCj50BBf4K+UFLOoiOvR99Hh2orFZQJz2774woID1hPsXdvLNImzNyi9MPE//LJ52kg3
Tpg+IcHrjV2ktLNCdE1cwWMyq//usEjJ1IKp2NAvw19PPYa6dSmziekZ7w0eZZtNzUSx7EfbXTwG
UfVJSEX1Q0nvbSG7Y0WciTlApd6918upEHtdcTozwf+KGUfCeayQijEuTdRvD++do7seJC41JmhS
EoyL+66K7MHanv12T7o+bVt0dhBJSaHsU7Fm4rxJpjhjpRIcCraDbZvb3+uSJWAHAC95CkiNL5Kd
Yb57X4Dp/YHff35BydFaG5hx2wbNlbn+AQFXgDwgnKSkKGnG5sqHUflIVLq4aBVkZXk0yEF08KmO
PunTb+RcAEaclNhK/XPV+UE5jvZDbhlRsqf3lPJ5FCT9kDjOgWCkhdHByv4K/pEQguHHK0Y95hKt
znNetHKy2sGteUtWZWgvMHmWgKwOJbezrHrfj+xIrs/ezgs5P/eBdZsrJHv9MwaZiDPf1a6eWv88
cFchJJ9mcaDcUX73YD/tvPmofvgZUwsW8IVofM/efG5h89/g+WpbB4BjobxBjInXVJ3+Xz5b3ult
0f8+f8359qc9FVmKXUBexwfnBcrZmkGdIfA0sITs725mjZ4lFwCbZIOpsN4b09VfkjYhK4JuF7AI
bR7KamzLHVghTA3DC3v2sN7Jg05GvRHQLs1Xg90XOQiHEngEXXazXTKgQEosNvRxdlsLO5UqjJ2U
XDe6BSfLR5HQKEoAtoLz3uojYYyaUh+E84hvxMhGT6SnF+fpXteFKctJhnbqeNOSC99jMxFjz2xU
pbCPMYk+WFSrkmtsAgU9e4jiA+kczfOhHe0VvuoNMf/6s0IFpyC9LVv3iHrw6PoBQES+gxjI7DXR
TDphbgREcL3GuVj+iZMbi+eLGd7y9nKFqKWRoJHtJkO4+Z90okr2HMNDY0JYa0KfCvcbLGP7NiVA
cjgChbjWeEwweqTf8vEPMC+BRey54l193O4eHkwKlNyeF35t0qWkzdwILZaBcCgw0NzV5oSL9k/o
NWE1lAlLbvsNh+Aj9avSiAR87JmZq1wlwLhvoFl4v9Zu/v+JwLwfS+rtxSqYEH3Ax8hgMNob0cTQ
8Vm3x99MKiBb0jHNE4hG/EXA2Hp6+QWJDwsbatlYOqxHNDXYxDklpKzcR9Rjk8QdYuybhlMPwHcu
agUM/NvOE1OfoN16e+YmN6J6Dv552nEwarGRlkU6dal7jRHFuqlvOXudoFvvFvXPsskwS1DfWeLr
XdPUzEkx8l0sLVmSwlOKcrBIrh6f1HV+KvnZNoNyiGROxSCHnEmJDHG5lLZ+bcrIEHy6HkO5Pkn4
taDqbcwulcfCv7lxf2Px++kNQlhU56zW6P1w+brOfD/1xd2+U3CbbpWgOL7/jvuxu2MQP7lCpGbG
CBz1nZ8dYuKX0L3MitVqBaKyceOuip/bLZQU2irzSJf54U0ZbGTjb5zhRXwI7dJwhiKE4a8F+4l4
6DdO+JgzhtTUkmxJbmkE2QwDoSURrFCinYT9jfuxA1ES/lvz6AbNl8f9d1vBC/hdWFfGD5Q87s1a
UIxDtLn3TXVIMcgghnx3mUNFpDWcwIod+siILSUXl17MVL5cYqTnbkS71XxFpjzENrHNuNxgjlfn
6R786aEXV1NPe2e0Bh7FO8Za1Uyp7C5OQKOzXH/OtaB5CT83vxfrf7FpJmh2aaM+X09NijPifcdZ
whiyRfUKv3kGSGRh0zQTisGzAant0fRVr4SJwe+0tnWAV7AoIzJ4jG3LAQRiI6LIm5zEYvVQecn7
I0K6ss1RNFs+59FqGOJgSmf6nivaIHNVkdg/jcT1zQyjQ35ymGHxqMJRv3g38ZQiT5N0huVLx27U
a63wyKCl2YkNUV8DWPYisO2aeLn09dyYWX+iPm/YnUeNOLahqImmbVQkw/q5R+xEE7Gd+tMjrA/O
uj6xl4ET/eoUIJP7HrjBriy9QNDJ1HbXmUdTyw19hiPMU7N0LenbX71NW/3vdv/xhHl41AT6Up86
tdh4SVJXaiGAoB3vXkpgwke0W8v5qVzK7620r8FydglHvwuzEROC6eTtp65OZTsVr2Zz4Oa4Pie7
jgTXLhG0ZTludxK7VYYuXXeXSuq9caJhatjQWSUz3KaVHQq2eXkmPZf0uvw6tQ5ouM0Ny9H6iGrn
twbjq/NsgA34SXO3HXRBBD40sXcj8gNF+R/TkexdztQRbIEVpQu3eIBi8wyjzF6GeMfcaFllTYDM
c+TbL8IqE3RpVnc8+LMzz1ZjYBL54N56NcLA3cTbIAMDCnTPOYX6XFfWWCdaFwxpFRCo7M6leRSo
CfJBdViGAaH/TFU/cYt++WPcdkF7Pq9yYJS1ahfmc/htiLaUXak6ipD2ZUrhe9IIQ+mX5fVSx/XO
5JCoWQ+UIQieGBn2qE7IUh6T2p4JPixP4Ejauz6IM60JznzSrVts8UMeNKg5MVqM1mbP5xBobUCK
UYy/o9Qp5xL5/XdRe7+Ijm8z3Buz6iG+gm4UzgsBjNzwpABdx4rJ7H7qhn9N+DOnKuEe2lKpoZrl
1JKAtlHR6G00UnR4llV2IeszuZFuQ08/8DvupfmNlpWqLNm3S4gBGAuATU8fQ+bIVKO9Gg2E77SP
EAbJMCh8CvclovAFpsTfdix7k5xiMmnwz2yWWZkLp7z33i1pOsp+9RqtD79FoK99riQRqM9dTbux
iF+qkbEjPF/9r7M378WeG/hGhB0ialibaMu0vrTl24mNnSM0NfGyiNf7BWQVL94qamejt5v3LNAO
KTVQfBG8Rl6KkhV1i7P4uNc814Z6e/KBm3vGVh/XxT9UTMmFN3FFoMszj5VKsuJTbAZkkuHuN3vB
JWRp1HarqRv6E/FG/7GlJRV2mCVObBxenLHmEumaCKK5shRm1oHDAR0csZxqTq3sEArCpDLwbgg3
cwfOLQ5WIhClZPE+NILKE4/8PAXRAB/5lYphVxV3i4EQD2LxE6l2v171NjJukB+KJj5qn7MOH4S8
Ou8FNhfi4tgycwncQaUlGxy329baOMoF0XG1RC9jkWfEPsrioulofduW9NroUXlpBhy3EO2D+96R
t7VzPc5wmvdmLGVQZNP2mpmkYUFXm5q/54vaiU0IoP5A39WjWg0P9CE4yUR2vNnGiTYggfW5X9SP
NPND6wdCjDF1MkJvrA5Dz7OdYui2neJRIcR3cBR72msuKvL93D3eQ6Ux9CsIAzdENK3r18ym+/dr
bDuhORI2QDIokhviuuhsl2ERtDm1xY+ieEdPbithov2N0v2FbAm+6ICaI4RBGLUX3vHlBPS5RLOc
1WZGrnZkaMbd1yybL2rNtXm3VvklBbUITIOMn8XOlOZpSCLyOG11vvZvbLAQ9mK4r5WnE6Nzk4OT
kDDDP+jG5zzydh3dbEythxt0DkuH0DDfIiXy+pqr6h3egRHzyvvbZpL1RLpUeNAC5JwRWN/DFgv5
QF47yd3lM8lxaesJlTrAKZY2RacP4d6aC9WE9w7v5K1SdoeCFPBYXVe4k603KByd49fqgwxV2Yt9
EjSYQVgEqFr6nWYL/Y95Y1zTqzrTvzuBhD2q5nzD6S1Z1KCczmW3KS/r5zLwGzg9k7o87RjbBOhV
HRKXdBvmI7uMj7nDqp8Fz21P//WxKDQ74075bC2BzcIwO06T6Ijhur/JzcyRYNGvOGaUAqFSqLwT
bk502Oq2QL4m9nDfRac9R1lY45SwMWkJju7JFE8t/ZdJzSNorTDAzjfI8QFONieNlOjkvw41e7Uf
/1F3ENXSbem98AD/9ozIxjvxIjyIOJDO/SRcCe9MI5NY6W2CRQTQGZtouI6zK+sCDMOUR8MtEJZ4
eJiP5nM88pCt6SrxgNgwvOgSp3cLt/TmmJTR9NBiUuNZSElfBYVDU1zI1DR3QtyXNi0QNLSt+ahb
gJGDkgPfXhBTd0S259U3X2pqdSHLBhAMuR/xzyHPj0EyJwx2XMiaRnaok2ALlO2GUa/w9MatbWtd
XuMVHqMGddLyXXcBi9eiWk3wu2kVUZZD9ppEhqPciPQUGtuj4BJDM5V/80PXnPsXYyvJTeuAIZ+Q
on+vE6oWbVHDSc2L1w1WW8BUR8g4BXpPWNqhnZG6/2OU/ELz6A1lFJeAcTvL/E3DZusWM232sHTe
J84dtg4/gkBUB8hNrn5WEPVbuVWsxegnUSzrDnMMVyDBYgNzcOgXTF8l+9shz4qUTDEexO5/E+Lj
Z8xFGsTlYs3LaCkF8ud8cM6doILfVBXLcs4vRYsbMqeDuN/QQRg/I4x3LzAJ4aj/5yZeTBwnA4U2
onWLtsQaCDccEL1K9Mkmf7rSRH7PG4dZNfpX3vhrHlsNkAs5As3S46k9yGJae/UPZ5WQSqbMRtej
V0XMW2CkiXoOhz3n2cjOtHlh6iNwZCro6vZeQsq0GFQnde8cbnR4DAVf5Iz4NOy8+9730Y/NNTF1
AJvHfDlBnAPUCx2bQALhFgKNEvL9pnFuWt1Y2KSS/UHA/ZUNuRF2Ts/CeiCjpsi2VTe9uu6+QwZt
LOdrnx70U86N9iiv8HzPLeits+De7NhARKfkiHlwFOO+vrJG/O2GrE9DyGfJ1/Jwlb1Qkf7rvspq
jhHUXngTSMKiTSthBcDVH37wH95Bq2nRjV4af0v8TZ4hRuxup8Wk7wEcGU10R3WgiZ4/4ixNPJDE
RLrjR0FP2+6QVB98eOD5zyxDNdl1fGTna/sIRhqnYwJjHVeWALsHfond2+2PwO4zTJLj7LiVhbhc
OQJBqXYS1HRufLF73fysOU2daeNGhSjD1gZH21oaclop3nP6qkmN+yjI3S+izADrusFhe9/tDDNU
0wjEBUm8il+YoTQCpMjy7z9jI2XAtZAyV8s2NbyxhSOymxiAqu4e0YF6Q76YDd9NP0L1pg+SXNPD
eDjvVFG9NOklPO0Wn3+KMB+ekC2PETRuA6JCFSiZ/WCKJkYYoGiMpaVXyxJLVRND194bczU9FYKQ
h759knDBfxtDmyEgaoql1sAZ/ICH1WNTlb143gugVkKAtheuU+VI8BDbSwvlJeCpsS2TwtjsGf8E
Gi8xcsW/+BsQDK+0Tri4GmgPkf+FkJ7VwXJHDBxzh3pqqAYoo/XOETVy8vrR/N/CbazUSgOy+kTf
WRaTF4DNxh6SIY50hDI2DgCtIYY1HgpyK65POLe+w+iAX2l7dQrWR6Lx1Rb5Jg56zIy8yzZSZUcV
DfuspNU9+t6IQv5HxRyv+7d4XCipk8p2H+vv6lZxIQGgVgICcd9f3/wlk19g8ZMgj1Gc+LFW4TTs
sLGbytnppJRjca5Te15oXuS8gQblBSJHzvFaBKyULpGxYVBV5uhQCSCK9603JelH3VcllUO6cegc
3yUbwIisWYKl1/eE3cmLFTEsfCszICW44cIHcYaZgZ45RQgH6NmE3Iv+QXgKU1hTztVW6Hmt1mjl
gRw2qIbYYOUBszPgmbj6Gq6OtyvBAI5zVgsDcsk1d30YNiDaiM01J85yR67+9BhR8oOZ/4MRPa+B
0D4t3MhRj5PW2/2aeG4dE4p9O+YlM479ypIjS7UrQ9I41a+ZrOfSrAgN9Z9VPa+lCRAO0Iy2SqNn
vX1g+RmaZlaBuSH0aCOd2scj3jLy4slYDlsse9geQjjlG4z5s81ERTQ/wXfzHVK2q4xFW+UIh0Td
39WWfT/RoDLq1W8kxTVmf9yxVPzL7oCPd1ePunr8hq2XiwS1lsNg/pCHydyrLAn/LmUkcKqkji/g
FkXeKF+v5IRIIJoblcvXeFM0p2qlF4MeBzMFveHiScTUrRkm5e9yZJftnKxCnK/h6Eb0dGKgf/Cu
HTflSMCbfLWCETDpuflIG08hurNsQiSonln9X57vG6HieGZ36VJabKUpUh6OYQVmZBIXwgXV8GoG
XrCaua/s/zTRdZ0It9uHixaFmsK0mbMUFg+gqwpQrTd4V9yW3LtwfL3td5EOToTzsUHv96d6MYMH
c9IHeZHlvEsSnhF23ji+7+h7ZNQDVb7Hrq2jaI4G9yHtCQzFMChTgYRQHpbw35cV9Zr7ICjqrGFH
H1y7waWdX6IgsAy6vQkLV6hlquLT2ba6jcgXYKfQUAQHi24Ec2AoP1GGBTT5bGasKWyTM9ihjeAR
6OwzoJVwmLdkiidC+3xuOCmyHQW7+SflubzlGORyNxfQRL1067XLsczXKiCYONRLUk7NTD+nsWng
SycVGU6Kz3SCNxt7SHDU2QLV67ZUwf7r6Cnwk3lSzGYNRTzRxPvKf4CRJJEyCl7s/IcBJ9ST85kU
0vBW9uXtbQKV+htYqFy82FGTm5nwF3n52Q1UfIpDvFiaacx/JxXwKunHk33t4PCEqhPxX55OQSKS
L641qCQIfmSd4kUlgeDnivub0hYKhAohM8TdtxyXVPPhgWatE6mgZiRGSwfmZDWcERWl0QZGEWvN
4UWN37CVz5kSlKNUuIYfqQufQU4FT4ZeZ0G37VkvCv5MG24e8jBPu0IAZbS7BsMEiC4VGBEYk2/g
jiW5wJTgc22d3QUlsA7/0cifejPwrK4H6TXU0vY9fUvanRqwJZgQ5LjFvz6/V2fRM5LBviEO56ss
6lzeVjqthvrslO3KF3NBYMLxfssbBdqqo0bGlA0lU3wv4mqSrCI1tNGzMlOZqFW6EatCBMVQcaJP
Sp7w1gTTkE4IL7T+yLDZglk17I+TtTdyAkv9PpluQeTsgeT3U0SSWbXFTxsaHGUkXemqI+LaQitt
+EHZ4KeRaiUga9FqWgl8Sj1TaL28OF1veltg27xXbyveI1y52tcZxeUNwa8PzBFi7hSNqNYz4XG0
UNPWfI0y4eDp/mPyFDAZRYMNjseFPWRH6fEeplxwGGpwTFSq2isz/eBDhG8jGsexjlj921aDnAJL
WPWyHiYMXYh1FZMO95pNNr/QLLZI6mk6hUaXTq2RJjWUDZ/KtG5GRGZeX3bfKKXnfrRqsHgR5igq
hNn3UORhqcXOLAsciQxEDR6vR9fBoV9X4pdLxhTiI+bcYM67lUnC2Quqj0w3+BzJQwiRxP9MXbXQ
fR3rfmkUXgCWyycUDMLE6fhFtfGGTWT5nYPVhIxA8MN5mezM58ikZkCRJGKtV4Azh7QXweLU8TRW
n9d5mekIiY/gHy4Zz3E1ToYsvpZOeErmwA0wkhc0TdCdcgj+RNwT0xY/zhiQ0405OTEBMzoPeS/H
ETr++0ltUh2yL7xKX8JZiRe+5bnT+E4NjHNK4X9aZEXMdL2S1fRiXqqeuKZgack/N3od/vDUd0PI
PSxW/9z+aXlxCL8tDBVHJvWacV44E0eFY7mNdv+drfKfy4lDr9nfHgXLd2cR8Nuby//FsPq3wkcS
toRtdmAZHs5ithwKiFr5jpQ55FRbfitdl6Z3KnhR0JUMDldTl6TsextDwpWTwigeH9UzH/4+gHon
eOKwwNEheiHiuH01V1+BLXu1U3SHfOE6XAMGdcMf1XMOcg8lG68Ygs9bqIJxQX9UP3z3YvSfwQIl
InHzHK4lX8SrP58kLfL8tUchbjYOQps0DGkc0r5xM8e3hz2dWH32dxPrV3EoK4WEIL0R4M3IXJR9
vtDIlJ1M9J104plRPBT0eJ4mYSqg//Jp4AxbluyHzDHg+xF6T6neVbEVUPckjjTfquzBX2ZWa0+J
t5UE5k6mrCe9zwuqREN8j9HwqQY25OxfcyEEcExgiWj4ZfFRMl250RVlhlt5Mvbw4hAYZj8MlUsT
ei2FzuLu0xgNyl1VHCGuvFM3EP3vXtRCEVoTB0KeLsHzNiWOlJFBp/nyhEHwAnBY3us1yhxo3RhL
8I7N69VHq2QKikenzQZTaIXHMwPbaR4Mh9tNtGh1GePTRUCBcrussjlFGYDj0IdDXx5w2ubQpDl3
eYpEr98NNOEttKX+xIqd+Hrpxq5EvCV6u/lBenaMCC1mLXnHPDOZHYeTtGsmPID7htkyrHzRvNdi
NhwuMU0laELypyOxXPQ/pWxZWZ0uajtK3I6Ty+fo6Wsp+38RqAcX0kbeXHoferwiasNhShna7o1x
bnqGOnQR7DTNtFMzdYvLKMxOeCVJWyIJ+FGuXtgQ47+ZTq9cuAdvv9trbZAG7I0Oum6j22fw+n0Z
XnbMjBl4pXERt64ihWftSM3ei3ipeQ41gpPJs4e7ZKgr9p8xeCKYGnIn0y1s5DbXwDdlelgdVJcd
fwEE86g0iv3vljn7gJ+h6UaLGtiXBi/k010l6gPKgs8TgIC9XGIiFpaQmtjqFOQgfng5ccFZ2xx6
V0y9cif5ndHBLebEwkDIEXSox9inXiZxwbm48ZmDrgXPE15q1yrUp33RgnsDV5ZB8Cl24pT1nb8T
DK/NnpeWbDsgV8BBfICK2SkrWJ9rVuaaJL9v3qxCvDmfBquJGz25tyuKHdOqA46yEK6I9qQw029j
Zz3UvmggM8m9hCksNzC2Hxd5ysnzZnhUvYzl0QCkoSTkrS9bmAPq7xnOxcA/tOLhDd57w1f80cNO
rwXVt+xGUhCzVKGKyUFIL9IAh/tEG/AzlY8q1ZUaMHMuU8USyJDRkpJ08tCBTrtB5ELvD+SMfINZ
SK/NcfD0dWOgNcWAquoUWXy342xu5MoonM1wpUeVGTocig1oExQzpiVWAAVFIgBkJtRdJIr4K61D
dhW2oRRRp76KpSrrw6NBuwqkjuadC/vu3t5cws4vpsuDbKtJE7CBf9lvD5nckMeqkjHVX80+NucK
8CjjN+bt/73YWcmze81P4GYfHDZii6LD4XCPmE/dQo1dE9QpoQKhn2erRE7Y9nuEwlK2uxfH0jlj
7cBUmnuFnaibrWecty+kwJo3nqWQW6AK5winy3HydguDjI9U7qVMJU1i5kb0LN/EkLQRwSyEzmAt
6rls590dB1KV3zUyQ+90DaKM+s5I/YEp1JPDOMa41PJH/B2G2NZCy6lWv1WoRgn9UW2jD/7/nOWk
6pmOUu3un7dmKAe+MOZgBwwMxR2hsd7FE3vZwhL/l4Sj/h4zEuQwys78S8H8H2bEgPV216K9bWJ0
sj9TjvmJBsPRWYRhIDXBRxSP8XaPI8Gz1jyRRzfAchqpaqTdk25DAMMy7DE+RX2FKoQbDyZhKX+t
8URHcJYwegZmoftbxY6+bkkifbD9UmQyRv1rKDbcxFGgkEQdXsdAqA5cWoTUr96BoDYWwZymGGVN
sNU3CZGJk3vGs9SrHuou5Ksu9MD8wih0Esk86ppJrxzOItHom6S5ThLLYzELHYLuVauxAmmuWt0X
AYnponarxfM+6xCmEUUQcgL4nTECHGDpaLlD/cIKPh/+rSaJleGjBBCmZfLG8XaTpkpU4tFUhxpR
KI2z6GnkMOQ2wRTg76AdVyQfYNguh0fWxKysZjV6dOh+GJ/Xizv96KEiyPc1voQK1abO6/yDITyF
IR0GvKaVMK4PWhfZHcw7LPvoax6ZdAUdyEZq9w0e3TKesLdHEc3B+30n1RYQ0omoVivWLFHZsYjJ
UecKe01djKJvJhH1i2wZi3zzlDSlLpwV1Uu/OCy8IZH82fKflkZXYAzZ6LorSMpLh7enCrJXo5aL
Ct8n9DTsTMHP7xnL2simrelwMgMWjzWtkPBCua66vAPJJkIPW9mEnbLyE4sINJGMNE55t+SZETPP
YuhGwalzU61PeUHS3+Z+Vnf1VSjGfvwIj/r47km+5AE9Dj7KkdiV3MlXFY7KsjtkupFpy2rJHpIT
H2r5Zd1Srxza5SmT/ZP0cl0zR67pSBeBcHBdWXnH6A1y97mHfYTO6/boVuQCTD+Nq51Tf5cC51Wc
z64n11BucU8iwzLW3Ly5wA06pavUDmLZybQ+HATaERXzMcWPfn0ltJUodv4RZo3Tw39TOq3Ja/bI
9SwSXQ9vKN2Y2ZqNgAXukWd1bWdwJneUKWKTacwjmJ6zC2Pjh4i0ei1173aF8byKo0VATgcRXG9f
syNo5rfU+OK5N8DyAOpXmsIIVideqmZJd7R+mCpEnm9cudPrQiGCR+42FU0xoTXm7nSsCSOov0o/
oGn1t4Pouc6b+lqwVMChfqslayZj/Jd2nbmTBoGpXEC02ak2Khr+wQYySFihCXTzRTzytA5YLvYK
W3vsen3tmXNtEiSxlfFjbgCm9WW6q/V+nCoT3jWGa8+bYUanzNDXlduU3durY0CYcZ5dMR2Ne0vK
EBndEvvlf76nS9ZFhTgk6qrJYTGeuLZfJswljVOtgrNg6oideZdD22gACzG7Du6a+w3hhuPpTRcg
Mgn1Nv3wKf6U/tpRAzOe1xnVYqvzNCLF+2b7YMirE9FTDS9qXxBtTmhXYHQC6NDDQVRKmV95s6Y2
7VF9pM+WEU/PammciUqoqFgkdXUvTOAi6OwTX8v+Abuya/MK1UtFP/Knos1yjZxEWOTjfkMp3S41
7iJY/ceKm/HfCi6zZEjPkzxTnerbMsXyatrUQbPubSHOdjYaZl5Izej9gMdWT3koDdosekk9prkl
YUegfH39zZsgv2YwNkIWeSQXndhzKpgcC0rOkDnJ/QvFiDhmV/dyx3ybepKlx4R0GHsEhMyFcNPE
P6JsIwAJyvlT/0CHWmGYTnQUWN42E3HTQGqLhyv9FuKTG40CSTJ6uXwXdJAHPrDsCsIAYik3Y37X
iFDQ6YyXeMiNk+rlEVcCI5bgOP5ciMjpRkZ2fUoGXZo8dpsIbwqdsM8OrXZfRvcVcoEN+cBeJcqN
i0bYKZsA0XBLp0Va8b7ThEqTsUZroS55oGLsd5Cv/5ZzHt8sFUjXVAQ7pDsgo/52B8kyNB3nXuN0
stlh51eICaYL+XOWqJutrdq6BCvf1hDTrH8wonbRCJA6y6qwjBOEEEzIxR9R4+mmNJhDxcliZlea
ktOOL8rRIfdwNwOw5Up42F87cUHRzi4QQHRm8QHhsW3jJNJp1cxI3RSAurUhqolc3RhPDzWC8PaL
H+8LBFTc0LNr+gi4lQE9+QVtqKPHquHLAbPFfBbGezvAORLPnoDP8u0qeuQ/Q7aKk9utBNZDpGWC
+93bmiPq9rdLwjys5PLCw+RxstnmMTCm2kZmTt35kVaz4GH6dMlUaAua73mbepF9PdrMdiD1NvoC
wbDtdjqpTl+QpRcR1MlVTLKaukcn4KZACQYt8hLbDoPmUq9Gl8jTiEPa++VsAIx5tLHFi5XwyUmV
ye0r13TQnekGa1N6DFUgfAT+nW6PP9jfl3ZIVIKruRWLCNRZfVvujalbvozr8SY+si6aM6UP+u7e
k5gQrj/8+Ryo8IUd8nB0xARxJA5ME06x6jKMHkHbD7/ipOwMxBtoWe3jgHdZUCxmvWp1E87f/OOh
g8/FAH9WhSh/hP3QbRmz1Pw7LbcgBoL+oINRDLDWSGRhnSYvEIZnNBYvL4uof2bGQEUCg3bpXQHA
Bl8Nt5mVExbp5R+tdH5HnOINJBMmO6iTf7H6eET9glmjelDFrzmytpbSPlpSKZsn7CdxnIBRlhiy
Q1D4lzOjtmPy01SfKDjCLJNxo7/ScDUfJO3xrlCci80NDET4sscRY3DAkC9KUYFYBwzvgDVP3oIs
a4EG+CIOxHZkpTr5cbnU/R/HuDi/wjpQI4FHHZ3+zGfGyu+HrGRTPhuvjDyjKMdNVh/GqFdfAwMg
IpRI14DD+ibXqWF/YfhNY7CJW07kZ0n6/ElUystcujrXMsot51WG0JQmDagVK3D0mrNiPXglNyW8
+eBJ/Xws7W+vPHSivizVbFGW778sCu78k9yDnC4DsIoTOo3x0FmtmHB0IXjxzqNiZQvz/J8VEha5
LhAH8+h+RRlG4Ceuqo0M2yrZmpa08l5wgGaY2cDRvwX2OP8t2Yi5zb2zW8oOnsTX/q25Yc9idQ3F
5JT+b3ZqP2e5RdP6poQlIvcP9KlPi1hi2aQgafCjYe+XWhzH3b2W70ecffKgn6urZe4ZQzegaUYm
/j7u+HSSs1p2jFQIMCpsGFiuJ+1/3Xa4V+3koYeB/5jQy3oBRYt/mzBPxx0uhgZI+4dI2v/9zZtI
VbIlZHSNBoB2Gi3eU45Y3/ryGsoNTxj4ROTVSzAjNNJT7Ze+XTvxo+dsVWL1V01A2FSRGelhjT3l
GyJXP1X+WE2Za0xWvwFP0EVS9GOF42oX4Kk4gqLZAf2aJMNpydIggHgxWZtPlcg8X5IbJPVFXH/s
MEN6Rhxud8lQZlcIq9qhvWjdUulQUQpM0RN2QXljigEW1jzoNyp0r+1gdjzXnLE3vvqNnCa949z4
4JvLchNRX8NJ8bh2lhnsTU4i7s8dJtJPGpEyMkNFnLsDxBsRWO7hTqZ3THqVlhGmxruX9i5NG+g/
YbqG7N4DEPNd+96gBvkJShCbBoUDQBRYHhQxpHH/EKFwqzp0rAHSfhHhekCCqV0Ux4LTyfJdYTtr
/t5sDtaSukc6ySkGehLloUjdRO89iTujhLsAggf1cqmej5ziat+wsAzsAPw/+W6McQih0FhGhOOF
XBwv4dcRlInLGbwFwM3ADOGpuw4auwnmVHCbKfCAlph65GeHlFltHpEqqUcfQ6qPlJmKRhfUulyc
3cE2OTbauZFJNVttsKLb9AAAAJI9m3bGzwhOAAH6+wK9hRRVkhlzscRn+wIAAAAABFla

--viJYB+6GwMZTqtAj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="kernel-selftests"

Decompressing Linux... Parsing ELF... done.
Booting the kernel.
Linux version 6.2.0-rc1-00035-gd0067447fa5b (kbuild@9802d30b1070) (gcc-11 (Debian 11.3.0-8) 11.3.0, GNU ld (GNU Binutils for Debian) 2.39) #1 SMP Fri Jan  6 12:32:10 CST 2023
Command line: ip=::::lkp-skl-d06::dhcp root=/dev/ram0 RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b branch=peterz-queue/sched/idle job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml user=lkp ARCH=x86_64 kconfig=x86_64-rhel-8.3-kselftests commit=d0067447fa5bdd65ec4f7a5737581362641f7611 kvm-intel.unrestricted_guest=0 initcall_debug nmi_watchdog=0 max_uptime=1200 LKP_SERVER=internal-lkp-server nokaslr selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.
KERNEL supported cpus:
Intel GenuineIntel
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
signal: max sigframe size: 2032
BIOS-provided physical RAM map:
BIOS-e820: [mem 0x0000000000000400-0x0000000000091bff] usable
BIOS-e820: [mem 0x0000000000091c00-0x000000000009ffff] reserved
BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
BIOS-e820: [mem 0x0000000000100000-0x00000000b30fafff] usable
BIOS-e820: [mem 0x00000000b30fb000-0x00000000b3c7efff] reserved
BIOS-e820: [mem 0x00000000b3c7f000-0x00000000b3e7efff] ACPI NVS
BIOS-e820: [mem 0x00000000b3e7f000-0x00000000b3efefff] ACPI data
BIOS-e820: [mem 0x00000000b3eff000-0x00000000b3efffff] usable
BIOS-e820: [mem 0x00000000b3f00000-0x00000000be7fffff] reserved
BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
BIOS-e820: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
BIOS-e820: [mem 0x00000000fedb0000-0x00000000fedbffff] reserved
BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
BIOS-e820: [mem 0x00000000ff700000-0x00000000ffffffff] reserved
BIOS-e820: [mem 0x0000000100000000-0x000000043f7fffff] usable
printk: debug: ignoring loglevel setting.
printk: bootconsole [earlyser0] enabled
NX (Execute Disable) protection: active
SMBIOS 2.7 present.
DMI: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
tsc: Detected 3300.000 MHz processor
tsc: Detected 3299.994 MHz TSC
e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
e820: remove [mem 0x000a0000-0x000fffff] usable
last_pfn = 0x43f800 max_arch_pfn = 0x400000000
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
last_pfn = 0xb3f00 max_arch_pfn = 0x400000000
Scan for SMP in [mem 0x00000000-0x000003ff]
Scan for SMP in [mem 0x0009fc00-0x0009ffff]
Scan for SMP in [mem 0x000f0000-0x000fffff]
Scan for SMP in [mem 0x00091c00-0x00091fff]
Using GB pages for direct mapping
RAMDISK: [mem 0x3f9734000-0x438ffffff]
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x00000000000FBE30 000024 (v02 HPQOEM)
ACPI: XSDT 0x00000000B3EFD0E8 0000B4 (v01 HPQOEM SLIC-WKS 00000000      01000013)
ACPI: FACP 0x00000000B3EF1000 0000F4 (v05 HPQOEM SLIC-WKS 00000000 HP   00000001)
ACPI: DSDT 0x00000000B3ECD000 0209E1 (v02 HPQOEM 8183     00000000 INTL 20121018)
ACPI: FACS 0x00000000B3E5A000 000040
ACPI: SSDT 0x00000000B3EFC000 000108 (v02 HP     ShmTable 00000001 INTL 20121018)
ACPI: TCPA 0x00000000B3EFB000 000032 (v02 HPQOEM EDK2     00000002      01000013)
ACPI: SSDT 0x00000000B3EFA000 0003B8 (v02 HPQOEM TcgTable 00001000 INTL 20121018)
ACPI: UEFI 0x00000000B3E6A000 000042 (v01 HPQOEM EDK2     00000002      01000013)
ACPI: SSDT 0x00000000B3EF4000 0051FA (v02 SaSsdt SaSsdt   00003000 INTL 20121018)
ACPI: SSDT 0x00000000B3EF3000 0005B1 (v01 Intel  PerfTune 00001000 INTL 20121018)
ACPI: WSMT 0x00000000B3EF2000 000028 (v01 HPQOEM 8183     00000001 HP   00000001)
ACPI: HPET 0x00000000B3EF0000 000038 (v01 HPQOEM 8183     00000001 HP   00000001)
ACPI: APIC 0x00000000B3EEF000 0000BC (v01 HPQOEM 8183     00000001 HP   00000001)
ACPI: MCFG 0x00000000B3EEE000 00003C (v01 HPQOEM 8183     00000001 HP   00000001)
ACPI: SSDT 0x00000000B3ECC000 00019A (v02 HPQOEM Sata0Ide 00001000 INTL 20121018)
ACPI: SSDT 0x00000000B3ECB000 000729 (v01 HPQOEM PtidDevc 00001000 INTL 20121018)
ACPI: SSDT 0x00000000B3ECA000 000E73 (v02 CpuRef CpuSsdt  00003000 INTL 20121018)
ACPI: DMAR 0x00000000B3EC9000 0000A8 (v01 INTEL  SKL      00000001 INTL 00000001)
ACPI: ASF! 0x00000000B3EC8000 0000A5 (v32 HPQOEM  UYA     00000001 TFSM 000F4240)
ACPI: FPDT 0x00000000B3EC7000 000044 (v01 HPQOEM EDK2     00000002      01000013)
ACPI: BGRT 0x00000000B3EC6000 000038 (v01 HPQOEM EDK2     00000002      01000013)
ACPI: Reserving FACP table memory at [mem 0xb3ef1000-0xb3ef10f3]
ACPI: Reserving DSDT table memory at [mem 0xb3ecd000-0xb3eed9e0]
ACPI: Reserving FACS table memory at [mem 0xb3e5a000-0xb3e5a03f]
ACPI: Reserving SSDT table memory at [mem 0xb3efc000-0xb3efc107]
ACPI: Reserving TCPA table memory at [mem 0xb3efb000-0xb3efb031]
ACPI: Reserving SSDT table memory at [mem 0xb3efa000-0xb3efa3b7]
ACPI: Reserving UEFI table memory at [mem 0xb3e6a000-0xb3e6a041]
ACPI: Reserving SSDT table memory at [mem 0xb3ef4000-0xb3ef91f9]
ACPI: Reserving SSDT table memory at [mem 0xb3ef3000-0xb3ef35b0]
ACPI: Reserving WSMT table memory at [mem 0xb3ef2000-0xb3ef2027]
ACPI: Reserving HPET table memory at [mem 0xb3ef0000-0xb3ef0037]
ACPI: Reserving APIC table memory at [mem 0xb3eef000-0xb3eef0bb]
ACPI: Reserving MCFG table memory at [mem 0xb3eee000-0xb3eee03b]
ACPI: Reserving SSDT table memory at [mem 0xb3ecc000-0xb3ecc199]
ACPI: Reserving SSDT table memory at [mem 0xb3ecb000-0xb3ecb728]
ACPI: Reserving SSDT table memory at [mem 0xb3eca000-0xb3ecae72]
ACPI: Reserving DMAR table memory at [mem 0xb3ec9000-0xb3ec90a7]
ACPI: Reserving ASF! table memory at [mem 0xb3ec8000-0xb3ec80a4]
ACPI: Reserving FPDT table memory at [mem 0xb3ec7000-0xb3ec7043]
ACPI: Reserving BGRT table memory at [mem 0xb3ec6000-0xb3ec6037]
mapped APIC to ffffffffff5fc000 (        fee00000)
No NUMA configuration found
Faking a node at [mem 0x0000000000000000-0x000000043f7fffff]
NODE_DATA(0) allocated [mem 0x43f7d5000-0x43f7fffff]
Zone ranges:
DMA      [mem 0x0000000000001000-0x0000000000ffffff]
DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Normal   [mem 0x0000000100000000-0x000000043f7fffff]
Device   empty
Movable zone start for each node
Early memory node ranges
node   0: [mem 0x0000000000001000-0x0000000000090fff]
node   0: [mem 0x0000000000100000-0x00000000b30fafff]
node   0: [mem 0x00000000b3eff000-0x00000000b3efffff]
node   0: [mem 0x0000000100000000-0x000000043f7fffff]
Initmem setup node 0 [mem 0x0000000000001000-0x000000043f7fffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 111 pages in unavailable ranges
On node 0, zone DMA32: 3588 pages in unavailable ranges
On node 0, zone Normal: 16640 pages in unavailable ranges
On node 0, zone Normal: 2048 pages in unavailable ranges
kasan: KernelAddressSanitizer initialized
Reserving Intel graphics memory at [mem 0xb6800000-0xbe7fffff]
ACPI: PM-Timer IO Port: 0x1808
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 2, APIC INT 02
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 2, APIC INT 09
Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 2, APIC INT 01
Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 2, APIC INT 03
Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 2, APIC INT 04
Int: type 0, pol 0, trig 0, bus 00, IRQ 05, APIC ID 2, APIC INT 05
Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 2, APIC INT 06
Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 2, APIC INT 07
Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 2, APIC INT 08
Int: type 0, pol 0, trig 0, bus 00, IRQ 0a, APIC ID 2, APIC INT 0a
Int: type 0, pol 0, trig 0, bus 00, IRQ 0b, APIC ID 2, APIC INT 0b
Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 2, APIC INT 0c
Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 2, APIC INT 0d
Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 2, APIC INT 0e
Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 2, APIC INT 0f
ACPI: Using ACPI (MADT) for SMP configuration information
ACPI: HPET id: 0x8086a201 base: 0xfed00000
TSC deadline timer available
smpboot: Allowing 4 CPUs, 0 hotplug CPUs
mapped IOAPIC to ffffffffff5fb000 (fec00000)
PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
PM: hibernation: Registered nosave memory: [mem 0x00091000-0x00091fff]
PM: hibernation: Registered nosave memory: [mem 0x00092000-0x0009ffff]
PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000dffff]
PM: hibernation: Registered nosave memory: [mem 0x000e0000-0x000fffff]
PM: hibernation: Registered nosave memory: [mem 0xb30fb000-0xb3c7efff]
PM: hibernation: Registered nosave memory: [mem 0xb3c7f000-0xb3e7efff]
PM: hibernation: Registered nosave memory: [mem 0xb3e7f000-0xb3efefff]
PM: hibernation: Registered nosave memory: [mem 0xb3f00000-0xbe7fffff]
PM: hibernation: Registered nosave memory: [mem 0xbe800000-0xdfffffff]
PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfcffffff]
PM: hibernation: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
PM: hibernation: Registered nosave memory: [mem 0xfe800000-0xfebfffff]
PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed0ffff]
PM: hibernation: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
PM: hibernation: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
PM: hibernation: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
PM: hibernation: Registered nosave memory: [mem 0xfed85000-0xfedaffff]
PM: hibernation: Registered nosave memory: [mem 0xfedb0000-0xfedbffff]
PM: hibernation: Registered nosave memory: [mem 0xfedc0000-0xfedfffff]
PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xff6fffff]
PM: hibernation: Registered nosave memory: [mem 0xff700000-0xffffffff]
[mem 0xbe800000-0xdfffffff] available for PCI devices
Booting paravirtualized kernel on bare hardware
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
percpu: Embedded 70 pages/cpu s247968 r8192 d30560 u524288
pcpu-alloc: s247968 r8192 d30560 u524288 alloc=1*2097152
pcpu-alloc: [0] 0 1 2 3 
Fallback order for Node 0: 0 
Built 1 zonelists, mobility grouping on.  Total pages: 4074328
Policy zone: Normal
Kernel command line: ip=::::lkp-skl-d06::dhcp root=/dev/ram0 RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b branch=peterz-queue/sched/idle job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml user=lkp ARCH=x86_64 kconfig=x86_64-rhel-8.3-kselftests commit=d0067447fa5bdd65ec4f7a5737581362641f7611 kvm-intel.unrestricted_guest=0 initcall_debug nmi_watchdog=0 max_uptime=1200 LKP_SERVER=internal-lkp-server nokaslr selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=
sysrq: sysrq always enabled.
ignoring the deprecated load_ramdisk= option
Unknown kernel command line parameters "nokaslr RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b branch=peterz-queue/sched/idle job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml user=lkp ARCH=x86_64 kconfig=x86_64-rhel-8.3-kselftests commit=d0067447fa5bdd65ec4f7a5737581362641f7611 max_uptime=1200 LKP_SERVER=internal-lkp-server selinux=0 softlockup_panic=1 prompt_ramdisk=0 vga=normal", will be passed to user space.
random: crng init done
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
mem auto-init: stack:off, heap alloc:on, heap free:off
stackdepot hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
software IO TLB: area num 4.
Memory: 2998000K/16556592K available (45056K kernel code, 15184K rwdata, 14872K rodata, 3148K init, 16580K bss, 3589804K reserved, 0K cma-reserved)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Kernel/User page tables isolation: enabled
ftrace: allocating 50185 entries in 197 pages
ftrace: allocated 197 pages with 4 groups
Running RCU self tests
rcu: Hierarchical RCU implementation.
rcu: 	RCU lockdep checking is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_timeout).
	Rude variant of Tasks RCU enabled.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
NR_IRQS: 524544, nr_irqs: 1024, preallocated irqs: 16
rcu: srcu_init: Setting srcu_struct sizes based on contention.
calling  con_init+0x0/0x5a2 @ 0
Console: colour VGA+ 80x25
printk: console [tty0] enabled
initcall con_init+0x0/0x5a2 returned 0 after 0 usecs
calling  hvc_console_init+0x0/0x18 @ 0
initcall hvc_console_init+0x0/0x18 returned 0 after 0 usecs
calling  univ8250_console_init+0x0/0x2b @ 0
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [earlyser0] disabled
printk: bootconsole [earlyser0] disabled
initcall univ8250_console_init+0x0/0x2b returned 0 after 0 usecs
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8192
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     32768
... MAX_LOCKDEP_CHAINS:      65536
... CHAINHASH_SIZE:          32768
memory used by lock dependency info: 6365 kB
memory used for stack traces: 4224 kB
per task-struct memory footprint: 1920 bytes
ACPI: Core revision 20221020
clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
APIC: Switch to symmetric I/O mode setup
DMAR: Host address width 39
DMAR: DRHD base: 0x000000fed90000 flags: 0x0
DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0505e
DMAR: DRHD base: 0x000000fed91000 flags: 0x1
DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
DMAR: RMRR base: 0x000000b3c37000 end: 0x000000b3c56fff
DMAR: RMRR base: 0x000000b6000000 end: 0x000000be7fffff
DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
DMAR-IR: HPET id 0 under DRHD base 0xfed91000
DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
DMAR-IR: IRQ remapping was enabled on dmar0 but we are not in kdump mode
DMAR-IR: IRQ remapping was enabled on dmar1 but we are not in kdump mode
DMAR-IR: Enabled IRQ remapping in xapic mode
x2apic: IRQ remapping doesn't support X2APIC mode
masked ExtINT on CPU#0
ENABLING IO-APIC IRQs
init IO_APIC IRQs
apic 2 pin 0 not connected
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-1 -> IRQ 1 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:30 Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-2 -> IRQ 0 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-3 -> IRQ 3 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-4 -> IRQ 4 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-5 -> IRQ 5 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-6 -> IRQ 6 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-7 -> IRQ 7 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-8 -> IRQ 8 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-9 -> IRQ 9 Level:1 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-10 -> IRQ 10 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-11 -> IRQ 11 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-12 -> IRQ 12 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-13 -> IRQ 13 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-14 -> IRQ 14 Level:0 ActiveLow:0)
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-15 -> IRQ 15 Level:0 ActiveLow:0)
apic 2 pin 16 not connected
apic 2 pin 17 not connected
apic 2 pin 18 not connected
apic 2 pin 19 not connected
apic 2 pin 20 not connected
apic 2 pin 21 not connected
apic 2 pin 22 not connected
apic 2 pin 23 not connected
apic 2 pin 24 not connected
apic 2 pin 25 not connected
apic 2 pin 26 not connected
apic 2 pin 27 not connected
apic 2 pin 28 not connected
apic 2 pin 29 not connected
apic 2 pin 30 not connected
apic 2 pin 31 not connected
apic 2 pin 32 not connected
apic 2 pin 33 not connected
apic 2 pin 34 not connected
apic 2 pin 35 not connected
apic 2 pin 36 not connected
apic 2 pin 37 not connected
apic 2 pin 38 not connected
apic 2 pin 39 not connected
apic 2 pin 40 not connected
apic 2 pin 41 not connected
apic 2 pin 42 not connected
apic 2 pin 43 not connected
apic 2 pin 44 not connected
apic 2 pin 45 not connected
apic 2 pin 46 not connected
apic 2 pin 47 not connected
apic 2 pin 48 not connected
apic 2 pin 49 not connected
apic 2 pin 50 not connected
apic 2 pin 51 not connected
apic 2 pin 52 not connected
apic 2 pin 53 not connected
apic 2 pin 54 not connected
apic 2 pin 55 not connected
apic 2 pin 56 not connected
apic 2 pin 57 not connected
apic 2 pin 58 not connected
apic 2 pin 59 not connected
apic 2 pin 60 not connected
apic 2 pin 61 not connected
apic 2 pin 62 not connected
apic 2 pin 63 not connected
apic 2 pin 64 not connected
apic 2 pin 65 not connected
apic 2 pin 66 not connected
apic 2 pin 67 not connected
apic 2 pin 68 not connected
apic 2 pin 69 not connected
apic 2 pin 70 not connected
apic 2 pin 71 not connected
apic 2 pin 72 not connected
apic 2 pin 73 not connected
apic 2 pin 74 not connected
apic 2 pin 75 not connected
apic 2 pin 76 not connected
apic 2 pin 77 not connected
apic 2 pin 78 not connected
apic 2 pin 79 not connected
apic 2 pin 80 not connected
apic 2 pin 81 not connected
apic 2 pin 82 not connected
apic 2 pin 83 not connected
apic 2 pin 84 not connected
apic 2 pin 85 not connected
apic 2 pin 86 not connected
apic 2 pin 87 not connected
apic 2 pin 88 not connected
apic 2 pin 89 not connected
apic 2 pin 90 not connected
apic 2 pin 91 not connected
apic 2 pin 92 not connected
apic 2 pin 93 not connected
apic 2 pin 94 not connected
apic 2 pin 95 not connected
apic 2 pin 96 not connected
apic 2 pin 97 not connected
apic 2 pin 98 not connected
apic 2 pin 99 not connected
apic 2 pin 100 not connected
apic 2 pin 101 not connected
apic 2 pin 102 not connected
apic 2 pin 103 not connected
apic 2 pin 104 not connected
apic 2 pin 105 not connected
apic 2 pin 106 not connected
apic 2 pin 107 not connected
apic 2 pin 108 not connected
apic 2 pin 109 not connected
apic 2 pin 110 not connected
apic 2 pin 111 not connected
apic 2 pin 112 not connected
apic 2 pin 113 not connected
apic 2 pin 114 not connected
apic 2 pin 115 not connected
apic 2 pin 116 not connected
apic 2 pin 117 not connected
apic 2 pin 118 not connected
apic 2 pin 119 not connected
..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2f9146cb80a, max_idle_ns: 440795296911 ns
Calibrating delay loop (skipped), value calculated using timer frequency.. 6599.98 BogoMIPS (lpj=3299994)
pid_max: default: 32768 minimum: 301
LSM: initializing lsm=capability,landlock,yama,integrity,bpf
landlock: Up and running.
Yama: becoming mindful.
LSM support for eBPF active
Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
CPU0: Thermal monitoring enabled (TM1)
process: using mwait in idle threads
Last level iTLB entries: 4KB 128, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Spectre V2 : Mitigation: IBRS
Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
RETBleed: Mitigation: IBRS
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
MDS: Mitigation: Clear CPU buffers
TAA: Mitigation: TSX disabled
MMIO Stale Data: Mitigation: Clear CPU buffers
SRBDS: Mitigation: Microcode
Freeing SMP alternatives memory: 40K
smpboot: CPU0: Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (family: 0x6, model: 0x5e, stepping: 0x3)
cblist_init_generic: Setting adjustable number of callback queues.
cblist_init_generic: Setting shift to 2 and lim to 1.
cblist_init_generic: Setting shift to 2 and lim to 1.
Running RCU-tasks wait API self tests
calling  init_hw_perf_events+0x0/0x595 @ 1
Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
... version:                4
... bit width:              48
... generic registers:      8
... value mask:             0000ffffffffffff
... max period:             00007fffffffffff
... fixed-purpose events:   3
... event mask:             00000007000000ff
Callback from call_rcu_tasks_trace() invoked.
initcall init_hw_perf_events+0x0/0x595 returned 0 after 9000 usecs
calling  do_init_real_mode+0x0/0x12 @ 1
initcall do_init_real_mode+0x0/0x12 returned 0 after 0 usecs
calling  trace_init_perf_perm_irq_work_exit+0x0/0x17 @ 1
initcall trace_init_perf_perm_irq_work_exit+0x0/0x17 returned 0 after 0 usecs
calling  bp_init_aperfmperf+0x0/0x5e @ 1
Estimated ratio of average max frequency by base frequency (times 1024): 1055
initcall bp_init_aperfmperf+0x0/0x5e returned 0 after 1000 usecs
calling  register_nmi_cpu_backtrace_handler+0x0/0x1a @ 1
initcall register_nmi_cpu_backtrace_handler+0x0/0x1a returned 0 after 0 usecs
calling  kvm_setup_vsyscall_timeinfo+0x0/0xe1 @ 1
initcall kvm_setup_vsyscall_timeinfo+0x0/0xe1 returned 0 after 0 usecs
calling  spawn_ksoftirqd+0x0/0x3d @ 1
initcall spawn_ksoftirqd+0x0/0x3d returned 0 after 0 usecs
calling  migration_init+0x0/0xd5 @ 1
initcall migration_init+0x0/0xd5 returned 0 after 0 usecs
calling  srcu_bootup_announce+0x0/0x7c @ 1
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 400.
initcall srcu_bootup_announce+0x0/0x7c returned 0 after 2000 usecs
calling  rcu_spawn_gp_kthread+0x0/0x361 @ 1
initcall rcu_spawn_gp_kthread+0x0/0x361 returned 0 after 0 usecs
calling  check_cpu_stall_init+0x0/0x1f @ 1
initcall check_cpu_stall_init+0x0/0x1f returned 0 after 0 usecs
calling  rcu_sysrq_init+0x0/0x26 @ 1
initcall rcu_sysrq_init+0x0/0x26 returned 0 after 0 usecs
calling  trace_init_flags_sys_enter+0x0/0x13 @ 1
initcall trace_init_flags_sys_enter+0x0/0x13 returned 0 after 0 usecs
calling  trace_init_flags_sys_exit+0x0/0x13 @ 1
initcall trace_init_flags_sys_exit+0x0/0x13 returned 0 after 0 usecs
calling  cpu_stop_init+0x0/0x166 @ 1
initcall cpu_stop_init+0x0/0x166 returned 0 after 0 usecs
calling  init_kprobes+0x0/0x25d @ 1
initcall init_kprobes+0x0/0x25d returned 0 after 1000 usecs
calling  init_events+0x0/0xc6 @ 1
initcall init_events+0x0/0xc6 returned 0 after 0 usecs
calling  init_trace_printk+0x0/0x10 @ 1
initcall init_trace_printk+0x0/0x10 returned 0 after 0 usecs
calling  event_trace_enable_again+0x0/0x23 @ 1
initcall event_trace_enable_again+0x0/0x23 returned 0 after 0 usecs
calling  irq_work_init_threads+0x0/0x7 @ 1
initcall irq_work_init_threads+0x0/0x7 returned 0 after 0 usecs
calling  static_call_init+0x0/0x93 @ 1
initcall static_call_init+0x0/0x93 returned 0 after 0 usecs
calling  jump_label_init_module+0x0/0x15 @ 1
initcall jump_label_init_module+0x0/0x15 returned 0 after 0 usecs
calling  init_zero_pfn+0x0/0xbf @ 1
initcall init_zero_pfn+0x0/0xbf returned 0 after 0 usecs
calling  init_fs_inode_sysctls+0x0/0x26 @ 1
initcall init_fs_inode_sysctls+0x0/0x26 returned 0 after 0 usecs
calling  init_fs_locks_sysctls+0x0/0x26 @ 1
initcall init_fs_locks_sysctls+0x0/0x26 returned 0 after 0 usecs
calling  dynamic_debug_init+0x0/0x3c6 @ 1
initcall dynamic_debug_init+0x0/0x3c6 returned 0 after 1000 usecs
calling  efi_memreserve_root_init+0x0/0x2a @ 1
initcall efi_memreserve_root_init+0x0/0x2a returned 0 after 0 usecs
calling  efi_earlycon_remap_fb+0x0/0xf8 @ 1
initcall efi_earlycon_remap_fb+0x0/0xf8 returned 0 after 0 usecs
smp: Bringing up secondary CPUs ...
x86: Booting SMP configuration:
.... node  #0, CPUs:      #1
masked ExtINT on CPU#1
#2
masked ExtINT on CPU#2
#3
masked ExtINT on CPU#3
smp: Brought up 1 node, 4 CPUs
smpboot: Max logical packages: 1
smpboot: Total of 4 processors activated (26399.95 BogoMIPS)
Callback from call_rcu_tasks_rude() invoked.
node 0 deferred pages initialised in 57ms
devtmpfs: initialized
x86/mm: Memory block size: 128MB
calling  bpf_jit_charge_init+0x0/0x40 @ 1
initcall bpf_jit_charge_init+0x0/0x40 returned 0 after 0 usecs
calling  ipc_ns_init+0x0/0x11e @ 1
initcall ipc_ns_init+0x0/0x11e returned 0 after 0 usecs
calling  init_mmap_min_addr+0x0/0x1a @ 1
initcall init_mmap_min_addr+0x0/0x1a returned 0 after 0 usecs
calling  pci_realloc_setup_params+0x0/0x49 @ 1
initcall pci_realloc_setup_params+0x0/0x49 returned 0 after 0 usecs
calling  inet_frag_wq_init+0x0/0x46 @ 1
initcall inet_frag_wq_init+0x0/0x46 returned 0 after 0 usecs
calling  e820__register_nvs_regions+0x0/0x150 @ 1
ACPI: PM: Registering ACPI NVS region [mem 0xb3c7f000-0xb3e7efff] (2097152 bytes)
initcall e820__register_nvs_regions+0x0/0x150 returned 0 after 2000 usecs
calling  cpufreq_register_tsc_scaling+0x0/0x7a @ 1
initcall cpufreq_register_tsc_scaling+0x0/0x7a returned 0 after 0 usecs
calling  cache_ap_register+0x0/0x2c @ 1
initcall cache_ap_register+0x0/0x2c returned 0 after 0 usecs
calling  reboot_init+0x0/0xa9 @ 1
initcall reboot_init+0x0/0xa9 returned 0 after 0 usecs
calling  init_lapic_sysfs+0x0/0x4b @ 1
initcall init_lapic_sysfs+0x0/0x4b returned 0 after 0 usecs
calling  alloc_frozen_cpus+0x0/0x25 @ 1
initcall alloc_frozen_cpus+0x0/0x25 returned 0 after 0 usecs
calling  cpu_hotplug_pm_sync_init+0x0/0x18 @ 1
initcall cpu_hotplug_pm_sync_init+0x0/0x18 returned 0 after 0 usecs
calling  wq_sysfs_init+0x0/0x2f @ 1
initcall wq_sysfs_init+0x0/0x2f returned 0 after 0 usecs
calling  ksysfs_init+0x0/0x9d @ 1
initcall ksysfs_init+0x0/0x9d returned 0 after 0 usecs
calling  schedutil_gov_init+0x0/0x15 @ 1
initcall schedutil_gov_init+0x0/0x15 returned 0 after 0 usecs
calling  pm_init+0x0/0xb4 @ 1
initcall pm_init+0x0/0xb4 returned 0 after 0 usecs
calling  pm_disk_init+0x0/0x42 @ 1
initcall pm_disk_init+0x0/0x42 returned 0 after 0 usecs
calling  swsusp_header_init+0x0/0x35 @ 1
initcall swsusp_header_init+0x0/0x35 returned 0 after 0 usecs
calling  rcu_set_runtime_mode+0x0/0x63 @ 1
initcall rcu_set_runtime_mode+0x0/0x63 returned 0 after 0 usecs
calling  init_jiffies_clocksource+0x0/0x1c @ 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
initcall init_jiffies_clocksource+0x0/0x1c returned 0 after 1000 usecs
calling  futex_init+0x0/0x1f9 @ 1
futex hash table entries: 1024 (order: 5, 131072 bytes, linear)
initcall futex_init+0x0/0x1f9 returned 0 after 1000 usecs
calling  cgroup_wq_init+0x0/0x2d @ 1
initcall cgroup_wq_init+0x0/0x2d returned 0 after 0 usecs
calling  cgroup1_wq_init+0x0/0x2d @ 1
initcall cgroup1_wq_init+0x0/0x2d returned 0 after 0 usecs
calling  ftrace_mod_cmd_init+0x0/0x10 @ 1
initcall ftrace_mod_cmd_init+0x0/0x10 returned 0 after 0 usecs
calling  init_irqsoff_tracer+0x0/0x13 @ 1
initcall init_irqsoff_tracer+0x0/0x13 returned 0 after 0 usecs
calling  init_wakeup_tracer+0x0/0x31 @ 1
initcall init_wakeup_tracer+0x0/0x31 returned 0 after 0 usecs
calling  init_graph_trace+0x0/0x95 @ 1
initcall init_graph_trace+0x0/0x95 returned 0 after 0 usecs
calling  trace_events_eprobe_init_early+0x0/0x2b @ 1
initcall trace_events_eprobe_init_early+0x0/0x2b returned 0 after 0 usecs
calling  trace_events_synth_init_early+0x0/0x2b @ 1
initcall trace_events_synth_init_early+0x0/0x2b returned 0 after 0 usecs
calling  init_kprobe_trace_early+0x0/0x2a @ 1
initcall init_kprobe_trace_early+0x0/0x2a returned 0 after 0 usecs
calling  kasan_memhotplug_init+0x0/0x13 @ 1
initcall kasan_memhotplug_init+0x0/0x13 returned 0 after 0 usecs
calling  memory_failure_init+0x0/0x273 @ 1
initcall memory_failure_init+0x0/0x273 returned 0 after 0 usecs
calling  cma_init_reserved_areas+0x0/0x49 @ 1
initcall cma_init_reserved_areas+0x0/0x49 returned 0 after 0 usecs
calling  fsnotify_init+0x0/0x8b @ 1
initcall fsnotify_init+0x0/0x8b returned 0 after 0 usecs
calling  filelock_init+0x0/0x174 @ 1
initcall filelock_init+0x0/0x174 returned 0 after 0 usecs
calling  init_script_binfmt+0x0/0x1a @ 1
initcall init_script_binfmt+0x0/0x1a returned 0 after 0 usecs
calling  init_elf_binfmt+0x0/0x1a @ 1
initcall init_elf_binfmt+0x0/0x1a returned 0 after 0 usecs
calling  init_compat_elf_binfmt+0x0/0x1a @ 1
initcall init_compat_elf_binfmt+0x0/0x1a returned 0 after 0 usecs
calling  configfs_init+0x0/0xee @ 1
initcall configfs_init+0x0/0xee returned 0 after 0 usecs
calling  debugfs_init+0x0/0xb7 @ 1
initcall debugfs_init+0x0/0xb7 returned 0 after 0 usecs
calling  tracefs_init+0x0/0x67 @ 1
initcall tracefs_init+0x0/0x67 returned 0 after 0 usecs
calling  securityfs_init+0x0/0xbe @ 1
initcall securityfs_init+0x0/0xbe returned 0 after 0 usecs
calling  pinctrl_init+0x0/0xb2 @ 1
pinctrl core: initialized pinctrl subsystem
initcall pinctrl_init+0x0/0xb2 returned 0 after 1000 usecs
calling  gpiolib_dev_init+0x0/0x124 @ 1
initcall gpiolib_dev_init+0x0/0x124 returned 0 after 0 usecs
calling  virtio_init+0x0/0x20 @ 1
initcall virtio_init+0x0/0x20 returned 0 after 0 usecs
calling  iommu_init+0x0/0x55 @ 1
initcall iommu_init+0x0/0x55 returned 0 after 0 usecs
calling  component_debug_init+0x0/0x21 @ 1
initcall component_debug_init+0x0/0x21 returned 0 after 0 usecs
calling  cpufreq_core_init+0x0/0xce @ 1
initcall cpufreq_core_init+0x0/0xce returned 0 after 0 usecs
calling  cpufreq_gov_performance_init+0x0/0x15 @ 1
initcall cpufreq_gov_performance_init+0x0/0x15 returned 0 after 0 usecs
calling  cpufreq_gov_powersave_init+0x0/0x15 @ 1
initcall cpufreq_gov_powersave_init+0x0/0x15 returned 0 after 0 usecs
calling  cpufreq_gov_userspace_init+0x0/0x15 @ 1
initcall cpufreq_gov_userspace_init+0x0/0x15 returned 0 after 0 usecs
calling  CPU_FREQ_GOV_ONDEMAND_init+0x0/0x15 @ 1
initcall CPU_FREQ_GOV_ONDEMAND_init+0x0/0x15 returned 0 after 0 usecs
calling  CPU_FREQ_GOV_CONSERVATIVE_init+0x0/0x15 @ 1
initcall CPU_FREQ_GOV_CONSERVATIVE_init+0x0/0x15 returned 0 after 0 usecs
calling  cpuidle_init+0x0/0x4a @ 1
initcall cpuidle_init+0x0/0x4a returned 0 after 0 usecs
calling  sock_init+0x0/0xa3 @ 1
initcall sock_init+0x0/0xa3 returned 0 after 1000 usecs
calling  net_inuse_init+0x0/0x2d @ 1
initcall net_inuse_init+0x0/0x2d returned 0 after 0 usecs
calling  net_defaults_init+0x0/0x2d @ 1
initcall net_defaults_init+0x0/0x2d returned 0 after 0 usecs
calling  init_default_flow_dissectors+0x0/0x54 @ 1
initcall init_default_flow_dissectors+0x0/0x54 returned 0 after 0 usecs
calling  netpoll_init+0x0/0x18 @ 1
initcall netpoll_init+0x0/0x18 returned 0 after 0 usecs
calling  netlink_proto_init+0x0/0x29f @ 1
NET: Registered PF_NETLINK/PF_ROUTE protocol family
initcall netlink_proto_init+0x0/0x29f returned 0 after 1000 usecs
calling  genl_init+0x0/0x47 @ 1
initcall genl_init+0x0/0x47 returned 0 after 0 usecs
calling  bsp_pm_check_init+0x0/0x18 @ 1
initcall bsp_pm_check_init+0x0/0x18 returned 0 after 0 usecs
calling  trace_boot_init+0x0/0x18b @ 1
initcall trace_boot_init+0x0/0x18b returned 0 after 0 usecs
calling  irq_sysfs_init+0x0/0xbe @ 1
initcall irq_sysfs_init+0x0/0xbe returned 0 after 1000 usecs
calling  audit_init+0x0/0x18e @ 1
audit: initializing netlink subsys (disabled)
initcall audit_init+0x0/0x18e returned 0 after 1000 usecs
audit: type=2000 audit(1672982709.400:1): state=initialized audit_enabled=0 res=1
calling  release_early_probes+0x0/0x5d @ 1
initcall release_early_probes+0x0/0x5d returned 0 after 0 usecs
calling  bdi_class_init+0x0/0x71 @ 1
initcall bdi_class_init+0x0/0x71 returned 0 after 0 usecs
calling  mm_sysfs_init+0x0/0x53 @ 1
initcall mm_sysfs_init+0x0/0x53 returned 0 after 0 usecs
calling  init_per_zone_wmark_min+0x0/0x2a @ 1
initcall init_per_zone_wmark_min+0x0/0x2a returned 0 after 0 usecs
calling  mpi_init+0x0/0xea @ 1
initcall mpi_init+0x0/0xea returned 0 after 0 usecs
calling  gpiolib_sysfs_init+0x0/0x11d @ 1
initcall gpiolib_sysfs_init+0x0/0x11d returned 0 after 0 usecs
calling  acpi_gpio_setup_params+0x0/0x11a @ 1
initcall acpi_gpio_setup_params+0x0/0x11a returned 0 after 0 usecs
calling  pcibus_class_init+0x0/0x1c @ 1
initcall pcibus_class_init+0x0/0x1c returned 0 after 0 usecs
calling  pci_driver_init+0x0/0x26 @ 1
initcall pci_driver_init+0x0/0x26 returned 0 after 0 usecs
calling  backlight_class_init+0x0/0xf2 @ 1
initcall backlight_class_init+0x0/0xf2 returned 0 after 0 usecs
calling  tty_class_init+0x0/0x5c @ 1
initcall tty_class_init+0x0/0x5c returned 0 after 0 usecs
calling  vtconsole_class_init+0x0/0x1a4 @ 1
initcall vtconsole_class_init+0x0/0x1a4 returned 0 after 0 usecs
calling  iommu_dev_init+0x0/0x1c @ 1
initcall iommu_dev_init+0x0/0x1c returned 0 after 0 usecs
calling  mipi_dsi_bus_init+0x0/0x15 @ 1
initcall mipi_dsi_bus_init+0x0/0x15 returned 0 after 0 usecs
calling  devlink_class_init+0x0/0x4a @ 1
initcall devlink_class_init+0x0/0x4a returned 0 after 0 usecs
calling  software_node_init+0x0/0x55 @ 1
initcall software_node_init+0x0/0x55 returned 0 after 0 usecs
calling  wakeup_sources_debugfs_init+0x0/0x28 @ 1
initcall wakeup_sources_debugfs_init+0x0/0x28 returned 0 after 0 usecs
calling  wakeup_sources_sysfs_init+0x0/0x31 @ 1
initcall wakeup_sources_sysfs_init+0x0/0x31 returned 0 after 0 usecs
calling  regmap_initcall+0x0/0x11 @ 1
initcall regmap_initcall+0x0/0x11 returned 0 after 0 usecs
calling  spi_init+0x0/0xcb @ 1
initcall spi_init+0x0/0xcb returned 0 after 0 usecs
calling  i2c_init+0x0/0xec @ 1
initcall i2c_init+0x0/0xec returned 0 after 0 usecs
calling  thermal_init+0x0/0x1ae @ 1
thermal_sys: Registered thermal governor 'fair_share'
thermal_sys: Registered thermal governor 'bang_bang'
thermal_sys: Registered thermal governor 'step_wise'
thermal_sys: Registered thermal governor 'user_space'
initcall thermal_init+0x0/0x1ae returned 0 after 3000 usecs
calling  init_ladder+0x0/0x59 @ 1
cpuidle: using governor ladder
initcall init_ladder+0x0/0x59 returned 0 after 1000 usecs
calling  init_menu+0x0/0x15 @ 1
cpuidle: using governor menu
initcall init_menu+0x0/0x15 returned 0 after 1000 usecs
calling  pcc_init+0x0/0xcb @ 1
initcall pcc_init+0x0/0xcb returned -19 after 0 usecs
calling  kobject_uevent_init+0x0/0x10 @ 1
initcall kobject_uevent_init+0x0/0x10 returned 0 after 0 usecs
calling  bts_init+0x0/0x134 @ 1
initcall bts_init+0x0/0x134 returned -19 after 0 usecs
calling  pt_init+0x0/0x2c1 @ 1
initcall pt_init+0x0/0x2c1 returned 0 after 0 usecs
calling  boot_params_ksysfs_init+0x0/0x96 @ 1
initcall boot_params_ksysfs_init+0x0/0x96 returned 0 after 0 usecs
calling  sbf_init+0x0/0xd3 @ 1
initcall sbf_init+0x0/0xd3 returned 0 after 0 usecs
calling  arch_kdebugfs_init+0x0/0x4d9 @ 1
initcall arch_kdebugfs_init+0x0/0x4d9 returned 0 after 0 usecs
calling  xfd_update_static_branch+0x0/0x48 @ 1
initcall xfd_update_static_branch+0x0/0x48 returned 0 after 0 usecs
calling  intel_pconfig_init+0x0/0xa9 @ 1
initcall intel_pconfig_init+0x0/0xa9 returned 0 after 0 usecs
calling  mtrr_if_init+0x0/0xaf @ 1
initcall mtrr_if_init+0x0/0xaf returned 0 after 0 usecs
calling  activate_jump_labels+0x0/0x36 @ 1
initcall activate_jump_labels+0x0/0x36 returned 0 after 0 usecs
calling  init_s4_sigcheck+0x0/0x90 @ 1
initcall init_s4_sigcheck+0x0/0x90 returned 0 after 0 usecs
calling  ffh_cstate_init+0x0/0x66 @ 1
initcall ffh_cstate_init+0x0/0x66 returned 0 after 0 usecs
calling  kvm_alloc_cpumask+0x0/0x1d1 @ 1
initcall kvm_alloc_cpumask+0x0/0x1d1 returned 0 after 0 usecs
calling  activate_jump_labels+0x0/0x36 @ 1
initcall activate_jump_labels+0x0/0x36 returned 0 after 0 usecs
calling  gigantic_pages_init+0x0/0x4a @ 1
initcall gigantic_pages_init+0x0/0x4a returned 0 after 0 usecs
calling  uv_rtc_setup_clock+0x0/0x27a @ 1
initcall uv_rtc_setup_clock+0x0/0x27a returned -19 after 0 usecs
calling  kcmp_cookies_init+0x0/0xa6 @ 1
initcall kcmp_cookies_init+0x0/0xa6 returned 0 after 0 usecs
calling  cryptomgr_init+0x0/0x15 @ 1
initcall cryptomgr_init+0x0/0x15 returned 0 after 0 usecs
calling  acpi_pci_init+0x0/0x14d @ 1
ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
initcall acpi_pci_init+0x0/0x14d returned 0 after 2000 usecs
calling  dma_channel_table_init+0x0/0x17d @ 1
initcall dma_channel_table_init+0x0/0x17d returned 0 after 0 usecs
calling  dma_bus_init+0x0/0x20f @ 1
initcall dma_bus_init+0x0/0x20f returned 0 after 0 usecs
calling  iommu_dma_init+0x0/0x50 @ 1
initcall iommu_dma_init+0x0/0x50 returned 0 after 0 usecs
calling  dmi_id_init+0x0/0x16c @ 1
initcall dmi_id_init+0x0/0x16c returned 0 after 0 usecs
calling  pci_arch_init+0x0/0x11c @ 1
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
PCI: Using configuration type 1 for base access
initcall pci_arch_init+0x0/0x11c returned 0 after 21000 usecs
calling  init_vdso+0x0/0x18 @ 1
initcall init_vdso+0x0/0x18 returned 0 after 0 usecs
calling  sysenter_setup+0x0/0x18 @ 1
initcall sysenter_setup+0x0/0x18 returned 0 after 0 usecs
calling  fixup_ht_bug+0x0/0x257 @ 1
initcall fixup_ht_bug+0x0/0x257 returned 0 after 0 usecs
calling  topology_init+0x0/0x9e @ 1
initcall topology_init+0x0/0x9e returned 0 after 0 usecs
calling  intel_epb_init+0x0/0xd8 @ 1
initcall intel_epb_init+0x0/0xd8 returned 0 after 0 usecs
calling  mtrr_init_finialize+0x0/0x6f @ 1
initcall mtrr_init_finialize+0x0/0x6f returned 0 after 0 usecs
calling  uid_cache_init+0x0/0x102 @ 1
initcall uid_cache_init+0x0/0x102 returned 0 after 0 usecs
calling  param_sysfs_init+0x0/0x4f @ 1
initcall param_sysfs_init+0x0/0x4f returned 0 after 0 usecs
calling  user_namespace_sysctl_init+0x0/0x11e @ 1
initcall user_namespace_sysctl_init+0x0/0x11e returned 0 after 0 usecs
calling  proc_schedstat_init+0x0/0x29 @ 1
initcall proc_schedstat_init+0x0/0x29 returned 0 after 0 usecs
calling  pm_sysrq_init+0x0/0x1d @ 1
initcall pm_sysrq_init+0x0/0x1d returned 0 after 0 usecs
calling  create_proc_profile+0x0/0xe0 @ 1
initcall create_proc_profile+0x0/0xe0 returned 0 after 0 usecs
calling  crash_save_vmcoreinfo_init+0x0/0x742 @ 1
initcall crash_save_vmcoreinfo_init+0x0/0x742 returned 0 after 0 usecs
calling  crash_notes_memory_init+0x0/0x3d @ 1
initcall crash_notes_memory_init+0x0/0x3d returned 0 after 0 usecs
calling  cgroup_sysfs_init+0x0/0x42 @ 1
initcall cgroup_sysfs_init+0x0/0x42 returned 0 after 0 usecs
calling  cgroup_namespaces_init+0x0/0xc @ 1
initcall cgroup_namespaces_init+0x0/0xc returned 0 after 0 usecs
calling  user_namespaces_init+0x0/0x31 @ 1
initcall user_namespaces_init+0x0/0x31 returned 0 after 0 usecs
calling  init_optprobes+0x0/0x1d @ 1
kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
initcall init_optprobes+0x0/0x1d returned 0 after 1000 usecs
calling  hung_task_init+0x0/0x79 @ 1
initcall hung_task_init+0x0/0x79 returned 0 after 0 usecs
calling  ftrace_check_for_weak_functions+0x0/0x8b @ 1
initcall ftrace_check_for_weak_functions+0x0/0x8b returned 0 after 0 usecs
calling  trace_eval_init+0x0/0xae @ 1
initcall trace_eval_init+0x0/0xae returned 0 after 0 usecs
calling  send_signal_irq_work_init+0x0/0x153 @ 1
initcall send_signal_irq_work_init+0x0/0x153 returned 0 after 0 usecs
calling  dev_map_init+0x0/0x123 @ 1
initcall dev_map_init+0x0/0x123 returned 0 after 0 usecs
calling  cpu_map_init+0x0/0x117 @ 1
initcall cpu_map_init+0x0/0x117 returned 0 after 0 usecs
calling  netns_bpf_init+0x0/0x15 @ 1
initcall netns_bpf_init+0x0/0x15 returned 0 after 0 usecs
calling  btf_vmlinux_init+0x0/0x88 @ 1
initcall btf_vmlinux_init+0x0/0x88 returned 0 after 0 usecs
calling  oom_init+0x0/0x4e @ 1
initcall oom_init+0x0/0x4e returned 0 after 0 usecs
calling  default_bdi_init+0x0/0x2d @ 1
initcall default_bdi_init+0x0/0x2d returned 0 after 0 usecs
calling  cgwb_init+0x0/0x2d @ 1
initcall cgwb_init+0x0/0x2d returned 0 after 0 usecs
calling  percpu_enable_async+0x0/0x13 @ 1
initcall percpu_enable_async+0x0/0x13 returned 0 after 0 usecs
calling  kcompactd_init+0x0/0x9c @ 1
initcall kcompactd_init+0x0/0x9c returned 0 after 0 usecs
calling  init_user_reserve+0x0/0xa0 @ 1
initcall init_user_reserve+0x0/0xa0 returned 0 after 0 usecs
calling  init_admin_reserve+0x0/0xa0 @ 1
initcall init_admin_reserve+0x0/0xa0 returned 0 after 0 usecs
calling  init_reserve_notifier+0x0/0x23 @ 1
initcall init_reserve_notifier+0x0/0x23 returned 0 after 0 usecs
calling  swap_init_sysfs+0x0/0x92 @ 1
initcall swap_init_sysfs+0x0/0x92 returned 0 after 0 usecs
calling  swapfile_init+0x0/0x14b @ 1
initcall swapfile_init+0x0/0x14b returned 0 after 0 usecs
calling  hugetlb_init+0x0/0xac6 @ 1
HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
initcall hugetlb_init+0x0/0xac6 returned 0 after 4000 usecs
calling  ksm_init+0x0/0x246 @ 1
initcall ksm_init+0x0/0x246 returned 0 after 0 usecs
calling  memory_tier_init+0x0/0x143 @ 1
initcall memory_tier_init+0x0/0x143 returned 0 after 0 usecs
calling  numa_init_sysfs+0x0/0x92 @ 1
initcall numa_init_sysfs+0x0/0x92 returned 0 after 0 usecs
calling  hugepage_init+0x0/0x1b4 @ 1
initcall hugepage_init+0x0/0x1b4 returned 0 after 0 usecs
calling  mem_cgroup_init+0x0/0x3d4 @ 1
initcall mem_cgroup_init+0x0/0x3d4 returned 0 after 0 usecs
calling  mem_cgroup_swap_init+0x0/0x60 @ 1
initcall mem_cgroup_swap_init+0x0/0x60 returned 0 after 0 usecs
calling  page_idle_init+0x0/0x5d @ 1
initcall page_idle_init+0x0/0x5d returned 0 after 0 usecs
calling  damon_init+0x0/0x49 @ 1
initcall damon_init+0x0/0x49 returned 0 after 0 usecs
calling  damon_va_initcall+0x0/0x15c @ 1
initcall damon_va_initcall+0x0/0x15c returned 0 after 0 usecs
calling  damon_pa_initcall+0x0/0xf7 @ 1
initcall damon_pa_initcall+0x0/0xf7 returned 0 after 0 usecs
calling  seqiv_module_init+0x0/0x15 @ 1
initcall seqiv_module_init+0x0/0x15 returned 0 after 0 usecs
calling  rsa_init+0x0/0x43 @ 1
initcall rsa_init+0x0/0x43 returned 0 after 0 usecs
calling  hmac_module_init+0x0/0x15 @ 1
initcall hmac_module_init+0x0/0x15 returned 0 after 0 usecs
calling  crypto_null_mod_init+0x0/0x71 @ 1
initcall crypto_null_mod_init+0x0/0x71 returned 0 after 0 usecs
calling  md5_mod_init+0x0/0x15 @ 1
initcall md5_mod_init+0x0/0x15 returned 0 after 0 usecs
calling  sha1_generic_mod_init+0x0/0x15 @ 1
initcall sha1_generic_mod_init+0x0/0x15 returned 0 after 0 usecs
calling  sha256_generic_mod_init+0x0/0x1a @ 1
initcall sha256_generic_mod_init+0x0/0x1a returned 0 after 0 usecs
calling  sha512_generic_mod_init+0x0/0x1a @ 1
initcall sha512_generic_mod_init+0x0/0x1a returned 0 after 0 usecs
calling  crypto_ecb_module_init+0x0/0x15 @ 1
initcall crypto_ecb_module_init+0x0/0x15 returned 0 after 0 usecs
calling  crypto_cbc_module_init+0x0/0x15 @ 1
initcall crypto_cbc_module_init+0x0/0x15 returned 0 after 0 usecs
calling  crypto_cfb_module_init+0x0/0x15 @ 1
initcall crypto_cfb_module_init+0x0/0x15 returned 0 after 0 usecs
calling  crypto_ctr_module_init+0x0/0x1a @ 1
initcall crypto_ctr_module_init+0x0/0x1a returned 0 after 0 usecs
calling  crypto_gcm_module_init+0x0/0x67 @ 1
initcall crypto_gcm_module_init+0x0/0x67 returned 0 after 0 usecs
calling  cryptd_init+0x0/0x220 @ 1
cryptd: max_cpu_qlen set to 1000
initcall cryptd_init+0x0/0x220 returned 0 after 1000 usecs
calling  aes_init+0x0/0x15 @ 1
initcall aes_init+0x0/0x15 returned 0 after 0 usecs
calling  sm4_init+0x0/0x15 @ 1
initcall sm4_init+0x0/0x15 returned 0 after 0 usecs
calling  deflate_mod_init+0x0/0x48 @ 1
initcall deflate_mod_init+0x0/0x48 returned 0 after 0 usecs
calling  crc32c_mod_init+0x0/0x15 @ 1
initcall crc32c_mod_init+0x0/0x15 returned 0 after 0 usecs
calling  crct10dif_mod_init+0x0/0x15 @ 1
initcall crct10dif_mod_init+0x0/0x15 returned 0 after 0 usecs
calling  lzo_mod_init+0x0/0x43 @ 1
initcall lzo_mod_init+0x0/0x43 returned 0 after 0 usecs
calling  lzorle_mod_init+0x0/0x43 @ 1
initcall lzorle_mod_init+0x0/0x43 returned 0 after 0 usecs
calling  drbg_init+0x0/0xe8 @ 1
initcall drbg_init+0x0/0xe8 returned 0 after 0 usecs
calling  ghash_mod_init+0x0/0x15 @ 1
initcall ghash_mod_init+0x0/0x15 returned 0 after 0 usecs
calling  init_bio+0x0/0x115 @ 1
initcall init_bio+0x0/0x115 returned 0 after 0 usecs
calling  blk_ioc_init+0x0/0x2e @ 1
initcall blk_ioc_init+0x0/0x2e returned 0 after 0 usecs
calling  blk_mq_init+0x0/0x17b @ 1
initcall blk_mq_init+0x0/0x17b returned 0 after 0 usecs
calling  genhd_device_init+0x0/0x8c @ 1
initcall genhd_device_init+0x0/0x8c returned 0 after 0 usecs
calling  blkcg_init+0x0/0x2d @ 1
initcall blkcg_init+0x0/0x2d returned 0 after 0 usecs
calling  io_wq_init+0x0/0x3d @ 1
initcall io_wq_init+0x0/0x3d returned 0 after 0 usecs
calling  sg_pool_init+0x0/0x1a9 @ 1
initcall sg_pool_init+0x0/0x1a9 returned 0 after 0 usecs
calling  irq_poll_setup+0x0/0x149 @ 1
initcall irq_poll_setup+0x0/0x149 returned 0 after 0 usecs
calling  gpiolib_debugfs_init+0x0/0x28 @ 1
initcall gpiolib_debugfs_init+0x0/0x28 returned 0 after 0 usecs
calling  pwm_debugfs_init+0x0/0x28 @ 1
initcall pwm_debugfs_init+0x0/0x28 returned 0 after 0 usecs
calling  pwm_sysfs_init+0x0/0x1c @ 1
initcall pwm_sysfs_init+0x0/0x1c returned 0 after 0 usecs
calling  pci_slot_init+0x0/0x40 @ 1
initcall pci_slot_init+0x0/0x40 returned 0 after 0 usecs
calling  fbmem_init+0x0/0xe5 @ 1
initcall fbmem_init+0x0/0xe5 returned 0 after 0 usecs
calling  scan_for_dmi_ipmi+0x0/0x56 @ 1
initcall scan_for_dmi_ipmi+0x0/0x56 returned 0 after 0 usecs
calling  acpi_init+0x0/0x271 @ 1
ACPI: Added _OSI(Module Device)
ACPI: Added _OSI(Processor Device)
ACPI: Added _OSI(3.0 _SCP Extensions)
ACPI: Added _OSI(Processor Aggregator Device)
ACPI: 8 ACPI AML tables successfully acquired and loaded
ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF88810405D000 0006C3 (v02 PmRef  Cpu0Ist  00003000 INTL 20121018)
ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881013D5800 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 20121018)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF888104104000 0005AA (v02 PmRef  ApIst    00003000 INTL 20121018)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881040CC800 000119 (v02 PmRef  ApCst    00003000 INTL 20121018)
ACPI: EC: EC started
ACPI: EC: interrupt blocked
ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions
ACPI: Interpreter enabled
ACPI: PM: (supports S0 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
PCI: Using E820 reservations for host bridge windows
ACPI: Enabled 5 GPEs in block 00 to 7F
ACPI: \_SB_.PCI0.PEG1.PG01: New power resource
ACPI: \_SB_.PCI0.PEG2.PG02: New power resource
ACPI: \_SB_.PCI0.PEG0.PG00: New power resource
ACPI: \_SB_.PCI0.PEG0.PEGP.WRST: New power resource
ACPI: \_SB_.PCI0.RP01.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP02.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP03.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP04.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP05.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP06.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP07.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP08.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP09.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP10.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP11.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP12.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP13.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP14.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP15.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP16.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP17.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP18.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP19.PXSX.WRST: New power resource
ACPI: \_SB_.PCI0.RP20.PXSX.WRST: New power resource
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME LTR]
acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
pci_bus 0000:00: root bus resource [mem 0xbe800000-0xdfffffff window]
pci_bus 0000:00: root bus resource [mem 0x1c00000000-0x1fffffffff window]
pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
pci_bus 0000:00: root bus resource [bus 00-fe]
pci 0000:00:00.0: calling  quirk_mmio_always_on+0x0/0x80 @ 1
pci 0000:00:00.0: quirk_mmio_always_on+0x0/0x80 took 0 usecs
pci 0000:00:00.0: [8086:1918] type 00 class 0x060000
pci 0000:00:00.0: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:00.0: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:02.0: [8086:191d] type 00 class 0x030000
pci 0000:00:02.0: reg 0x10: [mem 0xd0000000-0xd0ffffff 64bit]
pci 0000:00:02.0: reg 0x18: [mem 0xc0000000-0xcfffffff 64bit pref]
pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
pci 0000:00:02.0: calling  efifb_fixup_resources+0x0/0x4a0 @ 1
pci 0000:00:02.0: efifb_fixup_resources+0x0/0x4a0 took 0 usecs
pci 0000:00:02.0: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:02.0: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:02.0: calling  pci_fixup_video+0x0/0x200 @ 1
pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
pci 0000:00:02.0: pci_fixup_video+0x0/0x200 took 976 usecs
pci 0000:00:14.0: [8086:a12f] type 00 class 0x0c0330
pci 0000:00:14.0: reg 0x10: [mem 0xd1020000-0xd102ffff 64bit]
pci 0000:00:14.0: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:14.0: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:14.0: PME# supported from D3hot D3cold
pci 0000:00:14.2: [8086:a131] type 00 class 0x118000
pci 0000:00:14.2: reg 0x10: [mem 0xd104a000-0xd104afff 64bit]
pci 0000:00:14.2: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:14.2: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:16.0: [8086:a13a] type 00 class 0x078000
pci 0000:00:16.0: reg 0x10: [mem 0xd104b000-0xd104bfff 64bit]
pci 0000:00:16.0: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:16.0: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:16.0: PME# supported from D3hot
pci 0000:00:16.3: [8086:a13d] type 00 class 0x070002
pci 0000:00:16.3: reg 0x10: [io  0x3080-0x3087]
pci 0000:00:16.3: reg 0x14: [mem 0xd104f000-0xd104ffff]
pci 0000:00:16.3: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:16.3: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:17.0: [8086:2822] type 00 class 0x010400
pci 0000:00:17.0: reg 0x10: [mem 0xd1048000-0xd1049fff]
pci 0000:00:17.0: reg 0x14: [mem 0xd104e000-0xd104e0ff]
pci 0000:00:17.0: reg 0x18: [io  0x3088-0x308f]
pci 0000:00:17.0: reg 0x1c: [io  0x3090-0x3093]
pci 0000:00:17.0: reg 0x20: [io  0x3060-0x307f]
pci 0000:00:17.0: reg 0x24: [mem 0xd104c000-0xd104c7ff]
pci 0000:00:17.0: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:17.0: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:17.0: PME# supported from D3hot
pci 0000:00:1f.0: [8086:a149] type 00 class 0x060100
pci 0000:00:1f.0: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:1f.0: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:1f.2: [8086:a121] type 00 class 0x058000
pci 0000:00:1f.2: reg 0x10: [mem 0xd1044000-0xd1047fff]
pci 0000:00:1f.2: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:1f.2: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:1f.3: [8086:a170] type 00 class 0x040300
pci 0000:00:1f.3: reg 0x10: [mem 0xd1040000-0xd1043fff 64bit]
pci 0000:00:1f.3: reg 0x20: [mem 0xd1030000-0xd103ffff 64bit]
pci 0000:00:1f.3: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:1f.3: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:1f.3: PME# supported from D3hot D3cold
pci 0000:00:1f.4: [8086:a123] type 00 class 0x0c0500
pci 0000:00:1f.4: reg 0x10: [mem 0xd104d000-0xd104d0ff 64bit]
pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
pci 0000:00:1f.4: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:1f.4: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:1f.6: calling  quirk_f0_vpd_link+0x0/0x220 @ 1
pci 0000:00:1f.6: quirk_f0_vpd_link+0x0/0x220 took 0 usecs
pci 0000:00:1f.6: [8086:15b7] type 00 class 0x020000
pci 0000:00:1f.6: reg 0x10: [mem 0xd1000000-0xd101ffff]
pci 0000:00:1f.6: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 1
pci 0000:00:1f.6: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
ACPI: PCI: Interrupt link LNKA configured for IRQ 11
ACPI: PCI: Interrupt link LNKA disabled
ACPI: PCI: Interrupt link LNKB configured for IRQ 10
ACPI: PCI: Interrupt link LNKB disabled
ACPI: PCI: Interrupt link LNKC configured for IRQ 11
ACPI: PCI: Interrupt link LNKC disabled
ACPI: PCI: Interrupt link LNKD configured for IRQ 11
ACPI: PCI: Interrupt link LNKD disabled
ACPI: PCI: Interrupt link LNKE configured for IRQ 11
ACPI: PCI: Interrupt link LNKE disabled
ACPI: PCI: Interrupt link LNKF configured for IRQ 11
ACPI: PCI: Interrupt link LNKF disabled
ACPI: PCI: Interrupt link LNKG configured for IRQ 11
ACPI: PCI: Interrupt link LNKG disabled
ACPI: PCI: Interrupt link LNKH configured for IRQ 11
ACPI: PCI: Interrupt link LNKH disabled
ACPI: EC: interrupt unblocked
ACPI: EC: event unblocked
ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
ACPI: EC: GPE=0x6e
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete
ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
initcall acpi_init+0x0/0x271 returned 0 after 1373000 usecs
calling  adxl_init+0x0/0x250 @ 1
initcall adxl_init+0x0/0x250 returned -19 after 0 usecs
calling  pnp_init+0x0/0x15 @ 1
initcall pnp_init+0x0/0x15 returned 0 after 0 usecs
calling  misc_init+0x0/0xe8 @ 1
initcall misc_init+0x0/0xe8 returned 0 after 0 usecs
calling  tpm_init+0x0/0x21c @ 1
initcall tpm_init+0x0/0x21c returned 0 after 0 usecs
calling  iommu_subsys_init+0x0/0x1a9 @ 1
iommu: Default domain type: Translated 
iommu: DMA domain TLB invalidation policy: lazy mode 
initcall iommu_subsys_init+0x0/0x1a9 returned 0 after 2000 usecs
calling  cn_init+0x0/0x180 @ 1
initcall cn_init+0x0/0x180 returned 0 after 0 usecs
calling  dax_core_init+0x0/0xe7 @ 1
initcall dax_core_init+0x0/0xe7 returned 0 after 0 usecs
calling  dma_buf_init+0x0/0xcb @ 1
initcall dma_buf_init+0x0/0xcb returned 0 after 0 usecs
calling  dma_resv_lockdep+0x0/0x45a @ 1
initcall dma_resv_lockdep+0x0/0x45a returned 0 after 0 usecs
calling  dma_heap_init+0x0/0xc0 @ 1
initcall dma_heap_init+0x0/0xc0 returned 0 after 0 usecs
calling  init_scsi+0x0/0x8c @ 1
SCSI subsystem initialized
initcall init_scsi+0x0/0x8c returned 0 after 1000 usecs
calling  phy_init+0x0/0x69 @ 1
initcall phy_init+0x0/0x69 returned 0 after 0 usecs
calling  usb_common_init+0x0/0x21 @ 1
initcall usb_common_init+0x0/0x21 returned 0 after 0 usecs
calling  usb_init+0x0/0x154 @ 1
ACPI: bus type USB registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
initcall usb_init+0x0/0x154 returned 0 after 4000 usecs
calling  xdbc_init+0x0/0x155 @ 1
initcall xdbc_init+0x0/0x155 returned 0 after 0 usecs
calling  typec_init+0x0/0xb2 @ 1
initcall typec_init+0x0/0xb2 returned 0 after 0 usecs
calling  serio_init+0x0/0x32 @ 1
initcall serio_init+0x0/0x32 returned 0 after 0 usecs
calling  input_init+0x0/0x108 @ 1
initcall input_init+0x0/0x108 returned 0 after 0 usecs
calling  rtc_init+0x0/0x75 @ 1
initcall rtc_init+0x0/0x75 returned 0 after 0 usecs
calling  rc_core_init+0x0/0x7e @ 1
initcall rc_core_init+0x0/0x7e returned 0 after 0 usecs
calling  pps_init+0x0/0xda @ 1
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
initcall pps_init+0x0/0xda returned 0 after 2000 usecs
calling  ptp_init+0x0/0xc4 @ 1
PTP clock support registered
initcall ptp_init+0x0/0xc4 returned 0 after 1000 usecs
calling  power_supply_class_init+0x0/0x68 @ 1
initcall power_supply_class_init+0x0/0x68 returned 0 after 0 usecs
calling  hwmon_init+0x0/0x17c @ 1
initcall hwmon_init+0x0/0x17c returned 0 after 0 usecs
calling  md_init+0x0/0x160 @ 1
initcall md_init+0x0/0x160 returned 0 after 0 usecs
calling  edac_init+0x0/0x7a @ 1
EDAC MC: Ver: 3.0.0
initcall edac_init+0x0/0x7a returned 0 after 1000 usecs
calling  leds_init+0x0/0x83 @ 1
initcall leds_init+0x0/0x83 returned 0 after 0 usecs
calling  dmi_init+0x0/0x146 @ 1
initcall dmi_init+0x0/0x146 returned 0 after 0 usecs
calling  efisubsys_init+0x0/0x27f @ 1
initcall efisubsys_init+0x0/0x27f returned 0 after 0 usecs
calling  ras_init+0x0/0x13 @ 1
initcall ras_init+0x0/0x13 returned 0 after 0 usecs
calling  nvmem_init+0x0/0x15 @ 1
initcall nvmem_init+0x0/0x15 returned 0 after 0 usecs
calling  proto_init+0x0/0x15 @ 1
initcall proto_init+0x0/0x15 returned 0 after 0 usecs
calling  net_dev_init+0x0/0x60b @ 1
initcall net_dev_init+0x0/0x60b returned 0 after 1000 usecs
calling  neigh_init+0x0/0x89 @ 1
initcall neigh_init+0x0/0x89 returned 0 after 0 usecs
calling  fib_notifier_init+0x0/0x15 @ 1
initcall fib_notifier_init+0x0/0x15 returned 0 after 0 usecs
calling  fib_rules_init+0x0/0xb6 @ 1
initcall fib_rules_init+0x0/0xb6 returned 0 after 0 usecs
calling  init_cgroup_netprio+0x0/0x18 @ 1
initcall init_cgroup_netprio+0x0/0x18 returned 0 after 0 usecs
calling  bpf_lwt_init+0x0/0x1a @ 1
initcall bpf_lwt_init+0x0/0x1a returned 0 after 0 usecs
calling  devlink_init+0x0/0x2c @ 1
initcall devlink_init+0x0/0x2c returned 0 after 0 usecs
calling  pktsched_init+0x0/0x117 @ 1
initcall pktsched_init+0x0/0x117 returned 0 after 0 usecs
calling  tc_filter_init+0x0/0x104 @ 1
initcall tc_filter_init+0x0/0x104 returned 0 after 0 usecs
calling  tc_action_init+0x0/0x59 @ 1
initcall tc_action_init+0x0/0x59 returned 0 after 0 usecs
calling  ethnl_init+0x0/0x5c @ 1
initcall ethnl_init+0x0/0x5c returned 0 after 0 usecs
calling  nexthop_init+0x0/0xfa @ 1
initcall nexthop_init+0x0/0xfa returned 0 after 0 usecs
calling  cipso_v4_init+0x0/0xee @ 1
initcall cipso_v4_init+0x0/0xee returned 0 after 0 usecs
calling  netlbl_init+0x0/0x8c @ 1
NetLabel: Initializing
NetLabel:  domain hash size = 128
NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
NetLabel:  unlabeled traffic allowed by default
initcall netlbl_init+0x0/0x8c returned 0 after 4000 usecs
calling  pci_subsys_init+0x0/0x122 @ 1
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
e820: reserve RAM buffer [mem 0x00091c00-0x0009ffff]
e820: reserve RAM buffer [mem 0xb30fb000-0xb3ffffff]
e820: reserve RAM buffer [mem 0xb3f00000-0xb3ffffff]
e820: reserve RAM buffer [mem 0x43f800000-0x43fffffff]
initcall pci_subsys_init+0x0/0x122 returned 0 after 34000 usecs
calling  vsprintf_init_hashval+0x0/0x13 @ 1
initcall vsprintf_init_hashval+0x0/0x13 returned 0 after 0 usecs
calling  efi_runtime_map_init+0x0/0x1dc @ 1
initcall efi_runtime_map_init+0x0/0x1dc returned 0 after 0 usecs
calling  vga_arb_device_init+0x0/0x7b @ 1
pci 0000:00:02.0: vgaarb: setting as boot VGA device
pci 0000:00:02.0: vgaarb: bridge control possible
pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
initcall vga_arb_device_init+0x0/0x7b returned 0 after 2000 usecs
calling  watchdog_init+0x0/0x13d @ 1
initcall watchdog_init+0x0/0x13d returned 0 after 0 usecs
calling  nmi_warning_debugfs+0x0/0x51 @ 1
initcall nmi_warning_debugfs+0x0/0x51 returned 0 after 0 usecs
calling  save_microcode_in_initrd+0x0/0xc7 @ 1
initcall save_microcode_in_initrd+0x0/0xc7 returned 0 after 0 usecs
calling  hpet_late_init+0x0/0x173 @ 1
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
hpet0: 8 comparators, 64-bit 24.000000 MHz counter
initcall hpet_late_init+0x0/0x173 returned 0 after 4000 usecs
calling  iomem_init_inode+0x0/0xab @ 1
initcall iomem_init_inode+0x0/0xab returned 0 after 0 usecs
calling  clocksource_done_booting+0x0/0x48 @ 1
clocksource: Switched to clocksource tsc-early
initcall clocksource_done_booting+0x0/0x48 returned 0 after 6365 usecs
calling  tracer_init_tracefs+0x0/0x183 @ 1
initcall tracer_init_tracefs+0x0/0x183 returned 0 after 30 usecs
calling  init_trace_printk_function_export+0x0/0x2c @ 1
initcall init_trace_printk_function_export+0x0/0x2c returned 0 after 50 usecs
calling  init_graph_tracefs+0x0/0x2c @ 1
initcall init_graph_tracefs+0x0/0x2c returned 0 after 23 usecs
calling  trace_events_synth_init+0x0/0x4b @ 1
initcall trace_events_synth_init+0x0/0x4b returned 0 after 21 usecs
calling  bpf_event_init+0x0/0x13 @ 1
initcall bpf_event_init+0x0/0x13 returned 0 after 1 usecs
calling  init_kprobe_trace+0x0/0x312 @ 1
initcall init_kprobe_trace+0x0/0x312 returned 0 after 205050 usecs
calling  init_dynamic_event+0x0/0x2c @ 1
initcall init_dynamic_event+0x0/0x2c returned 0 after 24 usecs
calling  init_uprobe_trace+0x0/0x60 @ 1
initcall init_uprobe_trace+0x0/0x60 returned 0 after 42 usecs
calling  bpf_init+0x0/0x9d @ 1
initcall bpf_init+0x0/0x9d returned 0 after 14 usecs
calling  btf_module_init+0x0/0x18 @ 1
initcall btf_module_init+0x0/0x18 returned 0 after 1 usecs
calling  secretmem_init+0x0/0x60 @ 1
initcall secretmem_init+0x0/0x60 returned 0 after 0 usecs
calling  init_fs_stat_sysctls+0x0/0x32 @ 1
initcall init_fs_stat_sysctls+0x0/0x32 returned 0 after 21 usecs
calling  init_fs_exec_sysctls+0x0/0x26 @ 1
initcall init_fs_exec_sysctls+0x0/0x26 returned 0 after 6 usecs
calling  init_pipe_fs+0x0/0x68 @ 1
initcall init_pipe_fs+0x0/0x68 returned 0 after 210 usecs
calling  init_fs_namei_sysctls+0x0/0x26 @ 1
initcall init_fs_namei_sysctls+0x0/0x26 returned 0 after 8 usecs
calling  init_fs_dcache_sysctls+0x0/0x26 @ 1
initcall init_fs_dcache_sysctls+0x0/0x26 returned 0 after 6 usecs
calling  init_fs_namespace_sysctls+0x0/0x26 @ 1
initcall init_fs_namespace_sysctls+0x0/0x26 returned 0 after 6 usecs
calling  cgroup_writeback_init+0x0/0x2a @ 1
initcall cgroup_writeback_init+0x0/0x2a returned 0 after 27 usecs
calling  inotify_user_setup+0x0/0x18e @ 1
initcall inotify_user_setup+0x0/0x18e returned 0 after 58 usecs
calling  eventpoll_init+0x0/0x145 @ 1
initcall eventpoll_init+0x0/0x145 returned 0 after 162 usecs
calling  anon_inode_init+0x0/0x8e @ 1
initcall anon_inode_init+0x0/0x8e returned 0 after 267 usecs
calling  init_dax_wait_table+0x0/0x38 @ 1
initcall init_dax_wait_table+0x0/0x38 returned 0 after 273 usecs
calling  proc_locks_init+0x0/0x2c @ 1
initcall proc_locks_init+0x0/0x2c returned 0 after 12 usecs
calling  init_fs_coredump_sysctls+0x0/0x26 @ 1
initcall init_fs_coredump_sysctls+0x0/0x26 returned 0 after 12 usecs
calling  iomap_init+0x0/0x24 @ 1
initcall iomap_init+0x0/0x24 returned 0 after 256 usecs
calling  dquot_init+0x0/0x167 @ 1
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
initcall dquot_init+0x0/0x167 returned 0 after 12555 usecs
calling  quota_init+0x0/0x28 @ 1
initcall quota_init+0x0/0x28 returned 0 after 62 usecs
calling  proc_cmdline_init+0x0/0x93 @ 1
initcall proc_cmdline_init+0x0/0x93 returned 0 after 7 usecs
calling  proc_consoles_init+0x0/0x29 @ 1
initcall proc_consoles_init+0x0/0x29 returned 0 after 6 usecs
calling  proc_cpuinfo_init+0x0/0x23 @ 1
initcall proc_cpuinfo_init+0x0/0x23 returned 0 after 6 usecs
calling  proc_devices_init+0x0/0x62 @ 1
initcall proc_devices_init+0x0/0x62 returned 0 after 6 usecs
calling  proc_interrupts_init+0x0/0x29 @ 1
initcall proc_interrupts_init+0x0/0x29 returned 0 after 6 usecs
calling  proc_loadavg_init+0x0/0x5f @ 1
initcall proc_loadavg_init+0x0/0x5f returned 0 after 6 usecs
calling  proc_meminfo_init+0x0/0x5f @ 1
initcall proc_meminfo_init+0x0/0x5f returned 0 after 6 usecs
calling  proc_stat_init+0x0/0x23 @ 1
initcall proc_stat_init+0x0/0x23 returned 0 after 6 usecs
calling  proc_uptime_init+0x0/0x5f @ 1
initcall proc_uptime_init+0x0/0x5f returned 0 after 6 usecs
calling  proc_version_init+0x0/0x5f @ 1
initcall proc_version_init+0x0/0x5f returned 0 after 6 usecs
calling  proc_softirqs_init+0x0/0x5f @ 1
initcall proc_softirqs_init+0x0/0x5f returned 0 after 6 usecs
calling  proc_kcore_init+0x0/0x146 @ 1
initcall proc_kcore_init+0x0/0x146 returned 0 after 85 usecs
calling  vmcore_init+0x0/0x2f5 @ 1
initcall vmcore_init+0x0/0x2f5 returned 0 after 0 usecs
calling  proc_kmsg_init+0x0/0x26 @ 1
initcall proc_kmsg_init+0x0/0x26 returned 0 after 6 usecs
calling  proc_page_init+0x0/0x5a @ 1
initcall proc_page_init+0x0/0x5a returned 0 after 16 usecs
calling  proc_boot_config_init+0x0/0x87 @ 1
initcall proc_boot_config_init+0x0/0x87 returned 0 after 13 usecs
calling  init_ramfs_fs+0x0/0x15 @ 1
initcall init_ramfs_fs+0x0/0x15 returned 0 after 1 usecs
calling  init_hugetlbfs_fs+0x0/0x2a6 @ 1
initcall init_hugetlbfs_fs+0x0/0x2a6 returned 0 after 301 usecs
calling  dynamic_debug_init_control+0x0/0x80 @ 1
initcall dynamic_debug_init_control+0x0/0x80 returned 0 after 57 usecs
calling  acpi_event_init+0x0/0x65 @ 1
initcall acpi_event_init+0x0/0x65 returned 0 after 54 usecs
calling  pnp_system_init+0x0/0x15 @ 1
initcall pnp_system_init+0x0/0x15 returned 0 after 86 usecs
calling  pnpacpi_init+0x0/0xd6 @ 1
pnp: PnP ACPI init
system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
system 00:00: [mem 0xfe000000-0xfe01ffff] has been reserved
system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
system 00:01: [io  0x0680-0x069f] has been reserved
system 00:01: [io  0xffff] has been reserved
system 00:01: [io  0xffff] has been reserved
system 00:01: [io  0xffff] has been reserved
system 00:01: [io  0x1800-0x18fe] has been reserved
system 00:01: [io  0x164e-0x164f] has been reserved
system 00:02: [io  0x0800-0x087f] has been reserved
system 00:04: [io  0x1854-0x1857] has been reserved
system 00:08: [io  0x0200-0x023f] has been reserved
system 00:08: [mem 0xfedb0000-0xfedbffff] has been reserved
system 00:09: [mem 0xfed10000-0xfed17fff] has been reserved
system 00:09: [mem 0xfed18000-0xfed18fff] has been reserved
system 00:09: [mem 0xfed19000-0xfed19fff] has been reserved
system 00:09: [mem 0xe0000000-0xefffffff] has been reserved
system 00:09: [mem 0xfed20000-0xfed3ffff] has been reserved
system 00:09: [mem 0xfed90000-0xfed93fff] could not be reserved
system 00:09: [mem 0xfed45000-0xfed8ffff] could not be reserved
system 00:09: [mem 0xff000000-0xffffffff] could not be reserved
system 00:09: [mem 0xfee00000-0xfeefffff] could not be reserved
system 00:09: [mem 0xfedc0000-0xfeddffff] has been reserved
pnp: PnP ACPI: found 11 devices
initcall pnpacpi_init+0x0/0xd6 returned 0 after 225205 usecs
calling  chr_dev_init+0x0/0x135 @ 1
initcall chr_dev_init+0x0/0x135 returned 0 after 14581 usecs
calling  hwrng_modinit+0x0/0xea @ 1
initcall hwrng_modinit+0x0/0xea returned 0 after 275 usecs
calling  firmware_class_init+0x0/0x15f @ 1
initcall firmware_class_init+0x0/0x15f returned 0 after 52 usecs
calling  init_acpi_pm_clocksource+0x0/0xd6 @ 1
clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
initcall init_acpi_pm_clocksource+0x0/0xd6 returned 0 after 14301 usecs
calling  powercap_init+0x0/0x26 @ 1
initcall powercap_init+0x0/0x26 returned 0 after 266 usecs
calling  sysctl_core_init+0x0/0x2f @ 1
initcall sysctl_core_init+0x0/0x2f returned 0 after 48 usecs
calling  eth_offload_init+0x0/0x18 @ 1
initcall eth_offload_init+0x0/0x18 returned 0 after 15 usecs
calling  ipv4_offload_init+0x0/0x78 @ 1
initcall ipv4_offload_init+0x0/0x78 returned 0 after 1 usecs
calling  inet_init+0x0/0x32f @ 1
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 8192 (order: 7, 589824 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
TCP bind hash table entries: 65536 (order: 11, 9437184 bytes, vmalloc hugepage)
TCP: Hash tables configured (established 131072 bind 65536)
MPTCP token hash table entries: 16384 (order: 8, 1441792 bytes, linear)
UDP hash table entries: 8192 (order: 8, 1310720 bytes, linear)
UDP-Lite hash table entries: 8192 (order: 8, 1310720 bytes, linear)
initcall inet_init+0x0/0x32f returned 0 after 98470 usecs
calling  af_unix_init+0x0/0x19e @ 1
NET: Registered PF_UNIX/PF_LOCAL protocol family
initcall af_unix_init+0x0/0x19e returned 0 after 6628 usecs
calling  ipv6_offload_init+0x0/0x83 @ 1
initcall ipv6_offload_init+0x0/0x83 returned 0 after 2 usecs
calling  init_sunrpc+0x0/0x8c @ 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
initcall init_sunrpc+0x0/0x8c returned 0 after 26174 usecs
calling  vlan_offload_init+0x0/0x24 @ 1
initcall vlan_offload_init+0x0/0x24 returned 0 after 1 usecs
calling  xsk_init+0x0/0x1c1 @ 1
NET: Registered PF_XDP protocol family
initcall xsk_init+0x0/0x1c1 returned 0 after 5648 usecs
calling  pcibios_assign_resources+0x0/0x23c @ 1
pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
pci_bus 0000:00: resource 7 [mem 0xbe800000-0xdfffffff window]
pci_bus 0000:00: resource 8 [mem 0x1c00000000-0x1fffffffff window]
pci_bus 0000:00: resource 9 [mem 0xfd000000-0xfe7fffff window]
initcall pcibios_assign_resources+0x0/0x23c returned 0 after 47005 usecs
calling  pci_apply_final_quirks+0x0/0x330 @ 1
pci 0000:00:14.0: calling  quirk_usb_early_handoff+0x0/0x2d0 @ 1
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-16 -> IRQ 16 Level:1 ActiveLow:1)
pci 0000:00:14.0: quirk_usb_early_handoff+0x0/0x2d0 took 28228 usecs
pci 0000:00:1f.6: calling  quirk_e100_interrupt+0x0/0x290 @ 1
pci 0000:00:1f.6: quirk_e100_interrupt+0x0/0x290 took 0 usecs
PCI: CLS 0 bytes, default 64
initcall pci_apply_final_quirks+0x0/0x330 returned 0 after 65263 usecs
calling  acpi_reserve_resources+0x0/0x277 @ 1
initcall acpi_reserve_resources+0x0/0x277 returned 0 after 37 usecs
calling  populate_rootfs+0x0/0x40 @ 1
initcall populate_rootfs+0x0/0x40 returned 0 after 68 usecs
Trying to unpack rootfs image as initramfs...
calling  pci_iommu_init+0x0/0x59 @ 1
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x00000000af0fb000-0x00000000b30fb000] (64MB)
initcall pci_iommu_init+0x0/0x59 returned 0 after 30396 usecs
calling  ir_dev_scope_init+0x0/0x71 @ 1
initcall ir_dev_scope_init+0x0/0x71 returned 0 after 13 usecs
calling  ia32_binfmt_init+0x0/0x18 @ 1
initcall ia32_binfmt_init+0x0/0x18 returned 0 after 26 usecs
calling  amd_ibs_init+0x0/0xfa @ 1
initcall amd_ibs_init+0x0/0xfa returned -19 after 0 usecs
calling  msr_init+0x0/0x80 @ 1
initcall msr_init+0x0/0x80 returned 0 after 29 usecs
calling  register_kernel_offset_dumper+0x0/0x1f @ 1
initcall register_kernel_offset_dumper+0x0/0x1f returned 0 after 1 usecs
calling  i8259A_init_ops+0x0/0x25 @ 1
initcall i8259A_init_ops+0x0/0x25 returned 0 after 12 usecs
calling  init_tsc_clocksource+0x0/0xe6 @ 1
initcall init_tsc_clocksource+0x0/0xe6 returned 0 after 5 usecs
calling  add_rtc_cmos+0x0/0x1f4 @ 1
initcall add_rtc_cmos+0x0/0x1f4 returned 0 after 2 usecs
calling  i8237A_init_ops+0x0/0x3b @ 1
initcall i8237A_init_ops+0x0/0x3b returned -19 after 2 usecs
calling  umwait_init+0x0/0xe1 @ 1
initcall umwait_init+0x0/0xe1 returned -19 after 0 usecs
calling  sgx_init+0x0/0x15d @ 1
initcall sgx_init+0x0/0x15d returned -19 after 0 usecs
calling  msr_init+0x0/0x101 @ 1
initcall msr_init+0x0/0x101 returned 0 after 1685 usecs
calling  cpuid_init+0x0/0x101 @ 1
initcall cpuid_init+0x0/0x101 returned 0 after 3126 usecs
calling  ioapic_init_ops+0x0/0x18 @ 1
initcall ioapic_init_ops+0x0/0x18 returned 0 after 1 usecs
calling  register_e820_pmem+0x0/0x62 @ 1
initcall register_e820_pmem+0x0/0x62 returned 0 after 4 usecs
calling  add_pcspkr+0x0/0xd3 @ 1
initcall add_pcspkr+0x0/0xd3 returned 0 after 162 usecs
calling  start_periodic_check_for_corruption+0x0/0x40 @ 1
initcall start_periodic_check_for_corruption+0x0/0x40 returned 0 after 0 usecs
calling  audit_classes_init+0x0/0xb3 @ 1
initcall audit_classes_init+0x0/0xb3 returned 0 after 47 usecs
calling  sha1_ssse3_mod_init+0x0/0xeb @ 1
initcall sha1_ssse3_mod_init+0x0/0xeb returned 0 after 14 usecs
calling  sha256_ssse3_mod_init+0x0/0xff @ 1
initcall sha256_ssse3_mod_init+0x0/0xff returned 0 after 19 usecs
calling  iosf_mbi_init+0x0/0x2d @ 1
initcall iosf_mbi_init+0x0/0x2d returned 0 after 151 usecs
calling  proc_execdomains_init+0x0/0x26 @ 1
initcall proc_execdomains_init+0x0/0x26 returned 0 after 10 usecs
calling  register_warn_debugfs+0x0/0x28 @ 1
initcall register_warn_debugfs+0x0/0x28 returned 0 after 27 usecs
calling  cpuhp_sysfs_init+0x0/0x144 @ 1
initcall cpuhp_sysfs_init+0x0/0x144 returned 0 after 124 usecs
calling  ioresources_init+0x0/0x4e @ 1
initcall ioresources_init+0x0/0x4e returned 0 after 18 usecs
calling  lockdep_proc_init+0x0/0x64 @ 1
initcall lockdep_proc_init+0x0/0x64 returned 0 after 17 usecs
calling  snapshot_device_init+0x0/0x15 @ 1
initcall snapshot_device_init+0x0/0x15 returned 0 after 234 usecs
calling  irq_pm_init_ops+0x0/0x18 @ 1
initcall irq_pm_init_ops+0x0/0x18 returned 0 after 17 usecs
calling  klp_init+0x0/0x53 @ 1
initcall klp_init+0x0/0x53 returned 0 after 14 usecs
calling  map_benchmark_init+0x0/0x4e @ 1
initcall map_benchmark_init+0x0/0x4e returned 0 after 157 usecs
calling  proc_modules_init+0x0/0x23 @ 1
initcall proc_modules_init+0x0/0x23 returned 0 after 13 usecs
calling  timer_sysctl_init+0x0/0x1f @ 1
initcall timer_sysctl_init+0x0/0x1f returned 0 after 12 usecs
calling  timekeeping_init_ops+0x0/0x18 @ 1
initcall timekeeping_init_ops+0x0/0x18 returned 0 after 1 usecs
calling  init_clocksource_sysfs+0x0/0x28 @ 1
initcall init_clocksource_sysfs+0x0/0x28 returned 0 after 303 usecs
calling  init_timer_list_procfs+0x0/0x36 @ 1
initcall init_timer_list_procfs+0x0/0x36 returned 0 after 9 usecs
calling  alarmtimer_init+0x0/0x133 @ 1
initcall alarmtimer_init+0x0/0x133 returned 0 after 98 usecs
calling  init_posix_timers+0x0/0x2e @ 1
initcall init_posix_timers+0x0/0x2e returned 0 after 44 usecs
calling  clockevents_init_sysfs+0x0/0x19e @ 1
initcall clockevents_init_sysfs+0x0/0x19e returned 0 after 678 usecs
calling  proc_dma_init+0x0/0x26 @ 1
initcall proc_dma_init+0x0/0x26 returned 0 after 36 usecs
calling  kallsyms_init+0x0/0x26 @ 1
initcall kallsyms_init+0x0/0x26 returned 0 after 8 usecs
calling  pid_namespaces_init+0x0/0x44 @ 1
initcall pid_namespaces_init+0x0/0x44 returned 0 after 65 usecs
calling  ikconfig_init+0x0/0x46 @ 1
initcall ikconfig_init+0x0/0x46 returned 0 after 7 usecs
calling  audit_watch_init+0x0/0x40 @ 1
initcall audit_watch_init+0x0/0x40 returned 0 after 9 usecs
calling  audit_fsnotify_init+0x0/0x43 @ 1
initcall audit_fsnotify_init+0x0/0x43 returned 0 after 4 usecs
calling  audit_tree_init+0x0/0xcf @ 1
initcall audit_tree_init+0x0/0xcf returned 0 after 50 usecs
calling  seccomp_sysctl_init+0x0/0x30 @ 1
initcall seccomp_sysctl_init+0x0/0x30 returned 0 after 28 usecs
calling  utsname_sysctl_init+0x0/0x18 @ 1
initcall utsname_sysctl_init+0x0/0x18 returned 0 after 18 usecs
calling  init_tracepoints+0x0/0x30 @ 1
initcall init_tracepoints+0x0/0x30 returned 0 after 2 usecs
calling  init_lstats_procfs+0x0/0x40 @ 1
initcall init_lstats_procfs+0x0/0x40 returned 0 after 17 usecs
calling  stack_trace_init+0x0/0xa8 @ 1
initcall stack_trace_init+0x0/0xa8 returned 0 after 90 usecs
calling  perf_event_sysfs_init+0x0/0x10c @ 1
initcall perf_event_sysfs_init+0x0/0x10c returned 0 after 1708 usecs
calling  system_trusted_keyring_init+0x0/0x8e @ 1
Initialise system trusted keyrings
initcall system_trusted_keyring_init+0x0/0x8e returned 0 after 5348 usecs
calling  blacklist_init+0x0/0x166 @ 1
Key type blacklist registered
initcall blacklist_init+0x0/0x166 returned 0 after 4890 usecs
calling  kswapd_init+0x0/0x64 @ 1
initcall kswapd_init+0x0/0x64 returned 0 after 205 usecs
calling  extfrag_debug_init+0x0/0x5b @ 1
initcall extfrag_debug_init+0x0/0x5b returned 0 after 94 usecs
calling  mm_compute_batch_init+0x0/0x57 @ 1
initcall mm_compute_batch_init+0x0/0x57 returned 0 after 2 usecs
calling  slab_proc_init+0x0/0x26 @ 1
initcall slab_proc_init+0x0/0x26 returned 0 after 9 usecs
calling  workingset_init+0x0/0xd4 @ 1
workingset: timestamp_bits=36 max_order=22 bucket_order=0
initcall workingset_init+0x0/0xd4 returned 0 after 7309 usecs
calling  proc_vmalloc_init+0x0/0x68 @ 1
initcall proc_vmalloc_init+0x0/0x68 returned 0 after 8 usecs
calling  procswaps_init+0x0/0x23 @ 1
initcall procswaps_init+0x0/0x23 returned 0 after 7 usecs
calling  init_frontswap+0x0/0x97 @ 1
initcall init_frontswap+0x0/0x97 returned 0 after 112 usecs
calling  slab_debugfs_init+0x0/0x52 @ 1
initcall slab_debugfs_init+0x0/0x52 returned 0 after 30 usecs
calling  init_zbud+0x0/0x24 @ 1
zbud: loaded
initcall init_zbud+0x0/0x24 returned 0 after 3365 usecs
calling  zs_init+0x0/0x77 @ 1
initcall zs_init+0x0/0x77 returned 0 after 63 usecs
calling  damon_dbgfs_init+0x0/0x389 @ 1
initcall damon_dbgfs_init+0x0/0x389 returned 0 after 302 usecs
calling  fcntl_init+0x0/0x2e @ 1
initcall fcntl_init+0x0/0x2e returned 0 after 45 usecs
calling  proc_filesystems_init+0x0/0x26 @ 1
initcall proc_filesystems_init+0x0/0x26 returned 0 after 10 usecs
calling  start_dirtytime_writeback+0x0/0x1b @ 1
initcall start_dirtytime_writeback+0x0/0x1b returned 0 after 2 usecs
calling  dio_init+0x0/0x31 @ 1
initcall dio_init+0x0/0x31 returned 0 after 31 usecs
calling  dnotify_init+0x0/0xa1 @ 1
initcall dnotify_init+0x0/0xa1 returned 0 after 60 usecs
calling  fanotify_user_setup+0x0/0x1fb @ 1
initcall fanotify_user_setup+0x0/0x1fb returned 0 after 93 usecs
calling  userfaultfd_init+0x0/0x4a @ 1
initcall userfaultfd_init+0x0/0x4a returned 0 after 243 usecs
calling  aio_setup+0x0/0x9c @ 1
initcall aio_setup+0x0/0x9c returned 0 after 277 usecs
calling  mbcache_init+0x0/0x35 @ 1
initcall mbcache_init+0x0/0x35 returned 0 after 21 usecs
calling  init_grace+0x0/0x15 @ 1
initcall init_grace+0x0/0x15 returned 0 after 7 usecs
calling  init_v2_quota_format+0x0/0x26 @ 1
initcall init_v2_quota_format+0x0/0x26 returned 0 after 25 usecs
calling  init_devpts_fs+0x0/0x30 @ 1
initcall init_devpts_fs+0x0/0x30 returned 0 after 44 usecs
calling  ext4_init_fs+0x0/0x1a3 @ 1
initcall ext4_init_fs+0x0/0x1a3 returned 0 after 760 usecs
calling  journal_init+0x0/0x132 @ 1
initcall journal_init+0x0/0x132 returned 0 after 120 usecs
calling  init_nfs_fs+0x0/0x195 @ 1
initcall init_nfs_fs+0x0/0x195 returned 0 after 768 usecs
calling  init_nfs_v3+0x0/0x18 @ 1
initcall init_nfs_v3+0x0/0x18 returned 0 after 29 usecs
calling  init_nlm+0x0/0x66 @ 1
initcall init_nlm+0x0/0x66 returned 0 after 35 usecs
calling  init_nls_cp437+0x0/0x17 @ 1
initcall init_nls_cp437+0x0/0x17 returned 0 after 24 usecs
calling  init_nls_ascii+0x0/0x17 @ 1
initcall init_nls_ascii+0x0/0x17 returned 0 after 1 usecs
calling  init_autofs_fs+0x0/0x2e @ 1
initcall init_autofs_fs+0x0/0x2e returned 0 after 228 usecs
calling  init_v9fs+0x0/0x113 @ 1
tsc: Refined TSC clocksource calibration: 3312.000 MHz
9p: Installing v9fs 9p2000 file system support
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2fbd93f9e57, max_idle_ns: 440795263784 ns
initcall init_v9fs+0x0/0x113 returned 0 after 13185 usecs
calling  efivarfs_init+0x0/0x25 @ 1
initcall efivarfs_init+0x0/0x25 returned -19 after 0 usecs
calling  ipc_init+0x0/0x29 @ 1
clocksource: Switched to clocksource tsc
initcall ipc_init+0x0/0x29 returned 0 after 74 usecs
calling  ipc_sysctl_init+0x0/0x31 @ 1
initcall ipc_sysctl_init+0x0/0x31 returned 0 after 42 usecs
calling  init_mqueue_fs+0x0/0xcd @ 1
initcall init_mqueue_fs+0x0/0xcd returned 0 after 284 usecs
calling  key_proc_init+0x0/0x72 @ 1
initcall key_proc_init+0x0/0x72 returned 0 after 14 usecs
calling  jent_mod_init+0x0/0x32 @ 1
initcall jent_mod_init+0x0/0x32 returned 0 after 6629 usecs
calling  af_alg_init+0x0/0x45 @ 1
NET: Registered PF_ALG protocol family
initcall af_alg_init+0x0/0x45 returned 0 after 5595 usecs
calling  algif_hash_init+0x0/0x15 @ 1
initcall algif_hash_init+0x0/0x15 returned 0 after 59 usecs
calling  algif_skcipher_init+0x0/0x15 @ 1
initcall algif_skcipher_init+0x0/0x15 returned 0 after 5 usecs
calling  rng_init+0x0/0x15 @ 1
initcall rng_init+0x0/0x15 returned 0 after 20 usecs
calling  algif_aead_init+0x0/0x15 @ 1
initcall algif_aead_init+0x0/0x15 returned 0 after 4 usecs
calling  asymmetric_key_init+0x0/0x15 @ 1
Key type asymmetric registered
initcall asymmetric_key_init+0x0/0x15 returned 0 after 4903 usecs
calling  x509_key_init+0x0/0x1d @ 1
Asymmetric key parser 'x509' registered
initcall x509_key_init+0x0/0x1d returned 0 after 5746 usecs
calling  blkdev_init+0x0/0x24 @ 1
initcall blkdev_init+0x0/0x24 returned 0 after 46 usecs
calling  proc_genhd_init+0x0/0x46 @ 1
initcall proc_genhd_init+0x0/0x46 returned 0 after 33 usecs
calling  bsg_init+0x0/0x11b @ 1
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
initcall bsg_init+0x0/0x11b returned 0 after 8292 usecs
calling  throtl_init+0x0/0x45 @ 1
initcall throtl_init+0x0/0x45 returned 0 after 222 usecs
calling  iolatency_init+0x0/0x15 @ 1
initcall iolatency_init+0x0/0x15 returned 0 after 6 usecs
calling  deadline_init+0x0/0x15 @ 1
io scheduler mq-deadline registered
initcall deadline_init+0x0/0x15 returned 0 after 5373 usecs
calling  kyber_init+0x0/0x15 @ 1
io scheduler kyber registered
initcall kyber_init+0x0/0x15 returned 0 after 4809 usecs
calling  bfq_init+0x0/0x8f @ 1
io scheduler bfq registered
initcall bfq_init+0x0/0x8f returned 0 after 4784 usecs
calling  io_uring_init+0x0/0x36 @ 1
initcall io_uring_init+0x0/0x36 returned 0 after 25 usecs
calling  test_firmware_init+0x0/0x97 @ 1
test_firmware: interface ready
initcall test_firmware_init+0x0/0x97 returned 0 after 5297 usecs
calling  test_sysctl_init+0x0/0x516 @ 1
initcall test_sysctl_init+0x0/0x516 returned 0 after 19 usecs
calling  blake2s_mod_init+0x0/0xc @ 1
initcall blake2s_mod_init+0x0/0xc returned 0 after 0 usecs
calling  crc_t10dif_mod_init+0x0/0x75 @ 1
initcall crc_t10dif_mod_init+0x0/0x75 returned 0 after 144 usecs
calling  percpu_counter_startup+0x0/0x55 @ 1
initcall percpu_counter_startup+0x0/0x55 returned 0 after 77 usecs
calling  digsig_init+0x0/0x3d @ 1
initcall digsig_init+0x0/0x3d returned 0 after 10 usecs
calling  phy_core_init+0x0/0x73 @ 1
initcall phy_core_init+0x0/0x73 returned 0 after 46 usecs
calling  pcie_portdrv_init+0x0/0x4d @ 1
initcall pcie_portdrv_init+0x0/0x4d returned 0 after 274 usecs
calling  pci_proc_init+0x0/0x70 @ 1
initcall pci_proc_init+0x0/0x70 returned 0 after 92 usecs
calling  pci_hotplug_init+0x0/0xc @ 1
initcall pci_hotplug_init+0x0/0xc returned 0 after 0 usecs
calling  shpcd_init+0x0/0x61 @ 1
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
initcall shpcd_init+0x0/0x61 returned 0 after 7655 usecs
calling  pci_stub_init+0x0/0x1ff @ 1
initcall pci_stub_init+0x0/0x1ff returned 0 after 81 usecs
calling  vmd_drv_init+0x0/0x1e @ 1
initcall vmd_drv_init+0x0/0x1e returned 0 after 66 usecs
calling  vesafb_driver_init+0x0/0x17 @ 1
initcall vesafb_driver_init+0x0/0x17 returned 0 after 53 usecs
calling  efifb_driver_init+0x0/0x17 @ 1
initcall efifb_driver_init+0x0/0x17 returned 0 after 65 usecs
calling  intel_idle_init+0x0/0x503 @ 1
initcall intel_idle_init+0x0/0x503 returned 0 after 3790 usecs
calling  ged_driver_init+0x0/0x17 @ 1
initcall ged_driver_init+0x0/0x17 returned 0 after 143 usecs
calling  acpi_ac_init+0x0/0x7c @ 1
initcall acpi_ac_init+0x0/0x7c returned 0 after 403 usecs
calling  acpi_button_driver_init+0x0/0xb3 @ 1
input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0
ACPI: button: Sleep Button [SLPB]
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
ACPI: button: Power Button [PWRB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
ACPI: button: Power Button [PWRF]
initcall acpi_button_driver_init+0x0/0xb3 returned 0 after 47699 usecs
calling  acpi_fan_driver_init+0x0/0x17 @ 1
initcall acpi_fan_driver_init+0x0/0x17 returned 0 after 62 usecs
calling  acpi_processor_driver_init+0x0/0xef @ 1
initcall acpi_processor_driver_init+0x0/0xef returned 0 after 2267 usecs
calling  acpi_thermal_init+0x0/0x86 @ 1
initcall acpi_thermal_init+0x0/0x86 returned 0 after 620 usecs
calling  acpi_battery_init+0x0/0x71 @ 1
initcall acpi_battery_init+0x0/0x71 returned 0 after 12 usecs
calling  acpi_hed_driver_init+0x0/0x15 @ 1
initcall acpi_hed_driver_init+0x0/0x15 returned 0 after 160 usecs
calling  bgrt_init+0x0/0x19f @ 1
initcall bgrt_init+0x0/0x19f returned -19 after 0 usecs
calling  erst_init+0x0/0x4c7 @ 1
initcall erst_init+0x0/0x4c7 returned 0 after 3 usecs
calling  gpio_clk_driver_init+0x0/0x17 @ 1
initcall gpio_clk_driver_init+0x0/0x17 returned 0 after 57 usecs
calling  plt_clk_driver_init+0x0/0x17 @ 1
initcall plt_clk_driver_init+0x0/0x17 returned 0 after 57 usecs
calling  dw_pci_driver_init+0x0/0x1e @ 1
initcall dw_pci_driver_init+0x0/0x1e returned 0 after 67 usecs
calling  virtio_pci_driver_init+0x0/0x1e @ 1
initcall virtio_pci_driver_init+0x0/0x1e returned 0 after 73 usecs
calling  n_null_init+0x0/0x1e @ 1
initcall n_null_init+0x0/0x1e returned 0 after 1 usecs
calling  pty_init+0x0/0x11 @ 1
initcall pty_init+0x0/0x11 returned 0 after 428 usecs
calling  sysrq_init+0x0/0x4e @ 1
initcall sysrq_init+0x0/0x4e returned 0 after 13 usecs
calling  serial8250_init+0x0/0x320 @ 1
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:07: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
initcall serial8250_init+0x0/0x320 returned 0 after 18748 usecs
calling  serial_pci_driver_init+0x0/0x1e @ 1
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-19 -> IRQ 19 Level:1 ActiveLow:1)
0000:00:16.3: ttyS1 at I/O 0x3080 (irq = 19, base_baud = 115200) is a 16550A
initcall serial_pci_driver_init+0x0/0x1e returned 0 after 37819 usecs
calling  exar_pci_driver_init+0x0/0x1e @ 1
initcall exar_pci_driver_init+0x0/0x1e returned 0 after 79 usecs
calling  dw8250_platform_driver_init+0x0/0x17 @ 1
initcall dw8250_platform_driver_init+0x0/0x17 returned 0 after 147 usecs
calling  lpss8250_pci_driver_init+0x0/0x1e @ 1
initcall lpss8250_pci_driver_init+0x0/0x1e returned 0 after 66 usecs
calling  mid8250_pci_driver_init+0x0/0x1e @ 1
initcall mid8250_pci_driver_init+0x0/0x1e returned 0 after 68 usecs
calling  pericom8250_pci_driver_init+0x0/0x1e @ 1
initcall pericom8250_pci_driver_init+0x0/0x1e returned 0 after 71 usecs
calling  random_sysctls_init+0x0/0x26 @ 1
initcall random_sysctls_init+0x0/0x26 returned 0 after 29 usecs
calling  hpet_init+0x0/0x76 @ 1
initcall hpet_init+0x0/0x76 returned 0 after 1427 usecs
calling  nvram_module_init+0x0/0x8d @ 1
Non-volatile memory driver v1.3
initcall nvram_module_init+0x0/0x8d returned 0 after 5271 usecs
calling  virtio_rng_driver_init+0x0/0x15 @ 1
initcall virtio_rng_driver_init+0x0/0x15 returned 0 after 52 usecs
calling  init_tis+0x0/0x14e @ 1
tpm_tis 00:0a: 1.2 TPM (device-id 0x1B, rev-id 16)
tpm tpm0: TPM is disabled/deactivated (0x7)
initcall init_tis+0x0/0x14e returned 0 after 35137 usecs
calling  crb_acpi_driver_init+0x0/0x15 @ 1
initcall crb_acpi_driver_init+0x0/0x15 returned 0 after 230 usecs
calling  cn_proc_init+0x0/0x3e @ 1
initcall cn_proc_init+0x0/0x3e returned 0 after 24 usecs
calling  topology_sysfs_init+0x0/0x30 @ 1
initcall topology_sysfs_init+0x0/0x30 returned 0 after 482 usecs
calling  cacheinfo_sysfs_init+0x0/0x30 @ 1
initcall cacheinfo_sysfs_init+0x0/0x30 returned 0 after 2213 usecs
calling  lkdtm_module_init+0x0/0x2a9 @ 1
lkdtm: No crash points registered, enable through debugfs
initcall lkdtm_module_init+0x0/0x2a9 returned 0 after 7615 usecs
calling  intel_lpss_init+0x0/0x21 @ 1
initcall intel_lpss_init+0x0/0x21 returned 0 after 35 usecs
calling  intel_lpss_pci_driver_init+0x0/0x1e @ 1
initcall intel_lpss_pci_driver_init+0x0/0x1e returned 0 after 93 usecs
calling  intel_lpss_acpi_driver_init+0x0/0x17 @ 1
initcall intel_lpss_acpi_driver_init+0x0/0x17 returned 0 after 74 usecs
calling  system_heap_create+0x0/0xc0 @ 1
initcall system_heap_create+0x0/0xc0 returned 0 after 627 usecs
calling  udmabuf_dev_init+0x0/0xab @ 1
initcall udmabuf_dev_init+0x0/0xab returned 0 after 368 usecs
calling  mac_hid_init+0x0/0x2d @ 1
initcall mac_hid_init+0x0/0x2d returned 0 after 19 usecs
calling  rdac_init+0x0/0x79 @ 1
rdac: device handler registered
initcall rdac_init+0x0/0x79 returned 0 after 5379 usecs
calling  hp_sw_init+0x0/0x15 @ 1
hp_sw: device handler registered
initcall hp_sw_init+0x0/0x15 returned 0 after 5071 usecs
calling  clariion_init+0x0/0x37 @ 1
emc: device handler registered
initcall clariion_init+0x0/0x37 returned 0 after 4927 usecs
calling  alua_init+0x0/0x68 @ 1
alua: device handler registered
initcall alua_init+0x0/0x68 returned 0 after 5448 usecs
calling  macsec_init+0x0/0x6e @ 1
MACsec IEEE 802.1AE
initcall macsec_init+0x0/0x6e returned 0 after 4021 usecs
calling  blackhole_netdev_init+0x0/0xcf @ 1
initcall blackhole_netdev_init+0x0/0xcf returned 0 after 28 usecs
calling  phylink_init+0x0/0xaf @ 1
initcall phylink_init+0x0/0xaf returned 0 after 0 usecs
calling  phy_module_init+0x0/0x1c @ 1
initcall phy_module_init+0x0/0x1c returned 0 after 153 usecs
calling  fixed_mdio_bus_init+0x0/0x245 @ 1
initcall fixed_mdio_bus_init+0x0/0x245 returned 0 after 1238 usecs
calling  phy_module_init+0x0/0x1c @ 1
initcall phy_module_init+0x0/0x1c returned 0 after 858 usecs
calling  vrf_init_module+0x0/0x8b @ 1
initcall vrf_init_module+0x0/0x8b returned 0 after 191 usecs
calling  cavium_ptp_driver_init+0x0/0x1e @ 1
initcall cavium_ptp_driver_init+0x0/0x1e returned 0 after 117 usecs
calling  e1000_init_module+0x0/0x7b @ 1
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
initcall e1000_init_module+0x0/0x7b returned 0 after 12471 usecs
calling  e1000_init_module+0x0/0x36 @ 1
e1000e: Intel(R) PRO/1000 Network Driver
e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-16 -> IRQ 16 Level:1 ActiveLow:1)
e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 3c:52:82:5d:1e:ba
e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: FFFFFF-0FF
initcall e1000_init_module+0x0/0x36 returned 0 after 221616 usecs
calling  igb_init_module+0x0/0x44 @ 1
igb: Intel(R) Gigabit Ethernet Network Driver
igb: Copyright (c) 2007-2014 Intel Corporation.
initcall igb_init_module+0x0/0x44 returned 0 after 12807 usecs
calling  igc_init_module+0x0/0x44 @ 1
Intel(R) 2.5G Ethernet Linux Driver
Copyright(c) 2018 Intel Corporation.
initcall igc_init_module+0x0/0x44 returned 0 after 10904 usecs
calling  ixgbe_init_module+0x0/0xad @ 1
ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver
ixgbe: Copyright (c) 1999-2016 Intel Corporation.
initcall ixgbe_init_module+0x0/0xad returned 0 after 14062 usecs
calling  i40e_init_module+0x0/0xb8 @ 1
i40e: Intel(R) Ethernet Connection XL710 Network Driver
i40e: Copyright (c) 2013 - 2019 Intel Corporation.
initcall i40e_init_module+0x0/0xb8 returned 0 after 14283 usecs
calling  rtl8169_pci_driver_init+0x0/0x1e @ 1
initcall rtl8169_pci_driver_init+0x0/0x1e returned 0 after 67 usecs
calling  rtl8152_driver_init+0x0/0x1e @ 1
usbcore: registered new interface driver r8152
initcall rtl8152_driver_init+0x0/0x1e returned 0 after 6475 usecs
calling  asix_driver_init+0x0/0x1e @ 1
usbcore: registered new interface driver asix
initcall asix_driver_init+0x0/0x1e returned 0 after 6310 usecs
calling  ax88179_178a_driver_init+0x0/0x1e @ 1
usbcore: registered new interface driver ax88179_178a
initcall ax88179_178a_driver_init+0x0/0x1e returned 0 after 7137 usecs
calling  usbnet_init+0x0/0x2f @ 1
initcall usbnet_init+0x0/0x2f returned 0 after 2 usecs
calling  usbport_trig_init+0x0/0x15 @ 1
initcall usbport_trig_init+0x0/0x15 returned 0 after 3 usecs
calling  mon_init+0x0/0x1af @ 1
initcall mon_init+0x0/0x1af returned 0 after 578 usecs
calling  ehci_hcd_init+0x0/0x1a0 @ 1
initcall ehci_hcd_init+0x0/0x1a0 returned 0 after 102 usecs
calling  ehci_pci_init+0x0/0x56 @ 1
initcall ehci_pci_init+0x0/0x56 returned 0 after 87 usecs
calling  ohci_hcd_mod_init+0x0/0xa9 @ 1
initcall ohci_hcd_mod_init+0x0/0xa9 returned 0 after 45 usecs
calling  ohci_pci_init+0x0/0x56 @ 1
initcall ohci_pci_init+0x0/0x56 returned 0 after 76 usecs
calling  uhci_hcd_init+0x0/0x12f @ 1
initcall uhci_hcd_init+0x0/0x12f returned 0 after 173 usecs
calling  xhci_hcd_init+0x0/0x28 @ 1
initcall xhci_hcd_init+0x0/0x28 returned 0 after 115 usecs
calling  xhci_pci_init+0x0/0x5d @ 1
initcall xhci_pci_init+0x0/0x5d returned 0 after 1782 usecs
xhci_hcd 0000:00:14.0: xHCI Host Controller
calling  ucsi_acpi_platform_driver_init+0x0/0x17 @ 1
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
initcall ucsi_acpi_platform_driver_init+0x0/0x17 returned 0 after 83 usecs
xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000001109810
calling  i8042_init+0x0/0x139 @ 1
xhci_hcd 0000:00:14.0: xHCI Host Controller
i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
serio: i8042 KBD port at 0x60,0x64 irq 1
xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
serio: i8042 AUX port at 0x60,0x64 irq 12
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.02
initcall i8042_init+0x0/0x139 returned 0 after 42785 usecs
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: xHCI Host Controller
usb usb1: Manufacturer: Linux 6.2.0-rc1-00035-gd0067447fa5b xhci-hcd
usb usb1: SerialNumber: 0000:00:14.0
hub 1-0:1.0: USB hub found
calling  serport_init+0x0/0x30 @ 1
initcall serport_init+0x0/0x30 returned 0 after 1 usecs
hub 1-0:1.0: 16 ports detected
calling  input_leds_init+0x0/0x15 @ 1
initcall input_leds_init+0x0/0x15 returned 0 after 51 usecs
calling  mousedev_init+0x0/0x63 @ 1
mousedev: PS/2 mouse device common for all mice
initcall mousedev_init+0x0/0x63 returned 0 after 6858 usecs
calling  evdev_init+0x0/0x15 @ 1
initcall evdev_init+0x0/0x15 returned 0 after 1104 usecs
calling  atkbd_init+0x0/0x2a @ 1
initcall atkbd_init+0x0/0x2a returned 0 after 100 usecs
calling  psmouse_init+0x0/0x8a @ 1
initcall psmouse_init+0x0/0x8a returned 0 after 242 usecs
calling  cmos_init+0x0/0x74 @ 1
rtc_cmos 00:03: RTC can wake from S4
rtc_cmos 00:03: registered as rtc0
rtc_cmos 00:03: setting system clock to 2023-01-06T05:25:22 UTC (1672982722)
rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram
initcall cmos_init+0x0/0x74 returned 0 after 30353 usecs
calling  thermal_throttle_init_device+0x0/0x53 @ 1
initcall thermal_throttle_init_device+0x0/0x53 returned 0 after 679 usecs
calling  esb_driver_init+0x0/0x1e @ 1
usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.02
initcall esb_driver_init+0x0/0x1e returned 0 after 179 usecs
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: xHCI Host Controller
calling  iTCO_wdt_driver_init+0x0/0x17 @ 1
usb usb2: Manufacturer: Linux 6.2.0-rc1-00035-gd0067447fa5b xhci-hcd
initcall iTCO_wdt_driver_init+0x0/0x17 returned 0 after 129 usecs
usb usb2: SerialNumber: 0000:00:14.0
hub 2-0:1.0: USB hub found
calling  iTCO_vendor_init_module+0x0/0x35 @ 1
hub 2-0:1.0: 10 ports detected
iTCO_vendor_support: vendor-support=0
initcall iTCO_vendor_init_module+0x0/0x35 returned 0 after 3 usecs
calling  ghes_edac_init+0x0/0xf4 @ 1
initcall ghes_edac_init+0x0/0xf4 returned -19 after 1 usecs
calling  intel_pstate_init+0x0/0x4bc @ 1
intel_pstate: HWP enabled by BIOS
intel_pstate: Intel P-state driver initializing
intel_pstate: HWP enabled
initcall intel_pstate_init+0x0/0x4bc returned 0 after 17563 usecs
calling  haltpoll_init+0x0/0xf3 @ 1
initcall haltpoll_init+0x0/0xf3 returned -19 after 0 usecs
calling  dmi_sysfs_init+0x0/0x14c @ 1
initcall dmi_sysfs_init+0x0/0x14c returned 0 after 4728 usecs
calling  fw_cfg_sysfs_init+0x0/0x8a @ 1
initcall fw_cfg_sysfs_init+0x0/0x8a returned 0 after 137 usecs
calling  sysfb_init+0x0/0x124 @ 1
initcall sysfb_init+0x0/0x124 returned 0 after 268 usecs
calling  esrt_sysfs_init+0x0/0x446 @ 1
initcall esrt_sysfs_init+0x0/0x446 returned -38 after 0 usecs
calling  efivars_pstore_init+0x0/0x9d @ 1
initcall efivars_pstore_init+0x0/0x9d returned 0 after 0 usecs
calling  hid_init+0x0/0x66 @ 1
hid: raw HID events driver (C) Jiri Kosina
initcall hid_init+0x0/0x66 returned 0 after 6352 usecs
calling  hid_generic_init+0x0/0x1e @ 1
initcall hid_generic_init+0x0/0x1e returned 0 after 69 usecs
calling  magicmouse_driver_init+0x0/0x1e @ 1
initcall magicmouse_driver_init+0x0/0x1e returned 0 after 50 usecs
calling  sensor_hub_driver_init+0x0/0x1e @ 1
initcall sensor_hub_driver_init+0x0/0x1e returned 0 after 54 usecs
calling  hid_init+0x0/0x62 @ 1
usb 1-5: new low-speed USB device number 2 using xhci_hcd
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
initcall hid_init+0x0/0x62 returned 0 after 18456 usecs
calling  pmc_atom_init+0x0/0x73 @ 1
initcall pmc_atom_init+0x0/0x73 returned -19 after 27 usecs
calling  vmgenid_driver_init+0x0/0x15 @ 1
initcall vmgenid_driver_init+0x0/0x15 returned 0 after 196 usecs
calling  sock_diag_init+0x0/0x33 @ 1
initcall sock_diag_init+0x0/0x33 returned 0 after 74 usecs
calling  init_net_drop_monitor+0x0/0x1cc @ 1
drop_monitor: Initializing network drop monitor service
initcall init_net_drop_monitor+0x0/0x1cc returned 0 after 7276 usecs
calling  llc_init+0x0/0x24 @ 1
initcall llc_init+0x0/0x24 returned 0 after 1 usecs
calling  snap_init+0x0/0x3f @ 1
initcall snap_init+0x0/0x3f returned 0 after 36 usecs
calling  blackhole_init+0x0/0x15 @ 1
initcall blackhole_init+0x0/0x15 returned 0 after 1 usecs
calling  ingress_module_init+0x0/0x43 @ 1
initcall ingress_module_init+0x0/0x43 returned 0 after 1 usecs
calling  netem_module_init+0x0/0x21 @ 1
netem: version 1.3
initcall netem_module_init+0x0/0x21 returned 0 after 3851 usecs
calling  fq_codel_module_init+0x0/0x15 @ 1
initcall fq_codel_module_init+0x0/0x15 returned 0 after 1 usecs
calling  init_cgroup_cls+0x0/0x15 @ 1
initcall init_cgroup_cls+0x0/0x15 returned 0 after 35 usecs
calling  xt_init+0x0/0x2df @ 1
initcall xt_init+0x0/0x2df returned 0 after 115 usecs
calling  tcpudp_mt_init+0x0/0x1a @ 1
initcall tcpudp_mt_init+0x0/0x1a returned 0 after 138 usecs
calling  gre_offload_init+0x0/0x52 @ 1
initcall gre_offload_init+0x0/0x52 returned 0 after 0 usecs
calling  bpfilter_sockopt_init+0x0/0x3c @ 1
usb 1-5: New USB device found, idVendor=03f0, idProduct=0024, bcdDevice= 1.30
initcall bpfilter_sockopt_init+0x0/0x3c returned 0 after 0 usecs
calling  sysctl_ipv4_init+0x0/0x50 @ 1
initcall sysctl_ipv4_init+0x0/0x50 returned 0 after 123 usecs
usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
calling  ipip_init+0x0/0xcf @ 1
usb 1-5: Product: HP Basic USB Keyboard
ipip: IPv4 and MPLS over IPv4 tunneling driver
initcall ipip_init+0x0/0xcf returned 0 after 1147 usecs
usb 1-5: Manufacturer: CHICONY
input: CHICONY HP Basic USB Keyboard as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/0003:03F0:0024.0001/input/input6
calling  fou_init+0x0/0xb0 @ 1
initcall fou_init+0x0/0xb0 returned 0 after 120 usecs
calling  gre_init+0x0/0x42 @ 1
gre: GRE over IPv4 demultiplexor driver
initcall gre_init+0x0/0x42 returned 0 after 5696 usecs
calling  ipgre_init+0x0/0x114 @ 1
ip_gre: GRE over IPv4 tunneling driver
hid-generic 0003:03F0:0024.0001: input,hidraw0: USB HID v1.11 Keyboard [CHICONY HP Basic USB Keyboard] on usb-0000:00:14.0-5/input0
initcall ipgre_init+0x0/0x114 returned 0 after 8926 usecs
calling  tunnel4_init+0x0/0xdf @ 1
initcall tunnel4_init+0x0/0xdf returned 0 after 2 usecs
calling  cubictcp_register+0x0/0x72 @ 1
initcall cubictcp_register+0x0/0x72 returned 0 after 20141 usecs
calling  xfrm_user_init+0x0/0x34 @ 1
Initializing XFRM netlink socket
initcall xfrm_user_init+0x0/0x34 returned 0 after 5160 usecs
calling  inet6_init+0x0/0x4a8 @ 1
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
initcall inet6_init+0x0/0x4a8 returned 0 after 19290 usecs
calling  tunnel6_init+0x0/0x122 @ 1
initcall tunnel6_init+0x0/0x122 returned 0 after 1 usecs
calling  ip6_tunnel_init+0x0/0x11c @ 1
initcall ip6_tunnel_init+0x0/0x11c returned 0 after 1338 usecs
calling  ip6gre_init+0x0/0xcf @ 1
ip6_gre: GRE over IPv6 tunneling driver
initcall ip6gre_init+0x0/0xcf returned 0 after 6855 usecs
calling  fou6_init+0x0/0x71 @ 1
initcall fou6_init+0x0/0x71 returned 0 after 0 usecs
calling  packet_init+0x0/0x83 @ 1
NET: Registered PF_PACKET protocol family
initcall packet_init+0x0/0x83 returned 0 after 6065 usecs
calling  strp_dev_init+0x0/0x37 @ 1
initcall strp_dev_init+0x0/0x37 returned 0 after 407 usecs
calling  vlan_proto_init+0x0/0xaa @ 1
8021q: 802.1Q VLAN Support v1.8
initcall vlan_proto_init+0x0/0xaa returned 0 after 5118 usecs
calling  init_p9+0x0/0x2e @ 1
9pnet: Installing 9P2000 support
initcall init_p9+0x0/0x2e returned 0 after 5134 usecs
calling  p9_trans_fd_init+0x0/0x30 @ 1
initcall p9_trans_fd_init+0x0/0x30 returned 0 after 26 usecs
calling  p9_virtio_init+0x0/0x52 @ 1
initcall p9_virtio_init+0x0/0x52 returned 0 after 124 usecs
calling  dcbnl_init+0x0/0x54 @ 1
initcall dcbnl_init+0x0/0x54 returned 0 after 15 usecs
calling  nsh_init_module+0x0/0x18 @ 1
initcall nsh_init_module+0x0/0x18 returned 0 after 1 usecs
calling  xsk_diag_init+0x0/0x15 @ 1
initcall xsk_diag_init+0x0/0x15 returned 0 after 33 usecs
calling  pm_check_save_msr+0x0/0x70 @ 1
initcall pm_check_save_msr+0x0/0x70 returned 0 after 25 usecs
calling  plist_test+0x0/0x335 @ 1
start plist test
end plist test
initcall plist_test+0x0/0x335 returned 0 after 8225 usecs
calling  mcheck_init_device+0x0/0x20c @ 1
initcall mcheck_init_device+0x0/0x20c returned 0 after 1865 usecs
calling  dev_mcelog_init_device+0x0/0x160 @ 1
initcall dev_mcelog_init_device+0x0/0x160 returned 0 after 360 usecs
calling  kernel_do_mounts_initrd_sysctls_init+0x0/0x26 @ 1
initcall kernel_do_mounts_initrd_sysctls_init+0x0/0x26 returned 0 after 10 usecs
calling  tboot_late_init+0x0/0x22f @ 1
initcall tboot_late_init+0x0/0x22f returned 0 after 0 usecs
calling  sld_mitigate_sysctl_init+0x0/0x26 @ 1
initcall sld_mitigate_sysctl_init+0x0/0x26 returned 0 after 8 usecs
calling  mcheck_late_init+0x0/0x41 @ 1
initcall mcheck_late_init+0x0/0x41 returned 0 after 110 usecs
calling  severities_debugfs_init+0x0/0x2e @ 1
initcall severities_debugfs_init+0x0/0x2e returned 0 after 21 usecs
calling  microcode_init+0x0/0x246 @ 1
microcode: Microcode Update Driver: v2.2.
initcall microcode_init+0x0/0x246 returned 0 after 635 usecs
calling  resctrl_late_init+0x0/0x6e0 @ 1
initcall resctrl_late_init+0x0/0x6e0 returned -19 after 1 usecs
calling  hpet_insert_resource+0x0/0x27 @ 1
initcall hpet_insert_resource+0x0/0x27 returned 0 after 2 usecs
calling  start_sync_check_timer+0x0/0xb7 @ 1
initcall start_sync_check_timer+0x0/0xb7 returned 0 after 1 usecs
calling  update_mp_table+0x0/0x575 @ 1
initcall update_mp_table+0x0/0x575 returned 0 after 0 usecs
calling  lapic_insert_resource+0x0/0x47 @ 1
initcall lapic_insert_resource+0x0/0x47 returned 0 after 2 usecs
calling  print_ipi_mode+0x0/0x31 @ 1
IPI shorthand broadcast: enabled
initcall print_ipi_mode+0x0/0x31 returned 0 after 5071 usecs
calling  print_ICs+0x0/0x1d7 @ 1
... APIC ID:      00000000 (0)
... APIC VERSION: 01060015
0000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000001000

number of MP IRQ sources: 15.
number of IO-APIC #2 registers: 120.
testing the IO APIC.......................
IO APIC #2......
.... register #00: 02000000
.......    : physical APIC id: 02
.......    : Delivery Type: 0
.......    : LTS          : 0
.... register #01: 00770020
.......     : max redirection entries: 77
.......     : PRQ implemented: 0
.......     : IO APIC version: 20
.... register #02: 00000000
.......     : arbitration: 00
.... IRQ redirection table:
IOAPIC 0:
pin00, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin01, enabled , edge , high, V(01), IRR(0), S(0), remapped, I(0000),  Z(0)
pin02, enabled , edge , high, V(02), IRR(0), S(0), remapped, I(0001),  Z(0)
pin03, disabled, edge , high, V(60), IRR(0), S(0), physical, D(0023), M(2)
pin04, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin05, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin06, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin07, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin08, enabled , edge , high, V(08), IRR(0), S(0), remapped, I(0007),  Z(0)
pin09, enabled , level, high, V(09), IRR(0), S(0), remapped, I(0008),  Z(0)
pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin0b, disabled, edge , high, V(2B), IRR(0), S(0), physical, D(0050), M(2)
pin0c, enabled , edge , high, V(0C), IRR(0), S(0), remapped, I(000B),  Z(0)
pin0d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin0e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin0f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin10, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin11, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0418), M(2)
pin12, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin13, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin14, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin15, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin16, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin17, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin18, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin19, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin1a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin1b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin1c, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin1d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin1e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin1f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin20, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin21, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin22, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin23, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin24, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin25, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin26, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin27, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin28, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin29, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2c, disabled, edge , high, V(02), IRR(0), S(0), physical, D(2083), M(2)
pin2d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin30, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin31, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin32, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin33, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin34, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin35, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin36, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin37, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin38, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin39, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin3a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin3b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin3c, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin3d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin3e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin3f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin40, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin41, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin42, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin43, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin44, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin45, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin46, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin47, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin48, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin49, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin4a, disabled, edge , high, V(08), IRR(0), S(0), physical, D(0900), M(2)
pin4b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin4c, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin4d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin4e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin4f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin50, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin51, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin52, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin53, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin54, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin55, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin56, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin57, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin58, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin59, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin5a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin5b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin5c, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin5d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin5e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin5f, disabled, edge , high, V(40), IRR(0), S(0), physical, D(1508), M(2)
pin60, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin61, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin62, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin63, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin64, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin65, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin66, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin67, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin68, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin69, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin6a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin6b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin6c, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin6d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin6e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin6f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin70, disabled, edge , high, V(00), IRR(0), S(0), remapped, I(0011),  Z(2)
pin71, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin72, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin73, disabled, edge , high, V(00), IRR(0), S(0), physical, D(00C2), M(2)
pin74, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin75, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin76, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin77, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
IRQ to pin mappings:
IRQ0 -> 0:2
IRQ1 -> 0:1
IRQ3 -> 0:3
IRQ4 -> 0:4
IRQ5 -> 0:5
IRQ6 -> 0:6
IRQ7 -> 0:7
IRQ8 -> 0:8
IRQ9 -> 0:9
IRQ10 -> 0:10
IRQ11 -> 0:11
IRQ12 -> 0:12
IRQ13 -> 0:13
IRQ14 -> 0:14
IRQ15 -> 0:15
IRQ16 -> 0:16
IRQ19 -> 0:19
.................................... done.
initcall print_ICs+0x0/0x1d7 returned 0 after 1249752 usecs
calling  setup_efi_kvm_sev_migration+0x0/0x28c @ 1
initcall setup_efi_kvm_sev_migration+0x0/0x28c returned 0 after 0 usecs
calling  create_tlb_single_page_flush_ceiling+0x0/0x53 @ 1
initcall create_tlb_single_page_flush_ceiling+0x0/0x53 returned 0 after 83 usecs
calling  pat_memtype_list_init+0x0/0x5c @ 1
initcall pat_memtype_list_init+0x0/0x5c returned 0 after 23 usecs
calling  create_init_pkru_value+0x0/0x58 @ 1
initcall create_init_pkru_value+0x0/0x58 returned 0 after 0 usecs
calling  aesni_init+0x0/0x223 @ 1
AVX2 version of gcm_enc/dec engaged.
AES CTR mode by8 optimization enabled
initcall aesni_init+0x0/0x223 returned 0 after 11505 usecs
calling  kernel_panic_sysctls_init+0x0/0x26 @ 1
initcall kernel_panic_sysctls_init+0x0/0x26 returned 0 after 74 usecs
calling  kernel_panic_sysfs_init+0x0/0x47 @ 1
initcall kernel_panic_sysfs_init+0x0/0x47 returned 0 after 83 usecs
calling  kernel_exit_sysctls_init+0x0/0x26 @ 1
initcall kernel_exit_sysctls_init+0x0/0x26 returned 0 after 9 usecs
calling  kernel_exit_sysfs_init+0x0/0x47 @ 1
initcall kernel_exit_sysfs_init+0x0/0x47 returned 0 after 10 usecs
calling  param_sysfs_builtin_init+0x0/0x96 @ 1
initcall param_sysfs_builtin_init+0x0/0x96 returned 0 after 27337 usecs
calling  reboot_ksysfs_init+0x0/0x94 @ 1
initcall reboot_ksysfs_init+0x0/0x94 returned 0 after 68 usecs
calling  sched_core_sysctl_init+0x0/0x2b @ 1
initcall sched_core_sysctl_init+0x0/0x2b returned 0 after 10 usecs
calling  sched_fair_sysctl_init+0x0/0x26 @ 1
initcall sched_fair_sysctl_init+0x0/0x26 returned 0 after 9 usecs
calling  sched_rt_sysctl_init+0x0/0x26 @ 1
initcall sched_rt_sysctl_init+0x0/0x26 returned 0 after 93 usecs
calling  sched_dl_sysctl_init+0x0/0x26 @ 1
initcall sched_dl_sysctl_init+0x0/0x26 returned 0 after 8 usecs
calling  sched_clock_init_late+0x0/0x138 @ 1
sched_clock: Marking stable (12475134557, 1148137863)->(18344344328, -4721071908)
initcall sched_clock_init_late+0x0/0x138 returned 0 after 9632 usecs
calling  sched_init_debug+0x0/0x257 @ 1
initcall sched_init_debug+0x0/0x257 returned 0 after 1445 usecs
calling  kernel_lockdep_sysctls_init+0x0/0x21 @ 1
initcall kernel_lockdep_sysctls_init+0x0/0x21 returned 0 after 9 usecs
calling  cpu_latency_qos_init+0x0/0x3e @ 1
initcall cpu_latency_qos_init+0x0/0x3e returned 0 after 433 usecs
calling  pm_debugfs_init+0x0/0x28 @ 1
initcall pm_debugfs_init+0x0/0x28 returned 0 after 27 usecs
calling  printk_late_init+0x0/0x226 @ 1
initcall printk_late_init+0x0/0x226 returned 0 after 20 usecs
calling  rcu_verify_early_boot_tests+0x0/0x70 @ 1
initcall rcu_verify_early_boot_tests+0x0/0x70 returned 0 after 0 usecs
calling  rcu_tasks_verify_schedule_work+0x0/0x90 @ 1
initcall rcu_tasks_verify_schedule_work+0x0/0x90 returned 0 after 1 usecs
calling  init_srcu_module_notifier+0x0/0x30 @ 1
initcall init_srcu_module_notifier+0x0/0x30 returned 0 after 2 usecs
calling  swiotlb_create_default_debugfs+0x0/0x6c @ 1
initcall swiotlb_create_default_debugfs+0x0/0x6c returned 0 after 70 usecs
calling  tk_debug_sleep_time_init+0x0/0x28 @ 1
initcall tk_debug_sleep_time_init+0x0/0x28 returned 0 after 23 usecs
calling  bpf_ksym_iter_register+0x0/0x55 @ 1
initcall bpf_ksym_iter_register+0x0/0x55 returned 0 after 7 usecs
calling  kernel_acct_sysctls_init+0x0/0x26 @ 1
initcall kernel_acct_sysctls_init+0x0/0x26 returned 0 after 9 usecs
calling  kexec_core_sysctl_init+0x0/0x26 @ 1
initcall kexec_core_sysctl_init+0x0/0x26 returned 0 after 7 usecs
calling  bpf_rstat_kfunc_init+0x0/0x1a @ 1
initcall bpf_rstat_kfunc_init+0x0/0x1a returned 0 after 19 usecs
calling  debugfs_kprobe_init+0x0/0x78 @ 1
initcall debugfs_kprobe_init+0x0/0x78 returned 0 after 80 usecs
calling  fei_debugfs_init+0x0/0x68 @ 1
initcall fei_debugfs_init+0x0/0x68 returned 0 after 235 usecs
calling  kernel_delayacct_sysctls_init+0x0/0x26 @ 1
initcall kernel_delayacct_sysctls_init+0x0/0x26 returned 0 after 8 usecs
calling  taskstats_init+0x0/0x3f @ 1
registered taskstats version 1
initcall taskstats_init+0x0/0x3f returned 0 after 4941 usecs
calling  ftrace_sysctl_init+0x0/0x21 @ 1
initcall ftrace_sysctl_init+0x0/0x21 returned 0 after 10 usecs
calling  init_hwlat_tracer+0x0/0x116 @ 1
initcall init_hwlat_tracer+0x0/0x116 returned 0 after 744 usecs
calling  bpf_key_sig_kfuncs_init+0x0/0x15 @ 1
initcall bpf_key_sig_kfuncs_init+0x0/0x15 returned 0 after 10 usecs
calling  bpf_global_ma_init+0x0/0x23 @ 1
initcall bpf_global_ma_init+0x0/0x23 returned 0 after 283 usecs
calling  bpf_syscall_sysctl_init+0x0/0x26 @ 1
initcall bpf_syscall_sysctl_init+0x0/0x26 returned 0 after 10 usecs
calling  kfunc_init+0x0/0x1d4 @ 1
initcall kfunc_init+0x0/0x1d4 returned 0 after 34 usecs
calling  bpf_map_iter_init+0x0/0x66 @ 1
initcall bpf_map_iter_init+0x0/0x66 returned 0 after 21 usecs
calling  task_iter_init+0x0/0x2d4 @ 1
initcall task_iter_init+0x0/0x2d4 returned 0 after 11 usecs
calling  bpf_prog_iter_init+0x0/0x55 @ 1
initcall bpf_prog_iter_init+0x0/0x55 returned 0 after 4 usecs
calling  bpf_link_iter_init+0x0/0x55 @ 1
initcall bpf_link_iter_init+0x0/0x55 returned 0 after 6 usecs
calling  init_trampolines+0x0/0x6a @ 1
initcall init_trampolines+0x0/0x6a returned 0 after 2 usecs
calling  bpf_cgroup_iter_init+0x0/0x55 @ 1
initcall bpf_cgroup_iter_init+0x0/0x55 returned 0 after 6 usecs
calling  load+0x0/0x4e @ 1
initcall load+0x0/0x4e returned 0 after 23265 usecs
calling  load_system_certificate_list+0x0/0x55 @ 1
Loading compiled-in X.509 certificates
Loaded X.509 cert 'Build time autogenerated kernel key: 01eaecf4fcff8f5f3ff5c420343aafb6c4eec026'
initcall load_system_certificate_list+0x0/0x55 returned 0 after 17970 usecs
calling  fault_around_debugfs+0x0/0x28 @ 1
initcall fault_around_debugfs+0x0/0x28 returned 0 after 28 usecs
calling  max_swapfiles_check+0x0/0xc @ 1
initcall max_swapfiles_check+0x0/0xc returned 0 after 0 usecs
calling  init_zswap+0x0/0x3ad @ 1
zswap: loaded using pool lzo/zbud
initcall init_zswap+0x0/0x3ad returned 0 after 6664 usecs
calling  hugetlb_vmemmap_init+0x0/0x130 @ 1
initcall hugetlb_vmemmap_init+0x0/0x130 returned 0 after 10 usecs
calling  slab_sysfs_init+0x0/0xf4 @ 1
initcall slab_sysfs_init+0x0/0xf4 returned 0 after 42487 usecs
calling  kasan_cpu_quarantine_init+0x0/0x48 @ 1
initcall kasan_cpu_quarantine_init+0x0/0x48 returned 219 after 543 usecs
calling  split_huge_pages_debugfs+0x0/0x28 @ 1
initcall split_huge_pages_debugfs+0x0/0x28 returned 0 after 35 usecs
calling  gup_test_init+0x0/0x28 @ 1
initcall gup_test_init+0x0/0x28 returned 0 after 21 usecs
calling  pageowner_init+0x0/0x38 @ 1
page_owner is disabled
initcall pageowner_init+0x0/0x38 returned 0 after 4239 usecs
calling  check_early_ioremap_leak+0x0/0x89 @ 1
initcall check_early_ioremap_leak+0x0/0x89 returned 0 after 0 usecs
calling  set_hardened_usercopy+0x0/0x24 @ 1
initcall set_hardened_usercopy+0x0/0x24 returned 1 after 0 usecs
calling  fscrypt_init+0x0/0xbc @ 1
Key type .fscrypt registered
Key type fscrypt-provisioning registered
initcall fscrypt_init+0x0/0xbc returned 0 after 11337 usecs
calling  pstore_init+0x0/0x81 @ 1
initcall pstore_init+0x0/0x81 returned 0 after 13 usecs
calling  init_root_keyring+0x0/0x12 @ 1
initcall init_root_keyring+0x0/0x12 returned 0 after 317 usecs
calling  init_trusted+0x0/0x256 @ 1
Freeing initrd memory: 1041200K
Key type trusted registered
initcall init_trusted+0x0/0x256 returned 0 after 25114998 usecs
calling  init_encrypted+0x0/0x151 @ 1
Key type encrypted registered
initcall init_encrypted+0x0/0x151 returned 0 after 32441 usecs
calling  integrity_fs_init+0x0/0x52 @ 1
initcall integrity_fs_init+0x0/0x52 returned 0 after 98 usecs
calling  init_ima+0x0/0x115 @ 1
ima: Allocated hash algorithm: sha1
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: Error Communicating to TPM chip
ima: No architecture policies found
initcall init_ima+0x0/0x115 returned 0 after 78072 usecs
calling  crypto_algapi_init+0x0/0x11 @ 1
initcall crypto_algapi_init+0x0/0x11 returned 0 after 9 usecs
calling  blk_timeout_init+0x0/0x17 @ 1
initcall blk_timeout_init+0x0/0x17 returned 0 after 0 usecs
calling  init_error_injection+0x0/0x6e @ 1
initcall init_error_injection+0x0/0x6e returned 0 after 2687 usecs
calling  pci_resource_alignment_sysfs_init+0x0/0x1c @ 1
initcall pci_resource_alignment_sysfs_init+0x0/0x1c returned 0 after 11 usecs
calling  pci_sysfs_init+0x0/0x72 @ 1
initcall pci_sysfs_init+0x0/0x72 returned 0 after 291 usecs
calling  bert_init+0x0/0x653 @ 1
initcall bert_init+0x0/0x653 returned 0 after 3 usecs
calling  clk_debug_init+0x0/0x13b @ 1
initcall clk_debug_init+0x0/0x13b returned 0 after 108 usecs
calling  dmar_free_unused_resources+0x0/0x194 @ 1
initcall dmar_free_unused_resources+0x0/0x194 returned 0 after 0 usecs
calling  sync_state_resume_initcall+0x0/0x20 @ 1
initcall sync_state_resume_initcall+0x0/0x20 returned 0 after 1 usecs
calling  deferred_probe_initcall+0x0/0xd0 @ 1
initcall deferred_probe_initcall+0x0/0xd0 returned 0 after 320 usecs
calling  sync_debugfs_init+0x0/0x5f @ 1
initcall sync_debugfs_init+0x0/0x5f returned 0 after 87 usecs
calling  vxlan_init_module+0x0/0x9b @ 1
initcall vxlan_init_module+0x0/0x9b returned 0 after 82 usecs
calling  geneve_init_module+0x0/0x62 @ 1
initcall geneve_init_module+0x0/0x62 returned 0 after 16 usecs
calling  firmware_memmap_init+0x0/0x5e @ 1
initcall firmware_memmap_init+0x0/0x5e returned 0 after 590 usecs
calling  register_update_efi_random_seed+0x0/0x22 @ 1
initcall register_update_efi_random_seed+0x0/0x22 returned 0 after 12 usecs
calling  efi_shutdown_init+0x0/0x78 @ 1
initcall efi_shutdown_init+0x0/0x78 returned -19 after 0 usecs
calling  efi_earlycon_unmap_fb+0x0/0x65 @ 1
initcall efi_earlycon_unmap_fb+0x0/0x65 returned 0 after 0 usecs
calling  itmt_legacy_init+0x0/0x4d @ 1
initcall itmt_legacy_init+0x0/0x4d returned -19 after 0 usecs
calling  bpf_sockmap_iter_init+0x0/0x55 @ 1
initcall bpf_sockmap_iter_init+0x0/0x55 returned 0 after 4 usecs
calling  bpf_sk_storage_map_iter_init+0x0/0x55 @ 1
initcall bpf_sk_storage_map_iter_init+0x0/0x55 returned 0 after 3 usecs
calling  sch_default_qdisc+0x0/0x15 @ 1
initcall sch_default_qdisc+0x0/0x15 returned 0 after 2 usecs
calling  bpf_prog_test_run_init+0x0/0x1d2 @ 1
initcall bpf_prog_test_run_init+0x0/0x1d2 returned 0 after 48 usecs
calling  tcp_congestion_default+0x0/0x1c @ 1
initcall tcp_congestion_default+0x0/0x1c returned 0 after 1 usecs
calling  udp_tunnel_nic_init_module+0x0/0xd2 @ 1
initcall udp_tunnel_nic_init_module+0x0/0xd2 returned 0 after 66 usecs
calling  ip_auto_config+0x0/0x816 @ 1
IP-Config: Failed to open gretap0
IP-Config: Failed to open erspan0
Sending DHCP requests .
e1000e 0000:00:1f.6 eth0: NIC Link is Up 100 Mbps Full Duplex, Flow Control: Rx/Tx
e1000e 0000:00:1f.6 eth0: 10/100 speed: disabling TSO
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
., OK
IP-Config: Got DHCP answer from 192.168.3.1, my address is 192.168.3.101
IP-Config: Complete:
device=eth0, hwaddr=3c:52:82:5d:1e:ba, ipaddr=192.168.3.101, mask=255.255.255.0, gw=192.168.3.200
host=lkp-skl-d06, domain=lkp.intel.com, nis-domain=(none)
bootserver=192.168.3.200, rootserver=192.168.3.200, rootpath=
nameserver0=192.168.3.200
initcall ip_auto_config+0x0/0x816 returned 0 after 2882247 usecs
calling  tcp_bpf_v4_build_proto+0x0/0xef @ 1
initcall tcp_bpf_v4_build_proto+0x0/0xef returned 0 after 0 usecs
calling  udp_bpf_v4_build_proto+0x0/0x9d @ 1
initcall udp_bpf_v4_build_proto+0x0/0x9d returned 0 after 0 usecs
calling  bpf_tcp_ca_kfunc_init+0x0/0x1a @ 1
initcall bpf_tcp_ca_kfunc_init+0x0/0x1a returned 0 after 11 usecs
calling  pci_mmcfg_late_insert_resources+0x0/0xb9 @ 1
initcall pci_mmcfg_late_insert_resources+0x0/0xb9 returned 0 after 2 usecs
calling  software_resume+0x0/0x40 @ 1
initcall software_resume+0x0/0x40 returned -2 after 21 usecs
calling  ftrace_check_sync+0x0/0x18 @ 1
initcall ftrace_check_sync+0x0/0x18 returned 0 after 78 usecs
calling  latency_fsnotify_init+0x0/0x3c @ 1
initcall latency_fsnotify_init+0x0/0x3c returned 0 after 581 usecs
calling  trace_eval_sync+0x0/0x18 @ 1
initcall trace_eval_sync+0x0/0x18 returned 0 after 127 usecs
calling  late_trace_init+0x0/0xa0 @ 1
initcall late_trace_init+0x0/0xa0 returned 0 after 0 usecs
calling  acpi_gpio_handle_deferred_request_irqs+0x0/0xb9 @ 1
initcall acpi_gpio_handle_deferred_request_irqs+0x0/0xb9 returned 0 after 377 usecs
calling  fb_logo_late_init+0x0/0x13 @ 1
initcall fb_logo_late_init+0x0/0x13 returned 0 after 0 usecs
calling  clk_disable_unused+0x0/0x190 @ 1
initcall clk_disable_unused+0x0/0x190 returned 0 after 17 usecs
Freeing unused kernel image (initmem) memory: 3148K
Write protecting the kernel read-only data: 61440k
Freeing unused kernel image (rodata/data gap) memory: 1512K
Run /init as init process
with arguments:
/init
nokaslr
with environment:
HOME=/
TERM=linux
RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b
branch=peterz-queue/sched/idle
job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-kselftests
commit=d0067447fa5bdd65ec4f7a5737581362641f7611
max_uptime=1200
LKP_SERVER=internal-lkp-server
selinux=0
softlockup_panic=1
prompt_ramdisk=0
vga=normal
systemd[1]: RTC configured in localtime, applying delta of 0 minutes to system time.
calling  ip_tables_init+0x0/0x1000 [ip_tables] @ 1
initcall ip_tables_init+0x0/0x1000 [ip_tables] returned 0 after 47 usecs


Start[   43.935187][  T113] calling  fuse_init+0x0/0x16c [fuse] @ 113
0m.
calling  init_misc_binfmt+0x0/0x1000 [binfmt_misc] @ 132
initcall init_misc_binfmt+0x0/0x1000 [binfmt_misc] returned 0 after 6 usecs
.
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
calling  acpi_pad_init+0x0/0x1000 [acpi_pad] @ 191
calling  tpm_inf_pnp_driver_init+0x0/0x1000 [tpm_infineon] @ 134
initcall tpm_inf_pnp_driver_init+0x0/0x1000 [tpm_infineon] returned 0 after 116 usecs
initcall acpi_pad_init+0x0/0x1000 [acpi_pad] returned 0 after 998 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 200
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
OpenIPMI Driver [   45.542974][  T133] calling  acpi_wmi_init+0x0/0x1000 [wmi] @ 133
intel_pmc_core INT33A1:00:  initialized
acpi PNP0C14:02: duplicate WMI GUID 2B814318-4BE8-4707-9D84-A190A859B5D0 (first instance was on PNP0C14:00)
acpi PNP0C14:02: duplicate WMI GUID 41227C2D-80E1-423F-8B8E-87E32755A0EB (first instance was on PNP0C14:00)
initcall pmc_core_driver_init+0x0/0x1000 [intel_pmc_core] returned 0 after 41426 usecs
wmi_bus wmi_bus-PNP0C14:02: WQZZ data block query control method not found
initcall acpi_wmi_init+0x0/0x1000 [wmi] returned 0 after 70282 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 152
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
Startin[   45.654705][  T133] calling  acpi_video_init+0x0/0x1000 [video] @ 133
calling  agp_init+0x0/0x1000 [agpgart] @ 192
Linux agpgart interface v0.103
initcall agp_init+0x0/0x1000 [agpgart] returned 0 after 4 usecs
calling  ie31200_init+0x0/0x1000 [ie31200_edac] @ 172
etadata Check Sn[   45.746549][  T172] EDAC MC0: Giving out device to module ie31200_edac controller IE31200: DEV 0000:00:00.0 (POLLED)
initcall ie31200_init+0x0/0x1000 [ie31200_edac] returned 0 after 37403 usecs
calling  serio_raw_drv_init+0x0/0x1000 [serio_raw] @ 151
calling  intel_pch_thermal_driver_init+0x0/0x1000 [intel_pch_thermal] @ 193
initcall serio_raw_drv_init+0x0/0x1000 [serio_raw] returned 0 after 4098 usecs
IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000100 SID:F0F8 SQ:0 SVT:1)
IOAPIC[0]: Preconfigured routing entry (2-18 -> IRQ 18 Level:1 ActiveLow:1)
calling  smbalert_driver_init+0x0/0x1000 [i2c_smbus] @ 152
initcall intel_pch_thermal_driver_init+0x0/0x1000 [intel_pch_thermal] returned 0 after 42273 usecs
calling  mei_init+0x0/0xb7 [mei] @ 159
initcall mei_init+0x0/0xb7 [mei] returned 0 after 501 usecs
calling  intel_uncore_init+0x0/0x390 [intel_uncore] @ 148
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 196
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
initcall smbalert_driver_init+0x0/0x1000 [i2c_smbus] returned 0 after 7993 usecs
calling  ipmi_init_msghandler_mod+0x0/0x1000 [ipmi_msghandler] @ 219
IPMI message handler: version 39.2
initcall ipmi_init_msghandler_mod+0x0/0x1000 [ipmi_msghandler] returned 0 after 573 usecs
initcall intel_uncore_init+0x0/0x390 [intel_uncore] returned 0 after 12332 usecs
calling  i2c_i801_init+0x0/0x1000 [i2c_i801] @ 152
i801_smbus 0000:00:1f.4: SPD Write Disable is set
i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
pci 0000:00:1f.1: [8086:a120] type 00 class 0x058000
pci 0000:00:1f.1: reg 0x10: [mem 0xfd000000-0xfdffffff 64bit]
pci 0000:00:1f.1: calling  quirk_igfx_skip_te_disable+0x0/0x120 @ 37
pci 0000:00:1f.1: quirk_igfx_skip_te_disable+0x0/0x120 took 0 usecs
calling  mei_me_driver_init+0x0/0x1000 [mei_me] @ 159
initcall mei_me_driver_init+0x0/0x1000 [mei_me] returned 0 after 236 usecs
initcall i2c_i801_init+0x0/0x1000 [i2c_i801] returned 0 after 22414 usecs
iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
calling  cstate_pmu_init+0x0/0x1000 [intel_cstate] @ 149
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 181
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
calling  init_ipmi_devintf+0x0/0x1000 [ipmi_devintf] @ 219
ipmi device interface
initcall init_ipmi_devintf+0x0/0x1000 [ipmi_devintf] returned 0 after 882 usecs
calling  ata_init+0x0/0x8a [libata] @ 162
iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
libata version 3.00 loaded.
i2c i2c-0: 3/4 memory slots populated (from DMI)
i2c i2c-0: Successfully instantiated SPD at 0x51
initcall ata_init+0x0/0x8a [libata] returned 0 after 25584 usecs
i2c i2c-0: Successfully instantiated SPD at 0x52
initcall cstate_pmu_init+0x0/0x1000 [intel_cstate] returned 0 after 40960 usecs
i2c i2c-0: Successfully instantiated SPD at 0x53
calling  rapl_pmu_init+0x0/0xf0a [rapl] @ 133
calling  wmi_bmof_driver_init+0x0/0x1000 [wmi_bmof] @ 134
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 194
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 13 usecs

RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
RAPL PMU: hw unit of domain package 2^-14 Joules
RAPL PMU: hw unit of domain dram 2^-14 Joules
RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
initcall rapl_pmu_init+0x0/0xf0a [rapl] returned 0 after 50273 usecs
initcall wmi_bmof_driver_init+0x0/0x1000 [wmi_bmof] returned 0 after 52909 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 187
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
ipmi_si: Unable to find any System Interface(s)
calling  mei_wdt_driver_init+0x0/0x1000 [mei_wdt] @ 164
initcall init_ipmi_si+0x0/0x296 [ipmi_si] returned -19 after 18194 usecs
calling  ahci_pci_driver_init+0x0/0x1000 [ahci] @ 162
initcall mei_wdt_driver_init+0x0/0x1000 [mei_wdt] returned 0 after 10587 usecs
ahci 0000:00:17.0: version 3.0
calling  sha512_ssse3_mod_init+0x0/0x1000 [sha512_ssse3] @ 133
ahci 0000:00:17.0: controller can't do SNTF, turning off CAP_SNTF
initcall sha512_ssse3_mod_init+0x0/0x1000 [sha512_ssse3] returned 0 after 30 usecs
ahci 0000:00:17.0: SSS flag set, parallel bus scan disabled
ahci 0000:00:17.0: AHCI 0001.0301 32 slots 4 ports 6 Gbps 0xf impl RAID mode
ahci 0000:00:17.0: flags: 64bit ncq stag pm led clo only pio slum part ems deso sadm sds apst 
calling  drm_display_helper_module_init+0x0/0x1000 [drm_display_helper] @ 192
initcall drm_display_helper_module_init+0x0/0x1000 [drm_display_helper] returned 0 after 1811 usecs
calling  ghash_pclmulqdqni_mod_init+0x0/0x1000 [ghash_clmulni_intel] @ 133
initcall ghash_pclmulqdqni_mod_init+0x0/0x1000 [ghash_clmulni_intel] returned 0 after 438 usecs
scsi host0: ahci
calling  crc32c_intel_mod_init+0x0/0x1000 [crc32c_intel] @ 133
initcall crc32c_intel_mod_init+0x0/0x1000 [crc32c_intel] returned 0 after 583 usecs
calling  drm_buddy_module_init+0x0/0x1000 [drm_buddy] @ 192
initcall drm_buddy_module_init+0x0/0x1000 [drm_buddy] returned 0 after 668 usecs
scsi host1: ahci
scsi host2: ahci
calling  crc32_pclmul_mod_init+0x0/0x1000 [crc32_pclmul] @ 133
scsi host3: ahci
ata1: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c100 irq 125
initcall crc32_pclmul_mod_init+0x0/0x1000 [crc32_pclmul] returned 0 after 11061 usecs
ata2: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c180 irq 125
ata3: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c200 irq 125
ata4: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c280 irq 125
See 'systemctl status openipmi.service' for details.
ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata1.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
ata1.00: ACPI cmd b1/c1:00:00:00:00:e0(DEVICE CONFIGURATION OVERLAY) filtered out
ata1.00: ATA-8: WDC WD10EARS-00Y5B1, 80.00A80, max UDMA/133
ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 32), AA
ata1.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
ata1.00: ACPI cmd b1/c1:00:00:00:00:e0(DEVICE CONFIGURATION OVERLAY) filtered out
ata1.00: configured for UDMA/133
scsi 0:0:0:0: Direct-Access     ATA      WDC WD10EARS-00Y 0A80 PQ: 0 ANSI: 5
calling  i915_init+0x0/0x161 [i915] @ 192
i915 0000:00:02.0: vgaarb: deactivate vga console
rc.local[289]: mkdir: cannot crea[   47.708286][  T192] Console: switching to colour dummy device 80x25
i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
;1;39mPermit Use[   47.794057][   T21] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915
ata2.00: ATA-9: INTEL SSDSC2BB012T4, G2010036, max UDMA/133

LKP: ttyS0: 287:[   47.829354][  T253] ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
current_version[   47.838986][  T253] ata2.00: configured for UDMA/133
: f0, target_version: f0
scsi 1:0:0:0: Direct-Access     ATA      INTEL SSDSC2BB01 0036 PQ: 0 ANSI: 5
LKP: ttyS0: 287: skip deploy intel ucode as ucode is same
LKP: ttyS0: 287: Kernel tests: Boot OK!
LKP: ttyS0: 287: HOSTNAME lkp-skl-d06, MAC 3c:52:82:5d:1e:ba, kernel 6.2.0-rc1-00035-gd0067447fa5b 1
ata3: SATA link down (SStatus 4 SControl 300)
i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] failed to retrieve link info, disabling eDP
[drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 0
ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
initcall i915_init+0x0/0x161 [i915] returned 0 after 730926 usecs
i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
ata4: SATA link down (SStatus 4 SControl 300)
i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
calling  init_sg+0x0/0x1000 [sg] @ 164
calling  crc64_rocksoft_mod_init+0x0/0x1000 [crc64_rocksoft] @ 176
calling  crc64_rocksoft_init+0x0/0x1000 [crc64_rocksoft_generic] @ 368
calling  kvm_x86_init+0x0/0x11 [kvm] @ 193
initcall crc64_rocksoft_init+0x0/0x1000 [crc64_rocksoft_generic] returned 0 after 20 usecs
initcall kvm_x86_init+0x0/0x11 [kvm] returned 0 after 1 usecs
scsi 0:0:0:0: Attached scsi generic sg0 type 0
scsi 1:0:0:0: Attached scsi generic sg1 type 0
initcall init_sg+0x0/0x1000 [sg] returned 0 after 1255 usecs
initcall crc64_rocksoft_mod_init+0x0/0x1000 [crc64_rocksoft] returned 0 after 74942 usecs
calling  vmx_init+0x0/0x277 [kvm_intel] @ 193
calling  init_sd+0x0/0x1000 [sd_mod] @ 176
ata2.00: Enabling discard_zeroes_data
sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
sd 1:0:0:0: [sdb] 2344225968 512-byte logical blocks: (1.20 TB/1.09 TiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 1:0:0:0: [sdb] 4096-byte physical blocks
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
initcall init_sd+0x0/0x1000 [sd_mod] returned 0 after 37550 usecs
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 1:0:0:0: [sdb] Write Protect is off
sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
ata2.00: Enabling discard_zeroes_data
sdb: sdb1 sdb2
sd 1:0:0:0: [sdb] Attached SCSI disk
initcall vmx_init+0x0/0x277 [kvm_intel] returned 0 after 147251 usecs
sda: sda1 sda2 sda3 sda4
sd 0:0:0:0: [sda] Attached SCSI disk
calling  coretemp_init+0x0/0x1000 [coretemp] @ 193
initcall coretemp_init+0x0/0x1000 [coretemp] returned 0 after 15964 usecs
calling  powerclamp_init+0x0/0x1000 [intel_powerclamp] @ 193
initcall powerclamp_init+0x0/0x1000 [intel_powerclamp] returned 0 after 543 usecs
calling  pkg_temp_thermal_init+0x0/0x1000 [x86_pkg_temp_thermal] @ 133
initcall pkg_temp_thermal_init+0x0/0x1000 [x86_pkg_temp_thermal] returned 0 after 8740 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 133
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 2 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 193
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
calling  pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] @ 133
initcall pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] returned -19 after 182 usecs
calling  libcrc32c_mod_init+0x0/0x1000 [libcrc32c] @ 410
initcall libcrc32c_mod_init+0x0/0x1000 [libcrc32c] returned 0 after 19 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 149
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
calling  pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] @ 193
initcall pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] returned -19 after 182 usecs
calling  acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] @ 148
calling  rapl_init+0x0/0x1000 [intel_rapl_common] @ 133
initcall acpi_cpufreq_init+0x0/0x1000 [acpi_cpufreq] returned -17 after 1 usecs
initcall rapl_init+0x0/0x1000 [intel_rapl_common] returned 0 after 5958 usecs
calling  init_module+0x0/0x1000 [raid6_pq] @ 410
calling  pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] @ 149
initcall pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] returned -19 after 210 usecs
raid6: avx2x4   gen() 28795 MB/s
raid6: avx2x2   gen() 26499 MB/s
raid6: avx2x1   gen() 22372 MB/s
raid6: using algorithm avx2x4 gen() 28795 MB/s
raid6: .... xor() 9796 MB/s, rmw enabled
raid6: using avx2x2 recovery algorithm
initcall init_module+0x0/0x1000 [raid6_pq] returned 0 after 93378 usecs
calling  intel_rapl_msr_driver_init+0x0/0x1000 [intel_rapl_msr] @ 191
calling  calibrate_xor_blocks+0x0/0xead [xor] @ 410
xor: automatically using best checksumming function   avx       
intel_rapl_common: Found RAPL domain package
initcall calibrate_xor_blocks+0x0/0xead [xor] returned 0 after 7779 usecs
intel_rapl_common: Found RAPL domain core
intel_rapl_common: Found RAPL domain uncore
calling  pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] @ 148
intel_rapl_common: Found RAPL domain dram
initcall pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] returned -19 after 170 usecs
initcall intel_rapl_msr_driver_init+0x0/0x1000 [intel_rapl_msr] returned 0 after 21375 usecs
calling  blake2b_mod_init+0x0/0x1000 [blake2b_generic] @ 410
initcall blake2b_mod_init+0x0/0x1000 [blake2b_generic] returned 0 after 28 usecs
calling  init_btrfs_fs+0x0/0x1e2 [btrfs] @ 410
Btrfs loaded, crc32c=crc32c-intel, zoned=no, fsverity=no
initcall init_btrfs_fs+0x0/0x1e2 [btrfs] returned 0 after 16196 usecs
BTRFS: device fsid 620c5088-9233-44b5-b8f3-c0b6df2acb29 devid 1 transid 91 /dev/sdb2 scanned by systemd-udevd (189)
BTRFS: device fsid d55d7a8b-1de5-425d-a4f4-c20d78b40a6b devid 1 transid 15884 /dev/sdb1 scanned by systemd-udevd (176)
BTRFS: device fsid 5386c76c-c4d1-423d-84f3-6165e2069a30 devid 1 transid 83 /dev/sda1 scanned by systemd-udevd (164)
BTRFS: device fsid 4feffc13-1a32-4f06-9d95-cce44c499ac2 devid 1 transid 8 /dev/sda2 scanned by systemd-udevd (196)
LKP: stdout: 287: Kernel tests: Boot OK!

LKP: stdout: 287: HOSTNAME lkp-skl-d06, MAC 3c:52:82:5d:1e:ba, kernel 6.2.0-rc1-00035-gd0067447fa5b 1

install debs round one: dpkg -i --force-confdef --force-depends /opt/deb/python3-six_1.16.0-4_all.deb

/opt/deb/openvswitch-common_2.17.2-5+b1_amd64.deb

/opt/deb/python3-netifaces_0.11.0-1+b3_amd64.deb

/opt/deb/python3-sortedcontainers_2.4.0-2_all.deb

/opt/deb/python3-openvswitch_2.17.2-5_all.deb

/opt/deb/uuid-runtime_2.38.1-4_amd64.deb

/opt/deb/openvswitch-switch_2.17.2-5+b1_amd64.deb

/opt/deb/traceroute_1%3a2.1.0-3_amd64.deb

/opt/deb/attr_1%3a2.5.1-1_amd64.deb

/opt/deb/ebtables_2.0.11-5_amd64.deb

/opt/deb/libatomic1_12.2.0-9_amd64.deb

/opt/deb/libquadmath0_12.2.0-9_amd64.deb

/opt/deb/libgcc-12-dev_12.2.0-9_amd64.deb

/opt/deb/gcc-12_12.2.0-9_amd64.deb

/opt/deb/gcc_4%3a12.2.0-1_amd64.deb

/opt/deb/g++-12_12.2.0-9_amd64.deb

/opt/deb/g++_4%3a12.2.0-1_amd64.deb

/opt/deb/gcc-11-base_11.3.0-8_amd64.deb

/opt/deb/lib32gcc-s1_12.2.0-9_amd64.deb

/opt/deb/libx32gcc-s1_12.2.0-9_amd64.deb

/opt/deb/lib32atomic1_12.2.0-9_amd64.deb

/opt/deb/libx32atomic1_12.2.0-9_amd64.deb

/opt/deb/lib32quadmath0_12.2.0-9_amd64.deb

/opt/deb/libx32quadmath0_12.2.0-9_amd64.deb

/opt/deb/lib32gcc-12-dev_12.2.0-9_amd64.deb

/opt/deb/libx32gcc-12-dev_12.2.0-9_amd64.deb

/opt/deb/gcc-12-multilib_12.2.0-9_amd64.deb

/opt/deb/gcc-multilib_4%3a12.2.0-1_amd64.deb

/opt/deb/libasound2-data_1.2.8-1_all.deb

/opt/deb/libdeflate0_1.14-1_amd64.deb

/opt/deb/libpython3.10_3.10.8-3_amd64.deb

/opt/deb/libwireshark-data_4.0.1-1_all.deb

/opt/deb/python3-pkg-resources_65.5.0-1_all.deb

/opt/deb/python3-pygments_2.13.0+dfsg-1_all.deb

/opt/deb/python3-yaml_6.0-3+b1_amd64.deb

/opt/deb/netcat-openbsd_1.219-1_amd64.deb

/opt/deb/python3-roman_3.3-2_all.deb

/opt/deb/python3-docutils_0.17.1+dfsg-3_all.deb

/opt/deb/python3-scapy_2.4.5+g9420c22-2_all.deb

/opt/deb/socat_1.7.4.4-2_amd64.deb

/opt/deb/tcpdump_4.99.1-4+b1_amd64.deb

Selecting previously unselected package python3-six.

(Reading database ... 16792 files and directories currently installed.)

Preparing to unpack .../python3-six_1.16.0-4_all.deb ...

Unpacking python3-six (1.16.0-4) ...

Selecting previously unselected package openvswitch-common.

Preparing to unpack .../openvswitch-common_2.17.2-5+b1_amd64.deb ...

Unpacking openvswitch-common (2.17.2-5+b1) ...

Selecting previously unselected package python3-netifaces:amd64.

Preparing to unpack .../python3-netifaces_0.11.0-1+b3_amd64.deb ...

Unpacking python3-netifaces:amd64 (0.11.0-1+b3) ...

Selecting previously unselected package python3-sortedcontainers.

Preparing to unpack .../python3-sortedcontainers_2.4.0-2_all.deb ...

Unpacking python3-sortedcontainers (2.4.0-2) ...

Selecting previously unselected package python3-openvswitch.

Preparing to unpack .../python3-openvswitch_2.17.2-5_all.deb ...

Unpacking python3-openvswitch (2.17.2-5) ...

Selecting previously unselected package uuid-runtime.

Preparing to unpack .../uuid-runtime_2.38.1-4_amd64.deb ...

Unpacking uuid-runtime (2.38.1-4) ...

Selecting previously unselected package openvswitch-switch.

Preparing to unpack .../openvswitch-switch_2.17.2-5+b1_amd64.deb ...

Unpacking openvswitch-switch (2.17.2-5+b1) ...

Selecting previously unselected package traceroute.

Preparing to unpack .../traceroute_1%3a2.1.0-3_amd64.deb ...

Unpacking traceroute (1:2.1.0-3) ...

Selecting previously unselected package attr.

Preparing to unpack .../deb/attr_1%3a2.5.1-1_amd64.deb ...

Unpacking attr (1:2.5.1-1) ...

Selecting previously unselected package ebtables.

Preparing to unpack .../ebtables_2.0.11-5_amd64.deb ...

Unpacking ebtables (2.0.11-5) ...

Selecting previously unselected package libatomic1:amd64.

Preparing to unpack .../libatomic1_12.2.0-9_amd64.deb ...

Unpacking libatomic1:amd64 (12.2.0-9) ...

Selecting previously unselected package libquadmath0:amd64.

Preparing to unpack .../libquadmath0_12.2.0-9_amd64.deb ...

Unpacking libquadmath0:amd64 (12.2.0-9) ...

Selecting previously unselected package libgcc-12-dev:amd64.

Preparing to unpack .../libgcc-12-dev_12.2.0-9_amd64.deb ...

Unpacking libgcc-12-dev:amd64 (12.2.0-9) ...

Selecting previously unselected package gcc-12.

Preparing to unpack .../deb/gcc-12_12.2.0-9_amd64.deb ...

Unpacking gcc-12 (12.2.0-9) ...

Selecting previously unselected package gcc.

Preparing to unpack .../deb/gcc_4%3a12.2.0-1_amd64.deb ...

Unpacking gcc (4:12.2.0-1) ...

Selecting previously unselected package g++-12.

Preparing to unpack .../deb/g++-12_12.2.0-9_amd64.deb ...

Unpacking g++-12 (12.2.0-9) ...

Selecting previously unselected package g++.

Preparing to unpack .../deb/g++_4%3a12.2.0-1_amd64.deb ...

Unpacking g++ (4:12.2.0-1) ...

Selecting previously unselected package gcc-11-base:amd64.

Preparing to unpack .../gcc-11-base_11.3.0-8_amd64.deb ...

Unpacking gcc-11-base:amd64 (11.3.0-8) ...

Selecting previously unselected package lib32gcc-s1.

Preparing to unpack .../lib32gcc-s1_12.2.0-9_amd64.deb ...

Unpacking lib32gcc-s1 (12.2.0-9) ...

Selecting previously unselected package libx32gcc-s1.

Preparing to unpack .../libx32gcc-s1_12.2.0-9_amd64.deb ...

Unpacking libx32gcc-s1 (12.2.0-9) ...

Selecting previously unselected package lib32atomic1.

Preparing to unpack .../lib32atomic1_12.2.0-9_amd64.deb ...

Unpacking lib32atomic1 (12.2.0-9) ...

Selecting previously unselected package libx32atomic1.

Preparing to unpack .../libx32atomic1_12.2.0-9_amd64.deb ...

Unpacking libx32atomic1 (12.2.0-9) ...

Selecting previously unselected package lib32quadmath0.

Preparing to unpack .../lib32quadmath0_12.2.0-9_amd64.deb ...

Unpacking lib32quadmath0 (12.2.0-9) ...

Selecting previously unselected package libx32quadmath0.

Preparing to unpack .../libx32quadmath0_12.2.0-9_amd64.deb ...

Unpacking libx32quadmath0 (12.2.0-9) ...

Selecting previously unselected package lib32gcc-12-dev.

Preparing to unpack .../lib32gcc-12-dev_12.2.0-9_amd64.deb ...

Unpacking lib32gcc-12-dev (12.2.0-9) ...

Selecting previously unselected package libx32gcc-12-dev.

Preparing to unpack .../libx32gcc-12-dev_12.2.0-9_amd64.deb ...

Unpacking libx32gcc-12-dev (12.2.0-9) ...

Selecting previously unselected package gcc-12-multilib.

Preparing to unpack .../gcc-12-multilib_12.2.0-9_amd64.deb ...

Unpacking gcc-12-multilib (12.2.0-9) ...

Selecting previously unselected package gcc-multilib.

Preparing to unpack .../gcc-multilib_4%3a12.2.0-1_amd64.deb ...

Unpacking gcc-multilib (4:12.2.0-1) ...

Selecting previously unselected package libasound2-data.

Preparing to unpack .../libasound2-data_1.2.8-1_all.deb ...

Unpacking libasound2-data (1.2.8-1) ...

Selecting previously unselected package libdeflate0:amd64.

Preparing to unpack .../libdeflate0_1.14-1_amd64.deb ...

Unpacking libdeflate0:amd64 (1.14-1) ...

Selecting previously unselected package libpython3.10:amd64.

Preparing to unpack .../libpython3.10_3.10.8-3_amd64.deb ...

Unpacking libpython3.10:amd64 (3.10.8-3) ...

Selecting previously unselected package libwireshark-data.

Preparing to unpack .../libwireshark-data_4.0.1-1_all.deb ...

Unpacking libwireshark-data (4.0.1-1) ...

Selecting previously unselected package python3-pkg-resources.

Preparing to unpack .../python3-pkg-resources_65.5.0-1_all.deb ...

Unpacking python3-pkg-resources (65.5.0-1) ...

Selecting previously unselected package python3-pygments.

Preparing to unpack .../python3-pygments_2.13.0+dfsg-1_all.deb ...

Unpacking python3-pygments (2.13.0+dfsg-1) ...

Selecting previously unselected package python3-yaml.

Preparing to unpack .../python3-yaml_6.0-3+b1_amd64.deb ...

Unpacking python3-yaml (6.0-3+b1) ...

Selecting previously unselected package netcat-openbsd.

Preparing to unpack .../netcat-openbsd_1.219-1_amd64.deb ...

Unpacking netcat-openbsd (1.219-1) ...

Selecting previously unselected package python3-roman.

Preparing to unpack .../python3-roman_3.3-2_all.deb ...

Unpacking python3-roman (3.3-2) ...

Selecting previously unselected package python3-docutils.

Preparing to unpack .../python3-docutils_0.17.1+dfsg-3_all.deb ...

Unpacking python3-docutils (0.17.1+dfsg-3) ...

Selecting previously unselected package python3-scapy.

Preparing to unpack .../python3-scapy_2.4.5+g9420c22-2_all.deb ...

Unpacking python3-scapy (2.4.5+g9420c22-2) ...

Selecting previously unselected package socat.

Preparing to unpack .../deb/socat_1.7.4.4-2_amd64.deb ...

Unpacking socat (1.7.4.4-2) ...

Selecting previously unselected package tcpdump.

Preparing to unpack .../tcpdump_4.99.1-4+b1_amd64.deb ...

Unpacking tcpdump (4.99.1-4+b1) ...

Setting up python3-six (1.16.0-4) ...

Setting up python3-netifaces:amd64 (0.11.0-1+b3) ...

Setting up python3-sortedcontainers (2.4.0-2) ...

Setting up python3-openvswitch (2.17.2-5) ...

Setting up traceroute (1:2.1.0-3) ...

update-alternatives: using /usr/bin/traceroute.db to provide /usr/bin/traceroute (traceroute) in auto mode

update-alternatives: using /usr/bin/traceroute6.db to provide /usr/bin/traceroute6 (traceroute6) in auto mode

update-alternatives: using /usr/bin/lft.db to provide /usr/bin/lft (lft) in auto mode

update-alternatives: using /usr/bin/traceproto.db to provide /usr/bin/traceproto (traceproto) in auto mode

update-alternatives: using /usr/sbin/tcptraceroute.db to provide /usr/sbin/tcptraceroute (tcptraceroute) in auto mode

Setting up attr (1:2.5.1-1) ...

Setting up ebtables (2.0.11-5) ...

update-alternatives: using /usr/sbin/ebtables-legacy to provide /usr/sbin/ebtables (ebtables) in auto mode

Setting up libatomic1:amd64 (12.2.0-9) ...

Setting up libquadmath0:amd64 (12.2.0-9) ...

Setting up gcc-11-base:amd64 (11.3.0-8) ...

Setting up libasound2-data (1.2.8-1) ...

Setting up libdeflate0:amd64 (1.14-1) ...

Setting up libpython3.10:amd64 (3.10.8-3) ...

Setting up libwireshark-data (4.0.1-1) ...

Setting up python3-pkg-resources (65.5.0-1) ...

Setting up python3-pygments (2.13.0+dfsg-1) ...

Setting up netcat-openbsd (1.219-1) ...

update-alternatives: using /bin/nc.openbsd to provide /bin/nc (nc) in auto mode

Setting up python3-roman (3.3-2) ...

Setting up python3-scapy (2.4.5+g9420c22-2) ...

Setting up socat (1.7.4.4-2) ...

Setting up libgcc-12-dev:amd64 (12.2.0-9) ...

Setting up gcc-12 (12.2.0-9) ...

Setting up gcc (4:12.2.0-1) ...

Setting up g++-12 (12.2.0-9) ...

Setting up g++ (4:12.2.0-1) ...

update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in auto mode

Setting up lib32gcc-s1 (12.2.0-9) ...

Setting up libx32gcc-s1 (12.2.0-9) ...

Setting up lib32atomic1 (12.2.0-9) ...

Setting up libx32atomic1 (12.2.0-9) ...

Setting up lib32quadmath0 (12.2.0-9) ...

Setting up libx32quadmath0 (12.2.0-9) ...

Setting up lib32gcc-12-dev (12.2.0-9) ...

Setting up libx32gcc-12-dev (12.2.0-9) ...

Setting up gcc-12-multilib (12.2.0-9) ...

Setting up gcc-multilib (4:12.2.0-1) ...

Setting up python3-yaml (6.0-3+b1) ...

Setting up python3-docutils (0.17.1+dfsg-3) ...

Setting up tcpdump (4.99.1-4+b1) ...

Setting up openvswitch-common (2.17.2-5+b1) ...

Setting up uuid-runtime (2.38.1-4) ...

Adding group `uuidd' (GID 110) ...

Done.

Setting up openvswitch-switch (2.17.2-5+b1) ...

update-alternatives: using /usr/lib/openvswitch-switch/ovs-vswitchd to provide /usr/sbin/ovs-vswitchd (ovs-vswitchd) in auto mode

calling  nf_defrag_init+0x0/0x1000 [nf_defrag_ipv4] @ 1123
initcall nf_defrag_init+0x0/0x1000 [nf_defrag_ipv4] returned 0 after 2 usecs
calling  nf_defrag_init+0x0/0x1000 [nf_defrag_ipv6] @ 1123
initcall nf_defrag_init+0x0/0x1000 [nf_defrag_ipv6] returned 0 after 361 usecs
calling  nf_conntrack_standalone_init+0x0/0x1000 [nf_conntrack] @ 1123
initcall nf_conntrack_standalone_init+0x0/0x1000 [nf_conntrack] returned 0 after 1487 usecs
calling  nf_nat_init+0x0/0x1000 [nf_nat] @ 1123
initcall nf_nat_init+0x0/0x1000 [nf_nat] returned 0 after 335 usecs
calling  nf_conncount_modinit+0x0/0x1000 [nf_conncount] @ 1123
initcall nf_conncount_modinit+0x0/0x1000 [nf_conncount] returned 0 after 573 usecs
calling  dp_init+0x0/0x192 [openvswitch] @ 1123
openvswitch: Open vSwitch switching datapath
initcall dp_init+0x0/0x192 [openvswitch] returned 0 after 9517 usecs
Processing triggers for libc-bin (2.36-5) ...

BTRFS info (device sdb1): using crc32c (crc32c-intel) checksum algorithm
BTRFS info (device sdb1): using free space tree
BTRFS info (device sdb1): enabling ssd optimizations
BTRFS info (device sdb1): auto enabling async discard
LKP: ttyS0: 287:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml
LKP: ttyS0: 1174: current_version: f0, target_version: f0
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3a02000-0xb3a02fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3a02000-0xb3a02fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3a02000-0xb3a02fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1243 map pfn expected mapping type uncached-minus for [mem 0xb3ef0000-0xb3ef0fff], got write-back
LKP: stdout: 287:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml

RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3

job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml

result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESULT_ROOT: /internal-lkp-server/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/3, TMP_RESULT_ROOT: /tmp/lkp/result

run-job /lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml

/usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-21499-s20djh-5.yaml&job_state=running -O /dev/null

target ucode: 0xf0

LKP: stdout: 1174: current_version: f0, target_version: f0

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-8.3-kselftests-d0067447fa5bdd65ec4f7a5737581362641f7611

2023-01-06 05:26:30 ln -sf /usr/bin/clang

2023-01-06 05:26:30 ln -sf /usr/sbin/iptables-nft /usr/bin/iptables

2023-01-06 05:26:30 ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables

2023-01-06 05:26:30 sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh

LKP WARN miss config CONFIG_PREEMPT_TRACER= of ftrace/config

2023-01-06 05:26:30 make -C ftrace

make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d0067447fa5bdd65ec4f7a5737581362641f7611/tools/testing/selftests/ftrace'

make: Nothing to be done for 'all'.

make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d0067447fa5bdd65ec4f7a5737581362641f7611/tools/testing/selftests/ftrace'

2023-01-06 05:26:30 make quicktest=1 run_tests -C ftrace

make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-d0067447fa5bdd65ec4f7a5737581362641f7611/tools/testing/selftests/ftrace'

TAP version 13

1..1

# selftests: ftrace: ftracetest

# === Ftrace unit tests ===

# [1] Basic trace file check	[PASS]

# [2] Basic test for tracersIPMI BMC is not supported on this machine, skip bmc-watchdog setup!

	[PASS]

# [3] Basic trace clock test	[PASS]

# [4] Basic event tracing check	[PASS]

# [5] Change the ringbuffer size	[PASS]

# [6] Snapshot and tracing setting	[PASS]

# [7] trace_pipe and trace_marker	[PASS]


**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** trace_printk() being used. Allocating extra memory.  **
**                                                      **
** This means that this is a DEBUG kernel and it is     **
** unsafe for production use.                           **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your vendor!  **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************
calling  ftrace_direct_init+0x0/0x1000 [ftrace_direct] @ 1714
initcall ftrace_direct_init+0x0/0x1000 [ftrace_direct] returned 0 after 13220 usecs
calling  ftrace_direct_init+0x0/0x1000 [ftrace_direct] @ 1724
initcall ftrace_direct_init+0x0/0x1000 [ftrace_direct] returned 0 after 11246 usecs
calling  ftrace_direct_init+0x0/0x1000 [ftrace_direct] @ 1730
initcall ftrace_direct_init+0x0/0x1000 [ftrace_direct] returned 0 after 10544 usecs
calling  ftrace_direct_init+0x0/0x1000 [ftrace_direct] @ 1732
initcall ftrace_direct_init+0x0/0x1000 [ftrace_direct] returned 0 after 10226 usecs
calling  ftrace_direct_init+0x0/0x1000 [ftrace_direct] @ 1738
initcall ftrace_direct_init+0x0/0x1000 [ftrace_direct] returned 0 after 14220 usecs



=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Not tainted
-----------------------------
include/trace/events/lock.h:24 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/3/0.

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
lock_acquire.cold+0x1f/0x40
? rcu_read_unlock+0x40/0x40
------------[ cut here ]------------
WARNING: CPU: 3 PID: 0 at kernel/module/internal.h:115 __module_address+0x182/0x200
Modules linked in: openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 btrfs blake2b_generic xor intel_rapl_msr raid6_pq intel_rapl_common zstd_compress libcrc32c x86_pkg_temp_thermal intel_powerclamp coretemp sd_mod t10_pi kvm_intel crc64_rocksoft_generic crc64_rocksoft crc64 kvm sg irqbypass i915 crct10dif_pclmul crc32_pclmul drm_buddy crc32c_intel ghash_clmulni_intel drm_display_helper mei_wdt ahci sha512_ssse3 ttm libahci rapl wmi_bmof ipmi_devintf intel_cstate drm_kms_helper libata mei_me i2c_i801 syscopyarea intel_uncore ipmi_msghandler i2c_smbus sysfillrect serio_raw intel_pch_thermal mei sysimgblt intel_gtt ie31200_edac agpgart video wmi intel_pmc_core tpm_infineon acpi_pad binfmt_misc drm fuse ip_tables [last unloaded: ftrace_direct]
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
RIP: 0010:__module_address+0x182/0x200
Code: 01 00 00 48 01 ea 48 39 d3 0f 82 69 ff ff ff 0f 0b be ff ff ff ff 48 c7 c7 e8 5b 1f 85 e8 36 2b 51 02 85 c0 0f 85 d1 fe ff ff <0f> 0b e9 ca fe ff ff 48 83 c4 08 31 c0 5b 5d c3 48 c7 c7 4c d0 ac
RSP: 0018:ffffc9000018eb10 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffffffffa027e086 RCX: 0000000000000001
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffffffff851f5be8
RBP: ffffffffa027e086 R08: 0000000000000000 R09: ffff8883aa7bfa83
R10: ffffed10754f7f50 R11: ffff88812ac63190 R12: ffffc9000018ec00
R13: ffffffffa027e086 R14: ffffc9000018ec40 R15: ffffc9000018ec20
FS:  0000000000000000(0000) GS:ffff8883aa780000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560366a55000 CR3: 000000043cc2a003 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
<TASK>

=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Not tainted
-----------------------------
include/linux/rcupdate.h:765 rcu_read_lock() used illegally while idle!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
1 lock held by swapper/3/0:
#0: ffffffff85125e40 (rcu_read_lock){....}-{1:2}, at: __bpf_address_lookup+0x9/0x200

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
? 0xffffffffa027e085
__bpf_address_lookup+0x177/0x200
? 0xffffffffa027e085
? ftrace_regs_caller_end+0x55/0x55
kallsyms_lookup_buildid+0x187/0x220
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
__sprint_symbol+0xae/0x1c0
? prepare_ftrace_return+0x162/0x230
? kallsyms_lookup_buildid+0x220/0x220
? 0xffffffffa027e087
? ftrace_return_to_handler+0x260/0x390
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
symbol_string+0x2e1/0x390
? ip6_addr_string+0x2e0/0x2e0
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? move_right+0x60/0x60
? 0xffffffffa027e086
pointer+0x444/0x9c0
? resource_string+0x1590/0x1590
? rb_commit+0xef/0x820
vsnprintf+0x44f/0x15e0
? pointer+0x9c0/0x9c0
? __trace_graph_entry+0x155/0x1a0
vprintk_store+0x222/0x800
? ftrace_graph_stop+0x10/0x10
? printk_sprint+0x230/0x230
? vprintk+0x4/0x50
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e086
? 0xffffffffa027e087
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
vprintk+0x38/0x50
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? 0xffffffffa027e086
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
show_trace_log_lvl+0x22b/0x2c7
? 0xffffffffa027e086
? 0xffffffffa027e086
? module_address_lookup+0x36/0x100
? __module_address+0x182/0x200
? ftrace_regs_caller_end+0x55/0x55
__warn+0xcd/0x180
? __module_address+0x182/0x200
? ftrace_regs_caller_end+0x55/0x55
report_bug+0x15e/0x1c0
handle_bug+0x3c/0x70
exc_invalid_op+0x18/0x50
asm_exc_invalid_op+0x1a/0x20
RIP: 0010:__module_address+0x182/0x200
Code: 01 00 00 48 01 ea 48 39 d3 0f 82 69 ff ff ff 0f 0b be ff ff ff ff 48 c7 c7 e8 5b 1f 85 e8 36 2b 51 02 85 c0 0f 85 d1 fe ff ff <0f> 0b e9 ca fe ff ff 48 83 c4 08 31 c0 5b 5d c3 48 c7 c7 4c d0 ac
RSP: 0018:ffffc9000018eb10 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffffffffa027e086 RCX: 0000000000000001
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffffffff851f5be8
RBP: ffffffffa027e086 R08: 0000000000000000 R09: ffff8883aa7bfa83
R10: ffffed10754f7f50 R11: ffff88812ac63190 R12: ffffc9000018ec00
R13: ffffffffa027e086 R14: ffffc9000018ec40 R15: ffffc9000018ec20
? 0xffffffffa027e086
? 0xffffffffa027e086
? 0xffffffffa027e086
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
module_address_lookup+0x36/0x100
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
kallsyms_lookup_buildid+0x153/0x220
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
__sprint_symbol+0xae/0x1c0
? prepare_ftrace_return+0x162/0x230
? kallsyms_lookup_buildid+0x220/0x220
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
symbol_string+0x2e1/0x390
? ip6_addr_string+0x2e0/0x2e0
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? move_right+0x60/0x60
? 0xffffffffa027e087
pointer+0x444/0x9c0
? resource_string+0x1590/0x1590
? rb_commit+0xef/0x820
vsnprintf+0x44f/0x15e0
? pointer+0x9c0/0x9c0
? __trace_graph_entry+0x155/0x1a0
vprintk_store+0x222/0x800
? ftrace_graph_stop+0x10/0x10
? printk_sprint+0x230/0x230
? vprintk+0x4/0x50
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk+0x38/0x50
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
show_trace_log_lvl+0x22b/0x2c7
? 0xffffffffa027e087
? _raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
lock_acquire.cold+0x1f/0x40
? rcu_read_unlock+0x40/0x40
? 0xffffffffa027e087
? 0xffffffffa027e087
? function_graph_enter+0x490/0x490
? ftrace_regs_caller_end+0x55/0x55
_raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
down_trylock+0x17/0x70
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
__down_trylock_console_sem+0x24/0x90
? ftrace_regs_caller_end+0x55/0x55
console_trylock_spinning+0x13/0x220
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x190/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? printk_sprint+0x177/0x230
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
printk_sprint+0x1f7/0x230
? printk_sprint+0x5/0x230
? ftrace_regs_caller_end+0x55/0x55
vprintk_store+0x2e6/0x800
? printk_sprint+0x230/0x230
? vprintk_emit+0x4/0x280
? function_graph_enter+0x2f7/0x490
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x165/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
module_address_lookup+0x36/0x100
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
kallsyms_lookup_buildid+0x153/0x220
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
__sprint_symbol+0xae/0x1c0
? prepare_ftrace_return+0x162/0x230
? kallsyms_lookup_buildid+0x220/0x220
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
symbol_string+0x2e1/0x390
? ip6_addr_string+0x2e0/0x2e0
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? move_right+0x60/0x60
? 0xffffffffa027e087
pointer+0x444/0x9c0
? resource_string+0x1590/0x1590
? rb_commit+0xef/0x820
vsnprintf+0x44f/0x15e0
? pointer+0x9c0/0x9c0
? __trace_graph_entry+0x155/0x1a0
vprintk_store+0x222/0x800
? ftrace_graph_stop+0x10/0x10
? printk_sprint+0x230/0x230
? vprintk+0x4/0x50
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk+0x38/0x50
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
show_trace_log_lvl+0x22b/0x2c7
? 0xffffffffa027e087
? _raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
lock_acquire.cold+0x1f/0x40
? rcu_read_unlock+0x40/0x40
? 0xffffffffa027e087
? 0xffffffffa027e087
? function_graph_enter+0x490/0x490
? ftrace_regs_caller_end+0x55/0x55
_raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
down_trylock+0x17/0x70
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
__down_trylock_console_sem+0x24/0x90
? ftrace_regs_caller_end+0x55/0x55
console_trylock_spinning+0x13/0x220
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x190/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? printk_sprint+0x177/0x230
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
printk_sprint+0x1f7/0x230
? printk_sprint+0x5/0x230
? ftrace_regs_caller_end+0x55/0x55
vprintk_store+0x2e6/0x800
? printk_sprint+0x230/0x230
? vprintk_emit+0x4/0x280
? function_graph_enter+0x2f7/0x490
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x165/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>
irq event stamp: 1396078
hardirqs last  enabled at (1396077): [<ffffffff83a0148a>] asm_sysvec_apic_timer_interrupt+0x1a/0x20
hardirqs last disabled at (1396078): [<ffffffff81561530>] trace_graph_entry+0x500/0x7f0
softirqs last  enabled at (1396076): [<ffffffff810f5830>] return_to_handler+0x0/0x40
softirqs last disabled at (1395931): [<ffffffff810f5830>] return_to_handler+0x0/0x40
---[ end trace 0000000000000000 ]---

=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Not tainted
-----------------------------
include/trace/events/error_report.h:69 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/3/0.

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? __module_address+0x182/0x200
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
__warn.cold+0x17e/0x180
? __module_address+0x182/0x200
? ftrace_regs_caller_end+0x55/0x55
report_bug+0x15e/0x1c0
handle_bug+0x3c/0x70
exc_invalid_op+0x18/0x50
asm_exc_invalid_op+0x1a/0x20
RIP: 0010:__module_address+0x182/0x200
Code: 01 00 00 48 01 ea 48 39 d3 0f 82 69 ff ff ff 0f 0b be ff ff ff ff 48 c7 c7 e8 5b 1f 85 e8 36 2b 51 02 85 c0 0f 85 d1 fe ff ff <0f> 0b e9 ca fe ff ff 48 83 c4 08 31 c0 5b 5d c3 48 c7 c7 4c d0 ac
RSP: 0018:ffffc9000018eb10 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffffffffa027e086 RCX: 0000000000000001
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffffffff851f5be8
RBP: ffffffffa027e086 R08: 0000000000000000 R09: ffff8883aa7bfa83
R10: ffffed10754f7f50 R11: ffff88812ac63190 R12: ffffc9000018ec00
R13: ffffffffa027e086 R14: ffffc9000018ec40 R15: ffffc9000018ec20
? 0xffffffffa027e086
? 0xffffffffa027e086
? 0xffffffffa027e086
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
module_address_lookup+0x36/0x100
? 0xffffffffa027e086
? ftrace_regs_caller_end+0x55/0x55
kallsyms_lookup_buildid+0x153/0x220
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
__sprint_symbol+0xae/0x1c0
? prepare_ftrace_return+0x162/0x230
? kallsyms_lookup_buildid+0x220/0x220
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
symbol_string+0x2e1/0x390
? ip6_addr_string+0x2e0/0x2e0
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? ring_buffer_lock_reserve+0x392/0xd90
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? __rb_reserve_next+0x487/0x1410
? move_right+0x60/0x60
? 0xffffffffa027e087
pointer+0x444/0x9c0
? resource_string+0x1590/0x1590
? rb_commit+0xef/0x820
vsnprintf+0x44f/0x15e0
? pointer+0x9c0/0x9c0
? __trace_graph_entry+0x155/0x1a0
vprintk_store+0x222/0x800
? ftrace_graph_stop+0x10/0x10
? printk_sprint+0x230/0x230
? vprintk+0x4/0x50
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk+0x38/0x50
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? 0xffffffffa027e087
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
show_trace_log_lvl+0x22b/0x2c7
? 0xffffffffa027e087
? _raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
lock_acquire.cold+0x1f/0x40
? rcu_read_unlock+0x40/0x40
? 0xffffffffa027e087
? 0xffffffffa027e087
? function_graph_enter+0x490/0x490
? ftrace_regs_caller_end+0x55/0x55
_raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
down_trylock+0x17/0x70
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
__down_trylock_console_sem+0x24/0x90
? ftrace_regs_caller_end+0x55/0x55
console_trylock_spinning+0x13/0x220
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x190/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? printk_sprint+0x177/0x230
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
printk_sprint+0x1f7/0x230
? printk_sprint+0x5/0x230
? ftrace_regs_caller_end+0x55/0x55
vprintk_store+0x2e6/0x800
? printk_sprint+0x230/0x230
? vprintk_emit+0x4/0x280
? function_graph_enter+0x2f7/0x490
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x165/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>
? 0xffffffffa027e087
? 0xffffffffa027e087
? function_graph_enter+0x490/0x490
? ftrace_regs_caller_end+0x55/0x55
_raw_spin_lock_irqsave+0x3f/0x60
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
down_trylock+0x17/0x70
? ftrace_regs_caller_end+0x55/0x55
? ftrace_regs_caller_end+0x55/0x55
__down_trylock_console_sem+0x24/0x90
? ftrace_regs_caller_end+0x55/0x55
console_trylock_spinning+0x13/0x220
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x190/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? printk_sprint+0x177/0x230
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
printk_sprint+0x1f7/0x230
? printk_sprint+0x5/0x230
? ftrace_regs_caller_end+0x55/0x55
vprintk_store+0x2e6/0x800
? printk_sprint+0x230/0x230
? vprintk_emit+0x4/0x280
? function_graph_enter+0x2f7/0x490
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x165/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>
=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Tainted: G        W         
-----------------------------
include/trace/events/printk.h:10 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/3/0.

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W          6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
printk_sprint+0x1f7/0x230
? printk_sprint+0x5/0x230
? ftrace_regs_caller_end+0x55/0x55
vprintk_store+0x2e6/0x800
? printk_sprint+0x230/0x230
? vprintk_emit+0x4/0x280
? function_graph_enter+0x2f7/0x490
? vprintk_store+0x4/0x800
? prepare_ftrace_return+0x162/0x230
? 0xffffffffa027e087
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x165/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>

=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Tainted: G        W         
-----------------------------
include/linux/rcupdate.h:765 rcu_read_lock() used illegally while idle!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
5 locks held by swapper/3/0:
#0: ffffffff85114120 (console_lock){+.+.}-{0:0}, at: return_to_handler+0x0/0x40
#1: ffffffff85114518 (console_srcu){....}-{0:0}, at: console_flush_all+0x8a/0x4f0
#2: ffffffff84d93ac0 (console_owner){-...}-{0:0}, at: console_emit_next_record+0x219/0x730
#3: ffffffff856674f8 (printing_lock){....}-{2:2}, at: return_to_handler+0x0/0x40
#4: ffffffff85125e40 (rcu_read_lock){....}-{1:2}, at: atomic_notifier_call_chain+0x9/0x1c0

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W          6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
atomic_notifier_call_chain+0x151/0x1c0
? ftrace_regs_caller_end+0x55/0x55
vt_console_print+0x4f2/0xd50
? function_graph_enter+0x490/0x490
? unblank_screen+0x10/0x10
? ftrace_regs_caller_end+0x55/0x55
console_emit_next_record+0x2d4/0x730
? devkmsg_read+0x670/0x670
? devkmsg_read+0x670/0x670
? prepare_ftrace_return+0x162/0x230
? trace_graph_return+0x1de/0x2f0
? ftrace_regs_caller_end+0x55/0x55
console_flush_all+0x3a3/0x4f0
? ftrace_regs_caller_end+0x55/0x55
console_unlock+0x9a/0x150
? console_flush_all+0x4f0/0x4f0
? vprintk_emit+0x190/0x280
? console_unlock+0x9/0x150
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x1b1/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>

=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Tainted: G        W         
-----------------------------
include/linux/rcupdate.h:793 rcu_read_unlock() used illegally while idle!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
5 locks held by swapper/3/0:
#0: ffffffff85114120 (console_lock){+.+.}-{0:0}, at: return_to_handler+0x0/0x40
#1: ffffffff85114518 (console_srcu){....}-{0:0}, at: console_flush_all+0x8a/0x4f0
#2: ffffffff84d93ac0 (console_owner){-...}-{0:0}, at: console_emit_next_record+0x219/0x730
#3: ffffffff856674f8 (printing_lock){....}-{2:2}, at: return_to_handler+0x0/0x40
#4: ffffffff85125e40 (rcu_read_lock){....}-{1:2}, at: atomic_notifier_call_chain+0x9/0x1c0

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W          6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
atomic_notifier_call_chain+0x187/0x1c0
? ftrace_regs_caller_end+0x55/0x55
vt_console_print+0x4f2/0xd50
? function_graph_enter+0x490/0x490
? unblank_screen+0x10/0x10
? ftrace_regs_caller_end+0x55/0x55
console_emit_next_record+0x2d4/0x730
? devkmsg_read+0x670/0x670
? devkmsg_read+0x670/0x670
? prepare_ftrace_return+0x162/0x230
? trace_graph_return+0x1de/0x2f0
? ftrace_regs_caller_end+0x55/0x55
console_flush_all+0x3a3/0x4f0
? ftrace_regs_caller_end+0x55/0x55
console_unlock+0x9a/0x150
? console_flush_all+0x4f0/0x4f0
? vprintk_emit+0x190/0x280
? console_unlock+0x9/0x150
? ftrace_regs_caller_end+0x55/0x55
vprintk_emit+0x1b1/0x280
? ftrace_regs_caller_end+0x55/0x55
_printk+0xb6/0xe7
? record_print_text.cold+0x11/0x11
? trace_hardirqs_off+0xd6/0x120
? ftrace_return_to_handler+0x260/0x390
? ftrace_regs_caller_end+0x55/0x55
lockdep_rcu_suspicious+0x66/0x165
? trace_graph_entry+0x500/0x7f0
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>
=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Tainted: G        W         
-----------------------------
include/trace/events/preemptirq.h:36 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/3/0.

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W          6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
trace_hardirqs_off+0x115/0x120
trace_graph_entry+0x500/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>

=============================
WARNING: suspicious RCU usage
6.2.0-rc1-00035-gd0067447fa5b #1 Tainted: G        W         
-----------------------------
include/trace/events/preemptirq.h:40 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/3/0.

stack backtrace:
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W          6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<TASK>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
trace_irq_enable+0xfc/0x110
trace_hardirqs_on+0x26/0x50
trace_graph_entry+0x38a/0x7f0
? cpuidle_poll_time+0x4/0x1a0
function_graph_enter+0x2f7/0x490
? ftrace_return_to_handler+0x260/0x390
? ftrace_graph_stop+0x10/0x10
? cpuidle_poll_time+0x4/0x1a0
? trace_irq_enable+0x26/0x110
? cpuidle_poll_time+0x4/0x1a0
prepare_ftrace_return+0x162/0x230
0xffffffffa027e087
? asm_sysvec_apic_timer_interrupt+0x1a/0x20
? cpuidle_poll_time+0x9/0x1a0
cpuidle_poll_time+0x9/0x1a0
poll_idle+0x43/0x9e
cpuidle_enter_state+0x1ca/0xd30
? ftrace_regs_caller_end+0x55/0x55
cpuidle_enter+0x4e/0xa0
? ftrace_regs_caller_end+0x55/0x55
cpuidle_idle_call+0x1ab/0x270
? arch_cpu_idle_exit+0x40/0x40
? trace_graph_return+0x1de/0x2f0
? do_idle+0xa8/0x1a0
? ftrace_regs_caller_end+0x55/0x55
do_idle+0xf3/0x1a0
? ftrace_regs_caller_end+0x55/0x55
cpu_startup_entry+0x1d/0x20
start_secondary+0x237/0x2d0
? set_cpu_sibling_map+0x2590/0x2590
secondary_startup_64_no_verify+0xe0/0xeb
</TASK>
watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [ftracetest:1691]
Modules linked in: openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 btrfs blake2b_generic xor intel_rapl_msr raid6_pq intel_rapl_common zstd_compress libcrc32c x86_pkg_temp_thermal intel_powerclamp coretemp sd_mod t10_pi kvm_intel crc64_rocksoft_generic crc64_rocksoft crc64 kvm sg irqbypass i915 crct10dif_pclmul crc32_pclmul drm_buddy crc32c_intel ghash_clmulni_intel drm_display_helper mei_wdt ahci sha512_ssse3 ttm libahci rapl wmi_bmof ipmi_devintf intel_cstate drm_kms_helper libata mei_me i2c_i801 syscopyarea intel_uncore ipmi_msghandler i2c_smbus sysfillrect serio_raw intel_pch_thermal mei sysimgblt intel_gtt ie31200_edac agpgart video wmi intel_pmc_core tpm_infineon acpi_pad binfmt_misc drm fuse ip_tables [last unloaded: ftrace_direct]
irq event stamp: 7893964
hardirqs last  enabled at (7893963): [<ffffffff81561c96>] trace_graph_return+0x1f6/0x2f0
hardirqs last disabled at (7893964): [<ffffffff838d41bf>] sysvec_apic_timer_interrupt+0xf/0x90
softirqs last  enabled at (7879476): [<ffffffff810f5830>] return_to_handler+0x0/0x40
softirqs last disabled at (7879343): [<ffffffff810f5830>] return_to_handler+0x0/0x40
CPU: 1 PID: 1691 Comm: ftracetest Tainted: G        W          6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
RIP: 0010:trace_graph_return+0x1f8/0x2f0
Code: fb ff ff be 04 00 00 00 48 89 df e8 72 2e 40 00 f0 ff 0b 4d 85 ed 75 0b 5b 5d 41 5c 41 5d 41 5e 41 5f c3 e8 3a 5e ff ff fb 5b <5d> 41 5c 41 5d 41 5e 41 5f c3 e8 d9 5c ff ff e9 2f ff ff ff 65 48
RSP: 0018:ffffc900022f7848 EFLAGS: 00000202
RAX: 00000000007873cb RBX: ffff88811c7ab380 RCX: 1ffffffff0dad97e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff81561c96
RBP: ffffc900022f7898 R08: 0000000000000001 R09: ffffffff86d6c247
R10: fffffbfff0dad848 R11: ffff88810ff8ca90 R12: 0000000000000001
R13: 0000000000000200 R14: 1ffff9200045ef00 R15: ffffffff8525de40
FS:  00007fdc373eb740(0000) GS:ffff8883aa680000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ccad59ea10 CR3: 00000004231da002 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
<TASK>
? insn_get_sib+0x20b/0x290
ftrace_return_to_handler+0x260/0x390
? function_graph_enter+0x490/0x490
? insn_get_modrm+0x4/0x630
? return_to_handler+0x15/0x40
? insn_get_modrm+0x2b3/0x630
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
return_to_handler+0x15/0x40
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? insn_get_displacement+0x294/0x590
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? insn_decode+0x263/0x2a0
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? text_poke_loc_init+0xab/0x450
? cpumask_weight+0x50/0x50
? cpumask_weight+0x50/0x50
? prepare_ftrace_return+0x162/0x230
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? ftrace_replace_code+0x254/0x4b0
? ftrace_modify_all_code+0xbd/0x170
? ftrace_graph_func+0x50/0x50
? ftrace_startup+0x17f/0x300
? __trace_graph_entry+0x1a0/0x1a0
? register_ftrace_graph+0x147/0x190
? graph_trace_init+0x68/0x80
? tracing_set_tracer+0x592/0x840
? lock_is_held_type+0x9c/0x110
? trace_printk_init_buffers+0x30/0x30
? __might_fault+0xc0/0x160
? lock_release+0xe3/0x250
? tracing_set_trace_write+0x128/0x1e0
? tracing_set_tracer+0x840/0x840
? rcu_read_unlock+0x40/0x40
? lock_is_held_type+0x9c/0x110
? vfs_write+0x211/0xc00
? kernel_write+0x500/0x500
? lock_is_held_type+0x9c/0x110
? lock_is_held_type+0x9c/0x110
? __fget_light+0x51/0x220
? ksys_write+0xf7/0x1d0
? __ia32_sys_read+0xb0/0xb0
? do_syscall_64+0x5a/0x80
? do_syscall_64+0x67/0x80
? lockdep_hardirqs_on_prepare+0x19a/0x350
? entry_SYSCALL_64_after_hwframe+0x5e/0xc8
</TASK>
Kernel panic - not syncing: softlockup: hung tasks
CPU: 1 PID: 1691 Comm: ftracetest Tainted: G        W    L     6.2.0-rc1-00035-gd0067447fa5b #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
Call Trace:
<IRQ>
? ftrace_regs_caller_end+0x55/0x55
dump_stack_lvl+0x49/0x5d
panic+0x222/0x45c
? panic_print_sys_info+0x73/0x73
? function_graph_enter+0x490/0x490
? trace_graph_return+0x1de/0x2f0
? trace_graph_return+0x1de/0x2f0
? ftrace_regs_caller_end+0x55/0x55
watchdog_timer_fn.cold+0x11/0x1b
? lockup_detector_update_enable+0x50/0x50
? ftrace_regs_caller_end+0x55/0x55
__hrtimer_run_queues+0x18f/0x8e0
? trace_hrtimer_cancel+0x170/0x170
? ftrace_regs_caller_end+0x55/0x55
hrtimer_interrupt+0x2ca/0x730
? ftrace_regs_caller_end+0x55/0x55
__sysvec_apic_timer_interrupt+0xf5/0x3f0
? ftrace_regs_caller_end+0x55/0x55
sysvec_apic_timer_interrupt+0x6e/0x90
</IRQ>
<TASK>
asm_sysvec_apic_timer_interrupt+0x1a/0x20
RIP: 0010:trace_graph_return+0x1f8/0x2f0
Code: fb ff ff be 04 00 00 00 48 89 df e8 72 2e 40 00 f0 ff 0b 4d 85 ed 75 0b 5b 5d 41 5c 41 5d 41 5e 41 5f c3 e8 3a 5e ff ff fb 5b <5d> 41 5c 41 5d 41 5e 41 5f c3 e8 d9 5c ff ff e9 2f ff ff ff 65 48
RSP: 0018:ffffc900022f7848 EFLAGS: 00000202
RAX: 00000000007873cb RBX: ffff88811c7ab380 RCX: 1ffffffff0dad97e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff81561c96
RBP: ffffc900022f7898 R08: 0000000000000001 R09: ffffffff86d6c247
R10: fffffbfff0dad848 R11: ffff88810ff8ca90 R12: 0000000000000001
R13: 0000000000000200 R14: 1ffff9200045ef00 R15: ffffffff8525de40
? trace_graph_return+0x1f6/0x2f0
? insn_get_sib+0x20b/0x290
ftrace_return_to_handler+0x260/0x390
? function_graph_enter+0x490/0x490
? insn_get_modrm+0x4/0x630
? return_to_handler+0x15/0x40
? insn_get_modrm+0x2b3/0x630
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
return_to_handler+0x15/0x40
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? insn_get_displacement+0x294/0x590
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? insn_decode+0x263/0x2a0
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? text_poke_loc_init+0xab/0x450
? cpumask_weight+0x50/0x50
? cpumask_weight+0x50/0x50
? prepare_ftrace_return+0x162/0x230
? kvm_mmu_uninit_vm+0x4/0x50 [kvm]
? ftrace_regs_caller_end+0x55/0x55
? ftrace_replace_code+0x254/0x4b0
? ftrace_modify_all_code+0xbd/0x170
? ftrace_graph_func+0x50/0x50
? ftrace_startup+0x17f/0x300
? __trace_graph_entry+0x1a0/0x1a0
? register_ftrace_graph+0x147/0x190
? graph_trace_init+0x68/0x80
? tracing_set_tracer+0x592/0x840
? lock_is_held_type+0x9c/0x110
? trace_printk_init_buffers+0x30/0x30
? __might_fault+0xc0/0x160
? lock_release+0xe3/0x250
? tracing_set_trace_write+0x128/0x1e0
? tracing_set_tracer+0x840/0x840
? rcu_read_unlock+0x40/0x40
? lock_is_held_type+0x9c/0x110
? vfs_write+0x211/0xc00
? kernel_write+0x500/0x500
? lock_is_held_type+0x9c/0x110
? lock_is_held_type+0x9c/0x110
? __fget_light+0x51/0x220
? ksys_write+0xf7/0x1d0
? __ia32_sys_read+0xb0/0xb0
? do_syscall_64+0x5a/0x80
? do_syscall_64+0x67/0x80
? lockdep_hardirqs_on_prepare+0x19a/0x350
? entry_SYSCALL_64_after_hwframe+0x5e/0xc8
</TASK>
Kernel Offset: disabled

--viJYB+6GwMZTqtAj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/kernel-selftests.yaml
suite: kernel-selftests
testcase: kernel-selftests
category: functional
need_memory: 2G
need_cpu: 2
kernel-selftests:
  group: ftrace
kernel_cmdline: kvm-intel.unrestricted_guest=0
job_origin: kernel-selftests.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-skl-d06
tbox_group: lkp-skl-d06
submit_id: 63b7a32bd2ddbf50a51fec58
job_file: "/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-20645-1gjy0ke-0.yaml"
id: 521335a9e53db59d3dfc16b632c6341b96ecaace
queuer_version: "/zday/lkp"

#! hosts/lkp-skl-d06
model: Skylake
nr_cpu: 4
memory: 16G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
hdd_partitions: "/dev/disk/by-id/ata-WDC_WD10EARS-00Y5B1_WD-WCAV5F059074-part*"
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402M81P2GGN-part2"
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402M81P2GGN-part1"
brand: Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz

#! include/category/functional
kmsg:
heartbeat:
meminfo:

#! include/queue/cyclic
commit: d0067447fa5bdd65ec4f7a5737581362641f7611

#! include/testbox/lkp-skl-d06
need_kconfig_hw:
- PTP_1588_CLOCK: y
- E1000E: y
- SATA_AHCI
- DRM_I915
ucode: '0xf0'
bisect_dmesg: true

#! include/kernel-selftests
need_kconfig:
- FTRACE: y
- KPROBES: y
- FUNCTION_PROFILER: y
- TRACER_SNAPSHOT: y
- STACK_TRACER: y
- HIST_TRIGGERS: y
- SCHED_TRACER: y
- IRQSOFF_TRACER: y
- PREEMPTIRQ_DELAY_TEST: m
- MODULES: y
- MODULE_UNLOAD: y
- SAMPLES: y
- SAMPLE_FTRACE_DIRECT: m
- SAMPLE_TRACE_PRINTK: m
- KALLSYMS_ALL: y
rootfs: debian-12-x86_64-20220629.cgz
initrds:
- linux_headers
- linux_selftests
kconfig: x86_64-rhel-8.3-kselftests
enqueue_time: 2023-01-06 12:27:24.107145022 +08:00
_id: 63b7a32bd2ddbf50a51fec58
_rt: "/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: 3d2e24559dfd0f232b94f0e6005ab346f50b92b2
base_commit: 1b929c02afd37871d5afb9d498426f83432e71c2
branch: linux-devel/devel-hourly-20221230-234832
result_root: "/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/0"
scheduler_version: "/lkp/lkp/.src-20230105-101809"
arch: x86_64
max_uptime: 1200
initrd: "/osimage/debian/debian-12-x86_64-20220629.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/kernel-selftests/ftrace/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b
- branch=linux-devel/devel-hourly-20221230-234832
- job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-ftrace-debian-12-x86_64-20220629.cgz-d0067447fa5bdd65ec4f7a5737581362641f7611-20230106-20645-1gjy0ke-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-kselftests
- commit=d0067447fa5bdd65ec4f7a5737581362641f7611
- kvm-intel.unrestricted_guest=0
- initcall_debug
- nmi_watchdog=0
- max_uptime=1200
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw

#! runtime status
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/modules.cgz"
linux_headers_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/linux-headers.cgz"
linux_selftests_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/linux-selftests.cgz"
bm_initrd: "/osimage/deps/debian-12-x86_64-20220629.cgz/run-ipconfig_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/lkp_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/rsync-rootfs_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/kernel-selftests_20221205.cgz,/osimage/pkg/debian-12-x86_64-20220629.cgz/kernel-selftests-x86_64-2ed09c3b-1_20221128.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/hw_20221125.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220804.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /db/releases/20221231210738/lkp-src/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 4.20.0
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/d0067447fa5bdd65ec4f7a5737581362641f7611/vmlinuz-6.2.0-rc1-00035-gd0067447fa5b"
dequeue_time: 2023-01-06 12:42:10.710591884 +08:00

#! /cephfs/db/releases/20230105220729/lkp-src/include/site/inn
job_state: finished
loadavg: 0.95 1.62 1.16 1/132 11187
start_time: '1672980247'
end_time: '1672980811'
version: "/lkp/lkp/.src-20230105-101855:873a77c5e:b72907a82"

--viJYB+6GwMZTqtAj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

ln -sf /usr/bin/clang
ln -sf /usr/sbin/iptables-nft /usr/bin/iptables
ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables
sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
make -C ftrace
make quicktest=1 run_tests -C ftrace

--viJYB+6GwMZTqtAj--
