Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886331E47C8
	for <oe-lkp@lists.linux.dev>; Tue,  7 Jan 2025 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254904; cv=fail; b=dX5g7DEjKQOsrwEvIONLJy4x/z1ZKJvhpSOMxJ8Nsooq5zCU77XvoxnV/iwvmkM0VEbbImJ66uKsSSZIzaxEJYEXC+0JglxNd5pwwXk6dToSuYwEl4K2Y0meb+eB57qwtVnUIoFiigwvj3ySOFIVqjCyUQl+Yc3rZZI6aBTWk4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254904; c=relaxed/simple;
	bh=sSgZ3Pry8wNyygEgj6jRAUOpzPF5KWSqI66dIeRhU88=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GeJNTMg7M3AglEeeMxZHsvmNAElLSNML760VK+UYj9J/VvjJJdJbj8AFxXeKpD0wqfcdTaF4Ks6FvB2vTYm2rq0InNN90QdCXyyGfUEzWP5gVWKBLIEYKmEZp4/n4G8vJ7ADfWyqlpVQS1poSguPY0/SHgqO0W0a9cIBGmihLQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBFhN+d9; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBFhN+d9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736254901; x=1767790901;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=sSgZ3Pry8wNyygEgj6jRAUOpzPF5KWSqI66dIeRhU88=;
  b=QBFhN+d9CdB0i3IQIJUpXVR5sGPS786OCoGoU4Vusqwqs4H/skadN4it
   F9HqRFzU314pbdn77ISqzEMhZXrflmXuTu/1MPKtIKbz7HJwHN7KPy5K5
   nWK3M+9Tjw4uw6i07g6JE36tPY4tKUGcupKa5LJQeSB9e7pSoty3Xclyj
   EO6dnJnLxDwh+X+M4a+THLuxCb6McwKZ30P86YTBq90XCRl11lY21XX2j
   ABFOda9g9qDIo7M7nZnFpxTObxPbMhqCY9meXAAJu3Fc0SBEGC8TXL4Z8
   mcMI8+VsxPHklhphsjP9B4tTI4dEN0l2AiQ6Pj+I/zKHHRZYIcqAEKZEK
   g==;
X-CSE-ConnectionGUID: 4otZu+GCQ2Sk+GgtxMA7ig==
X-CSE-MsgGUID: 3c5rCXQGTceq/q1SpoRomg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39261204"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="39261204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 05:01:40 -0800
X-CSE-ConnectionGUID: Q5Y72O7hTpy56lvTMWPIBA==
X-CSE-MsgGUID: wv4DC80eTeCZi6WT6qortQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126057039"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2025 05:01:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 05:01:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 05:01:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 05:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9WaTuGYTh2cG8OtikZC1Ic3f/EM+XlxkQi84ufKfmet/0IijyN6oS0oxHeuNpRemTp3bxNDjkk+7GLANMCaQUzSlGSYHoTnmHtrtUdc0MT0DJJa0C6niIxfcUHaSYMYhb9Ms6/6p9YJxkOgOAKXspDqiTz8LJ83qm8hSg/1/STKBxNy5Xj5WNSSpsIVXnLfDYHioLmGxkBspSwDsPfnSQBq+u3tedrP1jOlCnajlit0/hdd89avgMlMmxoWbnPIDgcvLmZahQ6mDcIZp/vEulUnUGXRFwnwNQgLhUdQvfxfrc0Py6TUv6T0RXhWwWwalshQzrKNU9dJVkOrJCvskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfEnSTSmwXdHnnvwaZCYTJ2D6QofLIq4gF7wsjUJx1k=;
 b=v80uwrS/rtsg++09oETFfUJWTsjJ4RaxpSSCOW9SrecMkaVdmldNrKHeaoDFl+Rfs/sGYhecFuR33Mjx3qDWS/OIxZb8zK+yRaVQnzD2d4GV5Y3lkYDxO5fue9DNUHU1NXuh97FFw/dC5SlkklrJabvfZwOYhUrlaRhRgmsWs2FnQF6ZYNP5QlOHxYs4zglbyhA+1sDdj6XIIwIxt25hM9b/sny52tHl3a1oLZP15q/nKSEE1uN3p5OJlfswVIyKnR8l2Qp14pud1zcubZJybNhig89SYASqFzkXyUBLMgP58R9sOGz4qja0q9UjAbKKFs26vIcWwn9y4CS165Ihwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 13:01:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 13:01:36 +0000
