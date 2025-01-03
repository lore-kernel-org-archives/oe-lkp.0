Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA41BD9CB
	for <oe-lkp@lists.linux.dev>; Fri,  3 Jan 2025 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735892709; cv=fail; b=vFp+OCP40gRU42OPKsNPCYNNxeACCMuDlufT7ivLIssrbH1a4FYYT63aDymcjATp032ccAzI+UpJkvd7mgZpSYiaDsNYQOqNi6DmK67GqWbz7gFdOAOgIlQf6tr/Qq4tA6pSFnV0mOJ5A1Dbe5dWPanawQg+xgGUwzZ5Nbm0fl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735892709; c=relaxed/simple;
	bh=qbrdJdwcgmERHaQY/MhqHYz4bbjOskhZ1MQTj6G1JUA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=G4tb974OozxPE91cSHvIuKNIwjG7nWPc4n3MWaUkSrghXF7EM3g/Uc5imTDBN4Sswfm/ZV4ZUGOdvUttrcBamiEqDTfmf07zQEX0w09tSZw3HRMgBx7oeYA1adMuiYl9ezknfD+s85P3gUoPss3Wc7mv0qjEiWmBEgSZtUBZWts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A571CDMd; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A571CDMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735892708; x=1767428708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbrdJdwcgmERHaQY/MhqHYz4bbjOskhZ1MQTj6G1JUA=;
  b=A571CDMdq/TC20P8DyUZNZXOAGhlc4xoBgxAMhFdeQ5IA1FBOnzpekug
   rkIwUJoxiOIPVzvrVwLeqAnv2zcWN095HlRmqMPSwoVeldVY/suEy7M4n
   BrH9joG914oPqKuOTU6uXFspLV6LvdtjM6BlRZIUKUmYaoSSWpwPDafml
   LVud5Sw3fpB/s3U3L4NYWcjKRjDqBEIL2r9/fwVP/B0BMFO1UJ6qZR1DN
   7+u1a8OM0r7BwH0Mht+mpixe1TOz9cp4M/SgM594fxwEVUCYTSCqY8WWP
   nW9XSe/wmDf6AWlBjkAUhC8CpBbPe3QOPfxpgKGSVUpkhP9xh9f8zUV/Z
   Q==;
