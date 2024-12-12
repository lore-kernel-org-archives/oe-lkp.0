Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD62185A8
	for <oe-lkp@lists.linux.dev>; Thu, 12 Dec 2024 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018180; cv=fail; b=IqoZ43JQLwEWpMNvPIziYDvS9EjGtfZOVCmnxeNIJUDa+TgaaiQ+4kSLOb4/DexYXBcjkS7y7N+Vs7wuCvr8FYMyN9i0MU4+DU/ghZu9XvuGStxnvKBzS1jLyo1SlRHHySDeNrcjUvOk/zkzp7313nVyft+xkT9Su49wckNEHrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018180; c=relaxed/simple;
	bh=wDgHgiNVI4muwBfKsQGGcTf86cg05+UtHK3Z7wTcQKk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KRsqkmuhJTFnwS/s0DyC8Ku9lPyz70n/u52SLTj/S/MhG5Cf+oGHhqj9g1MutX47XV1A8GcFvJ1fTDpEq4eviBzD1PNoZ3SaRVGGIPk5GKhFlmIyndgD7VkbquXjIlAsPpRl5UqCf4fC6eVaaTsNz8YN2W09eQ+droQo9Do6OK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DifwZpNH; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DifwZpNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734018178; x=1765554178;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=wDgHgiNVI4muwBfKsQGGcTf86cg05+UtHK3Z7wTcQKk=;
  b=DifwZpNHVjClbyYfHdJ/PinkZnbme7PSUBYXT/gaEgiPQvhZBDgfZPvH
   iYHEoC5iPNo67O2h+lJFu4H4cgZPhYH4LaG5pWe7oG8ZTfTxh2CQeexVk
   kUHLq7qKyCotM7xTzN+o7tmgfL/WnPrAwdLurM0rvO4q0Zqywwcah7x5d
   8WhGd81fkPOlhWam3IyygEg5kYsNqRieMFI8QMJg295N7+B7Wm02JQKE+
   8NbIEw7KHDdGEcYGt0rjOD6wdA9VFOlIst256lrE0DzPpXB9jtzOzfNqX
   IBrJuVEBNST2R8KpRh2Pv8jfhNTlFKdhdM863W+CDEdEQMQxNfspoFZPp
   A==;
X-CSE-ConnectionGUID: 7OSKWQDTSJufCW+JYHgNYQ==
X-CSE-MsgGUID: HWkxWf7hRaerj64DzrK5WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34580446"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34580446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 07:42:57 -0800
X-CSE-ConnectionGUID: pd9fLLLRQs6IfXdGfrS1vg==
X-CSE-MsgGUID: vtZFWuP5RH+am94ttiqYxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127259288"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2024 07:42:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 07:42:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 07:42:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 07:42:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2TxQzkgvbX2xcPtjHxod5cMjrfimcNqouhbjajiRpsBJsFqHwv0kzI+Wq32A7pSqWHSFMzJ8ELIjAOwwl6w/zCOodlLX76th0Fh0ZCVSwAiQqE2SHvW1R7IJ2ZnX5eHLEIIAPsTjApM3Xe2CAGX+0JMHcwg/7kxiUQau63tq0ICLbpmeZ/41tR8+hoFXg88ROieY0SnknXcVvb2v7QUyVa/TmiA6jJoNsjg2I7BMiP11aFdMqHlMvRNB/hywQeLYOHVsSZrpYwkFI/5eLnZT8h1RaMJwlyape5YUVMzutja4S43CRYeZFfSrEykzws0/z/nYCkvfr4A9/nhUb/WGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3CqgwAQpo8/Uh9Y5+bv2bO3uukucGEWV3Qh1GCyRWc=;
 b=VRwsGg8yCPekSkcrcaB63Rc8iQvCUzRqHM2HCUKjp6Fr9vqnQc4zAnaGvnQyAaaDTbaP3CtVmnyb2JRrxBlAklfeaoHEareZ92/nSryZAX3mE+3Mr9TVaCXicn/DHwmA7ZltlklGzXnrGeZkEYS2Us27TfjYMBgSWfg5lQFV3W0US2Gx6yqQ+yqJPDydC3YlsnLSMmVCFrWM2U7BdhvyKNsTL2CC51sZ+bxqL+19RBVByimJPMvzSX6asw9mR8BFDbAqk4QYjIDUuukfZ1njXCqtKShlJ1mEAU9rP4O1HCmFNWO1m5y1G/EQAzlm3joar8AgIy9aNSfADFJYmfAfZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Thu, 12 Dec
 2024 15:42:39 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 15:42:39 +0000
