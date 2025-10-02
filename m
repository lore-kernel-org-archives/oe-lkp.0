Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543330AAB6
	for <oe-lkp@lists.linux.dev>; Thu,  2 Oct 2025 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401210; cv=fail; b=jDH3T5AQIC8LsxLKvSis9vSLBiWszm/Az/iYesQHThM8fc7VE7eyyxjqhX95MkKSPZEEUlpqhaB8NQdLy4ieasNJGS3czhC6aklu29vUjJ2+esPLotCNyu6DV0iYDTGgObT20N9XzauPIKqOTvpFF1jIrOy4wMXNICX2vo7F9oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401210; c=relaxed/simple;
	bh=E9h6obQ8YlyQTOtLyDW38v2U24sUvoOc8dYMIkuLrN8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dWGu0/0jcYRkNT2NYfnZrqbNAhnnSFK5+iur+T/6WdLM7xL7Wm8jNeZUOle5NeUpI8yokDEelNSakB0UN8aFGfGBUO3qchYCpQcHFUc1J6nStEi5DLAMQTf/mz5oF9V4rhRgr0MaLoNK5iV5gxcdyKnjLQTnFtffOdS7EA9lJvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLaD8xtT; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLaD8xtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759401209; x=1790937209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9h6obQ8YlyQTOtLyDW38v2U24sUvoOc8dYMIkuLrN8=;
  b=nLaD8xtT+C7q468FcERAhlfx9mLNUvBD7Remrcpyn1eGbwvd+O+xYwTL
   h60u3VVGuD/Br49s1dejztR0xmTB58m5gZ+DWSgsJEmrpDDq2wijfgjEy
   nrn6lraW9r8jBxBlxuH3LiLhdlv/GYUXh20PY0W5OuxDrtbSUThklDeQ6
   9isYk/Q1vdp4f1kbCQ9QQQsRKy9K5ox01p8LTlLirCGBoa4Qfdf58RKqh
   PjV6DSls1lbHqWnJ8eI+pke7IRXvcbqvXcBQA7QuPtJI+ZjIlfoDCGWIj
   nlxkpR9znD+tQTNk0beDFwqCAFZ3UoXtbflCZaYRRV/yl1pDAU0iZ8Bmw
   w==;
X-CSE-ConnectionGUID: zouVLMNlT4u53OefsODQQA==
X-CSE-MsgGUID: 7Ra97HVpQwieloNsTc6aUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61728736"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="61728736"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:33:28 -0700
X-CSE-ConnectionGUID: FhJe8GsjSpeMNq/jlSra4Q==
X-CSE-MsgGUID: fslPokBZT0amQmgL6t8IbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="216128577"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:33:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 03:33:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 03:33:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 03:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NABuj9Ad1GzgVXhqXJkh0JYX+sSl0Ya1d9TDfhVNMbjPhyDjZk2bTRcqrX46tdjZr5gzyMRghmRlufJHEHydD8sqecBszt8Q/+rySZTdjs3wOFM9MyVkjUFjGK/hhJVpsRM/hIAPlLJSlOjE1gBw3PE14x6XHJocEK+9l/Fbjlowcw/zydW7NyfQfu3XBgmvJjH6Ex3zIn1Tvyd0AgXAcN3MDO/dnjws7u2dLuGsvkt+2Xmai+nUkTb3q/049AeUscDkOJAGKzBiJHcEKs+L+fWqmjGvZsTBaO1WHActCDFXEKQzJoXZSB9hSs5qwNNIwsWfFCcbdQSxfy1a59YgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBHU1fuNFjdQPbvG7pHOLqPows11XvzGgiDdv67XXCw=;
 b=vH5aSrzvwKsssTD4fHDU0Fvfw4kni9vGDfPPAt4xuGNEZ8x7AaHa8cvN0led2Ek6zIYRy3yUqWk3e63aix/tWYzkjysCnnvoQbTYG/14HUcq0Nz1s3nN/oRPkZCOlSdCwEo2lvc0Cv0vMbl5PRhEMBwsAbgNX/J9M7N/0Mofu10dHzclxXeH/sUITU3NAX1BQ5PkLnYxhFy2gjcGPUAf7uAW5Wk90VXKJHKOPKs8VCqS8n7IQq1QGUiSEsoOjhSkfOQ1PjJ3ib3jBbv7rBPywuizc/GNiBMs1k4RUaTDAAyg6nbfBeJ8l3iDL8S99DLsZYH5aG/APvTg6BgklWh+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 10:33:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 10:33:21 +0000
