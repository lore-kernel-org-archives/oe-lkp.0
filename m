Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59472B9AA
	for <oe-lkp@lists.linux.dev>; Sun, 14 Jul 2024 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720955442; cv=fail; b=i8jAi7Td9imu64hJ7JNvpoXTj/Lq3vdyZ77gJGv4TJ2PVR1ldT71d4O1lJgaCky/n89NHhcVDj12sKd5lquXIMZF8APMRQzhdUUgiTzjAaFur82H0jit0BtHTGoSeVdYuIoO2uDJvyWdMP9Qqk97bFr6+u/ROTlPp1S/Clutj+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720955442; c=relaxed/simple;
	bh=1/D3o2CE/fbGlpDeMepRqVEVXxATS5IxkdPPVr2t+d8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LaYVrQYv0ng2pIlAOmmFgbaJAdVG9yzAdXX6rKvV2AxDrqQ8tDjAb6EZPtJoHOF5oZqdTaGSb5UpyJXYlQi0cyWo9xu+los99qOBTaqpO0uz+aCWw9mw+GX150f9x4R6ye2vRPwtIMmrplZrNnh+Q8XRCRnZ0nb2CSJadrP2mQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYRTprYG; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYRTprYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720955441; x=1752491441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/D3o2CE/fbGlpDeMepRqVEVXxATS5IxkdPPVr2t+d8=;
  b=PYRTprYGFDxo2GkDVAuKCfJ6zdx2PPn874x75gTic1KcyO1W8NjL9kyr
   DOnYDlGV61HdjPveKN5usGVQO/GbP9FnoKyCcuK6yrU/jgbh1+j4qgl+e
   8HhM6UnzOgPjNCER4A24bH2UV6+WfWzJhOM2QV80/UZRWVq7YGlRPTTzc
   WTpXTAzlXLc8zRZCiLKUjCriNbtHWUW4ueg2E+swQyCuW4T9teAcqCSBu
   1vIn9+8oiP0mKtnBtc5IH80XFZZySOhkaDTukvaISuRGcFd7RvnTLMso6
   aJT8dm085JnX99U/L1TvHlRTfGIWRDeY42HaDZpNM55kjtB+Ns7zN9Z+U
   A==;
X-CSE-ConnectionGUID: 8TRwYSS1SqyW/EX84L9P3Q==
X-CSE-MsgGUID: Ul6WnS8AQIee2c+d3CNtJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18461455"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18461455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 04:10:41 -0700
X-CSE-ConnectionGUID: wPe39YMaS3maF4cnaXv07g==
X-CSE-MsgGUID: lpJBxnmaRa21uq8ZivpIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="72570877"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jul 2024 04:10:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 04:10:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 04:10:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 04:10:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 04:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrO6SEbRkj0lb2Xs4tVJgLgpSmdorCDK4CCXPL67CUw3qc4fbJ4aQ/51tgPNjNxhuT1jUwBMT2Pf4k2FPfWbie3RkTlXRlaB9Q9ce2eZ+409SkWaR5+lVzccljRqr7ofpgW6qzOVPMhjo3JilNntu5iQ09+77YNcJQeX5J2ZMTY6gr9bEC/1IWbhSepgLjZWublSpBxw0pvSjvMybBOzGcOrwYpnjBNb0PI8ShqnvjWFEhvQiqVVlT/G3/fTLloWFn8+3hMOOK/ske/02JmXK7rx4v4yASu1areIHEhFdleNYqxTHgZmGXXhLw8s1loj5Yrq+ow+HOYdaju/tZaPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC4lU9YS/Z9ZV0YdXJ2GAUGbQDbWBEWg9OuF20fQ7ME=;
 b=E7IiEnVKtitXSIM6HqbUSCJEOYKGy09djyJR29r7DEYuqv/YoSFb97DgCV7pG7XeR4rGvmT7sfRqU1RvlZhVRYAshN/WLuk2j174VblsrlHLCZbrttDnWQOzJd3SdI8pf0yU2XdJVoOmAS606C7/z738OhVJkEbSQ9ZekNOorsB6h0ecBKip6aurNTXMiY+prRF70k9bjz2+hDInd02pOGnlXshIl0RtnRNGUknvpA+0ZKH+0hUQAFpWrfYpiVZez46vwmZ/GSbDohI+pvFe89rqaX2Kg1R6nxGzevkzkIVQSF+inuY3FcoltRnXT7z8j7Xr/idePDU/MO5eln14jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Sun, 14 Jul
 2024 11:10:31 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7762.027; Sun, 14 Jul 2024
 11:10:31 +0000
