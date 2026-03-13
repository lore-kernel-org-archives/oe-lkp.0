Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACF23D281
	for <oe-lkp@lists.linux.dev>; Fri, 13 Mar 2026 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389507; cv=fail; b=b6TDej8Kja4fgqmGY9gcf3XfaTLGbd4r550U8Z2T37iX1lTuLpTsByi4A5Zx/lyCJPhGHEGYRtwZg1y3+a3og2cEAzFLGylElI4WcjLLTqnWj+6S1plzp2xVoe92S8Yl6Sub6tIQupDHltlaLF24mMmoHS2hc7BpDANsF1iB4Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389507; c=relaxed/simple;
	bh=q4bF4VkxVWYRkh9gCXAy2go8ZCE3WBS60YyhXwDusBU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AlXg4VUBqLA8mkf1Wv/7KAcWXgCwt6RwemkrCr7itIM8AK8Xtnje7O5ll+4tGICdLZD0GcPaxGe4PZ4dxpTk8yk2wI0Kt+vdvXi20LSjxc2jmjEyBpdpro0pyv+No5JMnqiOJvlM9lQru3+5/3jV35Qg8Wphk0PLBisaQFIPEGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUrTv4fy; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUrTv4fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773389506; x=1804925506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4bF4VkxVWYRkh9gCXAy2go8ZCE3WBS60YyhXwDusBU=;
  b=PUrTv4fy7OZ5mLN5MLakfZMjHMhOhwXWkhhT9uvRiKxn1qazvkJRhLPR
   bNXpV3+63qJWTzKfwgzTLg/12syLAxa73VXRrEpWsunfDeAJFL67jkzmm
   bhHvUzaveL0bT53Ieu6qPeVaXY9fZSvcH0xys3XtwF8EaRnTzTXWTB3Er
   lZYo9DXF9G3GkZ6OSUMJoiOL/FL/IVfoGNj+Q/7d+eF6PRPqyAElMDOmp
   xjjw0O0BrnGU9mTOx8Zg195bZES/CEygbq/Ub2mk4ALh+4YZxuvpb/EPV
   9+AmWimPDNzzlCmo83RxXGFv1ZIFJw5OVHmGnH1DkJLXCq5ymbxoWPeVG
   g==;
X-CSE-ConnectionGUID: IomQLWDlR2Cdu4DsLb/W9g==
X-CSE-MsgGUID: E93OSOvjRR2tlDnmoy05Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74462236"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74462236"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:11:30 -0700
X-CSE-ConnectionGUID: ykR7KehmToqYvKJzQJxteQ==
X-CSE-MsgGUID: AYuI8CAgS7qso+XqbickUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220175647"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:11:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 01:11:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 01:11:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 01:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ+MNGhOKdgeqxcxIu7tYNLEN1CGWzteHlr915Jqc7Q5wjgSkG0hinPbgcRPE4R8ZzHIoYLfnReo4HuInxOgk6/HdFhwafRW3uTj81aii0wNkvFCw28XTjqptjiTP0YlsrUBButOZvcDVhFofR3zpuUQoi9y6OW3UPG1Tg6nDLveS2u5xtwoiH+n2B1HMrxfL7QeImATN64SNNQs3Kt7m08zKbJPKyzEURMNnlBGZxOAa9QE6BG2wqlRPJfe/aG/eHsfxYnXPpKEVr2eqPxiDXebj8MKTxPY9f31BcaXmWSa9KcHNx9qmCe2V1EaHDnEabwFZkP9Ga9/N52RXiwfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmqYWgvmHXF45o+6I0tLQY/BoGFTplVekMzhlsFdaXg=;
 b=m5nLN5efxSeDC8ggG+6gKUIoegxo/1TVC5Vf1/RSjn30ncjPABJYCTG9wPg6mOqj05sAZ5ikZ98WKg1w0CVOVuXKWcpIM+ZvPn1beYxsfdTh90KGuMG71bL7Xq1lR0rGGxTbm3utdMtqfpkTY6E5WINSAyI8ompwxNvfC5GW/IkKWEkhTMfgbUiGJ60jzggaGdB8vMaPGjUUOJ2vzrphzM2K+ycVIb3LwZcnl8eEQVhWiie5SfRCQMrzJjHgKsK9J7e+/MCzK2KZ1B1a1I+ZSi91kngqzhlk530AjAeJXaZ8E5diqSPn4ImU+2c05nHWfV6oXCEg+4OVZXhpkvmHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 08:11:16 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 08:11:15 +0000
