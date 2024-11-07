Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5FEC0
	for <oe-lkp@lists.linux.dev>; Thu,  7 Nov 2024 04:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730955317; cv=fail; b=ABQmV5Y5mdn+NvZYr7saIBt39kW6p6pW/AJRmJHvmFrV2mW/kUyfmp5YM4hOD+JONzZ0wBaMdbgkyzYcOIyC/GT9J1XNX68v/55E3rTpmRAj/LvNQYDUIn4uNhJK8jfq7kQCWFlUTIIqev4PJmajnGeoCpYFAXIX1ZDN5lF1w6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730955317; c=relaxed/simple;
	bh=iCtnCKRKZOcrKGJ6Po/g69tdx4iYjlbK1UYyU4ESJxw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IaO2RYojwTag+fcjq/b0aZB1rYIzsc7UROC5ieK6OKf9Vs8CmZk8A3elosHNLRMv+RU3tcTiDp8sNrWIcc17hjMOEdsZuhshFt7dgO4JKooZKtB0Re1H5gS6Kjjg2j3I8KLS8h3q4NdepePuwvqQLT3vijJvWfCUHbwL3KJkqoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctT3bbHb; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctT3bbHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730955316; x=1762491316;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=iCtnCKRKZOcrKGJ6Po/g69tdx4iYjlbK1UYyU4ESJxw=;
  b=ctT3bbHb8R1wu6gMiRNmkEORxWEzFbpuJ5F/q9x/anksgCVFt0JU2nzt
   jXyXYhoZXnzpC6nP3Nr8mqCoc6S2fg0Pb891/NvxPAX7mN1Atm5YDHePl
   MUHvLnD9S3djUUMdFUH1n88qJsR5PulVhPMf0QhAOwqUAmF6OgaB7yW1U
   T9n0pTB3rUWIIoAH31eFq8lMCS1YaBIoeIZ/pcRU6/hxBl5F0UcuEbL44
   nH4orzL6vPUUEeAb1Fm75lLD/NdEGi2YleR2uflqRH6EBNJT/beLMfJXJ
   1I/maMbY0GijnsmKqFH4pkieZTPb+VSvu+lXWdrasQpxISgtza8eKH113
   Q==;
X-CSE-ConnectionGUID: /q6ALkFKSHOPsipvaJc/OA==
X-CSE-MsgGUID: ekTFElfXSm2RsYZL8OM9QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53337194"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53337194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 20:55:15 -0800
X-CSE-ConnectionGUID: Ercr8jN/ROuCAMeupQeEQg==
X-CSE-MsgGUID: cB/IAVieSI+cJisNcH2Rfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="90034279"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 20:55:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 20:55:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 20:55:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 20:55:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TH1MK8Hu2+HmB+i+IbkULCIwOZ3M+7jdkm/tXU5xNnimcdyU/5kZO+K4mBRomperXaXlhtyfbFpBi1mRwS95ImpAy9qHmjZKZq3g49ThOQUsM0u2Z9+v4FN3PQ5pf8x1d9h7vz6ycvQptnmfRgV0O3o45LOCKH7Sc0MH1vWTeQEK8Z14Vw/XqZWttBusl3pdco/HPtbIOHrZIHvijIKuGz8wEHYxiUe508zmM8WfEuBLG38mEfyw7EuePP2nKYqgIhEu0kxEmS/45O9TgdSY6Zd/4+e5a/z1USXYh9UGfGb4OhC37BFdlWxkLNZPzPGfV1832bQzOzhqvlgnIn1FIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wU23L9hqCUFeoxt5KD796USmfus5yzpJADXVcoU9Vk=;
 b=c+dYWOIFxVgi1TuqjIec59aweYnEStqKM+hB4IVeas7rsz0YCNAnuTIWvHUdCfGIQ9z+ajtlwJyq2av0fL1odcGJCxPaVHcngp7jquSQ7dhzV+pmKRaz6o1r/OEh3Vm74r3AcHCKGgLyJIR/v/6UH2EBRLvsdH8iOE5O1dgZdZXGUwPt7HQPwagPZmvrf1fhWgzLNTkGW5tgZqpdyhzAXxkfcGh/KGOIvgOUvHJdzz330wNqZyXCorCgQMlthE/zGqr0D70wd5ZId9d6gyPo9UkOae4oVyoM77DLADnrfW5hY7YXj0BkB/BgHf2UeNPzv6xYcU0O7mUmQDL7DLLmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 04:55:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 04:55:11 +0000
