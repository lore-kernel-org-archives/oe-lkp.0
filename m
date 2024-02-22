Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10488F77
	for <oe-lkp@lists.linux.dev>; Thu, 22 Feb 2024 02:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708569329; cv=fail; b=ZEvgDDMbMmY1nRc+x/jJOwuNKtphJ2zwEA8TQOwTR3zJXns0oCJ4CmU6nEh7MbEzVwaniDnneFnkh5TG525xnQxb8tb2SqUphzPNwqvE5p+xird6QGMtCaxb9spi/C/SSOEnVQpJLVsx9B6LjDHcSWIf8enEu8bdWXghUT+/6Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708569329; c=relaxed/simple;
	bh=c+UGX9cJd55vApX1b1r7NHWkiJtrtsM2YTRUQ+o7jyQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QQsi2gspaNCkv89HJulFSxKCt1UEZfRo7+PFlaDegVHJlj3JAmGsdjNj+KUCBdQa0Ae59NCEQZ3Tpzerz7kh9Ydh/CjIsDDR95vl4WwsdtaUVIcP2fSEn96LGdY8DDS5X5ut+Hasavq++6kharppzPMlyC7KV3mDctiVVqlno2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxYwXU9L; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxYwXU9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708569328; x=1740105328;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=c+UGX9cJd55vApX1b1r7NHWkiJtrtsM2YTRUQ+o7jyQ=;
  b=gxYwXU9L7Rj+jaCmdEM4Xd1uMQ7HmkMDbZqKktuP8JvY41Aq8ydIvMAA
   BSX6xkPEf3TcJtSaVu9KkUAH9oKFH8YSKgkA0Hzx/7GpJWS/jPWlGByr8
   jfPBs7yY0vGH1aCgrCSFo9lor/X1b0uag5T9C24zUQMY/m4Bt+wuFEcRt
   GNj5MUORHuMNaSGqKU00Mz+x/KQAMwsYTeB1LUHb8NNVoF7CktmaoSmhM
   tHwNF4MCIrnv/zx78p/oaVLgIPA+wamzFxTs3wdwF/SJswa/qVLP+2S/6
   9oFEC4goH55T+WK0w7oocejWchmKOvHlxEbQptNktC/0jASlUEdqxGp8a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13468188"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13468188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 18:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10027470"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Feb 2024 18:35:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 18:35:26 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 18:35:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 18:35:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 18:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTt54kSY885zPnogCnPrWjlxumOo6Cb0JzUE3VRu01mAd8H3zJKHlx4e0yIbGLyVqV9UsQ6vMiFa3OR5uMjoe3ejRa/21eDCkNbPBu/MBjMDe850Uus0W8YKxAgml8iadOi5Mhf9OPHzqb+wEnb2cCKLcWJBEKzXm3b8mFDjLazBh1nJ2pFjrMO4sT7kEMCPpv9k795dkLB2bisOYNpnulxXp+fA/5FwElga09XkT0tiBoaTABN3GanXnzs+AwCDCNgApBftyddGKAqawbuouYXbqI+2z924oJCe1UkPAQAT61zVA5Vmb/3dwxcpCvuFCdGRO5171quRMt1IroGKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ3/Pk43BLaiJT5bu+qo1eoQO8dyYteMOjfB5fVGgVk=;
 b=maSsuQZZbszAsTNnbePyCr25IfhPfYgIiVntO/S04myOflnDnWNcArKJIZQGClh+oqBkS/EPO3ArGNt0lT3waIHBrdehk261+YjaXvZOeLJNJWYOulUnTV0k556jp2tGEctvudIKNPnvw3MfgfUwRQlNtEJ3DvmFsORtwus6eWMvi4z6NqSponhdmBqTFh4DLulL/inZVIlm+BrQzn+ESLnz+waDFBJ9CQZfhOhA4v9OxyZ11cnJgOC3aw7xVkMZ+taTHYQteltfPH8A1ZMK5le7lC6p2aq0oMs7golZX5D9QFNGIOFh/kyAVWsE1i+VTOpXXcU6fvtUhma7J0shTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 02:35:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 02:35:18 +0000
Date: Thu, 22 Feb 2024 10:35:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:timers/anna] [timers]  5bbb5400a9:
 unixbench.throughput 2.1% improvement
