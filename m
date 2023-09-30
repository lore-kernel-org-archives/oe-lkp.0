Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A991388
	for <oe-lkp@lists.linux.dev>; Sat, 30 Sep 2023 02:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696042428; x=1727578428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c2fXqADM4q6xlBgn9qmAZboWeKx63tdhh7KXXI5nXuk=;
  b=iDru3NBEwOAVvvaKM0fFC0sIwUO2NR12eMujhXOvqHH/dtLfS3wdRuXg
   9PmEeOUMD3QcdTqqiiGiRJC+qc7E6GMrN/Xt6mulBp0nmv9Df/rmyUs3F
   pIO5xU42Z5inhFs2YBrKttEpbyGloKphlV2YzKlH0r8kqJ0kblA/Zpgvk
   mfoDdjpeg98pwCjndTeH1Vcc5h5M7eAsk1+Ew8RaGIe8CDWE9ZUEuxhh5
   UIInjqq0QHYaj+b5qi6IBGm7N6ChtawGuAsoppjo5+sTz5QkczE/K4W8D
   bStWETJCNdFqgZsfm6loHcU2VRamSzIXctEfO8wOLIJszTuUHxWVdTTtO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3991779"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="3991779"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 19:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="820361922"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="820361922"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Sep 2023 19:53:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 19:53:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 19:53:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 19:53:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 19:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGi9Vl1N91vDYMrIAM08vFbM75V3t66SQa95OW/FAdOu8on5lT22ldsALpg6e/54moZs9n9KZV88MMbw1GIVtlFCe+/1jzedhkZSD5PYKEUzMxKDvlPqRX3MYMRM00WB9JMe+gT3/9Czhl1Idujw7xiUAbVHslCwITR7/OoZnJx6e+G3p5Ha+v5WEV40eG38qUwgHn0cs5vtzS64TFEb4vSSfsSSRJ8hpQ+R7lU6pEZwZ2J5KG48NqLykqTekW8hW3LspHtwnishp4yE1wLbxig/GUg2C4GZvnpGzi8FMRSi+OE4bozD7zLA4yrqzA/3w94EWfL47pGcMZb6OctSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHuNbRgexFnlBfa6o0a/L5wcFI6IvTxg4HDLIy3UmA8=;
 b=hlg1/KpcSrkZQWbA9vTe7r0OWDkM1MzrxoNZYMrB+SDnusn86Wb6YAfsTDOQJqsQSLTKcs1PlpFUGVpf6qeo7b2FAeujQar/ghOyK7DwOEz25tEDvHc6cv2rySPruP4T/uaybFVxQNfnmkbSUi7lZUSDoFo8OF/qx2344lJgtP+oRextzxQqm/F2cSoNax933PPKh90N7ZKVOk4sKEikWJJNh26fuSVDv5txcPJ1CCTtO+YedT+fe192oeXJZjjkw0+PAg2MLiDLSQSLfP19z0ie+Pgjt4bcwdtbt9QOroHGpqV+ldXmdDCRqqfkzRhvrnrXhzX6MFDbpSrJpOuiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Sat, 30 Sep
 2023 02:53:37 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 02:53:37 +0000
Date: Sat, 30 Sep 2023 10:53:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dave Chinner <david@fromorbit.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [dgc-xfs:xlog-grant-head-bytes] [xfs]  7eb8d07ad0:
 xfstests.xfs.011.fail
