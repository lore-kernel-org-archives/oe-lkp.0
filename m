Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973D137C2A
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 05:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734673952; cv=fail; b=DagIs8TB8L+4BnuiOwc2vUS1pnBjpYb7xvwo/Nolsa9yrZvhzqpzoCDq0ou8DJkdfRcQrIyYk64gJL7AlC6UjbEeLm9OqXecFY1zVspja4ImV3bESV1Zf+9B9su0b/DOzk2kK27pZfi8tLWd6rgX6RI9ymj9WKXqP197Vao+sng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734673952; c=relaxed/simple;
	bh=n/BKBOm7urkHesZe0czJTC+hZJBTZBMPccEErSp+Bj8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iuMK636CHJRJ5UI11fnn8KVAn+xx+emuVUYmZbKOnogNSbmYExRLyiik1wmcU9XkbDy0y8NSFnUHq4Xkj2/fV/BDVdGmPZttEe+dAGdzbbLPlkiJzmiiQwmFl5R1vgwJeXopO9d678w6ZUONsbCwqUYNI9wKa3L5sR5+6V0/Ovc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvQGTeqE; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvQGTeqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734673949; x=1766209949;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=n/BKBOm7urkHesZe0czJTC+hZJBTZBMPccEErSp+Bj8=;
  b=EvQGTeqEcrDab0v5ahBUqnBtlCFKEaMV/z1FfRi74KDVyPJKvNSf1E55
   /SvPgK72T/WIIuDlF+q+9bWeCfp5WRxLxsWLhAthejUjOJJ9PvXNwivZu
   27o8j2k7b7l68MCoBiVmF/HE1xsJ+Cn4u1NJ9O0kw3GOuYjcDvxOE8ebS
   vuU/Rk/vsnoHcjHl+kncaIrSh12CxnDykAeMlZ9OZ6xyCDl68I3j/vxrK
   EsK4ra0hhGb69ZPt2g/5yORThtkcOhTGRhTTsn/A0lbNONDyPxQpN0spd
   j0M54xe5JLEwL8n9BefmhGhp/ni/jecWoanEYuDv22NsEazfpCI8rPVT3
   A==;
X-CSE-ConnectionGUID: ySCeVHNESP+Y9MH62LLmhA==
X-CSE-MsgGUID: 7vme3lzERBSeIc6PZ2Tb9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34498081"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="34498081"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 21:52:27 -0800
X-CSE-ConnectionGUID: FkiIL682QZC1DilrC28PJw==
X-CSE-MsgGUID: 4U5pqYXYQsObZsk8wc1JbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103034330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 21:52:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 21:52:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 21:52:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 21:52:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1T1nW95VbMfS97QXOLYsyfBmGVtW5F7e9GYv2+zeYJTmmSyqm47XbiiEtK0X4zW/H4QZW2RKIWstg3vki2wA6xsS3guGCux590Mf/Yv/RKhYQ8FHsU+gbFYjosxA85SXrUuptSCKpNGnRPNWojAuNvSQGIAQlKbnuWepdvYJlOJi/1kR3dTe0KaTAKt1NxLPpDqqnsfuVYMo/21v9mbbmoYp/gEkGMR+43mAse+6gRj65eYrjhrnALwkhDVliX8y9n8Ljrv+IxGt9VDEOztphepW5bO4SAYgp90bh7q8/fs4fuqEZUUADNPqB3JPmywl85i/S7KFHa6l0eQkobh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrhvkR7FZuCsNaNlY/gDKQTVj74CUHmUH3iKerh7Ino=;
 b=GJSRNVuK5v0StUqk76XfP2pmB6tUbZ5sPAK4c8FNlJaHE2t/DeKLAK7bn9XSRLiwxKfTkqLg/DhuwUV3yjxcZl41u5/CaTFlg0rcPttc2VUl4xgS0/KmFN6PqXAYMVfk4pkJGMNZbljm3beiXqpzfDayNe8h6p3xWM0aKBvkmZ8om7N4VsnUbg+LnnHVPwTJsVbzGAym3TPmTW5WynUIZ+Rn8IOjrAoSepZ2MRnPaYxdw5l7IVKwuMj79UyHFfPGAPEvecZk989kXaoGbTiPeQFN37feyPTVsQbIKKPg7qAeG1xO+NzqLLEUcZwGYEyS+7DStVdOvGqUjLkcgCZRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 05:51:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:51:51 +0000
