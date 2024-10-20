Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED503232
	for <oe-lkp@lists.linux.dev>; Sun, 20 Oct 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729436501; cv=fail; b=gG6reorhJP5rAvfShKspyIiJKjygJL4NJbYkEj9IeiBaN8aS0cDlHcOv4pLIzvJpcGX/gqgO224LZgeoaW7dhRUDfSRPNIbPkweiWLxxKBFHVkZ6wLK+9NSpLLhkhw6A4JtRXSwsjnoXFt7UwPMLTseOYcc9apiqqpPhdi0Airo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729436501; c=relaxed/simple;
	bh=5gJ2X0sLA2O2Cfv45EjCBHNTzarLQ6ReeLhXSJStDnI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RB0bv416Z8HZIR8qH9zQujtrF8bGQQ7OGW4zAnHN83nsvHt9BqisPRgUxs2kjxTQWcBNM/YNoxDnlEwEBJb/eZ5MOwzn0o615IHZChnrrOFfwB35DX8EuMF9Yq52FmgN6PrjAFyDOaxfxQNS3V+kJbGxsGQF7HISlyCNTRUsLhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3MPd6Yj; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3MPd6Yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729436496; x=1760972496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gJ2X0sLA2O2Cfv45EjCBHNTzarLQ6ReeLhXSJStDnI=;
  b=d3MPd6YjfoDut3IoAIioNP6ospoSgz7t373dlMsnHll36CmCzY48cl+L
   vIAeihac9rVdR1Lmo4WEzH4g5u4UAyZ0fkLCdTCiyNIgf+LE1je24pA/B
   sCxPcE2IGIvyAKNQsZ7LqiI6Pa5dKFqeL+myKlZv5loU3ALoxzk5ry8BE
   zhGbAPn8WUfUdDwczB1GzHyeLtLHBc5EPVKsBi81vxW8HtJNvEJYodhxD
   ptduMoWD3A1JlciR970a2HsRrHr5afFiI01CcvyvoNobYsGHXMRmTsotT
   4yr1n7GO5dHOG0ONnVd2G+p+UtuLYBBKvsFsJEbm21q2oo6IxX6w5xAlS
   A==;
X-CSE-ConnectionGUID: GDMuEImrTem6nAWJOiZiaA==
X-CSE-MsgGUID: O5m629IbT+SuFXTC7KZlLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29134761"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="29134761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 08:01:35 -0700
X-CSE-ConnectionGUID: QxYZzvJrTde/wUpDM9DvyQ==
X-CSE-MsgGUID: emmzoG3QQPunCaIuxfloyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83919754"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2024 08:01:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 08:01:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 08:01:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 08:01:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 08:00:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IToC9fsQSiMpquJltIQ7nmiAxuyN0afGgIFMsKGmgT2owktogvR/0ZwLwrcxHv/rzqtBaHCf/rhmbnjSzCy02DyVAoG+FlpgUX9ANDwrK3opQuPcADrFVDvMeUcqmBSdlK4nlZ28u5gQT3R0HEYVj8IDCFfLoW0bSenRYzoIeHYodqJuCMEAOqTxzdwhBvO5JlRZzgtl7ICvztOOAUKahxE0gdc0zJ+DxMcSIJLdhMHmvM35/G4XH+GesLwGjLdxIy93uupejQMcHC2H/CH065w7NDjt13Bm1tZN65uMe8p2mcu8TAgZQSyVIg5HgDw4gH0jT9wxkTdQ0ShEy8OdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqEHSfVEMa+TBGoy9YsuJoSvb68yEyPXz6x/vghIehc=;
 b=P1A2oR6EkU5Rr3a2r72mHzpMYMLJK9MFsytFke1l+P5VH3hSxCWdRcP2neZiqXQgQsHe67QxJ9Z9KxKmJ4ze3+waFsrogqodtsBNy/ZTiN0D7wu1SmNvXA/kNhFdWP9RxRt0cask5FLffXLtfcz9rh0Rm2EcBnd47tqoIEYDOX2PJKseNlSXApD9wUO+t94F4eJ9x0O/t6c5G+sifNoypiTEThjARS6TmnS3t5xz39gYy+RCKMIBbpGvsG0ZpBJnat2Pv9ucTsWO5lgET735r45FP3+sJmBe5D05+UadgCp4jtJBTZoI7tF496jG7dsOZfWp2mnNw6uxqYbJquGSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Sun, 20 Oct
 2024 15:00:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 15:00:52 +0000