Message-ID: <202309301000.a6eba40-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: a314fa9a-bb11-49b1-3678-08dbc1607189
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gbby6ukt49YGJSaf3PgQpvLZwJPOcgwYpU04acI1Wxk0ygxEDfr6dFibQfvfgY6K1ps8kTXTwUHevPR91KT5dTsH0LP2A0cSLwgyQoFxcVW5cxUc9UdcuBcrkIaeswkyaGG0LMLdBNCB/2YEWpuinxW3V1W/7PKRryqDPKM5XdpBm4b7AdEA8XjpGHzJ3CjqLwp0a0Xqngwyek9RICQmkaljeByeCarqoVuBK7cLbIVhM/8ASQuJhLrDO6Y6uVbKunks6v29oma/htrmBg6rFFQhjaqa2Ldgdb9plZ4NbMpi45xtZQcEg+Lu3uEuc5cv8iTnlb/dYpjinSuJhUMGHDb2S7Z+8QQhbqFSpm+RayiBZugR0Jl0/Dg/o1vOoZ/WFCbbiLMDSaKVsehirpWHUNzPV1haK4jK8LPuqFkSbGBi57EPfC1BLxIfYWtSmADfSQjUaalXd88vE7pKA/83e/ry/SN1xHd+d6Hkr0hyF3Q0/06hF85WO5leziNQepwGJycUsvsUELpkxPzsifEdazXkoJIRsCicTbmQAJKS0tEgLoEFTRZWDusF6IQ+1mXTxGybZxiiM50kxNX79/nIiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(86362001)(26005)(2616005)(1076003)(6512007)(107886003)(6506007)(36756003)(6666004)(6486002)(478600001)(966005)(83380400001)(82960400001)(38100700002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(66476007)(66946007)(66556008)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nV6p6zubzFvmvM428jLp4fCvS2cB8uCawwb+by1ERGbzs9oeDDEIX98jsPz+?=
 =?us-ascii?Q?IBbXpC1zZNCniV2NnPJLtnEMXiNAFBkPCx3REpGEBTd1NFvXBTfW2GvxoCPK?=
 =?us-ascii?Q?VPksf5KFxOVttJ3txrRDjU8dKNs8aDAT482kkG4zSjMIFWp7QMgUsbiAKsMC?=
 =?us-ascii?Q?ta5U+IkoPytEx/b7Mz9vFdd9r+Ydzc2vpDvFlZlR28MogRlpSa5SFl+zQgmK?=
 =?us-ascii?Q?hpzXazNMU8pWFRxyl0xHsAhK0MWFojEye2Y/dxI/eXiQZLLv1HDBLe7Hb3i4?=
 =?us-ascii?Q?HkS4WeFA6Wx68eLvkH9hMERqzMlJw0MsSQtIsYxRrs7YDoKft2jortcFKr7F?=
 =?us-ascii?Q?5hzJM/B81zhEYUIK7LptzZJGs0AJ5KaImhbz3TAFSNpY1IAFFzcuLuYxnP3G?=
 =?us-ascii?Q?A+C0LLItnM40TxUb9/CteburkBGGrLY74agkPjrTOuWxtUE8XGMONCsvsYwe?=
 =?us-ascii?Q?JfGLZwh3iifuF47HZqjXrNLDM5vxZrP8JlW/G2qU4Yk6xNoTO6+WWUvjbOiE?=
 =?us-ascii?Q?edxcKaFIOYc9KuXeTJVs65OS9oK1Gbyt5nKhaGvNK1DWbeA50n1msO6rUoQk?=
 =?us-ascii?Q?sRzld0PwmJln5P+pZYeGKgtq3+Cb130zdz62OnPw3AYSFYchKYIlRsRo/m6g?=
 =?us-ascii?Q?xR8eO2Uw+8WivFU2GkloNcxUF88Nj6jL/mNN/0Cd9PtEG9g/n1kJYJAmAHE+?=
 =?us-ascii?Q?juEb7pq0t6M4Op7O73Ae4fF+boad2g2vVP+qwYNrIc5ZBQl4iqX7miX77iTs?=
 =?us-ascii?Q?Y6MwgWanbYXnQ/J8lB0+hY0SXseub490iotUUWV4GaHD8kvGkhkkMb6zuNjs?=
 =?us-ascii?Q?i4/Fsl0pcp8vhiHP7N/AQ8zEHfmBulWqxwgKyNdwYxpCQ4ppRGreHbwyZDOV?=
 =?us-ascii?Q?uAbLlONemCtxVx37TfwgIldlIYlFdEFlrNAepxcIWqjYgXONQ29R36sQfgYr?=
 =?us-ascii?Q?Zh5/Lh8FUPXbam+hwzk5ONTD9ZWuqxToB1XNU3oxY8VSSrMtu2UQle9FCbGS?=
 =?us-ascii?Q?Q6P6fHKWjHfIKPKqjcWCJNp72jyWrqkwvY6Bhcl8v/W9tpmgaF2XUCqMHpvK?=
 =?us-ascii?Q?b5zSlRMQVQ3ku/pk0gD0jSY+qXxUPxHJnklYOPHCA8/MbTMOIXm/zxIxu5JX?=
 =?us-ascii?Q?q5HYW43v9EGGLZ9Fnwtz7OcRbup7+Q+l6tbcVM5PAdC/FeIeaFC+lHUrtR7H?=
 =?us-ascii?Q?YtTb/vcD/NzZO3jumsaqN9wreyeA9r9fcU643aVgDL1tIJaDSIm1rShbACJR?=
 =?us-ascii?Q?w1TEwlLYHPlvldqFYCwoN9T77CqFdyYh1dbW1qlQsA0rzIwyFxI6v+abhcgZ?=
 =?us-ascii?Q?PMioAmzE38z3y45yLvjHgKG2QsCnpSTlwfrOgd4ZBEoBfFlWqA8vEalCLNga?=
 =?us-ascii?Q?/xv5JKFQCJTCpom0TDv1yVAzAWW/COAr7UJHNE9OQE3T6HLdLsmObk29vgWg?=
 =?us-ascii?Q?9sFIw8mCb45ETHbINQSB4K3YAiwHgIIj2RzBTT6VAOI7rCaZ+ARVYtC0M/2S?=
 =?us-ascii?Q?Eqd+PxiHlfesS34dwcCJvnmYNtWvmkrNFCv0WaRUzo+mIbiePKMaGRHGkxET?=
 =?us-ascii?Q?nSVtm5SyXNBNgTySpXWOFPAJId9pPPM204cKddjCkOAoZj+Aaaii01STfFsW?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a314fa9a-bb11-49b1-3678-08dbc1607189
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 02:53:37.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXtlOafT5Ep/NW2yKOPIv0qMZ3P9T+b5Sc+ciOEr0m7gkEQyQJfbMHIiN6erg4DB08Ha7TdBFSNtrPgm2siELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "xfstests.xfs.011.fail" on:

commit: 7eb8d07ad0f2233dc7566bccb4bd20065f9eafbd ("xfs: grant heads track byte counts, not LSNs")
https://git.kernel.org/cgit/linux/kernel/git/dgc/linux-xfs.git xlog-grant-head-bytes

in testcase: xfstests
version: xfstests-x86_64-b15b6cc-1_20230925
with following parameters:

	disk: 4HDD
	fs: xfs
	test: xfs-011



compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309301000.a6eba40-oliver.sang@intel.com

2023-09-26 10:05:43 export TEST_DIR=/fs/sda1
2023-09-26 10:05:43 export TEST_DEV=/dev/sda1
2023-09-26 10:05:43 export FSTYP=xfs
2023-09-26 10:05:43 export SCRATCH_MNT=/fs/scratch
2023-09-26 10:05:43 mkdir /fs/scratch -p
2023-09-26 10:05:43 export SCRATCH_DEV=/dev/sda4
2023-09-26 10:05:43 export SCRATCH_LOGDEV=/dev/sda2
2023-09-26 10:05:43 export SCRATCH_XFS_LIST_METADATA_FIELDS=u3.sfdir3.hdr.parent.i4
2023-09-26 10:05:43 export SCRATCH_XFS_LIST_FUZZ_VERBS=random
2023-09-26 10:05:43 echo xfs/011
2023-09-26 10:05:43 ./check xfs/011
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 lkp-skl-d06 6.6.0-rc2-00034-g7eb8d07ad0f2-dirty #1 SMP PREEMPT_DYNAMIC Tue Sep 26 12:19:53 CST 2023
MKFS_OPTIONS  -- -f /dev/sda4
MOUNT_OPTIONS -- /dev/sda4 /fs/scratch

xfs/011       - output mismatch (see /lkp/benchmarks/xfstests/results//xfs/011.out.bad)
    --- tests/xfs/011.out	2023-09-25 16:30:56.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//xfs/011.out.bad	2023-09-26 10:07:27.992138770 +0000
    @@ -1,2 +1,14 @@
     QA output created by 011
     Silence is golden.
    +reserve_grant_head (4096:) does not match log_head_lsn (1:8192), possible leak detected.
    +write_grant_head (4096:) does not match log_head_lsn (1:8192), possible leak detected.
    +reserve_grant_head (4096:) does not match log_head_lsn (1:761856), possible leak detected.
    +write_grant_head (4096:) does not match log_head_lsn (1:761856), possible leak detected.
    +reserve_grant_head (4096:) does not match log_head_lsn (1:1490944), possible leak detected.
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/011.out /lkp/benchmarks/xfstests/results//xfs/011.out.bad'  to see the entire diff)
Ran: xfs/011
Failures: xfs/011
Failed 1 of 1 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230930/202309301000.a6eba40-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