Date: Fri, 13 Mar 2026 16:11:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthieu Baerts <matttbe@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <matttbe@kernel.org>,
	<oliver.sang@intel.com>
Subject: [matttbe-net-next:gh-issue-617-stalls-starting-vsock] [sched/mmcid]
 5e4b47fd15: BUG:soft_lockup-CPU##stuck_for#s![make:#]
Message-ID: <202603131533.347f08fb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:820::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7d993a-99ef-4e8f-4bb0-08de80d81901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 8JR8zs/AxQXbtz/DQx29/NjXTMaE3ydojm3VQfTVVlP7rqWlibLx6WSJBq5LZRX1hRXjVQD2e7XvDEaJKk5zvEBssUnL7aVa14b3V9AwiAietVp9Ub7gRrx7Gjylgqd7VKaxPADxCr958Q4PW8K2fmj5TZCPUzr4nzCQNPrHx8q530HneR5ZrKZ2bXru1dcA9kaWwHaYPoGIGYIHzJx99q7P5+JhYSs0hs+HqOt5kLkzXrjgyf01lRzGDynIhVkgZ/6MzpvbA1fWZIrAcMn+bs6tDiJSdpAfn0itkmQGAijmtXURQwBghXxTyoupqkFYsu2RoI7uXB4UcUYBTWtnDCzIm1/Iuded1rVEXIxtcHS2fAx+3NzlGdyPhVaKbSoQ/ywV/909LfrJiXm/kgq+YhtnqZEUGk7vs5UzME0UbRYI15Q8bdQhtAFwEQi9HJYuCBuYfRKo9Z601KYF2eWPg0H1h+bKnOtaWKa8OJhp1HXXzRqJ04pmtFk1K9A844vWibTXSdd+jQVVOuAjgViqAA/sPo5MRQWmI53WbxY7fD42F8IzQSvG2Xu4laZZv7/hVjWVeY2HIHiVPUm3RhsECH/rzfbrGFSUnUdFmpxJV/jodfc4ESAdETeN37Y7SDsqawWUucemBnJA+ZMOuePEtT7glprqXURdg9C5n8mIjzHRZhXMGW919GuWiHsn8o4W3dIPhy7NiXyzhbkIhjSiQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTvS2NWFWL6wuVv4KKIAEho8EVbh+zjOWu10U3b8FxuvRR1951DEqSGlUi0M?=
 =?us-ascii?Q?Sheyf5CoZCRuU0d2YzHw+bPgplzxQUndeLH1GgYl41dv/1tQLl9XGxnR+fcZ?=
 =?us-ascii?Q?2EE4IAQPItgqV8w+FsPJj6BIvfA84y37gycZPOZYZc1Q8yWMRQL9WJ9Skrus?=
 =?us-ascii?Q?6QK4nNFkfWxxnsTBbTepg+CuVHMZLuoW2kjDc1gVOCorWGMp38kta/rZEEmS?=
 =?us-ascii?Q?4I3ftNM/b+1KusT4Vw7K9dlDI5pt6zTTp3yCdTrbVeTIqOZ3A1le9Y41hwLH?=
 =?us-ascii?Q?mAouvwY2lDSaftkFkhWxnPWrc+//GF3soI9nJkCJ6S6os/Kuo9taSvw/D7um?=
 =?us-ascii?Q?ax/Lz7FziQHgHCfd+A188ZYuy7+r49/yr0KKTtDkW4etKThkdlhu2aZOBxLV?=
 =?us-ascii?Q?xjQwGbMUaYzh2aFEpIQ9lUsaFy3EYzyjm2g7G/j9QxvlBWUvJVkYqaqWP4FW?=
 =?us-ascii?Q?zV5VQ7G/FH6MDTPwuGT6/RuR47GE0No9ilcdc6jQDI4CG+AXa4UEDPmVYkNs?=
 =?us-ascii?Q?fPZlNeyR3Gksd7UImMGFvXJYRwTmogbnG1L2RDcCYpr0fZV2L3JJdijCuc6X?=
 =?us-ascii?Q?RxlV+Etp/gbDeLbK6ljlNGYLSS2Y9OLPPxKKBnOFU528LAQ7Z7hkTkCczjAn?=
 =?us-ascii?Q?bPz5ANpIt07hhdbjh/aaOOQuCoKtdR121VMwxpZE0rNito7MS0DqScxdOsYZ?=
 =?us-ascii?Q?6eJ0jKQj3IlqMqhxf7BWQnzIHmjDqyrMJzCG7L6c0ynvRFLdauYA38E088Bw?=
 =?us-ascii?Q?CngaQZcu7iEjSyvVGZpAQWBUPYpLflqSbOcgGc/FGltRHIv0+fqmRT+LafHB?=
 =?us-ascii?Q?1K2EmJo3+Q/TuTN7+VAbWCqXc++0ngzKaadMkkJLwZDroucXV7sflg7/kWTj?=
 =?us-ascii?Q?fju/qinwgRg3JsXI2QRUDXH8VxI37TlXBZTSpUG39+jgdvbo+IMIUdvOdh6m?=
 =?us-ascii?Q?YNnJuhefUXrJUob8MTdt/EIqxWc+217ZVWhpdfYZQVqWpwGepajzOL7oP5C2?=
 =?us-ascii?Q?urcpRuCq/bWQZvReAEo2w5mnC6dgMdjRIJB3yWbGWgHI00Z75KVep7oX42h0?=
 =?us-ascii?Q?Q11sLI/DA22tEjL2MZSxzq7htR+ukkJXLTkGktBi58oI2ek6CaHx7Jnjk1CH?=
 =?us-ascii?Q?gefiuf0uq4WxYujWiaNtLWbw9DgoZ90HtKvZ/cCI9iWl5dmr7wyo7SWHGynB?=
 =?us-ascii?Q?doWe7TgEKXst7H7j3yt8rhrRCNJMA3MmAZvRoRU5ZZuaGpNsj2uRBszT8bBi?=
 =?us-ascii?Q?sP3Sse9O6UTwJE9PVfbYeRmvJxjmn/LQ/7MujeqvlOfGdGvH5h4E+Rx4dDbX?=
 =?us-ascii?Q?WjdKqwTvE4WwiUUGNJjcTUMVzfU5P67xDEcZY6b+Fa28KreBSA/P3kqrY2T3?=
 =?us-ascii?Q?JJj5E1Xe0HJroUQZzCG/OUn3DRwSZuyCASpJ78mdAvfKbINYtbtloQdT0+K9?=
 =?us-ascii?Q?urxECf+/vnJJahqiGqF9sb0XZRC73C8DoC5AH19fmM2gXtGaT7WugnzUgkgp?=
 =?us-ascii?Q?X/YOxB1nc4W+mKhU+oYoHq4XMqXTI6vypEigRq5OZjt+qsmYFf0t+xssK1j0?=
 =?us-ascii?Q?fYHYnvD9+d8wWcpelpwiYV2Z4yAim832RepGUzr06qafqrRF65eABCvdKpbC?=
 =?us-ascii?Q?vSm+1JV3PeVmK8UFgOHGi6Z2auFvFPx0esBRDCmaTpIxQhxnNiO+Sx1tOy9M?=
 =?us-ascii?Q?xBMZCBnMhjGWHTTzyEaKPHn1YQciDJgyv9V8SDQ951OEdBCr1cirzv5geW5A?=
 =?us-ascii?Q?Rw1EChUyUw=3D=3D?=