Date: Tue, 7 Jan 2025 21:01:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  61b82dfb6b:  aim7.jobs-per-min 2.1%
 improvement
Message-ID: <202501072048.6f381b3a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcfe420-3d4b-444c-33d6-08dd2f1b6b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TbQxghdM7mR8y0fBgtz7iYPAqkKA0O9L3gLXbXpEEEl7R2F6E1ZpHrqdMy?=
 =?iso-8859-1?Q?kYA+SyW/lcg6UWkbZcSqI/F5IUJFruiTo8pPlzYYsVBy6zV3hUFptDs8a/?=
 =?iso-8859-1?Q?QvmGukQvKor1lfdbKGku22UroFkiHxF4oOa6wAaElDaiPWLQEOHdeFzZxO?=
 =?iso-8859-1?Q?dfaTBCDguYLHipmHw71B0rAsakmob3TBliD5/3tQ0LlvboMcz2h0+k8918?=
 =?iso-8859-1?Q?IbygXlBuBXQ0a1wGyX/MMjKnK/Wx/Fy49x2nvd9Q0WWmepZkBDit2w+o21?=
 =?iso-8859-1?Q?W4xG5k9oxmqyeCYSAFsgCuy1nSheCX+zbFM8kI8YiG53y6IOtPpEC5M4yk?=
 =?iso-8859-1?Q?0zaKzckYD35ki4440tmwWe5r2UN+c1FlAMWSmMoElM1CHDvX8fyfr6edUq?=
 =?iso-8859-1?Q?HCgE3OO2pHx5fTXwwlWBNJS1DKg08sHBqkQirsuLKdgzx4KV2UZAV2BMge?=
 =?iso-8859-1?Q?9CGLKeBBxwpo+kwLIElLMPnP2niwZohT5K5vhkwRbHwQbxBELXTf1xiBas?=
 =?iso-8859-1?Q?mJ2gVcQNyA8LDpP3sqqrQAjjASkEQwpXacK4fNQj5IE6kmoBJgV9k3cpTE?=
 =?iso-8859-1?Q?YyfAVeWX9cfwi0njCaF7Tj1h0seOfzPfkql1XNS6uiYUnpdpOkPdFKZvCl?=
 =?iso-8859-1?Q?fnRauoYEmWH590X/g367tkVrb1V+seOJ2cJSyb8IV6zbsKNI6MD+2eVQI0?=
 =?iso-8859-1?Q?+6TXKDUj4Zlc4eXfCsKpWmpV8xFUFYPPD9oZEZPyObGsrSi2cQ5009ln1H?=
 =?iso-8859-1?Q?o5m8aIgqmb7WeC24vyLVdeREuWgwY5HZiq+7mwNPO7hzLmI/jy1bxOl3aG?=
 =?iso-8859-1?Q?UhpvnwBbDrvnJ3QNudnwzCbIrlVESlI+XGfEYRzmX6KU1xM8MTIPfvozI9?=
 =?iso-8859-1?Q?Glxi53shwUK5m8Asoh8ZlS8ROWXI1Y0iVG/UGYbB5qZTwO9quMQJTCQvoP?=
 =?iso-8859-1?Q?ad4DIbulAZud/sjlNnsB7XOssN3ThF1eHqIX2gGt+lJiXV3AkaYtrgK/OV?=
 =?iso-8859-1?Q?R/XfDP4v+25m7K38g0kvrtlEFbvovmO5SGu0p4GtTuD/BRA6nKuHXVajOl?=
 =?iso-8859-1?Q?+ACGJKlwHZQkl0LxFxuH/toFinm4fPgqbj6rezDvgjq7V9Em3FK+VzwJgI?=
 =?iso-8859-1?Q?WMsuoAOV4eG96Z38dgyoDnf3gmns0jyGLofrzaIFGxDCwPgQira1hdF3yd?=
 =?iso-8859-1?Q?dLedZWIqEpryvidS15DQnY7Us5z1SJfH+OyPZK+4StwO1IRoJTo1R0/yRO?=
 =?iso-8859-1?Q?veijeqKabw3/RkZ0FLGs+EnmeTI9q1Jv3RgyCQE4CvTukgg7H1F5Mh6vIg?=
 =?iso-8859-1?Q?jRcuJLVrIwsgzIWLI1gUa3t6xfQK5tiJ42KRzROZX4JGQAHBunbwDFM6rz?=
 =?iso-8859-1?Q?qEADs6s87pUiKTcwzfKVmhpdzoDnxFmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qw3ca3BaJVttBMjfpEBJ1W54yKjjWDFbpwimH+K0CkMLR0tCqrdU3PXFy9?=
 =?iso-8859-1?Q?ONcqXnz0YNCPkjD7qjXJCz9pEQ1tMNTdNuFktLeIUX8tHv9x6Ij03epP1U?=
 =?iso-8859-1?Q?nJ9PMC/QOREanI0M/2f3GkY7iJarZXH+f09tq4lzyXVJbuTLlT7lmnU+Me?=
 =?iso-8859-1?Q?Bdh2Spgxf425ZtOT0aPZRkXmGpVae0B/IuTP5N84Cpk2qGCrsyy/l7cipg?=
 =?iso-8859-1?Q?O47XsOxeXoQAYu63WO0rZbuadduFgn5pwhKkeSqkGXWcCX1K2sqJ0HwmW7?=
 =?iso-8859-1?Q?55qRK+OdxURlqjFzu5r4qllxkfKUI4ZVf5mXf9rkA3Jof7oMTnZ2ciiVJi?=
 =?iso-8859-1?Q?KoMk2G+6xqtgsChHAu58ci3YzA40NEHmYYJtv61ePsqRhBi84oJuNycYDw?=
 =?iso-8859-1?Q?5hVofNOqhJNMvC+WIxsq4376VUu8YqNCJ/1zC/j7zLvVOf5fqnbTW6SRdP?=
 =?iso-8859-1?Q?NTSjLJHa2LgyfYgq2450GCxjAHmZLEZmPFrIcoyF+4iJv7noSyFTupdgRw?=
 =?iso-8859-1?Q?E0AqubwCHQ+nOZZRZT+LzSZw0eQPe2nyJlB+X6OVLoM2Od23xfJXW0IrAC?=
 =?iso-8859-1?Q?eFWcx2iM98D7/gw1KxGSqOvKkKaKOfX5Dr8WvhMzEEsSoJDU5GPLtN6610?=
 =?iso-8859-1?Q?guEg1nvbrmhlZihcoLvPZSPxOQYRxfcAr2svecw6hWEIccU+inWhy+KRGS?=
 =?iso-8859-1?Q?ctaUBxEYClOoVtiQu/a+euMMLQdcezhmVgXV7O8divVpnNDQ8sW8Nwbp5X?=
 =?iso-8859-1?Q?fL7x227juUCLx63R6oPA0cJ4dJ2uCIqhp0lBLdeLiWWjUkkszBm7KNfgaV?=
 =?iso-8859-1?Q?NPlHrjLX2pcKHKMAVh3dNcGSmY99+6kmy6oWbGxXm4YsQc2gvdl+4ipZ74?=
 =?iso-8859-1?Q?1EGaY7DLOaf7dE45VA9Hl4MOZCeCYv+alJbPeXUjmImvaOGY139LMGRf12?=
 =?iso-8859-1?Q?Ewz4gOvZTDmY5Kwh8fpFsV5GoNzwXn+ZWmAxyFe+HxdoveZuAhFmKbFFvm?=
 =?iso-8859-1?Q?bSGw2NmhdYlSRHwKku53DwaQMAQxtzQkTRICiRxOGY3HSkUujtKlmuzjb4?=
 =?iso-8859-1?Q?oNwsF57bQSyIIOyRfhgJ+YcxOrDPe1FOCh9dqTH1Fh6OI5dsDVirOi/YVD?=
 =?iso-8859-1?Q?2EVqPx9RveID7NtZwrqc5qhDnwiKBaxajwO4o9PgFdsS1+CeFrXZqLWKkd?=
 =?iso-8859-1?Q?tZWrPAeWvRjkXrCb7DT3H5rV5quE9BoTMP6oOX2TdbZ+3XS0SLgwuc9ctV?=
 =?iso-8859-1?Q?xeQZFlzHiv18/H2pQXTemeladpB6wVgtRp/XNIAlkYv/8kvbRdCRB0p/wy?=
 =?iso-8859-1?Q?bttXzs4G+8hb4BOHe5zvku76XgmiFY7PtIgLlukQqcxvyCLTpkeEjZ2ox8?=
 =?iso-8859-1?Q?YRIvCxoUNEuyEEbh3HFonoFdpY0p0yz8oeH7ycWLxlD08DEKeFa8DTlcfx?=
 =?iso-8859-1?Q?uTdwGYbDXPVUcHg4GS1bttX8gnk5iNVjU00BT3LXPASR2N8pwQOjNgEcxr?=
 =?iso-8859-1?Q?hoMhhr4IcQf8AmvlJR75XogVCFjrCp7k0XW9v7zZLj/4HLwgJS6jWFEa1c?=
 =?iso-8859-1?Q?UXdkQGSf4pt/pY5UcKXXxEK1XiIXQbfR7Kt5gHorbwOfLNBYshCVqg7Fd5?=
 =?iso-8859-1?Q?dx4i6Ty1yxjTxPn8pKY7M4tLAZCMYmVjs//o0pMqtBWnqEmNflZZgQsA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcfe420-3d4b-444c-33d6-08dd2f1b6b48
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 13:01:36.8098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2+tWqZYh+Ln5rgWwuu/7xUJCkGjL1BWYuqjKwowXAb/WF/jgxK2zO4n4R8VxR8JYUJrJlhizFYfWlyOH6GXTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.1% improvement of aim7.jobs-per-min on:


commit: 61b82dfb6b7e1f951fd1e95198a2aee2ccf6a167 ("sched/fair: Do not try to migrate delayed dequeue task")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: aim7
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	disk: 1BRD_48G
	fs: xfs
	test: sync_disk_rw
	load: 600
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250107/202501072048.6f381b3a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1BRD_48G/xfs/x86_64-rhel-9.4/600/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/sync_disk_rw/aim7

commit: 
  736c55a02c ("sched/fair: Rename cfs_rq.nr_running into nr_queued")
  61b82dfb6b ("sched/fair: Do not try to migrate delayed dequeue task")

736c55a02c477ad3 61b82dfb6b7e1f951fd1e95198a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.05 ± 31%      +0.2        0.20 ±140%  mpstat.cpu.all.iowait%
     21.83 ± 18%     -51.5%      10.58 ± 79%  sched_debug.cfs_rq:/.load_avg.min
     38.33            +1.9%      39.07        iostat.cpu.idle
     60.71            -1.5%      59.80        iostat.cpu.system
     47551            +2.1%      48556        aim7.jobs-per-min
      7398            -2.0%       7250        aim7.time.percent_of_cpu_this_job_got
      5583            -4.1%       5357        aim7.time.system_time
  34860959            -1.5%   34349280        aim7.time.voluntary_context_switches
      1.91            +2.6%       1.96        perf-stat.i.MPKI
 1.319e+08            +2.1%  1.347e+08        perf-stat.i.cache-misses
    837578            +1.7%     851427        perf-stat.i.context-switches
 2.132e+11            -1.6%  2.099e+11        perf-stat.i.cpu-cycles
    177061            -3.6%     170730        perf-stat.i.cpu-migrations
      0.45 ±  2%      +2.4%       0.46        perf-stat.i.ipc
      2.13            +2.8%       2.19        perf-stat.overall.MPKI
      1618            -3.6%       1560        perf-stat.overall.cycles-between-cache-misses
 1.301e+08            +2.2%  1.331e+08        perf-stat.ps.cache-misses
    826542            +1.7%     840923        perf-stat.ps.context-switches
 2.106e+11            -1.4%  2.077e+11        perf-stat.ps.cpu-cycles
    174640            -3.5%     168471        perf-stat.ps.cpu-migrations
 4.691e+12            -2.2%  4.587e+12        perf-stat.total.instructions
      0.27 ±  6%     -15.9%       0.22 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter
      0.14 ± 76%     -99.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
      0.08 ±  2%     -14.7%       0.07 ±  2%  perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
      0.08 ±  4%     -14.3%       0.07 ±  3%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_workqueue.xlog_cil_push_now.isra
      0.01 ± 52%     -52.7%       0.01 ± 26%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.16 ± 85%     -99.8%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
      1.62 ± 45%     -53.6%       0.75 ± 14%  perf-sched.sch_delay.max.ms.__cond_resched.writeback_get_folio.writeback_iter.iomap_writepages.xfs_vm_writepages
      0.02 ± 15%    +130.5%       0.04 ± 58%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.21 ±105%     -88.3%       0.02 ± 64%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.07 ±  4%     -12.0%       0.06 ±  2%  perf-sched.total_sch_delay.average.ms
    750.06 ±  6%     -11.1%     666.52 ± 18%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    168.85 ±141%    +205.4%     515.61        perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
     31.35 ±  7%     -10.6%      28.01        perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    832.00 ± 17%     +20.6%       1003 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2113 ± 10%     +15.7%       2445 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     75.84 ± 18%     -14.9%      64.53 ±  4%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.__flush_workqueue.xlog_cil_push_now.isra
    168.85 ±141%    +205.4%     515.61        perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
      1.15 ±  9%     -33.4%       0.77 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.96 ± 17%     -25.9%       0.71 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.writeback_get_folio.writeback_iter.iomap_writepages.xfs_vm_writepages
    168.85 ±141%    +205.4%     515.61        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
     31.35 ±  7%     -10.6%      28.01        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      9.88 ±118%     -76.9%       2.28 ± 55%  perf-sched.wait_time.max.ms.__cond_resched.writeback_get_folio.writeback_iter.iomap_writepages.xfs_vm_writepages
    168.85 ±141%    +205.4%     515.61        perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call.do_syscall_64
    226.05 ±153%     -70.8%      65.98 ±  4%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__flush_workqueue
    333.54 ±141%    -100.0%       0.02 ± 64%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     70.43            -1.1       69.31        perf-profile.calltrace.cycles-pp.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq
     68.32            -1.1       67.21        perf-profile.calltrace.cycles-pp.osq_lock.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq
     74.65            -1.0       73.63        perf-profile.calltrace.cycles-pp.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync
     81.36            -1.0       80.34        perf-profile.calltrace.cycles-pp.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write
     75.60            -1.0       74.61        perf-profile.calltrace.cycles-pp.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write
     77.63            -1.0       76.66        perf-profile.calltrace.cycles-pp.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write.vfs_write
     90.80            -0.4       90.38        perf-profile.calltrace.cycles-pp.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
     93.24            -0.3       92.92        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     93.52            -0.3       93.20        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     93.27            -0.3       92.95        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     93.52            -0.3       93.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     93.12            -0.3       92.81        perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     93.75            -0.3       93.44        perf-profile.calltrace.cycles-pp.write
      0.52            +0.0        0.56        perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_do_entry
      0.64            +0.0        0.68        perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.96            +0.0        1.00        perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      1.24            +0.0        1.29        perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      0.88            +0.1        0.93        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.85            +0.1        0.92 ±  4%  perf-profile.calltrace.cycles-pp.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread
      1.10 ±  5%      +0.1        1.17 ±  3%  perf-profile.calltrace.cycles-pp.__folio_end_writeback.folio_end_writeback.iomap_finish_ioend.iomap_finish_ioends.xfs_end_ioend
      1.31 ±  3%      +0.1        1.40 ±  2%  perf-profile.calltrace.cycles-pp.iomap_finish_ioends.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread
      1.29 ±  3%      +0.1        1.38 ±  2%  perf-profile.calltrace.cycles-pp.folio_end_writeback.iomap_finish_ioend.iomap_finish_ioends.xfs_end_ioend.xfs_end_io
      1.31 ±  3%      +0.1        1.40 ±  2%  perf-profile.calltrace.cycles-pp.iomap_finish_ioend.iomap_finish_ioends.xfs_end_ioend.xfs_end_io.process_one_work
      1.54            +0.1        1.63        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.55            +0.1        1.64        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.60            +0.1        1.70        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.62            +0.1        1.71        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      2.06            +0.1        2.16        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.94            +0.1        2.05        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      0.42 ± 44%      +0.1        0.54        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt
      2.46            +0.1        2.58        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      2.46            +0.1        2.59        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      2.46            +0.1        2.59        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      2.49            +0.1        2.62        perf-profile.calltrace.cycles-pp.common_startup_64
      2.18 ±  2%      +0.2        2.33 ±  2%  perf-profile.calltrace.cycles-pp.xfs_end_io.process_one_work.worker_thread.kthread.ret_from_fork
      2.17 ±  2%      +0.2        2.32 ±  2%  perf-profile.calltrace.cycles-pp.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread.kthread
      2.92            +0.2        3.08 ±  2%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.22            +0.2        3.38        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.23            +0.2        3.40        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      3.23            +0.2        3.40        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      3.23            +0.2        3.40        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      3.58 ±  5%      +0.2        3.83 ±  3%  perf-profile.calltrace.cycles-pp.__folio_end_writeback.folio_end_writeback.iomap_finish_ioend.__submit_bio.__submit_bio_noacct
      3.71 ±  5%      +0.3        3.97 ±  3%  perf-profile.calltrace.cycles-pp.folio_end_writeback.iomap_finish_ioend.__submit_bio.__submit_bio_noacct.iomap_submit_ioend
      3.74 ±  5%      +0.3        4.00 ±  3%  perf-profile.calltrace.cycles-pp.iomap_finish_ioend.__submit_bio.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages
      4.46 ±  4%      +0.3        4.75 ±  2%  perf-profile.calltrace.cycles-pp.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc
      4.41 ±  4%      +0.3        4.70 ±  2%  perf-profile.calltrace.cycles-pp.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages.do_writepages
      4.40 ±  4%      +0.3        4.69 ±  2%  perf-profile.calltrace.cycles-pp.__submit_bio.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages
      8.96 ±  5%      +0.6        9.55 ±  3%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync
      9.01 ±  5%      +0.6        9.60 ±  3%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write
      8.92 ±  5%      +0.6        9.51 ±  3%  perf-profile.calltrace.cycles-pp.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      9.02 ±  5%      +0.6        9.61 ±  3%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write.vfs_write
      8.94 ±  5%      +0.6        9.53 ±  3%  perf-profile.calltrace.cycles-pp.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range
      9.28 ±  5%      +0.6        9.88 ±  3%  perf-profile.calltrace.cycles-pp.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write
     70.43            -1.1       69.31        perf-profile.children.cycles-pp.__mutex_lock
     68.34            -1.1       67.23        perf-profile.children.cycles-pp.osq_lock
     74.66            -1.0       73.63        perf-profile.children.cycles-pp.__flush_workqueue
     81.36            -1.0       80.34        perf-profile.children.cycles-pp.xfs_log_force_seq
     75.60            -1.0       74.61        perf-profile.children.cycles-pp.xlog_cil_push_now
     77.64            -1.0       76.66        perf-profile.children.cycles-pp.xlog_cil_force_seq
     90.80            -0.4       90.38        perf-profile.children.cycles-pp.xfs_file_fsync
     93.30            -0.3       92.98        perf-profile.children.cycles-pp.ksys_write
     93.27            -0.3       92.95        perf-profile.children.cycles-pp.vfs_write
     93.13            -0.3       92.81        perf-profile.children.cycles-pp.xfs_file_buffered_write
     93.82            -0.3       93.51        perf-profile.children.cycles-pp.write
     93.81            -0.3       93.51        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     93.78            -0.3       93.49        perf-profile.children.cycles-pp.do_syscall_64
      0.20            +0.0        0.21        perf-profile.children.cycles-pp.writeback_iter
      0.31            +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.iomap_write_begin
      0.69            +0.0        0.71        perf-profile.children.cycles-pp.ttwu_do_activate
      0.35            +0.0        0.37        perf-profile.children.cycles-pp.iomap_write_end
      0.55            +0.0        0.58        perf-profile.children.cycles-pp.sched_ttwu_pending
      0.64            +0.0        0.66        perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.65            +0.0        0.68        perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.79            +0.0        0.82        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.96            +0.0        1.00        perf-profile.children.cycles-pp.iomap_write_iter
      1.24            +0.0        1.29        perf-profile.children.cycles-pp.iomap_file_buffered_write
      1.18 ±  2%      +0.1        1.23 ±  2%  perf-profile.children.cycles-pp.__xfs_trans_commit
      1.48            +0.1        1.54        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.85            +0.1        0.92 ±  4%  perf-profile.children.cycles-pp.xfs_iomap_write_unwritten
      1.31 ±  3%      +0.1        1.40 ±  2%  perf-profile.children.cycles-pp.iomap_finish_ioends
      1.57            +0.1        1.66        perf-profile.children.cycles-pp.acpi_idle_enter
      1.57            +0.1        1.66        perf-profile.children.cycles-pp.acpi_safe_halt
      1.63            +0.1        1.72        perf-profile.children.cycles-pp.cpuidle_enter_state
      1.64            +0.1        1.73        perf-profile.children.cycles-pp.cpuidle_enter
      1.57            +0.1        1.66        perf-profile.children.cycles-pp.acpi_idle_do_entry
      2.08            +0.1        2.19        perf-profile.children.cycles-pp.cpuidle_idle_call
      2.49            +0.1        2.62        perf-profile.children.cycles-pp.do_idle
      2.46            +0.1        2.59        perf-profile.children.cycles-pp.start_secondary
      2.49            +0.1        2.62        perf-profile.children.cycles-pp.common_startup_64
      2.49            +0.1        2.62        perf-profile.children.cycles-pp.cpu_startup_entry
      2.17 ±  2%      +0.2        2.32 ±  2%  perf-profile.children.cycles-pp.xfs_end_ioend
      2.18 ±  2%      +0.2        2.34 ±  2%  perf-profile.children.cycles-pp.xfs_end_io
      2.92            +0.2        3.08 ±  2%  perf-profile.children.cycles-pp.process_one_work
      3.24            +0.2        3.40        perf-profile.children.cycles-pp.ret_from_fork
      3.24            +0.2        3.40        perf-profile.children.cycles-pp.ret_from_fork_asm
      3.23            +0.2        3.40        perf-profile.children.cycles-pp.kthread
      3.22            +0.2        3.39        perf-profile.children.cycles-pp.worker_thread
      4.46 ±  4%      +0.3        4.75 ±  2%  perf-profile.children.cycles-pp.iomap_submit_ioend
      4.46 ±  4%      +0.3        4.75 ±  2%  perf-profile.children.cycles-pp.__submit_bio_noacct
      4.46 ±  4%      +0.3        4.74 ±  2%  perf-profile.children.cycles-pp.__submit_bio
      4.68 ±  5%      +0.3        5.01 ±  3%  perf-profile.children.cycles-pp.__folio_end_writeback
      5.00 ±  5%      +0.3        5.34 ±  3%  perf-profile.children.cycles-pp.folio_end_writeback
      5.05 ±  5%      +0.3        5.40 ±  3%  perf-profile.children.cycles-pp.iomap_finish_ioend
      8.96 ±  5%      +0.6        9.55 ±  3%  perf-profile.children.cycles-pp.do_writepages
      9.01 ±  5%      +0.6        9.60 ±  3%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      9.02 ±  5%      +0.6        9.61 ±  3%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      8.94 ±  5%      +0.6        9.53 ±  3%  perf-profile.children.cycles-pp.xfs_vm_writepages
      8.92 ±  5%      +0.6        9.52 ±  3%  perf-profile.children.cycles-pp.iomap_writepages
      9.28 ±  5%      +0.6        9.88 ±  3%  perf-profile.children.cycles-pp.file_write_and_wait_range
     67.44            -1.1       66.35        perf-profile.self.cycles-pp.osq_lock
      0.21            +0.0        0.22        perf-profile.self.cycles-pp.iomap_set_range_uptodate
      0.64            +0.0        0.66        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.75            +0.0        0.79        perf-profile.self.cycles-pp.acpi_safe_halt




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

