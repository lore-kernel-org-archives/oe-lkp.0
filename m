Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7482D3A7B
	for <oe-lkp@lists.linux.dev>; Fri, 28 Nov 2025 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764313193; cv=fail; b=NOp+qkXC0TI+SPqcL8HVxgqoyjDKoCPVYv3n2E5ySZazmPMp1xmHQHs4dJt/P0pUWYztuuHUY3IAMjy3fqB9RT1DZESH1Kx0imiJfffjZEYkZQHyD9ImHw7jp92oTzdpLNraZw5wHP8EA84mdy3ZdJXEcj2D3qCAEpSt+AXWZIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764313193; c=relaxed/simple;
	bh=yrMjSoJT/zCIvP5le/jjq3zfWlgaqrZFkd0h0qFCoM0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=d/6zZsWurUxh/lU88cucaq6yv6XLQXyhMX3PiKnvYLXgTKzuil0SveXzyRRHCULIK8SQarmPI6z9i/pP+6wXNBcg5mkGnkAmXv3Yx9VhVkH6jFg5C7S2EQ291AWQBisRWTGmnWFuVRUsIWZwDJ8jNs+34Fz0efp1ykhMJl3n+l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfcMLwY2; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfcMLwY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764313191; x=1795849191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrMjSoJT/zCIvP5le/jjq3zfWlgaqrZFkd0h0qFCoM0=;
  b=LfcMLwY2/+kPtQudAKwfZfyspeS6Hk3yuLcdGjGuSk74ZVP95Au/cCuz
   v3QYFFADsv3y1OChO7HXoovfgagBiHfcBnHgK1xE+xr/4wZMqGksT6ue/
   pd8Z3wrAecUDNGOq65lXe10gqvs2X/HCTXTlwzgGMaJHB6hniyp0S88Ye
   Dou+y1RAyX8+ET73EXhfatYM7cor4dujFm/Oouh/qb+axIKO0io+ehoW5
   lGq2d4YtY72hFg3fyUkiMWQCrnBo8rwCkY0zfi7Wf/FzEtr89nyj68cLi
   +OdF6ROr3oyE0rSIy31KbLM+24sr7MNdQaAVgws6i7vRpoCcGZkT9JIP/
   g==;
X-CSE-ConnectionGUID: djBWzM62RcyyvotMMW7gog==
X-CSE-MsgGUID: IMtVRrg5Q9uehQuHZYH3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66243443"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66243443"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:59:51 -0800
X-CSE-ConnectionGUID: F4WwHyXlSbaq68e5U0VMnQ==
X-CSE-MsgGUID: gU77ycrARZy6/3JULwZbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="230674052"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:59:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:59:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 22:59:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:59:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEzuZcGStNK4wASybagibm3/LR4KALUY6eV1JMijDoqfZoTlZhCag8a1vijGCMY73Mmgl0+OU4UrlULq8/Mvja6PyH2nfu6BmBebRYfo70wA0/xLe0qDUUmG4l3KAC5zgapzoofzveXsstc29il4D+Riy98qY6X2UQTQfewX9bsPTlgnAsoj+T3oZuTxyghJn7/Nbgr1Ymzvo71h5v9WbqILcbeAaD6pee6E441bs09SkhIe9+OtSQ0/wFv7onJmUmhLVLAAEnVQoDwLqJiKmw8imLhHsWJehffWanZ3jIBJF/AfJBqEMO/3+817RqwdRR6hF8IKwjXE5tkKyX3DRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zmhclcj5espmvTK1YlQmT9eDOZfcAUNHWiFHJQXz3uw=;
 b=jKK9Vk3SWjImfW9Yzs3BuPwrzPxFXagCWLNw29etixahbhjW6stPQSIQ+J5HtShFKxFNk/uSOXvBtHaFKjLPk9U0KLs7+88rh7YKhDcg5Q6HBZKXNMxhodBa66kNDQ1orcppLK2wp0UvxswPc71e7basl76tqb4uEpr873rjB9KIGluWrSXws4jWsdn5K+6pNzTR23kO70p/2Drj4BdWsyvULXpA+S8jMfEKHQISZpW9Da2fgy3NpU8OPE8XUkOeIG6kHwwLWRa+s5pcEuHWGfyqoU6VmaK1OhISEQyjd6oHu9ucJZeafJHe1O9ADYw9EyMjB3KE+sLa91hVL0ZfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 06:59:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 06:59:46 +0000
Date: Fri, 28 Nov 2025 14:59:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [ardb:lockless-random] [random]  c0aebac6f3:
 UBSAN:array-index-out-of-bounds_in_drivers/char/random.c
