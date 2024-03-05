Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611453C087
	for <oe-lkp@lists.linux.dev>; Tue,  5 Mar 2024 06:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709618579; cv=fail; b=BRiFa38eIB+yY6XA0aaAWbgiZSkX/0QLEUh534eoLFboryrWzptvt+TxtQRw4oOvKwEfZFmUp3shm9hkw3xs5cFT/3D2JYWjicyta5yNl18gLxGoc7VCL3HWLBlCVIsEDCl9/Iwty1GqnQZsd/PLogYSEJvBIynwszFHY5xDBto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709618579; c=relaxed/simple;
	bh=ZoaogN9kVoCnVkIgK2/60qPJsRTlJrpMunvI6mDpSvk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jWPvy9SKcWQco+5YlPHOd4ddHAaHdL+nZdZoOPN/S6ntrfMtPezik721irP9omLxWwOUieeZKgSBue4YOUOer0XiNGLYoPxEdy+4rtlqNK7KlGciHHkoc0aqBGV1Jr1g9RtwE1ceJbJVe4xwd7ay47Mw2O47djmeHAQC1Xam114=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk4x1z8r; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk4x1z8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709618577; x=1741154577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZoaogN9kVoCnVkIgK2/60qPJsRTlJrpMunvI6mDpSvk=;
  b=Lk4x1z8rfSrl0yyBnoVL9YZ3+qoqwcq6c+PS4TuvXLROwTJJD5ReETvu
   o+6aOX5VHjZf15P2FdicHmZXtArFwJN5Gm+UInfdweHBsL0g7UxVf1c0c
   MNipk0oH9o4vYMiX1mLy09YLuEyzgzslOE8+RtbDqaI6SvVOhfSYciWfL
   m//3VAHmDMhHyPxJbJ/Rs+z7T0o3o9fYmxh+P/8iOKQSOVYqq3NPys+gr
   CEHejeGdFOp+Ycqh90N+8tDZsvalQg9P09zqvUwyzbaGsnieMVtJdM7Wq
   k030H/rWh3R54XijRjG0cKiYUgF0K87FG7jzAGvZJL3ujzeODSFlmrFgR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4316789"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4316789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 22:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9835638"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Mar 2024 22:02:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 22:02:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 22:02:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 22:02:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 22:02:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k01gbhj7G3/rYTuCK4tuOyHtio2EeG5TS+4HTNzbijkWpaVTaYTA7eibJ2UuCGDgmcoUEEfYOABYktM0q1d9sX+hR9R8ppzDD+HXbZzzmngclA4w2ZRsrZMPE2Uwof/Y88LKNy2rXt6/rSB0VEuki5R2TWrZkTIfXdUItmYt+1lsKUQ6NNO2n55PvxuCD022+23psfP/chQNgYh97oIzPVSgKF6iG9FkL6XfYPn0yny2rCXKxHcjh4DyyvXbcTbfqZz3IwJRtMutj1TjBLFB3QeRHx8tESXZbHce9IYi0lmrIiIGuwSdKQNKwuu3HWxm1mkAce/HzI1I0OrEPQQHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/1r0rJFE79SJGCC8tzY91I/rCVkvcxEBbjxRXTN9VI=;
 b=HGQ1YshV5dRAgCapHC01w9/vpwL6pkJdYs5sSafTswY1xEw1yoSqFGYqCsA4Ukd8CM65QgMs1omI+5hbw90fnO80dRE/pk/pTKML0oKEw9vtWJaGFAlcqcp3/Czp7Ijs8nb7Ylak+RJzUgTh/O0e/3JMCjkZ8bjt78nUs3OW/TwNhYo5bzAnxC9hl7wnpumNVk0rbzQgP/6m9gNQfc1gV6pn8tcsEtJT7Nu5LnfRgpOFDrghxpiTuTHctsNY814/8jdy2vJwOgDU4ljS+wCHYsSxCkbm/JzuY1ShZ58ziK4uyOVMhDl13hopk6i9zY6AIWorp0JFJ2NeLPTH13l8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4972.namprd11.prod.outlook.com (2603:10b6:806:fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 06:02:53 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 06:02:53 +0000
Date: Tue, 5 Mar 2024 14:02:44 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chengming Zhou <zhouchengming@bytedance.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed
	<yosryahmed@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham
	<nphamcs@gmail.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/zswap]  18ce3c9e4c:
 BUG:spinlock_bad_magic_on_CPU
