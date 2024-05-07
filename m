Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0154A3D
	for <oe-lkp@lists.linux.dev>; Tue,  7 May 2024 02:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715050048; cv=fail; b=CXNHHGXm7b5SKsUsJG2X/i38oq5xdflu8AgxEeZTX1DyOW1pgHO1gEO5abLhgCf1ensGNBc2J2Nms4V89i1IPd/9ZPGia8oord5VMu9lK2/nimThJtJRvBEyzn//MEKepmqF9OAcycvtyIcZD/xtHBd/PCxY2evsd8Jfw4i555c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715050048; c=relaxed/simple;
	bh=el9aU44njYaWlBD1pH9OU4a0HsNetcHYN0/e57dTWjc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dMW/97Dy1RZamSUbmmzdop1M3+acNJR9ByYL+6JTD1s8CldWZJ5InDxxakLkwvuzIFvBQs0LPd8kkosKzjeztiq5A/YsWFggaX8UF3efRMpkaGghwF9mzmkGDZSBSxdL+d7r/ESG1vTFkW0VFthKt15JyUoJg11I/qfAdYFGHKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUmknzPB; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUmknzPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715050046; x=1746586046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=el9aU44njYaWlBD1pH9OU4a0HsNetcHYN0/e57dTWjc=;
  b=ZUmknzPBCAuflTytv7zhOwjj0td0Uxmc+QOWLJGiny8O7M4FgEjgzY1z
   +Wnu80twOqy/9GiVvC4N9BaaX2qBGWhPuzKW6r0bbzZbkgtdmq2e+dCbL
   dl15o1cWpcqXI4bf+PKEjHt+TrgXfRSacbwmh72CwaNxEGDYu+XlZQxOh
   VJ3DbfImcGPBEeJEqbeuItIrxIjbeBcteY+wfHfGxJLfsihsJGC/BdRIc
   4urUHbwcEgy82KiKQFme8aTnMm9QSGpvpzfwzK43blDnykzxNNC+NSRcd
   qAD+wVHvzOgkUZK1CAmTy38lrBAmqrz7NwFSmTi9NdQXmlPT8W20Yrv0w
   w==;
X-CSE-ConnectionGUID: 04yhM6D4RkuGseX1hc3m0A==
X-CSE-MsgGUID: jujcSZV/RIuVhYehu+YXtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22234684"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="22234684"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:47:26 -0700
X-CSE-ConnectionGUID: hxqnD2evQvGVwPvuTaJz0w==
X-CSE-MsgGUID: HYDh1xhpRW2GlsVFdjzkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28255417"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 19:47:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 19:47:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 19:47:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 19:47:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 19:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETHvzJcaysXgYM26Qs97Yp/At72XIMdcxuGBozqnMzeF/sT8rcGeFQVxLENsszy/Sa19/tUiYuO5tCgGsLQXi8PwQhyXLbhbA7lvnkBpDOWmFcdBcwLORiuPGUYjedDfaJlJsnU2MaRPVi3tLVNILvKH2kH3a0mgBgtpGFw5IPsITy8Rjos6kSWAK0taKxjSI67dOrXddic9dCWZTKOGq4YJdNICDCg0Do2mRY61pZN4HWJogTk6G0ap61Xm504VoLsHcjDhqCQ22LX29iSSZOb/evyBM2SWP7dWkFUaN4GtSbKBe8DeLHGMcax0OLAusxe4zTvyLZqmTHxcqPvfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ks1u3HwJK2/bMlA7o1TV+XwD9zNgWiVLGRzSkXlvzU=;
 b=a10azClzJdwJnX1HxDUrBbqtPBOoTBrPLTkKBbZITDKRO2d+GdzrdOrRxe+LAJRb+F7//br2mOLoTnhA1rXvm97BhS2cn4lpjWU9evHiybPS33wc/oP1EVux9vo+lRlpLYiVPVTV0koWtzAGBcD6vFaSfrD/NkOi6N9npd3X98OMW7Z8keZ2cm/X/EtBmy5GAZ6pgUZQ19RlOeS3+y4GhtQ0gz8diAIz1FkxuV8PBY0IxOu4KGYHILavpCpk4NRUVIJM2G2Df9KICfIEIPxZ9YHAxVneNc5/RnoO9GNMGryFv7Eup1LroIMssbHNaTO6e+hekwUOqDAP8pDO1Tp7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 02:47:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 02:47:17 +0000
Date: Tue, 7 May 2024 10:47:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ian Rogers <irogers@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [acme:tmp.perf-tools-next] [perf parse] 617824a7f0:
 perf-sanity-tests.build_id_cache_operations.fail
