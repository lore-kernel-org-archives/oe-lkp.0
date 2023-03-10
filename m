Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0E7E6
	for <oe-lkp@lists.linux.dev>; Fri, 10 Mar 2023 02:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678414073; x=1709950073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6tZ3MZVrHnx2a1c+ZP/oB4nVVlI+lDBKU/94GG+JNQ=;
  b=jCwcet0Rgu2IL5xFvFx+tTgaPFkYimygkSqEZzRGUZCZv0IG64XmtRhy
   oj8K/TIZGrtx4k3N7rBIZz8O/8o1OX6Ruljzb96uF8j9uKa+ISBYPCweN
   Yjix6V5vDAAqD++oajYCRV5vs40N6+mIIIhomIPAdCZBTc/cyzvDnH9XQ
   7ZbR4oRgUjZjUIorcmeYD5VdvyOV6NDMd+wtScfjFbYk+42jMaPGKSGNj
   ceP6GSxneBcCmO0wSoSIanQwMAlDx2uoWTfjmSsKwKpnQ4XmyjQ8afHzH
   zG7FSVxjX1YgPZXqZW27RT5ou+29s3zIY8AB1HEv/ImlU9Ug3RZHA5uq2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422892552"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="xz'341?yaml'341?scan'341,208,341";a="422892552"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 18:07:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746538110"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="xz'341?yaml'341?scan'341,208,341";a="746538110"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 18:07:34 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 18:07:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 18:07:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 18:07:33 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 18:07:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU7GdMTcwEYRgr1xWd9pMuQFHZB4Vuq9BUgiybUvxX76SnRyK2EqFSf9VHnBCkLlDSLV0atISD5bQXjzBpdtU9ro4zi30iePn0SOcXxbE9nGzuV8ntN9hEvPt4uPInbmjdEa35N+8rjJdzp/T9Ho8MhiiVqxQYIetY9++oML/sE65wQIyi6GU227uFik+R8PLewD+unPyz79+RKbOfFVWPvzJrmP1LRX5Ddw/+DTY4aIy2f3HAuhFFEEAHo+xdmzfY+QsYAUGh1/M8dcNfXTIniBECcF8O5JyjAVcO5Fjfkt04NxV19/yVIZtnhhpOvdGZHb+45oClc6sOpvTPw+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYGwdz4TSbAT/aP4W8Xoz3ljlDCKLQrtwKhAds7sPfg=;
 b=hnqVvEjjR6Dk301LcUjgirsxsYd2MdIGwop6Vwqqkx1ofdnPckfRpB0FCLZmzR3dL/PYgYNoNcD9bJE3r9ytWMEqnvWKEEZwluCIjDPOm1VpGmmVCr0zE1FUNau2e7BckZcnn4rV/7yBAMBgpaQGCetBH5/FH+Fz+pSuCQV58wHm3HuyUx3vYM8RYRE04xFPvUEZIkuvN3PQptBIi+kuaLNK7hxVws8A+FAvZtn6Q6dzNnvpRhUu5lSkT+usQ7vJnJRs/6mao/h6Z1UQ73hyEdMWTG+HBJOzzbZiuRp+rSYDEWMAa/vw9O9P90idsKWNzTT2azDo20QuhH/MYz7SoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BN9PR11MB5467.namprd11.prod.outlook.com (2603:10b6:408:100::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 02:07:22 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e%3]) with mapi id 15.20.6156.028; Fri, 10 Mar 2023
 02:07:22 +0000
Date: Fri, 10 Mar 2023 10:04:33 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: [hch-misc:filemap_get_folio] [mm] ef2f3f98fc:
 BUG:KASAN:null-ptr-deref_in_mincore_page
Message-ID: <202303100947.9b421b1c-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="MuXUmVDMr7gP5Pe2"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BN9PR11MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: e4622a53-6008-4664-a647-08db210c2eeb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Py7snc/l1jVLDuPZE1ghhd5gBmMHKqZUgaXx5UlFWEh14wDoc5ostLpX0QmN1cKl01N8wq9kOYbwcq8IAfpvKWNQN7laiAMcBvrKf4MV9eaYZ7n+UnY3B4p4Z+/avyi++TOoifKoQcrv+b3Fxyi0hwFAB0mPRAe+o8Iggut1HyJsCIyquqbmiiE4y9AvB5JlcIF+BX1c2vOlZvMj93TSe/0X9lbCN9Iwdiqz8V5TsPPtQnhZqxvzgBJfNFrrI2umtULK3EfQmuIUN63THCGY4wq8XEEcpJD5d1Bh/LiOhA6KWufyUgeS0RLhXS6CVNQ2zuX1wN+d+vgG9zUnVflUTI0s/n57GWF/3Ill+a+2xxKhvd4i8r6/EZYYw/YJk1bc9uDzf1Gp3TyunuTokyjKu/fDdebfZpFuicsXmpxI3XonREh23vt1PTE2IVoI50b7XUMDzpVDKFHZGA+r9zqUwk3VNlKYuQBrefZxGqBV4NoR+xia5bbvy8Kmw4wvDdaNRAcmxjF9595+oNGcjofgu2uv+qHKQ+zbygdpvC1qxS4sedpaINmKlbqOCJFIPYXyO7gHTOBos6qW77zJbfuNs8N7lk5WvYVCXn/mXo1MExXzXtX+FWGPkbMwLzvqk4MgjRFA13okPGeNJbjLV/jg0odz/JXgBp078XUbjpFwtaPl+dmIeZKvSpaCVTetnOhk8BUu56fL07bX0uPN842XHcUZolcfJTyu3Aa9aku/9y4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199018)(66946007)(2906002)(5660300002)(235185007)(26005)(1076003)(8676002)(36756003)(8936002)(4326008)(66476007)(66556008)(6916009)(316002)(86362001)(478600001)(966005)(6486002)(38100700002)(6666004)(82960400001)(44144004)(6506007)(41300700001)(6512007)(21490400003)(2616005)(186003)(83380400001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FIkmlK4nI+S48Ahaw0rtTEIQ8By3p2AvShLNKG24zoV2cE/fe3OEh9g4K+ld?=
 =?us-ascii?Q?ZnxRHBHgJe197xrD2FUKm+WxbUnOmf0a8NozwEYGJzcB9qepNbWlE6weIPvT?=
 =?us-ascii?Q?dwYAFuk6IfCYKRHTw5IsfK03ZKIKHJF0h3UGOKjVWJ7AvNQiUgPD1f9HAZpA?=
 =?us-ascii?Q?e8aN7wKSCtRfAvAIVbBzyDkz3CFrK3eoJZ8kgnbfFW+F72uaQD7MRPc86Q7T?=
 =?us-ascii?Q?NvOgkDg9utlgs3tiDqBmjO4IA/M0esvHQnG6hm4LlYVkw8pj189hoTEErPll?=
 =?us-ascii?Q?0whedn38gqhvpL3N5UmcB/RRdEnyOihLeFwj5Xkj4ddQRBj7bE1ctGwxsNB3?=
 =?us-ascii?Q?EOeT8q/D4CikqE5rCL+sHuaHPKeAQybGP3z0EskNTufCewEotcvZ/iEdy2vr?=
 =?us-ascii?Q?wcWWM2RdIPu3bPk8wtY3ebECKr/Ext9FR5ev2+wzJQBl9vBcEtb7bQEilPe4?=
 =?us-ascii?Q?P0muLGtURCX3wzqSIyB6472wfNP9carY8ibqRTfYyS5LSfg+FCXK3EP8WLp6?=
 =?us-ascii?Q?TZoiaV/u1WCry/PiOioC+e6xCs7xLln16hl0P9yiTYp8wgP0DK6Mp+luFVd6?=
 =?us-ascii?Q?gmAsNAndM5vqI8bDOliT2QDyAfl98eehZGWEZn2Duk+nPGX8Ff70w6DhxyDg?=
 =?us-ascii?Q?yhJbrNA+3vRlrQNNcnut3qG9zbbdeoGe37/jyT4mCkL4y7lg87lqXI7hL8er?=
 =?us-ascii?Q?Ef7vp+SRacD9UdwYLj7KRYlNeKe8qmrRmK0c1U6SH9eZ8b7wLIUYu7f6SpCM?=
 =?us-ascii?Q?NHrBiJvs+ZhhumP6ivseDZNL7ZLHIvpflotMYHqE8rkzXa+Sv8WNwZH4bRAZ?=
 =?us-ascii?Q?Fr53oYLs6AkprIHMdiPV2SdZ3em08rH3EIu2JszviR4htM6+D2AjBf7yuUvQ?=
 =?us-ascii?Q?dPcAl0eMTXcHTj0uhlZA4ciS9OSLwbXB9h1b2WPtqWK6Qz0PmffLqk3qKHHT?=
 =?us-ascii?Q?gdkBP8lNHu64eg45w9vYFW9RhlG92n5pUsxuPq43IsDHhX+6dft89iTrOhXy?=
 =?us-ascii?Q?kxh6vvPhiPwlv0KEwkG+h7dftK1gsaLJMyuUqohM12Wuvn50wVWCa/K+f6K6?=
 =?us-ascii?Q?t8zGOcfc7uXc+DQOATCo1m5MhwIuBcr6n6Vq7jlY03EnnSHdmug/ZgL00uMW?=
 =?us-ascii?Q?9ayD2f98h9ny+IhqpUbx+hx+1/RXWpzIaheP5dNi5uBioz0eFBH1tct87CpM?=
 =?us-ascii?Q?p4eaBDqg/btZSxqQQRML7+68o3WvPYhlOvAPxm+5VNUyV1tgbazXK3z/NtZg?=
 =?us-ascii?Q?1PgMHm7BUIrcF34mI2bkJDVeoFuPmk7Ai4PoUSPFiDyPDzSwE/1wpip0NpNY?=
 =?us-ascii?Q?BwUWOH4jKTPHRSvmtoRsQeZpX8oUNtcw9XG0RWuMEKY7BnMb+su55Kz3nnwN?=
 =?us-ascii?Q?Lw/xE6/XOlTf9jg+cO2YjiI6MKWn1F2WeldJ/U8xGK1+fJUewcLbUyJenBNN?=
 =?us-ascii?Q?8kYTVLfjQpqP61ThmEjlIvP8ocuPeA7BuGg1RvdF3INMqgGhLnUZn9WRyy1A?=
 =?us-ascii?Q?8QHaCQFSfQhgzxQe6mMEo7vJjPNN3jX6hzQ9xuF5J4R9EFj5Vu206ECxNM05?=
 =?us-ascii?Q?vqfCweCTEIgTZLjQ08r4h05T/hUDqT0YTsWEuSL8nHxvz39Vu6bbPg7iA7YU?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4622a53-6008-4664-a647-08db210c2eeb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 02:07:22.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmNDr8Q5ZFFtRVeusMjRtipS6WfBQiFVwme5NzaqgUmfOouOt2ksPKs1iwSUDetde57sJ6k5Bn8J3TkIc78LVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5467
X-OriginatorOrg: intel.com

--MuXUmVDMr7gP5Pe2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Greeting,

FYI, we noticed BUG:KASAN:null-ptr-deref_in_mincore_page due to commit (built with gcc-11):

commit: ef2f3f98fcf4521aa00fd217089e303b7d9b62ba ("mm: return an ERR_PTR from __filemap_get_folio")
git://git.infradead.org/users/hch/misc.git filemap_get_folio

in testcase: kernel-selftests
version: kernel-selftests-x86_64-d4cf28ee-1_20230110
with following parameters:

	group: group-02

test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
test-url: https://www.kernel.org/doc/Documentation/kselftest.txt

on test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202303100947.9b421b1c-yujie.liu@intel.com


[ 125.329893][ T1810] BUG: KASAN: null-ptr-deref in mincore_page (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:712 mm/mincore.c:65) 
[  125.336589][ T1810] Read of size 8 at addr 0000000000000000 by task mincore_selftes/1810
[  125.344683][ T1810]
[  125.346874][ T1810] CPU: 2 PID: 1810 Comm: mincore_selftes Not tainted 6.3.0-rc1-00007-gef2f3f98fcf4 #1
[  125.356256][ T1810] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[  125.365828][ T1810] Call Trace:
[  125.368971][ T1810]  <TASK>
[ 125.371773][ T1810] dump_stack_lvl (lib/dump_stack.c:108) 
[ 125.376135][ T1810] kasan_report (mm/kasan/report.c:538) 
[ 125.380324][ T1810] ? mincore_page (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:712 mm/mincore.c:65) 
[ 125.384684][ T1810] ? kasan_check_range (mm/kasan/generic.c:188) 
[ 125.389562][ T1810] ? mincore_page (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:712 mm/mincore.c:65) 
[ 125.393925][ T1810] ? __mincore_unmapped_range (mm/mincore.c:83 (discriminator 3)) 
[ 125.399506][ T1810] ? mincore_pte_range (mm/mincore.c:150) 
[ 125.404474][ T1810] ? walk_pmd_range+0x276/0x760 
[ 125.409805][ T1810] ? lock_downgrade (kernel/locking/lockdep.c:5321) 
[ 125.414511][ T1810] ? walk_pte_range+0x4d0/0x4d0 
[ 125.419831][ T1810] ? lock_is_held_type (kernel/locking/lockdep.c:5410 kernel/locking/lockdep.c:5712) 
[ 125.424722][ T1810] ? walk_pud_range+0x27d/0x5d0 
[ 125.430043][ T1810] ? mas_find (lib/maple_tree.c:6446) 
[ 125.434228][ T1810] ? walk_p4d_range (mm/pagewalk.c:241) 
[ 125.438970][ T1810] ? __lock_release (kernel/locking/lockdep.c:5345) 
[ 125.443676][ T1810] ? walk_pgd_range (mm/pagewalk.c:278) 
[ 125.448385][ T1810] ? find_vma (mm/mmap.c:1784) 
[ 125.452488][ T1810] ? __walk_page_range (mm/pagewalk.c:379) 
[ 125.457462][ T1810] ? walk_page_range (mm/pagewalk.c:477) 
[ 125.462253][ T1810] ? __walk_page_range (mm/pagewalk.c:430) 
[ 125.467233][ T1810] ? __down_read_common (arch/x86/include/asm/atomic64_64.h:34 include/linux/atomic/atomic-long.h:41 include/linux/atomic/atomic-instrumented.h:1280 kernel/locking/rwsem.c:176 kernel/locking/rwsem.c:181 kernel/locking/rwsem.c:249 kernel/locking/rwsem.c:1249) 
[ 125.472304][ T1810] ? do_mincore (mm/mincore.c:202) 
[ 125.476676][ T1810] ? __do_sys_mincore (mm/mincore.c:268) 
[ 125.481558][ T1810] ? do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 125.486004][ T1810] ? entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  125.491926][ T1810]  </TASK>
[  125.494820][ T1810] ==================================================================
[  125.502849][ T1810] Disabling lock debugging due to kernel taint
[  125.508863][ T1810] general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
[  125.520066][ T1810] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[  125.528325][ T1810] CPU: 2 PID: 1810 Comm: mincore_selftes Tainted: G    B              6.3.0-rc1-00007-gef2f3f98fcf4 #1
[  125.539178][ T1810] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[ 125.548731][ T1810] RIP: 0010:mincore_page (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:712 mm/mincore.c:65) 
[ 125.553692][ T1810] Code: 00 48 3d 00 f0 ff ff 77 63 48 89 c5 be 08 00 00 00 48 89 c7 e8 1b bb 0f 00 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 46 48 8b 45 00 48 c1 e8 02 83 e0 01 75 1e 48 8d 7d
All code
========
   0:	00 48 3d             	add    %cl,0x3d(%rax)
   3:	00 f0                	add    %dh,%al
   5:	ff                   	(bad)  
   6:	ff 77 63             	pushq  0x63(%rdi)
   9:	48 89 c5             	mov    %rax,%rbp
   c:	be 08 00 00 00       	mov    $0x8,%esi
  11:	48 89 c7             	mov    %rax,%rdi
  14:	e8 1b bb 0f 00       	callq  0xfbb34
  19:	48 89 ea             	mov    %rbp,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df 
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	75 46                	jne    0x76
  30:	48 8b 45 00          	mov    0x0(%rbp),%rax
  34:	48 c1 e8 02          	shr    $0x2,%rax
  38:	83 e0 01             	and    $0x1,%eax
  3b:	75 1e                	jne    0x5b
  3d:	48                   	rex.W
  3e:	8d                   	.byte 0x8d
  3f:	7d                   	.byte 0x7d

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	75 46                	jne    0x4c
   6:	48 8b 45 00          	mov    0x0(%rbp),%rax
   a:	48 c1 e8 02          	shr    $0x2,%rax
   e:	83 e0 01             	and    $0x1,%eax
  11:	75 1e                	jne    0x31
  13:	48                   	rex.W
  14:	8d                   	.byte 0x8d
  15:	7d                   	.byte 0x7d
[  125.573120][ T1810] RSP: 0018:ffffc90002e7fa10 EFLAGS: 00010246
[  125.579037][ T1810] RAX: dffffc0000000000 RBX: ffff888144acd000 RCX: fffffbfff0c13951
[  125.586858][ T1810] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffff8609ca80
[  125.594679][ T1810] RBP: 0000000000000000 R08: ffffffff811cd48a R09: ffffffff8609ca87
[  125.602502][ T1810] R10: fffffbfff0c13950 R11: 0000000000000000 R12: ffff88810b508320
[  125.610323][ T1810] R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000001
[  125.618146][ T1810] FS:  00007f5833e23740(0000) GS:ffff88837f100000(0000) knlGS:0000000000000000
[  125.626921][ T1810] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  125.633365][ T1810] CR2: 00007f5833e4d5a0 CR3: 0000000147118003 CR4: 00000000003706e0
[  125.641188][ T1810] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  125.649019][ T1810] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  125.656841][ T1810] Call Trace:
[  125.659985][ T1810]  <TASK>
[ 125.662777][ T1810] __mincore_unmapped_range (mm/mincore.c:83 (discriminator 3)) 
[ 125.668171][ T1810] mincore_pte_range (mm/mincore.c:150) 
[ 125.672973][ T1810] walk_pmd_range+0x276/0x760 
[ 125.678118][ T1810] ? lock_downgrade (kernel/locking/lockdep.c:5321) 
[ 125.682819][ T1810] ? walk_pte_range+0x4d0/0x4d0 
[ 125.688136][ T1810] ? lock_is_held_type (kernel/locking/lockdep.c:5410 kernel/locking/lockdep.c:5712) 
[ 125.693020][ T1810] walk_pud_range+0x27d/0x5d0 
[ 125.698172][ T1810] ? mas_find (lib/maple_tree.c:6446) 
[ 125.702359][ T1810] walk_p4d_range (mm/pagewalk.c:241) 
[ 125.706916][ T1810] ? __lock_release (kernel/locking/lockdep.c:5345) 
[ 125.711632][ T1810] walk_pgd_range (mm/pagewalk.c:278) 
[ 125.716162][ T1810] ? find_vma (mm/mmap.c:1784) 
[ 125.720263][ T1810] __walk_page_range (mm/pagewalk.c:379) 
[ 125.725061][ T1810] walk_page_range (mm/pagewalk.c:477) 
[ 125.729680][ T1810] ? __walk_page_range (mm/pagewalk.c:430) 
[ 125.734647][ T1810] ? __down_read_common (arch/x86/include/asm/atomic64_64.h:34 include/linux/atomic/atomic-long.h:41 include/linux/atomic/atomic-instrumented.h:1280 kernel/locking/rwsem.c:176 kernel/locking/rwsem.c:181 kernel/locking/rwsem.c:249 kernel/locking/rwsem.c:1249) 
[ 125.739702][ T1810] do_mincore (mm/mincore.c:202) 
[ 125.743907][ T1810] __do_sys_mincore (mm/mincore.c:268) 
[ 125.748610][ T1810] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 125.752912][ T1810] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  125.758655][ T1810] RIP: 0033:0x7f5833f278b7
[ 125.762942][ T1810] Code: 73 01 c3 48 8b 0d 49 05 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 1b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 19 05 0d 00 f7 d8 64 89 01 48
All code
========
   0:	73 01                	jae    0x3
   2:	c3                   	retq   
   3:	48 8b 0d 49 05 0d 00 	mov    0xd0549(%rip),%rcx        # 0xd0553
   a:	f7 d8                	neg    %eax
   c:	64 89 01             	mov    %eax,%fs:(%rcx)
   f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  13:	c3                   	retq   
  14:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  1b:	00 00 00 
  1e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  23:	b8 1b 00 00 00       	mov    $0x1b,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 19 05 0d 00 	mov    0xd0519(%rip),%rcx        # 0xd0553
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 19 05 0d 00 	mov    0xd0519(%rip),%rcx        # 0xd0529
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


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

--MuXUmVDMr7gP5Pe2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.3.0-rc1-00007-gef2f3f98fcf4"

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
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
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
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
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
CONFIG_PHYSICAL_ALIGN=0x200000
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
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
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
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
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
CONFIG_AS_GFNI=y

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
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
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
# CONFIG_BLK_CGROUP_IOLATENCY is not set
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
CONFIG_ZSMALLOC_CHAIN_SIZE=8

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
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
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
CONFIG_DAMON_SYSFS=y
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
# CONFIG_XDP_SOCKETS_DIAG is not set
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
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
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
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
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
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
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
CONFIG_NF_CONNTRACK_OVS=y
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
# CONFIG_BPFILTER is not set
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
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
CONFIG_NET_SCH_CBS=m
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_MQPRIO_LIB=m
CONFIG_NET_SCH_TAPRIO=m
CONFIG_NET_SCH_GRED=m
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
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
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
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
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
CONFIG_PCI_HYPERV=m
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
CONFIG_PCI_HYPERV_INTERFACE=m

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
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
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
CONFIG_HYPERV_STORAGE=m
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
# CONFIG_PATA_PARPORT is not set

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
# CONFIG_BONDING is not set
CONFIG_DUMMY=m
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
CONFIG_IFB=m
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
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
# CONFIG_MICROSOFT_MANA is not set
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
# CONFIG_NCN26000_PHY is not set
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
# CONFIG_ATH12K is not set
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
CONFIG_HYPERV_NET=m
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
CONFIG_HYPERV_KEYBOARD=m
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
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_PCI1XXXX=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
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
# CONFIG_SENSORS_MC34VR500 is not set
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
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TDA38640 is not set
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
CONFIG_THERMAL_ACPI=y
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
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
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
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
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
# CONFIG_DRM_PANEL_AUO_A030JTN01 is not set
# CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
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
# CONFIG_DRM_HYPERV is not set
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
# CONFIG_FB_MODE_HELPERS is not set
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
CONFIG_FB_HYPERV=m
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
# CONFIG_BACKLIGHT_KTZ8866 is not set
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
CONFIG_HID_SUPPORT=y
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
# CONFIG_HID_EVISION is not set
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
CONFIG_HID_HYPERV_MOUSE=m
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
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set

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
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
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
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
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
CONFIG_UIO_HV_GENERIC=m
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
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
# CONFIG_EFI_SECRET is not set
CONFIG_TDX_GUEST_DRIVER=m
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
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
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
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
CONFIG_IOMMUFD=m
CONFIG_IOMMUFD_TEST=y
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
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
# CONFIG_GENERIC_PHY is not set
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
CONFIG_IDLE_INJECT=y
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
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
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
CONFIG_NETFS_SUPPORT=m
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
# CONFIG_NFS_V4_2_READ_PLUS is not set
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
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
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
# CONFIG_9P_FS is not set
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
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
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
CONFIG_GCC_PLUGIN_STACKLEAK=y
# CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE is not set
CONFIG_STACKLEAK_TRACK_MIN_SIZE=100
# CONFIG_STACKLEAK_METRICS is not set
# CONFIG_STACKLEAK_RUNTIME_DISABLE is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
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
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
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
# CONFIG_CRYPTO_DEV_VIRTIO is not set
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
CONFIG_INTERVAL_TREE_SPAN_ITER=y
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
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
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
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
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
CONFIG_SLUB_DEBUG_ON=y
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
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
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
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
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
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
# CONFIG_SAMPLE_FTRACE_OPS is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
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
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
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
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--MuXUmVDMr7gP5Pe2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='kernel-selftests'
	export testcase='kernel-selftests'
	export category='functional'
	export need_memory='3G'
	export need_cpu=2
	export kernel_cmdline='sysctl.debug.test_sysctl.boot_int=1'
	export job_origin='kernel-selftests.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-skl-d06'
	export tbox_group='lkp-skl-d06'
	export submit_id='640a71b102edc5eb25340cb0'
	export job_file='/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-60197-szh7vk-4.yaml'
	export id='0a74e43c273ef8fa7604cab5ed70d840d17dce67'
	export queuer_version='/zday/lkp'
	export model='Skylake'
	export nr_cpu=4
	export memory='16G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export hdd_partitions='/dev/disk/by-id/wwn-0x50014ee25a160161-part*'
	export ssd_partitions='/dev/disk/by-id/wwn-0x55cd2e404b653ca4-part2'
	export rootfs_partition='/dev/disk/by-id/wwn-0x55cd2e404b653ca4-part1'
	export brand='Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz'
	export commit='ef2f3f98fcf4521aa00fd217089e303b7d9b62ba'
	export need_kconfig_hw='{"PTP_1588_CLOCK"=>"y"}
{"E1000E"=>"y"}
SATA_AHCI
DRM_I915'
	export ucode='0xf0'
	export bisect_dmesg=true
	export need_kconfig='{"FUSE_FS"=>"m"}
{"IPV6_MULTIPLE_TABLES"=>"y"}
{"MACSEC"=>"y"}
{"MISC_FILESYSTEMS"=>"y"}
{"MPTCP"=>"y"}
{"MPTCP_IPV6"=>"y"}
NET_FOU
{"NET_FOU_IP_TUNNELS"=>"y"}
{"NET_L3_MASTER_DEV"=>"y"}
NET_SCH_NETEM
{"NET_VRF"=>"y"}
{"NF_FLOW_TABLE"=>"m"}
{"NF_FLOW_TABLE_INET"=>"m"}
{"NF_FLOW_TABLE_IPV4"=>"m"}
{"NF_FLOW_TABLE_IPV6"=>"m"}
{"NF_TABLES_NETDEV"=>"y"}
{"PROC_FS"=>"y"}
{"PSTORE"=>"y"}
{"PSTORE_CONSOLE"=>"y"}
{"PSTORE_PMSG"=>"y"}
{"PSTORE_RAM"=>"m"}
{"SECCOMP"=>"y"}
{"SECCOMP_FILTER"=>"y"}
{"TEST_BLACKHOLE_DEV"=>"m"}
{"UTS_NS"=>"y"}
VETH
{"X86_CPU_RESCTRL"=>"y"}
{"NFC"=>"m"}
{"NFC_NCI"=>"m"}
{"NFC_VIRTUAL_NCI"=>"m"}'
	export rootfs='debian-12-x86_64-20220629.cgz'
	export initrds='linux_headers
linux_selftests'
	export kconfig='x86_64-rhel-8.3-kselftests'
	export enqueue_time='2023-03-10 07:54:26 +0800'
	export _id='640a71c702edc5eb25340cb1'
	export _rt='/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='3f72112815381618e23d99c590013e409bef66d8'
	export base_commit='fe15c26ee26efa11741a7b632e9f23b01aca4cc6'
	export branch='hch-misc/filemap_get_folio'
	export result_root='/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-12-x86_64-20220629.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4
branch=hch-misc/filemap_get_folio
job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-60197-szh7vk-4.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-kselftests
commit=ef2f3f98fcf4521aa00fd217089e303b7d9b62ba
sysctl.debug.test_sysctl.boot_int=1
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/modules.cgz'
	export linux_headers_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/linux-headers.cgz'
	export linux_selftests_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/linux-selftests.cgz'
	export bm_initrd='/osimage/deps/debian-12-x86_64-20220629.cgz/run-ipconfig_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/lkp_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/rsync-rootfs_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/kernel-selftests_20230110.cgz,/osimage/pkg/debian-12-x86_64-20220629.cgz/kernel-selftests-x86_64-d4cf28ee-1_20230110.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/hw_20221125.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220804.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='6.3.0-rc1-wt-05743-g7a8ce875e97e'
	export repeat_to=6
	export stop_repeat_if_found='dmesg.RIP:mincore_page'
	export kbuild_queue_analysis=1
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4'
	export dequeue_time='2023-03-10 07:58:32 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-60197-szh7vk-4.cgz'

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

	run_test group='group-02' $LKP_SRC/tests/wrapper kernel-selftests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env group='group-02' $LKP_SRC/stats/wrapper kernel-selftests
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

