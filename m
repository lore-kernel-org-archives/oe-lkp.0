Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC051D9A5F
	for <oe-lkp@lists.linux.dev>; Mon, 29 Dec 2025 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766997789; cv=fail; b=jFfJbqV4UpCDSMKyhRvJmCmA6FVDEqzV9FLT8luEycQN6gRfcuNAtSq5QgYQxhH3AZPstlkmCCLKCxIPXpEWsVrBNONkAHaKEUHt8VmR/YhDEBs0C8F40LoudJWd1Cl8eZHDfY22KFi5qcSHIruJYUh9bboAmyYhRib6Du0v0A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766997789; c=relaxed/simple;
	bh=JqWG0jJffgD1/oBqtPpwG0FqbtjN1HVsjAKorK6vLdQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=f17O0J0Wd1AvTL77MIlxWjYGpqcB/HH2sL8B7/JBZHGukqRsowLJ7VRmEcdA5zAFBKY8Is7l46SYZbOFclBfhYmTgCrFdge1jLLoxH4KqOwRJaRPIPV5g0mRtWeewnZb93BSZGqJyO8tTmTKdCKyDDRLG14nDGftVkfMSxsXai8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gtl451fQ; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gtl451fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766997788; x=1798533788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqWG0jJffgD1/oBqtPpwG0FqbtjN1HVsjAKorK6vLdQ=;
  b=Gtl451fQbHeIBPbQgxbKNhJNaXMzLNtHhA2BJuVOkDByrzsy7WvFw0SN
   dp0iDdb3ZQ+3auGTBAHIVQ7ajpnyr7Q1el0ZipSTnKQZcrYesrhupaP8n
   yvltEJoC2wgGwSEvwkREdm346hFico8Pl3MLwEKbC9vaIm3ZSfwa+dkjD
   nMqvK3bVcQt5qEdgOqqarZVi6KDUjZg+fnkFbLgIDMBp8PwS0xWblgYDS
   /q+NtKRrTMpD1E3IOkhE0qPQV5Z6U+r/PP9KSMXnbXHq5atm+m1XWscju
   ux08ydw5lUmDoea7qhlK1b9atwP322hwL1HcoBiXFdeUVU7a/d/GpHrr5
   Q==;
