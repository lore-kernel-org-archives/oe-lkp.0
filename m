Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92632EC0
	for <oe-lkp@lists.linux.dev>; Thu,  7 Nov 2024 04:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730955509; cv=fail; b=VFpG/5oA7m8fvyycWf9rryXOa8E1YYAIqb/Klnp7P4/GyJv6+2lpT1hOeqot7WPzrLPDz0pDC+EOfnMUb88AcAlPQP05ttfAoKqBIwojx6d/52bQAG27WYGlQ3Heqr90nzxGsm/reR3U2EzRaCL79wxNQLY1gx+/LUdNbhIFa9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730955509; c=relaxed/simple;
	bh=x1fa79KyORZ+sWhqLglpFbEpjOOIyvc5v0EdVSUxlfI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XgLYdLhmg58B4iiJxZT6Z2C96b3cUpjYa+d+cjOOqr1gROkClHcGzyZZq9n+u35zt8e0WhllqJq0+4QQ37deXfKFts3/DV/+oDWo/Qx1mHvZiHhc7T834vJKEf97LOed7e5lmI2YSaNtnPwdkzDU/1siWAXccurKGkSnjH6NDcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdfC3kcM; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdfC3kcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730955507; x=1762491507;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=x1fa79KyORZ+sWhqLglpFbEpjOOIyvc5v0EdVSUxlfI=;
  b=WdfC3kcM9YD146f7+spZN7W+X907N+UqnzOLEsiyppuiuiuoj51V8eu6
   BKEFiZBW980Nm3YmQbqDPBC76yesUy7ghydTbfJtYEtCFRl4ymkW+BMJS
   sJeEKpEmTqeZ+0N2lEVc61rGHWTDj4TtAWa8IWC4Ad6ophCRgRpUMBRl0
   bqUK7OyEoQNaHmuhI6l/SIA++3CtVJI4MrzEaIaXLoCT4FAWXB4rig4fC
   SXQaNaNXcIEn7LPLSRWJ18udPJFQybjIiWqId6OQB8XtsZ5f7wqb7oya+
   MphLeudLfO0NtCNCOvSqBbjKQrC6I7OBfsFklehnZOfL+3DgAQFr0M048
   g==;
X-CSE-ConnectionGUID: 8Jo/6k5XQA+ZhmMAD3Rs6Q==
X-CSE-MsgGUID: qXkt369WQ4y0UeM21gWwdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42185071"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="42185071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 20:58:27 -0800
X-CSE-ConnectionGUID: JJDjrYGARbW10LqEFDVM/Q==
X-CSE-MsgGUID: ueBEqedoTdOPYaUfq0llcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84885118"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 20:58:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 20:58:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 20:58:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 20:58:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THvLqSDUKyEvE5doAuc2jvf20G6nVJSBgtXxT6q2wiKKKUY4YUD5Qsn2UeasiGJS23b2m5LCYnuP7VWTzPY1NFJzMJbGe6x2Nc3srim001IggTV1Nc8Db4X4mvvAbeGbWr/GoeP4pwPfReB5WDAX6Qo5PiNe2+V9xyUyt6zm7RYEkPF+gteXlQwYDG0JJQiHhpZQyDky63Z0cinThyzISu59Uo33gXGH8ougKUUqB6Wj3JOPK7SlEnTa7ZgYeiarXzG/FK/CfcDUk1C7+9sRTlGe0YDq3fhfXXZScjndm7qWwbVCKuMZ0vTA0fCYbrPa3pI3y1HZUkVusVoXg+I3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZddbG+T70K6qrUasK8YwWkQfdIzmLDOIGMwsfWswAA=;
 b=T3W2S3bNU6/3c3IHAsaypLnlVyzQWrSJBFv8kx7KWlxmetHO+ddxvXUI+FNQzak0FblcHc0hqn4mnMFZjKBDu8B2tcjSon6KGw7C9nwPd2RxxGUkKlGS0Rn82sDjIJF+AZUub7q3J+T+KZ6h5aVfLnFZXnoWzFUo5Fx773NKARMCL63gDuENmLDBiu26QoVNoTsh3QFopuKgE5XNbWBDkGUftaQKaQ5Uy5yq8J1MbbJPgbbxXtoQ5DOkyeH2PhJh3cSDraZJ9gjwj+gzlJxErQWTArm1YbWuHhBNc4I8rWnm3YrgirTHObLOT+r9v28d6/ktp47dZsP6PvUT0l8VPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7839.namprd11.prod.outlook.com (2603:10b6:208:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 04:58:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 04:58:23 +0000
Date: Thu, 7 Nov 2024 12:58:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jpoimboe:uaccess-hardening] [x86/uaccess]  82cbb9983f:
 will-it-scale.per_process_ops 1.9% improvement
