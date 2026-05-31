Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57CD25B095
	for <oe-lkp@lists.linux.dev>; Sun, 31 May 2026 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212456; cv=fail; b=DsHrNOz90gvWRrzH3J1OzSxXoQp4pKOdfUp79pZkDqr5drtwriOu+CADDBWPhdUaRVHuv5Drj80WxbzM5yQ/VyJEQEnoA9WTLrabuX8C6+NvkGPCQ3KwXTKCSS1KPPgh3K8uuZtWvTp8pV3XEj/vBQIdwuKCMKvJrBHOr2IQGUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212456; c=relaxed/simple;
	bh=jDhGp/xJHCQHA+87tf77xBHL7XA+51xURVh6GLlJBSQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jG88hHV+hWdHz89E5qf3TeS2iAS+/N4l/Fh4vxR7QhO1ed5zXW+yjz5SZN7M38TkhTyVKBAyLGncTJmDojuAw8RFYTkwJ+bu04heIkBYWmPMAmJuXrM7AxKrQFF0W6CKZoSc1W93DPLFtCZdtEvIPmjQ5GTp3FfIl0wkutCCmBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOxH0GIW; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOxH0GIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780212454; x=1811748454;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jDhGp/xJHCQHA+87tf77xBHL7XA+51xURVh6GLlJBSQ=;
  b=SOxH0GIWdI0iuSO42tS4y154640VPXtxiwnXgMkS+Yx7UfHOOcDOD8bM
   xPQTe1TMU2zHXlii688WJVYnm6t7L2sI2VS89JbyqNQujtIHMn3Ge1LgP
   mpgcpVm9o/vuuxud+92NT/6qSEYe6CHn40esp78RO4WBoREfqxA9r3Jik
   EP/54inVI6kU/ir8s7I4WMV1qrLpHhMUN1XbGp8gAAyFPyZcjf0uzqdb7
   7YUFuHrRkRVLdMB5mfTS8C0TjQQq5jilG0TQljrpj6I7Y+Z9Nu3H+QUvG
   fTt+HrEgQB7zN7pLR5ZHu3MBUkSvaVUPyPC/jzB5YFGOW1PRf+auoCkv0
   Q==;
X-CSE-ConnectionGUID: 2/XUWQRVRQqze1tVrL8qFQ==
X-CSE-MsgGUID: OqZ6KJZrSJaFRZ5hQ+3X1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="92381294"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="92381294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 00:27:32 -0700
X-CSE-ConnectionGUID: x+MD7tJuTD+vr6Oj00nrLQ==
X-CSE-MsgGUID: Eh51AJOrTWCqiFbqgXo+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="248359895"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 00:27:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 00:27:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 00:27:31 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 00:27:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gF6Z+W/ZwU4Za260iDJQbWNCF5Lm4sKFUsJXCHvACzTZPJkKN5TZi6paKJ50gLoDnFC/8XsTyJgkg62Ayt/mYv1XCexrSSeqMOsG1Oj1X525mYIYx8+oQ+DJXHmkXlzV+TI4W0E+f5vh5XbkQHuhA09Ic1ZuUPPabOdHovR395mq0woNaWQjiB/zMW0WVe4ZF1viCcoEk+7kk2NqV0dNkEm1s0AhutC95Fo5VT1+E9XwTRvxYHTYL4V202cMK+0pg2xHUM/i7ZNcsCyXMkTHmfgO2tZHcN8mJVsmGGnqEpOX1avR9jKBevZp0gWEbaMS/yvHaK1Lw5SfjWcuXvsZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfIN3l54aDIYmO+csTJ5UEzAyVB0ZeBkQpfVeBZax3o=;
 b=r9/h29JTNgAprOO+MZNW0AwG0m1qeLT8WY+gzq1evuaMFAUMVZ9RrsB7lwa5CXEePbJRKbCMP6tCy8vSkw2Hq1Yje0+GIbcWeuC9lMGno/58MoClvXBxkahofoN9MPlPGnMBppxLEF07Gn09UvVqHy1VCJHqCfBtiGL2xsRhohUGSC+XqvALlhL/7MsizUf8ruSVDQigWgsLewFGRadhgqSkwnqyDM0LwsydNqkpWTjRLMcChfH31iZHBHA5hp3oDBgd/+c7Dd0aQTP6AGsx7+Cz4MsWN9PYWyWEu0V6mgehX727PZYJVQU0f+uGj+RNTUeCxMaHGtFHCSN9UUyznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sun, 31 May
 2026 07:27:25 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 07:27:24 +0000
