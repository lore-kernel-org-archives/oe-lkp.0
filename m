Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48EA4CB44
	for <oe-lkp@lists.linux.dev>; Thu, 11 Jan 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSeIaNfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704987123; x=1736523123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MuCYefFxEmhbVXxR37H4zuD/dTYtdSWgpkk04qqxn1w=;
  b=dSeIaNfpiEE0duW4eTWaW6JItsE5mNuXyC45u9qMmmFBrLSraXN/+40A
   +qrkGVtWLuzZ9C3ju+TL7kQyrvdCOLR8CSzT2iWNl59hCrVRwuZQvPduE
   EySW7+PndbGAcyLDgsR8s9VD4t2mHWTK3aWxnAvyHIsuLnhzYJYOKAEYR
   n2TmCHkNkWhhjSW7BRnRTiUvF7/T5ZhxdU7dnNYBDYnHnElXOd0B6JmmF
   R8OSh4OApZB/YRg1NkvoGAiUkGVVlFmo1RM4iJ/VrPD18hCqp3ajo34jh
   +zVrcp8Ano0xf2xaCvu7Xv9HG24H6HyDzrfIjC9L+JzJUkdPQSaWRoQuV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="396029303"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="396029303"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 07:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="905981751"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="905981751"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jan 2024 07:32:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 07:32:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 07:32:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 07:32:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 07:32:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPz3ZLm7P+gZwngWwTWhVAjkFdN3mzr1mJsm6/wPupFrm6aqfm6yrmAG6rTODVdVd0Im8LC++FtLcDXOrq5+eqwR3mE2LD93URl5m4Rjjn6o0z8szixUZSsc2VYbe95KVqDpjGtD4f5x4zxHFTmIR0JoB2H3uc+EBZ+L03I9Yu592CrNF4fky7kKjC6IGB1aQY7THlRM06Fnn2w5sbSFR/jMVL3gw3+swSU9jb3frwXBFSHEZ6aznIWDBVgOdenWiPrZYGMD/83+vYccy9XlGPFicLv4cFK2OujToKKEDbCY4XdvpXbyZyBMxJvohl+o4ghzs5WjhpYYVV7ibhoc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdSJmps3SxpklpkhkE3gQgjLTUoK0JxVDLah3mOS7y8=;
 b=dAE1pV3ubnRwWHxadw5mqXitn4ugdpog4Exur78xMjyciIl6nXWczOn8fx05530rFRw56LKt8mzu6J6Ym8WL1T8OwtP3suUCT1z9+i+uW+pcmkMtob0IARlVsuxgKUYLG+xUS8udVCAqAClyc1ruYcPDLzzL0NJsQ/plUeG7fCAxMCDirhA2bgwIGAXfoFuogZ5C+jxMKKp6XcGGeuTXIAYgbRbfRxiHzqmG9gDNmDSCGczp7UZAj2TswtHOe0am0CSn1WUqswCnv9cAv4cyM74Mo3fZOEWvAr108OD/h0M3KsjA3/W1UEp17t9auaCAuKA367xdBU5YQUsRyaXFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB5457.namprd11.prod.outlook.com (2603:10b6:610:d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Thu, 11 Jan
 2024 15:31:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 15:31:58 +0000
Date: Thu, 11 Jan 2024 23:31:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-misc:xfile-diet] [xfs]  27c53ce7ba:
 kernel-selftests.kmod.kmod.sh.fail