--MuXUmVDMr7gP5Pe2
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--MuXUmVDMr7gP5Pe2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="kernel-selftests"
Content-Transfer-Encoding: quoted-printable

Decompressing Linux... Parsing ELF... done.
Booting the kernel (entry_offset: 0x0000000000000000).
Linux version 6.3.0-rc1-00007-gef2f3f98fcf4 (kbuild@17c57649b3e0) (gcc-11 (=
Debian 11.3.0-8) 11.3.0, GNU ld (GNU Binutils for Debian) 2.39.90.20221231)=
 #1 SMP Thu Mar  9 17:51:08 CST 2023
Command line: ip=3D::::lkp-skl-d06::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/re=
sult/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x8=
6_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/3 =
BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa=
00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4 branch=3Dhch-=
misc/filemap_get_folio job=3D/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftes=
ts-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7=
d9b62ba-20230310-60197-szh7vk-4.yaml user=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86=
_64-rhel-8.3-kselftests commit=3Def2f3f98fcf4521aa00fd217089e303b7d9b62ba s=
ysctl.debug.test_sysctl.boot_int=3D1 initcall_debug nmi_watchdog=3D0 max_up=
time=3D1200 LKP_SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=
=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifna=
mes=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3D=
panic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8=
 systemd.log_level=3Derr=20
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
x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'co=
mpacted' format.
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
e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> reserved
e820: remove [mem 0x000a0000-0x000fffff] usable
last_pfn =3D 0x43f800 max_arch_pfn =3D 0x400000000
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT =20
last_pfn =3D 0xb3f00 max_arch_pfn =3D 0x400000000
Scan for SMP in [mem 0x00000000-0x000003ff]
Scan for SMP in [mem 0x0009fc00-0x0009ffff]
Scan for SMP in [mem 0x000f0000-0x000fffff]
Scan for SMP in [mem 0x00091c00-0x00091fff]
Using GB pages for direct mapping
RAMDISK: [mem 0x40e010000-0x4395fffff]
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x00000000000FBE30 000024 (v02 HPQOEM)
ACPI: XSDT 0x00000000B3EFD0E8 0000AC (v01 HPQOEM SLIC-WKS 00000000      010=
00013)
ACPI: FACP 0x00000000B3EF1000 0000F4 (v05 HPQOEM SLIC-WKS 00000000 HP   000=
00001)
ACPI: DSDT 0x00000000B3ECD000 0209E1 (v02 HPQOEM 8183     00000000 INTL 201=
21018)
ACPI: FACS 0x00000000B3E5A000 000040
ACPI: SSDT 0x00000000B3EFC000 000108 (v02 HP     ShmTable 00000001 INTL 201=
21018)
ACPI: TCPA 0x00000000B3EFB000 000032 (v02 HPQOEM EDK2     00000002      010=
00013)
ACPI: SSDT 0x00000000B3EFA000 0003B8 (v02 HPQOEM TcgTable 00001000 INTL 201=
21018)
ACPI: UEFI 0x00000000B3E6A000 000042 (v01 HPQOEM EDK2     00000002      010=
00013)
ACPI: SSDT 0x00000000B3EF4000 0051FA (v02 SaSsdt SaSsdt   00003000 INTL 201=
21018)
ACPI: SSDT 0x00000000B3EF3000 0005B1 (v01 Intel  PerfTune 00001000 INTL 201=
21018)
ACPI: WSMT 0x00000000B3EF2000 000028 (v01 HPQOEM 8183     00000001 HP   000=
00001)
ACPI: HPET 0x00000000B3EF0000 000038 (v01 HPQOEM 8183     00000001 HP   000=
00001)
ACPI: APIC 0x00000000B3EEF000 0000BC (v01 HPQOEM 8183     00000001 HP   000=
00001)
ACPI: MCFG 0x00000000B3EEE000 00003C (v01 HPQOEM 8183     00000001 HP   000=
00001)
ACPI: SSDT 0x00000000B3ECC000 00019A (v02 HPQOEM Sata0Ide 00001000 INTL 201=
21018)
ACPI: SSDT 0x00000000B3ECB000 000729 (v01 HPQOEM PtidDevc 00001000 INTL 201=
21018)
ACPI: SSDT 0x00000000B3ECA000 000E73 (v02 CpuRef CpuSsdt  00003000 INTL 201=
21018)
ACPI: ASF! 0x00000000B3EC9000 0000A5 (v32 HPQOEM  UYA     00000001 TFSM 000=
F4240)
ACPI: FPDT 0x00000000B3EC8000 000044 (v01 HPQOEM EDK2     00000002      010=
00013)
ACPI: BGRT 0x00000000B3EC7000 000038 (v01 HPQOEM EDK2     00000002      010=
00013)
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
ACPI: Reserving ASF! table memory at [mem 0xb3ec9000-0xb3ec90a4]
ACPI: Reserving FPDT table memory at [mem 0xb3ec8000-0xb3ec8043]
ACPI: Reserving BGRT table memory at [mem 0xb3ec7000-0xb3ec7037]
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
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_=
idle_ns: 1910969940391419 ns
setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
percpu: Embedded 71 pages/cpu s251680 r8192 d30944 u524288
pcpu-alloc: s251680 r8192 d30944 u524288 alloc=3D1*2097152
pcpu-alloc: [0] 0 1 2 3=20
Fallback order for Node 0: 0=20
Built 1 zonelists, mobility grouping on.  Total pages: 4074328
Policy zone: Normal
Kernel command line: ip=3D::::lkp-skl-d06::dhcp root=3D/dev/ram0 RESULT_ROO=
T=3D/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629=
.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b=
62ba/3 BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fc=
f4521aa00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4 branch=
=3Dhch-misc/filemap_get_folio job=3D/lkp/jobs/scheduled/lkp-skl-d06/kernel-=
selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd21708=
9e303b7d9b62ba-20230310-60197-szh7vk-4.yaml user=3Dlkp ARCH=3Dx86_64 kconfi=
g=3Dx86_64-rhel-8.3-kselftests commit=3Def2f3f98fcf4521aa00fd217089e303b7d9=
b62ba sysctl.debug.test_sysctl.boot_int=3D1 initcall_debug nmi_watchdog=3D0=
 max_uptime=3D1200 LKP_SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 deb=
ug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 n=
et.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watc=
hdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_co=
unt=3D8 systemd.log_lev
sysrq: sysrq always enabled.
ignoring the deprecated load_ramdisk=3D option
Unknown kernel command line parameters "nokaslr RESULT_ROOT=3D/result/kerne=
l-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-=
8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/3 BOOT_IMAGE=
=3D/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089=
e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4 branch=3Dhch-misc/filem=
ap_get_folio job=3D/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-0=
2-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20=
230310-60197-szh7vk-4.yaml user=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-8=
.3-kselftests commit=3Def2f3f98fcf4521aa00fd217089e303b7d9b62ba max_uptime=
=3D1200 LKP_SERVER=3Dinternal-lkp-server selinux=3D0 softlockup_panic=3D1 p=
rompt_ramdisk=3D0 vga=3Dnormal", will be passed to user space.
random: crng init done
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear=
)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
mem auto-init: stack:off, heap alloc:on, heap free:on
mem auto-init: clearing system memory may take some time...
stackdepot: allocating hash table via alloc_large_system_hash
stackdepot hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
software IO TLB: area num 4.
Memory: 2998000K/16556592K available (45056K kernel code, 15178K rwdata, 95=
56K rodata, 3432K init, 16268K bss, 3252304K reserved, 0K cma-reserved)
**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** This system shows unhashed kernel memory addresses   **
** via the console, logs, and other interfaces. This    **
** might reduce the security of your system.            **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your system   **
** administrator!                                       **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1
Kernel/User page tables isolation: enabled
ftrace: allocating 49377 entries in 193 pages
ftrace: allocated 193 pages with 3 groups
Running RCU self tests
Running RCU synchronous self tests
rcu: Hierarchical RCU implementation.
rcu: 	RCU lockdep checking is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=3D4.
	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_timeout).
	Rude variant of Tasks RCU enabled.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D4
Running RCU synchronous self tests
NR_IRQS: 524544, nr_irqs: 1024, preallocated irqs: 16
rcu: srcu_init: Setting srcu_struct sizes based on contention.
calling  con_init+0x0/0x710 @ 0
Console: colour VGA+ 80x25
printk: console [tty0] enabled
initcall con_init+0x0/0x710 returned 0 after 0 usecs
calling  hvc_console_init+0x0/0x20 @ 0
initcall hvc_console_init+0x0/0x20 returned 0 after 0 usecs
calling  univ8250_console_init+0x0/0x30 @ 0
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [earlyser0] disabled
printk: bootconsole [earlyser0] disabled
initcall univ8250_console_init+0x0/0x30 returned 0 after 0 usecs
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
clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79=
635855245 ns
APIC: Switch to symmetric I/O mode setup
x2apic: IRQ remapping doesn't support X2APIC mode
masked ExtINT on CPU#0
ENABLING IO-APIC IRQs
init IO_APIC IRQs
apic 2 pin 0 not connected
IOAPIC[0]: Preconfigured routing entry (2-1 -> IRQ 1 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-2 -> IRQ 0 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-3 -> IRQ 3 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-4 -> IRQ 4 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-5 -> IRQ 5 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-6 -> IRQ 6 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-7 -> IRQ 7 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-8 -> IRQ 8 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-9 -> IRQ 9 Level:1 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-10 -> IRQ 10 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-11 -> IRQ 11 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-12 -> IRQ 12 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-13 -> IRQ 13 Level:0 ActiveLow:0)
IOAPIC[0]: Preconfigured routing entry (2-14 -> IRQ 14 Level:0 ActiveLow:0)
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
..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2f9146cb80a,=
 max_idle_ns: 440795296911 ns
Calibrating delay loop (skipped), value calculated using timer frequency.. =
6599.98 BogoMIPS (lpj=3D3299994)
pid_max: default: 32768 minimum: 301
LSM: initializing lsm=3Dcapability,landlock,yama,integrity
landlock: Up and running.
Yama: becoming mindful.
Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
CPU0: Thermal monitoring enabled (TM1)
process: using mwait in idle threads
Last level iTLB entries: 4KB 128, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer saniti=
zation
Spectre V2 : Mitigation: IBRS
Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context swi=
tch
Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
RETBleed: Mitigation: IBRS
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Ba=
rrier
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via=
 prctl
