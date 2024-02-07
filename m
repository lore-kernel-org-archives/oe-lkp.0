Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD932200BA
	for <oe-lkp@lists.linux.dev>; Wed,  7 Feb 2024 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707293692; cv=fail; b=cJHwKWZAbut9h08qMg+WDk5PoF3bIQ+ZqVstr4uVHlxSdbQOEQj8X4vzGSVLBiK8e+Dc/pG9O2ZOFWboknBoS73pb275pA7AsPsLountLBGFyrtx5MzpkBz1gSK1XEjsu+tqURlqDXkJde5EymOtQlD2CDKZhCJ6AEHjSUHKH+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707293692; c=relaxed/simple;
	bh=G9Opd40EhniCo59VthJEPoqKyTvZOs+evhpYPBkYRgI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n/eYbRVJIE+x6ICnFtC4JTJwGYpWuCV5J9WufxISSmbwl0K/c37v074MQRm/IGorOi6/9POf51ZlqiW9+4uiqHqTEGf+aUwwkvZthpHE6+IN9eljQnXyh/uryhx4CWR7MozMmcihisZm50EpnF7xX41FoIRlcVeKkZgz86jOlKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ1jv6Pu; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ1jv6Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707293691; x=1738829691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9Opd40EhniCo59VthJEPoqKyTvZOs+evhpYPBkYRgI=;
  b=SQ1jv6PuWSQKQrJFeZSXm3o0oAar1XYOK+UKVkJVtKDDuxSg65ib9QM+
   7zWRdZQhs4Nb+Wh3OrKyEL2RfV0QsMlqruzHxyPY38ugXeNw9hQpPNQFa
   262Kd3+NI7RL7DuHfuYXay8sFXuA7SInIzPVQcnn5kGtW3HTtlmy7avzY
   55ttcNWbSzG0wdADtanA0QQlx4OGGhzcxt/YDSGZyzAl8iYJQhHn1N37z
   rHNEqyvmBNv7r2TnBY7l+eIuE9ikIjwFbgv7+eaaJmV9fsTkNl6dxejV9
   ms5RzBzjxL72BTdUtHxp9ZPNsICWdiFNGO0HLv6lQfgLGhmZ/LZ8Fup4I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12292330"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="12292330"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 00:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824426475"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="824426475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2024 00:14:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 00:14:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 00:14:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 00:14:48 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 00:14:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsgSu29KXEQ2NROBpbyPUe4Bd2lNq8KFHRWRk0b6aUdbbQia0QLrWmCYY2ZDwE2bu44e++T/wASlPynFHmPvugsVuDVW9h0Yik6zTA4AwGUa3tpr4PiQeUzoeuMZqsuzAJ6TBiG4cecQkm8nmg3rL/xnFymFBnpHaurpkh8PNa+yOsndShkCxpqHfzePr9Wm1tCJpnwxpqISzJkqStiO4VRVvEBnMZfpyGmDfIIsmF252OADUmvz5/zgDzdZ4xIkuIgBjJIswuIb5rsL/VgoJp54jax/8mOtpqhKCSdkfb4u95D6+3UJGOjAEwPEkd/hBtcR9Zz7fCBSDiuGZZUcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLR+vJdYliXc6u0H5XwDZ2vqX90VzP1Yc5/2dBuuKDQ=;
 b=MrHytaCQYeYL7QbxY9ylIShrYoqlefHEmSBQOA7vNJ9anwXyxHgtKDFFuPXf7IOi5TWBPuCv7HH8V0oRxhL8dMrjpKVbkRYB2g7H19HOiWj5zkFVPRbPuw0yckkH42zrGNpTYFkRW5N2hTtAXhRVNK3XBNE/y4WgR5QW0aG+0hUwhf2HUUSCmDkwCyhsJrwc6/VtLuzBbL+EJOE95fT70t0NJ5tzueya+YdkuI9rAfrKdVskuh30Dsv4F2ivvmkYLcSikqDoYFM5ukCIHgy2ngGBmM8EjodBZLgjTnqzUOYlRCL3KX0gEykcTbNu1xPmnX/av4DQlTk1VtGqUpAe/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 08:14:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 08:14:41 +0000
