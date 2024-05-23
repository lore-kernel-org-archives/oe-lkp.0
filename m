Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649051852
	for <oe-lkp@lists.linux.dev>; Thu, 23 May 2024 02:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716433143; cv=fail; b=pPjV/pGma8brEO2qtbSmxlMb2htr8YvJNS8Yw337Z/lW2hsi8zeDGrAglDcxAkj+4vMYnB1OvWvVk7cGam8sAZTMd5bbDZ6jq3VGgPG5CZzwxV7/2T2mznkbGFpQ8bgglnp4uryHMFsd2o/Zt6YnEmQ8gJY/rkTdy7/v8ipCkv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716433143; c=relaxed/simple;
	bh=GaEI8ENB14FbDuEu3bz8zmXPLmEsucNqvaYON36prpg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=trNvOy5bCUHfhOMXHMiS1aFGIMQtwDGoq96+PatkNwITJZCLcf6YfPwpj3ku126kiyH5RNtsz9UTQPTdgmK3lZG2dF2DegrAFNn8SeD0MK6yeDtrLi1Utp+Fwbp88VBjUrbsTIVJuvnHzmyhBinLyeC2oREW1iU2pjIoY6BoJM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNXiH73S; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNXiH73S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716433140; x=1747969140;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=GaEI8ENB14FbDuEu3bz8zmXPLmEsucNqvaYON36prpg=;
  b=YNXiH73S+Z8ABf2KsryZD9d0d+k0s79vMNhLeyey5Vhvpb2P2rzk15YF
   0NpPw717EGxjChHF+GdZOHryItCiZ13HFEGPhGkBZAbcnUpmF9YnvwxZ5
   YJf+EgYuWZfkhh5U7yUckbcNpnwMZohpaB3Q3JPx4JQGxYm2/pP02VoQg
   W1UItiu3Us4c91WOdTQxM/5UGpcenQpyf3WaRyHUst4YQwfZCojl2nxq5
   Lb3VGmCi3aPrErZLbIk+24Bmnv/Xk+2As0CrSi/ygklwKdUdHqaWITxy9
   qe9rUhxA/TrtP5mjBITUmh84Pqhb757jHkotfJw8ckm+kk/40nudMMkXt
   Q==;
X-CSE-ConnectionGUID: SlY8VPfNT5Oxe/8Bg/sXsQ==
X-CSE-MsgGUID: k68u+8neQ2SMPgL89sOjpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23292935"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="23292935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 19:59:00 -0700
X-CSE-ConnectionGUID: QxXy3e93QlCoBRuHB709UQ==
X-CSE-MsgGUID: J/cZ2oMgR4GfSixP0CFM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="70914365"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 May 2024 19:59:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 19:58:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 19:58:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 19:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQLGngJllAR6BgFNae+WUPjOeebRMWGuxC5o9jrk5TfQrc5iIckTRFKEYxn/f84koIlbkeqiWCJsTQbiH08Lc73I8GK4xcEvFlfEu3xSgGGVrK7xcECthnMo/QmmvRBJpUucFkVHoaQax1SF0rhcvB9/nFl+vvjoJz9RlfHbPvgCWiU5QpJSqPoGdzw/NzVrITIwP//P9pDkTfWiL1GO+uQpsEbyFSAbKFvWeDfdrKXuxoq8EJnWrE0peHmq6DBuMJWGgG2EeAPexmfMytZrIYj776RQFAUBuccd+9AKcSMjM6FmtFU/JC6nf+y359ipQ6HsVpbq6wFsebJYHyRKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNjtjgZ4BOfQ6dxezV5DTePSdqjP+Xj/wTv31USH6os=;
 b=BDCiguQNd+1iI01rV/1C/Dwh2yfGgj8+lV3My3tQ9h7EwNweuXWhrgEefCxh0qmo8A4rjH061qr3OdvtTHcavvbVsNtTc8gmJq76xkaRgHL4X60FEDa0sWgrJk6kQACHDID3EF5qAr/1qEEtjdMS7De5KRrkNa7MzutCzV5o/TElFJ1Gdn2uQRaJUf85xAiXkk+nwgaEYFY2BLB7ZqHi1+14rZ6XQWcNvjtQ776O/vMJ2XPWCnLJniMrtCjl2USDtUOw5GejGOZIX4wxPcBGKN/m9QB/Ux0+5FfyMUIjuB+k+OYXztrXxhbgvO/P2CK3Vya6sQ3s2jQza+mavYqEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 02:58:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:58:56 +0000
Date: Thu, 23 May 2024 10:58:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:sb_write_barrier] [fs]  8829cb6189:
 stress-ng.fault.ops_per_sec -2.3% regression
