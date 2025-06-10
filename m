Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CE27F725
	for <oe-lkp@lists.linux.dev>; Tue, 10 Jun 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542072; cv=fail; b=IA4L9IzK2VoOMRYtN4PpcTNlvTAN0YJwqLg1cChNLbQ2IO+pmTdbdCl+FSRUYuL6CQEd/AgsafdimozdC8OrpIV5CDw+pd5dUDVe84bIEBNCZBNldxVJRhZX/xla7lR66yK2uP39MA//RDDmNo/qg5vX4y+YfGdbDS4c1l9riTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542072; c=relaxed/simple;
	bh=1Q5W3izgxI2fC/397ZWFMSZcjamY9LcclVZdFlrbxkc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=p+4pQcDhNu3/9Qy5NkZv4TCRwstPdM0UU+y/N9vkL/jG3L1ilfQCvFD8Ks9NnnqMv03BgWMbuvDaD/OQnxa76bE62L0tZH6ZU5/3d6mrWndnOZBNWdWn2qy3iRc6BslwdQbzvALzty6H/JV1DAPE+ZtMspuflChXioCMzJvrDW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yr23DUtm; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yr23DUtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749542071; x=1781078071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Q5W3izgxI2fC/397ZWFMSZcjamY9LcclVZdFlrbxkc=;
  b=Yr23DUtmapKZYVEAY7eBO5jcibM+p7JHKbzokvWh1WuoguZNhEYnOOyr
   UqFynB9aeNuNdWC0iluPX3LLuVbz0FzxA5eIWzaCwlsFP7fv9GtSI6XVe
   xbLZ2eQQD/jTTFLSE0SbcBEzk3HlHVrsf4N22S8/uiN+YgZukxFekKfWE
   8y77nIHo2kfSBL4L8JAM+ghyqRMwHsrC2Ia0Lf5Cd5/WGjW9H2yMLmrZC
   kKgNv/kQg6/2NrW6yOBk69V/N0SKmZ8//N6fFl/rirDqFiRcJQA2S82vI
   0Koj6ScSzhekRl4FR+Q7P+HoLxZNoiUqqGuV9WF1OAS6laB0SNT0Spjh1
   w==;
X-CSE-ConnectionGUID: MvHAWXLPQU6SW8lzAO8shw==
X-CSE-MsgGUID: PkAOQdYVSbGmS7OpqJXhJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55303778"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55303778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:54:23 -0700
X-CSE-ConnectionGUID: FUOkXoh7TMitU4UtlriGPA==
X-CSE-MsgGUID: 6nyk5hMLR26jbCIBDJeEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147116959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:54:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 00:54:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 00:54:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 00:54:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sC5Pe9YCOUaF6btCet/HdDS7bx/qXMWt9dBlHn2vcK+ZXP7clWG3+hTasO2NCyCP0oqLwWOXUoEDbn0FDfuOQMmb+JDDiq6KfJUZ9u2E8Q5Wm/3ZA0sBs7UwrpvGJwmexC/0+wdFRMhhXDzsuqx7wZRiz8qMmlikBtp7x9BHglof2KVCDYbYjK5dXwUFvAMZmQskMwC8pRhMzU7hf+1fVJgFiJJ/9T0EfFCKTNXnkCm2M6zpv7EWTeMMVFK+oC5xffk4LRlqgNgdVQWUGPZ2F3dRjyVLDkmvzyWcTH/UIR0fJLO1QqOBzSWn3ZkgsB2zB1MbI9PgXueyA3gKzm7Q2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QK1Vocbl1Ol9+bRVgMZ6Wb0cmKxJLSM7s1d3clhVes=;
 b=gVSAB2LdSj5U/lX4iwTKNiuOm40cWcZ9CK6V0LQJKCGIUdcbTZreOBVcxYCyfH0n2FWUb1cg2LFfF7RzIdgh99lnNu6F8sL24EVO/PSTL2H51Q+Piprl+qlSDxCL+iqLYGwMx2Suy5j7LfVwMKXPxACvW/UiMP87IT6x8AEXQMaRElgTzH3KrzsplNvzVcH5AeajQ/Ams9mDJiDPAo/PF8D25M7eg4FtoPaal3/tiDqn4IIZBKosKVorlDnC59gCte9agx3+TZZIUtAE55wDmz1KEWF3GODIM7yOjnlj1vZLwnP62sqUUwNxKOSWiF5wWXMCgnFCu0wA1+ZmO6oBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 07:54:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 07:54:19 +0000
