Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED05A10940
	for <oe-lkp@lists.linux.dev>; Sat, 15 Jun 2024 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718421416; cv=fail; b=mWV1MGakCKEfBXKd9GWVVJPsfZF8aP1PJ508FmK1GEPvjtyfrBlYyc38kz+UazXIjU0/323JxlXpodMIvyrB3Wpl9JNh32/syu4Wg2kZ+zun1MtL5iHDc2IXaJG2Lpm2ZXjpA6ld86ByZl4CgYtyJZ+ca+OMRqd/5aflZPHZmB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718421416; c=relaxed/simple;
	bh=JghgVdSf6qxfboADZqez5EilRNYwOb/iHkylxHc7aNc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=auYUDNbW7yaGgi8RVgC4ECh6lbWve/la7+niNcfQuR/Tcw+Vi4HE7KhW88tmhMzktlx9wZOFS0R5uDxnUCBSEnatZ5lVgc6z//KXVXV6Cah41xt7E6N/LCCETAcqIoCx+e0ZSfhNzyQP4A4WWCtvTF8hpxJPD250AItOxHgMoBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuBIUkAd; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuBIUkAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718421412; x=1749957412;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=JghgVdSf6qxfboADZqez5EilRNYwOb/iHkylxHc7aNc=;
  b=OuBIUkAdHZvg9q8ZKX7HnvG7T+gLGdzWmx6T9zS9pWAwjKr14lbLAw5I
   D4ksyWNIgi2PlwAz8POEjUpzHJ2vwepojsEQVi702tazbbUu4wWZoPQQc
   HbTfvUnksywfEnkTySWmCA20LYLBptt1AA0Em3Z68d+c7/g8R7RH0Zdt8
   MGk2GKeY/7ZeUFpdOAmhy8ocNqfuzZwiprZMr+GCFiTT07yUzASwSCBbZ
   +rt4khzgJagRBTw7GxXt884ShDi5jHmXezGncWoSG46nnZmYVf0lJZNiu
   r9hiJ+qOSP8rcHmjtAQh8biI6TaL1SaIvkhRMUQYWBBVtIh/VSmRQ5xyn
   w==;
X-CSE-ConnectionGUID: YyBUy5GMRvy+ZPxBSRbudg==
X-CSE-MsgGUID: McZIfYPjSzaqkxNVSQRkDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15462817"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="15462817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 20:16:50 -0700
X-CSE-ConnectionGUID: U2t2+YixR1CZV50UMRY0Cw==
X-CSE-MsgGUID: IMLMBemxSY6IXpYr9TfOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="45106135"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jun 2024 20:16:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 20:16:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 20:16:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 20:16:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHAnbhW95ttgImeog3aCGDfrNAOLG9YU4x7FNRfH17fWYxMkNV+qvmL8kGPRE85GN7kJ8DaawMRIM8ugNUjfL78A6esy2y2kbvUkeZ5Pzapfd6JUGB10Eqj0smI2kevQZgh6VBpQdKpQ85R4cJ5ymMkrCsVuGZ9wzCEStZMp/E3Myb9PaOzuiVlcqgouO43mTidV67ejkjohmVIaafmyKr4dPENkJKHvP1rf8rDGd176Lh9igTu1hRoW7Ntr2vH/TzKI6ubYrRpUYpunWdDJiVqbHP8ngdB2k1mgG+vBDyaP14C+KJXStSepsnrXUaf2qisBU3IHW9AIN2/gi22c3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOSy4G5BUFwY6E+mHKh2/Qc3YYTgI49ShygV+kiazhs=;
 b=Jm0Vshkt19VizQ+sKT+X9f+xdb7xGiobblVu+DHiEKHW+LqaOMtipRcHvBtOkMBKS9a8yfxWnbPCD3qDzrByRU5DqM35FcJuh3xqy0mh55d150FRRXbomUKy60DbP8enKDRRl6JdmkPYe70rPc95QQSURFWPf1ahLfToskCHbfzpmwtEk8zFNuiFLrJavWECN+Ih0BTlxa5LoRG7TpR1LJmQVVqCrqiHEIe80zgjEsNTxQpcMZ/ef9RFxEzAA0LYXBZrLh3dBLARRYayIOk3QIBXxw2tQ9XGbFfAQcz49Fx2xhQ6ytWwSCyrM/GveWSsDT39yyeEz5bvzSI3zS4/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Sat, 15 Jun
 2024 03:16:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7677.026; Sat, 15 Jun 2024
 03:16:43 +0000
Date: Sat, 15 Jun 2024 11:16:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-block:block-limit-flags] [block]  c1f56c404a:
 filebench.sum_operations/s 783.1% improvement
Message-ID: <202406151134.bb70ac54-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: e32f930d-9b1a-449e-1cde-08dc8ce994d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1Bbmj16OpLwWlKZfpGIxiXtj5noW8I/8dPyeL/HslDQSYb/44lXrloYj1C?=
 =?iso-8859-1?Q?hbK1ShYRs8N576ykV4PjEF4rdYOBJCTfOsEeJRaoMW40/bKKz0Ug6A7HVl?=
 =?iso-8859-1?Q?VVcEqNHDWR/lauhKVleOci30im34Eb6HFDrSFogLyZfAHCmaH1NuZ0pNim?=
 =?iso-8859-1?Q?UfXtRqzpRmSbHY5sHtC6p7sgz8jHMmd9CO7bw7m01TwRNP/Iv81vVvrV0X?=
 =?iso-8859-1?Q?EpXH2x2MYIbJUGzWSqY6TLDLKI8MfV+mlQ+e9RYhyRorbTVucItn3mi2cQ?=
 =?iso-8859-1?Q?x3iY2hzvGpckrbwEBfRltoS0cEDZKKfDK3/BrszzSP9SMcDNiUj1Rss8d0?=
 =?iso-8859-1?Q?ufywWI7LwOiMUrmVKDPnMJKxr+nNsjJ+QwAG0zkVXA5oVOoN4Br0JHEVxS?=
 =?iso-8859-1?Q?tyAbnawJ+iO+lsXnxq7V7rUqwst1IfmRlV8Zd+0jthGvvMZHbesOrJhZLh?=
 =?iso-8859-1?Q?AOsaq3HGIqRHj7Z6ZX4rUIrKy68c19ftRTVI7Tvp5nHhAcr9dqwhvveiVr?=
 =?iso-8859-1?Q?rcimqz35+c796Os8ztVHoFgV5PPTDpO1FDPQg/52PT0Udxo2lS3fczX0OH?=
 =?iso-8859-1?Q?rGNJCRyRYyudtFCXP4PvUb3QFJe0GRQabzsTD8ftRHL+Qp4B4500RgsXEA?=
 =?iso-8859-1?Q?gcJbwLxTFoSs9keVq4q1kxGayrlRuOO3W29nbxmCuVl+gEI1aK5+LMRgtX?=
 =?iso-8859-1?Q?hMzrhvRy1ABLqLg+wJP3EzvWLh9JomSSPdg464BCBCsy4BQ74m6+K5Yk63?=
 =?iso-8859-1?Q?5qPNvzXPGrUeF59zV6zYARvi9umDXxUpN8Z1VE3/PDHaFFtQ5Nwpr6i/gh?=
 =?iso-8859-1?Q?4N+KZNsYypivfHlmGo+vs2gxCE4V91QTSC7CKrY4LW81RrgLdoEvm7XJ32?=
 =?iso-8859-1?Q?FQ9ra1rAjegqGrYZMlS6UinQSA9gq30FVSQz9oO0Jv7NgC0j/3pdFND+WJ?=
 =?iso-8859-1?Q?7/q6VWob4yuaUtfXmfIVCwJwA1WsX+Th/Z6kNRGKrjYo5bDFqyVvco/zTV?=
 =?iso-8859-1?Q?WyjEnGRh3314YRQm8Gu6mfrb1wvdLyqaTbSVIADvvyYtjvIsQQXKfNEXnP?=
 =?iso-8859-1?Q?/MhepzXBfhknKC3jb7Eu+8wt4YYHA7z6YRHd0eiZ5gSkB7VxCOR66sYqRL?=
 =?iso-8859-1?Q?H7H0DyrncC146DuBE5qDHj5UkvNn2e8OLuzLEBEXyziMlPHGoFd4v818Bd?=
 =?iso-8859-1?Q?ubSizBg5dvWGJbcIV+zuWg566qcfYSb3hXBU2+TwBH0hEP1H4lr7KYVz9N?=
 =?iso-8859-1?Q?fnXW8YBTY1hftqwvcHm0DIKTr0Jw9a0efP+F6TasFhQ6gTSv3XlML/gEnO?=
 =?iso-8859-1?Q?h+bc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?meDtApBdRq9+GAxxxUgJfvQ0ILYCQmoO/abXAFpLZ+/F0bpoKFLW0EBu8j?=
 =?iso-8859-1?Q?QLUiGpxmPh7+wrq8j+LgXq45tKCK6ZG6ft0y8BgsEjbt2o71eu6+Lq8nse?=
 =?iso-8859-1?Q?2+RdUttITe0yGiBUDzUswOTZfjEm1yVxaRLW7kOhQyitHDPcjhgXuAziLX?=
 =?iso-8859-1?Q?JeeCCi8TDbG8CyPHOD2d2ktz56C+0BzkAYmENzBBPXrOJaL2bqRyoM4uOy?=
 =?iso-8859-1?Q?7MAbP0SDamXusBPInEWg6Wr9sEUUhwmaTsCp8D35FGF4pjDoXirhN+wqDT?=
 =?iso-8859-1?Q?hnFctw+rKINb26MVC6QOjdkTtSx6kl0vRurSI9moHHzMKhmB483CCkUJAD?=
 =?iso-8859-1?Q?cxH0P7rFHkLj1tF/f1tsgMARtoLZNm52wUlhC+OCoIqXyKe+kblXjUU9T8?=
 =?iso-8859-1?Q?GHx7n9iyyN+SgLTynHqqD7Opg1m3LDo5Eu8mo2p8U68dYu7BvrhLaPLt8P?=
 =?iso-8859-1?Q?pGkpJnTL7b1V0wjUEzOChrRPZa09r6txXP3HVkgiDTpYa3P9BcGkeHzKQT?=
 =?iso-8859-1?Q?JUT7ofm/LBWCN+2ZUINLLDZ2CHa6Em79+6TfWoNnb3p/lEGgxwp79z5FUv?=
 =?iso-8859-1?Q?14P/rEAPhbUPZYAQfqxP+fb5dC73JQCjHb9QSedFJiprmtg9kSZaImuIwV?=
 =?iso-8859-1?Q?j3DcvACiZlkR207lv1wyWPqzQZs+9X8Att5zzjnzL1t16ZXAUyO1iNa2iS?=
 =?iso-8859-1?Q?I0GHs+Tm6IA9TLx6C76AoLaBNm888bB/e5bVGfRfRXCpqKZrhkposDSlm6?=
 =?iso-8859-1?Q?EJcoaNWFMxYqqQK42Zk65uRJqlMBMrVWDivP8k5S2e8q4f8RStmrtSgS1e?=
 =?iso-8859-1?Q?Ga5Kwm+Rp/hplJPMSljYiGOAoxiANRluiJFGyh4CkiflYHegCYgXLTK1QQ?=
 =?iso-8859-1?Q?OsKhr0FBdeRBxTT+kf0gRlc1dvdN7OYcVL9kg5ub3OvO/MShgVp5uatTk6?=
 =?iso-8859-1?Q?eua1ZRyijKggBfB6JBwXieRVWhQ19Uam8UZmmMsIZbm6ZdZ4MjBD5zz4bM?=
 =?iso-8859-1?Q?sLkTg1cUGJLDDXBPYV1oH24CYwHWQeYEsZcKB/V7lloFYV8ihwK09KBAOq?=
 =?iso-8859-1?Q?c4102jMVxLnJkyMxkJDA4+r5A58w5rPkb160KFoArpJ3jax9vtZifqOt74?=
 =?iso-8859-1?Q?1PjOZZi7IysiMttJOP6ONpR1s3XcapcbI7DPrp5GN2SetkzgtB76ZHpCGH?=
 =?iso-8859-1?Q?MMl1hXSvSipGoJZKfZCoQSLq0I+inQdArAhh6KpOkb1ELV97Q2b1QhfaEl?=
 =?iso-8859-1?Q?IsrPBLb4nSD2S7EmX/CN7FlXZJ26ePdTneuthdZC9Wu7/uSzsOMLEQNX00?=
 =?iso-8859-1?Q?Bwu/X1k/oyy0mHrJbtD727CPPGQHA7voJOQou4F/66DCkaaGEL1cKoEy6r?=
 =?iso-8859-1?Q?ASJ6cjJ7mZZW/zmhMnMqLIjDGMKJnaHjuU6h+EkDkHxWwMt14BNqDslhX2?=
 =?iso-8859-1?Q?yB3SkR9+NM71YMTZd+fgIiPEWnaUeMbFe7TLxc+BMEf1btR2A041L/99Jn?=
 =?iso-8859-1?Q?RgEFtTW4tpdaTvS0r5u+cM8DxxWwerYjXA3IGNSInZfDuf28XYUaI+l+xm?=
 =?iso-8859-1?Q?+Ss6sKCpfL+4A/v3iI1GETJmk65Rp0LRJtjubOz3MEL4zRMlrnaO586/UZ?=
 =?iso-8859-1?Q?EdLslD0N/rKLmyN7U1OwlYAHDqT8QqrCPeHurAYTu1+w1szYxq35vy7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e32f930d-9b1a-449e-1cde-08dc8ce994d0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 03:16:43.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzxvIyDyAqX/aqZT72BdbEpAWXHMl5TCfiHVujc1z8wIqGinN04DZCxVn0//ZRaD0bXGTprUNnnbOBWFNlnqgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 783.1% improvement of filebench.sum_operations/s on:


commit: c1f56c404a65ba2a006b03e77b593b5e4999b12e ("block: move cache control settings out of queue->flags")
git://git.infradead.org/users/hch/block.git block-limit-flags

testcase: filebench
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
parameters:

	disk: 1HDD
	fs: btrfs
	test: varmail.f
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.mknod.ops_per_sec 1653.1% improvement                                |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                              |
|                  | disk=1HDD                                                                                 |
|                  | fs=xfs                                                                                    |
|                  | nr_threads=100%                                                                           |
|                  | test=mknod                                                                                |
|                  | testtime=60s                                                                              |
+------------------+-------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240615/202406151134.bb70ac54-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
  gcc-13/performance/1HDD/btrfs/x86_64-rhel-8.3/debian-12-x86_64-20240206.cgz/lkp-icl-2sp6/varmail.f/filebench

commit: 
  f38181d295 ("block: remove blk_flush_policy")
  c1f56c404a ("block: move cache control settings out of queue->flags")

f38181d2955c3dec c1f56c404a65ba2a006b03e77b5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     31.43            +2.3%      32.14        boot-time.boot
     35.67 ± 38%    +130.4%      82.17 ± 25%  perf-c2c.DRAM.local
     92.17 ±  6%    +228.4%     302.67 ± 31%  perf-c2c.DRAM.remote
     53.00 ± 19%    +615.4%     379.17 ± 25%  perf-c2c.HITM.local
      2746 ± 10%    +188.7%       7929 ± 13%  sched_debug.cpu.nr_switches.avg
     16552 ± 14%    +138.2%      39429 ± 14%  sched_debug.cpu.nr_switches.max
      2782 ± 10%    +212.9%       8707 ± 12%  sched_debug.cpu.nr_switches.stddev
      2459          +832.3%      22929 ±  5%  vmstat.io.bo
      2574 ±  2%    +297.0%      10222 ±  2%  vmstat.system.cs
      6106 ±  4%     +70.4%      10405 ±  4%  vmstat.system.in
      0.42 ±  4%      +0.1        0.54 ±  4%  mpstat.cpu.all.iowait%
      0.02 ± 15%      +0.0        0.03 ±  9%  mpstat.cpu.all.irq%
      0.01 ± 21%      +0.0        0.02 ±  4%  mpstat.cpu.all.soft%
      0.12 ±  4%      +0.1        0.25 ±  5%  mpstat.cpu.all.sys%
    319582 ± 14%     +93.0%     616789 ± 17%  numa-numastat.node0.local_node
    388549 ± 18%     +65.5%     643046 ± 15%  numa-numastat.node0.numa_hit
    309464 ± 15%    +119.0%     677723 ± 17%  numa-numastat.node1.local_node
    373112 ± 20%    +110.1%     784012 ± 14%  numa-numastat.node1.numa_hit
    108502 ±  2%    +538.3%     692563 ±  3%  meminfo.Active
     26796 ±  5%    +137.8%      63721 ±  4%  meminfo.Active(anon)
     81706 ±  2%    +669.6%     628841 ±  3%  meminfo.Active(file)
   3323038           +24.5%    4136221        meminfo.Cached
    776920           +29.6%    1006554        meminfo.Inactive
     49381          +461.9%     277479 ±  4%  meminfo.Inactive(file)
   5474636           +15.3%    6314693        meminfo.Memused
     54953 ±  2%     +68.5%      92594 ±  3%  meminfo.Shmem
      4.13          +791.9%      36.87 ±  4%  filebench.sum_bytes_mb/s
     68574          +783.1%     605566 ±  3%  filebench.sum_operations
      1142          +783.1%      10091 ±  3%  filebench.sum_operations/s
    175.67          +783.7%       1552 ±  3%  filebench.sum_reads/s
     13.98           -88.7%       1.58 ±  3%  filebench.sum_time_ms/op
    175.83          +783.2%       1553 ±  3%  filebench.sum_writes/s
    542525          +795.2%    4856813 ±  4%  filebench.time.file_system_outputs
     90.17 ±  5%   +2296.9%       2161 ±  9%  filebench.time.involuntary_context_switches
     12343            +4.8%      12930        filebench.time.minor_page_faults
      2.00          +783.3%      17.67 ±  6%  filebench.time.percent_of_cpu_this_job_got
      3.88 ±  6%    +604.1%      27.32 ±  5%  filebench.time.system_time
     68617          +746.5%     580872 ±  3%  filebench.time.voluntary_context_switches
     33602 ± 26%    +564.8%     223407 ± 46%  numa-meminfo.node0.Active
     30556 ± 31%    +613.5%     218028 ± 46%  numa-meminfo.node0.Active(file)
     76841 ±  8%     -37.1%      48295 ± 43%  numa-meminfo.node0.KReclaimable
     38180 ± 19%     -39.4%      23148 ± 59%  numa-meminfo.node0.Mapped
     76841 ±  8%     -37.1%      48295 ± 43%  numa-meminfo.node0.SReclaimable
   2679696 ± 27%     -67.2%     879571 ±111%  numa-meminfo.node0.Unevictable
     74919 ± 13%    +526.3%     469253 ± 22%  numa-meminfo.node1.Active
     23753 ±  9%    +145.7%      58350 ± 10%  numa-meminfo.node1.Active(anon)
     51166 ± 21%    +703.1%     410902 ± 24%  numa-meminfo.node1.Active(file)
    579481 ±129%    +405.1%    2927032 ± 30%  numa-meminfo.node1.FilePages
     31438 ± 19%    +485.1%     183959 ± 26%  numa-meminfo.node1.Inactive(file)
     28071 ± 22%    +122.7%      62528 ± 32%  numa-meminfo.node1.KReclaimable
   1707281 ± 46%    +136.1%    4030362 ± 24%  numa-meminfo.node1.MemUsed
     28071 ± 22%    +122.7%      62528 ± 32%  numa-meminfo.node1.SReclaimable
     30591 ± 23%    +114.4%      65599 ± 15%  numa-meminfo.node1.Shmem
    168507 ± 11%     +27.5%     214914 ± 14%  numa-meminfo.node1.Slab
 2.694e+08 ± 14%     +34.3%  3.618e+08        perf-stat.i.branch-instructions
  20375942 ± 38%     +46.5%   29847714        perf-stat.i.branch-misses
    864749 ±  3%    +124.6%    1941825 ± 11%  perf-stat.i.cache-misses
  67828694 ± 75%     +88.2%  1.277e+08 ±  2%  perf-stat.i.cache-references
      2499 ±  2%    +311.7%      10290 ±  3%  perf-stat.i.context-switches
    144.53            +2.6%     148.25        perf-stat.i.cpu-migrations
  1.34e+09 ± 13%     +36.2%  1.825e+09        perf-stat.i.instructions
      0.66 ± 15%     +61.5%       1.06 ±  9%  perf-stat.overall.MPKI
 2.677e+08 ± 14%     +34.3%  3.594e+08        perf-stat.ps.branch-instructions
  20243978 ± 38%     +46.5%   29653620        perf-stat.ps.branch-misses
    858677 ±  3%    +124.7%    1929845 ± 11%  perf-stat.ps.cache-misses
  67408014 ± 75%     +88.2%  1.269e+08 ±  2%  perf-stat.ps.cache-references
      2485 ±  2%    +311.8%      10234 ±  3%  perf-stat.ps.context-switches
    143.60            +2.5%     147.25        perf-stat.ps.cpu-migrations
 1.332e+09 ± 13%     +36.2%  1.813e+09        perf-stat.ps.instructions
  2.17e+11 ± 13%     +36.3%  2.958e+11        perf-stat.total.instructions
      7637 ± 31%    +613.3%      54478 ± 46%  numa-vmstat.node0.nr_active_file
     27097 ± 25%    +742.5%     228305 ± 46%  numa-vmstat.node0.nr_dirtied
      9753 ± 19%     -39.4%       5912 ± 58%  numa-vmstat.node0.nr_mapped
     19210 ±  8%     -37.2%      12073 ± 43%  numa-vmstat.node0.nr_slab_reclaimable
    669924 ± 27%     -67.2%     219892 ±111%  numa-vmstat.node0.nr_unevictable
     25655 ± 29%    +776.4%     224836 ± 46%  numa-vmstat.node0.nr_written
      7637 ± 31%    +613.3%      54478 ± 46%  numa-vmstat.node0.nr_zone_active_file
    669924 ± 27%     -67.2%     219892 ±111%  numa-vmstat.node0.nr_zone_unevictable
    387093 ± 18%     +65.9%     642134 ± 15%  numa-vmstat.node0.numa_hit
    318128 ± 14%     +93.6%     615878 ± 17%  numa-vmstat.node0.numa_local
      5923 ±  9%    +146.0%      14571 ± 10%  numa-vmstat.node1.nr_active_anon
     12788 ± 21%    +702.9%     102683 ± 24%  numa-vmstat.node1.nr_active_file
     41041 ± 17%    +827.1%     380478 ± 28%  numa-vmstat.node1.nr_dirtied
    144863 ±129%    +405.1%     731700 ± 30%  numa-vmstat.node1.nr_file_pages
      7856 ± 19%    +485.3%      45984 ± 26%  numa-vmstat.node1.nr_inactive_file
      7646 ± 23%    +114.4%      16392 ± 15%  numa-vmstat.node1.nr_shmem
      7016 ± 22%    +122.8%      15631 ± 32%  numa-vmstat.node1.nr_slab_reclaimable
     40116 ± 19%    +838.6%     376520 ± 28%  numa-vmstat.node1.nr_written
      5923 ±  9%    +146.0%      14571 ± 10%  numa-vmstat.node1.nr_zone_active_anon
     12788 ± 21%    +702.9%     102683 ± 24%  numa-vmstat.node1.nr_zone_active_file
      7856 ± 19%    +485.3%      45984 ± 26%  numa-vmstat.node1.nr_zone_inactive_file
    371675 ± 20%    +110.6%     782791 ± 14%  numa-vmstat.node1.numa_hit
    308028 ± 15%    +119.6%     676503 ± 17%  numa-vmstat.node1.numa_local
      6696 ±  5%    +137.8%      15926 ±  4%  proc-vmstat.nr_active_anon
     20429 ±  2%    +669.6%     157215 ±  3%  proc-vmstat.nr_active_file
     68239          +792.2%     608838 ±  4%  proc-vmstat.nr_dirtied
    830778           +24.5%    1034073        proc-vmstat.nr_file_pages
     12345          +461.9%      69366 ±  4%  proc-vmstat.nr_inactive_file
     11839            +2.6%      12149        proc-vmstat.nr_mapped
     13753 ±  2%     +68.4%      23164 ±  3%  proc-vmstat.nr_shmem
     26227            +5.6%      27704        proc-vmstat.nr_slab_reclaimable
     74039            +3.7%      76751        proc-vmstat.nr_slab_unreclaimable
     65771          +814.3%     601356 ±  4%  proc-vmstat.nr_written
      6696 ±  5%    +137.8%      15926 ±  4%  proc-vmstat.nr_zone_active_anon
     20429 ±  2%    +669.6%     157215 ±  3%  proc-vmstat.nr_zone_active_file
     12345          +461.9%      69366 ±  4%  proc-vmstat.nr_zone_inactive_file
    175.60 ±  5%     -34.8%     114.53 ± 16%  proc-vmstat.nr_zone_write_pending
    764044           +87.1%    1429348 ±  2%  proc-vmstat.numa_hit
    631430          +105.4%    1296816 ±  2%  proc-vmstat.numa_local
      3253 ±214%    +576.2%      22000 ± 18%  proc-vmstat.numa_pages_migrated
     14628 ±214%    +482.0%      85137        proc-vmstat.numa_pte_updates
     42468 ±  2%    +635.4%     312332 ±  3%  proc-vmstat.pgactivate
    899623           +77.5%    1596721 ±  2%  proc-vmstat.pgalloc_normal
    581637            +2.2%     594350        proc-vmstat.pgfault
    875752           +51.7%    1328666 ±  2%  proc-vmstat.pgfree
      3253 ±214%    +576.2%      22000 ± 18%  proc-vmstat.pgmigrate_success
    405822          +834.1%    3790858 ±  5%  proc-vmstat.pgpgout
      4.36 ± 97%      -4.4        0.00        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      4.36 ± 97%      -4.4        0.00        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      4.36 ± 97%      -4.4        0.00        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      4.01 ±101%      -4.0        0.00        perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      3.88 ±101%      -3.9        0.00        perf-profile.calltrace.cycles-pp.handle_softirqs.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      3.22 ±100%      -3.2        0.00        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      3.13 ±100%      -3.1        0.00        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      3.06 ±100%      -3.1        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      3.06 ±100%      -3.1        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      3.06 ±100%      -3.1        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
      3.06 ±100%      -3.1        0.00        perf-profile.calltrace.cycles-pp.execve
      3.05 ±100%      -3.0        0.00        perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
     55.30 ± 31%     +18.0       73.35        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     55.52 ± 32%     +19.1       74.62        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     40.98 ± 59%     +25.5       66.44        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     67.62 ± 38%     +26.3       93.88        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      3.27 ± 88%      -3.0        0.31 ± 19%  perf-profile.children.cycles-pp.__x64_sys_execve
      3.26 ± 88%      -2.9        0.31 ± 19%  perf-profile.children.cycles-pp.do_execveat_common
      3.25 ± 88%      -2.9        0.31 ± 20%  perf-profile.children.cycles-pp.execve
      2.22 ± 89%      -2.0        0.20 ± 24%  perf-profile.children.cycles-pp.bprm_execve
      1.95 ± 94%      -1.8        0.12 ± 16%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      1.75 ± 88%      -1.6        0.17 ± 21%  perf-profile.children.cycles-pp.exec_binprm
      1.71 ± 88%      -1.5        0.17 ± 21%  perf-profile.children.cycles-pp.search_binary_handler
      1.62 ± 88%      -1.5        0.16 ± 21%  perf-profile.children.cycles-pp.load_elf_binary
      0.76 ± 84%      -0.7        0.09 ± 27%  perf-profile.children.cycles-pp.process_one_work
      0.72 ± 88%      -0.6        0.10 ± 25%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.62 ± 88%      -0.6        0.04 ± 71%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.44 ± 87%      -0.4        0.06 ± 13%  perf-profile.children.cycles-pp.__split_vma
      0.36 ± 81%      -0.3        0.04 ± 73%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.27 ± 28%      +0.1        0.36 ±  5%  perf-profile.children.cycles-pp.sched_clock_idle_wakeup_event
      0.15 ± 65%      +0.1        0.28 ±  9%  perf-profile.children.cycles-pp.call_cpuidle
      0.19 ± 75%      +0.2        0.34 ±  8%  perf-profile.children.cycles-pp.ct_idle_enter
      0.25 ± 46%      +0.2        0.41 ± 10%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
     56.04 ± 30%     +18.1       74.12        perf-profile.children.cycles-pp.cpuidle_enter_state
     56.44 ± 30%     +18.3       74.76        perf-profile.children.cycles-pp.cpuidle_enter
     41.17 ± 59%     +25.4       66.56        perf-profile.children.cycles-pp.intel_idle
      0.26 ± 33%      +0.1        0.36 ±  5%  perf-profile.self.cycles-pp.sched_clock_idle_wakeup_event
      0.14 ± 63%      +0.1        0.26 ± 11%  perf-profile.self.cycles-pp.call_cpuidle
      0.41 ± 86%      +0.4        0.80 ±  6%  perf-profile.self.cycles-pp.tick_nohz_stop_tick
     41.17 ± 59%     +25.4       66.55        perf-profile.self.cycles-pp.intel_idle


