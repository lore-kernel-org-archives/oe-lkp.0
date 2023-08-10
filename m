Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC6200A7
	for <oe-lkp@lists.linux.dev>; Thu, 10 Aug 2023 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691677960; x=1723213960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//gPaOG6DzAZy7RO6KkqB/TFUacd8GK3bOQ0T7mvP1Q=;
  b=V+bcsvi08MojCX3rsxAWRw+8jynsSEGb6LlJ2eR+jpLOLnk4DYLgrL1h
   21Wu8eC3Xvden5wWrn5H57oycxTqLwM30lWQKyf5xOLu79HtRqa6PzkhY
   jseJs09Z/m06hYck2jo6Ut7LofkzGQ2O6Q61cxm1qsWnZvso+x28VJEpb
   4eEmcOoWgm+Ql8Y+bOukAnGP8xNmUJAAixTwxJDoTi7QZgpCYmyN6c774
   1MAskL6rNGnEbIbMGryEnj9JqZwRAhQRHls8/tRZorwa7ILHza1u2B0Yr
   RBlFOF0+ml+NIHi5N7tsUFF5XPfOiZre0Q85c/D2zXfpbmQMUa38BVm5V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="457788538"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="457788538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 07:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767303071"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="767303071"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 10 Aug 2023 07:32:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 07:32:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 07:32:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 07:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjFUJ31F7icl2nrYzoVTRP0QyzqPM2clNT6nz4+5haMP7Go8T3PshG6XH7CHqh/aDdAgv3JzLItrfrBaJL4Za9sl8uQwx7eav/xy8WVZSoP6PZcKxjGsIhKrSkQah4qFl9Q2vQsy3gVQCoy+2zSBkctntNrAHRGLDenDn401Yt7wCoQffcY3r2M0KejC5CkP11lsm5EU2l5VRvEbvOhDg8Oa9Bl0YW3rLtqeA2Geg/oaV/ihimHVJKZPRrrtoJ5TmhmEkRty4KOgRGWw/4fh81XDn2jkLVSTRAFiR/Qttk3iJjo/6UTt/eRMo27PwAVjRDqsjkuRck1TFEoOvJBItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6aWUlGxqaQXUzh0TkQFD7JetK8Lp0Zkl8bwYikSg0A=;
 b=MI9qzpnvqag3h8Ccg28i9g5Djlpv4iF305LKUiiZiIqF+xX/laZbjW7F7AXeR5MjHqVpXbkoFYtnywp9ro16CSPcgCodGt9AIIdWwetvfYQCP4b5QW3YDqBptObexjVHkI4D8NvwcCp+2WwLrYq8MMnYbJRtEYqHSJTMJGQNIqgY2j2oLHD5+z+ztKL4fYSgkIsdh57JaRN+aT5kEcDgRpf3QOWunv45H2808LgZ3UUwgMYll3rzPvDdKaraUEcsh04j6WEgWPG1aL7ASGwjxaVM/4pqW0N2dLuQ/sjfFqitrWoqLjwI+jxBgDORV859H2stJarq3U/J1pYhQNSH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by BN9PR11MB5370.namprd11.prod.outlook.com (2603:10b6:408:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 14:32:29 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 14:32:29 +0000
Date: Thu, 10 Aug 2023 22:32:20 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Tianyu Lan <Tianyu.Lan@microsoft.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [lantianyu:test]  49d2ce9489:
 BUG:kernel_reboot-without-warning_in_boot_stage
Message-ID: <202308102212.562c88c1-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|BN9PR11MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 09767104-e6eb-4f85-5684-08db99ae9ffa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8F8OaZy1GvRoIFsqVZGQMLX1Aohx9pTQwtj8dqiBscm3/JIMRg/56H8W/ZS0FUFMp9RJdOpJosEJ690WtYeJYkSbX4AHnnOxHGFICtMmd+YJJ6/Uon6lysCvzsi8XWslE6zMzd6PQXxAhh/Hzn4tTVeOTsfULpqH0x3QB/u+WE+Zz5cYjAATn0UNyug8dZqXNYr7FAaeHHBjzHZwj0MwYLyfU6x9tI7nkajgFpkG5JRnU9HJW0ydwLYYCIZK1eNy0WbpiragxdoJrHRDALtuFE3QpoolLFoFtQujx4ewv8XrLreGzLmLGmwjmq2nBudIiA3d0a5JC1PBoso5gvliF/DvmaTzgdz7rb7/KIu+Ex+xCkXi3iZ0SK+uric3mGhDwqhuHA2XQYE4ntLmVwLZjzF48XTUZwUonl0eZDowixCV6AFAXBeAON1yQRPQdlxkWd5E4Iri18sS2bgXy+sAKIFvb7CsS+RQZoc5FSRGKpI4A5ZxA+UoLl5QllIinLu6h8N/q09BMXlMsAUMU6cnv7Sx+WfOeJJUNxs2FHzUz1CF4Bfde4Yf9YpSzgrHAICSNtHCL/eFdrBuxBpcd6fa3CK8FDXxNO6cuadzUVLPCZjiMTHGzeL6iRamHsN6p5KAtTmjoGX9jxctrk+NB700zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(346002)(366004)(1800799006)(186006)(451199021)(2616005)(107886003)(478600001)(6486002)(6666004)(6506007)(1076003)(26005)(82960400001)(38100700002)(66946007)(66476007)(66556008)(83380400001)(6512007)(966005)(6916009)(4326008)(316002)(8936002)(8676002)(5660300002)(41300700001)(2906002)(86362001)(36756003)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6BEHwFwhLTxz2DKBJojVh65Qr1nR2jtsVMnTNzgGnAtPiSM/vUwOwNcozXO+?=
 =?us-ascii?Q?eeXVOVGAHsT5EpRcY3t3YoK4yBgbb84yyeIHxaqle9hOsQ5+Vfm2xCj4Fjv5?=
 =?us-ascii?Q?4+LH98x3+Pha6BK4bhN+6CkoDe19dEXkUYGsTKME4KLwrVMGoeB1HWz7J5T/?=
 =?us-ascii?Q?66yNdFUW2e61G1IQa68zZ58nVBdM2Mo7IzKJHs7ADbYsW2fCMuLs31LDT+tC?=
 =?us-ascii?Q?JXDDT5Oh4GhqZJ/S6q0zD/reGyCMvXDKmGIhX6nXxkyvWi9Sx21rMRJ8+s76?=
 =?us-ascii?Q?t9uHzHlE5EbB6OxRthF8mrqkXurs8KQ+iuWpo8ZrLjfIsZmkBBr+VmXbJ0tv?=
 =?us-ascii?Q?zzqoD8QOaMPPG+L8dG66+Q3M5NI9a3qKpXp+byvwmBCvYVp/Bgm4prWKtASx?=
 =?us-ascii?Q?VQjphhvejEn6PtLtQoOEPFHOCAFXvWxxHjGAbW9uI/kQYe/D9fhkQ1Go4M9R?=
 =?us-ascii?Q?V1AMbP28Udb1hCeHGPLOk8ttU/LXvCMHbFaDtQmb7ba81CvndOiJ20tepo6R?=
 =?us-ascii?Q?f8bsQWlXfkgWVYawTejeIb6dt2wf1mY7UI8JqEY4m1Wzcv8wIcUGY9eok+1T?=
 =?us-ascii?Q?j/IRCcfICBM81g9R84DDbW9UfK5R1BfXoT4dEKLY5p0yfy+W/cO/XBfpQoYH?=
 =?us-ascii?Q?uokOzKgslu6u/wO9xuBXdtNyBNxR2B5R02YI0RcEo3uXXBQo5HRxehok6rWc?=
 =?us-ascii?Q?sLW9BSNu3DUmlZ6eqY3ZWiEuRMfG2jcVEgDj6QgkGS/x8xX/tHR4fprX165d?=
 =?us-ascii?Q?mzia+C+NCOizAP4YLJgcnaTb+5wLhmrABsi+nx6flzeZAwXa3u2eKfPKRM7V?=
 =?us-ascii?Q?oSZQV6EMfrn8m+DhaHbGAKDEs1P4vgouZL/dTYFyzVXy6gzfktfpvwqg7r7K?=
 =?us-ascii?Q?SR1YYSOYSvg4X4ynkOlqGBddUAyUtpz4k4LTWRGWLOIneSZ2U4goSL2JJ3b3?=
 =?us-ascii?Q?g92pejKj8IT/4qPE9He1HZDRJ/ifTyom37flscYrje35hp94TMICMAQ1ual+?=
 =?us-ascii?Q?wHbGwQH4CYzCIJGXoOB6i2J5higKghqdIrq6uJsbn+IvTPHpobhFi8Mzc8dI?=
 =?us-ascii?Q?gT+ndw0O1jvbtjvs8IyFq9hthPJChCjOUIolaHEN4/7qS/PHdOdDzqXL53BK?=
 =?us-ascii?Q?mnZIaLcvpiRnYSVHNbzO7PHcWkkfG9Rm6+R6MVYM3Ww7nX8TdKPocBnBkgHG?=
 =?us-ascii?Q?n40znyLhn/cQkuDqJXmvmtTN5GJcAyijwS9A36/Bi2rRm1V+DXz/UDvPMOGF?=
 =?us-ascii?Q?KNORbO2dBuHv701StGoWTzyMm3TkoFMGdsEPqLUTkoRgsZTXQeHsfjrId+yX?=
 =?us-ascii?Q?9AdmbPlQc0/ThMMPfPV7L6/UucYf0oy/1j3cNpOIX0DdugFG5ep6rWcrRibj?=
 =?us-ascii?Q?4uZaaW9Bq54YVXKU3lBikbujM7hawpu9w2u+pw7oglN40ZMgvh/U2rWQcmFw?=
 =?us-ascii?Q?EwDcc8cMiO9rSwIdoJQlFgu1L4GjnJJExSmraKvpVNNRPLVMsG31xZ93VkDy?=
 =?us-ascii?Q?XNAkexh1sXtksQfwEuXYsZFezWDfwSL3vwTVRn+M0rGhb9luZH3lmRzxVVaF?=
 =?us-ascii?Q?WM4HK8GzM9b7IOeej7YZRiO4oHRRmG6T9hdBKLVGzxruIk7Km0QryL39c8lM?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09767104-e6eb-4f85-5684-08db99ae9ffa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 14:32:29.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBf60Jgsx1JVa9UzlUyOh0yumPjA+2/4AQh+l+v/VCm9VnsVqDXDShNHhe7WMqgdaOC+2OugwmgAch/wS1qjbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5370
X-OriginatorOrg: intel.com


hi, Tianyu Lan,

we noticed this commit seems like a debug patch, we still report to you FYI.
and want to consult you if you still want us to do boot/func/perf testing
for this branch?

Hello,

kernel test robot noticed "BUG:kernel_reboot-without-warning_in_boot_stage" on:

commit: 49d2ce948918f68e4c89c46bd4e27828db43f1c1 ("x2apic workaround")
https://github.com/lantianyu/linux test

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | 38b677a7af | 49d2ce9489 |
+-------------------------------------------------+------------+------------+
| boot_successes                                  | 13         | 0          |
| boot_failures                                   | 0          | 13         |
| BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 13         |
+-------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308102212.562c88c1-oliver.sang@intel.com



[    0.696159][    T1] signal: max sigframe size: 1776
[    0.697017][    T1] rcu: Hierarchical SRCU implementation.
[    0.698037][    T1] rcu: 	Max phase no-delay instances is 1000.
[    0.699538][    T1] smp: Bringing up secondary CPUs ...
[    0.700795][    T1] smpboot: x86: Booting SMP configuration:
BUG: kernel reboot-without-warning in boot stage

Kboot worker: lkp-worker32
Elapsed time: 60

kvm=(


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230810/202308102212.562c88c1-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

