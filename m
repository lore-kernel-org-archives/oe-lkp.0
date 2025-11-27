Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674E31B137
	for <oe-lkp@lists.linux.dev>; Thu, 27 Nov 2025 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232557; cv=fail; b=B3YS05cvgYFCgVgxMOT3cx4sfNhmQ5JGFXNl9F8gn7VKedv8aTR/kV7l7a9xXNfPs0a17RnZftahNMOefk9x+ZiQOxTwEKqEwcNW0lHS5TipyqmKlmQPzrQ/MCroZ9CJCTQyTj7fVbhJi5YrmL7v68u795ZJtLeNY7g8MyL9sUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232557; c=relaxed/simple;
	bh=DF/T5X8d2fJ7S8ruZgLUlq8dDFOb+YFpgbaCQ0Xi/pc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lSJFOG76jYTPyX1sLDsxznNF0A4FSqIWB7WJ01r3T7gTv4b8HmyyoPP3WBnSLD9f6kOSKG46HTZJh6cgKCz7C60kP1b12ZKJsIm7SA4BVaOVMhFume9Qq+oEEaloqPFvYOyBDfW/mhHrZpLcIy60KXz0LXlPC3gAYKPpyNQ3A+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHJbqfDF; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHJbqfDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764232554; x=1795768554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DF/T5X8d2fJ7S8ruZgLUlq8dDFOb+YFpgbaCQ0Xi/pc=;
  b=eHJbqfDFq+hk9ijFbwiXj8eJwNNe03kwOCDFCi3rx+txYMwdwtYIDd9E
   Y7tuBMTY4HjBwI4t7Y9Twe0iJjLs9lqIfJsX3lKnExMj/ibXWcFXKXSo/
   hR4AOVIIN4KmAGB6Rfu9qjuazS3rDNvFEe0EBgHEU44q3VqXtDJAPmEHG
   XWl4xYPBcdtQPMU3nN2eTdKO8ZUSub6XgGF6qT/P06FOypRRA3uzDHBxW
   g+7VJLRTVINZCtGJ65drnO5fsnr0eVir2U/pDbYzO/bOHNM/KB326iGrt
   rWpTPRHfE28sOBTDRWbdrohfFJqCSBFgJyFL23H69QrvCxhTV9V+3SaEK
   g==;
