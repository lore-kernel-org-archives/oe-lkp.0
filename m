Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B143C3611D
	for <oe-lkp@lists.linux.dev>; Tue, 20 Feb 2024 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708414508; cv=fail; b=KzXBH6hU5kRA2dh3Eu9U5hmLjkDAO4rMqxh1KK/PX8M8ihWp03MW1AcDO2yiwWiPtn8lrH1Ac+a+jFg4yZPe0Og/e3Ir5fmafJTJ5QsL/FtgspRSaS/3Wno0wIVY8YzndtHAA/xX2cPXvN6+VDukkVW78EadzKjQbF657y+m1/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708414508; c=relaxed/simple;
	bh=wMbLBGdgejLs5NtDIO8mrnnNYAGxaL9QGr7a7bo7xYk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CetSiqBDb06hwAATpBGwGegJEFsrMPsPwgSm1kykiU2zosM8v4Ea9HR0X6WAsAUcnu4q/wB3du1ZzXyh8Uqrt5hZD0IM8yIoXXWmrVDoGngB17/xwZBNKPsRuotnieRXReDAW+IIYsjuJy59i5nAZsYU8TnNQv2X+MKy7z1uF4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHnOrqbt; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHnOrqbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708414506; x=1739950506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMbLBGdgejLs5NtDIO8mrnnNYAGxaL9QGr7a7bo7xYk=;
  b=NHnOrqbtxCK197BvVOLIvNkiWsO88fifOvRRBc2NpWcnSIcrIVbxra9v
   bVnIyMOy8gRSkMqWLbO09OYgO+dvhzZjyD6Q3U5MAc3Hwhv+AdiqepemP
   6U8KKrDxUYQDjMkx4fiQHEytMYmr0c7TrfdG7XiqsLkq/UpK92O6DTJKz
   5wduDFbpKraIDpE5Ew8jBeHBGONbu5ZrXnN/wFbnTYE1h4Uuw4iPWFozd
   r7+g9xFxFNVxGEDgLUMCfmyiar4LgkT3H74O9rziUrZylj85PNboVxsjF
   kn2twQOXbWqmYxbhDbBkhDD2tnloL8jZeAR/mpB2gnY2d3yzT5S0J0omU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="6319709"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="6319709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 23:35:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4944425"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Feb 2024 23:35:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 23:35:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 23:35:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 23:35:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1gpcKl3cxsfFK2KCbEnPQHrqIaI7qxI7QfUiUxNMnPrgHfjVmNWK2NW0nvwN+jBzBrZHyTQA88dU58J0PffV2CUI6bzZw1hByZ2EFcdG0A/8VtflnyVDIuV9dAqoA1o/G7Gx39aFv0n4HHkO8jdb4fBfvbEHZETfZwf0q7a0VnbAJxhb0BY9lj4PwqMaIsZDCFw8oa091NUhCF6/5zAzl+MaMw65stO6EsOih+vuiAEYbbI+yMXg4PwRFodYfEGrj8gNH+raPjntrl46DsY+y7ySPgQp4Pdse5rGzz2X721JDL1Bw4qEQ4+3dWmE5ZdB8vTh7gkjRLmJ2ghgUm6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V/RwFGMXGDml02CnksDWIwD0Bh6CDszBTXESAwwFjM=;
 b=oaHik8inDgf/GIySpFvwlX5zFRWtuQg/TZ0BSDRlFFIXu83n/w78nvmgq6Omr5rRXXAGctD4NKxz4yhADGliDGzjKrSBmLZOICb3AIBu5EHInViMykB/G11Fp32w7l49RC25aeENCgWMe+XATRwGRkOhJPFJhfNgtPexx9JPoYXBQG1IsKJiWKRfaXxKnlOlY5SaT9TXdzHDzL16Ehf+tObXyKVgu3NJIr50tWZinT9OvZeHo5ay/bRVti7IkJoXfuM4QNMJdsSGYYaGfRftbS4FPUyzEvDcoe/Um25vMHtpcZdPGhVm8EU0R98CMZ2L8drrs7qOrFkpALsklUCpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.32; Tue, 20 Feb 2024 07:35:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 07:35:03 +0000
Date: Tue, 20 Feb 2024 15:34:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Marco Elver <elver@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Vlastimil Babka
	<vbabka@suse.cz>, <kasan-dev@googlegroups.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [kasan]  187292be96: WARNING:suspicious_RCU_usage
