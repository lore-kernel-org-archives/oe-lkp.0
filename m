Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F222FFF8D
	for <oe-lkp@lists.linux.dev>; Fri, 24 Apr 2026 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014623; cv=fail; b=GOXzQhoOtXLapGAeooVFRLJ1uEwBlj7gdS6EPob7qLPTnH9fd7V7sG/PS9y9Prq6WdBAgD1wEzoRoNwIaTHyjfT5riBR3XxlZQKFT0XXNvaK2ufKhXkVTi8HDXIlnkl11uWVazWPkVChIKF506aj7niMYbUfIwMETtDg5Xodjj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014623; c=relaxed/simple;
	bh=z+n0XV2bpNV1a0zzjYCW/xCoOkEWWiRQmKrfRilcRZY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=INxjvmOgLJE7REuRM+2GvOa7uv9B9fVZXDEI1LvN3Y5l5nL/jYN7+DXspmAuqFAQl1NCENuiABCfoO0xRVHHRXP8J2OToW12r+oSWyrSOWf/qxpv4LR7Id0xpZ73QtJ5kOc4BJXtuAEf9JyHGM0s0wjtf5c2/SRGBmE04bQGZhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O27iJJKW; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O27iJJKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777014621; x=1808550621;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=z+n0XV2bpNV1a0zzjYCW/xCoOkEWWiRQmKrfRilcRZY=;
  b=O27iJJKWwCbaY0xQkp+HLxI45Vhq/bl0+88fnDaYaJ6naiynlr/NLXle
   dsJcacO2ElRfJJle5q86nAWOUnU09EtQ+rjiBte2fyT3PAyayNtFafHJq
   IQyfaIWYDe9Js6vq0X+K8pGpg1FdlIfedlOlJSGJWIiyjKhhJpBdMfjS6
   BjTbvHj++D0lJmGzOgLDx5jekFDg+zejpapTTTcQ/fz/m0mW6+TjNdZuc
   kW2B7Vnxk65UrLIxBqNhFkYNcr3sWdeSH/4f3N0Zy6iPUtYnDW49koecv
   j91SuFoxmb6MJiSLRFEOzjETYA8z8lR0aAPKhb5Z91x1Ri+whwK+fHoQB
   w==;
X-CSE-ConnectionGUID: Q1WWI9klQom7MQR4yovhfQ==
X-CSE-MsgGUID: pVi6lNJdR+KILGFZbIyyYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81852996"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81852996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 00:10:21 -0700
X-CSE-ConnectionGUID: DI7CfbezQumva/ynSrRg+w==
X-CSE-MsgGUID: BOt0V4kWTlOtCxx99OGhBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="228317402"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 00:10:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 00:10:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 00:10:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 00:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGEHxcee1vJyd4z+ReEgkMNFpNh4ZGR8rvuYnNpFyDXfNFzoeuOFWSJPweILDuuCzu6RmH7r6oVtTxG3twkPsjH7zoi9ufOKZztDeOiWbh/J2wNahG6x/GhsMRx5JAKjBAPIS5KFMmNKKTR6cUMukhEqfNzXO0uIGaRolaRyTIOt+3FhoDFNSCc5lFJ29CEGOAPfweGvtFfN323uS/BMXjgMULo4fY8YMlxO6r4+KeZFK28FHSUGzam5xmLLmMvGl4+pcL77ikKDuLGD7b1zFnJBmquWipF6rQrgg0qV++zqz+Naj6tE9vWoCIRW6JzH1Qkd6342Fh64NyG92LtEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6umdVLi7I6hipFXRSCsM3iJNpoULl7eVzbtEK8vteM=;
 b=Jl+rYA7k8qJZtRxgOfdIOucDFTKPxJVQ3N04eeWRvnIqlm74P1MTrMdqReyx445v3RzI+mD5YAppivgG9nRCm9TUeKCmpywkcHOaOrrVqvqXjd1h4CGzrd5b/hyDDrKbNZfY+S9zLdozD2fWZeZ0wdsQxL/ethU/Wq76iCKVA1r95B6X7qypReSo+ux1oJM4AXakDBP7lVFTV/mId8OYYP/Mp0Re2n6znDSW9S+3PgYNgF51ApJ/rASsbN7M6Z9fMOWGwZrkLCpbW+DZZnT2lff6ADQw1A9uBkIWPjGYwbNtJcTdk+zp/1yHHemQCeLnG42npbALCf34ZAQsuc4MVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Fri, 24 Apr
 2026 07:10:16 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:10:15 +0000