MDS: Mitigation: Clear CPU buffers
MMIO Stale Data: Mitigation: Clear CPU buffers
SRBDS: Mitigation: Microcode
Freeing SMP alternatives memory: 40K
Running RCU synchronous self tests
Running RCU synchronous self tests
smpboot: CPU0: Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (family: 0x6, mode=
l: 0x5e, stepping: 0x3)
cblist_init_generic: Setting adjustable number of callback queues.
cblist_init_generic: Setting shift to 2 and lim to 1.
cblist_init_generic: Setting shift to 2 and lim to 1.
Running RCU-tasks wait API self tests
calling  init_hw_perf_events+0x0/0x710 @ 1
Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width cou=
nters, Intel PMU driver.
... version:                4
... bit width:              48
... generic registers:      8
... value mask:             0000ffffffffffff
... max period:             00007fffffffffff
... fixed-purpose events:   3
... event mask:             00000007000000ff
initcall init_hw_perf_events+0x0/0x710 returned 0 after 8000 usecs
calling  do_init_real_mode+0x0/0x20 @ 1
initcall do_init_real_mode+0x0/0x20 returned 0 after 0 usecs
calling  trace_init_perf_perm_irq_work_exit+0x0/0x20 @ 1
initcall trace_init_perf_perm_irq_work_exit+0x0/0x20 returned 0 after 0 use=
cs
calling  bp_init_aperfmperf+0x0/0xc0 @ 1
Callback from call_rcu_tasks_trace() invoked.
Estimated ratio of average max frequency by base frequency (times 1024): 10=
55
initcall bp_init_aperfmperf+0x0/0xc0 returned 0 after 2000 usecs
calling  register_nmi_cpu_backtrace_handler+0x0/0x20 @ 1
initcall register_nmi_cpu_backtrace_handler+0x0/0x20 returned 0 after 0 use=
cs
calling  kvm_setup_vsyscall_timeinfo+0x0/0xf0 @ 1
initcall kvm_setup_vsyscall_timeinfo+0x0/0xf0 returned 0 after 0 usecs
calling  spawn_ksoftirqd+0x0/0x40 @ 1
initcall spawn_ksoftirqd+0x0/0x40 returned 0 after 0 usecs
calling  migration_init+0x0/0xf0 @ 1
initcall migration_init+0x0/0xf0 returned 0 after 0 usecs
calling  srcu_bootup_announce+0x0/0x80 @ 1
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 400.
initcall srcu_bootup_announce+0x0/0x80 returned 0 after 2000 usecs
calling  rcu_spawn_gp_kthread+0x0/0x400 @ 1
initcall rcu_spawn_gp_kthread+0x0/0x400 returned 0 after 0 usecs
calling  check_cpu_stall_init+0x0/0x20 @ 1
initcall check_cpu_stall_init+0x0/0x20 returned 0 after 0 usecs
calling  rcu_sysrq_init+0x0/0x30 @ 1
initcall rcu_sysrq_init+0x0/0x30 returned 0 after 0 usecs
calling  trace_init_flags_sys_enter+0x0/0x20 @ 1
initcall trace_init_flags_sys_enter+0x0/0x20 returned 0 after 0 usecs
calling  trace_init_flags_sys_exit+0x0/0x20 @ 1
initcall trace_init_flags_sys_exit+0x0/0x20 returned 0 after 0 usecs
calling  cpu_stop_init+0x0/0x290 @ 1
initcall cpu_stop_init+0x0/0x290 returned 0 after 0 usecs
calling  init_kprobes+0x0/0x340 @ 1
initcall init_kprobes+0x0/0x340 returned 0 after 2000 usecs
calling  init_trace_printk+0x0/0x10 @ 1
initcall init_trace_printk+0x0/0x10 returned 0 after 0 usecs
calling  event_trace_enable_again+0x0/0xe0 @ 1
initcall event_trace_enable_again+0x0/0xe0 returned 0 after 0 usecs
calling  irq_work_init_threads+0x0/0x10 @ 1
initcall irq_work_init_threads+0x0/0x10 returned 0 after 0 usecs
calling  static_call_init+0x0/0xd0 @ 1
initcall static_call_init+0x0/0xd0 returned 0 after 0 usecs
calling  jump_label_init_module+0x0/0x20 @ 1
initcall jump_label_init_module+0x0/0x20 returned 0 after 0 usecs
calling  init_zero_pfn+0x0/0xf0 @ 1
initcall init_zero_pfn+0x0/0xf0 returned 0 after 0 usecs
calling  init_fs_inode_sysctls+0x0/0x30 @ 1
initcall init_fs_inode_sysctls+0x0/0x30 returned 0 after 0 usecs
calling  init_fs_locks_sysctls+0x0/0x30 @ 1
initcall init_fs_locks_sysctls+0x0/0x30 returned 0 after 0 usecs
calling  dynamic_debug_init+0x0/0x4b0 @ 1
initcall dynamic_debug_init+0x0/0x4b0 returned 0 after 1000 usecs
calling  efi_memreserve_root_init+0x0/0x50 @ 1
initcall efi_memreserve_root_init+0x0/0x50 returned 0 after 0 usecs
calling  efi_earlycon_remap_fb+0x0/0x120 @ 1
initcall efi_earlycon_remap_fb+0x0/0x120 returned 0 after 0 usecs
calling  idle_inject_init+0x0/0x20 @ 1
initcall idle_inject_init+0x0/0x20 returned 0 after 0 usecs
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
node 0 deferred pages initialised in 660ms
devtmpfs: initialized
x86/mm: Memory block size: 128MB
calling  bpf_jit_charge_init+0x0/0x50 @ 1
initcall bpf_jit_charge_init+0x0/0x50 returned 0 after 0 usecs
calling  ipc_ns_init+0x0/0x150 @ 1
initcall ipc_ns_init+0x0/0x150 returned 0 after 0 usecs
calling  init_mmap_min_addr+0x0/0x20 @ 1
initcall init_mmap_min_addr+0x0/0x20 returned 0 after 0 usecs
calling  pci_realloc_setup_params+0x0/0x50 @ 1
initcall pci_realloc_setup_params+0x0/0x50 returned 0 after 0 usecs
calling  inet_frag_wq_init+0x0/0x50 @ 1
initcall inet_frag_wq_init+0x0/0x50 returned 0 after 0 usecs
calling  e820__register_nvs_regions+0x0/0x1d0 @ 1
ACPI: PM: Registering ACPI NVS region [mem 0xb3c7f000-0xb3e7efff] (2097152 =
bytes)
initcall e820__register_nvs_regions+0x0/0x1d0 returned 0 after 12000 usecs
calling  cpufreq_register_tsc_scaling+0x0/0x90 @ 1
initcall cpufreq_register_tsc_scaling+0x0/0x90 returned 0 after 0 usecs
calling  cache_ap_register+0x0/0x30 @ 1
initcall cache_ap_register+0x0/0x30 returned 0 after 0 usecs
calling  reboot_init+0x0/0xc0 @ 1
initcall reboot_init+0x0/0xc0 returned 0 after 0 usecs
calling  init_lapic_sysfs+0x0/0x50 @ 1
initcall init_lapic_sysfs+0x0/0x50 returned 0 after 0 usecs
calling  alloc_frozen_cpus+0x0/0x30 @ 1
initcall alloc_frozen_cpus+0x0/0x30 returned 0 after 0 usecs
calling  cpu_hotplug_pm_sync_init+0x0/0x20 @ 1
initcall cpu_hotplug_pm_sync_init+0x0/0x20 returned 0 after 0 usecs
calling  wq_sysfs_init+0x0/0x30 @ 1
initcall wq_sysfs_init+0x0/0x30 returned 0 after 0 usecs
calling  ksysfs_init+0x0/0xb0 @ 1
initcall ksysfs_init+0x0/0xb0 returned 0 after 0 usecs
calling  schedutil_gov_init+0x0/0x20 @ 1
initcall schedutil_gov_init+0x0/0x20 returned 0 after 0 usecs
calling  pm_init+0x0/0xd0 @ 1
initcall pm_init+0x0/0xd0 returned 0 after 0 usecs
calling  pm_disk_init+0x0/0x50 @ 1
initcall pm_disk_init+0x0/0x50 returned 0 after 0 usecs
calling  swsusp_header_init+0x0/0x40 @ 1
initcall swsusp_header_init+0x0/0x40 returned 0 after 0 usecs
calling  rcu_set_runtime_mode+0x0/0x80 @ 1
Running RCU synchronous self tests
Running RCU synchronous self tests
initcall rcu_set_runtime_mode+0x0/0x80 returned 0 after 11000 usecs
calling  init_jiffies_clocksource+0x0/0x20 @ 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 1911260446275000 ns
initcall init_jiffies_clocksource+0x0/0x20 returned 0 after 11000 usecs
calling  futex_init+0x0/0x240 @ 1
futex hash table entries: 1024 (order: 5, 131072 bytes, linear)
initcall futex_init+0x0/0x240 returned 0 after 7000 usecs
calling  cgroup_wq_init+0x0/0x30 @ 1
initcall cgroup_wq_init+0x0/0x30 returned 0 after 0 usecs
calling  cgroup1_wq_init+0x0/0x30 @ 1
initcall cgroup1_wq_init+0x0/0x30 returned 0 after 0 usecs
calling  ftrace_mod_cmd_init+0x0/0x10 @ 1
initcall ftrace_mod_cmd_init+0x0/0x10 returned 0 after 0 usecs
calling  init_irqsoff_tracer+0x0/0x20 @ 1
initcall init_irqsoff_tracer+0x0/0x20 returned 0 after 0 usecs
calling  init_wakeup_tracer+0x0/0x40 @ 1
initcall init_wakeup_tracer+0x0/0x40 returned 0 after 0 usecs
calling  init_graph_trace+0x0/0xa0 @ 1
initcall init_graph_trace+0x0/0xa0 returned 0 after 0 usecs
calling  trace_events_eprobe_init_early+0x0/0x40 @ 1
initcall trace_events_eprobe_init_early+0x0/0x40 returned 0 after 0 usecs
calling  trace_events_synth_init_early+0x0/0x40 @ 1
initcall trace_events_synth_init_early+0x0/0x40 returned 0 after 0 usecs
calling  init_kprobe_trace_early+0x0/0x30 @ 1
initcall init_kprobe_trace_early+0x0/0x30 returned 0 after 0 usecs
calling  kasan_memhotplug_init+0x0/0x20 @ 1
initcall kasan_memhotplug_init+0x0/0x20 returned 0 after 0 usecs
calling  memory_failure_init+0x0/0x320 @ 1
initcall memory_failure_init+0x0/0x320 returned 0 after 0 usecs
calling  fsnotify_init+0x0/0xa0 @ 1
initcall fsnotify_init+0x0/0xa0 returned 0 after 0 usecs
calling  filelock_init+0x0/0x1b0 @ 1
initcall filelock_init+0x0/0x1b0 returned 0 after 1000 usecs
calling  init_script_binfmt+0x0/0x20 @ 1
initcall init_script_binfmt+0x0/0x20 returned 0 after 0 usecs
calling  init_elf_binfmt+0x0/0x20 @ 1
initcall init_elf_binfmt+0x0/0x20 returned 0 after 0 usecs
calling  init_compat_elf_binfmt+0x0/0x20 @ 1
initcall init_compat_elf_binfmt+0x0/0x20 returned 0 after 0 usecs
calling  configfs_init+0x0/0x100 @ 1
initcall configfs_init+0x0/0x100 returned 0 after 0 usecs
calling  debugfs_init+0x0/0xd0 @ 1
initcall debugfs_init+0x0/0xd0 returned 0 after 0 usecs
calling  tracefs_init+0x0/0x70 @ 1
initcall tracefs_init+0x0/0x70 returned 0 after 0 usecs
calling  securityfs_init+0x0/0xe0 @ 1
initcall securityfs_init+0x0/0xe0 returned 0 after 1000 usecs
calling  pinctrl_init+0x0/0xc0 @ 1
pinctrl core: initialized pinctrl subsystem
initcall pinctrl_init+0x0/0xc0 returned 0 after 7000 usecs
calling  gpiolib_dev_init+0x0/0x140 @ 1
initcall gpiolib_dev_init+0x0/0x140 returned 0 after 0 usecs
calling  virtio_init+0x0/0x30 @ 1
initcall virtio_init+0x0/0x30 returned 0 after 0 usecs
calling  iommu_init+0x0/0x60 @ 1
initcall iommu_init+0x0/0x60 returned 0 after 0 usecs
calling  component_debug_init+0x0/0x30 @ 1
initcall component_debug_init+0x0/0x30 returned 0 after 0 usecs
calling  cpufreq_core_init+0x0/0xe0 @ 1
initcall cpufreq_core_init+0x0/0xe0 returned 0 after 0 usecs
calling  cpufreq_gov_performance_init+0x0/0x20 @ 1
initcall cpufreq_gov_performance_init+0x0/0x20 returned 0 after 0 usecs
calling  cpufreq_gov_powersave_init+0x0/0x20 @ 1
initcall cpufreq_gov_powersave_init+0x0/0x20 returned 0 after 0 usecs
calling  cpufreq_gov_userspace_init+0x0/0x20 @ 1
initcall cpufreq_gov_userspace_init+0x0/0x20 returned 0 after 0 usecs
calling  CPU_FREQ_GOV_ONDEMAND_init+0x0/0x20 @ 1
initcall CPU_FREQ_GOV_ONDEMAND_init+0x0/0x20 returned 0 after 0 usecs
calling  CPU_FREQ_GOV_CONSERVATIVE_init+0x0/0x20 @ 1
initcall CPU_FREQ_GOV_CONSERVATIVE_init+0x0/0x20 returned 0 after 0 usecs
calling  cpuidle_init+0x0/0x50 @ 1
initcall cpuidle_init+0x0/0x50 returned 0 after 0 usecs
calling  sock_init+0x0/0xb0 @ 1
initcall sock_init+0x0/0xb0 returned 0 after 3000 usecs
calling  net_inuse_init+0x0/0x30 @ 1
initcall net_inuse_init+0x0/0x30 returned 0 after 0 usecs
calling  net_defaults_init+0x0/0x50 @ 1
initcall net_defaults_init+0x0/0x50 returned 0 after 0 usecs
calling  init_default_flow_dissectors+0x0/0x60 @ 1
initcall init_default_flow_dissectors+0x0/0x60 returned 0 after 0 usecs
calling  netpoll_init+0x0/0x50 @ 1
initcall netpoll_init+0x0/0x50 returned 0 after 0 usecs
calling  netlink_proto_init+0x0/0x2f0 @ 1
NET: Registered PF_NETLINK/PF_ROUTE protocol family
initcall netlink_proto_init+0x0/0x2f0 returned 0 after 8000 usecs
calling  genl_init+0x0/0x50 @ 1
initcall genl_init+0x0/0x50 returned 0 after 0 usecs
calling  bsp_pm_check_init+0x0/0x20 @ 1
initcall bsp_pm_check_init+0x0/0x20 returned 0 after 0 usecs
calling  irq_sysfs_init+0x0/0x150 @ 1
initcall irq_sysfs_init+0x0/0x150 returned 0 after 2000 usecs
calling  audit_init+0x0/0x260 @ 1
audit: initializing netlink subsys (disabled)
initcall audit_init+0x0/0x260 returned 0 after 6000 usecs
audit: type=3D2000 audit(1678406273.802:1): state=3Dinitialized audit_enabl=
ed=3D0 res=3D1
calling  release_early_probes+0x0/0x80 @ 1
initcall release_early_probes+0x0/0x80 returned 0 after 0 usecs
calling  bdi_class_init+0x0/0x80 @ 1
initcall bdi_class_init+0x0/0x80 returned 0 after 0 usecs
calling  mm_sysfs_init+0x0/0x60 @ 1
initcall mm_sysfs_init+0x0/0x60 returned 0 after 0 usecs
calling  init_per_zone_wmark_min+0x0/0x30 @ 1
initcall init_per_zone_wmark_min+0x0/0x30 returned 0 after 0 usecs
calling  mpi_init+0x0/0x1c0 @ 1
initcall mpi_init+0x0/0x1c0 returned 0 after 0 usecs
calling  gpiolib_sysfs_init+0x0/0x150 @ 1
initcall gpiolib_sysfs_init+0x0/0x150 returned 0 after 0 usecs
calling  acpi_gpio_setup_params+0x0/0x1c0 @ 1
initcall acpi_gpio_setup_params+0x0/0x1c0 returned 0 after 0 usecs
calling  pcibus_class_init+0x0/0x20 @ 1
initcall pcibus_class_init+0x0/0x20 returned 0 after 0 usecs
calling  pci_driver_init+0x0/0x30 @ 1
initcall pci_driver_init+0x0/0x30 returned 0 after 0 usecs
calling  backlight_class_init+0x0/0x120 @ 1
initcall backlight_class_init+0x0/0x120 returned 0 after 0 usecs
calling  tty_class_init+0x0/0x70 @ 1
initcall tty_class_init+0x0/0x70 returned 0 after 0 usecs
calling  vtconsole_class_init+0x0/0x230 @ 1
initcall vtconsole_class_init+0x0/0x230 returned 0 after 1000 usecs
calling  iommu_dev_init+0x0/0x20 @ 1
initcall iommu_dev_init+0x0/0x20 returned 0 after 0 usecs
calling  mipi_dsi_bus_init+0x0/0x20 @ 1
initcall mipi_dsi_bus_init+0x0/0x20 returned 0 after 0 usecs
calling  devlink_class_init+0x0/0x60 @ 1
initcall devlink_class_init+0x0/0x60 returned 0 after 0 usecs
calling  software_node_init+0x0/0x60 @ 1
initcall software_node_init+0x0/0x60 returned 0 after 0 usecs
calling  wakeup_sources_debugfs_init+0x0/0x30 @ 1
initcall wakeup_sources_debugfs_init+0x0/0x30 returned 0 after 0 usecs
calling  wakeup_sources_sysfs_init+0x0/0x40 @ 1
initcall wakeup_sources_sysfs_init+0x0/0x40 returned 0 after 0 usecs
calling  regmap_initcall+0x0/0x20 @ 1
initcall regmap_initcall+0x0/0x20 returned 0 after 0 usecs
calling  spi_init+0x0/0xe0 @ 1
initcall spi_init+0x0/0xe0 returned 0 after 0 usecs
calling  i2c_init+0x0/0x110 @ 1
initcall i2c_init+0x0/0x110 returned 0 after 0 usecs
calling  thermal_init+0x0/0x2d0 @ 1
thermal_sys: Registered thermal governor 'fair_share'
thermal_sys: Registered thermal governor 'bang_bang'
thermal_sys: Registered thermal governor 'step_wise'
thermal_sys: Registered thermal governor 'user_space'
initcall thermal_init+0x0/0x2d0 returned 0 after 21000 usecs
calling  init_menu+0x0/0x20 @ 1
cpuidle: using governor menu
initcall init_menu+0x0/0x20 returned 0 after 5000 usecs
calling  init_haltpoll+0x0/0x30 @ 1
initcall init_haltpoll+0x0/0x30 returned 0 after 0 usecs
calling  pcc_init+0x0/0xe0 @ 1
initcall pcc_init+0x0/0xe0 returned -19 after 0 usecs
calling  kobject_uevent_init+0x0/0x10 @ 1
initcall kobject_uevent_init+0x0/0x10 returned 0 after 0 usecs
calling  bts_init+0x0/0x160 @ 1
initcall bts_init+0x0/0x160 returned -19 after 0 usecs
calling  pt_init+0x0/0x310 @ 1
initcall pt_init+0x0/0x310 returned 0 after 0 usecs
calling  boot_params_ksysfs_init+0x0/0xa0 @ 1
initcall boot_params_ksysfs_init+0x0/0xa0 returned 0 after 0 usecs
calling  sbf_init+0x0/0xe0 @ 1
initcall sbf_init+0x0/0xe0 returned 0 after 0 usecs
calling  arch_kdebugfs_init+0x0/0xa0 @ 1
initcall arch_kdebugfs_init+0x0/0xa0 returned 0 after 0 usecs
calling  xfd_update_static_branch+0x0/0x50 @ 1
initcall xfd_update_static_branch+0x0/0x50 returned 0 after 0 usecs
calling  intel_pconfig_init+0x0/0xc0 @ 1
initcall intel_pconfig_init+0x0/0xc0 returned 0 after 0 usecs
calling  mtrr_if_init+0x0/0xc0 @ 1
initcall mtrr_if_init+0x0/0xc0 returned 0 after 0 usecs
calling  activate_jump_labels+0x0/0x40 @ 1
initcall activate_jump_labels+0x0/0x40 returned 0 after 0 usecs
calling  init_s4_sigcheck+0x0/0xa0 @ 1
initcall init_s4_sigcheck+0x0/0xa0 returned 0 after 0 usecs
calling  ffh_cstate_init+0x0/0x70 @ 1
initcall ffh_cstate_init+0x0/0x70 returned 0 after 0 usecs
calling  kvm_alloc_cpumask+0x0/0x270 @ 1
initcall kvm_alloc_cpumask+0x0/0x270 returned 0 after 0 usecs
calling  activate_jump_labels+0x0/0x40 @ 1
initcall activate_jump_labels+0x0/0x40 returned 0 after 0 usecs
calling  gigantic_pages_init+0x0/0x50 @ 1
initcall gigantic_pages_init+0x0/0x50 returned 0 after 0 usecs
calling  uv_rtc_setup_clock+0x0/0x3d0 @ 1
initcall uv_rtc_setup_clock+0x0/0x3d0 returned -19 after 0 usecs
calling  kcmp_cookies_init+0x0/0xb0 @ 1
initcall kcmp_cookies_init+0x0/0xb0 returned 0 after 0 usecs
calling  cryptomgr_init+0x0/0x20 @ 1
initcall cryptomgr_init+0x0/0x20 returned 0 after 0 usecs
calling  acpi_pci_init+0x0/0x170 @ 1
ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
initcall acpi_pci_init+0x0/0x170 returned 0 after 16000 usecs
calling  dma_channel_table_init+0x0/0x220 @ 1
initcall dma_channel_table_init+0x0/0x220 returned 0 after 0 usecs
calling  dma_bus_init+0x0/0x290 @ 1
initcall dma_bus_init+0x0/0x290 returned 0 after 0 usecs
calling  iommu_dma_init+0x0/0x50 @ 1
initcall iommu_dma_init+0x0/0x50 returned 0 after 0 usecs
calling  dmi_id_init+0x0/0x1b0 @ 1
initcall dmi_id_init+0x0/0x1b0 returned 0 after 1000 usecs
calling  pci_arch_init+0x0/0x150 @ 1
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (b=
ase 0xe0000000)
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved as E820 entry
PCI: Using configuration type 1 for base access
initcall pci_arch_init+0x0/0x150 returned 0 after 44000 usecs
calling  init_vdso_image_64+0x0/0x20 @ 1
initcall init_vdso_image_64+0x0/0x20 returned 0 after 0 usecs
calling  init_vdso_image_32+0x0/0x20 @ 1
initcall init_vdso_image_32+0x0/0x20 returned 0 after 0 usecs
calling  fixup_ht_bug+0x0/0x420 @ 1
initcall fixup_ht_bug+0x0/0x420 returned 0 after 0 usecs
calling  topology_init+0x0/0xc0 @ 1
initcall topology_init+0x0/0xc0 returned 0 after 2000 usecs
calling  intel_epb_init+0x0/0x110 @ 1
initcall intel_epb_init+0x0/0x110 returned 0 after 0 usecs
calling  mtrr_init_finialize+0x0/0x80 @ 1
initcall mtrr_init_finialize+0x0/0x80 returned 0 after 0 usecs
calling  uid_cache_init+0x0/0x110 @ 1
initcall uid_cache_init+0x0/0x110 returned 0 after 0 usecs
calling  param_sysfs_init+0x0/0x50 @ 1
initcall param_sysfs_init+0x0/0x50 returned 0 after 0 usecs
calling  user_namespace_sysctl_init+0x0/0x140 @ 1
initcall user_namespace_sysctl_init+0x0/0x140 returned 0 after 0 usecs
calling  proc_schedstat_init+0x0/0x30 @ 1
initcall proc_schedstat_init+0x0/0x30 returned 0 after 0 usecs
calling  pm_sysrq_init+0x0/0x20 @ 1
initcall pm_sysrq_init+0x0/0x20 returned 0 after 0 usecs
calling  create_proc_profile+0x0/0xe0 @ 1
initcall create_proc_profile+0x0/0xe0 returned 0 after 0 usecs
calling  crash_save_vmcoreinfo_init+0x0/0x780 @ 1
initcall crash_save_vmcoreinfo_init+0x0/0x780 returned 0 after 1000 usecs
calling  crash_notes_memory_init+0x0/0x40 @ 1
initcall crash_notes_memory_init+0x0/0x40 returned 0 after 0 usecs
calling  cgroup_sysfs_init+0x0/0x50 @ 1
initcall cgroup_sysfs_init+0x0/0x50 returned 0 after 0 usecs
calling  cgroup_namespaces_init+0x0/0x10 @ 1
initcall cgroup_namespaces_init+0x0/0x10 returned 0 after 0 usecs
calling  user_namespaces_init+0x0/0x40 @ 1
initcall user_namespaces_init+0x0/0x40 returned 0 after 0 usecs
calling  init_optprobes+0x0/0x30 @ 1
kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if =
possible.
initcall init_optprobes+0x0/0x30 returned 0 after 10000 usecs
calling  hung_task_init+0x0/0x80 @ 1
initcall hung_task_init+0x0/0x80 returned 0 after 0 usecs
calling  ftrace_check_for_weak_functions+0x0/0x90 @ 1
initcall ftrace_check_for_weak_functions+0x0/0x90 returned 0 after 0 usecs
calling  trace_eval_init+0x0/0xe0 @ 1
initcall trace_eval_init+0x0/0xe0 returned 0 after 1000 usecs
calling  send_signal_irq_work_init+0x0/0x1d0 @ 1
initcall send_signal_irq_work_init+0x0/0x1d0 returned 0 after 0 usecs
calling  dev_map_init+0x0/0x190 @ 1
initcall dev_map_init+0x0/0x190 returned 0 after 0 usecs
calling  cpu_map_init+0x0/0x180 @ 1
initcall cpu_map_init+0x0/0x180 returned 0 after 0 usecs
calling  netns_bpf_init+0x0/0x20 @ 1
initcall netns_bpf_init+0x0/0x20 returned 0 after 0 usecs
calling  oom_init+0x0/0x50 @ 1
initcall oom_init+0x0/0x50 returned 0 after 0 usecs
calling  default_bdi_init+0x0/0x30 @ 1
initcall default_bdi_init+0x0/0x30 returned 0 after 1000 usecs
calling  cgwb_init+0x0/0x30 @ 1
initcall cgwb_init+0x0/0x30 returned 0 after 0 usecs
calling  percpu_enable_async+0x0/0x20 @ 1
initcall percpu_enable_async+0x0/0x20 returned 0 after 0 usecs
calling  kcompactd_init+0x0/0xa0 @ 1
initcall kcompactd_init+0x0/0xa0 returned 0 after 1000 usecs
calling  init_user_reserve+0x0/0xa0 @ 1
initcall init_user_reserve+0x0/0xa0 returned 0 after 0 usecs
calling  init_admin_reserve+0x0/0xa0 @ 1
initcall init_admin_reserve+0x0/0xa0 returned 0 after 0 usecs
calling  init_reserve_notifier+0x0/0x30 @ 1
initcall init_reserve_notifier+0x0/0x30 returned 0 after 0 usecs
calling  swap_init_sysfs+0x0/0xa0 @ 1
initcall swap_init_sysfs+0x0/0xa0 returned 0 after 0 usecs
calling  swapfile_init+0x0/0x180 @ 1
initcall swapfile_init+0x0/0x180 returned 0 after 0 usecs
calling  hugetlb_init+0x0/0xcb0 @ 1
HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
initcall hugetlb_init+0x0/0xcb0 returned 0 after 31000 usecs
calling  ksm_init+0x0/0x2a0 @ 1
initcall ksm_init+0x0/0x2a0 returned 0 after 2000 usecs
calling  memory_tier_init+0x0/0x150 @ 1
initcall memory_tier_init+0x0/0x150 returned 0 after 1000 usecs
calling  numa_init_sysfs+0x0/0xa0 @ 1
initcall numa_init_sysfs+0x0/0xa0 returned 0 after 0 usecs
calling  hugepage_init+0x0/0x1e0 @ 1
initcall hugepage_init+0x0/0x1e0 returned 0 after 1000 usecs
calling  mem_cgroup_init+0x0/0x4d0 @ 1
initcall mem_cgroup_init+0x0/0x4d0 returned 0 after 0 usecs
calling  mem_cgroup_swap_init+0x0/0x60 @ 1
initcall mem_cgroup_swap_init+0x0/0x60 returned 0 after 0 usecs
calling  page_idle_init+0x0/0x70 @ 1
initcall page_idle_init+0x0/0x70 returned 0 after 0 usecs
calling  damon_init+0x0/0x50 @ 1
initcall damon_init+0x0/0x50 returned 0 after 0 usecs
calling  damon_va_initcall+0x0/0x1b0 @ 1
initcall damon_va_initcall+0x0/0x1b0 returned 0 after 0 usecs
calling  damon_pa_initcall+0x0/0x100 @ 1
initcall damon_pa_initcall+0x0/0x100 returned 0 after 0 usecs
calling  damon_sysfs_init+0x0/0x1c0 @ 1
initcall damon_sysfs_init+0x0/0x1c0 returned 0 after 0 usecs
calling  seqiv_module_init+0x0/0x20 @ 1
initcall seqiv_module_init+0x0/0x20 returned 0 after 0 usecs
calling  rsa_init+0x0/0x50 @ 1
initcall rsa_init+0x0/0x50 returned 0 after 0 usecs
calling  hmac_module_init+0x0/0x20 @ 1
initcall hmac_module_init+0x0/0x20 returned 0 after 0 usecs
calling  crypto_null_mod_init+0x0/0x80 @ 1
initcall crypto_null_mod_init+0x0/0x80 returned 0 after 0 usecs
calling  md5_mod_init+0x0/0x20 @ 1
initcall md5_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  sha1_generic_mod_init+0x0/0x20 @ 1
initcall sha1_generic_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  sha256_generic_mod_init+0x0/0x20 @ 1
initcall sha256_generic_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  sha512_generic_mod_init+0x0/0x20 @ 1
initcall sha512_generic_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  crypto_ecb_module_init+0x0/0x20 @ 1
initcall crypto_ecb_module_init+0x0/0x20 returned 0 after 0 usecs
calling  crypto_cbc_module_init+0x0/0x20 @ 1
initcall crypto_cbc_module_init+0x0/0x20 returned 0 after 0 usecs
calling  crypto_cfb_module_init+0x0/0x20 @ 1
initcall crypto_cfb_module_init+0x0/0x20 returned 0 after 0 usecs
calling  crypto_ctr_module_init+0x0/0x20 @ 1
initcall crypto_ctr_module_init+0x0/0x20 returned 0 after 0 usecs
calling  crypto_gcm_module_init+0x0/0xb0 @ 1
initcall crypto_gcm_module_init+0x0/0xb0 returned 0 after 0 usecs
calling  cryptd_init+0x0/0x2a0 @ 1
cryptd: max_cpu_qlen set to 1000
initcall cryptd_init+0x0/0x2a0 returned 0 after 5000 usecs
calling  aes_init+0x0/0x20 @ 1
initcall aes_init+0x0/0x20 returned 0 after 0 usecs
calling  sm4_init+0x0/0x20 @ 1
initcall sm4_init+0x0/0x20 returned 0 after 0 usecs
calling  deflate_mod_init+0x0/0x50 @ 1
initcall deflate_mod_init+0x0/0x50 returned 0 after 0 usecs
calling  crc32c_mod_init+0x0/0x20 @ 1
initcall crc32c_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  crct10dif_mod_init+0x0/0x20 @ 1
initcall crct10dif_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  lzo_mod_init+0x0/0x50 @ 1
initcall lzo_mod_init+0x0/0x50 returned 0 after 0 usecs
calling  lzorle_mod_init+0x0/0x50 @ 1
initcall lzorle_mod_init+0x0/0x50 returned 0 after 0 usecs
calling  drbg_init+0x0/0x100 @ 1
initcall drbg_init+0x0/0x100 returned 0 after 0 usecs
calling  ghash_mod_init+0x0/0x20 @ 1
initcall ghash_mod_init+0x0/0x20 returned 0 after 0 usecs
calling  init_bio+0x0/0x140 @ 1
initcall init_bio+0x0/0x140 returned 0 after 1000 usecs
calling  blk_ioc_init+0x0/0x30 @ 1
initcall blk_ioc_init+0x0/0x30 returned 0 after 0 usecs
calling  blk_mq_init+0x0/0x1e0 @ 1
initcall blk_mq_init+0x0/0x1e0 returned 0 after 0 usecs
calling  genhd_device_init+0x0/0x90 @ 1
initcall genhd_device_init+0x0/0x90 returned 0 after 0 usecs
calling  blkcg_init+0x0/0x30 @ 1
initcall blkcg_init+0x0/0x30 returned 0 after 1000 usecs
calling  io_wq_init+0x0/0x40 @ 1
initcall io_wq_init+0x0/0x40 returned 0 after 0 usecs
calling  sg_pool_init+0x0/0x210 @ 1
initcall sg_pool_init+0x0/0x210 returned 0 after 0 usecs
calling  irq_poll_setup+0x0/0x1b0 @ 1
initcall irq_poll_setup+0x0/0x1b0 returned 0 after 0 usecs
calling  gpiolib_debugfs_init+0x0/0x30 @ 1
initcall gpiolib_debugfs_init+0x0/0x30 returned 0 after 0 usecs
calling  pwm_debugfs_init+0x0/0x30 @ 1
initcall pwm_debugfs_init+0x0/0x30 returned 0 after 0 usecs
calling  pwm_sysfs_init+0x0/0x20 @ 1
initcall pwm_sysfs_init+0x0/0x20 returned 0 after 0 usecs
calling  pci_slot_init+0x0/0x50 @ 1
initcall pci_slot_init+0x0/0x50 returned 0 after 0 usecs
calling  fbmem_init+0x0/0xf0 @ 1
initcall fbmem_init+0x0/0xf0 returned 0 after 1000 usecs
calling  scan_for_dmi_ipmi+0x0/0x60 @ 1
initcall scan_for_dmi_ipmi+0x0/0x60 returned 0 after 0 usecs
calling  acpi_init+0x0/0x2c0 @ 1
ACPI: Added _OSI(Module Device)
ACPI: Added _OSI(Processor Device)
ACPI: Added _OSI(3.0 _SCP Extensions)
ACPI: Added _OSI(Processor Aggregator Device)
ACPI: 8 ACPI AML tables successfully acquired and loaded
ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881034C0800 0006C3 (v02 PmRef  Cpu0Ist  00003000 INTL 201=
21018)
ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881034AD800 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 201=
21018)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881048D2000 0005AA (v02 PmRef  ApIst    00003000 INTL 201=
21018)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF888103799400 000119 (v02 PmRef  ApCst    00003000 INTL 201=
21018)
ACPI: EC: EC started
ACPI: EC: interrupt blocked
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions
ACPI: Interpreter enabled
ACPI: PM: (supports S0 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
PCI: Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs" a=
nd report a bug
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
acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MS=
I HPX-Type3]
acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug P=
ME LTR]
acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configurati=
on
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
pci 0000:00:00.0: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:00.0: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:02.0: [8086:191d] type 00 class 0x030000
pci 0000:00:02.0: reg 0x10: [mem 0xd0000000-0xd0ffffff 64bit]
pci 0000:00:02.0: reg 0x18: [mem 0xc0000000-0xcfffffff 64bit pref]
pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
pci 0000:00:02.0: calling  efifb_fixup_resources+0x0/0x4e0 @ 1
pci 0000:00:02.0: efifb_fixup_resources+0x0/0x4e0 took 0 usecs
pci 0000:00:02.0: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:02.0: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:02.0: calling  pci_fixup_video+0x0/0x2b0 @ 1
pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000df=
fff]
pci 0000:00:02.0: pci_fixup_video+0x0/0x2b0 took 9765 usecs
pci 0000:00:14.0: [8086:a12f] type 00 class 0x0c0330
pci 0000:00:14.0: reg 0x10: [mem 0xd1020000-0xd102ffff 64bit]
pci 0000:00:14.0: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:14.0: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:14.0: PME# supported from D3hot D3cold
pci 0000:00:14.2: [8086:a131] type 00 class 0x118000
pci 0000:00:14.2: reg 0x10: [mem 0xd104a000-0xd104afff 64bit]
pci 0000:00:14.2: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:14.2: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:16.0: [8086:a13a] type 00 class 0x078000
pci 0000:00:16.0: reg 0x10: [mem 0xd104b000-0xd104bfff 64bit]
pci 0000:00:16.0: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:16.0: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:16.0: PME# supported from D3hot
pci 0000:00:16.3: [8086:a13d] type 00 class 0x070002
pci 0000:00:16.3: reg 0x10: [io  0x3080-0x3087]
pci 0000:00:16.3: reg 0x14: [mem 0xd104f000-0xd104ffff]
pci 0000:00:16.3: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:16.3: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:17.0: [8086:2822] type 00 class 0x010400
pci 0000:00:17.0: reg 0x10: [mem 0xd1048000-0xd1049fff]
pci 0000:00:17.0: reg 0x14: [mem 0xd104e000-0xd104e0ff]
pci 0000:00:17.0: reg 0x18: [io  0x3088-0x308f]
pci 0000:00:17.0: reg 0x1c: [io  0x3090-0x3093]
pci 0000:00:17.0: reg 0x20: [io  0x3060-0x307f]
pci 0000:00:17.0: reg 0x24: [mem 0xd104c000-0xd104c7ff]
pci 0000:00:17.0: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:17.0: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:17.0: PME# supported from D3hot
pci 0000:00:1f.0: [8086:a149] type 00 class 0x060100
pci 0000:00:1f.0: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:1f.0: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:1f.2: [8086:a121] type 00 class 0x058000
pci 0000:00:1f.2: reg 0x10: [mem 0xd1044000-0xd1047fff]
pci 0000:00:1f.2: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:1f.2: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:1f.3: [8086:a170] type 00 class 0x040300
pci 0000:00:1f.3: reg 0x10: [mem 0xd1040000-0xd1043fff 64bit]
pci 0000:00:1f.3: reg 0x20: [mem 0xd1030000-0xd103ffff 64bit]
pci 0000:00:1f.3: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:1f.3: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:1f.3: PME# supported from D3hot D3cold
pci 0000:00:1f.4: [8086:a123] type 00 class 0x0c0500
pci 0000:00:1f.4: reg 0x10: [mem 0xd104d000-0xd104d0ff 64bit]
pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
pci 0000:00:1f.4: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:1f.4: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
pci 0000:00:1f.6: calling  quirk_f0_vpd_link+0x0/0x220 @ 1
pci 0000:00:1f.6: quirk_f0_vpd_link+0x0/0x220 took 0 usecs
pci 0000:00:1f.6: [8086:15b7] type 00 class 0x020000
pci 0000:00:1f.6: reg 0x10: [mem 0xd1000000-0xd101ffff]
pci 0000:00:1f.6: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 1
pci 0000:00:1f.6: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
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
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: EC: GPE=3D0x6e
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete
ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
initcall acpi_init+0x0/0x2c0 returned 0 after 3277000 usecs
calling  adxl_init+0x0/0x2b0 @ 1
initcall adxl_init+0x0/0x2b0 returned -19 after 0 usecs
calling  pnp_init+0x0/0x20 @ 1
initcall pnp_init+0x0/0x20 returned 0 after 0 usecs
calling  misc_init+0x0/0x100 @ 1
initcall misc_init+0x0/0x100 returned 0 after 0 usecs
calling  tpm_init+0x0/0x280 @ 1
initcall tpm_init+0x0/0x280 returned 0 after 1000 usecs
calling  iommu_subsys_init+0x0/0x260 @ 1
iommu: Default domain type: Translated=20
iommu: DMA domain TLB invalidation policy: lazy mode=20
initcall iommu_subsys_init+0x0/0x260 returned 0 after 12000 usecs
calling  cn_init+0x0/0x180 @ 1
initcall cn_init+0x0/0x180 returned 0 after 0 usecs
calling  dax_core_init+0x0/0x120 @ 1
initcall dax_core_init+0x0/0x120 returned 0 after 1000 usecs
calling  dma_buf_init+0x0/0xd0 @ 1
initcall dma_buf_init+0x0/0xd0 returned 0 after 0 usecs
calling  dma_resv_lockdep+0x0/0x510 @ 1
initcall dma_resv_lockdep+0x0/0x510 returned 0 after 0 usecs
calling  dma_heap_init+0x0/0xc0 @ 1
initcall dma_heap_init+0x0/0xc0 returned 0 after 0 usecs
calling  init_scsi+0x0/0x90 @ 1
SCSI subsystem initialized
initcall init_scsi+0x0/0x90 returned 0 after 6000 usecs
calling  phy_init+0x0/0x80 @ 1
initcall phy_init+0x0/0x80 returned 0 after 1000 usecs
calling  usb_common_init+0x0/0x30 @ 1
initcall usb_common_init+0x0/0x30 returned 0 after 0 usecs
calling  usb_init+0x0/0x1b0 @ 1
ACPI: bus type USB registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
initcall usb_init+0x0/0x1b0 returned 0 after 23000 usecs
calling  xdbc_init+0x0/0x250 @ 1
initcall xdbc_init+0x0/0x250 returned 0 after 0 usecs
calling  typec_init+0x0/0xc0 @ 1
initcall typec_init+0x0/0xc0 returned 0 after 0 usecs
calling  serio_init+0x0/0x40 @ 1
initcall serio_init+0x0/0x40 returned 0 after 0 usecs
calling  input_init+0x0/0x150 @ 1
initcall input_init+0x0/0x150 returned 0 after 0 usecs
calling  rtc_init+0x0/0x90 @ 1
initcall rtc_init+0x0/0x90 returned 0 after 0 usecs
calling  pps_init+0x0/0x110 @ 1
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giome=
tti@linux.it>
initcall pps_init+0x0/0x110 returned 0 after 16000 usecs
calling  ptp_init+0x0/0xe0 @ 1
PTP clock support registered
initcall ptp_init+0x0/0xe0 returned 0 after 5000 usecs
calling  power_supply_class_init+0x0/0x80 @ 1
initcall power_supply_class_init+0x0/0x80 returned 0 after 0 usecs
calling  hwmon_init+0x0/0x1a0 @ 1
initcall hwmon_init+0x0/0x1a0 returned 0 after 0 usecs
calling  md_init+0x0/0x170 @ 1
initcall md_init+0x0/0x170 returned 0 after 0 usecs
calling  edac_init+0x0/0x80 @ 1
EDAC MC: Ver: 3.0.0
initcall edac_init+0x0/0x80 returned 0 after 5000 usecs
calling  leds_init+0x0/0xa0 @ 1
initcall leds_init+0x0/0xa0 returned 0 after 0 usecs
calling  dmi_init+0x0/0x160 @ 1
initcall dmi_init+0x0/0x160 returned 0 after 0 usecs
calling  efisubsys_init+0x0/0x460 @ 1
initcall efisubsys_init+0x0/0x460 returned 0 after 0 usecs
calling  ras_init+0x0/0x20 @ 1
initcall ras_init+0x0/0x20 returned 0 after 1000 usecs
calling  nvmem_init+0x0/0x20 @ 1
initcall nvmem_init+0x0/0x20 returned 0 after 0 usecs
calling  proto_init+0x0/0x20 @ 1
initcall proto_init+0x0/0x20 returned 0 after 0 usecs
calling  net_dev_init+0x0/0x9a0 @ 1
initcall net_dev_init+0x0/0x9a0 returned 0 after 2000 usecs
calling  neigh_init+0x0/0x90 @ 1
initcall neigh_init+0x0/0x90 returned 0 after 0 usecs
calling  fib_notifier_init+0x0/0x20 @ 1
initcall fib_notifier_init+0x0/0x20 returned 0 after 0 usecs
calling  netdev_genl_init+0x0/0x50 @ 1
initcall netdev_genl_init+0x0/0x50 returned 0 after 0 usecs
calling  fib_rules_init+0x0/0xc0 @ 1
initcall fib_rules_init+0x0/0xc0 returned 0 after 0 usecs
calling  init_cgroup_netprio+0x0/0x20 @ 1
initcall init_cgroup_netprio+0x0/0x20 returned 0 after 0 usecs
calling  bpf_lwt_init+0x0/0x20 @ 1
initcall bpf_lwt_init+0x0/0x20 returned 0 after 0 usecs
calling  pktsched_init+0x0/0x120 @ 1
initcall pktsched_init+0x0/0x120 returned 0 after 0 usecs
calling  tc_filter_init+0x0/0x140 @ 1
initcall tc_filter_init+0x0/0x140 returned 0 after 0 usecs
calling  tc_action_init+0x0/0x60 @ 1
initcall tc_action_init+0x0/0x60 returned 0 after 0 usecs
calling  ethnl_init+0x0/0x70 @ 1
initcall ethnl_init+0x0/0x70 returned 0 after 1000 usecs
calling  nexthop_init+0x0/0x100 @ 1
initcall nexthop_init+0x0/0x100 returned 0 after 0 usecs
calling  cipso_v4_init+0x0/0x100 @ 1
initcall cipso_v4_init+0x0/0x100 returned 0 after 0 usecs
calling  devlink_init+0x0/0x30 @ 1
initcall devlink_init+0x0/0x30 returned 0 after 1000 usecs
calling  netlbl_init+0x0/0x90 @ 1
NetLabel: Initializing
NetLabel:  domain hash size =3D 128
NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
NetLabel:  unlabeled traffic allowed by default
initcall netlbl_init+0x0/0x90 returned 0 after 23000 usecs
calling  pci_subsys_init+0x0/0x190 @ 1
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
e820: reserve RAM buffer [mem 0x00091c00-0x0009ffff]
e820: reserve RAM buffer [mem 0xb30fb000-0xb3ffffff]
e820: reserve RAM buffer [mem 0xb3f00000-0xb3ffffff]
e820: reserve RAM buffer [mem 0x43f800000-0x43fffffff]
initcall pci_subsys_init+0x0/0x190 returned 0 after 67000 usecs
calling  vsprintf_init_hashval+0x0/0x20 @ 1
initcall vsprintf_init_hashval+0x0/0x20 returned 0 after 0 usecs
calling  efi_runtime_map_init+0x0/0x230 @ 1
initcall efi_runtime_map_init+0x0/0x230 returned 0 after 0 usecs
calling  vga_arb_device_init+0x0/0xf0 @ 1
pci 0000:00:02.0: vgaarb: setting as boot VGA device
pci 0000:00:02.0: vgaarb: bridge control possible
pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dio+mem,=
locks=3Dnone
vgaarb: loaded
initcall vga_arb_device_init+0x0/0xf0 returned 0 after 27000 usecs
calling  watchdog_init+0x0/0x1a0 @ 1
initcall watchdog_init+0x0/0x1a0 returned 0 after 0 usecs
calling  nmi_warning_debugfs+0x0/0x60 @ 1
initcall nmi_warning_debugfs+0x0/0x60 returned 0 after 0 usecs
calling  save_microcode_in_initrd+0x0/0xe0 @ 1
initcall save_microcode_in_initrd+0x0/0xe0 returned 0 after 0 usecs
calling  hpet_late_init+0x0/0x1a0 @ 1
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
hpet0: 8 comparators, 64-bit 24.000000 MHz counter
initcall hpet_late_init+0x0/0x1a0 returned 0 after 16000 usecs
calling  iomem_init_inode+0x0/0xc0 @ 1
initcall iomem_init_inode+0x0/0xc0 returned 0 after 1000 usecs
calling  clocksource_done_booting+0x0/0x50 @ 1
clocksource: Switched to clocksource tsc-early
initcall clocksource_done_booting+0x0/0x50 returned 0 after 6369 usecs
calling  tracer_init_tracefs+0x0/0x1d0 @ 1
initcall tracer_init_tracefs+0x0/0x1d0 returned 0 after 57 usecs
calling  init_trace_printk_function_export+0x0/0x30 @ 1
initcall init_trace_printk_function_export+0x0/0x30 returned 0 after 79 use=
cs
calling  init_graph_tracefs+0x0/0x30 @ 1
initcall init_graph_tracefs+0x0/0x30 returned 0 after 40 usecs
calling  trace_events_synth_init+0x0/0x50 @ 1
initcall trace_events_synth_init+0x0/0x50 returned 0 after 50 usecs
calling  bpf_event_init+0x0/0x20 @ 1
initcall bpf_event_init+0x0/0x20 returned 0 after 2 usecs
calling  init_kprobe_trace+0x0/0x410 @ 1
initcall init_kprobe_trace+0x0/0x410 returned 0 after 421432 usecs
calling  init_dynamic_event+0x0/0x30 @ 1
initcall init_dynamic_event+0x0/0x30 returned 0 after 57 usecs
calling  init_uprobe_trace+0x0/0x70 @ 1
initcall init_uprobe_trace+0x0/0x70 returned 0 after 90 usecs
calling  bpf_init+0x0/0xb0 @ 1
initcall bpf_init+0x0/0xb0 returned 0 after 19 usecs
calling  secretmem_init+0x0/0x70 @ 1
initcall secretmem_init+0x0/0x70 returned 0 after 0 usecs
calling  init_fs_stat_sysctls+0x0/0x40 @ 1
initcall init_fs_stat_sysctls+0x0/0x40 returned 0 after 43 usecs
calling  init_fs_exec_sysctls+0x0/0x30 @ 1
initcall init_fs_exec_sysctls+0x0/0x30 returned 0 after 12 usecs
calling  init_pipe_fs+0x0/0x70 @ 1
initcall init_pipe_fs+0x0/0x70 returned 0 after 357 usecs
calling  init_fs_namei_sysctls+0x0/0x30 @ 1
initcall init_fs_namei_sysctls+0x0/0x30 returned 0 after 15 usecs
calling  init_fs_dcache_sysctls+0x0/0x30 @ 1
initcall init_fs_dcache_sysctls+0x0/0x30 returned 0 after 12 usecs
calling  init_fs_namespace_sysctls+0x0/0x30 @ 1
initcall init_fs_namespace_sysctls+0x0/0x30 returned 0 after 12 usecs
calling  cgroup_writeback_init+0x0/0x30 @ 1
initcall cgroup_writeback_init+0x0/0x30 returned 0 after 43 usecs
calling  inotify_user_setup+0x0/0x1c0 @ 1
initcall inotify_user_setup+0x0/0x1c0 returned 0 after 64 usecs
calling  eventpoll_init+0x0/0x170 @ 1
initcall eventpoll_init+0x0/0x170 returned 0 after 141 usecs
calling  anon_inode_init+0x0/0xa0 @ 1
initcall anon_inode_init+0x0/0xa0 returned 0 after 334 usecs
calling  init_dax_wait_table+0x0/0x40 @ 1
initcall init_dax_wait_table+0x0/0x40 returned 0 after 269 usecs
calling  proc_locks_init+0x0/0x30 @ 1
initcall proc_locks_init+0x0/0x30 returned 0 after 15 usecs
calling  init_fs_coredump_sysctls+0x0/0x30 @ 1
initcall init_fs_coredump_sysctls+0x0/0x30 returned 0 after 14 usecs
calling  iomap_init+0x0/0x30 @ 1
initcall iomap_init+0x0/0x30 returned 0 after 1030 usecs
calling  dquot_init+0x0/0x180 @ 1
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
initcall dquot_init+0x0/0x180 returned 0 after 12661 usecs
calling  quota_init+0x0/0x30 @ 1
initcall quota_init+0x0/0x30 returned 0 after 212 usecs
calling  proc_cmdline_init+0x0/0xe0 @ 1
initcall proc_cmdline_init+0x0/0xe0 returned 0 after 13 usecs
calling  proc_consoles_init+0x0/0x30 @ 1
initcall proc_consoles_init+0x0/0x30 returned 0 after 12 usecs
calling  proc_cpuinfo_init+0x0/0x30 @ 1
initcall proc_cpuinfo_init+0x0/0x30 returned 0 after 35 usecs
calling  proc_devices_init+0x0/0x80 @ 1
initcall proc_devices_init+0x0/0x80 returned 0 after 32 usecs
calling  proc_interrupts_init+0x0/0x30 @ 1
initcall proc_interrupts_init+0x0/0x30 returned 0 after 24 usecs
calling  proc_loadavg_init+0x0/0x70 @ 1
initcall proc_loadavg_init+0x0/0x70 returned 0 after 12 usecs
calling  proc_meminfo_init+0x0/0x70 @ 1
initcall proc_meminfo_init+0x0/0x70 returned 0 after 11 usecs
calling  proc_stat_init+0x0/0x30 @ 1
initcall proc_stat_init+0x0/0x30 returned 0 after 12 usecs
calling  proc_uptime_init+0x0/0x70 @ 1
initcall proc_uptime_init+0x0/0x70 returned 0 after 12 usecs
calling  proc_version_init+0x0/0x70 @ 1
initcall proc_version_init+0x0/0x70 returned 0 after 11 usecs
calling  proc_softirqs_init+0x0/0x70 @ 1
initcall proc_softirqs_init+0x0/0x70 returned 0 after 11 usecs
calling  proc_kcore_init+0x0/0x2c0 @ 1
initcall proc_kcore_init+0x0/0x2c0 returned 0 after 122 usecs
calling  vmcore_init+0x0/0x360 @ 1
initcall vmcore_init+0x0/0x360 returned 0 after 0 usecs
calling  proc_kmsg_init+0x0/0x30 @ 1
initcall proc_kmsg_init+0x0/0x30 returned 0 after 12 usecs
calling  proc_page_init+0x0/0x60 @ 1
initcall proc_page_init+0x0/0x60 returned 0 after 32 usecs
calling  init_ramfs_fs+0x0/0x20 @ 1
initcall init_ramfs_fs+0x0/0x20 returned 0 after 1 usecs
calling  init_hugetlbfs_fs+0x0/0x360 @ 1
initcall init_hugetlbfs_fs+0x0/0x360 returned 0 after 587 usecs
calling  dynamic_debug_init_control+0x0/0x90 @ 1
initcall dynamic_debug_init_control+0x0/0x90 returned 0 after 103 usecs
calling  acpi_event_init+0x0/0x70 @ 1
initcall acpi_event_init+0x0/0x70 returned 0 after 209 usecs
calling  pnp_system_init+0x0/0x20 @ 1
initcall pnp_system_init+0x0/0x20 returned 0 after 161 usecs
calling  pnpacpi_init+0x0/0xf0 @ 1
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
system 00:09: [mem 0xfed90000-0xfed93fff] has been reserved
system 00:09: [mem 0xfed45000-0xfed8ffff] could not be reserved
system 00:09: [mem 0xff000000-0xffffffff] could not be reserved
system 00:09: [mem 0xfee00000-0xfeefffff] could not be reserved
system 00:09: [mem 0xfedc0000-0xfeddffff] has been reserved
pnp: PnP ACPI: found 11 devices
initcall pnpacpi_init+0x0/0xf0 returned 0 after 249770 usecs
calling  chr_dev_init+0x0/0x170 @ 1
initcall chr_dev_init+0x0/0x170 returned 0 after 33619 usecs
calling  hwrng_modinit+0x0/0x110 @ 1
initcall hwrng_modinit+0x0/0x110 returned 0 after 513 usecs
calling  firmware_class_init+0x0/0x170 @ 1
initcall firmware_class_init+0x0/0x170 returned 0 after 176 usecs
calling  init_acpi_pm_clocksource+0x0/0xf0 @ 1
clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 208=
5701024 ns
initcall init_acpi_pm_clocksource+0x0/0xf0 returned 0 after 14295 usecs
calling  powercap_init+0x0/0x30 @ 1
initcall powercap_init+0x0/0x30 returned 0 after 644 usecs
calling  sysctl_core_init+0x0/0x30 @ 1
initcall sysctl_core_init+0x0/0x30 returned 0 after 88 usecs
calling  eth_offload_init+0x0/0x20 @ 1
initcall eth_offload_init+0x0/0x20 returned 0 after 16 usecs
calling  ipv4_offload_init+0x0/0xa0 @ 1
initcall ipv4_offload_init+0x0/0xa0 returned 0 after 1 usecs
calling  inet_init+0x0/0x3a0 @ 1
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 8192 (order: 7, 589824 bytes, =
linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear=
)
TCP bind hash table entries: 65536 (order: 11, 9437184 bytes, vmalloc hugep=
age)
TCP: Hash tables configured (established 131072 bind 65536)
MPTCP token hash table entries: 16384 (order: 8, 1441792 bytes, linear)
UDP hash table entries: 8192 (order: 8, 1310720 bytes, linear)
UDP-Lite hash table entries: 8192 (order: 8, 1310720 bytes, linear)
initcall inet_init+0x0/0x3a0 returned 0 after 99889 usecs
calling  af_unix_init+0x0/0x1e0 @ 1
NET: Registered PF_UNIX/PF_LOCAL protocol family
initcall af_unix_init+0x0/0x1e0 returned 0 after 6754 usecs
calling  ipv6_offload_init+0x0/0x90 @ 1
initcall ipv6_offload_init+0x0/0x90 returned 0 after 1 usecs
calling  init_sunrpc+0x0/0xa0 @ 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
initcall init_sunrpc+0x0/0xa0 returned 0 after 27236 usecs
calling  vlan_offload_init+0x0/0x30 @ 1
initcall vlan_offload_init+0x0/0x30 returned 0 after 1 usecs
calling  xsk_init+0x0/0x210 @ 1
NET: Registered PF_XDP protocol family
initcall xsk_init+0x0/0x210 returned 0 after 5646 usecs
calling  pcibios_assign_resources+0x0/0x320 @ 1
pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
pci_bus 0000:00: resource 7 [mem 0xbe800000-0xdfffffff window]
pci_bus 0000:00: resource 8 [mem 0x1c00000000-0x1fffffffff window]
pci_bus 0000:00: resource 9 [mem 0xfd000000-0xfe7fffff window]
initcall pcibios_assign_resources+0x0/0x320 returned 0 after 47673 usecs
calling  pci_apply_final_quirks+0x0/0x3c0 @ 1
pci 0000:00:14.0: calling  quirk_usb_early_handoff+0x0/0x2f0 @ 1
IOAPIC[0]: Preconfigured routing entry (2-16 -> IRQ 16 Level:1 ActiveLow:1)
pci 0000:00:14.0: quirk_usb_early_handoff+0x0/0x2f0 took 16461 usecs
pci 0000:00:1f.6: calling  quirk_e100_interrupt+0x0/0x2d0 @ 1
pci 0000:00:1f.6: quirk_e100_interrupt+0x0/0x2d0 took 0 usecs
PCI: CLS 0 bytes, default 64
initcall pci_apply_final_quirks+0x0/0x3c0 returned 0 after 53194 usecs
calling  acpi_reserve_resources+0x0/0x2d0 @ 1
initcall acpi_reserve_resources+0x0/0x2d0 returned 0 after 49 usecs
calling  populate_rootfs+0x0/0x50 @ 1
initcall populate_rootfs+0x0/0x50 returned 0 after 93 usecs
Trying to unpack rootfs image as initramfs...
calling  pci_iommu_init+0x0/0x60 @ 1
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x00000000af0fb000-0x00000000b30fb000] (64MB)
initcall pci_iommu_init+0x0/0x60 returned 0 after 16084 usecs
calling  ir_dev_scope_init+0x0/0x80 @ 1
initcall ir_dev_scope_init+0x0/0x80 returned 0 after 0 usecs
calling  ia32_binfmt_init+0x0/0x20 @ 1
initcall ia32_binfmt_init+0x0/0x20 returned 0 after 99 usecs
calling  amd_ibs_init+0x0/0x200 @ 1
initcall amd_ibs_init+0x0/0x200 returned -19 after 0 usecs
calling  msr_init+0x0/0x90 @ 1
initcall msr_init+0x0/0x90 returned 0 after 30 usecs
calling  register_kernel_offset_dumper+0x0/0x20 @ 1
initcall register_kernel_offset_dumper+0x0/0x20 returned 0 after 1 usecs
calling  i8259A_init_ops+0x0/0x30 @ 1
initcall i8259A_init_ops+0x0/0x30 returned 0 after 1 usecs
calling  init_tsc_clocksource+0x0/0x170 @ 1
initcall init_tsc_clocksource+0x0/0x170 returned 0 after 6 usecs
calling  add_rtc_cmos+0x0/0x1d0 @ 1
initcall add_rtc_cmos+0x0/0x1d0 returned 0 after 2 usecs
calling  i8237A_init_ops+0x0/0x40 @ 1
initcall i8237A_init_ops+0x0/0x40 returned -19 after 2 usecs
calling  umwait_init+0x0/0xf0 @ 1
initcall umwait_init+0x0/0xf0 returned -19 after 0 usecs
calling  sgx_init+0x0/0x190 @ 1
initcall sgx_init+0x0/0x190 returned -19 after 0 usecs
calling  msr_init+0x0/0x130 @ 1
initcall msr_init+0x0/0x130 returned 0 after 3122 usecs
calling  cpuid_init+0x0/0x130 @ 1
initcall cpuid_init+0x0/0x130 returned 0 after 2248 usecs
calling  ioapic_init_ops+0x0/0x20 @ 1
initcall ioapic_init_ops+0x0/0x20 returned 0 after 14 usecs
calling  register_e820_pmem+0x0/0x80 @ 1
initcall register_e820_pmem+0x0/0x80 returned 0 after 4 usecs
calling  add_pcspkr+0x0/0xe0 @ 1
initcall add_pcspkr+0x0/0xe0 returned 0 after 328 usecs
calling  start_periodic_check_for_corruption+0x0/0x80 @ 1
initcall start_periodic_check_for_corruption+0x0/0x80 returned 0 after 0 us=
ecs
calling  audit_classes_init+0x0/0xc0 @ 1
initcall audit_classes_init+0x0/0xc0 returned 0 after 100 usecs
calling  sha1_ssse3_mod_init+0x0/0x200 @ 1
initcall sha1_ssse3_mod_init+0x0/0x200 returned 0 after 30 usecs
calling  sha256_ssse3_mod_init+0x0/0x380 @ 1
initcall sha256_ssse3_mod_init+0x0/0x380 returned 0 after 18 usecs
calling  iosf_mbi_init+0x0/0x30 @ 1
initcall iosf_mbi_init+0x0/0x30 returned 0 after 231 usecs
calling  proc_execdomains_init+0x0/0x30 @ 1
initcall proc_execdomains_init+0x0/0x30 returned 0 after 31 usecs
calling  register_warn_debugfs+0x0/0x30 @ 1
initcall register_warn_debugfs+0x0/0x30 returned 0 after 45 usecs
calling  cpuhp_sysfs_init+0x0/0x180 @ 1
initcall cpuhp_sysfs_init+0x0/0x180 returned 0 after 222 usecs
calling  ioresources_init+0x0/0x50 @ 1
initcall ioresources_init+0x0/0x50 returned 0 after 25 usecs
calling  lockdep_proc_init+0x0/0x70 @ 1
initcall lockdep_proc_init+0x0/0x70 returned 0 after 34 usecs
calling  snapshot_device_init+0x0/0x20 @ 1
initcall snapshot_device_init+0x0/0x20 returned 0 after 467 usecs
calling  irq_pm_init_ops+0x0/0x20 @ 1
initcall irq_pm_init_ops+0x0/0x20 returned 0 after 1 usecs
calling  klp_init+0x0/0x60 @ 1
initcall klp_init+0x0/0x60 returned 0 after 24 usecs
calling  map_benchmark_init+0x0/0x60 @ 1
initcall map_benchmark_init+0x0/0x60 returned 0 after 368 usecs
calling  proc_modules_init+0x0/0x30 @ 1
initcall proc_modules_init+0x0/0x30 returned 0 after 14 usecs
calling  timer_sysctl_init+0x0/0x20 @ 1
initcall timer_sysctl_init+0x0/0x20 returned 0 after 14 usecs
calling  timekeeping_init_ops+0x0/0x20 @ 1
initcall timekeeping_init_ops+0x0/0x20 returned 0 after 1 usecs
calling  init_clocksource_sysfs+0x0/0x30 @ 1
initcall init_clocksource_sysfs+0x0/0x30 returned 0 after 679 usecs
calling  init_timer_list_procfs+0x0/0x40 @ 1
initcall init_timer_list_procfs+0x0/0x40 returned 0 after 16 usecs
calling  alarmtimer_init+0x0/0x140 @ 1
initcall alarmtimer_init+0x0/0x140 returned 0 after 201 usecs
calling  init_posix_timers+0x0/0x30 @ 1
initcall init_posix_timers+0x0/0x30 returned 0 after 60 usecs
calling  clockevents_init_sysfs+0x0/0x1f0 @ 1
initcall clockevents_init_sysfs+0x0/0x1f0 returned 0 after 1681 usecs
calling  proc_dma_init+0x0/0x30 @ 1
initcall proc_dma_init+0x0/0x30 returned 0 after 14 usecs
calling  kallsyms_init+0x0/0x30 @ 1
initcall kallsyms_init+0x0/0x30 returned 0 after 13 usecs
calling  pid_namespaces_init+0x0/0x60 @ 1
initcall pid_namespaces_init+0x0/0x60 returned 0 after 218 usecs
calling  ikconfig_init+0x0/0x50 @ 1
initcall ikconfig_init+0x0/0x50 returned 0 after 29 usecs
calling  audit_watch_init+0x0/0x50 @ 1
initcall audit_watch_init+0x0/0x50 returned 0 after 38 usecs
calling  audit_fsnotify_init+0x0/0x50 @ 1
initcall audit_fsnotify_init+0x0/0x50 returned 0 after 23 usecs
calling  audit_tree_init+0x0/0xe0 @ 1
initcall audit_tree_init+0x0/0xe0 returned 0 after 62 usecs
calling  seccomp_sysctl_init+0x0/0x40 @ 1
initcall seccomp_sysctl_init+0x0/0x40 returned 0 after 96 usecs
calling  utsname_sysctl_init+0x0/0x20 @ 1
initcall utsname_sysctl_init+0x0/0x20 returned 0 after 93 usecs
calling  init_tracepoints+0x0/0x40 @ 1
initcall init_tracepoints+0x0/0x40 returned 0 after 8 usecs
calling  init_lstats_procfs+0x0/0x40 @ 1
initcall init_lstats_procfs+0x0/0x40 returned 0 after 44 usecs
calling  stack_trace_init+0x0/0xb0 @ 1
initcall stack_trace_init+0x0/0xb0 returned 0 after 123 usecs
calling  perf_event_sysfs_init+0x0/0x130 @ 1
initcall perf_event_sysfs_init+0x0/0x130 returned 0 after 3662 usecs
calling  system_trusted_keyring_init+0x0/0xa0 @ 1
Initialise system trusted keyrings
initcall system_trusted_keyring_init+0x0/0xa0 returned 0 after 5338 usecs
calling  blacklist_init+0x0/0x1d0 @ 1
Key type blacklist registered
initcall blacklist_init+0x0/0x1d0 returned 0 after 4897 usecs
calling  kswapd_init+0x0/0x60 @ 1
initcall kswapd_init+0x0/0x60 returned 0 after 327 usecs
calling  extfrag_debug_init+0x0/0x60 @ 1
initcall extfrag_debug_init+0x0/0x60 returned 0 after 120 usecs
calling  mm_compute_batch_init+0x0/0x60 @ 1
initcall mm_compute_batch_init+0x0/0x60 returned 0 after 2 usecs
calling  slab_proc_init+0x0/0x30 @ 1
initcall slab_proc_init+0x0/0x30 returned 0 after 16 usecs
calling  workingset_init+0x0/0x100 @ 1
workingset: timestamp_bits=3D36 max_order=3D22 bucket_order=3D0
initcall workingset_init+0x0/0x100 returned 0 after 7310 usecs
calling  proc_vmalloc_init+0x0/0x70 @ 1
initcall proc_vmalloc_init+0x0/0x70 returned 0 after 14 usecs
calling  procswaps_init+0x0/0x30 @ 1
initcall procswaps_init+0x0/0x30 returned 0 after 13 usecs
calling  init_frontswap+0x0/0xa0 @ 1
initcall init_frontswap+0x0/0xa0 returned 0 after 220 usecs
calling  slab_debugfs_init+0x0/0x70 @ 1
initcall slab_debugfs_init+0x0/0x70 returned 0 after 17952 usecs
calling  init_zbud+0x0/0x30 @ 1
zbud: loaded
initcall init_zbud+0x0/0x30 returned 0 after 3353 usecs
calling  zs_init+0x0/0x90 @ 1
initcall zs_init+0x0/0x90 returned 0 after 339 usecs
calling  damon_dbgfs_init+0x0/0x450 @ 1
initcall damon_dbgfs_init+0x0/0x450 returned 0 after 491 usecs
calling  fcntl_init+0x0/0x30 @ 1
initcall fcntl_init+0x0/0x30 returned 0 after 42 usecs
calling  proc_filesystems_init+0x0/0x30 @ 1
initcall proc_filesystems_init+0x0/0x30 returned 0 after 16 usecs
calling  start_dirtytime_writeback+0x0/0x70 @ 1
initcall start_dirtytime_writeback+0x0/0x70 returned 0 after 2 usecs
calling  dio_init+0x0/0x40 @ 1
initcall dio_init+0x0/0x40 returned 0 after 54 usecs
calling  dnotify_init+0x0/0xb0 @ 1
initcall dnotify_init+0x0/0xb0 returned 0 after 128 usecs
calling  fanotify_user_setup+0x0/0x220 @ 1
initcall fanotify_user_setup+0x0/0x220 returned 0 after 166 usecs
calling  userfaultfd_init+0x0/0x50 @ 1
initcall userfaultfd_init+0x0/0x50 returned 0 after 513 usecs
calling  aio_setup+0x0/0xa0 @ 1
initcall aio_setup+0x0/0xa0 returned 0 after 443 usecs
calling  mbcache_init+0x0/0x40 @ 1
initcall mbcache_init+0x0/0x40 returned 0 after 37 usecs
calling  init_grace+0x0/0x20 @ 1
initcall init_grace+0x0/0x20 returned 0 after 13 usecs
calling  init_v2_quota_format+0x0/0x30 @ 1
initcall init_v2_quota_format+0x0/0x30 returned 0 after 22 usecs
calling  init_devpts_fs+0x0/0x40 @ 1
initcall init_devpts_fs+0x0/0x40 returned 0 after 103 usecs
calling  ext4_init_fs+0x0/0x1e0 @ 1
initcall ext4_init_fs+0x0/0x1e0 returned 0 after 1500 usecs
calling  journal_init+0x0/0x150 @ 1
initcall journal_init+0x0/0x150 returned 0 after 217 usecs
calling  init_nfs_fs+0x0/0x1d0 @ 1
initcall init_nfs_fs+0x0/0x1d0 returned 0 after 1607 usecs
calling  init_nfs_v3+0x0/0x20 @ 1
initcall init_nfs_v3+0x0/0x20 returned 0 after 27 usecs
calling  init_nlm+0x0/0x70 @ 1
initcall init_nlm+0x0/0x70 returned 0 after 126 usecs
calling  init_nls_cp437+0x0/0x20 @ 1
initcall init_nls_cp437+0x0/0x20 returned 0 after 20 usecs
calling  init_nls_ascii+0x0/0x20 @ 1
initcall init_nls_ascii+0x0/0x20 returned 0 after 1 usecs
calling  init_autofs_fs+0x0/0x40 @ 1
tsc: Refined TSC clocksource calibration: 3312.000 MHz
initcall init_autofs_fs+0x0/0x40 returned 0 after 1643 usecs
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2fbd93f9e57, max_i=
dle_ns: 440795263784 ns
calling  efivarfs_init+0x0/0x20 @ 1
initcall efivarfs_init+0x0/0x20 returned 0 after 2 usecs
calling  ipc_init+0x0/0x30 @ 1
clocksource: Switched to clocksource tsc
initcall ipc_init+0x0/0x30 returned 0 after 174 usecs
calling  ipc_sysctl_init+0x0/0x30 @ 1
initcall ipc_sysctl_init+0x0/0x30 returned 0 after 110 usecs
calling  init_mqueue_fs+0x0/0xe0 @ 1
initcall init_mqueue_fs+0x0/0xe0 returned 0 after 452 usecs
calling  key_proc_init+0x0/0x80 @ 1
initcall key_proc_init+0x0/0x80 returned 0 after 24 usecs
calling  jent_mod_init+0x0/0x40 @ 1
initcall jent_mod_init+0x0/0x40 returned 0 after 6648 usecs
calling  af_alg_init+0x0/0x50 @ 1
NET: Registered PF_ALG protocol family
initcall af_alg_init+0x0/0x50 returned 0 after 5585 usecs
calling  algif_hash_init+0x0/0x20 @ 1
initcall algif_hash_init+0x0/0x20 returned 0 after 67 usecs
calling  algif_skcipher_init+0x0/0x20 @ 1
initcall algif_skcipher_init+0x0/0x20 returned 0 after 8 usecs
calling  rng_init+0x0/0x20 @ 1
initcall rng_init+0x0/0x20 returned 0 after 7 usecs
calling  algif_aead_init+0x0/0x20 @ 1
initcall algif_aead_init+0x0/0x20 returned 0 after 24 usecs
calling  asymmetric_key_init+0x0/0x20 @ 1
Key type asymmetric registered
initcall asymmetric_key_init+0x0/0x20 returned 0 after 4897 usecs
calling  x509_key_init+0x0/0x20 @ 1
Asymmetric key parser 'x509' registered
initcall x509_key_init+0x0/0x20 returned 0 after 5742 usecs
calling  blkdev_init+0x0/0x30 @ 1
initcall blkdev_init+0x0/0x30 returned 0 after 141 usecs
calling  proc_genhd_init+0x0/0x50 @ 1
initcall proc_genhd_init+0x0/0x50 returned 0 after 27 usecs
calling  bsg_init+0x0/0x140 @ 1
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
initcall bsg_init+0x0/0x140 returned 0 after 8370 usecs
calling  throtl_init+0x0/0x50 @ 1
initcall throtl_init+0x0/0x50 returned 0 after 373 usecs
calling  deadline_init+0x0/0x20 @ 1
io scheduler mq-deadline registered
initcall deadline_init+0x0/0x20 returned 0 after 5344 usecs
calling  kyber_init+0x0/0x20 @ 1
io scheduler kyber registered
initcall kyber_init+0x0/0x20 returned 0 after 4793 usecs
calling  bfq_init+0x0/0xa0 @ 1
io scheduler bfq registered
initcall bfq_init+0x0/0xa0 returned 0 after 4812 usecs
calling  io_uring_init+0x0/0x40 @ 1
initcall io_uring_init+0x0/0x40 returned 0 after 36 usecs
calling  test_firmware_init+0x0/0x1a0 @ 1
test_firmware: interface ready
initcall test_firmware_init+0x0/0x1a0 returned 0 after 5625 usecs
calling  test_sysctl_init+0x0/0x5e0 @ 1
initcall test_sysctl_init+0x0/0x5e0 returned 0 after 137 usecs
calling  blake2s_mod_init+0x0/0x10 @ 1
initcall blake2s_mod_init+0x0/0x10 returned 0 after 0 usecs
calling  crc_t10dif_mod_init+0x0/0x80 @ 1
initcall crc_t10dif_mod_init+0x0/0x80 returned 0 after 124 usecs
calling  percpu_counter_startup+0x0/0x60 @ 1
initcall percpu_counter_startup+0x0/0x60 returned 0 after 165 usecs
calling  digsig_init+0x0/0x50 @ 1
initcall digsig_init+0x0/0x50 returned 0 after 29 usecs
calling  pcie_portdrv_init+0x0/0x50 @ 1
initcall pcie_portdrv_init+0x0/0x50 returned 0 after 803 usecs
calling  pci_proc_init+0x0/0x80 @ 1
initcall pci_proc_init+0x0/0x80 returned 0 after 178 usecs
calling  pci_hotplug_init+0x0/0x10 @ 1
initcall pci_hotplug_init+0x0/0x10 returned 0 after 0 usecs
calling  shpcd_init+0x0/0x70 @ 1
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
initcall shpcd_init+0x0/0x70 returned 0 after 7730 usecs
calling  pci_stub_init+0x0/0x210 @ 1
initcall pci_stub_init+0x0/0x210 returned 0 after 188 usecs
calling  vmd_drv_init+0x0/0x20 @ 1
initcall vmd_drv_init+0x0/0x20 returned 0 after 173 usecs
calling  vesafb_driver_init+0x0/0x20 @ 1
initcall vesafb_driver_init+0x0/0x20 returned 0 after 148 usecs
calling  efifb_driver_init+0x0/0x20 @ 1
initcall efifb_driver_init+0x0/0x20 returned 0 after 140 usecs
calling  intel_idle_init+0x0/0x610 @ 1
initcall intel_idle_init+0x0/0x610 returned 0 after 7122 usecs
calling  ged_driver_init+0x0/0x20 @ 1
initcall ged_driver_init+0x0/0x20 returned 0 after 231 usecs
calling  acpi_ac_init+0x0/0x90 @ 1
initcall acpi_ac_init+0x0/0x90 returned 0 after 546 usecs
calling  acpi_button_driver_init+0x0/0xe0 @ 1
input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/in=
put0
ACPI: button: Sleep Button [SLPB]
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/in=
put1
ACPI: button: Power Button [PWRB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
ACPI: button: Power Button [PWRF]
initcall acpi_button_driver_init+0x0/0xe0 returned 0 after 47571 usecs
calling  acpi_fan_driver_init+0x0/0x20 @ 1
initcall acpi_fan_driver_init+0x0/0x20 returned 0 after 219 usecs
calling  acpi_processor_driver_init+0x0/0x100 @ 1
initcall acpi_processor_driver_init+0x0/0x100 returned 0 after 3745 usecs
calling  acpi_thermal_init+0x0/0x90 @ 1
initcall acpi_thermal_init+0x0/0x90 returned 0 after 828 usecs
calling  acpi_battery_init+0x0/0x80 @ 1
initcall acpi_battery_init+0x0/0x80 returned 0 after 17 usecs
calling  acpi_hed_driver_init+0x0/0x20 @ 1
initcall acpi_hed_driver_init+0x0/0x20 returned 0 after 261 usecs
calling  bgrt_init+0x0/0x1d0 @ 1
initcall bgrt_init+0x0/0x1d0 returned -19 after 0 usecs
calling  erst_init+0x0/0x550 @ 1
initcall erst_init+0x0/0x550 returned 0 after 50 usecs
calling  gpio_clk_driver_init+0x0/0x20 @ 1
initcall gpio_clk_driver_init+0x0/0x20 returned 0 after 161 usecs
calling  plt_clk_driver_init+0x0/0x20 @ 1
initcall plt_clk_driver_init+0x0/0x20 returned 0 after 137 usecs
calling  dw_pci_driver_init+0x0/0x20 @ 1
initcall dw_pci_driver_init+0x0/0x20 returned 0 after 170 usecs
calling  virtio_pci_driver_init+0x0/0x20 @ 1
initcall virtio_pci_driver_init+0x0/0x20 returned 0 after 174 usecs
calling  n_null_init+0x0/0x20 @ 1
initcall n_null_init+0x0/0x20 returned 0 after 1 usecs
calling  pty_init+0x0/0x20 @ 1
initcall pty_init+0x0/0x20 returned 0 after 724 usecs
calling  sysrq_init+0x0/0x80 @ 1
initcall sysrq_init+0x0/0x80 returned 0 after 31 usecs
calling  serial8250_init+0x0/0x3c0 @ 1
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:07: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) is a 16550A
initcall serial8250_init+0x0/0x3c0 returned 0 after 21211 usecs
calling  serial_pci_driver_init+0x0/0x20 @ 1
IOAPIC[0]: Preconfigured routing entry (2-19 -> IRQ 19 Level:1 ActiveLow:1)
0000:00:16.3: ttyS1 at I/O 0x3080 (irq =3D 19, base_baud =3D 115200) is a 1=
6550A
initcall serial_pci_driver_init+0x0/0x20 returned 0 after 25424 usecs
calling  exar_pci_driver_init+0x0/0x20 @ 1
initcall exar_pci_driver_init+0x0/0x20 returned 0 after 168 usecs
calling  pci1xxxx_pci_driver_init+0x0/0x20 @ 1
initcall pci1xxxx_pci_driver_init+0x0/0x20 returned 0 after 162 usecs
calling  dw8250_platform_driver_init+0x0/0x20 @ 1
initcall dw8250_platform_driver_init+0x0/0x20 returned 0 after 152 usecs
calling  lpss8250_pci_driver_init+0x0/0x20 @ 1
initcall lpss8250_pci_driver_init+0x0/0x20 returned 0 after 177 usecs
calling  mid8250_pci_driver_init+0x0/0x20 @ 1
initcall mid8250_pci_driver_init+0x0/0x20 returned 0 after 230 usecs
calling  pericom8250_pci_driver_init+0x0/0x20 @ 1
initcall pericom8250_pci_driver_init+0x0/0x20 returned 0 after 165 usecs
calling  random_sysctls_init+0x0/0x30 @ 1
initcall random_sysctls_init+0x0/0x30 returned 0 after 62 usecs
calling  hpet_init+0x0/0x90 @ 1
initcall hpet_init+0x0/0x90 returned 0 after 2068 usecs
calling  nvram_module_init+0x0/0xa0 @ 1
Non-volatile memory driver v1.3
initcall nvram_module_init+0x0/0xa0 returned 0 after 5653 usecs
calling  virtio_rng_driver_init+0x0/0x20 @ 1
initcall virtio_rng_driver_init+0x0/0x20 returned 0 after 195 usecs
calling  init_tis+0x0/0x170 @ 1
tpm_tis 00:0a: 1.2 TPM (device-id 0x1B, rev-id 16)
tpm tpm0: TPM is disabled/deactivated (0x7)
initcall init_tis+0x0/0x170 returned 0 after 38054 usecs
calling  crb_acpi_driver_init+0x0/0x20 @ 1
initcall crb_acpi_driver_init+0x0/0x20 returned 0 after 349 usecs
calling  cn_proc_init+0x0/0x50 @ 1
initcall cn_proc_init+0x0/0x50 returned 0 after 29 usecs
calling  topology_sysfs_init+0x0/0x30 @ 1
initcall topology_sysfs_init+0x0/0x30 returned 0 after 886 usecs
calling  cacheinfo_sysfs_init+0x0/0x30 @ 1
initcall cacheinfo_sysfs_init+0x0/0x30 returned 0 after 4472 usecs
calling  lkdtm_module_init+0x0/0x330 @ 1
lkdtm: No crash points registered, enable through debugfs
initcall lkdtm_module_init+0x0/0x330 returned 0 after 7850 usecs
calling  intel_lpss_init+0x0/0x30 @ 1
initcall intel_lpss_init+0x0/0x30 returned 0 after 53 usecs
calling  intel_lpss_pci_driver_init+0x0/0x20 @ 1
initcall intel_lpss_pci_driver_init+0x0/0x20 returned 0 after 205 usecs
calling  intel_lpss_acpi_driver_init+0x0/0x20 @ 1
initcall intel_lpss_acpi_driver_init+0x0/0x20 returned 0 after 161 usecs
calling  system_heap_create+0x0/0xc0 @ 1
initcall system_heap_create+0x0/0xc0 returned 0 after 753 usecs
calling  udmabuf_dev_init+0x0/0xd0 @ 1
initcall udmabuf_dev_init+0x0/0xd0 returned 0 after 581 usecs
calling  mac_hid_init+0x0/0x30 @ 1
initcall mac_hid_init+0x0/0x30 returned 0 after 26 usecs
calling  rdac_init+0x0/0x80 @ 1
rdac: device handler registered
initcall rdac_init+0x0/0x80 returned 0 after 5563 usecs
calling  hp_sw_init+0x0/0x20 @ 1
hp_sw: device handler registered
initcall hp_sw_init+0x0/0x20 returned 0 after 5050 usecs
calling  clariion_init+0x0/0x40 @ 1
emc: device handler registered
initcall clariion_init+0x0/0x40 returned 0 after 4898 usecs
calling  alua_init+0x0/0x70 @ 1
alua: device handler registered
initcall alua_init+0x0/0x70 returned 0 after 5664 usecs
calling  macsec_init+0x0/0x80 @ 1
MACsec IEEE 802.1AE
initcall macsec_init+0x0/0x80 returned 0 after 4092 usecs
calling  blackhole_netdev_init+0x0/0xe0 @ 1
initcall blackhole_netdev_init+0x0/0xe0 returned 0 after 126 usecs
calling  phylink_init+0x0/0xc0 @ 1
initcall phylink_init+0x0/0xc0 returned 0 after 0 usecs
calling  phy_module_init+0x0/0x20 @ 1
initcall phy_module_init+0x0/0x20 returned 0 after 426 usecs
calling  fixed_mdio_bus_init+0x0/0x290 @ 1
initcall fixed_mdio_bus_init+0x0/0x290 returned 0 after 2318 usecs
calling  phy_module_init+0x0/0x20 @ 1
initcall phy_module_init+0x0/0x20 returned 0 after 2675 usecs
calling  vrf_init_module+0x0/0x90 @ 1
initcall vrf_init_module+0x0/0x90 returned 0 after 260 usecs
calling  cavium_ptp_driver_init+0x0/0x20 @ 1
initcall cavium_ptp_driver_init+0x0/0x20 returned 0 after 296 usecs
calling  e1000_init_module+0x0/0x80 @ 1
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
initcall e1000_init_module+0x0/0x80 returned 0 after 12490 usecs
calling  e1000_init_module+0x0/0x40 @ 1
e1000e: Intel(R) PRO/1000 Network Driver
e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
IOAPIC[0]: Preconfigured routing entry (2-16 -> IRQ 16 Level:1 ActiveLow:1)
e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) set to dynamic co=
nservative mode
e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered PHC clock
e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 3c:52:82:5d:1e:ba
e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: FFFFFF-0FF
initcall e1000_init_module+0x0/0x40 returned 0 after 207566 usecs
calling  igb_init_module+0x0/0x50 @ 1
igb: Intel(R) Gigabit Ethernet Network Driver
igb: Copyright (c) 2007-2014 Intel Corporation.
initcall igb_init_module+0x0/0x50 returned 0 after 12781 usecs
calling  igc_init_module+0x0/0x50 @ 1
Intel(R) 2.5G Ethernet Linux Driver
Copyright(c) 2018 Intel Corporation.
initcall igc_init_module+0x0/0x50 returned 0 after 11012 usecs
calling  ixgbe_init_module+0x0/0xc0 @ 1
ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver
ixgbe: Copyright (c) 1999-2016 Intel Corporation.
initcall ixgbe_init_module+0x0/0xc0 returned 0 after 14373 usecs
calling  i40e_init_module+0x0/0xd0 @ 1
i40e: Intel(R) Ethernet Connection XL710 Network Driver
i40e: Copyright (c) 2013 - 2019 Intel Corporation.
initcall i40e_init_module+0x0/0xd0 returned 0 after 14640 usecs
calling  rtl8169_pci_driver_init+0x0/0x20 @ 1
initcall rtl8169_pci_driver_init+0x0/0x20 returned 0 after 1146 usecs
calling  rtl8152_driver_init+0x0/0x40 @ 1
usbcore: registered new device driver r8152-cfgselector
usbcore: registered new interface driver r8152
initcall rtl8152_driver_init+0x0/0x40 returned 0 after 13805 usecs
calling  asix_driver_init+0x0/0x20 @ 1
usbcore: registered new interface driver asix
initcall asix_driver_init+0x0/0x20 returned 0 after 6415 usecs
calling  ax88179_178a_driver_init+0x0/0x20 @ 1
usbcore: registered new interface driver ax88179_178a
initcall ax88179_178a_driver_init+0x0/0x20 returned 0 after 7428 usecs
calling  usbnet_init+0x0/0x30 @ 1
initcall usbnet_init+0x0/0x30 returned 0 after 1 usecs
calling  usbport_trig_init+0x0/0x20 @ 1
initcall usbport_trig_init+0x0/0x20 returned 0 after 3 usecs
calling  mon_init+0x0/0x1c0 @ 1
initcall mon_init+0x0/0x1c0 returned 0 after 933 usecs
calling  ehci_hcd_init+0x0/0x1c0 @ 1
initcall ehci_hcd_init+0x0/0x1c0 returned 0 after 42 usecs
calling  ehci_pci_init+0x0/0x60 @ 1
initcall ehci_pci_init+0x0/0x60 returned 0 after 233 usecs
calling  ohci_hcd_mod_init+0x0/0xb0 @ 1
initcall ohci_hcd_mod_init+0x0/0xb0 returned 0 after 102 usecs
calling  ohci_pci_init+0x0/0x60 @ 1
initcall ohci_pci_init+0x0/0x60 returned 0 after 168 usecs
calling  uhci_hcd_init+0x0/0x150 @ 1
initcall uhci_hcd_init+0x0/0x150 returned 0 after 261 usecs
calling  xhci_hcd_init+0x0/0x30 @ 1
initcall xhci_hcd_init+0x0/0x30 returned 0 after 39 usecs
calling  xhci_pci_init+0x0/0x60 @ 1
initcall xhci_pci_init+0x0/0x60 returned 0 after 215 usecs
xhci_hcd 0000:00:14.0: xHCI Host Controller
calling  ucsi_acpi_platform_driver_init+0x0/0x20 @ 1
initcall ucsi_acpi_platform_driver_init+0x0/0x20 returned 0 after 206 usecs
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
calling  i8042_init+0x0/0x190 @ 1
i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,=
12
xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x000=
0000001109810
serio: i8042 KBD port at 0x60,0x64 irq 1
xhci_hcd 0000:00:14.0: xHCI Host Controller
serio: i8042 AUX port at 0x60,0x64 irq 12
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
initcall i8042_init+0x0/0x190 returned 0 after 59832 usecs
xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
calling  serport_init+0x0/0x40 @ 1
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevic=
e=3D 6.03
initcall serport_init+0x0/0x40 returned 0 after 1 usecs
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
calling  input_leds_init+0x0/0x20 @ 1
usb usb1: Product: xHCI Host Controller
initcall input_leds_init+0x0/0x20 returned 0 after 3 usecs
usb usb1: Manufacturer: Linux 6.3.0-rc1-00007-gef2f3f98fcf4 xhci-hcd
calling  mousedev_init+0x0/0xf0 @ 1
usb usb1: SerialNumber: 0000:00:14.0
mousedev: PS/2 mouse device common for all mice
initcall mousedev_init+0x0/0xf0 returned 0 after 14386 usecs
hub 1-0:1.0: USB hub found
calling  evdev_init+0x0/0x20 @ 1
initcall evdev_init+0x0/0x20 returned 0 after 2196 usecs
hub 1-0:1.0: 16 ports detected
calling  atkbd_init+0x0/0x30 @ 1
initcall atkbd_init+0x0/0x30 returned 0 after 264 usecs
calling  psmouse_init+0x0/0xa0 @ 1
initcall psmouse_init+0x0/0xa0 returned 0 after 411 usecs
calling  cmos_init+0x0/0x80 @ 1
rtc_cmos 00:03: RTC can wake from S4
rtc_cmos 00:03: registered as rtc0
rtc_cmos 00:03: setting system clock to 2023-03-09T23:58:07 UTC (1678406287=
)
rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram
initcall cmos_init+0x0/0x80 returned 0 after 32110 usecs
calling  thermal_throttle_init_device+0x0/0x60 @ 1
initcall thermal_throttle_init_device+0x0/0x60 returned 0 after 660 usecs
calling  esb_driver_init+0x0/0x20 @ 1
initcall esb_driver_init+0x0/0x20 returned 0 after 260 usecs
calling  iTCO_wdt_driver_init+0x0/0x20 @ 1
initcall iTCO_wdt_driver_init+0x0/0x20 returned 0 after 244 usecs
calling  iTCO_vendor_init_module+0x0/0x40 @ 1
iTCO_vendor_support: vendor-support=3D0
initcall iTCO_vendor_init_module+0x0/0x40 returned 0 after 5507 usecs
calling  ghes_edac_init+0x0/0x140 @ 1
initcall ghes_edac_init+0x0/0x140 returned -19 after 1 usecs
calling  intel_pstate_init+0x0/0xb80 @ 1
intel_pstate: HWP enabled by BIOS
intel_pstate: Intel P-state driver initializing
intel_pstate: HWP enabled
initcall intel_pstate_init+0x0/0xb80 returned 0 after 18348 usecs
calling  haltpoll_init+0x0/0x150 @ 1
initcall haltpoll_init+0x0/0x150 returned -19 after 0 usecs
calling  dmi_sysfs_init+0x0/0x230 @ 1
initcall dmi_sysfs_init+0x0/0x230 returned 0 after 8885 usecs
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDevic=
e=3D 6.03
calling  fw_cfg_sysfs_init+0x0/0xa0 @ 1
initcall fw_cfg_sysfs_init+0x0/0xa0 returned 0 after 243 usecs
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
calling  sysfb_init+0x0/0x150 @ 1
initcall sysfb_init+0x0/0x150 returned 0 after 534 usecs
usb usb2: Product: xHCI Host Controller
calling  esrt_sysfs_init+0x0/0x280 @ 1
usb usb2: Manufacturer: Linux 6.3.0-rc1-00007-gef2f3f98fcf4 xhci-hcd
initcall esrt_sysfs_init+0x0/0x280 returned -38 after 0 usecs
usb usb2: SerialNumber: 0000:00:14.0
calling  efivars_pstore_init+0x0/0xa0 @ 1
hub 2-0:1.0: USB hub found
initcall efivars_pstore_init+0x0/0xa0 returned 0 after 1 usecs
calling  hid_init+0x0/0x60 @ 1
hub 2-0:1.0: 10 ports detected
hid: raw HID events driver (C) Jiri Kosina
initcall hid_init+0x0/0x60 returned 0 after 29695 usecs
calling  hid_generic_init+0x0/0x20 @ 1
initcall hid_generic_init+0x0/0x20 returned 0 after 994 usecs
calling  magicmouse_driver_init+0x0/0x20 @ 1
initcall magicmouse_driver_init+0x0/0x20 returned 0 after 187 usecs
calling  sensor_hub_driver_init+0x0/0x20 @ 1
initcall sensor_hub_driver_init+0x0/0x20 returned 0 after 219 usecs
calling  hid_init+0x0/0x70 @ 1
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
initcall hid_init+0x0/0x70 returned 0 after 12403 usecs
calling  pmc_atom_init+0x0/0x90 @ 1
initcall pmc_atom_init+0x0/0x90 returned -19 after 23 usecs
calling  vmgenid_driver_init+0x0/0x20 @ 1
initcall vmgenid_driver_init+0x0/0x20 returned 0 after 404 usecs
calling  sock_diag_init+0x0/0x40 @ 1
initcall sock_diag_init+0x0/0x40 returned 0 after 164 usecs
calling  init_net_drop_monitor+0x0/0x360 @ 1
drop_monitor: Initializing network drop monitor service
initcall init_net_drop_monitor+0x0/0x360 returned 0 after 7390 usecs
calling  llc_init+0x0/0x30 @ 1
initcall llc_init+0x0/0x30 returned 0 after 2 usecs
calling  snap_init+0x0/0x40 @ 1
initcall snap_init+0x0/0x40 returned 0 after 66 usecs
calling  blackhole_init+0x0/0x20 @ 1
initcall blackhole_init+0x0/0x20 returned 0 after 1 usecs
calling  ingress_module_init+0x0/0x50 @ 1
initcall ingress_module_init+0x0/0x50 returned 0 after 2 usecs
calling  netem_module_init+0x0/0x30 @ 1
netem: version 1.3
initcall netem_module_init+0x0/0x30 returned 0 after 3912 usecs
calling  fq_codel_module_init+0x0/0x20 @ 1
initcall fq_codel_module_init+0x0/0x20 returned 0 after 1 usecs
calling  init_cgroup_cls+0x0/0x20 @ 1
initcall init_cgroup_cls+0x0/0x20 returned 0 after 48 usecs
calling  xt_init+0x0/0x3e0 @ 1
initcall xt_init+0x0/0x3e0 returned 0 after 179 usecs
calling  tcpudp_mt_init+0x0/0x20 @ 1
initcall tcpudp_mt_init+0x0/0x20 returned 0 after 98 usecs
calling  gre_offload_init+0x0/0x60 @ 1
initcall gre_offload_init+0x0/0x60 returned 0 after 1 usecs
calling  sysctl_ipv4_init+0x0/0x60 @ 1
initcall sysctl_ipv4_init+0x0/0x60 returned 0 after 299 usecs
calling  cubictcp_register+0x0/0x90 @ 1
initcall cubictcp_register+0x0/0x90 returned 0 after 1 usecs
calling  xfrm_user_init+0x0/0x40 @ 1
Initializing XFRM netlink socket
initcall xfrm_user_init+0x0/0x40 returned 0 after 5168 usecs
calling  inet6_init+0x0/0x4e0 @ 1
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
initcall inet6_init+0x0/0x4e0 returned 0 after 20420 usecs
calling  packet_init+0x0/0x90 @ 1
NET: Registered PF_PACKET protocol family
initcall packet_init+0x0/0x90 returned 0 after 5884 usecs
calling  strp_dev_init+0x0/0x40 @ 1
initcall strp_dev_init+0x0/0x40 returned 0 after 583 usecs
calling  vlan_proto_init+0x0/0xb0 @ 1
8021q: 802.1Q VLAN Support v1.8
initcall vlan_proto_init+0x0/0xb0 returned 0 after 5205 usecs
calling  init_p9+0x0/0x30 @ 1
9pnet: Installing 9P2000 support
initcall init_p9+0x0/0x30 returned 0 after 5242 usecs
calling  p9_trans_fd_init+0x0/0x30 @ 1
initcall p9_trans_fd_init+0x0/0x30 returned 0 after 22 usecs
calling  p9_virtio_init+0x0/0x60 @ 1
initcall p9_virtio_init+0x0/0x60 returned 0 after 168 usecs
calling  dcbnl_init+0x0/0x60 @ 1
initcall dcbnl_init+0x0/0x60 returned 0 after 36 usecs
calling  mpls_gso_init+0x0/0x30 @ 1
mpls_gso: MPLS GSO support
initcall mpls_gso_init+0x0/0x30 returned 0 after 4577 usecs
calling  nsh_init_module+0x0/0x20 @ 1
initcall nsh_init_module+0x0/0x20 returned 0 after 1 usecs
calling  pm_check_save_msr+0x0/0x70 @ 1
initcall pm_check_save_msr+0x0/0x70 returned 0 after 111 usecs
calling  plist_test+0x0/0x430 @ 1
start plist test
end plist test
initcall plist_test+0x0/0x430 returned 0 after 7993 usecs
calling  mcheck_init_device+0x0/0x2a0 @ 1
initcall mcheck_init_device+0x0/0x2a0 returned 0 after 3157 usecs
calling  dev_mcelog_init_device+0x0/0x1a0 @ 1
initcall dev_mcelog_init_device+0x0/0x1a0 returned 0 after 695 usecs
calling  kernel_do_mounts_initrd_sysctls_init+0x0/0x30 @ 1
initcall kernel_do_mounts_initrd_sysctls_init+0x0/0x30 returned 0 after 16 =
usecs
calling  tboot_late_init+0x0/0x260 @ 1
initcall tboot_late_init+0x0/0x260 returned 0 after 0 usecs
calling  sld_mitigate_sysctl_init+0x0/0x30 @ 1
initcall sld_mitigate_sysctl_init+0x0/0x30 returned 0 after 13 usecs
calling  mcheck_late_init+0x0/0xc0 @ 1
initcall mcheck_late_init+0x0/0xc0 returned 0 after 81 usecs
calling  severities_debugfs_init+0x0/0x30 @ 1
initcall severities_debugfs_init+0x0/0x30 returned 0 after 113 usecs
calling  microcode_init+0x0/0x280 @ 1
microcode: Microcode Update Driver: v2.2.
initcall microcode_init+0x0/0x280 returned 0 after 884 usecs
calling  resctrl_late_init+0x0/0x8b0 @ 1
initcall resctrl_late_init+0x0/0x8b0 returned -19 after 1 usecs
calling  hpet_insert_resource+0x0/0x30 @ 1
initcall hpet_insert_resource+0x0/0x30 returned 0 after 2 usecs
calling  start_sync_check_timer+0x0/0xd0 @ 1
initcall start_sync_check_timer+0x0/0xd0 returned 0 after 1 usecs
calling  update_mp_table+0x0/0x7d0 @ 1
initcall update_mp_table+0x0/0x7d0 returned 0 after 0 usecs
calling  lapic_insert_resource+0x0/0x50 @ 1
initcall lapic_insert_resource+0x0/0x50 returned 0 after 2 usecs
calling  print_ipi_mode+0x0/0x40 @ 1
IPI shorthand broadcast: enabled
initcall print_ipi_mode+0x0/0x40 returned 0 after 5069 usecs
calling  print_ICs+0x0/0x220 @ 1
... APIC ID:      00000000 (0)
... APIC VERSION: 01060015
0000000000000000000000000000000000000000000000000000000000000000
000000000000000c000000000000000000000000000000000000000000000000
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
pin01, enabled , edge , high, V(21), IRR(0), S(0), logical , D(0001), M(0)
pin02, enabled , edge , high, V(30), IRR(0), S(0), logical , D(0001), M(0)
pin03, disabled, edge , high, V(E0), IRR(0), S(0), physical, D(0201), M(2)
pin04, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin05, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin06, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin07, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin08, enabled , edge , high, V(22), IRR(0), S(0), logical , D(0004), M(0)
pin09, enabled , level, high, V(21), IRR(0), S(0), logical , D(0002), M(0)
pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin0b, disabled, edge , high, V(2B), IRR(0), S(0), physical, D(0052), M(2)
pin0c, enabled , edge , high, V(21), IRR(0), S(0), logical , D(0008), M(0)
pin0d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin0e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin0f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin10, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin11, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
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
pin22, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0020), M(2)
pin23, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin24, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin25, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin26, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin27, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin28, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin29, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2a, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2b, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2c, disabled, edge , high, V(02), IRR(0), S(0), physical, D(2183), M(2)
pin2d, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2e, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin2f, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin30, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin31, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin32, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin33, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin34, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin35, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0200), M(2)
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
pin4a, disabled, edge , high, V(08), IRR(0), S(0), physical, D(0800), M(2)
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
pin5f, disabled, edge , high, V(40), IRR(0), S(0), logical , D(1508), M(2)
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
pin73, disabled, edge , high, V(00), IRR(0), S(0), physical, D(00C3), M(2)
pin74, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin75, disabled, edge , high, V(00), IRR(0), S(0), physical, D(0000), M(0)
pin76, disabled, edge , high, V(00), IRR(0), S(0), remapped, I(0100),  Z(2)
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
initcall print_ICs+0x0/0x220 returned 0 after 1247828 usecs
calling  setup_efi_kvm_sev_migration+0x0/0x340 @ 1
initcall setup_efi_kvm_sev_migration+0x0/0x340 returned 0 after 0 usecs
calling  create_tlb_single_page_flush_ceiling+0x0/0x60 @ 1
initcall create_tlb_single_page_flush_ceiling+0x0/0x60 returned 0 after 113=
 usecs