Message-ID: <202402201506.b7e4b9b6-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ed7b96-5bdf-4a6f-106d-08dc31e673a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYlpeVm4zG1rHaCivzNIg7pHMmELQqQOMGmG1p47NztYVd7GMypX+4V5Tes7d77wvFBicHPVMSwq7zWC9kwe2xj7EvSs9Ja+9WGzO0IcTlTaBNyLeubprhBUoGk4gg3HYXtxDCpK4KtCekQdv01+kSrOnd6GEJ4kp8kd0XWeFY+uEL9WQV8XLjUuZOJcpk64YDqjc/Y7UmP35iy+Y15WkNh4k2DoX7jywm1pk80Z0l6Fn+NHkDizCKleT+rKsNVD2PG8lrL9JUX4IsK1XpaLX+6Wvw/3H/ENd2MqKrj03PfN+ZG6ivufL64uZJYww2XAnQnA76iNbKQaCSKn/6KI+TfVgYPpGLf6wlGTV3iKfyNTZ5YAT6fLEEcApyfv6TJInG+u9oXSc7LlfotXYSRR/EYKwmhScSpJAogJ5hBO6Svi0JPwfZ64IRrjjy11UFNQLguLhkPt3QIO+d43M5AyQIc9s7OYMvSzCdJOoXIjZ1rAuFR598Re02xtqVJhTdWL6Qn1hIXoce3TtgWPJmNIO6APsfhfgwmU63YNBT44LsJ+aY9p6Xc5nIj1AgWu1p0m
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eRlfO6I9cyX6AEl7a8tCTwcVd4rZyBeG6zbkAVwosdQPZlIuXc9zKh0SrnPA?=
 =?us-ascii?Q?GcTNljD/KCJYIcpkrYQ3L98waswPWDconnc7I1eFKjLYKMAmiCnW/toQtFBz?=
 =?us-ascii?Q?u9QwceLfaU5gfeZB/gL2cG8BiBqkOAJ30oKxftguaSDmV5onS53zeNEn9i5R?=
 =?us-ascii?Q?VoZgO4uwULlQnQ/H3yuzFK9GnvQQ265l6FjEnq/JPk9/fcLTykOM9tG2mCM7?=
 =?us-ascii?Q?BnNi/3uvCxmsV0466jMCsn4AzerCykb3bnPWGSb0bMy9qsk73kvgGv+8Iau0?=
 =?us-ascii?Q?oBPgaYYnYP72ZkcSrEZIEu40LPbWXnCdf6zfZGtwSyxZk0OJGJbp0joNYxYf?=
 =?us-ascii?Q?5a4ZKM5G0DmTW3F8y+XbIKbMZ8ykT3jQLmpTqdUdfXK53AO4ghQLQK8623tC?=
 =?us-ascii?Q?D8ac0ljVFzMzAjIxe7JAxo0OFcPr/nUbEJ6e3WRpQIfGGLbtKVK2sd/pwO+y?=
 =?us-ascii?Q?+62lb/22s8DIDZMBloKxhaQH41AyE99QQPfyTr0D0OXo7i0AbYvhy8zWJz3c?=
 =?us-ascii?Q?N52+Oea6tEYhMrF0ACMfehM5fMjkyNkoBZoUBJRTDcYcwlOG8vLOPcc/z/qi?=
 =?us-ascii?Q?oy3IdIZzb7XY8Q31YXUpallk/f0W0QIG4T0qUxF1JHeCKR8jweTiiLpzEGpQ?=
 =?us-ascii?Q?b/5cxCcfbap5f2sblGJ5B1JweYC6fDGxqXvXcBOzqYw8mFg3kILjSB+omIU5?=
 =?us-ascii?Q?6VFrKEG/u0HPz2OsQ6BUfLsuNf6XXvM1oiwEsc0awm3GhKEOQCOuWb0dUx8z?=
 =?us-ascii?Q?oH1ez0otch0OyJ4YHNorSTqegmG1ra4vX2QUbEs1XaYvEg8g7z/oLvLfPQYZ?=
 =?us-ascii?Q?m4g0nS+1s/KtDciYYEbQ5Ngy5tO59gubfPKNyiNi1A0i9HdzA4RxAu3nWwE6?=
 =?us-ascii?Q?D4ywRd/nSKtomHm8cVb5+JywlMLMj4ID7zrzrBLO4LB4VtREckH3WoUo2d7S?=
 =?us-ascii?Q?rGmkSoYJ0awPM98+fKUkoMfl07B2bgsdk/4l3h6nYBXdKNVoNtvHBKGJoUBR?=
 =?us-ascii?Q?cbwID3fayb+RBjEBakaU/1/A4HrRPGogzU+HTJd0a9pXzk2v0ctaf3SrziGz?=
 =?us-ascii?Q?Wy61uNEmJirUt/zJcliLPsHVWD9A1zqUeP3cjys4EQFSK7uIAB/DRwMk40lc?=
 =?us-ascii?Q?EFcseMcXTXQzXpx7RCQSTi2jCze9aHl/U8Nn6KDcT0MhTuLP+GNFK23fCXSd?=
 =?us-ascii?Q?c5bozMAeH/zxvcKRzK0NIZbk7RatMYdcKI14+jfQ5TC+w9JzaJuaRwHA5MlJ?=
 =?us-ascii?Q?DH9z4ZSAfr2LaRTmOyRnDuN3Q3TqZGSIVVhsx2eRSwqfVcp0NqNjiQOKvZeW?=
 =?us-ascii?Q?rzVv+GvHlM2B5UQ6rfNbHkHoh7hTu33wrFwZUYORoC5OoNk5lXBQAvB7J2OG?=
 =?us-ascii?Q?cAwx+IplHr2MLeIpddU/3B7Ya+AT73UIxzBHZyMSueWZg/Zaq40685CJbz74?=
 =?us-ascii?Q?1mKqQqmpQorddR8y0IpUYf5KEVelLHkCGKGsDH3FjrMQKfvsQcwje0KMl6fA?=
 =?us-ascii?Q?PwOOugYyIgpz++72SYpEdO5FTgYcU5O0FRR0zEm+gVkuRwAXnKLGUbVNOOY+?=
 =?us-ascii?Q?CxviV1Hlk4aXAM3mn4sNHwqg5ydYa1/A8Xm1xKF+Jap83psdokNTYbOkuYR8?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ed7b96-5bdf-4a6f-106d-08dc31e673a6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 07:35:03.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugaFBSvR5qPntbHxUay3rfGhzO8akDNwnJbbP0sWrKgVybNUEslKFkz2j5vyRZpgp2EPL8hqCRHqq25fu+RPEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
