Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602512AF16
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926655; cv=fail; b=e7VmLbnxict+W7bvgmghOLtvGym95sbvGCM/Vw40WaLbo4U9FUXI4gdglXZagi+vEaI+TcXsOx4zMULRKXu8YCrvgMr+kIK600gR7xqF4VtKJfB7b6A/h8uv8ihVBy2cy6HV5VAhFfIQF5b2LyT4BQA6IXKk/Urfl6ru59RoIKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926655; c=relaxed/simple;
	bh=Q6J05GkdvFv0IeGJDCbwjVbb7QWIR+ECKg6ecJ5cOW8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LKr559tIzWjPgCjmoNbyYODwLC3vvSTeWnfZU7L/8CWuSrEFnOCszHS/TwU1GAX4UzLfFuvVKDKBMBfCwiorMXGxcPSJ4muxJwzxa0MSo6swBwNicLePxNJ4RzipMyEYg/cMyxj/2oTb+5PQaGwUFj8UA8TxtdXWuE55mELZjL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mh/kgqCS; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mh/kgqCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719926652; x=1751462652;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Q6J05GkdvFv0IeGJDCbwjVbb7QWIR+ECKg6ecJ5cOW8=;
  b=Mh/kgqCS6MEHlsnvQ3Pfsp/hTUd+URDM3HWkCHOWErCuyexwxzuxNEdZ
   tx79hV8V7WSsXkUmMj/L8u5+qUOiz0262gWYZPkX9tMuv57VUEBXb+DgQ
   LWGmYaNEAEHvt29WiYvo50olmip9j9XF5i64SE5LtpJLrhHW8ZiqIuzq7
   noF3Z5Ep6gUo3PCxZyZ2V7c9pX/RgodofYBZrawJk+XErYTuf1nYMLGFX
   iJ42zYVmRj3IjG/0XUbDVZeUmRNPKrlB7um+nlF29CSAFwiTP276Gok+4
   cSLvw0dCaLO1mnLZa1YyyUbVHIIv/KEiILfBh9RCanqH4wUtzZWjeAmtE
   A==;
X-CSE-ConnectionGUID: HW05/wZzTdipMYT8lE6a5g==
X-CSE-MsgGUID: U4M6Pj1WTuucTWK3rHBheA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17231847"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17231847"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 06:24:12 -0700
X-CSE-ConnectionGUID: BdccqjpvShCIdA6FsfjzuQ==
X-CSE-MsgGUID: YX1ASiiOTlyZRgVNDY272Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="51091530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jul 2024 06:24:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 06:24:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 06:24:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 06:24:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 06:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoaa82z/7IzUIAQWUTkMtD9wWr9fkqyIWjtjHf+6Sv5JdZFdqv+XLxZ/LZVSOAepZGij2/BhHrH46uvAqZMMpK9oC7BF3qK/xZgL7A93zNG3bpapiVSKYFN5dBqSK0lGZ2uykGVW/QgMap4WaWH0w/ogOoJAAj0rNBnhCid0I6mvIPXRIaYNMMvV5cFDKa/b8uT2kAOW3FaeAkL58mO7Pc94TLAiqUeZBLujf4AHBsmb3YQpH5+xoCOCDKffSj4A9t3v5O1hCvXY0sI4CyT7XJW3YhvfZW3CKF8CodoKUQ2uvUbDGaLQQ5D+BJpZvnHa7aTFZOjDI1eaXX4rdZ4i8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5r1QyOpJsrRuG8+f81xGIQRJ5Gm/6Q2te+vAM1GWrM=;
 b=U/Ve1xkg/JUCso1wrSB32CQ3VrWc9VmaHouhwevIY4Zvf7iI8gH1XVJE77W+GURFm2C7D5/bpGcyDH1qH5KT9THhJp8e0cxf4gwXxREJWh81jKxGLjDxO7iCNAJZnESzKI+pAX18jnrq/O0ZWShb7CWgWAuUftAEMQVe3HejFaGkvgG2+SQBLJO54rI1GBIDXFPgsyjdWAfejJiHdNc48HekMdqQpxSaXJSsmbyzH0QiNBMqPKuaUaZsM9g6CMf0n6S9g5J2n+2Wijr8gEINfM6rAQzBjPpwk/3QlnFK+pM/kgMqlsMBvDK7D2gpiXASzdH8wb3m5xP9nJxTp0u1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 13:24:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 13:24:05 +0000
Date: Tue, 2 Jul 2024 21:23:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:task/work] [mm]  114226143b:  aim7.jobs-per-min
 -34.3% regression
