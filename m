Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B916C850
	for <oe-lkp@lists.linux.dev>; Thu,  2 Jan 2025 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735802457; cv=fail; b=PCsidcThcVud1dUhNSu1EjDVVSX+9RoHu1L8UdTX0YBHrmePHaTm2DTz9++CfkwFXa9BLV3LeuwzUV9BUzryNkx8Zf7Zggh0lIm6rOKb9ju/7o9EA855mU4ASAukfFkLp8Nk4X0XRaInVSD0QzHJbEqsRhq4bXGfV1UNyBvnA5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735802457; c=relaxed/simple;
	bh=Z2DBnR80N4loLAa3vEpnFnFGNMrbKqYpOAy1OLjarT0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FRuiyAo7GGTX7McbqkdesNTJkxkLhs8mgiS33pI0GbUPko8fg4NolPYeCgKYLBxYbCkaPYeHIi8KbvdoyXpz/Vtx8x8QZBEjyAuA1FGRVUWMtedR5H9kv0uWTVmWwOknrbLOevf0gd4xw5QN5jdp2ZGXpO96R7gOxxtb/8xu4wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAQzEhy1; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAQzEhy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735802455; x=1767338455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2DBnR80N4loLAa3vEpnFnFGNMrbKqYpOAy1OLjarT0=;
  b=CAQzEhy1zBj6J1jD2UV+XjwlGaRJ47/BhHMOp9SKSHrTve1d1v0oyBX7
   Peay3Qhai/SMh1tE3aPIHtXA3UeTjIV7XCGvjet92HiwyOFN4cikdVSLv
   cdrwrjZaWvZeZ6XWj4HB7Iqrw6rv/hpx3CP/L4b/8eBFBZkOFJhS3iDKE
   z+3jTX6j5e7IRhUvRfTK6b4LKRtCmqVwluHhSfj9K6bZxqyP0k4kgreHu
   +9Gs8srG5YGj4m/d8nu89w1baO5a6cqSPCEKmDk6zTF+L9wfhpzdAb37z
   57rkmwqdVuqAtxJWUZU2jrGVbjeWcMM+cHmjE33EcSEPwxWDnxiEovLnG
   g==;
X-CSE-ConnectionGUID: 0GcWwRWQSzCNdR9XFOaLtg==
X-CSE-MsgGUID: IW/1k/DqRWu+7OCNtnOmQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46522120"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="46522120"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 23:20:55 -0800
X-CSE-ConnectionGUID: g5k+9/RIST2uTlk2TMPrTw==
X-CSE-MsgGUID: MMukkY5+TUuvCZH9P7Mzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="101521512"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Jan 2025 23:20:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 1 Jan 2025 23:20:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 1 Jan 2025 23:20:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 1 Jan 2025 23:20:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeGTDAKY/lEehdG8lOa/+cQw0+scXN0zoqgFF1RHaiun5eLJQjjWXAoR2GB7Zov93tdQgL9iCX/rvk443VRdPXmJimSyoRXmkC4AAVHUKzXnOVnV9CVHhrspJdwtFSYE/AxGYeFfqq5395civP2CSmhVZeHfa44LN4lbAGwzObEllV150mUF9Cfuvexd3U0vOKsi2P4j9SiztnkpQf2HbK5s0+hLKP3pMpc5ieCPpbvs0Xg9i2Sfx4zpdP7600j/EqMvptDW07Fd0LKUc6LwtdOYL6mhwkiMWiHQNMCfP1lUgQvs7B8UUp1zZNJ7bpKwPIfOcMNsGE/mFPKA31/tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgJj0C5gdKN+ErIpAnGUgmrkZV180ODzpkOTF/INQBM=;
 b=wxna46D+WIdU56Tc8Q9Nt2NcMCwjdpWhEHCyAqvJJvWpVslnd9XiBBzxlRKCHFoDqJAqIF/NL1Nb/p9y07z4+g600tX2oSYZpjfQjPfNiBqfYbIqvJgYeSUPjXiufILJv/xU2mn3IjJMrBugIlGKEOsYlt3qarKW/oG5DfapwesxkqWrmoFIM5JM4FH4yzQOaEUga3znBe4dA7jTdfXHhuPNVSWCAmCcKPhAMYFKQD3IpqxzwCA9kJVpI7Fyy6W/0XhrTi3kyciJfHw54F59xB5OuyQqzRCQqybTn3X5XeE4rooKeLIn21CpSgeYbfkxsrPUgVK+deesMSoLA+A0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 07:20:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 07:20:47 +0000
