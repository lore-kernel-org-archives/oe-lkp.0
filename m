Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A59254B19
	for <oe-lkp@lists.linux.dev>; Fri, 14 Nov 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083956; cv=fail; b=Qur+SztIglqCsFgCUOrWSQ3MvQ3u7H9LldcjGzOCJJQxXWfWhwapBpIZAcFj3RRRAaGYVtlHCe4qQExsTxPb0qsoAuArT+PXvDQXTc/bauTyEa0e6iMGgUsPlU4aivak3b71c/9W9+Ry5cGbCjy+sLd9U/wZtxKKQmGjXZGoeAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083956; c=relaxed/simple;
	bh=3EcTsL79fsrKa5XovFVoucH3Yx/5HOXMEx36zpx1hmQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tzW2gSUNINFHwn3g5j1i7TNB2m2xwkTI54PNWiJVFqI69z+b9Umhjx4E6T4Sfqj3RwIALVDAQTUh3h3jz0Zk0IVuAcJG+Qpxz7JkSahV0Ms6Lg0deOWlkiK72nflG0/cHMW+K2OA/iVeOWfny4ANWSeZkiaXVIAtgYCumqexeh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAr14Eb7; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAr14Eb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763083954; x=1794619954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3EcTsL79fsrKa5XovFVoucH3Yx/5HOXMEx36zpx1hmQ=;
  b=aAr14Eb7G4RxDcuTgqBcDCjTWPTngdr4RO1s4uNVBn3Ze8i4HJzC6zbm
   +NGL1GbSnbjh/x43rc5E75RhVTKIUo/IjnM+Z7O4rV9nX3uXZVQTlkY86
   NaE8V46fUHNRj9HJ9n6L5qMUPINAZV1EhgEjoT8WoXPXMRFEcsjMycfzS
   vqsvHgvckV8yPH4gOKzyoRCc464PyhSTOAj9p8wTz4R3Z0oPvLTksYqDi
   ocuNZhHmGW0gpvyxXoku8t2IPtvjxoxE/BbkBLGL6YBuk+yLQJ07JQNqm
   PwCBKhVyD+VBmuXplvczl8W6Wncuuw7g6sSJBXw/NE7fY4GwWGdhg9jfn
   g==;
X-CSE-ConnectionGUID: 2VnZPNZITQ+CyX5zk0jcCA==
X-CSE-MsgGUID: 6oaWwMvIT0+QL0c2qZdJBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="67778526"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="67778526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 17:32:34 -0800
X-CSE-ConnectionGUID: rKTxB6Y7QmC3CNqYMJzNGQ==
X-CSE-MsgGUID: ukw6oBCCRp2F2NjdvIizzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189286116"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 17:32:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 17:32:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 17:32:33 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 17:32:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDnINaiiVR+RrtmXnqEuPwPEs7fcltUmWLuW0iBsgRsXGfcF/AXB9RdHLv9icQAHr64v2aD34TbUHZQEJFPs9MT7Yk2ziY69kzX6MzLVgoABQxdmpHNWGn2H0Tgi1DN1JOt3POlyHeEgl6RmpEOCEXlb96g4q4I6vvXJurBROJrevq9ERftaTC6d1xh5b0H9krT6e6X3Eaigeu/hhey40ZO0kn1rhqfeQSh2oNHj0yrk7VRU7o/b65xGmEV3K/PI/QjNeFxnfore3ToGU3w8t5YN2FMB44fo2SnHD4NC7fWZEeFY1if3tXPFkTDdiUm6OYk6VoWTAOXQYa0nu3tZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CodIhFSEX6CkTKLf+/ZKoHvoc2tiOLAFbhP84yP4m4k=;
 b=k9iFwfbqrDD4gAecuygUB6/L1ZGiaHIbiCQta5pA3Qjxue/OI31vS4jBjoaCTltL8ja7uOaKj05mMqVwXGFEm9V71j17mDFh3V0T/gsGj36sahUTC0qElbkWFiAOyYtxQLFdnF60yZZ9yeaJhYZ9f0fnayXDLDVh+e9QFlwisIddw2M0HI0rK2PFuO0sLeLw7AdvC6UAKYNg2cPEMdw2itHaaAtgLE70CMu+YF+RvtWyVP8eUTqGu94dmNVvU4/3G4BF3VVuGXoi8SFhg/pUOyrliBkDfYq9LlX3sMcAPxGXXvhkyX/JNs+0qgz5I1ilwj2fkmfwOvD0/4pYHlP6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 01:32:31 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:32:30 +0000
