Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31732318EE7
	for <oe-lkp@lists.linux.dev>; Tue,  5 May 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987202; cv=fail; b=EMteTyVmZKfcYvJzMFTYq/V1rzbylrZyFcydW8VW6XV3jqBpgiLfkgYLzwOJvF28U5PYO9a1dXsyaOEoOXkDxePkziRbqQ7JRKqmuaDda5ZsC8LlC4Lb1tvb66RfDynWcVKLLfjfRQr0NlpOK0aACxz2emYW4e69eUOJb2DoM5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987202; c=relaxed/simple;
	bh=W5PwXovcofvSYaUGnExNcZWQClHXP4/ZStedkft3e74=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uXVxSXxxMSWxV3C1g6rcw93c4VZMw0KuN5IAzxOXEvogu2xuBBdiJMUv9Orbj+udgd31zuBRU0J2SEgp28Tfp5QDJv6SqPZmZgdmczops/CJemO9zI0qvi6lhppO3LiryibQgF2iYa87Dmm2bdwK4gqAOBZCHuHKB4q1kDKLI8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D77Vhw7j; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D77Vhw7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777987201; x=1809523201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5PwXovcofvSYaUGnExNcZWQClHXP4/ZStedkft3e74=;
  b=D77Vhw7jBewDXTPkji8w/y2VTFh5V8J9tjGwlBmtkP6o0B29mQWWfc2w
   SpfpFoKoPd3J/7o8SZ2FHCTSTq4Toaa6BTIK6X6Rjf3BRSrY4NxnPJpwN
   t0Jwcx+zQ1NshTKgs/sRcqHM95LnbjeK+X7+xX2WWj3oHuvvWRQMEqTF7
   6OGxlEhjE2bm2CwBzRm9HW8yC+E0gMfltoT46f/r8Oh1cHEYJFdK6KX+G
   h5zg5t19HSxxQV8z0qqRJOCXXP7jeRyiqM9FD9jtM09p95H3TF/fMNPF2
   Ou8fu/MB4+8phFhGADBRVYFbV9wbfyl2nYqm5MaxAHX0S+eAwgp8DbH2K
   Q==;
X-CSE-ConnectionGUID: 7xbVCA+pQIetbpd48w4R3Q==
X-CSE-MsgGUID: ntATPFcgSsSPmo8KiLpQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79046481"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="79046481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:20:01 -0700
X-CSE-ConnectionGUID: gfkGI402RmyiZuSFqlCTYg==
X-CSE-MsgGUID: OdOxPlUXTBKvxfJHLl9rLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232670766"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:20:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:20:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 06:20:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 06:19:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqprHefLt4yKl8PAUQkBMs1Ku0Q8AXfdhwSJRcO7rBL/NFJM3laz/6eHE5B7Y1GelTA4z76wQSmf6xCwARmQ4ghfftXxtXAapTg4eJj/UMycY7dfBFVnvI97ayrSzGZqGCwrdCFvo23M79/FW/8U4SXGsaJTVQpLAzgJoic2vnxE/XUDSDWrg6K0l/OWSf736ub169cVuHkvwarj3aLewhqy5xrMrk7nIS3szvskJF8XdMdci28u+SCdL0tvdMTh5uWIL+jKr08IaeaeYlPZxHYe6HRU7XClgtA7uwiCu6x2c/X15LHe+bNDqswaCGh2yoCcP6k9BgNrXsE8hM6dlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lonbdc/yGMs+myiqPW+6AwCUsKOis2J0iFsuWe6b0k0=;
 b=UjSYPjzy3iYbNdLdAfmGQr+FtO4KM6OjZJD3nfrtHqw5iHxRVIvaw8xcBLcrS+MuXX7IDR3vpmikIFIASdJfQcKcL4oQMZjIWpv/TLMFEJ+I0ELbAiv+JkvWqDvV+NDspXnyX628KOl0P3rKU+CnYiuuM6Me6ySBdXVLJCsqjgH+1DYrx9XFm1eg8lelb3DIZXMZKdkVedHJLWvp/s/cRyzPasl+NxeTSRNojvoSQcHS1bdankO8QkdTDCR1XkxA/rcMOgMtNQuPPoyezpGhXV4ywaPflC8afZaj888p/aGS5rkarDd64v+p80crPcciLCK80RcZRWJbhzNQA1rBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 13:19:56 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9870.020; Tue, 5 May 2026
 13:19:56 +0000