Date: Sun, 14 Jul 2024 19:10:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-sheaves-v1r0] [TESTING, HACK] 9cb4096680:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202407141855.53dbebec-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c48264-10af-4e95-ec3d-08dca3f59305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kb2RP29DbTstK6X09QwAQtrj28Wj1Eyp6tmwVacqXLbwhOklgOJNas90/YWQ?=
 =?us-ascii?Q?P7+LOd3I8mQ9ZZpam7ct5ZaSZGr8IRJCczoDRDt/tnyNsAnQ+o6qJ31SRy6N?=
 =?us-ascii?Q?Ec4LWqdHpHbwGd5MsjmryKCuhu//kX9UsVUhzrDLlde031KbR/67pzxduQgT?=
 =?us-ascii?Q?0fqorSfBAJP266fMwksRuc/6V1qO0UgEj8xhdr7B5XI9mExmEZOtzOFvU9CH?=
 =?us-ascii?Q?L+ARcaeUNEkmktuSbGvWwUIK4a2zlOsSwRhG79Ct9ykUx44DBfDZeUAykKz9?=
 =?us-ascii?Q?w4gfR5khq0L66fcFL6olylBdZHOQ9kRrXduBFOuzh37O9kBRR2hOzX3vD4Uv?=
 =?us-ascii?Q?WNJ5Zko7/GaQwZ/P4RfsjNeGnEN8nFn8zPrJQ5rnV1Al8R7U4bbMqI1b7yvn?=
 =?us-ascii?Q?RAY1tM0fpenE1I9yfcfdcja9rbP8jd5dS2jz4ZjEGLlckvQ2ndAI1BviF5ij?=
 =?us-ascii?Q?nqldLCCdN3XDF5wWOfkRc3Jt+nVta4QgdPU6D2iy4/R33etPe+lESzDEV4gc?=
 =?us-ascii?Q?YYcRxUDeJ6OxUXKA8u7sWghKAMK8XYXHuDHGgS+7cNe7kByjiu3fK2r9mlhR?=
 =?us-ascii?Q?n3CbxjnszYbaTdfT2HTI63BEG13Z6RzJMpt1EJ+KBEhCPtoZzRBSawYnlB2v?=
 =?us-ascii?Q?sodBfmyWVSBLkyKZI9DQS/J88M8JYCS3AGI4v7Ny+YaKtWatBV3CvxvDPOXs?=
 =?us-ascii?Q?nFwzGX9nAEHs1TM3A/Nl/8vyb5975lkdT9k8D92YbWm5pGIs+I4oBy+AAE3u?=
 =?us-ascii?Q?/59YX+aJdpjKShOUxGSmLwPhobl5Jl2vWZYSNbDFC3wF82QH1ioh7cKASBYd?=
 =?us-ascii?Q?EEJc1NjKN6HffbmEFUF7uxAabnW1EKig4hx48xS33x9q/R3FtTeqpT/y7qYC?=
 =?us-ascii?Q?ME7iW2gt0gkNXyIFDaq6sc9KyiK5ShHPyhF2bl5YDSatwrY6qDkHiAmIFvKw?=
 =?us-ascii?Q?+krm7sEicC2vLap46MhLa8buAMwNmwbrV6EJ9a10HfVaTF1vTdkZ0GjsIVLm?=
 =?us-ascii?Q?zHwf8Yzox4LYkTd6VPGdercb0QBo0C6lMF5QiiRx9wRxfj1hDwz4gZlpsXfB?=
 =?us-ascii?Q?Ydu4cxbqbwLcLIpZ0nHDJ9ycg9/2io9HAgAqmrOpBdcs9K9qVlcyHzvMQYzJ?=
 =?us-ascii?Q?E7shYEXf8V30Q604VVXlv2C2zU8WlTMw1ol2CqLPV4VvvaSwumKsMJdFjX6k?=
 =?us-ascii?Q?y/N8/19soLF3uIubm/n/4SAtsRxaorwQo+KoTdIEvcQ5rN3lR+58ZYJiqt+T?=
 =?us-ascii?Q?GWGlWCWFqLyePfJ1J1kmOnqhoWZjhr3o3RYOZG9BGWI7XH7mSoUTeCmLjvxz?=
 =?us-ascii?Q?uMXexLrhW739lRRz5giLVwJd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FzdaCHSro3m/PKKeM9xpjXTzlHHaSwOquyqIy971daEdl0CWZhStiJsa70T2?=
 =?us-ascii?Q?+KDTun6mAxHilyc9V3SGdgkwOOH6zhzk9Gt3fPyeofmFPF/P5VB8Ve4ZUZTW?=
 =?us-ascii?Q?RA2IYWwkwGhwXaU7MtnELfchD4YPguSXt+EsW/oIlAh+VkfYkHPiSFD/RxSP?=
 =?us-ascii?Q?FQijxk7fTcnMm/OnYgTUf9uZMLFizDwIEgyDszboXdoXlnyt+EWnFCsvhLYg?=
 =?us-ascii?Q?81NkK9o0QYO+pmVSfwcPyDm0u0Pj4fTEsVr+ttduxSCWwOJk/J59iDH1ppt3?=
 =?us-ascii?Q?p/6U2cpFmnpZ+Uiu1oAMA1UEUwBVy06XW2BIdTsKOUHn74m8RwH8iydZ8TNx?=
 =?us-ascii?Q?KFmLulo7vTWWYFPl46/kvAI8i+5wzFoowXXgx3j7Yf7GzOiJB3WEVwaJCnz0?=
 =?us-ascii?Q?5+f6XiuyRaQB2Vsa8RWP/uGjy7Yju9yzHVWWjlshGVztht8G/rIbWoMy+wIe?=
 =?us-ascii?Q?hXdUMHVLzBi398YKVe7/G+jYRumDXzYdMSlB98zR2F9d4y1fDcleBpKGk4ui?=
 =?us-ascii?Q?WVnLTGqCmf0KAcN2EIqAR163Fq5VTjU6rPM1K31rV1S3+UzAZNX6z3dtA0VK?=
 =?us-ascii?Q?qUs+E1HpIxNMiHh6t4GQhA52LGiA1B6IMgqILrIgQAn2Sqa6+19XjVmrUocL?=
 =?us-ascii?Q?jTs7MAqN8uVtc8i+noGlYcB5Qq7a3eyf4C6ggk1hOB8K0K1HmOZH+7F1sY5v?=
 =?us-ascii?Q?JYKFcz2mAcCLrljW/gLOlgwYqTyyO7pSZAbOvJ5kjV/g26Oqq3swCGY2VPmr?=
 =?us-ascii?Q?j38p2Uh9BZ04yzFD763up8CclyHK1kiEwR3ndK1KjBaND5UJ9MlUklIZl38w?=
 =?us-ascii?Q?rOtPKDUBTsv4RUE30jMy9t8U3XfE44oGu6mgpMKGFS1SiJc4dscPlB7CyDV0?=
 =?us-ascii?Q?3eiFxAzFozG+t7nxBURpb/W4TMqZhlgcxAMwTlCz5/GI66gcHqC5twMz0Bqo?=
 =?us-ascii?Q?wldWsP7b8Rxadz/F7u0uq5+g5nuHf0HBGhhm8AzTEEjaMYKqHInz9b6SDm7a?=
 =?us-ascii?Q?QP4q+ezkeLKyZ4ercAfRrB6nebIbz7aKhXam+QsYWErWZTQ3Yz3U/wfDVRBY?=
 =?us-ascii?Q?CDGMbvAo7vDZ5DqcyyamqQkbEWhCWC7HOHNQeZIyuigwpzCY0Nl/445PtWYY?=
 =?us-ascii?Q?lP8zanParAkEnkpa8eNkWnR4BDstUnyx6SBvNO2vLQRUNUu0U8lGeGY39Xrk?=
 =?us-ascii?Q?sVeMl1Z0kwbFjNmRuUFiQEU36V6gO4W+yWitEV9tLTU9FRmVZ/K0kmgrXHnO?=
 =?us-ascii?Q?3cMiPqMoO7kSUfDvzc54i0QW0zmxqUF3jPnkuF5F9oDaMqL3+NyittKeJ/ZK?=
 =?us-ascii?Q?hXuJTU9yI8wY1YsECkOwTyet2p20egCarfbobveB79FF+CHkTadXtoCeFCbk?=
 =?us-ascii?Q?ArDM24MQ9PPXOlQAkexavPkamPoeaOsEDqc8ne4NUdUX7hzbbslsQRSj8Bek?=
 =?us-ascii?Q?sDLXYqTncz01rwHU/k0+rTkrHqN7CK/NvfnStb649kz6LXj0aL6Am2xbLacM?=
 =?us-ascii?Q?FmOe3yul1lr8Bc45OdPQ8iT4B/Y2NlkkkznB6XwHcgFwzgkLQCIouDv+p1I4?=
 =?us-ascii?Q?YxC0hFWRS3leiBpI9sSY5N/Z/Qs0b8+S7WNPXM0iGG/s+L6mb1j9+ZTRzlXy?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c48264-10af-4e95-ec3d-08dca3f59305
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2024 11:10:31.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xri3G8k5/7YbfFRSR3GwlKprS8vdHHXGfUrEpUNDDyghxJdXPjV7/Fxhm0poZNANh677Ll33lI0V5aUNbmIw/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-OriginatorOrg: intel.com