Date: Sun, 20 Oct 2024 23:00:44 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:execmem/x86-rox/v6] [x86/module]  af7cb411a9:
 no_CFI_hash_found_at:##cc_cc_cc_cc_cc
Message-ID: <202410202257.b7edc376-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac0dd0c-c00a-4ba7-7dcd-08dcf117fd5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CyTkjt6roW6R/IP5wDeaSdToWKSJLTFtpMcwAnab/stS9iMxLOTr69P1dDut?=
 =?us-ascii?Q?suoRb6caHinu15SjGm/yl9WA2qbTwUFR+C4mWDRbzFbbI+Oy73RIO6JgbYhT?=
 =?us-ascii?Q?zTZgLxS3k6ldReqbRSVJ+2Ao55e/v9sMrZrS12AAUVxym55jesA9N3ydCxzi?=
 =?us-ascii?Q?m6nWQHzVH3EiDhvKRePCfTzWNnesz6vcS/HAn6BkFsER3Tyxito9cSE3ZTtK?=
 =?us-ascii?Q?Q+r82d4oKLssBTYAgVJR1lMTU1+VxhyeqJYDZIDLK/ECAi4yy/Ynmmv96ftm?=
 =?us-ascii?Q?JnZNw/8EWKLnU8FiNLKXA4ReomKiEr+EYIZfos+3SrPoliFfvfMW0DqUABUN?=
 =?us-ascii?Q?D+ndP27TBSKPMrlXbyGEiJTohX+9oys8DLJju6ugoiiJJdyF6azv+A1AOKl6?=
 =?us-ascii?Q?kilrbxExIh0VAfX4D9amfFWFQqc5wfGiAdzqHA45S+m0+VvE4bbkH3JFycCa?=
 =?us-ascii?Q?cDWv4bfAUaZwfh52eXJGk8I+/HOgoI75NSe0pNoqo3yrrvkutuMuZiZViKpA?=
 =?us-ascii?Q?VWu2sJNBmcxaod8nSzcpf93vGS+iYQFHSwMArg+76KWVrUB4H60i3NEq6dFg?=
 =?us-ascii?Q?AaG/ZlDGLt10t08ODuNmcvGUtMxw7GV1Nyg5CFNsGgHpZT/lr3sxUFj4drIS?=
 =?us-ascii?Q?/si1HKR2XyLA1kijMBUOWfU2heyNOoGPQfU9nNawE+El/sc7sg6TmsftGiAw?=
 =?us-ascii?Q?OFwAePy+sRRjtS5W5+GrnTwPFT+kPEv07aBRtJ4MigmVF7ovWo+eIcQm1E5K?=
 =?us-ascii?Q?U/g4LJWd3KXrkATpK+yLuaWjuFoeq7ZSl7f7u4599HXkEWNIycep5GBqmXIo?=
 =?us-ascii?Q?UxVZhE2UG1pSP3aGUBp+Wrv3dT0RFBf8MzEetz1Y96EbMqCrxCVmdCr0niJ6?=
 =?us-ascii?Q?2rXHo7K7JC9GgsBGtx/Nx+OjQA0cBKPWnxWzo/jLgRXxlk9QDnvxdYI/o+V8?=
 =?us-ascii?Q?wRvJd435GqCTvXpUYJWoycqdIf4F2gzcFxO6RWhS/4lu6DeI/jrYfWpSRd0O?=
 =?us-ascii?Q?8Ih0Ho2niUjCi7wS5GhtFSUawT3JhCtt058sZwLvN3B2ouJ60gGB3Lhi3y5u?=
 =?us-ascii?Q?naSAFXZ5BKO5a0ixdfmgeqb7eWKY6lXFIFWIbNxrhWGc0T3y517KtBQurVla?=
 =?us-ascii?Q?yKUAJ5l17QKCIbis898fWHzJ+75LAdsaPrdbyv6L/FGLuB44gjjG6Esvr520?=
 =?us-ascii?Q?Dg6t/XGLEBqyQXkqJ/sOdHH8aLz4j+MXDL+PitFH+xv/ZwdVsgWx6SgBup8b?=
 =?us-ascii?Q?i3hZtd6CYQHtrt1N+24xxd3D5kF+ohG92cNkhkp0sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFe/n31lZWD3FS/nmRoJrUrSVWlNv06tKWTvs1h3kLOcbqJ6vCdwBB5b0ADZ?=
 =?us-ascii?Q?TGsqtiUJppMzJG27GybRoUOZfvukj3lbCllKwRi6gVU9gCqWaxGbbmOJfV8/?=
 =?us-ascii?Q?GasQEfRj1UzCw6fDrXeswLNiCrR1TWp5eJRDOVlwbm8tzNSeAZp+YZ+R+sTl?=
 =?us-ascii?Q?kIz3NkpeJ7tmAE7c9Eb89C+TytZ1DuzBYI0pJKurMDi8k2vuLnmuJlYbiKGV?=
 =?us-ascii?Q?PY9czEyl8As6AtGYxC6WVSVxAjMiv7SwaEWCyWXvihgpA5JYrzMxuLMBKDkM?=
 =?us-ascii?Q?vHPzvkKv/xW9jteXvTfdahAe69j79+ZEC6Ix5H1cmgeyxcMB09cT32PxgvTy?=
 =?us-ascii?Q?zfROBNQ/Mj704eZlr7IE+5qSikJnL+iPnGAcm1M3rl440yom6KwdAYb1n5kg?=
 =?us-ascii?Q?wmO1TT2YudegopsS3Kvf6pUHGtz0XzYXdzRPIOyzXMq81D6BPOd5xDTNs3jQ?=
 =?us-ascii?Q?+Vx1NsMnbJnZqO0Qap+Rb1VURUMhEzu3dJAUEaH1Xt8MdswhoXJ0pHGDMe0U?=
 =?us-ascii?Q?iUNy1baxCnLj0hN1TDRTz59XYfBTKUXhonKGe5GAWBwrqpmHIYQvmtTsWcBU?=
 =?us-ascii?Q?yyYvhtHxjnRNxHUJOGIq7pRWEJtrZIIbF/e7VvbmYi1B5FI16RTAQizB9UDj?=
 =?us-ascii?Q?W4zuhmaewmj9h7WUpPD2udWRyr46m0enplCo5GHblU0eQ87rCgE35wKe0tnU?=
 =?us-ascii?Q?uPtCSSjAfuDsvQatotUkZiy8XP47NGZGMpIyPun3N7jKGT7n5Stpgza0FkzO?=
 =?us-ascii?Q?Iin2YLDifiX1OwejP6sqQiBbCa1ptAazRTcKunDcAQv+UurpOrWQDRCzDLcc?=
 =?us-ascii?Q?2zPsXsXHUwviBT1TwrCUawwhDysb72rXCCEjl2C+FErXeMlLoIlVuNWqqqEk?=
 =?us-ascii?Q?qExmOGsaHoVyXd/Lceuw5IL1ysggZPJBanHnWISktCWkS1cbONcVV2DqbVKl?=
 =?us-ascii?Q?DJ8EiXjP27z8gIFZbh6bKBGWVPeePYW08RlnX/2WEL17HCWQE/6NBvH6UPQV?=
 =?us-ascii?Q?0/Nls1Pe1WSmNpiCmWEvWFWKua705esShR0+bfsfjFRJK9coJotcFvNqRBpX?=
 =?us-ascii?Q?lVoJT8hn1OWQLWNLhVULlXXpRy1V3cgCyx8QCig7xSxQ9chK3DRSCq5sF5qe?=
 =?us-ascii?Q?UrPgf9pYHa6TenliuzAhmJF4JOfuy/eq/06QaGhzKOX419u+4sUwCmYSR7BX?=
 =?us-ascii?Q?aFIoab/nO/nrLSJ/HCRUISMVU7CmktYcU+pOWin7uBpr9G0RV6GCiEPKBQyZ?=
 =?us-ascii?Q?DpmwOKOCYFiVbHHOE2QNcbrPYoaugT4HeovL1PEC94hDLfQIapJEoR2IGCvz?=
 =?us-ascii?Q?8aVVqfT3/c5sV2/w6ceSBwmi9J86Gho1jNY19SUqnH1hBeQyAQIebqE82e0s?=
 =?us-ascii?Q?XGft0Hy6H83HrymeM+eNpDfDTRiB0XCOCB8RjKClu4+gXFM2WEtgyGpiM29v?=
 =?us-ascii?Q?I+sdBxuPMF7wZV3J2U0d3YzHWJY/5P9bE8Sm305zr0HrctGosfNISm11SUCV?=
 =?us-ascii?Q?SCz4dKT/QVs2RC76/kdttkZqe+SB8o0CXArVtmfn3Q/irYLb8ryASy2zyGft?=
 =?us-ascii?Q?MspBjYk9o3TSZQtC5R2qhacZWH+VsbipO/4utpz+3kZm0cmLNkfI9d/RzocJ?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac0dd0c-c00a-4ba7-7dcd-08dcf117fd5d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 15:00:52.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgIPqDfARY+Wr24x32KTuOOQkvw1C5Ud5+RaKfJihZek0px1YKHmYfiNsKfBWnhTlVSeHIBHqF1na+bPO3971w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "no_CFI_hash_found_at:##cc_cc_cc_cc_cc" on:

commit: af7cb411a900fd78dbf3fd9428faa1c6318c0848 ("x86/module: enable ROX caches for module text on 64 bit")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git execmem/x86-rox/v6

in testcase: boot

config: x86_64-randconfig-102-20241017
compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------------+------------+------------+
|                                                            | 804ef31602 | af7cb411a9 |
+------------------------------------------------------------+------------+------------+
| boot_successes                                             | 178        | 0          |
| boot_failures                                              | 0          | 174        |
| no_CFI_hash_found_at:##cc_cc_cc_cc_cc                      | 0          | 174        |
| WARNING:at_arch/x86/kernel/alternative.c:#__apply_fineibt  | 0          | 174        |
| RIP:__apply_fineibt                                        | 0          | 174        |
| CFI_failure_at_do_init_module                              | 0          | 174        |
| WARNING:CPU:#PID:#at_do_init_module                        | 0          | 174        |
| RIP:do_init_module                                         | 0          | 174        |
| CFI_failure_at_do_one_initcall                             | 0          | 172        |
| WARNING:CPU:#PID:#at_do_one_initcall                       | 0          | 172        |
| RIP:do_one_initcall                                        | 0          | 172        |
| CFI_failure_at_ops_init                                    | 0          | 115        |
| WARNING:CPU:#PID:#at_ops_init                              | 0          | 115        |
| RIP:ops_init                                               | 0          | 114        |
| CFI_failure_at_mr_table_alloc                              | 0          | 114        |
| WARNING:CPU:#PID:#at_mr_table_alloc                        | 0          | 114        |
| RIP:mr_table_alloc                                         | 0          | 114        |
| CFI_failure_at_call_netdevice_register_net_notifiers       | 0          | 114        |
| WARNING:CPU:#PID:#at_call_netdevice_register_net_notifiers | 0          | 114        |
| RIP:call_netdevice_register_net_notifiers                  | 0          | 114        |
| CFI_failure_at__sock_create                                | 0          | 114        |
| WARNING:CPU:#PID:#at__sock_create                          | 0          | 114        |
| RIP:__sock_create                                          | 0          | 114        |
| CFI_failure_at_process_scheduled_works                     | 0          | 167        |
| WARNING:CPU:#PID:#at_process_scheduled_works               | 0          | 167        |
| RIP:process_scheduled_works                                | 0          | 167        |
| CFI_failure_at_fib_rules_lookup                            | 0          | 112        |
| WARNING:CPU:#PID:#at_fib_rules_lookup                      | 0          | 112        |
| RIP:fib_rules_lookup                                       | 0          | 112        |
| CFI_failure_at___neigh_create                              | 0          | 111        |
| WARNING:CPU:#PID:#at___neigh_create                        | 0          | 111        |
| RIP:___neigh_create                                        | 0          | 111        |
| CFI_failure_at_dst_destroy                                 | 0          | 111        |
| WARNING:CPU:#PID:#at_dst_destroy                           | 0          | 111        |
| RIP:dst_destroy                                            | 0          | 111        |
| RIP:console_flush_all                                      | 0          | 111        |
| CFI_failure_at__netif_receive_skb_list_ptype               | 0          | 109        |
| WARNING:CPU:#PID:#at__netif_receive_skb_list_ptype         | 0          | 109        |
| RIP:__netif_receive_skb_list_ptype                         | 0          | 109        |
| CFI_failure_at_rtnetlink_rcv_msg                           | 0          | 109        |
| WARNING:CPU:#PID:#at_rtnetlink_rcv_msg                     | 0          | 109        |
| RIP:rtnetlink_rcv_msg                                      | 0          | 109        |
| CFI_failure_at_tcp_setsockopt                              | 0          | 109        |
| WARNING:CPU:#PID:#at_tcp_setsockopt                        | 0          | 109        |
| RIP:tcp_setsockopt                                         | 0          | 109        |
| CFI_failure_at__sys_bind                                   | 0          | 109        |
| WARNING:CPU:#PID:#at__sys_bind                             | 0          | 109        |
| RIP:__sys_bind                                             | 0          | 109        |
| CFI_failure_at_sock_common_setsockopt                      | 0          | 109        |
| WARNING:CPU:#PID:#at_sock_common_setsockopt                | 0          | 109        |
| RIP:sock_common_setsockopt                                 | 0          | 109        |
| CFI_failure_at_release_sock                                | 0          | 109        |
| WARNING:CPU:#PID:#at_release_sock                          | 0          | 109        |
| RIP:release_sock                                           | 0          | 109        |
| CFI_failure_at_call_timer_fn                               | 0          | 108        |
| WARNING:CPU:#PID:#at_call_timer_fn                         | 0          | 108        |
| RIP:call_timer_fn                                          | 0          | 108        |
| CFI_failure_at_alloc_fs_context                            | 0          | 107        |
| WARNING:CPU:#PID:#at_alloc_fs_context                      | 0          | 107        |
| RIP:alloc_fs_context                                       | 0          | 107        |
| CFI_failure_at_vfs_get_tree                                | 0          | 106        |
| WARNING:CPU:#PID:#at_vfs_get_tree                          | 0          | 107        |
| RIP:vfs_get_tree                                           | 0          | 107        |
| CFI_failure_at_get_tree_single                             | 0          | 107        |
| WARNING:CPU:#PID:#at_get_tree_single                       | 0          | 107        |
| RIP:get_tree_single                                        | 0          | 107        |
| RIP:acpi_device_probe                                      | 0          | 130        |
| CFI_failure_at__handle_irq_event_percpu                    | 0          | 127        |
| WARNING:CPU:#PID:#at__handle_irq_event_percpu              | 0          | 127        |
| RIP:__handle_irq_event_percpu                              | 0          | 127        |
| RIP:reset_fdc[floppy]                                      | 0          | 127        |
| CFI_failure_at_disk_check_events                           | 0          | 117        |
| WARNING:CPU:#PID:#at_disk_check_events                     | 0          | 117        |
| RIP:disk_check_events                                      | 0          | 117        |
+------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410202257.b7edc376-lkp@intel.com


