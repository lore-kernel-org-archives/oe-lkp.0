Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6813433CB
	for <oe-lkp@lists.linux.dev>; Wed, 16 Oct 2024 02:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047034; cv=fail; b=N6aG9ilz26iVq53UH1t3UQdtSganUbhBfrSQ/OT1S151wWN2fUbTJfjtYJbbEs++eqVwojFZ6SF4Z7vPjbY5qox+c7TrgtdFM4OzsV+PVu6uUuw/aOMgCM7uQzAwaziM/Cq62Cv8Tz6hxOEx1JLnGvWCLAle0W/VZ6d+jxAUon0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047034; c=relaxed/simple;
	bh=LvEpIM89F7/kVUi41l4o6LQm86XZ8fCf2biOSQEs6mI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jCuHhxuD8zqs4HtAOgwdoLMOpYjVwi0mkl/WvR8ci2RfqhvrDJ6BNcpbRDsIVi82xZzYRYhYgeMAvNMTDazxXEIE8V8ceoBvan7l9nCIHk8an66v+Nu8DyknScyTfSXKCroqEayElv7rfGHFMqhd1Us2mcQIJ8tAoJcoEEDNdx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjbGtJOc; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjbGtJOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047032; x=1760583032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvEpIM89F7/kVUi41l4o6LQm86XZ8fCf2biOSQEs6mI=;
  b=XjbGtJOc6W//ixpu+fA7wVIYCX5duBlukCuVnrAglf+ucWajw+e3TtVL
   H3of8J97KdNwbkwBJ4Z/Vgzw3u6doFSYdtIm8yHhqu4b3mEYYqQ38u4sD
   MkPMXcQ/onKXDdW3W7FLQA1Mr9S1Vb+q0GbfQh68nS5BQxxmENhCJEkUl
   1UDFiz8BbaWMsd16CwsjcWB5iPwbTKL080qD1Bb+Meujwp06oQXm5DDHF
   ZP8dHc3GW9GIbzUNlPpB8f8536PpxzBLP/ynzGMtyOlpLqaoau874tDr7
   zr6Z8KDCvfzhdxqy5oR7X+kW01rDFzS457bR6BX6i5dee7tEHclVL7iyK
   A==;
X-CSE-ConnectionGUID: QGuxBHz4QSG5vwg6DEg6eQ==
X-CSE-MsgGUID: BqSPnOMeTmKLE7cSj1Jyxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28353184"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="28353184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 19:50:32 -0700
X-CSE-ConnectionGUID: k0/Jo4ctT9uKxC688kUEJw==
X-CSE-MsgGUID: 0u0ArMNERgSACoc1kClxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="82868572"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Oct 2024 19:50:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 19:50:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 19:50:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 19:50:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 19:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFpsIk2ifPvpMVfp66aGg+NYwGlkzNY49AAyURf2vJ3noIMseGbBJHwmnhT8XtEx+nAuwOa3JpJvMYVKJ9i0wthU6OqZjSj12nDAjq7Sqnmtk2134GmfVChACweKJ3jZGumhRDDzArf0Ye5jvdPB+JSwNqMRNb6ulqLBUS/LyETqMnyVFGEtgP+gpkrjZhWG6b6vg0GtVCPhHILxrLtRH5AaZfmvtNL0igF6XxBK8ovifNgVpb/gF3p9Mjc9qh7VACNsxgAqjzqR/JxIKHutvK6hPWsKcOaYFM5RG6JT//IyHq6MWgFd8iu+TafnUwJSeCtENmFrXEfF2ktkwYKgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vutIS9ptf86dQcDlCtjWmIyHWYX58u8krhABwmRJeRY=;
 b=A1XqwXvoyUmOYOuBmu607u2xvH5BnxD9T2+SmqHdTHH6MSz+v0oZUjP0ZKFkmrj941W81JLAmRhR3TLPo9Axf5NiQdud2w68TbqJDxtFXgn6sGLszw9eFDK+55fMrs1J+kUMiP0lXEK3ZJedIiasoI9KEjPd+VQCWMbVH8uWTbuInLq4GfZT1BblA4R3VKO0Tkqz9aRTf9+ZdXpWLAnre1u6rBi6WkJRGsOB8PTTyDl7EIRmSwn4AWSX8phQe2S/Gsu34X2nat93lYOForVl02xXyhYe0N3L2qdqTX9YDom6/zGPAtzVKq8LQeJs+RTKWAwS5MVMFaZJ6i+5kn9Y+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 02:50:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 02:50:26 +0000
Date: Wed, 16 Oct 2024 10:50:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:execmem/x86-rox/v5] [x86/module]  612ac705e8:
 BUG:kernel_hang_in_boot_stage
