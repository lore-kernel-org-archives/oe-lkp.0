Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD213AA48
	for <oe-lkp@lists.linux.dev>; Thu,  6 Jun 2024 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717660345; cv=fail; b=a1Qy8u5hiYPwzhiwkcGoiObGGCiLrMdsr1jhWeoyOb36omfokG34abkB9XbgPdI9SCoZPS6UTbL+NnJ/cAt71XoGQ52CWTkVrCpZd3f+exCorNN6hFmmZ2RFjZVp45E4kc608flbrPK+LzuFoFlq3MPcf0gHckrhWayx3wZic0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717660345; c=relaxed/simple;
	bh=7x7v+VJmai+rMj/o1HyPs6vUZlC5YBfn3AWCdRQ+x7E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iQO69/7NSDYmk24d4F17dicwSTtx36eZbdHGSd4Bl7crqvNOCwR+udGC8k7G6B8XeD4RMYZuRH/7ku5PlAfBDNxO4OEBhrzNTh0yVh62gUqfFsco/XX8vBzSM1Lfb/34KnOotnxFNC7rnIvamhivLlFixWT+qZGHMt8h+kwZJpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUg4Zpmn; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUg4Zpmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717660342; x=1749196342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7x7v+VJmai+rMj/o1HyPs6vUZlC5YBfn3AWCdRQ+x7E=;
  b=SUg4ZpmnV9TCSuz7JI1d42Uuw3QBKH5sky0xQ+8QxWD5zX2ARzm6GSgx
   EPwn5qo9iTmnZ4TT3HJcIniXhnt+yLZtd30vg+0FUWDT7nX6qyZ5Hb6Q/
   0gDaGI2U4Pfzn6kzwYJ7p+dVK3esmzLhUlkeRn7v7jwPQ0pLqG1jscsw2
   nlJOmu41V8FJTRDhU1grGfaIr4Wq9l5cIrvfZFJD3Dboywcr/79WFke+h
   +zWY2XiNvv8nM0VXrlAwBg8QhC2eMY+1ueIjspRXgf+1OR6aZxSPDudNL
   7W2EQJ7pbU0TnDhU5Ag/7oXow2jh8ToxFqK5Suj8gMdlMMn3oE8LH/beI
   g==;
X-CSE-ConnectionGUID: H2vSE1WFRsG4kIKOtP+KdA==
X-CSE-MsgGUID: ECcS9H74SDGn38eIW5rUPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39714238"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="39714238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 00:52:21 -0700
X-CSE-ConnectionGUID: XiroCHc0SsupQLgqCbRrhw==
X-CSE-MsgGUID: Tt9FR4EsTMCClGCXwz47fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42290017"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Jun 2024 00:52:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 00:52:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 00:52:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 00:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzX4wHeBGYPhCMGrIf5WLe78w0zYyMHiriAE16n+WXNwVyZ+GaEFbSGklZDE/sxjWXqkPBlwogTvKArELM6ofo3vSWfUS9gOnZWGanroVwN8gvRSs81L+3uPWzr0ZccV2Wecex40NF4LO0uS1Pk+t1/Z1yEyOan+rwrK4F5JZRRIkdNNI4hLPBY0hNgNCE6njk4FHeYFJHHQXk26HIYQ59L01Hu9hw7mXkli2tsIu366IHR4TLaP6kOI4BWtV2YMXODWvw2sHi52+jHfxZGlpNpKssNJUxYdNYnkGUKhFqh/3OwwGgrKrQvpI38WK2mvFkpoHIac9+S/adY4k1wZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+6YxQ837Xxgcm/5HEe2XBcjRxZYDbZSyKsdMRUPSnE=;
 b=RV9NyHKnwwc2fKN2UKGf0LRw+ckZpvBJpswBrVNSDZ27ylugMXXAOl9hwNXdqDA5Vc0E8ZkzT9HIgu2NlGxE5tGfiD8WNSZ0i7ZZSjca6++bN8SGjsEvUv+h/qtbSgjoBtxm2R9QMKK05+byjc9wdgsPZs8TMdoyRq8ZOX/o0tuN0wIZlfdAwf9aZwLVbJHWzawu9k65iwIClOiYyPNTrA4tJvL6j9YKoBJS7lyRqW37KgVX6GUJQWAfZJdbefmDI8S1yLqdbdx6xMAVWZ6kQ6qLWgZXndibXDuqi52psMHcQL2DCmAEki8w8siy+YcZYsU3KodlIXZ9xRxeEzQzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Thu, 6 Jun
 2024 07:52:16 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 07:52:16 +0000
Date: Thu, 6 Jun 2024 15:52:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [chrome-os:chromeos-4.19] [FROMLIST]  0b9e593f5f:
 UBSAN:Undefined_behaviour_in_mm/vmscan.c
