Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6C1B87C9
	for <oe-lkp@lists.linux.dev>; Thu, 11 Jun 2026 01:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142333; cv=fail; b=jGpVWMdQ4dzyBCw5e0LlggeXJMISCdWeelJ0+Qf+m3tuth7SxPnEK6bOyCqYGelj2kvq0Z2IeF7zKYmmcqRIpV9Ijf/ymWeszMa2UkbeNLG0aiKan9MN+IkdELzdnHjuLTDFX7p5Es6htyLAseUW2lgQ/CAEgRFks9SQgfIpP2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142333; c=relaxed/simple;
	bh=4v99CUU3mhgzYqftcn//SBT1b9cxVwnPtRka3zbOzsw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Y1RPz0BoX/MeQYMB3OPMSsQgCw/Womu3HXQyDiX+KqdMPZx8LT/CSkTRT0btld/Dj6fDIKiuUvv1UpnWTsicHd+qaRsLtj8wsLPWIZUUDz5e7MbJ6sO9/r5zdYnNUa1Q2uCsp/NV2GFPPpJO2HU1v7vkPd/aHOu+MgvBHheGoZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSebCKVd; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSebCKVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781142333; x=1812678333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4v99CUU3mhgzYqftcn//SBT1b9cxVwnPtRka3zbOzsw=;
  b=SSebCKVdl3Cokvm1ev2BTL7DAvSn4w1cpDNbYTocu5JM4d0xqfXOtR8o
   +BBCAvBKsgYWMF5S1wmtEfxqN/2sIvXhUD7KS/WTAAAZ+/a63Zh7iESg9
   lPqWpt6sEa6Ph9dxcL5IvMsVyOQTzXXjsbd/iExW8iCf+pAoQxrJ3vnju
   HjR6j5cypMQm3x/mFDmP404IYpOJ6++TLscG42LocHamqNvftWBefthEy
   m/MglsdUIo0w9RqWa6QCxQFwNY8gUF4cAzQeBu6o7XD8qEeBMmKZRJ8pv
   ZgDhytQkIwb0XNp9MxCO+Bp9rvEBrKdeOXVZakjptEX7Kc2TUbeYDSflB
   g==;
X-CSE-ConnectionGUID: //obC7h/SXSBB9ndyVSkMg==
X-CSE-MsgGUID: 9xY6Ns2gTMKu54lkkY3FxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85791062"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85791062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:45:32 -0700
X-CSE-ConnectionGUID: PYLBInz5RXCtFUoTRaAHcA==
X-CSE-MsgGUID: 8CQ0fZELSwW9YvnhYSSO4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="246409253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:45:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 18:45:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 18:45:30 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 18:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvTfGqptm/uiL6jmWgN5Ot/GaWas9qopn8x6TUBLJhO+Juy6QDRO3YgJBYFBLo/Zc31mGS35PAd8RL40EKm7Z4jbJQ/0zlX/nA+e9uvvcqjXY6e5hhPxsyG/u1J72z3lfwuZ/RN1g+1T7fec+w1lLOD8mYCqpVVg0aZ2Ajgwbf8OXz5UGnjXsjKDnygiPio49UnJopBolVb4++dTi6vAqSITQzii7MAslyYpQzQpJDHB7Xep62/LYD3BWgRhc1e/Zdx8viMOD1XLbvTaj+63cv2MPqvStHHhyDoH2Mjin19WT6ZL8glwQvmHKg32nFPUJjaO2bqIxaMPzKeE36dxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUd65v+CeIR8dKCFXhaByRLQ6pcZVfaIDJk494DfmKc=;
 b=QYx+edWWkeuQUW6W8PNF5hu708uT1NNcIjbqZRG0U5L54Y3man+1rGM9a1K4hJifOiKTbXS9vZCIsAz7HrBfef7DZC1wFdWVOqwl64pvpQ1cpS4A9C2UgQOFxQgpMX/tS1UyqQKmPgZJNAQLw8gttO76eSalVHAfF9IzBsvI+Tp1+blTMkah6+Ll+3JKFStvof6cnyD0dXhl0d8g5tdqk8wlkV/5NwEc5t5UPOBazxVAcE9EkpGs46W80PFsatPmQ0WtF9FdnEcULgEEfYMZSwkD+XCQ9sh2HCDHfK+QD1UgJGjcfu4nXw7c0PwVJPPgafZcJ0nbq9PVsX6cLxoq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 01:45:24 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 01:45:24 +0000