Date: Sun, 31 May 2026 15:27:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peng Wang <peng_wang@linux.alibaba.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
	<boqun@kernel.org>, <longman@redhat.com>, <dbueso@suse.de>, Peng Wang
	<peng_wang@linux.alibaba.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH] locking/rwsem: Remove reader optimistic lock stealing
Message-ID: <202605291757.b455c22c-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521095926.29363-1-peng_wang@linux.alibaba.com>
X-ClientProxiedBy: TPYP295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::17) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2f7037-91e9-441f-7d56-08debee60f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|3023799007|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: abGGE1/DYMGE43mwTAU8aCv7T8wTHghpLrVajad8fv68EnIl9a15m48ZVR0jjLMh3NQN/1CYGB5UyoZ0YRUL3O+2WBOgJ0Zle1XF/v+raCBaq5kaUvocJjZ4Fy52MyYupNGwHZJhV1Tlyqx9k+n0OWAPKBeYpsxHwvJBtWt/PEDrR39aTR/u2T0UL/vjyRGmGWZvoh47dONA0PDOCBVa+ysBxey0yq2F09wR0qsZc+kSJgiRC5waBLyLPXWWwNogj31Aq8SIVl2zkHl5un60DcruirceRzG9+DCZYZoaDGv5G8B4CkovV27TuJ/o7S0AwF1H7EUmdgg1OtXsca8uRWS9hvfJq+A2K4nzhdCbzgMKbTbVjKKVgBg+ot+IjL2b/lcsL0D70jlwL3fqp7wXyEPhWU7KxeeRPV/UaD7eKICSQe+9w+fZrSaYR+zVLiACpqxYqC9IwmAgMAh+ZExr6wckmPS4XvpVb4kWMN5f+eArjRUVJ2qpOv+5faaEBnekfz4jcmVjinN75n2ZgZ16lkeBC/G/n9MulaChVASdki0N8bbHiPIJ7t/ZH+qRP9emqHzLUaDTMCEiyC42APW7b7kIT/wJQQWVK4r3UUXNvp7wkFFn27wOHpFAggj/krfxPgR2jPFYEY0v/muMmBdCng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799007)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zfmIjDaWo+b5pAeIptXURFYLOvc/Upo7VeaeOaIwIpCMT6HU8BsN8Ze94W?=
 =?iso-8859-1?Q?aeFtZpYg+fdt3uDGc4Q/5MzY6d0IA7m0S90JQlcsnzv6oGYGFIDg97IXp1?=
 =?iso-8859-1?Q?vO3h/cbe+ObfBnNazf/383JFxhE4bJLQf4MpaWv9ed2ja85gTU5l2k6CQB?=
 =?iso-8859-1?Q?ezhtv8E+uBtwy9vHWLXvex5vSpmAQMgApLCxoqEkw9iOka70GAwXGNRQB3?=
 =?iso-8859-1?Q?AbuUdIJsYo1m2VnhSC/KlwTTaDH+VkAXG+J6VLDq2PNVQm5j5tPT+W16jq?=
 =?iso-8859-1?Q?rx18qNJ2vxV0qrV2E4qHy9zjStqw/GHSFXsJ464edVqZPaGBUo8KIco0by?=
 =?iso-8859-1?Q?0FuOQr5HIUzGGYL8Az3W0gmlT8516HSzPf3Za1UeyjQfpsTe8KZd1Mv5OX?=
 =?iso-8859-1?Q?i3CMFCoPeJTmQyptf1hefOpztGZHXc+MoQdO4xyg1xl92rFPCFByFvVi18?=
 =?iso-8859-1?Q?zrZ0Asb4NhfbtR1iOEmD2Cm2E0ymYlMjO784lgsaUN6sfouB5jfxpZFtMb?=
 =?iso-8859-1?Q?6et5u7j5vOvxwF3ngCbdVFWqylP2uZPJmRBQNxXLWEwVh6i5MLup0SENqq?=
 =?iso-8859-1?Q?RmMltkuY93kr0KChhnJhZQCes/LxBPvQmmwIwSj+BW05wLQztYSaXiEJ6L?=
 =?iso-8859-1?Q?1G9zuarSUJXQPudjJPWafYXciTmbC7m09+lijA7tDaXK38KOiJz41cMD6L?=
 =?iso-8859-1?Q?aLxNCtlzin2ZjQGO7WILIHAUK4iO7GednpPO2eTv7Vips5bD1/VdOU2tLT?=
 =?iso-8859-1?Q?3EYDjHjYU/sKj+YK6Gyz0Fnm+w963Mb0MuGBBVPUAMwC7Ypg3ReeVknQnT?=
 =?iso-8859-1?Q?ydM6H2A7oqQAVH3D/mFCKG7NmfnuWUFcQ6VVnepEQncW6tpbfGFu4Ydk2a?=
 =?iso-8859-1?Q?+9hxgWom+cyRvqtMIlwlGAQSfKMLUJgJP+CZb6WInG9v6YfhupGvMNhLW0?=
 =?iso-8859-1?Q?08iVyP4A2Tf047iVSH89wZQscwHNzXSSxdPxV7g1Cx030Ow14P/zV8fAGH?=
 =?iso-8859-1?Q?Ljv4mJzK3e/JTMuBLpbGx4kyC0OVB8sYkaNSYjW82bx7/R1JB8gUSb9z//?=
 =?iso-8859-1?Q?byk3UnIjo+HxBy9fifS6IcC/xZbzwqvMV6sioJ+nrtxBktwZc57UVug2IX?=
 =?iso-8859-1?Q?+YwMMiS8gOcHNJOicIDSn1IF91GpHQoqulZwvhxL0EOgu40IS7d6xDyerm?=
 =?iso-8859-1?Q?8io1MqFsU9us2EwZohLZGaCOjl1rcjvQihg4WFTN6heQXuJXmf0G3XrMIA?=
 =?iso-8859-1?Q?kXK9h3Ea8OjkYnh3a7AIrABhj8p9EFA5q8UY/iEUdzzL26sww6LddwGj3Z?=
 =?iso-8859-1?Q?BSdaCCPVzg/E3dg6IfN8WH27+Or08OOFqlMyZfB617IP94po6fYrKZtRZ5?=
 =?iso-8859-1?Q?CACkbsEooQ0rS0t7KRaU653v+JQ4RwEWPwtqhfHuhp2DDNUng+FTPeFdxa?=
 =?iso-8859-1?Q?IPTNXxJ0IX45PFlQ0G7AEmm6q3APfgOPS0en4JL3+AAnYiqGVs8irkIns7?=
 =?iso-8859-1?Q?+GlezL1kGE9eQ+qaKM7OqYBPa9KA9WyhFpQQDTIwzSNIUfjv8LKLfhWQ1t?=
 =?iso-8859-1?Q?7dzIvN0dd969/37v8a6P7RQ0oy+1BFkKW0BmRwZJHys82CkK2IzW3mahLb?=
 =?iso-8859-1?Q?NHuyg67ooOqeKRCORTP0o1QBbJwxeIIPJihyIB8YZ/GgTXXitgzTtTnHoo?=
 =?iso-8859-1?Q?r0f3z7LkU1GpJ5i9VsqJltr/sngFQzYbZ/i4pHTKO17cH7PGplPPHJbrD/?=
 =?iso-8859-1?Q?Gg9v8SN3M101e1ozrt73ysDBrdLG58LIvG+FNz/NYmmJFJa5T5zjSRFAWW?=
 =?iso-8859-1?Q?y0erZ63+iw=3D=3D?=