X-CSE-ConnectionGUID: FfkC9FS8TYWJSuFY82DnDA==
X-CSE-MsgGUID: XYMsE48nSoOm3UYcr0I2Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65462427"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65462427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:35:53 -0800
X-CSE-ConnectionGUID: 4C4EQEdpTrWdLHYwA0HdDA==
X-CSE-MsgGUID: 2IsKyH/NT4CTz0+XUhpi7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="230441378"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:35:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 00:35:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 00:35:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 00:35:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NU3MJ1pdB6klmp0c63QSeuQui6rCMxCCw/aNOtER8DWbFfLDXNrWzEEUhCGmjb8UWWsNL3xlQLbL+fFgxg2wY0GsaaQp/8bu48paKzVZ/PR0RqIsSRNaDGiGJNNSDTBL0EK+NuK+Mypv3/PoawgXWX584kvNI+h7qnxZHs2pb08No9DfPzC/LGB0YjYhBm5cXpjUsZLyrNjnw2RQs2VFXBqFUK+zFQqXNqepPvUtBPoTTAxxhxoVbNujT/GTDcnijZZraYu+Xl+WSnVmcZ1l+H0T/E51Ee9nH8emRo73PAo8Gp2JBGRkEsmI/do7VVq1Lry69gQNM/o/pH5XWYBmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKHKFxB2llxeteehn7jXOuIE8iCCWD+xBcvxpzV6YSY=;
 b=Wf6ZrOjrUmUdBqYu8xSDBwoVn/Benrk/M7rnIfzO2I2jltaTxB7F7FltK+KfCysmgfE/gXrhl5qi1u8BgULeqd+h+ewXPL+zrMV9LUesuCh/3Uq2ag9I+5hJcCha7rc1TstGGiHMDqO9zbP4YE9en/G3vGWcqoWygdqv4fhHxTtZDor5HKycVZt/wBt4JZKEJUQM3Afs9oGrXIXoQmCvywrqN4TxkU8l06YOrpm/v9SwfiFHpFmYwhVJQaUPZGvS6pKz1vilkYRhqhtpQrpQbaxFOiLnOjbrfiIM79fLt8+pddf/Dlxlb8vXkFK2vX4y9BDgkBIhGy8hkDBZaAc0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7844.namprd11.prod.outlook.com (2603:10b6:610:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 08:35:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 08:35:49 +0000
Date: Thu, 27 Nov 2025 16:35:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Chen Yu <yu.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>, Srikar Dronamraju
	<srikar@linux.ibm.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<aubrey.li@linux.intel.com>, <oliver.sang@intel.com>
Subject: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202511271605.bd46ddc3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU1PR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:802:19::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 6725ee88-0e0c-46ed-af14-08de2d8ff7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A5yC6151Bvo5RS0NgIG0QnI/7Vcwe7H5wccoG8+Ea3jsDhsYbbt2pWd62Ss/?=
 =?us-ascii?Q?V1kOC/JYLa0NjfXchjVVRq9SdJyVHGEO6MDz2uAaytcUcNHkE5ibzx9PYOeY?=
 =?us-ascii?Q?qRxWLbli4taYsHXXLqrx4GGFSWj5IjuJOdnjzzdYpw9WM1/aAnkT+O+eIEfk?=
 =?us-ascii?Q?tPqVmlPzIb/X4LmAhhRAr0kKtQrsAceO6yZOkTsQMSS/963JD99Mhs1WBYgI?=
 =?us-ascii?Q?BJscQrQCdqBT7JnQNWVnWE3KtQJh+hC+CNvrozIohyHf/eAyj0d1MFB++RzD?=
 =?us-ascii?Q?Sue6RRpkxgupW8hNS9UTV13db2L53ypqN1ReJCvetqPrqcF3pHqcEYdi1ElN?=
 =?us-ascii?Q?FZ9cUB85gd4elvOzHVJEauyKKfwLWA/cY7gGAY5N8uheGaVjYvglh2NVVYny?=
 =?us-ascii?Q?MQg9L6c9ft43pjZfb9pSbghHcZW1EoVpV8hZ1g9ZFjaVidQ00BG2mOxhxsfX?=
 =?us-ascii?Q?IVAgycwOg24rziykDOg6nwZPGNA4fbotcdmnoNemPr2mE5atoXkfMxV1rEPW?=
 =?us-ascii?Q?FDVRNFyMQK1S03yIVsh2eEpTAl8a75Jr3lcdl7uQc9Q5WR6VwU8PsWP/ZVPd?=
 =?us-ascii?Q?7srQ6VuaPJus7gCXFclYK0wNdGPjhH6PCErniCdaUOHmHR6ItIpH5fEnar0a?=
 =?us-ascii?Q?bYz7MEPvA7uMQJpW1/FBCK2NBzbo4KQCA37S/QayMlx94CRLCD8Dff6mVY5s?=
 =?us-ascii?Q?X9TaMt0YdCj9XVTTNZ5PZFcypdclJO8uC3uT2OBgEx4xkgqYEVTkRww5xfWG?=
 =?us-ascii?Q?t5PuUpZbKfG3MQfu4LYGa0K2XLmUg21Ro6u4fmIhkMN/Eek3HZ8stOplQ7sL?=
 =?us-ascii?Q?uAnV790TtUHJPpmLdeqsTgjv3GxKLmcI2qbkI/tQGUoKRjBBKUzT213oo/BE?=
 =?us-ascii?Q?X6CDsIrONqcQ8PHNCBUsRxqx0bdQ8RAeC/e+bR1R17TzlnRfMVDWHjIHNv5W?=
 =?us-ascii?Q?lJJB0Uay2q27oz1fDVXdudLJPD+3BmqUQ//FL8LAFWup/Fn/KiGzW3koztQd?=
 =?us-ascii?Q?7c/7/cg8PXkIzU6PrPZB+7G/FGzvIKzzpNjw3eX/yIJXLMD/yRvFEwr4xRsO?=
 =?us-ascii?Q?Y4yYgoliWtLY/PHbCZHe1ETd3t6RbhYyMYhsjZ9Vm8TfJivI2gF9rxK13BX0?=
 =?us-ascii?Q?LB701/gtxBevz1uEt29nc0s2lye/LxQHcW/K1egvGajOzblBD2Rv/Bhoq7Yr?=
 =?us-ascii?Q?CEzbxAfG9XcoppkBryY+KAuUDwr0qhCpqITTkkt/tSTcejLWgV1zh5nZ0SQT?=
 =?us-ascii?Q?OGDbJ9GrSqfj/FrVN7RM4J8ljtwFzqLjBFCNTfKvVMYB587CzCip8mLq3OMp?=
 =?us-ascii?Q?/TXcUs9GFSV/Y8WvH0njFMv1uWtJYpIo67a6OeLLXUqCGucLo5HtW5YPnhc7?=
 =?us-ascii?Q?lfVcOnthtFH9ixRjAnNrQTi3b4wLUuits3eYaUHUA7R4lWF/WdjB7tDtoY45?=
 =?us-ascii?Q?TeeM7uP1e4d2sXL/NGl3sl28d0VXyZN4Yvv/lcdao+Z3EfZZ5bydIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rUOGBicWr1aLEPpR3S3U6acFAIAW5hFXcY+llEYMNhPhvRyw+I737PJ6ME12?=
 =?us-ascii?Q?ZjRaMfhC1LpmjlJL0/kApIq4kCnWjJUEzJKG6WtHbsUL+NY50VqfTO0pgIOW?=
 =?us-ascii?Q?VdfyeTl7QnDClxgaJ56FWTOFKR3XT2mkNwC+nq+g2EGmQm+udQHNZMdvwFNt?=
 =?us-ascii?Q?2D8IsmBwRL0cckRrf+TsXycpGmhjz1/5RvqXTkJRAI5pjtRPGXLijK2RqghN?=
 =?us-ascii?Q?vHaoc+4hbGOHKERNNNBUyVOhxW7qbmpuUGaIMi9g/fRIQ77RAfFAduJ5trZH?=
 =?us-ascii?Q?wPOUzUm8l3MQMCqHj5VD48upcXyYeB5/Wa+C/34Vr9NpxXG9Qf2xhHugeYB4?=
 =?us-ascii?Q?+usiRco0vgT6L1RJZ/TD1Xkd/hifcvu81+6Yzve0vOseVYvjcj/5BCBtC19u?=
 =?us-ascii?Q?HOVEEv67v/y7dh4sy/iwf8Y0T5LgGlvTD0JepHvR94yQIKVP9fSXqietf0GI?=
 =?us-ascii?Q?6BeXpS1Xz8mxzINc5MPJwDCwIAGO5yFQJarHhTIBguH4ZhOLvfE4j/pbz7n2?=
 =?us-ascii?Q?t7PtuE64dt9P5fmpaJsBq+CBJOElr7SwjQnwINDHihhhX0i5FSlQrwAA3rS1?=
 =?us-ascii?Q?ZvX8DcdCD/TfoYl+sNUq1BuJboAiUhvTY8BDahA9vPnhhVd+45Ck1PzSq5Y/?=
 =?us-ascii?Q?LN8hp/dcmPDRVIfa92iwoaUd5Emf+equz8/Us1ogaTtCR/o4Z1k4D8W8J9jO?=
 =?us-ascii?Q?g4r50bbYw8k79c8EktkN2pLETUfOybffV8YBvd35HwDeyVmXXgUJ1rado6bq?=
 =?us-ascii?Q?37nTpOKWQzZhZIQL6MvAcBK18AfPWtvK6/MwNT1Z728X2TB7oGm8dudN13z1?=
 =?us-ascii?Q?EyO3yi+BQXHy9xw/p/VRNjDIuRbzzpKzP6W0GpVwkTG+iCCYeiG7GMQoQOTm?=
 =?us-ascii?Q?d+nOgtQ0LYLTuvSIWoCCDCTeyLi35wYSCLGRpy+BpwqSAvo6g7gV3OP8jKXL?=
 =?us-ascii?Q?bJ63STpkEtJXAPZwxkpG7ouOz+zXBqYJj4IRwfldqDI8KxxLzZIkcy1jmK2n?=
 =?us-ascii?Q?mhHRnoGhYVdfl5AYAuKT/9/7kEb+o4d6o3TdfiNnOls4OY5PW2VEpkjC9FQC?=
 =?us-ascii?Q?XCWl7OtOvOl+qZI8hnlivwwM6hJ3i/PDjjJetfnRdNqulNt0qbAe4OeTvlLz?=
 =?us-ascii?Q?hLquByJB0CqyXLrNcnFh7eP+aYlFL3a0341yIe/rOrGFFFgd2HkPvfgv7O9N?=
 =?us-ascii?Q?7wU58gHdTLIMIAUJUARUC8seZYlxl2+EhqvXRA7BzhB1yraiZdeXTz9yXC2v?=
 =?us-ascii?Q?vR/ALmxIyLIj7Gn2Bt3Qhldh8Z4rxZ+DS8X2dusQ9y1nD/4kgq2O0QXnbe7T?=
 =?us-ascii?Q?gMg+832sgvL2wckXBaO/Tf81cyV8if0nBs97vAA9EU4yOh0OtrQ73WeRWI1V?=
 =?us-ascii?Q?NTVoD6JHdvPcok1WI+7q+dmDxGCelOt/H2GWLaH0FiA9SXrjCvFJ1y/UuJbx?=
 =?us-ascii?Q?ESY2O58dJxN4eNepbxztgKv/A7I7KpSSKqG4WWF1mDjk9Lnwt7Jx/c0hQbdz?=
 =?us-ascii?Q?VZzj8tLfJ+BEVu6ESX02d75RLr9JGFn7LOerVlvlELNdOj96u+bRqQ5H30mb?=
 =?us-ascii?Q?8OpLq8KCHhVlmmum1v509Yt7/UiJOTKmHFZ9Z0PCNTXsGjs6D3Z7dcsV33WO?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6725ee88-0e0c-46ed-af14-08de2d8ff7de
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 08:35:49.6656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8r3wU0iI17jZcxuZhLq7SWb9Mp7pvm3QCBkVDFEtrQF9ZEFmkNDNpIC33WlheSXNnRfF1sFqRCEf0fCE7N68g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7844
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp

in testcase: fio-basic
version: fio-x86_64-7c8dbca4-1_20251123
with following parameters:

	runtime: 300s
	disk: 1SSD
	fs: btrfs
	nr_task: 100%
	test_size: 128G
	rw: randwrite
	bs: 4M
	ioengine: falloc
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz (Cascade Lake) with 176G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511271605.bd46ddc3-lkp@intel.com


[    5.764008][    C0] BUG: kernel NULL pointer dereference, address: 0000000000000000
[    5.764501][    T1] futex hash table entries: 16384 (1048576 bytes on 4 NUMA nodes, total 4096 KiB, linear).
[    5.764999][    C0] #PF: supervisor read access in kernel mode
[    5.764999][    C0] #PF: error_code(0x0000) - not-present page
[    5.764999][    T1] pinctrl core: initialized pinctrl subsystem
[    5.764999][    C0] PGD 0 P4D 0
[    5.764999][    C0] Oops: Oops: 0000 [#1] SMP NOPTI
[    5.764999][    C0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S                  6.18.0-rc6-00035-geb2db043ab3a #1 VOLUNTARY
[    5.764999][    C0] Tainted: [S]=CPU_OUT_OF_SPEC
[    5.764999][    C0] Hardware name: Intel Corporation ............/S9200WKBRD2, BIOS SE5C620.86B.0D.01.0552.060220191912 06/02/2019
[    5.764999][    C0] RIP: 0010:sched_balance_rq (arch/x86/include/asm/atomic.h:107 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) kernel/sched/fair.c:11733 (discriminator 4))
[    5.764999][    C0] Code: b8 00 00 00 65 48 2b 15 c2 47 a7 02 0f 85 30 03 00 00 48 81 c4 c0 00 00 00 89 f0 5b 5d 41 5c 41 5d 41 5e 41 5f e9 bc fb f5 00 <8b> 04 25 00 00 00 00 ba 01 00 00 00 f0 0f b1 15 58 d6 af 02 0f 94
All code
========
   0:	b8 00 00 00 65       	mov    $0x65000000,%eax
   5:	48 2b 15 c2 47 a7 02 	sub    0x2a747c2(%rip),%rdx        # 0x2a747ce
   c:	0f 85 30 03 00 00    	jne    0x342
  12:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
  19:	89 f0                	mov    %esi,%eax
  1b:	5b                   	pop    %rbx
  1c:	5d                   	pop    %rbp
  1d:	41 5c                	pop    %r12
  1f:	41 5d                	pop    %r13
  21:	41 5e                	pop    %r14
  23:	41 5f                	pop    %r15
  25:	e9 bc fb f5 00       	jmp    0xf5fbe6
  2a:*	8b 04 25 00 00 00 00 	mov    0x0,%eax		<-- trapping instruction
  31:	ba 01 00 00 00       	mov    $0x1,%edx
  36:	f0 0f b1 15 58 d6 af 	lock cmpxchg %edx,0x2afd658(%rip)        # 0x2afd696
  3d:	02 
  3e:	0f                   	.byte 0xf
  3f:	94                   	xchg   %eax,%esp

Code starting with the faulting instruction
===========================================
   0:	8b 04 25 00 00 00 00 	mov    0x0,%eax
   7:	ba 01 00 00 00       	mov    $0x1,%edx
   c:	f0 0f b1 15 58 d6 af 	lock cmpxchg %edx,0x2afd658(%rip)        # 0x2afd66c
  13:	02 
  14:	0f                   	.byte 0xf
  15:	94                   	xchg   %eax,%esp
[    5.764999][    C0] RSP: 0000:ffffc90000003e30 EFLAGS: 00010202
[    5.764999][    C0] RAX: 0000000000000001 RBX: ffff8881002c2ba0 RCX: 0000000000000000
[    5.764999][    C0] RDX: ffff8881002dbc01 RSI: 00000000000000c0 RDI: 00000000000000c0
[    5.764999][    C0] RBP: 0000000000000000 R08: ffff8881002dbcc0 R09: ffff8881002c2020
[    5.764999][    C0] R10: 00ffffff00000000 R11: 0000000000000000 R12: 0000000000000000
[    5.764999][    C0] R13: ffffc90000003ed8 R14: ffffc90000003e80 R15: ffffc90000003f4c
[    5.764999][    C0] FS:  0000000000000000(0000) GS:ffff888ccb7f2000(0000) knlGS:0000000000000000
[    5.764999][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.764999][    C0] CR2: 0000000000000000 CR3: 0000002c7de24001 CR4: 00000000007706f0
[    5.764999][    C0] PKRU: 55555554
[    5.764999][    C0] Call Trace:
[    5.764999][    C0]  <IRQ>
[    5.764999][    C0]  ? rcu_do_batch (kernel/rcu/tree.c:2612 (discriminator 1))
[    5.764999][    C0]  sched_balance_domains (kernel/sched/fair.c:12186 (discriminator 1))
[    5.764999][    C0]  ? sched_balance_update_blocked_averages (arch/x86/include/asm/irqflags.h:158 (discriminator 1) kernel/sched/sched.h:1577 (discriminator 1) kernel/sched/sched.h:1884 (discriminator 1) kernel/sched/fair.c:9857 (discriminator 1))
[    5.764999][    C0]  handle_softirqs (arch/x86/include/asm/jump_label.h:36 include/trace/events/irq.h:142 kernel/softirq.c:623)
[    5.764999][    C0]  __irq_exit_rcu (kernel/softirq.c:657 kernel/softirq.c:496 kernel/softirq.c:723)
[    5.764999][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1052 (discriminator 35) arch/x86/kernel/apic/apic.c:1052 (discriminator 35))
[    5.764999][    C0]  </IRQ>
[    5.764999][    C0]  <TASK>
[    5.764999][    C0]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
[    5.764999][    C0] RIP: 0010:mwait_idle (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:114 arch/x86/kernel/process.c:930)
[    5.764999][    C0] Code: 2d c0 8e 10 00 f0 80 0e 40 48 8b 06 a8 10 75 1b 48 89 f0 0f 1f 00 31 c9 89 ca 0f 01 c8 48 8b 06 a8 10 75 07 89 c8 fb 0f 01 c9 <fa> f0 80 26 bf e9 c5 e1 00 00 0f 1f 44 00 00 66 66 2e 0f 1f 84 00
All code
========
   0:	2d c0 8e 10 00       	sub    $0x108ec0,%eax
   5:	f0 80 0e 40          	lock orb $0x40,(%rsi)
   9:	48 8b 06             	mov    (%rsi),%rax
   c:	a8 10                	test   $0x10,%al
   e:	75 1b                	jne    0x2b
  10:	48 89 f0             	mov    %rsi,%rax
  13:	0f 1f 00             	nopl   (%rax)
  16:	31 c9                	xor    %ecx,%ecx
  18:	89 ca                	mov    %ecx,%edx
  1a:	0f 01 c8             	monitor %rax,%ecx,%edx
  1d:	48 8b 06             	mov    (%rsi),%rax
  20:	a8 10                	test   $0x10,%al
  22:	75 07                	jne    0x2b
  24:	89 c8                	mov    %ecx,%eax
  26:	fb                   	sti
  27:	0f 01 c9             	mwait  %eax,%ecx
  2a:*	fa                   	cli		<-- trapping instruction
  2b:	f0 80 26 bf          	lock andb $0xbf,(%rsi)
  2f:	e9 c5 e1 00 00       	jmp    0xe1f9
  34:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  39:	66                   	data16
  3a:	66                   	data16
  3b:	2e                   	cs
  3c:	0f                   	.byte 0xf
  3d:	1f                   	(bad)
  3e:	84 00                	test   %al,(%rax)

Code starting with the faulting instruction
===========================================
   0:	fa                   	cli
   1:	f0 80 26 bf          	lock andb $0xbf,(%rsi)
   5:	e9 c5 e1 00 00       	jmp    0xe1cf
   a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   f:	66                   	data16
  10:	66                   	data16
  11:	2e                   	cs
  12:	0f                   	.byte 0xf
  13:	1f                   	(bad)
  14:	84 00                	test   %al,(%rax)
[    5.764999][    C0] RSP: 0000:ffffffff82e03e90 EFLAGS: 00000246
[    5.764999][    C0] RAX: 0000000000000000 RBX: ffffffff82e12940 RCX: 0000000000000000
[    5.764999][    C0] RDX: 0000000000000000 RSI: ffffffff82e12940 RDI: 0000000001655ddc
[    5.764999][    C0] RBP: 0000000000000000 R08: 0000000000000000 R09: ffff888105016728
[    5.764999][    C0] R10: 000000000000001d R11: 0000000000000011 R12: 0000000000000000
[    5.764999][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000002c7fff1000
[    5.764999][    C0]  default_idle_call (include/linux/cpuidle.h:144 kernel/sched/idle.c:123)
[    5.764999][    C0]  cpuidle_idle_call (kernel/sched/idle.c:191)
[    5.764999][    C0]  do_idle (kernel/sched/idle.c:332)
[    5.764999][    C0]  cpu_startup_entry (kernel/sched/idle.c:427)
[    5.764999][    C0]  rest_init (init/main.c:757)
[    5.764999][    C0]  start_kernel (init/main.c:1111)
[    5.764999][    C0]  x86_64_start_reservations (arch/x86/kernel/head64.c:310)
[    5.764999][    C0]  x86_64_start_kernel (??:?)
[    5.764999][    C0]  common_startup_64 (arch/x86/kernel/head_64.S:419)
[    5.764999][    C0]  </TASK>
[    5.764999][    C0] Modules linked in:
[    5.764999][    C0] CR2: 0000000000000000
[    5.764999][    C0] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251127/202511271605.bd46ddc3-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