Date: Thu, 11 Jun 2026 09:45:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/restricted-pointers-final] [lib/vsprintf]
 f13aa632a5: WARNING:SOFTIRQ-safe->SOFTIRQ-unsafe_lock_order_detected
Message-ID: <202606110945.d3871219-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: aecb5d93-c3b0-48cd-ea4a-08dec75b1b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: H9RO6hDqCagQc4RCAnEsRXm/0+gdItcq9rI/M+MFc3vNBsQR+AwtrQgAhSnTeq1uQ6UG4uNsH02wj3x/rHsw5kXv7o9m4xAzlzI6j8dD6bbgvrBKKQx/sNd8GKkBx56DYp4N9Qq4tvA5uNHtWKaE/BQWx9wTyOvAoLKzG4arpj0m6Kht54W/y5/3p+9y7bzNHs9GWyHHF8zFgw9rhCWzuOSR6SuTvTXaFiDfv7uFTJMNLxVedJA5vG8/d5BQHqt+O64sSHNgarGF7h/HAiYytL32W3Pj8bfd/s5pCmfj2BtnepihVtVsyRmapgfeVgJKJIPsGUZMw+4PHPy78C/HzrEhth7Byn9J6fv4kUhBSISTe2jyQro4C0zRvg9B0txBsWzbtk8OlCHaNCu1Svf8uR5D5u+gGB4B+Nop9sWQx4f7USE1cKIxHkzv5EFJ+i/nGzs0mG2rtk3SZLSZI5HzD1cGIHZy/kNdKcSQbVhu//zURxjnOi1XdTDzNrrmZvlp1dwj2TY+AwiCWefl5nd3QcpvivRfjVV8YbF/t+Rlzc14MGT4GoGaJhl0RLyjx1FWSUZkfJk8l1eHzi1wgdlSgb7eBp2kiPCS/whv+Ok6IfbA8TD6/y1Gm/oLY1zg7G2eJe4xQVD9CD1xFSGoqGcNsX/jmPVqqLW2u2W3qeX3SAkslQ6hCQXBL/HiyFY/viWnd2kjnO3OXiXKCcEljSDprA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?et2udgW8Q43IJ8VOVj4BmJ57tmX8NH2nVqIVi25fMY2YyMoKsGuSeeHXjDZr?=
 =?us-ascii?Q?NhEHbQwSqlevpA1niMvyoyrQXSLvnDF+6bDXiPPW/hhFVc4u+52WFJ6ODUX3?=
 =?us-ascii?Q?JascLWrIU0nTE3X6i2Ygh2AHoXjyNmo1pOacn7XR5neXfJU6libwrtgnbtzw?=
 =?us-ascii?Q?2ykKq6Ga7u5F1Qm8tYnBUVkx2KBx6gILlmP036H+YLj4uhXbeJRCmUhoxrft?=
 =?us-ascii?Q?RUVinlwqL+2me92pl2QTZLymOJwEv53VCb1ZUWeb57YCYrXg+AJ5h1wetKUy?=
 =?us-ascii?Q?xaN00XO8pzOkJqFdPAx/ewuspeRq6q95YE1N/AxxkPkHceeoQ7dGoz9XLQlV?=
 =?us-ascii?Q?RMOCh5TCMCSGeSO8a05cBBvYCZQOtQgdfH3N33pOHwWyOIqHekRtT+qFQ/sy?=
 =?us-ascii?Q?ilEt5LAbj1Nj+vmD0trDorf2W18Tg+ujUEk3Tmp3czxt4Iq/1e6qTVQ4OTRa?=
 =?us-ascii?Q?C5qCKdAEIyEacuDTsZ8raoZxwlseDrZZnN1FyFUVPIcKHjSvytsz0nRjcJFs?=
 =?us-ascii?Q?IZ4pedoZ4c9DWaoFfp5WQccl6UXOnd6HrjHTGj8mLZUyhEiu0S5OUQE8gwSX?=
 =?us-ascii?Q?QFa6mDdG/6D608Udeygy5yuyqoZ98xY1+n2bWH2qCGjXD2SeFJnXX0a65XTg?=
 =?us-ascii?Q?0v8JntwgzmxqTmAYnUPVgW8+dU5wwTdaFwCj9YCX1gW2J4TGcT9r7CAFqkoy?=
 =?us-ascii?Q?838aqeUxbqIslgVPD5Q1K2z+eEJJ+d6xmOJBzIQ/0BCQu62PtMv/5jk1DkLu?=
 =?us-ascii?Q?ysJoeBbsPXaYTMt5HwlVFsVRxYQOhP1xtxqPs8eJeQaTcsTkIjpi6T+m5uw8?=
 =?us-ascii?Q?Ke/j7yU498POFZAurm46KmsvDkYyfrXqE54NvBbASHUstDDPKXqMMNmYOVQX?=
 =?us-ascii?Q?8ljPBRq1bZ8M3I36SqEJl7uT+0gyXEeJ59beW5oS9K6y5qU7tz29RXtyT1UE?=
 =?us-ascii?Q?npFMKQXyDllm4/IF7O5cqHVj7H7yzwDBLjZ58CaAenFPokkQXZFI4YzKYNGD?=
 =?us-ascii?Q?mNzDXoDBXUyEIhulLyvsYOGlF1CWvSFBDfLHB60twLyA/a+37G1Wfp1IX/Mt?=
 =?us-ascii?Q?6oxFY3rbE5kOXv2UAIP/yHGygnRFoIhoHSu2xJkN2YruVdurkRjBT24AutWR?=
 =?us-ascii?Q?37j0XQ+orX+I6IHzQvp02QDZXtT4rQq71R1C+WNBrpnamwrEGrBIdDEC6oWS?=
 =?us-ascii?Q?YzKU0/FahdgoJFdzP2AQ6tqFqVuFKsRAK4pF1jUG/KPN9kv2bqUdqmJYf3aA?=
 =?us-ascii?Q?X6qZIaP/o0aYc7nKDX8fXv3Vo6WAf1gz+1VUXEuyNy9A401h/+jOgOXHgxIA?=
 =?us-ascii?Q?JMZzcDWQkFEureFawZEVq8wQ+Ri8wNe/VrImY5Qh4lmsMJ4w3fGM1MtEHwSY?=
 =?us-ascii?Q?rX1sVhcQypbPgVHsOlWZ6jg1WY4zyfyFifhM2mthGQGwJh6BULpj1ncSeudi?=
 =?us-ascii?Q?uO8sAqFjlpo4FMedOv7ke01l2ejZOJ65u3i62xC8h2L9o+BETG7d2+w7T2Xr?=
 =?us-ascii?Q?2yQxW/GQsu22Ve9nGPTOhwJx9HN+zCUmo7t+f+cmEuaUjpgiKuXwU9qyG/UP?=
 =?us-ascii?Q?LuAx/wJY8tNuX6m+aT60DCs/uLAbmf5dNYsBi6JFKQAA8U69ctpiU19ThrUV?=
 =?us-ascii?Q?sMxo/bWjYcKP9wEWCgx041PcMh/3SfH0ni0piijroFs1ury+KZT4EYfYuCF6?=
 =?us-ascii?Q?tkQb52IhMlbqf2TpcnLI8ZjNVNOYT2Vvqraw6itRl34vqNgW4Ih6fYDFXHTv?=
 =?us-ascii?Q?5R9SEvd8IA=3D=3D?=