X-CSE-ConnectionGUID: /c68+7yDSs6QR2AnJNlo/Q==
X-CSE-MsgGUID: JV7MmMp3Sk2A3UpNDfqvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="78915279"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="78915279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:42:59 -0800
X-CSE-ConnectionGUID: Vtj7bcA3R3+zoUIejVd1DQ==
X-CSE-MsgGUID: J+FpHKdeQKiKgIGFlq/8eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200093132"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:42:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 00:42:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 00:42:58 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 00:42:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bcfop0VvFGPJUBIfFh7mZEUCjqXjLRAQX3Lx+0Zw78oGb87pGSmuorkgaFq/k4dubLS7/aNqqWNs8g0aq2dwzWnBbk4xgo3p2Ip/DhNL5DTrQdn8fCPY8wv3a2djOLsYH8r7QbwbjugKcsvav0qi1Gk5P1GvJFQ48PeqDv8MDBaPIJsW7QTGl7B7JzyK83pjpi+MpH/WV2qa0YGkxbK3vL0Ik2R1+uEk6BI5765KhHxU7RxvTREugEz/m4ZKEryKUOp49DmSB0SYkDyaGXFw6yuRD7t9PkrZR2fmVWOeGrkCuAmrJKbY8CTturlmBs7fZ4NfnkvTTQbaXEtykjzTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XzskU+pN2jY3/l8P2h15UhbiGFrYO++Mtix0O7uz6I=;
 b=Dl40h/+iZTFSwzWCAcmZEu/3XieoJv7wNPM/T902AzB4vx0/NIRXJvxMOKOqPh9ko7rA0cg/Rf5tmvpiWu7fstS4v34RGVt+vv+mYqgtFVFySc2sHyuNZ+Sq3qQE57bkgeBniPxCJISNPuQOmGPhTTWsij7zSYcGZ3hz92U5rt9N5u1FmRM/8lt+vgBvB2xc8FqDTbLL8cINLiwX/Ez3rlj6ptERdzT4JLoaRxalJf6H06zdwXC6JfBx6FBCWnS37/N0MwQZIn132eEmP8bPlXkXbVvh3RyUOyAAgnIi2KUCXCgyEdPIGiIHNqHzGMAAEeaTuNPv4pRqurYSJPMhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPF64C459891.namprd11.prod.outlook.com (2603:10b6:f:fc02::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 08:42:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 08:42:56 +0000
Date: Mon, 29 Dec 2025 16:42:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:hugetlb-init/v1] [arch, mm]  71bdff70aa:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202512291637.e5750271-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1PR01CA0079.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPF64C459891:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddb6137-8ca6-4838-66c2-08de46b64389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iNRK70bs5NbzIIs5DLBppW7cbFvkjky+4uHBqZGZSnBoNNU3HucIA0vIsCsg?=
 =?us-ascii?Q?pnhO3Ky4Un6X6a30pYN9mWeWCT25q5MkZ1HEUj5jhjNK7DxSsHfTgw/xq/o3?=
 =?us-ascii?Q?9pKhtPDD+u4kSBkv5U9LxnwsUaxP0bz5ZYCc92+30I23nIWM3X2BwGfhNWmR?=
 =?us-ascii?Q?6s2mngPUYnipiGADPEFnQO351BjDFyMt/5fiHordepbaO/NemBw2TYRTNfWh?=
 =?us-ascii?Q?ue/HSfjWeCEZmjemxIj23eowyVu/+zSzRJc+Jz+VXJLcvXbTqLKUFZ3FXtD3?=
 =?us-ascii?Q?vDd6QoAVMepKvTJzGoVp8C+GyMNVyfs8o866VJ2faaJ5QX48p1nySAgavXMs?=
 =?us-ascii?Q?rXb8h1T9/8fDDwl/YFCDo0Ah1n0VBsirO5WxLdIpuQibtiKCHswj9tLcAL3s?=
 =?us-ascii?Q?zEwdvS3tkT0X/zuf0VS2ckVdbb0gPc9KLLM5BljzZNQmcCKqQk5pqhQgD2il?=
 =?us-ascii?Q?5iKY7vsFPV4eiqCs6N5jc1DNtdYIN8gJWPrmrfQZcPTR19BNxj1OTWh3Nvoz?=
 =?us-ascii?Q?sk4TKFv0m96XpRkSdFZnkjTL3XWVLYbbQE/118SLUGSnXclT7g0NMARp3Wne?=
 =?us-ascii?Q?Nh46RRxMLbEiwEoczBW0mUm+nNw/7HgdII089oNKUw+W9PqdHX9LuD4zshj2?=
 =?us-ascii?Q?RW+YKF2gPzUoMzDl3mDXlMERsZaDFb99Js5VR/+8qH7E7liXosgtBJjKZzwE?=
 =?us-ascii?Q?CnENyRqwTgCsCqOPopCfOp/v3rvLlwRD/Son0Dl4xTflrsgsOUQdvXUTIxzD?=
 =?us-ascii?Q?tkciqTPUt77AFe2a9L5O+qEbNeKgcqgdamg7kOeG4CuWXKppYTMYuTSMBggz?=
 =?us-ascii?Q?YGfBXzCTEmKx9MNZyJOlFStbo8ptILD8ptw1Ud6H7Mi0gxZKesir7ZsNZE40?=
 =?us-ascii?Q?3p78P8w5esDyAzUrmWD30V8c0zwNgKZl5cMih2jQy+NEQ3GLNFRvAo/sshX+?=
 =?us-ascii?Q?gaNLijk2Wauf/dUkFJr793jRklqMgpA5mTl+P11uBzSKSkDEKO+qlGCbYuwR?=
 =?us-ascii?Q?WAM6Q/+SwAiB2w9RISmTD3jh1FrGA8B1hq908f6BzToslFT+SPYilBuA/fHb?=
 =?us-ascii?Q?UpXHzhISYbdd7Jlz07DVQQLImGgGQf4J9PK+81ED7fueifCjWDtiLE4PstbC?=
 =?us-ascii?Q?hfU1/zPfq7xI4UfIen0Y+lL1nX9JE6LUMWkhRbw4tkZMITcUhCDN49pdOfYq?=
 =?us-ascii?Q?GgCsHD5YRm15pGpANzp/Jl2a57q5v6smDEbuiSm9IF1i4VPXl55npLkrk60o?=
 =?us-ascii?Q?jIV3ZVlYsBtY+xbvTZxhQdY2F1Zr5ftqrY2BlQVAE3ufy50sCQoxuQOH3qiY?=
 =?us-ascii?Q?aocFj3HhnqrCGi29unUI7D10bjtQRqTGVbNB3MEuDotLUdZnMVp8srMaWO86?=
 =?us-ascii?Q?smv5HVUw/oxf38YtH1jNFPWRg/Zff1/4dVBfqlQQBK9bLh+enJobbjZk65cR?=
 =?us-ascii?Q?Y1ngjw34f+fjL0EfZn3YKlO2tyLFfUIVVrAYZQDXmCcIDqvYVf7blQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oz3L1YFwprxNrOtV3Xh6KVHxJOZ24wGK0qFvtDzSSx7o0+2m7QnLb6L/uTy+?=
 =?us-ascii?Q?pC5MuyIwJ72mmruTxW7g2NWQW3S4B2d3+XfP85zvXvVPu4EU46qkv8W3h5eX?=
 =?us-ascii?Q?QnTIWL/gHPd+moxA9f5ZOSN2i0oYIiNI/d4o/lAfEoV/zU4H05rsEYLACrF/?=
 =?us-ascii?Q?xD50txjoBpNJajbH623RX/bdtYcI16pILAJlyQaGsEDCZhbMg7k3mS6s11DJ?=
 =?us-ascii?Q?lISIeyEDhYnh92ENYYeUivTTGjimRdiOG3rlwjMybvVf//WPhk7U+vnX3oP7?=
 =?us-ascii?Q?e4V/AwbSgL/goL1hk/yDuAHU54ip/16jvvbYJrTuTpX3tWQab8Hp2wwMRBHR?=
 =?us-ascii?Q?+aLComel+2/cq3PxQrhTKAw067eGRL3wJTw+0p50bYwso/B3bxGMojmm/0WV?=
 =?us-ascii?Q?khjv+ShB0UaNNWZr9TZDgjrtr7twGSc57W1fm8czy5SzmQ3ENRtQRb7LxD9V?=
 =?us-ascii?Q?PEBpbhfex6Z/y4HnmXvPwXsf4YMiPKSUgZ8LmGBe/daLH6mE+SnSp0bAOHpd?=
 =?us-ascii?Q?ChmrYMsBffoPMHsMn8VWazfa6kNCJG9MWisIGniTTZqg3hIp/FXZWsKO/bwi?=
 =?us-ascii?Q?ZpdMQ+/tDz3q85By+cCcSg80SQ2nJq558zF3qkWfHDiTMvzHkjZZd2iH50Y1?=
 =?us-ascii?Q?AijGHPcs1AayhrXaMY9++Yy4pEvGqYjDYsn08YtTPNCdTBroVt4AOIdIoOBh?=
 =?us-ascii?Q?puPKNkC/djNDcLN6NWZaHOHjpWklMeIc9FhRpvwt9E75d2BG2tgZwHt/LEZx?=
 =?us-ascii?Q?UPOnPlgxsxlg1o5SOPIfzLFUP5+CBOyGYhdkACwLRmVf1pPoAV7MtsegAUIf?=
 =?us-ascii?Q?UVcDuxR/JUZQ9tg7KgssY+nS/CiC1tNso50pRVKuft9f48ze+XeW0Z3Q/orM?=
 =?us-ascii?Q?MngKqCCRolsKUdflFhQCop0hU0o95pSUCY40giCAkQ2t94/azJuCO1B0QwFd?=
 =?us-ascii?Q?F9WT80Mjm4TOZjXT0V1JDf13vgW89KHK1F23fF2RraQ6+xh7f77dyePXyuFc?=
 =?us-ascii?Q?O6QZLhMOEcQYEVxgqWsI8K5zqWPIAJorpMAKjvzpxvbXoJgJYm98WgowtvjQ?=
 =?us-ascii?Q?lLrVtkeAvlMrhdJrzwqvFzCtR8EROInHcb/YL1ET9EO1T241PjJJuuoeOK1g?=
 =?us-ascii?Q?yncwj99wganb+hJKef7L/IAmP+w9wI3vrH1OLO8d4kBQ2l+bkB24pg2FAqLw?=
 =?us-ascii?Q?cTLf6SkUUD2rQLyAy+CvpiyNw6cHMBWx4BWHOoLMLipbLkPb/w6pWaxilsO6?=
 =?us-ascii?Q?tChzqwqggYIvwUKuuD8H3GtHyst1awuj8H7/CylsBDUyTad99PQlqIR8eA91?=
 =?us-ascii?Q?pTrOlO+aDzQsEiU3wlaObTxEVm9rFCCXDQx7YpS7HwtvzZl+jhOFvPf0L0/G?=
 =?us-ascii?Q?2kKq2nFgg5TwlqNXEh0r+rk3idASyILyw6/C0t7GmiLZWbCOkbNBcaOMUZI+?=
 =?us-ascii?Q?GviyIvGe4fShWTPqi17UGstub8c/jcjO6eUjFGSjM3fEvzY7+YC2ginKckP8?=
 =?us-ascii?Q?SRqkiZcRU0NPUoXp6K5TMmYSArYpjjWN1GnlQzXg7NuWFdsS1L3irSbksZNk?=
 =?us-ascii?Q?o/drZiTIvj4JHPl/c4DKVRvmVT2LGM0tpRM0Mg/sIezzdNLe8HamuhMtptrc?=
 =?us-ascii?Q?wX0mAnr/YSAiGVRfGpnfII2H1zVsEWTGiPEMVgfsX/+lisIrnIMMaL9A1mVT?=
 =?us-ascii?Q?3Ru9i1NHvXgFzr5U8c0ipB+5fVrwTGPtpU4wV/QT+g+wKeAeo7FZ7qotPAl2?=
 =?us-ascii?Q?+Rop87SKdw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddb6137-8ca6-4838-66c2-08de46b64389
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 08:42:56.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zgp5uVUil7/0G7gvgd/EDYPULF/EK2QuwLwszGijgS4HMUG0KXUPhlsKxnhe73FIqsEhnT5wwKnYj2XEItDyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF64C459891
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 71bdff70aabe05963fdcee89dabb5da2405e8dc1 ("arch, mm: consolidate initialization of SPARSE memory model")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git hugetlb-init/v1

