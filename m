Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B071AD41F
	for <oe-lkp@lists.linux.dev>; Tue,  3 Dec 2024 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212789; cv=fail; b=VCOe4ZZ65rBv0aZTW8qFm75LvjDKqgHRanykRFVZHwCTZgszhBcLgy9T/gBY8rPfpxwvuDTYU2X79uIP8xSkupH7kgl2mYxGzhlnFMwwbLo3NW0vmrIJWFBiuSQyO6vt1dNBQpBVjIMBWJkTgnlw+EalVM68601ZvovBSEbIMR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212789; c=relaxed/simple;
	bh=iSSPsXcDmQaEVZ9Fdole14xew/r819QDWynLKKRr5as=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=X+yBlhi/DCSLWDVAyGVkWmlYPxS5BfsecGucYdn0TcyleU9lCQPssECEEKhhWGlJdIk9B9ifokzM3pGj0JAOEPnoqxNqM3VSWk2tGaCCqdT+UjJbhfLR/qQakW9G54AGjLfKkimG6CxJAmdlHYWdzKmB90VA2wlxr5HokdqWuYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS5vHSZk; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS5vHSZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733212787; x=1764748787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSSPsXcDmQaEVZ9Fdole14xew/r819QDWynLKKRr5as=;
  b=OS5vHSZkIlm3LzguxsMYKPzTN0/8diO7OsQ8h39/s2ZQ5zBYB7hBizIz
   NU2q7krW3lDuXGAWKCLLfWhIgUTpJq5CUtS7HiYvpQz2EKaxS6AkDVFbm
   +VrfGSWBRoLjrLSJ98+aQ4sN/u+IKf1/fNMV2+d84e6awTrJVJoNEPvMF
   mzaDIAK1vKWcqai9nHqPi+dHjCM3I3ZJwEgaWOFjWFJd5Rzq2O+xwu+S+
   krP80DXwX/YJpIoyeVV4+SvuEmDbqGQ+fBAmgIXRMAG/oWR3YE6kM9Sb/
   48cYZKPAhRjBLPypt9ma0lDdDNn0j2BNzwDA/FYkoMJRY1eVlH9zqjgXQ
   Q==;
X-CSE-ConnectionGUID: 6g14L5vzQIyUhj9CeP+Eqw==
X-CSE-MsgGUID: eVF5FraoSX2nvudxNHtUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44799513"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44799513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:59:42 -0800
X-CSE-ConnectionGUID: nQIOT5sHRGOum7gnxEvqJg==
X-CSE-MsgGUID: ENVu/bLUQiGy1cx7vN6nwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93178003"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Dec 2024 23:59:36 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 23:59:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 23:59:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 23:59:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVyZxi43lkcuMvVW/1kzJxPU0FrBzb+02LoiTxk1l8yNyC2D2WDMsZinyzTFxUAXCxcaJmtqzTnwQdi0fYhirmvjRHqiUGkTDJ8qFhoa2xZqmLxt2sX4rIqvwtb1IN4Gya1sE+glNI0iyu07ZuQgnCHq8KIOQNNOIgnn60zUvPkY7SgC5Upg6l4GlYJKhhA0eg4Uit5alO4XDyoCruVMz16smovx8uH/1pqHH/9u4hCfXwDG/7tZnHX/tmfroHP0VLKcyysq1/eGUw6ERIeqHwZ22FDiBfPMzbmdUrSlhqJqSSXObzDE54OmAUWDBySB7JcCYUf7T+/lHK/6pKI55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcgAyJHU0wD2/XaQUI45feqyX5Wobixl+z+GM6ceBtA=;
 b=XzEuzrlZGOFMODYEnMI/msDn0tl6c6HOTgyUofSGlY3kvUPydntSUJ4yBOWrkT0cJOEeyoGApQllLMdKxuepPzXij9S6tmhjpGAdMUUcNf71fYwbBjlt9K5wUz9N/cAoJKze0ha1y+4KHI0Uh136HDRgzNxW7pLviEoLp5dm2oh1ZvH/1QrJSFWXxPsOuulnuHgQszmEzeZWhp3G2IJ9uby3mM2ESeI18IJXNjLra0CQ0kn/6DEkvqaV2DEo/y4nCNlW/KhV0ZEaUtrL8rI0Yt8z4XlfLiRK3bxCgBoeZMXxMnUFcjM3Tbv/H9fIqzPYFlLKGxGMe21TzwroTNasiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 07:59:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 07:59:23 +0000