Date: Thu, 2 Jan 2025 15:20:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Atish Patra <Atish.Patra@wdc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Atish Patra
	<Atish.Patra@wdc.com>, <oliver.sang@intel.com>
Subject: [atishp04:perf_test_weilin_rebased] [perf pmu]  ffb9db3244:
 perf-test.perf.make.fail
Message-ID: <202501021421.2a1c589b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: e2547623-9a66-4f84-06c5-08dd2afdfa70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cEvbuYD2IGPy3lGlbmLd3xGYNdaV0rzNMcyhJ/9BAXDOQ6KZwbn6akDVsIem?=
 =?us-ascii?Q?SnOOfnYjRnFHLNoBRtcit2KNADik1HNxllIXNa9Y0Z0IAfVLH7CPjoNjtmTE?=
 =?us-ascii?Q?SBWiCX0Fmr5G8KYYXqnPpRoF9dVWgK7L/rCrv9qezlXksicXihz5yCj1E5Dg?=
 =?us-ascii?Q?vAUzI07lnkCiV6YcyUk68k9AzpR1ICz87qqo+QKohIGlisI4Haq8BjrNvPHQ?=
 =?us-ascii?Q?6G9+K1OmrrmOw601EtoqEL2KwRoWcJSD5czXCKX4wj5xKDgyOwcYV2yLH8i9?=
 =?us-ascii?Q?GDnFwdvZI2ZozuGrnklaB/0WSH1aMcO9VABb5uTdbdI0pk5mh9Umt81PpLKq?=
 =?us-ascii?Q?9FqiJFYQjO5+Oj4M8d0FJ7eeisidC3nvEEMIioANhG0u802ZVH51jNgIdjR1?=
 =?us-ascii?Q?5+vCc27Icg7ei/9UkIC27xtZT8rKGg95vjMB7/M3JpLFj4F3QihfvpNtRBpL?=
 =?us-ascii?Q?3V7nERzUSHGFwN+8vna1BuozS0BnQ/qidtvRggsjeYrEhBYthxkn6UAT9UXE?=
 =?us-ascii?Q?+ghCt+qvXGjHkMMWNqDM39t3I02tRg7w0QfnOMqqqqljV6qYn4nwRibezvFZ?=
 =?us-ascii?Q?L6oyVkXU6P+ROi2/EZaRfa8FKK9zjQUbpWDuZf1rklKYUmGq4b337vhi25XZ?=
 =?us-ascii?Q?dXJg2R56XM7jTgAcTUiGNRhdIgtVFWHw2EyHfXbHvpHLDOtB98tTl9IfpkV4?=
 =?us-ascii?Q?1OWSbh71iWdbtK6ffmHjnEsa42W74IQESbhNJvPYQv+B1PLjot9fNFl/epDl?=
 =?us-ascii?Q?P0OfDYvZs8mThR0vgvO+yU4Ne0XPNOu+1NnXAaKaGVX25CFXiMIegFPoiNpa?=
 =?us-ascii?Q?5zEBLHDlRJsD3jmnBnF9X8806Gd71cGgJk4C+15yxu5Ixt65g1Kc9WA3v//P?=
 =?us-ascii?Q?sJIxG7tbVdxYEltFXOdzBijax0ynSAcRLm3HltzCxEUotGRF+PHmiRWa54qO?=
 =?us-ascii?Q?gImoihVKEuddPpocl3jhcQYlr0NzASCEklQqDjl3E9rlHTTRzSQpKZZnEuzl?=
 =?us-ascii?Q?pfd9vdBDXUEjhV85h3LuvzFOfhZEWt601LGWcBf+Ogv29bTaAPpZtokcaDlF?=
 =?us-ascii?Q?HDAlCtt8HPk3Z+NRC7ciWJz2PpdEexNo00A431HC6wFIuP8K1Y9OYIUInaGa?=
 =?us-ascii?Q?jGdvA/HF3ear6Z6hsuyogoHKvarqQZkNLL/uwzVjNS9r3soR247AY59ihNuJ?=
 =?us-ascii?Q?GnrdpXiAkOkQ3zjaL5W/E2y3nZbu2euhZnQBEFzgVHaS0k8GEo1eht3IzwD2?=
 =?us-ascii?Q?c6W8GueL7znyeyt9RRNXi2CR+9ixfTigQdH8YYBXd0GfHJg2MvnksFFHbfcH?=
 =?us-ascii?Q?khd5Xf5qIC7Q5lOBmElA0dK5eo/cs/e2mlfUhegPzzNftQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FT2BwY+AUYbN9LUdJHJ1S4KNR/S/BZROTJ6wzK/txRDk/gG3+ZJVZrnJF9mf?=
 =?us-ascii?Q?hwuGJasZr1wBGHwlZEazJM1J+25xDLzsgD9+AYU6fBk+f2STdr6b7rWnpuV3?=
 =?us-ascii?Q?XgKw3INAFcUkUF1Oj5xzzLKol61xV1eVZZaaPjMEJDHxYfzlonnKjYzGTcUj?=
 =?us-ascii?Q?ThF8DLqPSJN06l1NKZ1BGI8/8m/Iw/+/TEAb/V7UBls8EdaAsjiWSURYtMu4?=
 =?us-ascii?Q?5VQWZ6p9AL3BaxI2dWLypMbi0urvzWIvLroS6gwCU07iCkEUO5Wg53blxYVz?=
 =?us-ascii?Q?qbBS6Hgi8eVMHQ0z08cSh/ziYDjfhKZgNqi5hhlvVxVh22T/nwW6IufuwUXj?=
 =?us-ascii?Q?pOO2RUX6gQJfmI3SVDISEVoRSBvb4fZIg0FrBXF7hXxl8yo0YHodVNgUniRa?=
 =?us-ascii?Q?/yIedvOz78vJu85tjjFYW5bFPMKCDroop3siGmfzMn+nxtSyaYfBmDgdDI2Q?=
 =?us-ascii?Q?goVXb6I/sCXwRCLpS848+dYMxVaGUqmqgIgVUD9QBLLzYqnuurnFsZ4w8ckB?=
 =?us-ascii?Q?w46rZcj6DAQ5NSL49rk1LswTL1b84Siqc1UxJ4BhXH1PRWFRGpO992417P5l?=
 =?us-ascii?Q?i3yB50U/7+glnLscr5gBHs7Vsw+QNtZgiiD8HwM6F8CxuTa4fJ9cClkHy4cR?=
 =?us-ascii?Q?8htYnVVWqLqO77ofBblbzLE+o7Ol4WLxuDAclEhWevKJ8gFMx476vjBk6Yq1?=
 =?us-ascii?Q?Ak3EMgPKFK8SEt3l9sztYRzWLpd9fBkjHLaFSOiIjm4lSRy28pP7R8Ly+RFY?=
 =?us-ascii?Q?NUgmP3rOaPD1TRLTmCB14NO0cAFde3m86ObpNGor7Z4N2c9BtMu7cjVkNH4A?=
 =?us-ascii?Q?mUI8OljNSMmV+M0N9Y8Uwi7kh/hYLMx/s53eAKzhjeCIK7OVJIed+tSqIpAW?=
 =?us-ascii?Q?i/o4RX29hXBXhrx5D4E+9+cAziP70cIKzpBMOnq+WEwfNYFuQkb/q548+3TG?=
 =?us-ascii?Q?m1LgynwJaMPaymRlm2vnxso3s3eIRpnpwz/7WRpq21x7IOIyyTa6W8+cDVqa?=
 =?us-ascii?Q?8+CmkqKY7WWDAiAMCESBDXtFNrZpPZbTZE8zSPeK3KPN/WzmtD2wJ6EvLZO0?=
 =?us-ascii?Q?BNjZzLDSM4c25y3dVoVXxAvRjXcWqXCSYRgOpzk/ecH5jeJdM2Vxz6I9useQ?=
 =?us-ascii?Q?Dn1Ah5/pnJoRg0Q4yzqBbbVLVNsJvnFRcJZiWaWr8YaKfBXJI6by8WvCcB/2?=
 =?us-ascii?Q?IiTwSR0csPgHOSaJVtcrl2qM9GKlaqX1rYKN/WRjGpTYNYtAPPBIcTSemDcW?=
 =?us-ascii?Q?W+T4pBKGw+s2sirtmIpyGMGbXoYOrGbbJQRIbqb8qvGF18Uy6ZKEvXmt5WlZ?=
 =?us-ascii?Q?3pVvxi40jM/Ld+RGbcakmPmYozK/Ct4+V0falwkoXlDvxEUCZLZdRr2tx8iD?=
 =?us-ascii?Q?/665jVG5Kwvkmyf9KsBV9mZw+oEft+QDniz0mS9kwXXPumJ9EsKBNdoWCb+f?=
 =?us-ascii?Q?X151DiuHI9ROrWImYM7u7JAhIAZyBeCi0Ovennpk2lJ75GKhdro9UHNsVsOF?=
 =?us-ascii?Q?smFa2BiodiYLCpqJsNQLZzQjR/Xj5GULAARJkUsOuuEfEEnLDxTXCQDXGLOV?=
 =?us-ascii?Q?sej5qB70ZXI5POeJgexOfU2iuTtTx5EuSIFTmyeeuBeBntEuQbpGv6+SJDm2?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2547623-9a66-4f84-06c5-08dd2afdfa70
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 07:20:47.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVbAPnuglCmHHW4N7sXypldVi2PBu1V8w9xJ8ubrOdHuFlU4+vxmrdpfAC4YFRAkE98PUnoLQuPpr25veqLU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "perf-test.perf.make.fail" on:

commit: ffb9db324425afa903061a102d1990a87e5c2aea ("perf pmu-events: Add functions in jevent.py to parse counter and event info for hardware aware grouping")
https://github.com/atishp04/linux perf_test_weilin_rebased

in testcase: perf-test
version: perf-test-x86_64-679c985-1_20241228
with following parameters:

	type: lkp
	group: group-00



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501021421.2a1c589b-lkp@intel.com

gcc march setting is sapphirerapids
valid
make PERF failed



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250102/202501021421.2a1c589b-lkp@intel.com


[  198.406822][ T2521]   File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-ffb9db324425afa903061a102d1990a87e5c2aea/tools/perf/pmu-events/jevents.py", line 1518, in <module>
[  198.406834][ T2521]
[  198.431648][ T2521]     main()
[  198.431696][ T2521]
[  198.452056][ T2521]   File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-ffb9db324425afa903061a102d1990a87e5c2aea/tools/perf/pmu-events/jevents.py", line 1499, in main
[  198.452113][ T2521]
[  198.477883][ T2521]     ftw(arch_path, [], preprocess_one_file)
[  198.477930][ T2521]
[  198.496140][ T2521]   File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-ffb9db324425afa903061a102d1990a87e5c2aea/tools/perf/pmu-events/jevents.py", line 1445, in ftw
[  198.496197][ T2521]
[  198.522094][ T2521]     ftw(item.path, parents + [item.name], action)
[  198.522141][ T2521]
[  198.541234][ T2521]   File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-ffb9db324425afa903061a102d1990a87e5c2aea/tools/perf/pmu-events/jevents.py", line 1443, in ftw
[  198.541280][ T2521]
[  198.566245][ T2521]     action(parents, item)
[  198.566291][ T2521]
[  198.776278][ T2519] kill 3554 vmstat --timestamp -n 10
[  198.776291][ T2519]
[  198.799882][ T2519] kill 3552 dmesg --follow --decode
[  198.799894][ T2519]
[  198.833849][ T2519] wait for background processes: 3560 3556 oom-killer meminfo
[  198.833862][ T2519]
[  199.181386][ T2521]   File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-ffb9db324425afa903061a102d1990a87e5c2aea/tools/perf/pmu-events/jevents.py", line 709, in preprocess_one_file
[  199.181399][ T2521]
[  199.210627][ T2521]     _bcs.add(event.build_c_string(metric=False, layout=True), metric=False)
[  199.210693][ T2521]
[  199.229525][ T2521]              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[  199.229572][ T2521]
[  199.251035][ T2521]   File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-ffb9db324425afa903061a102d1990a87e5c2aea/tools/perf/pmu-events/jevents.py", line 450, in build_c_string
[  199.251093][ T2521]
[  199.277810][ T2521]     s += x if x else '0'
[  199.277857][ T2521]
[  199.298141][ T2521] TypeError: can only concatenate str (not "int") to str
[  199.298198][ T2521]
[  199.320088][ T2521] make[3]: *** [pmu-events/Build:46: pmu-events/pmu-events.c] Error 1
[  199.320133][ T2521]
[  199.345030][ T2521] make[3]: *** Deleting file 'pmu-events/pmu-events.c'
[  199.345087][ T2521]
[  199.368873][ T2521] make[2]: *** [Makefile.perf:765: pmu-events/pmu-events-in.o] Error 2
[  199.368930][ T2521]
[  199.386107][ T2521] make[2]: *** Waiting for unfinished jobs....
[  199.386163][ T2521]
[  199.407738][ T2521] make[1]: *** [Makefile.perf:292: sub-make] Error 2
[  199.407783][ T2521]
[  199.429109][ T2521] make: *** [Makefile:76: all] Error 2


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