Date: Tue, 10 Jun 2025 15:54:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:smp] [smp]  c8a0154d15:
 BUG_rcuscale(Not_tainted):Objects_remaining_on__kmem_cache_shutdown()
Message-ID: <202506101547.2567d729-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 44afaaa6-ac40-4d0c-7199-08dda7f40125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iJy00i4i0n+n7cdIsPpVLS92yLRhNExs8jFL71/VMB4XkCvX5oF0dWuonWwW?=
 =?us-ascii?Q?EnZNd64APHr+Mxqc126HlTNpBOYZiRLYVrFJ2J0zOETbnpdHa4m4vw9u9VNw?=
 =?us-ascii?Q?EYW6v3hhfto1E9A0hDtX6/pZJe0qDmZbXvVd590wWCz+CoBYP+eEA3uAZ7KH?=
 =?us-ascii?Q?DTcB0Db3ECkJXaQw5ldE5JKrjK/LFNBq3NuPpjuNlADemcUeEKKmzhVX62/V?=
 =?us-ascii?Q?EPvJ7cXjha39+L8+kTEWFe2L+1xztOH8J7HUvml528N+EUtrq3sXsbv4u3zE?=
 =?us-ascii?Q?Yv9IhkOWUg7BuqyPTYkONxbbuo0KBHwCVhcCn4bfB/n1l4HSbrELab+imvni?=
 =?us-ascii?Q?vIn7Hfu9yychk7gn7o2+py1Bjz1F0A08hkqxUWiXbcO82qh7E8KJyvvoBIA9?=
 =?us-ascii?Q?7//PblHUX5IUCKsjdtgRsSjbe9f1rLM3s4/ltj5uGYKfOee2gC8BDbwzIPml?=
 =?us-ascii?Q?6hl0haf8nTYfNFSrkaxmKWKqySKhY7xnKEtFpZNN/sJCX3Qy9qXjTVR4sd4f?=
 =?us-ascii?Q?7oWuHGXduBE8zKgR46bRGnSdNWi/seZkUWLk2+Fp8oKB08h6KsebfqVfQJuc?=
 =?us-ascii?Q?suhxHN9QrAnICeOKVX+225CidA5TqNAbct5oGtMj66HP3RQhzH+e9EdNos8L?=
 =?us-ascii?Q?MNrMcwDHq6mWaeyTF25hNeo9Rnt5nRXLT3BTU6Bsu2drXpxcR1lnvsCl+uXm?=
 =?us-ascii?Q?weQA/raoLi8zI/4jHA3qKvP8uHLDvDV2QHuDCkZnWm+g0eIJKyBXwPffWaIR?=
 =?us-ascii?Q?KgZobk6ZRw0GaW3oOl6G1yEDzZS2chOu3iS8nFKhK3B8UIeadh027Z2QzOyp?=
 =?us-ascii?Q?zQh5nxl5ncmssTVcmm2/qxCB+1TezJGOcc6ZaulYQow11UMhAo3YE7cmMPaA?=
 =?us-ascii?Q?VeLgnMtVS6b9VVymt3e2E1nqDpR7NDu29RQCtNeai7bepLMK5wXNQThkwHqe?=
 =?us-ascii?Q?RIR/YMCgQQ3cek5uydk51Vr9Qtpj5j+tJMC/74XWsR6D3FnGdG1fYhg7koe9?=
 =?us-ascii?Q?fQqQFPrpjFQvS+eHmxZyCYnpI1qQsJDf/3q0S/LRyjWk/787B9Y/klV7+VcU?=
 =?us-ascii?Q?KhJyZzLIV6ZI1HGdP2+/lzQamic0Ghy7JVuV51Iu9hV+OGNSa/1pzf1Ldx5g?=
 =?us-ascii?Q?XFKlAYhV+clUB5cEPpRoJAPj6PdYRW68w2uOD/x3PQqWmDvb0oXzeTIIxXlb?=
 =?us-ascii?Q?h6rcfElVgX6SIJ8bkMf25XxWYImwLavYz6VHy85G/IhrPSQlEPy/ROGbBXqW?=
 =?us-ascii?Q?fk8jbLzVcwA06rkYqXZYgD6fwk54gsfinT2e76Zm6pf/4538jiljc7FILAc9?=
 =?us-ascii?Q?ZXLUg0rxVVP5OV2DlLtl5aNGfa/KePeWT4FtTT0WpISwuRElIsG9DTBtTQfR?=
 =?us-ascii?Q?4Ne+SuU9YKPCTxc/ZuoJ7PVT1+vu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?46o9ol17N0KUSwsVL6XwfUE4lFstla5Gw2WlPyTwoK22EUFhZaeXTaaO9Ww2?=
 =?us-ascii?Q?q8Kk0GX3vUwtt/SP/yDMz3LX5lvsRAyECUp0Y14IieDPjKVwdkh+j9m1FdY+?=
 =?us-ascii?Q?wbiYa2RR8qDV9jPg5YzcuD9lFqbfo73haZqqz0+L5mP2RGZlGFcZP64DdKei?=
 =?us-ascii?Q?+gJehJlCy8Xm8cJnKA7pigRJZtXWqaJ7wf9zBGRuWSrCKb/7V6NLlwzVQ4D0?=
 =?us-ascii?Q?V7SoYYjyXYGGtZkURw8L0dza++vYF/I5ktH2iMBP9zT/5od739bFcyTjEI4m?=
 =?us-ascii?Q?WL72Lce8Zwd0RlkhTZgPqeiG1lZsi6Ml4v9anwu6krEnwBswWXZWs+k0JjwF?=
 =?us-ascii?Q?Mt3zxO10Efmc0sJCIN1/jwB/4iuaVzUku2ggNpu58vnE24528oPwJ6HjvsJM?=
 =?us-ascii?Q?5N/5b+KsisDPy/Tmn67uHIBtp9vtBq59OHH8AKj4Wr532fu1Ky1e6lGtx2X8?=
 =?us-ascii?Q?dQNj7LGJhJIYGV6anZGhDdjSlsJqA/Y+VrWgVgL2SNygKY1gXIWv5wsh7E9L?=
 =?us-ascii?Q?vsS0ojngKeLJMPyQh7g7vr3rgqnI7mDm28/T46V+Hee212S5aniez7blzROc?=
 =?us-ascii?Q?e377oxC1oGGgHtYzVmG8dG/9am3cwxLpx+UWPBS/TtbnYnKJYS279c459KKM?=
 =?us-ascii?Q?9it4IbT1lqF3La3MOCSrUMww3Qo3zpUGMKzCTyWWGXF/PHPWg5Q3rBeVk53Z?=
 =?us-ascii?Q?Oj2kXoSfwfw11OXrjzqe5Y0qMClNs2eJvx3oSIIxmDMyWsAWeHdRjsLe5kkJ?=
 =?us-ascii?Q?Rsccna/S1M876nQQFMq5FRNN9wqCYG243qrQqlFUNtjwv4IcXDCkkCEHA8D6?=
 =?us-ascii?Q?E8Awzu0MGcY5hTRcbtoHlGFI6hT+J3nK+nDl+MmrgPFn6WSCG+Eej/M54M+f?=
 =?us-ascii?Q?Lv4+mjfpL4uusTs6G0CbSAJWFjqoAul1Ds+xwCEfg/WMQ8AUPtepGdlEDi61?=
 =?us-ascii?Q?lTj1w0r+b8OjGFobaXqK+aLtv5yIszoGJz4Msv74ACpudfJ3DP8L2zLEpXlK?=
 =?us-ascii?Q?Xv8kM/T0MtXQEEw0jR6W4sOnv2lRHaiAROPnf0+fMGSbuH/+z3dyOElQG8Sa?=
 =?us-ascii?Q?lykoc+iQCboLLEllTckGxVEPsvK/aIvHVAow5TiW866VfWJhCHZ4NId7bO6L?=
 =?us-ascii?Q?syL8hAbt4IXLMjs8y+qNNIh3gk7qVlh57fgVphJVnc/jVJ+Z2UBElTBoKDFV?=
 =?us-ascii?Q?GwuDw+/JxqnlPt15qaXWWzSwkxa93uGuqNpcg2VEzNfTzQssNDCrLZ68qE/d?=
 =?us-ascii?Q?/fKqx0YzofZnhYzzszQ90Sh/e4Oyf1fs6vUrau9uKeIspQbtXFI8+eGjSVX1?=
 =?us-ascii?Q?FU8i16Em7XSTGSJIMGxQYMaD+4J+QQ0Y1rNoggrcYzUh0o2Y+pY82GPNusEk?=
 =?us-ascii?Q?9W5ssWTtbb1U+WsPvywZLkXceaYd99bbVHkUAO8uQeM9XOMphhpZyic1nvTf?=
 =?us-ascii?Q?bl3IZ+UYrLinlTHd9hGK1JoM3q510Y+TwUE78CbWl7ia+MW6SyzbyY/jHAue?=
 =?us-ascii?Q?KZPpJDNW77txuW36JGoI1lGUtbDLWEWjfezNuTYPyUQhtTJKWn3aI3pXeXe8?=
 =?us-ascii?Q?GIGLw+ojKyuo2Utemjv6Pjeuof06+Mck2MBrlFXMNXTMYlVE8BVdcePw+RSi?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44afaaa6-ac40-4d0c-7199-08dda7f40125
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:54:19.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5sXwKdcE3fg4YSpxTh+Ka4uGmXudZCP2zxgAxAKx8+0AeUHwR331e26KsTFDBaKJAnBVhUmVBvhmhlO/QysHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG_rcuscale(Not_tainted):Objects_remaining_on__kmem_cache_shutdown()" on:

commit: c8a0154d1529978dcda3d5745f0f911432c74f3d ("smp: defer check for local execution in smp_call_function_many_cond()")
https://github.com/norov/linux smp

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: rcu



config: x86_64-randconfig-123-20250607
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506101547.2567d729-lkp@intel.com


[ 409.187362][ T2068] __do_fast_syscall_32 (kbuild/src/consumer/arch/x86/entry/syscall_32.c:?) 
[ 409.189558][ T2068] do_fast_syscall_32 (kbuild/src/consumer/arch/x86/entry/syscall_32.c:331) 
[ 409.190474][ T2068] entry_SYSENTER_compat_after_hwframe (kbuild/src/consumer/arch/x86/entry/entry_64_compat.S:127) 
[  409.191474][ T2068] mem_dump_obj(ffffffffa023ece0): non-paged memory
[  409.268098][ T2068] =============================================================================
[  409.269715][ T2068] BUG rcuscale (Not tainted): Objects remaining on __kmem_cache_shutdown()
[  409.270902][ T2068] -----------------------------------------------------------------------------
[  409.270902][ T2068]
[  409.272995][ T2068] Object 0xffff888121122100 @offset=256
[ 409.274128][ T2068] Allocated in cleanup_module+0x79d/0x1430 [rcutorture] age=27 cpu=0 pid=2068 
[ 409.275331][ T2068] cleanup_module (kbuild/src/consumer/kernel/rcu/rcutorture.c:2577) rcutorture 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250610/202506101547.2567d729-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