Date: Thu, 2 Oct 2025 18:33:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jirislaby:devel] 414f4c2d16:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202510021626.2a9225b5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: a3aaec5e-1903-496c-8220-08de019f1c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M/hIVMzgZdyp81GV3cT1gdg5JXlFyGU047hAMBiEYBgT/CvLOzOB5gaIBTM3?=
 =?us-ascii?Q?Rv7tMMvY3BnywetQ4agSBXudvk+Hv+2UB+u6bBbXuegb2A4U0ndx5gL4LWNn?=
 =?us-ascii?Q?97ipULamDe9nT8XZuHmbM3LOGRzBDpCs+1QPR0mR9EpIaVtnEBMI7jiti9wQ?=
 =?us-ascii?Q?X15GeHywhDX2WyWJTBJfERkSBH6xGOSdsC6wEMPW64cSvt03WejuYLsYkJJH?=
 =?us-ascii?Q?emEfAwmnB+U64Odn/lC4GYBPyp6ReGoB4JnyBnAStkLoKEM6nThbMnV/ZYd5?=
 =?us-ascii?Q?SeGOO2NSZVBBLNcPWSl9f4k5lpti/V3swGLkBAzEmzc7rSkm7HdGRusfdV/o?=
 =?us-ascii?Q?8t9eHNJHp0oviPFctpzAH2JF3dm4M3esM8jfOTSXvEl4EN95edK4BWfD/nTN?=
 =?us-ascii?Q?Uc9mJANYp+xHgTcKlh9b6tcq7BfNyrpJyRywjBQKtE2Oi7GW3rtv09ZPvomE?=
 =?us-ascii?Q?2uOoA33/oiS1bQy+i3QIdFaF1l4vpPyyJFqpPSlQH3PFldKZhauzT1HJH56n?=
 =?us-ascii?Q?XZ3aOQF34SsDwtacySTJPTK/R6/pkvjHMMY6TS9R2VP2l4tPTAVAchJI3wTn?=
 =?us-ascii?Q?e1bWeCkElBGg9iWk5KHGUPugo1osCoR0a+wSBm5RIv9uG+jGZrNnQQmX01fg?=
 =?us-ascii?Q?7FRl4eOgqcfKX5qrJ98SgQ3VH74k+CMeLWWRqHtDUJMuF3za106R/kqd6beH?=
 =?us-ascii?Q?4dyvUfZRwUYANvUXb5wIOoe4BKPD3AD6XlBeViz0Md05GJ/UKHABA7GasBu1?=
 =?us-ascii?Q?Wy+dP32ITK13mS/PHWfBV7A3Fb0PMq0niM5uo5xEmYx+lGah62cZ+R1YlUI9?=
 =?us-ascii?Q?85AjAikA7yUFcEwiu+7T+cLwMU+RGHmWNykeL8wFa/neFa1V0/LqTCkZUrAj?=
 =?us-ascii?Q?kmrc+AXhpjSjGzi0zWA76oB6jOuus2Ru4vK3nfJo36cyX9uMvKlkPOHhRPVW?=
 =?us-ascii?Q?TCAQ6M5cqdEDCLPKDhySSavGP1w5K70/2my8Ao3bm8unzC0yD3f9e0VJ+gdr?=
 =?us-ascii?Q?8o7MtPa8/B6+JpczoListszJcNIlJCS7m5VJVKvqXZ9uhs3xgMAnxODWBm12?=
 =?us-ascii?Q?hF9N7geVfeX3Z4oBM2MIlrg2/bxiuKowy5tsWLPL1GFUhX0nzHts9veoyWVT?=
 =?us-ascii?Q?EFErVLCspyDq7Rt6uRsR97W6YsP09K4IvEE9T4JqZP+BeqOY9LBxpITV5NuD?=
 =?us-ascii?Q?7FqswHQ/s5ED3A4M8uwiXwuyWg8qQex/Sbc//7V8KVdGIysZLLKM4Bhck401?=
 =?us-ascii?Q?UPnEYMNywpRBI7Dnq4BQB+ZcHAPLqSYpNx/wQyPOnQB3Z4DnPdqIAtVQFJjc?=
 =?us-ascii?Q?SI4bgnJdSRXfRgryIy9gKFxx+g1U7LLmruxeZlM9nER6o1fTAA/K+wp+d9Ss?=
 =?us-ascii?Q?CTxfrjx9UEo1mjFZy53QZN9umiKbNtt0oYtLGWb7TLK2cZ1WlQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DtfJrfnQWUYx7UEeIMcS7458kP9HTed2SqzZthkh3SzISTzN2b0t9sagbuzA?=
 =?us-ascii?Q?qlONV7pabn60MQwQYaY5UHByPEnoykoEYohHPB5vkzvg640cvMSUy5JQjH4m?=
 =?us-ascii?Q?OGGD6JkVvWnP0fD4+hyB56WcpzaLxYjHICUD/Ng8eTLc3/e6/ZRp6GjVpE4C?=
 =?us-ascii?Q?MlldZWmCjmV+6CNeYhaRBgdRwryt0dEAtqMdDErIvut6xs0q4wOW8X5fpcEW?=
 =?us-ascii?Q?9w9LU5EykuG8ySQXj67yaBFcPpMhquL5ZUIMNXoKLE+IWg1xXMUFHS+FFWH4?=
 =?us-ascii?Q?FUIRMgbYux6rz/Q4yTRwrOj0pcchvcsP5blmCPU4su261SJGjsyd4eoWTP1v?=
 =?us-ascii?Q?xdOamHFdtXsUInyQdlm+TpDTiw/4T/49vPagst0fKdJckl1aYHLilvcTcNwE?=
 =?us-ascii?Q?8MSOJAm7vBkimW0RRi+2HyigRrN0LR1gmVaSt81U8TBxve5xlQj7zZoHquia?=
 =?us-ascii?Q?EgbedPP7tr8gm6Y0Y/cOKIuw1SsQTvVHFufsxPCgMnqIEFTjifaOiWiYn5Ns?=
 =?us-ascii?Q?LWwEVurmuFX9O5f9XzsOMhSD263QNkitmW39HpjTqYCKbqhfzpNhSQRgYW3r?=
 =?us-ascii?Q?l83m0PXe7WNSWQWg+vIKV33DduAtebVMu+Hfly2F/XLWRKLP5XFaPiuqNsSx?=
 =?us-ascii?Q?fL37al/Ij1HW9aSAtLQaVYAHjNxYTlbcH5p0PkYK9i5ZXCIQuvJSukjNZ6aS?=
 =?us-ascii?Q?kFXUp8kvJPAfElDMfqKaMKVwXMmhprjW6VvysYs/qCU77q3Aaj4IY55YfEHh?=
 =?us-ascii?Q?9wF4DWVZ/FobQlm27esVrlESS5hTzngHfH9dtvJVGWBjk+zedJclI+KHLS1M?=
 =?us-ascii?Q?FU8tcoW4LZHyvITzlVB2AxM9teAZNmQp0sK9zZSrfw/hsRgQdOSwFHjRUS8K?=
 =?us-ascii?Q?Nhdn8BD791Bl+yrVRk/EXPid4SDkQ2t+WqMV/iHaiUORtrZQ98nK3HpjS9hS?=
 =?us-ascii?Q?WJ+1V1edf9kU/Bv/E+iRP1YwEyIIqboW/34v0/wtpN/1tBpBVXRunZec8HIW?=
 =?us-ascii?Q?rBdmGgPpZFPoldmQq7x1Iq5b1YQWxGswGfqse9X2hHvvSDboyaHrZKs8LIF7?=
 =?us-ascii?Q?qnIdcRmHwaN2h5Ues+g8cbuhebe+h6jKQwPWmyDCiimiCFyVL0o9n2hATwKX?=
 =?us-ascii?Q?0wbnvUFahRBDmDnP/eTtgy0jPvrOw3rmJDx3JgxR5NlprocqDcFL20FQ/qEO?=
 =?us-ascii?Q?ZGt8n2oqnS2/nbVk5457ymKfoq9CIYmHkaqt9AfCoJXru3sQW/DKls36mZIq?=
 =?us-ascii?Q?Xxin/ffr7uEI+NMxvQdSkmMXH0aZem8LtICd/K0IalyPEJY/sOisdOJ93ufN?=
 =?us-ascii?Q?ikTHGOXf0G8JUDoc8tj3mx2zEj5PTVLc2v6Bc9FIu4CFjykvoV/0GhQf+bRE?=
 =?us-ascii?Q?NnR9Qsi8LdcwiMeI5EH+b4Q+vYdMoAN0UgL4D3d3qhYXhVlnzQVgbTbqlsgo?=
 =?us-ascii?Q?11l7J68MrwC0ZbUlgyK4WOGNBQMFmvSPl080spE5N5YPwYftH0vuZPxQVhBv?=
 =?us-ascii?Q?J3XNkDTlmsh1vOhkXw/QATa366UrE7rCfx0C+mm2QIH0Zaqy6Phci/Z/Qqz3?=
 =?us-ascii?Q?Sk01IunJEsx9LzCxNWuc/mJweuV5lUY647zoROlII/hcTLztmgOjyQagANzD?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3aaec5e-1903-496c-8220-08de019f1c13
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 10:33:21.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zDwTHKV6GXxBcOmEA7cGiAdAZca0VVG/PMiFQhnL5lW2Nd8gCeSjcphRJIy4Yi00GT4xvG9aLYXUxKAvFTjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 414f4c2d16ec3a38fd270d62785e3f880970d8c6 ("ops2")
https://git.kernel.org/cgit/linux/kernel/git/jirislaby/linux.git devel