X-Exchange-RoutingPolicyChecked: S3CZmb+eaR83MKKwiomstE5L4qV1QyQEXoQ2LdRyLdKaQ9Neqs8zIHzAidPAWfWRAwIxQzsflKQr9opF3BowBWLw/cNM0srNZhgfaij0Jff4RcAGb/ZOApsyMKDmnuD36cNf0CEELgmGuwbP6zGpINxcVF0MbhbKViDvQryqLwCBJoNK4A5phZTTVou8jFNaU7BdR1LNLhTOSIz+OD8mQ15NlUt5Wx+RTqLQa+d1z/SbgC3OSd/AIkE9F5uyQtrwwhQrP1TqANWh1Xco68bTBidZg0Cy6mAiE//JkO1ZyBskm3Is9JkwS3VboANwlqfZGQvG5ZTYnc1kW9zBr+aRRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2f7037-91e9-441f-7d56-08debee60f2d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 07:27:24.2306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5/8I32tKYObocl9hLj0tVyTh71VX/qviE4r6FJRZ0gyXfUFHQiSHW4vWVNGjK/nLfYrxKFKEX5mH/FEUJJODg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 19.3% regression of fio.write_iops on:


commit: b3bfaf6505df7705d1d7aa21e09c19a98b10dc84 ("[PATCH] locking/rwsem: Remove reader optimistic lock stealing")
url: https://github.com/intel-lab-lkp/linux/commits/Peng-Wang/locking-rwsem-Remove-reader-optimistic-lock-stealing/20260521-183741
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 43a037d4fa6d7e7f9437e069f857a5e06eb2dff7
patch link: https://lore.kernel.org/all/20260521095926.29363-1-peng_wang@linux.alibaba.com/
patch subject: [PATCH] locking/rwsem: Remove reader optimistic lock stealing