X-CSE-ConnectionGUID: X1jOZtb4RPmJS176I6lsyw==
X-CSE-MsgGUID: DZV/MLcwQnei8d47dPtNXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="40066822"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="40066822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 00:25:07 -0800
X-CSE-ConnectionGUID: v7757xnkTGmbQNHbV1SMoA==
X-CSE-MsgGUID: mOB5xy78SWabwv34lOHY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132589279"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jan 2025 00:25:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 00:25:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 00:25:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 00:25:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7jyu2P5ikKL7s10MlEurRTUGIuZaJysapAj0yaYRENfN0EgY1YibLmp4dyBteBR1fIazMGGY3eWFerTIoOIO+S3jqAXmpdtEykUv+dKsQB7i/9rKSnA+G/WMho0zurreqGjb9qzXPTqNA0XihUcHWd4yOvDf+jf+zoDSP1/O4c9/U3CcchRlCwYst8FUF/hcRaCNzHkrJc61nhz7N8ejneIeD7qPjbFp3SN3P0atgrLScowxYQkzSGoycvvwFJ3BmRAzksfMp2QQOqjDQFmkYsvNfdwbOFA8p7g7GT5upbPB/oHR+T2GaDX+5PbUQJb6fyrmPUu1IWh94UnQvDRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6wm1aDxPER4epQyfflScuAPUezoqIbzDoPjLB5DwI4=;
 b=GOoVA+Ed8KbE9lHif2luFmm0uBc6quV9CPEW6vKJvECYZeYVPH26mvvvrbAAmypUmuta3qh6/mU05raJ6q+uAh3R6T3XiN32r8fHxBFrtKsLbwodlr+MzXzkn0QmViUgi8qjGPlhQzAcXUXRXUc4wubtzYPLfEMMkeOw9vVyWJ3ebxhofYhxHNV8pKlMibn8RaU0jPebyscoLIFNCzz3+cZ5bvrCssUirxMjuNVyg5qNRJxLea+URhSxBZim3zZYmmgnX+922KiNN+kmhNmKeJWCNl5BNq6XUKz+jcwBurm/vY3x+PXz2yTSB+7p1ZdlAqVJ0+TNPyw2yUDYqdWf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV3PR11MB8675.namprd11.prod.outlook.com (2603:10b6:408:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Fri, 3 Jan
 2025 08:25:00 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 08:25:00 +0000
Date: Fri, 3 Jan 2025 16:24:52 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker
	<frederic@kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [timers/migration]  10a0e6f3d3:
 BUG:KCSAN:data-race_in__tmigr_cpu_activate/print_report
Message-ID: <202501031612.62e0c498-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV3PR11MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8eae04-ae9a-42f5-3bb7-08dd2bd01d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x/Dyy71FbScxU+bPUkZLxlcZbd3cc0xURqfL2/mwYnjD5EZTxpm/GCHN0wo/?=
 =?us-ascii?Q?0PuMnBjJ7UHqNoYDMeJvf40EBXTXHXjScK8PvXgrkmmeQIhuem4nx8wCCtna?=
 =?us-ascii?Q?dgBmE2QjLCcqe+p8juyam+p8NOXiuSf6X+UZ8tj2nZ3ziNADVgSs90fyDSMo?=
 =?us-ascii?Q?4Jneyw54aSFvPh3I5vMpQR5dq28GC6zxNvf4eWNmjRxMR2i3UUg1nmoytKkd?=
 =?us-ascii?Q?GNd7UN7H6/dy4Y0RfbFr+1oAjHu+vBPgyPAtZTMxaF56NIHGjguosgDMcCLX?=
 =?us-ascii?Q?9kxSkVHNh69Y9q/y6MpSTkLe+kGlFg4Ybk/QJr15I3BS7qmDoILLhTWB+2ed?=
 =?us-ascii?Q?jLWAVXzfXnlhMkLjXTWlumuRr09N5XKWTwToJIsHD+goBRRBCCq63BTRrx2v?=
 =?us-ascii?Q?Q+ZqaVGKEEVOqjKrUiraki79WDyaZeZV2ML8yNBe+5fDSR58BaiCiYfElQI9?=
 =?us-ascii?Q?ztXrjB57oZ6vWy5sax9Y1+ZHngZVoY76FbjSe0wOEy8plhfo9ssMDoJcCFzV?=
 =?us-ascii?Q?rstM8unrfEvdinmLKGEijkOOsf+6Y6raf90nqEg3tvSdlydr0BpfibQWfXEu?=
 =?us-ascii?Q?ClPg2VJSoBjvLJ3RuvFwanlI1ePkgQwDpW0jGtBwEbwBuVuHMCXsxfAI3/Ho?=
 =?us-ascii?Q?aCyWZoLVpR4RcN8JbMbHhQm7nkgkW6S5Q0/91SPOHKbHcEpjIBWnyUHd6CVl?=
 =?us-ascii?Q?jDWy/EBtj9PiYA/+5keWGWukzQShIIxEbekzqV2Y8c9CqJRx4N+XbLwWqyYF?=
 =?us-ascii?Q?a8YkDIB8TTLdun9MjQKMu2CiaBHQDRFVOmzpxWXEH8E28h8ps4GcGSOVZn2I?=
 =?us-ascii?Q?2Bi5vNPF3pPWCGiE7ax/saD5gq4elsDqHxuB8lEI+ruPJtN3DJi3xud1guKJ?=
 =?us-ascii?Q?DmKgy9jx+QEzmQEIO3nyoLK8efAwJPvS+P9ombmVOWNz6I1gnYxXvxOLgJXF?=
 =?us-ascii?Q?ZDHtAJvrLfi7TbuxqTw8smcvffybqMq0XyX2OKRIG9Ty74jIC2DFQgBUGdP/?=
 =?us-ascii?Q?/7szTr4jOZ3UwftzrvKNbR1xjRish9zVvs7k9o/s/HOlkCTermRcVrxg+MqS?=
 =?us-ascii?Q?9U0Hlvf5bsSNDLwgLuFt8SvEGiwTA/a63zZRAdWAgQh+i+ctfjss2Bl+CTjR?=
 =?us-ascii?Q?4oeEr0DpawVitjs2sWee90YOi4fqVcamT56+FNjy6LuWU20HNZq4AHLg7mwX?=
 =?us-ascii?Q?GhS4zct713NcyA03/7cBeXzXj9apTrfqThCwMA8c3d2UN/qx0WCOTJP6XfK5?=
 =?us-ascii?Q?cSAgewoSBzkzolvlzkz31UqOaU56ScICruvoXoct9u3RPrD0msyoKqBnAE//?=
 =?us-ascii?Q?kJrwy/mKCWyVlw7I/F0CELoWDezQ/fxVigkoy0OVsmoC2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8R5yapUR9VYl5NwN7G/4D8zFmDSBaRmacd04QG8MLYXX88ufyArn/3Y+Sf0d?=
 =?us-ascii?Q?7LdHO+aijfD+83y8ZSn86LKCkn/q6bv8MIrCcFE9EC4MavOfE6fg99oxX9SQ?=
 =?us-ascii?Q?wjt0XLjmrFhB1vycG5L7KKyTv1V0rddkkSYKmXwpOK5jqpFC9PiQhw85Z+MA?=
 =?us-ascii?Q?fsr0Pby3xGkCBKFr7Bs3f4csm5+x7UPGLRQLFSHijQ661Yv+FEduDdft9Wix?=
 =?us-ascii?Q?XPPkt974DVkzoaYR3psN2Aj8Stjb8c7EegnUhcSmtx9FBgz/1O/YwPziOZEt?=
 =?us-ascii?Q?D8D32C5dwvJ4X60njsonZP6kb7FezIaeM7h49Dvr36fImYk293Pl7dj8ldt1?=
 =?us-ascii?Q?JFiaa3F2XT4UNcUUmoy4Ocs09/elT3Z5bKcil/G4bYZLDb0UtTkAvYufEI7W?=
 =?us-ascii?Q?n+SJwaRytkni5ZUeQo1xh/1z0RGc37reIYHGRBYMORkhi0UI/PtAiT5IT8I2?=
 =?us-ascii?Q?3ALW42qoZnCnOgBYtgMNpXmFu6Ql+00uAjbHmf3x1ZXdvEafKjOlxnaVHuXU?=
 =?us-ascii?Q?W8fixbs0us4OtgFsyz6GZJ3C+iuqIBYw44Lnf+xtswP6zwOvtN+/HSG/H4Bs?=
 =?us-ascii?Q?NoNaPRWkhciRuLgFBj6/U4gBQiaKPyuU36G9IqqyF3C8nF7CFBYh3mShJv6l?=
 =?us-ascii?Q?a33NSvkn1J4iIvQ4CZaaQbQhcVqNmMBp548hxr+V3RJFIyChx3UX3rcVb5Kh?=
 =?us-ascii?Q?RMXcwYFO/k5ioDeZuuKvhvnB0cE61sSsLNE1lB51JxSWkXKGSJTSGHC9U+4W?=
 =?us-ascii?Q?ef6D04DjF/YU1IQ+UIwvC98Igm4TyomUAXMUUVqGMtBc935ITeR7tD4wNg/S?=
 =?us-ascii?Q?28STeZ+0PR7Eflu56DGLGAl/snkrbBkhxs/aafGxFOhynFUPVzn3SgsT5jQQ?=
 =?us-ascii?Q?SuBr5agOC660DehB4d5YenDxv7w0NVHCbMnAwco5y/1kMnXOIRxVTntKmuG1?=
 =?us-ascii?Q?/c9wXDtwYRhT1VleP4QfaSoNXcO1E/T3LnVRMeOhSZtoV8Si9eQY9FHzTAX7?=
 =?us-ascii?Q?qkeIEN2RXslh9tC/l4BF+1BJ77tnaBG9gKN4eEUtco6BmeXD69rAntraJG7z?=
 =?us-ascii?Q?zR9FBVuNvLj7IDPxaF8oAAGV1uDNaW2Pk3/pdX+Gq6gVuHJD5w3j/dZpDqKb?=
 =?us-ascii?Q?t7LTcAyqYyvmJCeUfB6uoAJpU8+vjy8uHcN+xYoDD4fVnLPEQJ5/bgH24/8q?=
 =?us-ascii?Q?7sPwWmrubgJxgtRr+3bRAAVOcHgKELFVEesTX8WNRpgAJ3+Hm3PTrwrDQxMG?=
 =?us-ascii?Q?ARX+GdXvfD0+YA2DQhDKWO+2FlGPwz2Q69XquKgOLVvBpWSoKMIpWzzRkLW6?=
 =?us-ascii?Q?+Fln9Lqenn1xssIOpkCp8OFi1aj49aCcv0KfNCXGAegevJxOMB10bgV0FDVJ?=
 =?us-ascii?Q?E9Y9y+9qyDurBYZQrbAf9pFs5JoJDBhZiA5jnp1V4nCeJAANwhWHXqFDxX5d?=
 =?us-ascii?Q?g1o/Gsa9zkI9iW4/cv7F6qRGSnGs+4fWTY/hIgQRzapb0yktaERLDzRfsc/C?=
 =?us-ascii?Q?sKS+CSG3ZIDEEZAgF5e+9o27TPYaMCn4mFidFxAW8osmlxMBy+BYP/iJXerd?=
 =?us-ascii?Q?fuqIbpHBM5gQAQS7e4/3+YsolmKwpJkaI2yG8jVplouHh9+uOIvHBKT0K7/P?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8eae04-ae9a-42f5-3bb7-08dd2bd01d6b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:25:00.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvF0i1fS6PkCqcUV4utSIEvtwi2NqVNu1CVn2kOvbUybYXphIGMytPQqYzS5UqtHp1QHG9G5ugl7gRVW/Kn/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8675
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KCSAN:data-race_in__tmigr_cpu_activate/print_report" on:

commit: 10a0e6f3d3db7dcfe36e578923e5f038f1d2b72a ("timers/migration: Move hierarchy setup into cpuhotplug prepare callback")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      ccb98ccef0e543c2bd4ef1a72270461957f3d8d0]
[test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: x86_64-randconfig-003-20241231
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we observed the issue happens randomly, but keeps clean on parent.


facd40aa5c4699f9 10a0e6f3d3db7dcfe36e578923e
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :48          17%           8:48    dmesg.BUG:KCSAN:data-race_in__tmigr_cpu_activate/print_report



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501031612.62e0c498-lkp@intel.com


[   30.027314][    T0] BUG: KCSAN: data-race in __tmigr_cpu_activate / print_report
[   30.027314][    T0]
[   30.027314][    T0] write to 0xffff88842fc28004 of 1 bytes by task 0 on cpu 0:
[ 30.027314][ T0] __tmigr_cpu_activate (kernel/time/timer_migration.c:689)
[ 30.027314][ T0] tmigr_cpu_activate (kernel/time/timer_migration.c:713)
[ 30.027314][ T0] timer_clear_idle (kernel/time/timer.c:2380 (discriminator 22))
[ 30.027314][ T0] tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:1097)
[ 30.027314][ T0] tick_nohz_idle_exit (kernel/time/tick-sched.c:1442 kernel/time/tick-sched.c:1483)
[ 30.027314][ T0] do_idle (arch/x86/include/asm/bitops.h:75 include/linux/sched/idle.h:36 kernel/sched/idle.c:346)
[ 30.027314][ T0] cpu_startup_entry (kernel/sched/idle.c:429 (discriminator 1))
[ 30.027314][ T0] kernel_init (init/main.c:1459)
[ 30.027314][ T0] do_initcalls (init/main.c:1333)
[ 30.027314][ T0] clear_bss (arch/x86/kernel/head64.c:381)
[ 30.027314][ T0] reserve_bios_regions (arch/x86/kernel/ebda.c:57)
[ 30.027314][ T0] common_startup_64 (arch/x86/kernel/head_64.S:421)
[   30.027314][    T0]
[   30.027314][    T0] read to 0xffff88842fc28004 of 1 bytes by task 0 on cpu 1:
[ 30.027314][ T0] print_report (kernel/kcsan/report.c:395)
[ 30.027314][ T0] kcsan_report_known_origin (kernel/kcsan/report.c:504 kernel/kcsan/report.c:694)
[ 30.027314][ T0] kcsan_setup_watchpoint (kernel/kcsan/core.c:678)
[ 30.027314][ T0] tmigr_next_groupevt (kernel/time/timer_migration.c:576)
[ 30.027314][ T0] tmigr_update_events (kernel/time/timer_migration.c:618 kernel/time/timer_migration.c:853)
[ 30.027314][ T0] tmigr_inactive_up (kernel/time/timer_migration.c:1327)
[ 30.027314][ T0] __walk_groups+0x50/0x77
[ 30.027314][ T0] walk_groups (kernel/time/timer_migration.c:501 (discriminator 9))
[ 30.027314][ T0] __tmigr_cpu_deactivate (kernel/time/timer_migration.c:1351)
[ 30.027314][ T0] tmigr_cpu_deactivate (kernel/time/timer_migration.c:1374)
[ 30.027314][ T0] __get_next_timer_interrupt (kernel/time/timer.c:2192 kernel/time/timer.c:2267)
[ 30.027314][ T0] timer_base_try_to_set_idle (kernel/time/timer.c:2357)
[ 30.027314][ T0] tick_nohz_stop_tick (kernel/time/tick-sched.c:987)
[ 30.027314][ T0] tick_nohz_idle_stop_tick (kernel/time/tick-sched.c:1228)
[ 30.027314][ T0] cpuidle_idle_call (kernel/sched/idle.c:191)
[ 30.027314][ T0] do_idle (kernel/sched/idle.c:334)
[ 30.027314][ T0] cpu_startup_entry (kernel/sched/idle.c:429 (discriminator 1))
[ 30.027314][ T0] common_cpu_up (arch/x86/kernel/smpboot.c:850)
[ 30.027314][ T0] common_startup_64 (arch/x86/kernel/head_64.S:421)
[   30.027314][    T0]
[   30.027314][    T0] value changed: 0x00 -> 0x01
[   30.027314][    T0]
[   30.027314][    T0] Reported by Kernel Concurrency Sanitizer on:
[   30.027314][    T0] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G                T  6.10.0-rc6-00002-g10a0e6f3d3db #1
[   30.027314][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   30.027314][    T0] ==================================================================


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250103/202501031612.62e0c498-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