Message-ID: <202411071229.91fc9c3-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b55b2e7-a3c4-44a9-da31-08dcfee8cecb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Mt+s+Fuj6Z2rSoB5ve3j/ki3TM8QvTPDPBX/PICosaax+WkeUhzPim5XYr?=
 =?iso-8859-1?Q?zasv49yqV8HKfXlDxOdlY+2r0H1RePlecADLXs4ccjn5jMNBJuRqnAJH5w?=
 =?iso-8859-1?Q?yKmBUVjCJLMRnyi5kopf5xdTMUUe8z15/FbYWakb175n4asRg4Odx9che7?=
 =?iso-8859-1?Q?4dg8SUUbg+P4yyNZTBsQVxcPIxLdWKxlbDINDpZBAuIt9IqQhPL5JwW0Fi?=
 =?iso-8859-1?Q?zXu4uPIJ6phQ8y6MEC2J6M/V4whv8DdRZPM9AWczVkg4sZrdDMOpbi1hhm?=
 =?iso-8859-1?Q?o/oVS5ibzAPoMWLpcDBuFoDamIitCC3kIxzJrGAWSXzO2tHlAXojKLaf1k?=
 =?iso-8859-1?Q?KZ3CQOTjyL0UVcA8qSs3Qr8qp5ZfZsg9UQ03T+zGiy43nkg8a82nztbk+/?=
 =?iso-8859-1?Q?zTXgR0X98A45r0hMva8N6EVu1TSAAQRiVZmDOrjpc7C0P3yebNQNj6cDPZ?=
 =?iso-8859-1?Q?Jhx+ek+iWYMVU4kE7mUZhbjgTE+QeMuLtO4ighYjYkLtlbOgGBN3nSbvSL?=
 =?iso-8859-1?Q?9DRhUTuuv0VKjEq5ww025UuN+HAaFjNB5Gm426iRAvjcK48Hp1+5RtMb3K?=
 =?iso-8859-1?Q?hg6d3BqSGBs5HnZ3e1w6xjeoTuqgDMDz8MK/3Ein+LYB0IViLFEizIPUOd?=
 =?iso-8859-1?Q?UcnMvnKqnoNzAgJx8rIiC5TPHgbC9y+vhYkORdkvOFA2xizK7bMuq+BnX8?=
 =?iso-8859-1?Q?velgsxuSD6WyEfzDx2kRL6sowe5/fSKrm+CeYmQAxpXSpkrx6Oct+MvFmN?=
 =?iso-8859-1?Q?1ARmN192uRq0LB8AjBeN4r/Xxbt82ir5QefJvSbeyqxzCTm5XVzXHEdYYc?=
 =?iso-8859-1?Q?Y/SmDsTaR4ZbJj3z8GTCS+1g80DgTzXol7Of4Rk6LD1vZSwViSCKPJYGDH?=
 =?iso-8859-1?Q?q8vyqOU0piRKeXwTwuA3NsokhBVVwvg149m5WJ1PAzugaZkFJDKyjCTIoZ?=
 =?iso-8859-1?Q?NtC/6H5+QobBlYwWD9Xf4dgw2KfseZw90NgN3iifHjgcVaqgaJsftLtTDW?=
 =?iso-8859-1?Q?Wi1rEAD4OcoO3o6Gda1wGaJyCgFBJS3HRYl4+Qm1RVlW2X7WFc3S9uUNcF?=
 =?iso-8859-1?Q?I0VlgWkhP2No9YbqSn8brGUg3sbJ4u8edKfQ3LLpnkIMus9vmRd6bEO6PG?=
 =?iso-8859-1?Q?/+qyG5ceQmYVmb1goyu3i3+IxRiwzyQg7Lpn/XTmR8ge1/Cq/VIljcC+0g?=
 =?iso-8859-1?Q?cldcdgXs6NQRwALt7laZy0FevzKXRTa+RWMACkhULkZ+U3sCRNqyLIkShQ?=
 =?iso-8859-1?Q?9m9lifYOPhMkku9a4ELapErlfO+DE6y0QF8UhBk5eXdpFxh61fwNuc2yFg?=
 =?iso-8859-1?Q?4o1ERoPv+el9WGNjQLc+Aq7GLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c5XIUN1rnLAYhCGd+w0GJQTBPrFg1TNR7YLnKPgbBqq0hg8mvOnkRpMQbh?=
 =?iso-8859-1?Q?EVadnnt8z826w6tQ4CI0wk0xsQb6j3pNmQcygalwEv5E07/rBBc93a1r1y?=
 =?iso-8859-1?Q?xcfjt82cYarl42/OkqnKAkR+KgwTvGD41zXNG4surGGokR2AfPwiEF/9zL?=
 =?iso-8859-1?Q?5B54ci6YNfN2BIzNNsvzfXY155nWCaXGM1oY06NaBsSv9UDjgnMzMETFZq?=
 =?iso-8859-1?Q?uVJrnUlaHOnCajgK4b5GuZZyiXlwnXiB95pDGWgCmKuHLrzfuZbCXNNpHQ?=
 =?iso-8859-1?Q?yHVx7wIOai2dRKdhhRh0zm52kAXT+1ygAWKP9vrkj6AyyBow5mvA99joCA?=
 =?iso-8859-1?Q?iL1whztDM7B3XLM0o3smiQsVQ5jsAdByjuKRMRRkDlhRPsLCkk1Mif3a5D?=
 =?iso-8859-1?Q?UWI/lSB8F3VFNoBdvyl69lLJznrCZOGisZvO3hSHhCxufQij3/XSDtTO9o?=
 =?iso-8859-1?Q?2Apgb6W+FDJKZuX2iH/5eUBCTty24lxEueR+U7OKfA/aQ+k7wKa2Qz1HrH?=
 =?iso-8859-1?Q?e7K+qhXAEyS5EbEo/CyAjold+5ut+6m5+el/sWL5DWpKbyssakpOfp/x41?=
 =?iso-8859-1?Q?ocpuPxfLL1KLkyMxOuHu6b+QsM+plb9RIeYJNAeqxudOKvLYxujiadh5M/?=
 =?iso-8859-1?Q?tzD9lNW2MXnnxEICNTGe0Gq4CJzvx2OeKG7Wz5hWsm04n3Z+x7QFFYonb5?=
 =?iso-8859-1?Q?lI9gWL0pJjV72iUbzK+v3jLFJITkOC4xaQLCWrFXVcZ8RT2jvms2KnmKI2?=
 =?iso-8859-1?Q?USF+zrrxioFOaQ9uHmAaczGM4tbl1E9F/z1I4wWGmwen14EZnPq22sj/Ej?=
 =?iso-8859-1?Q?VlDZUo5RQrPCikIPkCd4vNjQW5ShVpoxhFaC56qNIrQvGKm6joaSA0wykQ?=
 =?iso-8859-1?Q?6l2lhL1CHvIkwebJrMg5v2dGeNLTKQcTxelwxTEjGsMxUQXe1v5ucQc3Qz?=
 =?iso-8859-1?Q?eppm3ga007IDrbq9jStuvJcQ6BVmfh9vBhpdm8w1xIriyLLSsCPDCl9YGI?=
 =?iso-8859-1?Q?JegrPVNQlUX2r/gHR8v7AibMJcYW6FirGD1dBVMIShN0Ielg7hggqUgksZ?=
 =?iso-8859-1?Q?RkhFj1hkvyo5RpZ6cZU6E7FPckfr5s1u3gMXW85x66lwBXs601wVAnoWPk?=
 =?iso-8859-1?Q?s+I+GXxf0VnbZk9ZQy5aHH0O7Qp49rMBs6EUiPouxEIOCdUcy5ZJPVYUOK?=
 =?iso-8859-1?Q?eIJBP67eN0l6n8tqEVujVSbrwwteAZiRGZhWzivvDJ7/Ux5k0w1Op98WQh?=
 =?iso-8859-1?Q?Zp0cxNcDd53A/YMvFc+XnO6vLaq7vfLP3A5ZLA8yULQ7nulF5WYCQdutvw?=
 =?iso-8859-1?Q?7/kV9RT9tcFqx2V5ofuRqmnhIKNp5vCT8w8bPalOVEDto1SQ1i+y/Ojp3M?=
 =?iso-8859-1?Q?YO/Dxs+hzOnekK8ziFlGDf3zm05KoaNh/vTQiXPGqVi4lpHq1niuMMr91T?=
 =?iso-8859-1?Q?oAuhdjI0f+ncqa1IbAQT35XMF1ZzqTuPwkLY5uG4TRpu6yjSqiX0XHexGi?=
 =?iso-8859-1?Q?funzBIkMS9+K9eCsTX7Bgdy74jw+WYzm+Rh1Cu3Y9Ku0QJqI5PlgOheu8T?=
 =?iso-8859-1?Q?iw1LQH7fSntX6fNNErHRrNIlDnjDoGn6a5VmnmDg9JSu+fBj/kE3q8W9H7?=
 =?iso-8859-1?Q?M3wLbc1EvV+MaqOmoDIhDL4YsAmHdlatV6xqop95ei8V6ngE8s7vFIng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b55b2e7-a3c4-44a9-da31-08dcfee8cecb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 04:58:23.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjHML9vDaFTZd5lWR5KCSjRHTrhmifuVvR6j4gzp7qPMZG5Csm2iGrCeQmoQG1grO4LNFPT0Sf9lS9HZ+mUieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7839
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 1.9% improvement of will-it-scale.per_process_ops on:


commit: 82cbb9983fef5ecf6f1cb33661e977172d40a7e6 ("x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()")
https://git.kernel.org/cgit/linux/kernel/git/jpoimboe/linux.git uaccess-hardening

testcase: will-it-scale
config: x86_64-rhel-8.3
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	nr_task: 100%
	mode: process
	test: futex4
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241107/202411071229.91fc9c3-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/process/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/futex4/will-it-scale

commit: 
  5b887fe4c5 ("x86/uaccess: Avoid barrier_nospec() in 64-bit copy_from_user()")
  82cbb9983f ("x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()")

5b887fe4c5802149 82cbb9983fef5ecf6f1cb33661e 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     43735 ± 50%     -72.1%      12197 ± 72%  proc-vmstat.numa_pages_migrated
     43735 ± 50%     -72.1%      12197 ± 72%  proc-vmstat.pgmigrate_success
      1.51 ± 49%     -70.6%       0.44 ± 99%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
     46.23 ±  8%     -49.1%      23.53 ± 79%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     46.13 ±  8%     -49.7%      23.19 ± 81%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
 1.129e+09            +1.9%  1.151e+09        will-it-scale.224.processes
   5041746            +1.9%    5136942        will-it-scale.per_process_ops
 1.129e+09            +1.9%  1.151e+09        will-it-scale.workload
 1.117e+11            +1.7%  1.135e+11        perf-stat.i.branch-instructions
      0.88            -2.0%       0.86        perf-stat.i.cpi
 7.351e+11            +2.1%  7.507e+11        perf-stat.i.instructions
      1.14            +2.2%       1.16        perf-stat.i.ipc
      0.88            -2.3%       0.86        perf-stat.overall.cpi
      1.14            +2.3%       1.16        perf-stat.overall.ipc
 1.113e+11            +1.7%  1.132e+11        perf-stat.ps.branch-instructions
 7.326e+11            +2.1%  7.481e+11        perf-stat.ps.instructions
 2.221e+14            +2.4%  2.274e+14        perf-stat.total.instructions
     12.11            -3.0        9.11        perf-profile.calltrace.cycles-pp.futex_get_value_locked.futex_wait_setup.__futex_wait.futex_wait.do_futex
     10.63            -2.8        7.81        perf-profile.calltrace.cycles-pp.__get_user_nocheck_4.futex_get_value_locked.futex_wait_setup.__futex_wait.futex_wait
     34.80            -1.6       33.21        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     40.04            -1.5       38.56        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     48.93            -1.0       47.89        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     51.38            -1.0       50.41        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     54.90            -0.8       54.06        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     64.41            -0.6       63.78        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     67.25            -0.5       66.71        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      1.98            -0.1        1.90        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      0.83            -0.0        0.80        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      0.63            +0.0        0.66        perf-profile.calltrace.cycles-pp.testcase
      1.10 ±  2%      +0.1        1.18 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
      2.20            +0.1        2.30        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      5.35            +0.3        5.70        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      3.86 ±  2%      +0.4        4.24        perf-profile.calltrace.cycles-pp.futex_hash.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
     12.49 ±  2%      +0.8       13.26        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     11.13            -2.8        8.30        perf-profile.children.cycles-pp.__get_user_nocheck_4
     12.62            -2.8        9.84        perf-profile.children.cycles-pp.futex_get_value_locked
     36.23            -1.5       34.69        perf-profile.children.cycles-pp.futex_wait_setup
     40.47            -1.5       39.01        perf-profile.children.cycles-pp.__futex_wait
     49.14            -1.1       48.05        perf-profile.children.cycles-pp.futex_wait
     52.15            -0.9       51.22        perf-profile.children.cycles-pp.do_futex
     55.42            -0.8       54.60        perf-profile.children.cycles-pp.__x64_sys_futex
     65.44            -0.6       64.84        perf-profile.children.cycles-pp.do_syscall_64
     67.72            -0.5       67.19        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.26            -0.1        2.18        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.75            +0.0        0.78        perf-profile.children.cycles-pp.testcase
      1.14 ±  2%      +0.1        1.23 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.49            +0.1        2.60        perf-profile.children.cycles-pp.x64_sys_call
      5.00            +0.3        5.32        perf-profile.children.cycles-pp.futex_q_unlock
      4.11 ±  2%      +0.4        4.50        perf-profile.children.cycles-pp.futex_hash
     13.22 ±  2%      +0.8       13.98        perf-profile.children.cycles-pp.futex_q_lock
     10.69            -2.8        7.89        perf-profile.self.cycles-pp.__get_user_nocheck_4
      2.26            -0.1        2.18        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.66            +0.0        0.69        perf-profile.self.cycles-pp.testcase
      1.52            +0.0        1.56        perf-profile.self.cycles-pp.futex_get_value_locked
      2.20            +0.1        2.28        perf-profile.self.cycles-pp.x64_sys_call
      1.14 ±  2%      +0.1        1.23 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      3.68            +0.1        3.77        perf-profile.self.cycles-pp._raw_spin_lock
      3.26            +0.1        3.36        perf-profile.self.cycles-pp.__x64_sys_futex
      4.11            +0.1        4.21        perf-profile.self.cycles-pp.do_syscall_64
      4.17            +0.1        4.28        perf-profile.self.cycles-pp.__futex_wait
      3.90            +0.2        4.07        perf-profile.self.cycles-pp.futex_wait_setup
      3.26            +0.2        3.46        perf-profile.self.cycles-pp.do_futex
      4.45            +0.3        4.71        perf-profile.self.cycles-pp.futex_q_unlock
      7.82            +0.3        8.14        perf-profile.self.cycles-pp.futex_wait
      3.91 ±  2%      +0.4        4.28        perf-profile.self.cycles-pp.futex_hash
     14.71            +0.4       15.10        perf-profile.self.cycles-pp.syscall




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