Message-ID: <202405231056.66ecbb94-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: cb218b58-94e5-4771-537a-08dc7ad4498f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6cYcoWqsM6RNyRMCeoQduqg1NaMitLNz971FOBV+gy8hP9Bm9iXawlPqYc?=
 =?iso-8859-1?Q?HWudI7ItUrkaD+t+oaWIC30O55Yxsjw+Q08AjFf5T4RTmH2pf22Df0KVyn?=
 =?iso-8859-1?Q?m8n3oegkrVYVBrgKZ+JRe8wH+ZWan2pVvmyJqu4Sx7VOoa3ssS5B2gHM5D?=
 =?iso-8859-1?Q?lA3yjjUT65XwhEFcTjRiaYc4BMdDPJm8wdFs+nRIXO7l/qCfa0UU5hU9z/?=
 =?iso-8859-1?Q?bu4YXbc44CI7CEjCzK/WtKZR9c7FEvzpuoMI3WBuf46FsA5YK29rkUpUqI?=
 =?iso-8859-1?Q?Kj+rCA812qMxcbtdFfBrjWVvr7RdqG6ijTx8RtsGlEDJnKkyHa5ju8UJvx?=
 =?iso-8859-1?Q?Zlmq5LimBsB62XUEdUv7xUguijZtM7SL6KcT5I8BX3zvmdsU7HwDIzeH80?=
 =?iso-8859-1?Q?bCvrMR6mJ4MyNmlhIBlQs7BMoy4kyQRVRT3U3G/FBT4BMgdOymKKdc2nDq?=
 =?iso-8859-1?Q?uDor5NIbhevfKyAK9yrwrQJ168mbut7MNrPw0D0qMG+yofYrhCEg1YDLV3?=
 =?iso-8859-1?Q?SY8P6yhsGr5GYhE+1+pJNI9ixEj8VO0OZWFYGzLOAvFlKCc3BKCCvUDSpy?=
 =?iso-8859-1?Q?4Ikeu1D9pnZo+HPWB/YQsT010ta9GcPMUqPLwyt4U7506OuSVRPtgXnyND?=
 =?iso-8859-1?Q?BMaEwkU66HDNy7JEBaG7oaCarF9vy2/56TDXY73gRBv4+BMjQ5E8wnExa2?=
 =?iso-8859-1?Q?3PW6zHYzGuJuxCXFN2MaZTHnBNjC+1AfhB6mxn1yL+ba3mht/qfWWUta5q?=
 =?iso-8859-1?Q?GgbRgdQQGF5j+mCE6LMcjAGZ8ID+ejlvtf1tXWkzww/su6Aay4DQkcokr1?=
 =?iso-8859-1?Q?s72Qh6qBhxuAZPQjOtBLDF1mWBJUnMDjbxVeM+I5tZ+33kAewQpH69KSDd?=
 =?iso-8859-1?Q?iQ0XJxLleI/cbE0mP2+F1rtEs9N3HBdET763IOm9ofKvDIa0c+OCEECEK6?=
 =?iso-8859-1?Q?7tgTmF6xgqsvP2Q0pz7dJklMPw3Yz6zkhhlfmcEBTLepWwq8viQDZPCYfo?=
 =?iso-8859-1?Q?ygBaAxwK/4bVvQjg689quscNZhWpndgL+hG0hGoa/DpGt+xeBjCuRob3LJ?=
 =?iso-8859-1?Q?rVyoElUzwob+VXy04T9/JPXmq5USCrj2nawtRk4wVOoQeXDcGpqYBhqZdp?=
 =?iso-8859-1?Q?hH/cUkfCVzqIRCmLGtk5j1Oy+qr5G0lBy/2GRdvnabo5a5BiSoHgQ6nWO/?=
 =?iso-8859-1?Q?JuNUtY0R56klZ+cDDPNubp5pEACxEcOtyp7xPLdVJWmAjXqy/QFop7C9TM?=
 =?iso-8859-1?Q?u14qnfwiNTgbLKw1BSdZ8xPPp67ZM6fbWg/HdJ2ns=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8m9I4xwzs2N2so4FsgavHEI6+GRsxQP7vLW0mzBjqG7cTG102nQOYsuk1X?=
 =?iso-8859-1?Q?8S6kfYm8y30hHY9q2KmCXR6DZrMMNz1843vdpgoR+/6tryArLzGl8ji4jv?=
 =?iso-8859-1?Q?zMkJVGhKbuOmuSZwsjCcYEoD2EaARosH3Hfq/9OUn+HRp020ZwctUzJMUE?=
 =?iso-8859-1?Q?AKyUv144sTHZELBfvgul7lXmyhjPv+uSO9g6UYrYUYlQyJrRPjMxZVF6wQ?=
 =?iso-8859-1?Q?2tyDmUUMzL7ADOtCEqEZUFDG6krajLKWqYC5uWHC3250AOaS14LdxkHVKz?=
 =?iso-8859-1?Q?1Au00ouoOVJEg2K3Y6Caj7iRosLVafgBFR0DWQ5wW27p9bGWkx4/85QM0d?=
 =?iso-8859-1?Q?HCPMBcL8rHIEWz+KYrFBIg45JIHkT+jsmbZSE5Me4iyAavvxjQ0mKqCpT5?=
 =?iso-8859-1?Q?NvjwRh6BNlhiRut3wJpePSTCeEyi2p6cx0blAj+WPvjXcpNznegSJU0eK0?=
 =?iso-8859-1?Q?8EEFN9mZAZzD0bltHm1mMSbpxezCXwiCH4otW7a2wmbWoqAFZtD/A6dKvB?=
 =?iso-8859-1?Q?qnyYKcc2ZmsV4VtBxu9Rb3QtNKTkxO4gREvwOGAQudNE+MkMYsRVG3J17t?=
 =?iso-8859-1?Q?SnUPeosTqyWzoCe4Z0mV5qA0SsQOTO4UNUXvJRCOFLTXqTn5j344Ic/MaC?=
 =?iso-8859-1?Q?KPQ52NHHPSnMS2Mzp0ga2XIxLER3JIewr4v7pd7mq+z61EDGeqXV/NEmAB?=
 =?iso-8859-1?Q?NkVp5j9fxhV8aylksw+Y1+wCBuh3ZawN9QCbiT94O7jGq3aRQx5DkNtB5p?=
 =?iso-8859-1?Q?1lkXy2xWGq8CgSkxwEbg4P+wB+Pl8vEnch0SNmTSkag8w971tMNYhFRQm5?=
 =?iso-8859-1?Q?VkOagg6vKWYgX8uRyXntQ+6lwTbEkoTQePTAhssPZmUKJt8VsgMmr+VaTG?=
 =?iso-8859-1?Q?V9vQw0LvWSZefL4HEqoI7zmuCB7wRzwdxAUbLwvYEY79kyCOF6pFgt/wXc?=
 =?iso-8859-1?Q?9g8QGkWjc0/5ecSGHgGRslC7terdtx9Jl2aAoDU2rs8Q0SpMGlRbJBCgvY?=
 =?iso-8859-1?Q?DUHNyOWqK2Ms/H+xpwvDmgNaC0oOBmlixyMknJESnZvSSrAgpuRvpxoqKm?=
 =?iso-8859-1?Q?cKLufgm3jWH5XA4cAqDWR0vQUCnikn5dH2hUKYfxNZMB25OEtveTMrZ9ol?=
 =?iso-8859-1?Q?QnPz8whqDITiNcpXy+GqkOHlkZG5aAQvjXc6/BFwta558LVtn1LSFm0Ip9?=
 =?iso-8859-1?Q?uJhul7afgNmgPO4HNzuTQ8+cmLLETK+jM+dJsbzoe6DH4tyakof5EHNngK?=
 =?iso-8859-1?Q?9oE5MMqd2ezeJUHSiMMCYaXfuqXaIk4dpJU1TCQar8LnhQQfuVLPPgIzCp?=
 =?iso-8859-1?Q?q624K5Hxmdn9KvkNIyhmTc0Z7hnQX8f24+qFIpYSGWf3wYVOLa3g2G9JUE?=
 =?iso-8859-1?Q?h98HApKP974M1F5Ck1f6KerE1KWyDmJRUyLy1aEJsD8mazrmjqqX53QU8v?=
 =?iso-8859-1?Q?+jy/Nf91AbAw7KNDW3ajPUJ8h4qX9S2Gs9UEqAtaNjYBsxvtJCGzqL8V22?=
 =?iso-8859-1?Q?TSoUNZDCex1s99jnw4xcbodPF4nWtTNRE4zV/Rv2yVoSrJEuhrzLJX75nA?=
 =?iso-8859-1?Q?yttBAysRsT+QGiAJ8t9PFeUznj2W+4bEbU2aHIrbrrp77ethEI8VTdxmIv?=
 =?iso-8859-1?Q?TasaM4kOrDcqGU07XPuKIMsAWvYV01PpL9tI/STsy2uNDcqREs+OBLvQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb218b58-94e5-4771-537a-08dc7ad4498f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:58:56.8626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAXSe0PhvkHrPQhgIu/8AUAf2cDB0Ub6aLXZNNmq7gUYaQGMz6OjH4LKCugsmnCCKrFl1dQ1+qbSYmo9ou8jGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -2.3% regression of stress-ng.fault.ops_per_sec on:


commit: 8829cb6189b7a6b5283b9ffc870df13c085f1cd6 ("fs: hold s_write_srcu for pre-modify permission events on write")
https://github.com/amir73il/linux sb_write_barrier

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: fault
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405231056.66ecbb94-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240523/202405231056.66ecbb94-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp9/fault/stress-ng/60s

commit: 
  3f7a9d8157 ("fs: add srcu variants for mnt_{want,drop}_write() helpers")
  8829cb6189 ("fs: hold s_write_srcu for pre-modify permission events on write")

3f7a9d815783aeff 8829cb6189b7a6b5283b9ffc870 
---------------- --------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |    
           :6           17%           1:6     dmesg.RIP:native_queued_spin_lock_slowpath
           :6           17%           1:6     dmesg.RIP:setup_pebs_adaptive_sample_data
           :6           17%           1:6     dmesg.WARNING:at_arch/x86/events/intel/ds.c:#setup_pebs_adaptive_sample_data
         %stddev     %change         %stddev
             \          |                \  
    155.51 ± 12%     +23.3%     191.81 ± 13%  sched_debug.cfs_rq:/.util_est.stddev
      5270 ±141%    +378.6%      25225 ± 79%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.63 ±  2%      -0.0        0.59        perf-stat.i.branch-miss-rate%
      2.61 ±  2%      +3.5%       2.70        perf-stat.i.cpi
      0.40 ±  5%      -5.2%       0.38        perf-stat.i.ipc
     53250            -2.3%      52032        stress-ng.fault.minor_page_faults_per_sec
  51143720            -2.3%   49967689        stress-ng.fault.ops
    852394            -2.3%     832793        stress-ng.fault.ops_per_sec
 2.046e+08            -2.3%  1.999e+08        stress-ng.time.minor_page_faults
 1.157e+08            -2.2%  1.132e+08        proc-vmstat.numa_hit
 1.157e+08            -2.2%  1.131e+08        proc-vmstat.numa_local
  51220291            -2.4%   49995156        proc-vmstat.pgactivate
 1.377e+08            -2.1%  1.349e+08        proc-vmstat.pgalloc_normal
 2.053e+08            -2.4%  2.003e+08        proc-vmstat.pgfault
 1.368e+08            -2.2%  1.338e+08        proc-vmstat.pgfree
  51073893            -2.4%   49869748        proc-vmstat.unevictable_pgs_culled
     24.17 ±  2%      -1.7       22.46 ±  2%  perf-profile.calltrace.cycles-pp.__madvise
     23.20 ±  2%      -1.7       21.52 ±  2%  perf-profile.calltrace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
     23.33 ±  2%      -1.7       21.65 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise
     23.24 ±  2%      -1.7       21.55 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
     23.31 ±  2%      -1.7       21.62 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
     22.51 ±  2%      -1.7       20.83 ±  2%  perf-profile.calltrace.cycles-pp.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.38 ±  3%      -1.5       16.87 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain
     18.12 ±  3%      -1.5       16.62 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
     17.63            -1.2       16.39        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     17.36            -1.2       16.14        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     17.61            -1.2       16.38        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     17.48            -1.2       16.25        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.64 ±  2%      -1.2       14.49        perf-profile.calltrace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     15.03 ±  2%      -1.1       13.91 ±  2%  perf-profile.calltrace.cycles-pp.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscall_64
     13.49 ±  3%      -1.1       12.38 ±  2%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.zap_page_range_single.madvise_vma_behavior
     13.51 ±  3%      -1.1       12.41 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_drain.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise
     13.51 ±  3%      -1.1       12.41 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.lru_add_drain.zap_page_range_single.madvise_vma_behavior.do_madvise
     12.53 ±  3%      -1.0       11.50 ±  2%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.zap_page_range_single
     36.55            -1.0       35.54        perf-profile.calltrace.cycles-pp.__munmap
     36.27            -1.0       35.27        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     36.26            -1.0       35.26        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     12.06 ±  2%      -1.0       11.08 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
      7.33            -0.6        6.72 ±  2%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      7.10 ±  2%      -0.6        6.49 ±  2%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      7.11 ±  2%      -0.6        6.50 ±  2%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      7.02 ±  2%      -0.6        6.42 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_drain.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region
      7.01 ±  2%      -0.6        6.40 ±  2%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
      6.99 ±  3%      -0.6        6.42 ±  2%  perf-profile.calltrace.cycles-pp.__walk_page_range.walk_page_range.madvise_pageout.madvise_vma_behavior.do_madvise
      7.38 ±  2%      -0.6        6.82 ±  2%  perf-profile.calltrace.cycles-pp.madvise_pageout.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscall_64
      6.94 ±  3%      -0.6        6.38 ±  2%  perf-profile.calltrace.cycles-pp.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_range.madvise_pageout
      6.29 ±  2%      -0.6        5.73 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain.free_pages_and_swap_cache
      6.97 ±  2%      -0.6        6.41 ±  2%  perf-profile.calltrace.cycles-pp.walk_pgd_range.__walk_page_range.walk_page_range.madvise_pageout.madvise_vma_behavior
      6.38 ±  2%      -0.6        5.82 ±  2%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      6.16 ±  2%      -0.6        5.60 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain
      6.92 ±  3%      -0.6        6.36 ±  2%  perf-profile.calltrace.cycles-pp.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_range
      7.10 ±  2%      -0.6        6.54 ±  2%  perf-profile.calltrace.cycles-pp.walk_page_range.madvise_pageout.madvise_vma_behavior.do_madvise.__x64_sys_madvise
      6.90 ±  3%      -0.6        6.34 ±  2%  perf-profile.calltrace.cycles-pp.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_range
      6.88 ±  3%      -0.6        6.32 ±  2%  perf-profile.calltrace.cycles-pp.madvise_cold_or_pageout_pte_range.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range
      6.97            -0.6        6.42        perf-profile.calltrace.cycles-pp.folios_put_refs.shmem_undo_range.shmem_evict_inode.evict.__dentry_kill
      6.54 ±  3%      -0.5        5.99 ±  2%  perf-profile.calltrace.cycles-pp.folio_isolate_lru.madvise_cold_or_pageout_pte_range.walk_pmd_range.walk_pud_range.walk_p4d_range
      7.84            -0.5        7.29        perf-profile.calltrace.cycles-pp.shmem_evict_inode.evict.__dentry_kill.dput.__fput
      7.72            -0.5        7.17        perf-profile.calltrace.cycles-pp.shmem_undo_range.shmem_evict_inode.evict.__dentry_kill.dput
      6.27 ±  3%      -0.5        5.75 ±  2%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irq.folio_isolate_lru.madvise_cold_or_pageout_pte_range.walk_pmd_range.walk_pud_range
      6.17 ±  3%      -0.5        5.65 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.folio_lruvec_lock_irq.folio_isolate_lru.madvise_cold_or_pageout_pte_range.walk_pmd_range
      6.09 ±  3%      -0.5        5.57 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_lruvec_lock_irq.folio_isolate_lru.madvise_cold_or_pageout_pte_range
      6.42            -0.5        5.90        perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.shmem_undo_range.shmem_evict_inode.evict
      6.58 ±  3%      -0.5        6.07 ±  2%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_region.do_vmi_align_munmap
      6.25            -0.5        5.73 ±  2%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.shmem_undo_range.shmem_evict_inode
      6.62 ±  2%      -0.5        6.10 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      6.62 ±  3%      -0.5        6.11 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_drain.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      6.18            -0.5        5.66 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.shmem_undo_range
      6.16 ±  3%      -0.5        5.67 ±  2%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_region
      6.14 ±  2%      -0.5        5.68        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.truncate_inode_pages_range.evict
      6.07 ±  2%      -0.5        5.60 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.truncate_inode_pages_range
      3.43 ±  2%      -0.3        3.17        perf-profile.calltrace.cycles-pp.folios_put_refs.truncate_inode_pages_range.evict.__dentry_kill.dput
      3.75 ±  2%      -0.2        3.50        perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.evict.__dentry_kill.dput.__fput
      3.41 ±  2%      -0.2        3.17        perf-profile.calltrace.cycles-pp.folios_put_refs.truncate_inode_pages_range.evict.do_unlinkat.__x64_sys_unlink
      3.14 ±  3%      -0.2        2.91        perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.truncate_inode_pages_range.evict.__dentry_kill
      3.74 ±  2%      -0.2        3.50        perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64
      3.13 ±  2%      -0.2        2.91        perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.truncate_inode_pages_range.evict.do_unlinkat
      0.51            -0.2        0.33 ± 70%  perf-profile.calltrace.cycles-pp.sync_regs.asm_exc_page_fault.stress_fault
      5.64            -0.1        5.50        perf-profile.calltrace.cycles-pp.stress_fault
      4.70            -0.1        4.60        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_fault
      4.16            -0.1        4.07        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_fault
      4.12            -0.1        4.03        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_fault
      3.59            -0.1        3.52        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_fault
      2.13            -0.1        2.08        perf-profile.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.92            -0.0        0.88        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.__x64_sys_pwrite64
      0.71            -0.0        0.67        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      1.13            -0.0        1.09        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
      0.81            -0.0        0.79        perf-profile.calltrace.cycles-pp.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault
      0.75            -0.0        0.73        perf-profile.calltrace.cycles-pp.alloc_inode.new_inode.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup
      0.60            -0.0        0.58        perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgoff
     18.59            +0.2       18.83        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     18.33            +0.2       18.58        perf-profile.calltrace.cycles-pp.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     17.29            +0.3       17.54        perf-profile.calltrace.cycles-pp.dput.__fput.task_work_run.syscall_exit_to_user_mode.do_syscall_64
     18.08            +0.3       18.34        perf-profile.calltrace.cycles-pp.__fput.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.19            +0.3       17.45        perf-profile.calltrace.cycles-pp.__dentry_kill.dput.__fput.task_work_run.syscall_exit_to_user_mode
      1.96            +0.3        2.23        perf-profile.calltrace.cycles-pp.__libc_pwrite
      1.84            +0.3        2.12        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      1.85            +0.3        2.13        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      1.82            +0.3        2.10        perf-profile.calltrace.cycles-pp.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      1.78            +0.3        2.06        perf-profile.calltrace.cycles-pp.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     15.98            +0.3       16.27        perf-profile.calltrace.cycles-pp.evict.__dentry_kill.dput.__fput.task_work_run
      8.24            +0.9        9.15 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      8.24            +0.9        9.16 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      8.36            +0.9        9.27 ±  2%  perf-profile.calltrace.cycles-pp.unlink
      8.04            +0.9        8.96 ±  2%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      8.20            +0.9        9.13 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      5.36            +1.0        6.37 ±  3%  perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.64 ±  6%      +1.0        4.68 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.evict.__dentry_kill.dput
      3.88 ±  6%      +1.1        4.94 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.evict.__dentry_kill.dput.__fput
      1.35 ± 11%      +1.2        2.52 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.evict.do_unlinkat.__x64_sys_unlink
      1.42 ± 10%      +1.2        2.62 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64
      8.34 ±  5%      +2.3       10.62 ±  6%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      8.36 ±  5%      +2.3       10.64 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      8.53 ±  5%      +2.3       10.81 ±  6%  perf-profile.calltrace.cycles-pp.open64
      8.39 ±  5%      +2.3       10.67 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      8.40 ±  5%      +2.3       10.68 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      8.01 ±  5%      +2.3       10.30 ±  6%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.98 ±  5%      +2.3       10.27 ±  6%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      2.87 ± 10%      +2.3        5.19 ± 11%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.new_inode.ramfs_get_inode.ramfs_mknod
      5.99 ±  6%      +2.3        8.32 ±  7%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      4.04 ±  7%      +2.3        6.38 ±  9%  perf-profile.calltrace.cycles-pp.new_inode.ramfs_get_inode.ramfs_mknod.lookup_open.open_last_lookups
      3.06 ±  9%      +2.4        5.44 ± 11%  perf-profile.calltrace.cycles-pp._raw_spin_lock.new_inode.ramfs_get_inode.ramfs_mknod.lookup_open
      5.53 ±  6%      +2.4        7.91 ±  8%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      4.53 ±  7%      +2.4        6.92 ±  9%  perf-profile.calltrace.cycles-pp.ramfs_mknod.lookup_open.open_last_lookups.path_openat.do_filp_open
      4.39 ±  7%      +2.4        6.79 ±  9%  perf-profile.calltrace.cycles-pp.ramfs_get_inode.ramfs_mknod.lookup_open.open_last_lookups.path_openat
     37.47 ±  2%      -3.1       34.42 ±  2%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     36.99 ±  2%      -3.0       33.94 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     27.20 ±  2%      -2.2       24.96 ±  2%  perf-profile.children.cycles-pp.lru_add_drain
     27.10 ±  2%      -2.2       24.88 ±  2%  perf-profile.children.cycles-pp.folio_batch_move_lru
     24.23 ±  2%      -1.7       22.52 ±  2%  perf-profile.children.cycles-pp.__madvise
     23.22 ±  2%      -1.7       21.53 ±  2%  perf-profile.children.cycles-pp.do_madvise
     23.24 ±  2%      -1.7       21.56 ±  2%  perf-profile.children.cycles-pp.__x64_sys_madvise
     22.52 ±  2%      -1.7       20.84 ±  2%  perf-profile.children.cycles-pp.madvise_vma_behavior
     20.19 ±  3%      -1.6       18.56 ±  2%  perf-profile.children.cycles-pp.lru_add_drain_cpu
     17.60            -1.2       16.37        perf-profile.children.cycles-pp.do_vmi_munmap
     17.63            -1.2       16.40        perf-profile.children.cycles-pp.__x64_sys_munmap
     17.62            -1.2       16.39        perf-profile.children.cycles-pp.__vm_munmap
     17.38            -1.2       16.16        perf-profile.children.cycles-pp.do_vmi_align_munmap
     15.65 ±  2%      -1.2       14.50        perf-profile.children.cycles-pp.unmap_region
     15.04 ±  2%      -1.1       13.91 ±  2%  perf-profile.children.cycles-pp.zap_page_range_single
     14.24 ±  2%      -1.1       13.19        perf-profile.children.cycles-pp.folios_put_refs
     36.59            -1.0       35.58        perf-profile.children.cycles-pp.__munmap
     12.71 ±  2%      -1.0       11.72        perf-profile.children.cycles-pp.__page_cache_release
      7.75            -0.6        7.13        perf-profile.children.cycles-pp.tlb_finish_mmu
      7.33 ±  2%      -0.6        6.72 ±  2%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      7.44            -0.6        6.82        perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      7.39 ±  2%      -0.6        6.83 ±  2%  perf-profile.children.cycles-pp.madvise_pageout
      6.95 ±  3%      -0.6        6.38 ±  2%  perf-profile.children.cycles-pp.walk_p4d_range
      7.10 ±  2%      -0.6        6.54 ±  2%  perf-profile.children.cycles-pp.walk_page_range
      6.98 ±  2%      -0.6        6.42 ±  2%  perf-profile.children.cycles-pp.walk_pgd_range
      6.99 ±  3%      -0.6        6.43 ±  2%  perf-profile.children.cycles-pp.__walk_page_range
      6.92 ±  3%      -0.6        6.36 ±  2%  perf-profile.children.cycles-pp.walk_pud_range
      6.88 ±  3%      -0.6        6.32 ±  2%  perf-profile.children.cycles-pp.madvise_cold_or_pageout_pte_range
      6.90 ±  3%      -0.6        6.34 ±  2%  perf-profile.children.cycles-pp.walk_pmd_range
      6.55 ±  3%      -0.6        6.00 ±  2%  perf-profile.children.cycles-pp.folio_isolate_lru
      7.84            -0.5        7.30        perf-profile.children.cycles-pp.shmem_evict_inode
      7.73            -0.5        7.18        perf-profile.children.cycles-pp.shmem_undo_range
      6.28 ±  3%      -0.5        5.75 ±  2%  perf-profile.children.cycles-pp.folio_lruvec_lock_irq
      6.30 ±  3%      -0.5        5.78 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      7.50 ±  2%      -0.5        7.02        perf-profile.children.cycles-pp.truncate_inode_pages_range
      6.62            -0.2        6.47        perf-profile.children.cycles-pp.stress_fault
      5.72            -0.1        5.60        perf-profile.children.cycles-pp.asm_exc_page_fault
      2.28            -0.1        2.15        perf-profile.children.cycles-pp.__do_softirq
      2.26            -0.1        2.14        perf-profile.children.cycles-pp.rcu_do_batch
      2.26            -0.1        2.15        perf-profile.children.cycles-pp.rcu_core
      2.12            -0.1        2.01        perf-profile.children.cycles-pp.irq_exit_rcu
      2.00            -0.1        1.91        perf-profile.children.cycles-pp.kmem_cache_free
      0.25 ±  2%      -0.1        0.16 ±  2%  perf-profile.children.cycles-pp.vfs_fallocate
      2.34            -0.1        2.25        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      4.17            -0.1        4.08        perf-profile.children.cycles-pp.exc_page_fault
      2.32            -0.1        2.23        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.29 ±  2%      -0.1        0.20        perf-profile.children.cycles-pp.__x64_sys_fallocate
      4.14            -0.1        4.05        perf-profile.children.cycles-pp.do_user_addr_fault
      0.42 ±  3%      -0.1        0.34 ±  2%  perf-profile.children.cycles-pp.posix_fallocate64
      3.60            -0.1        3.53        perf-profile.children.cycles-pp.handle_mm_fault
      1.70 ±  2%      -0.1        1.63        perf-profile.children.cycles-pp.alloc_inode
      2.96            -0.1        2.90        perf-profile.children.cycles-pp.do_fault
      0.17 ±  3%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.rw_verify_area
      1.03            -0.0        0.99        perf-profile.children.cycles-pp.__slab_free
      0.92            -0.0        0.88        perf-profile.children.cycles-pp.simple_write_begin
      0.64 ±  2%      -0.0        0.59        perf-profile.children.cycles-pp.inode_init_always
      1.16            -0.0        1.12        perf-profile.children.cycles-pp.generic_perform_write
      0.46 ±  3%      -0.0        0.42 ±  2%  perf-profile.children.cycles-pp.mnt_want_write
      0.84            -0.0        0.80        perf-profile.children.cycles-pp.__filemap_get_folio
      1.12            -0.0        1.08        perf-profile.children.cycles-pp.perf_event_mmap
      1.08            -0.0        1.05        perf-profile.children.cycles-pp.perf_event_mmap_event
      0.15            -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__fsnotify_parent
      0.23 ±  3%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.may_open
      0.58            -0.0        0.55        perf-profile.children.cycles-pp.mas_prev_slot
      0.28            -0.0        0.26 ±  4%  perf-profile.children.cycles-pp.__count_memcg_events
      0.45 ±  2%      -0.0        0.42 ±  2%  perf-profile.children.cycles-pp.filemap_add_folio
      0.18 ±  2%      -0.0        0.15 ±  4%  perf-profile.children.cycles-pp.security_inode_alloc
      0.57            -0.0        0.54        perf-profile.children.cycles-pp.__cond_resched
      0.26            -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.68            -0.0        0.66        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.32 ±  2%      -0.0        0.30        perf-profile.children.cycles-pp.generic_file_mmap
      0.14 ±  3%      -0.0        0.12 ±  7%  perf-profile.children.cycles-pp.mem_cgroup_commit_charge
      0.31 ±  2%      -0.0        0.29 ±  2%  perf-profile.children.cycles-pp.touch_atime
      0.50 ±  2%      -0.0        0.48        perf-profile.children.cycles-pp.mas_rev_awalk
      0.32            -0.0        0.30 ±  2%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.22 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.shmem_alloc_folio
      0.17 ±  2%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.fsnotify
      0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.blk_finish_plug
      0.42            -0.0        0.40        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.17 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.folio_alloc
      0.31            -0.0        0.30        perf-profile.children.cycles-pp.mas_ascend
      0.18 ±  2%      -0.0        0.17        perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.10 ±  4%      -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.kfree
      0.19 ±  2%      -0.0        0.18        perf-profile.children.cycles-pp.xas_start
      0.64            -0.0        0.62        perf-profile.children.cycles-pp.lru_add_fn
      0.09 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp.prepend_path
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.simple_getattr
      0.20 ±  2%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.08 ±  9%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.security_current_getsecid_subj
      0.10 ±  7%      +0.0        0.12        perf-profile.children.cycles-pp.security_file_post_open
      0.09 ±  6%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.ima_file_check
      0.02 ± 99%      +0.0        0.06        perf-profile.children.cycles-pp.__x64_sys_fcntl
      0.55 ±  2%      +0.1        0.62 ±  2%  perf-profile.children.cycles-pp.inode_wait_for_writeback
     91.01            +0.2       91.25        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     18.74            +0.2       18.98        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     90.84            +0.2       91.08        perf-profile.children.cycles-pp.do_syscall_64
      0.00            +0.2        0.24 ±  3%  perf-profile.children.cycles-pp.file_start_write_area
     18.34            +0.2       18.59        perf-profile.children.cycles-pp.task_work_run
     17.46            +0.3       17.72        perf-profile.children.cycles-pp.dput
     17.25            +0.3       17.50        perf-profile.children.cycles-pp.__dentry_kill
     18.09            +0.3       18.35        perf-profile.children.cycles-pp.__fput
      1.98            +0.3        2.25        perf-profile.children.cycles-pp.__libc_pwrite
      1.82            +0.3        2.10        perf-profile.children.cycles-pp.vfs_write
      1.82            +0.3        2.10        perf-profile.children.cycles-pp.__x64_sys_pwrite64
      8.38            +0.9        9.29 ±  2%  perf-profile.children.cycles-pp.unlink
      8.21            +0.9        9.13 ±  2%  perf-profile.children.cycles-pp.__x64_sys_unlink
      8.04            +0.9        8.96 ±  2%  perf-profile.children.cycles-pp.do_unlinkat
     21.35            +1.3       22.65        perf-profile.children.cycles-pp.evict
      8.11 ±  5%      +2.0       10.10 ±  3%  perf-profile.children.cycles-pp.new_inode
      8.36 ±  5%      +2.3       10.64 ±  6%  perf-profile.children.cycles-pp.do_sys_openat2
      8.37 ±  5%      +2.3       10.65 ±  6%  perf-profile.children.cycles-pp.__x64_sys_openat
      8.55 ±  5%      +2.3       10.83 ±  6%  perf-profile.children.cycles-pp.open64
      7.99 ±  5%      +2.3       10.28 ±  6%  perf-profile.children.cycles-pp.path_openat
      8.02 ±  5%      +2.3       10.31 ±  6%  perf-profile.children.cycles-pp.do_filp_open
      6.00 ±  6%      +2.3        8.33 ±  7%  perf-profile.children.cycles-pp.open_last_lookups
      5.54 ±  6%      +2.4        7.92 ±  8%  perf-profile.children.cycles-pp.lookup_open
      4.54 ±  7%      +2.4        6.93 ±  9%  perf-profile.children.cycles-pp.ramfs_mknod
      4.40 ±  7%      +2.4        6.79 ±  9%  perf-profile.children.cycles-pp.ramfs_get_inode
     12.62 ±  6%      +4.4       16.99 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
      1.00            -0.0        0.95        perf-profile.self.cycles-pp.__slab_free
      0.10 ±  4%      -0.0        0.06        perf-profile.self.cycles-pp.vfs_fallocate
      1.25            -0.0        1.21        perf-profile.self.cycles-pp.stress_fault
      0.44 ±  5%      -0.0        0.41 ±  4%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.__fsnotify_parent
      0.26            -0.0        0.23 ±  4%  perf-profile.self.cycles-pp.__count_memcg_events
      0.25            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.17            -0.0        0.15        perf-profile.self.cycles-pp.fsnotify
      0.21            -0.0        0.19        perf-profile.self.cycles-pp.mas_prev_slot
      0.35            -0.0        0.34        perf-profile.self.cycles-pp.__cond_resched
      0.17 ±  2%      -0.0        0.16        perf-profile.self.cycles-pp.xas_start
      0.12 ±  4%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__srcu_read_lock
      0.13            -0.0        0.12        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.09            -0.0        0.08        perf-profile.self.cycles-pp.mas_store_gfp
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.unmap_region
      0.06 ±  6%      +0.0        0.07        perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.15 ±  3%      +0.0        0.19        perf-profile.self.cycles-pp.ramfs_get_inode
      0.12 ±  3%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.vfs_write
      1.60 ±  2%      +0.2        1.76        perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.2        0.22 ±  3%  perf-profile.self.cycles-pp.file_start_write_area



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

