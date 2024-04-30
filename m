Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27780DDDA
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 03:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714447226; cv=fail; b=jmD70CVvRoewvthEAVPgF1p71k8EAzqOlDtSoDQSQjpwyR22Qc/Qav8cg++SfcZIp7OqUD9O4yb8w1yiuKjivkDnbylmqNsT1+9naT+x2Gcxhn2l2DYc2NPhY7r6CIxQJnZXp+ugbpy/HS284CzwhogBNgB+mJ+YHGZW4QtBozo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714447226; c=relaxed/simple;
	bh=fG4eGmEZ969bWG1Qb6wxKsjqmZWbwWq8VOcy/XxHziw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eOoV689c0wbC0JzXeL1ZBhD/2uiIBo3BcqRl0p1nyg8DLXPe6um9F2Di0TsqYdzK5kcj8HaS+cjRdrq2qBenTYT2vf4ZHpFCcbet6SCxvOW5fYyV6pStJlPIz4qjsyfNfylEP1CJEsZwFkji7j1XQyrNm9oDdaW/Lnfu1BCJiGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbtK0QkA; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbtK0QkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714447225; x=1745983225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fG4eGmEZ969bWG1Qb6wxKsjqmZWbwWq8VOcy/XxHziw=;
  b=LbtK0QkAvjejD8qnvKY3Jw4Ls8VifPFNYY8vR8bVQdEdrwR4CE2D41Sc
   jANr5mDeF9loxShR1MSwpu9YYBt12HEeUVos4xkyViTvzkBXvYJuZ4tns
   rJy8UE++xsF2IXG51uBXk1yAiBbNPxGIxBHllwIyWN4Uo8vIbPplGsDyV
   O3C+f8qxqkoHJNotsU7MhrZ6XmvtOGG/gVS2vz/7+Q6icHL/KzAzb6c93
   Sr2wCDT5HBp8o0R3X8uIRy/Qyru4ZFgrkNQR/QwVeh+TrKvND+dAOBgXO
   upI25yNlMYRiXLKqY3b8TO8c8zNgu0FYovCKISsG5oQoGaP3SoE9ZIrMf
   A==;
X-CSE-ConnectionGUID: cjsaya0BTvCDzzBdNcxVNg==
X-CSE-MsgGUID: Y795d4fsQzem07D5ZYY4Hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13958585"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13958585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 20:20:25 -0700
X-CSE-ConnectionGUID: 7BPYnzHzTvmUI1Inbe1GlQ==
X-CSE-MsgGUID: kKhENniGQWGv3NsXJPsQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="63793446"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Apr 2024 20:20:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 20:20:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 20:20:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 20:20:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3BSJ/CwrEedPbYKCkz912s2pHDtQdxAAjy8zjl/Z+tXFtO43mtEiFucsQJX14T7ysxmD4xqfsj8e4ZWEiVc/XGzIYTjhTpjzbrDwhsQbWacGM0Y5r1z5IOPRo89/7tHgOKX076UPlI1R9TR7bNNSL6bZlDnaa3iwsPnI0dF8RPPLB2/aBRHEJ9nx6McE0fyVqp8XgazmkX2RnB3lXRvH7eyW7yOXvGR/GfHisHfnBIinj6OG5E8nFu0lIgm5nX9MRE8ilg3apysIz2DlcrD+i8Uq73L6pv2MI4VofXvddutcpITC+xwhVnrfrqLpCQ7GILaGEsKmfjHOsueR/aqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO8Ujfudyhht8IPTPxCsU5dAsVku9K5FcEfPyUIufuM=;
 b=hAVN7LsRK4APt4dj0O0/TalqznEbCoP8pWLxTt/fhZJnrOSqDLka2r9Fi0H4qdtwWh+E1xosmNgWLYsjonlcjBp9jDIP0MMxHFon9nz9X5nhzr7S2jDw7UmEVLFKxJti2sGc5JV7+/JXman9ulk2krtoyXlHfNEo22HS9gX8Obl/ICyErf7m7ytw/qAD2P8039uxoUIbT01xjRYQzuMlCjpDay9mKtgCLpyhG0jdf7IBa2EmtUIiG1DL1Hgf+neBnSEtqWzVjyQLCBqJd92QqPyLA8kWs3yFmBW8zkz9uFKD5DB/J4s38a0/SZvrlxm/jyvO3gjw2M6FIYPEOgB8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 03:20:16 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 03:20:16 +0000