X-Exchange-RoutingPolicyChecked: bEqqGHN/LFneuleBSL9+PgCF13SLXtUjYYTRvjTyWiYveeMPUzsL2ddBS1hi8kjNe1xjO5u5emJvTSq9fdUBPiz9XkI2hzFiv6nJjqUByICPzvO9iQ5Hk5eKq200PD66EWelAvK37dynhBtkVuSJSGaO5wc5NKyQN/m3h+EpbLSQ1wE9uDi01D+iUGBEweJrfgZuRSOZklmzN6EbTR2LjXYjX3IBbQvHcfHgkI7Rvbt1v5If/+jjvpKP2hNh3z3PcKIGBILJrj2Hsls2w9S4uClf5cu9mjlyE/LcJwYV55pGSrpxBggBPYkqQ762C7zTjBzOiCEqJrh0JWnxWKXlaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7d993a-99ef-4e8f-4bb0-08de80d81901
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 08:11:15.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHgx9DHEbnSO3kyyVx8byseIwb6EiZH9ay2E51E0mZ2ZeMerFgJi9pxPI4Tcnmpu02ddoVbuv3SlOWKMRYFLXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![make:#]" on:

commit: 5e4b47fd150c2ab74396945eae895ed419505daa ("Revert "sched/mmcid: Switch over to the new mechanism"")
https://git.kernel.org/cgit/linux/kernel/git/matttbe/net-next.git gh-issue-617-stalls-starting-vsock

in testcase: perf-stat-tests
version: 
with following parameters:


config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603131533.347f08fb-lkp@intel.com



[  203.398029][    C1] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [make:6528]
[  203.398035][    C1] Modules linked in: btrfs intel_rapl_msr intel_rapl_common libblake2b xor zstd_compress raid6_pq x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel platform_profile sd_mod kvm sg snd_hda_intel dell_wmi irqbypass ghash_clmulni_intel mei_wdt snd_soc_avs rfkill dell_smbios rapl dcdbas intel_cstate dell_smm_hwmon sparse_keymap wmi_bmof snd_soc_hda_codec dell_wmi_descriptor snd_hda_ext_core snd_hda_codec snd_hda_core drm_buddy snd_intel_dspcfg snd_intel_sdw_acpi ttm i2c_i801 snd_hwdep intel_uncore drm_display_helper pcspkr i2c_smbus snd_soc_core cec drm_client_lib snd_compress intel_pmc_core drm_kms_helper snd_pcm pmt_telemetry ahci pmt_discovery intel_gtt snd_timer pmt_class agpgart mei_me intel_pmc_ssram_telemetry libahci snd video acpi_pad intel_vsec mei soundcore libata intel_pch_thermal wmi binfmt_misc drm nfnetlink ip_tables x_tables sch_fq_codel
[  203.398124][    C1] irq event stamp: 44440
[  203.398125][    C1] hardirqs last  enabled at (44439): asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:569)
[  203.398133][    C1] hardirqs last disabled at (44440): sysvec_apic_timer_interrupt (arch/x86/include/asm/hardirq.h:81 (discriminator 2) arch/x86/kernel/apic/apic.c:1056 (discriminator 2))
[  203.398139][    C1] softirqs last  enabled at (44380): handle_softirqs (kernel/softirq.c:469 (discriminator 2) kernel/softirq.c:650 (discriminator 2))
[  203.398156][    C1] softirqs last disabled at (44375): __irq_exit_rcu (kernel/softirq.c:657 kernel/softirq.c:496 kernel/softirq.c:723)
[  203.398163][    C1] CPU: 1 UID: 0 PID: 6528 Comm: make Tainted: G S        I         7.0.0-rc2-00273-g5e4b47fd150c #1 PREEMPT(full)
[  203.398184][    C1] Tainted: [S]=CPU_OUT_OF_SPEC, [I]=FIRMWARE_WORKAROUND
[  203.398186][    C1] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.1.1 10/07/2015
[  203.398188][    C1] RIP: 0010:sched_mm_cid_after_execve (kernel/sched/sched.h:4026 (discriminator 2) kernel/sched/sched.h:4045 (discriminator 2) kernel/sched/sched.h:4061 (discriminator 2) kernel/sched/core.c:10741 (discriminator 2))
[  203.398194][    C1] Code: 1f 49 8d 94 47 40 0b 00 00 48 89 c8 48 c1 f8 06 48 89 55 c8 48 8d 3c c2 e8 27 90 5a 00 48 8b 55 c8 48 8b 4d b8 f0 48 0f ab 0a <72> 42 48 8b 7d d0 e8 0f 7a 5a 00 45 89 ac 24 30 1b 00 00 49 8d bc
All code
========
   0:	1f                   	(bad)
   1:	49 8d 94 47 40 0b 00 	lea    0xb40(%r15,%rax,2),%rdx
   8:	00 
   9:	48 89 c8             	mov    %rcx,%rax
   c:	48 c1 f8 06          	sar    $0x6,%rax
  10:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  14:	48 8d 3c c2          	lea    (%rdx,%rax,8),%rdi
  18:	e8 27 90 5a 00       	call   0x5a9044
  1d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  21:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  25:	f0 48 0f ab 0a       	lock bts %rcx,(%rdx)
  2a:*	72 42                	jb     0x6e		<-- trapping instruction
  2c:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  30:	e8 0f 7a 5a 00       	call   0x5a7a44
  35:	45 89 ac 24 30 1b 00 	mov    %r13d,0x1b30(%r12)
  3c:	00 
  3d:	49                   	rex.WB
  3e:	8d                   	.byte 0x8d
  3f:	bc                   	.byte 0xbc