X-OriginatorOrg: intel.com



Hello,

we noticed this is a revert commit, below report is for an issue we observed
on this commit but not on its parent. just FYI.

113edefd366346b3 187292be96ae2be247807fac1c3
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     dmesg.WARNING:suspicious_RCU_usage


kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 187292be96ae2be247807fac1c3a6d89a7cc2a84 ("kasan: revert eviction of stack traces in generic mode")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: busted_srcud



compiler: clang-17
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402201506.b7e4b9b6-oliver.sang@intel.com


[  292.513535][  T653] WARNING: suspicious RCU usage
[  292.514923][  T653] 6.8.0-rc4-00126-g187292be96ae #1 Not tainted
[  292.516369][  T653] -----------------------------
[  292.517743][  T653] kernel/rcu/rcutorture.c:1983 suspicious rcu_dereference_check() usage!
[  292.519310][  T653]
[  292.519310][  T653] other info that might help us debug this:
[  292.519310][  T653]
[  292.523130][  T653]
[  292.523130][  T653] rcu_scheduler_active = 2, debug_locks = 1
[  292.525644][  T653] no locks held by rcu_torture_rea/653.
[  292.526974][  T653]
[  292.526974][  T653] stack backtrace:
[  292.529271][  T653] CPU: 0 PID: 653 Comm: rcu_torture_rea Not tainted 6.8.0-rc4-00126-g187292be96ae #1
[  292.530780][  T653] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  292.532329][  T653] Call Trace:
[  292.533524][  T653]  <TASK>
[ 292.534696][ T653] dump_stack_lvl (lib/dump_stack.c:?) 
[ 292.535941][ T653] ? __cfi_dump_stack_lvl (lib/dump_stack.c:98) 
[ 292.537221][ T653] ? lockdep_rcu_suspicious (kernel/locking/lockdep.c:6712) 
[ 292.538523][ T653] rcu_torture_one_read (kernel/rcu/rcutorture.c:?) rcutorture
[ 292.539887][ T653] ? __cfi_lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4312) 
[ 292.541226][ T653] ? rcu_torture_timer (kernel/rcu/rcutorture.c:1955) rcutorture
[ 292.542621][ T653] ? __cfi_rcu_torture_timer (kernel/rcu/rcutorture.c:2055) rcutorture
[ 292.544012][ T653] ? init_timer_key (include/linux/lockdep.h:135 include/linux/lockdep.h:142 include/linux/lockdep.h:148 kernel/time/timer.c:847 kernel/time/timer.c:867) 
[ 292.545262][ T653] rcu_torture_reader (kernel/rcu/rcutorture.c:2093) rcutorture
[ 292.546579][ T653] ? __cfi_rcu_torture_reader (kernel/rcu/rcutorture.c:2076) rcutorture
[ 292.547872][ T653] ? __cfi__raw_spin_unlock_irqrestore (kernel/locking/spinlock.c:193) 
[ 292.549108][ T653] ? __cfi_rcu_torture_timer (kernel/rcu/rcutorture.c:2055) rcutorture
[ 292.550341][ T653] ? __kthread_parkme (kernel/kthread.c:?) 
[ 292.551425][ T653] ? __kthread_parkme (include/linux/instrumented.h:? include/asm-generic/bitops/instrumented-non-atomic.h:141 kernel/kthread.c:280) 
[ 292.552489][ T653] kthread (kernel/kthread.c:390) 
[ 292.553504][ T653] ? __cfi_rcu_torture_reader (kernel/rcu/rcutorture.c:2076) rcutorture
[ 292.554689][ T653] ? __cfi_kthread (kernel/kthread.c:341) 
[ 292.555749][ T653] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 292.556792][ T653] ? __cfi_kthread (kernel/kthread.c:341) 
[ 292.557852][ T653] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[  292.558920][  T653]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240220/202402201506.b7e4b9b6-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