Date: Tue, 5 May 2026 21:19:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>, Shubhang Kaushik
	<shubhang@os.amperecomputing.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  4823725d9d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202605052050.8156b7e0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 9626a9f8-6e3e-423c-87c8-08deaaa90032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: zILDhHJOjoO34EF4p+Lmp47QdcTmsfhT1fW4K6F7mbap6exfUpMZk67zGD1n8yrF0DkurEhvfqBgA1lVqZtm6iwRLMOk/egwAqGCTZGsz6ZUyk3F1s+edVkQ6czLg66LKQ6TXqZ8whhTccXYz/xpAtoatTOWxD1+6rqSYuBmkrb3l75I6Xpci6/W/T4UnrIIjV9IG9BTm52+4kxb9cqCJjE2eoObUAnpxm8CllhR9x3C+bIkCByf51h3sX5TxLDP0zkHm26HLNnueSobvz7RenREP4/gYnV/qNkItCxDwGsMoe5f3i9/oUyoA9uvbVlO2wCY0GdZAlayqV0vynJAxZ6ZDoAsO1iRXuJ6HzTOXUQkHU4Sgu+Y46/8dNWzzp/CJs67jN6Vfnuwi1aR3Sh6hr14QFyMUWXT0zl8n3FfDabr4jUJ82mvtM/RAZ6imsZBlHdfcfUF/s8mWllbPEoNtjTWlJi8aLKgMawD5SybKJtkQquOEoDSmL3IBgFrgoA4j8d/1Eduqu9tbfk/rqdf4HzLozHnOAYLPIfA464t0ft+B8Pl64jpDT5Eaw9x2IQQOW1psoQOW1EzKnvC4F1tkeQ0rWUi+xhavOQTGYwyJTqxbiBK2Fi9yn6cpEkgMo+LOgQTj96AR5ZVh0L9saqlUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?86QjyK+vWQjINdtGATsZIyGpifhexYPvt9MX9JUzqAGRK+lNF3epn2JhKtXq?=
 =?us-ascii?Q?3wBWARxeaeWGSkKIyjfmwHeJka8je6sj/5QNCtzmxi5QAdLmfm632k5RZHWR?=
 =?us-ascii?Q?XJG8eWp97WIH8kwpudmAjquSexPy96EVu0xZWDKI0iwAURwN5N82TAlXwMtG?=
 =?us-ascii?Q?tfgl/l9mgK+Z53UkmHnQMTi/7UKVrtg06V0U4paQdByQVAbolWWC5QZlcXTB?=
 =?us-ascii?Q?WqQkObUp8VwsrSDY20L0FXsKkXzjvrEZRVJiv+sOkbAWpEfY3KIwiNI3zSew?=
 =?us-ascii?Q?hcSSx7LbYg3Z8MjJmQxS5dQ/AyY1mjIMnpXQYtOka5aK4d9zhp7xeoeNn68a?=
 =?us-ascii?Q?WQDOVAONOwX+56oV6GfUZvTjxz/J2n/Agdyh7CBJGvGgz0XB3AfvML/BcMa5?=
 =?us-ascii?Q?F2hHymd3Ug+kd2fqclC37tXIH5z+3iBA5Z/ygsrJ8Huz8mY9+dnXHYvLAsJR?=
 =?us-ascii?Q?lY5IDVoeM9k7D4KU15ITx2KQhjLYq+H0Dj4hp+QzgjCMCc4TaYDEdJkpVU9S?=
 =?us-ascii?Q?sKpLpuuoObRgaOz7YeRpgEewfj4M/XggpM6+RyZjJ73WCgrdLpuvn7P/mkYQ?=
 =?us-ascii?Q?lbjDr6X/Twovq8uuHv4pK7SXWPSYGlcvAB7mm638UBntMtL4BMu5AtAcW6QU?=
 =?us-ascii?Q?00UJ8J8m25IvcBp/8trYNwaZZsD3ah9eNWouSVDinpiikX9sLd60KUjZEE9K?=
 =?us-ascii?Q?JSomBJ9vqt7tvZYhqfUuLN4TSck5SNEaPZafqHi9PwQgTKg6drc8uVKiB9Cb?=
 =?us-ascii?Q?YpSvlOasYAET0McPtb7uyNsFd7IzbObB7khqroW7aulsKfPtLUPKnxykQKTR?=
 =?us-ascii?Q?zo9T6riULcuKZ3PO1xIJYZgu2Q0nZkQOyiI5RRO9DZDZtT7phEehNSc9Q3St?=
 =?us-ascii?Q?hOONXriuKXvK1jYp8NqzcmeKpl28QpJklIiAmv6XZ2jAcctt1ksFeG/GtkrN?=
 =?us-ascii?Q?ckzrQyYZHJl8//Orl4fuNPDnukO51lMaG5WQOGN+0XHG5tSZ2l16RkynN8yM?=
 =?us-ascii?Q?c/nW/WdkfOGBq5wqKf0CLLEFUaBIrWSIjnDf75Yi0/HgfCDN51AKqXOCv86O?=
 =?us-ascii?Q?mybgZuZEcN6ZEWvx+43MB3XqBSUjV6tioTBgYceoJPROO9Xjg+mbFGS/so75?=
 =?us-ascii?Q?EtvmI2pU1c56oXBUq1lP5HegskHDM7CuXo2MBmzUzs5KqTv2QG+k3ZKOEyxQ?=
 =?us-ascii?Q?1VJwmdHz+cOPw9FGErKg2ivR6CczC74TizgEgYZm9l6rfIO5TG8vM7qkGbE+?=
 =?us-ascii?Q?rJYi9p6F7sNwrjGpxpAuNIiKj6zqZPWzHkWBfjqeD5vMi87Noxn23payfMGp?=
 =?us-ascii?Q?vnBdCDd85wzeOiRl4wskDUL++nlejW+lFb/IAVGHaBXf4/TXqhJ7sANVhkfE?=
 =?us-ascii?Q?0l3xniucSn7vAnzrgELSCdt4A5r1qH6Z8HiVied2CYJboBgYONarWo9/pIxC?=
 =?us-ascii?Q?CK/FTeHtlAuFJci/GJN/IRyMRZ5JueHlraRZOEjtMT5JwP/Y72th/ty5DE5A?=
 =?us-ascii?Q?xrp56NCU27+FLiPoY9y7kHaLYxLXW6eTfvoDT1Ondfzvb49T9rE96r/y67hv?=
 =?us-ascii?Q?sVjMvXi9CuWr5T9dTcRtVqysUx/2kvgz+Ef7S4f5vp1DrlGYD2Tjg4vi5DHL?=
 =?us-ascii?Q?RmaDLEfvnmuOPZYUTPHQ8U6rD1hNn4J+j8mErmGGgeEe3l+tAPWuPcQmfqqv?=
 =?us-ascii?Q?V30LsN38jnqG8hgiN0yWbVoEa8dQ3MOFHGbDqlcW8E8wea8hWko2pba2+DHu?=
 =?us-ascii?Q?htKlDV5GDg=3D=3D?=