Code starting with the faulting instruction
===========================================
   0:	72 42                	jb     0x44
   2:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
   6:	e8 0f 7a 5a 00       	call   0x5a7a1a
   b:	45 89 ac 24 30 1b 00 	mov    %r13d,0x1b30(%r12)
  12:	00 
  13:	49                   	rex.WB
  14:	8d                   	.byte 0x8d
  15:	bc                   	.byte 0xbc
[  203.398197][    C1] RSP: 0018:ffff888805237ad0 EFLAGS: 00000247
[  203.398201][    C1] RAX: 0000000000000001 RBX: ffff8888052a6000 RCX: 0000000000000000
[  203.398204][    C1] RDX: ffff8888052a6b50 RSI: 0000000000000008 RDI: ffff8888052a6b50
[  203.398206][    C1] RBP: ffff888805237b18 R08: 0000000000000001 R09: ffffed1100a54d6a
[  203.398209][    C1] R10: ffff8888052a6b57 R11: 0000000000000000 R12: ffff888805240000
[  203.398224][    C1] R13: 0000000000000000 R14: 0000000000000001 R15: ffff8888052a6000
[  203.398227][    C1] FS:  0000000000000000(0000) GS:ffff888815bbd000(0000) knlGS:0000000000000000
[  203.398230][    C1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  203.398232][    C1] CR2: 00007fff149c5e49 CR3: 000000084d6a2005 CR4: 00000000003726f0
[  203.398235][    C1] Call Trace:
[  203.398237][    C1]  <TASK>
[  203.398244][    C1]  bprm_execve (fs/exec.c:383 fs/exec.c:554)
[  203.398252][    C1]  do_execveat_common (fs/exec.c:1846)
[  203.398261][    C1]  __x64_sys_execve (include/linux/fs.h:2539 fs/exec.c:1929 fs/exec.c:1924 fs/exec.c:1924)
[  203.398267][    C1]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[  203.398273][    C1]  ? _raw_spin_unlock_irq (include/linux/spinlock_api_smp.h:188 (discriminator 3) kernel/locking/spinlock.c:202 (discriminator 3))
[  203.398277][    C1]  ? __x64_sys_rt_sigprocmask (kernel/signal.c:3338 kernel/signal.c:3316 kernel/signal.c:3316)
[  203.398283][    C1]  ? __pfx___x64_sys_rt_sigprocmask (kernel/signal.c:3316)
[  203.398293][    C1]  ? lock_acquire (include/trace/events/lock.h:24 (discriminator 15) include/trace/events/lock.h:24 (discriminator 15) kernel/locking/lockdep.c:5831 (discriminator 15))
[  203.398299][    C1]  ? do_syscall_64 (include/linux/irq-entry-common.h:298 include/linux/entry-common.h:327 arch/x86/entry/syscall_64.c:100)
[  203.398305][    C1]  ? trace_hardirqs_on_prepare (kernel/trace/trace_preemptirq.c:64 (discriminator 4) kernel/trace/trace_preemptirq.c:59 (discriminator 4))
[  203.398311][    C1]  ? do_syscall_64 (arch/x86/entry/syscall_64.c:113)
[  203.398315][    C1]  ? __lock_release+0x5d/0x1b0
[  203.398321][    C1]  ? __might_fault (mm/memory.c:7217 (discriminator 1))
[  203.398326][    C1]  ? lock_release (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5891 (discriminator 4) kernel/locking/lockdep.c:5875 (discriminator 4))
[  203.398332][    C1]  ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:126 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:206 lib/usercopy.c:26)
[  203.398352][    C1]  ? __x64_sys_rt_sigprocmask (kernel/signal.c:3339 (discriminator 1) kernel/signal.c:3316 (discriminator 1) kernel/signal.c:3316 (discriminator 1))
[  203.398357][    C1]  ? __pfx___x64_sys_rt_sigprocmask (kernel/signal.c:3316)
[  203.398378][    C1]  ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:752)
[  203.398398][    C1]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[  203.398403][    C1]  ? do_syscall_64 (include/linux/irq-entry-common.h:298 include/linux/entry-common.h:327 arch/x86/entry/syscall_64.c:100)
[  203.398409][    C1]  ? trace_hardirqs_on_prepare (kernel/trace/trace_preemptirq.c:64 (discriminator 4) kernel/trace/trace_preemptirq.c:59 (discriminator 4))
[  203.398415][    C1]  ? do_syscall_64 (arch/x86/entry/syscall_64.c:113)
[  203.398419][    C1]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[  203.398438][    C1]  ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 arch/x86/mm/fault.c:1480 arch/x86/mm/fault.c:1527)
[  203.398441][    C1]  ? __lock_release+0x5d/0x1b0
[  203.398446][    C1]  ? handle_mm_fault (mm/memory.c:6509 (discriminator 1) mm/memory.c:6649 (discriminator 1))
[  203.398451][    C1]  ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 arch/x86/mm/fault.c:1480 arch/x86/mm/fault.c:1527)
[  203.398456][    C1]  ? lock_release (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5891 (discriminator 4) kernel/locking/lockdep.c:5875 (discriminator 4))
[  203.398461][    C1]  ? irqentry_exit (include/linux/irq-entry-common.h:298 include/linux/irq-entry-common.h:341 kernel/entry/common.c:219)
[  203.398467][    C1]  ? trace_hardirqs_on_prepare (kernel/trace/trace_preemptirq.c:64 (discriminator 4) kernel/trace/trace_preemptirq.c:59 (discriminator 4))
[  203.398472][    C1]  ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4629 (discriminator 4))
[  203.398477][    C1]  ? irqentry_exit (arch/x86/include/asm/jump_label.h:37 include/linux/context_tracking_state.h:138 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:301 include/linux/irq-entry-common.h:341 kernel/entry/common.c:219)
[  203.398497][    C1]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  203.398501][    C1] RIP: 0033:0x7fd5f465b280
[  203.398523][    C1] Code: Unable to access opcode bytes at 0x7fd5f465b256.