testcase: fio-basic
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	runtime: 300s
	disk: 1HDD
	fs: btrfs
	nr_task: 100%
	test_size: 128G
	rw: randwrite
	bs: 4k
	ioengine: ftruncate
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.shm-sysv.ops_per_sec 14.3% improvement |
| test parameters  | cpufreq_governor=performance                                |
|                  | nr_threads=100%                                             |
|                  | test=shm-sysv                                               |
|                  | testtime=60s                                                |
+------------------+-------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605291757.b455c22c-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260529/202605291757.b455c22c-lkp@intel.com

=========================================================================================
bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runtime/rw/tbox_group/test_size/testcase:
  4k/gcc-14/performance/1HDD/btrfs/ftruncate/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/300s/randwrite/lkp-icl-2sp9/128G/fio-basic

commit: 
  43a037d4fa ("seqlock: Allow UBSAN_ALIGNMENT to fail optimizing")
  b3bfaf6505 ("[PATCH] locking/rwsem: Remove reader optimistic lock stealing")

43a037d4fa6d7e7f b3bfaf6505df7705d1d7aa21e09 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.04 ± 36%      +0.1        0.10 ±  2%  fio.latency_1000us%
      9.89            +7.2       17.10        fio.latency_100us%
     17.86 ±  2%     -17.3        0.52 ± 20%  fio.latency_10us%
      4.63 ±  6%      -4.2        0.44 ±  2%  fio.latency_20us%
     39.20           +19.2       58.39        fio.latency_250us%
      0.13 ± 45%      -0.1        0.06 ±  6%  fio.latency_2us%
      5.17 ±  8%      -4.9        0.24 ± 46%  fio.latency_4us%
     16.12            +4.5       20.57 ±  2%  fio.latency_500us%
      4.52 ±  9%      -2.8        1.73 ±  3%  fio.latency_50us%
      1.86 ±  4%      -1.6        0.26 ±  3%  fio.latency_750us%
     80.70           +23.6%      99.76        fio.time.elapsed_time
     80.70           +23.6%      99.76        fio.time.elapsed_time.max
      3398 ± 24%     -50.1%       1696 ± 21%  fio.time.involuntary_context_switches
      1275 ±  3%     +30.2%       1660        fio.time.system_time
  31138255           +37.1%   42697561        fio.time.voluntary_context_switches
      1633           -19.3%       1318        fio.write_bw_MBps
    449877            -8.3%     412330        fio.write_clat_95%_ns
    561152           -12.2%     492885        fio.write_clat_99%_ns
    150967           +24.5%     187975        fio.write_clat_mean_ns
    159157           -19.1%     128723        fio.write_clat_stddev
    418163           -19.3%     337623        fio.write_iops
 3.889e+09           +20.6%  4.689e+09        cpuidle..time
  33940620           +37.1%   46542688        cpuidle..usage
     25.27 ±  3%      +5.8%      26.74 ±  2%  iostat.cpu.system
      1.05           +16.2%       1.22        iostat.cpu.user
    128.58           +14.9%     147.79        uptime.boot
      6572           +12.0%       7362        uptime.idle
      0.75 ±  2%      +0.1        0.81 ±  2%  mpstat.cpu.all.irq%
      0.13 ±  2%      -0.0        0.12 ±  2%  mpstat.cpu.all.soft%
      1.03            +0.2        1.20        mpstat.cpu.all.usr%
    183168 ±  5%      +7.7%     197182 ±  2%  numa-numastat.node0.numa_hit
    707493 ±  4%      +9.4%     774114 ±  2%  numa-numastat.node1.local_node
    750282            +9.4%     821047        numa-numastat.node1.numa_hit
    375447            +9.7%     411736        sched_debug.cpu.nr_switches.avg
    386408            +9.5%     422976        sched_debug.cpu.nr_switches.max
    340142 ±  2%      +9.4%     372192        sched_debug.cpu.nr_switches.min
   4394759           +10.1%    4838493        vmstat.memory.cache
    742204           +11.4%     826992        vmstat.system.cs
    427361           +10.7%     472956        vmstat.system.in
    380208 ± 67%    +111.5%     804091 ± 22%  numa-meminfo.node1.Active
    380195 ± 67%    +111.5%     804078 ± 22%  numa-meminfo.node1.Active(anon)
     20479 ±143%    +928.0%     210520 ± 16%  numa-meminfo.node1.Mapped
    134972 ±  4%    +334.2%     586041 ±  3%  numa-meminfo.node1.Shmem
      1016 ±  2%      +6.2%       1078 ±  2%  turbostat.Avg_MHz
     28.30 ±  2%      +1.7       30.04 ±  2%  turbostat.Busy%
  35943585           +36.1%   48919629        turbostat.IRQ
      0.06            +0.0        0.07        turbostat.POLL%
      2.05           -10.7%       1.83        perf-sched.total_wait_and_delay.average.ms
    635441            +8.6%     690012        perf-sched.total_wait_and_delay.count.ms
      2.05           -10.8%       1.83        perf-sched.total_wait_time.average.ms
      2.05           -10.7%       1.83        perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    635441            +8.6%     690012        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      2.05           -10.8%       1.83        perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    183285 ±  5%      +7.7%     197373 ±  2%  numa-vmstat.node0.numa_hit
     95133 ± 67%    +111.4%     201074 ± 22%  numa-vmstat.node1.nr_active_anon
      5148 ±143%    +923.4%      52686 ± 16%  numa-vmstat.node1.nr_mapped
     33827 ±  4%    +333.3%     146565 ±  3%  numa-vmstat.node1.nr_shmem
     95133 ± 67%    +111.4%     201074 ± 22%  numa-vmstat.node1.nr_zone_active_anon
    750372            +9.4%     821016        numa-vmstat.node1.numa_hit
    707583 ±  4%      +9.4%     774083 ±  2%  numa-vmstat.node1.numa_local
    841564           +54.2%    1297873        meminfo.Active
    841532           +54.2%    1297841        meminfo.Active(anon)
     85390 ±  2%     +17.1%      99975        meminfo.AnonHugePages
   4263847           +10.7%    4718785        meminfo.Cached
   3400733           +14.1%    3880266        meminfo.Committed_AS
    101799          +182.4%     287453 ±  5%  meminfo.Mapped
   6510661            +6.6%    6942224        meminfo.Memused
    148510          +306.2%     603279 ±  2%  meminfo.Shmem
    768695           +11.0%     853548        perf-stat.i.context-switches
      5070 ±  7%     +35.3%       6858        perf-stat.i.cpu-migrations
      2575 ±  2%      +9.1%       2809 ±  4%  perf-stat.i.minor-faults
      2575 ±  2%      +9.1%       2809 ±  4%  perf-stat.i.page-faults
    759278           +11.3%     845041        perf-stat.ps.context-switches
      5014 ±  7%     +35.5%       6795        perf-stat.ps.cpu-migrations
      2544 ±  2%      +9.3%       2781 ±  4%  perf-stat.ps.minor-faults
      2544 ±  2%      +9.3%       2781 ±  4%  perf-stat.ps.page-faults
    210458           +54.2%     324493        proc-vmstat.nr_active_anon
   1066202           +10.7%    1179895        proc-vmstat.nr_file_pages
     25450          +182.5%      71894 ±  5%  proc-vmstat.nr_mapped
     37204          +305.5%     150855 ±  2%  proc-vmstat.nr_shmem
    210458           +54.2%     324493        proc-vmstat.nr_zone_active_anon
      2110 ± 50%    +202.1%       6377 ± 22%  proc-vmstat.numa_hint_faults_local
    934523            +9.2%    1020627        proc-vmstat.numa_hit
    868232            +9.9%     954306        proc-vmstat.numa_local
   1003773            +9.0%    1093947        proc-vmstat.pgalloc_normal
    295121           +26.3%     372800 ±  3%  proc-vmstat.pgfault
    301174 ±  3%     +13.5%     341864 ±  3%  proc-vmstat.pgfree
     16096 ±  5%     +18.3%      19037 ±  6%  proc-vmstat.pgreuse
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events.record__finish_output.cmd_record
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.cmd_record
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events.record__finish_output
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.cmd_record
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.perf_session__process_user_event.perf_session__process_events.record__finish_output.cmd_record
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.record__finish_output.cmd_record
     12.70 ± 80%     -10.8        1.92 ±142%  perf-profile.calltrace.cycles-pp.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event
     12.30 ± 78%     -10.4        1.92 ±142%  perf-profile.calltrace.cycles-pp.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush
     12.15 ± 78%     -10.2        1.92 ±142%  perf-profile.calltrace.cycles-pp.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event
     10.31 ± 85%      -8.4        1.92 ±142%  perf-profile.calltrace.cycles-pp.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event
     10.15 ± 84%      -8.2        1.92 ±142%  perf-profile.calltrace.cycles-pp.add_callchain_ip.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit
      5.59 ±107%      -4.7        0.88 ±223%  perf-profile.calltrace.cycles-pp.cmd_record.perf_c2c__record.handle_internal_command.main
      5.59 ±107%      -4.7        0.88 ±223%  perf-profile.calltrace.cycles-pp.perf_c2c__record.handle_internal_command.main
      7.33 ± 84%      -4.5        2.80 ±148%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      7.33 ± 84%      -4.5        2.80 ±148%  perf-profile.calltrace.cycles-pp.main
      5.92 ±126%      -4.2        1.76 ±223%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      3.95 ± 72%      -4.0        0.00        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      3.95 ± 72%      -4.0        0.00        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      3.95 ± 72%      -4.0        0.00        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      3.95 ± 72%      -4.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      3.95 ± 72%      -4.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      3.95 ± 72%      -4.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      7.31 ± 94%      -3.6        3.67 ±160%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      6.27 ±118%      -3.5        2.80 ±148%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      6.27 ±118%      -3.5        2.80 ±148%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      5.92 ±126%      -3.3        2.63 ±223%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.calltrace.cycles-pp.common_startup_64
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      3.42 ±100%      +0.7        4.17 ±223%  perf-profile.calltrace.cycles-pp.__free_event.perf_event_release_kernel.perf_release.__fput.task_work_run
      3.42 ±100%      +0.7        4.17 ±223%  perf-profile.calltrace.cycles-pp.sw_perf_event_destroy.__free_event.perf_event_release_kernel.perf_release.__fput
     20.04 ± 76%     -16.4        3.67 ±160%  perf-profile.children.cycles-pp.cmd_record
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.children.cycles-pp.__ordered_events__flush
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.children.cycles-pp.ordered_events__deliver_event
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.children.cycles-pp.perf_session__deliver_event
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.children.cycles-pp.perf_session__process_events
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.children.cycles-pp.perf_session__process_user_event
     12.71 ± 80%     -10.8        1.92 ±142%  perf-profile.children.cycles-pp.record__finish_output
     12.50 ± 79%     -10.6        1.92 ±142%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
     12.50 ± 79%     -10.6        1.92 ±142%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
     12.15 ± 78%     -10.2        1.92 ±142%  perf-profile.children.cycles-pp.__thread__resolve_callchain
     10.31 ± 85%      -8.4        1.92 ±142%  perf-profile.children.cycles-pp.add_callchain_ip
     10.31 ± 85%      -8.4        1.92 ±142%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      7.94 ±132%      -7.9        0.00        perf-profile.children.cycles-pp.ksys_write
      7.94 ±132%      -7.9        0.00        perf-profile.children.cycles-pp.vfs_write
      5.59 ±107%      -4.7        0.88 ±223%  perf-profile.children.cycles-pp.perf_c2c__record
      7.33 ± 84%      -4.5        2.80 ±148%  perf-profile.children.cycles-pp.handle_internal_command
      7.33 ± 84%      -4.5        2.80 ±148%  perf-profile.children.cycles-pp.main
      4.44 ± 59%      -4.4        0.00        perf-profile.children.cycles-pp.__mmap_region
      4.44 ± 59%      -4.4        0.00        perf-profile.children.cycles-pp.do_mmap
      4.44 ± 59%      -4.4        0.00        perf-profile.children.cycles-pp.vm_mmap_pgoff
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.acpi_idle_do_entry
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.acpi_idle_enter
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.acpi_safe_halt
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.cpuidle_enter
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.cpuidle_enter_state
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.cpuidle_idle_call
      3.95 ± 72%      -4.0        0.00        perf-profile.children.cycles-pp.pv_native_safe_halt
      3.92 ±107%      -3.9        0.00        perf-profile.children.cycles-pp.map_symbol__exit
      6.27 ±118%      -3.6        2.63 ±223%  perf-profile.children.cycles-pp.handle_mm_fault
      7.87 ± 86%      -3.3        4.55 ±169%  perf-profile.children.cycles-pp.asm_exc_page_fault
      5.92 ±126%      -3.3        2.63 ±223%  perf-profile.children.cycles-pp.__handle_mm_fault
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.children.cycles-pp.common_startup_64
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.children.cycles-pp.cpu_startup_entry
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.children.cycles-pp.do_idle
      4.10 ± 72%      -3.2        0.88 ±223%  perf-profile.children.cycles-pp.start_secondary
      6.47 ±115%      -2.8        3.67 ±160%  perf-profile.children.cycles-pp.do_user_addr_fault
      6.47 ±115%      -2.8        3.67 ±160%  perf-profile.children.cycles-pp.exc_page_fault
      3.98 ± 74%      -1.6        2.38 ±223%  perf-profile.children.cycles-pp.its_return_thunk
      3.42 ±100%      +0.7        4.17 ±223%  perf-profile.children.cycles-pp.__free_event
      3.42 ±100%      +0.7        4.17 ±223%  perf-profile.children.cycles-pp.sw_perf_event_destroy


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp4/shm-sysv/stress-ng/60s

