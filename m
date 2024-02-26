Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58C12AAC8
	for <oe-lkp@lists.linux.dev>; Mon, 26 Feb 2024 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708958311; cv=fail; b=O70aJYaJlDFL9Mn4lzvJZqjdGJilZuPm67hxuKZjHOH7sTAsYawXqq7asXlfpjTOMDzMLMiGx1zXv4jWH1oq2xTIz8vNWQaJf6hsenxXcU2v6bCx6dzdMIuAbvuEtfdNSdpED7V/JmursmSOEYaznGvgMTjl2jXsdAbukPdiQmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708958311; c=relaxed/simple;
	bh=ODbijyk9hJugJQuTyzjfGnlkGaLZQ+R/LhQ9dnWq+YA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uc6ehjU63HmgjiBxlyhCqkywpMGkHcWxOJwpEQwXH22riNP4Ku5jyBmuFsmg+IbkhotFYRo8g2I+GEd1RBQEOuB7QTuyh5CeVz+pf17YKOmz7Frfr9xr0mT8iEs3NfZIE82Kh2esT2rz6XhqUDud3d0vylUpQdYRHHFJq2yayi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfL/3qQg; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfL/3qQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708958309; x=1740494309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODbijyk9hJugJQuTyzjfGnlkGaLZQ+R/LhQ9dnWq+YA=;
  b=jfL/3qQgDcGvYRgjLlnMBV8hc1xNgeDzKLyxkft7mVJawcOmADvKIINy
   SgYVmfiOhIv7Blxuygjpe+ixWajnReG1WgKKy/wPT28ZZGq7QiG1dkByH
   IESzK2ViYjdBRJ4Y5wKO8hrCnLRWktGD+ka13NBpNIlx+X4y/RD+BAd4M
   AQaKPksffsELaCLzd5ffBm050J+WxyU/lnGxPlXKMdpvYfOFrySsqaYEe
   SocvI4yYiHbRDT7OjW4DNGChxSA4GRb3t8iUfJHCExU34MfgLSkqPpzGk
   sEVedGxIYmmL39q/KtQDgLmx9xLhLuZ4fmZEo4IB+iZwBJ14eKkc9RIAv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13801991"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="13801991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6571978"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Feb 2024 06:38:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 06:38:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 06:38:21 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 06:38:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thju0f3+s7VZEH0etxGZcOai0Ku4yJf2vVuH/5KUYlDwGCnyLok8FGofc55hLWQ82FSrwJEICJJ3Rv9tOeZwEzQZpgXf2688g8hA6RM0cDyZKallbbeXNTS4QRBQa+x5ElQ1rtEEJY+ZFbrlMG9Yx6mcs5B6t+8iL/xb4oL0Y2RURZO1Vsbbg0r2Z+WYdSv43dDdl9vTd3vTFJKEeSCJyg03rv9C6End1elDXs4QhUi6/ZsoQXn282jlf/7A/KIqJhS6R9Vd+Bo4CZoh+Q+2NKB5m5MNN0gaIDyUSpNdh3kY3/4GXlJvNeTbJmeXG+OgvSyiLY0M6siJZtUVeyHnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m78KLocZ5hFUiBKMtxOF9NKprJc2YP21jpH3FZwwgUk=;
 b=Cu63ag47UH+T2l1mf/vcOq2gS77ETQWN+Nht1yU1bQLPXPG91GX7aDgbaEo8I/Wttr0KcEA/vtyzspd9f5Anj6BoM6UhE4joVVAm/cu77tj5tqrqL6gECnIX1IW8ydq/gvFGH4AtAM72mCzsWS+iSddBRU4LpIreBqoX5TxE0BcUQrKfDqG0JNKPfdKdJ90oHccxT355Q1z7Uta7klBn8YhCaovZUDDqv4qCSNIrGx6lVDPcPuqEqF2SgwWBi0rkxRX9D+1NJOq8t6dvkNNcAx9krBqZsSqgy6VRpsYwZlTWeiM7vLL4++rA+OxAn5D/88Z7w0Y0YirB2ENgHYWu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Mon, 26 Feb
 2024 14:38:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.009; Mon, 26 Feb 2024
 14:38:18 +0000