Date: Thu, 7 Nov 2024 12:55:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Chuck Lever <chuck.lever@oracle.com>, Mike Snitzer <snitzer@redhat.com>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <202411071017.ddd9e9e2-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 362221dd-c49d-4d80-13b9-08dcfee85c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CBCfZvD26cfcT2XuO0rJIuzOTWz2aifCmlJqpQKxJv4arMF1L/TKmJ0IXs?=
 =?iso-8859-1?Q?KfxqrFCpC5pvE2H5VdrM90v/yyXZl/nIB6BySgHJWHg8eyO6qO8W0U8Jhn?=
 =?iso-8859-1?Q?o2If2l0iaPt0XTaitVnfRQfuEq7xpIwGilh8r+tViShmcfbf7hWW+T0bHF?=
 =?iso-8859-1?Q?zZtEOYM+koBkw7CRpeQ+9ksUtET94545j8iPe9fjdfzKXf1+Pf+IkcXm0d?=
 =?iso-8859-1?Q?/5MCdkJJ3/K3V85QAxbon61MgqwoF5zr3isC3s6N+zyAkmSQuZjxjZlsyK?=
 =?iso-8859-1?Q?yBy6QCsSP7UZQ/2VVFz5UFWH9gsTvBIvTxLonuKtfGgFNFYr4OApih30LG?=
 =?iso-8859-1?Q?/mON7hHzDvN49sV2lu3w1fxAG1nPRy3iWWftStQ669t7rI8RmvEOtMCgZ1?=
 =?iso-8859-1?Q?TuLs1k+PmuzxWFSjF56gunkICXD5IMNWrJOZCPNr49YKfB94qePxjhuSTM?=
 =?iso-8859-1?Q?Mxi/s3UASxkreY9QR+ephwreOVSQHIQYjRMrfmrsx/g7hcAsD5Uc/1zCy8?=
 =?iso-8859-1?Q?fLEvy5YPsl5DnGxDG1smAzp7tqAqSs7XgbURwP2Ccp5dDfnKlUum9cisMJ?=
 =?iso-8859-1?Q?OpKuRtru+WXufBYSD2FRysegBdxvmaV75afJec8AC5cFZ02OKSr4J3SKI8?=
 =?iso-8859-1?Q?aqZxaO8nqjnrlPYn7NsVp+rh3PkxA/ntQrY4rYJu1/w1MlgMnR4DCELaj/?=
 =?iso-8859-1?Q?LS5U88GiD5YkFN1YniT87c5QlIywgZJCQhz2TBIZmtAsTnPBPR0Xx9H84b?=
 =?iso-8859-1?Q?VCEEq+r07h6nYsyU8U4jAENOoM7mvCx6AzZ4j8kY9gOCPrZ2QOcCDGtRIR?=
 =?iso-8859-1?Q?QhZkwu8zslhQxwKTvv5S57RDiHamU7CwXY4wt5pJXQnQhhbU33QN9Ad5nT?=
 =?iso-8859-1?Q?ManKk4SnJzi5Aga6padm5cYEZCys7icRPVfyOPiCxtuS07wbK4QzMzfRf4?=
 =?iso-8859-1?Q?MDIqFyDCYxQEOQdIvzLk+tFID3S7uW1kvqrLF9gMVm9s5ARv5zPJOVw5lg?=
 =?iso-8859-1?Q?1t0Hlqi+Ap5pBLGukjl8Uow/7PE54Rdw3ddXG/YVPFU5Yq6tMOGINHJivE?=
 =?iso-8859-1?Q?5BiHj83ctZdeCFOlc7tC/hUuWAqtq4cvhCV2mt/dZxIMm9DsKTV5mZdUAl?=
 =?iso-8859-1?Q?OKClRy6FWawIWe6qjRTEqpzmD9iXmSbIXZERxA9wiNpUZD5GxZ5VXkVsbJ?=
 =?iso-8859-1?Q?DbaUG3qrsug4XzQ0GOjy17WhBj5LWjpPYrDS3rWdCwgX9FYfbWqa/QGZke?=
 =?iso-8859-1?Q?loCZfVUgxqfOGsIWTEL4MO5GWcXdxW9z8NOSa0uOOIjeUKOzgfXIQi4p63?=
 =?iso-8859-1?Q?lqiXJqsAE0be7x7G/KgsWmRedw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zLKc5AlpXMgazzylLEVVVSWbUDb4By+d5my0RPxdM4VPyagCzFxd2wJ1gx?=
 =?iso-8859-1?Q?ChZHEmRE7z0QcC+1XOsDtrYaptBFWpOWaAOasrvz6bOJtz24tBIAhtTN3u?=
 =?iso-8859-1?Q?NFDNpieOuC6+9aaKnqy7rRlvbdC4fvjrIPd3mRMfo3wBSRHIiCGw0VhnjT?=
 =?iso-8859-1?Q?go8dzqQA+uGp3v3y6pFzTPKb/HRLTa7ugkMyayDPipzraS318zzR53dbOQ?=
 =?iso-8859-1?Q?D2E9FoVd2LDs53tV+oBJzCic88HrZRgyvNsCzle2DoFei6SOuBpU8cHFSK?=
 =?iso-8859-1?Q?sq5cfi+NjJxZ4toKJ2r6Uv535K+seI+DWDCFiYNS7aKhmuIpjTZyV/96YV?=
 =?iso-8859-1?Q?CCDeFGCi/qLfnZHRg5szXH2Vi2YPhny+avnTHdw1nWuqYzF+zGXs4N+2om?=
 =?iso-8859-1?Q?Tt2SNNEkpGVqfmUj6rJz2OcBQ+T7Xa7J3be6NRu+SSVaK/2ex3Lf1H9DBD?=
 =?iso-8859-1?Q?MR887v9dAiZ8ERiPngFFszxniCjkPtUkDXgJyBXfHD4j5EUUV5io1p+nUA?=
 =?iso-8859-1?Q?2m8T6GaWR9DOH8U5XNAUmzK6Z7M7tkelW56shiGkiPAYHITNsgK7Y4Jjsi?=
 =?iso-8859-1?Q?3+xU51x0LxMk5AcPOnSvbeG3I9PglkSElRHghfw5Par+rzUZV3WAnJ1kYS?=
 =?iso-8859-1?Q?3zC1mcVNixRqgdsXh+qqvU7yQOV0EpVI7RH6bejuEgVQwUY+T2nJioeWBe?=
 =?iso-8859-1?Q?XliqcxEflVo7OoK9vOgw7ORfcH0CDkAkYRLex1HQgVHfivxZ8Rwffcf7/s?=
 =?iso-8859-1?Q?kO9zDHN5Rce7oQJmwiDDv4CrR5CbhkcBKe56KLZp0DZ+K2Co/Q07Gm3ayT?=
 =?iso-8859-1?Q?D3g1UiwpNgHbz4iRLO6uMKIIJJdV3XIvQTEyLJNoG+q2aKlKNS4qs9jsyU?=
 =?iso-8859-1?Q?0UyFD3iaT/pnVGNFOxYSR+y57dpRgVkgsv0gv8oHWLEiqBt19fKd+kWmL/?=
 =?iso-8859-1?Q?mQC9N08tgpR+IuKSvR1hhcCObGkS/yeLeXSifiEcgrXLFK1gtOjzGX/urk?=
 =?iso-8859-1?Q?XnfETG6kKMfqG/GOvTGHuOWKwenAZTQLl8dCt3YrwINA7zbxwMI12qgaDN?=
 =?iso-8859-1?Q?Jz6g8SmwO735YCuapydkUm1i8YEWP+mvZ4Ptbi8ffsv2FskNrlnb2dVfhn?=
 =?iso-8859-1?Q?Q1LPZCgtVzU72vdSkno4nLBr+NTIl3aS1KQnbfAnBKm7kFkfaqZ6g8n024?=
 =?iso-8859-1?Q?E9dbJur3WJx5rx+h63POQ/5NCEIn1E+YUJKE5Sb1JcY+pgMSD4EOnG0uFF?=
 =?iso-8859-1?Q?ijp3FSjpbrZRagXof+i75y5UaPgGp3oOYFV7KFhiiQE/TNAZg/V7aLyuwi?=
 =?iso-8859-1?Q?65RVwPqlR9Yd3FY+ON0QqlHaqSvxHwGjR+TzzJwYeIt5l0vR2Dl54P0yvS?=
 =?iso-8859-1?Q?cxrBImQRoMaEPmCj0fbhEC2vvK6lmC2ipMr6nVApTtLowf3e8did+1U3X9?=
 =?iso-8859-1?Q?zVC3TG+xKR4PzY78FAjSoBSpJOhJDReSeAVocNy+r39szy3PIMViFyMwmP?=
 =?iso-8859-1?Q?mqbDVfiz8gl/kwxCKLxHZA8T7m66JJnTrleWDzF4TSmAEtCAFwq1dreUZw?=
 =?iso-8859-1?Q?WIl3NhQiYH1tQQE4rp2vP1u49HRo7ziAQR63j18+ysPhhR6svjFBPg50ht?=
 =?iso-8859-1?Q?n678I21N0HTU5BVDt5dkikUGj+sa0Z1bxMttLPlBje2raZxVoF6ZBO3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 362221dd-c49d-4d80-13b9-08dcfee85c06
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 04:55:11.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ysf2dWQ1ioaJKCsJ+5Dq+Uwl03p5jNDHnaNjwuLHVbaZOYMxRH74k240UrycODHt2EuP3NMjbNE7bdlwVKKxQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-OriginatorOrg: intel.com