X-Exchange-RoutingPolicyChecked: VgxjGGW785eyZqIJRb8BTOr2zpfrOqIuGgmFqh2yhHAhhuw1UAN/QR/J4MGbqWCsShGghrYIWHz59IyG4TaJDdCb5z4Mw0UGlFV/aRF3sN42tOSi1YU3iaaS/6ARtTFdNuXaOocove7l2Wnvbea5dSKG3BeInlti+n7COeA8rtFKWgz0ryaiV958OusAN9PvwHpHtcowmrkJEVDvLWAi9P6sVUjFEToqiV+/9T2RByAEfim9TyFheBPfVjxDpsrm/VJ6s4th0fZ9I4JJt+xGko8r+liewNpNo6VpeJUYqJUuvMAWU0glU6PvYijeuAHqFJotfyXMbMXRfkflI7Fpsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb5d93-c3b0-48cd-ea4a-08dec75b1b1c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:45:24.6872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9sjmsUJhD1yHJavo4jA8jkpxMD0XihQGJGhokwLLfFOyj9shqZNiaY72X3yfp21Ug5u1Zaa61cwARhK/UbMYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:SOFTIRQ-safe->SOFTIRQ-unsafe_lock_order_detected" on:

commit: f13aa632a53dc3aa2ec1a81dfbf3e52c0c26bfcd ("lib/vsprintf: Validate spinlock context during restricted pointer formatting")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/restricted-pointers-final

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: i386-randconfig-013-20260610
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606110945.d3871219-lkp@intel.com



