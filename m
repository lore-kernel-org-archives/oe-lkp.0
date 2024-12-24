Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E013D503
	for <oe-lkp@lists.linux.dev>; Tue, 24 Dec 2024 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029265; cv=fail; b=UbByI+gUk3zuyyjqqyli4bSYJNJ8xlCld2n3C5mOvQq+nYzublWR4/dnKlshgQoMWdQTkQB/m1vEtU/9e5gvj3eXqWmdAKcO8X7NTUNzWdAgc+M60LpHJhCnWnCSfXUeBLTAhOx97KUgj5fxqg2dtG/mi42VmwArRUEfe3xT61I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029265; c=relaxed/simple;
	bh=teBanZaGhbGMdbpTb9LoJ3F7AN7uNIux3xQWwps7KMQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=L/viHYWB75527++SX5rVttPv5OBIZt9NdprSZveIvMZAj5yd9lE9YCa2e1j6YAapXwxYK2LVWSGbqA7x9nhIFDFpVsh4nZw7MzWgj0TRcjy34q7iqJviN1Q4dQitBaTkp3rKSlRoSTSQK5SvAlxMroXy4GwUwDX1Qm6utzlaIOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYxwZj1j; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYxwZj1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735029262; x=1766565262;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=teBanZaGhbGMdbpTb9LoJ3F7AN7uNIux3xQWwps7KMQ=;
  b=lYxwZj1jWrZr+Vugcf04y1LbPjRqwhd0416oqO0bHXy3aZE+XAdbKtBK
   W8dQKIbK4VuyJCSWABCJlO+DjNVXDcwTHW5RsN2cYFFJm3IA+CskQfZuo
   2X8eU2dLkdjuXw+ErMMyRc1V/KGgV4m+Deq82I2xoYXsvtJeBcvHKqUD2
   xr2Hcp6R0juD3GoaVTSbHIQG/RiF+eIz0Ckk4czlhwc6Z/h2KSZiWRxsf
   UErVxRbByCiRyhBOYB4sftl6O/4WF1eCRueCsKRdJL8z1C8a3CPw2sD8v
   Eans4rbl29W6yFw3jsKQvSLw00K13dGwELsl89cYFHuB7FViSbFtxLOgO
   w==;
X-CSE-ConnectionGUID: 1B2rvsT+RAmI4ub80Omu7Q==
X-CSE-MsgGUID: mVRP0mP9QcGeaZCr6yN/nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46917517"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="46917517"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 00:34:21 -0800
X-CSE-ConnectionGUID: Md7Oc5o+RxCbtq8Viza7wQ==
X-CSE-MsgGUID: d3SxdnmZQgmvjAz0igYoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104436021"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Dec 2024 00:34:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Dec 2024 00:34:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 24 Dec 2024 00:34:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 24 Dec 2024 00:34:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XW5hx/n1U2t0ARyNQ+UP5h8sp0+5+lJpoYdDgX/HjlXNh3/as8h31JnFnvEe5/qWjt4t+SueuQUe630wROOly6Q5NP06Lf1j6v7l/LlirZeLE1Kn3nRVRqdtbVeKLFnLY1b0h+oLwDKY+IbD3GI5Qqwp2+UlN1ZihQrr7MlyAJuUu02iordjwNpTXu7HldmSq3KzzS3CtcE4Hn5zNysIyrQJ/lm2Mlca2BBHJQMBfPzW2jwfsVm2R1Y5BBsj1P/hsPZaEvaa3dscD+fJevP5Tln4X+DdgQjcqIsODmQoIg1lx1Riv8u6qhqTRT8VcJH4fWztSFlI0MC4oam6K6EdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qMG1EJn0dx9MqFhu2fARwitw1V1sQxjrp4xKbO3KUk=;
 b=nkbbY6/bEsqiuhPq0QMUsKvLrGjy6Kp40mapyiQ7eo4cvR8NjMlZ+ulBC4cw1+s/8iTpan1/AuI1uykbbN08+szk40Vj1D+iusDzCQipkRZXqeJFbC8tpa3ja0iiYM/5Onm7uirYx8eslm3AJwUAkucrQLPvnG97pyo5bcO/dRnsCJocIk79AFBc2qx80ORK5reOSuSl2RvFEIITaB6/ZLs1i4h+gP4UORtkezGkBQ9h47Qyux9dkKSwELApmM1k1z7IDIrpp2v30CVS7VcZPPfwILcCAZH9rkKAPvbRJUnPQc4MViYEfoXnzeUTOf9Lkv81QUibZi1ZeK1AIINSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 08:34:14 +0000