calling  pat_memtype_list_init+0x0/0x70 @ 1
initcall pat_memtype_list_init+0x0/0x70 returned 0 after 39 usecs
calling  create_init_pkru_value+0x0/0x60 @ 1
initcall create_init_pkru_value+0x0/0x60 returned 0 after 0 usecs
calling  aesni_init+0x0/0x270 @ 1
AVX2 version of gcm_enc/dec engaged.
AES CTR mode by8 optimization enabled
initcall aesni_init+0x0/0x270 returned 0 after 11817 usecs
calling  kernel_panic_sysctls_init+0x0/0x30 @ 1
initcall kernel_panic_sysctls_init+0x0/0x30 returned 0 after 83 usecs
calling  kernel_panic_sysfs_init+0x0/0x50 @ 1
initcall kernel_panic_sysfs_init+0x0/0x50 returned 0 after 19 usecs
calling  kernel_exit_sysctls_init+0x0/0x30 @ 1
initcall kernel_exit_sysctls_init+0x0/0x30 returned 0 after 13 usecs
calling  kernel_exit_sysfs_init+0x0/0x50 @ 1
initcall kernel_exit_sysfs_init+0x0/0x50 returned 0 after 14 usecs
calling  param_sysfs_builtin_init+0x0/0xb0 @ 1
initcall param_sysfs_builtin_init+0x0/0xb0 returned 0 after 65277 usecs
calling  reboot_ksysfs_init+0x0/0xa0 @ 1
initcall reboot_ksysfs_init+0x0/0xa0 returned 0 after 78 usecs
calling  sched_core_sysctl_init+0x0/0x30 @ 1
initcall sched_core_sysctl_init+0x0/0x30 returned 0 after 14 usecs
calling  sched_fair_sysctl_init+0x0/0x30 @ 1
initcall sched_fair_sysctl_init+0x0/0x30 returned 0 after 27 usecs
calling  sched_rt_sysctl_init+0x0/0x30 @ 1
initcall sched_rt_sysctl_init+0x0/0x30 returned 0 after 14 usecs
calling  sched_dl_sysctl_init+0x0/0x30 @ 1
initcall sched_dl_sysctl_init+0x0/0x30 returned 0 after 258 usecs
calling  sched_clock_init_late+0x0/0x1e0 @ 1
sched_clock: Marking stable (15848633865, 3708880484)->(20224869232, -66735=
4883)
initcall sched_clock_init_late+0x0/0x1e0 returned 0 after 9683 usecs
calling  sched_init_debug+0x0/0x260 @ 1
initcall sched_init_debug+0x0/0x260 returned 0 after 2461 usecs
calling  kernel_lockdep_sysctls_init+0x0/0x30 @ 1
initcall kernel_lockdep_sysctls_init+0x0/0x30 returned 0 after 28 usecs
calling  cpu_latency_qos_init+0x0/0x50 @ 1
initcall cpu_latency_qos_init+0x0/0x50 returned 0 after 685 usecs
calling  pm_debugfs_init+0x0/0x30 @ 1
initcall pm_debugfs_init+0x0/0x30 returned 0 after 149 usecs
calling  printk_late_init+0x0/0x280 @ 1
initcall printk_late_init+0x0/0x280 returned 0 after 30 usecs
calling  rcu_verify_early_boot_tests+0x0/0x70 @ 1
initcall rcu_verify_early_boot_tests+0x0/0x70 returned 0 after 0 usecs
calling  rcu_tasks_verify_schedule_work+0x0/0x90 @ 1
initcall rcu_tasks_verify_schedule_work+0x0/0x90 returned 0 after 0 usecs
calling  init_srcu_module_notifier+0x0/0x40 @ 1
initcall init_srcu_module_notifier+0x0/0x40 returned 0 after 2 usecs
calling  swiotlb_create_default_debugfs+0x0/0x70 @ 1
initcall swiotlb_create_default_debugfs+0x0/0x70 returned 0 after 112 usecs
calling  tk_debug_sleep_time_init+0x0/0x30 @ 1
initcall tk_debug_sleep_time_init+0x0/0x30 returned 0 after 43 usecs
calling  bpf_ksym_iter_register+0x0/0x20 @ 1
initcall bpf_ksym_iter_register+0x0/0x20 returned 0 after 11 usecs
calling  kernel_acct_sysctls_init+0x0/0x30 @ 1
initcall kernel_acct_sysctls_init+0x0/0x30 returned 0 after 16 usecs
calling  kexec_core_sysctl_init+0x0/0x30 @ 1
initcall kexec_core_sysctl_init+0x0/0x30 returned 0 after 16 usecs
calling  bpf_rstat_kfunc_init+0x0/0x20 @ 1
initcall bpf_rstat_kfunc_init+0x0/0x20 returned 0 after 0 usecs
calling  debugfs_kprobe_init+0x0/0x80 @ 1
initcall debugfs_kprobe_init+0x0/0x80 returned 0 after 173 usecs
calling  kernel_delayacct_sysctls_init+0x0/0x30 @ 1
initcall kernel_delayacct_sysctls_init+0x0/0x30 returned 0 after 14 usecs
calling  taskstats_init+0x0/0x40 @ 1
registered taskstats version 1
initcall taskstats_init+0x0/0x40 returned 0 after 5039 usecs
calling  ftrace_sysctl_init+0x0/0x30 @ 1
initcall ftrace_sysctl_init+0x0/0x30 returned 0 after 13 usecs
calling  init_hwlat_tracer+0x0/0x120 @ 1
initcall init_hwlat_tracer+0x0/0x120 returned 0 after 644 usecs
calling  bpf_key_sig_kfuncs_init+0x0/0x20 @ 1
initcall bpf_key_sig_kfuncs_init+0x0/0x20 returned 0 after 0 usecs
calling  bpf_global_ma_init+0x0/0x30 @ 1
initcall bpf_global_ma_init+0x0/0x30 returned 0 after 1254 usecs
calling  bpf_syscall_sysctl_init+0x0/0x30 @ 1
initcall bpf_syscall_sysctl_init+0x0/0x30 returned 0 after 61 usecs
calling  kfunc_init+0x0/0x100 @ 1
initcall kfunc_init+0x0/0x100 returned 0 after 0 usecs
calling  bpf_map_iter_init+0x0/0x30 @ 1
initcall bpf_map_iter_init+0x0/0x30 returned 0 after 17 usecs
calling  task_iter_init+0x0/0x390 @ 1
initcall task_iter_init+0x0/0x390 returned 0 after 22 usecs
calling  bpf_prog_iter_init+0x0/0x20 @ 1
initcall bpf_prog_iter_init+0x0/0x20 returned 0 after 7 usecs
calling  bpf_link_iter_init+0x0/0x20 @ 1
initcall bpf_link_iter_init+0x0/0x20 returned 0 after 7 usecs
calling  init_trampolines+0x0/0x70 @ 1
initcall init_trampolines+0x0/0x70 returned 0 after 1 usecs
calling  bpf_offload_init+0x0/0x20 @ 1
initcall bpf_offload_init+0x0/0x20 returned 0 after 11 usecs
calling  bpf_cgroup_iter_init+0x0/0x30 @ 1
initcall bpf_cgroup_iter_init+0x0/0x30 returned 0 after 7 usecs
calling  cpumask_kfunc_init+0x0/0xe0 @ 1
initcall cpumask_kfunc_init+0x0/0xe0 returned 0 after 1267 usecs
calling  load_system_certificate_list+0x0/0x60 @ 1
Loading compiled-in X.509 certificates
Loaded X.509 cert 'Build time autogenerated kernel key: 9fc21cd2183f56b6fe0=
87a3166a12f0d71a11690'
initcall load_system_certificate_list+0x0/0x60 returned 0 after 18616 usecs
calling  fault_around_debugfs+0x0/0x30 @ 1
initcall fault_around_debugfs+0x0/0x30 returned 0 after 45 usecs
calling  max_swapfiles_check+0x0/0x10 @ 1
initcall max_swapfiles_check+0x0/0x10 returned 0 after 0 usecs
calling  init_zswap+0x0/0x430 @ 1
zswap: loaded using pool lzo/zbud
initcall init_zswap+0x0/0x430 returned 0 after 7492 usecs
calling  hugetlb_vmemmap_init+0x0/0x1d0 @ 1
initcall hugetlb_vmemmap_init+0x0/0x1d0 returned 0 after 20 usecs
calling  slab_sysfs_init+0x0/0x100 @ 1
initcall slab_sysfs_init+0x0/0x100 returned 0 after 78335 usecs
calling  kasan_cpu_quarantine_init+0x0/0x50 @ 1
initcall kasan_cpu_quarantine_init+0x0/0x50 returned 217 after 224 usecs
calling  split_huge_pages_debugfs+0x0/0x30 @ 1
initcall split_huge_pages_debugfs+0x0/0x30 returned 0 after 47 usecs
calling  gup_test_init+0x0/0x30 @ 1
initcall gup_test_init+0x0/0x30 returned 0 after 37 usecs
calling  pageowner_init+0x0/0x40 @ 1
page_owner is disabled
initcall pageowner_init+0x0/0x40 returned 0 after 4185 usecs
calling  check_early_ioremap_leak+0x0/0xb0 @ 1
initcall check_early_ioremap_leak+0x0/0xb0 returned 0 after 0 usecs
calling  set_hardened_usercopy+0x0/0x30 @ 1
initcall set_hardened_usercopy+0x0/0x30 returned 1 after 0 usecs
calling  fscrypt_init+0x0/0xe0 @ 1
Key type .fscrypt registered
Key type fscrypt-provisioning registered
initcall fscrypt_init+0x0/0xe0 returned 0 after 11811 usecs
calling  pstore_init+0x0/0x90 @ 1
initcall pstore_init+0x0/0x90 returned 0 after 18 usecs
calling  init_root_keyring+0x0/0x20 @ 1
initcall init_root_keyring+0x0/0x20 returned 0 after 326 usecs
calling  init_trusted+0x0/0x2c0 @ 1
Freeing initrd memory: 710592K
Key type trusted registered
initcall init_trusted+0x0/0x2c0 returned 0 after 28281845 usecs
calling  init_encrypted+0x0/0x180 @ 1
Key type encrypted registered
initcall init_encrypted+0x0/0x180 returned 0 after 39852 usecs
calling  integrity_fs_init+0x0/0x60 @ 1
initcall integrity_fs_init+0x0/0x60 returned 0 after 43 usecs
calling  init_ima+0x0/0x140 @ 1
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
initcall init_ima+0x0/0x140 returned 0 after 80628 usecs
calling  crypto_algapi_init+0x0/0x20 @ 1
initcall crypto_algapi_init+0x0/0x20 returned 0 after 15 usecs
calling  blk_timeout_init+0x0/0x20 @ 1
initcall blk_timeout_init+0x0/0x20 returned 0 after 0 usecs
calling  init_error_injection+0x0/0x70 @ 1
initcall init_error_injection+0x0/0x70 returned 0 after 6004 usecs
calling  pci_resource_alignment_sysfs_init+0x0/0x20 @ 1
initcall pci_resource_alignment_sysfs_init+0x0/0x20 returned 0 after 17 use=
cs
calling  pci_sysfs_init+0x0/0x90 @ 1
initcall pci_sysfs_init+0x0/0x90 returned 0 after 557 usecs
calling  bert_init+0x0/0x7c0 @ 1
initcall bert_init+0x0/0x7c0 returned 0 after 3 usecs
calling  clk_debug_init+0x0/0x150 @ 1
initcall clk_debug_init+0x0/0x150 returned 0 after 233 usecs
calling  dmar_free_unused_resources+0x0/0x2a0 @ 1
initcall dmar_free_unused_resources+0x0/0x2a0 returned 0 after 6 usecs
calling  sync_state_resume_initcall+0x0/0x20 @ 1
initcall sync_state_resume_initcall+0x0/0x20 returned 0 after 2 usecs
calling  deferred_probe_initcall+0x0/0xd0 @ 1
initcall deferred_probe_initcall+0x0/0xd0 returned 0 after 354 usecs
calling  sync_debugfs_init+0x0/0x60 @ 1
initcall sync_debugfs_init+0x0/0x60 returned 0 after 152 usecs
calling  firmware_memmap_init+0x0/0x60 @ 1
initcall firmware_memmap_init+0x0/0x60 returned 0 after 1158 usecs
calling  register_update_efi_random_seed+0x0/0x30 @ 1
initcall register_update_efi_random_seed+0x0/0x30 returned 0 after 0 usecs
calling  efi_shutdown_init+0x0/0x80 @ 1
initcall efi_shutdown_init+0x0/0x80 returned -19 after 0 usecs
calling  efi_earlycon_unmap_fb+0x0/0x70 @ 1
initcall efi_earlycon_unmap_fb+0x0/0x70 returned 0 after 0 usecs
calling  itmt_legacy_init+0x0/0x50 @ 1
initcall itmt_legacy_init+0x0/0x50 returned -19 after 0 usecs
calling  xdp_metadata_init+0x0/0x20 @ 1
initcall xdp_metadata_init+0x0/0x20 returned 0 after 0 usecs
calling  bpf_sockmap_iter_init+0x0/0x60 @ 1
initcall bpf_sockmap_iter_init+0x0/0x60 returned 0 after 8 usecs
calling  bpf_sk_storage_map_iter_init+0x0/0x60 @ 1
initcall bpf_sk_storage_map_iter_init+0x0/0x60 returned 0 after 6 usecs
calling  sch_default_qdisc+0x0/0x20 @ 1
initcall sch_default_qdisc+0x0/0x20 returned 0 after 2 usecs
calling  bpf_prog_test_run_init+0x0/0x100 @ 1
initcall bpf_prog_test_run_init+0x0/0x100 returned 0 after 0 usecs
calling  tcp_congestion_default+0x0/0x20 @ 1
initcall tcp_congestion_default+0x0/0x20 returned 0 after 1 usecs
calling  ip_auto_config+0x0/0xa10 @ 1
e1000e 0000:00:1f.6 eth0: NIC Link is Up 100 Mbps Full Duplex, Flow Control=
: Rx/Tx
e1000e 0000:00:1f.6 eth0: 10/100 speed: disabling TSO
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending DHCP requests ., OK
IP-Config: Got DHCP answer from 192.168.3.1, my address is 192.168.3.101
IP-Config: Complete:
device=3Deth0, hwaddr=3D3c:52:82:5d:1e:ba, ipaddr=3D192.168.3.101, mask=3D2=
55.255.255.0, gw=3D192.168.3.200
host=3Dlkp-skl-d06, domain=3Dlkp.intel.com, nis-domain=3D(none)
bootserver=3D192.168.3.200, rootserver=3D192.168.3.200, rootpath=3D
nameserver0=3D192.168.3.200
initcall ip_auto_config+0x0/0xa10 returned 0 after 1807847 usecs
calling  tcp_bpf_v4_build_proto+0x0/0x110 @ 1
initcall tcp_bpf_v4_build_proto+0x0/0x110 returned 0 after 0 usecs
calling  udp_bpf_v4_build_proto+0x0/0xb0 @ 1
initcall udp_bpf_v4_build_proto+0x0/0xb0 returned 0 after 0 usecs
calling  bpf_tcp_ca_kfunc_init+0x0/0x20 @ 1
initcall bpf_tcp_ca_kfunc_init+0x0/0x20 returned 0 after 0 usecs
calling  pci_mmcfg_late_insert_resources+0x0/0xd0 @ 1
initcall pci_mmcfg_late_insert_resources+0x0/0xd0 returned 0 after 2 usecs
calling  software_resume+0x0/0x40 @ 1
initcall software_resume+0x0/0x40 returned -2 after 22 usecs
calling  ftrace_check_sync+0x0/0x20 @ 1
initcall ftrace_check_sync+0x0/0x20 returned 0 after 88 usecs
calling  latency_fsnotify_init+0x0/0x40 @ 1
initcall latency_fsnotify_init+0x0/0x40 returned 0 after 602 usecs
calling  trace_eval_sync+0x0/0x20 @ 1
initcall trace_eval_sync+0x0/0x20 returned 0 after 158 usecs
calling  late_trace_init+0x0/0xb0 @ 1
initcall late_trace_init+0x0/0xb0 returned 0 after 0 usecs
calling  acpi_gpio_handle_deferred_request_irqs+0x0/0x170 @ 1
initcall acpi_gpio_handle_deferred_request_irqs+0x0/0x170 returned 0 after =
324 usecs
calling  fb_logo_late_init+0x0/0x20 @ 1
initcall fb_logo_late_init+0x0/0x20 returned 0 after 0 usecs
calling  clk_disable_unused+0x0/0x220 @ 1
initcall clk_disable_unused+0x0/0x220 returned 0 after 31 usecs
Freeing unused kernel image (initmem) memory: 3432K
Write protecting the kernel read-only data: 55296k
Freeing unused kernel image (rodata/data gap) memory: 684K
Run /init as init process
with arguments:
/init
nokaslr
with environment:
HOME=3D/
TERM=3Dlinux
RESULT_ROOT=3D/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_6=
4-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd21708=
9e303b7d9b62ba/3
BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa=
00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4
branch=3Dhch-misc/filemap_get_folio
job=3D/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x=
86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-60197-=
szh7vk-4.yaml
user=3Dlkp
ARCH=3Dx86_64
kconfig=3Dx86_64-rhel-8.3-kselftests
commit=3Def2f3f98fcf4521aa00fd217089e303b7d9b62ba
max_uptime=3D1200
LKP_SERVER=3Dinternal-lkp-server
selinux=3D0
softlockup_panic=3D1
prompt_ramdisk=3D0
vga=3Dnormal
systemd[1]: RTC configured in localtime, applying delta of 0 minutes to sys=
tem time.
calling  ip_tables_init+0x0/0x1000 [ip_tables] @ 1
initcall ip_tables_init+0x0/0x1000 [ip_tables] returned 0 after 70 usecs


