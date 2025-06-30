Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A328B7D0
	for <oe-lkp@lists.linux.dev>; Mon, 30 Jun 2025 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290778; cv=fail; b=FFWPmWlufv6aBHvM0BkxcNp8es4eBCCP5aMRkaxfNdz+42skFVg+yWORv3VsSNZQCp+ZjD7xlhmvSBQauFxwPN8fwygaQxgo9GEyKboqa4VFZImDvJyzK723SWqZMFfAVqApQ4nJ7eKEJHN7KGGcfxhhV/B/hOHGwWhyVZsqIcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290778; c=relaxed/simple;
	bh=Nzk9K6hbZlzVNjjNs/1aWvjm8aBha3135le9nVhmTRs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Pq32pqydR8sOHDF3eyYul70aYjsJnI/78LZtsmO49NKuP2e5+7NdYQ89iJ/0NpUj5UfVZC44SnEvMoTOZvI+TuxBeiOK0VF0T72FO37TMzzL0Qo9Fy7sZSdCY4cmnOx9gD6/Oq90uoHkT43ooJnpTIdbnzLWUCFlr+CV64ZCqB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqN/Td5L; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqN/Td5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751290776; x=1782826776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nzk9K6hbZlzVNjjNs/1aWvjm8aBha3135le9nVhmTRs=;
  b=hqN/Td5L3ehUJI21GXntEQoPe3BNsKqw9fo3TYlHlGaqT8bdPlIkMDrT
   jjMGe1UWqzNXFayDLsTQOrxoLZEECLgOMOgwdhBQwTX9M3EMOWMBRABz1
   KcqFYj8NiaNo4n9KxraP7IR6LJqqlzlx6hhiX8Tx6xvjhCMESmwN+ReF0
   E46IVWpCkZ/ifbbARrHuxCLZR/4l95V3mg6+h1z3H8D294e/ZrQa4YLRO
   0HTnQhgBn3u9iSqOSTCksG6a14dlXvKKKQs+hFln+2KsBIEGMq+3g8mkR
   aqSJNdFbuW6B0qv3tOWJVSedP2ZYD2DP/n8yw4///CqX0Sj1EbjdSpMr2
   w==;
X-CSE-ConnectionGUID: PW+cZ7M6Smup+zjNAEQXkQ==
X-CSE-MsgGUID: +wan6G2RQ665VLF4bMe0pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52745834"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52745834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:39:33 -0700
X-CSE-ConnectionGUID: Cs4zf9i4QweUhjGgUGBybg==
X-CSE-MsgGUID: wsFaTrreSpG4Rp3t6XzgbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="158006453"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:39:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:39:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 06:39:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQRZo8NJygfH83h0dtfju5Jmf+fTHuIpcnRznNUjoCuwttvWLsz/4rhLYNb/kxgNBD/glb/Shg7Kr2YVWhqzmB/yKubu+5dbR/2v8JwVVC9mLekuWdbB7tcBeUplXdkJfetHc4TCIomcn11f4RR6ihvQssD+VJXE21/z9QnhzijBso/FhjONapgpv1avBLp+ScO3FQd5I2cHZR+l7g8FV0JGD08UPc8BAmFZ2ybywW/BElICqc0IQGhpi9xyRxA4Ot3XrQcd8dWMRAu8+grftTJzOURVU3BD4jPpBuiqosDRMapRmTbdYc/TQfbbz9rJ1Yhk6PG9n59J6Taj/B7EvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA+h3w1Q2JUIV0a2Fafgf0h0T1j2jxsNQLRs6XoOe1U=;
 b=N9+tzMMm6HcvzgQXCRkvbADKZwE+crim7VRSVotyqSbDsgXUv49oHG03LsG64v3xn+3uvf+G36VHKR3DCz2YLDAXBp4EDfEJ2dZS0a9ZrinreM1jFw6RvFD6+S53txhMJyiMzbQPWSsH4FG3S1FfDbQDqRZtD3yoP5W0Vx6raUnrmduX/lcWEZOkc1Zggzn4FRDzp9NVG19RdEnQ2wg/k9ErfWpawNMtA06Sc3Uea5apHpckwWKR9AkzLgPyBl69SgzEAPCwE/1gUHQOjrGORx8YZCtja3KMqikbNPmbNcB9zGmqRfHxps9WUCUcN/RQdS31u057Pu29tKfSLUCwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPF814058951.namprd11.prod.outlook.com (2603:10b6:f:fc02::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 30 Jun
 2025 13:39:29 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 13:39:29 +0000
Date: Mon, 30 Jun 2025 21:39:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:smp4] [smp]  83790f0851:
 Oops:general_protection_fault,maybe_for_address#:#[##]SMP_PTI