Date: Tue, 30 Apr 2024 11:20:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Eric Biggers <ebiggers@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [ebiggers:wip-verity] [crypto]  daf2d68fba:
 UBSAN:shift-out-of-bounds_in_include/linux/log2.h
Message-ID: <202404301102.dd98490d-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d71cdc7-06ce-46c1-3089-08dc68c4748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ToZcG/EzspEzwMZMa8ZTZTc5cZ+kcGICcrli/uubWK0jXjMoHxUj3sYTNGvx?=
 =?us-ascii?Q?UJUnK2UrW49ScWeLxrBUUeLGL1Rld6a3oiCe+3MDmY9RB5EgKS6nS4c+lV/+?=
 =?us-ascii?Q?/+Afjm+ogChSo5Otli3v+KAUTRsWfEAu5D3UdWRMum5axbZV3n4w7r+JHSmD?=
 =?us-ascii?Q?uh43T88cUJTSAxHrS8oS4e/Dy0JLBRb/LQCbipRWIUfygIysnrCq2YRZHyRz?=
 =?us-ascii?Q?zVs42+ha/BTn/p2rx+k8HeH6szI2NnWbn6fzT1zISrWf3bI6lrKdC2Z5HfJb?=
 =?us-ascii?Q?ZJ9cDfExhF8kRLm936uHEy+t9ho4c+g56qGAD1WN+i0go3Z6kPr+etVY6nNv?=
 =?us-ascii?Q?DNAvI3PYMFdulJMr4UTa4O+gpeqV4twBJOxH3J+jfe15cLL020LvBgz3mfRi?=
 =?us-ascii?Q?QlNxuyVqtHrhUTceZHKJjXYijh+11qMCch/zdlG9te18IIQr89DCN3SnPVGO?=
 =?us-ascii?Q?G0NDeya4HoMoiDXTWMPAkZCTJvx817lO1PENppaVCkpqN7+NpRmbTcU6oBBA?=
 =?us-ascii?Q?yaIk5Qw0VXnm4KtIl0DppjSqLJ4QGiDWk6ZqVmGfTNyv2h8YlwFEdl2HMEIe?=
 =?us-ascii?Q?go81eL3Nr4m32O6rZWJKzmBWB6mX3lfO+lDUcVqjIV0VgGkA/cvvI7ahMj05?=
 =?us-ascii?Q?iDAHjklH+71M8ZmnlUb2W01qBV73Mm9PcuHameI7WBMAiyXjfEgoDoBOTHkI?=
 =?us-ascii?Q?9nJIla4hyNj7GP0frdRhsm+g00a1VKb0OwWWapjqcsJh9nrizlnAtw3k4cEw?=
 =?us-ascii?Q?HmRIWrsv16fFwrZlRKrbbPHsxwjScJMzqdK4b94T+dh4yr/kplquf1IwxJVi?=
 =?us-ascii?Q?M9oV28a15AQIgmTPOnETZLLJL644TpJ1C1e4wBqBeym1nPJmP6iDk5Y9JA1n?=
 =?us-ascii?Q?3eZ0t5D6dWRtmwLeBFTV3rr2wVwCtERv8H2Jw5kMd37yF5kA5s/Zvd+6va6D?=
 =?us-ascii?Q?ZQsH6SjPukQDgXizMpsyu6pHy/mjxkEtGse9dplPYU8LQodWIUrVHMP4nVzu?=
 =?us-ascii?Q?pYYR9eIudU9lpKy57drPkKSdvwh+RIpOUhSM2bjHpRzAryvz7Bnf+BJyR7+q?=
 =?us-ascii?Q?sq68+UiBG0RHj/3J1hwG8BO+hrPndMoTtdbbn+17NyF9qKhHSvaoEfEkzRfS?=
 =?us-ascii?Q?h/cJBvnj4W4rpWR7bo121yy/3ZERj5Tced5Y+kkEa7VqhybMkdoBQr3C3UPf?=
 =?us-ascii?Q?za53nupUuLq6BjriYEMDz11XZ/fANYrL4w3iQoanTtsIydYVxzF5/Urg3Qc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k4YWrUYYEKc5Baou34R8F6ObgzSI45of31Biu+U9F2UoavxZJcL85ViPoHxV?=
 =?us-ascii?Q?5yMYuBP2TeEc6q3TdSxHoPS4YG8LXl0IPKwW2XbPoHq5AzvS1knAlW4vYVuj?=
 =?us-ascii?Q?WLyuLSZqXIhdYuIl5lGRgKZUQ/AuqrEq3vw3PVPYQEWoobJtEkZeP8zwM+z3?=
 =?us-ascii?Q?FXHsPzaITxKB6HCivuJqGmPLmj2U1KKMMZmQenCNfFCoB8urgaGd3apZSbOd?=
 =?us-ascii?Q?mPhGhSE1kADwZUdCYYPWvdJeNKZazuts7mt7xMVjdoRHm3uAL42izPIlJ0SP?=
 =?us-ascii?Q?iHKXpboza0Mc74y7EtiHaAirHN/THBukTYgIaiTpWOnMrrK1xY/Iwde1PmuV?=
 =?us-ascii?Q?tUvYI1C9RHODpQ8+emQLUowLVnI6zIVIPA729nenJs5/vl9qT5KixAGsT1mY?=
 =?us-ascii?Q?meF0f1uncb1llAJoTbQkx8l51FSzRnqCiP+1Mv8tgtuO1AfshZWm5Bd4i0KQ?=
 =?us-ascii?Q?216IQ55NFYwIEuj8MqLBNXJpYHzq3TfRtmwOvorUsYjxuWmh5NbXGvwnPEWV?=
 =?us-ascii?Q?uQYAQ2Z6KEj/5ntEBJZU5uDsX5oyvwN8Lxz549ltEaGvsFb5yZfeAZL2z8Dl?=
 =?us-ascii?Q?1OPO/G0k58Ed2wlIclruYBcHYaunK0nMdfy2QajIhpoZFj+e/JsQuGWMX9af?=
 =?us-ascii?Q?Vx+Exq+Z3NAIorpx1XpwtP7E8w4mJh6WWZmq83fTZOZZVctJPKTrXNVuolBD?=
 =?us-ascii?Q?xqlgokkl+fMevC8pDMFh+AlCXBoFDHpXJrJBPkdnnARHjZLgFufXahbjZO9c?=
 =?us-ascii?Q?K497lcg4ln9zK6bc9zCcc77p6vl4rk2xa4YY23PFZA3XW+b+zbOUk32OPNRi?=
 =?us-ascii?Q?aQ3uxdprWimi0HAcolpM9ebHMDki/pitam69Xo+YwPOeLZX0J3SwRHkhIHd4?=
 =?us-ascii?Q?U0fI9qMv1jyoVOGAe2UVjxB6n/tyJTQ7wX5EVM0jL6ld/uPKGKZIS4hZ+WIY?=
 =?us-ascii?Q?CVw5y7hN8V/egVg7yg18V63MIEckq116+nN264GAVcApgCT7j/ZzYCgkKmbI?=
 =?us-ascii?Q?ii830++K2e1Cxvtk9n18ua3smJ/9ctdK+epzFossQBBgxq27MR0IZ3Xmyi33?=
 =?us-ascii?Q?sMLmKP+WbaSI+sSOIwapFs00oUXOfb/gRNcbbJHaNGoM2mA4QBHtVXefsrs0?=
 =?us-ascii?Q?4jk7d3SRYlAAXuGHngGtG/dYURfQ3YlvZLRTL1/H8DBZ+/oYe8GxIFag21Zj?=
 =?us-ascii?Q?cMFVSjiOZznxE9pF3sW7dK/obL5UIJhyUclYYCHN5p6eUKG24l3iXcnzbewU?=
 =?us-ascii?Q?wZdfG79FsmTCOf8nx0I/SNFUPvIa2ub3rEdbTi/87KlwEqtjeXgvyjdqvBKT?=
 =?us-ascii?Q?SJPV29T1HLKXHzj+tnSJbwIECZKxnpHQi5E5JX3xe/G+0J/cSL36MqLV5w01?=
 =?us-ascii?Q?uVDPcLDTbrcPNEy6xe0e82vjAka+8MI7sT/FN9YrtprYtBYCzdkyolz2NTMV?=
 =?us-ascii?Q?2YObOpUo2NslwBwgrFSIvyn6Jl5h6SdA+PIprMxSOT9F2tskhk0lVm6gZ1AI?=
 =?us-ascii?Q?UGXZUTsagFNAi0o3E87Cs1vzJHBKmK0/4aqNgv5Dbaj6GtmQnLC3m8cjynfL?=
 =?us-ascii?Q?beFzyMDzFt3srZjfw4alqNUXVZlesQv1wNLz15DTY7UCceYn2M2eyuOpB6hS?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d71cdc7-06ce-46c1-3089-08dc68c4748e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 03:20:16.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZpf9C2g2rVgjUhRvhOPGVHD7o72WovLjSWxQ0GKnz2o52v0A4wZ+icNP4/wUGz22+18taqjrlY/M/vS2zT3bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_include/linux/log2.h" on:

commit: daf2d68fba06b13c4eb6c0b07a31da46f988ba9f ("crypto: testmgr - generate power-of-2 lengths more often")
https://git.kernel.org/cgit/linux/kernel/git/ebiggers/linux.git wip-verity

in testcase: boot

compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 9fc50fd0c4 | daf2d68fba |
+---------------------------------------------------+------------+------------+
| UBSAN:shift-out-of-bounds_in_include/linux/log2.h | 0          | 12         |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404301102.dd98490d-oliver.sang@intel.com


[   65.669549][ T2612] ------------[ cut here ]------------
[   65.670771][ T2612] UBSAN: shift-out-of-bounds in include/linux/log2.h:67:13
[   65.672859][ T2612] shift exponent 4294967295 is too large for 64-bit type 'long unsigned int'
[   65.674762][ T2612] CPU: 1 PID: 2612 Comm: cryptomgr_test Tainted: G        W          6.9.0-rc4-00002-gdaf2d68fba06 #1
[   65.675758][ T2612] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   65.675758][ T2612] Call Trace:
[   65.675758][ T2612]  <TASK>
[ 65.675758][ T2612] dump_stack_lvl (lib/dump_stack.c:117) 
[ 65.675758][ T2612] __ubsan_handle_shift_out_of_bounds (lib/ubsan.c:218 lib/ubsan.c:454) 
[ 65.675758][ T2612] generate_random_length.cold (include/linux/log2.h:67 (discriminator 1) crypto/testmgr.c:918 (discriminator 1)) 
[ 65.675758][ T2612] test_hash_vs_generic_impl (crypto/testmgr.c:1704 crypto/testmgr.c:1834) 
[ 65.675758][ T2612] ? __pfx_test_hash_vs_generic_impl (crypto/testmgr.c:1743) 
[ 65.675758][ T2612] ? __kmalloc (include/linux/kasan.h:211 mm/slub.c:3966 mm/slub.c:3979) 
[ 65.675758][ T2612] ? __pfx___might_resched (kernel/sched/core.c:10152) 
[ 65.675758][ T2612] __alg_test_hash (crypto/testmgr.c:1978) 
[ 65.675758][ T2612] alg_test_hash (crypto/testmgr.c:2026) 
[ 65.675758][ T2612] ? finish_task_switch+0x155/0x750 
[ 65.675758][ T2612] alg_test (crypto/testmgr.c:5874) 
[ 65.675758][ T2612] ? __pfx_alg_test (crypto/testmgr.c:5827) 
[ 65.675758][ T2612] ? __pfx___schedule (kernel/sched/core.c:6617) 
[ 65.675758][ T2612] ? try_to_wake_up (include/linux/sched.h:2116 (discriminator 2) kernel/sched/core.c:4382 (discriminator 2)) 
[ 65.675758][ T2612] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:115 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:111 (discriminator 4) kernel/locking/spinlock.c:162 (discriminator 4)) 
[ 65.675758][ T2612] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
[ 65.675758][ T2612] ? set_cpus_allowed_ptr (kernel/sched/core.c:3222) 
[ 65.675758][ T2612] ? __pfx_set_cpus_allowed_ptr (kernel/sched/core.c:3222) 
[ 65.675758][ T2612] ? __pfx_cryptomgr_test (crypto/algboss.c:175) 
[ 65.675758][ T2612] cryptomgr_test (crypto/algboss.c:182) 
[ 65.675758][ T2612] kthread (kernel/kthread.c:388) 
[ 65.675758][ T2612] ? __pfx_kthread (kernel/kthread.c:341) 
[ 65.675758][ T2612] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 65.675758][ T2612] ? __pfx_kthread (kernel/kthread.c:341) 
[ 65.675758][ T2612] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   65.675758][ T2612]  </TASK>
[   65.711422][ T2612] ---[ end trace ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240430/202404301102.dd98490d-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