Received: from SA1PR11MB8594.namprd11.prod.outlook.com
 ([fe80::72c7:2eb4:9341:3050]) by SA1PR11MB8594.namprd11.prod.outlook.com
 ([fe80::72c7:2eb4:9341:3050%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 08:34:14 +0000
Date: Tue, 24 Dec 2024 16:34:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/core]  e932c4ab38:
 aim9.sync_disk_cp.ops_per_sec 2.3% improvement
Message-ID: <202412241607.dc13db91-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8594:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: f226355c-2915-4be6-968f-08dd23f5bf2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?E4FFbYhvbmwzc+sVgNkZi7IvDU2/VSG907MmkhQZmOe9K3ZyqB4uYVWmXf?=
 =?iso-8859-1?Q?kkOVjawoHFWC7X66xYDOQuTQX0boqsNHK5fKMG114hUIw4kSwectJTwOA4?=
 =?iso-8859-1?Q?UrpyACJYZgiH8Jio6grRPh8b4jbFi8EhXMK6CrxQMEN6mSlXhnF2iEzu/2?=
 =?iso-8859-1?Q?WvuxIspLoCoiTQcIr/eiDaqesuMKIpPXGvSzWHtiF9joK7SumuirBl4F1Y?=
 =?iso-8859-1?Q?Wd1AYHVaWjvMqDFSOjkPh0xHMQgkq+oFNpeXBwrvldCuskSgLa/wNx4fvZ?=
 =?iso-8859-1?Q?GjFvQXxYpeSmrlNolDqER9COeHUZKVeYKczEQq3EYXr8/g49/fNdY4c5bK?=
 =?iso-8859-1?Q?/JBY/O5cr2cJtUMmnKuFF5Ldmo5OHbG0SCwoj9T77qvbvv4cPzjPBb+qwZ?=
 =?iso-8859-1?Q?1pqgqdFoHBxjAvQLzwoUsRjZ37QZrNrK2RnWvVp3ElIc0AHqBfvh735vx7?=
 =?iso-8859-1?Q?1/95IFp1EouEjeb5EWogBNWb4LJEeJMqaOESE6eEE7FyFAEpODHK5SJWfk?=
 =?iso-8859-1?Q?rgZVzBknswySGCOSD3ynd2Fn5OHlHSsZMuYfDJieQo8Pak46KSB/TOxclA?=
 =?iso-8859-1?Q?k3aAzHjyzadHWZ6Jfm92K1mWv+qv21A31RNchllkVnEyWMqCkxE1JrzSHU?=
 =?iso-8859-1?Q?vSyFsuqRZnmTVKK0P17ZwTi4ITGvMkBYnS6m3BYPMX4yEb0JHqMjIfvPVD?=
 =?iso-8859-1?Q?6jwa1z00/S5K5ker5yb3aNcFp46uxiKBvu4NEYtWoUDKlesSlEVFR4SYq/?=
 =?iso-8859-1?Q?mbf1gfBRdqnDIEbAN12DcIEsVx0I+gx4PinzgF0KmBKiy26norzrNzrS4S?=
 =?iso-8859-1?Q?iKn6eLtc4NXOWQrPG2YVbABNO6bOkhL8aiQljMHvMe8lHfA46VnuoqnPi4?=
 =?iso-8859-1?Q?FTepOC02a3z//xO95CypopDbjom2bbGvQTBmUkuQldOqkMMXwuYOufDmt8?=
 =?iso-8859-1?Q?I60CnqTdnhtfvvf2md03AVmRuBvFsN/O1iyPg2mxfPjvep6WF2HV09YTBi?=
 =?iso-8859-1?Q?dXDU+5dELa6TzGKm1y5uX5tDr8Sck4Pi+acwkgU8kRrVyovyvKZjNZ69xS?=
 =?iso-8859-1?Q?KgZEYIUt31FADzwCrkU7AOAStwnZXC9wkZvCqwRPgqpLhliAwNxGrIEFyz?=
 =?iso-8859-1?Q?mAigk7GD3k78xTO9EbAJ9yVWsJXgsxhkA42PFoR343qWi0CB8o04pT24NK?=
 =?iso-8859-1?Q?fSucafJv4yptbP2UOAEzPkYPhpLtaqyn0//oM82M5GORSXzq8MsUZ6GfHK?=
 =?iso-8859-1?Q?3MUhk1dmKkDQ76V6Oj5J9+G8crRplGYZmN2QVI/kJghF5dvoQEf44Gn18U?=
 =?iso-8859-1?Q?SDPbclNdgyWjceTSlx63WKaSln4kVhMHH99Z4qyhiAkyI7q1AkyfbBco3g?=
 =?iso-8859-1?Q?Sd+ZUBtL6kefvneip0oH9hRlZxl0fxWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aIwQ5epkEF8HdyMWpxkQRqL6y8oFRp+IaBacM2iVTd1SfPWqNt4OUFHw7v?=
 =?iso-8859-1?Q?+J/40GtrHplYEakC58HJHZP9ZSlbg1t7GvGhMYa1EkJ0DzEaUuAE+GdZub?=
 =?iso-8859-1?Q?zOtpaXOS+FrtTHEz+u0l4SFPRmbaWjB/A4Pze1DoDyrf5rQp/IIGIooSE5?=
 =?iso-8859-1?Q?vMvJPQal5vUrC+QBIyiomKB/1gSLPssMyr49PkBvm1xMZ6M62LRgzZ9hID?=
 =?iso-8859-1?Q?ZjvHs+beL2BqrQUW57NMfRqcxU6yrCDnAjO2jVRhjWQ/MUzLGiLPGuQWHk?=
 =?iso-8859-1?Q?7IOuFKUsP36xxiVELt96RPplkpy8a7ezpOSW1jrvBj8hj4tOpilSylygp0?=
 =?iso-8859-1?Q?SBO+HOEXlNQOIGv/2xnfAe2Hj86VXZcuitufx4SLNLFPgsdSbcoyFftR2e?=
 =?iso-8859-1?Q?Di1QJRvSqLnlcM8ENUmAqqc6V5Z1skudmC9RnTXjW2/J8DyPhn5+N+MQ9r?=
 =?iso-8859-1?Q?pcZve/zeoCo5Kt+y4cShGcLTHkZ4UnfSTX79Z059HrTsaEH3LfAOmHLtoE?=
 =?iso-8859-1?Q?JAAmTSmc4aouzn64xI1puQSvt6BEnZ7H2ImRhuUMr9KFwNdvoxs0e6yQs8?=
 =?iso-8859-1?Q?ajdU8f9U6s3TJJDr5dbFrVefVcTQFRnkhtKWEM4dVRAnUU8wkgDyHdKC36?=
 =?iso-8859-1?Q?gHTMQXGyZRXt261IC406sT/3P8j61v3KwgYC5rfGaADmp9cMDaD08t8L8E?=
 =?iso-8859-1?Q?Lxf2QTBrH/mf/MaAr6DEfOy/zYLOo5Nzu525mGA1lNcObQlnwDOo9z2Xjh?=
 =?iso-8859-1?Q?8kRwDo8Qn/gQ5/Tac1ukOkpm/mfTmmTaFvfxS4Hg6zXYhRT9n6wsYf9vbT?=
 =?iso-8859-1?Q?5UK6R9SERWMEqiSmPLcaNibZICm8w/eokmIufiycOU6V9geizaR2HSGXrz?=
 =?iso-8859-1?Q?d+qf8dPxLSkv9hPDpvE+slFmi/J0in5tQhwh7GFaSdwFoNNTSEtHyOkYwL?=
 =?iso-8859-1?Q?nF414U/xE9GHgt7IO7WCtx8QpD1+5CdHjeASrWAU9BepNerUuwiGtDLgHq?=
 =?iso-8859-1?Q?u31+bv9o7ln3dnw5wFaBQxrTyCNjTqH+d8x8OEutItmDfVh9VYk528Ssnt?=
 =?iso-8859-1?Q?Gx/Woa0fC26lbnbKWIAN31VEOuP7q7RZYP/nq1F+LeUqenkKSe4CWyR9mi?=
 =?iso-8859-1?Q?hNa3wFNOYub4xNr8BlbzEZyAvypjm68R2wcz81PUPbwAF6XKHK7iqCcR55?=
 =?iso-8859-1?Q?dYdQPawvL9zd6M/DJdIO+aSQHnIYYWzqfMSFaxeXNi4dmtiJWiaug1Q6KF?=
 =?iso-8859-1?Q?n1sEcv2j1sy8y1pN6p0Z5iNwaf8OjmqrIiTocD74YKJ+Pcf0AnM9lGMnDH?=
 =?iso-8859-1?Q?xiVFPjeLmDZS/uYg/dIj+u666TzHcga6NzWu+ruNndzCuUU//fap5Vnf8w?=
 =?iso-8859-1?Q?CriLhi07aML7oTPGkjD9wOeIJiKz2IO0SdUaeSJpeUM0fx7mFu/0mNTXCo?=
 =?iso-8859-1?Q?h0CYyhnlXqUQPUr3EmruoHpeqRguEXOvbwWF9AjU3H/5n7DzGiiobGK0Ye?=
 =?iso-8859-1?Q?Gp+xwxbI7AKtq9QJBTKSoKsux3pw3bgyZIHWRjSpmuJX0oYNcVJ+9Z+6vc?=
 =?iso-8859-1?Q?ug6Tpw89BtDgNoHD1jVuH7Fc5Vwi9rovS5zkO1vde9BjpV70K2FPv0PM/O?=
 =?iso-8859-1?Q?HawDOBaqXNjLAYxzCkcmUazm6Ox+gENPeCHJ+gthRP3IkarPkVaZJZdQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f226355c-2915-4be6-968f-08dd23f5bf2d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 08:34:14.6879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnRadLNypT0D/EimfiSELvWLGacYXKlqk3DP8UiW78k/ym0vquyYqQeN2GkU24pFoFEsH/wvMwauEyVWOb1rrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.3% improvement of aim9.sync_disk_cp.ops_per_sec on:


commit: e932c4ab38f072ce5894b2851fea8bc5754bb8e5 ("sched/core: Prevent wakeup of ksoftirqd during idle load balance")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: aim9
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory
parameters:

	testtime: 300s
	test: sync_disk_cp
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput 2.4% improvement                  |
| test machine     | 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory |
| test parameters  | cpufreq_governor=performance                                                |
|                  | runtime=300s                                                                |
|                  | test=migrate                                                                |
+------------------+-----------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241224/202412241607.dc13db91-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/lkp-skl-d06/sync_disk_cp/aim9/300s

commit: 
  ff47a0acfc ("sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy")
  e932c4ab38 ("sched/core: Prevent wakeup of ksoftirqd during idle load balance")

ff47a0acfcce309c e932c4ab38f072ce5894b2851fe 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    779244            +2.3%     797195        aim9.sync_disk_cp.ops_per_sec
    444185 ±  2%     -51.7%     214738 ±  3%  cpuidle..usage
     40.83 ± 15%     -84.5%       6.33 ± 23%  perf-c2c.HITM.local
   6505472 ± 12%     +21.6%    7908010 ±  4%  meminfo.DirectMap2M
     29200           -10.3%      26194        meminfo.Shmem
      0.08 ±  2%      -0.0        0.06 ±  2%  mpstat.cpu.all.irq%
      0.04 ±  3%      -0.0        0.03 ±  4%  mpstat.cpu.all.soft%
      2562 ±  2%     -60.3%       1018        vmstat.system.cs
      2343           -23.3%       1798        vmstat.system.in
    117335           -53.2%      54952        sched_debug.cpu.nr_switches.avg
    285639 ±  5%     -71.9%      80403 ±  5%  sched_debug.cpu.nr_switches.max
    100396 ±  9%     -77.1%      22968 ± 14%  sched_debug.cpu.nr_switches.stddev
      7316           -10.5%       6550        proc-vmstat.nr_shmem
  58767234            +2.4%   60172860        proc-vmstat.numa_hit
  58984855            +2.0%   60176451        proc-vmstat.numa_local
  58862408            +2.3%   60212415        proc-vmstat.pgalloc_normal
  58848231            +2.3%   60198260        proc-vmstat.pgfree
 7.448e+08            +1.7%  7.574e+08        perf-stat.i.branch-instructions
      1.35            -0.1        1.29        perf-stat.i.branch-miss-rate%
  65562189 ±  2%      -4.9%   62378502        perf-stat.i.cache-references
      2571 ±  2%     -60.5%       1016        perf-stat.i.context-switches
 3.732e+09            +1.8%  3.797e+09        perf-stat.i.instructions
      0.14 ±  3%     -87.0%       0.02        perf-stat.i.metric.K/sec
 7.426e+08            +1.7%   7.55e+08        perf-stat.ps.branch-instructions
  65356430 ±  2%      -4.9%   62171508        perf-stat.ps.cache-references
      2563 ±  2%     -60.5%       1012        perf-stat.ps.context-switches
  3.72e+09            +1.7%  3.785e+09        perf-stat.ps.instructions
  1.12e+12            +1.8%   1.14e+12        perf-stat.total.instructions
      0.02 ± 25%     +78.4%       0.03 ± 18%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 55%     +82.3%       0.04 ± 16%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.04 ± 21%     +87.3%       0.07 ± 21%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±  9%     +35.2%       0.02 ±  6%  perf-sched.total_sch_delay.average.ms
     20.34 ±  5%    +111.1%      42.94        perf-sched.total_wait_and_delay.average.ms
      7025 ±  6%     -54.0%       3228        perf-sched.total_wait_and_delay.count.ms
      3058 ± 20%     +63.5%       4998        perf-sched.total_wait_and_delay.max.ms
     20.33 ±  5%    +111.1%      42.92        perf-sched.total_wait_time.average.ms
      3058 ± 20%     +63.5%       4998        perf-sched.total_wait_time.max.ms
    202.58 ± 18%     +94.7%     394.49 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    609.98 ±  5%     -17.9%     500.63        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      9.01 ± 12%   +6133.8%     561.38 ± 15%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3837 ± 12%     -98.6%      52.17 ± 12%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1349 ± 39%    +270.4%       4998        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2785 ± 16%     -64.1%       1001        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    202.50 ± 18%     +94.8%     394.38 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    609.95 ±  5%     -17.9%     500.56        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      9.00 ± 12%   +6140.7%     561.36 ± 15%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1349 ± 39%    +270.4%       4998        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2785 ± 16%     -64.1%       1001        perf-sched.wait_time.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      1.51 ±  6%      -0.9        0.64 ± 11%  perf-profile.calltrace.cycles-pp.common_startup_64
      1.51 ±  6%      -0.9        0.64 ± 11%  perf-profile.children.cycles-pp.common_startup_64
      1.51 ±  6%      -0.9        0.64 ± 11%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.51 ±  6%      -0.9        0.64 ± 11%  perf-profile.children.cycles-pp.do_idle
      1.12 ±  6%      -0.6        0.49 ± 13%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.92 ±  5%      -0.5        0.42 ± 17%  perf-profile.children.cycles-pp.cpuidle_enter
      0.92 ±  5%      -0.5        0.42 ± 17%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.50 ±  6%      -0.3        0.21 ± 12%  perf-profile.children.cycles-pp.intel_idle
      0.52 ±  8%      -0.2        0.33 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.48 ±  6%      -0.2        0.31 ±  7%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.27 ± 18%      -0.2        0.10 ± 36%  perf-profile.children.cycles-pp.__schedule
      0.20 ± 12%      -0.2        0.04 ± 73%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.21 ± 13%      -0.2        0.06 ± 20%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.24 ±  9%      -0.1        0.11 ± 12%  perf-profile.children.cycles-pp.ret_from_fork
      0.24 ±  9%      -0.1        0.11 ± 12%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.24 ±  9%      -0.1        0.11 ± 10%  perf-profile.children.cycles-pp.kthread
      0.18 ±  8%      -0.1        0.05 ± 49%  perf-profile.children.cycles-pp.schedule
      0.31 ±  9%      -0.1        0.19 ±  8%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.30 ±  9%      -0.1        0.19 ±  8%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.25 ±  8%      -0.1        0.16 ±  7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.11 ± 11%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.try_to_block_task
      0.10 ± 13%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.21 ± 12%      -0.1        0.14 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.10 ± 14%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.dequeue_entities
      0.17 ± 13%      -0.1        0.10 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.11 ± 12%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.sched_tick
     40.09            +0.6       40.66        perf-profile.children.cycles-pp.read
      0.50 ±  6%      -0.3        0.21 ± 12%  perf-profile.self.cycles-pp.intel_idle
      0.97 ±  4%      +0.1        1.05 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack


***************************************************************************************************
lkp-skl-d03: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-skl-d03/migrate/vm-scalability

commit: 
  ff47a0acfc ("sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy")
  e932c4ab38 ("sched/core: Prevent wakeup of ksoftirqd during idle load balance")

ff47a0acfcce309c e932c4ab38f072ce5894b2851fe 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    181821           -12.5%     159050        meminfo.Mapped
      0.02 ±  4%     -20.4%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     45923           -12.8%      40022        proc-vmstat.nr_mapped
      1.00 ± 99%    -100.0%       0.00 ± 52%  vm-scalability.free_time
   2422987            +2.4%    2480833        vm-scalability.median
   2422987            +2.4%    2480833        vm-scalability.throughput
     90071            +2.5%      92323        vm-scalability.time.involuntary_context_switches
      3.03 ±  3%      -0.2        2.84 ±  3%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      2.84 ±  2%      -0.2        2.67 ±  3%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      6.04 ±  2%      -0.2        5.88        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      6.06 ±  2%      -0.2        5.89        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      2.78 ±  2%      -0.1        2.64 ±  2%  perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      2.90            -0.1        2.77 ±  2%  perf-profile.calltrace.cycles-pp.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.90 ±  4%      +0.1        0.95 ±  3%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.92 ±  3%      +0.1        0.99 ±  2%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.77 ±  4%      +0.1        0.84 ±  3%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.80 ±  7%      +0.1        0.91 ±  7%  perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      4.90 ±  2%      -0.2        4.70 ±  2%  perf-profile.children.cycles-pp.do_read_fault
      6.09 ±  2%      -0.2        5.92        perf-profile.children.cycles-pp.exit_mm
      0.54 ±  2%      -0.1        0.49 ±  8%  perf-profile.children.cycles-pp.___perf_sw_event
      0.39 ±  5%      -0.0        0.35 ±  6%  perf-profile.children.cycles-pp.vfs_open
      0.20 ±  4%      -0.0        0.16 ± 10%  perf-profile.children.cycles-pp.opendir
      0.15 ±  8%      +0.0        0.19 ±  5%  perf-profile.children.cycles-pp.__kmalloc_cache_noprof
      0.18 ±  6%      +0.0        0.22 ± 11%  perf-profile.children.cycles-pp.__kernel_read
      0.29 ±  5%      +0.0        0.34 ±  5%  perf-profile.children.cycles-pp.filemap_read
      1.17 ±  4%      +0.1        1.28 ±  4%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.44 ±  4%      -0.0        0.40 ±  8%  perf-profile.self.cycles-pp.___perf_sw_event
      0.07 ± 15%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.__folio_batch_add_and_move





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