Message-ID: <202407022125.93927b0e-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 1760a668-99f8-4234-1819-08dc9a9a3f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NvfwKSiUz11MgA0b6StQY5s93Dz0FcDszF/NQOKZOjGvW2zDSbXaocIa2B?=
 =?iso-8859-1?Q?FqqSwznfuoN6xWUcuV3Z+58YoP8Tpv+mpThlrXbkwrM9k/43jSdi8REbrz?=
 =?iso-8859-1?Q?NFSeso7JMxdvcB1mly79ZuMOpzPsj5dCd2FfMNKMj8EeO8sEG6HWK0GyYi?=
 =?iso-8859-1?Q?HuAVxyOjs9SzxV93qcSigSWOm4e/XLxCtL2O/vt6hS9cNQZe/FuADmZ9ID?=
 =?iso-8859-1?Q?MBa0eODcSQwg0egl4vdTmrTN68SxopKKS78Qpt+IE73cNT+rVfc/565Z57?=
 =?iso-8859-1?Q?GXFaG5spIAlltHFrDet7d7CVr4nCKFC2FxiXkvVQYMuxnm0WUk2UF91x0c?=
 =?iso-8859-1?Q?AaANuqJBZBHlSG0KF98xn+fVeQQSlYayD8FzKIn4mJw9D6GLpSheU8I0AE?=
 =?iso-8859-1?Q?38ioYKChMNZQuDFQ0+in3I/gx2IxQ3NsChSCwZNqZIeXKlMdGHLOYKX472?=
 =?iso-8859-1?Q?yys/9xZ8xVFL/KCieLHpp/MmC+n/LlTLEefk2fC1x4YurYvmbfyj6Of/Wh?=
 =?iso-8859-1?Q?TxClPL8KsGyrsgbPdGKBKHsxlYNfJySEVTPTIT1/F5q2wIMUNMPbrjm0Bi?=
 =?iso-8859-1?Q?ODTsQ6qSllzfqGzNXBfEm4FmDklqH2nqZFRDc0vgQ6V7zmGjdzisHIFjU9?=
 =?iso-8859-1?Q?XOnh5gF6uRT85g56k52EUBw8JsE0WYoUr0qs+U1QijWhjfJ4D8jWptz+hg?=
 =?iso-8859-1?Q?Jt5f07CfJGXWwwpP0pCdKX3jlheTkaKZ8xVWSJor9vYxuo3eccnWX3FV/s?=
 =?iso-8859-1?Q?usftmhcZizE5jub4Av/WhSnT2Gtm0y2UqwchflxxtVubIoOaerAGMiGKeE?=
 =?iso-8859-1?Q?7djAktHWxVpK6ne1v4hG+wBW9ak+4yL5vDEI4XcQ/ZB39O+E/XqmkXdEmu?=
 =?iso-8859-1?Q?mq0OFds8vYqSWg+/2VUF/mX29Wuz5zxcuiOBVA1OKSfG8h7SM8DTety7KR?=
 =?iso-8859-1?Q?WVO3LZ/LLH52rCc6fasOL3Zig9Ff9H0aQgSenSlFuzWe/MeI6+0Zzgf8U9?=
 =?iso-8859-1?Q?OocBtZXeWERkflUEbk01E/5alPOF+DOEmMDVK4Ugl47TrDVi70rluC8IPt?=
 =?iso-8859-1?Q?iOAVtrTL86LWcpvWq01az08N0Lse1Lk/FoWlGf5u99eapaUW3XRIKWWSG4?=
 =?iso-8859-1?Q?nN3+DG5cCCJZbcH+GIl4OXB6KK59bFLFEMNNI31Yr1nFaogrs87CXllBZP?=
 =?iso-8859-1?Q?olrPz1+xxn/UMMibB+f33VBLHFBeGNH1NuQPKUo6FNzvnZWU+udk6AVk+v?=
 =?iso-8859-1?Q?2cub+amkmHIGSeDKg0b+BH2ZBiD0+jEQJNlpeJtFsffWf9yZLO4JDHIKx9?=
 =?iso-8859-1?Q?PlUkeW06guStIQYopy8Oso1dg0x2j7U1/gCYjVy8rJIz7jDVKT/Smx3wM+?=
 =?iso-8859-1?Q?Bh+QIcbB3/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EShsXsO+XO5Bait6ASPkStcoorTE1RAbGslRo6feaV3gCrMrUSIBYv4zay?=
 =?iso-8859-1?Q?es5DQjnJkucvZa0RQEynuTbhbMLuabwhMivNsKiDdtT5YeBJ40EuP4+SGe?=
 =?iso-8859-1?Q?MUilDMsmHtZzUmPDppywm8rnQJiEtjEIzYhon8LMbO/Cs/j2hFELWvt/5/?=
 =?iso-8859-1?Q?toPzDN4LXhChyj3yikani/kr6rmDqh1euHA2/lnwG2KOptAmQ3jsXPUtgt?=
 =?iso-8859-1?Q?2wnlc+eXbj5OweEQHYsqQFd2ljTFXEWNV/kJMyjtHXukMDnTfWMaHbdZ0Y?=
 =?iso-8859-1?Q?YJPUALHgpK/ZNYj0wf8YBjJNW6grhUhkKjdfK5Py1iWiT/FdeEuIUvP1vT?=
 =?iso-8859-1?Q?EHPXoXqVOsR+gmDICP9P4KQgmdyeipxJ4hZhS6Zuyf/MX4/pDqEIRrWnfD?=
 =?iso-8859-1?Q?YXtJwm5sumtArcJDm4dHX1m6il0fd7xmbR5mgnYK5rLR9EzStA17G2rabZ?=
 =?iso-8859-1?Q?lRe385bDw0FsfWzf/8blY/G20+wngEMbqKHyRU3RrbLPVyBa/0PiIcXgKO?=
 =?iso-8859-1?Q?3zygmnLcVgjn1MtnQhywv7jXcx1FR/IWBdjmlKSqq4+ZORHm6jMEEdG3xo?=
 =?iso-8859-1?Q?sJlpbQCu0JHMgRWDFzzo9TL8+sLA28AGh96uXFm3og3j4C7e91MvzeJksk?=
 =?iso-8859-1?Q?0vpCPMWYFZ1tKWh8C6iDZum6OqEmEWFjzIsEpXpNV1yyCofCqG9ZdabWVL?=
 =?iso-8859-1?Q?1nMTOsL2/jHd5qATUKjR202aFt7juOCtPjAOQ+XZulIYm2qe4z8nj+lMGL?=
 =?iso-8859-1?Q?nJQk5FgcFstH+sc0m/Dkn/qnTp9ajMy9Gl3eQuuTUlfob8nRhO4VsE57F4?=
 =?iso-8859-1?Q?yofZiOPOqn+txwW5utOwMVplVXDQjJfsyDV39TTTB54GqKiPeaF2TCQU27?=
 =?iso-8859-1?Q?5klPbeDVhLQazc+6zy7pKRFO/GctMr/cngmDBejnGoDJwQMJO86oRT32pj?=
 =?iso-8859-1?Q?mwwNPUxQEMPdcuYXHV7fdbMRhg0IyGlOupblu9xvkkKnMqFfvy0SmXwuKH?=
 =?iso-8859-1?Q?DxukKyJ8SP05M74mMcnIBTHAfOsB7gwBYDNe6aOhwdqaNSdyZSW1dF365z?=
 =?iso-8859-1?Q?4OQAptDok/czd1V0W6nPdH+6zmz4/v1zh2BbAHE+nkm3BjmU+wg8FiGVyH?=
 =?iso-8859-1?Q?IO7uTxry4cuJnURDuMC3hAg+OC9WXv5ulzbcerfkslgPcQY/drrO3GF4xj?=
 =?iso-8859-1?Q?a44dDX04VoC3pHWI1+GvPkjENveKHSAQP87mDwdhdkL7kvWV+BdxPX+8Ku?=
 =?iso-8859-1?Q?zG68dBfNWUhKN7XcFzK8lMmwDGsEaNMwDJePcCUC6AMiSud3yJeLPvCp9l?=
 =?iso-8859-1?Q?c/95+g01xyZn2sjMT38L1KDYb5zKM1i+KVVI2yhvaZmnKTIbAh8kY8AK4x?=
 =?iso-8859-1?Q?y+fRK5IC4MCQJARZNS5HNQaz5XI1X2g7CbrR05MlNQ1NMgS8DCiI1M9AT6?=
 =?iso-8859-1?Q?O8Yod5BpmXtypFX15O9YJ1C7xDVfXi9mAMKgXiq2qi3x0PpcbmF/sfwXXo?=
 =?iso-8859-1?Q?HU86q4ZhCoP+aKAfvH8m05MjGfpNljuNAKpBM4XusWeORYpONRxUEURcft?=
 =?iso-8859-1?Q?U+fTg2gdWfRRgFaypwTj2anTwZB4r67ktiCXVwOba7BTi55QjUMAuPBJAH?=
 =?iso-8859-1?Q?UTgzTkynPFGxiwxiGiMb3WtDGPrsBxBKlOM8JOBNWWW/d9vMPLge9ZqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1760a668-99f8-4234-1819-08dc9a9a3f19
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:24:05.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntkwzYYpyNsI7hW9/TTni5jbcc4ptzfvBWJIeLmFXlMl3qqmImWztzlfUYrlPiQG5BQGIVpvv3S7wAM8Tn4ikw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -34.3% regression of aim7.jobs-per-min on:


commit: 114226143ba51560dc027f792f888ecfb53c46cb ("mm: Drain LRUs upon resume to userspace on nohz_full CPUs")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git task/work

testcase: aim7
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	disk: 1BRD_48G
	fs: ext4
	test: disk_rw
	load: 3000
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407022125.93927b0e-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240702/202407022125.93927b0e-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-13/performance/1BRD_48G/ext4/x86_64-rhel-8.3/3000/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/disk_rw/aim7

commit: 
  7d4aeaa3e2 ("sched/isolation: Introduce isolated task work")
  114226143b ("mm: Drain LRUs upon resume to userspace on nohz_full CPUs")

