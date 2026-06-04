Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E03CEB9D
	for <oe-lkp@lists.linux.dev>; Thu,  4 Jun 2026 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556285; cv=fail; b=GfiD9eFA+9OtMJV+oKcNZ4p0l1jlSuxkjytARnoamuedoRzSZh2fax64TGHV3m79MbFrM5kPH2YiOnugCfse8lcnwoeYxchJfmqEvK7TGECvZOoa74jHWwssdrr+TOKAwFbGabGSK9UC9f9T2V1CJn8xzbmTnG6fexPKty86HBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556285; c=relaxed/simple;
	bh=CRgHJn/qReImpeS+VeHmIByX+7lOUFa7YCE4RB+caWQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VRlhk4OgOOHuUvsjQqPiUbWjVLuJV8zrZEAbscm2P8YNR3/ZS5xhvwLPJbGFGwSfwTD/kEm4FdnzrzEqwb0ITVLym0zyNLhqNHyuAGcCCwesUUBL/WdIk+Bliynm2sW8G/hpc2qNELLwR2/jJVEtW5xDk8B1l2DRzwwbhLTG1y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEF1Jbql; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEF1Jbql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780556284; x=1812092284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CRgHJn/qReImpeS+VeHmIByX+7lOUFa7YCE4RB+caWQ=;
  b=XEF1Jbqla0TsgOCsLsRiYs2qk84KV2SZyd0sPGxNthd9CN+pkUnpCF1w
   qlntvz295sQJ1heJri/xn0cRUE2CygVJpljJ5uN7fwPlODPKpZFXuOtNp
   UnEnW4xYaKpUHFSb4uPEJrzc8RVAdF3VC0i2k8T99K9dO39nBgzzNghbz
   SbwFNySVBOLisiEeD9YLqNNGsHAecHOXgm0J8p+DTgscdBhIZuu8vaaCm
   F/Y05+cZfa89UYHJ5BzAaJPlwuC+1ho/x0sOWfcCZL+WH4G/qvtAKlH+u
   L8xrB7VE6XKUTrxTsE4xQxLYKoahpf2jGoH22Cb0aJKTqEGIyp2t1DGog
   w==;
X-CSE-ConnectionGUID: TMhfHhTTS06unqOVxxu+mQ==
X-CSE-MsgGUID: 0fnf2PErSvCOLJNZtR7rKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="106823781"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="106823781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 23:58:03 -0700
X-CSE-ConnectionGUID: 4BBl3kC4S96KsSq1D3ZAOw==
X-CSE-MsgGUID: xXzO5Hq8TfmOdVr2sEbmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="241495323"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 23:58:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:58:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 23:58:02 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyLR9rq/fOeLHYQ+BNkI5GzeGFE9WrDw+iqVX4nA20sSSuldpSyeJpc1IzyjMynDU5QxTSa5YGrYij6E6uuCuVHNGyACdnr8yK0nzZIjdTmqsea8VUVPr4M8V2zLmE7fqNeH23INtU9Ll9h7h5rnR0Ki0p8NTVE+iTHAERGq1t6qfCJQmW5cvtKzzhouEdAcGEEXPypEV8vK9JOCWG23F+5WNc2mgcEr+DQBaRdj4ce1CCUAc8zEwbEXysHPftGrW10rePYgOf5xts6ri9Vd7GaU1sW5hXV98RWZzD7kT2clLFG4lAfTeKvR1Q9ICuounqQ5TnYBbWNIQWkOp1vAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyEtOGJIErXYfZ/nMQuqh6L5DIb5iEnNoAyCu1IBdd8=;
 b=r3jyAM7/bsVb5LIEd0xL5WVyU4aSjZYj1950WRJ30q0OllaD9e/9C6h4zOLMNs1v6rQS60Wx6nMIr0AfbwdZ2+llMedUXjJimoz/ZT987cTy92Hzveune5fnMHn4QVRMy73H7kLR3BGoYesLMQ57oB4khoiJz4LiBvZ5xcJOR1AkNnkMY3PKNAsxr7Wg57U0tzvMELsvCzve4HbjvAjEaGxgNPtORTULonTsopB448ArgHwnBR3cfDpePLsMGqxLQ502VbfrcQND+zQAVyJWOCx42IWG2U81Y6g+nZYYzLEf7xhulHUzOZN/zd+ZXsjVtQOUhLiwK+jFnziWiUe8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH8PR11MB9880.namprd11.prod.outlook.com (2603:10b6:510:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:57:55 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:57:55 +0000
Date: Thu, 4 Jun 2026 14:57:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:vfs-7.2.procfs] [proc]  0ec6945730:
 kernel-selftests.proc.read.fail