[   29.408320][  T194] ------------[ cut here ]------------
[   29.409384][  T194] no CFI hash found at: 0xffffffffc0600000 ffffffffc0600000 cc cc cc cc cc
LKP: ttyS0: 83:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-meta-137/boot-1-quantal-x86_64-core-20190426.cgz-x86_64-randconfig-102-20241017-af7cb411a900-20241020-637020-9rp3dl-5.yaml
[ 29.550561][ T194] WARNING: CPU: 0 PID: 194 at arch/x86/kernel/alternative.c:1204 __apply_fineibt (arch/x86/kernel/alternative.c:1203) 
[   29.552310][  T194] Modules linked in:
[   29.553106][  T194] CPU: 0 UID: 0 PID: 194 Comm: modprobe Tainted: G                T  6.12.0-rc1-00008-gaf7cb411a900 #1 07091eed115b12da5f1237383b5c8bdaea20b675
[   29.555386][  T194] Tainted: [T]=RANDSTRUCT
[   29.556207][  T194] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 29.557883][ T194] RIP: 0010:__apply_fineibt (arch/x86/kernel/alternative.c:1203) 
[ 29.558872][ T194] Code: eb b3 4d 85 ff 75 69 48 c7 c7 c0 79 e2 88 eb 5b 48 c7 c7 00 7b e2 88 48 89 de 48 89 da b9 05 00 00 00 49 89 d8 e8 a2 97 0f 00 <0f> 0b 48 c7 c7 60 e3 ef 8a eb 23 48 c7 c7 00 7b e2 88 48 89 de 48
All code
========
   0:	eb b3                	jmp    0xffffffffffffffb5
   2:	4d 85 ff             	test   %r15,%r15
   5:	75 69                	jne    0x70
   7:	48 c7 c7 c0 79 e2 88 	mov    $0xffffffff88e279c0,%rdi
   e:	eb 5b                	jmp    0x6b
  10:	48 c7 c7 00 7b e2 88 	mov    $0xffffffff88e27b00,%rdi
  17:	48 89 de             	mov    %rbx,%rsi
  1a:	48 89 da             	mov    %rbx,%rdx
  1d:	b9 05 00 00 00       	mov    $0x5,%ecx
  22:	49 89 d8             	mov    %rbx,%r8
  25:	e8 a2 97 0f 00       	call   0xf97cc
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 c7 c7 60 e3 ef 8a 	mov    $0xffffffff8aefe360,%rdi
  33:	eb 23                	jmp    0x58
  35:	48 c7 c7 00 7b e2 88 	mov    $0xffffffff88e27b00,%rdi
  3c:	48 89 de             	mov    %rbx,%rsi
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 c7 c7 60 e3 ef 8a 	mov    $0xffffffff8aefe360,%rdi
   9:	eb 23                	jmp    0x2e
   b:	48 c7 c7 00 7b e2 88 	mov    $0xffffffff88e27b00,%rdi
  12:	48 89 de             	mov    %rbx,%rsi
  15:	48                   	rex.W