Date: Mon, 26 Feb 2024 22:38:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:pcp_test]  8991ea0d3b: kernel_BUG_at_mm/page_alloc.c
Message-ID: <202402262127.e8ae2f80-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: d7405ae9-6580-4ff6-c5ff-08dc36d892b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2CPtcg2ZjVu1bCnx1iZo00dH0yiYfXLZvozs9mxP6ba7mZiyD/LlU3zNnkXjL5eGJHjniKPMCa0mJHhrLBl3voAbu52P/WjftzGN6PBLmoyFShHkrDc6p6faf4UNmdtWJ/UBm+K9CCI7zkVWZFdsHCPOdz2FgzOIunZ9zYBtdo85bjA5ubvHu+KKCPx9fEuKGZAhHbJIQp2jbDMcCUU19BcHs2jrm9RDr5Y9pCx20V4l5R7IuRmPxl/HqoK4ujkKJRtUkdVqnEA8BLrMEIwtwsCKQQkKpXQ3kixct8klJhGrjPUNEDWna3pg3AMuRKm8HIiH5YLp4RtDraKz1yirBMO/blHVMf3e0dQJADc2AI5M8LRh0nnQmOhSrZrsSeIq9qh6oVbwkC3YocSjxNzjtCK/qWsRMMvpuL+1mqKrAdmWD4v/twhL6BbF0YBVGjxNdyziHMvkpr/YFuwFbrXF1BTO+lShNAUN7qOeA8e5rywMZZSw5vN65I9sjunNK521dSrj1n/iRFNvGEOcBhy2GApIwxEQQgmGPgPSS+UbhPBU+eJDl0X53hbd8pTRSljvlJyTt50J26x6LhuQQbfVFLHf/AFjojS0jIBK0KXHqydGSmTMuFWrI55nWVtdStnI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucjNtBu6A5z4za90VKD/ZJytjLz0aZc8qyCmHyimcqAwYNqqi6Wfnps6GlHt?=
 =?us-ascii?Q?relCPwTBeK2sMQigZTMQIM0jNmAnAbLh1f9D6kEi7fh1W404iWr9lKbquly7?=
 =?us-ascii?Q?tmZIKYCvRbF2Wo99/U6qnxQZjZJDXmwstHBTxl3rKqYHPMyZmVY2NpJ0Md6L?=
 =?us-ascii?Q?eTQ3P4dvIv803IX7//hzCfJSFeMeqken3RPINCd3QN2jcjYjwAWkudrawORO?=
 =?us-ascii?Q?xOSieV8eYK6qqaJTAki9cuqACM0+dYQj2c9eMjdPfD0d+4AtbU9nipKc/VtR?=
 =?us-ascii?Q?acEMjQQKKq+/ijNlysC7U5UtdcGd+FkhOSUcnUOAEdUhUZvabmVAl9pknC/6?=
 =?us-ascii?Q?eiUuw2hCh9jMn9V49yOgUstBn2ct2iQoKGuF4v5A4UYbjNtKwONGyZj1noV6?=
 =?us-ascii?Q?AGYok6o2mMKOdsvzHba42Lt76xee2cQCImXBSkT3cn9+gpt6dCqWqSc01YJD?=
 =?us-ascii?Q?WSbuopUxESS+Q0YP7HJWfLtt8FhdTmL5kCB/NPH0GNFTD1VNKRuExtgxxRs7?=
 =?us-ascii?Q?UnoN4DuqD+vUanf7ZA5R1uu90W3GJnGIZVkRYdgdP8QbAOsLHPQdg9m8ZOr/?=
 =?us-ascii?Q?mKkxK6NagtDfgUen2yJtkGhY6mwKANq9PTb4ZIpQjfxUIh1RxERjI0iBzKWA?=
 =?us-ascii?Q?1WgSO7UhjlErgttY7DqqRQBSyf7MDXU/uGvhfu2tk9zaCIRUWkPK7NWtH8Gl?=
 =?us-ascii?Q?PmkdXMwcNxbh/5LHZ6su1f2gzPfhjBwgWXADWEo1eZ9Uw6ri76U+0U0OY6YZ?=
 =?us-ascii?Q?2lqqZ+ORwjYVkXshXZyR4ezKrz4osbsD2ZrcGEZ7d97u5/IU4CyDd84bwXFP?=
 =?us-ascii?Q?yVHLKuwhnOmvxi7VKfFBRH4cX40yYA6j/YW9/Rv9BSbI9s4hHUettr+V2CIB?=
 =?us-ascii?Q?yxi+iFFckqBbCniuFs8SjHnvLPiS7J0wt4wfOZ+pTkWi1u42p0ZBh2K7WZ3a?=
 =?us-ascii?Q?/2wX6YOPnOQdi1wOglNBRN2NIflV6x/XA3WS4KISfkgyiJ97Y/Q5e5k1+o/W?=
 =?us-ascii?Q?P5vHxIf7hTL1s742iBn9BPthtHGUsmcEDw7zfIFE0UOOt0RVxPDdE/Ftndrs?=
 =?us-ascii?Q?U49usv6prs37T5Tw2DSdzee1m9oOPfOWqt7gC5chU0Gg4gPniu5MrVtMHp2/?=
 =?us-ascii?Q?d8pEjG0+egrP1gOO1zu9e7Td0DMmvc5281nkStzBcUvkducUiyPcv3LKxlmY?=
 =?us-ascii?Q?dH0TrHnfSglpBOocLPR8Pgm+f0zZAer7m77nsLNBuYIukKEG/IQCPeJ3T2KI?=
 =?us-ascii?Q?vdVo/igj8lK6s91A6r1zE+10QXaFNgW9uuCRqv0HJ9pMpsI8B/AoUDWTaRap?=
 =?us-ascii?Q?Wi5/gKYJ0CMlLs70MUw8kmPShl6ntSM5sI21YZWnP2p2jCtE4wju6L/rMB5k?=
 =?us-ascii?Q?KpWq4NcgKpWNGhtMLFUHORBMIU48dkyVWPpZ6feHoucWD7X7V+MoNcnf4CAG?=
 =?us-ascii?Q?Wi1WkdZJ+UrnYS+GagffHaYJ01q4otz678eJVSUkiQpXixnhj1yNJgOi4y7m?=
 =?us-ascii?Q?di8h9yY/6i+EC0wrp7DRxmuIALwgbAIyljH9scCQT02yB6J9t1ELgny/jbNK?=
 =?us-ascii?Q?xuQ3zWHij2dmjW8QdLOx544Ka9M5BaJl+S3O77/Vy75gcrFZCN9jHzX/oj1w?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7405ae9-6580-4ff6-c5ff-08dc36d892b7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:38:18.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSZXuwx0uIP3jUj0xf5ItO2wPybnl63GoE3Z3cOewjhvLkveJAmbW35huwfB/p2opy7zW0KPMkmB14O9FhPQzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_mm/page_alloc.c" on:

commit: 8991ea0d3bba6e332066006c4d225a8ed579c715 ("pcp page split")
https://github.com/gestionlin/linux.git pcp_test

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | 1eaa1d5e01 | 8991ea0d3b |
+------------------------------------------+------------+------------+
| boot_successes                           | 13         | 0          |
| boot_failures                            | 0          | 13         |
| kernel_BUG_at_mm/page_alloc.c            | 0          | 13         |
| invalid_opcode:#[##]                     | 0          | 13         |
| RIP:__rmqueue_pcplist_split              | 0          | 13         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 13         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402262127.e8ae2f80-lkp@intel.com


[    8.841950][    T0] ------------[ cut here ]------------
[    8.842971][    T0] kernel BUG at mm/page_alloc.c:2842!
[    8.843990][    T0] invalid opcode: 0000 [#1] SMP
[    8.844869][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc5-00331-g8991ea0d3bba #1
[    8.845853][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 8.845853][ T0] RIP: __rmqueue_pcplist_split+0x3d5/0x440 
[ 8.845853][ T0] Code: 8b 4c 24 28 4c 8b 44 24 20 8b 4c 24 18 44 8b 54 24 14 48 8b 3c 24 e9 5e fe ff ff 48 c7 c6 18 d7 f8 88 4c 89 f7 e8 eb a6 fc ff <0f> 0b 44 89 ca 44 89 ee 4c 89 f7 4c 89 44 24 18 89 4c 24 14 44 89
All code
========
   0:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   4:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
   9:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   d:	44 8b 54 24 14       	mov    0x14(%rsp),%r10d
  12:	48 8b 3c 24          	mov    (%rsp),%rdi
  16:	e9 5e fe ff ff       	jmp    0xfffffffffffffe79
  1b:	48 c7 c6 18 d7 f8 88 	mov    $0xffffffff88f8d718,%rsi
  22:	4c 89 f7             	mov    %r14,%rdi
  25:	e8 eb a6 fc ff       	call   0xfffffffffffca715
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	44 89 ca             	mov    %r9d,%edx
  2f:	44 89 ee             	mov    %r13d,%esi
  32:	4c 89 f7             	mov    %r14,%rdi
  35:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  3a:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
  3e:	44                   	rex.R
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	44 89 ca             	mov    %r9d,%edx
   5:	44 89 ee             	mov    %r13d,%esi
   8:	4c 89 f7             	mov    %r14,%rdi
   b:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  10:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
  14:	44                   	rex.R
  15:	89                   	.byte 0x89
[    8.845853][    T0] RSP: 0000:ffffffff89403bc0 EFLAGS: 00010296
[    8.845853][    T0] RAX: 0000000000000000 RBX: ffffea0004119e08 RCX: ffffffff89403b34
[    8.845853][    T0] RDX: 0000000000000001 RSI: ffffffff8984d940 RDI: ffffffff89462890
[    8.845853][    T0] RBP: ffff88842fc32bc0 R08: 0000000000000000 R09: 0000000000000002
[    8.845853][    T0] R10: 00000000a5fa65bd R11: 00000000f812dbd9 R12: 0000000000000004
[    8.845853][    T0] R13: ffff88842fc32c38 R14: ffffea0004119e00 R15: 0000000000000001
[    8.845853][    T0] FS:  0000000000000000(0000) GS:ffff88842fc00000(0000) knlGS:0000000000000000
[    8.845853][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.845853][    T0] CR2: ffff88843ffff000 CR3: 000000039d68c000 CR4: 00000000000406f0
[    8.845853][    T0] Call Trace:
[    8.845853][    T0]  <TASK>
[ 8.845853][ T0] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 8.845853][ T0] ? do_trap (arch/x86/kernel/traps.c:113 arch/x86/kernel/traps.c:154) 
[ 8.845853][ T0] ? __rmqueue_pcplist_split+0x3d5/0x440 
[ 8.845853][ T0] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:175) 
[ 8.845853][ T0] ? __rmqueue_pcplist_split+0x3d5/0x440 
[ 8.845853][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:266) 
[ 8.845853][ T0] ? __rmqueue_pcplist_split+0x3d5/0x440 
[ 8.845853][ T0] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 8.845853][ T0] ? __rmqueue_pcplist_split+0x3d5/0x440 
[ 8.845853][ T0] rmqueue+0x476/0x1780 
[ 8.845853][ T0] ? free_unref_page (arch/x86/include/asm/preempt.h:84 mm/page_alloc.c:2509) 
[ 8.845853][ T0] ? __lock_release+0x67/0x180 
[ 8.845853][ T0] ? validate_chain (kernel/locking/lockdep.c:3762 kernel/locking/lockdep.c:3782 kernel/locking/lockdep.c:3837) 
[ 8.845853][ T0] get_page_from_freelist (mm/page_alloc.c:3391) 
[ 8.845853][ T0] __alloc_pages (mm/page_alloc.c:4654) 
[ 8.845853][ T0] allocate_slab (include/linux/gfp.h:238 include/linux/gfp.h:261 mm/slub.c:2190 mm/slub.c:2354) 
[ 8.845853][ T0] slab_alloc_node+0x13e/0x2c0 
[ 8.845853][ T0] kmalloc_trace (mm/slub.c:4010) 
[ 8.845853][ T0] kernfs_create_root (fs/kernfs/dir.c:959) 
[ 8.845853][ T0] sysfs_init (fs/sysfs/mount.c:101) 
[ 8.845853][ T0] ? sysfs_init (fs/sysfs/mount.c:101) 
[ 8.845853][ T0] mnt_init (fs/namespace.c:5186) 
[ 8.845853][ T0] vfs_caches_init (fs/dcache.c:3184) 
[ 8.845853][ T0] start_kernel (init/main.c:1057) 
[ 8.845853][ T0] x86_64_start_reservations (arch/x86/kernel/head64.c:543) 
[ 8.845853][ T0] x86_64_start_kernel (arch/x86/kernel/head64.c:485 (discriminator 17)) 
[ 8.845853][ T0] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:461) 
[    8.845853][    T0]  </TASK>
[    8.845853][    T0] Modules linked in:
[    8.845862][    T0] ---[ end trace 0000000000000000 ]---
[ 8.846851][ T0] RIP: __rmqueue_pcplist_split+0x3d5/0x440 
[ 8.848228][ T0] Code: 8b 4c 24 28 4c 8b 44 24 20 8b 4c 24 18 44 8b 54 24 14 48 8b 3c 24 e9 5e fe ff ff 48 c7 c6 18 d7 f8 88 4c 89 f7 e8 eb a6 fc ff <0f> 0b 44 89 ca 44 89 ee 4c 89 f7 4c 89 44 24 18 89 4c 24 14 44 89
All code
========
   0:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   4:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
   9:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   d:	44 8b 54 24 14       	mov    0x14(%rsp),%r10d
  12:	48 8b 3c 24          	mov    (%rsp),%rdi
  16:	e9 5e fe ff ff       	jmp    0xfffffffffffffe79
  1b:	48 c7 c6 18 d7 f8 88 	mov    $0xffffffff88f8d718,%rsi
  22:	4c 89 f7             	mov    %r14,%rdi
  25:	e8 eb a6 fc ff       	call   0xfffffffffffca715
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	44 89 ca             	mov    %r9d,%edx
  2f:	44 89 ee             	mov    %r13d,%esi
  32:	4c 89 f7             	mov    %r14,%rdi
  35:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  3a:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
  3e:	44                   	rex.R
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	44 89 ca             	mov    %r9d,%edx
   5:	44 89 ee             	mov    %r13d,%esi
   8:	4c 89 f7             	mov    %r14,%rdi
   b:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  10:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
  14:	44                   	rex.R
  15:	89                   	.byte 0x89


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240226/202402262127.e8ae2f80-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