Message-ID: <202511281452.35e03947-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ea9d37-2794-40b4-e983-08de2e4bb714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QBnxyHdonX7lCEaxntiF8LERn+2Ue+OTOirpeh8waz6ZeGmYRt1GmYXN8QbS?=
 =?us-ascii?Q?ZBYSFAW8YUn/hw6EHFGUx4i+XxOxWB8moJ+akWcuzTSyTIDHJqD94hUhc/va?=
 =?us-ascii?Q?Y3byvLUF8trV8adKHqlv/EAIuvQ7BDejzWgUa8Ve1hQDGRVZvcDAArnGT7w8?=
 =?us-ascii?Q?nnMvR+VDSP0xGVD7QlSPN88pLB7XNNmXSPeneQ6j529JU6dRGP2OyQbutsOV?=
 =?us-ascii?Q?LAswpdRJydfLpXiQYZ+TQGTTdz49WWcWIdfspTbYJLTeYV09nPD47oSJsfKM?=
 =?us-ascii?Q?sfi/SxhGp6r2YMm34/l+hj9X9zB02RbAz7UNQjQdtagFnam8tDesS1gPmx45?=
 =?us-ascii?Q?1IN21VBQeWnqzlHssXjWVQ3VN9nXXgxACHiysPKlifA44pHx5j7iQ06ez1M6?=
 =?us-ascii?Q?DLOXlv1napGROxvdAIwGpWPU80CrJ0zNxeUy/y00c2Wzwr+awzg5zHxNfQeK?=
 =?us-ascii?Q?/2UHPZ0FS7efDvWr2zbOF6zyzPSFlkV3ZVfq1hSSpU28wwpK3MYt/1siAC8X?=
 =?us-ascii?Q?0KxoVvGgCK4Mt9viLbL4Rt9qDiKnyObo7+mjejhWodUHAqwwQluE4xNVUM0h?=
 =?us-ascii?Q?9SWApbUrWGP07mKGALjm4BUvpby9xzvBQRGQuMQoDpWGtHeClEcAqomsGQ3v?=
 =?us-ascii?Q?X9u4wn+sVgPwqSV/WohjBNqFDbizbSV9qc09JvlRiz2y1pJTrEiG6iPOXoxA?=
 =?us-ascii?Q?6OuSyhvVfu62raByTEPB5GZOp3csRCuNd0sT9wfIIZZnm5zKOhLFOlc0BfHf?=
 =?us-ascii?Q?T5vsRAWF90/YU2n4xYBbc7J8YBlvTMPWQ1tnAYN1ymCOpWV+MHUpoiJitCPX?=
 =?us-ascii?Q?pcGGcTLjXGip1qCsaPjjCgG/J7xnNxMcdOdqPRzs7goYFo7MsOYfLvR3pr7E?=
 =?us-ascii?Q?ikbFCRhKMRJgsssMvcCHF8o4flfX7jsrXlp1jARSeN/qY1LOMeVm5NLZvYly?=
 =?us-ascii?Q?SaqU0tdMCzjTTqUziYssxxHuk4Ap2JOXHtfmckVqEd8QoLdFSMG2LfFzRB9Y?=
 =?us-ascii?Q?bEB2Mjbaxh3sxEym/4LhwqLmpfJkPTn5ZAtNJkIJ/GSEBW900qGCqbJ04JA9?=
 =?us-ascii?Q?cJg2mxRQXbm2KtQwHQm4kGdvfDei3j2Tp82WEW4QlJRjaTQvl9GH/J1p7QqP?=
 =?us-ascii?Q?diAxvuB80vKkr5DHWqYawdez7c5js9BsKfgUz0D3twfg2Hq0hU6DWOYMwfMa?=
 =?us-ascii?Q?9iGtuWzEooaCQHbZfMCjmfXPBRsjzyKjI82PEEaeIHmNaGo10tefLZONmGEg?=
 =?us-ascii?Q?y5VTgOVOGKbWzC25pWqvKF8cNFwIxyFqvy2fM0qCTFq+RebkO8cHaiETHxW0?=
 =?us-ascii?Q?ty/cWMOgNj0ocCSp0rMUKAk4hM8BEDWVAbX8mgV6sqq3YW9mk+5Yh6h7i14G?=
 =?us-ascii?Q?3ZYSg5mQaCBD93TkJ3O58bO46GHckPry8/2MrxxaTIFVjSOiy4DBpRlxdZDr?=
 =?us-ascii?Q?DzieyrYuC77IawG9u62ot+nAd72Qaxhjsr9lVHDDQz/GAMoFlYUPoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vM4fNMZpQL42JxHHsJG3EqTVuvTOKbl9fv9kle+SSwJikUG2lewA5NKP9uXl?=
 =?us-ascii?Q?JH5iuh1xxweVgEjBf5HgJby3sLqyIzBeXjQI4MQZboUkq1X02a03i1wgornD?=
 =?us-ascii?Q?i66MdI9Joy3ERS428eap+YXg+ZqZ7V607cbLCByEL0kk3WnSYjD5dmOte8zi?=
 =?us-ascii?Q?lPBlpBTccVeXSkXUDPEzqRhwWvCtALw5+4Rl+xZGf05UcsAhjOHRcZ/FGexf?=
 =?us-ascii?Q?CnFa73VFTlkGw20UrNXVj4WN8bI/SudQkGi0p8gAJIBIV43wUn+t21oSv0u5?=
 =?us-ascii?Q?1KAwERWBnSJ/MnqtZDdZGxvmHsBPXdWJWAPpfpMIbILZZON6+j34xsPYQJdR?=
 =?us-ascii?Q?CjyneJAFMm9wTzLMwQNJTaj+Lutr089fraIlWBdJ/4m7q26Pi4tCNcS27IEk?=
 =?us-ascii?Q?0amRJI+O40sCCvkTyPpMhKprp3AK+nkdacln9HKGn1Kg5lE94b795EMGd5uM?=
 =?us-ascii?Q?8wAkcS2xFE+Z/bJsiUWkoQSPNy8WvaEHPRUz0ZhuNzaCT9OoAw9P4RCE1wCo?=
 =?us-ascii?Q?pM9vsh3oVwYcesdTh0azDWlmaPw7lsQsLjjZuZ5fPo14MsBu/e4uYkdnrDqA?=
 =?us-ascii?Q?r5ritbgAXVIEcv3phpT/B8Tq3DxUiibJGsRm+6v6HuS47jhdelub75Xyolt4?=
 =?us-ascii?Q?W9qFuuOQL6DgDaAzFrupG9WgO4GHBYlc6AZq5/NWi/pppzXjXEzO9dMtIqsR?=
 =?us-ascii?Q?IQPNSf1qwlmEZoQkhcLHCPjn+mjkJbEZW9bGEBw4vh5YbODmPde+M7k/2lfk?=
 =?us-ascii?Q?qGWGk4UYIHMnuDoAAQuxIvbeveF4iY6LIkybbja1gJO2piygGcpZFwCMWdBu?=
 =?us-ascii?Q?9ufw7xs8Zsv1+QsRqVri1t64ErwS+qipOuq+dDz5tjgnP7U7YpxEt/0ZSw1f?=
 =?us-ascii?Q?PPHaX9G2I7O7fx5MpnOuvrbGzS97AwYlJvmJlJ+gm0AW2a1GuaDYkqshpAyp?=
 =?us-ascii?Q?AJge12oZ8N/oqQWW2yajr2LM1u41KraGL+GTXW09d+gVCdTTwv4lmwE4irpp?=
 =?us-ascii?Q?b6qEobOiKO1BEqKwX6oWTYduMPBlLUNXX/AD+qCkhk1Zie7ou6iN2sLuN2mI?=
 =?us-ascii?Q?kY++P89J3Ll7OSPHNJZhRX/2rk0hd7w9ooX8nX2yTi5195uucSr4yHE+hFpB?=
 =?us-ascii?Q?m5Kil/jVt5C6CndYA3u44naZ8RUS4r84wfQZ0dzv7062BnLm72F0nihOA4L1?=
 =?us-ascii?Q?ly9aGnYVyAKAZ+t3HPyC3L7vb7sEgtcaEfoLYIVY4bgXJ1sHX2692YK5pnyk?=
 =?us-ascii?Q?Cf+3l8fdVqotn3nSTnmZntBoLMtU0RRpQxlqwqFBzTBpYjIpORMQUEDOb+Gz?=
 =?us-ascii?Q?ksRD6LSF93p1AUHcGHEo8WeyYk1i9bUM3On8XkaSaE/f5TwNMy95BKhyAx5u?=
 =?us-ascii?Q?AgiA9iEcD09D5pxa4yZyBBIe1mD29s5urQMeMoZTciXbP+uRHqhGZmJpQ8y1?=
 =?us-ascii?Q?JmW85blsu0FoQjpognhROTpIgysVZHRWEHEMW5/Yhq/A8UrZOGv2tLR+euUh?=
 =?us-ascii?Q?+zeKVmrsDD1YFDuLDgGj+3f5r8wne+QGulTESymhvxBCK1eleAKvgs5R9jvh?=
 =?us-ascii?Q?fhNOx+0402WPW99VRFIplWbey+OuWE+lnLEuUWo/tXM1R2Y/JcYv/BpAzMTS?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ea9d37-2794-40b4-e983-08de2e4bb714
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 06:59:46.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxEbidJuITeda+AMXXiuC2S1fOHiQj5A4OOn/9pajYYELIS18W/jvREr7cneH6gq1rPC2564d023C8Uwk84B/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_drivers/char/random.c" on:

commit: c0aebac6f39092e97ad08db32f80ccbc27049097 ("random: Use a lockless fast path for get_random_uXX()")
https://git.kernel.org/cgit/linux/kernel/git/ardb/linux.git lockless-random

in testcase: boot

config: x86_64-randconfig-072-20251128
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511281452.35e03947-lkp@intel.com


[   52.009601][   T72] ------------[ cut here ]------------
[   52.010137][   T72] UBSAN: array-index-out-of-bounds in drivers/char/random.c:573:1
[   52.010925][   T72] index 4294967294 is out of range for type 'u64 [12]'
[   52.011514][   T72] CPU: 0 UID: 0 PID: 72 Comm: rc.local Tainted: G                T   6.18.0-rc7-00004-gc0aebac6f390 #1 VOLUNTARY
[   52.012639][   T72] Tainted: [T]=RANDSTRUCT
[   52.013077][   T72] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   52.013922][   T72] Call Trace:
[   52.014197][   T72]  <TASK>
[   52.014452][   T72]  dump_stack_lvl (lib/dump_stack.c:122)
[   52.014954][   T72]  dump_stack (lib/dump_stack.c:129)
[   52.015381][   T72]  ubsan_epilogue (lib/ubsan.c:234)
[   52.015816][   T72]  __ubsan_handle_out_of_bounds (lib/ubsan.c:456)
[   52.016332][   T72]  ? commit_creds (kernel/cred.c:459)
[   52.016876][   T72]  get_random_u64 (drivers/char/random.c:573 (discriminator 1))
[   52.017252][   T72]  arch_rnd (arch/x86/mm/mmap.c:74 (discriminator 1))
[   52.017680][   T72]  arch_pick_mmap_layout (arch/x86/mm/mmap.c:129 (discriminator 2))
[   52.018086][   T72]  setup_new_exec (fs/exec.c:1331)
[   52.018474][   T72]  load_elf_binary (fs/binfmt_elf.c:1037)
[   52.019000][   T72]  ? local_clock_noinstr (kernel/sched/clock.c:304 (discriminator 1))
[   52.019437][   T72]  ? __lock_release+0xb5/0x180
[   52.019965][   T72]  exec_binprm (fs/exec.c:1672 fs/exec.c:1702)
[   52.020467][   T72]  bprm_execve (fs/exec.c:1754)
[   52.021007][   T72]  do_execveat_common+0x299/0x300
[   52.021489][   T72]  __do_compat_sys_execve (fs/exec.c:1961 fs/exec.c:2029)
[   52.021995][   T72]  __ia32_compat_sys_execve (fs/exec.c:2025 fs/exec.c:2025)
[   52.022435][   T72]  ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-072-20251128/./arch/x86/include/generated/asm/syscalls_32.h:12)
[   52.022874][   T72]  __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:306)
[   52.023296][   T72]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   52.023731][   T72]  ? vtime_user_enter (kernel/sched/cputime.c:726)
[   52.024147][   T72]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91 (discriminator 2))
[   52.024718][   T72]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[   52.025218][   T72]  ? local_clock_noinstr (kernel/sched/clock.c:304 (discriminator 1))
[   52.025657][   T72]  ? local_clock (arch/x86/include/asm/preempt.h:85 (discriminator 13) kernel/sched/clock.c:319 (discriminator 13))
[   52.026072][   T72]  ? __lock_release+0xb5/0x180
[   52.026526][   T72]  ? vtime_user_enter (kernel/sched/cputime.c:726)
[   52.027184][   T72]  ? do_write_seqcount_end (include/linux/seqlock.h:523 (discriminator 1))
[   52.027644][   T72]  ? vtime_user_enter (kernel/sched/cputime.c:726)
[   52.028105][   T72]  ? __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:310)
[   52.028710][   T72]  do_fast_syscall_32 (arch/x86/entry/syscall_32.c:331 (discriminator 1))
[   52.029126][   T72]  do_SYSENTER_32 (arch/x86/entry/syscall_32.c:370)
[   52.029532][   T72]  entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127)
[   52.030017][   T72] RIP: 0023:0xf7f84589
[   52.030370][   T72] Code: Unable to access opcode bytes at 0xf7f8455f.

Code starting with the faulting instruction
===========================================
[   52.030954][   T72] RSP: 002b:00000000ff8eef64 EFLAGS: 00000206 ORIG_RAX: 000000000000000b
[   52.031617][   T72] RAX: ffffffffffffffda RBX: 00000000565d3928 RCX: 00000000565d2778
[   52.032295][   T72] RDX: 00000000565bcf20 RSI: 00000000565bcf20 RDI: 00000000f7effff4
[   52.032999][   T72] RBP: 00000000ff8eefd8 R08: 0000000000000000 R09: 0000000000000000
[   52.034464][   T72] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[   52.035166][   T72] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   52.035905][   T72]  </TASK>
[   52.036330][   T72] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251128/202511281452.35e03947-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