Message-ID: <202402221047.8338ced3-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: e06a045d-de43-4688-8fbb-08dc334ee863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzCoVjMHqi2vpR2mR5ZCknbLMOnL1dYzLwgEOz73GzlTkKcisGx7YMbPylX8C4koJLIGJ0rvbj9k25AyM+vTPs1WRcLStV/5xl55NDtouBds+E6mhFqOvv6jb9HTjngNGwF9ZZIXQmPFOmCoHt3KkWfZTtZJ1trLNlxgQMe8Fd0Sq2WRNSrMy4YkpDwm5DuxnLua8BY0H96UxPOnLl7Zdkh3AmIT3bdvyTzmkA10ju/zDjwqo0jAqsBx9dlFOl+/myGtF8LOZRrqR+IwXCJX0ciIasxawGWu75Y112t+oGGJqQ4ojVW6NWnJN3wV/auF6Lu4wVdTA+DWDO7GR+c9xQlmN76e/fsbMQZfronDewLX5lYENwsj9Yf+4dBa7SIFU+wg/sjDEL3PhKTj+A18MH9GjvaQ8so0mNpoPklwIGeAQW2gL6XFC62ZDscSVQtJVumgvtU9V7MiOjKfHaz9Sjce4xXgwlG7rnkKUGJplNcnZe52OTkxWsvaPNnFhFbDxEg5PEefa5fOFlVULQGnLvr3DEBm7Dr2uJUBw/1qc6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230473577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e12qb37w85aA6dyvOhI0zKCvMHSk2oN+Lp3d9QsI/8A9QK9YSzSu0Aemig?=
 =?iso-8859-1?Q?3bz7UKelrwFA6cYvs0cRSvZBI3oL03FMv57b/lzBX6XfOO429BgAcOH60S?=
 =?iso-8859-1?Q?XIC+CFt4+VSLB2PPAslrDNLjw8aCyEBd/liEw86ksLcGTXh2ABfraan0+P?=
 =?iso-8859-1?Q?Y/RmghgB/yah6wRvl03T1M7nKB1PAtz9mJtJjtGE9EV2Mlsbf41mF7EjB9?=
 =?iso-8859-1?Q?dlJeEKuomb9RpfeiqXWQxZZ95jOKpbz/NiAXJQcslqxEXoIBHzBOZnmwUD?=
 =?iso-8859-1?Q?5NW8TQ1796JBZ6Vy04AKqeNzNjuo95vnSn7N7s6vcsNzGrRWHkW+IUIWlm?=
 =?iso-8859-1?Q?/HnwHfwxBde+HazNSP4rIwZ0JX6njOGcx+qEF8I0GRVsWYEClDDqXb/YL1?=
 =?iso-8859-1?Q?sVXTLpHupVY2/cWwbczz59W5QAvPAYZqmIFyXyUyydFtAL3LAw/pfmbYnA?=
 =?iso-8859-1?Q?dDgjYBKUSE6g6dK3lrZDfqVDS6IQJ7anOOPlN9H6KT21wRdDonrITf4Y8p?=
 =?iso-8859-1?Q?FjorW6wxEbecgWL8LhUZYgcej1djGkfZbysxDJlNRMHqNJSfF0N1EvURAi?=
 =?iso-8859-1?Q?+H+t6ZkIIiAy4zZ63NCv8KMHfn0D8Kp55DR9km+0B6DwKDb3cg+JdaRtws?=
 =?iso-8859-1?Q?2sBc7aoWRFb43K0Bh076B23SdI52mr/UizQLIlLdxudj7XM9vw7RaOzJVN?=
 =?iso-8859-1?Q?PlGq2x0CCShNuPnDg91qhJDrgLgOEhsOy2/ZL7h2XNd1ST5IuBDplO/H9m?=
 =?iso-8859-1?Q?fk48wew3TMsuTqjWF+uFbu45zXCpuiKHP6WL5a3PnhqObuj9fie7jdbPOm?=
 =?iso-8859-1?Q?WlKhT3bVrLlnS3rSB/BExzNVbov9fkSS5bQNToY4vlERuTKT7eJ6dMEuan?=
 =?iso-8859-1?Q?PswuBUhFVKXkm/TCvwHea6wU12O3zoP8D4KJhzLIcXrRXZ2KCe6pcZ0aiw?=
 =?iso-8859-1?Q?3/QNEahecWyVATflHcLDewMD0nOdgvAqRLgBSz/m6jMraeRqulq5YSwlA2?=
 =?iso-8859-1?Q?IjrzurXqfu0Q51ra8rZEGPg6aCb28sd/LWby0dJVJGBNDNp0ykeOQ4I2IF?=
 =?iso-8859-1?Q?wi+PORaLGX5kYGW8GlCrAyDJTVxr/vsCMzXnrFhpQmTst6jbYcTi0Z2Abe?=
 =?iso-8859-1?Q?75glzWDCRL8rk3QcO/cWyYIDbxaQvVgJWCMf82cmj37m8xog+BsEWvhI+W?=
 =?iso-8859-1?Q?Bl+aZiJXUUpGrTK2IUIvD+tmz+4RfJ14koZx9QLbYVPYYZSlMM0fFo2GKa?=
 =?iso-8859-1?Q?z04mRJl71lmkf6N/vcT3rFZfo/JYnmMLDON4ElAn16w9Jk93uwqz1EDlBl?=
 =?iso-8859-1?Q?gPEv4IzNUkJTTss7KuX39LNtcD8z4CHSECNhUSNPeDFzCGBOv5vNlKApEs?=
 =?iso-8859-1?Q?ymn4qx93n4+iyPnPLBrGvG6byD+fML0wJ7hCzv/E7BNDM3PpWTod/g2Rvp?=
 =?iso-8859-1?Q?amzgdBCKg6USb57On5tNNgeKc9z0zJ5WN1Qt3HTA22AgmDyhwHzNqtG5Rd?=
 =?iso-8859-1?Q?/VkBOb1+lLwqDnYJ/Hb8AN/wqmLb1w1zgwXFztL1Hyj6eoRp7D+/Gs1Dse?=
 =?iso-8859-1?Q?Gt7Q+hPawI/1GzdVqHVG4ZhdvOudOHywMS2ms1NfKMzKQDplyKGtwPCi8W?=
 =?iso-8859-1?Q?x4tFVPdNHrQimVLQk7Aio7eAzCWnw/hJ7peiDukfuHf2g5oaBddqCZhg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e06a045d-de43-4688-8fbb-08dc334ee863
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 02:35:18.2116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ut+U5sU+AvIbUVY42tjrNYUQOrpLphslR5/6eQmHoAo9m8vTknf4x2wmEPp34YddVaOfKVa51YJSISOuOaL8fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.1% improvement of unixbench.throughput on:


commit: 5bbb5400a9f70dae4069290b581b1d2c934c932a ("timers: Keep the pinned timers separate from the others")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git timers/anna

testcase: unixbench
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
parameters:

	runtime: 300s
	nr_task: 1
	test: syscall
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240222/202402221047.8338ced3-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/lkp-csl-d02/syscall/unixbench

commit: 
  f2234c1add ("timers: Split next timer interrupt logic")
  5bbb5400a9 ("timers: Keep the pinned timers separate from the others")

f2234c1add92fe1b 5bbb5400a9f70dae4069290b581 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3.99 ±  8%     +14.4%       4.57 ±  8%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
   2744609            +2.1%    2801712        unixbench.throughput
 1.071e+09            +2.0%  1.093e+09        unixbench.workload
      2.65 ± 10%      -0.5        2.12 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umask
      0.29 ±100%      +0.4        0.67 ±  7%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      0.29 ±101%      +0.4        0.70 ± 10%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.getuid
      0.00            +0.2        0.21 ± 15%  perf-profile.children.cycles-pp.__get_next_timer_interrupt
      5.67 ± 12%      -2.4        3.24 ±  6%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.1        0.09 ± 14%  perf-profile.self.cycles-pp.__get_next_timer_interrupt
 6.425e+08            +1.8%  6.539e+08        perf-stat.i.branch-instructions
 9.814e+08            +1.9%  9.997e+08        perf-stat.i.dTLB-loads
 6.276e+08            +1.9%  6.397e+08        perf-stat.i.dTLB-stores
    325643 ±  2%      +7.6%     350447 ±  3%  perf-stat.i.iTLB-loads
 3.314e+09            +1.8%  3.372e+09        perf-stat.i.instructions
    555.44            +3.8%     576.68        perf-stat.i.instructions-per-iTLB-miss
      0.75            +1.8%       0.76        perf-stat.i.ipc
     62.51            +1.9%      63.67        perf-stat.i.metric.M/sec
      1.25            -1.7%       1.22        perf-stat.overall.cpi
      0.80            +1.7%       0.82        perf-stat.overall.ipc
 6.408e+08            +1.8%  6.522e+08        perf-stat.ps.branch-instructions
 9.789e+08            +1.9%  9.971e+08        perf-stat.ps.dTLB-loads
 6.259e+08            +1.9%  6.381e+08        perf-stat.ps.dTLB-stores
    324768 ±  2%      +7.6%     349509 ±  3%  perf-stat.ps.iTLB-loads
 3.305e+09            +1.8%  3.363e+09        perf-stat.ps.instructions
 1.292e+12            +1.8%  1.315e+12        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