Date: Fri, 14 Nov 2025 09:32:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [nsproxy]  53974b87cd:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202511130911.5f5a69c0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU3P306CA0005.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::14) To SA1PR11MB8594.namprd11.prod.outlook.com
 (2603:10b6:806:3b1::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5d35fd-e8eb-49f5-0cf4-08de231dad21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A4jTaPZZxyLPIkXEBFBDKH+PYovC7EejXZdWKz2rzgU1J1jUrVWYSGW6drfm?=
 =?us-ascii?Q?DpLTJ0m89Q8M2ObW+QjHMeI6W2BMAn4IhJ40zMXzBAuHsf2w3gsP8F7gXS7y?=
 =?us-ascii?Q?4rcu78bHQZuUkPUU3OvCqOhTZJnut0dADOIyRvMQm7KqfQNRf0f8kENGbQrx?=
 =?us-ascii?Q?m6aNJiptiN/oUfSsLEMf+Z0xiUQUXLE8LlI0XmFPsFlTlE5YxC6Z3G99hXZE?=
 =?us-ascii?Q?UKSkwbnEjA150Z8OfV7sJMTEDH/Do78vrRx4C3RaHQwU/T3meuKtW6UhFyrN?=
 =?us-ascii?Q?VOUEfA3cPSyij8Qr0CfbunxILbF1IPjWxREzsWROmDY44RKvm/X8GS3KhdaZ?=
 =?us-ascii?Q?Wqxluf3WTQwr+fSpQQ61QgFF2BUipyUXx22PQ0FbGYiKAYyx3Sn/L4+h9Llq?=
 =?us-ascii?Q?p24hYUW40wadZZfcPY0oIp9rL2MF8ahgdI5qW1NJqIPq/8KDIb7MXP3LjQQG?=
 =?us-ascii?Q?Oq5kV6p6bgy3JKnMd+hZf/aqXFzNxN16v7cWMArdQJazEAlunjgk81sD0Jcx?=
 =?us-ascii?Q?RKBeGlkakqRcxfc0fJGPx3xBILtma0EWHg4q4/L3Fz0ChCkdB6rwNfKVlBRa?=
 =?us-ascii?Q?FP731PG/FbPhyT2qA9cebPxCfXRLUliHXan9GYNPhp6BkUo+vfH/pYp+9d20?=
 =?us-ascii?Q?NnPg4RThe12s+YwNRbK3XuSM7dKKPjfRsmutGeqCIDKP/SVmiBGECk66GJop?=
 =?us-ascii?Q?pSw/UOff1LkOvg7giD0LBbQgjv1y/x+Lkwcl1IB0s/wVOPQerO0ekIFLsFgt?=
 =?us-ascii?Q?A0rYAuJbfGhlJtoAAWWjYeFayDAeAWwkyJ8EoJRohcpwsophNf88yCglu0nd?=
 =?us-ascii?Q?4SLvD/UlJNjjPbIKHP04uKUiwd3AZBGPgQcPOfPT3babPsXvLJTN/cM1Gxoi?=
 =?us-ascii?Q?td3kRBsGl3b5JrOaamLn1gRbSxJAiSaeVZPYiPnN1Lq8lNCb7CWfI+8kIhbW?=
 =?us-ascii?Q?+A1DbMJOfNSYIF1bot/M7737+0KDeRdim0AcJ7G0u0v+nnEJDZEMzRi4Oex0?=
 =?us-ascii?Q?G3CzKljzJf1Idpyycra2PmgXiLVDsjNxUPzJyPsuN9Y47zTjwucdlI+gLQeX?=
 =?us-ascii?Q?poTAxFrrDwSgRW3DoFq/YrHzc8smA7HlbXiOyrucjZlgySxpFBttfpqi90oV?=
 =?us-ascii?Q?px87BGOkq2ROL3UYKwFy7M+UriSKkXcvFup7fTg6XPR2xApwsmOgieKFQnDp?=
 =?us-ascii?Q?5lNSts7n/lDw4aMYdiO7K4+A0lb33iWSMKzZenIAQhIC0MSUEsyEN5j5m/8l?=
 =?us-ascii?Q?EIj60Dmexq338/VYZEoHcdosXLu05na8w7NXn62huvp4z9MWalz2G69R3asJ?=
 =?us-ascii?Q?EzNxT9jLmEId/JdQtaYw8qcK0tBQsQXlMwiBFEnG1IVFHc4MvEwtZr1Yh3hH?=
 =?us-ascii?Q?OD34hWSajQBtjgQzpOxHZTqKaVg3j2kbqVQuf4oQmZV3rLliJLxIFTTsuGIV?=
 =?us-ascii?Q?lqiA8RAM4lyhz2UfEqJKGlIV7iPMVZN4TFClrbYlPUjB/IXCW9H7lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sXGxyX810nwMBR4DY2xnhvP4bvtlGfT+BYwLcx6LfI3O0ddltk6/S7z7saU0?=
 =?us-ascii?Q?8TCMSIIzXEitb6wpHiBRASIEHYD+Ft9m18tp3+EKTOEdmXeX19EGjW7MLGTw?=
 =?us-ascii?Q?VRK0L1eYcZ8303pRjzvcnh6m4sKA+H+OQ99FxcwFLF0cQfCaZDGTUKVL2haI?=
 =?us-ascii?Q?3QVkZLDv9o3neLV1e991ipZWavMJSKQL0+qdJNnfC3v1FvFFCHIinmLTk5QR?=
 =?us-ascii?Q?lLDRW25nfO0qZMbJAfiaaZnlyj36x3yCYgj2pmQ+ocibiXNrOl5EhSZHELac?=
 =?us-ascii?Q?lgUhDGhgUvrjyF+wGmwv+XZVGYIH5iJFIRA7b8+vL+al/kbxAtYgulmYNqJ2?=
 =?us-ascii?Q?uXSdHg1w8bDnCMgp2BDj+19pwHPEP3o/5e5mWXawK7G4BgYIAhBLhk2XYYZR?=
 =?us-ascii?Q?0r+lTA48zUCTN3+pT+DX+zW7BjSbjWw6vWaDX1PaGxPuIJ/TPCc/zgNN3TBV?=
 =?us-ascii?Q?d7/X28rG5NXXybNoBbWy3DDGs4oWRPV2OXBEkLl7UqHhVQY45hvj9OMoCuz5?=
 =?us-ascii?Q?ZWt9Bo+9JdACZiI1k+BMC6bqT7zqyf8lpEKaimkFlj2M5+b2PE0X5cLUSqa5?=
 =?us-ascii?Q?RyEE426I0nit5YQ/yaJc+tCdHZlRuq2dpLpVDCtX0bRoF5ZeGKJH7CXZ7Uz2?=
 =?us-ascii?Q?Lvne4/jZYug6hYj8OgNwUmaB7LFHknLkPTnjAKXDaPsqsAcV30RDmCcpV8om?=
 =?us-ascii?Q?xRPoyoqjlPNYuNhlY3W3FthW+cr0gcadyJeGX0Zwi1JlmiiuWgrIY4v2yle0?=
 =?us-ascii?Q?vUhrxbLOTlI6C/2BtKKPJZPRtIUV0QPd0z1QsFaTCM8YCE38ZxJFcEJemIkY?=
 =?us-ascii?Q?CV0qsIRPkqu458S+trMidczrw3ydRdbWUaGdfG0hCJmEUDQhiTdgTgH1cxWD?=
 =?us-ascii?Q?CZP3e/7Y1PsmCOSOH1YhMqOvHehNumrFPc14/uTpN2UIZJ+ozPIOEEPUlIVu?=
 =?us-ascii?Q?b3J3am0n8SpL5GPYBg9CSiy6un2kSUYExPzXZfdQEQrFzbF6XT/v285PYR7f?=
 =?us-ascii?Q?qZD31DYEzbAQ3mE6HKEw1tZgfIm3JjA2guRcH2y2eptUbrfTOwp+bWYCIFRJ?=
 =?us-ascii?Q?QTkOXraE2aMuPLSbgnqwTfFBSUnhLAMIlsD2ivyYsmZv7mDeGbaEVOtPlkH3?=
 =?us-ascii?Q?4LQrfQaxGnH3xdalBj9O+eB2M/LJy4mqS3GmmHM8xCDmSOHCRfxgfw9ZdlJy?=
 =?us-ascii?Q?nSpN44ybYV+RrdsMFWrS9SCNTt7J0CnNd09HOlyHNw/OEbJm/GgwJZ+v17Bg?=
 =?us-ascii?Q?aCmsqzdeI0HU2Dzeqto/T2NiDXGySggStJ7ty2BdIEJf7S9Fsr5cnu5B1bsm?=
 =?us-ascii?Q?JV1eKqEc2VsvPsMvwtoYKRkWhEPSryHqODvgPvR3Sn7n1iVcOI9Xm5DfQIwT?=
 =?us-ascii?Q?y88IiFG5D8JAzqgqE4SeXp0cDfRCOyzuG5wMMM6Iffea4LD96AIiIBIekH2V?=
 =?us-ascii?Q?87X4yMnuBC+D95BRhOmvNNtMqn8B4zGqOkPFiDAR7HLuBQ8/wZZHpb9ueQ9n?=
 =?us-ascii?Q?QVb4fhbE4YR4gFaAoz5r8pmDCSVJEshmIgpq3eSLut1lDGxeizLkU9+ujcjz?=
 =?us-ascii?Q?uEjRCYD9mxxKPkJAIwtLK/Xai063UCYp15Rcd6JptNgnvWbxc9e4LsTaqlx9?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5d35fd-e8eb-49f5-0cf4-08de231dad21
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:32:30.8739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOD4TlnVWrD/DPDK1BjzBBoZEVV2R7JSOUNrjoEa9sZpIrCERaaIyAMNEMUKFQtPtXV9Pp2RPbv5HwJ07QyASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 53974b87cdc40afc34928cea4c8bf8278e22c5fc ("nsproxy: fix free_nsproxy() and simplify create_new_namespaces()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master b179ce312bafcb8c68dc718e015aee79b7939ff0]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5



config: i386-randconfig-2006-20250825
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511130911.5f5a69c0-lkp@intel.com


[   87.959060][ T3741] BUG: unable to handle page fault for address: 6b6b6bdf
[   87.959840][ T3741] #PF: supervisor read access in kernel mode
[   87.960464][ T3741] #PF: error_code(0x0000) - not-present page
[   87.961071][ T3741] *pde = 00000000
[   87.961484][ T3741] Oops: Oops: 0000 [#1]
[   87.961929][ T3741] CPU: 0 UID: 65534 PID: 3741 Comm: trinity-c0 Not tainted 6.18.0-rc3-00109-g53974b87cdc4 #1 PREEMPT(full)  174112d1d4a5052193629697696b6f97a384c988
[   87.963364][ T3741] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   87.964390][ T3741] EIP: put_pid_ns (include/linux/ns_common.h:70 (discriminator 1) kernel/pid_namespace.c:187 (discriminator 1))
[   87.964892][ T3741] Code: fa ff 83 c4 10 c9 c3 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 3e 8d 74 26 00 85 c0 74 3d 55 89 e5 53 89 c3 b8 08 00 00 00 <3b> 43 74 b8 00 00 00 00 1b 43 78 73 22 8d 43 70 e8 67 fe ff ff 84
All code
========
   0:	fa                   	cli
   1:	ff 83 c4 10 c9 c3    	incl   -0x3c36ef3c(%rbx)
   7:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
   e:	00 
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  16:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  1b:	85 c0                	test   %eax,%eax
  1d:	74 3d                	je     0x5c
  1f:	55                   	push   %rbp
  20:	89 e5                	mov    %esp,%ebp
  22:	53                   	push   %rbx
  23:	89 c3                	mov    %eax,%ebx
  25:	b8 08 00 00 00       	mov    $0x8,%eax
  2a:*	3b 43 74             	cmp    0x74(%rbx),%eax		<-- trapping instruction
  2d:	b8 00 00 00 00       	mov    $0x0,%eax
  32:	1b 43 78             	sbb    0x78(%rbx),%eax
  35:	73 22                	jae    0x59
  37:	8d 43 70             	lea    0x70(%rbx),%eax
  3a:	e8 67 fe ff ff       	call   0xfffffffffffffea6
  3f:	84                   	.byte 0x84

Code starting with the faulting instruction
===========================================
   0:	3b 43 74             	cmp    0x74(%rbx),%eax
   3:	b8 00 00 00 00       	mov    $0x0,%eax
   8:	1b 43 78             	sbb    0x78(%rbx),%eax
   b:	73 22                	jae    0x2f
   d:	8d 43 70             	lea    0x70(%rbx),%eax
  10:	e8 67 fe ff ff       	call   0xfffffffffffffe7c
  15:	84                   	.byte 0x84
[   87.966724][ T3741] EAX: 00000008 EBX: 6b6b6b6b ECX: c122f503 EDX: ffffffff
[   87.967423][ T3741] ESI: c88f6478 EDI: ffffffea EBP: ca3c1be8 ESP: ca3c1be4
[   87.968130][ T3741] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010202
[   87.968908][ T3741] CR0: 80050033 CR2: 6b6b6bdf CR3: 0b261000 CR4: 000406d0
[   87.969605][ T3741] Call Trace:
[   87.969980][ T3741]  nsproxy_free (kernel/nsproxy.c:69)
[   87.970443][ T3741]  create_new_namespaces (kernel/nsproxy.c:132)
[   87.970983][ T3741]  unshare_nsproxy_namespaces (kernel/nsproxy.c:197 (discriminator 2))
[   87.971544][ T3741]  ksys_unshare (kernel/fork.c:3130)
[   87.972035][ T3741]  __ia32_sys_unshare (kernel/fork.c:3199)
[   87.972533][ T3741]  ia32_sys_call (kbuild/obj/consumer/i386-randconfig-2006-20250825/./arch/x86/include/generated/asm/syscalls_32.h:311)
[   87.973022][ T3741]  do_int80_syscall_32 (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:259)
[   87.973545][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.974033][ T3741]  ? lock_acquire (include/trace/events/lock.h:24 (discriminator 7) kernel/locking/lockdep.c:5831 (discriminator 7))
[   87.974569][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.975055][ T3741]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[   87.975544][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.976036][ T3741]  ? __lock_release+0x48/0x100
[   87.976587][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.977071][ T3741]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[   87.977559][ T3741]  ? __probestub_sys_exit (include/linux/rcupdate_trace.h:71)
[   87.978091][ T3741]  ? __lock_release+0x48/0x100
[   87.978642][ T3741]  ? __probestub_sys_exit (include/linux/rcupdate_trace.h:71)
[   87.979178][ T3741]  ? tracer_hardirqs_off (kernel/trace/trace_irqsoff.c:645 (discriminator 1))
[   87.979707][ T3741]  ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:111)
[   87.980225][ T3741]  ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4662)
[   87.980940][ T3741]  ? do_int80_syscall_32 (arch/x86/entry/syscall_32.c:263)
[   87.981477][ T3741]  ? validate_chain (kernel/locking/lockdep.c:3823 kernel/locking/lockdep.c:3876)
[   87.981975][ T3741]  ? mark_lock (kernel/locking/lockdep.c:4731 (discriminator 1))
[   87.982436][ T3741]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   87.982938][ T3741]  ? validate_chain (kernel/locking/lockdep.c:3823 kernel/locking/lockdep.c:3876)
[   87.983432][ T3741]  ? mark_lock (kernel/locking/lockdep.c:4731 (discriminator 1))
[   87.983906][ T3741]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   87.984416][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.984900][ T3741]  ? lock_acquire (include/trace/events/lock.h:24 (discriminator 7) kernel/locking/lockdep.c:5831 (discriminator 7))
[   87.985435][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.985922][ T3741]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[   87.986413][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.986894][ T3741]  ? __lock_release+0x48/0x100
[   87.987440][ T3741]  ? __might_fault (mm/memory.c:7081 (discriminator 1) mm/memory.c:7075 (discriminator 1))
[   87.987929][ T3741]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[   87.988420][ T3741]  ? __probestub_sys_exit (include/linux/rcupdate_trace.h:71)
[   87.988954][ T3741]  ? __lock_release+0x48/0x100
[   87.989499][ T3741]  ? __probestub_sys_exit (include/linux/rcupdate_trace.h:71)
[   87.990029][ T3741]  ? tracer_hardirqs_off (kernel/trace/trace_irqsoff.c:645 (discriminator 1))
[   87.990577][ T3741]  ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:111)
[   87.991098][ T3741]  ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4662)
[   87.991759][ T3741]  ? do_int80_syscall_32 (arch/x86/entry/syscall_32.c:263)
[   87.992298][ T3741]  ? __probestub_sys_exit (include/linux/rcupdate_trace.h:71)
[   87.992832][ T3741]  ? tracer_hardirqs_off (kernel/trace/trace_irqsoff.c:645 (discriminator 1))
[   87.993352][ T3741]  ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:111)
[   87.993873][ T3741]  ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4662)
[   87.994527][ T3741]  ? do_int80_syscall_32 (arch/x86/entry/syscall_32.c:263)
[   87.995065][ T3741]  ? do_int80_syscall_32 (arch/x86/entry/syscall_32.c:263)
[   87.995604][ T3741]  ? exc_page_fault (arch/x86/mm/fault.c:1536)
[   87.996125][ T3741]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[   87.996603][ T3741] EIP: 0xb7f52092
[   87.997006][ T3741] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251113/202511130911.5f5a69c0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