Message-ID: <202405071043.d430a606-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:820:c::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb4af5f-b44a-40d0-61ff-08dc6e400225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ei+hO1I8NmlOLkN9hbgHNPeOF/1dh9VjOI/ZFLFSkjI896TjxRih/vt5gwaH?=
 =?us-ascii?Q?p0/xgqBi9QLneREfn65OujYNAWnvMYVE2cKHtEMNV8vgZ5UbnC+XyqioGtGU?=
 =?us-ascii?Q?jqCEYCnzYUjvADA6ycx2iIPuBDNacGCmFigztfvg8046G7s0PQjIYGDCjpN4?=
 =?us-ascii?Q?HXCUrGQaJ6fO1PRSXK0XNThWu52XggvjpRLxb3y37nOIP9hNtUIj9zXDj7pO?=
 =?us-ascii?Q?6NiyWt0PsnT1p0HB0l/QMR1Kdr+R1nNzWqLbxNQkq/NYyKrGPlNSkuMvE7rj?=
 =?us-ascii?Q?r0QGICrwZk8zTN/wuePSALhW8XEm/SMsvdT1yciMn1iGfwY5bJuzHbw+pS9h?=
 =?us-ascii?Q?0kQKav/3OLbzUqYcsJrrMVVeHTGWyOQNJ7ETkl7WLREQH1KUoGXEz/qRV+C6?=
 =?us-ascii?Q?kUb5hBkbeKT+yS3FyE6neaZEv4iCvfRucDryZalOa6jTZGFTsVuYGMuNVMBo?=
 =?us-ascii?Q?wn/+Ym6LVgXeSGU+MQSwL7J5/ETeUSNJ/+2y5+oX9rLrGU1VDjlMi00Owxgm?=
 =?us-ascii?Q?FEMcIucvWqWCnhL+lYp2eWmtAZ0xD/sU7aGOmikzqqUH4lUeiNr7snMH8KQP?=
 =?us-ascii?Q?mE0JfPXhoD1KySn4Kvrpg/QaNpZtgWCkGMulCAOAFFFWNoGIm8ADZ2Tkr5BV?=
 =?us-ascii?Q?fHTZFsmJVuqrx8lD2Xq4xBztxoKwW62aHcB/mIT2pajgrW1WuCEm22qVzgtz?=
 =?us-ascii?Q?b8lQjPmY3CwbbP5aOqFwp4lZliVYz3bjdZFRxfVRvNRt7jUKXDczK1weznGt?=
 =?us-ascii?Q?rhIoga9lSHG47T/gjIAIPGsIAb2fHaXpCfbeSTNLCOAKC3TypBHz+F0L5tn5?=
 =?us-ascii?Q?EDd+zoYxiWE4ShsMyVLZgemCR3G2eOi4iraD5pVj9ikw7EoVWLQrBrTUG/7F?=
 =?us-ascii?Q?SV34uqK3LrcmgdqgG14M7Z+UGg2Iz2knnsrKWOFDNWb9v+n0THFf82QlUzbQ?=
 =?us-ascii?Q?26B9T6BD4v+wioYFQceNa0AxxtjdKnAPtfxn4cSmvsIdRiAt89NeonV+g3tk?=
 =?us-ascii?Q?1yE4DNwPErkxs+UqifzhtPLp3lAkC7yY5HgGk/cIh7jwqGP8Z1ItkZuJDHec?=
 =?us-ascii?Q?up/NOs8AcKo5fZ/yBYP5gXt0oLOIaazx91sFEax7yvhzI4Zp+gcXfbbR6m8S?=
 =?us-ascii?Q?6xnQ7+DHzKtw+cJm9IjS9kVtwcRpverGxiehTfH41XL+vMRcTIUdbTJfBYD+?=
 =?us-ascii?Q?+7GEACkKlC6C5P26FCF4IgbwJx9JI7ErfWtd8PURcYhKH2sBKahL+rEQ2cg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pOz8/G0+VfWl5Iy8beuorjN7vlq23MCiwiSe2Sxj7xGzMBk3jwOXuJ1+/rfT?=
 =?us-ascii?Q?sDVALy3m8a4G9Qg7sdMPj8Zk9AFToMs6THlblyp/yJ7a7T7bdWC4159soi3w?=
 =?us-ascii?Q?+bicMfKI5Twtz6HczZHQVYTxd1K1okF870nq5HVGDoxWVev90BwJ0aqV5hku?=
 =?us-ascii?Q?SfQ8f37syN9tAW1h8N6QWFUo1Pj7eIaOOJkC3+Mroi9dXEHKWaVng6FqmMvd?=
 =?us-ascii?Q?aMOVR+a20At6etPOtXsk6YqPjPjvO1yQqOU5/6mli6cxQfKb3y3s9DAUWwb+?=
 =?us-ascii?Q?40CkQWgMZ27i+YtEmtR2D0kgJj5k0b3gdeKztEaGFjnAvGCxfNQne55cjL/I?=
 =?us-ascii?Q?cfPLnYdV9MbyClufHWEuJCvSYT++uD9spnEEEU7CwH/UbLkY/T+G13bCctgV?=
 =?us-ascii?Q?Rk7tJjwl5XCFVA8swniLH4oW+Cbck5xDgmBkWVmClVEgvdT96rTGIBfeFhui?=
 =?us-ascii?Q?2cFJdjLiSej+C+yScAVeqYUwny8qnW6K63cIwwWN3AmZPf3Vqu8j6H8JUoJc?=
 =?us-ascii?Q?S45lGDcUp6lYO3HLhXLekYJtXO19kkSmTuBrx/Bv7gzQBVEpBp/0mkfEG/Bk?=
 =?us-ascii?Q?Ck8MwE8YPurpt3kZZJkaZH8s1NUOoU6xEh+U/G6D119S9n2BEMfrW9xvolVq?=
 =?us-ascii?Q?7sKr/u3enC3h/C1HD392LfT+qfsb2Fr4b1ilJ7OdDPO38AorI+WdszSj7wyh?=
 =?us-ascii?Q?0C5mnXN90eySXnOHZ0q9GDpa4IaehQ3KbAE2MaftN2x7IocYL82mCANRXqwd?=
 =?us-ascii?Q?tsTMeAdWyZ8RhB4C7APLazVTJCxxTDPenJHKwW0cTdl9guKy0wyJtqUq0HqU?=
 =?us-ascii?Q?VvkHiiEaY/kZTbnRlKJRjJw1/J2pkNyGmudZ8zev/ErE34jzp2oAyf4WyY64?=
 =?us-ascii?Q?orzypVzSZVzwpRrXpAOwbbiGaA6MIUVRKzfvvyjcNn/nD2y66x9fIfcCgQLA?=
 =?us-ascii?Q?dyApft5w0cRDhRopifo1uDzRqYyd++NNqDXkf/pGL15Eg3B66a0Oa7i6ALCN?=
 =?us-ascii?Q?VQM0xMTKU3yWGWvdrfBCsEij/p3eC0ZyIw69a/gahgCJ7TnL4R/Liggsj0gY?=
 =?us-ascii?Q?Vt7kgJo7PaFNn293ASGpcqG+kZRLDrKXZJecZvKLjb3Q43PeTWdMtoAyYGA3?=
 =?us-ascii?Q?kqNV8d4gn6CIh2+6upkF/xDcCqGpJOv9STKp4A+CW+C6WtvCLq+50nTNq46V?=
 =?us-ascii?Q?EptsZP3sf2U2R5DZk3MutmpeY7xN4HP83FbqsTBcZGfQoCK/Nv7l7JCjCNEl?=
 =?us-ascii?Q?PADNiYp3jr5kOny2eIRbID6CenYZh3zsA0kN2DxP13UotKuma/YWSiykYxb3?=
 =?us-ascii?Q?bhrf6+PO+Fy6bbMBqJF+GV/eXfVrUzFU2qiY66sBLuCthL0BPS8HvBB1fA5z?=
 =?us-ascii?Q?IpqsaG8coLPudBbvcNJEcQ2hDq15N+vhvJ86VG1XdszrWSADL/KMQIjoyL87?=
 =?us-ascii?Q?Ra2c48FFXGKBjOb/YKcYe7tafpkIP0Ai3nd1t5B5sNd3tdPskOhtHvmH2ZjQ?=
 =?us-ascii?Q?MS58VSlQPw4lAwwrTDBpsW1R7yd79b1x6HVBjDLTbBvg1est/3Wts7pENH2f?=
 =?us-ascii?Q?0MQuHRXtIrislNjjE7VM/GNax49hmo2Z7UfGOipa8wNWO3MKCUFYacD8+xfN?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb4af5f-b44a-40d0-61ff-08dc6e400225
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 02:47:17.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrslR/0erwUOfCSozWb57C/adWPGhMgL3gP3zyKVF6z3fxxN+z7X1bGzmcfHDpoLHSrtWfzC8gRIUGCHoiNMog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "perf-sanity-tests.build_id_cache_operations.fail" on:

commit: 617824a7f0f73e4de325cf8add58e55b28c12493 ("perf parse-events: Prefer sysfs/JSON hardware events over legacy")
https://git.kernel.org/cgit/linux/kernel/git/acme/linux.git tmp.perf-tools-next

[test failed on linux-next/master f68868ba718e30594165879cc3020607165b0761]

in testcase: perf-sanity-tests
version: 
with following parameters:

	perf_compiler: clang



compiler: gcc-13
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


besides, we also noticed perf-sanity-tests.perf_stat_metrics_shadow_stat_test.fail
which can pass on parent.

5ccc4edfc2a98840 617824a7f0f73e4de325cf8add5
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     perf-sanity-tests.build_id_cache_operations.fail
           :6          100%           6:6     perf-sanity-tests.perf_stat_metrics_shadow_stat_test.fail



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405071043.d430a606-lkp@intel.com



2024-05-01 16:50:39 sudo /usr/src/linux-perf-x86_64-rhel-8.3-bpf-617824a7f0f73e4de325cf8add58e55b28c12493/tools/perf/perf test 77
 77: build id cache operations                                       : FAILED!


2024-05-01 16:52:45 sudo /usr/src/linux-perf-x86_64-rhel-8.3-bpf-617824a7f0f73e4de325cf8add58e55b28c12493/tools/perf/perf test 101
101: perf stat metrics (shadow stat) test                            : FAILED!



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240507/202405071043.d430a606-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