in testcase: stress-ng
version: stress-ng-x86_64-480b81369-1_20250919
with following parameters:

	nr_threads: 100%
	testtime: 60s
	test: cache
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 104 threads 2 sockets (Skylake) with 192G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510021626.2a9225b5-lkp@intel.com


[    1.956306][    T0] BUG: kernel NULL pointer dereference, address: 0000000000000068
[    1.963681][    T0] #PF: supervisor write access in kernel mode
[    1.969559][    T0] #PF: error_code(0x0002) - not-present page
[    1.975352][    T0] PGD 0 P4D 0
[    1.978551][    T0] Oops: Oops: 0002 [#1] SMP PTI
[    1.983221][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.17.0-rc7-next-20250926-00046-g414f4c2d16ec #1 VOLUNTARY
[    1.994634][    T0] Hardware name: Intel Corporation S2600BT/S2600BT, BIOS SE5C620.86B.1D.01.0147.121320181755 12/13/2018
[ 2.005528][ T0] RIP: 0010:serial8250_init_port (drivers/tty/serial/8250/8250_port.c:3153) 
[ 2.011148][ T0] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 18 c7 07 00 00 00 00 c7 47 20 00 00 00 00 <48> c7 40 68 00 00 00 00 48 c7 87 b0 00 00 00 60 32 54 82 c6 87 f1
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	f3 0f 1e fa          	endbr64
  14:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  19:	48 8b 47 18          	mov    0x18(%rdi),%rax
  1d:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
  23:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%rdi)
  2a:*	48 c7 40 68 00 00 00 	movq   $0x0,0x68(%rax)		<-- trapping instruction
  31:	00 
  32:	48 c7 87 b0 00 00 00 	movq   $0xffffffff82543260,0xb0(%rdi)
  39:	60 32 54 82 
  3d:	c6                   	.byte 0xc6
  3e:	87 f1                	xchg   %esi,%ecx

Code starting with the faulting instruction
===========================================
   0:	48 c7 40 68 00 00 00 	movq   $0x0,0x68(%rax)
   7:	00 
   8:	48 c7 87 b0 00 00 00 	movq   $0xffffffff82543260,0xb0(%rdi)
   f:	60 32 54 82 
  13:	c6                   	.byte 0xc6
  14:	87 f1                	xchg   %esi,%ecx
[    2.030518][    T0] RSP: 0000:ffffffff82e03e88 EFLAGS: 00010006
[    2.036394][    T0] RAX: 0000000000000000 RBX: ffffffff840fb1e0 RCX: 0000000000000003
[    2.044176][    T0] RDX: 0000000000000001 RSI: ffffffff82e03eb0 RDI: ffffffff840fb1e0
[    2.051958][    T0] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff82e03d30
[    2.059740][    T0] R10: ffffffff83122d08 R11: 0000000000000003 R12: 0000000000000000
[    2.067522][    T0] R13: ffffffff82e03eb0 R14: 0000000000000000 R15: 000000303fff9000
[    2.075304][    T0] FS:  0000000000000000(0000) GS:ffff88985c5d1000(0000) knlGS:0000000000000000
[    2.084036][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.090433][    T0] CR2: 0000000000000068 CR3: 000000303de24001 CR4: 00000000000200b0
[    2.098217][    T0] Call Trace:
[    2.101328][    T0]  <TASK>
[ 2.104095][ T0] serial8250_setup_port (drivers/tty/serial/8250/8250_core.c:351) 
[ 2.109025][ T0] ? __pfx_univ8250_console_init (drivers/tty/serial/8250/8250_core.c:506) 
[ 2.114644][ T0] serial8250_isa_init_ports (drivers/tty/serial/8250/8250_platform.c:73 (discriminator 3) drivers/tty/serial/8250/8250_platform.c:105 (discriminator 3)) 
[ 2.120004][ T0] ? __pfx_univ8250_console_init (drivers/tty/serial/8250/8250_core.c:506) 
[ 2.125624][ T0] univ8250_console_init (drivers/tty/serial/8250/8250_core.c:511) 
[ 2.130553][ T0] console_init (kernel/printk/printk.c:4298) 
[ 2.134704][ T0] start_kernel (init/main.c:1049) 
[ 2.139026][ T0] x86_64_start_reservations (arch/x86/kernel/head64.c:310) 
[ 2.144300][ T0] x86_64_start_kernel (??:?) 
[ 2.149054][ T0] common_startup_64 (arch/x86/kernel/head_64.S:419) 
[    2.153812][    T0]  </TASK>
[    2.156664][    T0] Modules linked in:
[    2.160381][    T0] CR2: 0000000000000068
[    2.164361][    T0] ---[ end trace 0000000000000000 ]---
[ 2.169634][ T0] RIP: 0010:serial8250_init_port (drivers/tty/serial/8250/8250_port.c:3153) 
[ 2.175254][ T0] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 18 c7 07 00 00 00 00 c7 47 20 00 00 00 00 <48> c7 40 68 00 00 00 00 48 c7 87 b0 00 00 00 60 32 54 82 c6 87 f1
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	f3 0f 1e fa          	endbr64
  14:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  19:	48 8b 47 18          	mov    0x18(%rdi),%rax
  1d:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
  23:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%rdi)
  2a:*	48 c7 40 68 00 00 00 	movq   $0x0,0x68(%rax)		<-- trapping instruction
  31:	00 
  32:	48 c7 87 b0 00 00 00 	movq   $0xffffffff82543260,0xb0(%rdi)
  39:	60 32 54 82 
  3d:	c6                   	.byte 0xc6
  3e:	87 f1                	xchg   %esi,%ecx

Code starting with the faulting instruction
===========================================
   0:	48 c7 40 68 00 00 00 	movq   $0x0,0x68(%rax)
   7:	00 
   8:	48 c7 87 b0 00 00 00 	movq   $0xffffffff82543260,0xb0(%rdi)
   f:	60 32 54 82 
  13:	c6                   	.byte 0xc6
  14:	87 f1                	xchg   %esi,%ecx


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251002/202510021626.2a9225b5-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

