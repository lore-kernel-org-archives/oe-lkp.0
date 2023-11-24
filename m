Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF0646
	for <oe-lkp@lists.linux.dev>; Fri, 24 Nov 2023 01:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpsFMw8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700790071; x=1732326071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=We9Vl/84EQzxOnyIt6bQrWG11swvs6+Cek+9DogNh4s=;
  b=GpsFMw8XCDVnMEYJFMlA4+4L6os/UucSfqN2aAFoIb9gZ841GhKNzsBs
   1CTZMpfDsj6vz5jNnMnj1LbY8Pt6YXfZdO5UMHnRBMuyedR8akVEW4fNB
   Il89B943llBMOuODBEoU+5jX2XJP7+hipqHFASewX0f2c5mzAMNxj3X9e
   HWXQqM9Iu7N1JgwQacvhn8k531YUZ3tdmgs2VQhmxEgstubaAiGQbRjK6
   pNUbHn0Rv6+RCz1VTqKXiIlzuq3QfLo7UP56j6Nd6XFDoUy42DXEHtXGO
   WDkCdbg0xgcsOog8LrWJpX0Vkvkgc4Jczju/EtScWdIJAG/S6vPw1KhDQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="11021998"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="11021998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 17:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8820780"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 17:41:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 17:41:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 17:41:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 17:41:09 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 17:41:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTH7JY2i6rL2EzeVD1BZLpyvVXTbgwE2jeRd9YSvrUQfPvuOTY9QLYieIvo4uENYSgN7S2cMupfM3EZH5wgD14UQDQMxoWrwa+Vttx7xlVbLT73icbdPtMKtYKt/seS/4NegCV/7O4oIgZ3D+ONB+emSSf6IS1jK0a1nFsd9P93KIL+57UnvNtHfyX73NOgQZZFT8adC8MzhpG7JEvdl8IV8SwTUJS0Mh5T9234aXtmkUpSgXpA2bxJ7T5l9MKI+AbyaAuBOI5AyZHPLxZSq3o+AHsQG0pIieLeYbeDOyoxt1LW/RDGSbLG+GQgYg+kl5gPRPzTaDH1C0haflMq0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIkssso+Y/6C1zWCfyIdy1VcnosDycu4u4S1/cw4p+g=;
 b=R6/O+9kRvquzuI+AHVZ7UKJ5VP1hInl0ZeW8nlU3HLFfNfGAg4hnnTC2jU8FTVMe5PYPMA9LIYsre5B1qkFvtnwJUzIA4EcFNVTDYAqoR80l3L0cJOgXnjj+RBQyP8lyboihRxITNz5mUKI9joztcVuoYxOJrs7x6WWGC2DJqjHC6giGrSNRrXM08HvVpMp5Ibpj5P0xajNNdJiGUyoJE7M1Y+QqOH2X8h8pe5BdocWGrkbMPfrJOzB2W3eIs3OqbT8clx2YI0hW1vieACLmdMdK6pXpsK9uUWryvtQXo3ZFGzj7043bXN4thPKYWLqFT2b+jM8S5ebkuDf3rSZy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 01:41:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7002.027; Fri, 24 Nov 2023
 01:41:06 +0000
Date: Fri, 24 Nov 2023 09:40:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:locking/futex] [futex]  2e0c8ddd92:
 ltp.futex_waitv01.fail