Message-ID: <202506301054.b89ea5bb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPF814058951:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1a091d-2c26-4149-4a48-08ddb7db8967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jmkPetyrcaINuJjCwUOWNzeMwmX2uDK1qwIx8ppMMXm+1aqVgyQ+TLBmby4M?=
 =?us-ascii?Q?9rpWyPuYfWzqe304OafxMsP4fnwnzVapdtpNaX2VRjMff/vtN0xWRZ65Sg7m?=
 =?us-ascii?Q?Tn3iSWLLm/jrMr+mczkgnBPtz9OjyLfMvUjX2Mx7rSTtJ0TpgAs9MWr1KUqt?=
 =?us-ascii?Q?Ou8+b8bc5xOptRKGd1uSMPD1kaRFrkRUY8sAU82u7mPvtyTVsKGzuAZ20y5G?=
 =?us-ascii?Q?hB2DG7QzPcNgjB45OfhMbn+H3tzmIy70OYwg5B/cOMcphHbwH4m+XQf3a8Yd?=
 =?us-ascii?Q?7NPQ9xDmG+j7uXkFPakPZ2st/VdO9jmy7vJW+ATBQlnM/On4m9PYLZvyzf5Z?=
 =?us-ascii?Q?2ffaFWEPIdRmGkb8S2KYHsjYhZtwlJUT7nNMDnA4HjqdHjdXdhJ6rucwZSuj?=
 =?us-ascii?Q?Fv3CXuPjnfnabhsvudA6uKBH53EJtzOtEYOOiEY4FOJaD83CB8izlIF2Ply7?=
 =?us-ascii?Q?vLuGrrFlV+BOkyKV4s26BJ/YUtywcugBNNVK1LAw73fsGsjawHN3pxWbXfU+?=
 =?us-ascii?Q?3UzhZAsb+oBHjO+MhXSBB5EvWfBJE5JiF8okQbXyldB5EI2P4Asq/dNjOVP5?=
 =?us-ascii?Q?DoJjzf2qwQEZBCU1v1lQcgESpwSJJ/SfV5g7+gdnxE/CxylIsfbZGLUyYm+k?=
 =?us-ascii?Q?zj9/FWh90zAUuQbIC46ZZSAccW8EsfmrpmbWFB4Ywdc+WIo8itmhPskeJSJk?=
 =?us-ascii?Q?SAIXjZLXlIyTP9pZO9LxZvTYpoYbebc5memjoB1Wo4kiutlKyEp8LyJEF4zh?=
 =?us-ascii?Q?u3jn45OIbuS0OJ/UJmatJjzUYR+5KwWvbynqJt4RY2Adr8iWsreTsvne+zyh?=
 =?us-ascii?Q?Hiuf3J1IdE+rzt7LnueKzNnS6N3I61aB0HC5gKMLxIrxn4C7d4VaUjTsMa0r?=
 =?us-ascii?Q?2vfBcPV2R7oYLn45EYsw87lxxRXFW/SRgoG+O8uK+v67hK2N7KdxGSOAaZPb?=
 =?us-ascii?Q?GVmvkMTISD69AWhSGqEXUmVfo5VgIUbYO4uz0UZrRyLZoHL4a6ygYTlpSQ93?=
 =?us-ascii?Q?B/O/0PwSJTRadcHjirOd1QMRp7gDsAevXtyecnY1Pid5MqmFLDco2tdgpMka?=
 =?us-ascii?Q?P4CXOprz8kOBYmAQBKhkAU32HVAnZpfRZGmOcxGT3g1k7rU/RWKInhCydBt5?=
 =?us-ascii?Q?V2Fp6HXl8YgHxkXkKu7R/xEvWDgOrC6XvFzAKXVfVYO8+YDSjLZ04Y9llc3s?=
 =?us-ascii?Q?JB2ehgMqlrHshutmmJZVHzDCJC4hWT9qhFoZASGQlVpGkAdHQWrJBmUd0BQq?=
 =?us-ascii?Q?gH5NV2LfhhWMksDMk5SacfYJnvWd3mnynCM8UIKcOof+UwutHMDJ5KvwUboy?=
 =?us-ascii?Q?13H1dykFihEADYPGLcsX6PiPOwixAT3cc+IrZaYvFXMagGm68KdYacJ5WYIu?=
 =?us-ascii?Q?NECJrJNpV7spULtCSoFHVqc4UqsQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgEQW2JnIIuGtrU24fW4RD+07CXmUZ6eAtEKvuqDvjOyTYqrPuC/abfJ6buB?=
 =?us-ascii?Q?oa/tQ9U6MffLlNaJx7zcFxyDziRazlzjrDFDeE0EXJf0MtyyQPAa2uYm5Q9h?=
 =?us-ascii?Q?TvQnn8Al09oyp+bZqg8ODENSkHAX2/ccu7oeX5xjjRT078hXXkE7nuzXF0yZ?=
 =?us-ascii?Q?8sKpCjTnQpfFRykjBA26jX4e7+s20ytZuoNnEZ1+RGLFbY0rUZPZdr08ZI+V?=
 =?us-ascii?Q?0s/kQnIU0WDr2JMnMyvEQwI64gVMymA0jjk3KxEDCoNq+wv1vd62XZIe3yPD?=
 =?us-ascii?Q?k24I4ZaTt8ulty9ltGhRLAW7sfJdPbGN+AQ/V5r76rNZi9NS6hWNGoVhR1CN?=
 =?us-ascii?Q?r6WjNb6t9T+mMCGN7vEJvTWYuYyyms03Aamyv0LeME0uVj45dkgQLuW+veyX?=
 =?us-ascii?Q?l8XBsPHLghIjE7PVx4s78LDxtKBK/AETHsd462LiGcI8HIKWbu/1U5qHML2L?=
 =?us-ascii?Q?7Q8s/IlHltW1KaQBaRjm2KoEDr85iDQ5TJkEy3skCVoAhXuA5EFmFtpdpnlD?=
 =?us-ascii?Q?NIkd6xyGcg8ukqO0UbG3h9yPCyOu8TVxY+Haxqw98tOYdcEcsnulU3m61TCz?=
 =?us-ascii?Q?u8hqcNTDHdkQoRG6PMlAvxDVdMyanEJanI+VAV5Rt9CNbu7fx1w9o9tZ+Y0+?=
 =?us-ascii?Q?IqthpaXRfqJlb3lDTgL78p8bDd+u9hbhP3gIdnSZOpPesAsSFEx/MH5Vn3+f?=
 =?us-ascii?Q?naW0rW0qylI/MFsOZ1okJcyyMV3LgwAW6tXd3GFZFIl54hrkuhY+IAy6bl7F?=
 =?us-ascii?Q?rEdv+8sTy6I886xT/5zqGvcWyJop2tEUSSoR28f0urKrBweZge4BicNB8Y/9?=
 =?us-ascii?Q?G04i2QGPmy3PKtl+3eVcoMMEeTH9hV9qy1ds/bxDGUp12yqxPxQXZRH3DYD8?=
 =?us-ascii?Q?gmQJQ4YFgLSoWTQokpIEQ0Ea6Ta5vnyTLGA1Dq7zPi1BGgkoStEbKKmgaTNT?=
 =?us-ascii?Q?DoGLb0RhiaD2JpbC64VTsbu2zENLww+7nUS/ES/5zQzPwZzaFPVVpj8vS9hW?=
 =?us-ascii?Q?tUAUZ6uwgHCviiU7oGeqE0zG97sLSW/e+PQharRykYbLRyfqR3iC2XTP/YcP?=
 =?us-ascii?Q?6Cksn10LYOh6rGyUYT7XPVb6iqd3G0AOVepbk68Bi/4WSuUCRf9B/TKpSYNr?=
 =?us-ascii?Q?a7i6ZakvM+s+XhyKnkk94sr1zI3VWIgLGOl9jageMd+7eTqALSS+DUBup64Q?=
 =?us-ascii?Q?qtD3eIi2GgpA+ngKaKlhVipjc+OHanRBlXzdv/1SSZE2upTEmQ3ZajmkJ/Va?=
 =?us-ascii?Q?DfhdHfezrp2o1HTqEpe98c2o4IRbzdCseLqnFfJEPmY5/qeGL7d5Hfa+IgPX?=
 =?us-ascii?Q?ToRx9j1qxL2JtreBg47qy29rwSolQVOlZUGhyqqeqz8MWvT1h/1QynodYmwO?=
 =?us-ascii?Q?PtCujiR0253gvad9s7f+juwPNLL+SHKlVnXgoQ2m2kn/jFQH8QzgLM0oHFbM?=
 =?us-ascii?Q?nkUdUjsBHGu/FVS8AZShd6tSBvxFez6ggu3Sw/AcU/BvGlGvWbOXnen88edY?=
 =?us-ascii?Q?RTrKe3wPlwMXQJXLQzWJ5ymshsziSa5T+yroVk7ods+u2VtGpzyvdzJo+r7y?=
 =?us-ascii?Q?2kMGzfDDqZQ7puXuHNEtwxrzOcBPHUo0C3/DnF6oqy1jevvVQXzjX6TKLAnY?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1a091d-2c26-4149-4a48-08ddb7db8967
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:39:29.0553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33vgvdjv8ywdkLQi1bCAVn/jRWGNJoyzOK6W2pW+QckiZs6hckWn2FgJ58w4B4i+SpNjXXo5ReuAsaLZ1+PNZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF814058951
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,maybe_for_address#:#[##]SMP_PTI" on:

commit: 83790f0851d200de2219cfed4b19fa7c2a8d62c0 ("smp: Don't wait until remote work done if not needed in smp_call_function_many_cond()")
https://github.com/norov/linux smp4

in testcase: will-it-scale
version: will-it-scale-x86_64-75f66e4-1_20241103
with following parameters:

	nr_task: 100%
	mode: thread
	test: tlb_flush3
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 104 threads 2 sockets (Skylake) with 192G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506301054.b89ea5bb-lkp@intel.com


[   40.288049][ T1345]
[   40.297880][ T3517] Scheduler tracepoints stat_sleep, stat_iowait, stat_blocked and stat_runtime require the kernel parameter schedstats=enable or kernel.sched_schedstats=1
[   40.789648][    C1] Scheduler tracepoints stat_sleep, stat_iowait, stat_blocked and stat_runtime require the kernel parameter schedstats=enable or kernel.sched_schedstats=1
[   42.734725][ T1345] LKP: stdout: 1300: Kernel tests: Boot OK!
[   42.734733][ T1345]
[   43.885512][   C78] Oops: general protection fault, maybe for address 0xffffc9000daa8f40: 0000 [#1] SMP PTI
[   43.895761][   C78] CPU: 78 UID: 0 PID: 4129 Comm: tlb_flush3_thre Tainted: G S                  6.16.0-rc2-00285-g83790f0851d2 #1 VOLUNTARY
[   43.909277][   C78] Tainted: [S]=CPU_OUT_OF_SPEC
[   43.914263][   C78] Hardware name: Intel Corporation S2600BT/S2600BT, BIOS SE5C620.86B.1D.01.0147.121320181755 12/13/2018
[ 43.925590][ C78] RIP: 0010:native_flush_tlb_one_user (kbuild/src/consumer/arch/x86/include/asm/invpcid.h:16 kbuild/src/consumer/arch/x86/include/asm/invpcid.h:29 kbuild/src/consumer/arch/x86/mm/tlb.c:1623) 
[ 43.932049][ C78] Code: 48 8b 0d 9d d8 12 02 f7 c2 00 00 02 00 74 36 48 0f ba e1 2a 73 2f 83 c0 01 48 89 7c 24 08 80 cc 08 0f b7 c0 48 89 04 24 31 c0 <66> 0f 38 82 04 24 48 8b 44 24 18 65 48 2b 05 7f d0 b9 02 75 1e c9
All code
========
   0:	48 8b 0d 9d d8 12 02 	mov    0x212d89d(%rip),%rcx        # 0x212d8a4
   7:	f7 c2 00 00 02 00    	test   $0x20000,%edx
   d:	74 36                	je     0x45
   f:	48 0f ba e1 2a       	bt     $0x2a,%rcx
  14:	73 2f                	jae    0x45
  16:	83 c0 01             	add    $0x1,%eax
  19:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  1e:	80 cc 08             	or     $0x8,%ah
  21:	0f b7 c0             	movzwl %ax,%eax
  24:	48 89 04 24          	mov    %rax,(%rsp)
  28:	31 c0                	xor    %eax,%eax
  2a:*	66 0f 38 82 04 24    	invpcid (%rsp),%rax		<-- trapping instruction
  30:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  35:	65 48 2b 05 7f d0 b9 	sub    %gs:0x2b9d07f(%rip),%rax        # 0x2b9d0bc
  3c:	02 
  3d:	75 1e                	jne    0x5d
  3f:	c9                   	leave

Code starting with the faulting instruction
===========================================
   0:	66 0f 38 82 04 24    	invpcid (%rsp),%rax
   6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   b:	65 48 2b 05 7f d0 b9 	sub    %gs:0x2b9d07f(%rip),%rax        # 0x2b9d092
  12:	02 
  13:	75 1e                	jne    0x33
  15:	c9                   	leave
[   43.952240][   C78] RSP: 0018:ffffc9000daa8f40 EFLAGS: 00010046
[   43.958539][   C78] RAX: 0000000000000000 RBX: ffff8897e0e703c0 RCX: d39ffffb0002000f
[   43.966742][   C78] RDX: 00000000007726f0 RSI: 00007ffcebd0f000 RDI: 0000800000000000
[   43.974943][   C78] RBP: ffffc9000daa8f68 R08: 0000000000000002 R09: 0000000000000000
[   43.983138][   C78] R10: 0000000000000000 R11: ffffc9000daa8ff8 R12: 000000000000004e
[   43.991331][   C78] R13: 0000800000000000 R14: 00000000003017cf R15: 0000000000000068
[   43.999525][   C78] FS:  00007ffe977fe6c0(0000) GS:ffff88b019250000(0000) knlGS:0000000000000000
[   44.008671][   C78] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.015466][   C78] CR2: 00007ffd53e4d000 CR3: 0000000226b24005 CR4: 00000000007726f0
[   44.023649][   C78] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   44.031823][   C78] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   44.039983][   C78] PKRU: 55555554
[   44.043721][   C78] Call Trace:
[   44.047187][   C78]  <IRQ>
[ 44.050212][ C78] ? clockevents_program_event (kbuild/src/consumer/kernel/time/clockevents.c:334) 
[ 44.056108][ C78] flush_tlb_func (kbuild/src/consumer/arch/x86/include/asm/paravirt.h:85 kbuild/src/consumer/arch/x86/mm/tlb.c:1630 kbuild/src/consumer/arch/x86/mm/tlb.c:1251) 
[ 44.060961][ C78] ? __pfx_flush_tlb_func (kbuild/src/consumer/arch/x86/mm/tlb.c:1104) 
[ 44.066331][ C78] __flush_smp_call_function_queue (kbuild/src/consumer/kernel/smp.c:134 kbuild/src/consumer/kernel/smp.c:540) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250630/202506301054.b89ea5bb-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