Message-ID: <202403051008.a8cf8a94-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: d80d47f8-3883-41b8-7160-08dc3cd9e540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5PrifMa6WuadMNXymz7U3Zgh+LHSW9qdhHev2CfTaBzl2dfdU2VFWesCkAWeW5GberLkJIbyQ35B/16+XZ0KrocVUhC5vOXLd804819lrm0KC2g/M6UcCjg/fbOG7g8C3s2/YM3iyDeKji+4/3PgFFj1JAhn9xDLQ+/kMmG4P2QVuUozlMVR/RZymWojTGqKJ57nf76qmMiRLvW6Gd7GfZMg8CnZylLn4ClFmSRBXGjVQM3cqUPmzBe3SwCRfXnf3p1YUctBl3hiwj0EVc3gdmGNBmkcEYYVK5Sw3Q64v+qygiiIYtGGjVYGkkSx86zVxFtzbLoGH7asUFK/b2YGyGK4C9qk67YlnL3kl/SLky/9stTRwbKlLfz/+lr+driJb2TZ04zsqoNNNoLm5F1uaWwktHZP3uL6e6/u51ZDhkhTfmhY4gDOYGFcfRRHqKUV12O8WaxSoWA9TLmZCVPxrF/YiiUFvVFWKlTlGrKI+VuoWLC9QOKeXByxHQ5OIWeeqlIy5QmlPMHmDtjSwuOIgRAsHEYIsibjfVNbZdjxNf6W9DDau3kCxBuQ1afAFKyNrVLkciplm4uS0PjZtbRawzBs6wfIrHG9jcx9T7WXbjoB2x4e2ApOZKvu6YScdLV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4lQJokMAWLXaQoAPsK0NyNBdh3rJeRAFRJG4MKINdvCjmf6W++Z+lluhij/n?=
 =?us-ascii?Q?GFBDDKIPatYS/quWNiGj7OuE2/H5Ygq/IlmepNPwHsH2PZcqUknQahxeeb3X?=
 =?us-ascii?Q?tPw8GkGZvc/a1rs3qj9FhYjDPX17bltG6eXZII8PKJW0WW6rSpekZ+IxYHHU?=
 =?us-ascii?Q?JSOyV0/NE4ZZ3IgMuiaydxyvuKUh6pt7Qq4nxPL8eVqj4E1lAnpjV/IdFeOt?=
 =?us-ascii?Q?0R6TZY4Ld0ETW32tKponVXATAXilPiU3ExDa70hThvvGLycVQgeZy1mfv5Rg?=
 =?us-ascii?Q?ADdUL1SiBwEWY4xRQDXVjeed54OFZqPBBsSP/sdTsK0zwGRFQ78rrN5c7T4z?=
 =?us-ascii?Q?ZpYuc5hcSE3XxUv6Nh/Mh3UvayhztznwMXpWKCeuNw+tf0Hrf57F0wbDXGMx?=
 =?us-ascii?Q?M9ofvT/JP/PZrlNW/6ozxCx0sWFW3YpK4d95cbaUaPbXWB6syHIyU30XsNSh?=
 =?us-ascii?Q?SmbFhKwoKcGFyNS9FHjKpT2y4ncAeKkwgTTemf80USAL5rsAOxZ1V9dvRa7u?=
 =?us-ascii?Q?v7zyTIOngVoICHVWNwnDc/W+oB9yPavjGbuHDroH7/wc2bC/7mbquyPqfZ/y?=
 =?us-ascii?Q?hIvTvb66PhOmNSMeaIlnTF8R6EzOa3XWJV//3xHKlU/1c7DD+82rSzavYV5F?=
 =?us-ascii?Q?NacEra2kBPsntjsdtqyefezfWsvR3nOTkbGENZ2zme3N+d+phYEpIDdSiGKg?=
 =?us-ascii?Q?bEj1Wr8nYyQsesBYGnhZu88TPO3KDcP6gU0vu5/29bdu3DlupAuKES+nSQDT?=
 =?us-ascii?Q?cn/Qb7VbA1ZQKEBMlK6YNi+hcg1+2N+FRAzN6FMKp+uUSOTf274aIiv8ENJM?=
 =?us-ascii?Q?fgIK54DgqizNO9QNq+0F1UjnN3qy3BAzdQlDZ2rpqcrUzBIPFYrtDmEc3O8h?=
 =?us-ascii?Q?qhcWgLyNiHQM5PB6+6+yt/hvPr8N6Gn4VbuYT14MSLle5Ng+kMobnArJd4Sl?=
 =?us-ascii?Q?/QJ1BcDtgEi4e9xG/DhV2fnnWtOdI09ZuOLVCyrEVbDoQ4lRCRYeGMhR5OWD?=
 =?us-ascii?Q?qE6Ny1Bd7UssDnwemrMggJBIJV3BmUFADhEjRDJW973FwE3QutGOE+p17U7x?=
 =?us-ascii?Q?g1QvwSvq4mfgaozeZ62mkKL4dOsPBO4vnOq3DsYz5AemwtodM3ZmYG07q43M?=
 =?us-ascii?Q?VDRjNJU0fUGFYNcj3vkf76twf7hzBHfjx0KqWMbo9WEio7zApqhdr+bpg9Sv?=
 =?us-ascii?Q?1jBOZXCJFP9fK0mVWaWlJvUuwOrVmZK/CJ50iZgAb8KfC72TB4NyWTJwlVRJ?=
 =?us-ascii?Q?gCFF6ZjoDp+12WcaFh1CfgyYjVhJ0Gq7h0iJXk2AQVg2n4SFbZ4sEGborPOP?=
 =?us-ascii?Q?buPZN73Wg17JYdhslAF5zZOnEzESrFzsFQdycwLRD+y7zMqlUSrxmLphZMj4?=
 =?us-ascii?Q?6Ic3rStd2/ub5WEdT0wk2PsAtNrN7Xw6GkRn76UBI/MrNkASXSPxsV1GP8MF?=
 =?us-ascii?Q?tzqNVtk4Ofk9iAUnOi1FTsnwrTzzqHZzOavJU/Mbvtt1yJHC1w+V7Cc+ND+h?=
 =?us-ascii?Q?DhWiayxa9Ok0boaXedUbBpQ9FoCUJfP39a3wZBtQBGyFM7sQmxAbn82Bxpte?=
 =?us-ascii?Q?NkHWw192kGzEqwnhIqv7khVbTykX6h8bVL3KTs50tVY2efpAn3oIDX1c4nAY?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d80d47f8-3883-41b8-7160-08dc3cd9e540
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 06:02:53.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeAU2vJV3bcW5HYUYrTKD1rm5B7jK8kxWm9SZKk3bVGagbpTyYjw7wuR20VPYlHzx2+Xb4dMbY17DH6crihpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4972
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:spinlock_bad_magic_on_CPU" on:

commit: 18ce3c9e4c2d7cc1b7eaf1e8cc95be8e34209dac ("mm/zswap: global lru and shrinker shared by all zswap_pools")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 67908bf6954b7635d33760ff6dfc189fc26ccc89]

in testcase: boot

compiler: clang-17
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------+------------+------------+
|                                                    | acc2918c08 | 18ce3c9e4c |
+----------------------------------------------------+------------+------------+
| BUG:spinlock_bad_magic_on_CPU                      | 0          | 12         |
+----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403051008.a8cf8a94-lkp@intel.com



[   88.645344][    T8] BUG: spinlock bad magic on CPU#0, kworker/0:1/8
[ 88.645699][ T8] lock: zswap+0xd0/0x110, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0 
[   88.646351][    T8] CPU: 0 PID: 8 Comm: kworker/0:1 Tainted: G        W       TN 6.8.0-rc5-00353-g18ce3c9e4c2d #1
[   88.646922][    T8] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   88.647458][    T8] Workqueue: cgroup_destroy css_killed_work_fn
[   88.647785][    T8] Call Trace:
[   88.648049][    T8]  <TASK>
[ 88.648308][ T8] dump_stack_lvl (lib/dump_stack.c:107) 
[ 88.648557][ T8] do_raw_spin_lock (kernel/locking/spinlock_debug.c:?) 
[ 88.648807][ T8] zswap_memcg_offline_cleanup (mm/zswap.c:784) 
[ 88.649104][ T8] mem_cgroup_css_offline (mm/memcontrol.c:5675) 
[ 88.649382][ T8] ? __cfi_mem_cgroup_css_offline (mm/memcontrol.c:5654) 
[ 88.649689][ T8] css_killed_work_fn (kernel/cgroup/cgroup.c:5523) 
[ 88.650030][ T8] ? process_scheduled_works (kernel/workqueue.c:2608) 
[ 88.650451][ T8] process_scheduled_works (kernel/workqueue.c:2638) 
[ 88.650752][ T8] worker_thread (kernel/workqueue.c:?) 
[ 88.651006][ T8] ? __cfi_worker_thread (kernel/workqueue.c:2733) 
[ 88.651278][ T8] kthread (kernel/kthread.c:390) 
[ 88.651498][ T8] ? __cfi_kthread (kernel/kthread.c:341) 
[ 88.651745][ T8] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 88.652030][ T8] ? __cfi_kthread (kernel/kthread.c:341) 
[ 88.652427][ T8] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[   88.652682][    T8]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240305/202403051008.a8cf8a94-lkp@intel.com


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