hi, Jeff Layton,

in commit message, it is mentioned the change is expected to solve the
"App Overhead" on the fs_mark test we reported in
https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/

however, in our tests, there is sill similar regression. at the same
time, there is still no performance difference for fsmark.files_per_sec

   2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
     18.57            +0.0%      18.57        fsmark.files_per_sec


another thing is our bot bisect to this commit in repo/branch as below detail
information. if there is a more porper repo/branch to test the patch, could
you let us know? thanks a lot!



Hello,

kernel test robot noticed a 92.0% regression of fsmark.app_overhead on:


commit: b4be3ccf1c251cbd3a3cf5391a80fe3a5f6f075e ("nfsd: implement OPEN_ARGS_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION")
https://git.kernel.org/cgit/linux/kernel/git/snitzer/linux.git cel-nfsd-next-6.12-rc5


testcase: fsmark
config: x86_64-rhel-8.3
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
parameters:

	iterations: 1x
	nr_threads: 1t
	disk: 1HDD
	fs: btrfs
	fs2: nfsv4
	filesize: 4K
	test_size: 40M
	sync_method: fsyncBeforeClose
	nr_files_per_directory: 1fpd
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411071017.ddd9e9e2-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241107/202411071017.ddd9e9e2-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-12/performance/1HDD/4K/nfsv4/btrfs/1x/x86_64-rhel-8.3/1fpd/1t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-icl-2sp6/40M/fsmark