Date: Wed, 7 Feb 2024 16:14:33 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-block:blk-limits-base] [loop]  b022aefe4b: xfstests.xfs.513.fail
Message-ID: <202402071653.9d34be1e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: c20d3895-273e-498a-3f4c-08dc27b4d5a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVIGRjwly46aP93k9E+ruzuFFiN8VntbKBre5tmoNg1nTYCblXIMXUOY1I6vmd1o9lvIGDGDChLMNHHOWlfEMz2tOsG399PGCqhChgDEvK6vBIyBVnReG+8DVa3DTEHPdX03JGyejQtij3vPHLK5+5c2Tt+bJxwgQcyc2yWqF8t2QK7FlVx1NiUGv+bEcBTg/922r8O61PEXf+6HYLGdh4DmjDDiolet8un9SEWzwH3iWOVJCS6NC5aaPlQj9JU4UiTeZpV0NowK7mMZGBZ/BvNKVHZbQQQWIfd+GC+H5+oxuTn/nd/k5eVxy64UTOSoI6V/gI+hfCHRyM9rXzzEDjB7aekJc9+tUsNK2AFVCKONeTN6Wc0HnE6j2l1DavrHkPI30dYnbPKQ3Y+wFvjqmp5USO0YP6fWXOXYRc27qRvBrXoB8XL3ypxAJjOqcnohdlZvlqCTrDyxLL4MNaZb+8ZgloGVjg5ciFh7szxdcRsmSsMC37FPrHqDlr4+chqitUgB1NKmRQ2VvgejtnkWJWoc/e5iiOpGsmevEepBHGQxz/raChhcJ/X2AnN1AbUdKG2p8P/t0KkwsjQqMqH8Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(8936002)(8676002)(86362001)(4326008)(36756003)(6512007)(5660300002)(966005)(478600001)(6486002)(107886003)(2616005)(1076003)(6666004)(6506007)(6916009)(26005)(316002)(66946007)(66476007)(66556008)(2906002)(83380400001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M5pBzWBW9ZOfCUp6zxZu/Rls9P28Cv8w/62cX7GiFsnRmchQ1issqx79O0xE?=
 =?us-ascii?Q?dCb22AX84IpWQ2MaNzxxEljTaGjHK6W+ALwOKr8EX5SaRhBMbqS7HiIaX/b6?=
 =?us-ascii?Q?8xeYRvIwWXLc7XFcdtwutp46iK7HN0q1RrbGMB1rObEGwoOrcJ03K2sYhJq9?=
 =?us-ascii?Q?nMvXdgkmCtVyKKW/adDqvu96JwnySW7e71mfJFnyeVyOpXwASXB/LgEm94Cg?=
 =?us-ascii?Q?9kgmIXZjHsIhrRMeQPpagfSmtCfild/uHHVrDINx/8JUKHHwRRbG4pJrtKwO?=
 =?us-ascii?Q?2Z6sQ2AV+8Tx2yscXxA0DC9AugFoqAt1LfmDl+dNM1qZvtuvY83Hmwdp+OUl?=
 =?us-ascii?Q?BVvOk9mkkRexJ5HaFyQkmbSs5dAda7rQ1kLuVcArOBjH3R/EmPRgprTT5Z1m?=
 =?us-ascii?Q?ax9J2B+Yzl11D3Y+0UCW9hadiOb2+oB8fdbJBDTYehMAxo0uXe3ZFhd6Sa3D?=
 =?us-ascii?Q?SUGkuVWXWIyRzunlcVG7QdmCWaapD7IGsGRzeWVCW7y2/Cfk53LIRQHeo+Ic?=
 =?us-ascii?Q?5LQzIgxzA6hLtwM731OcGw0cwG2AaudVFON0VJLeada/9FyGvgIdduSSdCGf?=
 =?us-ascii?Q?4Q50S7eJghWM2ioBaWQAoNQirVidJ1Av37QxZoybEQvkd2oLqbCPl8e189hm?=
 =?us-ascii?Q?MtGQ6xMPykVe6ORRnocy9KoRimrzNG+UHqb3iTYcUDZX9qgnBxyfe+n7KEu7?=
 =?us-ascii?Q?36fBII/pgn5obpwVqBScfftblEKFF5c9n+wQyaEeU877UkYFZHIEy1FGvxQK?=
 =?us-ascii?Q?qpo/zN2X750sIWu6yCBl8nPq7seUcgN+RfKChtPAGngGcmsdEe8z275Va1g4?=
 =?us-ascii?Q?ySiPGPw655X75ZaPd8h+sySbuSJdDvPPwzK4u3GU66eubFJxWaLXLfd5P3qG?=
 =?us-ascii?Q?37fCN3uAlb3ovdZkX7iEW+dwte1AHQgNLDIH31KEQWtdRBsSWx4bXHXp+6yH?=
 =?us-ascii?Q?xf+5JqUMooxZYzU7SFOy3addvC7LR6m5OuNTa6nJMEWHPzZXtn+Cysy/hL8k?=
 =?us-ascii?Q?XLAqTA42n6JlXU4UPdvul7vkbvIArlZGHdJIoFr10luRtDDPH3EFCmogCIL0?=
 =?us-ascii?Q?+22Zc1tvRE7tSnz/BVCyOoEe64QiImThQqVaQQDZeNtXybN1LCMXCsjRxiBl?=
 =?us-ascii?Q?W7HjUIsEwv6gYGiZbX0lPrzEhbAqQ0nKqsURUKrpoRMBM9rZ6PRvEpS7BQKp?=
 =?us-ascii?Q?Mh/fExJzGR3nCv5vXMMA7n7YIyNuccJ957NBsxDCqOL4R3ud+ZLdkhfh/2FN?=
 =?us-ascii?Q?nDbiu/1tia8S4QE+SJDNk+UQsz27af3/XIkmWFsXJN3iEWplCmNIbmIQMtz+?=
 =?us-ascii?Q?NfVhZ4sFH2jESlzRbTWqh0OsuIPdlZ7cS+ydDusmW0Yxam+x2yqj78rOmUag?=
 =?us-ascii?Q?shiSVclcgEZUZ42kmdmdux7B2VqnNhnSEp4p4Lj+1vYvTAkDEQymK58cB4yn?=
 =?us-ascii?Q?wnuywTVZVm6miwZsmG8t3ts7zsTlBTOrgn6Kbw6BaI4rjpZG4hzjfuM7yAT6?=
 =?us-ascii?Q?jwEX3I9niOcI7gvVChG6mK7ZaZWdSzn2wcRVtHG5F/6xrqjXTzb0+R8ivFDa?=
 =?us-ascii?Q?3tZnDobmY7i27f+gmJcQ7h0MAr0tPcTE5p3piI6XHu44YkE+92AYgj6uWYOw?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c20d3895-273e-498a-3f4c-08dc27b4d5a5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 08:14:41.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4607Zdx+HBz2iJ7ouXiGt81UfpHCHLIkiXz3HavE8vz4rzCDDtjOSH7wN5WFkAbpIEenN/fs0PAoGiba+f3otw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "xfstests.xfs.513.fail" on:

commit: b022aefe4bb85b8e26a4ea8895bf6cac278f2bfb ("loop: pass queue_limits to blk_mq_alloc_disk")
git://git.infradead.org/users/hch/block.git blk-limits-base

in testcase: xfstests
version: xfstests-x86_64-17324dbc-1_20240115
with following parameters:

	disk: 4HDD
	fs: xfs
	test: xfs-513



compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402071653.9d34be1e-oliver.sang@intel.com

2024-02-05 10:45:31 export TEST_DIR=/fs/sda1
2024-02-05 10:45:31 export TEST_DEV=/dev/sda1
2024-02-05 10:45:31 export FSTYP=xfs
2024-02-05 10:45:31 export SCRATCH_MNT=/fs/scratch
2024-02-05 10:45:31 mkdir /fs/scratch -p
2024-02-05 10:45:31 export SCRATCH_DEV=/dev/sda4
2024-02-05 10:45:31 export SCRATCH_LOGDEV=/dev/sda2
2024-02-05 10:45:31 export SCRATCH_XFS_LIST_METADATA_FIELDS=u3.sfdir3.hdr.parent.i4
2024-02-05 10:45:31 export SCRATCH_XFS_LIST_FUZZ_VERBS=random
2024-02-05 10:45:31 echo xfs/513
2024-02-05 10:45:31 ./check xfs/513
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 lkp-skl-d06 6.8.0-rc2-00068-gb022aefe4bb8 #1 SMP PREEMPT_DYNAMIC Mon Feb  5 15:29:25 CST 2024
MKFS_OPTIONS  -- -f /dev/sda4
MOUNT_OPTIONS -- /dev/sda4 /fs/scratch

xfs/513       - output mismatch (see /lkp/benchmarks/xfstests/results//xfs/513.out.bad)
    --- tests/xfs/513.out	2024-01-15 19:11:14.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//xfs/513.out.bad	2024-02-05 10:48:01.403892771 +0000
    @@ -20,6 +20,8 @@
     FORMAT: 
     TEST: "" "pass" "discard" "false"
     TEST: "-o discard" "pass" "discard" "true"
    +[FAILED]: mount /dev/loop0 /fs/sda1/513.mnt -o discard
    +ERROR: did not expect to find "discard" in "rw,relatime,attr2,inode64,logbufs=8,logbsize=32k,noquota"
     TEST: "-o nodiscard" "pass" "discard" "false"
     TEST: "" "pass" "grpid" "false"
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/513.out /lkp/benchmarks/xfstests/results//xfs/513.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      237d7887ae72 xfs: show the proper user quota options

Ran: xfs/513
Failures: xfs/513
Failed 1 of 1 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240207/202402071653.9d34be1e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