Message-ID: <202311231627.60ec8f91-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: f888d512-503e-4d34-d6a9-08dbec8e6c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QuFJmUs+O045932BIMsZ/a+q6iGvCWfqGUmUIPvQX+HbWGouZYUTyuCEO0TtUSraW/EMJIz2scfBGqqSWmnZapB7o+dGhHtz9MN1q/aYe34/T+dBg6Jz5Unni2o77CxZLYsBU1/SU4nhGqQxdZJkS701y/gYQ1T+CAWrtDy81ewfsCribyKB6jtXFvseTePZNBgk7M1l6LCoCOTjHaTeDSMhzexfYtO46XqGi9oe/2lbeUeu2Vg/IdlFnJPHsY+27+Ia2Jh9NVovIcsey95MDU6w85OhV5QsfUWMj+utSkjoyGgZc9LHXjnqPB2wyBROrclATuzLS8wlXDRSun+rsK6gAFDb5x7zEr+hE6DFkUlyO7o7F0C9lZVuppXHOj2OLRakL26AHlViwQwPlKLOYw5cCh0KUjxzPhkVjEdNmwtM1Nwf+/9MWZr7EwdT36G71MY6eWAAXEW2vJVM4SXb7HAYlAxrP3JOYPU7J/DRyi+fzsR7GY4hSdb5rrlZ1o8CzHO8XtpfD0ayropgQ4Em130mCq8R2WLKQbrPq/uxg034fJZnuPKb/nnYHocKL27Z/IryqzaZozah/56zpVxUXAR78X1LsHUi9AUFEfwy5FwWK5S4cBzcQRH5DYWSksTRVTl2SDvgVnnSr7Bid+8few==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(83380400001)(966005)(6486002)(478600001)(6666004)(316002)(6916009)(66946007)(66556008)(66476007)(6512007)(6506007)(82960400001)(36756003)(4326008)(8676002)(8936002)(5660300002)(2906002)(107886003)(1076003)(26005)(2616005)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+wmOKC5CLFretibhrPHamBD7MZAqhknKqZzihS+1B694SvdUE2rXRAhxW8K?=
 =?us-ascii?Q?1ll5EAAmvpxGEdg1uVRZiP4R0t4dmmwFIo7yKtONeJ61gnup4AckQ8UAiR5d?=
 =?us-ascii?Q?WVrZz8XMdNLcAfDJj+kIInbqtFU613OxDWYujSUM5e14fyz5Loj8j/cjl9tr?=
 =?us-ascii?Q?2MSp1avEXnzf+XETZEcqkQmZ61vFkU117PXSAq6YVm/jL90mfge9lSNfD7Vc?=
 =?us-ascii?Q?Vt0SE/mnb88aVLWnQSdT1elsHlXspBr3KZdqjPs2S+BwodM/0ypjSJe7cPrc?=
 =?us-ascii?Q?G7x4XVZi5xTLUoJEvAT0K/euozRtEZJ8E7OGdmobXaLBbqv5pXLr3MA1tawj?=
 =?us-ascii?Q?qTveZKx+5DICBeBD/R1piyiXiaE9Cx4igYUtk6ohRcl61sdn1Rf3puVx2SZT?=
 =?us-ascii?Q?E0aKtSZ14f3qfn/TuHomrKf/STccXbGh27xlxmDh4DtEnEynoCtT0Z58vrxr?=
 =?us-ascii?Q?Q9Q0B0WsZF/eK76XtbeZuPi4eKr/TL2aB43s+mpMqErp4Xtl/UazHX4br0ZF?=
 =?us-ascii?Q?xAtINETIIsnGYw+kF5lPoAnQNhw3CLMySJTk+hgcbKINKZEZHLYUsQZRmnmg?=
 =?us-ascii?Q?I2A8yiK4JKTNHs1psqNFVJDwuFo/Emxu/Ui/E7YU0nxIXRVprarR4D5x0zSa?=
 =?us-ascii?Q?hYtrBl8ZfR3DSkLLDBJ9fZusSWCec+ndQaC+5UHLL1/ulyJvlPZyURbwyjxF?=
 =?us-ascii?Q?v6N14fDkpy95T4BgLHBKr2sXtEhwxnzOJmWOxUoe98jifq7C5wlAl1ymFveK?=
 =?us-ascii?Q?mxyWT4JvPCv+vTjzILObcfCMma6NMF+pRFHvXRHtOuLC3S2OsnZl2ueJD3ek?=
 =?us-ascii?Q?WpMUurezhSd1pt4P58GIqsV9kM4V3mBy9xJc37EfF7BihGjld29e70vuYanH?=
 =?us-ascii?Q?ojUmnE/xyQvkMRUIpkc7oR5MeqH+uILiTStHjSstBv/OjPXprWg9Kkq1SDUW?=
 =?us-ascii?Q?Xx0LwwgOlF+R5mQ2uSQCumqaA8cJUtV44/WYKpdE7HupcD7f6Uv9LXXVgzFi?=
 =?us-ascii?Q?JS5yTg3Z22D8Gd7NzoJuF6ymVfXe/ET+G7Qj8PshDnHOBb0m0/dlT7Vs1Xde?=
 =?us-ascii?Q?DIiXLE7lwauf3LT65RijPH7FjCGYb5LyfnaKAc/S2moxhjQRJwt3YGXzz8yl?=
 =?us-ascii?Q?TARMG1hhyD/ZtC8bx4B4ESB56kmvPOu3dddEdUUsoongXabk4w+PeOLRp6bF?=
 =?us-ascii?Q?x7RkUSKaVYqz8J3CasoOtG1yrnmFJ7TkGOpe+pgu2dck2vmXVsbHRWVxYNI9?=
 =?us-ascii?Q?pzwIY7QFCZ1ekjxfIygGJ4H+JYQiRxEU1yrr1BEfLPzTh4eLP8xfcPk6rgCo?=
 =?us-ascii?Q?iXrGTG9WIETYPE7jsWSAXJ+UlK/gt6WTFI/cmQi6FTbf7BIB1+oe0tIHWN0L?=
 =?us-ascii?Q?pL3P+1tdtTQUyRPquLqVBUY/2ncvG4pkZRywhnxoYkNSyORHK99kvtwHVOhx?=
 =?us-ascii?Q?8bn/MAzhiaSLbz8LnnHCbikUtDxaI/K4SEKzNuZQU9VaQMb4xYuqs2kGPEoQ?=
 =?us-ascii?Q?L6cmxLdcR/c6pqmuJX1ZCt+NsJ4hYNUo1I6ISyLjvxmzcj1DWSCv6hlSm5oz?=
 =?us-ascii?Q?/CE6HYes/FRmo/wtAfvmyTt6tas14JN1T4A34spWt3Gn4M65xHbVKB5AJkCl?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f888d512-503e-4d34-d6a9-08dbec8e6c68
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 01:41:05.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjG8bMGzkepD2DjhFU3+ER2QhVoMxCLXfjvvztRynu+UFE7/U3nMsfioXI6Me9dVhtrDqx52maDjN+81zbJGwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.futex_waitv01.fail" on:

commit: 2e0c8ddd929277ac14c27b45a26aabbdba1e3ac8 ("futex: Enable FUTEX2_{8,16}")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git locking/futex

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20230715
with following parameters:

	disk: 1HDD
	fs: btrfs
	test: syscalls-05/futex_waitv01



compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311231627.60ec8f91-oliver.sang@intel.com



Running tests.......
<<<test_start>>>
tag=futex_waitv01 stime=1700478101
cmdline="futex_waitv01"
contacts=""
analysis=exit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1558: TINFO: Timeout per run is 0h 02m 30s
futex_waitv01.c:51: TFAIL: futex_waitv with invalid flags expected EINVAL: ETIMEDOUT (110)
futex_waitv01.c:64: TPASS: futex_waitv with unligned address : EINVAL (22)
futex_waitv01.c:77: TPASS: futex_waitv address is NULL : EFAULT (14)
futex_waitv01.c:87: TPASS: futex_waitv waiters are NULL : EINVAL (22)
futex_waitv01.c:98: TPASS: futex_waitv invalid clockid : EINVAL (22)
futex_waitv01.c:110: TPASS: futex_waitv invalid nr_futexes : EINVAL (22)
futex_waitv01.c:112: TPASS: futex_waitv invalid nr_futexes : EINVAL (22)
futex_waitv01.c:126: TPASS: futex_waitv mismatch between value of uaddr and val : EAGAIN/EWOULDBLOCK (11)
futex_waitv01.c:141: TPASS: futex_waitv timeout : ETIMEDOUT (110)

Summary:
passed   8
failed   1
broken   0
skipped  0
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=1 corefile=no
cutime=0 cstime=1
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20230516-75-g2e582e743

       ###############################################################

            Done executing testcases.
            LTP Version:  20230516-75-g2e582e743
       ###############################################################




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231123/202311231627.60ec8f91-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