calling  drm_core_init+0x0/0x120 [drm] @ 112
ACPI: bus type drm_connector registered
Startin[   52.630189][  T114] calling  fuse_init+0x0/0x2d0 [fuse] @ 114
nt Root and Kern[   52.637153][  T114] fuse: init (API version 7.38)
[0m...
calling  init_misc_binfmt+0x0/0x1000 [binfmt_misc] @ 135
initcall init_misc_binfmt+0x0/0x1000 [binfmt_misc] returned 0 after 5 usecs
calling  acpi_cpufreq_init+0x0/0xd80 [acpi_cpufreq] @ 171
calling  acpi_pad_init+0x0/0x1000 [acpi_pad] @ 154
initcall acpi_cpufreq_init+0x0/0xd80 [acpi_cpufreq] returned -17 after 1 us=
ecs
calling  tpm_inf_pnp_driver_init+0x0/0x1000 [tpm_infineon] @ 174
initcall tpm_inf_pnp_driver_init+0x0/0x1000 [tpm_infineon] returned 0 after=
 3883 usecs
calling  acpi_wmi_init+0x0/0x1000 [wmi] @ 173
acpi PNP0C14:02: duplicate WMI GUID 2B814318-4BE8-4707-9D84-A190A859B5D0 (f=
irst instance was on PNP0C14:00)
acpi PNP0C14:02: duplicate WMI GUID 41227C2D-80E1-423F-8B8E-87E32755A0EB (f=
irst instance was on PNP0C14:00)
calling  acpi_video_init+0x0/0x1000 [video] @ 173
initcall acpi_video_init+0x0/0x1000 [video] returned 0 after 27 usecs
calling  acpi_cpufreq_init+0x0/0xd80 [acpi_cpufreq] @ 165
initcall acpi_cpufreq_init+0x0/0xd80 [acpi_cpufreq] returned -17 after 1 us=
ecs
1;39mRegular bac[   56.207952][  T169] initcall pmc_core_driver_init+0x0/0x=
1000 [intel_pmc_core] returned 0 after 10455 usecs
calling  smbalert_driver_init+0x0/0x1000 [i2c_smbus] @ 166
IOAPIC[0]: Preconfigured routing entry (2-18 -> IRQ 18 Level:1 ActiveLow:1)
initcall intel_pch_thermal_driver_init+0x0/0x1000 [intel_pch_thermal] retur=
ned 0 after 28116 usecs
initcall smbalert_driver_init+0x0/0x1000 [i2c_smbus] returned 0 after 28176=
 usecs
calling  i2c_i801_init+0x0/0x1000 [i2c_i801] @ 166
OpenIPMI Driver [   56.475497][  T166] initcall i2c_i801_init+0x0/0x1000 [i=
2c_i801] returned 0 after 18553 usecs
..
pci 0000:00:1f.1: [8086:a120] type 00 class 0x058000
pci 0000:00:1f.1: reg 0x10: [mem 0xfd000000-0xfdffffff 64bit]
pci 0000:00:1f.1: calling  quirk_igfx_skip_te_disable+0x0/0x1a0 @ 42
pci 0000:00:1f.1: quirk_igfx_skip_te_disable+0x0/0x1a0 took 0 usecs
iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D4, TCOBASE=3D0x0=
400)
iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=3D0)
calling  serio_raw_drv_init+0x0/0x1000 [serio_raw] @ 173
i2c i2c-0: 3/4 memory slots populated (from DMI)
i2c i2c-0: Successfully instantiated SPD at 0x51
initcall serio_raw_drv_init+0x0/0x1000 [serio_raw] returned 0 after 82483 u=
secs
calling  ie31200_init+0x0/0x1000 [ie31200_edac] @ 172
calling  ata_init+0x0/0xa0 [libata] @ 152
calling  intel_uncore_init+0x0/0xdb0 [intel_uncore] @ 151
EDAC MC0: Giving out device to module ie31200_edac controller IE31200: DEV =
0000:00:00.0 (POLLED)
calling  mei_init+0x0/0xc0 [mei] @ 160
initcall ie31200_init+0x0/0x1000 [ie31200_edac] returned 0 after 19910 usec=
s
initcall mei_init+0x0/0xc0 [mei] returned 0 after 9707 usecs
libata version 3.00 loaded.
initcall ata_init+0x0/0xa0 [libata] returned 0 after 22658 usecs
initcall intel_uncore_init+0x0/0xdb0 [intel_uncore] returned 0 after 30561 =
usecs
calling  mei_me_driver_init+0x0/0x1000 [mei_me] @ 160
calling  cstate_pmu_init+0x0/0x1000 [intel_cstate] @ 151
calling  ahci_pci_driver_init+0x0/0x1000 [ahci] @ 152
ahci 0000:00:17.0: version 3.0
initcall cstate_pmu_init+0x0/0x1000 [intel_cstate] returned 0 after 34378 u=
secs
initcall mei_me_driver_init+0x0/0x1000 [mei_me] returned 0 after 40217 usec=
s
ommand to reboot[   56.873342][  T152] ahci 0000:00:17.0: AHCI 0001.0301 32=
 slots 4 ports 6 Gbps 0xf impl RAID mode