commit: 
  43a037d4fa ("seqlock: Allow UBSAN_ALIGNMENT to fail optimizing")
  b3bfaf6505 ("[PATCH] locking/rwsem: Remove reader optimistic lock stealing")

43a037d4fa6d7e7f b3bfaf6505df7705d1d7aa21e09 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1251446           -75.9%     301654        stress-ng.shm-sysv.nanosecs_per_shmat_call
   3450142           -68.9%    1074649 ±  2%  stress-ng.shm-sysv.nanosecs_per_shmdt_call
    322286           -22.9%     248566        stress-ng.shm-sysv.nanosecs_per_shmget_call
    219186           +14.3%     250564        stress-ng.shm-sysv.ops
      3658           +14.3%       4181        stress-ng.shm-sysv.ops_per_sec
      7507           +45.8%      10944        stress-ng.time.involuntary_context_switches
  14229412           +16.9%   16632333 ±  2%  stress-ng.time.minor_page_faults
      1785           +49.8%       2675        stress-ng.time.percent_of_cpu_this_job_got
      1036           +51.4%       1569        stress-ng.time.system_time
   1605102           +24.8%    2003722        stress-ng.time.voluntary_context_switches
  12183165            +9.5%   13338260        cpuidle..usage
      6385 ±  3%     +25.9%       8037 ±  9%  perf-c2c.HITM.local
    154924 ±  3%     +19.3%     184900 ±  3%  meminfo.Mapped
     56527 ±  3%      +9.7%      61983 ±  2%  meminfo.PageTables
     18.15 ± 11%     +47.5%      26.76 ±  6%  vmstat.procs.r
     58533           +22.9%      71928        vmstat.system.cs
    239900           +15.2%     276246        vmstat.system.in
      0.71            +0.1        0.78        mpstat.cpu.all.irq%
      0.14            +0.0        0.17        mpstat.cpu.all.nice%
      6.89            +3.5       10.36        mpstat.cpu.all.sys%
     11.83 ±  4%     +36.7%      16.17 ±  3%  mpstat.max_utilization_pct
   5045408 ±  3%     +18.5%    5977715 ±  2%  numa-numastat.node0.local_node
   5226760 ±  2%     +16.6%    6096126        numa-numastat.node0.numa_hit
   4935973 ±  3%     +14.2%    5637088        numa-numastat.node1.local_node
   5018567 ±  3%     +15.2%    5782749        numa-numastat.node1.numa_hit
   5226696 ±  2%     +16.6%    6096100        numa-vmstat.node0.numa_hit
   5045344 ±  3%     +18.5%    5977690 ±  2%  numa-vmstat.node0.numa_local
   5018578 ±  3%     +15.2%    5782937        numa-vmstat.node1.numa_hit
   4935984 ±  3%     +14.2%    5637277        numa-vmstat.node1.numa_local
     44.00           -25.4%      32.83        perf-sched.total_wait_and_delay.average.ms
    136083           +37.6%     187199        perf-sched.total_wait_and_delay.count.ms
     43.82           -25.5%      32.65        perf-sched.total_wait_time.average.ms
     44.00           -25.4%      32.83        perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    136083           +37.6%     187199        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     43.82           -25.5%      32.65        perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     60660           +23.5%      74920        perf-stat.i.context-switches
      3628           +51.4%       5491        perf-stat.i.cpu-migrations
    240822           +16.3%     280126 ±  2%  perf-stat.i.minor-faults
    247803           +16.3%     288104 ±  2%  perf-stat.i.page-faults
     59664           +23.3%      73595        perf-stat.ps.context-switches
      3578           +50.8%       5396        perf-stat.ps.cpu-migrations
    236274           +16.3%     274869 ±  2%  perf-stat.ps.minor-faults
    243169           +16.3%     282723 ±  2%  perf-stat.ps.page-faults
     38758 ±  3%     +19.3%      46256 ±  3%  proc-vmstat.nr_mapped
     14176 ±  3%      +9.3%      15495 ±  2%  proc-vmstat.nr_page_table_pages
     34663 ± 17%     +34.6%      46646 ± 19%  proc-vmstat.numa_hint_faults
     27962 ± 23%     +51.1%      42243 ± 16%  proc-vmstat.numa_hint_faults_local
  10246657 ±  2%     +15.9%   11879228        proc-vmstat.numa_hit
   9982711 ±  2%     +16.4%   11615157        proc-vmstat.numa_local
     43773 ± 20%     +37.0%      59949 ± 15%  proc-vmstat.numa_pte_updates
  10940550 ±  2%     +15.5%   12640941        proc-vmstat.pgalloc_normal
  14977157           +15.9%   17360370 ±  2%  proc-vmstat.pgfault
  10590608 ±  2%     +16.2%   12302205        proc-vmstat.pgfree
   1242845           +14.3%    1420964        proc-vmstat.unevictable_pgs_scanned
    339.83           +40.1%     476.17        turbostat.Avg_MHz
      9.14            +3.6       12.78        turbostat.Busy%
      4.17            +1.6        5.73        turbostat.C1E%
     59.56            +3.6       63.17        turbostat.C6%
     27.42            -8.7       18.68        turbostat.C6P%
      7.09           +27.2%       9.02        turbostat.CPU%c1
     76.31            -9.7%      68.91        turbostat.CPU%c6
  15351025           +15.5%   17723005        turbostat.IRQ
   1748282           +26.1%    2204598        turbostat.NMI
    158.43            +9.1%     172.81        turbostat.PkgWatt
      5.20            +2.0%       5.30        turbostat.RAMWatt
     15202 ± 21%     +45.4%      22111 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.avg
     44395 ±  8%     +24.7%      55374 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.max
      7949 ± 26%     +69.1%      13440 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.05 ±  9%     +50.7%       0.07 ± 18%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.21 ±  8%     +15.2%       0.24 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.05 ± 10%     +51.8%       0.07 ± 18%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      0.21 ±  8%     +16.3%       0.24 ±  8%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
     15419 ±  7%     +45.6%      22447 ± 18%  sched_debug.cfs_rq:/.load.avg
      0.05 ±  9%     +50.7%       0.07 ± 18%  sched_debug.cfs_rq:/.nr_queued.avg
      0.21 ±  8%     +15.2%       0.24 ±  8%  sched_debug.cfs_rq:/.nr_queued.stddev
     88.44 ±  7%     +20.7%     106.78 ±  7%  sched_debug.cfs_rq:/.runnable_avg.avg
      2088 ± 57%     -72.9%     564.91 ±109%  sched_debug.cfs_rq:/.sum_weight.avg
    435307 ± 48%     -73.3%     116029 ± 98%  sched_debug.cfs_rq:/.sum_weight.max
     29171 ± 52%     -73.3%       7775 ±101%  sched_debug.cfs_rq:/.sum_weight.stddev
     87.80 ±  7%     +20.8%     106.05 ±  7%  sched_debug.cfs_rq:/.util_avg.avg
     15202 ± 21%     +45.4%      22111 ±  9%  sched_debug.cfs_rq:/.zero_vruntime.avg
     44395 ±  8%     +24.7%      55374 ±  9%  sched_debug.cfs_rq:/.zero_vruntime.max
      7949 ± 26%     +69.1%      13440 ± 20%  sched_debug.cfs_rq:/.zero_vruntime.min
      1181            -5.1%       1120        sched_debug.cpu.clock_task.stddev
    118497           +13.1%     134053        sched_debug.cpu.curr->pid.max
      0.00 ±  5%     +10.8%       0.00 ±  8%  sched_debug.cpu.next_balance.stddev
      0.04 ±  8%     +53.3%       0.07 ± 18%  sched_debug.cpu.nr_running.avg
      0.21 ±  7%     +16.0%       0.24 ±  8%  sched_debug.cpu.nr_running.stddev
      8607           +19.6%      10297        sched_debug.cpu.nr_switches.avg
      6329 ±  2%     +21.8%       7706 ±  9%  sched_debug.cpu.nr_switches.min
      0.67           -10.3%       0.60 ±  2%  sched_debug.cpu.nr_uninterruptible.avg
     11.11 ±  8%     +35.4%      15.04 ± 26%  sched_debug.cpu.nr_uninterruptible.stddev





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