hi, Vlastimil Babka,

we noticed this is a 'TESTING, HACK' patch, however, we are not sure if this
report could supply some hints or information to you, so just report FYI.


Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 9cb4096680ee90fe6be1b22ff3961174fa8e3ee4 ("TESTING, HACK: sheaves for everyone")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r0

in testcase: boot

compiler: gcc-10
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------+------------+------------+
|                                                       | 7e57e2483a | 9cb4096680 |
+-------------------------------------------------------+------------+------------+
| boot_successes                                        | 6          | 0          |
| boot_failures                                         | 0          | 6          |
| BUG:unable_to_handle_page_fault_for_address           | 0          | 3          |
| Oops                                                  | 0          | 6          |
| EIP:refill_obj_stock                                  | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 6          |
| BUG:kernel_NULL_pointer_dereference,address           | 0          | 3          |
+-------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407141855.53dbebec-oliver.sang@intel.com


[    9.827171][    C0] BUG: unable to handle page fault for address: 6b6b6b6b
[    9.828805][    C0] #PF: supervisor read access in kernel mode
[    9.830174][    C0] #PF: error_code(0x0000) - not-present page
[    9.830821][    C0] *pde = 00000000
[    9.830821][    C0] Oops: Oops: 0000 [#1] PREEMPT
[    9.830821][    C0] CPU: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.10.0-rc1-00012-g9cb4096680ee #1
[    9.830821][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 9.830821][ C0] EIP: refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
[ 9.830821][ C0] Code: ff 31 c9 31 d2 b8 d0 a8 92 c3 68 6c e5 24 c1 6a 00 6a 00 6a 02 e8 66 7e e7 ff e8 89 7d 2f 01 83 c4 10 85 c0 0f 85 ae 01 00 00 <8b> 03 a8 03 0f 85 f4 01 00 00 ff 00 e8 6d 7d 2f 01 85 c0 0f 85 75
All code
========
   0:	ff 31                	pushq  (%rcx)
   2:	c9                   	leaveq 
   3:	31 d2                	xor    %edx,%edx
   5:	b8 d0 a8 92 c3       	mov    $0xc392a8d0,%eax
   a:	68 6c e5 24 c1       	pushq  $0xffffffffc124e56c
   f:	6a 00                	pushq  $0x0
  11:	6a 00                	pushq  $0x0
  13:	6a 02                	pushq  $0x2
  15:	e8 66 7e e7 ff       	callq  0xffffffffffe77e80
  1a:	e8 89 7d 2f 01       	callq  0x12f7da8
  1f:	83 c4 10             	add    $0x10,%esp
  22:	85 c0                	test   %eax,%eax
  24:	0f 85 ae 01 00 00    	jne    0x1d8
  2a:*	8b 03                	mov    (%rbx),%eax		<-- trapping instruction
  2c:	a8 03                	test   $0x3,%al
  2e:	0f 85 f4 01 00 00    	jne    0x228
  34:	ff 00                	incl   (%rax)
  36:	e8 6d 7d 2f 01       	callq  0x12f7da8
  3b:	85 c0                	test   %eax,%eax
  3d:	0f                   	.byte 0xf
  3e:	85                   	.byte 0x85
  3f:	75                   	.byte 0x75

Code starting with the faulting instruction
===========================================
   0:	8b 03                	mov    (%rbx),%eax
   2:	a8 03                	test   $0x3,%al
   4:	0f 85 f4 01 00 00    	jne    0x1fe
   a:	ff 00                	incl   (%rax)
   c:	e8 6d 7d 2f 01       	callq  0x12f7d7e
  11:	85 c0                	test   %eax,%eax
  13:	0f                   	.byte 0xf
  14:	85                   	.byte 0x85
  15:	75                   	.byte 0x75
[    9.830821][    C0] EAX: 00000001 EBX: 6b6b6b6b ECX: 00000001 EDX: 23d164d6
[    9.830821][    C0] ESI: 000000c4 EDI: 00000000 EBP: c4bc1e54 ESP: c4bc1e3c
[    9.830821][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010002
[    9.830821][    C0] CR0: 80050033 CR2: 6b6b6b6b CR3: 2b0e7000 CR4: 000406d0
[    9.830821][    C0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    9.830821][    C0] DR6: fffe0ff0 DR7: 00000400
[    9.830821][    C0] Call Trace:
[ 9.830821][ C0] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 9.830821][ C0] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 9.830821][ C0] ? page_fault_oops (arch/x86/mm/fault.c:715) 
[ 9.830821][ C0] ? kernelmode_fixup_or_oops+0x64/0x70 
[ 9.830821][ C0] ? __bad_area_nosemaphore+0x10d/0x1a8 
[ 9.830821][ C0] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
[ 9.830821][ C0] ? do_user_addr_fault (arch/x86/mm/fault.c:1452) 
[ 9.830821][ C0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 9.830821][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 9.830821][ C0] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 9.830821][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 9.830821][ C0] ? refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
[ 9.830821][ C0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 9.830821][ C0] ? refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
[ 9.830821][ C0] __memcg_slab_free_hook (mm/slab.h:599 mm/memcontrol.c:3804) 
[ 9.830821][ C0] __rcu_free_sheaf_prepare (mm/slub.c:5049) 
[ 9.830821][ C0] rcu_free_sheaf (mm/slub.c:5072) 
[ 9.830821][ C0] rcu_do_batch+0x17b/0x588 
[ 9.830821][ C0] rcu_core (kernel/rcu/tree.c:2812) 
[ 9.830821][ C0] rcu_core_si (kernel/rcu/tree.c:2828) 
[ 9.830821][ C0] handle_softirqs (include/linux/jump_label.h:207 include/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:555) 
[ 9.830821][ C0] run_ksoftirqd (kernel/softirq.c:411 kernel/softirq.c:929) 
[ 9.830821][ C0] smpboot_thread_fn (kernel/smpboot.c:164 (discriminator 3)) 
[ 9.830821][ C0] kthread (kernel/kthread.c:389) 
[ 9.830821][ C0] ? sort_range (kernel/smpboot.c:107) 
[ 9.830821][ C0] ? kthread_park (kernel/kthread.c:342) 
[ 9.830821][ C0] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 9.830821][ C0] ? kthread_park (kernel/kthread.c:342) 
[ 9.830821][ C0] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 9.830821][ C0] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    9.830821][    C0] Modules linked in:
[    9.830821][    C0] CR2: 000000006b6b6b6b
[    9.830821][    C0] ---[ end trace 0000000000000000 ]---
[ 9.830821][ C0] EIP: refill_obj_stock (include/linux/percpu-refcount.h:174 include/linux/percpu-refcount.h:204 include/linux/percpu-refcount.h:222 include/linux/memcontrol.h:810 mm/memcontrol.c:3650) 
[ 9.830821][ C0] Code: ff 31 c9 31 d2 b8 d0 a8 92 c3 68 6c e5 24 c1 6a 00 6a 00 6a 02 e8 66 7e e7 ff e8 89 7d 2f 01 83 c4 10 85 c0 0f 85 ae 01 00 00 <8b> 03 a8 03 0f 85 f4 01 00 00 ff 00 e8 6d 7d 2f 01 85 c0 0f 85 75
All code
========
   0:	ff 31                	pushq  (%rcx)
   2:	c9                   	leaveq 
   3:	31 d2                	xor    %edx,%edx
   5:	b8 d0 a8 92 c3       	mov    $0xc392a8d0,%eax
   a:	68 6c e5 24 c1       	pushq  $0xffffffffc124e56c
   f:	6a 00                	pushq  $0x0
  11:	6a 00                	pushq  $0x0
  13:	6a 02                	pushq  $0x2
  15:	e8 66 7e e7 ff       	callq  0xffffffffffe77e80
  1a:	e8 89 7d 2f 01       	callq  0x12f7da8
  1f:	83 c4 10             	add    $0x10,%esp
  22:	85 c0                	test   %eax,%eax
  24:	0f 85 ae 01 00 00    	jne    0x1d8
  2a:*	8b 03                	mov    (%rbx),%eax		<-- trapping instruction
  2c:	a8 03                	test   $0x3,%al
  2e:	0f 85 f4 01 00 00    	jne    0x228
  34:	ff 00                	incl   (%rax)
  36:	e8 6d 7d 2f 01       	callq  0x12f7da8
  3b:	85 c0                	test   %eax,%eax
  3d:	0f                   	.byte 0xf
  3e:	85                   	.byte 0x85
  3f:	75                   	.byte 0x75

Code starting with the faulting instruction
===========================================
   0:	8b 03                	mov    (%rbx),%eax
   2:	a8 03                	test   $0x3,%al
   4:	0f 85 f4 01 00 00    	jne    0x1fe
   a:	ff 00                	incl   (%rax)
   c:	e8 6d 7d 2f 01       	callq  0x12f7d7e
  11:	85 c0                	test   %eax,%eax
  13:	0f                   	.byte 0xf
  14:	85                   	.byte 0x85
  15:	75                   	.byte 0x75


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240714/202407141855.53dbebec-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