ahci 0000:00:17.0: flags: 64bit ncq stag pm led clo only pio slum part ems =
deso sadm sds apst=20

scsi host0: ahci
RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360 ms ovfl timer
RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
RAPL PMU: hw unit of domain package 2^-14 Joules
RAPL PMU: hw unit of domain dram 2^-14 Joules
calling  ipmi_init_msghandler_mod+0x0/0x1000 [ipmi_msghandler] @ 207
RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
IPMI message handler: version 39.2
initcall ipmi_init_msghandler_mod+0x0/0x1000 [ipmi_msghandler] returned 0 a=
fter 2324 usecs
initcall rapl_pmu_init+0x0/0xef0 [rapl] returned 0 after 6364 usecs
calling  init_ipmi_devintf+0x0/0x1000 [ipmi_devintf] @ 207
ipmi device interface
scsi host1: ahci
calling  sha512_ssse3_mod_init+0x0/0x1000 [sha512_ssse3] @ 150
initcall init_ipmi_devintf+0x0/0x1000 [ipmi_devintf] returned 0 after 162 u=
secs
initcall sha512_ssse3_mod_init+0x0/0x1000 [sha512_ssse3] returned 0 after 3=
7615 usecs
calling  ghash_pclmulqdqni_mod_init+0x0/0x1000 [ghash_clmulni_intel] @ 150
initcall ghash_pclmulqdqni_mod_init+0x0/0x1000 [ghash_clmulni_intel] return=
ed 0 after 12 usecs
scsi host2: ahci
initcall crc32c_intel_mod_init+0x0/0x1000 [crc32c_intel] returned 0 after 7=
85 usecs
scsi host3: ahci
calling  crc32_pclmul_mod_init+0x0/0x1000 [crc32_pclmul] @ 151
ata1: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c100 irq 123
ata2: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c180 irq 123
initcall crc32_pclmul_mod_init+0x0/0x1000 [crc32_pclmul] returned 0 after 9=
424 usecs
ata3: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c200 irq 123
ata4: SATA max UDMA/133 abar m2048@0xd104c000 port 0xd104c280 irq 123
initcall ahci_pci_driver_init+0x0/0x1000 [ahci] returned 0 after 70905 usec=
s
calling  drm_display_helper_module_init+0x0/0x1000 [drm_display_helper] @ 1=
71
initcall drm_display_helper_module_init+0x0/0x1000 [drm_display_helper] ret=
urned 0 after 6387 usecs
calling  crct10dif_intel_mod_init+0x0/0x1000 [crct10dif_pclmul] @ 170
initcall crct10dif_intel_mod_init+0x0/0x1000 [crct10dif_pclmul] returned 0 =
after 129 usecs
calling  init_ipmi_si+0x0/0x320 [ipmi_si] @ 231
ipmi_si: IPMI System Interface driver
ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
calling  mei_wdt_driver_init+0x0/0x1000 [mei_wdt] @ 156
calling  wmi_bmof_driver_init+0x0/0x1000 [wmi_bmof] @ 153
initcall wmi_bmof_driver_init+0x0/0x1000 [wmi_bmof] returned 0 after 1826 u=
secs
initcall mei_wdt_driver_init+0x0/0x1000 [mei_wdt] returned 0 after 5045 use=
cs
See 'systemctl status openipmi.service' for details.
ata1.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
ata1.00: ACPI cmd b1/c1:00:00:00:00:e0(DEVICE CONFIGURATION OVERLAY) filter=
ed out
ata1.00: ATA-8: WDC WD10EARS-00Y5B1, 80.00A80, max UDMA/133
ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 32), AA
ata1.00: ACPI cmd b1/c1:00:00:00:00:e0(DEVICE CONFIGURATION OVERLAY) filter=
ed out
ata1.00: configured for UDMA/133
scsi 0:0:0:0: Direct-Access     ATA      WDC WD10EARS-00Y 0A80 PQ: 0 ANSI: =
5
calling  kvm_x86_init+0x0/0x70 [kvm] @ 150
initcall kvm_x86_init+0x0/0x70 [kvm] returned 0 after 1 usecs
LKP: ttyS0: 262: current_version: f0, target_version: f0
LKP: ttyS0: 262: skip deploy intel ucode as ucode is same
ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
ata2.00: ATA-9: INTEL SSDSC2BB012T4, G2010036, max UDMA/133
ata2.00: 2344225968 sectors, multi 1: LBA48 NCQ (depth 32)
ata2.00: ACPI cmd f5/00:00:00:00:00:e0(SECURITY FREEZE LOCK) filtered out
ata2.00: configured for UDMA/133
scsi 1:0:0:0: Direct-Access     ATA      INTEL SSDSC2BB01 0036 PQ: 0 ANSI: =
5
LKP: ttyS0: 262: Kernel tests: Boot OK!
LKP: ttyS0: 262: HOSTNAME lkp-skl-d06, MAC 3c:52:82:5d:1e:ba, kernel 6.3.0-=
rc1-00007-gef2f3f98fcf4 1
ata3: SATA link down (SStatus 4 SControl 300)
ata4: SATA link down (SStatus 4 SControl 300)
calling  drm_buddy_module_init+0x0/0x1000 [drm_buddy] @ 171
initcall drm_buddy_module_init+0x0/0x1000 [drm_buddy] returned 0 after 9659=
 usecs