Date: Tue, 3 Dec 2024 15:59:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jpoimboe:static-key-noinstr] [objtool]  51fd13276d:
 kernel_BUG_at_arch/x86/kernel/jump_label.c
Message-ID: <202412031508.3dffad46-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7012c4-90d0-4c6a-a937-08dd1370667b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XXngslatNIzQVuvBEEyvqfR2zpZ1lKjuL738fqLkngQTVnC7SCXmH+yV3IZo?=
 =?us-ascii?Q?je5/ke9dgscd2bggDD7e2QPH6YuG3OMR4z3LKuoBb9SkwEMqIvwolh/HlwI7?=
 =?us-ascii?Q?n3taSGkPkTpQxUTQ7UDM3ADf/Mb/YDfyeNR9WNbaMFReLLaNgPGrqHOXWKl6?=
 =?us-ascii?Q?cEr4NGmDF4WCxduaJYA1vAm5jMFuY2a0aPbkSbdLPR343XyB7R3mBqpdMvts?=
 =?us-ascii?Q?IMLqqId/MUpIL/xSX4T93ZtrKm7nqSE+9J91QgfmLHP3meBWn++mCyIJud0f?=
 =?us-ascii?Q?+XAb7rC8WlHIbXmEIbhaRWbwd3jqgdZ5fiZ1n0SJZyhTqNPH2UydBN+z23jz?=
 =?us-ascii?Q?uYa3bAFvv8feRMCcOsBEppRthnMCfEMg2U31Pja8RMKnysT8stdMPsXi++bj?=
 =?us-ascii?Q?X4OjwPpfl3n9skFEbMR3TU+bTYeAIlVIT5RlqLQJiwVx+KkT6DQOXdVnoOh3?=
 =?us-ascii?Q?bB23TALUDTCCeybXkl9OMQ1pV0CBwRCkCGmJCvAWfkEiZAgINAnp7o2cXDkg?=
 =?us-ascii?Q?J50kkVdb5E1kS4qQE8OEwY1cY99mETHgvdT3rdX4d/a6o2C7rYR0d9IbUlcG?=
 =?us-ascii?Q?cByGTlAwnEx/bU2dXUui8bjAByMUHOuVOhpUlj+Y7O+o9RScqT1bCPa5ZDyQ?=
 =?us-ascii?Q?tpBnwU7YjHF1aDhBLdQDzlc/vanWlng9I71H9f9tPZa56PxAHd5TFhJryNws?=
 =?us-ascii?Q?K8ioX7C/0JtmO+bsTxjU/l9L7Ign4FQ7Mx+uqrZ+jLRXQKslHblcIkSSa0nF?=
 =?us-ascii?Q?/gWZTUhrMPGQuO7qOVS6aGQb2NSu4nP3JeEMfdUhqQ16/T9ijCUNVN1Al2TS?=
 =?us-ascii?Q?iClE9W2WmXG7gwXAHx5mPQ9x48nc7uJdVfw70/z+4LjtQ5WDof++VN0LNWvr?=
 =?us-ascii?Q?PgKW97ujUdGDEmoOVYX98N8dup27YTDwEQa/Fhn4ktyvTzXC4cOBmkYrx8mL?=
 =?us-ascii?Q?rqrPJEP+ORVNe9l/PmJkoXbdKzN2MmbDnNtfnXN/kf0k9n1eSsEhc2CbXm5d?=
 =?us-ascii?Q?EYXObK8HStS1FRjsuNP4+KmoEzOTaTsO/I8rrQo15TCfH0OeDqJ0HgrkfDnU?=
 =?us-ascii?Q?v2iqufoSn7FtBYo5zWyeVq10UEqN9NymZMR83HP+cum6j1IxZtBeiDdMqVmb?=
 =?us-ascii?Q?C+7HFzpLtI2CHsNhQhMZcTe9Vjhiw91DuacyBdahi0R+5TMtiJAMpvjyCwyE?=
 =?us-ascii?Q?snISOhL1y5uMY1rhRVihvL+hwOhlBAt67X+QK0m7VKP8p0GphOztFhTTWI5v?=
 =?us-ascii?Q?3OChkm7W8vaIUlH1clUsSUaUDmb2Vg0t4AHexMY1F0LEivKHCE07Zmr42ZZt?=
 =?us-ascii?Q?orR3eG8fXg10BAgq+gobQr+F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GhWWa71RjqNI8lUXOBPi7S7hjvaOlkudeVscj0YWmhL6E0v98q7LZmpk6ikh?=
 =?us-ascii?Q?jEh76H4sCwW3fRYH/DvK3/acJ2QVmEuyd8lLtvLQ9mvq2INR3LpNHFLYABmL?=
 =?us-ascii?Q?JsUYpRtRkukJr8tIu/VN0KiySrZz4RZ03KTJSnXLcm1hPM+d/2+ajEr4U/hP?=
 =?us-ascii?Q?6u69FBSgvkypXxpdEdsTGNCMZ/GbbQLOorsaDttzkoa8WMcwzoPUKqJ3rno/?=
 =?us-ascii?Q?CbpwMU65YUBI9eA3dlLWiR9iU12TAZpzPpGxwhpBfZPMyFojZq6lVVa1MuSR?=
 =?us-ascii?Q?RyoJuOEk00bc08HGGf3RrXOXt24YIadtGNPSadhVGtokDUKpU3VU4Brb3X6L?=
 =?us-ascii?Q?r6EPf+q0FCHUTGifnE3E3N0BR2uHqpg94NAm0rfh0d7GGTexpM/yf2MnSZ1e?=
 =?us-ascii?Q?nDGeAqF7EDQ6ot3wOyVLfd4pbGZh54Vk/8YaIFYRqwgBvRvBsh/Nl6eX5/0T?=
 =?us-ascii?Q?wWo8m2DwUzR0sfYnSgkFZ8Awe/ktXvGHNkDv37dIyFQxXu5Mhs21ywejB932?=
 =?us-ascii?Q?BcrFlYvCFDdCoNczaqHGsFExVfvLAqwv6S0k60WsmfnDFB4fehXlmjBR96Kz?=
 =?us-ascii?Q?CuXIGU9YIowNToUACtJ8OpZrYwgY0p8PrA+NjuYmRxzodvi1HJQT0o3WnEJb?=
 =?us-ascii?Q?VLcMxRSUjuFMyXljIyCZTKBSI4FxqxToOODBxjr2KdPYXF7mteA15sXrsOOo?=
 =?us-ascii?Q?RHfcJN2XIppFsFxyBXVd/2O0Dy22SWelFRXGnoFZkKhxcED6/Tev4YaLI4s/?=
 =?us-ascii?Q?V08b7T5+04HicE7b94GzdxjkgsiJQ0DmFvNrrP5YPGiiVOnS1NohJyxxdQax?=
 =?us-ascii?Q?orIRIR137rPqKd1d+cIAGN5by5M9K5EtFwhxZZfEqs7Et+PAX/EEnMSQREeD?=
 =?us-ascii?Q?/WBgePFiniomN5yXQ/xeuRhu2mbVM7z50+/0coxaL/0SslLcr8TT2tUg3PRA?=
 =?us-ascii?Q?jp23LfRobbmGzS3bgh/JuWI0On/T8hNPfa2MxO6kLL0DUYm0xUbJMQU50Ihh?=
 =?us-ascii?Q?XuupvTrSwHKCMZC1NyECp0Pn8jcsoD8Yjsmmho+rBXeqgUh/FOBL4KQtgVTu?=
 =?us-ascii?Q?Xs8hcG6QMsWtan6Ax62QragN6+yiPjUinR04qv+vheX5/UHCOIQfvzrMO+Dp?=
 =?us-ascii?Q?r60ePcN7+h0VHKMJIzEoUNSrw6i2xkBn9GpCcgWDqBZjgQKg+AxEzuGv/P/l?=
 =?us-ascii?Q?YUhQDx0bv/m1bgDGmSi6dQ9oGO14cWSEBKpw7YbRWj4sup0Gv8rQQUQW00mb?=
 =?us-ascii?Q?mCQFbt32y6RQaQGR1QuYJzL6RxDr3kdEvke4ldhpV6NDjfxjWg3GV56hk6Xo?=
 =?us-ascii?Q?KIK9zAFlNMAF2rpW73BGjoVNKAS8OKq/MR++zPv2cFNLccqBZnDXCVZcns/y?=
 =?us-ascii?Q?do+iCOdeZ/kqQpvSHcNPuRe5wlJ57n/G2yDFpt9qwM2FZbxob9avEQ247ysY?=
 =?us-ascii?Q?72F17t0TAJsu682LwgX8M3jlD0/JNSLVqASv8eJiZ//onT5N3XDcXcQyfsBU?=
 =?us-ascii?Q?+3naDQjE5P7sYrooS44mRIp31hhb/kK0UWZwYi6mkPN/TqPiKQ7eaR1fubin?=
 =?us-ascii?Q?sw/ayRF4EXbeBYGIrK7uzfEqg+qQj0ZswXmagY2j2QgTiiZCWSmbPKQq4XRb?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7012c4-90d0-4c6a-a937-08dd1370667b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 07:59:23.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hg8eopl8UoRKMJJAfBKaAGOSMBvphzSC6jymrrBNv70b5AMtB8MGv48AtqolZtDLIi+2xVtvYWNdz9/mVX02w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/kernel/jump_label.c" on:

commit: 51fd13276df848dcb320bf7ff423f73364b06266 ("objtool: Add noinstr validation for static branches/calls")
https://git.kernel.org/cgit/linux/kernel/git/jpoimboe/linux.git static-key-noinstr

in testcase: hwsim
version: hwsim-x86_64-4ea2c336d-1_20241103
with following parameters:

	test: group-38



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790 v3 @ 3.60GHz (Haswell) with 6G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412031508.3dffad46-lkp@intel.com


[  405.239209][ T5455] ------------[ cut here ]------------
[  405.244523][ T5455] kernel BUG at arch/x86/kernel/jump_label.c:73!
[  405.250709][ T5455] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
[  405.257496][ T5455] CPU: 4 UID: 0 PID: 5455 Comm: modprobe Tainted: G S                 6.12.0-rc3-00007-g51fd13276df8 #1
[  405.268449][ T5455] Tainted: [S]=CPU_OUT_OF_SPEC
[  405.273060][ T5455] Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A11 04/01/2015
[ 405.280972][ T5455] RIP: 0010:__jump_label_patch (arch/x86/kernel/jump_label.c:73 (discriminator 1))
[ 405.286629][ T5455] Code: c8 e9 01 fe ff ff 48 c7 c3 00 da f1 86 41 56 45 89 f9 49 89 d8 4c 89 e9 4c 89 ea 4c 89 ee 48 c7 c7 80 72 02 84 e8 a2 b2 32 00 <0f> 0b 0f 0b 0f 0b 48 c7 c7 90 e0 02 84 e8 e0 cb a9 00 e9 6a ff ff
All code
========
   0:	c8 e9 01 fe          	enter  $0x1e9,$0xfe
   4:	ff                   	(bad)
   5:	ff 48 c7             	decl   -0x39(%rax)
   8:	c3                   	ret
   9:	00 da                	add    %bl,%dl
   b:	f1                   	int1
   c:	86 41 56             	xchg   %al,0x56(%rcx)
   f:	45 89 f9             	mov    %r15d,%r9d
  12:	49 89 d8             	mov    %rbx,%r8
  15:	4c 89 e9             	mov    %r13,%rcx
  18:	4c 89 ea             	mov    %r13,%rdx
  1b:	4c 89 ee             	mov    %r13,%rsi
  1e:	48 c7 c7 80 72 02 84 	mov    $0xffffffff84027280,%rdi
  25:	e8 a2 b2 32 00       	call   0x32b2cc
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	0f 0b                	ud2
  2e:	0f 0b                	ud2
  30:	48 c7 c7 90 e0 02 84 	mov    $0xffffffff8402e090,%rdi
  37:	e8 e0 cb a9 00       	call   0xa9cc1c
  3c:	e9                   	.byte 0xe9
  3d:	6a ff                	push   $0xffffffffffffffff
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	0f 0b                	ud2
   4:	0f 0b                	ud2
   6:	48 c7 c7 90 e0 02 84 	mov    $0xffffffff8402e090,%rdi
   d:	e8 e0 cb a9 00       	call   0xa9cbf2
  12:	e9                   	.byte 0xe9
  13:	6a ff                	push   $0xffffffffffffffff
  15:	ff                   	.byte 0xff