Date: Fri, 20 Dec 2024 13:51:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v4.5] [futex]  40d4ad3aa9:
 will-it-scale.per_process_ops -1.5% regression
Message-ID: <202412201150.44b0c84f-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 4958b508-cada-488b-e911-08dd20ba66bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MxLMjX3ZmqPUhRI3LkBUZt03AnH2ANaINmXWGPubwOwy4AXBlJS5dY2mxx?=
 =?iso-8859-1?Q?BWKnE7Rtb7pMT8P87s232HRGEmgxPf5TMsfWwpypmJP6hZN4YD3Cvm2moF?=
 =?iso-8859-1?Q?JBwL4948sfQepBP9SL495ecAAo1nVr1hW9t78mIOz1nsEnndm7tzA+yaZU?=
 =?iso-8859-1?Q?S/41mMFC+Bqsj9D6OlHJwfkfe+K5NvUrFs5Dj4ZoqYaGDL1ks3WRF2/Gj4?=
 =?iso-8859-1?Q?nKqjspNfqwRPcshBNhPjlcBJws7fwOKp8dqSG4qfTqP90msAbKP50kyEkJ?=
 =?iso-8859-1?Q?ct6HAFdZsPbJH5Ltl8M5hUIYyJX4dJJw3dMKOjpgkMAJ+7dhaMtfkPMoEe?=
 =?iso-8859-1?Q?1LsL1G6i5RFhDpeXw4Wn3jMaPWMh8xWqs9h0dDtWe6I1KuCLhb8+0fljem?=
 =?iso-8859-1?Q?4sIORHfDwTOxB/P7kbh4Ee6mhH8IwqWf24dzM5Y29hEHvI75/Gqt5m4NZA?=
 =?iso-8859-1?Q?N8+dYmQ9+RDKaz1RehGpmYqroYn0rE9blSu8MClc+/E6FpV2y2yBSwUC5X?=
 =?iso-8859-1?Q?Up7Qg2QcMFCqv1bQ4CAjfJ+MUo4cbHPOSWmpfd1dhcujO4T2nqUAmhJKZ2?=
 =?iso-8859-1?Q?I7w+hWn0sJ4mP0BQ3cVZJv1cBcaK+66IQ44F1w4kXUQHwphehbJZ2ur/PQ?=
 =?iso-8859-1?Q?x326dx7wDnHBUhFSUmK6FIYpxcMG6MvbFJdWZsB0uSxXYPxjL6RHyz/b0L?=
 =?iso-8859-1?Q?06vKm2YWqCv0VvWPd1jwLGqypoSTWrCLGhls8vgwPNCz0yzWAHJdQBdwFd?=
 =?iso-8859-1?Q?hPYWZsjOC5qvpGqDmfcIR2skcDHtqXIguOF/cTGjkl+AXwr9cN+Ozzg9uc?=
 =?iso-8859-1?Q?Lr5GJ/+ghel3BCblDGeXaSbeOEIH7aGE4zI6Dy/a7RlmzLnWozmAICWsf4?=
 =?iso-8859-1?Q?PXGkRgju17DxjihIc6atyZNiAKdEx1sUs1xSosXHKkDvXcnfI7vjsN0pdy?=
 =?iso-8859-1?Q?66v5e8HgbOsZUUVIGktqeUR5AYwr0dh+9LiFbeeC1eKY6hQ9S5vN+Y2wGS?=
 =?iso-8859-1?Q?FWTFhMXRs5xbz8g8czzYv9KPLU04UnR9jZDO3c4/hFvF6EClA5PGqiDK2d?=
 =?iso-8859-1?Q?zGU6ZcPN32bq1i66d0ZI9gBqsOk7NfqNNcaRjaL+rG6un+R8UY0ZGvvB2O?=
 =?iso-8859-1?Q?tw01PP/0kBoHc++0Q8dhBo90a5dRpEsyGB0bRQFIa7J6T1TFb+5h88c+Eq?=
 =?iso-8859-1?Q?y5NbVIs4S0Q/rKssbRBhp8llVcLXFzxB9q5/vF2pbVXI85ckI15L3v0b8Z?=
 =?iso-8859-1?Q?L6jQ8ZiFA/KfWPVnHY+WLKlaaHeWQ53X3y5kItiUaNMhQ++w9vhd83pDn2?=
 =?iso-8859-1?Q?ws7hyCbejID6OVpFaeLJaDwIAhGuKVVVI66cLiNAiP1kpsSoKIVn/SP3Fn?=
 =?iso-8859-1?Q?KVrx78BZLoJIE//SiuIq1K/V47/m133e/DDwENOIGyfpdtmkEF6DTdSXlc?=
 =?iso-8859-1?Q?nkmvSH5tgf6kmQZ+R8TCnvvm1W/u/LIDt3yffw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gTi9klNnfAAuAOi03jeZHaJIy4+DwWvYJzSV/v04Iqoh765e2RpBtMvg/P?=
 =?iso-8859-1?Q?1ocWnrjDa+Qqa02avqXXcXfMQAcSF6XETgxaV/BzaxZ3PPS5m8pBYD2iM8?=
 =?iso-8859-1?Q?+WYuQvyBUIdbYUFbE2pV9LqO5HFgHAGwEB7qYFqZ75EREGJmmedwUmwFat?=
 =?iso-8859-1?Q?PFjKG69SDqwicQ074mt+s/F2p578keZe2n9NWnuVChxJVvCE/Nxhrs394I?=
 =?iso-8859-1?Q?a2ePWC9xReKypjdMU7Mu6tjFalDb8U+znRmCmE+2raWSFXzCnGio+dFKxv?=
 =?iso-8859-1?Q?sMfQb4Q9hdzF6WWGG2XVNqV2kKZwequIutKhJ9qZv21ghwVfu9EO5K1M+t?=
 =?iso-8859-1?Q?JhmsUmIZHTd+WXMeRPV3Zt7a/Aj2tt8Z21J5qL0vAaFlDM8YUiHitPmRdB?=
 =?iso-8859-1?Q?ZJnx13oMVZWFObw+7TljZlZjGi6N19bDqZNid7XyBTjvePTiJSavAi9uHG?=
 =?iso-8859-1?Q?dYNsW2iwcgjt5FSElWFQ/5IHG3eqPnySa5eDUX5s4uhccb78UNlrD5K+CU?=
 =?iso-8859-1?Q?+GWul9QJPp+WR8haHfBkACBFmLF5XfUC7O644L8jMIAkbGMoBbi6nCP3TA?=
 =?iso-8859-1?Q?mXKgM/SL1YTJtAM2nl8hwa6rlSVpp8VRTVGT/QDRQHAK+byT1evppgkOWQ?=
 =?iso-8859-1?Q?Ovkx9i0RjG6h//y4wU7Omebzk347rmkfHjA6UfZVihQFVIV293J7KMxmRJ?=
 =?iso-8859-1?Q?XzuLpITpKT2LgKsElvZcvnEjFOxlmVMq7jOdKLzBPjAXMEUWpU4d5cppKU?=
 =?iso-8859-1?Q?hz0FGneQA5woyFQIbQ1hxE60YwpXW8GqXup84iiZX9tOK5FV4A4ZFgBrPD?=
 =?iso-8859-1?Q?Bf99tyal1v4VH3R6HzlkbDT58O771LLYJtPKYSA62Zvz7VaUcRWopWQQ8d?=
 =?iso-8859-1?Q?AzeAoQEOFPczdfwduPCpxsVsKi7ZSgCjvDy2hA8ZOcqV5yittlaJpa9pFt?=
 =?iso-8859-1?Q?cYCdHlJjdu1f5W74Q1TvgsrLpZ5vFfkMw++4WwedBeHnF4O/6655lUS/6A?=
 =?iso-8859-1?Q?trjsqdJUobwjP5vlfAgTt2ntaImzP3EG1bImyQpKHluAC4dc+qOD5peYrz?=
 =?iso-8859-1?Q?aDiOLploqmUEbc2nkkAkcJVTbMn8KGdGIcJ92StuV+6JO2JRlo7HGZC3YK?=
 =?iso-8859-1?Q?ziudvccFlS25coo+v6L1/Lg1R1NBb3EhiAUe/WrgVexomvfnhyhPdbZmWe?=
 =?iso-8859-1?Q?ii4jkgJdNhzXmeDjp5NmRMWImtdKLBd+g/Ia/8/zXJCiwO2Paz0y/raa+A?=
 =?iso-8859-1?Q?8zmarZfJoOz9MXuAsyX1h5oDIK89tMe1ediS/iEZUbs6KsqetFS03AlDdJ?=
 =?iso-8859-1?Q?UE9Jluoklk9t1hzNyAp9S7AbWJa6GTM14u8T1qQ9hkbKJWBKvsK7YJEjXa?=
 =?iso-8859-1?Q?WCEJ56zvypkSVHO82P15xAKVF3OBdZ3u62Qtmay52uy+S1oNS+F8xbd8kJ?=
 =?iso-8859-1?Q?OOM+Qbe6Oksn6PiLJP2N4auvVuDkRkSlpt9f1VgrS5c0NqSPyScFa/Yt2n?=
 =?iso-8859-1?Q?C2dKR7GzuB2+18StX43Zs8TjY3T4GoZOIutZnWO71goSQu7QdKes3c1M7N?=
 =?iso-8859-1?Q?c1yGM56FDdKUjWCF7wn11g3Ph/3JNRz/924IxqoqTQkzIMry2A3v9zl7Uv?=
 =?iso-8859-1?Q?i5AX0UYd6HxzT3be8Hjil4isx+8pMA1ZjIF0LJQi89WYdw7jp6I1RYZw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4958b508-cada-488b-e911-08dd20ba66bd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 05:51:51.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzHVipDHcUur+JnHfht+tEq4sJmWVWebVK+sZIB0tyJb09wuU/av6QRZM6hKYfkToxDsLokm1EVzY7EsUc5/4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -1.5% regression of will-it-scale.per_process_ops on:


commit: 40d4ad3aa9b6cc1645e51d06dadca2f39fc72e9d ("futex: Allow to re-allocate the private hash bucket.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v4.5

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 100%
	mode: process
	test: futex4
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201150.44b0c84f-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201150.44b0c84f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/futex4/will-it-scale

commit: 
  6df37a9175 ("futex: Track the futex hash bucket.")
  40d4ad3aa9 ("futex: Allow to re-allocate the private hash bucket.")

6df37a9175b23326 40d4ad3aa9b6cc1645e51d06dad 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     69392            +3.3%      71650 ±  2%  proc-vmstat.pgreuse
      3.90 ± 12%     -24.9%       2.93 ± 11%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      5.38 ± 46%     -45.5%       2.93 ± 11%  perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
 8.647e+08            -1.5%  8.519e+08        will-it-scale.224.processes
   3860048            -1.5%    3803174        will-it-scale.per_process_ops
 8.647e+08            -1.5%  8.519e+08        will-it-scale.workload
  12155063            +4.2%   12670995        perf-stat.i.branch-misses
      0.01            +0.0        0.01        perf-stat.overall.branch-miss-rate%
    232479            +1.6%     236278        perf-stat.overall.path-length
  12071157            +4.1%   12562572        perf-stat.ps.branch-misses
      5.68            -0.4        5.25        perf-profile.calltrace.cycles-pp.futex_hash.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
     20.74            -0.2       20.57        perf-profile.calltrace.cycles-pp.clear_bhb_loop.syscall
     15.38            -0.2       15.20        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
      2.99            -0.1        2.91        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wait_setup.__futex_wait.futex_wait.do_futex
      5.10            -0.1        5.03        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      3.46            -0.1        3.40        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.68            -0.0        0.66        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.62            -0.0        0.60        perf-profile.calltrace.cycles-pp.testcase
      1.87            +0.1        2.00        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     42.14            +0.2       42.38        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     31.98            +0.3       32.28        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
      0.17 ±141%      +0.3        0.50        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
     55.81            +0.4       56.16        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     53.27            +0.4       53.64        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     11.77            +0.7       12.51 ±  2%  perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      5.73            -0.4        5.32        perf-profile.children.cycles-pp.futex_hash
     20.88            -0.2       20.70        perf-profile.children.cycles-pp.clear_bhb_loop
      9.86            -0.1        9.75        perf-profile.children.cycles-pp.entry_SYSCALL_64
      3.14            -0.1        3.04        perf-profile.children.cycles-pp.get_futex_key
      5.22            -0.1        5.14        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.47            -0.1        3.41        perf-profile.children.cycles-pp.futex_q_unlock
      5.83            -0.1        5.78        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.74            -0.0        0.72        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.72            -0.0        0.70        perf-profile.children.cycles-pp.testcase
      1.09            -0.0        1.07        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.49            +0.0        2.52        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.05 ± 45%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      2.10            +0.2        2.30        perf-profile.children.cycles-pp.x64_sys_call
     35.43            +0.2       35.64        perf-profile.children.cycles-pp.futex_wait
     42.58            +0.2       42.81        perf-profile.children.cycles-pp.__x64_sys_futex
     32.18            +0.3       32.47        perf-profile.children.cycles-pp.__futex_wait
     56.23            +0.3       56.58        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     12.23            +0.4       12.62 ±  2%  perf-profile.children.cycles-pp.futex_q_lock
     53.59            +0.4       53.98        perf-profile.children.cycles-pp.do_syscall_64
      5.48            -0.3        5.20        perf-profile.self.cycles-pp.futex_hash
      9.00            -0.2        8.79        perf-profile.self.cycles-pp.futex_wait_setup
     20.76            -0.2       20.58        perf-profile.self.cycles-pp.clear_bhb_loop
      3.04            -0.1        2.93        perf-profile.self.cycles-pp.get_futex_key
      5.58            -0.1        5.51        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      8.70            -0.1        8.64        perf-profile.self.cycles-pp.syscall
      3.30            -0.1        3.24        perf-profile.self.cycles-pp.futex_q_unlock
      4.34            -0.1        4.29        perf-profile.self.cycles-pp.entry_SYSCALL_64
      4.45            -0.1        4.40        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      2.70            -0.0        2.65        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.64            -0.0        0.62        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.71            -0.0        0.69        perf-profile.self.cycles-pp.testcase
      0.28            +0.0        0.30        perf-profile.self.cycles-pp.futex_setup_timer
      2.44            +0.0        2.48        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.02 ±141%      +0.0        0.06 ± 13%  perf-profile.self.cycles-pp.ktime_get
      3.72            +0.1        3.82        perf-profile.self.cycles-pp.do_syscall_64
      4.47            +0.2        4.62        perf-profile.self.cycles-pp.__futex_wait
      1.96            +0.2        2.14        perf-profile.self.cycles-pp.x64_sys_call
      3.20            +0.7        3.89 ±  4%  perf-profile.self.cycles-pp.futex_q_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