calling  vmx_init+0x0/0x6a0 [kvm_intel] @ 170
calling  init_sg+0x0/0x1000 [sg] @ 166
initcall vmx_init+0x0/0x6a0 [kvm_intel] returned 0 after 4867 usecs
scsi 0:0:0:0: Attached scsi generic sg0 type 0
calling  coretemp_init+0x0/0x1000 [coretemp] @ 170
calling  crc64_rocksoft_mod_init+0x0/0x1000 [crc64_rocksoft] @ 138
calling  crc64_rocksoft_init+0x0/0x1000 [crc64_rocksoft_generic] @ 338
initcall crc64_rocksoft_init+0x0/0x1000 [crc64_rocksoft_generic] returned 0=
 after 20 usecs
scsi 1:0:0:0: Attached scsi generic sg1 type 0
initcall init_sg+0x0/0x1000 [sg] returned 0 after 27200 usecs
initcall crc64_rocksoft_mod_init+0x0/0x1000 [crc64_rocksoft] returned 0 aft=
er 48659 usecs
initcall coretemp_init+0x0/0x1000 [coretemp] returned 0 after 107075 usecs
calling  powerclamp_init+0x0/0x1000 [intel_powerclamp] @ 170
initcall powerclamp_init+0x0/0x1000 [intel_powerclamp] returned 0 after 100=
37 usecs
calling  pkg_temp_thermal_init+0x0/0x1000 [x86_pkg_temp_thermal] @ 151
calling  init_sd+0x0/0x1000 [sd_mod] @ 166
calling  i915_init+0x0/0x190 [i915] @ 171
initcall pkg_temp_thermal_init+0x0/0x1000 [x86_pkg_temp_thermal] returned 0=
 after 3894 usecs
ata2.00: Enabling discard_zeroes_data
sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
sd 1:0:0:0: [sdb] 2344225968 512-byte logical blocks: (1.20 TB/1.09 TiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 1:0:0:0: [sdb] 4096-byte physical blocks
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
initcall init_sd+0x0/0x1000 [sd_mod] returned 0 after 60078 usecs
sd 1:0:0:0: [sdb] Write Protect is off
i915 0000:00:02.0: vgaarb: deactivate vga console
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
Console: switching to colour dummy device 80x25
ata2.00: Enabling discard_zeroes_data
sdb: sdb1 sdb2
sd 1:0:0:0: [sdb] Attached SCSI disk
i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,decodes=
=3Dio+mem:owns=3Dio+mem
i915 0000:00:02.0: Direct firmware load for i915/skl_dmc_ver1_27.bin failed=
 with error -2
i915 0000:00:02.0: [drm] Failed to load DMC firmware i915/skl_dmc_ver1_27.b=
in. Disabling runtime power management.
i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/=
scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915
sda: sda1 sda2 sda3 sda4
sd 0:0:0:0: [sda] Attached SCSI disk
calling  acpi_cpufreq_init+0x0/0xd80 [acpi_cpufreq] @ 170
initcall acpi_cpufreq_init+0x0/0xd80 [acpi_cpufreq] returned -17 after 1 us=
ecs
calling  pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] @ 170
initcall pmc_core_platform_init+0x0/0x1000 [intel_pmc_core_pltdrv] returned=
 -19 after 176 usecs