[  405.306084][ T5455] RSP: 0018:ffffc90008aff428 EFLAGS: 00010246
[  405.312002][ T5455] RAX: 00000000000000a1 RBX: ffffffff8402e101 RCX: ffffffff8234a00a
[  405.319828][ T5455] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff888135835800
[  405.327651][ T5455] RBP: ffffc90008aff468 R08: 0000000000000001 R09: fffff5200115fe3d
[  405.335474][ T5455] R10: ffffc90008aff1ef R11: 00000000000a2128 R12: ffffffff86f1da00
[  405.343298][ T5455] R13: ffffffffc1b89290 R14: 0000000000000001 R15: 0000000000000002
[  405.351122][ T5455] FS:  00007fd3fd158040(0000) GS:ffff888135800000(0000) knlGS:0000000000000000
[  405.359901][ T5455] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  405.366336][ T5455] CR2: 00005609d6a6c6f2 CR3: 000000018cc54003 CR4: 00000000001726f0
[  405.374160][ T5455] Call Trace:
[  405.377297][ T5455]  <TASK>
[ 405.380088][ T5455] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447)
[ 405.383660][ T5455] ? do_trap (arch/x86/kernel/traps.c:156 arch/x86/kernel/traps.c:197)
[ 405.387753][ T5455] ? __jump_label_patch (arch/x86/kernel/jump_label.c:73 (discriminator 1))
[ 405.392802][ T5455] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:218)
[ 405.397242][ T5455] ? __jump_label_patch (arch/x86/kernel/jump_label.c:73 (discriminator 1))
[ 405.402290][ T5455] ? handle_invalid_op (arch/x86/kernel/traps.c:256)
[ 405.407075][ T5455] ? __jump_label_patch (arch/x86/kernel/jump_label.c:73 (discriminator 1))
[ 405.412124][ T5455] ? exc_invalid_op (arch/x86/kernel/traps.c:316)
[ 405.416650][ T5455] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621)
[ 405.421527][ T5455] ? __pfx_exit_mac80211_hwsim (drivers/net/wireless/virtual/mac80211_hwsim.c:71) mac80211_hwsim
[ 405.428492][ T5455] ? llist_add_batch (lib/llist.c:33 (discriminator 14))
[ 405.433194][ T5455] ? __jump_label_patch (arch/x86/kernel/jump_label.c:73 (discriminator 1))
[ 405.438242][ T5455] ? __jump_label_patch (arch/x86/kernel/jump_label.c:73 (discriminator 1))
[ 405.443287][ T5455] ? __pfx_exit_mac80211_hwsim (drivers/net/wireless/virtual/mac80211_hwsim.c:71) mac80211_hwsim
[ 405.450251][ T5455] arch_jump_label_transform_queue (include/linux/jump_label.h:126 arch/x86/kernel/jump_label.c:138)
[ 405.456167][ T5455] ? kernel_text_address (kernel/extable.c:119 kernel/extable.c:94)
[ 405.461218][ T5455] __jump_label_update (kernel/jump_label.c:513)
[ 405.466092][ T5455] ? jump_label_update (kernel/jump_label.c:910)
[ 405.470967][ T5455] static_key_enable_cpuslocked (include/linux/instrumented.h:82 include/linux/atomic/atomic-instrumented.h:86 kernel/jump_label.c:214)
[ 405.476709][ T5455] static_key_enable (kernel/jump_label.c:225)
[ 405.481325][ T5455] ddebug_change (lib/dynamic_debug.c:257)
[ 405.485766][ T5455] ? vprintk_emit (kernel/printk/printk.c:748)
[ 405.490903][ T5455] ? __pfx_ddebug_change (lib/dynamic_debug.c:176)
[ 405.495864][ T5455] ? ddebug_parse_query (lib/dynamic_debug.c:480)
[ 405.500913][ T5455] ddebug_exec_query (lib/dynamic_debug.c:561)
[ 405.505702][ T5455] ? __pfx_ddebug_exec_query (lib/dynamic_debug.c:538)
[ 405.511010][ T5455] ? kstrtoll (lib/kstrtox.c:170)
[ 405.515105][ T5455] ddebug_exec_queries (lib/dynamic_debug.c:587 (discriminator 8))
[ 405.519982][ T5455] ddebug_dyndbg_module_param_cb (lib/dynamic_debug.c:1310)
[ 405.525638][ T5455] unknown_module_param_cb (kernel/module/main.c:2812)
[ 405.530773][ T5455] ? __pfx_unknown_module_param_cb (kernel/module/main.c:2800)
[ 405.536603][ T5455] parse_args (kernel/params.c:186)
[ 405.540784][ T5455] ? __pfx_unknown_module_param_cb (kernel/module/main.c:2800)
[ 405.546613][ T5455] ? __pfx_parse_args (kernel/params.c:168)
[ 405.551317][ T5455] ? klp_module_coming (kernel/livepatch/core.c:1292)
[ 405.556279][ T5455] ? load_module (kernel/module/main.c:2785 kernel/module/main.c:2972)
[ 405.560896][ T5455] load_module (kernel/module/main.c:2982)
[ 405.565334][ T5455] ? __pfx_unknown_module_param_cb (kernel/module/main.c:2800)
[ 405.571161][ T5455] ? ima_post_read_file (security/integrity/ima/ima_main.c:835 security/integrity/ima/ima_main.c:817)
[ 405.576210][ T5455] ? __pfx_load_module (kernel/module/main.c:2856)
[ 405.580997][ T5455] ? security_kernel_post_read_file (security/security.c:3356)
[ 405.586912][ T5455] ? kernel_read_file (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:992 include/linux/atomic/atomic-instrumented.h:436 include/linux/fs.h:3027 fs/kernel_read_file.c:122)
[ 405.591789][ T5455] ? __pfx_kernel_read_file (fs/kernel_read_file.c:38)
[ 405.597012][ T5455] ? init_module_from_file (kernel/module/main.c:3198)
[ 405.602234][ T5455] init_module_from_file (kernel/module/main.c:3198)
[ 405.607284][ T5455] ? __pfx_init_module_from_file (kernel/module/main.c:3174)
[ 405.612942][ T5455] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153)
[ 405.617993][ T5455] ? do_mmap (mm/mmap.c:496)
[ 405.622096][ T5455] idempotent_init_module (kernel/module/main.c:3210)
[ 405.627327][ T5455] ? __pfx_idempotent_init_module (kernel/module/main.c:3202)
[ 405.633068][ T5455] ? fdget (include/linux/atomic/atomic-arch-fallback.h:479 include/linux/atomic/atomic-instrumented.h:50 fs/file.c:1114 fs/file.c:1128)
[ 405.636910][ T5455] __x64_sys_finit_module (include/linux/file.h:68 kernel/module/main.c:3238 kernel/module/main.c:3220 kernel/module/main.c:3220)
[ 405.642045][ T5455] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
[ 405.646400][ T5455] ? fget (fs/file.c:1019)
[ 405.650234][ T5455] ? fput (arch/x86/include/asm/atomic64_64.h:61 include/linux/atomic/atomic-arch-fallback.h:4404 include/linux/atomic/atomic-long.h:1571 include/linux/atomic/atomic-instrumented.h:4540 fs/file_table.c:482)
[ 405.653982][ T5455] ? ksys_mmap_pgoff (mm/mmap.c:547)
[ 405.658772][ T5455] ? fdget_pos (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 fs/file.c:1150 fs/file.c:1158)
[ 405.663038][ T5455] ? syscall_exit_to_user_mode (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 include/linux/entry-common.h:231 kernel/entry/common.c:206 kernel/entry/common.c:218)
[ 405.668521][ T5455] ? do_syscall_64 (arch/x86/entry/common.c:102)
[ 405.673050][ T5455] ? ksys_lseek (fs/read_write.c:382 fs/read_write.c:395)
[ 405.677317][ T5455] ? syscall_exit_to_user_mode (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 include/linux/entry-common.h:231 kernel/entry/common.c:206 kernel/entry/common.c:218)
[ 405.682800][ T5455] ? do_syscall_64 (arch/x86/entry/common.c:102)
[ 405.687329][ T5455] ? syscall_exit_to_user_mode (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 include/linux/entry-common.h:231 kernel/entry/common.c:206 kernel/entry/common.c:218)
[ 405.692809][ T5455] ? syscall_exit_to_user_mode (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 include/linux/entry-common.h:231 kernel/entry/common.c:206 kernel/entry/common.c:218)
[ 405.698292][ T5455] ? do_syscall_64 (arch/x86/entry/common.c:102)
[ 405.702816][ T5455] ? do_syscall_64 (arch/x86/entry/common.c:102)
[ 405.707343][ T5455] ? exc_page_fault (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539)
[ 405.711871][ T5455] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  405.717616][ T5455] RIP: 0033:0x7fd3fd25a719
[ 405.721884][ T5455] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241203/202412031508.3dffad46-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