X-Exchange-RoutingPolicyChecked: qtnChGju/XGZ6+ZzFwL14oDKbBEE5ict4fgB9QnB0UAB4Vph5tVPJCAmpswlkRErK55MjZZX2+zUmwRV+46+qVEDPvh7zCEf1fRZJiYgcN3hQnphpiL/mhKdhN9b2uqw/YlX9PXyv0DzkGS1JoiyTcObcN8wYL+ksrW304OMXZc7V/rhM6BlsKiPgVGUH2o9tnKnSF4YM4bEeSgYT9bPyKZb60J7op7qWdSOi4I/a28m6xTIl6GoXqetXge37XcZACcQooZHxf8RsiSVughAhSwCAPRINIaWgwsN5sP0qB542DccuZT3JXENh5efCYVD9Vy7MVHWaQJ/vlUBlF5/oQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9626a9f8-6e3e-423c-87c8-08deaaa90032
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:19:56.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G26SfSMHsK4EK4kFsGBsA4gOpbLny1ncMnUJCbspsgiSs36JDBC9KL+I7ud5YFAuquOAhUZzzYUR+yoWaEZHgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
X-OriginatorOrg: intel.com



Hello,


for this change "sched/fair: Increase weight bits for avg_vruntime", we reported
"[peterz-queue:sched/hrtick] [sched/fair]  fb047eb995: Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI"
in [1]