calling  rapl_init+0x0/0x1000 [intel_rapl_common] @ 150
initcall rapl_init+0x0/0x1000 [intel_rapl_common] returned 0 after 3843 use=
cs
calling  intel_rapl_msr_driver_init+0x0/0x1000 [intel_rapl_msr] @ 172
intel_rapl_common: Found RAPL domain package
intel_rapl_common: Found RAPL domain core
intel_rapl_common: Found RAPL domain uncore
intel_rapl_common: Found RAPL domain dram
initcall intel_rapl_msr_driver_init+0x0/0x1000 [intel_rapl_msr] returned 0 =
after 52342 usecs
calling  libcrc32c_mod_init+0x0/0x1000 [libcrc32c] @ 384
initcall libcrc32c_mod_init+0x0/0x1000 [libcrc32c] returned 0 after 33 usec=
s
calling  init_module+0x0/0x1000 [raid6_pq] @ 384
raid6: avx2x4   gen() 30889 MB/s
raid6: avx2x2   gen() 30235 MB/s
raid6: avx2x1   gen() 23484 MB/s
raid6: using algorithm avx2x4 gen() 30889 MB/s
raid6: .... xor() 9536 MB/s, rmw enabled
raid6: using avx2x2 recovery algorithm
initcall init_module+0x0/0x1000 [raid6_pq] returned 0 after 99800 usecs
calling  calibrate_xor_blocks+0x0/0xe90 [xor] @ 384
xor: automatically using best checksumming function   avx      =20
initcall calibrate_xor_blocks+0x0/0xe90 [xor] returned 0 after 7816 usecs
i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] failed to retrieve link i=
nfo, disabling eDP
calling  blake2b_mod_init+0x0/0x1000 [blake2b_generic] @ 384
initcall blake2b_mod_init+0x0/0x1000 [blake2b_generic] returned 0 after 22 =
usecs
[drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 0
ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00=
/input/input6
initcall i915_init+0x0/0x190 [i915] returned 0 after 245887 usecs
calling  init_btrfs_fs+0x0/0x250 [btrfs] @ 384
i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
Btrfs loaded, crc32c=3Dcrc32c-intel, zoned=3Dno, fsverity=3Dno
initcall init_btrfs_fs+0x0/0x250 [btrfs] returned 0 after 47667 usecs
i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
BTRFS: device fsid afb6a7a3-c7ce-4d7b-b52a-1bfe0ec9af9a devid 1 transid 350=
6 /dev/sdb1 scanned by systemd-udevd (138)
BTRFS: device fsid 4feffc13-1a32-4f06-9d95-cce44c499ac2 devid 1 transid 8 /=
dev/sda2 scanned by systemd-udevd (172)
is_virt=3Dfalse

lkp: kernel tainted state: 0

LKP: stdout: 262: Kernel tests: Boot OK!

LKP: stdout: 262: HOSTNAME lkp-skl-d06, MAC 3c:52:82:5d:1e:ba, kernel 6.3.0=
-rc1-00007-gef2f3f98fcf4 1

install debs round one: dpkg -i --force-confdef --force-depends /opt/deb/gc=
c-12-base_12.2.0-13_amd64.deb

/opt/deb/libgcc-s1_12.2.0-13_amd64.deb

/opt/deb/python3-minimal_3.10.6-3+b1_amd64.deb

/opt/deb/python3_3.10.6-3+b1_amd64.deb

/opt/deb/python3.10_3.10.9-1_amd64.deb

/opt/deb/libpython3.10-stdlib_3.10.9-1_amd64.deb

/opt/deb/python3.10-minimal_3.10.9-1_amd64.deb

/opt/deb/libpython3.10-minimal_3.10.9-1_amd64.deb

/opt/deb/libpython3-stdlib_3.10.6-3+b1_amd64.deb

/opt/deb/openvswitch-common_3.1.0~git20221212.739bcf2-3_amd64.deb

/opt/deb/python3-netifaces_0.11.0-2_amd64.deb

/opt/deb/python3-sortedcontainers_2.4.0-2_all.deb

/opt/deb/python3-openvswitch_3.1.0~git20221212.739bcf2-3_amd64.deb

/opt/deb/uuid-runtime_2.38.1-4_amd64.deb

/opt/deb/openvswitch-switch_3.1.0~git20221212.739bcf2-3_amd64.deb

/opt/deb/libattr1_1%3a2.5.1-3_amd64.deb

/opt/deb/traceroute_1%3a2.1.1-1_amd64.deb

/opt/deb/attr_1%3a2.5.1-3_amd64.deb

/opt/deb/ebtables_2.0.11-5_amd64.deb

/opt/deb/libatomic1_12.2.0-13_amd64.deb

/opt/deb/libquadmath0_12.2.0-13_amd64.deb

/opt/deb/libgcc-12-dev_12.2.0-13_amd64.deb

/opt/deb/gcc-12_12.2.0-13_amd64.deb

/opt/deb/gcc_4%3a12.2.0-2+b1_amd64.deb

/opt/deb/g++-12_12.2.0-13_amd64.deb

/opt/deb/g++_4%3a12.2.0-2+b1_amd64.deb

/opt/deb/gcc-11-base_11.3.0-8_amd64.deb

/opt/deb/lib32gcc-s1_12.2.0-13_amd64.deb

/opt/deb/libx32gcc-s1_12.2.0-13_amd64.deb

/opt/deb/lib32atomic1_12.2.0-13_amd64.deb

/opt/deb/libx32atomic1_12.2.0-13_amd64.deb

/opt/deb/lib32quadmath0_12.2.0-13_amd64.deb

/opt/deb/libx32quadmath0_12.2.0-13_amd64.deb

/opt/deb/lib32gcc-12-dev_12.2.0-13_amd64.deb

/opt/deb/libx32gcc-12-dev_12.2.0-13_amd64.deb

/opt/deb/gcc-12-multilib_12.2.0-13_amd64.deb

/opt/deb/gcc-multilib_4%3a12.2.0-2+b1_amd64.deb

/opt/deb/libasound2-data_1.2.8-1_all.deb

/opt/deb/libdeflate0_1.14-1_amd64.deb

/opt/deb/libpython3.10_3.10.9-1_amd64.deb

/opt/deb/libwireshark-data_4.0.2-1_all.deb

/opt/deb/python3-pkg-resources_65.5.0-1.1_all.deb

/opt/deb/python3-pygments_2.13.0+dfsg-1_all.deb

/opt/deb/python3-yaml_6.0-3+b1_amd64.deb

/opt/deb/netcat-openbsd_1.219-1_amd64.deb

/opt/deb/python3-roman_3.3-3_all.deb

/opt/deb/python3-docutils_0.17.1+dfsg-3_all.deb

/opt/deb/python3-scapy_2.4.5+g9420c22-2_all.deb

/opt/deb/socat_1.7.4.4-2_amd64.deb

/opt/deb/tcpdump_4.99.2-1_amd64.deb

(Reading database ... 16792 files and directories currently installed.)

Preparing to unpack .../gcc-12-base_12.2.0-13_amd64.deb ...

Unpacking gcc-12-base:amd64 (12.2.0-13) over (12.2.0-9) ...

Preparing to unpack .../libgcc-s1_12.2.0-13_amd64.deb ...

Unpacking libgcc-s1:amd64 (12.2.0-13) over (12.2.0-9) ...

Preparing to unpack .../python3-minimal_3.10.6-3+b1_amd64.deb ...

Unpacking python3-minimal (3.10.6-3+b1) over (3.10.6-1) ...

Preparing to unpack .../python3_3.10.6-3+b1_amd64.deb ...

running python pre-rtupdate hooks for python3.10...

Unpacking python3 (3.10.6-3+b1) over (3.10.6-1) ...

Preparing to unpack .../python3.10_3.10.9-1_amd64.deb ...

Unpacking python3.10 (3.10.9-1) over (3.10.8-3) ...

Preparing to unpack .../libpython3.10-stdlib_3.10.9-1_amd64.deb ...

Unpacking libpython3.10-stdlib:amd64 (3.10.9-1) over (3.10.8-3) ...

Preparing to unpack .../python3.10-minimal_3.10.9-1_amd64.deb ...

Unpacking python3.10-minimal (3.10.9-1) over (3.10.8-3) ...

Preparing to unpack .../libpython3.10-minimal_3.10.9-1_amd64.deb ...

Unpacking libpython3.10-minimal:amd64 (3.10.9-1) over (3.10.8-3) ...

Preparing to unpack .../libpython3-stdlib_3.10.6-3+b1_amd64.deb ...

Unpacking libpython3-stdlib:amd64 (3.10.6-3+b1) over (3.10.6-1) ...

Selecting previously unselected package openvswitch-common.

Preparing to unpack .../openvswitch-common_3.1.0~git20221212.739bcf2-3_amd6=
4.deb ...

Unpacking openvswitch-common (3.1.0~git20221212.739bcf2-3) ...

Selecting previously unselected package python3-netifaces:amd64.

Preparing to unpack .../python3-netifaces_0.11.0-2_amd64.deb ...

Unpacking python3-netifaces:amd64 (0.11.0-2) ...

Selecting previously unselected package python3-sortedcontainers.

Preparing to unpack .../python3-sortedcontainers_2.4.0-2_all.deb ...

Unpacking python3-sortedcontainers (2.4.0-2) ...

Selecting previously unselected package python3-openvswitch.

Preparing to unpack .../python3-openvswitch_3.1.0~git20221212.739bcf2-3_amd=
64.deb ...

Unpacking python3-openvswitch (3.1.0~git20221212.739bcf2-3) ...

Selecting previously unselected package uuid-runtime.

Preparing to unpack .../uuid-runtime_2.38.1-4_amd64.deb ...

Unpacking uuid-runtime (2.38.1-4) ...

Selecting previously unselected package openvswitch-switch.

Preparing to unpack .../openvswitch-switch_3.1.0~git20221212.739bcf2-3_amd6=
4.deb ...

Unpacking openvswitch-switch (3.1.0~git20221212.739bcf2-3) ...

Preparing to unpack .../libattr1_1%3a2.5.1-3_amd64.deb ...

Unpacking libattr1:amd64 (1:2.5.1-3) over (1:2.5.1-1) ...

Selecting previously unselected package traceroute.

Preparing to unpack .../traceroute_1%3a2.1.1-1_amd64.deb ...

Unpacking traceroute (1:2.1.1-1) ...

Selecting previously unselected package attr.

Preparing to unpack .../deb/attr_1%3a2.5.1-3_amd64.deb ...

Unpacking attr (1:2.5.1-3) ...

Selecting previously unselected package ebtables.

Preparing to unpack .../ebtables_2.0.11-5_amd64.deb ...

Unpacking ebtables (2.0.11-5) ...

Selecting previously unselected package libatomic1:amd64.

Preparing to unpack .../libatomic1_12.2.0-13_amd64.deb ...

Unpacking libatomic1:amd64 (12.2.0-13) ...

Selecting previously unselected package libquadmath0:amd64.

Preparing to unpack .../libquadmath0_12.2.0-13_amd64.deb ...

Unpacking libquadmath0:amd64 (12.2.0-13) ...

Selecting previously unselected package libgcc-12-dev:amd64.

Preparing to unpack .../libgcc-12-dev_12.2.0-13_amd64.deb ...

Unpacking libgcc-12-dev:amd64 (12.2.0-13) ...

Selecting previously unselected package gcc-12.

Preparing to unpack .../deb/gcc-12_12.2.0-13_amd64.deb ...

Unpacking gcc-12 (12.2.0-13) ...

Selecting previously unselected package gcc.

Preparing to unpack .../gcc_4%3a12.2.0-2+b1_amd64.deb ...

Unpacking gcc (4:12.2.0-2+b1) ...

Selecting previously unselected package g++-12.

Preparing to unpack .../deb/g++-12_12.2.0-13_amd64.deb ...

Unpacking g++-12 (12.2.0-13) ...

Selecting previously unselected package g++.

Preparing to unpack .../g++_4%3a12.2.0-2+b1_amd64.deb ...

Unpacking g++ (4:12.2.0-2+b1) ...

Selecting previously unselected package gcc-11-base:amd64.

Preparing to unpack .../gcc-11-base_11.3.0-8_amd64.deb ...

Unpacking gcc-11-base:amd64 (11.3.0-8) ...

Selecting previously unselected package lib32gcc-s1.

Preparing to unpack .../lib32gcc-s1_12.2.0-13_amd64.deb ...

Unpacking lib32gcc-s1 (12.2.0-13) ...

Selecting previously unselected package libx32gcc-s1.

Preparing to unpack .../libx32gcc-s1_12.2.0-13_amd64.deb ...

Unpacking libx32gcc-s1 (12.2.0-13) ...

Selecting previously unselected package lib32atomic1.

Preparing to unpack .../lib32atomic1_12.2.0-13_amd64.deb ...

Unpacking lib32atomic1 (12.2.0-13) ...

Selecting previously unselected package libx32atomic1.

Preparing to unpack .../libx32atomic1_12.2.0-13_amd64.deb ...

Unpacking libx32atomic1 (12.2.0-13) ...

Selecting previously unselected package lib32quadmath0.

Preparing to unpack .../lib32quadmath0_12.2.0-13_amd64.deb ...

Unpacking lib32quadmath0 (12.2.0-13) ...

Selecting previously unselected package libx32quadmath0.

Preparing to unpack .../libx32quadmath0_12.2.0-13_amd64.deb ...

Unpacking libx32quadmath0 (12.2.0-13) ...

Selecting previously unselected package lib32gcc-12-dev.

Preparing to unpack .../lib32gcc-12-dev_12.2.0-13_amd64.deb ...

Unpacking lib32gcc-12-dev (12.2.0-13) ...

Selecting previously unselected package libx32gcc-12-dev.

Preparing to unpack .../libx32gcc-12-dev_12.2.0-13_amd64.deb ...

Unpacking libx32gcc-12-dev (12.2.0-13) ...

Selecting previously unselected package gcc-12-multilib.

Preparing to unpack .../gcc-12-multilib_12.2.0-13_amd64.deb ...

Unpacking gcc-12-multilib (12.2.0-13) ...

Selecting previously unselected package gcc-multilib.

Preparing to unpack .../gcc-multilib_4%3a12.2.0-2+b1_amd64.deb ...

Unpacking gcc-multilib (4:12.2.0-2+b1) ...

Selecting previously unselected package libasound2-data.

Preparing to unpack .../libasound2-data_1.2.8-1_all.deb ...

Unpacking libasound2-data (1.2.8-1) ...

Selecting previously unselected package libdeflate0:amd64.

Preparing to unpack .../libdeflate0_1.14-1_amd64.deb ...

Unpacking libdeflate0:amd64 (1.14-1) ...

Selecting previously unselected package libpython3.10:amd64.

Preparing to unpack .../libpython3.10_3.10.9-1_amd64.deb ...

Unpacking libpython3.10:amd64 (3.10.9-1) ...

Selecting previously unselected package libwireshark-data.

Preparing to unpack .../libwireshark-data_4.0.2-1_all.deb ...

Unpacking libwireshark-data (4.0.2-1) ...

Selecting previously unselected package python3-pkg-resources.

Preparing to unpack .../python3-pkg-resources_65.5.0-1.1_all.deb ...

Unpacking python3-pkg-resources (65.5.0-1.1) ...

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

Preparing to unpack .../python3-roman_3.3-3_all.deb ...

Unpacking python3-roman (3.3-3) ...

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

Preparing to unpack .../deb/tcpdump_4.99.2-1_amd64.deb ...

Unpacking tcpdump (4.99.2-1) ...

Setting up gcc-12-base:amd64 (12.2.0-13) ...

Setting up libgcc-s1:amd64 (12.2.0-13) ...

Setting up libpython3.10-minimal:amd64 (3.10.9-1) ...

Setting up libattr1:amd64 (1:2.5.1-3) ...

Setting up traceroute (1:2.1.1-1) ...

update-alternatives: using /usr/bin/traceroute.db to provide /usr/bin/trace=
route (traceroute) in auto mode

memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D1 'systemd'
update-alternatives: using /usr/bin/traceroute6.db to provide /usr/bin/trac=
eroute6 (traceroute6) in auto mode

update-alternatives: using /usr/bin/lft.db to provide /usr/bin/lft (lft) in=
 auto mode

update-alternatives: using /usr/bin/traceproto.db to provide /usr/bin/trace=
proto (traceproto) in auto mode

update-alternatives: using /usr/sbin/tcptraceroute.db to provide /usr/sbin/=
tcptraceroute (tcptraceroute) in auto mode

Setting up attr (1:2.5.1-3) ...

Setting up ebtables (2.0.11-5) ...

update-alternatives: using /usr/sbin/ebtables-legacy to provide /usr/sbin/e=
btables (ebtables) in auto mode

Setting up libatomic1:amd64 (12.2.0-13) ...

Setting up libquadmath0:amd64 (12.2.0-13) ...

Setting up gcc-11-base:amd64 (11.3.0-8) ...

Setting up libasound2-data (1.2.8-1) ...

Setting up libdeflate0:amd64 (1.14-1) ...

Setting up libwireshark-data (4.0.2-1) ...

Setting up netcat-openbsd (1.219-1) ...

update-alternatives: using /bin/nc.openbsd to provide /bin/nc (nc) in auto =
mode

Setting up socat (1.7.4.4-2) ...

Setting up libpython3.10-stdlib:amd64 (3.10.9-1) ...

Setting up python3.10-minimal (3.10.9-1) ...

Setting up libpython3-stdlib:amd64 (3.10.6-3+b1) ...

Setting up libpython3.10:amd64 (3.10.9-1) ...

Setting up python3-minimal (3.10.6-3+b1) ...

Setting up python3.10 (3.10.9-1) ...

Setting up python3 (3.10.6-3+b1) ...

running python rtupdate hooks for python3.10...

Setting up uuid-runtime (2.38.1-4) ...

Adding group `uuidd' (GID 109) ...

Done.

Setting up openvswitch-switch (3.1.0~git20221212.739bcf2-3) ...

update-alternatives: using /usr/lib/openvswitch-switch/ovs-vswitchd to prov=
ide /usr/sbin/ovs-vswitchd (ovs-vswitchd) in auto mode

calling  nf_defrag_init+0x0/0x1000 [nf_defrag_ipv4] @ 1153
initcall nf_defrag_init+0x0/0x1000 [nf_defrag_ipv4] returned 0 after 2 usec=
s
calling  nf_defrag_init+0x0/0x1000 [nf_defrag_ipv6] @ 1153
initcall nf_defrag_init+0x0/0x1000 [nf_defrag_ipv6] returned 0 after 940 us=
ecs
calling  nf_conntrack_standalone_init+0x0/0x1000 [nf_conntrack] @ 1153
initcall nf_conntrack_standalone_init+0x0/0x1000 [nf_conntrack] returned 0 =
after 2313 usecs
calling  nf_nat_init+0x0/0x1000 [nf_nat] @ 1153
initcall nf_nat_init+0x0/0x1000 [nf_nat] returned 0 after 255 usecs
calling  nf_conncount_modinit+0x0/0x1000 [nf_conncount] @ 1153
initcall nf_conncount_modinit+0x0/0x1000 [nf_conncount] returned 0 after 13=
62 usecs
calling  dp_init+0x0/0x1b0 [openvswitch] @ 1153
openvswitch: Open vSwitch switching datapath
initcall dp_init+0x0/0x1b0 [openvswitch] returned 0 after 11393 usecs
Setting up libgcc-12-dev:amd64 (12.2.0-13) ...

Setting up gcc-12 (12.2.0-13) ...

Setting up gcc (4:12.2.0-2+b1) ...

Setting up g++-12 (12.2.0-13) ...

Setting up g++ (4:12.2.0-2+b1) ...

update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in au=
to mode

Setting up lib32gcc-s1 (12.2.0-13) ...

Setting up libx32gcc-s1 (12.2.0-13) ...

Setting up lib32atomic1 (12.2.0-13) ...

Setting up libx32atomic1 (12.2.0-13) ...

Setting up lib32quadmath0 (12.2.0-13) ...

Setting up libx32quadmath0 (12.2.0-13) ...

Setting up lib32gcc-12-dev (12.2.0-13) ...

Setting up libx32gcc-12-dev (12.2.0-13) ...

Setting up gcc-12-multilib (12.2.0-13) ...

Setting up gcc-multilib (4:12.2.0-2+b1) ...

Setting up python3-pkg-resources (65.5.0-1.1) ...

Setting up python3-pygments (2.13.0+dfsg-1) ...

Setting up python3-yaml (6.0-3+b1) ...

Setting up python3-roman (3.3-3) ...

Setting up python3-docutils (0.17.1+dfsg-3) ...

Setting up python3-scapy (2.4.5+g9420c22-2) ...

Setting up tcpdump (4.99.2-1) ...

Setting up openvswitch-common (3.1.0~git20221212.739bcf2-3) ...

Setting up python3-netifaces:amd64 (0.11.0-2) ...

Setting up python3-sortedcontainers (2.4.0-2) ...

Setting up python3-openvswitch (3.1.0~git20221212.739bcf2-3) ...

Processing triggers for libc-bin (2.36-5) ...

Processing triggers for systemd (252.1-1) ...

dpkg: regarding .../python3_3.10.6-3+b1_amd64.deb containing python3, pre-d=
ependency problem:

python3 pre-depends on python3-minimal (=3D 3.10.6-3+b1)

python3-minimal latest configured version is 3.10.6-1.



dpkg: warning: ignoring pre-dependency problem!

dpkg-query: package 'linux-perf' is not installed

Use dpkg --contents (=3D dpkg-deb --contents) to list archive files content=
s.

Traceback (most recent call last):

File "/usr/bin/py3clean", line 210, in <module>

main()

File "/usr/bin/py3clean", line 196, in main

pfiles =3D set(dpf.from_package(options.package))

File "/usr/share/python3/debpython/files.py", line 53, in from_package

raise Exception("cannot get content of %s" % package_name)

Exception: cannot get content of linux-perf

error running python rtupdate hook linux-perf

dpkg: error processing package python3 (--install):

installed python3 package post-installation script subprocess returned erro=
r exit status 4

dpkg: uuid-runtime: dependency problems, but configuring anyway as you requ=
ested:

uuid-runtime depends on libuuid1 (>=3D 2.38.1-2~); however:

Version of libuuid1:amd64 on system is 2.38.1-1.1+b1.




uuidd.service is a disabled or a static unit, not starting it.

dpkg: openvswitch-switch: dependency problems, but configuring anyway as yo=
u requested:

openvswitch-switch depends on openvswitch-common (=3D 3.1.0~git20221212.739=
bcf2-3).

openvswitch-switch depends on python3-netifaces.

openvswitch-switch depends on python3-openvswitch (>=3D 3.1.0~git20221212.7=
39bcf2-3).

openvswitch-switch depends on python3:any; however:

Package python3 is not configured yet.

openvswitch-switch depends on libnuma1 (>=3D 2.0.11); however:

Package libnuma1 is not installed.

openvswitch-switch depends on libunbound8 (>=3D 1.8.0); however:

Package libunbound8 is not installed.

openvswitch-switch depends on libxdp1 (>=3D 1.2.9~); however:

Package libxdp1 is not installed.





dpkg: libgcc-12-dev:amd64: dependency problems, but configuring anyway as y=
ou requested:

libgcc-12-dev:amd64 depends on libgomp1 (>=3D 12.2.0-13); however:

Package libgomp1 is not installed.

libgcc-12-dev:amd64 depends on libitm1 (>=3D 12.2.0-13); however:

Package libitm1 is not installed.

libgcc-12-dev:amd64 depends on libasan8 (>=3D 12.2.0-13); however:

Package libasan8 is not installed.

libgcc-12-dev:amd64 depends on liblsan0 (>=3D 12.2.0-13); however:

Package liblsan0 is not installed.

libgcc-12-dev:amd64 depends on libtsan2 (>=3D 12.2.0-13); however:

Package libtsan2 is not installed.

libgcc-12-dev:amd64 depends on libubsan1 (>=3D 12.2.0-13); however:

Package libubsan1 is not installed.



dpkg: gcc-12: dependency problems, but configuring anyway as you requested:

gcc-12 depends on cpp-12 (=3D 12.2.0-13); however:

Package cpp-12 is not installed.

gcc-12 depends on libcc1-0 (>=3D 12.2.0-13); however:

Package libcc1-0 is not installed.

gcc-12 depends on binutils (>=3D 2.39.90.20221231); however:

Package binutils is not installed.

gcc-12 depends on libisl23 (>=3D 0.15); however:

Package libisl23 is not installed.

gcc-12 depends on libmpc3 (>=3D 1.1.0); however:

Package libmpc3 is not installed.

gcc-12 depends on libmpfr6 (>=3D 3.1.3); however:

Package libmpfr6 is not installed.



dpkg: gcc: dependency problems, but configuring anyway as you requested:

gcc depends on cpp (=3D 4:12.2.0-2+b1); however:

Package cpp is not installed.



dpkg: g++-12: dependency problems, but configuring anyway as you requested:

g++-12 depends on libstdc++-12-dev (=3D 12.2.0-13); however:

Package libstdc++-12-dev is not installed.

g++-12 depends on libisl23 (>=3D 0.15); however:

Package libisl23 is not installed.

g++-12 depends on libmpc3 (>=3D 1.1.0); however:

Package libmpc3 is not installed.

g++-12 depends on libmpfr6 (>=3D 3.1.3); however:

Package libmpfr6 is not installed.



dpkg: g++: dependency problems, but configuring anyway as you requested:

g++ depends on cpp (=3D 4:12.2.0-2+b1); however:

Package cpp is not installed.



BTRFS info (device sdb1): using crc32c (crc32c-intel) checksum algorithm
dpkg: lib32gcc-s1: dependency problems, but configuring anyway as you reque=
sted:
BTRFS info (device sdb1): using free space tree

lib32gcc-s1 depends on libc6-i386 (>=3D 2.35); however:

Package libc6-i386 is not installed.



dpkg: libx32gcc-s1: dependency problems, but configuring anyway as you requ=
ested:

libx32gcc-s1 depends on libc6-x32 (>=3D 2.35); however:

BTRFS info (device sdb1): enabling ssd optimizations
Package libc6-x32 is not installed.
BTRFS info (device sdb1): auto enabling async discard



dpkg: lib32atomic1: dependency problems, but configuring anyway as you requ=
ested:

lib32atomic1 depends on libc6-i386 (>=3D 2.1.3); however:

Package libc6-i386 is not installed.



dpkg: libx32atomic1: dependency problems, but configuring anyway as you req=
uested:

LKP: ttyS0: 262:[  111.233062][  T288]  libx32atomic1 depends on libc6-x32 =
(>=3D 2.16); however:
/lkp/lkp/src/b[  111.233080][  T288]=20
in/run-lkp /lkp/[  111.245058][  T288]   Package libc6-x32 is not installed=
.
jobs/scheduled/l[  111.245075][  T288]=20
kp-skl-d06/kerne[  111.254680][  T288]=20
l-selftests-grou[  111.254696][  T288]=20
p-02-debian-12-x86_64-20220629.c[  111.263768][  T288] dpkg: lib32quadmath0=
: dependency problems, but configuring anyway as you requested:
gz-ef2f3f98fcf45[  111.263785][  T288]=20
21aa00fd217089e303b7d9b62ba-2023[  111.278954][  T288]  lib32quadmath0 depe=
nds on libc6-i386 (>=3D 2.23); however:
0310-60197-szh7v[  111.279000][  T288]=20
k-4.yaml
Package libc6-i386 is not installed.



dpkg: libx32quadmath0: dependency problems, but configuring anyway as you r=
equested:

libx32quadmath0 depends on libc6-x32 (>=3D 2.23); however:

Package libc6-x32 is not installed.



dpkg: lib32gcc-12-dev: dependency problems, but configuring anyway as you r=
equested:

lib32gcc-12-dev depends on lib32gomp1 (>=3D 12.2.0-13); however:

Package lib32gomp1 is not installed.

lib32gcc-12-dev depends on libx32gomp1 (>=3D 12.2.0-13); however:

Package libx32gomp1 is not installed.

lib32gcc-12-dev depends on lib32itm1 (>=3D 12.2.0-13); however:

Package lib32itm1 is not installed.

lib32gcc-12-dev depends on libx32itm1 (>=3D 12.2.0-13); however:

Package libx32itm1 is not installed.

lib32gcc-12-dev depends on lib32asan8 (>=3D 12.2.0-13); however:

Package lib32asan8 is not installed.

lib32gcc-12-dev depends on libx32asan8 (>=3D 12.2.0-13); however:

Package libx32asan8 is not installed.

lib32gcc-12-dev depends on lib32ubsan1 (>=3D 12.2.0-13); however:

Package lib32ubsan1 is not installed.

lib32gcc-12-dev depends on libx32ubsan1 (>=3D 12.2.0-13); however:

Package libx32ubsan1 is not installed.



dpkg: libx32gcc-12-dev: dependency problems, but configuring anyway as you =
requested:

libx32gcc-12-dev depends on lib32gomp1 (>=3D 12.2.0-13); however:

Package lib32gomp1 is not installed.

libx32gcc-12-dev depends on libx32gomp1 (>=3D 12.2.0-13); however:

Package libx32gomp1 is not installed.

libx32gcc-12-dev depends on lib32itm1 (>=3D 12.2.0-13); however:

Package lib32itm1 is not installed.

libx32gcc-12-dev depends on libx32itm1 (>=3D 12.2.0-13); however:

Package libx32itm1 is not installed.

libx32gcc-12-dev depends on lib32asan8 (>=3D 12.2.0-13); however:

Package lib32asan8 is not installed.

libx32gcc-12-dev depends on libx32asan8 (>=3D 12.2.0-13); however:

Package libx32asan8 is not installed.

libx32gcc-12-dev depends on lib32ubsan1 (>=3D 12.2.0-13); however:

Package lib32ubsan1 is not installed.

libx32gcc-12-dev depends on libx32ubsan1 (>=3D 12.2.0-13); however:

Package libx32ubsan1 is not installed.



dpkg: gcc-12-multilib: dependency problems, but configuring anyway as you r=
equested:

gcc-12-multilib depends on libc6-dev-i386 (>=3D 2.23-1~); however:

Package libc6-dev-i386 is not installed.

gcc-12-multilib depends on libc6-dev-x32 (>=3D 2.23-1~); however:

Package libc6-dev-x32 is not installed.



dpkg: gcc-multilib: dependency problems, but configuring anyway as you requ=
ested:

gcc-multilib depends on cpp (=3D 4:12.2.0-2+b1); however:

Package cpp is not installed.

gcc-multilib depends on linux-libc-dev (>=3D 3.0.0-2); however:

Package linux-libc-dev is not installed.



dpkg: python3-pkg-resources: dependency problems, but configuring anyway as=
 you requested:

python3-pkg-resources depends on python3:any; however:

Package python3 is not configured yet.



dpkg: python3-pygments: dependency problems, but configuring anyway as you =
requested:

python3-pygments depends on python3:any; however:

Package python3 is not configured yet.



dpkg: python3-yaml: dependency problems, but configuring anyway as you requ=
ested:

python3-yaml depends on python3 (<< 3.12); however:

Package python3 is not configured yet.

python3-yaml depends on python3 (>=3D 3.10~); however:

Package python3 is not configured yet.

python3-yaml depends on python3:any; however:

Package python3 is not configured yet.

python3-yaml depends on libyaml-0-2 (>=3D 0.2.2~); however:

Package libyaml-0-2 is not installed.



dpkg: python3-roman: dependency problems, but configuring anyway as you req=
uested:

python3-roman depends on python3:any; however:

Package python3 is not configured yet.



dpkg: python3-docutils: dependency problems, but configuring anyway as you =
requested:

python3-docutils depends on docutils-common (=3D 0.17.1+dfsg-3); however:

Package docutils-common is not installed.

python3-docutils depends on python3:any; however:

Package python3 is not configured yet.



dpkg: python3-scapy: dependency problems, but configuring anyway as you req=
uested:

python3-scapy depends on python3:any; however:

Package python3 is not configured yet.



dpkg: tcpdump: dependency problems, but configuring anyway as you requested=
:

tcpdump depends on libpcap0.8 (>=3D 1.9.0); however:

Package libpcap0.8 is not installed.



dpkg: openvswitch-common: dependency problems, but configuring anyway as yo=
u requested:

openvswitch-common depends on python3:any; however:

Package python3 is not configured yet.

openvswitch-common depends on libnuma1 (>=3D 2.0.11); however:

Package libnuma1 is not installed.

openvswitch-common depends on libunbound8 (>=3D 1.8.0); however:

Package libunbound8 is not installed.

openvswitch-common depends on libxdp1 (>=3D 1.2.9~); however:

Package libxdp1 is not installed.



dpkg: python3-netifaces:amd64: dependency problems, but configuring anyway =
as you requested:

python3-netifaces:amd64 depends on python3 (<< 3.12); however:

Package python3 is not configured yet.

python3-netifaces:amd64 depends on python3 (>=3D 3.10~); however:

Package python3 is not configured yet.



dpkg: python3-sortedcontainers: dependency problems, but configuring anyway=
 as you requested:

python3-sortedcontainers depends on python3:any; however:

Package python3 is not configured yet.



dpkg: python3-openvswitch: dependency problems, but configuring anyway as y=
ou requested:

python3-openvswitch depends on python3 (<< 3.12); however:

Package python3 is not configured yet.

python3-openvswitch depends on python3 (>=3D 3.10~); however:

Package python3 is not configured yet.

python3-openvswitch depends on python3:any; however:

Package python3 is not configured yet.

python3-openvswitch depends on libnuma1 (>=3D 2.0.11); however:

Package libnuma1 is not installed.

python3-openvswitch depends on libunbound8 (>=3D 1.8.0); however:

Package libunbound8 is not installed.

python3-openvswitch depends on libxdp1 (>=3D 1.2.9~); however:

Package libxdp1 is not installed.



Errors were encountered while processing:

python3

handle /opt/deb/keep-deb.kernel-selftests...

install debs round two: dpkg -i --force-confdef --force-depends /opt/deb/gc=
c-12-base_12.2.0-13_amd64.deb

(Reading database ... 18838 files and directories currently installed.)

Preparing to unpack .../gcc-12-base_12.2.0-13_amd64.deb ...

Unpacking gcc-12-base:amd64 (12.2.0-13) over (12.2.0-13) ...

Setting up gcc-12-base:amd64 (12.2.0-13) ...

install debs round two: dpkg -i --force-confdef --force-depends /opt/deb/li=
bgcc-s1_12.2.0-13_amd64.deb

(Reading database ... 18838 files and directories currently installed.)

Preparing to unpack .../libgcc-s1_12.2.0-13_amd64.deb ...

Unpacking libgcc-s1:amd64 (12.2.0-13) over (12.2.0-13) ...

Setting up libgcc-s1:amd64 (12.2.0-13) ...

Processing triggers for libc-bin (2.36-5) ...

install debs round two: dpkg -i --force-confdef --force-depends /opt/deb/py=
thon3-minimal_3.10.6-3+b1_amd64.deb

(Reading database ... 18838 files and directories currently installed.)

Preparing to unpack .../python3-minimal_3.10.6-3+b1_amd64.deb ...

Unpacking python3-minimal (3.10.6-3+b1) over (3.10.6-3+b1) ...

Setting up python3-minimal (3.10.6-3+b1) ...

install debs round two: dpkg -i --force-confdef --force-depends /opt/deb/py=
thon3_3.10.6-3+b1_amd64.deb

(Reading database ... 18838 files and directories currently installed.)

Preparing to unpack .../python3_3.10.6-3+b1_amd64.deb ...

running python pre-rtupdate hooks for python3.10...

Unpacking python3 (3.10.6-3+b1) over (3.10.6-3+b1) ...

Setting up python3 (3.10.6-3+b1) ...

running python rtupdate hooks for python3.10...

dpkg-query: package 'linux-perf' is not installed

Use dpkg --contents (=3D dpkg-deb --contents) to list archive files content=
s.

Traceback (most recent call last):

File "/usr/bin/py3clean", line 210, in <module>

main()

File "/usr/bin/py3clean", line 196, in main

pfiles =3D set(dpf.from_package(options.package))

File "/usr/share/python3/debpython/files.py", line 53, in from_package

raise Exception("cannot get content of %s" % package_name)

LKP: ttyS0: 1401[  112.874282][  T288] Exception: cannot get content of lin=
ux-perf
: current_versio[  112.874299][  T288]=20
n: f0, target_ve[  112.885247][  T288] error running python rtupdate hook l=
inux-perf
rsion: f0

dpkg: error processing package python3 (--install):

installed python3 package post-installation script subprocess returned erro=
r exit status 4

Errors were encountered while processing:

python3

NO_NETWORK=3D

x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3a22000-0xb3a22fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3a22000-0xb3a22fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3a22000-0xb3a22fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef1000-0xb3ef1fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efc000-0xb3efcfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efb000-0xb3efbfff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3efa000-0xb3efafff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3e6a000-0xb3e6afff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef4000-0xb3ef4fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef3000-0xb3ef3fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef2000-0xb3ef2fff], got write-back
x86/PAT: bmc-watchdog:1462 map pfn expected mapping type uncached-minus for=
 [mem 0xb3ef0000-0xb3ef0fff], got write-back
LKP: stdout: 262:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/lkp-skl-d06=
/kernel-selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa0=
0fd217089e303b7d9b62ba-20230310-60197-szh7vk-4.yaml

RESULT_ROOT=3D/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_6=
4-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd21708=
9e303b7d9b62ba/3

job=3D/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x=
86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-60197-=
szh7vk-4.yaml

error: dpkg -i /opt/deb/python3_3.10.6-3+b1_amd64.deb failed.

memfd_create(): MFD_NOEXEC_SEAL is enforced, pid=3D1691 'memfd_test'
result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESULT=
_ROOT: /internal-lkp-server/result/kernel-selftests/group-02/lkp-skl-d06/de=
bian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf45=
21aa00fd217089e303b7d9b62ba/3, TMP_RESULT_ROOT: /tmp/lkp/result

run-job /lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12=
-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-6019=
7-szh7vk-4.yaml

run_hugetlbfs_t (1742): drop_caches: 3
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 http=
://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/l=
kp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x86_64-20=
220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230310-60197-szh7vk-4=
.yaml&job_state=3Drunning -O /dev/null

target ucode: 0xf0

LKP: stdout: 1401: current_version: f0, target_version: f0

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-8=
.3-kselftests-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba

2023-03-09 23:59:45 ln -sf /usr/bin/clang

2023-03-09 23:59:45 ln -sf /usr/sbin/iptables-nft /usr/bin/iptables

2023-03-09 23:59:45 ln -sf /usr/sbin/ip6tables-nft /usr/bin/ip6tables

2023-03-09 23:59:45 sed -i s/default_timeout=3D45/default_timeout=3D300/ ks=
elftest/runner.sh

LKP SKIP media_tests

2023-03-09 23:59:45 make -C membarrier

make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftest=
s-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/tools/testing/selftests/membarri=
er'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: null-ptr-deref in mincore_page+0x25/0x90
Read of size 8 at addr 0000000000000000 by task mincore_selftes/1810

CPU: 2 PID: 1810 Comm: mincore_selftes Not tainted 6.3.0-rc1-00007-gef2f3f9=
8fcf4 #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 =
10/05/2017
Call Trace:
<TASK>
dump_stack_lvl+0x4b/0x80
kasan_report+0xc5/0xf0
? mincore_page+0x25/0x90
? kasan_check_range+0x3b/0x1b0
? mincore_page+0x25/0x90
? __mincore_unmapped_range+0x13b/0x2a0
? mincore_pte_range+0x3b2/0x810
? walk_pmd_range+0x276/0x760
? lock_downgrade+0x100/0x100
? walk_pte_range+0x4d0/0x4d0
? lock_is_held_type+0x9c/0x110
? walk_pud_range+0x27d/0x5d0
? mas_find+0x1d0/0x1d0
? walk_p4d_range+0x229/0x410
? __lock_release+0x109/0x450
? walk_pgd_range+0x22f/0x490
? find_vma+0xa1/0x100
? __walk_page_range+0x13d/0x180
? walk_page_range+0x2a3/0x330
? __walk_page_range+0x180/0x180
? __down_read_common+0x17c/0x450
? do_mincore+0x15d/0x2e0
? __do_sys_mincore+0x1e5/0x300
? do_syscall_64+0x5a/0x80
? entry_SYSCALL_64_after_hwframe+0x5e/0xc8
</TASK>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Disabling lock debugging due to kernel taint
general protection fault, probably for non-canonical address 0xdffffc000000=
0000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 2 PID: 1810 Comm: mincore_selftes Tainted: G    B              6.3.0-r=
c1-00007-gef2f3f98fcf4 #1
Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 =
10/05/2017
RIP: 0010:mincore_page+0x36/0x90
Code: 00 48 3d 00 f0 ff ff 77 63 48 89 c5 be 08 00 00 00 48 89 c7 e8 1b bb =
0f 00 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 4=
6 48 8b 45 00 48 c1 e8 02 83 e0 01 75 1e 48 8d 7d
RSP: 0018:ffffc90002e7fa10 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff888144acd000 RCX: fffffbfff0c13951
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffff8609ca80
RBP: 0000000000000000 R08: ffffffff811cd48a R09: ffffffff8609ca87
R10: fffffbfff0c13950 R11: 0000000000000000 R12: ffff88810b508320
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000001
FS:  00007f5833e23740(0000) GS:ffff88837f100000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5833e4d5a0 CR3: 0000000147118003 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
<TASK>
__mincore_unmapped_range+0x13b/0x2a0
mincore_pte_range+0x3b2/0x810
walk_pmd_range+0x276/0x760
? lock_downgrade+0x100/0x100
? walk_pte_range+0x4d0/0x4d0
? lock_is_held_type+0x9c/0x110
walk_pud_range+0x27d/0x5d0
? mas_find+0x1d0/0x1d0
walk_p4d_range+0x229/0x410
? __lock_release+0x109/0x450
walk_pgd_range+0x22f/0x490
? find_vma+0xa1/0x100
__walk_page_range+0x13d/0x180
walk_page_range+0x2a3/0x330
? __walk_page_range+0x180/0x180
? __down_read_common+0x17c/0x450
do_mincore+0x15d/0x2e0
__do_sys_mincore+0x1e5/0x300
do_syscall_64+0x5a/0x80
entry_SYSCALL_64_after_hwframe+0x5e/0xc8
RIP: 0033:0x7f5833f278b7
Code: 73 01 c3 48 8b 0d 49 05 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f =
1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 1b 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 19 05 0d 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc6d1c8e88 EFLAGS: 00000207 ORIG_RAX: 000000000000001b
RAX: ffffffffffffffda RBX: 00007ffc6d1c91d8 RCX: 00007f5833f278b7
RDX: 0000000000000000 RSI: 0000000000001000 RDI: 00007f583400d000
RBP: 00007ffc6d1c8fd0 R08: 00000000ffffffff R09: 0000000000000000
R10: 0000000000000021 R11: 0000000000000207 R12: 0000000000000000
R13: 00007ffc6d1c91e8 R14: 000055a1d10a0dd8 R15: 00007f5834043020
</TASK>
Modules linked in: openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_i=
pv6 nf_defrag_ipv4 btrfs blake2b_generic xor raid6_pq zstd_compress libcrc3=
2c intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal sd_mod intel_power=
clamp t10_pi i915 crc64_rocksoft_generic crc64_rocksoft crc64 coretemp sg d=
rm_buddy kvm_intel intel_gtt kvm irqbypass mei_wdt wmi_bmof crct10dif_pclmu=
l crc32_pclmul crc32c_intel drm_display_helper ghash_clmulni_intel sha512_s=
sse3 ipmi_devintf ttm ipmi_msghandler rapl drm_kms_helper ahci libahci inte=
l_cstate syscopyarea mei_me sysfillrect sysimgblt ie31200_edac intel_uncore=
 mei serio_raw i2c_i801 libata i2c_smbus intel_pch_thermal video wmi intel_=
pmc_core tpm_infineon acpi_pad binfmt_misc fuse drm ip_tables
---[ end trace 0000000000000000 ]---
RIP: 0010:mincore_page+0x36/0x90
Code: 00 48 3d 00 f0 ff ff 77 63 48 89 c5 be 08 00 00 00 48 89 c7 e8 1b bb =
0f 00 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 4=
6 48 8b 45 00 48 c1 e8 02 83 e0 01 75 1e 48 8d 7d
RSP: 0018:ffffc90002e7fa10 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff888144acd000 RCX: fffffbfff0c13951
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffff8609ca80
RBP: 0000000000000000 R08: ffffffff811cd48a R09: ffffffff8609ca87
R10: fffffbfff0c13950 R11: 0000000000000000 R12: ffff88810b508320
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000001
FS:  00007f5833e23740(0000) GS:ffff88837f100000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5833e4d5a0 CR3: 0000000147118003 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Kernel panic - not syncing: Fatal exception
Kernel Offset: disabled

--MuXUmVDMr7gP5Pe2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/kernel-selftests.yaml
suite: kernel-selftests
testcase: kernel-selftests
category: functional
need_memory: 3G
need_cpu: 2
kernel-selftests:
  group: group-02
kernel_cmdline: sysctl.debug.test_sysctl.boot_int=1
job_origin: kernel-selftests.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-skl-d06
tbox_group: lkp-skl-d06
submit_id: 6409a89e2d7a86432fafa79f
job_file: "/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230309-82735-nixgyx-0.yaml"
id: d4ca1e01c5ddef9c2cd7bf64f51f8a5e9e01f539
queuer_version: "/zday/lkp"

#! /db/releases/20230306211357/lkp-src/hosts/lkp-skl-d06
model: Skylake
nr_cpu: 4
memory: 16G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
hdd_partitions: "/dev/disk/by-id/wwn-0x50014ee25a160161-part*"
ssd_partitions: "/dev/disk/by-id/wwn-0x55cd2e404b653ca4-part2"
rootfs_partition: "/dev/disk/by-id/wwn-0x55cd2e404b653ca4-part1"
brand: Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz

#! /db/releases/20230306211357/lkp-src/include/category/functional
kmsg:
heartbeat:
meminfo:

#! /db/releases/20230306211357/lkp-src/include/queue/cyclic
commit: ef2f3f98fcf4521aa00fd217089e303b7d9b62ba

#! /db/releases/20230306211357/lkp-src/include/testbox/lkp-skl-d06
need_kconfig_hw:
- PTP_1588_CLOCK: y
- E1000E: y
- SATA_AHCI
- DRM_I915
ucode: '0xf0'
bisect_dmesg: true

# for sysctl

#! /db/releases/20230306211357/lkp-src/include/kernel-selftests
need_kconfig:
- FUSE_FS: m
- IPV6_MULTIPLE_TABLES: y
- MACSEC: y
- MISC_FILESYSTEMS: y
- MPTCP: y
- MPTCP_IPV6: y
- NET_FOU
- NET_FOU_IP_TUNNELS: y
- NET_L3_MASTER_DEV: y
- NET_SCH_NETEM
- NET_VRF: y
- NF_FLOW_TABLE: m
- NF_FLOW_TABLE_INET: m
- NF_FLOW_TABLE_IPV4: m
- NF_FLOW_TABLE_IPV6: m
- NF_TABLES_NETDEV: y
- PROC_FS: y
- PSTORE: y
- PSTORE_CONSOLE: y
- PSTORE_PMSG: y
- PSTORE_RAM: m
- SECCOMP: y
- SECCOMP_FILTER: y
- TEST_BLACKHOLE_DEV: m
- UTS_NS: y
- VETH
- X86_CPU_RESCTRL: y
- NFC: m
- NFC_NCI: m
- NFC_VIRTUAL_NCI: m
rootfs: debian-12-x86_64-20220629.cgz
initrds:
- linux_headers
- linux_selftests
kconfig: x86_64-rhel-8.3-kselftests
enqueue_time: 2023-03-09 17:36:30.835176259 +08:00
_id: 6409a89e2d7a86432fafa79f
_rt: "/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: 3f72112815381618e23d99c590013e409bef66d8
base_commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
branch: linux-devel/devel-hourly-20230306-065736
result_root: "/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/0"
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 1200
initrd: "/osimage/debian/debian-12-x86_64-20220629.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/kernel-selftests/group-02/lkp-skl-d06/debian-12-x86_64-20220629.cgz/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4
- branch=linux-devel/devel-hourly-20230306-065736
- job=/lkp/jobs/scheduled/lkp-skl-d06/kernel-selftests-group-02-debian-12-x86_64-20220629.cgz-ef2f3f98fcf4521aa00fd217089e303b7d9b62ba-20230309-82735-nixgyx-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-kselftests
- commit=ef2f3f98fcf4521aa00fd217089e303b7d9b62ba
- sysctl.debug.test_sysctl.boot_int=1
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
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/modules.cgz"
linux_headers_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/linux-headers.cgz"
linux_selftests_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/linux-selftests.cgz"
bm_initrd: "/osimage/deps/debian-12-x86_64-20220629.cgz/lkp_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/run-ipconfig_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/rsync-rootfs_20221125.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/kernel-selftests_20230110.cgz,/osimage/pkg/debian-12-x86_64-20220629.cgz/kernel-selftests-x86_64-d4cf28ee-1_20230110.cgz,/osimage/deps/debian-12-x86_64-20220629.cgz/hw_20221125.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220804.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /cephfs/db/releases/20230307153904/lkp-src/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 6.2.0-09238-gd2980d8d8265
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/ef2f3f98fcf4521aa00fd217089e303b7d9b62ba/vmlinuz-6.3.0-rc1-00007-gef2f3f98fcf4"
dequeue_time: 2023-03-09 18:00:33.752019306 +08:00

#! /db/releases/20230309164242/lkp-src/include/site/inn
job_state: running

--MuXUmVDMr7gP5Pe2--