[   29.561892][  T194] RSP: 0018:ffffc9000122fba8 EFLAGS: 00010286
[   29.563004][  T194] RAX: 1ffffffff15e2742 RBX: ffffffffc0600000 RCX: 0000000000000000
[   29.564415][  T194] RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffffffff8af13a10
[   29.565767][  T194] RBP: ffffc9000122fc28 R08: 0000000000000003 R09: 0000000000000004
[   29.567167][  T194] R10: dffffc0000000000 R11: fffffbfff141e020 R12: 0000000000000000
[   29.568538][  T194] R13: ffffc90000055000 R14: 0000000000000001 R15: ffffffffc0430710
[   29.569933][  T194] FS:  00007f5316f5a700(0000) GS:ffffffff8a0bb000(0000) knlGS:0000000000000000
[   29.571408][  T194] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   29.572471][  T194] CR2: 00007ffcca85f574 CR3: 000000016489c000 CR4: 00000000000406b0
[   29.573895][  T194] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   29.575273][  T194] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   29.576635][  T194] Call Trace:
[   29.577280][  T194]  <TASK>
[ 29.577870][ T194] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 29.578639][ T194] ? __warn (kernel/panic.c:242 kernel/panic.c:748) 
[ 29.579441][ T194] ? __apply_fineibt (arch/x86/kernel/alternative.c:1203) 
[ 29.580376][ T194] ? report_bug (lib/bug.c:?) 
[ 29.581173][ T194] ? __apply_fineibt (arch/x86/kernel/alternative.c:1203) 
[ 29.582094][ T194] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 29.582948][ T194] ? exc_invalid_op (arch/x86/kernel/traps.c:309) 
[ 29.583829][ T194] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 29.584737][ T194] ? __apply_fineibt (arch/x86/kernel/alternative.c:1203) 
[ 29.585599][ T194] ? __apply_fineibt (arch/x86/kernel/alternative.c:1203) 
[ 29.586540][ T194] apply_fineibt (arch/x86/kernel/alternative.c:1426) 
[ 29.587343][ T194] module_finalize (arch/x86/kernel/module.c:255) 
[ 29.588215][ T194] post_relocation (kernel/module/main.c:2504) 
[ 29.589075][ T194] load_module (kernel/module/main.c:3013) 
[ 29.589991][ T194] __se_sys_init_module (kernel/module/main.c:? kernel/module/main.c:3129) 
[ 29.590940][ T194] __x64_sys_init_module (kernel/module/main.c:3129) 
[ 29.591845][ T194] x64_sys_call (arch/x86/entry/syscall_64.c:36) 
[ 29.592712][ T194] do_syscall_64 (arch/x86/entry/common.c:? arch/x86/entry/common.c:83) 
[ 29.593514][ T194] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 29.594360][ T194] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   29.595393][  T194] RIP: 0033:0x7f5316a79bca
[ 29.596256][ T194] Code: 48 8b 0d 79 32 2c 00 31 d2 48 29 c2 64 89 11 48 83 c8 ff eb ea 90 90 90 90 90 90 90 90 90 90 90 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 32 2c 00 31 d2 48 29 c2 64
All code
========
   0:	48 8b 0d 79 32 2c 00 	mov    0x2c3279(%rip),%rcx        # 0x2c3280
   7:	31 d2                	xor    %edx,%edx
   9:	48 29 c2             	sub    %rax,%rdx
   c:	64 89 11             	mov    %edx,%fs:(%rcx)
   f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  13:	eb ea                	jmp    0xffffffffffffffff
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	49 89 ca             	mov    %rcx,%r10
  23:	b8 af 00 00 00       	mov    $0xaf,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d 46 32 2c 00 	mov    0x2c3246(%rip),%rcx        # 0x2c3280
  3a:	31 d2                	xor    %edx,%edx
  3c:	48 29 c2             	sub    %rax,%rdx
  3f:	64                   	fs

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d 46 32 2c 00 	mov    0x2c3246(%rip),%rcx        # 0x2c3256
  10:	31 d2                	xor    %edx,%edx
  12:	48 29 c2             	sub    %rax,%rdx
  15:	64                   	fs