but we cannot reproduce the issue in [1] now with same tests and the same
x86_64-randconfig as the kbuild input config for 4823725d9d.

however, with another i386-randconfig in boot tests, we found some random
issues for this change which are clean on parent.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb/boot/yocto-i386-minimal-20190520.cgz/i386-randconfig-2006-20250804/gcc-14/1

9fe89f022c05d99c 4823725d9d1d9cc5b36647e0cb8
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :499         13%          64:499   last_state.booting
           :499          6%          29:499   dmesg.BUG:kernel_hang_in_boot_stage
           :499          7%          33:499   dmesg.BUG:workqueue_lockup-pool
           :499          0%           1:499   dmesg.EIP:_raw_spin_unlock_irqrestore
           :499          1%           3:499   dmesg.EIP:finish_task_switch
           :499          0%           1:499   dmesg.EIP:handle_softirqs
           :499          0%           2:499   dmesg.EIP:lock_acquire
           :499          0%           1:499   dmesg.EIP:lock_release
           :499          0%           1:499   dmesg.EIP:on_each_cpu_cond_mask
           :499          0%           1:499   dmesg.EIP:rcu_preempt_deferred_qs_irqrestore
           :499          1%           3:499   dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
           :499          3%          14:499   dmesg.INFO:task_blocked_for_more_than#seconds

below full report is for "dmesg.INFO:task_blocked_for_more_than#seconds",
if you need more information, please let us know. thanks!

[1] https://lore.kernel.org/all/202602032236.bcc0d1b7-lkp@intel.com/



kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 4823725d9d1d9cc5b36647e0cb8ff616cad6536f ("sched/fair: Increase weight bits for avg_vruntime")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      f1a5e78a55ebf2b05777fd5eb738038ddae609d6]
[test failed on linux-next/master b9303e6bff706758c167af686b5315ad00233bf8]
[test failed on fix commit        556146ce5e9476db234134c46ddf0e154ca17028]

in testcase: boot

config: i386-randconfig-2006-20250804
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605052050.8156b7e0-lkp@intel.com



[  983.510203][   T24] INFO: task kworker/u4:2:45 blocked for more than 492 seconds.
[  983.696012][   T24]       Not tainted 7.0.0-rc1+ #1
[  983.730478][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  983.906134][   T24] task:kworker/u4:2    state:D stack:0     pid:45    tgid:45    ppid:44     task_flags:0x8040 flags:0x00080000
[  984.159850][   T24] Call Trace:
[  984.407777][   T24]  __schedule (sched/core.c:5295 sched/core.c:6908)
[  984.706338][   T24]  ? sched_submit_work (linux/blkdev.h:1205 sched/core.c:6969)
[  984.907449][   T24]  schedule (sched/core.c:6990 sched/core.c:7005)
[  985.006131][   T24]  async_synchronize_cookie_domain (async.c:317 (discriminator 7))
[  985.104747][   T24]  ? swake_up_all (sched/swait.c:82)
[  985.203211][   T24]  wait_for_initramfs (initramfs.c:778)
[  985.307882][   T24]  call_usermodehelper_exec_async (umh.c:108)
[  985.394170][   T24]  ? umh_complete (umh.c:58)
[  985.706723][   T24]  ret_from_fork (x86/kernel/process.c:158)
[  985.779811][   T24]  ? umh_complete (umh.c:58)
[  986.710694][   T24]  ret_from_fork_asm (x86/entry/entry_32.S:736)
[  987.013319][   T24]  entry_INT80_32 (x86/entry/entry_32.S:940)
[  987.306125][   T24]
[  987.306125][   T24] Showing all locks held in the system:
[  987.502551][   T24] 4 locks held by kworker/u4:0/12:
[  987.544601][   T24] 1 lock held by khungtaskd/24:
[  987.693891][   T24]  #0: b22ae69c (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire (linux/rcupdate.h:311)
[  987.857208][   T24] 2 locks held by kworker/u4:2/44:
[  988.011251][   T24]  #0: b30d6cc0 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work (workqueue.c:3249)
[  988.109740][   T24]  #1: b39c5f18 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work (workqueue.c:3250)
[  988.412819][   T24]
[  988.545186][   T24] =============================================
[  988.545186][   T24]
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260505/202605052050.8156b7e0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