Message-ID: <202410151602.14ec455f-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:820:f::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd39226-f727-479f-30ce-08dced8d49b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CAs1BYfauriQmPqFOsswwgSrXvjAXNXRawndeJIVlDQHrJRAtN5Tollxdgg8?=
 =?us-ascii?Q?WG81irDLqUXwSUZMKnyw3gFEsOLVUYpOIikqx9MlSbrxMlcw0YWqgSZ/VCU3?=
 =?us-ascii?Q?8E559L0c2S5p846wAr8XOHigjDGcno0adL56m7Bh/1q4qpd02sKKwdQpr20Q?=
 =?us-ascii?Q?Uj1r8eBAZJe51w1mUypEdfiUyzdiJ3VIZCfK+kyH7XTuUjyIeE65D9e9TS8q?=
 =?us-ascii?Q?07oaW1wJ7gqiJinUnuo9GJGlDoN9Xhs+QVABWqpatwBW9lZJhkXvCyquPOJq?=
 =?us-ascii?Q?xXsYWWSZeSG7S/gLe55qYbiPmPlTmbZRscOsDbtHRvaf/OMfFRJYPs1v60IV?=
 =?us-ascii?Q?gZHkt5wMeOFr4ZOd3I5fwiie3VxfPWqGFJk5gs01M+S1BeQCbvO3IfUcW3fo?=
 =?us-ascii?Q?3qCDP24v0yAd9KjAG8Jh+aJuXp8HtAkO/Wok2OBW0NA0+Ue8tByARF+i1yo7?=
 =?us-ascii?Q?9Q9jKTuM3dU1z84QLvlgIGbzEpVoQBhFPtYBdKx8bh+7AmU+flPJnAhR7p/i?=
 =?us-ascii?Q?Pw1nVs7pj7udJXS2L1ogwa/QXimd+MYi3bjrAN4xgPSmtmHfeidIYUMMprkz?=
 =?us-ascii?Q?xCF9Wyycnv1w3I9iqrWiIEpWZDpmpxr1rNxxwAogi4FPchKgPLqD+4tvOlAp?=
 =?us-ascii?Q?4mlKgRcIREdd/lhBmSA7f/s4ZeIFC8AdiTLpQlhRi2BGkZ4vxXTyVCWQsBnW?=
 =?us-ascii?Q?Mo1b5Se0flK0O9cY+jwxB6UkWehn/oVLbh1SaDQZ2PJYDA+QMnHNuEF9Vy4c?=
 =?us-ascii?Q?s5uBfRqaIi6bx8fZclydPkVmdDcdU0RR1KAT+er1xSws/zBlzv39gF55w1JI?=
 =?us-ascii?Q?zA061O8LHJ7beMrKhgH/VWOzqxBWwaQFc7a25Y3lBOm+gkqrjKqjDFe/YTgF?=
 =?us-ascii?Q?YfVkjRBzjb1W0BtbVTeFbS5540Clr7HEY7F9czRQGgEEQRLUV1w2cogpqW+o?=
 =?us-ascii?Q?vS3jxBBGMXNyV79cKF4SZGBBxEUYmcX58vgXd5XFXi52Ll44Pu1U52YCMsBx?=
 =?us-ascii?Q?Sl+JkWlfXi34xf3lyerzDQAweNxjFBswDEDK02FVf5NrrqHtKwMLwDBHs64i?=
 =?us-ascii?Q?Ju8ui4YI8wv8hglvyhoUta6Km+Hw2tiamPGnLvqFHFnFfy/kKsLIZA80EdwC?=
 =?us-ascii?Q?2ea2Q/W5LxvqtQwYln7f8SHJ/rDweK7ojZaSDbnhF2hYRd765huLOk0fdTWg?=
 =?us-ascii?Q?6tmuiJZG9j+NbgmsFTBzTuyDkrZ0cvBYkwpwgwpJbo9f3o0fSifMdnKEs6Y?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMfFCTqrNA98S0Meu3FOTcaG7pn0lzSAXr9zs7Mt/lQY9j1/kx6tjgAu6xS2?=
 =?us-ascii?Q?M+gP61IBo+2sZ/xFBL/LOcyCPGBbNVB2ULM/nn26J4qqnq9+6dDu8rx5FTh7?=
 =?us-ascii?Q?zWWXJgOGPVD0E2pJ+in71vVhMKPewGzo8b//EGCVT7QlGlD/huQzrETEI9bU?=
 =?us-ascii?Q?DNODmC8hEq7nY4zzwoTDWyk4kqQahDSri6BAIxZSXr+ug6a/RH/d0HXWMzly?=
 =?us-ascii?Q?3uNrbh5ZudHkjEy4It43ZDmAAMtzOTr90bawRAFX6/n7pwuDkc0AcXcUGOi9?=
 =?us-ascii?Q?owoRgt9AOOpCxN7c0lVkPhePqXH6qVTJntI3EL4TGTJHtza4w5r+yXnNj8mF?=
 =?us-ascii?Q?0otSA8OYpu27usGuhz+PSDw1ElHma1Rf9mPRQsYa5RgStkoYVBC/mj/dTEhq?=
 =?us-ascii?Q?4r68H4LaagGaQQER1m231cqHxlAPKRMqkZIjelCyDrY12xGhofxQl8MgmAF/?=
 =?us-ascii?Q?yej6/XIn1f8Ia5nzLCr0SdZ8A8pDmPtMvPa2u4bXHQVZ2D7VlmINR3Ar5EeZ?=
 =?us-ascii?Q?9X6dvlDDScIzRJJFmhcdwbcK2GFcnZAuG0rjGKzZW6Iskqn0iMnphqDCf5AT?=
 =?us-ascii?Q?jmVkXQXt8sSRou58U0eQazrXSoJ9gQb7dMY0asrUuz51IaG+2y12u3/OnEjQ?=
 =?us-ascii?Q?5PyEQgjHsykiAG3M306jnGUz5UvQAQvF5m9TVQe/+HbaWwRLnx1MEJPx2/Gz?=
 =?us-ascii?Q?bLldU8vv4rScKvsIzalH1mcEWMNpKg1K6o9Dq43dkDPOY1N0oYWS7a63YMwe?=
 =?us-ascii?Q?+gl5sKLQNQfzjwwrm+bTsHwsWaLVUhUJVNSaLZGOQsMCJGXDGi0qiRVwyCoy?=
 =?us-ascii?Q?pe+EX02kdxhgckF1LxuZQ3UItJQ0+kTifHd1X+pKSv5G7AJza5A+Q1nPdqPh?=
 =?us-ascii?Q?yXNLRBoBrfgAl3mZOLmVuiWUr8a8k5oRjYpCTvBZfMl24ZEintNjZqEJekNj?=
 =?us-ascii?Q?25v6uz1lHb7WVa0hHGq02DC42aGs+uziW0g70C/cnNkGFhN9ynDRkG2Bg9WW?=
 =?us-ascii?Q?UrAUJeieTmV3oFi+yrWQdZc05wZsKihjENbgmoSeE53Ur//3aKE5bZoFT+c3?=
 =?us-ascii?Q?bXwwTHp8+EG+WmicjqjwnWAWIx8/P8Un1FfT/rHrNcUfMIcMMc0mylob/MHc?=
 =?us-ascii?Q?BVv+I6zYPWA/iWwty5s1FiQTnDKpWQscIttEOp/O+RWgiaNg/e6NlJ/AqQ/5?=
 =?us-ascii?Q?vb5eNhg4oJPH0npbAO+yrWgGRXwC3Y7mIdhF8zTPh+0hp948Q/ydxooGsBKa?=
 =?us-ascii?Q?SVfT8GcvxI9p8+qZ5x/ptE0qSvBQKkOrxSMmsgO8SAkz4mDxc7C4ml4q2Adx?=
 =?us-ascii?Q?oGc9sdABQ9dkwWAJbas8Ixf8uSLtMWOi/AQaOGbyEVmcA2waI0tyGACF2lE9?=
 =?us-ascii?Q?hEXRmsNy9pYeDmV20Hidgdisa3cS7HO1AGBkYOTeQOx26Vc3iFVpfmEKJy6C?=
 =?us-ascii?Q?MRzybMCTI2mVSGp1GRIt87pDvakucToDVVGdTynax30BHFmMtpJe48E+S7ry?=
 =?us-ascii?Q?b/zrlT9mG/Knk2UCATSKIwc4DvPWtnJll8/TkXkqqplyfM6PWsnJdO36nlzs?=
 =?us-ascii?Q?oYVEKUZel6ndVDVX90N2k2VOICfIOFGihBE0p2M5HJ0deT/WkNHfv+8bW2QO?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd39226-f727-479f-30ce-08dced8d49b1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 02:50:26.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ir+j+n94VjfKzVu+hJ+PjAHLejvQNsXQMneKUHGMPl9akQMv0sAKXl3N4mKUz5Z6n/JsjgNFvUd1KFZ0k4CVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_hang_in_boot_stage" on:

commit: 612ac705e8ce550b78553deca51ecf48109d547d ("x86/module: perpare module loading for ROX allocations of text")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git execmem/x86-rox/v5

in testcase: boot

config: x86_64-randconfig-016-20241009
compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------+------------+------------+
|                               | d6c65216c5 | 612ac705e8 |
+-------------------------------+------------+------------+
| boot_successes                | 12         | 0          |
| boot_failures                 | 0          | 12         |
| BUG:kernel_hang_in_boot_stage | 0          | 12         |
+-------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410151602.14ec455f-oliver.sang@intel.com


[   28.717854][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[   28.718717][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[   28.719717][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[   28.720719][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[   28.721717][    T0] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
BUG: kernel hang in boot stage


(but we didn't observe more useful information in dmesg, if you want us
to test debug patch, please let us know, thanks)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241015/202410151602.14ec455f-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