Date: Thu, 12 Dec 2024 23:42:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v4.5] [futex]  6df37a9175:
 will-it-scale.per_thread_ops 19.3% improvement
Message-ID: <202412122315.1a745d81-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caa0131-b976-4f99-c2ac-08dd1ac39b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?godEaLAqJiqQp94YiZFJwXtjOTHNQ2GaG7xj+6HhD9dFYr1XOU+tRC9SoC?=
 =?iso-8859-1?Q?0u2FFOcpF+H8obr2anHZHPxRO3kVHgzVogI2AZaNN1GZycSf+2h3jjk8/p?=
 =?iso-8859-1?Q?Yri8W5y2akxhSAqPN6d6v6vozMJoA4EQ0UxTq233WygPprfgItirQUCTIT?=
 =?iso-8859-1?Q?7cGWm5uSewIHVVrpD5Wz+sJdkInF8qssGzAXdcOc5FjPKHqP/jyiIwEhK4?=
 =?iso-8859-1?Q?kYivFR0DJht3X2CRcbhr4of3KQuSHvxeEo/ne9Exvx/NMuA5fqXQTpb0iP?=
 =?iso-8859-1?Q?8cP0IaYqAJa/619fuwS/w2piQ/YzmkF6MxRxRN+xHppchbrD8AhWF5qflt?=
 =?iso-8859-1?Q?s95HnF4KFDaDURYyKcYM8S3b6Qkyzne46ElWW6Xoou01JnDD+uF3FTPSgf?=
 =?iso-8859-1?Q?h/14VxJRydWHpd+TZrVZ/+XAnWgrn69LKA77VVA575BeGWBj0+2Jokp4GQ?=
 =?iso-8859-1?Q?cXnM5m4uJF8n6HzXylWMIuMgrwRYnEKrnSSeh1W98BjfamD3r+pA6XUy/t?=
 =?iso-8859-1?Q?n958U8YQ/O21tEJ4gAbt3oXPhBRmx+jREuHvGv/EGK6ATgYbBSAGXqMaUZ?=
 =?iso-8859-1?Q?RozHGSOP8jvia+wD9y0+15fQdDYXUxZUorv6HLsMq2pFgsL7MqGIGlSTqu?=
 =?iso-8859-1?Q?lAp/VxbRqVCyvZ5JyPFPjaVEBXSdNn3ctczKk0vP7jXl1MektjfEHCxT85?=
 =?iso-8859-1?Q?hmagUKieYQDBtnnkKD4mZsNcbXSp2HCjhkRNY8cIzIM9zzhb24wLRp3+Zz?=
 =?iso-8859-1?Q?njc3E/VCIFdQNjY9Eyy0FdG2QQkwASEI7Wo/7nCjPBdzC5n5em+Y9KqnsA?=
 =?iso-8859-1?Q?Lh1tm5SUT45cgPL2rsiUuobCEbTqTP1+AFxPLG5cYalQfhflhiAJ+5THbm?=
 =?iso-8859-1?Q?8kNQLPa4rBK29WRAb2DnlSRPImxobWTDMWZ1ymRXOnoktfh199iv9wymZA?=
 =?iso-8859-1?Q?oWUhttlzhKqRJKmxi9fIRZSaiRGZ141K8+PIhdfkqvMZXRxNCexWplL5RU?=
 =?iso-8859-1?Q?yrFDsC3vjom8wqEyoAvTl1o5vIZ+tnXp53LKKjyabQJ0K0k4K3mXKF2htL?=
 =?iso-8859-1?Q?Lef6zVk1eiDzCCdAqNWkmkwzIQ+ve5uyJARK4JMcY7Z8dlmAdfpL6FotUZ?=
 =?iso-8859-1?Q?unQtpOdJaLwM9zdLvaHK4DXBL9KGIDrQgvq7nyeSOpHJhVxTnTAiho7Kxa?=
 =?iso-8859-1?Q?2ucPbWTEOfQisvGtNar/01cxjRLrjFjm8e5dOrL8ODkllDVYg+GRNRHfLi?=
 =?iso-8859-1?Q?U4VfEw17rKj2Rfhowtoa1JjC0zoAYegu2Nm/SYM3eDs0KP9Qgd6CUMceL3?=
 =?iso-8859-1?Q?vfHzQL9iBWYH0mEPRW0hqJUUtWByrNe5UeBM+b2UQxnwOXWCbo+Z38TeyE?=
 =?iso-8859-1?Q?r5pedHogTj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5mFY2R3PEaV/PouIO96tDM5BbHUhgQJOtZ9HjqUQcM3noyibpcd+J/5CLx?=
 =?iso-8859-1?Q?MzKdwc4n01anGxHHyYq+bnE42dQ8h1Iekm0PGQ4JA99VAWLdWNQ9qtOOuM?=
 =?iso-8859-1?Q?eqVCiy55Zeu9TidCJqrzspxnNJJMBeH5ZjNqvvYnPE9Y1yGQjyOPSwZ42x?=
 =?iso-8859-1?Q?XmN9SU2HjkHkck0iRmNw5vryLDk2KK/gSE0/uybRQ2B9aVfITDW2j678IQ?=
 =?iso-8859-1?Q?D2sPKnkPU8/sZ5HfH05umWypReIluGCOInELN/5loGkKevbra8+w8c6YrM?=
 =?iso-8859-1?Q?Vgf8NGhpcZbS5avojy3JXKQzt8Ory3TJAOnvnp8p6NeaT4DCrD7NA/cah7?=
 =?iso-8859-1?Q?K2hWIesLcHO9+vhRI+FhNiUS4Ml0QCzKJ8U8XJ0nMzut45xVr65NBjYK4R?=
 =?iso-8859-1?Q?ACiSpMXHVjNNK9enVWeM2NxYZhSKsKxjZw+DQuwoOjtmURgcnk0TppupSR?=
 =?iso-8859-1?Q?qSUZranGmivdwhAjahMX6pH9NLCMm/chXua64viKQCWK6I/zxV56qORQ0Z?=
 =?iso-8859-1?Q?aJIvqs6fv8sZeL8UDwDEMFNaSRYnXztyyE/KqkKZg5Pi2rykN1ICrHHLrP?=
 =?iso-8859-1?Q?XGymz4n/z6J00DAE+5YBTt92wU6Idi82XIP2z0vFix0yavtXinX6+Fl9W8?=
 =?iso-8859-1?Q?RziGkweGkRIJ4iZBgNubEBrop7vSXzH36eGVhCEFOG2o7ORMqdyjl+6Ly2?=
 =?iso-8859-1?Q?51tk81m/q5ZOUq1nsbgs5sbb4+DawdwEPsQHnWlri5EeN3010v40af1h+h?=
 =?iso-8859-1?Q?XE0TifWGZptKc/mzZZmjFfA6jsYy60BzB3pW2RAqEPIDRmghUEPA16E0WD?=
 =?iso-8859-1?Q?mZJrPsHbu0itDfx7uiDv3EJbXBkzRWpglqnAsAipd9UnPbXmMG7SNUCetd?=
 =?iso-8859-1?Q?GpyLKWsLVHIvRMMaJJjqL9F2GmwyV/haFSbIzPfL2h9QwlGL/YB4LgBFlt?=
 =?iso-8859-1?Q?ojF7Mv9c89+IOpSkITOOzl7U8/bzA7zy0fk/WM3lkc4FrvAamvKW2i8HH0?=
 =?iso-8859-1?Q?5rA7baMtBuQV8Gz0QXHxIkmOmtFD69fmzHhldGoBW9bxdIFVUkVIsLrey8?=
 =?iso-8859-1?Q?KVMDTUcORBWk5VqtmHPkF/SEnw0lCKWl67cGm2hOuGsNY6mtgR1UCAyReX?=
 =?iso-8859-1?Q?Nd7urEg9rtQUv/VM5pGpyB/s96Ithqjo/s/g+m5DJAoAv/Cz0Qs/C8o8Nb?=
 =?iso-8859-1?Q?fglIK/iTpIldo4yw/l0B/cyshsRauj9gkkqZabma3J1sLOskZMp+m85t4R?=
 =?iso-8859-1?Q?L5eLo9FMhNL1RYqZFdQX+3uXJNB3qj7/7CtmDLNhCI5B0uGJhHf2JL8vlZ?=
 =?iso-8859-1?Q?GPhiYy/2NLCUKWrHSUY7s9OtqA6WBR4qOASUoHsklM8QQVzT8B1mgsBeSi?=
 =?iso-8859-1?Q?dYNVtI6TAdQadH6ms/02vvFs84oG6kMYJAeLLzEp3/TxZJtLFz8TvjA9Pj?=
 =?iso-8859-1?Q?Ve88Vu6rac+FfOA+ONvaaNnq+8YimDDfxkkMHSj/j/32HZq4qgReLBVnwM?=
 =?iso-8859-1?Q?aAVd9wsaDU/COulU7cvgvtxQpUEQ4x3i1G4gbioqnp5uhTMiDs4p79CEfQ?=
 =?iso-8859-1?Q?H6xiyY9ZEyt5frAzEcq9dGfO4zJuFXE8GPAGZOHJeNn6hAGuD+1uYHXH+Z?=
 =?iso-8859-1?Q?w+AKFOaxWymRlep4Es2rMO47CgP+jWuNbm9WAUBnS4V7S1hzCtouHwuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caa0131-b976-4f99-c2ac-08dd1ac39b97
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:42:39.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9UtgPWa9Cu1u5xogloov8/M/0O3QoEqXdt3SgLDSGH7QETe/cX5KctDnuDZkx0qcEQIaDUjlABcXOtP3Hh5Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 19.3% improvement of will-it-scale.per_thread_ops on:


commit: 6df37a9175b2332651f820dabcf09d958e2838b4 ("futex: Track the futex hash bucket.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v4.5

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 100%
	mode: thread
	test: pthread_mutex5
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241212/202412122315.1a745d81-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/pthread_mutex5/will-it-scale

commit: 
  f9c3465f79 ("futex: Hash only the address for private futexes.")
  6df37a9175 ("futex: Track the futex hash bucket.")

f9c3465f79b97231 6df37a9175b2332651f820dabcf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    249211 ±  5%     -12.6%     217791 ±  4%  meminfo.Mapped
      0.73            -0.1        0.65 ±  2%  mpstat.cpu.all.usr%
    171009 ±  4%      -8.5%     156505 ±  2%  vmstat.system.cs
 4.397e+08          +182.3%  1.241e+09 ±122%  cpuidle..time
  11572000 ±  3%     +44.7%   16746422 ±  3%  cpuidle..usage
      2395 ±  2%     +20.5%       2886 ±  2%  sched_debug.cpu.avg_idle.min
     19.17 ±  6%      -7.6%      17.72 ±  5%  sched_debug.cpu.clock.stddev
    117008 ±  3%      -7.6%     108083 ±  4%  sched_debug.cpu.nr_switches.avg
     17533 ± 44%     -65.6%       6031 ± 28%  numa-vmstat.node2.nr_mapped
     12394 ± 42%     -56.5%       5385 ± 26%  numa-vmstat.node2.nr_slab_reclaimable
    531719 ± 69%     -98.4%       8326 ±198%  numa-vmstat.node2.nr_unevictable
    531719 ± 69%     -98.4%       8326 ±198%  numa-vmstat.node2.nr_zone_unevictable
    564.17 ± 27%     -40.5%     335.80 ± 30%  perf-c2c.DRAM.local
     31523 ±  2%     -10.1%      28329 ±  3%  perf-c2c.DRAM.remote
     24225 ±  2%     -10.6%      21654 ±  3%  perf-c2c.HITM.remote
     37087            -9.1%      33705 ±  4%  perf-c2c.HITM.total
  12683598           +19.3%   15128378 ±  2%  will-it-scale.224.threads
      0.11 ±  4%     +23.5%       0.14        will-it-scale.224.threads_idle
     56622           +19.3%      67536 ±  2%  will-it-scale.per_thread_ops
  12683598           +19.3%   15128378 ±  2%  will-it-scale.workload
     49577 ± 42%     -56.5%      21544 ± 26%  numa-meminfo.node2.KReclaimable
     69331 ± 43%     -65.6%      23847 ± 28%  numa-meminfo.node2.Mapped
   2778125 ± 52%     -73.5%     737515 ± 24%  numa-meminfo.node2.MemUsed
     49577 ± 42%     -56.5%      21544 ± 26%  numa-meminfo.node2.SReclaimable
    137905 ± 13%     -26.0%     102005 ±  6%  numa-meminfo.node2.Slab
   2126878 ± 69%     -98.4%      33306 ±198%  numa-meminfo.node2.Unevictable
    493659            -2.8%     479977        proc-vmstat.nr_active_anon
    197492            -0.8%     195981        proc-vmstat.nr_anon_pages
   1173403            -1.0%    1161422        proc-vmstat.nr_file_pages
     61995 ±  5%     -12.5%      54220 ±  5%  proc-vmstat.nr_mapped
    297145            -4.1%     284994        proc-vmstat.nr_shmem
    493659            -2.8%     479977        proc-vmstat.nr_zone_active_anon
     18032 ± 54%     +96.1%      35368 ± 26%  proc-vmstat.numa_pages_migrated
     18032 ± 54%     +96.1%      35368 ± 26%  proc-vmstat.pgmigrate_success
      0.05 ± 12%     +20.0%       0.06 ± 11%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.08 ±  4%     +20.0%       0.10 ±  6%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      7.89 ± 68%     -52.1%       3.78 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.78 ±  4%     +18.6%       4.49 ±  4%  perf-sched.total_wait_and_delay.average.ms
    453207 ±  4%     -13.2%     393197 ±  4%  perf-sched.total_wait_and_delay.count.ms
      3.77 ±  4%     +18.7%       4.48 ±  4%  perf-sched.total_wait_time.average.ms
      4.39          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1344          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    442497 ±  4%     -13.9%     381078 ±  4%  perf-sched.wait_and_delay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
      1542 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.33 ± 15%     -40.6%       1.38 ± 35%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    554.50 ±190%     -99.3%       3.91 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
      1541 ±  6%     -18.3%       1260 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.06 ± 76%    +931.0%       0.66 ± 77%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
    367.70 ±118%     -97.8%       7.94 ±145%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1.70 ±  7%     +25.1%       2.12 ±  3%  perf-stat.i.MPKI
  38930792 ±  7%     +23.5%   48074667 ±  3%  perf-stat.i.cache-misses
  69228168 ±  5%     +19.5%   82708343 ±  2%  perf-stat.i.cache-references
    172005 ±  4%      -8.4%     157491 ±  2%  perf-stat.i.context-switches
    295.15            +1.7%     300.20        perf-stat.i.cpu-migrations
     21924 ±  7%     -21.1%      17292 ±  5%  perf-stat.i.cycles-between-cache-misses
      0.01 ±  2%     -23.4%       0.01 ± 18%  perf-stat.i.metric.K/sec
      1.69 ±  7%     +25.4%       2.12 ±  4%  perf-stat.overall.MPKI
     56.10            +1.9       58.02        perf-stat.overall.cache-miss-rate%
     21862 ±  7%     -20.2%      17448 ±  4%  perf-stat.overall.cycles-between-cache-misses
    546682           -16.5%     456641 ±  2%  perf-stat.overall.path-length
  38798683 ±  7%     +23.5%   47912740 ±  3%  perf-stat.ps.cache-misses
  69090235 ±  5%     +19.5%   82560051 ±  2%  perf-stat.ps.cache-references
    171454 ±  4%      -8.4%     156978 ±  2%  perf-stat.ps.context-switches
    293.82            +1.6%     298.66        perf-stat.ps.cpu-migrations
     58.45            -0.6       57.80        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_wake.do_futex.__x64_sys_futex
     58.50            -0.6       57.86        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     58.72            -0.4       58.28        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.36            +0.1       99.45        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.36            +0.1       99.46        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.32            +0.1       99.42        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.32            +0.1       99.43        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.26            +0.3       40.60        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
     40.25            +0.3       40.59        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait
     40.35            +0.5       40.84        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     40.58            +0.6       41.14        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     40.59            +0.6       41.14        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.49            +0.6       41.06        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     58.72            -0.4       58.28        perf-profile.children.cycles-pp.futex_wake
     98.73            -0.3       98.41        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     98.79            -0.3       98.48        perf-profile.children.cycles-pp._raw_spin_lock
      0.37 ±  2%      -0.1        0.29 ±  3%  perf-profile.children.cycles-pp.pthread_mutex_lock
      0.12 ±  3%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__schedule
      0.08 ±  4%      -0.0        0.06        perf-profile.children.cycles-pp.schedule
      0.09 ±  5%      -0.0        0.07        perf-profile.children.cycles-pp.futex_wait_queue
      0.09 ±  4%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.08 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.08 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.08 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.06 ±  9%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.futex_q_unlock
     99.39            +0.1       99.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.38            +0.1       99.48        perf-profile.children.cycles-pp.do_syscall_64
     99.32            +0.1       99.42        perf-profile.children.cycles-pp.do_futex
     99.32            +0.1       99.43        perf-profile.children.cycles-pp.__x64_sys_futex
      0.00            +0.2        0.18 ±  2%  perf-profile.children.cycles-pp.futex_hash_priv_put
      0.02 ±142%      +0.2        0.25 ±  8%  perf-profile.children.cycles-pp.futex_hash
     40.35            +0.5       40.84        perf-profile.children.cycles-pp.futex_q_lock
     40.58            +0.6       41.14        perf-profile.children.cycles-pp.__futex_wait
     40.59            +0.6       41.14        perf-profile.children.cycles-pp.futex_wait
     40.49            +0.6       41.06        perf-profile.children.cycles-pp.futex_wait_setup
     98.28            -0.3       97.97        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.37 ±  2%      -0.1        0.28 ±  3%  perf-profile.self.cycles-pp.pthread_mutex_lock
      0.12 ±  4%      -0.0        0.11 ±  6%  perf-profile.self.cycles-pp.futex_wake
      0.05 ±  8%      +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.futex_q_unlock
      0.00            +0.2        0.17 ±  2%  perf-profile.self.cycles-pp.futex_hash_priv_put
      0.02 ±142%      +0.2        0.25 ±  8%  perf-profile.self.cycles-pp.futex_hash




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