Code starting with the faulting instruction
===========================================
[  203.398525][    C1] RSP: 002b:00007fff149c5880 EFLAGS: 00000202 ORIG_RAX: 000000000000003b
[  203.398529][    C1] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000000000
[  203.398531][    C1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  203.398533][    C1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  203.398535][    C1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  203.398537][    C1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  203.398563][    C1]  </TASK>
[  203.398565][    C1] Kernel panic - not syncing: softlockup: hung tasks
[  203.895548][    C1] CPU: 1 UID: 0 PID: 6528 Comm: make Tainted: G S        I  L      7.0.0-rc2-00273-g5e4b47fd150c #1 PREEMPT(full)
[  203.907621][    C1] Tainted: [S]=CPU_OUT_OF_SPEC, [I]=FIRMWARE_WORKAROUND, [L]=SOFTLOCKUP
[  203.915919][    C1] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.1.1 10/07/2015
[  203.924142][    C1] Call Trace:
[  203.927472][    C1]  <IRQ>
[  203.930315][    C1]  dump_stack_lvl (lib/dump_stack.c:122)
[  203.934808][    C1]  vpanic (kernel/panic.c:651)
[  203.938758][    C1]  panic (kernel/panic.c:787)
[  203.942483][    C1]  ? __pfx_panic (kernel/panic.c:783)
[  203.946911][    C1]  watchdog_timer_fn.cold (kernel/watchdog.c:869)
[  203.952198][    C1]  ? __pfx_watchdog_timer_fn (kernel/watchdog.c:774)
[  203.957632][    C1]  __hrtimer_run_queues (kernel/time/hrtimer.c:1785 kernel/time/hrtimer.c:1849)
[  203.962805][    C1]  ? __pfx___hrtimer_run_queues (kernel/time/hrtimer.c:1819)
[  203.968564][    C1]  ? lock_release (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5891 (discriminator 4) kernel/locking/lockdep.c:5875 (discriminator 4))
[  203.973119][    C1]  ? __pfx_read_tsc (arch/x86/include/asm/tsc.h:57 arch/x86/kernel/tsc.c:1143)
[  203.977760][    C1]  ? ktime_get_update_offsets_now (kernel/time/timekeeping.c:2576)
[  203.983802][    C1]  hrtimer_interrupt (kernel/time/hrtimer.c:1914)
[  203.988708][    C1]  __sysvec_apic_timer_interrupt (arch/x86/include/asm/jump_label.h:37 arch/x86/include/asm/trace/irq_vectors.h:40 arch/x86/kernel/apic/apic.c:1063)
[  203.994589][    C1]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1056 (discriminator 35) arch/x86/kernel/apic/apic.c:1056 (discriminator 35))
[  204.000223][    C1]  </IRQ>
[  204.003142][    C1]  <TASK>
[  204.006064][    C1]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:569)
[  204.012017][    C1] RIP: 0010:sched_mm_cid_after_execve (kernel/sched/sched.h:4026 (discriminator 2) kernel/sched/sched.h:4045 (discriminator 2) kernel/sched/sched.h:4061 (discriminator 2) kernel/sched/core.c:10741 (discriminator 2))
[  204.018447][    C1] Code: 1f 49 8d 94 47 40 0b 00 00 48 89 c8 48 c1 f8 06 48 89 55 c8 48 8d 3c c2 e8 27 90 5a 00 48 8b 55 c8 48 8b 4d b8 f0 48 0f ab 0a <72> 42 48 8b 7d d0 e8 0f 7a 5a 00 45 89 ac 24 30 1b 00 00 49 8d bc
All code
========
   0:	1f                   	(bad)
   1:	49 8d 94 47 40 0b 00 	lea    0xb40(%r15,%rax,2),%rdx
   8:	00 
   9:	48 89 c8             	mov    %rcx,%rax
   c:	48 c1 f8 06          	sar    $0x6,%rax
  10:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  14:	48 8d 3c c2          	lea    (%rdx,%rax,8),%rdi
  18:	e8 27 90 5a 00       	call   0x5a9044
  1d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  21:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  25:	f0 48 0f ab 0a       	lock bts %rcx,(%rdx)
  2a:*	72 42                	jb     0x6e		<-- trapping instruction
  2c:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  30:	e8 0f 7a 5a 00       	call   0x5a7a44
  35:	45 89 ac 24 30 1b 00 	mov    %r13d,0x1b30(%r12)
  3c:	00 
  3d:	49                   	rex.WB
  3e:	8d                   	.byte 0x8d
  3f:	bc                   	.byte 0xbc

Code starting with the faulting instruction
===========================================
   0:	72 42                	jb     0x44
   2:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
   6:	e8 0f 7a 5a 00       	call   0x5a7a1a
   b:	45 89 ac 24 30 1b 00 	mov    %r13d,0x1b30(%r12)
  12:	00 
  13:	49                   	rex.WB
  14:	8d                   	.byte 0x8d
  15:	bc                   	.byte 0xbc


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260313/202603131533.347f08fb-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