Message-ID: <202606021924.b6d8a0c2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU2P306CA0064.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::15) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH8PR11MB9880:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a7fe49-5283-437f-00dd-08dec2069a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 8ar3JEpyWTsBJCCJEX1KozPy5uBQdupDFj2tG0N3o3YGx0yfJaLV+cJzK00SPdqK5ObRgDdz66ZHP1YVTQZwDKuMIhE23pQ3DYL0Iu3+GOb+T09i7NhNs9pBQ8GPOEUGKjORKF6dVOlp28Ypw8VPSEhzxDniPnM+bVHTtIqdygF4FpSlsKgvIkDhdEI9nn0x3wS8McfTxOgQiVvBBLvflUmtU8YJ8SvB2CqJTeG2mcZW/n2nMzqjwJxM5lb6bFL2xRG+dRaDCbGdyymBkVTqqQE5pZj4iNp6L7KvhJHt08TjvJE7OOnOxff+w6Aa/ik54Yu1nwouDa/BbqjzCHl2cVO6EWOhh8o/iC7mDn0cs9LOsWN0JSqGkHcLT94xaOCYL8lDXQsIhVrt6ra1t8LJZsDnoaJ89LfzDNny0LhNkCNz8UVmkcn2agf5zmRqN4M8qkxVsGgTk4+ettuPZ8hCpIWzIWjcHfgZUX6tFiO25gzlRiGR16FlT9a8y2ErMnJQ4OkzNWuHhLqgexnes2K0pjEDhynIt1O49lqsxhd6VW4wpw3KdF7QRjcTtZ0WihzJjLRbiQfkBPcseTSXTt6VVaElxmSNeaoLt3B459J0927lzLLzjgVAumfrZOrQdwtnR8tdUWoKmC3qFhR6H5k5C7+qFrvPjMVdQatJ43OcVlGZBEiXlCaLBs4NW4lAIjlINrW5XC7kTRYljW3+qLNEEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vVEY5wZRbo1xhQGg/X8N790+iqD2079WlwNmnj1YLMdrwE4R4MZ6pyisIVOk?=
 =?us-ascii?Q?Eo73+SVQ+gAOtHgRDE2FVBMOnaJi9UfsG1zxLJt5AXLw/3SwzVdUlvZYKBUd?=
 =?us-ascii?Q?edrmic+zg/ez68d/vZPvaIOkb/Iw9z5sJMiLo4/TgDD1aNycDdHq2/qaQNqp?=
 =?us-ascii?Q?PoVv39uCooHvhUs1X2NqPo+4A3go7AD+lIwtFDgft8gp8IpM7josjf7WwLNS?=
 =?us-ascii?Q?qg6OZbm0itP0JOKwvVfVILWNWb/0SJWco5HXEM8IvZVJeR55vVNXBKmTgonP?=
 =?us-ascii?Q?Gpgm8rMhABkhV04dQXlGY+VbL3OIfO73z++HSvIlLNJP7P9E2VnktdzMqptG?=
 =?us-ascii?Q?ee6GZGLC/29fYYllGdl2HyAOykccyjIB7yvSUQzY7BXWllOj0GngVkSm5zEt?=
 =?us-ascii?Q?GcgF0IBw/7yp2qv52WY1yiAe54QJSm5efwSiJ/zmDtFAZiHmIrs6/Go6x8cQ?=
 =?us-ascii?Q?/jJSBccpWHyw5KX3XjtZyJNB0z8xLMyxeGiupbAS0rDl8VjOw48r9otcGiMc?=
 =?us-ascii?Q?LlQvQIOyToabkrI0octbpMLUKaB2c1cUZ1xe8Qu4toPhicDTW5B1ZaOlLQRi?=
 =?us-ascii?Q?c6v6kPY78H9k2vX4Fa2vrCdWPr6BoJmfVrimlbH+5gwrLX7OX7OC7iANyNwP?=
 =?us-ascii?Q?iYBS5mV6jKNYq+wopAclP4jWOGMflZURH8vh9ppclK7W7K+QR6YqaB9XvaLB?=
 =?us-ascii?Q?UwJJXxRNl60ofm+jm71LWB8Xn1FVhcv6V/DEP8UXKzbyViT3WQuzEHZoW3r3?=
 =?us-ascii?Q?YqgHbRcwHS8XlWcS8CheIYYlhA3SA4FCTrhHx450Ygbkd00+6IUlC3Dzg5hU?=
 =?us-ascii?Q?MghmurrNj+a6NfwOnu/WI2Dr3bcU7Bp4B25FFkXrYIa3iyfn74SHH2GnYF2J?=
 =?us-ascii?Q?1FE/ErTU//5i2cgkZLp+Xj/dXfyxaNybaKZbxd2yVsN5bS13x+6d1nRQgBTu?=
 =?us-ascii?Q?QE68tZVl5FWbCcGr1DUZ39BR157/ATwjvENa2OY65ZLsCOQQ23XOCZCd7kw2?=
 =?us-ascii?Q?Xqdxn3MF9/miP5FQSxvunYfT4n2BdVmssKx8zMCkMAiqsByAsEF3h/4HAEu3?=
 =?us-ascii?Q?5ZpTJlSRx2GanXAt/fPsLGQYR8Y1m7l5GZF/hs1noSzR7MTrCh/AO0vVkQZU?=
 =?us-ascii?Q?43F/fYFvydTKMfJfcvt4hwbNQsc5o7TgR3SqijAiwNbYhcVNWlFbxKgK5UGz?=
 =?us-ascii?Q?1vjoVvZRr7X0cFDvLcunm+EVM1hg89ekIvTj+G4ip6LdZDLcxPoxlEA0yP4E?=
 =?us-ascii?Q?gy8JzT6dzB68dSG6/dvVc/8QGT+MxD7+cHLW5sQEvsAzEgpTLS2WyrKNH287?=
 =?us-ascii?Q?ADDMihKwUvaBSnFR2SzTaotN3qO/GuYCKl2hY1l7TKgk91FGgGYk9NW07Rzy?=
 =?us-ascii?Q?5k3odnIsCNHIB+wWWTybXwBXY4guearVNpAAGi+b+AQV2L97kcfkRW1iGOvV?=
 =?us-ascii?Q?zaryx9FwKx9nmlC1CdLwr7QKMZFi3Pn1lNGIxkjYko5x0UdnAyu5M2L4AB0c?=
 =?us-ascii?Q?T+agsi4ddmQUcIpCXHlL0TKT0A+YMsm+1AVS7rqwEaBlypaHvV/0ihK2hKQ8?=
 =?us-ascii?Q?VWDBbEpqI6PpS2JxXO9115Ucjtdv1VPXGt78VVTNZfvUY18CpbLRWf0L7HtI?=
 =?us-ascii?Q?+djMsS12ubijgwScbUe7qZzEWQMy26ohP4XuLhi86Lm50eKjj3jP2nlueVk+?=
 =?us-ascii?Q?RRet7xD+CHreaDN7Jgr9QwNXXF+Mfhx1Q09yHY8KOEMY/4SPbYOtFxRd4llH?=
 =?us-ascii?Q?hdTeMsm+Nw=3D=3D?=