Message-ID: <202401112324.2c67cf42-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: df5f7ecd-42f6-40b2-5dd6-08dc12ba731a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QV0X0e2NubyvBhHzl0UJMxoT/l0oGXK1PcOQ+UblqISfkXRA2MeJ5Di86SDL7g98E6TqrLTQpb4dMlHDW2NrcDN+7kOu/goO3bwbT7Fp1IXTyLk2YDG7dJgQKBc1iWIRk7m8bmgQKGG4KhEE5qsiR7t1aJCwBpR+Bj8CrSolsH/hQtMXIUSpwSxUbXrRSJPK/F3Cj6tuqXq+OOziN9FIqmM6OP01bqkLKWV8WHuEvdIleOMNMeJG1HVTsT91N7x5zp83kLAsG79LeMskyfgDHGJRZsXgYSGm3um2SqRb3DYv6koXlTskXOU6COoKkVL2F6n3tc5tDGFoECk9oeb0wBzsWF4fjxyaQYR/+uldC2Ljk+bO5LwLe17OthTzkMykE4g92FJFNVb680KtBABgsRDQMci1l6fwNW5h/kSG+jeBBU+off/1lp5z+sZ4dLFRDxSLfdgShMlz+5xZvQL6qhBdZbgqLxZs+j2JA0ExxzlPG9V9jkJAl1fJ+aCTjxu/+ZUlEstPemjix07c/Nu6uO9Q2hjQs2oXncKCXzR2H5T2iTz3u6t4cVg0UpL/X5nwYTRZ19Be2VyevBg5uo+oDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6506007)(1076003)(2616005)(26005)(107886003)(38100700002)(6512007)(8676002)(8936002)(4326008)(5660300002)(2906002)(966005)(6486002)(478600001)(6666004)(66476007)(66556008)(316002)(6916009)(66946007)(41300700001)(82960400001)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmBlCVpYQeeykUROrZilj8wEr5goZ12MUcC/PA/TJo9o4tm2dCvqtK8yay1n?=
 =?us-ascii?Q?+8VUOj7v97rGc5M2y4WLPL/5UMaCQRUpTFKWhzZPXhZ/bcgLDkvygjAkjJb7?=
 =?us-ascii?Q?lq1ZZo/cdK8s0oC4VCA5mWL0vqYFRFdGwRg6l/DNbKYOziXCW/+HDy3b3Ly4?=
 =?us-ascii?Q?edUWyxfXgrWtbwPPm8N1iN81VYbPUfL+WQ9bzc+4k/rcfctMwaEqYZQD+8+1?=
 =?us-ascii?Q?AP/53f8uHyLuIEP5fh62EhumyLnME5X/PeRRaEzqWZMzNivAqsMGqNMFZ7+f?=
 =?us-ascii?Q?WhbtNMBNRZIaONsi9iVC1bnwOzkkjHapmVklpN4Pjvv6kxZYcaTuR14jswnT?=
 =?us-ascii?Q?55Z0mBYWGlUcDyaL0E46RZ0aMl5gP9WAdHY964sk4awEtebUvlJv8cp5/j85?=
 =?us-ascii?Q?jwecDg30JGTb7otHo4AZlShBL5xfeY/fa4MZFEgqzSHnJ7x9uoZQidOhLyu5?=
 =?us-ascii?Q?aZT/ln7lR9cNQXefS29h/QZMYiS82VQei7wnIWpXfu9qwJYhkU7tcSUQdFeO?=
 =?us-ascii?Q?KmTiz4fVymKjSwogLp8PjeHMAU8EYAmrr/b7VJyD9A+NCykqcexar/Uq2Iwg?=
 =?us-ascii?Q?zF6d+E5TZ5JeUIlZei4e57log8NsbYPmHKF+suzp1PjgJ15TmkXP364vVfwX?=
 =?us-ascii?Q?+7+GbHRQt/G9mTrQIdC4TdWusXQGfRn3n5i2AO1FDI6uVzdXNOpU5hz51fj8?=
 =?us-ascii?Q?KomfOWhHaZ0D6238U2OwmzLnH9ITic0LsREkjs8bc5yuIcbkaA+TMhLjmI2j?=
 =?us-ascii?Q?INyWEbx9YPfETg/WldxRLj93cvKphIupySocvFwgsUqadT62za8kvKFKpHMg?=
 =?us-ascii?Q?8M0YaIOSscJz3sD30FhW8VUfPCvM3j8+C/6+PdgOGZuxYEx4e4c3SsWX3d1C?=
 =?us-ascii?Q?5a1W9ixM9Ovdy0V+ZoHm/DhTYrw2uqBibiSy6PhQJieCOIBI58G+MuZJoO1b?=
 =?us-ascii?Q?/p196NKdB7og+kIF+MTN9H+s9asjuFOlffgl9ocIlTwNvXkWZTYzvvtVWilg?=
 =?us-ascii?Q?G6do0EL4Adu5mrHFdpS9RTy5LsTiM7cVO3kiXGvBQ14FXKzGP9hNQ0Q/Dkr0?=
 =?us-ascii?Q?Uf2VKa8XYOJW0DgqpgVt6t8BatDg/efwjqY6SQKWM6Khab8hKhH2RX/FuWSY?=
 =?us-ascii?Q?uDgtJCdxVVsNLLGmqZFxHfG80Z/PvHnB29pomOsMRW+xF5LT/DjMe6joSS1U?=
 =?us-ascii?Q?qP29yYgXotOUqZKN7yVZkDbzR9nc9dJP+ki8Kqxye7ZNH12hlBgwLfxAclqL?=
 =?us-ascii?Q?LXJVOqC159ICgo/XZSiFntGgMO5Qbx9RvpGcOp7QZixMa2p4U9yEudeKbEvG?=
 =?us-ascii?Q?2Z2uAOxsefW1BQkpRpwMYOMRZOnJquAeU1A72UmaWCR2pskd36a43sLSRIJp?=
 =?us-ascii?Q?hUyXqnMX2vWn3f8/XIP/IbljH+qStUpQOrzjP3HQkqh4EJWcl0yCwNwfkska?=
 =?us-ascii?Q?jtghTgrY4bMmFz/hVJoJ9yHc/ecwDI7bhgMIlc5RkSrRxFmyKI5DzsRMsCi5?=
 =?us-ascii?Q?gRYIuix3RbW0FRTM3+f0jkzWjwjha4/jqnzqLXeZmLMlbGAYKYoWJ5fOJTs/?=
 =?us-ascii?Q?qkWqRfQAU+suGvbH+DeJ6cScKg1MYtD34L3FB6uTDaOHYPANOmwbsfZ2zAJp?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df5f7ecd-42f6-40b2-5dd6-08dc12ba731a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 15:31:58.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 964uhlf47k7MGY1FYjFMS7ERfyRnJDHpTOO4q4BAjLY/2HPN6qt4Tl/RytASBiuDHaw7dNOAx7oed+WNrQCgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5457
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.kmod.kmod.sh.fail" on:

commit: 27c53ce7ba0a1979d6593d8ae5cc1f12bac1b2e1 ("xfs: use shmem_kernel_file_setup in xfile_create")
git://git.infradead.org/users/hch/misc.git xfile-diet

in testcase: kernel-selftests
version: kernel-selftests-x86_64-60acb023-1_20230329
with following parameters:

	group: group-01



compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202401112324.2c67cf42-oliver.sang@intel.com



2024-01-11 06:34:49 make quicktest=1 run_tests -C kmod
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-27c53ce7ba0a1979d6593d8ae5cc1f12bac1b2e1/tools/testing/selftests/kmod'
TAP version 13
1..1
# timeout set to 300
# selftests: kmod: kmod.sh
# Thu Jan 11 06:34:49 UTC 2024
# Running test: kmod_test_0001 - run #0
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expected MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Thu Jan 11 06:34:49 UTC 2024
# Running test: kmod_test_0001 - run #1
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expected MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Thu Jan 11 06:34:50 UTC 2024
# Running test: kmod_test_0001 - run #2
# kmod_test_0001_driver: OK! - loading kmod test
# kmod_test_0001_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expected MODULE_NOT_FOUND
# kmod_test_0001_fs: OK! - loading kmod test
# kmod_test_0001_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Thu Jan 11 06:34:50 UTC 2024
# Running test: kmod_test_0002 - run #0
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expected MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Thu Jan 11 06:34:50 UTC 2024
# Running test: kmod_test_0002 - run #1
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expected MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Thu Jan 11 06:34:50 UTC 2024
# Running test: kmod_test_0002 - run #2
# kmod_test_0002_driver: OK! - loading kmod test
# kmod_test_0002_driver: OK! - Return value: 256 (MODULE_NOT_FOUND), expected MODULE_NOT_FOUND
# kmod_test_0002_fs: OK! - loading kmod test
# kmod_test_0002_fs: OK! - Return value: -22 (-EINVAL), expected -EINVAL
# Thu Jan 11 06:34:51 UTC 2024
# Running test: kmod_test_0003 - run #0
# kmod_test_0003: OK! - loading kmod test
# kmod_test_0003: FAIL, test expects SUCCESS (0) - got -EINVAL (-22)
# ----------------------------------------------------
# Custom trigger configuration for: test_kmod0
# Number of threads:	1
# Test_case:	TEST_KMOD_FS_TYPE (2)
# driver:	test_module
# fs:	xfs
# ----------------------------------------------------
# Test completed
not ok 1 selftests: kmod: kmod.sh # exit=1



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240111/202401112324.2c67cf42-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