***************************************************************************************************
lkp-icl-2sp8: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/1HDD/xfs/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/mknod/stress-ng/60s

commit: 
  f38181d295 ("block: remove blk_flush_policy")
  c1f56c404a ("block: move cache control settings out of queue->flags")

f38181d2955c3dec c1f56c404a65ba2a006b03e77b5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.878e+09           -13.0%  3.373e+09 ±  4%  cpuidle..time
   1447581 ±  3%    +623.2%   10469416 ± 19%  cpuidle..usage
     97.83           -12.1%      85.99 ±  3%  iostat.cpu.idle
      1.51 ±  5%    +767.1%      13.09 ± 24%  iostat.cpu.system
    159150 ± 10%     +61.6%     257157 ± 28%  numa-numastat.node0.numa_hit
    149123 ± 19%    +122.7%     332156 ± 18%  numa-numastat.node1.local_node
    182349 ± 10%     +94.3%     354371 ± 20%  numa-numastat.node1.numa_hit
      3136 ± 45%   +7012.0%     223032 ± 77%  numa-meminfo.node0.Active
      3054 ± 46%   +7198.5%     222958 ± 77%  numa-meminfo.node0.Active(anon)
     40598 ± 19%    +623.8%     293857 ± 45%  numa-meminfo.node1.Active
     40537 ± 19%    +624.7%     293789 ± 45%  numa-meminfo.node1.Active(anon)
     65965 ± 51%    +471.6%     377067 ± 45%  numa-meminfo.node1.Shmem
     33.83 ± 23%    +693.1%     268.33 ± 13%  perf-c2c.DRAM.local
    862.33 ±  2%   +1191.3%      11135 ± 14%  perf-c2c.DRAM.remote
      1092 ±  3%   +1324.5%      15565 ± 14%  perf-c2c.HITM.local
    685.33 ±  3%   +1156.3%       8610 ± 14%  perf-c2c.HITM.remote
      1778 ±  2%   +1259.7%      24175 ± 14%  perf-c2c.HITM.total
     97.85           -12.1%      86.02 ±  3%  vmstat.cpu.id
      1000 ±  6%   +5517.0%      56182 ± 17%  vmstat.io.bo
      3.12 ± 29%    +318.3%      13.03 ± 21%  vmstat.procs.r
     18585 ±  4%   +1706.0%     335649 ± 19%  vmstat.system.cs
     27924 ±  2%    +692.0%     221161 ± 18%  vmstat.system.in
     97.83           -12.2       85.61 ±  3%  mpstat.cpu.all.idle%
      0.06 ±  5%      +0.4        0.44 ± 21%  mpstat.cpu.all.irq%
      0.03 ±  5%      +0.1        0.08 ± 20%  mpstat.cpu.all.soft%
      1.44 ±  5%     +11.5       12.96 ± 24%  mpstat.cpu.all.sys%
      0.65 ±  5%      +0.3        0.91 ±  9%  mpstat.cpu.all.usr%
      4.33 ±172%    +653.8%      32.67 ± 56%  mpstat.max_utilization.seconds
      5.02 ±  2%    +412.3%      25.72 ± 11%  mpstat.max_utilization_pct
     96301 ±  6%   +1651.4%    1686652 ± 19%  stress-ng.mknod.ops
      1603 ±  6%   +1653.1%      28110 ± 19%  stress-ng.mknod.ops_per_sec
     19937 ±  6%    +546.5%     128897 ± 27%  stress-ng.time.involuntary_context_switches
     25888            +7.8%      27915        stress-ng.time.minor_page_faults
     77.17 ±  5%    +892.2%     765.67 ± 24%  stress-ng.time.percent_of_cpu_this_job_got
     46.41 ±  5%    +876.9%     453.38 ± 24%  stress-ng.time.system_time
    308188 ±  6%   +2192.0%    7063785 ± 19%  stress-ng.time.voluntary_context_switches
    763.23 ± 46%   +7172.8%      55507 ± 77%  numa-vmstat.node0.nr_active_anon
    763.23 ± 46%   +7172.8%      55507 ± 77%  numa-vmstat.node0.nr_zone_active_anon
    158772 ± 10%     +61.5%     256395 ± 28%  numa-vmstat.node0.numa_hit
     10143 ± 19%    +621.5%      73185 ± 45%  numa-vmstat.node1.nr_active_anon
     16424 ± 51%    +473.1%      94125 ± 45%  numa-vmstat.node1.nr_shmem
     10142 ± 19%    +621.6%      73185 ± 45%  numa-vmstat.node1.nr_zone_active_anon
    181517 ± 10%     +94.7%     353338 ± 20%  numa-vmstat.node1.numa_hit
    148291 ± 19%    +123.3%     331123 ± 18%  numa-vmstat.node1.numa_local
     43877 ± 15%   +1077.8%     516805 ± 53%  meminfo.Active
     43735 ± 15%   +1081.3%     516663 ± 53%  meminfo.Active(anon)
   3287422           +16.2%    3820610 ±  8%  meminfo.Cached
   1436646           +36.9%    1966897 ± 16%  meminfo.Committed_AS
    725586            +8.5%     787221 ±  5%  meminfo.Inactive
    724410            +8.5%     786045 ±  5%  meminfo.Inactive(anon)
    109707           +52.0%     166757 ± 20%  meminfo.Mapped
   5074659           +10.6%    5612053 ±  5%  meminfo.Memused
    126847 ±  5%    +420.3%     660042 ± 47%  meminfo.Shmem
      5650 ±  4%    +620.2%      40690 ± 24%  sched_debug.cfs_rq:/.avg_vruntime.avg
     31940 ± 17%    +148.2%      79261 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.max
      1062 ±  5%   +2377.8%      26318 ± 28%  sched_debug.cfs_rq:/.avg_vruntime.min
      5366 ± 11%    +132.8%      12489 ± 16%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      5650 ±  4%    +620.2%      40690 ± 24%  sched_debug.cfs_rq:/.min_vruntime.avg
     31940 ± 17%    +148.2%      79261 ± 20%  sched_debug.cfs_rq:/.min_vruntime.max
      1062 ±  5%   +2377.7%      26318 ± 28%  sched_debug.cfs_rq:/.min_vruntime.min
      5366 ± 11%    +132.8%      12489 ± 16%  sched_debug.cfs_rq:/.min_vruntime.stddev
    753036 ±  4%     -38.2%     465593 ±  6%  sched_debug.cpu.avg_idle.avg
     72649 ± 54%     -80.5%      14175 ± 34%  sched_debug.cpu.avg_idle.min
    807.41           +30.7%       1055 ±  9%  sched_debug.cpu.curr->pid.stddev
     10905 ±  4%   +1420.0%     165759 ± 19%  sched_debug.cpu.nr_switches.avg
     21577 ± 13%   +1055.6%     249353 ± 16%  sched_debug.cpu.nr_switches.max
      7485 ±  4%   +1285.3%     103696 ± 22%  sched_debug.cpu.nr_switches.min
      2748 ± 10%   +1914.7%      55373 ± 16%  sched_debug.cpu.nr_switches.stddev
     20.08 ± 19%   +1051.0%     231.17 ± 22%  sched_debug.cpu.nr_uninterruptible.max
    -23.58         +6624.4%      -1585        sched_debug.cpu.nr_uninterruptible.min
      7.30 ± 12%   +3199.4%     240.80 ± 25%  sched_debug.cpu.nr_uninterruptible.stddev
     10898 ± 15%   +1082.1%     128822 ± 53%  proc-vmstat.nr_active_anon
    822019           +16.2%     955223 ±  8%  proc-vmstat.nr_file_pages
    181025            +8.6%     196659 ±  5%  proc-vmstat.nr_inactive_anon
     15999            +1.8%      16281        proc-vmstat.nr_kernel_stack
     27575           +52.5%      42042 ± 20%  proc-vmstat.nr_mapped
     31615 ±  5%    +421.3%     164821 ± 47%  proc-vmstat.nr_shmem
     24266            +2.8%      24936        proc-vmstat.nr_slab_reclaimable
     43154            +2.0%      44019        proc-vmstat.nr_slab_unreclaimable
     10898 ± 15%   +1082.1%     128822 ± 53%  proc-vmstat.nr_zone_active_anon
    181025            +8.6%     196659 ±  5%  proc-vmstat.nr_zone_inactive_anon
      5196 ±147%    +429.2%      27502 ± 78%  proc-vmstat.numa_hint_faults
      2521 ±222%    +389.1%      12332 ± 85%  proc-vmstat.numa_hint_faults_local
    343543           +78.5%     613373 ± 21%  proc-vmstat.numa_hit
    277196 ±  2%     +97.3%     546964 ± 23%  proc-vmstat.numa_local
     26816 ±141%    +238.9%      90878 ± 48%  proc-vmstat.numa_pte_updates
     32693 ± 23%    +489.8%     192836 ± 46%  proc-vmstat.pgactivate
    384678           +70.4%     655682 ± 19%  proc-vmstat.pgalloc_normal
    265381 ±  3%     +37.8%     365568 ± 11%  proc-vmstat.pgfault
    370995 ±  2%     +17.2%     434655 ±  3%  proc-vmstat.pgfree
     63484 ±  6%   +5533.6%    3576444 ± 17%  proc-vmstat.pgpgout
      1.75           +44.6%       2.53 ±  7%  perf-stat.i.MPKI
 6.837e+08 ±  3%    +322.8%   2.89e+09 ± 19%  perf-stat.i.branch-instructions
      2.56 ±  3%      -0.8        1.75 ± 16%  perf-stat.i.branch-miss-rate%
  29128581 ±  4%     +69.8%   49470327 ±  9%  perf-stat.i.branch-misses
   3130854 ±  3%   +1060.8%   36342557 ± 22%  perf-stat.i.cache-misses
  16389622 ±  3%    +970.1%  1.754e+08 ± 19%  perf-stat.i.cache-references
     19156 ±  5%   +1728.2%     350223 ± 19%  perf-stat.i.context-switches
 5.497e+09 ±  3%    +583.1%  3.755e+10 ± 22%  perf-stat.i.cpu-cycles
    511.70 ±  3%   +2562.8%      13625 ± 17%  perf-stat.i.cpu-migrations
      1748 ±  2%     -35.6%       1125 ±  9%  perf-stat.i.cycles-between-cache-misses
 3.346e+09 ±  3%    +331.0%  1.442e+10 ± 18%  perf-stat.i.instructions
      3310 ±  4%     +50.1%       4968 ± 13%  perf-stat.i.minor-faults
      3310 ±  4%     +50.1%       4968 ± 13%  perf-stat.i.page-faults
      0.94 ±  3%    +167.5%       2.50 ±  4%  perf-stat.overall.MPKI
      4.26 ±  2%      -2.5        1.74 ± 10%  perf-stat.overall.branch-miss-rate%
     19.04            +1.6       20.61 ±  4%  perf-stat.overall.cache-miss-rate%
      1.65 ±  3%     +57.0%       2.59 ±  5%  perf-stat.overall.cpi
      1761 ±  2%     -41.3%       1033 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.61 ±  3%     -36.2%       0.39 ±  5%  perf-stat.overall.ipc
 6.736e+08 ±  3%    +321.8%  2.841e+09 ± 19%  perf-stat.ps.branch-instructions
  28677894 ±  4%     +69.5%   48611026 ±  9%  perf-stat.ps.branch-misses
   3083254 ±  3%   +1058.4%   35715906 ± 22%  perf-stat.ps.cache-misses
  16194014 ±  3%    +964.9%  1.724e+08 ± 19%  perf-stat.ps.cache-references
     18866 ±  5%   +1724.0%     344128 ± 19%  perf-stat.ps.context-switches
  5.43e+09 ±  3%    +580.2%  3.693e+10 ± 22%  perf-stat.ps.cpu-cycles
    503.41 ±  3%   +2559.8%      13389 ± 17%  perf-stat.ps.cpu-migrations
 3.298e+09 ±  3%    +329.9%  1.418e+10 ± 18%  perf-stat.ps.instructions
      3256 ±  4%     +49.9%       4882 ± 13%  perf-stat.ps.minor-faults
      3256 ±  4%     +49.9%       4882 ± 13%  perf-stat.ps.page-faults
 2.025e+11 ±  3%    +328.7%  8.684e+11 ± 18%  perf-stat.total.instructions
     56.34 ±  5%     -12.0       44.31 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.work_grab_pending.mod_delayed_work_on.xfs_inodegc_queue_all
     57.07 ±  5%     -11.5       45.58 ±  9%  perf-profile.calltrace.cycles-pp._raw_spin_lock.work_grab_pending.mod_delayed_work_on.xfs_inodegc_queue_all.xfs_fs_statfs
     58.95 ±  5%     -10.6       48.34 ±  9%  perf-profile.calltrace.cycles-pp.work_grab_pending.mod_delayed_work_on.xfs_inodegc_queue_all.xfs_fs_statfs.statfs_by_dentry
     61.86 ±  5%     -10.2       51.66 ±  8%  perf-profile.calltrace.cycles-pp.mod_delayed_work_on.xfs_inodegc_queue_all.xfs_fs_statfs.statfs_by_dentry.user_statfs
     62.12 ±  4%      -9.7       52.43 ±  8%  perf-profile.calltrace.cycles-pp.xfs_inodegc_queue_all.xfs_fs_statfs.statfs_by_dentry.user_statfs.__do_sys_statfs
     64.10 ±  4%      -8.2       55.93 ±  6%  perf-profile.calltrace.cycles-pp.xfs_fs_statfs.statfs_by_dentry.user_statfs.__do_sys_statfs.do_syscall_64
     64.12 ±  4%      -8.2       55.97 ±  6%  perf-profile.calltrace.cycles-pp.statfs_by_dentry.user_statfs.__do_sys_statfs.do_syscall_64.entry_SYSCALL_64_after_hwframe
     64.52 ±  4%      -7.8       56.67 ±  6%  perf-profile.calltrace.cycles-pp.user_statfs.__do_sys_statfs.do_syscall_64.entry_SYSCALL_64_after_hwframe.statfs64
     64.64 ±  4%      -7.8       56.80 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.statfs64
     64.64 ±  4%      -7.8       56.81 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.statfs64
     64.55 ±  4%      -7.8       56.73 ±  6%  perf-profile.calltrace.cycles-pp.__do_sys_statfs.do_syscall_64.entry_SYSCALL_64_after_hwframe.statfs64
     64.71 ±  4%      -7.8       56.92 ±  6%  perf-profile.calltrace.cycles-pp.statfs64
     10.20 ± 10%      -7.7        2.47 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     12.19 ±  9%      -3.0        9.16 ±  9%  perf-profile.calltrace.cycles-pp.common_startup_64
     11.11 ±  9%      -3.0        8.10 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     11.81 ±  9%      -2.9        8.96 ±  9%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     11.82 ±  9%      -2.8        8.97 ±  9%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     11.82 ±  9%      -2.8        8.97 ±  9%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     10.03 ±  9%      -2.7        7.32 ±  9%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     10.22 ±  9%      -2.6        7.62 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     10.18 ±  9%      -2.6        7.58 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      3.32 ±  9%      -2.3        1.04 ±  6%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      5.22 ±  9%      -1.5        3.69 ±  9%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      4.67 ±  7%      -1.5        3.21 ±  7%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.sync_bdevs.ksys_sync.__x64_sys_sync
      4.79 ±  7%      -1.4        3.36 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock.sync_bdevs.ksys_sync.__x64_sys_sync.do_syscall_64
      2.00 ±  9%      -1.4        0.59 ±  6%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter
      4.89 ±  7%      -1.4        3.50 ±  6%  perf-profile.calltrace.cycles-pp.sync_bdevs.ksys_sync.__x64_sys_sync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.93 ±  9%      -1.4        0.58 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
      0.70 ±  9%      -0.3        0.38 ± 71%  perf-profile.calltrace.cycles-pp.remove_wait_queue.xlog_cil_force_seq.xfs_log_force.xfs_fs_sync_fs.iterate_supers
      0.70 ±  9%      -0.3        0.38 ± 71%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_cil_force_seq.xfs_log_force.xfs_fs_sync_fs
      0.69 ±  9%      -0.3        0.37 ± 71%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_queue.xlog_cil_force_seq.xfs_log_force
      0.72 ±  8%      -0.2        0.55 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.xfs_fs_sync_fs
      0.73 ±  7%      -0.2        0.57 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.xfs_fs_sync_fs.iterate_supers
      0.74 ±  7%      -0.2        0.57 ±  7%  perf-profile.calltrace.cycles-pp.remove_wait_queue.xlog_wait_on_iclog.xfs_fs_sync_fs.iterate_supers.ksys_sync
      2.78 ±  4%      +0.3        3.09 ±  2%  perf-profile.calltrace.cycles-pp.__queue_work.mod_delayed_work_on.xfs_inodegc_queue_all.xfs_fs_statfs.statfs_by_dentry
      2.69 ±  7%      +0.3        3.01 ±  7%  perf-profile.calltrace.cycles-pp.xlog_cil_force_seq.xfs_log_force.xfs_fs_sync_fs.iterate_supers.ksys_sync
      1.74 ±  8%      +0.5        2.22 ±  9%  perf-profile.calltrace.cycles-pp.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force.xfs_fs_sync_fs.iterate_supers
      0.39 ± 71%      +0.5        0.86 ± 18%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__percpu_counter_sum.xfs_fs_statfs.statfs_by_dentry.user_statfs
      2.74 ±  7%      +0.5        3.23 ±  8%  perf-profile.calltrace.cycles-pp.xfs_log_force.xfs_fs_sync_fs.iterate_supers.ksys_sync.__x64_sys_sync
      0.69 ± 11%      +0.5        1.19 ± 10%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      0.70 ± 12%      +0.5        1.20 ± 10%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.61 ±  7%      +0.5        2.12 ±  9%  perf-profile.calltrace.cycles-pp.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force.xfs_fs_sync_fs
      3.76 ±  7%      +0.5        4.30 ±  6%  perf-profile.calltrace.cycles-pp.xfs_fs_sync_fs.iterate_supers.ksys_sync.__x64_sys_sync.do_syscall_64
      0.41 ± 70%      +0.6        0.96 ± 12%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.pick_next_task_fair.__schedule.schedule.worker_thread
      0.41 ± 70%      +0.6        0.97 ± 12%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.worker_thread.kthread
      0.00            +0.6        0.60 ± 12%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.6        0.62 ± 12%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      0.00            +0.6        0.62 ± 12%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +0.6        0.63 ±  9%  perf-profile.calltrace.cycles-pp._find_next_or_bit.__percpu_counter_sum.xfs_fs_statfs.statfs_by_dentry.user_statfs
      0.00            +0.6        0.64 ± 11%  perf-profile.calltrace.cycles-pp.xfs_dialloc_ag.xfs_dialloc.xfs_create.xfs_generic_create.vfs_mknod
      0.56 ± 10%      +0.6        1.21 ± 11%  perf-profile.calltrace.cycles-pp.xfs_create.xfs_generic_create.vfs_create.do_mknodat.__x64_sys_mknodat
      0.00            +0.7        0.65 ± 12%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single
      0.00            +0.7        0.65 ± 13%  perf-profile.calltrace.cycles-pp.xlog_state_do_iclog_callbacks.xlog_state_do_callback.xlog_ioend_work.process_one_work.worker_thread
      0.00            +0.7        0.66 ± 14%  perf-profile.calltrace.cycles-pp.xlog_state_do_callback.xlog_ioend_work.process_one_work.worker_thread.kthread
      0.57 ± 10%      +0.7        1.23 ± 10%  perf-profile.calltrace.cycles-pp.xfs_generic_create.vfs_create.do_mknodat.__x64_sys_mknodat.do_syscall_64
      0.00            +0.7        0.66 ± 13%  perf-profile.calltrace.cycles-pp.xlog_ioend_work.process_one_work.worker_thread.kthread.ret_from_fork
      0.58 ± 10%      +0.7        1.24 ± 10%  perf-profile.calltrace.cycles-pp.vfs_create.do_mknodat.__x64_sys_mknodat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.68 ± 14%  perf-profile.calltrace.cycles-pp.xlog_cil_push_work.process_one_work.worker_thread.kthread.ret_from_fork
      0.48 ± 44%      +0.7        1.16 ± 10%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      0.70 ±  7%      +0.7        1.43 ± 10%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt
      0.73 ±  6%      +0.8        1.49 ± 10%  perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter
      0.77 ± 13%      +0.8        1.53 ± 11%  perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_create.xfs_generic_create.vfs_mknod.do_mknodat
      0.60 ± 45%      +0.8        1.38 ± 11%  perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_create.xfs_generic_create.vfs_mknod
      0.50 ± 46%      +0.8        1.29 ± 12%  perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.00            +0.8        0.82 ± 10%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single
      1.79 ± 14%      +0.8        2.63 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.iterate_supers.ksys_sync.__x64_sys_sync
      0.55 ± 46%      +0.9        1.42 ± 12%  perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work
      0.98 ±  7%      +0.9        1.88 ± 10%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      0.49 ± 45%      +0.9        1.39 ± 10%  perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
      0.26 ±100%      +0.9        1.19 ± 11%  perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_remove.xfs_vn_unlink.vfs_unlink
      0.46 ± 44%      +1.0        1.44 ± 14%  perf-profile.calltrace.cycles-pp.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink
      1.93 ± 14%      +1.0        2.91 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock.iterate_supers.ksys_sync.__x64_sys_sync.do_syscall_64
      0.47 ± 44%      +1.0        1.46 ± 14%  perf-profile.calltrace.cycles-pp.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_remove
      0.49 ± 45%      +1.0        1.53 ± 14%  perf-profile.calltrace.cycles-pp.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.xfs_create
      0.50 ± 45%      +1.0        1.54 ± 14%  perf-profile.calltrace.cycles-pp.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.xfs_create.xfs_generic_create
      0.50 ± 44%      +1.1        1.56 ± 14%  perf-profile.calltrace.cycles-pp.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_remove.xfs_vn_unlink
      0.52 ± 45%      +1.1        1.58 ± 14%  perf-profile.calltrace.cycles-pp.xfs_ialloc_read_agi.xfs_dialloc.xfs_create.xfs_generic_create.vfs_mknod
      0.51 ± 44%      +1.1        1.58 ± 14%  perf-profile.calltrace.cycles-pp.xfs_read_agi.xfs_iunlink.xfs_remove.xfs_vn_unlink.vfs_unlink
      0.36 ± 71%      +1.1        1.44 ± 14%  perf-profile.calltrace.cycles-pp.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc
      0.90 ±  9%      +1.1        2.04 ± 15%  perf-profile.calltrace.cycles-pp.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_difree
      0.56 ± 44%      +1.2        1.73 ± 14%  perf-profile.calltrace.cycles-pp.xfs_iunlink.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
      0.92 ±  9%      +1.2        2.10 ± 15%  perf-profile.calltrace.cycles-pp.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_difree.xfs_ifree
      0.92 ±  9%      +1.2        2.11 ± 15%  perf-profile.calltrace.cycles-pp.xfs_read_agi.xfs_ialloc_read_agi.xfs_difree.xfs_ifree.xfs_inactive_ifree
      0.94 ±  9%      +1.2        2.13 ± 15%  perf-profile.calltrace.cycles-pp.xfs_ialloc_read_agi.xfs_difree.xfs_ifree.xfs_inactive_ifree.xfs_inactive
      0.98 ± 15%      +1.3        2.29 ± 13%  perf-profile.calltrace.cycles-pp.xfs_dialloc.xfs_create.xfs_generic_create.vfs_mknod.do_mknodat
      1.80 ±  8%      +1.4        3.15 ± 15%  perf-profile.calltrace.cycles-pp.__percpu_counter_sum.xfs_fs_statfs.statfs_by_dentry.user_statfs.__do_sys_statfs
      1.29 ± 10%      +1.5        2.81 ± 13%  perf-profile.calltrace.cycles-pp.xfs_difree.xfs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      1.38 ± 10%      +1.6        3.00 ± 13%  perf-profile.calltrace.cycles-pp.xfs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work
      6.24 ±  9%      +1.9        8.18 ±  8%  perf-profile.calltrace.cycles-pp.iterate_supers.ksys_sync.__x64_sys_sync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.25 ± 24%      +2.2        3.44 ± 14%  perf-profile.calltrace.cycles-pp.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi
      0.26 ±100%      +2.2        2.50 ± 29%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.sched_balance_find_src_group.sched_balance_rq.sched_balance_newidle
      1.49 ± 12%      +2.3        3.79 ± 12%  perf-profile.calltrace.cycles-pp.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat.__x64_sys_unlink
      1.49 ± 11%      +2.3        3.80 ± 12%  perf-profile.calltrace.cycles-pp.xfs_vn_unlink.vfs_unlink.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.69 ± 11%      +2.3        3.00 ± 22%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.pick_next_task_fair.__schedule.schedule.schedule_timeout
      1.56 ± 11%      +2.4        3.92 ± 12%  perf-profile.calltrace.cycles-pp.vfs_unlink.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.38 ± 70%      +2.4        2.80 ± 27%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.sched_balance_find_src_group.sched_balance_rq.sched_balance_newidle.pick_next_task_fair
      0.70 ± 11%      +2.4        3.14 ± 16%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.___down_common
      2.26 ± 12%      +2.5        4.74 ± 11%  perf-profile.calltrace.cycles-pp.xfs_create.xfs_generic_create.vfs_mknod.do_mknodat.__x64_sys_mknodat
      0.38 ± 70%      +2.5        2.86 ± 27%  perf-profile.calltrace.cycles-pp.sched_balance_find_src_group.sched_balance_rq.sched_balance_newidle.pick_next_task_fair.__schedule
      2.07 ± 10%      +2.5        4.58 ± 12%  perf-profile.calltrace.cycles-pp.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work.worker_thread
      2.08 ± 10%      +2.5        4.60 ± 12%  perf-profile.calltrace.cycles-pp.xfs_inactive.xfs_inodegc_worker.process_one_work.worker_thread.kthread
      2.33 ± 12%      +2.5        4.84 ± 11%  perf-profile.calltrace.cycles-pp.xfs_generic_create.vfs_mknod.do_mknodat.__x64_sys_mknodat.do_syscall_64
      2.37 ± 12%      +2.6        4.92 ± 11%  perf-profile.calltrace.cycles-pp.vfs_mknod.do_mknodat.__x64_sys_mknodat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.00 ± 29%      +2.6        3.60 ± 20%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_newidle.pick_next_task_fair.__schedule.schedule
      2.18 ± 10%      +2.6        4.81 ± 12%  perf-profile.calltrace.cycles-pp.xfs_inodegc_worker.process_one_work.worker_thread.kthread.ret_from_fork
      2.54 ±  8%      +3.1        5.61 ± 11%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.62 ±  8%      +3.1        5.76 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.66 ±  8%      +3.2        5.86 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.67 ±  8%      +3.2        5.87 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      3.04 ± 10%      +3.3        6.34 ± 11%  perf-profile.calltrace.cycles-pp.do_mknodat.__x64_sys_mknodat.do_syscall_64.entry_SYSCALL_64_after_hwframe.mknodat
      2.76 ±  8%      +3.3        6.06 ± 11%  perf-profile.calltrace.cycles-pp.unlink
      3.08 ± 10%      +3.3        6.42 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_mknodat.do_syscall_64.entry_SYSCALL_64_after_hwframe.mknodat
      1.40 ± 36%      +3.3        4.74 ± 14%  perf-profile.calltrace.cycles-pp.xfs_buf_lookup.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi
      0.77 ±  9%      +3.4        4.15 ± 15%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.___down_common.__down
      3.12 ± 10%      +3.4        6.51 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mknodat
      3.12 ± 10%      +3.4        6.51 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mknodat
      1.10 ± 28%      +3.4        4.50 ± 15%  perf-profile.calltrace.cycles-pp.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup.xfs_buf_get_map
      1.20 ± 26%      +3.4        4.61 ± 15%  perf-profile.calltrace.cycles-pp.xfs_buf_find_lock.xfs_buf_lookup.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map
      1.10 ± 28%      +3.4        4.53 ± 15%  perf-profile.calltrace.cycles-pp.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup.xfs_buf_get_map.xfs_buf_read_map
      0.79 ±  9%      +3.4        4.22 ± 15%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.___down_common.__down.down
      1.00 ± 27%      +3.4        4.45 ± 15%  perf-profile.calltrace.cycles-pp.___down_common.__down.down.xfs_buf_lock.xfs_buf_find_lock
      3.18 ± 10%      +3.5        6.63 ± 11%  perf-profile.calltrace.cycles-pp.mknodat
      0.81 ±  9%      +3.5        4.31 ± 15%  perf-profile.calltrace.cycles-pp.schedule_timeout.___down_common.__down.down.xfs_buf_lock
      0.92 ± 24%      +3.5        4.45 ± 15%  perf-profile.calltrace.cycles-pp.__down.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup
      2.64 ±  9%      +3.7        6.37 ± 12%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.69 ±  7%      +4.0        7.64 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      3.93 ±  8%      +4.1        8.07 ± 11%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      3.93 ±  8%      +4.1        8.07 ± 11%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      3.93 ±  8%      +4.1        8.07 ± 11%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      3.73 ±  9%      +4.3        8.03 ± 11%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     67.21 ±  3%     -13.0       54.17 ±  8%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     67.19 ±  3%     -11.1       56.12 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock
     59.18 ±  5%     -10.6       48.55 ±  9%  perf-profile.children.cycles-pp.work_grab_pending
     62.10 ±  5%     -10.2       51.90 ±  8%  perf-profile.children.cycles-pp.mod_delayed_work_on
     62.12 ±  4%      -9.7       52.44 ±  8%  perf-profile.children.cycles-pp.xfs_inodegc_queue_all
     64.11 ±  4%      -8.2       55.93 ±  6%  perf-profile.children.cycles-pp.xfs_fs_statfs
     64.12 ±  4%      -8.2       55.97 ±  6%  perf-profile.children.cycles-pp.statfs_by_dentry
     64.52 ±  4%      -7.8       56.67 ±  6%  perf-profile.children.cycles-pp.user_statfs
     64.55 ±  4%      -7.8       56.73 ±  6%  perf-profile.children.cycles-pp.__do_sys_statfs
     64.72 ±  4%      -7.8       56.94 ±  6%  perf-profile.children.cycles-pp.statfs64
      7.29 ±  9%      -5.2        2.13 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     11.47 ±  9%      -3.2        8.28 ±  9%  perf-profile.children.cycles-pp.cpuidle_idle_call
     12.18 ±  9%      -3.0        9.15 ±  9%  perf-profile.children.cycles-pp.do_idle
     12.19 ±  9%      -3.0        9.16 ±  9%  perf-profile.children.cycles-pp.common_startup_64
     12.19 ±  9%      -3.0        9.16 ±  9%  perf-profile.children.cycles-pp.cpu_startup_entry
     10.37 ±  9%      -2.9        7.46 ±  9%  perf-profile.children.cycles-pp.acpi_idle_enter
     10.36 ±  9%      -2.9        7.45 ±  9%  perf-profile.children.cycles-pp.acpi_safe_halt
     11.82 ±  9%      -2.8        8.97 ±  9%  perf-profile.children.cycles-pp.start_secondary
     10.53 ±  9%      -2.8        7.74 ±  9%  perf-profile.children.cycles-pp.cpuidle_enter_state
     10.57 ±  9%      -2.8        7.78 ±  9%  perf-profile.children.cycles-pp.cpuidle_enter
      3.74 ±  7%      -2.4        1.38 ±  6%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      2.30 ±  7%      -1.5        0.81 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.23 ±  7%      -1.4        0.79 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      4.89 ±  7%      -1.4        3.50 ±  6%  perf-profile.children.cycles-pp.sync_bdevs
      1.25 ±  7%      -0.7        0.52 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.20 ±  6%      -0.7        0.49 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.98 ± 11%      -0.7        0.30 ±  5%  perf-profile.children.cycles-pp.ktime_get
      1.23 ±  8%      -0.6        0.59 ±  9%  perf-profile.children.cycles-pp.irq_exit_rcu
      1.15 ±  8%      -0.6        0.51 ± 10%  perf-profile.children.cycles-pp.handle_softirqs
      0.78 ± 12%      -0.6        0.22 ±  5%  perf-profile.children.cycles-pp.clockevents_program_event
      0.92 ±  5%      -0.5        0.42 ±  5%  perf-profile.children.cycles-pp.update_process_times
      1.44 ±  6%      -0.3        1.11 ±  8%  perf-profile.children.cycles-pp.remove_wait_queue
      0.40 ±  3%      -0.3        0.11 ±  9%  perf-profile.children.cycles-pp.sched_balance_domains
      0.63 ± 11%      -0.3        0.35 ± 10%  perf-profile.children.cycles-pp.menu_select
      0.32 ± 17%      -0.2        0.08 ±  6%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.43 ±  7%      -0.2        0.23 ±  5%  perf-profile.children.cycles-pp.sched_tick
      0.37 ±  9%      -0.2        0.19 ± 13%  perf-profile.children.cycles-pp.rest_init
      0.37 ±  9%      -0.2        0.19 ± 13%  perf-profile.children.cycles-pp.start_kernel
      0.37 ±  9%      -0.2        0.19 ± 13%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.37 ±  9%      -0.2        0.19 ± 13%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.20 ± 16%      -0.2        0.03 ± 70%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.19 ± 13%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.43 ± 15%      -0.1        0.31 ± 10%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.17 ± 13%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.get_jiffies_update
      0.16 ± 13%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.sched_balance_softirq
      0.28 ± 12%      -0.1        0.19 ± 10%  perf-profile.children.cycles-pp.rcu_core
      0.26 ± 15%      -0.1        0.18 ± 10%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.22 ± 11%      -0.1        0.14 ± 10%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.22 ± 19%      -0.1        0.15 ±  7%  perf-profile.children.cycles-pp.tick_irq_enter
      0.09 ± 19%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.main
      0.09 ± 19%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.run_builtin
      0.09 ± 10%      -0.0        0.06 ± 16%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.06 ± 19%      +0.0        0.09 ± 11%  perf-profile.children.cycles-pp.__d_alloc
      0.08 ±  9%      +0.0        0.11 ±  9%  perf-profile.children.cycles-pp.__wake_up_common
      0.05 ± 47%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp._atomic_dec_and_lock
      0.06 ± 14%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.xfs_dir_lookup
      0.08 ± 24%      +0.0        0.11 ±  9%  perf-profile.children.cycles-pp.d_alloc
      0.06 ± 16%      +0.0        0.10 ±  9%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.04 ± 71%      +0.0        0.08 ± 16%  perf-profile.children.cycles-pp.security_file_alloc
      0.08 ± 20%      +0.0        0.12 ± 10%  perf-profile.children.cycles-pp._IO_default_xsputn
      0.04 ± 45%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp.inode_init_always
      0.03 ±100%      +0.0        0.07 ± 14%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.07 ± 14%      +0.0        0.11 ± 12%  perf-profile.children.cycles-pp.xfs_lookup
      0.05 ± 47%      +0.0        0.09 ± 14%  perf-profile.children.cycles-pp.init_file
      0.06 ± 16%      +0.0        0.10 ±  9%  perf-profile.children.cycles-pp.filename_create
      0.03 ±100%      +0.0        0.07 ± 14%  perf-profile.children.cycles-pp.list_lru_add
      0.07 ± 17%      +0.0        0.12 ± 10%  perf-profile.children.cycles-pp.path_put
      0.10 ± 19%      +0.0        0.15 ± 11%  perf-profile.children.cycles-pp.irqentry_enter
      0.26 ±  4%      +0.0        0.31 ±  7%  perf-profile.children.cycles-pp.xfs_inodegc_queue
      0.08 ± 28%      +0.0        0.12 ± 19%  perf-profile.children.cycles-pp.xlog_ticket_alloc
      0.07 ± 18%      +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.complete
      0.02 ± 99%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.xfs_droplink
      0.03 ±100%      +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.evict
      0.09 ± 18%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.wq_worker_sleeping
      0.01 ±223%      +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.xfs_idata_realloc
      0.08 ± 16%      +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.__wake_up
      0.06 ± 14%      +0.1        0.12 ± 12%  perf-profile.children.cycles-pp.lockref_get_not_dead
      0.02 ±144%      +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.__percpu_counter_compare
      0.08 ± 26%      +0.1        0.13 ± 10%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.09 ± 11%      +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.clear_bhb_loop
      0.04 ± 73%      +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.xfs_dec_freecounter
      0.04 ± 72%      +0.1        0.09 ± 10%  perf-profile.children.cycles-pp.set_nlink
      0.01 ±223%      +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.xfs_defer_finish_noroll
      0.02 ±141%      +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.xlog_prepare_iovec
      0.10 ± 15%      +0.1        0.15 ± 11%  perf-profile.children.cycles-pp.__check_object_size
      0.03 ±100%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.crc32c
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.crc32c_pcl_intel_update
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.xfs_dir2_sf_addname_easy
      0.01 ±223%      +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.03 ±100%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.d_lru_add
      0.01 ±223%      +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.mnt_want_write
      0.07 ± 18%      +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.xfs_vn_lookup
      0.02 ±141%      +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.update_cfs_group
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.xfs_buf_reverify
      0.09 ± 10%      +0.1        0.15 ± 13%  perf-profile.children.cycles-pp.alloc_empty_file
      0.01 ±223%      +0.1        0.07 ± 22%  perf-profile.children.cycles-pp.switch_fpu_return
      0.04 ± 71%      +0.1        0.09 ± 13%  perf-profile.children.cycles-pp.xfs_inode_item_precommit
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.queue_work_on
      0.02 ± 99%      +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.__d_lookup
      0.03 ±100%      +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.check_heap_object
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.kmalloc_trace_noprof
      0.00            +0.1        0.06 ± 19%  perf-profile.children.cycles-pp.scsi_end_request
      0.00            +0.1        0.06 ± 19%  perf-profile.children.cycles-pp.scsi_io_completion
      0.07 ± 16%      +0.1        0.13 ± 14%  perf-profile.children.cycles-pp.lockref_put_return
      0.02 ±141%      +0.1        0.08 ±  9%  perf-profile.children.cycles-pp.xlog_grant_add_space
      0.03 ±100%      +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.d_lookup
      0.05 ± 45%      +0.1        0.12 ± 17%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.xlog_sync
      0.10 ±  9%      +0.1        0.16 ± 10%  perf-profile.children.cycles-pp.__legitimize_path
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.list_lru_del
      0.11 ±  6%      +0.1        0.18 ±  9%  perf-profile.children.cycles-pp.try_to_unlazy
      0.04 ± 71%      +0.1        0.10 ± 16%  perf-profile.children.cycles-pp.xfs_iunlink_remove
      0.03 ±100%      +0.1        0.09 ±  9%  perf-profile.children.cycles-pp.lookup_dcache
      0.02 ±144%      +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.memset_orig
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.xfs_inode_item_pin
      0.01 ±223%      +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.xfs_iunlink_remove_inode
      0.02 ±141%      +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.xfs_trans_precommit_sort
      0.08 ± 17%      +0.1        0.15 ± 11%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.02 ±141%      +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.xlog_state_clean_iclog
      0.15 ± 17%      +0.1        0.22 ±  7%  perf-profile.children.cycles-pp.__cond_resched
      0.04 ± 76%      +0.1        0.11 ± 15%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.xfs_btree_del_cursor
      0.05 ± 49%      +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.xfs_btree_update
      0.01 ±223%      +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.rcu_all_qs
      0.02 ±141%      +0.1        0.09 ± 16%  perf-profile.children.cycles-pp.xfs_inodegc_set_reclaimable
      0.01 ±223%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.__destroy_inode
      0.00            +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.__blk_mq_do_dispatch_sched
      0.00            +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.__blk_mq_sched_dispatch_requests
      0.00            +0.1        0.08 ± 18%  perf-profile.children.cycles-pp.blk_complete_reqs
      0.00            +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.blk_mq_run_hw_queue
      0.00            +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.blk_mq_sched_dispatch_requests
      0.00            +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.08 ± 19%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.xfs_inobt_update
      0.01 ±223%      +0.1        0.09 ± 14%  perf-profile.children.cycles-pp.lock_timer_base
      0.03 ±103%      +0.1        0.11 ± 10%  perf-profile.children.cycles-pp.pwq_dec_nr_in_flight
      0.01 ±223%      +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.update_min_vruntime
      0.01 ±223%      +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.xfs_dir2_sf_removename
      0.08 ± 16%      +0.1        0.15 ± 10%  perf-profile.children.cycles-pp.__switch_to
      0.11 ± 20%      +0.1        0.18 ± 10%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.14 ±  8%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.xfs_iget_recycle
      0.01 ±223%      +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.detach_tasks
      0.08 ± 17%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp.select_task_rq
      0.13 ± 21%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.02 ±141%      +0.1        0.10 ± 13%  perf-profile.children.cycles-pp.d_lru_del
      0.06 ± 47%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.llist_reverse_order
      0.08 ± 12%      +0.1        0.16 ± 11%  perf-profile.children.cycles-pp.up_read
      0.09 ±  7%      +0.1        0.18 ± 11%  perf-profile.children.cycles-pp.__dentry_kill
      0.07 ± 15%      +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.__switch_to_asm
      0.01 ±223%      +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.pwq_tryinc_nr_active
      0.12 ± 19%      +0.1        0.21 ±  7%  perf-profile.children.cycles-pp.wakeup_preempt
      0.10 ±  4%      +0.1        0.19 ± 10%  perf-profile.children.cycles-pp.finish_task_switch
      0.10 ±  9%      +0.1        0.19 ± 10%  perf-profile.children.cycles-pp.complete_walk
      0.03 ±100%      +0.1        0.12 ±  8%  perf-profile.children.cycles-pp.xfs_log_ticket_ungrant
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.blk_mq_dispatch_plug_list
      0.02 ±141%      +0.1        0.10 ± 13%  perf-profile.children.cycles-pp.xfs_buf_item_size_segment
      0.06 ± 47%      +0.1        0.15 ±  8%  perf-profile.children.cycles-pp.xfs_trans_log_inode
      0.09 ± 22%      +0.1        0.18 ± 11%  perf-profile.children.cycles-pp.xfs_dir2_sf_addname
      0.00            +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.__blk_flush_plug
      0.00            +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.blk_mq_flush_plug_list
      0.03 ±100%      +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.down_write
      0.10 ± 23%      +0.1        0.19 ±  7%  perf-profile.children.cycles-pp._find_next_bit
      0.31 ±  4%      +0.1        0.40 ±  5%  perf-profile.children.cycles-pp.destroy_inode
      0.01 ±223%      +0.1        0.10 ± 14%  perf-profile.children.cycles-pp.ahci_handle_port_intr
      0.34 ±  7%      +0.1        0.44 ± 10%  perf-profile.children.cycles-pp.do_sys_openat2
      0.06 ± 45%      +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.set_next_entity
      0.09 ± 23%      +0.1        0.18 ± 11%  perf-profile.children.cycles-pp.xfs_perag_put
      0.07 ± 37%      +0.1        0.16 ± 29%  perf-profile.children.cycles-pp.up_write
      0.00            +0.1        0.09 ± 19%  perf-profile.children.cycles-pp.xfs_trans_ail_update_bulk
      0.35 ±  8%      +0.1        0.44 ± 10%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.01 ±223%      +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.__up
      0.07 ± 47%      +0.1        0.17 ± 11%  perf-profile.children.cycles-pp.xlog_space_left
      0.09 ± 17%      +0.1        0.19 ± 16%  perf-profile.children.cycles-pp.xfs_perag_get
      0.14 ± 14%      +0.1        0.24 ±  8%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.02 ±144%      +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.xfs_iunlink_update_bucket
      0.12 ± 18%      +0.1        0.22 ± 20%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.xfs_inode_item_committed
      0.07 ± 48%      +0.1        0.17 ±  9%  perf-profile.children.cycles-pp.xlog_grant_push_threshold
      0.02 ±142%      +0.1        0.12 ± 12%  perf-profile.children.cycles-pp.__enqueue_entity
      0.07 ± 48%      +0.1        0.17 ± 10%  perf-profile.children.cycles-pp.xlog_grant_push_ail
      0.06 ± 49%      +0.1        0.16 ± 11%  perf-profile.children.cycles-pp.xfs_trans_dirty_buf
      0.01 ±223%      +0.1        0.11 ± 17%  perf-profile.children.cycles-pp.__kmalloc_noprof
      0.09 ± 22%      +0.1        0.19 ± 11%  perf-profile.children.cycles-pp.xfs_trans_ijoin
      0.11 ± 20%      +0.1        0.22 ± 19%  perf-profile.children.cycles-pp.xfs_trans_unreserve_and_mod_sb
      0.18 ± 14%      +0.1        0.28 ± 13%  perf-profile.children.cycles-pp.kmem_cache_free
      0.12 ± 24%      +0.1        0.23 ± 14%  perf-profile.children.cycles-pp.sched_balance_find_src_rq
      0.18 ± 12%      +0.1        0.28 ± 11%  perf-profile.children.cycles-pp.strncpy_from_user
      0.13 ± 18%      +0.1        0.23 ±  8%  perf-profile.children.cycles-pp._xfs_buf_obj_cmp
      0.12 ± 14%      +0.1        0.22 ± 11%  perf-profile.children.cycles-pp.generic_permission
      0.02 ±142%      +0.1        0.12 ± 15%  perf-profile.children.cycles-pp.__handle_irq_event_percpu
      0.02 ±142%      +0.1        0.12 ± 15%  perf-profile.children.cycles-pp.ahci_single_level_irq_intr
      0.08 ± 19%      +0.1        0.19 ± 13%  perf-profile.children.cycles-pp.xfs_trans_log_buf
      0.17 ±  6%      +0.1        0.28 ±  8%  perf-profile.children.cycles-pp.xfs_iget_cache_hit
      0.04 ± 72%      +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.xfs_buf_item_size
      0.10 ± 16%      +0.1        0.21 ± 11%  perf-profile.children.cycles-pp.update_curr
      0.15 ± 12%      +0.1        0.26 ± 12%  perf-profile.children.cycles-pp.xfs_difree_finobt
      0.21 ±  9%      +0.1        0.32 ± 11%  perf-profile.children.cycles-pp.path_lookupat
      0.07 ± 20%      +0.1        0.19 ± 15%  perf-profile.children.cycles-pp.xfs_dir_removename
      0.02 ±141%      +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.merge
      0.02 ±142%      +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.handle_edge_irq
      0.02 ±142%      +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.handle_irq_event
      0.13 ± 15%      +0.1        0.25 ± 10%  perf-profile.children.cycles-pp.xfs_dialloc_ag_update_inobt
      0.07 ± 19%      +0.1        0.19 ± 16%  perf-profile.children.cycles-pp.sysvec_posted_msi_notification
      0.14 ± 13%      +0.1        0.27 ± 11%  perf-profile.children.cycles-pp.inode_permission
      0.18 ± 16%      +0.1        0.30 ± 11%  perf-profile.children.cycles-pp.xfs_dialloc_ag_finobt_near
      0.12 ± 23%      +0.1        0.24 ± 11%  perf-profile.children.cycles-pp.xfs_dir_createname
      0.23 ±  6%      +0.1        0.35 ± 11%  perf-profile.children.cycles-pp.filename_lookup
      0.10 ± 33%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.xfs_buf_rele_cached
      0.02 ±142%      +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.__sysvec_posted_msi_notification
      0.02 ±142%      +0.1        0.14 ± 13%  perf-profile.children.cycles-pp.poll_idle
      0.15 ± 15%      +0.1        0.27 ±  9%  perf-profile.children.cycles-pp.xfs_buf_item_init
      0.13 ± 21%      +0.1        0.25 ± 10%  perf-profile.children.cycles-pp.xfs_trans_alloc_icreate
      0.00            +0.1        0.13 ± 13%  perf-profile.children.cycles-pp.__submit_bio
      0.20 ±  4%      +0.1        0.33 ±  8%  perf-profile.children.cycles-pp.xfs_iget
      0.11 ± 21%      +0.1        0.24 ±  9%  perf-profile.children.cycles-pp.llist_add_batch
      0.00            +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.submit_bio_noacct_nocheck
      0.01 ±223%      +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.xfs_cil_prepare_item
      0.11 ± 14%      +0.1        0.24 ±  9%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.14 ± 11%      +0.1        0.27 ± 17%  perf-profile.children.cycles-pp.cpu_util
      0.31 ± 10%      +0.1        0.45 ± 11%  perf-profile.children.cycles-pp.link_path_walk
      0.22 ±  6%      +0.1        0.36 ±  8%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.10 ± 35%      +0.1        0.25 ± 31%  perf-profile.children.cycles-pp.xfs_trans_del_item
      0.22 ± 13%      +0.1        0.37 ± 11%  perf-profile.children.cycles-pp.update_rq_clock
      0.17 ± 27%      +0.1        0.31 ± 11%  perf-profile.children.cycles-pp.xfs_inode_to_log_dinode
      0.14 ± 23%      +0.1        0.29 ± 10%  perf-profile.children.cycles-pp.prepare_task_switch
      0.04 ± 71%      +0.2        0.19 ± 13%  perf-profile.children.cycles-pp.__slab_free
      0.20 ± 11%      +0.2        0.36 ± 10%  perf-profile.children.cycles-pp.path_parentat
      0.15 ± 21%      +0.2        0.30 ± 14%  perf-profile.children.cycles-pp.xfs_trans_alloc_dir
      0.18 ± 11%      +0.2        0.34 ± 10%  perf-profile.children.cycles-pp.lookup_one_qstr_excl
      0.10 ± 17%      +0.2        0.26 ± 12%  perf-profile.children.cycles-pp.list_sort
      0.09 ± 22%      +0.2        0.25 ± 16%  perf-profile.children.cycles-pp.asm_sysvec_posted_msi_notification
      0.00            +0.2        0.16 ± 18%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.24 ± 12%      +0.2        0.41 ± 10%  perf-profile.children.cycles-pp.getname_flags
      0.18 ± 12%      +0.2        0.35 ± 15%  perf-profile.children.cycles-pp._find_next_and_bit
      0.08 ± 16%      +0.2        0.24 ± 12%  perf-profile.children.cycles-pp.kfree
      0.15 ± 17%      +0.2        0.32 ± 12%  perf-profile.children.cycles-pp.xfs_trans_run_precommits
      0.22 ± 12%      +0.2        0.40 ± 10%  perf-profile.children.cycles-pp.__filename_parentat
      0.00            +0.2        0.18 ± 18%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.34 ± 10%      +0.2        0.53 ± 11%  perf-profile.children.cycles-pp.__wait_for_common
      0.21 ± 17%      +0.2        0.40 ±  9%  perf-profile.children.cycles-pp.xfs_log_reserve
      0.26 ± 13%      +0.2        0.46 ±  8%  perf-profile.children.cycles-pp.dput
      0.13 ± 13%      +0.2        0.33 ± 14%  perf-profile.children.cycles-pp.__memcpy
      0.22 ± 20%      +0.2        0.42 ± 11%  perf-profile.children.cycles-pp.xfs_inode_item_format
      0.29 ±  7%      +0.2        0.50 ±  9%  perf-profile.children.cycles-pp.xfs_init_new_inode
      0.20 ± 21%      +0.2        0.41 ±  8%  perf-profile.children.cycles-pp.xfs_difree_inobt
      0.08 ± 17%      +0.2        0.29 ± 15%  perf-profile.children.cycles-pp.xlog_write
      0.35 ± 11%      +0.2        0.57 ± 10%  perf-profile.children.cycles-pp.update_load_avg
      0.24 ± 20%      +0.2        0.47 ± 10%  perf-profile.children.cycles-pp.xfs_buf_item_format_segment
      0.30 ± 12%      +0.2        0.52 ± 16%  perf-profile.children.cycles-pp.idle_cpu
      0.01 ±223%      +0.2        0.24 ± 14%  perf-profile.children.cycles-pp.xlog_state_release_iclog
      0.27 ± 12%      +0.2        0.50 ± 11%  perf-profile.children.cycles-pp.open64
      0.31 ± 10%      +0.2        0.55 ± 11%  perf-profile.children.cycles-pp.user_path_at_empty
      0.22 ± 12%      +0.2        0.46 ±  9%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.26 ± 20%      +0.2        0.51 ± 11%  perf-profile.children.cycles-pp.xfs_buf_item_format
      0.27 ± 17%      +0.2        0.52 ± 11%  perf-profile.children.cycles-pp.xfs_trans_reserve
      0.28 ± 13%      +0.3        0.53 ± 11%  perf-profile.children.cycles-pp._xfs_trans_bjoin
      0.56 ±  7%      +0.3        0.82 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.29 ± 13%      +0.3        0.57 ±  9%  perf-profile.children.cycles-pp.super_lock
      0.16 ± 15%      +0.3        0.44 ± 14%  perf-profile.children.cycles-pp.flush_workqueue_prep_pwqs
      0.25 ± 16%      +0.3        0.54 ± 13%  perf-profile.children.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.29 ± 17%      +0.3        0.60 ± 13%  perf-profile.children.cycles-pp.xfs_trans_alloc
      0.05 ± 49%      +0.3        0.36 ± 14%  perf-profile.children.cycles-pp.xfs_trans_committed_bulk
      0.27 ± 11%      +0.3        0.58 ± 10%  perf-profile.children.cycles-pp.dequeue_entity
      0.43 ± 13%      +0.3        0.75 ±  9%  perf-profile.children.cycles-pp.xfs_btree_read_buf_block
      0.32 ± 17%      +0.3        0.64 ± 12%  perf-profile.children.cycles-pp.schedule_idle
      2.69 ±  7%      +0.3        3.01 ±  7%  perf-profile.children.cycles-pp.xlog_cil_force_seq
      0.41 ± 11%      +0.3        0.74 ± 10%  perf-profile.children.cycles-pp._find_next_or_bit
      0.34 ± 10%      +0.3        0.66 ± 11%  perf-profile.children.cycles-pp.enqueue_entity
      2.84 ±  4%      +0.3        3.18 ±  2%  perf-profile.children.cycles-pp.__queue_work
      0.48 ± 12%      +0.4        0.84 ± 10%  perf-profile.children.cycles-pp.xfs_btree_lookup_get_block
      0.44 ± 16%      +0.4        0.80 ± 11%  perf-profile.children.cycles-pp.xfs_dialloc_ag
      0.32 ±  9%      +0.4        0.71 ± 10%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.41 ±  8%      +0.4        0.81 ± 11%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.51 ± 12%      +0.4        0.92 ± 10%  perf-profile.children.cycles-pp.xfs_btree_lookup
      0.43 ±  7%      +0.4        0.85 ± 11%  perf-profile.children.cycles-pp.activate_task
      0.10 ± 17%      +0.5        0.55 ± 14%  perf-profile.children.cycles-pp.xlog_cil_committed
      1.13 ±  5%      +0.5        1.58 ±  5%  perf-profile.children.cycles-pp.try_to_wake_up
      0.10 ± 17%      +0.5        0.55 ± 14%  perf-profile.children.cycles-pp.xlog_cil_process_committed
      0.31 ± 15%      +0.5        0.76 ± 11%  perf-profile.children.cycles-pp.down_read
      1.74 ±  8%      +0.5        2.22 ±  9%  perf-profile.children.cycles-pp.xlog_cil_push_now
      0.36 ± 10%      +0.5        0.85 ± 10%  perf-profile.children.cycles-pp.up
      2.74 ±  7%      +0.5        3.24 ±  7%  perf-profile.children.cycles-pp.xfs_log_force
      0.37 ±  9%      +0.5        0.87 ± 10%  perf-profile.children.cycles-pp.xfs_buf_unlock
      1.61 ±  7%      +0.5        2.12 ±  9%  perf-profile.children.cycles-pp.__flush_workqueue
      0.14 ± 16%      +0.5        0.66 ± 14%  perf-profile.children.cycles-pp.xlog_state_do_callback
      0.14 ± 16%      +0.5        0.65 ± 13%  perf-profile.children.cycles-pp.xlog_state_do_iclog_callbacks
      0.16 ± 12%      +0.5        0.68 ± 14%  perf-profile.children.cycles-pp.xlog_cil_push_work
      0.55 ±  8%      +0.5        1.08 ± 10%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.14 ± 16%      +0.5        0.66 ± 13%  perf-profile.children.cycles-pp.xlog_ioend_work
      3.76 ±  7%      +0.5        4.30 ±  6%  perf-profile.children.cycles-pp.xfs_fs_sync_fs
      0.40 ± 10%      +0.5        0.93 ± 10%  perf-profile.children.cycles-pp.xfs_buf_item_release
      0.66 ± 16%      +0.6        1.28 ± 10%  perf-profile.children.cycles-pp.xlog_cil_insert_format_items
      0.64 ±  7%      +0.7        1.29 ± 10%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.58 ± 10%      +0.7        1.24 ± 10%  perf-profile.children.cycles-pp.vfs_create
      0.79 ± 16%      +0.8        1.57 ±  9%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.80 ±  7%      +0.8        1.60 ±  9%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.83 ±  7%      +0.8        1.66 ± 10%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      1.24 ±  8%      +0.8        2.08 ± 10%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.64 ± 11%      +1.1        1.73 ± 14%  perf-profile.children.cycles-pp.xfs_iunlink
      1.90 ±  8%      +1.4        3.30 ± 15%  perf-profile.children.cycles-pp.__percpu_counter_sum
      1.29 ± 10%      +1.5        2.81 ± 13%  perf-profile.children.cycles-pp.xfs_difree
      1.38 ± 10%      +1.6        3.00 ± 13%  perf-profile.children.cycles-pp.xfs_ifree
      1.23 ± 13%      +1.6        2.87 ± 12%  perf-profile.children.cycles-pp.xfs_dialloc
      1.84 ±  6%      +1.9        3.75 ± 16%  perf-profile.children.cycles-pp.update_sg_lb_stats
      6.24 ±  9%      +1.9        8.19 ±  8%  perf-profile.children.cycles-pp.iterate_supers
      1.97 ±  7%      +2.0        3.97 ± 16%  perf-profile.children.cycles-pp.update_sd_lb_stats
      2.00 ±  7%      +2.0        4.03 ± 16%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      1.49 ± 11%      +2.3        3.79 ± 12%  perf-profile.children.cycles-pp.xfs_remove
      1.49 ± 11%      +2.3        3.80 ± 12%  perf-profile.children.cycles-pp.xfs_vn_unlink
      1.91 ± 13%      +2.3        4.22 ± 11%  perf-profile.children.cycles-pp.xlog_cil_commit
      2.52 ±  7%      +2.3        4.86 ± 15%  perf-profile.children.cycles-pp.sched_balance_rq
      1.56 ± 11%      +2.4        3.93 ± 12%  perf-profile.children.cycles-pp.vfs_unlink
      1.68 ± 10%      +2.4        4.11 ± 14%  perf-profile.children.cycles-pp.xfs_ialloc_read_agi
      2.67 ±  7%      +2.4        5.11 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      2.07 ± 10%      +2.5        4.58 ± 12%  perf-profile.children.cycles-pp.xfs_inactive_ifree
      2.08 ± 10%      +2.5        4.60 ± 12%  perf-profile.children.cycles-pp.xfs_inactive
      2.37 ± 12%      +2.6        4.92 ± 11%  perf-profile.children.cycles-pp.vfs_mknod
      2.15 ± 12%      +2.6        4.74 ± 11%  perf-profile.children.cycles-pp.__xfs_trans_commit
      2.18 ± 10%      +2.6        4.81 ± 12%  perf-profile.children.cycles-pp.xfs_inodegc_worker
      2.44 ±  9%      +2.8        5.27 ± 15%  perf-profile.children.cycles-pp.sched_balance_newidle
      1.83 ±  9%      +3.0        4.78 ± 15%  perf-profile.children.cycles-pp.___down_common
      1.83 ±  9%      +3.0        4.78 ± 15%  perf-profile.children.cycles-pp.__down
      2.53 ±  8%      +3.0        5.50 ± 15%  perf-profile.children.cycles-pp.pick_next_task_fair
      1.88 ±  9%      +3.0        4.86 ± 15%  perf-profile.children.cycles-pp.down
      1.90 ±  9%      +3.0        4.90 ± 15%  perf-profile.children.cycles-pp.xfs_buf_lock
      2.11 ±  8%      +3.0        5.15 ± 14%  perf-profile.children.cycles-pp.schedule_timeout
      2.54 ±  8%      +3.1        5.62 ± 11%  perf-profile.children.cycles-pp.do_unlinkat
      1.93 ±  9%      +3.1        5.02 ± 14%  perf-profile.children.cycles-pp.xfs_buf_find_lock
      2.82 ± 11%      +3.1        5.95 ± 11%  perf-profile.children.cycles-pp.xfs_create
      2.62 ±  8%      +3.1        5.77 ± 11%  perf-profile.children.cycles-pp.__x64_sys_unlink
      2.90 ± 11%      +3.2        6.08 ± 11%  perf-profile.children.cycles-pp.xfs_generic_create
      2.13 ±  9%      +3.2        5.38 ± 14%  perf-profile.children.cycles-pp.xfs_buf_lookup
      3.04 ± 10%      +3.3        6.34 ± 11%  perf-profile.children.cycles-pp.do_mknodat
      2.77 ±  8%      +3.3        6.10 ± 11%  perf-profile.children.cycles-pp.unlink
      3.08 ± 10%      +3.3        6.42 ± 11%  perf-profile.children.cycles-pp.__x64_sys_mknodat
      2.28 ± 10%      +3.4        5.65 ± 14%  perf-profile.children.cycles-pp.xfs_buf_get_map
      2.31 ± 10%      +3.4        5.73 ± 14%  perf-profile.children.cycles-pp.xfs_buf_read_map
      2.23 ± 10%      +3.4        5.65 ± 14%  perf-profile.children.cycles-pp.xfs_read_agi
      3.18 ± 10%      +3.5        6.65 ± 11%  perf-profile.children.cycles-pp.mknodat
      2.63 ± 10%      +3.7        6.36 ± 13%  perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      2.64 ±  9%      +3.7        6.37 ± 12%  perf-profile.children.cycles-pp.process_one_work
      3.26 ±  8%      +3.9        7.11 ± 14%  perf-profile.children.cycles-pp.schedule
      3.57 ±  8%      +4.1        7.67 ± 14%  perf-profile.children.cycles-pp.__schedule
      3.94 ±  8%      +4.1        8.07 ± 11%  perf-profile.children.cycles-pp.ret_from_fork
      3.94 ±  8%      +4.1        8.07 ± 11%  perf-profile.children.cycles-pp.ret_from_fork_asm
      3.93 ±  8%      +4.1        8.07 ± 11%  perf-profile.children.cycles-pp.kthread
      3.73 ±  9%      +4.3        8.03 ± 11%  perf-profile.children.cycles-pp.worker_thread
     67.15 ±  3%     -13.0       54.13 ±  8%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      5.44 ±  9%      -1.4        4.06 ±  9%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.90 ± 11%      -0.6        0.25 ±  5%  perf-profile.self.cycles-pp.ktime_get
      0.17 ± 12%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.get_jiffies_update
      0.13 ± 20%      -0.1        0.07 ± 10%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.09 ± 12%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.07 ± 18%      +0.0        0.10 ±  9%  perf-profile.self.cycles-pp.try_to_wake_up
      0.07 ± 18%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.__cond_resched
      0.08 ± 22%      +0.0        0.12 ± 10%  perf-profile.self.cycles-pp._IO_default_xsputn
      0.08 ± 13%      +0.0        0.12 ± 14%  perf-profile.self.cycles-pp.link_path_walk
      0.06 ± 14%      +0.0        0.11 ± 14%  perf-profile.self.cycles-pp.lockref_get_not_dead
      0.07 ± 25%      +0.0        0.12 ± 11%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.02 ±142%      +0.1        0.07 ± 19%  perf-profile.self.cycles-pp.xfs_buf_get_map
      0.09 ± 18%      +0.1        0.14 ±  6%  perf-profile.self.cycles-pp.resched_curr
      0.01 ±223%      +0.1        0.06 ± 16%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.01 ±223%      +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.rcu_all_qs
      0.01 ±223%      +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.xfs_trans_ijoin
      0.02 ±141%      +0.1        0.07 ± 19%  perf-profile.self.cycles-pp.should_we_balance
      0.08 ± 23%      +0.1        0.13 ± 11%  perf-profile.self.cycles-pp.strncpy_from_user
      0.02 ±144%      +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.__percpu_counter_compare
      0.09 ± 11%      +0.1        0.15 ± 12%  perf-profile.self.cycles-pp.clear_bhb_loop
      0.04 ± 72%      +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.set_nlink
      0.01 ±223%      +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.super_lock
      0.01 ±223%      +0.1        0.06 ± 17%  perf-profile.self.cycles-pp.xfs_trans_precommit_sort
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.__destroy_inode
      0.02 ±142%      +0.1        0.07 ± 12%  perf-profile.self.cycles-pp.mod_delayed_work_on
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.update_cfs_group
      0.01 ±223%      +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.xfs_ialloc_read_agi
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.xfs_buf_reverify
      0.02 ±144%      +0.1        0.08 ±  9%  perf-profile.self.cycles-pp.pwq_dec_nr_in_flight
      0.01 ±223%      +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.xlog_prepare_iovec
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.xfs_inodegc_queue
      0.07 ± 16%      +0.1        0.13 ± 15%  perf-profile.self.cycles-pp.lockref_put_return
      0.01 ±223%      +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.xfs_trans_log_inode
      0.05 ± 50%      +0.1        0.11 ±  9%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.00            +0.1        0.06 ± 15%  perf-profile.self.cycles-pp.xfs_trans_read_buf_map
      0.11 ± 12%      +0.1        0.17 ± 11%  perf-profile.self.cycles-pp.sched_balance_rq
      0.06 ± 17%      +0.1        0.12 ± 10%  perf-profile.self.cycles-pp.irqentry_enter
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.xfs_inode_item_pin
      0.02 ±144%      +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.memset_orig
      0.02 ± 99%      +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.update_curr
      0.05 ± 45%      +0.1        0.12 ± 17%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.05 ± 47%      +0.1        0.11 ± 18%  perf-profile.self.cycles-pp.xfs_perag_get
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.__d_lookup
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.merge
      0.06 ± 53%      +0.1        0.12 ± 11%  perf-profile.self.cycles-pp.xfs_buf_lookup
      0.01 ±223%      +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.xlog_grant_add_space
      0.14 ±  9%      +0.1        0.21 ± 11%  perf-profile.self.cycles-pp.update_load_avg
      0.14 ± 15%      +0.1        0.20 ± 10%  perf-profile.self.cycles-pp.xlog_cil_insert_format_items
      0.10 ± 16%      +0.1        0.17 ± 14%  perf-profile.self.cycles-pp.kmem_cache_free
      0.09 ± 14%      +0.1        0.16 ± 12%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.03 ±102%      +0.1        0.10 ±  9%  perf-profile.self.cycles-pp.kfree
      0.02 ±144%      +0.1        0.09 ± 12%  perf-profile.self.cycles-pp.___perf_sw_event
      0.02 ±144%      +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.xfs_inodegc_worker
      0.08 ±  9%      +0.1        0.15 ± 12%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.01 ±223%      +0.1        0.08 ± 12%  perf-profile.self.cycles-pp.finish_task_switch
      0.01 ±223%      +0.1        0.08 ± 12%  perf-profile.self.cycles-pp.schedule_timeout
      0.08 ± 16%      +0.1        0.15 ±  9%  perf-profile.self.cycles-pp.__switch_to
      0.01 ±223%      +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.update_min_vruntime
      0.14 ±  9%      +0.1        0.21 ± 11%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.04 ± 45%      +0.1        0.12 ± 14%  perf-profile.self.cycles-pp.dequeue_entity
      0.03 ±100%      +0.1        0.10 ± 10%  perf-profile.self.cycles-pp.xfs_log_ticket_ungrant
      0.00            +0.1        0.08 ± 12%  perf-profile.self.cycles-pp.__x2apic_send_IPI_dest
      0.11 ± 20%      +0.1        0.18 ±  9%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.07 ± 12%      +0.1        0.15 ±  9%  perf-profile.self.cycles-pp.up_read
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.xlog_cil_commit
      0.06 ± 47%      +0.1        0.14 ±  7%  perf-profile.self.cycles-pp.llist_reverse_order
      0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.__kmalloc_noprof
      0.07 ± 15%      +0.1        0.15 ± 11%  perf-profile.self.cycles-pp.__switch_to_asm
      0.02 ±141%      +0.1        0.10 ± 11%  perf-profile.self.cycles-pp.list_sort
      0.12 ± 24%      +0.1        0.21 ± 10%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.14 ± 22%      +0.1        0.22 ± 12%  perf-profile.self.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.14 ± 14%      +0.1        0.23 ±  7%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.12 ± 10%      +0.1        0.21 ±  9%  perf-profile.self.cycles-pp.iterate_supers
      0.00            +0.1        0.09 ± 25%  perf-profile.self.cycles-pp.pwq_tryinc_nr_active
      0.11 ± 23%      +0.1        0.20 ± 15%  perf-profile.self.cycles-pp.sched_balance_find_src_rq
      0.09 ± 25%      +0.1        0.18 ± 12%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.09 ± 23%      +0.1        0.18 ± 10%  perf-profile.self.cycles-pp.xfs_perag_put
      0.00            +0.1        0.09 ± 15%  perf-profile.self.cycles-pp.xfs_trans_ail_update_bulk
      0.12 ± 18%      +0.1        0.22 ± 17%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.07 ± 47%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.xlog_space_left
      0.09 ± 24%      +0.1        0.18 ±  6%  perf-profile.self.cycles-pp._find_next_bit
      0.01 ±223%      +0.1        0.10 ± 11%  perf-profile.self.cycles-pp.__up
      0.08 ± 25%      +0.1        0.17 ± 10%  perf-profile.self.cycles-pp.enqueue_entity
      0.13 ± 10%      +0.1        0.23 ±  7%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.09 ± 20%      +0.1        0.19 ±  9%  perf-profile.self.cycles-pp.prepare_task_switch
      0.11 ± 12%      +0.1        0.21 ± 10%  perf-profile.self.cycles-pp.generic_permission
      0.03 ±102%      +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.02 ±142%      +0.1        0.12 ± 12%  perf-profile.self.cycles-pp.__enqueue_entity
      0.06 ± 53%      +0.1        0.16 ± 12%  perf-profile.self.cycles-pp.xfs_trans_dirty_buf
      0.13 ± 18%      +0.1        0.23 ±  8%  perf-profile.self.cycles-pp._xfs_buf_obj_cmp
      0.00            +0.1        0.11 ±  9%  perf-profile.self.cycles-pp.xfs_buf_find_lock
      0.16 ± 19%      +0.1        0.28 ±  9%  perf-profile.self.cycles-pp.xfs_buf_item_format_segment
      0.15 ± 15%      +0.1        0.27 ±  9%  perf-profile.self.cycles-pp.xfs_buf_item_init
      0.04 ± 74%      +0.1        0.17 ± 14%  perf-profile.self.cycles-pp.flush_workqueue_prep_pwqs
      0.12 ± 13%      +0.1        0.24 ± 13%  perf-profile.self.cycles-pp._xfs_trans_bjoin
      0.12 ± 12%      +0.1        0.24 ± 17%  perf-profile.self.cycles-pp.cpu_util
      0.01 ±223%      +0.1        0.13 ± 11%  perf-profile.self.cycles-pp.poll_idle
      0.16 ± 14%      +0.1        0.28 ± 13%  perf-profile.self.cycles-pp.update_rq_clock
      0.11 ± 21%      +0.1        0.24 ±  9%  perf-profile.self.cycles-pp.llist_add_batch
      0.09 ± 20%      +0.1        0.23 ± 11%  perf-profile.self.cycles-pp.__queue_work
      0.10 ± 32%      +0.1        0.24 ± 30%  perf-profile.self.cycles-pp.xfs_trans_del_item
      0.16 ± 13%      +0.1        0.31 ± 15%  perf-profile.self.cycles-pp._find_next_and_bit
      0.01 ±223%      +0.2        0.16 ± 14%  perf-profile.self.cycles-pp.xlog_cil_push_work
      0.04 ± 71%      +0.2        0.19 ± 15%  perf-profile.self.cycles-pp.__slab_free
      0.13 ± 27%      +0.2        0.29 ±  8%  perf-profile.self.cycles-pp.xlog_cil_insert_items
      0.16 ± 19%      +0.2        0.35 ± 12%  perf-profile.self.cycles-pp.__schedule
      0.12 ± 16%      +0.2        0.32 ± 15%  perf-profile.self.cycles-pp.__memcpy
      0.28 ± 13%      +0.2        0.49 ± 16%  perf-profile.self.cycles-pp.idle_cpu
      0.20 ± 13%      +0.2        0.44 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.33 ± 14%      +0.3        0.59 ± 10%  perf-profile.self.cycles-pp._find_next_or_bit
      0.27 ± 13%      +0.3        0.55 ± 10%  perf-profile.self.cycles-pp.down_read
      0.17 ±  3%      +0.4        0.58 ± 19%  perf-profile.self.cycles-pp.xfs_inodegc_queue_all
      1.45 ±  5%      +0.7        2.18 ±  8%  perf-profile.self.cycles-pp.work_grab_pending
      1.01 ±  7%      +0.8        1.82 ± 15%  perf-profile.self.cycles-pp.__percpu_counter_sum
      1.35 ±  6%      +1.4        2.76 ± 16%  perf-profile.self.cycles-pp.update_sg_lb_stats
      2.10 ±  6%      +1.8        3.87 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