X-Exchange-RoutingPolicyChecked: dLQqLY4CbKVBkkrUOIRi65lvCb4XOvYoQa18lDh8Tah0Ph+R5lz+fMndsRcNmWsRFGrCh8D50McGaB1mDTXY2hcXGKzlTX7ByVqOvTWH091zMEXk6m7hba2hd2cFGdZ6GnUmeb3C0XuYE2dWQGGJ5P8+E/+AT8cFI+8E4YSmSF2uMETdD6rZsD/mIdeYTNb7fX9wFWqBz1W0XQLFQNumtRX+lHvtJJUukNhGS3q/xoz48g0KtzqHmqjvSLNBgXVTslMWG7CZYK0MaTy0UxXKeUyOyvASjLoSiu6V6Jku/PapdLN9X7Yr4VKDmZM4QWoV52qT68Z5PtvV+6KYwDGIVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a7fe49-5283-437f-00dd-08dec2069a7e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:57:55.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrfNmonvLW4QzFrfbxakfC5mIvEJ4Z4ykubKDB9amvnKwLkYRb1JaFBdmvJqEMgIltZU3e7UCSbUK/0V+pTSBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9880
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.proc.read.fail" on:

commit: 0ec6945730e17fb8a44283114493b1a54caabf09 ("proc: protect ptrace_may_access() with exec_update_lock (part 1)")
https://github.com/brauner/linux.git vfs-7.2.procfs

in testcase: kernel-selftests
version: kernel-selftests-x86_64-174914ea5513-1_20260531
with following parameters:

	group: proc


config: x86_64-rhel-9.4-kselftests
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606021924.b6d8a0c2-lkp@intel.com


# timeout set to 300
# selftests: proc: read
# read: proc.h:49: xreaddir: Assertion `de || errno == 0' failed.
# Aborted
not ok 19 selftests: proc: read # exit=134



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260602/202606021924.b6d8a0c2-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