[   92.648940][ T3827]
[   92.649789][ T3827] =====================================================
[   92.651543][ T3827] WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
[   92.653758][ T3827] 7.0.0-12214-gf13aa632a53d #1 Tainted: G                T
[   92.656006][ T3827] -----------------------------------------------------
[   92.659102][ T3827] trinity-c1/3827 [HC0[0]:SC0[2]:HE1:SE0] is trying to acquire:
[   92.674723][ T3827] 83aad874 (vsprintf_restricted_pointer_map-wait-type-assert){+.+.}-{3:3}, at: class_lock_map_acquire_constructor (linux/lockdep.h:557)
[   92.681173][ T3827]
[   92.681173][ T3827] and this task is already holding:
[   92.681173][ T3827]
[   92.681173][ T3827] and this task is already holding:
[   92.681173][ T3827]
[   92.681173][ T3827] and this task is already holding:
[   92.689423][ T3827] 857d2130 (&ptr[i]){+.-.}-{3:3}, at: established_get_first (linux/spinlock.h:348 ipv4/tcp_ipv4.c:2574)
[   92.693323][ T3827] which would create a new lock dependency:
[   92.695966][ T3827]  (&ptr[i]){+.-.}-{3:3} -> (vsprintf_restricted_pointer_map-wait-type-assert){+.+.}-{3:3}
[   92.700468][ T3827]
[   92.700468][ T3827] but this new dependency connects a SOFTIRQ-irq-safe lock:
[   92.700468][ T3827]
[   92.700468][ T3827] but this new dependency connects a SOFTIRQ-irq-safe lock:
[   92.700468][ T3827]
[   92.700468][ T3827] but this new dependency connects a SOFTIRQ-irq-safe lock:
[   92.706011][ T3827]  (&ptr[i]){+.-.}-{3:3}
[   92.706021][ T3827]
[   92.706021][ T3827] ... which became SOFTIRQ-irq-safe at:
[   92.706021][ T3827]
[   92.706021][ T3827] ... which became SOFTIRQ-irq-safe at:
[   92.706021][ T3827]
[   92.706021][ T3827] ... which became SOFTIRQ-irq-safe at:
[   92.711404][ T3827]   lock_acquire (locking/lockdep.c:5868)
[   92.713447][ T3827]   _raw_spin_lock (linux/spinlock_api_smp.h:158 locking/spinlock.c:158)
[   92.715506][ T3827]   inet_twsk_hashdance_schedule (linux/spinlock.h:342 ipv4/inet_timewait_sock.c:135)
[   92.717585][ T3827]   tcp_time_wait (ipv4/tcp_minisocks.c:383)
[   92.719017][ T3827]   tcp_rcv_state_process (ipv4/tcp_input.c:?)
[   92.720696][ T3827]   tcp_v4_do_rcv (ipv4/tcp_ipv4.c:1875)
[   92.722024][ T3827]   tcp_v4_rcv (ipv4/tcp_ipv4.c:2246)
[   92.723180][ T3827]   ip_protocol_deliver_rcu (ipv4/ip_input.c:207)
[   92.724843][ T3827]   ip_local_deliver (ipv4/ip_input.c:241 (discriminator 1))
[   92.726195][ T3827]   ip_sublist_rcv_finish (net/dst.h:480 (discriminator 3))
[   92.727531][ T3827]   ip_sublist_rcv (ipv4/ip_input.c:675 ipv4/ip_input.c:683)
[   92.728958][ T3827]   ip_list_rcv (ipv4/ip_input.c:717)
[   92.730196][ T3827]   __netif_receive_skb_list_core (core/dev.c:6252 core/dev.c:6299)
[   92.731740][ T3827]   netif_receive_skb_list_internal (core/dev.c:6351 (discriminator 256) core/dev.c:6442 (discriminator 256))
[   92.733677][ T3827]   napi_complete_done (net/gro.h:523 net/gro.h:531 core/dev.c:6810)
[   92.734992][ T3827]   e1000_clean (net/ethernet/intel/e1000/e1000_main.c:3812)
[   92.736271][ T3827]   __napi_poll (core/dev.c:7737)
[   92.737625][ T3827]   net_rx_action (core/dev.c:7800)
[   92.738853][ T3827]   handle_softirqs (softirq.c:622)
[   92.740184][ T3827]   __do_softirq (softirq.c:656)
[   92.741505][ T3827]   do_softirq_own_stack (x86/kernel/irq_32.c:56 x86/kernel/irq_32.c:144)
[   92.742870][ T3827]   __irq_exit_rcu (softirq.c:503)
[   92.744135][ T3827]   irq_exit_rcu (softirq.c:752)
[   92.745475][ T3827]   common_interrupt (x86/kernel/irq.c:326 (discriminator 9))
[   92.746728][ T3827]   asm_common_interrupt (x86/include/asm/idtentry.h:688)
[   92.748137][ T3827]
[   92.748137][ T3827] to a SOFTIRQ-irq-unsafe lock:
[   92.748137][ T3827]
[   92.748137][ T3827] to a SOFTIRQ-irq-unsafe lock:
[   92.748137][ T3827]
[   92.748137][ T3827] to a SOFTIRQ-irq-unsafe lock:
[   92.750164][ T3827]  (vsprintf_restricted_pointer_map-wait-type-assert){+.+.}-{3:3}
[   92.750168][ T3827]
[   92.750168][ T3827] ... which became SOFTIRQ-irq-unsafe at:
[   92.750168][ T3827]
[   92.750168][ T3827] ... which became SOFTIRQ-irq-unsafe at:
[   92.750168][ T3827]
[   92.750168][ T3827] ... which became SOFTIRQ-irq-unsafe at:
[   92.754551][ T3827] ...
[   92.754552][ T3827]   lock_acquire (locking/lockdep.c:5868)
[   92.757345][ T3827]   class_lock_map_acquire_constructor (linux/lockdep.h:557 (discriminator 1))
[   92.759895][ T3827]   restricted_pointer (vsprintf.c:874)
[   92.770231][ T3827]   pointer (vsprintf.c:2582)
[   92.772166][ T3827]   vsnprintf (vsprintf.c:2956)
[   92.774145][ T3827]   seq_printf (seq_file.c:392 seq_file.c:407)
[   92.776083][ T3827]   tcp6_seq_show (ipv6/tcp_ipv6.c:2147 (discriminator 1) ipv6/tcp_ipv6.c:2221 (discriminator 1))
[   92.778212][ T3827]   traverse (seq_file.c:112)
[   92.780125][ T3827]   seq_lseek (seq_file.c:324 (discriminator 1))
[   92.782106][ T3827]   proc_reg_llseek (proc/inode.c:283)
[   92.789616][ T3827]   __ia32_sys_lseek (read_write.c:391)
[   92.791786][ T3827]   ia32_sys_call (kbuild/obj/consumer/i386-randconfig-013-20260610/./arch/x86/include/generated/asm/syscalls_32.h:20)
[   92.793792][ T3827]   __do_fast_syscall_32 (x86/entry/syscall_32.c:83)
[   92.795973][ T3827]   do_fast_syscall_32 (x86/entry/syscall_32.c:332)
[   92.797992][ T3827]   do_SYSENTER_32 (x86/entry/syscall_32.c:370)
[   92.799987][ T3827]   entry_SYSENTER_32 (x86/entry/entry_32.S:835)
[   92.802088][ T3827]
[   92.802088][ T3827] other info that might help us debug this:
[   92.802088][ T3827]
[   92.802088][ T3827] other info that might help us debug this:
[   92.802088][ T3827]
[   92.802088][ T3827] other info that might help us debug this:
[   92.802088][ T3827]
[   92.811748][ T3827]  Possible interrupt unsafe locking scenario:
[   92.811748][ T3827]
[   92.811748][ T3827]  Possible interrupt unsafe locking scenario:
[   92.811748][ T3827]
[   92.811748][ T3827]  Possible interrupt unsafe locking scenario:
[   92.811748][ T3827]
[   92.815589][ T3827]        CPU0                    CPU1
[   92.817489][ T3827]        ----                    ----
[   92.819100][ T3827]   lock(vsprintf_restricted_pointer_map-wait-type-assert);
[   92.821380][ T3827]                                local_irq_disable();
[   92.823141][ T3827]                                lock(&ptr[i]);
[   92.824922][ T3827]                                lock(vsprintf_restricted_pointer_map-wait-type-assert);
[   92.827481][ T3827]   <Interrupt>
[   92.828503][ T3827]     lock(&ptr[i]);
[   92.829677][ T3827]
[   92.829677][ T3827]  *** DEADLOCK ***
[   92.829677][ T3827]
[   92.829677][ T3827]  *** DEADLOCK ***
[   92.829677][ T3827]
[   92.829677][ T3827]  *** DEADLOCK ***
[   92.829677][ T3827]
[   92.831788][ T3827] 3 locks held by trinity-c1/3827:
[   92.833367][ T3827]  #0: f55743fc (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos (file.c:1261)
[   92.835457][ T3827]  #1: f630d118 (&p->lock){+.+.}-{4:4}, at: seq_lseek (seq_file.c:314)
[   92.837697][ T3827]  #2: 857d2130 (&ptr[i]){+.-.}-{3:3}, at: established_get_first (linux/spinlock.h:348 ipv4/tcp_ipv4.c:2574)
[   92.839918][ T3827]
[   92.839918][ T3827] the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
[   92.839918][ T3827]
[   92.839918][ T3827] the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
[   92.839918][ T3827]
[   92.839918][ T3827] the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
[   92.842890][ T3827] -> (&ptr[i]){+.-.}-{3:3} {
[   92.844117][ T3827]    HARDIRQ-ON-W at:
[   92.845349][ T3827]                     lock_acquire (locking/lockdep.c:5868)
[   92.846899][ T3827]                     _raw_spin_lock (linux/spinlock_api_smp.h:158 locking/spinlock.c:158)
[   92.848615][ T3827]                     inet_ehash_insert (linux/spinlock.h:342 ipv4/inet_hashtables.c:725)
[   92.850389][ T3827]                     inet_ehash_nolisten (ipv4/inet_hashtables.c:749)
[   92.852079][ T3827]                     __inet_hash_connect (ipv4/inet_hashtables.c:1212)
[   92.854087][ T3827]                     inet_hash_connect (ipv4/inet_hashtables.c:1275)
[   92.856206][ T3827]                     tcp_v4_connect (ipv4/tcp_ipv4.c:306)
[   92.858935][ T3827]                     __inet_stream_connect (ipv4/af_inet.c:684)
[   92.861901][ T3827]                     inet_stream_connect (ipv4/af_inet.c:755)
[   92.870137][ T3827]                     __sys_connect (socket.c:2148 (discriminator 3))
[   92.872927][ T3827]                     __ia32_sys_socketcall (socket.c:3221 (discriminator 2))
[   92.875995][ T3827]                     ia32_sys_call (kbuild/obj/consumer/i386-randconfig-013-20260610/./arch/x86/include/generated/asm/syscalls_32.h:103)
[   92.878789][ T3827]                     __do_fast_syscall_32 (x86/entry/syscall_32.c:83)
[   92.881825][ T3827]                     do_fast_syscall_32 (x86/entry/syscall_32.c:332)
[   92.886058][ T3827]                     do_SYSENTER_32 (x86/entry/syscall_32.c:370)
[   92.888741][ T3827]                     entry_SYSENTER_32 (x86/entry/entry_32.S:835)
[   92.891567][ T3827]    IN-SOFTIRQ-W at:
[   92.893433][ T3827]                     lock_acquire (locking/lockdep.c:5868)
[   92.896112][ T3827]                     _raw_spin_lock (linux/spinlock_api_smp.h:158 locking/spinlock.c:158)
[   92.898846][ T3827]                     inet_twsk_hashdance_schedule (linux/spinlock.h:342 ipv4/inet_timewait_sock.c:135)
[   92.902176][ T3827]                     tcp_time_wait (ipv4/tcp_minisocks.c:383)
[   92.906283][ T3827]                     tcp_rcv_state_process (ipv4/tcp_input.c:?)
[   92.909378][ T3827]                     tcp_v4_do_rcv (ipv4/tcp_ipv4.c:1875)
[   92.912231][ T3827]                     tcp_v4_rcv (ipv4/tcp_ipv4.c:2246)
[   92.915066][ T3827]                     ip_protocol_deliver_rcu (ipv4/ip_input.c:207)
[   92.917581][ T3827]                     ip_local_deliver (ipv4/ip_input.c:241 (discriminator 1))
[   92.919549][ T3827]                     ip_sublist_rcv_finish (net/dst.h:480 (discriminator 3))
[   92.921650][ T3827]                     ip_sublist_rcv (ipv4/ip_input.c:675 ipv4/ip_input.c:683)
[   92.923332][ T3827]                     ip_list_rcv (ipv4/ip_input.c:717)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260611/202606110945.d3871219-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