commit: 
  37f27b20cd ("nfsd: add support for FATTR4_OPEN_ARGUMENTS")
  b4be3ccf1c ("nfsd: implement OPEN_ARGS_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION")

37f27b20cd64e2e0 b4be3ccf1c251cbd3a3cf5391a8 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     97.33 ±  9%     -16.3%      81.50 ±  9%  perf-c2c.HITM.local
      3788 ±101%    +147.5%       9377 ±  6%  sched_debug.cfs_rq:/.load_avg.max
      2936            -6.2%       2755        vmstat.system.cs
   2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
     18.57            +0.0%      18.57        fsmark.files_per_sec
     53420           -17.3%      44185        fsmark.time.voluntary_context_switches
      1.50 ±  7%     +13.4%       1.70 ±  3%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      3.00 ±  7%     +13.4%       3.40 ±  3%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
   1756957            -2.1%    1720536        proc-vmstat.numa_hit
   1624496            -2.2%    1588039        proc-vmstat.numa_local
      1.28 ±  4%      -8.2%       1.17 ±  3%  perf-stat.i.MPKI
      2916            -6.2%       2735        perf-stat.i.context-switches
      1529 ±  4%      +8.2%       1655 ±  3%  perf-stat.i.cycles-between-cache-misses
      2910            -6.2%       2729        perf-stat.ps.context-switches
      0.67 ± 15%      -0.4        0.27 ±100%  perf-profile.calltrace.cycles-pp._Fork
      0.95 ± 15%      +0.3        1.26 ± 11%  perf-profile.calltrace.cycles-pp.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.70 ± 47%      +0.3        1.04 ±  9%  perf-profile.calltrace.cycles-pp._nohz_idle_balance.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.52 ± 45%      +0.3        0.86 ± 15%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.72 ± 50%      +0.4        1.12 ± 18%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      1.22 ± 26%      +0.4        1.67 ± 12%  perf-profile.calltrace.cycles-pp.sched_setaffinity.evlist_cpu_iterator__next.read_counters.process_interval.dispatch_events
      2.20 ± 11%      +0.6        2.78 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.20 ± 11%      +0.6        2.82 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      2.03 ± 13%      +0.6        2.67 ± 13%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.68 ± 15%      -0.2        0.47 ± 19%  perf-profile.children.cycles-pp._Fork
      0.56 ± 15%      -0.1        0.42 ± 16%  perf-profile.children.cycles-pp.tcp_v6_do_rcv
      0.46 ± 13%      -0.1        0.35 ± 16%  perf-profile.children.cycles-pp.alloc_pages_mpol_noprof
      0.10 ± 75%      +0.2        0.29 ± 19%  perf-profile.children.cycles-pp.refresh_cpu_vm_stats
      0.28 ± 33%      +0.2        0.47 ± 16%  perf-profile.children.cycles-pp.show_stat
      0.34 ± 32%      +0.2        0.54 ± 16%  perf-profile.children.cycles-pp.fold_vm_numa_events
      0.37 ± 11%      +0.3        0.63 ± 23%  perf-profile.children.cycles-pp.setup_items_for_insert
      0.88 ± 15%      +0.3        1.16 ± 12%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.37 ± 14%      +0.3        0.67 ± 61%  perf-profile.children.cycles-pp.btrfs_writepages
      0.37 ± 14%      +0.3        0.67 ± 61%  perf-profile.children.cycles-pp.extent_write_cache_pages
      0.64 ± 19%      +0.3        0.94 ± 15%  perf-profile.children.cycles-pp.btrfs_insert_empty_items
      0.38 ± 12%      +0.3        0.68 ± 58%  perf-profile.children.cycles-pp.btrfs_fdatawrite_range
      0.32 ± 23%      +0.3        0.63 ± 64%  perf-profile.children.cycles-pp.extent_writepage
      0.97 ± 14%      +0.3        1.31 ± 10%  perf-profile.children.cycles-pp.__sched_setaffinity
      1.07 ± 16%      +0.4        1.44 ± 10%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      1.39 ± 18%      +0.5        1.90 ± 12%  perf-profile.children.cycles-pp.seq_read_iter
      0.34 ± 30%      +0.2        0.52 ± 16%  perf-profile.self.cycles-pp.fold_vm_numa_events




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