in testcase: boot

config: i386-randconfig-013-20251228
compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 9cbe197f8d | 71bdff70aa |
+---------------------------------------------+------------+------------+
| boot_successes                              | 15         | 0          |
| boot_failures                               | 0          | 15         |
| BUG:unable_to_handle_page_fault_for_address | 0          | 15         |
| Oops:Oops:#[##]                             | 0          | 15         |
| EIP:per_cpu_ptr_to_phys                     | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512291637.e5750271-lkp@intel.com


[    0.131305][    T0] BUG: unable to handle page fault for address: 00073900
[    0.132172][    T0] #PF: supervisor read access in kernel mode
[    0.132906][    T0] #PF: error_code(0x0000) - not-present page
[    0.133694][    T0] *pde = 00000000
[    0.134146][    T0] Oops: Oops: 0000 [#1]
[    0.134687][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc1-00023-g71bdff70aabe #1 VOLUNTARY  f85b7dddb6897835d5692b0780b4f86c7192f783
[    0.136390][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.137703][    T0] EIP: per_cpu_ptr_to_phys (include/linux/mm.h:2022 mm/percpu.c:2381)
[    0.138406][    T0] Code: c3 c1 e0 0c 01 f0 03 04 b9 39 c3 73 16 8d 04 32 39 c3 72 0f a1 d4 fb 8f c3 01 f0 39 f3 72 04 39 c3 72 2a 89 d8 e8 5c e0 ff ff <8b> 10 81 e3 ff 0f 00 00 c1 ea 1a c1 e2 04 8b 92 40 3a 8f c4 83 e2
All code
========
   0:	c3                   	ret
   1:	c1 e0 0c             	shl    $0xc,%eax
   4:	01 f0                	add    %esi,%eax
   6:	03 04 b9             	add    (%rcx,%rdi,4),%eax
   9:	39 c3                	cmp    %eax,%ebx
   b:	73 16                	jae    0x23
   d:	8d 04 32             	lea    (%rdx,%rsi,1),%eax
  10:	39 c3                	cmp    %eax,%ebx
  12:	72 0f                	jb     0x23
  14:	a1 d4 fb 8f c3 01 f0 	movabs 0xf339f001c38ffbd4,%eax
  1b:	39 f3 
  1d:	72 04                	jb     0x23
  1f:	39 c3                	cmp    %eax,%ebx
  21:	72 2a                	jb     0x4d
  23:	89 d8                	mov    %ebx,%eax
  25:	e8 5c e0 ff ff       	call   0xffffffffffffe086
  2a:*	8b 10                	mov    (%rax),%edx		<-- trapping instruction
  2c:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  32:	c1 ea 1a             	shr    $0x1a,%edx
  35:	c1 e2 04             	shl    $0x4,%edx
  38:	8b 92 40 3a 8f c4    	mov    -0x3b70c5c0(%rdx),%edx
  3e:	83                   	.byte 0x83
  3f:	e2                   	.byte 0xe2

Code starting with the faulting instruction
===========================================
   0:	8b 10                	mov    (%rax),%edx
   2:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
   8:	c1 ea 1a             	shr    $0x1a,%edx
   b:	c1 e2 04             	shl    $0x4,%edx
   e:	8b 92 40 3a 8f c4    	mov    -0x3b70c5c0(%rdx),%edx
  14:	83                   	.byte 0x83
  15:	e2                   	.byte 0xe2
[    0.140826][    T0] EAX: 00073900 EBX: c39c8000 ECX: f19a7080 EDX: 00073900
[    0.141759][    T0] ESI: f1986000 EDI: 00000000 EBP: c39c1f78 ESP: c39c1f6c
[    0.142667][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210006
[    0.143577][    T0] CR0: 80050033 CR2: 00073900 CR3: 041f4000 CR4: 00000090
[    0.144480][    T0] Call Trace:
[    0.144899][    T0]  setup_cpu_entry_areas (arch/x86/mm/cpu_entry_area.c:192 arch/x86/mm/cpu_entry_area.c:272)
[    0.145552][    T0]  trap_init (arch/x86/kernel/traps.c:1689)
[    0.146025][    T0]  start_kernel (init/main.c:1067)
[    0.146621][    T0]  i386_start_kernel (arch/x86/kernel/head32.c:129)
[    0.147214][    T0]  startup_32_smp (arch/x86/kernel/head_32.S:293)
[    0.147803][    T0] Modules linked in:
[    0.148299][    T0] CR2: 0000000000073900
[    0.148813][    T0] ---[ end trace 0000000000000000 ]---
[    0.149471][    T0] EIP: per_cpu_ptr_to_phys (include/linux/mm.h:2022 mm/percpu.c:2381)
[    0.150148][    T0] Code: c3 c1 e0 0c 01 f0 03 04 b9 39 c3 73 16 8d 04 32 39 c3 72 0f a1 d4 fb 8f c3 01 f0 39 f3 72 04 39 c3 72 2a 89 d8 e8 5c e0 ff ff <8b> 10 81 e3 ff 0f 00 00 c1 ea 1a c1 e2 04 8b 92 40 3a 8f c4 83 e2
All code
========
   0:	c3                   	ret
   1:	c1 e0 0c             	shl    $0xc,%eax
   4:	01 f0                	add    %esi,%eax
   6:	03 04 b9             	add    (%rcx,%rdi,4),%eax
   9:	39 c3                	cmp    %eax,%ebx
   b:	73 16                	jae    0x23
   d:	8d 04 32             	lea    (%rdx,%rsi,1),%eax
  10:	39 c3                	cmp    %eax,%ebx
  12:	72 0f                	jb     0x23
  14:	a1 d4 fb 8f c3 01 f0 	movabs 0xf339f001c38ffbd4,%eax
  1b:	39 f3 
  1d:	72 04                	jb     0x23
  1f:	39 c3                	cmp    %eax,%ebx
  21:	72 2a                	jb     0x4d
  23:	89 d8                	mov    %ebx,%eax
  25:	e8 5c e0 ff ff       	call   0xffffffffffffe086
  2a:*	8b 10                	mov    (%rax),%edx		<-- trapping instruction
  2c:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  32:	c1 ea 1a             	shr    $0x1a,%edx
  35:	c1 e2 04             	shl    $0x4,%edx
  38:	8b 92 40 3a 8f c4    	mov    -0x3b70c5c0(%rdx),%edx
  3e:	83                   	.byte 0x83
  3f:	e2                   	.byte 0xe2

Code starting with the faulting instruction
===========================================
   0:	8b 10                	mov    (%rax),%edx
   2:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
   8:	c1 ea 1a             	shr    $0x1a,%edx
   b:	c1 e2 04             	shl    $0x4,%edx
   e:	8b 92 40 3a 8f c4    	mov    -0x3b70c5c0(%rdx),%edx
  14:	83                   	.byte 0x83
  15:	e2                   	.byte 0xe2


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251229/202512291637.e5750271-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