Date: Fri, 24 Apr 2026 15:10:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched]  96d1610e0b: will-it-scale.per_process_ops
 2.8% regression
Message-ID: <202604241448.365c92f9-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0044.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::18) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|MN6PR11MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: e68dee91-a760-4467-7e91-08dea1d088f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: xURCjOkGCWuf5hjizPWtz3NwNVae1BSgejx2SSqIIoVMaaAlZzUvGcujhCpL0t2BpKdcT+o9H6VBDwviwi3olGKAFVT3N2YaXB0IohfKswb8s/PssxeURN0SlvAqv5GmWW5VP3zSci7a5Nv9UtYrgERM6uNXe1b8/yavt/vZ8DRivovEED+TqVtqv//pwM03yqS6n2jA9Sfl5IJpHnAmBHnphfPxlE2QL0+CFSqvAwefkK5yblIYvI0NVbOHf7yzzAJnwDzSqHRjP1EcC6/LYnEntxfCjG10rWDThaRZFEGdMNlueDY56/1jYJ3ehFQbMJTlw5vbCn28Au/mnRZ3HvG8ubsOSNkPRb3k6uU0ZEYUUW69qua0oWKJH1FcbQoyLq/6tY2sktqk+VthIR8NkolflRXHhr3uxsOYIxehZV45JkcteWLgMIbGo5rI1N8U4ai2zFz6qepdom7inSCSiTTUEJyPKDzRqBgbwcNxfEgsPpiZ05rSWn7G0CgFjq0BLKFYmsvEk+OEDgXg2upL62H5SGiXZxt2ygHKrAOv8OucLB6bsPy8GmU7yJyXYPBMZ72xx0g7EGg5zZ0K4eHOogN6TQEdH67N6LtAOF+0tT76JAfTU1tpaSjFM9lFhHyT/RgE/DTt8GTi1IiJdvmmVaHAk9AvTb7V9tluVNdAFd8Sq9SVKCgGoQrlfy4IZ3xH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3/9AtXgzDWoPzeHpvDK7h2txGJwlE7CHM+dgZoVII57CEIehtvHfflvhqR?=
 =?iso-8859-1?Q?br469veZ+U7m3G/9wf7dG5cYPLB98oyU1aM3rISEgpjUnDkKgZbZbN/Ey/?=
 =?iso-8859-1?Q?h9CXOaAgaQiIykcchLqKbbGvjHHvzO8M3usvJ2zZw4I9htslsf4QPXqqwp?=
 =?iso-8859-1?Q?UFr8huiVoPaTyQSgAgO+r/VpVkQwHoPbkw0GQxPRDgAhYGyQasZdG9nbZi?=
 =?iso-8859-1?Q?5C8UUZ/0vmJ+D/oiDv2591Mps/z4jTuVQp222wUIuLBolqM1PWa8FxAjdY?=
 =?iso-8859-1?Q?sIfj+nt9mjslAlWQiiRXmm77wI2jihRn2k4SDJgYsULHFOY6xBj1Acz5bn?=
 =?iso-8859-1?Q?SKffd1R8jgr/VNBhDhAmVF6xXsVafzWxll5yuVjxTci3J7Kx696LGNvLkL?=
 =?iso-8859-1?Q?5YUAU9sXuT7KUv+AoXMzasBeJffC8o4evFqXJlMByA+XoinktgAOe8mHKD?=
 =?iso-8859-1?Q?zivHP7hu5148zJ0GSs5pq3e9YT5na19zFWoPyO3oTGNDMlLikB2B5jzypJ?=
 =?iso-8859-1?Q?tFfjKhamSWHKBlTWWh5Bn3YRV6RAcazDw6keiuSTMMi8Q2D1zpaNUx5QRS?=
 =?iso-8859-1?Q?khM1neR05dL6jjKhBr92JNTZJq/lwaTH2YYMK7S3QvzKXuHuyIsLNp+Fzn?=
 =?iso-8859-1?Q?6hL5LKZbrvZSS51Rdfdz/53t5dlGlUX43h86eyt//JJKA2k+39YHIAMbq0?=
 =?iso-8859-1?Q?GRRmCfRjC4jJSNzzJbIBSN8W98lNwn1NJyz22+TvNMn+T2GqMtfXPrjm6U?=
 =?iso-8859-1?Q?OEtiEUj9V2LQ3MK/mA5q6MiZcmCW0i63WVAxEnOqXP7QLWT8YjRQy2mGFJ?=
 =?iso-8859-1?Q?8dy+HcWpcB0JJHQhsU62lkkH6gT/D7NSX89qzhDQmrMifNCvn+37OSqap7?=
 =?iso-8859-1?Q?L65J0ob3L27qfyibbXjwTvpXd5N+gpveqd2/jTOHzeL6ASkGBGdMdax46r?=
 =?iso-8859-1?Q?dEI9QI1MjtbeP/+kbG/jQf+XyCNoEsVfANTx9tVYDChg8kQX7/zWQz5qvs?=
 =?iso-8859-1?Q?2hgKdGDtx9ZTcHnbEjqOl/JnpRLoZM/ZvAQSlZ1zCTRLTDHxmfZpGhBd07?=
 =?iso-8859-1?Q?f/lBGYlIGEhWKcEO5qqfZ5BHITtVtrqcdAm1U3tMUCvWAPUfHJCz5aRLRY?=
 =?iso-8859-1?Q?AV44AybJFeJWVJlJ2TtWGgsBWbk+xHXRQskYwxa8UYLnoBiTuDFVm38ED9?=
 =?iso-8859-1?Q?JYkEC8MFLGD7+UbdLjD0BhT/MbCqVX58FtHfNzQ5pa/Q4a5tOpUBJauFex?=
 =?iso-8859-1?Q?KNtW6wHYOU1xAjsQaQj4C9UnQqTi5hSp0U+KQi21ryrkqv0o+qbRCKoXgY?=
 =?iso-8859-1?Q?+mzaGpIQfbAz5RmYr3NmTUnskDLigEDN2OUZozGcr7LxAvpUS0Cbt9g0ud?=
 =?iso-8859-1?Q?+Pe4Fc4cZvzri8+NEq3bkJzYl3MOUcjZFHfCgdWs6urqvZbkCX6Uxbflg0?=
 =?iso-8859-1?Q?Fz2g9xQUTGeNPb5vDj+JnuATx9i3yv26B0IFEwJmebAWO3v+fk5MgO2QIv?=
 =?iso-8859-1?Q?7iXzcpKn7RW0XVZBI1eVUxf7r4Z8rHrGOa2WetofqV4oAFnY9Q8VeXUrCE?=
 =?iso-8859-1?Q?Cv+F31+6jM7LOExCVr2fS/S3LXFbQAm23beJjncrR+riz7dkiNqWtTsIpE?=
 =?iso-8859-1?Q?XeJnAiWePBsjLCwCm+YYgGhPoMft2Kvxl2jSw9AbpKlAJVu7NRpY+kXrQX?=
 =?iso-8859-1?Q?NrQMcTSvkZoPJuSojfbb1x6ySaR3A/UuR7JUtiQ8f8o2exrbbE+MMR9BuT?=
 =?iso-8859-1?Q?np+1FGG/UyhTTgQcZCSE9cGZc2z0CDRJdfvsOHErQLO6iWxV1MkollBRK/?=
 =?iso-8859-1?Q?tKfJSmNcWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: orrMy5m5gBFBKmfFGAWoN7hdzbjx4/kO2M8j+sU7eDzBbJeg6Jh2foXkkmx6q3EvbrUfh9+QtzGxk9bi4xeGUI7/7BdFJJoefTmnOodPDdgDTXla7Ay6wZHar50y02WSwQBBjiD28DoAJnjBZImaP8VXAtm2c+PgAKkG1FpkqU1MwKm3p9jArslGFND1gu1NvqwwbGTmPAeynGD9sp8Mash8iYwcRGpDUNVWANeqK5cbVHpztRXJeH2D109CQI4G/UVAe8JaIhmwa1JWYWN2z4qu7gevcjKSYSDZYvEU7SlKn8dkctJ+WRwpG7aOCMrKmr6wsk+O56vfcBtWLiPfFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e68dee91-a760-4467-7e91-08dea1d088f7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 07:10:15.8682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ph7vESKRCc0oAwEFn5590DEHnvL814fDawieS8Zx26Kjr0UjY4jB10zuphXZU9hPWMnldOMPZcep008nBtGF4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.8% regression of will-it-scale.per_process_ops on:


commit: 96d1610e0b20b5a627773874b4514ae922ad98f6 ("sched: Optimize hrtimer handling")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2]
[still regression on linux-next/master 936c21068d7ade00325e40d82bfd2f3f29d9f659]
[still regression on fix commit        eef9f648fb0e92618041f019d4bdcf7ae17cb743]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
parameters:

	nr_task: 100%
	mode: process
	test: context_switch1
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604241448.365c92f9-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260424/202604241448.365c92f9-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/context_switch1/will-it-scale

commit: 
  c3a92213eb ("sched: Use hrtimer_highres_enabled()")
  96d1610e0b ("sched: Optimize hrtimer handling")

c3a92213eb3dd8ea 96d1610e0b20b5a627773874b45 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  11427219            -2.8%   11104140        will-it-scale.48.processes
    238066            -2.8%     231335        will-it-scale.per_process_ops
  11427219            -2.8%   11104140        will-it-scale.workload
  11248988            -2.7%   10943054        vmstat.system.cs
 1.394e+10            -2.3%  1.362e+10        perf-stat.i.branch-instructions
  1.94e+08            -1.8%  1.906e+08        perf-stat.i.branch-misses
  98548808 ±  5%     +24.2%  1.224e+08 ±  5%  perf-stat.i.cache-references
  11359604            -2.7%   11053971        perf-stat.i.context-switches
  6.86e+10            -2.3%  6.705e+10        perf-stat.i.instructions
      0.49            -2.4%       0.48        perf-stat.i.ipc
    236.66            -2.7%     230.29        perf-stat.i.metric.K/sec
      2.04            +2.5%       2.09        perf-stat.overall.cpi
      0.49            -2.5%       0.48        perf-stat.overall.ipc
 1.389e+10            -2.3%  1.357e+10        perf-stat.ps.branch-instructions
 1.933e+08            -1.8%  1.899e+08        perf-stat.ps.branch-misses
  98259743 ±  5%     +24.2%   1.22e+08 ±  5%  perf-stat.ps.cache-references
  11321664            -2.7%   11016986        perf-stat.ps.context-switches
 6.837e+10            -2.3%  6.683e+10        perf-stat.ps.instructions
 2.077e+13            -2.4%  2.028e+13        perf-stat.total.instructions
      3.02            -0.1        2.90        perf-profile.calltrace.cycles-pp.pick_task_fair.pick_next_task_fair.__pick_next_task.__schedule.schedule
      3.79            -0.1        3.68        perf-profile.calltrace.cycles-pp.perf_pmu_sched_task.__perf_event_task_sched_out.prepare_task_switch.__schedule.schedule
      5.13            -0.1        5.04        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.exit_to_user_mode_loop
      2.72            -0.1        2.64        perf-profile.calltrace.cycles-pp.put_prev_entity.pick_next_task_fair.__pick_next_task.__schedule.schedule
      2.87            -0.1        2.79        perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.anon_pipe_read.vfs_read
      5.27            -0.1        5.19        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.exit_to_user_mode_loop.do_syscall_64
      1.82            -0.1        1.76        perf-profile.calltrace.cycles-pp.perf_pmu_sched_task.finish_task_switch.__schedule.schedule.anon_pipe_read
      1.41            -0.1        1.35        perf-profile.calltrace.cycles-pp.__switch_to
      0.84            -0.0        0.79 ±  2%  perf-profile.calltrace.cycles-pp.anon_pipe_buf_release.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      1.64            -0.0        1.59        perf-profile.calltrace.cycles-pp.intel_pmu_disable_all.perf_pmu_sched_task.__perf_event_task_sched_out.prepare_task_switch.__schedule
      0.56            -0.0        0.52 ±  2%  perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.38            -0.0        1.34        perf-profile.calltrace.cycles-pp.update_curr.pick_task_fair.pick_next_task_fair.__pick_next_task.__schedule
      0.64            +0.0        0.67        perf-profile.calltrace.cycles-pp.os_xsave
      1.25            +0.0        1.30        perf-profile.calltrace.cycles-pp.__switch_to_asm
      2.62            +0.1        2.68        perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.__pick_next_task.__schedule.schedule
      3.19            +0.1        3.27        perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.exit_to_user_mode_loop.do_syscall_64
      0.62 ±  3%      +0.1        0.70 ±  3%  perf-profile.calltrace.cycles-pp.___perf_sw_event.prepare_task_switch.__schedule.schedule.exit_to_user_mode_loop
      0.65 ±  3%      +0.1        0.73 ±  5%  perf-profile.calltrace.cycles-pp.___perf_sw_event.prepare_task_switch.__schedule.schedule.anon_pipe_read
      1.78 ±  2%      +0.1        1.86        perf-profile.calltrace.cycles-pp.switch_fpu_return.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.58 ±  3%      +0.1        0.67 ±  2%  perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.anon_pipe_write.vfs_write.ksys_write
      3.27            +0.1        3.37        perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.anon_pipe_read.vfs_read
      1.38            +0.1        1.48 ±  2%  perf-profile.calltrace.cycles-pp.copy_page_from_iter.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      1.34 ±  3%      +0.2        1.51 ±  7%  perf-profile.calltrace.cycles-pp.update_curr.wakeup_preempt_fair.wakeup_preempt.try_to_wake_up.autoremove_wake_function
      1.08 ±  7%      +0.2        1.29 ± 10%  perf-profile.calltrace.cycles-pp.update_se.update_curr.wakeup_preempt_fair.wakeup_preempt.try_to_wake_up
      1.78 ±  3%      +0.2        2.00 ±  6%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task
      2.18            +0.2        2.41 ±  3%  perf-profile.calltrace.cycles-pp.wakeup_preempt_fair.wakeup_preempt.try_to_wake_up.autoremove_wake_function.__wake_up_common
      2.58            +0.2        2.82 ±  2%  perf-profile.calltrace.cycles-pp.wakeup_preempt.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      1.33 ±  6%      +0.3        1.59 ±  9%  perf-profile.calltrace.cycles-pp.update_se.update_curr.dequeue_entity.dequeue_entities.dequeue_task_fair
      3.38 ±  2%      +0.3        3.65 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
      4.35 ±  2%      +0.3        4.66 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
      5.12            +0.3        5.44 ±  2%  perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.anon_pipe_read.vfs_read
      4.79 ±  2%      +0.3        5.12 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.anon_pipe_read
     20.64            +0.4       21.01        perf-profile.calltrace.cycles-pp.schedule.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.6        0.57 ±  7%  perf-profile.calltrace.cycles-pp.do_perf_trace_sched_stat_runtime.perf_trace_sched_stat_runtime.update_se.update_curr.wakeup_preempt_fair
      0.00            +0.6        0.60 ±  7%  perf-profile.calltrace.cycles-pp.perf_trace_sched_stat_runtime.update_se.update_curr.wakeup_preempt_fair.wakeup_preempt
      0.00            +0.6        0.63 ± 12%  perf-profile.calltrace.cycles-pp.read
      0.00            +0.7        0.69 ±  2%  perf-profile.calltrace.cycles-pp.do_perf_trace_sched_stat_runtime.perf_trace_sched_stat_runtime.update_se.update_curr.dequeue_entity
      0.00            +0.7        0.71 ±  2%  perf-profile.calltrace.cycles-pp.perf_trace_sched_stat_runtime.update_se.update_curr.dequeue_entity.dequeue_entities
      7.45            -0.2        7.26        perf-profile.children.cycles-pp.perf_pmu_sched_task
      9.62            -0.1        9.48        perf-profile.children.cycles-pp.__pick_next_task
      3.09            -0.1        2.98        perf-profile.children.cycles-pp.pick_task_fair
      5.78            -0.1        5.68        perf-profile.children.cycles-pp.finish_task_switch
      2.88            -0.1        2.78        perf-profile.children.cycles-pp.put_prev_entity
      1.03            -0.1        0.94        perf-profile.children.cycles-pp.__perf_event_task_sched_in
      0.29 ±  3%      -0.1        0.21 ±  4%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      3.20            -0.1        3.12        perf-profile.children.cycles-pp.intel_pmu_disable_all
      0.30            -0.1        0.22 ±  4%  perf-profile.children.cycles-pp.propagate_entity_load_avg
      0.40            -0.1        0.34 ±  5%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.67            -0.1        0.60 ±  3%  perf-profile.children.cycles-pp.security_file_permission
      1.60            -0.1        1.54        perf-profile.children.cycles-pp.__switch_to
      1.01            -0.1        0.96 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      1.18            -0.1        1.12 ±  2%  perf-profile.children.cycles-pp.__pick_eevdf
      1.73 ±  2%      -0.1        1.67        perf-profile.children.cycles-pp.avg_vruntime
      1.00 ±  2%      -0.1        0.95        perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.65 ±  4%      -0.1        0.60 ±  2%  perf-profile.children.cycles-pp.update_entity_lag
      0.84            -0.0        0.80 ±  2%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.60 ±  2%      -0.0        0.56        perf-profile.children.cycles-pp.vruntime_eligible
      0.42 ±  2%      -0.0        0.39 ±  2%  perf-profile.children.cycles-pp.__x64_sys_read
      0.56            -0.0        0.53        perf-profile.children.cycles-pp.update_rq_clock_task
      0.18 ±  3%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.perf_cgroup_switch
      0.11 ±  6%      -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.81            -0.0        0.78        perf-profile.children.cycles-pp._raw_spin_lock
      0.60 ±  2%      -0.0        0.57        perf-profile.children.cycles-pp.native_sched_clock
      0.34 ±  2%      -0.0        0.31 ±  4%  perf-profile.children.cycles-pp.child
      0.17 ±  4%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.pick_next_task
      0.97            -0.0        0.95        perf-profile.children.cycles-pp.update_rq_clock
      0.16 ±  3%      -0.0        0.14 ±  4%  perf-profile.children.cycles-pp.dequeue_task
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rdx
      0.27 ±  2%      +0.0        0.29 ±  3%  perf-profile.children.cycles-pp.place_entity
      0.65            +0.0        0.67 ±  2%  perf-profile.children.cycles-pp.os_xsave
      0.08 ±  6%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.raw_spin_rq_unlock
      0.09 ±  5%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.rb_next
      0.11 ± 16%      +0.0        0.15 ± 15%  perf-profile.children.cycles-pp.perf_swevent_event
      0.35 ±  2%      +0.0        0.40        perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      2.72            +0.1        2.77        perf-profile.children.cycles-pp.set_next_entity
      1.18            +0.1        1.24        perf-profile.children.cycles-pp.update_load_avg
      0.09 ±  6%      +0.1        0.16 ±  6%  perf-profile.children.cycles-pp.kill_fasync
      1.31            +0.1        1.38        perf-profile.children.cycles-pp.__switch_to_asm
      1.78 ±  2%      +0.1        1.87        perf-profile.children.cycles-pp.switch_fpu_return
      0.59 ±  3%      +0.1        0.68 ±  2%  perf-profile.children.cycles-pp._copy_from_iter
      1.40            +0.1        1.49 ±  2%  perf-profile.children.cycles-pp.copy_page_from_iter
      1.04            +0.1        1.14        perf-profile.children.cycles-pp.__update_load_avg_se
      1.29 ±  3%      +0.2        1.45 ±  4%  perf-profile.children.cycles-pp.___perf_sw_event
      6.50            +0.2        6.69        perf-profile.children.cycles-pp.prepare_task_switch
      2.34            +0.2        2.59 ±  2%  perf-profile.children.cycles-pp.wakeup_preempt_fair
      2.78            +0.3        3.03 ±  2%  perf-profile.children.cycles-pp.wakeup_preempt
      3.43 ±  2%      +0.3        3.70 ±  2%  perf-profile.children.cycles-pp.dequeue_entity
      4.39 ±  2%      +0.3        4.70 ±  2%  perf-profile.children.cycles-pp.dequeue_entities
      5.13            +0.3        5.45 ±  2%  perf-profile.children.cycles-pp.try_to_block_task
      4.80 ±  2%      +0.3        5.14 ±  2%  perf-profile.children.cycles-pp.dequeue_task_fair
      5.64            +0.3        5.99 ±  4%  perf-profile.children.cycles-pp.update_curr
      0.34 ±  9%      +0.3        0.68 ± 11%  perf-profile.children.cycles-pp.read
      0.64            +0.4        1.06        perf-profile.children.cycles-pp.strnlen
      1.38 ±  4%      +0.4        1.81 ±  3%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      1.30 ±  4%      +0.4        1.73 ±  3%  perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      3.76 ±  5%      +0.5        4.24 ±  7%  perf-profile.children.cycles-pp.update_se
     36.56            +0.5       37.10        perf-profile.children.cycles-pp.schedule
      1.01 ±  3%      -0.2        0.86 ±  7%  perf-profile.self.cycles-pp.try_to_wake_up
      1.82 ±  4%      -0.1        1.68 ±  6%  perf-profile.self.cycles-pp.vfs_write
      0.60            -0.1        0.52 ±  2%  perf-profile.self.cycles-pp.put_prev_entity
      3.18            -0.1        3.10        perf-profile.self.cycles-pp.intel_pmu_disable_all
      0.28 ±  3%      -0.1        0.20 ±  3%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      1.54            -0.1        1.46        perf-profile.self.cycles-pp.__switch_to
      0.25            -0.1        0.18 ±  4%  perf-profile.self.cycles-pp.propagate_entity_load_avg
      0.30 ±  4%      -0.1        0.23 ±  3%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.65            -0.1        0.58 ±  4%  perf-profile.self.cycles-pp.security_file_permission
      1.70            -0.1        1.64        perf-profile.self.cycles-pp.avg_vruntime
      0.82            -0.1        0.76        perf-profile.self.cycles-pp.__perf_event_task_sched_in
      0.31 ±  3%      -0.1        0.25 ±  2%  perf-profile.self.cycles-pp.__wake_up_common
      0.96            -0.0        0.91        perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.70            -0.0        0.65 ±  2%  perf-profile.self.cycles-pp.__pick_eevdf
      0.80            -0.0        0.75 ±  2%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.56 ±  2%      -0.0        0.52 ±  2%  perf-profile.self.cycles-pp.vruntime_eligible
      0.59 ±  2%      -0.0        0.55        perf-profile.self.cycles-pp.native_sched_clock
      0.50            -0.0        0.46        perf-profile.self.cycles-pp.update_rq_clock_task
      0.53            -0.0        0.50 ±  2%  perf-profile.self.cycles-pp.pick_task_fair
      0.88            -0.0        0.85        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.18 ±  3%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.perf_cgroup_switch
      0.67 ±  2%      -0.0        0.64 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.11 ±  6%      -0.0        0.08        perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.40            -0.0        0.37 ±  2%  perf-profile.self.cycles-pp.__x64_sys_read
      0.30 ±  3%      -0.0        0.27 ±  5%  perf-profile.self.cycles-pp.child
      0.18 ±  5%      -0.0        0.15 ±  4%  perf-profile.self.cycles-pp.update_rq_clock
      0.15 ±  3%      -0.0        0.13 ±  5%  perf-profile.self.cycles-pp.pick_next_task
      0.08 ±  5%      -0.0        0.07 ±  7%  perf-profile.self.cycles-pp.enqueue_entity
      0.16 ±  3%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp.dequeue_task
      0.07 ±  6%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.rb_next
      0.07 ±  7%      +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.raw_spin_rq_unlock
      0.24 ±  3%      +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.ksys_read
      0.64            +0.0        0.67 ±  2%  perf-profile.self.cycles-pp.os_xsave
      0.12 ±  6%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp.enqueue_task
      0.71 ±  2%      +0.0        0.75        perf-profile.self.cycles-pp.pick_next_task_fair
      0.55            +0.0        0.59 ±  2%  perf-profile.self.cycles-pp.__enqueue_entity
      0.02 ±141%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rdx
      0.10 ± 15%      +0.0        0.14 ± 12%  perf-profile.self.cycles-pp.perf_swevent_event
      0.45 ±  3%      +0.0        0.50 ±  3%  perf-profile.self.cycles-pp.switch_fpu_return
      0.30 ±  3%      +0.0        0.35 ±  2%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.46            +0.1        0.51        perf-profile.self.cycles-pp.dequeue_entities
      0.06 ±  7%      +0.1        0.13 ±  6%  perf-profile.self.cycles-pp.kill_fasync
      1.30            +0.1        1.37        perf-profile.self.cycles-pp.__switch_to_asm
      0.38 ±  4%      +0.1        0.46 ±  2%  perf-profile.self.cycles-pp._copy_from_iter
      0.80 ±  4%      +0.1        0.89 ±  2%  perf-profile.self.cycles-pp.prepare_task_switch
      0.67 ±  2%      +0.1        0.78 ±  3%  perf-profile.self.cycles-pp.dequeue_entity
      1.01            +0.1        1.11        perf-profile.self.cycles-pp.__update_load_avg_se
      0.57 ±  2%      +0.1        0.68 ±  2%  perf-profile.self.cycles-pp.wakeup_preempt_fair
      0.48 ±  2%      +0.2        0.70 ±  2%  perf-profile.self.cycles-pp.schedule
      0.21 ±  7%      +0.3        0.52 ±  5%  perf-profile.self.cycles-pp.read
      0.63            +0.4        1.05        perf-profile.self.cycles-pp.strnlen




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