[   29.599266][  T194] RSP: 002b:00007ffd12693d28 EFLAGS: 00000206 ORIG_RAX: 00000000000000af
[   29.600753][  T194] RAX: ffffffffffffffda RBX: 000000001dba03b0 RCX: 00007f5316a79bca
[   29.602092][  T194] RDX: 000000001dba22a0 RSI: 00000000000542f8 RDI: 00007f5316f04000
[   29.603522][  T194] RBP: 000000001dba22a0 R08: 00000000ffffffff R09: 0000000000000001
[   29.609115][  T194] R10: 00007f5316a6c100 R11: 0000000000000206 R12: 000000001dba0130
[   29.610497][  T194] R13: 000000001dba0170 R14: 000000001dba0130 R15: 000000001dba03c8
[   29.611917][  T194]  </TASK>
[   29.612539][  T194] irq event stamp: 4889
[ 29.613331][ T194] hardirqs last enabled at (4901): __console_unlock (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 kernel/printk/printk.c:344 kernel/printk/printk.c:2844) 
[ 29.614882][ T194] hardirqs last disabled at (4910): __console_unlock (kernel/printk/printk.c:342 kernel/printk/printk.c:2844) 
[ 29.616515][ T194] softirqs last enabled at (4854): handle_softirqs (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:401 kernel/softirq.c:582) 
[ 29.618046][ T194] softirqs last disabled at (4845): __irq_exit_rcu (include/linux/sched.h:2187 kernel/softirq.c:620 kernel/softirq.c:639) 
[   29.619594][  T194] ---[ end trace 0000000000000000 ]---
[   29.743515][  T107] LKP: stdout: 83:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-meta-137/boot-1-quantal-x86_64-core-20190426.cgz-x86_64-randconfig-102-20241017-af7cb411a900-20241020-637020-9rp3dl-5.yaml
[   29.743549][  T107]
[   30.040408][  T107] RESULT_ROOT=/result/boot/1/vm-snb/quantal-x86_64-core-20190426.cgz/x86_64-randconfig-102-20241017/clang-18/af7cb411a900fd78dbf3fd9428faa1c6318c0848/3
[   30.040442][  T107]
[   30.084504][  T107] job=/lkp/jobs/scheduled/vm-meta-137/boot-1-quantal-x86_64-core-20190426.cgz-x86_64-randconfig-102-20241017-af7cb411a900-20241020-637020-9rp3dl-5.yaml
[   30.084542][  T107]
[   30.436776][  T194] SMP alternatives: Something went horribly wrong trying to rewrite the CFI implementation.
[   30.545076][  T107] result_service: raw_upload, RESULT_MNT: /internal-lkp-server/result, RESULT_ROOT: /internal-lkp-server/result/boot/1/vm-snb/quantal-x86_64-core-20190426.cgz/x86_64-randconfig-102-20241017/clang-18/af7cb411a900fd78dbf3fd9428faa1c6318c0848/3, TMP_RESULT_ROOT: /tmp/lkp/result
[   30.545111][  T107]
[ 30.553610][ T194] CFI failure at do_init_module+0x304/0x730 (target: asan.module_ctor+0x0/0x20 [button]; expected type: 0x2ae7661d 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241020/202410202257.b7edc376-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