7d4aeaa3e25828a2 114226143ba51560dc027f792f8 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    250242 ±  6%     -13.7%     215896 ±  4%  cpuidle..usage
     13191 ± 12%     -24.7%       9930 ± 10%  sched_debug.cpu.nr_switches.max
    172.17 ±  7%     -38.8%     105.33 ± 33%  perf-c2c.DRAM.remote
     92.33 ± 11%     -37.9%      57.33 ± 32%  perf-c2c.HITM.local
     61.42           -30.1%      42.95 ±  7%  iostat.cpu.idle
     36.18           +52.5%      55.17 ±  5%  iostat.cpu.system
      2.40           -21.7%       1.88 ±  6%  iostat.cpu.user
     61.42           -30.0%      43.00 ±  7%  vmstat.cpu.id
     49.85 ±  3%     +82.8%      91.14 ±  7%  vmstat.procs.r
    171340           +59.5%     273298 ±  5%  vmstat.system.in
     57.87           -18.3       39.60 ±  8%  mpstat.cpu.all.idle%
      0.26 ±  5%      -0.1        0.15 ±  4%  mpstat.cpu.all.irq%
      0.05            -0.0        0.04 ±  5%  mpstat.cpu.all.soft%
     39.28           +19.0       58.28 ±  5%  mpstat.cpu.all.sys%
      2.54            -0.6        1.94 ±  6%  mpstat.cpu.all.usr%
    915185           -34.3%     601621        aim7.jobs-per-min
     19.86           +51.7%      30.12        aim7.time.elapsed_time
     19.86           +51.7%      30.12        aim7.time.elapsed_time.max
     18267 ±  6%    +763.4%     157723 ±  4%  aim7.time.involuntary_context_switches
      5512           +46.4%       8068        aim7.time.percent_of_cpu_this_job_got
      1047          +127.5%       2383        aim7.time.system_time
     26067 ±  2%     -29.1%      18475        aim7.time.voluntary_context_switches
    256411 ±  8%     +47.7%     378615 ± 10%  numa-meminfo.node0.Dirty
    257970 ±  8%     +47.5%     380459 ±  9%  numa-meminfo.node0.Inactive(file)
      6873 ± 19%    +887.8%      67901 ± 27%  numa-meminfo.node1.Active
      6108 ± 19%    +989.5%      66549 ± 28%  numa-meminfo.node1.Active(anon)
    256710 ±  9%     +34.1%     344135 ± 11%  numa-meminfo.node1.Dirty
    257860 ±  9%     +34.6%     347124 ± 11%  numa-meminfo.node1.Inactive(file)
     32611 ± 32%    +144.2%      79620 ± 22%  numa-meminfo.node1.Mapped
     20598 ±  5%    +732.0%     171385 ± 12%  numa-meminfo.node1.Shmem
     63944 ±  9%     +47.3%      94166 ±  9%  numa-vmstat.node0.nr_dirty
     64329 ±  9%     +47.0%      94583 ±  9%  numa-vmstat.node0.nr_inactive_file
     64357 ±  9%     +47.0%      94576 ±  9%  numa-vmstat.node0.nr_zone_inactive_file
     63939 ±  9%     +47.3%      94153 ±  9%  numa-vmstat.node0.nr_zone_write_pending
      1529 ± 19%    +989.7%      16665 ± 28%  numa-vmstat.node1.nr_active_anon
     64042 ±  9%     +33.7%      85623 ± 12%  numa-vmstat.node1.nr_dirty
     64326 ±  9%     +34.2%      86340 ± 12%  numa-vmstat.node1.nr_inactive_file
      8317 ± 32%    +142.9%      20205 ± 25%  numa-vmstat.node1.nr_mapped
      5181 ±  6%    +727.3%      42863 ± 12%  numa-vmstat.node1.nr_shmem
      1529 ± 19%    +989.7%      16665 ± 28%  numa-vmstat.node1.nr_zone_active_anon
     64329 ±  9%     +34.2%      86343 ± 12%  numa-vmstat.node1.nr_zone_inactive_file
     64021 ±  9%     +33.8%      85635 ± 12%  numa-vmstat.node1.nr_zone_write_pending
     10257          +596.7%      71461 ± 26%  meminfo.Active
      8566 ±  2%    +710.9%      69472 ± 27%  meminfo.Active(anon)
      1690 ±  4%     +17.6%       1988 ±  3%  meminfo.Active(file)
     32736 ±  8%     +30.9%      42839 ± 13%  meminfo.AnonHugePages
      1661 ±  5%     +17.2%       1946 ±  3%  meminfo.Buffers
   3689803            +9.8%    4052685        meminfo.Cached
    513625 ±  2%     +41.2%     725396 ±  8%  meminfo.Dirty
   1287173           +24.0%    1595607 ±  3%  meminfo.Inactive
    770828           +12.3%     865376        meminfo.Inactive(anon)
    516344 ±  2%     +41.4%     730231 ±  8%  meminfo.Inactive(file)
     48858          +128.0%     111378 ± 15%  meminfo.Mapped
     33401          +448.9%     183340 ± 11%  meminfo.Shmem
   8698635           +10.0%    9565125 ±  3%  meminfo.max_used_kB
      2144 ±  2%    +717.9%      17540 ± 27%  proc-vmstat.nr_active_anon
    422.79 ±  4%     +17.6%     497.19 ±  3%  proc-vmstat.nr_active_file
    128345 ±  2%     +40.5%     180270 ±  8%  proc-vmstat.nr_dirty
    922859            +9.8%    1013212        proc-vmstat.nr_file_pages
    192712           +12.4%     216678        proc-vmstat.nr_inactive_anon
    129006 ±  2%     +40.6%     181422 ±  8%  proc-vmstat.nr_inactive_file
     61952            -4.0%      59504 ±  3%  proc-vmstat.nr_kernel_stack
     12506          +129.9%      28751 ± 14%  proc-vmstat.nr_mapped
      8404          +453.5%      46518 ± 11%  proc-vmstat.nr_shmem
     38949            +6.8%      41608        proc-vmstat.nr_slab_reclaimable
      2144 ±  2%    +717.9%      17540 ± 27%  proc-vmstat.nr_zone_active_anon
    422.79 ±  4%     +17.6%     497.19 ±  3%  proc-vmstat.nr_zone_active_file
    192712           +12.4%     216678        proc-vmstat.nr_zone_inactive_anon
    129007 ±  2%     +40.6%     181422 ±  8%  proc-vmstat.nr_zone_inactive_file
    128344 ±  2%     +40.5%     180269 ±  8%  proc-vmstat.nr_zone_write_pending
    282.83 ±  6%  +22855.3%      64925 ± 50%  proc-vmstat.pgactivate
    361943           +12.9%     408660 ±  3%  proc-vmstat.pgfault
      1860         +4732.1%      89876 ±215%  proc-vmstat.pgpgout
     14611 ±  2%     +38.0%      20168 ±  5%  proc-vmstat.pgreuse
      1497            +4.3%       1560        proc-vmstat.unevictable_pgs_culled
      0.55 ± 15%     +52.5%       0.84 ±  8%  perf-stat.i.MPKI
  2.18e+10 ±  4%     -24.3%  1.649e+10 ±  4%  perf-stat.i.branch-instructions
  63885722 ±  3%     -10.5%   57182162 ±  9%  perf-stat.i.branch-misses
     13.58 ±  4%      +2.0       15.55 ±  2%  perf-stat.i.cache-miss-rate%
 5.297e+08 ±  4%     -11.6%   4.68e+08 ±  4%  perf-stat.i.cache-references
      1.04 ± 12%     +83.3%       1.90 ±  4%  perf-stat.i.cpi
 1.273e+11 ±  5%     +49.6%  1.905e+11 ±  4%  perf-stat.i.cpu-cycles
    930.71 ±  6%     -34.4%     610.28 ±  3%  perf-stat.i.cpu-migrations
 1.001e+11 ±  4%     -26.1%  7.393e+10 ±  4%  perf-stat.i.instructions
      1.11 ±  7%     -30.2%       0.77 ±  8%  perf-stat.i.ipc
     29.02 ± 42%     -90.2%       2.86 ± 76%  perf-stat.i.major-faults
     15634 ±  4%     -24.7%      11776 ±  2%  perf-stat.i.minor-faults
     15663 ±  4%     -24.8%      11779 ±  2%  perf-stat.i.page-faults
      0.71 ±  2%     +52.9%       1.09        perf-stat.overall.MPKI
      0.27 ±  2%      +0.1        0.33 ±  7%  perf-stat.overall.branch-miss-rate%
     13.49            +3.7       17.21        perf-stat.overall.cache-miss-rate%
      1.28          +102.4%       2.58        perf-stat.overall.cpi
      1787 ±  2%     +32.4%       2365        perf-stat.overall.cycles-between-cache-misses
      0.78           -50.6%       0.39        perf-stat.overall.ipc
 2.205e+10 ±  2%     -25.1%  1.652e+10 ±  3%  perf-stat.ps.branch-instructions
  59415550            -9.1%   54012442 ±  9%  perf-stat.ps.branch-misses
  72255500 ±  2%     +11.8%   80766752 ±  3%  perf-stat.ps.cache-misses
 5.355e+08 ±  2%     -12.4%  4.693e+08 ±  2%  perf-stat.ps.cache-references
    121710            +1.5%     123532        perf-stat.ps.cpu-clock
 1.291e+11 ±  2%     +48.0%   1.91e+11 ±  3%  perf-stat.ps.cpu-cycles
    916.09 ±  5%     -35.3%     593.16 ±  2%  perf-stat.ps.cpu-migrations
 1.012e+11 ±  2%     -26.9%    7.4e+10 ±  3%  perf-stat.ps.instructions
     26.70 ± 43%     -90.3%       2.59 ± 77%  perf-stat.ps.major-faults
     14300           -23.6%      10925        perf-stat.ps.minor-faults
     14327           -23.7%      10928        perf-stat.ps.page-faults
    121710            +1.5%     123532        perf-stat.ps.task-clock
 2.123e+12 ±  3%      +8.8%  2.311e+12 ±  3%  perf-stat.total.instructions
     47.02           -27.3       19.69        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     45.68           -26.6       19.11        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     39.63           -22.5       17.14        perf-profile.calltrace.cycles-pp.ext4_buffered_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.12           -20.8       13.28        perf-profile.calltrace.cycles-pp.generic_perform_write.ext4_buffered_write_iter.vfs_write.ksys_write.do_syscall_64
     15.47           -14.7        0.80 ± 12%  perf-profile.calltrace.cycles-pp.unlink
     15.46           -14.7        0.80 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
     15.46           -14.7        0.80 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
     15.45           -14.6        0.80 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
     15.44           -14.6        0.80 ± 12%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
     15.40           -14.5        0.86 ±  8%  perf-profile.calltrace.cycles-pp.creat64
     15.12           -14.5        0.58 ± 45%  perf-profile.calltrace.cycles-pp.down_write.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.40           -14.5        0.86 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
     15.40           -14.5        0.86 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
     15.11           -14.5        0.58 ± 45%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.do_unlinkat.__x64_sys_unlink.do_syscall_64
     15.38           -14.5        0.86 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
     15.38           -14.5        0.86 ±  8%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
     15.36           -14.5        0.84 ±  8%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.36           -14.5        0.84 ±  8%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64
     15.09           -14.5        0.57 ± 45%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.do_unlinkat.__x64_sys_unlink
     15.30           -14.5        0.82 ±  8%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
     14.76           -14.2        0.52 ± 44%  perf-profile.calltrace.cycles-pp.down_write.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
     14.75           -14.2        0.52 ± 44%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.open_last_lookups.path_openat.do_filp_open
     14.73           -14.2        0.52 ± 44%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.open_last_lookups.path_openat
     14.67           -14.2        0.50 ± 45%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.do_unlinkat
     14.32           -14.1        0.26 ±100%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.open_last_lookups
     16.74           -10.3        6.46        perf-profile.calltrace.cycles-pp.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.vfs_write.ksys_write
      8.50            -5.1        3.42        perf-profile.calltrace.cycles-pp.__filemap_get_folio.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.vfs_write
      8.01            -4.7        3.34        perf-profile.calltrace.cycles-pp.ext4_da_write_end.generic_perform_write.ext4_buffered_write_iter.vfs_write.ksys_write
      6.14            -3.6        2.51        perf-profile.calltrace.cycles-pp.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter.vfs_write
      6.27            -3.6        2.64        perf-profile.calltrace.cycles-pp.block_write_end.ext4_da_write_end.generic_perform_write.ext4_buffered_write_iter.vfs_write
      5.66            -3.5        2.16        perf-profile.calltrace.cycles-pp.llseek
      6.02            -3.5        2.54        perf-profile.calltrace.cycles-pp.__block_commit_write.block_write_end.ext4_da_write_end.generic_perform_write.ext4_buffered_write_iter
      3.44            -2.3        1.12        perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_get_folio.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      3.56            -2.1        1.46        perf-profile.calltrace.cycles-pp.mark_buffer_dirty.__block_commit_write.block_write_end.ext4_da_write_end.generic_perform_write
      2.70            -2.0        0.66        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      3.28            -2.0        1.27        perf-profile.calltrace.cycles-pp.truncate_cleanup_folio.truncate_inode_pages_range.ext4_evict_inode.evict.__dentry_kill
      3.14            -1.9        1.28        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.ext4_buffered_write_iter.vfs_write.ksys_write
      2.54 ±  2%      -1.8        0.70        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.ext4_buffered_write_iter.vfs_write.ksys_write
      3.12            -1.8        1.31        perf-profile.calltrace.cycles-pp.clear_bhb_loop.write
      2.21            -1.3        0.89        perf-profile.calltrace.cycles-pp.try_to_free_buffers.truncate_cleanup_folio.truncate_inode_pages_range.ext4_evict_inode.evict
      2.07            -1.3        0.80        perf-profile.calltrace.cycles-pp.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      2.01            -1.2        0.77        perf-profile.calltrace.cycles-pp.ext4_da_map_blocks.ext4_da_get_block_prep.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write
      1.96            -1.1        0.82        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.ext4_buffered_write_iter.vfs_write.ksys_write
      1.90            -1.1        0.79        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.llseek
      1.86            -1.1        0.77        perf-profile.calltrace.cycles-pp.zero_user_segments.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      1.80            -1.1        0.74        perf-profile.calltrace.cycles-pp.memset_orig.zero_user_segments.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write
      2.12            -1.0        1.13        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      1.69            -1.0        0.71 ±  2%  perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.ext4_buffered_write_iter.vfs_write
      1.68 ±  2%      -1.0        0.70        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      1.51 ±  4%      -1.0        0.55 ±  3%  perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.57            -0.9        0.66        perf-profile.calltrace.cycles-pp.clear_bhb_loop.llseek
      1.45            -0.9        0.56        perf-profile.calltrace.cycles-pp.__folio_mark_dirty.mark_buffer_dirty.__block_commit_write.block_write_end.ext4_da_write_end
      1.23            -0.7        0.54        perf-profile.calltrace.cycles-pp.create_empty_buffers.ext4_block_write_begin.ext4_da_write_begin.generic_perform_write.ext4_buffered_write_iter
      1.27            -0.6        0.66 ±  3%  perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.ext4_da_write_begin.generic_perform_write
      6.83            -0.4        6.46 ±  2%  perf-profile.calltrace.cycles-pp.__close
      6.82            -0.4        6.45 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      6.82            -0.4        6.45 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      6.81            -0.4        6.45 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      6.79            -0.4        6.44 ±  2%  perf-profile.calltrace.cycles-pp.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      6.76            -0.3        6.43 ±  3%  perf-profile.calltrace.cycles-pp.dput.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.75            -0.3        6.42 ±  3%  perf-profile.calltrace.cycles-pp.__dentry_kill.dput.__fput.__x64_sys_close.do_syscall_64
      6.71            -0.3        6.41 ±  2%  perf-profile.calltrace.cycles-pp.evict.__dentry_kill.dput.__fput.__x64_sys_close
      6.69            -0.3        6.40 ±  2%  perf-profile.calltrace.cycles-pp.ext4_evict_inode.evict.__dentry_kill.dput.__fput
      0.00            +1.2        1.16 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__find_get_block.bdev_getblk.__ext4_get_inode_loc
      0.00            +1.2        1.20 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock.__find_get_block.bdev_getblk.__ext4_get_inode_loc.ext4_get_inode_loc
      0.70 ±  7%      +1.2        1.91 ±  5%  perf-profile.calltrace.cycles-pp.__mark_inode_dirty.generic_update_time.file_modified.ext4_buffered_write_iter.vfs_write
      0.70 ±  7%      +1.2        1.92 ±  5%  perf-profile.calltrace.cycles-pp.generic_update_time.file_modified.ext4_buffered_write_iter.vfs_write.ksys_write
      0.00            +1.2        1.25 ±  5%  perf-profile.calltrace.cycles-pp.__find_get_block.bdev_getblk.__ext4_get_inode_loc.ext4_get_inode_loc.ext4_reserve_inode_write
      0.00            +1.2        1.25 ±  5%  perf-profile.calltrace.cycles-pp.bdev_getblk.__ext4_get_inode_loc.ext4_get_inode_loc.ext4_reserve_inode_write.__ext4_mark_inode_dirty
      0.62 ±  6%      +1.3        1.87 ±  5%  perf-profile.calltrace.cycles-pp.ext4_dirty_inode.__mark_inode_dirty.generic_update_time.file_modified.ext4_buffered_write_iter
      0.00            +1.3        1.26 ±  5%  perf-profile.calltrace.cycles-pp.__ext4_get_inode_loc.ext4_get_inode_loc.ext4_reserve_inode_write.__ext4_mark_inode_dirty.ext4_dirty_inode
      0.00            +1.3        1.26 ±  5%  perf-profile.calltrace.cycles-pp.ext4_get_inode_loc.ext4_reserve_inode_write.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty
      0.00            +1.3        1.28 ±  5%  perf-profile.calltrace.cycles-pp.ext4_reserve_inode_write.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty.generic_update_time
      0.00            +1.3        1.31 ±  5%  perf-profile.calltrace.cycles-pp.__ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty.generic_update_time.file_modified
      1.77 ±  2%      +2.7        4.48 ±  4%  perf-profile.calltrace.cycles-pp.folios_put_refs.truncate_inode_pages_range.ext4_evict_inode.evict.__dentry_kill
      1.23 ±  3%      +2.9        4.18 ±  4%  perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.truncate_inode_pages_range.ext4_evict_inode.evict
      0.88 ±  4%      +3.1        4.01 ±  4%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.truncate_inode_pages_range.ext4_evict_inode
      0.87 ±  4%      +3.1        4.01 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.truncate_inode_pages_range
      0.86 ±  4%      +3.1        4.00 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
     56.08           +32.5       88.54        perf-profile.calltrace.cycles-pp.write
     49.01           +37.0       85.99        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     48.56           +37.3       85.81        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00           +63.4       63.44        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
      0.00           +63.7       63.67        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_and_bh_lrus_drain
      0.00           +63.8       63.78        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_and_bh_lrus_drain.task_work_run
      0.00           +65.0       64.95        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_and_bh_lrus_drain.task_work_run.syscall_exit_to_user_mode
      0.00           +65.0       64.99        perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.lru_add_and_bh_lrus_drain.task_work_run.syscall_exit_to_user_mode.do_syscall_64
      0.00           +65.1       65.06        perf-profile.calltrace.cycles-pp.lru_add_and_bh_lrus_drain.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +65.2       65.18        perf-profile.calltrace.cycles-pp.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00           +65.7       65.69        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     30.88           -29.2        1.66 ± 10%  perf-profile.children.cycles-pp.down_write
     29.86           -28.6        1.25 ± 13%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     29.82           -28.6        1.24 ± 13%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
     29.00           -28.0        1.05 ± 14%  perf-profile.children.cycles-pp.osq_lock
     47.20           -27.4       19.82        perf-profile.children.cycles-pp.ksys_write
     45.85           -26.6       19.24        perf-profile.children.cycles-pp.vfs_write
     39.86           -22.6       17.23        perf-profile.children.cycles-pp.ext4_buffered_write_iter
     34.41           -21.0       13.44        perf-profile.children.cycles-pp.generic_perform_write
     15.47           -14.7        0.80 ± 12%  perf-profile.children.cycles-pp.unlink
     15.45           -14.7        0.80 ± 12%  perf-profile.children.cycles-pp.__x64_sys_unlink
     15.44           -14.6        0.80 ± 12%  perf-profile.children.cycles-pp.do_unlinkat
     15.46           -14.6        0.89 ±  8%  perf-profile.children.cycles-pp.do_sys_openat2
     15.42           -14.6        0.87 ±  8%  perf-profile.children.cycles-pp.path_openat
     15.42           -14.5        0.88 ±  8%  perf-profile.children.cycles-pp.do_filp_open
     15.40           -14.5        0.86 ±  8%  perf-profile.children.cycles-pp.creat64
     15.38           -14.5        0.86 ±  8%  perf-profile.children.cycles-pp.__x64_sys_creat
     15.30           -14.5        0.82 ±  8%  perf-profile.children.cycles-pp.open_last_lookups
     16.87           -10.4        6.51        perf-profile.children.cycles-pp.ext4_da_write_begin
      8.67            -5.1        3.52        perf-profile.children.cycles-pp.__filemap_get_folio
      8.12            -4.7        3.39        perf-profile.children.cycles-pp.ext4_da_write_end
      6.37            -3.7        2.68        perf-profile.children.cycles-pp.block_write_end
      6.19            -3.7        2.52        perf-profile.children.cycles-pp.ext4_block_write_begin
      6.09            -3.5        2.57        perf-profile.children.cycles-pp.__block_commit_write
      5.70            -3.3        2.41        perf-profile.children.cycles-pp.llseek
      4.75            -2.7        2.01        perf-profile.children.cycles-pp.clear_bhb_loop
      3.46            -2.3        1.12        perf-profile.children.cycles-pp.filemap_add_folio
      3.60            -2.1        1.48        perf-profile.children.cycles-pp.mark_buffer_dirty
      3.29            -2.0        1.28        perf-profile.children.cycles-pp.truncate_cleanup_folio
      2.68 ±  2%      -1.9        0.76        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      3.19            -1.9        1.31        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      1.82 ±  8%      -1.5        0.35 ±  2%  perf-profile.children.cycles-pp.ext4_file_write_iter
      1.50 ±  2%      -1.4        0.06 ± 14%  perf-profile.children.cycles-pp.folio_add_lru
      2.35            -1.4        0.99        perf-profile.children.cycles-pp.entry_SYSCALL_64
      2.24            -1.3        0.90        perf-profile.children.cycles-pp.try_to_free_buffers
      2.08            -1.3        0.80        perf-profile.children.cycles-pp.ext4_da_get_block_prep
      2.04            -1.3        0.78        perf-profile.children.cycles-pp.ext4_da_map_blocks
      2.05            -1.2        0.86        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      1.88            -1.1        0.78        perf-profile.children.cycles-pp.memset_orig
      1.87            -1.1        0.78        perf-profile.children.cycles-pp.zero_user_segments
      1.77            -1.0        0.75        perf-profile.children.cycles-pp.fault_in_readable
      2.21            -1.0        1.20        perf-profile.children.cycles-pp.filemap_get_entry
      1.74            -1.0        0.74        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.57 ±  4%      -1.0        0.58 ±  3%  perf-profile.children.cycles-pp.rw_verify_area
      1.46            -0.9        0.57        perf-profile.children.cycles-pp.__folio_mark_dirty
      1.34 ±  4%      -0.9        0.49 ±  3%  perf-profile.children.cycles-pp.security_file_permission
      1.47 ±  4%      -0.8        0.64        perf-profile.children.cycles-pp.__fdget_pos
      1.12 ±  4%      -0.8        0.31 ±  2%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      1.36            -0.8        0.56        perf-profile.children.cycles-pp.__cond_resched
      1.26            -0.7        0.52 ±  2%  perf-profile.children.cycles-pp.inode_needs_update_time
      1.14            -0.7        0.44        perf-profile.children.cycles-pp.folio_alloc_noprof
      1.24            -0.7        0.54        perf-profile.children.cycles-pp.create_empty_buffers
      1.12 ±  2%      -0.7        0.43 ±  2%  perf-profile.children.cycles-pp.folio_account_dirtied
      1.20            -0.7        0.51        perf-profile.children.cycles-pp.xas_load
      1.04 ±  6%      -0.7        0.37 ±  4%  perf-profile.children.cycles-pp.apparmor_file_permission
      1.08            -0.7        0.42        perf-profile.children.cycles-pp.alloc_pages_mpol_noprof
      1.06 ±  2%      -0.7        0.40        perf-profile.children.cycles-pp.__folio_cancel_dirty
      1.31            -0.6        0.67 ±  3%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.82            -0.6        0.20 ±  6%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      1.01 ±  2%      -0.6        0.41        perf-profile.children.cycles-pp.ext4_generic_write_checks
      0.91 ±  2%      -0.6        0.32 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.74            -0.6        0.15        perf-profile.children.cycles-pp.ext4_nonda_switch
      0.94            -0.6        0.36        perf-profile.children.cycles-pp.__alloc_pages_noprof
      1.46 ±  2%      -0.6        0.88 ±  2%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.99 ±  2%      -0.6        0.41        perf-profile.children.cycles-pp.ksys_lseek
      0.85 ±  2%      -0.6        0.29 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.94            -0.5        0.40        perf-profile.children.cycles-pp.kmem_cache_free
      0.96            -0.5        0.42        perf-profile.children.cycles-pp.folio_alloc_buffers
      0.87 ±  3%      -0.5        0.34        perf-profile.children.cycles-pp.folio_account_cleaned
      0.70 ±  3%      -0.5        0.22 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.83            -0.5        0.35        perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.69 ±  3%      -0.5        0.21 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.85            -0.5        0.38        perf-profile.children.cycles-pp.alloc_buffer_head
      0.80 ±  2%      -0.5        0.34        perf-profile.children.cycles-pp.generic_write_checks
      0.82            -0.5        0.36        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.82            -0.5        0.36 ±  3%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.76 ±  2%      -0.4        0.31 ±  4%  perf-profile.children.cycles-pp.disk_rw
      0.71            -0.4        0.27        perf-profile.children.cycles-pp.get_page_from_freelist
      0.72            -0.4        0.29        perf-profile.children.cycles-pp.up_write
      0.60 ±  3%      -0.4        0.16 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.57 ±  3%      -0.4        0.15 ±  2%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.68            -0.4        0.28        perf-profile.children.cycles-pp.xas_store
      0.54 ±  3%      -0.4        0.14 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.65            -0.4        0.27        perf-profile.children.cycles-pp.folio_unlock
      6.83            -0.4        6.46 ±  2%  perf-profile.children.cycles-pp.__close
      0.58            -0.4        0.21 ±  3%  perf-profile.children.cycles-pp.ext4_da_reserve_space
      6.81            -0.4        6.45 ±  2%  perf-profile.children.cycles-pp.__x64_sys_close
      0.60            -0.4        0.24        perf-profile.children.cycles-pp.rcu_all_qs
      6.79            -0.4        6.44 ±  2%  perf-profile.children.cycles-pp.__fput
      6.78            -0.3        6.43 ±  3%  perf-profile.children.cycles-pp.dput
      0.60 ±  2%      -0.3        0.26 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      6.75            -0.3        6.42 ±  3%  perf-profile.children.cycles-pp.__dentry_kill
      0.59            -0.3        0.27        perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.49 ±  2%      -0.3        0.19 ±  2%  perf-profile.children.cycles-pp.ext4_es_insert_delayed_block
      6.71            -0.3        6.41 ±  2%  perf-profile.children.cycles-pp.evict
      0.51            -0.3        0.21 ±  3%  perf-profile.children.cycles-pp.lookup_open
      6.69            -0.3        6.40 ±  2%  perf-profile.children.cycles-pp.ext4_evict_inode
      0.46            -0.3        0.19        perf-profile.children.cycles-pp.block_invalidate_folio
      0.37 ±  3%      -0.3        0.11        perf-profile.children.cycles-pp.sched_tick
      0.46            -0.3        0.20        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.42            -0.3        0.17 ±  2%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.43 ±  2%      -0.2        0.18        perf-profile.children.cycles-pp.x64_sys_call
      0.41            -0.2        0.17 ±  3%  perf-profile.children.cycles-pp.xas_start
      0.40 ±  2%      -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.ext4_es_lookup_extent
      0.42            -0.2        0.19        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.30 ±  4%      -0.2        0.07        perf-profile.children.cycles-pp.task_tick_fair
      0.39            -0.2        0.16 ±  3%  perf-profile.children.cycles-pp.file_remove_privs_flags
      0.38 ±  2%      -0.2        0.15 ±  2%  perf-profile.children.cycles-pp.timestamp_truncate
      0.42            -0.2        0.20 ±  7%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.38 ±  2%      -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.generic_write_check_limits
      0.34 ±  2%      -0.2        0.13 ±  2%  perf-profile.children.cycles-pp.__slab_free
      0.34            -0.2        0.14 ±  3%  perf-profile.children.cycles-pp.ext4_create
      0.29            -0.2        0.10 ±  3%  perf-profile.children.cycles-pp.node_dirty_ok
      0.34            -0.2        0.16 ±  9%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.32            -0.2        0.14        perf-profile.children.cycles-pp.find_lock_entries
      0.28 ±  3%      -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.aa_file_perm
      0.28            -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.31 ±  4%      -0.2        0.14 ±  7%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.27 ±  4%      -0.2        0.10 ±  4%  perf-profile.children.cycles-pp.inode_to_bdi
      0.26 ±  4%      -0.2        0.09 ±  4%  perf-profile.children.cycles-pp.mem_cgroup_commit_charge
      0.28            -0.2        0.11 ±  4%  perf-profile.children.cycles-pp.rmqueue
      0.29            -0.2        0.13 ±  2%  perf-profile.children.cycles-pp.mod_objcg_state
      0.26 ±  2%      -0.2        0.10        perf-profile.children.cycles-pp.__dquot_alloc_space
      0.26 ±  2%      -0.2        0.10 ±  4%  perf-profile.children.cycles-pp.free_unref_folios
      0.21 ±  2%      -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.ext4_claim_free_clusters
      0.23 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.folio_wait_stable
      0.27 ±  2%      -0.1        0.13 ±  3%  perf-profile.children.cycles-pp.vfs_unlink
      0.23 ±  3%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.23 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.jbd2_journal_try_to_free_buffers
      0.22 ±  3%      -0.1        0.08        perf-profile.children.cycles-pp.__es_insert_extent
      0.26 ±  2%      -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.ext4_unlink
      0.27 ±  2%      -0.1        0.13        perf-profile.children.cycles-pp.filemap_unaccount_folio
      0.24 ±  4%      -0.1        0.10 ±  3%  perf-profile.children.cycles-pp.write@plt
      0.26            -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.__ext4_unlink
      0.21            -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.folio_mapping
      0.19 ±  2%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__ext4_new_inode
      0.19 ±  2%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.amd_clear_divider
      0.20 ±  2%      -0.1        0.08        perf-profile.children.cycles-pp.ext4_llseek
      0.18 ±  2%      -0.1        0.07        perf-profile.children.cycles-pp.jbd2_journal_grab_journal_head
      0.16 ±  4%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.__count_memcg_events
      0.19            -0.1        0.08        perf-profile.children.cycles-pp.__xa_set_mark
      0.18 ±  3%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.drop_buffers
      0.13 ±  4%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.18 ± 10%      -0.1        0.08 ± 14%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.16 ±  2%      -0.1        0.06        perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
      0.18 ±  2%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.ext4_mark_iloc_dirty
      0.17 ±  2%      -0.1        0.07        perf-profile.children.cycles-pp.handle_softirqs
      0.19            -0.1        0.10 ±  4%  perf-profile.children.cycles-pp.__ext4_find_entry
      0.13            -0.1        0.05        perf-profile.children.cycles-pp.xas_find_conflict
      0.15 ±  2%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.ext4_do_update_inode
      0.14 ±  3%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.generic_file_llseek_size
      0.18            -0.1        0.10 ±  6%  perf-profile.children.cycles-pp.ext4_dx_find_entry
      0.14 ±  2%      -0.1        0.06        perf-profile.children.cycles-pp.ext4_add_nondir
      0.14 ±  3%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.rcu_core
      0.11 ±  3%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.__x64_sys_write
      0.13 ±  3%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.rcu_do_batch
      0.12 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.xas_clear_mark
      0.10 ± 14%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.aim_rand
      0.12 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.ext4_add_entry
      0.09 ±  7%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.__ext4_journal_stop
      0.12 ±  4%      -0.1        0.05        perf-profile.children.cycles-pp.ext4_dx_add_entry
      0.13 ±  2%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.ext4_lookup
      0.12 ±  3%      -0.1        0.06        perf-profile.children.cycles-pp.irq_exit_rcu
      0.11            -0.1        0.05        perf-profile.children.cycles-pp.ext4_fill_raw_inode
      0.10 ±  3%      -0.1        0.04 ± 45%  perf-profile.children.cycles-pp.ext4_search_dir
      0.17 ±  3%      -0.1        0.12 ±  4%  perf-profile.children.cycles-pp.try_charge_memcg
      0.14 ±  6%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp._raw_read_lock
      0.09 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.___slab_alloc
      0.08 ±  6%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.__ext4_read_dirblock
      0.10 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.48            +0.0        0.50        perf-profile.children.cycles-pp.lru_add_fn
      0.09 ±  5%      +0.0        0.13 ±  6%  perf-profile.children.cycles-pp.mem_cgroup_update_lru_size
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__put_user_8
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.invalidate_bh_lrus_cpu
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.task_work_add
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__get_user_8
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.__isolated_task_work_queue
      0.00            +0.2        0.18 ±  2%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.06 ±  8%      +0.2        0.28 ± 11%  perf-profile.children.cycles-pp.main
      0.06 ±  8%      +0.2        0.28 ± 11%  perf-profile.children.cycles-pp.run_builtin
      0.05 ±  7%      +0.2        0.28 ± 11%  perf-profile.children.cycles-pp.__cmd_record
      0.05 ±  7%      +0.2        0.28 ± 11%  perf-profile.children.cycles-pp.cmd_record
      0.03 ± 70%      +0.2        0.28 ± 11%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.00            +0.3        0.26 ± 11%  perf-profile.children.cycles-pp.record__pushfn
      0.00            +0.3        0.26 ± 11%  perf-profile.children.cycles-pp.writen
      0.02 ±141%      +0.3        0.28 ± 12%  perf-profile.children.cycles-pp.perf_mmap__push
      0.00            +0.3        0.27 ±  2%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.52            +0.9        1.43 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
      0.82 ±  6%      +1.1        1.96 ±  5%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.24            +1.1        1.38 ±  4%  perf-profile.children.cycles-pp.__ext4_mark_inode_dirty
      0.10 ±  4%      +1.2        1.30 ±  4%  perf-profile.children.cycles-pp.ext4_get_inode_loc
      0.14 ±  3%      +1.2        1.34 ±  4%  perf-profile.children.cycles-pp.ext4_reserve_inode_write
      0.10 ±  6%      +1.2        1.30 ±  4%  perf-profile.children.cycles-pp.__ext4_get_inode_loc
      0.70 ±  7%      +1.2        1.92 ±  5%  perf-profile.children.cycles-pp.generic_update_time
      0.11 ±  3%      +1.2        1.33 ±  4%  perf-profile.children.cycles-pp.bdev_getblk
      0.10 ±  4%      +1.2        1.32 ±  4%  perf-profile.children.cycles-pp.__find_get_block
      0.62 ±  6%      +1.3        1.87 ±  5%  perf-profile.children.cycles-pp.ext4_dirty_inode
      1.91 ±  2%      +2.9        4.76 ±  3%  perf-profile.children.cycles-pp.folios_put_refs
      1.27 ±  3%      +2.9        4.20 ±  4%  perf-profile.children.cycles-pp.__page_cache_release
     89.09            +6.2       95.34        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     88.46            +6.6       95.09        perf-profile.children.cycles-pp.do_syscall_64
     56.26           +33.0       89.30        perf-profile.children.cycles-pp.write
      1.53 ±  2%     +63.7       65.20        perf-profile.children.cycles-pp.folio_batch_move_lru
      0.13 ±  5%     +65.0       65.13        perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.90           +65.1       66.05        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.00           +65.3       65.29        perf-profile.children.cycles-pp.lru_add_and_bh_lrus_drain
      0.00           +65.4       65.42        perf-profile.children.cycles-pp.task_work_run
      1.88 ±  3%     +66.1       67.98        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.72 ±  4%     +66.3       68.04        perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      1.69 ±  4%     +67.2       68.88        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     28.77           -27.7        1.04 ± 14%  perf-profile.self.cycles-pp.osq_lock
      4.70            -2.7        1.98        perf-profile.self.cycles-pp.clear_bhb_loop
      3.13            -1.8        1.29        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      1.96 ±  2%      -1.5        0.48        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      1.78 ±  9%      -1.4        0.34 ±  3%  perf-profile.self.cycles-pp.ext4_file_write_iter
      2.25 ±  2%      -1.4        0.89        perf-profile.self.cycles-pp.vfs_write
      2.33            -1.3        1.04        perf-profile.self.cycles-pp.__block_commit_write
      1.96            -1.1        0.85        perf-profile.self.cycles-pp.mark_buffer_dirty
      1.85            -1.1        0.78        perf-profile.self.cycles-pp.memset_orig
      1.36 ±  2%      -1.0        0.38 ±  2%  perf-profile.self.cycles-pp.ext4_da_write_begin
      1.71            -1.0        0.73        perf-profile.self.cycles-pp.fault_in_readable
      1.69            -1.0        0.72        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.32            -0.8        0.52        perf-profile.self.cycles-pp.generic_perform_write
      1.40 ±  4%      -0.8        0.62 ±  2%  perf-profile.self.cycles-pp.__fdget_pos
      1.33            -0.8        0.54        perf-profile.self.cycles-pp.__filemap_get_folio
      1.34 ±  2%      -0.8        0.58 ±  6%  perf-profile.self.cycles-pp.write
      1.02 ±  4%      -0.8        0.28        perf-profile.self.cycles-pp.percpu_counter_add_batch
      1.21            -0.7        0.49        perf-profile.self.cycles-pp.ext4_da_write_end
      0.81            -0.6        0.19 ±  6%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.96            -0.6        0.40 ±  2%  perf-profile.self.cycles-pp.ext4_block_write_begin
      0.70            -0.6        0.14 ±  3%  perf-profile.self.cycles-pp.ext4_nonda_switch
      0.88            -0.5        0.36        perf-profile.self.cycles-pp.do_syscall_64
      0.73 ±  9%      -0.5        0.25 ±  5%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.85            -0.5        0.37        perf-profile.self.cycles-pp.xas_load
      0.75            -0.4        0.30        perf-profile.self.cycles-pp.__cond_resched
      1.16            -0.4        0.74        perf-profile.self.cycles-pp.filemap_get_entry
      0.67            -0.4        0.28        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.65 ±  4%      -0.4        0.26 ±  4%  perf-profile.self.cycles-pp.disk_rw
      0.66            -0.4        0.27        perf-profile.self.cycles-pp.down_write
      0.63            -0.4        0.25        perf-profile.self.cycles-pp.inode_needs_update_time
      0.64            -0.4        0.27        perf-profile.self.cycles-pp.up_write
      0.62            -0.4        0.25        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.60            -0.4        0.24        perf-profile.self.cycles-pp.folio_unlock
      0.61            -0.3        0.26        perf-profile.self.cycles-pp.llseek
      0.64            -0.3        0.29 ±  3%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.60 ±  2%      -0.3        0.26 ±  4%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.52            -0.3        0.20        perf-profile.self.cycles-pp.ext4_buffered_write_iter
      0.46 ±  2%      -0.3        0.18 ±  2%  perf-profile.self.cycles-pp.ksys_write
      0.46 ±  2%      -0.3        0.19 ±  2%  perf-profile.self.cycles-pp.generic_write_checks
      0.45            -0.3        0.18 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.48 ±  2%      -0.2        0.23 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.39            -0.2        0.15 ±  3%  perf-profile.self.cycles-pp.ext4_da_map_blocks
      0.39            -0.2        0.16 ±  3%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.46            -0.2        0.24        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.38            -0.2        0.16 ±  2%  perf-profile.self.cycles-pp.block_invalidate_folio
      0.37 ±  2%      -0.2        0.16 ±  3%  perf-profile.self.cycles-pp.x64_sys_call
      0.35            -0.2        0.14 ±  2%  perf-profile.self.cycles-pp.xas_store
      0.33 ±  2%      -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.file_remove_privs_flags
      0.32 ±  2%      -0.2        0.13        perf-profile.self.cycles-pp.timestamp_truncate
      0.32 ±  2%      -0.2        0.13 ±  2%  perf-profile.self.cycles-pp.security_file_permission
      0.32 ±  2%      -0.2        0.13        perf-profile.self.cycles-pp.__slab_free
      0.32 ±  2%      -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.xas_start
      0.31 ±  2%      -0.2        0.12 ±  3%  perf-profile.self.cycles-pp.block_write_end
      0.32 ±  2%      -0.2        0.13 ±  2%  perf-profile.self.cycles-pp.generic_write_check_limits
      0.30 ±  2%      -0.2        0.12 ±  4%  perf-profile.self.cycles-pp.file_modified
      0.28            -0.2        0.11        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.28            -0.2        0.11 ±  3%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.31 ±  2%      -0.2        0.15 ± 11%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.27            -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.mod_objcg_state
      0.24 ±  3%      -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.aa_file_perm
      0.27 ±  5%      -0.1        0.12 ±  7%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.23            -0.1        0.09        perf-profile.self.cycles-pp.rw_verify_area
      0.23 ±  2%      -0.1        0.09 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.22            -0.1        0.09        perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.23 ±  2%      -0.1        0.11 ±  3%  perf-profile.self.cycles-pp.find_lock_entries
      0.20 ±  3%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.20 ±  2%      -0.1        0.08        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.19            -0.1        0.07        perf-profile.self.cycles-pp.node_dirty_ok
      0.20 ±  4%      -0.1        0.08        perf-profile.self.cycles-pp.ext4_generic_write_checks
      0.19 ±  7%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.inode_to_bdi
      0.18 ±  2%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.create_empty_buffers
      0.16 ±  2%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.folio_account_dirtied
      0.18 ±  3%      -0.1        0.07        perf-profile.self.cycles-pp.jbd2_journal_grab_journal_head
      0.19 ±  2%      -0.1        0.08        perf-profile.self.cycles-pp.ksys_lseek
      0.18 ±  2%      -0.1        0.07        perf-profile.self.cycles-pp.drop_buffers
      0.18 ±  3%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__alloc_pages_noprof
      0.17 ±  3%      -0.1        0.07 ±  7%  perf-profile.self.cycles-pp.__dquot_alloc_space
      0.16 ±  3%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.folio_mapping
      0.59 ±  4%      -0.1        0.49 ±  3%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.17 ±  8%      -0.1        0.08 ± 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.16            -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.ext4_llseek
      0.12 ±  5%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.16 ±  3%      -0.1        0.06        perf-profile.self.cycles-pp.get_page_from_freelist
      0.17 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.15 ±  3%      -0.1        0.06        perf-profile.self.cycles-pp.folio_account_cleaned
      0.11 ±  3%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.folio_alloc_buffers
      0.12 ±  3%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.ext4_es_insert_delayed_block
      0.15            -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.kmem_cache_free
      0.14 ±  3%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.ext4_es_lookup_extent
      0.12 ±  4%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.13            -0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.13 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.rmqueue
      0.12 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.free_unref_folios
      0.12            -0.1        0.05        perf-profile.self.cycles-pp.generic_file_llseek_size
      0.14 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__page_cache_release
      0.14 ±  5%      -0.0        0.09 ± 11%  perf-profile.self.cycles-pp._raw_read_lock
      0.09            -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.folio_add_lru
      0.13 ±  2%      -0.0        0.10        perf-profile.self.cycles-pp.try_charge_memcg
      0.10            -0.0        0.07        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.07 ±  5%      -0.0        0.06        perf-profile.self.cycles-pp.__find_get_block
      0.08 ±  5%      +0.0        0.13 ±  6%  perf-profile.self.cycles-pp.mem_cgroup_update_lru_size
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.task_work_run
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__put_user_8
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.task_work_add
      0.23 ±  2%      +0.1        0.30        perf-profile.self.cycles-pp.lru_add_fn
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.__get_user_8
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.invalidate_bh_lrus_cpu
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.20 ±  2%      +0.1        0.30 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.folio_lruvec_lock_irqsave
      0.13 ±  5%      +0.1        0.26        perf-profile.self.cycles-pp.folio_batch_move_lru
      0.22 ±  2%      +0.2        0.38 ±  2%  perf-profile.self.cycles-pp.folios_put_refs
      1.68 ±  4%     +67.2       68.88        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