Message-ID: <202406061501.51f78041-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: fe87e953-3d77-4e1d-b107-08dc85fd9568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wY8YlF08esV6N4U+vxcw9YKMsVsr8ED3DXv952c5a1B8GPe+7WJH9h1vvRgO?=
 =?us-ascii?Q?+6ieoPBj/4A3CaNqIyBshdaP9hr7tEJMTKV6GnxLof/FSxr4brGaGRQlxSXy?=
 =?us-ascii?Q?b+81tsi80urWDzlHC8QuBrnNLo4xt57AKhBYJ6iPRtC0kl3d6A2ed8MPfRPg?=
 =?us-ascii?Q?uv8MAD6ka4ttK2jT9P+xB6MceqxBGmXttlo5cGkUaSEnJJhD5bdJ1k1jepze?=
 =?us-ascii?Q?Nu1XIfIiME5NWosb4JFyMdaSqeKBoTtrkv5sXUTIZB7UCsLz+oUwaGjmOFfn?=
 =?us-ascii?Q?HUFb8ow5TgA0IBLUflfzvGYYJ3/ZXQVT0fhNw0nBj/+gagef0Mps0ZgGIrbY?=
 =?us-ascii?Q?J6Y60owBN7xlkp1lb9uThyFWj2DdimNYOE78b4JXonVYntgRTVqzoD9XBqbD?=
 =?us-ascii?Q?3uTBB5kIIcrOf/bAhB26Fi8k4xLSc8oN+uUnBqH47L3aCtmIipF6Xa/UWyhE?=
 =?us-ascii?Q?5e9FnRkR4OGY18JFTERt+frfabxzJRonmx1cUQenIlE3PHxVXaQ+69Ib7Ipc?=
 =?us-ascii?Q?c3BR5Nee3rvRbyAGeiKySkJC0n82Iw4yrO3jaie3upGmf3OR4R/xK6UWTXQE?=
 =?us-ascii?Q?Bs7JNQwJit+GdOQkh3jVsOmJmTZiooeKFhueDgg8CMpm/lee8P/iyx69OYvF?=
 =?us-ascii?Q?NwEgeuJpW9vDwc0e7T5B7Hv3Kyo2e0F7HdET3t9ClrgNp8HxHNLu9A36wPrp?=
 =?us-ascii?Q?eM88f+i1+UohLcaN3JQzl4mPK+hfH/fDvYikCIt6RVs27TVdDofwnqprfVDC?=
 =?us-ascii?Q?i6HCct7tZy3DB7ceI+qUal23XQ4T+EJo00Mjw1vgCY5QeJkyx+hH++9LO5us?=
 =?us-ascii?Q?t6YzMSMQ2OZYv7gItcS+pZsm080KR9UFf69RAk2xjeCB5oeXY/6ZNmkQDkjq?=
 =?us-ascii?Q?pMXnaw6Ee9hrzSqZAbe3Ojrv8sMVESh7kr9eOF6pbj0qxWrHZOmcwWcFs6Fy?=
 =?us-ascii?Q?F49jFVCe862GmhR/SM/lfMHjUbiP/M0gk3/UUuAh+lUnyLUCVjDMNspp64zS?=
 =?us-ascii?Q?FHjxLTyxs151+sAcJYh9ysaCIyIaJQTUpMS0b9Ij8/6j2znnIsU6Vm1WIH0f?=
 =?us-ascii?Q?FpUyJh1RkQ2ZBJBxZJLNejax601uhbGTSyjBycG/RB5ptyK8XDxVfMUCW8xp?=
 =?us-ascii?Q?PesG1khVH8LuuawU8wEbkkwH930/elTcoraOCLc3WOJcveYyMWi4+xh0ktjQ?=
 =?us-ascii?Q?a7Ia3WH3kHRi253c1g/Xged6snYzw8FuKqnMZcC4l0z9x/b5irgesk2YZsmS?=
 =?us-ascii?Q?Ih+PmmH9D8jB+FHHaAbAlEp/iPnn5QRKTeLjwdnrPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ukeLxOSrzdquzdgw834ZekRgApGoTqgqA8WuxnGpDK9w0OJDKepD4T2OoGmD?=
 =?us-ascii?Q?T5jHFPAvrWiUZ7foOd4iyR5Go/xbJ0OOLbCuR89qycS49hC8btZh5wyOMccA?=
 =?us-ascii?Q?nc0Dj5x8/MXsDNG8g9baBpaPMXWiiinLkv6mbvS3pRPkF+FVs3d6zDMp8kbS?=
 =?us-ascii?Q?ciCqCzq2kTakQMPmuZpgfDIewixEvk8hzO5Tt6qE980LmIlNy72Ol2euK5EO?=
 =?us-ascii?Q?mnQMe24gPfWLpDRXx2B/6xMWh+HXbe5gREusq0OFhfYIQsDtbWJ6ZO5CV7dt?=
 =?us-ascii?Q?WeNXokNfhuwkKZMJBVXQJuIJU0bZwgKJc2HGVBQMtK8/ffEKZoztfAt97c6/?=
 =?us-ascii?Q?/FfTnXsb6D9T28hDtXsnqjFDCeVGPRtsTcshZ8xcOW7EdK5uLBcsVdKRNWBJ?=
 =?us-ascii?Q?i6N5t9klJY0LmYvu34qR2EzdN71qosmYX4Ag2PNPmy8oU8eadhMYpGP4QEzT?=
 =?us-ascii?Q?Bdwh6JVpCts8TGYeZqipX6iRetLepGMRR16JCEA7LzepRg8HPJWJY5DqW9/X?=
 =?us-ascii?Q?TAvZ3wpdpM8FtG6LqROcjPexc9/GEDhzkMvGA6bThL9HqjAtFWbu/rJYi4u/?=
 =?us-ascii?Q?VHYo/RX8/xDCf3U47ji0Jg/l0HrkUNlRsOUs5M+4x7JQFbjwXmTyNobB6Mz9?=
 =?us-ascii?Q?nAROr65fp0E5cNSGYh3pPAcFB+QY8m5jhSNbLXT5QVJ+sryJ7JGSTPRGR5E2?=
 =?us-ascii?Q?FK62BOIB25b2Bp+WaYF7JMPQfFrjpjOcY/EWWAF3UdGFFjylqjWKh6zeEOkL?=
 =?us-ascii?Q?KctQd7fD/8HsHAR4sFHYLRxQjYVEIitKSEVh0nl1BNpe4YNH63a8ZMGHB0tD?=
 =?us-ascii?Q?gh+waYSsNHsZKiEz/gMaa7U4U1maE3hAFtgqnuwGoszNFYh3CxJZS3S19cM7?=
 =?us-ascii?Q?qatKGRc6O5ju2wtkb6tG8mWmWsWN9dEWh6ifb9DBqFOKWjIQlf1FelmU+9aV?=
 =?us-ascii?Q?+StOwR9e4cj8WpXZ8b3DVWk95vjesehUXjCm9JEdnsEYEvfHUKydSLIjj1B5?=
 =?us-ascii?Q?lDql9rFt72drDEFxO3F/PreN+OWv2m2HNFgcLsl/JMYt574MNy2AsyYtghS1?=
 =?us-ascii?Q?Yi8djaoJS4HAWBwXz54E1SKNTOmC0n1QTwiEQMY6TZONsEEx9Y6KxFCLquF/?=
 =?us-ascii?Q?Jnu5kgVyxO7wmFPsalYMoo+6Kc1AFNk0R/YbckJUrVF3WpjvaPmW/5aGpqyh?=
 =?us-ascii?Q?vceQsk7HN3afmKPRhquWAPJyu4Wt7C48ouwcxWe/AqXa451YBoP0+3boXfze?=
 =?us-ascii?Q?qVftwfCobnt0lnxGP9h3gE4GaqHOcKPdMNMcgYy9i0rmU9AvEk5Ly/PVJjWy?=
 =?us-ascii?Q?IxJ6o4LUSOItBRjXncj3DAW78LbS9DdQjredGYje+P2se9PZbc/ZkrfCtpRi?=
 =?us-ascii?Q?jA2cfYBK1YqpBlEygvwbulN2+yVF1jU5cmEEixFnYmARYWbdX6QACCo1II7n?=
 =?us-ascii?Q?BxnlhDpyuwZ9gUmni5cion1AlfFbkM0+39+2kw2fi+42wbWqv6ZhXzN6ds3u?=
 =?us-ascii?Q?ZBJa4ZOO9rQWeikR5+U9icxBcM56PeVzkWRyzQQE+zpDvGFpFLVIMbZRfL5n?=
 =?us-ascii?Q?btXd+DuGd3T3FV/s8P6kVg9WJdsyLtqpm6yl9lOz0lMXo0pUGhR2rTwAGpXZ?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe87e953-3d77-4e1d-b107-08dc85fd9568
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 07:52:16.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQfhrkO9Buq6jOKJLS2pBeRzIB616Kr0OIbbX4u5rbDxcBdDdhh60kAvvhUXLNIQHwWhqeFpoDaMIzgBVMVNcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
X-OriginatorOrg: intel.com



Hello,

we noticed there is only config diff in this commit.
and after compiling, the config has below changes comparing to parent:

--- /pkg/linux/x86_64-randconfig-072-20240528/gcc-13/6bf4b6689c518dbf4182bf472ece6461b2f60962/.config   2024-06-03 02:00:53.394948624 +0800
+++ /pkg/linux/x86_64-randconfig-072-20240528/gcc-13/0b9e593f5fb2c9cbb12e98204fc8f6fbffdb69a5/.config   2024-06-02 23:49:58.872196687 +0800
@@ -893,6 +893,11 @@ CONFIG_ARCH_HAS_PKEYS=y
 # CONFIG_PERCPU_STATS is not set
 # CONFIG_GUP_BENCHMARK is not set
 CONFIG_ARCH_HAS_PTE_SPECIAL=y
+CONFIG_LRU_GEN=y
+# CONFIG_LRU_GEN_ENABLED is not set
+# CONFIG_LRU_GEN_STATS is not set
+CONFIG_NR_LRU_GENS=7
+CONFIG_TIERS_PER_GEN=4
 CONFIG_NET=y

 #


we cannot connect this to "UBSAN:Undefined_behaviour_in_mm/vmscan.c", but we
found it's quite persistent. at the same time, there are other UBSAN issues
for both parent and this commit:

6bf4b6689c518dbf 0b9e593f5fb2c9cbb12e98204fc
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_drivers/acpi/pci_link.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_include/linux/memcontrol.h
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_include/net/ip_fib.h
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_include/net/netns/generic.h
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_kernel/module.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_kernel/params.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_mm/memcontrol.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_mm/memory.c
           :6          100%           6:6     dmesg.UBSAN:Undefined_behaviour_in_mm/vmscan.c   <---- only show on this commit but not on parent
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_net/core/net_namespace.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_net/ipv4/fib_frontend.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_net/ipv4/fib_semantics.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_net/ipv4/fib_trie.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_net/ipv4/route.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_net/netlink/af_netlink.c
          6:6            0%           6:6     dmesg.UBSAN:Undefined_behaviour_in_sound/core/control.c

we just made out this report FYI what we observed in our tests.



kernel test robot noticed "UBSAN:Undefined_behaviour_in_mm/vmscan.c" on:

commit: 0b9e593f5fb2c9cbb12e98204fc8f6fbffdb69a5 ("FROMLIST: mm: multigenerational lru: Kconfig")
https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.19

in testcase: boot

compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406061501.51f78041-oliver.sang@intel.com


[    2.171874] UBSAN: Undefined behaviour in mm/memcontrol.c:4483:17
[    2.172657] index 0 is out of range for type 'mem_cgroup_per_node *[*]'
[    2.172657] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.172657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.172657] Call Trace:
[    2.172657] dump_stack (lib/dump_stack.c:120) 
[    2.172657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.172657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.172657] mem_cgroup_alloc (mm/memcontrol.c:4483 (discriminator 1) mm/memcontrol.c:4539 (discriminator 1)) 
[    2.172657] mem_cgroup_css_alloc (mm/memcontrol.c:4579) 
[    2.172657] ? kasan_populate_zero_shadow (mm/memcontrol.c:4573) 
[    2.172657] cgroup_init_subsys (kernel/cgroup/cgroup.c:5394 (discriminator 1)) 
[    2.172657] cgroup_init (kernel/cgroup/cgroup.c:5522) 
[    2.172657] start_kernel (init/main.c:734) 
[    2.172657] ? thread_stack_cache_init+0x1/0x1 
[    2.172657] secondary_startup_64 (arch/x86/kernel/head_64.S:243) 
[    2.172657] ================================================================================
[    2.172704] ================================================================================
[    2.174220] UBSAN: Undefined behaviour in mm/vmscan.c:2777:17
[    2.175575] index 0 is out of range for type '<unknown> [*]'
[    2.176573] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.176657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.176657] Call Trace:
[    2.176657] dump_stack (lib/dump_stack.c:120) 
[    2.176657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.176657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.176657] ? __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26) 
[    2.176657] alloc_mm_list (mm/vmscan.c:2777 (discriminator 1)) 
[    2.176657] lru_gen_alloc_mm_list (mm/vmscan.c:2860 (discriminator 1)) 
[    2.176657] mem_cgroup_alloc (mm/memcontrol.c:4542 (discriminator 1)) 
[    2.176657] mem_cgroup_css_alloc (mm/memcontrol.c:4579) 
[    2.176657] ? kasan_populate_zero_shadow (mm/memcontrol.c:4573) 
[    2.176657] cgroup_init_subsys (kernel/cgroup/cgroup.c:5394 (discriminator 1)) 
[    2.176657] cgroup_init (kernel/cgroup/cgroup.c:5522) 
[    2.176657] start_kernel (init/main.c:734) 
[    2.176657] ? thread_stack_cache_init+0x1/0x1 
[    2.176657] secondary_startup_64 (arch/x86/kernel/head_64.S:243) 
[    2.176657] ================================================================================
[    2.176672] ================================================================================
[    2.178113] UBSAN: Undefined behaviour in mm/vmscan.c:2778:17
[    2.179419] index 0 is out of range for type '<unknown> [*]'
[    2.180414] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.180657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.180657] Call Trace:
[    2.180657] dump_stack (lib/dump_stack.c:120) 
[    2.180657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.180657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.180657] ? __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26) 
[    2.180657] alloc_mm_list (mm/vmscan.c:2778 (discriminator 1)) 
[    2.180657] lru_gen_alloc_mm_list (mm/vmscan.c:2860 (discriminator 1)) 
[    2.180657] mem_cgroup_alloc (mm/memcontrol.c:4542 (discriminator 1)) 
[    2.180657] mem_cgroup_css_alloc (mm/memcontrol.c:4579) 
[    2.180657] ? kasan_populate_zero_shadow (mm/memcontrol.c:4573) 
[    2.180657] cgroup_init_subsys (kernel/cgroup/cgroup.c:5394 (discriminator 1)) 
[    2.180657] cgroup_init (kernel/cgroup/cgroup.c:5522) 
[    2.180657] start_kernel (init/main.c:734) 
[    2.180657] ? thread_stack_cache_init+0x1/0x1 
[    2.180657] secondary_startup_64 (arch/x86/kernel/head_64.S:243) 
[    2.180657] ================================================================================
[    2.180671] ================================================================================
[    2.182198] UBSAN: Undefined behaviour in mm/vmscan.c:2779:3
[    2.183516] index 0 is out of range for type '<unknown> [*]'
[    2.184500] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.184657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.184657] Call Trace:
[    2.184657] dump_stack (lib/dump_stack.c:120) 
[    2.184657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.184657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.184657] ? __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26) 
[    2.184657] alloc_mm_list (mm/vmscan.c:2779 (discriminator 1)) 
[    2.184657] lru_gen_alloc_mm_list (mm/vmscan.c:2860 (discriminator 1)) 
[    2.184657] mem_cgroup_alloc (mm/memcontrol.c:4542 (discriminator 1)) 
[    2.184657] mem_cgroup_css_alloc (mm/memcontrol.c:4579) 
[    2.184657] ? kasan_populate_zero_shadow (mm/memcontrol.c:4573) 
[    2.184657] cgroup_init_subsys (kernel/cgroup/cgroup.c:5394 (discriminator 1)) 
[    2.184657] cgroup_init (kernel/cgroup/cgroup.c:5522) 
[    2.184657] start_kernel (init/main.c:734) 
[    2.184657] ? thread_stack_cache_init+0x1/0x1 
[    2.184657] secondary_startup_64 (arch/x86/kernel/head_64.S:243) 
[    2.184657] ================================================================================
[    2.185189] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    2.188667] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    2.189689] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    2.191148] Spectre V2 : Spectre mitigation: kernel not compiled with retpoline; no mitigation available!
[    2.191151] Speculative Store Bypass: Vulnerable
[    2.193574] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    2.195362] Freeing SMP alternatives memory: 44K
[    2.199635] smpboot: CPU0: Intel Xeon E312xx (Sandy Bridge) (family: 0x6, model: 0x2a, stepping: 0x1)
[    2.200657] Performance Events: unsupported p6 CPU model 42 no PMU driver, software events only.
[    2.200973] rcu: Hierarchical SRCU implementation.
[    2.207018] smp: Bringing up secondary CPUs ...
[    2.209218] x86: Booting SMP configuration:
[    2.210078] .... node  #0, CPUs:      #1
[    0.131887] kvm-clock: cpu 1, msr 7601041, secondary cpu clock
[    0.131887] masked ExtINT on CPU#1
[    2.212832] KVM setup async PF for cpu 1
[    2.212832] kvm-stealtime: cpu 1, msr 3aef2c040
[    2.214918] smp: Brought up 1 node, 2 CPUs
[    2.215756] smpboot: Max logical packages: 1
[    2.216563] smpboot: Total of 2 processors activated (12370.93 BogoMIPS)
[    2.275231] allocated 83886080 bytes of page_ext
[    2.276835] Node 0, zone      DMA: page owner found early allocated 0 pages
[    2.278835] Node 0, zone    DMA32: page owner found early allocated 41 pages
[    2.286430] Node 0, zone   Normal: page owner found early allocated 22219 pages
[    2.289675] devtmpfs: initialized
[    2.310915] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    2.312735] futex hash table entries: 512 (order: 4, 65536 bytes)
[    2.314689] xor: automatically using best checksumming function   avx
[    2.316682] RTC time:  3:11:14, date: 06/03/24
[    2.319671] NET: Registered protocol family 16
[    2.320700] ================================================================================
[    2.322231] UBSAN: Undefined behaviour in net/core/net_namespace.c:85:14
[    2.323741] index 3 is out of range for type 'void *[*]'
[    2.324657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.324657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.324657] Call Trace:
[    2.324657] dump_stack (lib/dump_stack.c:120) 
[    2.324657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.324657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.324657] net_assign_generic (net/core/net_namespace.c:85 (discriminator 1)) 
[    2.324657] ? ops_init (include/linux/slab.h:520 include/linux/slab.h:709 net/core/net_namespace.c:119) 
[    2.324657] ops_init (net/core/net_namespace.c:123) 
[    2.324657] __register_pernet_operations (net/core/net_namespace.c:943) 
[    2.324657] ? setup_net (net/core/net_namespace.c:932) 
[    2.324657] ? ida_alloc_range (lib/idr.c:555 (discriminator 1)) 
[    2.324657] register_pernet_operations (net/core/net_namespace.c:1014) 
[    2.324657] register_pernet_subsys (net/core/net_namespace.c:1056) 
[    2.324657] netlink_proto_init (net/netlink/af_netlink.c:2777) 
[    2.324657] ? init_em_ipset (net/netlink/af_netlink.c:2748) 
[    2.324657] do_one_initcall (init/main.c:893) 
[    2.324657] ? initcall_blacklisted (init/main.c:884) 
[    2.324657] ? parse_one (kernel/params.c:173) 
[    2.324657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.324657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.324657] ? rest_init (init/main.c:1068) 
[    2.324657] kernel_init (init/main.c:1073) 
[    2.324657] ? rest_init (init/main.c:1068) 
[    2.324657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.324657] ================================================================================
[    2.324686] ================================================================================
[    2.326191] UBSAN: Undefined behaviour in include/net/netns/generic.h:46:15
[    2.327767] index 3 is out of range for type 'void *[*]'
[    2.328657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.328657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.328657] Call Trace:
[    2.328657] dump_stack (lib/dump_stack.c:120) 
[    2.328657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.328657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.328657] netlink_tap_init_net (include/net/netns/generic.h:46 (discriminator 1) net/netlink/af_netlink.c:241 (discriminator 1)) 
[    2.328657] ops_init (net/core/net_namespace.c:129) 
[    2.328657] __register_pernet_operations (net/core/net_namespace.c:943) 
[    2.328657] ? setup_net (net/core/net_namespace.c:932) 
[    2.328657] ? ida_alloc_range (lib/idr.c:555 (discriminator 1)) 
[    2.328657] register_pernet_operations (net/core/net_namespace.c:1014) 
[    2.328657] register_pernet_subsys (net/core/net_namespace.c:1056) 
[    2.328657] netlink_proto_init (net/netlink/af_netlink.c:2777) 
[    2.328657] ? init_em_ipset (net/netlink/af_netlink.c:2748) 
[    2.328657] do_one_initcall (init/main.c:893) 
[    2.328657] ? initcall_blacklisted (init/main.c:884) 
[    2.328657] ? parse_one (kernel/params.c:173) 
[    2.328657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.328657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.328657] ? rest_init (init/main.c:1068) 
[    2.328657] kernel_init (init/main.c:1073) 
[    2.328657] ? rest_init (init/main.c:1068) 
[    2.328657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.328657] ================================================================================
[    2.333748] cpuidle: using governor ladder
[    2.335588] ACPI: bus type PCI registered
[    2.337745] PCI: Using configuration type 1 for base access
[    2.341185] ================================================================================
[    2.342742] UBSAN: Undefined behaviour in kernel/params.c:651:2
[    2.344132] index 0 is out of range for type 'param_attribute [*]'
[    2.344657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.344657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.344657] Call Trace:
[    2.344657] dump_stack (lib/dump_stack.c:120) 
[    2.344657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.344657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.344657] ? memset (mm/kasan/kasan.c:287) 
[    2.344657] add_sysfs_param (kernel/params.c:651 (discriminator 1)) 
[    2.344657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.344657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.344657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.344657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.344657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.344657] param_sysfs_init (kernel/params.c:956) 
[    2.344657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.344657] do_one_initcall (init/main.c:893) 
[    2.344657] ? initcall_blacklisted (init/main.c:884) 
[    2.344657] ? parse_one (kernel/params.c:173) 
[    2.344657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.344657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.344657] ? rest_init (init/main.c:1068) 
[    2.344657] kernel_init (init/main.c:1073) 
[    2.344657] ? rest_init (init/main.c:1068) 
[    2.344657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.344657] ================================================================================
[    2.344676] ================================================================================
[    2.346193] UBSAN: Undefined behaviour in kernel/params.c:652:15
[    2.347593] index 0 is out of range for type 'param_attribute [*]'
[    2.348657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.348657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.348657] Call Trace:
[    2.348657] dump_stack (lib/dump_stack.c:120) 
[    2.348657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.348657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.348657] ? memset (mm/kasan/kasan.c:287) 
[    2.348657] add_sysfs_param (kernel/params.c:652 (discriminator 1)) 
[    2.348657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.348657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.348657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.348657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.348657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.348657] param_sysfs_init (kernel/params.c:956) 
[    2.348657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.348657] do_one_initcall (init/main.c:893) 
[    2.348657] ? initcall_blacklisted (init/main.c:884) 
[    2.348657] ? parse_one (kernel/params.c:173) 
[    2.348657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.348657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.348657] ? rest_init (init/main.c:1068) 
[    2.348657] kernel_init (init/main.c:1073) 
[    2.348657] ? rest_init (init/main.c:1068) 
[    2.348657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.348657] ================================================================================
[    2.348678] ================================================================================
[    2.350184] UBSAN: Undefined behaviour in kernel/params.c:653:15
[    2.351580] index 0 is out of range for type 'param_attribute [*]'
[    2.352653] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.352657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.352657] Call Trace:
[    2.352657] dump_stack (lib/dump_stack.c:120) 
[    2.352657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.352657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.352657] ? memset (mm/kasan/kasan.c:287) 
[    2.352657] add_sysfs_param (kernel/params.c:653 (discriminator 1)) 
[    2.352657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.352657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.352657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.352657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.352657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.352657] param_sysfs_init (kernel/params.c:956) 
[    2.352657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.352657] do_one_initcall (init/main.c:893) 
[    2.352657] ? initcall_blacklisted (init/main.c:884) 
[    2.352657] ? parse_one (kernel/params.c:173) 
[    2.352657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.352657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.352657] ? rest_init (init/main.c:1068) 
[    2.352657] kernel_init (init/main.c:1073) 
[    2.352657] ? rest_init (init/main.c:1068) 
[    2.352657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.352657] ================================================================================
[    2.352695] ================================================================================
[    2.354185] UBSAN: Undefined behaviour in kernel/params.c:656:16
[    2.355585] index 0 is out of range for type 'param_attribute [*]'
[    2.356657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.356657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.356657] Call Trace:
[    2.356657] dump_stack (lib/dump_stack.c:120) 
[    2.356657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.356657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.356657] ? memset (mm/kasan/kasan.c:287) 
[    2.356657] add_sysfs_param (kernel/params.c:656 (discriminator 1)) 
[    2.356657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.356657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.356657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.356657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.356657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.356657] param_sysfs_init (kernel/params.c:956) 
[    2.356657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.356657] do_one_initcall (init/main.c:893) 
[    2.356657] ? initcall_blacklisted (init/main.c:884) 
[    2.356657] ? parse_one (kernel/params.c:173) 
[    2.356657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.356657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.356657] ? rest_init (init/main.c:1068) 
[    2.356657] kernel_init (init/main.c:1073) 
[    2.356657] ? rest_init (init/main.c:1068) 
[    2.356657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.356657] ================================================================================
[    2.356678] ================================================================================
[    2.358161] UBSAN: Undefined behaviour in kernel/params.c:659:15
[    2.359576] index 0 is out of range for type 'param_attribute [*]'
[    2.360657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.360657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.360657] Call Trace:
[    2.360657] dump_stack (lib/dump_stack.c:120) 
[    2.360657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.360657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.360657] ? memset (mm/kasan/kasan.c:287) 
[    2.360657] add_sysfs_param (kernel/params.c:659 (discriminator 1)) 
[    2.360657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.360657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.360657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.360657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.360657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.360657] param_sysfs_init (kernel/params.c:956) 
[    2.360657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.360657] do_one_initcall (init/main.c:893) 
[    2.360657] ? initcall_blacklisted (init/main.c:884) 
[    2.360657] ? parse_one (kernel/params.c:173) 
[    2.360657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.360657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.360657] ? rest_init (init/main.c:1068) 
[    2.360657] kernel_init (init/main.c:1073) 
[    2.360657] ? rest_init (init/main.c:1068) 
[    2.360657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.360657] ================================================================================
[    2.360679] ================================================================================
[    2.362146] UBSAN: Undefined behaviour in kernel/params.c:660:15
[    2.363597] index 0 is out of range for type 'param_attribute [*]'
[    2.364657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.364657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.364657] Call Trace:
[    2.364657] dump_stack (lib/dump_stack.c:120) 
[    2.364657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.364657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.364657] ? memset (mm/kasan/kasan.c:287) 
[    2.364657] add_sysfs_param (kernel/params.c:660 (discriminator 1)) 
[    2.364657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.364657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.364657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.364657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.364657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.364657] param_sysfs_init (kernel/params.c:956) 
[    2.364657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.364657] do_one_initcall (init/main.c:893) 
[    2.364657] ? initcall_blacklisted (init/main.c:884) 
[    2.364657] ? parse_one (kernel/params.c:173) 
[    2.364657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.364657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.364657] ? rest_init (init/main.c:1068) 
[    2.364657] kernel_init (init/main.c:1073) 
[    2.364657] ? rest_init (init/main.c:1068) 
[    2.364657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.364657] ================================================================================
[    2.364679] ================================================================================
[    2.366184] UBSAN: Undefined behaviour in kernel/params.c:665:40
[    2.367574] index 0 is out of range for type 'param_attribute [*]'
[    2.368648] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.368657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.368657] Call Trace:
[    2.368657] dump_stack (lib/dump_stack.c:120) 
[    2.368657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.368657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.368657] ? memset (mm/kasan/kasan.c:287) 
[    2.368657] add_sysfs_param (kernel/params.c:665 (discriminator 1)) 
[    2.368657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.368657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.368657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.368657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.368657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.368657] param_sysfs_init (kernel/params.c:956) 
[    2.368657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.368657] do_one_initcall (init/main.c:893) 
[    2.368657] ? initcall_blacklisted (init/main.c:884) 
[    2.368657] ? parse_one (kernel/params.c:173) 
[    2.368657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.368657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.368657] ? rest_init (init/main.c:1068) 
[    2.368657] kernel_init (init/main.c:1073) 
[    2.368657] ? rest_init (init/main.c:1068) 
[    2.368657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.368657] ================================================================================
[    2.368914] ================================================================================
[    2.370419] UBSAN: Undefined behaviour in kernel/params.c:650:23
[    2.371814] index 1 is out of range for type 'param_attribute [*]'
[    2.372657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.372657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.372657] Call Trace:
[    2.372657] dump_stack (lib/dump_stack.c:120) 
[    2.372657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.372657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.372657] ? krealloc (mm/slab_common.c:1551) 
[    2.372657] add_sysfs_param (kernel/params.c:650) 
[    2.372657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.372657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.372657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.372657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.372657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.372657] param_sysfs_init (kernel/params.c:956) 
[    2.372657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.372657] do_one_initcall (init/main.c:893) 
[    2.372657] ? initcall_blacklisted (init/main.c:884) 
[    2.372657] ? parse_one (kernel/params.c:173) 
[    2.372657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.372657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.372657] ? rest_init (init/main.c:1068) 
[    2.372657] kernel_init (init/main.c:1073) 
[    2.372657] ? rest_init (init/main.c:1068) 
[    2.372657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.372657] ================================================================================
[    2.373478] ================================================================================
[    2.374958] UBSAN: Undefined behaviour in kernel/params.c:658:16
[    2.376341] index 2 is out of range for type 'param_attribute [*]'
[    2.376657] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.376657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.376657] Call Trace:
[    2.376657] dump_stack (lib/dump_stack.c:120) 
[    2.376657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.376657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.376657] ? memset (mm/kasan/kasan.c:287) 
[    2.376657] add_sysfs_param (kernel/params.c:658 (discriminator 1)) 
[    2.376657] kernel_add_sysfs_param (kernel/params.c:795 (discriminator 1)) 
[    2.376657] param_sysfs_builtin (kernel/params.c:818 (discriminator 2)) 
[    2.376657] ? kernel_add_sysfs_param (kernel/params.c:813) 
[    2.376657] ? kfree (mm/slub.c:1436 (discriminator 1) mm/slub.c:3009 (discriminator 1) mm/slub.c:3972 (discriminator 1)) 
[    2.376657] ? kobject_uevent_env (lib/kobject_uevent.c:626) 
[    2.376657] param_sysfs_init (kernel/params.c:956) 
[    2.376657] ? param_sysfs_builtin (kernel/params.c:944) 
[    2.376657] do_one_initcall (init/main.c:893) 
[    2.376657] ? initcall_blacklisted (init/main.c:884) 
[    2.376657] ? parse_one (kernel/params.c:173) 
[    2.376657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.376657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.376657] ? rest_init (init/main.c:1068) 
[    2.376657] kernel_init (init/main.c:1073) 
[    2.376657] ? rest_init (init/main.c:1068) 
[    2.376657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.376657] ================================================================================
[    2.410576] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    2.413118] cryptd: max_cpu_qlen set to 1000
[    2.415349] raid6: using algorithm sse2x4 gen() 0 MB/s
[    2.416317] raid6: .... xor() 0 MB/s, rmw enabled
[    2.416720] raid6: using ssse3x2 recovery algorithm
[    2.419119] ACPI: Added _OSI(Module Device)
[    2.419936] ACPI: Added _OSI(Processor Device)
[    2.421108] ACPI: Added _OSI(3.0 _SCP Extensions)
[    2.421986] ACPI: Added _OSI(Processor Aggregator Device)
[    2.422997] ACPI: Added _OSI(Linux-Dell-Video)
[    2.423865] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    2.489047] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    2.502486] ACPI: Interpreter enabled
[    2.503403] ACPI: (supports S0 S5)
[    2.504103] ACPI: Using IOAPIC for interrupt routing
[    2.504994] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    2.510136] ACPI: Enabled 2 GPEs in block 00 to 0F
[    2.629394] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    2.630639] acpi PNP0A03:00: _OSC: OS supports [Segments]
[    2.631903] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND)
[    2.632761] acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
[    2.636083] PCI host bridge to bus 0000:00
[    2.636706] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    2.637889] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    2.639088] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    2.640426] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
[    2.640703] pci_bus 0000:00: root bus resource [mem 0x440000000-0x4bfffffff window]
[    2.642092] pci_bus 0000:00: root bus resource [bus 00-ff]
[    2.643203] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    2.650849] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    2.657885] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    2.665407] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
[    2.667472] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    2.668684] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    2.669845] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    2.671081] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    2.675561] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    2.677342] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
[    2.678687] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
[    2.683200] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
[    2.685219] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pref]
[    2.688474] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0fff]
[    2.692705] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pref]
[    2.700481] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
[    2.701632] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
[    2.703599] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
[    2.712230] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pref]
[    2.718404] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
[    2.719999] pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf100f]
[    2.728621] pci_bus 0000:00: on NUMA node 0
[    2.735220] ================================================================================
[    2.736657] UBSAN: Undefined behaviour in drivers/acpi/pci_link.c:146:23
[    2.736657] index 1 is out of range for type 'u32 [1]'
[    2.736657] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.736657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.736657] Call Trace:
[    2.736657] dump_stack (lib/dump_stack.c:120) 
[    2.736657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.736657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.736657] ? acpi_ut_update_ref_count (drivers/acpi/acpica/utdelete.c:470) 
[    2.736657] acpi_pci_link_check_possible (drivers/acpi/pci_link.c:146) 
[    2.736657] ? acpi_pci_link_check_current (drivers/acpi/pci_link.c:105) 
[    2.736657] acpi_walk_resource_buffer (drivers/acpi/acpica/rsxface.c:548) 
[    2.736657] ? acpi_pci_link_check_current (drivers/acpi/pci_link.c:105) 
[    2.736657] acpi_walk_resources (include/acpi/platform/aclinuxex.h:62 drivers/acpi/acpica/rsxface.c:624) 
[    2.736657] ? acpi_rs_match_vendor_resource (drivers/acpi/acpica/rsxface.c:597) 
[    2.736657] acpi_pci_link_add (drivers/acpi/pci_link.c:175 drivers/acpi/pci_link.c:753) 
[    2.736657] ? acpi_device_notify_fixed (drivers/acpi/bus.c:110) 
[    2.736657] ? acpi_scan_match_handler (drivers/acpi/scan.c:1793 (discriminator 1) drivers/acpi/scan.c:1809 (discriminator 1)) 
[    2.736657] acpi_bus_attach (drivers/acpi/scan.c:1991 drivers/acpi/scan.c:2034) 
[    2.736657] ? acpi_initialize_hp_context (drivers/acpi/scan.c:2004) 
[    2.736657] ? __device_attach (drivers/base/dd.c:819) 
[    2.736657] ? device_bind_driver (drivers/base/dd.c:819) 
[    2.736657] ? acpi_scan_match_handler (drivers/acpi/scan.c:1793 (discriminator 1) drivers/acpi/scan.c:1809 (discriminator 1)) 
[    2.736657] acpi_bus_attach (drivers/acpi/scan.c:2054 (discriminator 9)) 
[    2.736657] ? acpi_initialize_hp_context (drivers/acpi/scan.c:2004) 
[    2.736657] ? __device_attach (drivers/base/dd.c:819) 
[    2.736657] ? device_bind_driver (drivers/base/dd.c:819) 
[    2.736657] ? acpi_scan_match_handler (drivers/acpi/scan.c:1793 (discriminator 1) drivers/acpi/scan.c:1809 (discriminator 1)) 
[    2.736657] acpi_bus_attach (drivers/acpi/scan.c:2054 (discriminator 9)) 
[    2.736657] ? acpi_initialize_hp_context (drivers/acpi/scan.c:2004) 
[    2.736657] ? acpi_add_single_object (drivers/acpi/scan.c:1903) 
[    2.736657] ? acpi_walk_namespace (drivers/acpi/acpica/nsxfeval.c:617) 
[    2.736657] acpi_bus_scan (drivers/acpi/scan.c:2108) 
[    2.736657] ? acpi_bus_check_add (drivers/acpi/scan.c:2099) 
[    2.736657] acpi_scan_init (drivers/acpi/scan.c:2260) 
[    2.736657] ? acpi_match_madt (drivers/acpi/scan.c:2218) 
[    2.736657] ? acpi_table_parse_madt (drivers/acpi/tables.c:386) 
[    2.736657] acpi_init (drivers/acpi/bus.c:1250) 
[    2.736657] ? acpi_bus_init (drivers/acpi/bus.c:1226) 
[    2.736657] ? rcu_read_lock_sched_held (kernel/rcu/update.c:119) 
[    2.736657] ? acpi_bus_init (drivers/acpi/bus.c:1226) 
[    2.736657] do_one_initcall (init/main.c:893) 
[    2.736657] ? initcall_blacklisted (init/main.c:884) 
[    2.736657] ? parse_one (kernel/params.c:173) 
[    2.736657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.736657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.736657] ? rest_init (init/main.c:1068) 
[    2.736657] kernel_init (init/main.c:1073) 
[    2.736657] ? rest_init (init/main.c:1068) 
[    2.736657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.736657] ================================================================================
[    2.780691] ================================================================================
[    2.782157] UBSAN: Undefined behaviour in drivers/acpi/pci_link.c:152:42
[    2.783632] index 1 is out of range for type 'u32 [1]'
[    2.784565] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.784657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.784657] Call Trace:
[    2.784657] dump_stack (lib/dump_stack.c:120) 
[    2.784657] ubsan_epilogue (lib/ubsan.c:162) 
[    2.784657] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.784657] ? acpi_ut_update_ref_count (drivers/acpi/acpica/utdelete.c:470) 
[    2.784657] acpi_pci_link_check_possible (drivers/acpi/pci_link.c:152 (discriminator 1)) 
[    2.784657] ? acpi_pci_link_check_current (drivers/acpi/pci_link.c:105) 
[    2.784657] acpi_walk_resource_buffer (drivers/acpi/acpica/rsxface.c:548) 
[    2.784657] ? acpi_pci_link_check_current (drivers/acpi/pci_link.c:105) 
[    2.784657] acpi_walk_resources (include/acpi/platform/aclinuxex.h:62 drivers/acpi/acpica/rsxface.c:624) 
[    2.784657] ? acpi_rs_match_vendor_resource (drivers/acpi/acpica/rsxface.c:597) 
[    2.784657] acpi_pci_link_add (drivers/acpi/pci_link.c:175 drivers/acpi/pci_link.c:753) 
[    2.784657] ? acpi_device_notify_fixed (drivers/acpi/bus.c:110) 
[    2.784657] ? acpi_scan_match_handler (drivers/acpi/scan.c:1793 (discriminator 1) drivers/acpi/scan.c:1809 (discriminator 1)) 
[    2.784657] acpi_bus_attach (drivers/acpi/scan.c:1991 drivers/acpi/scan.c:2034) 
[    2.784657] ? acpi_initialize_hp_context (drivers/acpi/scan.c:2004) 
[    2.784657] ? __device_attach (drivers/base/dd.c:819) 
[    2.784657] ? device_bind_driver (drivers/base/dd.c:819) 
[    2.784657] ? acpi_scan_match_handler (drivers/acpi/scan.c:1793 (discriminator 1) drivers/acpi/scan.c:1809 (discriminator 1)) 
[    2.784657] acpi_bus_attach (drivers/acpi/scan.c:2054 (discriminator 9)) 
[    2.784657] ? acpi_initialize_hp_context (drivers/acpi/scan.c:2004) 
[    2.784657] ? __device_attach (drivers/base/dd.c:819) 
[    2.784657] ? device_bind_driver (drivers/base/dd.c:819) 
[    2.784657] ? acpi_scan_match_handler (drivers/acpi/scan.c:1793 (discriminator 1) drivers/acpi/scan.c:1809 (discriminator 1)) 
[    2.784657] acpi_bus_attach (drivers/acpi/scan.c:2054 (discriminator 9)) 
[    2.784657] ? acpi_initialize_hp_context (drivers/acpi/scan.c:2004) 
[    2.784657] ? acpi_add_single_object (drivers/acpi/scan.c:1903) 
[    2.784657] ? acpi_walk_namespace (drivers/acpi/acpica/nsxfeval.c:617) 
[    2.784657] acpi_bus_scan (drivers/acpi/scan.c:2108) 
[    2.784657] ? acpi_bus_check_add (drivers/acpi/scan.c:2099) 
[    2.784657] acpi_scan_init (drivers/acpi/scan.c:2260) 
[    2.784657] ? acpi_match_madt (drivers/acpi/scan.c:2218) 
[    2.784657] ? acpi_table_parse_madt (drivers/acpi/tables.c:386) 
[    2.784657] acpi_init (drivers/acpi/bus.c:1250) 
[    2.784657] ? acpi_bus_init (drivers/acpi/bus.c:1226) 
[    2.784657] ? rcu_read_lock_sched_held (kernel/rcu/update.c:119) 
[    2.784657] ? acpi_bus_init (drivers/acpi/bus.c:1226) 
[    2.784657] do_one_initcall (init/main.c:893) 
[    2.784657] ? initcall_blacklisted (init/main.c:884) 
[    2.784657] ? parse_one (kernel/params.c:173) 
[    2.784657] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.784657] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.784657] ? rest_init (init/main.c:1068) 
[    2.784657] kernel_init (init/main.c:1073) 
[    2.784657] ? rest_init (init/main.c:1068) 
[    2.784657] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.784657] ================================================================================
[    2.830426] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
[    2.834520] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
[    2.838467] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
[    2.842348] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
[    2.844657] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
[    2.854700] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    2.854700] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    2.856692] pci 0000:00:02.0: vgaarb: bridge control possible
[    2.857704] vgaarb: loaded
[    2.860064] videodev: Linux video capture interface: v2.00
[    2.861156] pps_core: LinuxPPS API ver. 1 registered
[    2.862113] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    2.863777] PTP clock support registered
[    2.871116] FPGA manager framework
[    2.871116] Advanced Linux Sound Architecture Driver Initialized.
[    2.871116] PCI: Using ACPI for IRQ routing
[    2.873043] PCI: pci_cache_line_size set to 64 bytes
[    2.876731] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    2.876731] e820: reserve RAM buffer [mem 0xbffe0000-0xbfffffff]
[    2.880682] ================================================================================
[    2.880682] UBSAN: Undefined behaviour in include/net/netns/generic.h:46:15
[    2.880682] index 4 is out of range for type 'void *[*]'
[    2.884745] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    2.884745] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.884745] Call Trace:
[    2.888696] dump_stack (lib/dump_stack.c:120) 
[    2.888696] ubsan_epilogue (lib/ubsan.c:162) 
[    2.888696] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    2.888696] tcf_net_init (include/net/netns/generic.h:46 (discriminator 1) net/sched/cls_api.c:2221 (discriminator 1)) 
[    2.888696] ops_init (net/core/net_namespace.c:129) 
[    2.892741] __register_pernet_operations (net/core/net_namespace.c:943) 
[    2.892741] ? setup_net (net/core/net_namespace.c:932) 
[    2.892741] ? ida_alloc_range (lib/idr.c:555 (discriminator 1)) 
[    2.892741] register_pernet_operations (net/core/net_namespace.c:1014) 
[    2.892741] register_pernet_subsys (net/core/net_namespace.c:1056) 
[    2.896684] tc_filter_init (net/sched/cls_api.c:2249) 
[    2.896684] ? blackhole_init (net/sched/cls_api.c:2242) 
[    2.896684] do_one_initcall (init/main.c:893) 
[    2.896684] ? initcall_blacklisted (init/main.c:884) 
[    2.896684] ? parse_one (kernel/params.c:173) 
[    2.896684] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    2.900741] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    2.900741] ? rest_init (init/main.c:1068) 
[    2.900741] kernel_init (init/main.c:1073) 
[    2.900741] ? rest_init (init/main.c:1068) 
[    2.900741] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    2.904686] ================================================================================
[    2.905079] Bluetooth: Core ver 2.22
[    2.905964] NET: Registered protocol family 31
[    2.906797] Bluetooth: HCI device and connection manager initialized
[    2.908740] Bluetooth: HCI socket layer initialized
[    2.908740] Bluetooth: L2CAP socket layer initialized
[    2.909815] NET: Registered protocol family 8
[    2.910653] NET: Registered protocol family 20
[    2.914873] clocksource: Switched to clocksource kvm-clock
[    3.199420] VFS: Disk quotas dquot_6.6.0
[    3.200477] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    3.202341] FS-Cache: Loaded
[    3.203645] pnp: PnP ACPI init
[    3.205665] pnp 00:00: Plug and Play ACPI device, IDs PNP0303 (active)
[    3.207496] pnp 00:01: Plug and Play ACPI device, IDs PNP0f13 (active)
[    3.208932] pnp 00:02: [dma 2]
[    3.209920] pnp 00:02: Plug and Play ACPI device, IDs PNP0700 (active)
[    3.211753] pnp 00:03: Plug and Play ACPI device, IDs PNP0400 (active)
[    3.213538] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
[    3.215301] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
[    3.217082] pnp 00:06: Plug and Play ACPI device, IDs PNP0b00 (active)
[    3.224606] pnp: PnP ACPI: found 7 devices
[    3.268529] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    3.270349] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    3.271432] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    3.272521] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    3.273750] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfffff window]
[    3.274962] pci_bus 0000:00: resource 8 [mem 0x440000000-0x4bfffffff window]
[    3.277680] NET: Registered protocol family 2
[    3.280836] tcp_listen_portaddr_hash hash table entries: 8192 (order: 7, 589824 bytes)
[    3.282897] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    3.285423] TCP bind hash table entries: 65536 (order: 10, 4194304 bytes)
[    3.294841] TCP: Hash tables configured (established 131072 bind 65536)
[    3.296587] UDP hash table entries: 8192 (order: 8, 1310720 bytes)
[    3.299231] UDP-Lite hash table entries: 8192 (order: 8, 1310720 bytes)
[    3.302437] NET: Registered protocol family 1
[    3.303426] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    3.304466] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    3.305549] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    3.306764] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    3.308274] PCI: CLS 0 bytes, default 64
[    3.310000] Unpacking initramfs...
[    3.312102] ================================================================================
[    3.312698] UBSAN: Undefined behaviour in mm/memcontrol.c:512:24
[    3.312698] index 0 is out of range for type 'mem_cgroup_per_node *[*]'
[    3.312698] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    3.312698] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    3.312698] Call Trace:
[    3.312698] dump_stack (lib/dump_stack.c:120) 
[    3.312698] ubsan_epilogue (lib/ubsan.c:162) 
[    3.312698] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    3.312698] memcg_check_events+0x157/0x280 
[    3.312698] mem_cgroup_commit_charge (mm/memcontrol.c:2447 mm/memcontrol.c:6099) 
[    3.312698] ? mark_held_locks (kernel/locking/lockdep.c:2810 (discriminator 1)) 
[    3.312698] ? mem_cgroup_try_charge_delay (mm/memcontrol.c:6079) 
[    3.312698] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:2839 (discriminator 1) kernel/locking/lockdep.c:2884 (discriminator 1)) 
[    3.312698] __add_to_page_cache_locked (mm/filemap.c:892) 
[    3.312698] ? page_cache_tree_insert (mm/filemap.c:855) 
[    3.312698] add_to_page_cache_lru (include/linux/compiler.h:261 (discriminator 5) include/linux/page-flags.h:143 (discriminator 5) include/linux/page-flags.h:273 (discriminator 5) mm/filemap.c:933 (discriminator 5)) 
[    3.312698] ? add_to_page_cache_locked (mm/filemap.c:925) 
[    3.312698] pagecache_get_page (mm/filemap.c:1626) 
[    3.312698] grab_cache_page_write_begin (mm/filemap.c:3135 (discriminator 1)) 
[    3.312698] ? __wait_on_freeing_inode (fs/inode.c:2135) 
[    3.312698] simple_write_begin (fs/libfs.c:440) 
[    3.312698] __page_symlink (fs/namei.c:4971) 
[    3.312698] ? vfs_get_link (fs/namei.c:4959) 
[    3.312698] ? inode_init_owner (fs/inode.c:2031 (discriminator 1)) 
[    3.312698] ? ramfs_get_inode (fs/ramfs/inode.c:94) 
[    3.312698] ? generic_permission (fs/namei.c:299 (discriminator 1) fs/namei.c:341 (discriminator 1)) 
[    3.312698] ramfs_symlink (fs/ramfs/inode.c:137) 
[    3.312698] vfs_symlink2 (fs/namei.c:4243) 
[    3.312698] ? do_name (init/initramfs.c:128 (discriminator 1) init/initramfs.c:351 (discriminator 1)) 
[    3.312698] do_symlinkat (fs/namei.c:4277) 
[    3.312698] ? __x64_sys_unlinkat (fs/namei.c:4258) 
[    3.312698] ? kstrdup (mm/util.c:60) 
[    3.312698] do_symlink (include/linux/syscalls.h:1249 init/initramfs.c:389) 
[    3.312698] write_buffer (init/initramfs.c:412 (discriminator 1)) 
[    3.312698] flush_buffer (init/initramfs.c:424) 
[    3.312698] ? default_rootfs (init/initramfs.c:41) 
[    3.312698] __gunzip (lib/decompress_inflate.c:148 (discriminator 1)) 
[    3.312698] ? do_reset (init/initramfs.c:418) 
[    3.312698] ? bunzip2 (lib/decompress_inflate.c:35) 
[    3.312698] ? __gunzip (lib/decompress_inflate.c:194) 
[    3.312698] gunzip (lib/decompress_inflate.c:194 (discriminator 1)) 
[    3.312698] ? default_rootfs (init/initramfs.c:41) 
[    3.312698] unpack_to_rootfs (init/initramfs.c:482) 
[    3.312698] ? default_rootfs (init/initramfs.c:41) 
[    3.312698] ? do_name (init/initramfs.c:445) 
[    3.312698] populate_rootfs (init/initramfs.c:659) 
[    3.312698] ? unpack_to_rootfs (init/initramfs.c:618) 
[    3.312698] do_one_initcall (init/main.c:893) 
[    3.312698] ? initcall_blacklisted (init/main.c:884) 
[    3.312698] ? parse_one (kernel/params.c:173) 
[    3.312698] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    3.312698] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    3.312698] ? rest_init (init/main.c:1068) 
[    3.312698] kernel_init (init/main.c:1073) 
[    3.312698] ? rest_init (init/main.c:1068) 
[    3.312698] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    3.312698] ================================================================================
[    3.369836] ================================================================================
[    3.371446] UBSAN: Undefined behaviour in mm/memcontrol.c:512:24
[    3.372673] index 0 is out of range for type 'mem_cgroup_per_node *[*]'
[    3.372673] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.19.195-12016-g0b9e593f5fb2 #1
[    3.372673] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    3.372673] Call Trace:
[    3.372673] dump_stack (lib/dump_stack.c:120) 
[    3.372673] ubsan_epilogue (lib/ubsan.c:162) 
[    3.372673] __ubsan_handle_out_of_bounds.cold (lib/ubsan.c:383) 
[    3.372673] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:194 (discriminator 4) include/asm-generic/atomic-instrumented.h:58 (discriminator 4) include/asm-generic/qspinlock.h:85 (discriminator 4) kernel/locking/spinlock_debug.c:113 (discriminator 4)) 
[    3.372673] mem_cgroup_page_lruvec (mm/memcontrol.c:512 (discriminator 1) mm/memcontrol.c:1146 (discriminator 1)) 
[    3.372673] ? pagevec_lru_move_fn (mm/swap.c:206 (discriminator 1)) 
[    3.372673] pagevec_lru_move_fn (mm/swap.c:210) 
[    3.372673] __lru_cache_add (arch/x86/include/asm/preempt.h:81 (discriminator 32) mm/swap.c:419 (discriminator 32)) 
[    3.372673] add_to_page_cache_lru (mm/filemap.c:925) 
[    3.372673] ? add_to_page_cache_locked (mm/filemap.c:925) 
[    3.372673] pagecache_get_page (mm/filemap.c:1626) 
[    3.372673] grab_cache_page_write_begin (mm/filemap.c:3135 (discriminator 1)) 
[    3.372673] ? __wait_on_freeing_inode (fs/inode.c:2135) 
[    3.372673] simple_write_begin (fs/libfs.c:440) 
[    3.372673] __page_symlink (fs/namei.c:4971) 
[    3.372673] ? vfs_get_link (fs/namei.c:4959) 
[    3.372673] ? inode_init_owner (fs/inode.c:2031 (discriminator 1)) 
[    3.372673] ? ramfs_get_inode (fs/ramfs/inode.c:94) 
[    3.372673] ? generic_permission (fs/namei.c:299 (discriminator 1) fs/namei.c:341 (discriminator 1)) 
[    3.372673] ramfs_symlink (fs/ramfs/inode.c:137) 
[    3.372673] vfs_symlink2 (fs/namei.c:4243) 
[    3.372673] do_symlinkat (fs/namei.c:4277) 
[    3.372673] ? __x64_sys_unlinkat (fs/namei.c:4258) 
[    3.372673] do_symlink (include/linux/syscalls.h:1249 init/initramfs.c:389) 
[    3.372673] write_buffer (init/initramfs.c:412 (discriminator 1)) 
[    3.372673] flush_buffer (init/initramfs.c:424) 
[    3.372673] ? default_rootfs (init/initramfs.c:41) 
[    3.372673] __gunzip (lib/decompress_inflate.c:148 (discriminator 1)) 
[    3.372673] ? do_reset (init/initramfs.c:418) 
[    3.372673] ? bunzip2 (lib/decompress_inflate.c:35) 
[    3.372673] ? __gunzip (lib/decompress_inflate.c:194) 
[    3.372673] gunzip (lib/decompress_inflate.c:194 (discriminator 1)) 
[    3.372673] ? default_rootfs (init/initramfs.c:41) 
[    3.372673] unpack_to_rootfs (init/initramfs.c:482) 
[    3.372673] ? default_rootfs (init/initramfs.c:41) 
[    3.372673] ? do_name (init/initramfs.c:445) 
[    3.372673] populate_rootfs (init/initramfs.c:659) 
[    3.372673] ? unpack_to_rootfs (init/initramfs.c:618) 
[    3.372673] do_one_initcall (init/main.c:893) 
[    3.372673] ? initcall_blacklisted (init/main.c:884) 
[    3.372673] ? parse_one (kernel/params.c:173) 
[    3.372673] do_initcall_level (init/main.c:960 (discriminator 3)) 
[    3.372673] kernel_init_freeable (init/main.c:968 (discriminator 1) init/main.c:987 (discriminator 1) init/main.c:1154 (discriminator 1)) 
[    3.372673] ? rest_init (init/main.c:1068) 
[    3.372673] kernel_init (init/main.c:1073) 
[    3.372673] ? rest_init (init/main.c:1068) 
[    3.372673] ret_from_fork (arch/x86/entry/entry_64.S:421) 
[    3.372673] ================================================================================
[    6.949056] Freeing initrd memory: 53496K
[    6.949917] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    6.951072] software IO TLB: mapped [mem 0xb8ba2000-0xbcba2000] (64MB)
[    6.954085] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 10737418240 ms ovfl timer
[    6.955605] RAPL PMU: hw unit of domain pp0-core 2^-0 Joules
[    6.956626] RAPL PMU: hw unit of domain package 2^-0 Joules
[    6.957910] RAPL PMU: hw unit of domain pp1-gpu 2^-0 Joules
[    6.958914] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2c9477ac655, max_idle_ns: 440795235027 ns
[    6.961021] Machine check injector initialized
[    6.964531] Scanning for low memory corruption every 60 seconds
[    6.982262] Initialise system trusted keyrings
[    6.983433] Key type blacklist registered
[    6.984708] workingset: timestamp_bits=45 max_order=22 bucket_order=0
[    7.048795] NILFS version 2 loaded
[    7.053813] OCFS2 User DLM kernel interface loaded
[    7.077340] async_tx: api initialized (async)
[    7.078270] Key type asymmetric registered
[    7.079124] Asymmetric key parser 'x509' registered
[    7.080247] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    7.082581] io scheduler noop registered
[    7.083367] io scheduler deadline registered
[    7.086106] io scheduler cfq registered (default)
[    7.088313] io scheduler mq-deadline registered
[    7.089173] io scheduler kyber registered
[    7.094860] gpio_winbond: chip ID at 2e is ffff
[    7.095800] gpio_winbond: not an our chip
[    7.096718] gpio_winbond: chip ID at 4e is ffff
[    7.097581] gpio_winbond: not an our chip
[    7.108163] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    7.137598] 00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    7.166110] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    7.172887] lp: driver loaded but no devices found
[    7.173837] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is 60 seconds).
[    7.177257] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    7.178492] [drm] Driver supports precise vblank timestamp query.
[    7.182683] [drm] Initialized vkms 1.0.0 20180514 for virtual device on minor 0
[    7.184565] parport_pc 00:03: reported by Plug and Play ACPI
[    7.186239] parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]
[    7.188581] lp0: using parport0 (interrupt-driven).
[    7.201528] mtdoops: mtd device (mtddev=name/number) must be supplied
[    7.202769] L440GX flash mapping: failed to find PIIX4 ISA bridge, cannot continue
[    7.204436] slram: not enough parameters.
[    7.205222] CAN device driver interface
[    7.206052] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[    7.207217] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    9.775278] PCI Interrupt Link [LNKC] enabled at IRQ 11
[   10.463141] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
[   10.464408] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
[   10.466505] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[   10.469660] serio: i8042 KBD port at 0x60,0x64 irq 1
[   10.470763] serio: i8042 AUX port at 0x60,0x64 irq 12
[   10.472108] parport0: cannot grant exclusive access for device parkbd
[   10.473300] hv_vmbus: registering driver hyperv_keyboard
[   10.476860] i2c /dev entries driver
[   10.478106] pps_parport: parallel port PPS client
[   10.479286] parport0: cannot grant exclusive access for device pps_parport
[   10.480544] pps_parport: couldn't register with parport0
[   10.489512] applesmc: supported laptop not found!
[   10.490471] applesmc: driver init failed (ret=-19)!
[   10.496351] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[   10.501313] ledtrig-cpu: registered to indicate activity on CPUs
[   10.503737] hv_vmbus: registering driver hv_balloon
[   10.508309] ================================================================================


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240606/202406061501.51f78041-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

