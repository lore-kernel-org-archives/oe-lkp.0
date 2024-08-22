Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961022D611
	for <oe-lkp@lists.linux.dev>; Thu, 22 Aug 2024 06:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307680; cv=fail; b=P2YQaHEULuYzW243B8dFnM0wInsQyZrAv2ZOvODVA8P9YeqmKUn13lWw2AoZ7tMuZukj3ROUkqAzk/EqAYkgUsxV6svf15KGvhFS2RLBW0bdvL/7A9ap7m+o5Y3umkTmhiwzSrGDUK9mpr3KidAnvp69RVt7fwTsaH1HQJTanew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307680; c=relaxed/simple;
	bh=jLakvYYY4+sRfR3Gmba/VNKXqK9jNOmAhAC5pqlP/PQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r2kra5ppvqJ+kJxYqEkxbA03gLTepf2r/svqb9hfXF6OAhlRTQXq15VVq6Nw4F6DX3rAapKulmi1NgF+dJKkPWeBFVg3Xsqzl7S3P67gMZ3rC0ik4H8i2PPxbWHmaopi0kOflQaXYJjzBC1kdY6I7uyDoDULeonUBVfM+CZuzg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBOzzyN/; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBOzzyN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724307676; x=1755843676;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=jLakvYYY4+sRfR3Gmba/VNKXqK9jNOmAhAC5pqlP/PQ=;
  b=mBOzzyN/eaFkmMF4C0TeSJtkh9iVDOS3cNB9u/BpOuOT0/edTB+7RiIe
   yqKy3QkRgKZE/CuVpaXGZZbap7YLMplIZwiH7z0ikLB3PZ4QvyQNL9Ycb
   idWyPOyvCDy9J/kAe564m/FWhTo56t0PwIAk2vrijAXzIDrV7xuzJG3/k
   vZRPx2BQB+FdvfqeS4TuPB3tMQAV4B8lcZuwG0vS5j/SQrPc4uUMwB3lZ
   nHkD3i0a8GDM4SRlcFcRgJ8gvKzf2yDktcy8qr2RgY9u2TP/pB1+TVpQ7
   BTMHwGBjy0izaBNPGmXfb+nwy+Y+AU6xOvHoPPHJuNKAxH+t3dkUHmGiI
   w==;
X-CSE-ConnectionGUID: Oyrdw916RV6tKcOTAqriEQ==
X-CSE-MsgGUID: dmGUkQxhTFm5/W07rMpYpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22582764"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22582764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 23:21:15 -0700
X-CSE-ConnectionGUID: uZjLHj2qT/GLtss1beZnBA==
X-CSE-MsgGUID: h69v3oC+RTOBGHBQFj8Xvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="60995790"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Aug 2024 23:21:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 23:21:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 23:21:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 23:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dezfZKlH7fqV+WlpIDs4mUyUGmpwDaVTT4u/ImV2TwnXx95grMujjy1iJvPnjMaQC4Qgv8X7P9apVRhFDY6IBvXH6oER0pRti+c9cIEqw+KGLQ4ZQfKdybZf+X1o8WEP90HKxNkRJ5IIFZXnOQJdpHenUVB7NI2p+c4TBGclU92F5ocOtUzH7wGmVioIjXUYbubHwklgfb+krIG8KgChrVCE4WVpjxTHtJKnyy6hoIo0xxIeDnRHicX7ky1khtp+YoM3cI8WInu/FvCcHwoZgHDjYkSsciWIBSHkaCWVAga3EOlWH7P+iK7mIeCiLHHtLOqtkWOthiMAOJFqoO2xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TQ98ikyl+WNmPRRHbVieRictC1wa2QicKvB/72rzTs=;
 b=MIBKo9JMQMtDvABOCHOHoHYByJQFixQXUXcyJEisX81QS7Kt9XK122nasxsN1sY1B+U/Bxn+iywyT04XpoEUfKn3VLBnsd9NuJ5HPeGt08VgKFXSkNhBfwxE352jb4L7Br9KFyQABZhOG0yVn0FpLsn6tjD8PLgPVn2JVL8fI6dd3yDD7Zmm3HggVUTAMiFrdm07Y1dUxoa6MKzveIZ8u21G5yXu+DPTBGVa6UJg4c/QN6o7FjzDaRXHE0ZUmZp6Bpx4kP1LbYz0eLoYLp4p+HMf8Ge8RPT44RQGMeXf1/MyJo8sRa8qIlYlDK92U9jSP+nqPQZnA8iOkPcQw/PhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 06:21:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:21:10 +0000
Date: Thu, 22 Aug 2024 14:21:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/posix] [posix]  7399e95e6b:
 stress-ng.timer.ops_per_sec -50.9% regression
Message-ID: <202408221350.7f618b64-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b249cd-343a-4741-ccad-08dcc2729d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4SdUqfTglb1JEXsZxEn4tEi9p3NArvtQvt4dOtkWRYxMZyPUxCcxQznvOs?=
 =?iso-8859-1?Q?Racgp6OHzyQAYLowyLbqUV/0IhR357esvlCwVypOMGqaexzZOtVxymQmtx?=
 =?iso-8859-1?Q?sEo3ghNJeXExKgGVusIAXTemduIR+/VT6f7qMwMAlo39p1Ag+TECg26lbi?=
 =?iso-8859-1?Q?PB1eTUwS3RBFE1saaHI/Na8RRBXiiTgsLaDIwGWxXglSzKH3km6nXtEcaz?=
 =?iso-8859-1?Q?7Nv35kk9Qu7G5Vm9rNk6UvDzcFiswEZ4eQ+3is3ATuM/09/S0BAEXx7nmf?=
 =?iso-8859-1?Q?dC/aIwJE9Wv0RdZUZBwev3U0hndZrvG4GaedyPGe0G6gPDUhfFIaKaBt4o?=
 =?iso-8859-1?Q?iP5eEwYs4xVvjR3Am2p6IiRDjBig+UJ0dEpPwBqJjwhotDyCbmRNq5rZnk?=
 =?iso-8859-1?Q?qb6FiV/yF29RG7Bug3hGdBjMgBe/slaENrfje9dNuH5Yh55kZkxuykGxq4?=
 =?iso-8859-1?Q?crPEo1v13bW0c2986sv1cKeVW+nt0M+Ilw/v+sl5PfmDE0DaRMmpNiV8uL?=
 =?iso-8859-1?Q?ogyyX1s8NWnHemoaJcBRJN1u0WMOujYsa0j3D7CEV91i+cOGiwYcgOPbah?=
 =?iso-8859-1?Q?td2lIRIP9AEWsWuZ5XaqFOZ6IkKgkcDRAgXaJfWwnCzcFU67TEPtfBR6uj?=
 =?iso-8859-1?Q?KzOOj+Wa9YiAlpfelx1jlvqUyo98hFfd7f2LOz/3AkRDwJKT58bxN7sXX5?=
 =?iso-8859-1?Q?jZ0VNPMHLUP/65qUZS2WQUXlKpbshGpm2LXBFCAKLAUfYXUtKRGhJd55JT?=
 =?iso-8859-1?Q?9Wwb73Eo0pvkLmH3nqi1mekq1ETvXoZAKInm9AN2b1U4+BdfpOrIXY4zdD?=
 =?iso-8859-1?Q?yKJMKUwBA1HDBw9ls5vczfCVAyaUNdmwXzcesqKNn1uhNniJ2yxRWRWpnW?=
 =?iso-8859-1?Q?cTHCxLqLtzV2j1bX2HzBebNuJnkve54hzYWC2BudvkUkyKL9AO+3LEWW6J?=
 =?iso-8859-1?Q?x38efjBZYf3Bgy4ov90v8+ADpTgochpZNJSzDAgeQRnvo0w8DA5V4vfzjf?=
 =?iso-8859-1?Q?FleMseujMdBHwe0dSpQi/lWuetoXj63DlCTkMJx/RwUAnjzPj+c47QtV8+?=
 =?iso-8859-1?Q?yhA33Hhk4wUrkTXA+2mJQQpBQkalXHAAved6qEFi97nNntPkjnBq/G5DDz?=
 =?iso-8859-1?Q?a+wJBIX2xYBaYGQ4KeOfngQrYhoh3BhmLh/4F3LjiE4FArCpIs4F3Ltn74?=
 =?iso-8859-1?Q?2RxGOeHxnP0vaKEzBekntVieMIGLpwYATHZovykn7wnhCsPALWZlQW9yDR?=
 =?iso-8859-1?Q?2CsxyGB7Sqp+YUzcaqZTLhp3sp2o0WLlo2KbFXHqCKtYsAcOarPPSdp6xX?=
 =?iso-8859-1?Q?7rwnaU4EG4wIeAMYXKsELeR5T6tJq/Fxh11g4Ph6FG78nroGZ1xiVy4xgN?=
 =?iso-8859-1?Q?55qjndZ+gf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B+zZ4PGFTixTPv0ngQJANVDNfhl/uQ9ulbfddDg38lHVPXawoDrus9y93J?=
 =?iso-8859-1?Q?0gXjvKRSJgAP1xDq4uk1XZtW6ar70dsskqa3GBacgEyZxcn7YcYpUPesju?=
 =?iso-8859-1?Q?CHZjwGn0YLiGmZYylcfSyEpPgARitPN82J4s37QBh7Wewq4tnoB08P0LGF?=
 =?iso-8859-1?Q?B06Q4HU1QtDeuOtUOP1W8xa0w/vI6ZnbtysfCvBhih3CmG6i1jR+cEjee4?=
 =?iso-8859-1?Q?ad8xTYJOaRaIaURxqSTxSXAi8g9HOzXiLe28BiWmrzqifxOfm5a+4J1ddX?=
 =?iso-8859-1?Q?E7/hhqtxnmwKXlCrSj4VtQZ9fYnDPsQwmgb8cS5j9zuUdIsBfpWvNnD7TW?=
 =?iso-8859-1?Q?2KAB3vOY7JqLc2ffOIBh8dLnIL0DGmg7qJWZzOh91gYio0d2tzxbfakp3b?=
 =?iso-8859-1?Q?jCxZbJn0VE57VfEOSX3qzK+oVaRc4LjfBUoYixDw88pFx8Ktc4A5cmdztl?=
 =?iso-8859-1?Q?Hl8MP41R6z2sJMSWqK4yUGZ214x8PoW+iCOaiBywTnOwYKVfDn84zVEJgg?=
 =?iso-8859-1?Q?dPIV4mHMJ6CsWlfRcS1STwVNknRRGh/Y1QkHggoRRH9oS8uwNzwInE9m//?=
 =?iso-8859-1?Q?SVh0yOLqCc9shD/LoeLl6r/W3lGYAIzuI+GmzcxJlrnOPymDdd3NgCKV8x?=
 =?iso-8859-1?Q?fOB2qUTBxhygOF5Sp+SY12+8Nh5fnpY5WfNr3cgBc3FWE7MYj+yrWb7J3P?=
 =?iso-8859-1?Q?MpTmRbZmCpR70aQRa0EOb6SpY6a94r1PzZUQtTW8zyxyaawj+WBrrcjsRo?=
 =?iso-8859-1?Q?MgbVo3LpWox2f39zTeq22k8BVO5LfzIhA1JeU/ztnm1c22GekBd1jwFPJB?=
 =?iso-8859-1?Q?oj+EU3osQGqakiClRqbxkAah/sVQYinx0guDLsmtxime5AvOOU5GJFel7w?=
 =?iso-8859-1?Q?Uji9eqz0WNHItWzVe3gz+1VBTEkH5QPR9iLpTCOnYhR451F0gZB2UTCVHr?=
 =?iso-8859-1?Q?7fJ3yi9BnRlZ8eCINSeFPxDRdA7oCq4Ah/lI8GcpnmLbkJJt5g8ULPY/kN?=
 =?iso-8859-1?Q?PWt9S6Q8g+X7qbayRo3KTKzwF+vwoOtMdXaVBNbNYl8lGmljFxc1CVOBwT?=
 =?iso-8859-1?Q?UMhc9A/zIlCUK4PbEaQklDOg4YHnbgzaudW6m/ZnM5DMNaOP4lV2Dz2pfJ?=
 =?iso-8859-1?Q?aAKIeDKS9UxzM1rtCABgGRzuOLe2dn8PZRx/nvoR36/s6E23FNeTcPmspP?=
 =?iso-8859-1?Q?xIPvJZn1esQWUhAtGBJnhzcNiaij46063Ytuf1iyOtvWh2oP5TJp9PDi7M?=
 =?iso-8859-1?Q?nyJfI6I0YkLLizy/PbZOppMbBg9lC4h28RloOyJm5syMS1daAOpjp0z8nK?=
 =?iso-8859-1?Q?j7Er3mr5S0S9uytfBg2tZp/YqaIxBX2PqGV74IxmwAMvKSvF4sIiPKHP9e?=
 =?iso-8859-1?Q?HbKHWRVsXU/Drv9zWTW1zaOoQc3gCElCEGz6lutXQjE9PYf/1oDBXw94ci?=
 =?iso-8859-1?Q?4kqPbr4Vmk2sDjmRsnB2V7MfWzF2SfyeeeASkXxrSc5mARuBMgglCwF7wQ?=
 =?iso-8859-1?Q?VATJq75qXM0SYdH7BJ5YANDZlKqrIBPSGWV2h6OBJ1s7ck3fALHwcn2pQo?=
 =?iso-8859-1?Q?Pt3AgpklYh9PsbNz0RxF9Ipx9U6EopR14T1/Fegu07fR6hsQDf2u1ic715?=
 =?iso-8859-1?Q?vYsE3jaonCyESGlTdhOZvYAkaXZlDT6L1HsAV+4g6wB4B0cHl0NMrVVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b249cd-343a-4741-ccad-08dcc2729d59
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:21:10.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOqENFn7BWXx8AXPau/wBfPKMubXgXbkhptODe+qa6N/uxkJ3FXQUG/e7t5Q1Uj/hknt4gUvjaB4RyLM8o98VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -50.9% regression of stress-ng.timer.ops_per_sec on:


commit: 7399e95e6b75a9643db0153bd439f70694e05329 ("posix-timers: Make signal delivery consistent")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/posix

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timer
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408221350.7f618b64-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240822/202408221350.7f618b64-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/timer/stress-ng/60s

commit: 
  f6a43fbf63 ("posix-timers: Add proper state tracking")
  7399e95e6b ("posix-timers: Make signal delivery consistent")

f6a43fbf6374d791 7399e95e6b75a9643db0153bd43 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     46116 ±  4%     +62.6%      74969 ± 12%  cpuidle..usage
    242649 ±  8%    +955.3%    2560670 ± 24%  numa-numastat.node1.local_node
    274451 ±  4%    +849.6%    2606181 ± 24%  numa-numastat.node1.numa_hit
     62.53            -9.7%      56.48        vmstat.procs.r
      5806 ± 15%  +1.8e+05%   10742767 ± 11%  vmstat.system.cs
     13.84            +8.1       21.94 ±  2%  mpstat.cpu.all.irq%
      0.00 ± 13%      +0.1        0.13 ±  5%  mpstat.cpu.all.soft%
     71.91            -7.0       64.93        mpstat.cpu.all.sys%
     70545 ±  6%  +11565.9%    8229707 ±  3%  stress-ng.time.involuntary_context_switches
      5404           -21.0%       4269 ±  2%  stress-ng.time.percent_of_cpu_this_job_got
      2806           -19.8%       2251 ±  2%  stress-ng.time.system_time
    443.70 ±  6%     -29.4%     313.42 ±  2%  stress-ng.time.user_time
     96598 ± 28%  +3.5e+05%  3.375e+08 ± 11%  stress-ng.time.voluntary_context_switches
 1.502e+09           -51.0%  7.365e+08        stress-ng.timer.ops
  25024869           -50.9%   12275103        stress-ng.timer.ops_per_sec
     90235 ± 30%    +234.9%     302215 ± 90%  numa-meminfo.node0.Mapped
    161095           -32.1%     109413 ± 10%  numa-meminfo.node1.Active
    161086           -32.1%     109380 ± 10%  numa-meminfo.node1.Active(anon)
   1859187 ± 64%    +312.7%    7673278 ± 22%  numa-meminfo.node1.FilePages
    532140 ± 24%   +1152.0%    6662523 ± 27%  numa-meminfo.node1.Inactive
    532097 ± 24%   +1152.1%    6662384 ± 27%  numa-meminfo.node1.Inactive(anon)
     53245 ± 50%   +3039.2%    1671485 ±  8%  numa-meminfo.node1.Mapped
   2913421 ± 43%    +195.1%    8598191 ± 19%  numa-meminfo.node1.MemUsed
    215794 ± 10%   +2904.9%    6484460 ± 27%  numa-meminfo.node1.Shmem
     22703 ± 31%    +232.6%      75516 ± 90%  numa-vmstat.node0.nr_mapped
     40420           -31.9%      27533 ± 10%  numa-vmstat.node1.nr_active_anon
    464339 ± 64%    +313.4%    1919662 ± 22%  numa-vmstat.node1.nr_file_pages
    132576 ± 24%   +1157.2%    1666728 ± 27%  numa-vmstat.node1.nr_inactive_anon
     12387 ± 53%   +3282.6%     418999 ±  8%  numa-vmstat.node1.nr_mapped
     53490 ± 11%   +2933.1%    1622457 ± 27%  numa-vmstat.node1.nr_shmem
     40420           -31.9%      27532 ± 10%  numa-vmstat.node1.nr_zone_active_anon
    132576 ± 24%   +1157.2%    1666728 ± 27%  numa-vmstat.node1.nr_zone_inactive_anon
    272991 ±  5%    +854.4%    2605304 ± 24%  numa-vmstat.node1.numa_hit
    241189 ±  9%    +961.3%    2559793 ± 24%  numa-vmstat.node1.numa_local
    186760 ±  3%     -24.8%     140526 ±  4%  meminfo.Active
    186712 ±  3%     -24.8%     140475 ±  4%  meminfo.Active(anon)
   3396934          +203.3%   10303050 ±  4%  meminfo.Cached
   1633396          +428.4%    8630718 ±  4%  meminfo.Committed_AS
    812077 ±  7%    +864.5%    7832849 ±  5%  meminfo.Inactive
    811858 ±  7%    +864.8%    7832620 ±  5%  meminfo.Inactive(anon)
     90666           +17.4%     106420        meminfo.KReclaimable
    142813         +1280.5%    1971489 ±  9%  meminfo.Mapped
   5235740          +136.8%   12398447 ±  3%  meminfo.Memused
     12641 ±  2%     +37.5%      17387 ± 20%  meminfo.PageTables
     90666           +17.4%     106420        meminfo.SReclaimable
    313421         +2203.5%    7219538 ±  6%  meminfo.Shmem
   5644406 ±  2%    +120.6%   12453132 ±  3%  meminfo.max_used_kB
     46767 ±  3%     -24.8%      35149 ±  4%  proc-vmstat.nr_active_anon
   6425257            -2.8%    6246364        proc-vmstat.nr_dirty_background_threshold
  12866225            -2.8%   12508001        proc-vmstat.nr_dirty_threshold
    849530          +203.3%    2576638 ±  4%  proc-vmstat.nr_file_pages
  64631518            -2.8%   62839958        proc-vmstat.nr_free_pages
    203149 ±  7%    +864.3%    1958991 ±  5%  proc-vmstat.nr_inactive_anon
     36163         +1266.0%     494000 ±  9%  proc-vmstat.nr_mapped
      3154 ±  2%     +37.8%       4346 ± 20%  proc-vmstat.nr_page_table_pages
     78649         +2195.9%    1805754 ±  6%  proc-vmstat.nr_shmem
     22668           +17.4%      26606        proc-vmstat.nr_slab_reclaimable
     41570            +1.2%      42065        proc-vmstat.nr_slab_unreclaimable
     46767 ±  3%     -24.8%      35149 ±  4%  proc-vmstat.nr_zone_active_anon
    203149 ±  7%    +864.3%    1958991 ±  5%  proc-vmstat.nr_zone_inactive_anon
      6424 ± 78%   +2255.9%     151352 ± 10%  proc-vmstat.numa_hint_faults
      2031 ± 16%   +4011.8%      83537 ± 26%  proc-vmstat.numa_hint_faults_local
    479891          +534.5%    3044988 ±  6%  proc-vmstat.numa_hit
    413666          +620.1%    2978782 ±  6%  proc-vmstat.numa_local
     91950 ± 80%    +206.4%     281744 ± 31%  proc-vmstat.numa_pte_updates
    535891 ±  3%    +464.9%    3027472 ±  5%  proc-vmstat.pgalloc_normal
    303971           +94.0%     589856 ±  3%  proc-vmstat.pgfault
    403486 ±  5%     -18.7%     328116 ±  7%  proc-vmstat.pgfree
 3.084e+10            +9.5%  3.377e+10        perf-stat.i.branch-instructions
      0.28            +0.3        0.55 ±  2%  perf-stat.i.branch-miss-rate%
  75679448          +130.1%  1.741e+08 ±  5%  perf-stat.i.branch-misses
  33658838 ± 79%    +170.5%   91038537 ±  9%  perf-stat.i.cache-references
      5783 ± 15%  +1.9e+05%   11086465 ± 11%  perf-stat.i.context-switches
      1.63 ±  2%     -14.2%       1.40        perf-stat.i.cpi
    209.42 ±  4%  +13906.2%      29332 ± 69%  perf-stat.i.cpu-migrations
  1.36e+11           +17.0%  1.591e+11        perf-stat.i.instructions
      0.62 ±  2%     +17.4%       0.72        perf-stat.i.ipc
      3936 ±  3%    +121.9%       8734 ±  2%  perf-stat.i.minor-faults
      3936 ±  3%    +121.9%       8734 ±  2%  perf-stat.i.page-faults
      0.24 ±  2%      +0.3        0.51 ±  3%  perf-stat.overall.branch-miss-rate%
      1.64 ±  2%     -15.0%       1.39        perf-stat.overall.cpi
      0.61 ±  2%     +17.7%       0.72        perf-stat.overall.ipc
  3.03e+10            +9.4%  3.315e+10        perf-stat.ps.branch-instructions
  73579278          +131.4%  1.702e+08 ±  5%  perf-stat.ps.branch-misses
  33268622 ± 79%    +171.0%   90172536 ±  9%  perf-stat.ps.cache-references
      5739 ± 15%  +1.9e+05%   10914019 ± 11%  perf-stat.ps.context-switches
    203.92 ±  4%  +14464.0%      29698 ± 68%  perf-stat.ps.cpu-migrations
 1.336e+11           +16.9%  1.562e+11        perf-stat.ps.instructions
      3828 ±  3%    +121.9%       8496 ±  3%  perf-stat.ps.minor-faults
      3828 ±  3%    +121.9%       8496 ±  3%  perf-stat.ps.page-faults
 8.176e+12           +16.6%  9.535e+12        perf-stat.total.instructions
   1706619           -27.1%    1244370        sched_debug.cfs_rq:/.avg_vruntime.avg
   1755093           -14.7%    1496492 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
   1565165           -25.9%    1159829 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.min
     28819 ± 13%     +97.4%      56883 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      6.30 ±187%  +1.9e+06%     118058 ± 35%  sched_debug.cfs_rq:/.left_deadline.avg
    275.54 ±172%  +4.6e+05%    1268898 ±  2%  sched_debug.cfs_rq:/.left_deadline.max
     38.28 ±177%  +9.2e+05%     352823 ± 19%  sched_debug.cfs_rq:/.left_deadline.stddev
      6.10 ±186%  +1.9e+06%     118048 ± 35%  sched_debug.cfs_rq:/.left_vruntime.avg
    263.10 ±171%  +4.8e+05%    1268802 ±  2%  sched_debug.cfs_rq:/.left_vruntime.max
     36.94 ±176%  +9.5e+05%     352795 ± 19%  sched_debug.cfs_rq:/.left_vruntime.stddev
      7.42 ±  2%     -32.6%       5.00 ± 41%  sched_debug.cfs_rq:/.load_avg.min
   1706619           -27.1%    1244370        sched_debug.cfs_rq:/.min_vruntime.avg
   1755093           -14.7%    1496492 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
   1565165           -25.9%    1159829 ±  2%  sched_debug.cfs_rq:/.min_vruntime.min
     28819 ± 13%     +97.4%      56883 ± 10%  sched_debug.cfs_rq:/.min_vruntime.stddev
      6.10 ±186%  +1.9e+06%     118048 ± 35%  sched_debug.cfs_rq:/.right_vruntime.avg
    263.10 ±171%  +4.8e+05%    1268802 ±  2%  sched_debug.cfs_rq:/.right_vruntime.max
     36.94 ±176%  +9.5e+05%     352795 ± 19%  sched_debug.cfs_rq:/.right_vruntime.stddev
    746.88 ±  3%      -8.4%     684.11 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
    743.49 ±  3%      -9.4%     673.89 ±  2%  sched_debug.cfs_rq:/.util_avg.avg
    531.31           -18.4%     433.56 ±  4%  sched_debug.cfs_rq:/.util_est.avg
    454.92 ± 26%    -100.0%       0.00        sched_debug.cfs_rq:/.util_est.min
     93.06 ± 26%    +115.5%     200.56 ± 14%  sched_debug.cfs_rq:/.util_est.stddev
      1036 ±  3%     +10.1%       1140 ±  5%  sched_debug.cpu.clock_task.stddev
      1636 ±  2%     -10.2%       1469 ±  4%  sched_debug.cpu.curr->pid.avg
      1329 ±  8%    -100.0%       0.00        sched_debug.cpu.curr->pid.min
    518.31 ±  3%     +85.6%     961.96 ±  7%  sched_debug.cpu.curr->pid.stddev
      0.50          -100.0%       0.00        sched_debug.cpu.nr_running.min
      0.32 ±  7%     +34.2%       0.42 ±  7%  sched_debug.cpu.nr_running.stddev
      4320 ±  9%  +1.2e+05%    5194964 ± 11%  sched_debug.cpu.nr_switches.avg
     20854 ± 37%  +33909.9%    7092562 ±  3%  sched_debug.cpu.nr_switches.max
      1175 ± 12%  +2.2e+05%    2637907 ± 30%  sched_debug.cpu.nr_switches.min
      3744 ± 31%  +26579.4%     999084 ± 17%  sched_debug.cpu.nr_switches.stddev
      5.58 ±  4%     +19.7%       6.68 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
     37.52 ±  6%     -28.4        9.08        perf-profile.calltrace.cycles-pp.stress_timer_handler
     32.23 ±  3%     -24.3        7.96        perf-profile.calltrace.cycles-pp.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     25.36 ± 11%     -23.0        2.32        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     25.72 ± 11%     -22.5        3.22 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     25.70 ± 11%     -22.5        3.21 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     25.62 ± 11%     -22.5        3.16 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     16.64 ± 14%     -15.1        1.54        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
     11.80 ± 21%     -11.8        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.fpu__clear_user_states.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      6.37 ± 20%      -6.4        0.00        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.fpu__clear_user_states.handle_signal.arch_do_signal_or_restart
     13.72            -5.6        8.12 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      5.45 ± 20%      -5.5        0.00        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.fpu__clear_user_states.handle_signal
     10.81            -5.4        5.46 ±  4%  perf-profile.calltrace.cycles-pp.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      9.77 ± 15%      -5.2        4.57        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      5.20 ±  6%      -5.2        0.00        perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.35            -4.7        4.64 ±  2%  perf-profile.calltrace.cycles-pp.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.44 ±  4%      -4.6        4.89        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      7.97 ± 14%      -4.1        3.89        perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      7.92 ±  4%      -3.8        4.08        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      7.65 ±  3%      -3.7        3.94        perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.45 ±  4%      -3.6        3.84        perf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      6.99 ±  2%      -3.6        3.43        perf-profile.calltrace.cycles-pp.sigpending
      6.54            -3.3        3.23 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
     18.32            -2.9       15.41 ±  2%  perf-profile.calltrace.cycles-pp.timer_settime
      4.97 ±  2%      -2.5        2.44        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.74 ±  3%      -2.4        2.33        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.61 ± 39%      -2.3        0.29 ±100%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      4.57 ±  3%      -2.2        2.37        perf-profile.calltrace.cycles-pp.restore_fpregs_from_user.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      4.23 ±  3%      -2.1        2.08        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.96 ±  3%      -2.0        1.95        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime
      3.80 ±  3%      -1.8        1.97        perf-profile.calltrace.cycles-pp.__restore_fpregs_from_user.restore_fpregs_from_user.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext
      3.15 ± 24%      -1.8        1.33        perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart
      3.92 ±  6%      -1.8        2.16        perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart
      2.92 ±  2%      -1.5        1.44        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.common_timer_set.do_timer_settime
     14.50            -1.4       13.14 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      2.64 ±  4%      -1.2        1.40        perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      2.75            -1.2        1.52 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
      2.50            -1.1        1.38 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.00 ±  3%      -1.0        1.00        perf-profile.calltrace.cycles-pp.common_hrtimer_arm.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
     14.75            -1.0       13.79 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_settime
      1.86 ±  3%      -0.9        0.93        perf-profile.calltrace.cycles-pp.clear_bhb_loop.sigpending
      1.78 ±  4%      -0.9        0.87        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.72 ±  3%      -0.9        0.86        perf-profile.calltrace.cycles-pp.clear_bhb_loop.timer_getoverrun
      1.66 ±  4%      -0.8        0.85        perf-profile.calltrace.cycles-pp.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.67 ±  4%      -0.8        0.87        perf-profile.calltrace.cycles-pp.clear_bhb_loop
      1.62 ±  3%      -0.8        0.83        perf-profile.calltrace.cycles-pp.clear_bhb_loop.timer_settime
      1.74 ±  2%      -0.8        0.96        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      1.57 ±  4%      -0.7        0.83 ±  2%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      1.32 ±  3%      -0.7        0.63        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.38 ±  4%      -0.6        0.74        perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.28 ±  4%      -0.6        0.66        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime
      1.14 ±  3%      -0.6        0.56        perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.87 ± 25%      -0.5        0.33 ±102%  perf-profile.calltrace.cycles-pp.__lock_timer.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.08 ±  4%      -0.4        1.70 ±  6%  perf-profile.calltrace.cycles-pp._copy_from_user.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.60        perf-profile.calltrace.cycles-pp.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.00            +0.6        0.60 ±  7%  perf-profile.calltrace.cycles-pp.update_curr.pick_next_task_fair.__schedule.schedule.do_nanosleep
      0.00            +0.6        0.61        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +0.6        0.61 ± 10%  perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.00            +0.6        0.62 ±  9%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
      0.00            +0.7        0.67 ± 13%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__x64_sys_timer_getoverrun.do_syscall_64
      0.00            +0.7        0.68 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.timer_getoverrun
      0.00            +0.7        0.68 ± 12%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +0.7        0.68 ± 11%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.00            +0.7        0.71 ± 11%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +0.7        0.72 ± 14%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._copy_from_user.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64
      0.00            +0.8        0.76 ± 11%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +0.8        0.76 ± 12%  perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.do_idle
      0.00            +0.8        0.80 ± 12%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.8        0.82        perf-profile.calltrace.cycles-pp.clear_bhb_loop.clock_nanosleep
      0.00            +0.8        0.84 ± 18%  perf-profile.calltrace.cycles-pp.get_timespec64.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.8        0.84 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_try_to_cancel.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +0.8        0.84 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.timer_getoverrun
      0.00            +1.0        0.98 ±  5%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.00            +1.0        0.99 ±  5%  perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.00            +1.0        1.00 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.timer_getoverrun
      0.00            +1.0        1.01 ± 12%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +1.0        1.02 ± 12%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +1.0        1.02 ±  2%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +1.2        1.15 ± 11%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +1.3        1.29 ±  2%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +1.4        1.41        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal
      0.00            +1.5        1.48 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +1.5        1.50 ± 11%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.complete_signal
      1.56 ± 42%      +1.6        3.20 ± 26%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +1.7        1.72 ± 12%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.complete_signal.send_sigqueue
      0.00            +1.9        1.92        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +2.0        2.00 ± 10%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.00            +2.0        2.02 ± 11%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn
      0.00            +2.2        2.16 ± 10%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.do_nanosleep
      0.00            +2.2        2.17 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep
      0.00            +2.4        2.42 ± 11%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +2.5        2.49 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.timer_getoverrun
      0.00            +2.6        2.57 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep
      6.58 ±  7%      +2.7        9.28 ±  8%  perf-profile.calltrace.cycles-pp.timer_getoverrun
      0.00            +2.8        2.84 ±  6%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +2.9        2.93 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +3.0        2.96 ±  4%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.26 ± 28%      +3.0        5.27 ± 15%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +3.2        3.16 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      2.51 ± 25%      +3.2        5.68 ± 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      3.14 ±  4%      +3.4        6.54 ±  7%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +3.6        3.60 ± 11%  perf-profile.calltrace.cycles-pp.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn.__hrtimer_run_queues
      1.24 ± 15%      +4.0        5.24 ±  8%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.50 ± 35%      +4.0        5.50 ± 10%  perf-profile.calltrace.cycles-pp.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      0.89 ± 22%      +4.0        4.90 ±  9%  perf-profile.calltrace.cycles-pp.send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +4.4        4.35 ±  9%  perf-profile.calltrace.cycles-pp.complete_signal.send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt
      2.34 ± 21%      +4.4        6.76 ±  8%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      4.04 ± 17%      +4.5        8.59 ±  8%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +5.0        4.99 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +5.3        5.30 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +6.3        6.29 ± 10%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch
      0.00            +6.9        6.90 ± 10%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule
      0.00            +7.6        7.63 ± 10%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle
      0.00            +7.7        7.68 ±  7%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +8.8        8.80 ±  7%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +9.9        9.89 ± 10%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00           +10.9       10.93 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle.do_idle
      0.00           +12.9       12.88 ± 10%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.00           +13.0       13.03 ± 10%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +13.0       13.04 ± 10%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +13.0       13.04 ± 10%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +13.0       13.04 ± 10%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.00           +13.2       13.22 ± 10%  perf-profile.calltrace.cycles-pp.common_startup_64
     27.15 ±  6%     +13.6       40.70        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     27.16 ±  6%     +13.7       40.86        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00           +16.2       16.15 ±  4%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
     27.18 ±  6%     +16.5       43.69        perf-profile.calltrace.cycles-pp.clock_nanosleep
      0.00           +17.9       17.86 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +18.0       17.97 ±  2%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00           +19.4       19.38        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     34.50 ±  7%     -27.0        7.46        perf-profile.children.cycles-pp.stress_timer_handler
     43.78           -25.8       18.02 ±  4%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
     45.15           -25.3       19.87 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     32.88 ±  3%     -24.8        8.04        perf-profile.children.cycles-pp.handle_signal
     17.93 ± 15%     -16.3        1.62        perf-profile.children.cycles-pp.fpu__clear_user_states
     79.37           -11.5       67.83 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     78.42           -11.3       67.15 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
     14.20 ±  3%      -7.1        7.08        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
     10.57 ± 15%      -5.9        4.66        perf-profile.children.cycles-pp.x64_setup_rt_frame
     13.78            -5.6        8.20 ±  3%  perf-profile.children.cycles-pp.__x64_sys_timer_settime
     10.89            -5.4        5.51 ±  4%  perf-profile.children.cycles-pp.do_timer_settime
      5.73 ±  6%      -5.2        0.52        perf-profile.children.cycles-pp.signal_setup_done
     10.06 ±  3%      -5.1        4.99        perf-profile.children.cycles-pp.restore_sigcontext
      9.42            -4.7        4.67 ±  2%  perf-profile.children.cycles-pp.common_timer_set
      8.46 ± 17%      -4.5        3.94        perf-profile.children.cycles-pp.get_sigframe
      4.96 ±  7%      -4.4        0.54        perf-profile.children.cycles-pp.fpregs_mark_activate
      7.97 ±  3%      -4.0        3.97        perf-profile.children.cycles-pp.fpu__restore_sig
      7.81 ±  3%      -3.9        3.89        perf-profile.children.cycles-pp.__fpu_restore_sig
      7.04 ±  2%      -3.3        3.76        perf-profile.children.cycles-pp.sigpending
     18.40            -2.6       15.77 ±  2%  perf-profile.children.cycles-pp.timer_settime
      6.94 ±  3%      -2.6        4.35        perf-profile.children.cycles-pp.clear_bhb_loop
      4.83 ±  2%      -2.4        2.42        perf-profile.children.cycles-pp.restore_fpregs_from_user
      3.53 ± 28%      -2.1        1.40        perf-profile.children.cycles-pp.save_xstate_epilog
      4.31 ±  9%      -2.1        2.23        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      3.99 ±  2%      -2.0        2.00        perf-profile.children.cycles-pp.__restore_fpregs_from_user
      7.07 ±  2%      -1.6        5.50        perf-profile.children.cycles-pp.native_irq_return_iret
      2.12 ±  3%      -1.1        1.06        perf-profile.children.cycles-pp.common_hrtimer_arm
      1.64 ± 13%      -0.9        0.72        perf-profile.children.cycles-pp.__get_user_nocheck_4
      1.76 ±  3%      -0.9        0.87        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      2.78 ±  3%      -0.9        1.89        perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.38 ± 25%      -0.8        0.55        perf-profile.children.cycles-pp.__put_user_nocheck_4
      1.83 ±  2%      -0.8        1.01        perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      1.01 ±  2%      -0.8        0.23        perf-profile.children.cycles-pp.__local_bh_enable_ip
      2.83 ±  6%      -0.8        2.08 ±  3%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      1.42 ±  3%      -0.7        0.68        perf-profile.children.cycles-pp.__get_user_nocheck_8
      1.49 ±  3%      -0.7        0.77        perf-profile.children.cycles-pp.restore_altstack
      4.54 ±  3%      -0.7        3.84 ±  5%  perf-profile.children.cycles-pp._copy_from_user
      1.90 ±  4%      -0.6        1.25        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.76            -0.5        1.24 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.94 ±  2%      -0.5        0.46        perf-profile.children.cycles-pp.set_current_blocked
      1.74 ±  7%      -0.5        1.26 ±  4%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.88 ±  3%      -0.4        0.47        perf-profile.children.cycles-pp._copy_to_user
      1.01 ±  4%      -0.3        0.74 ±  2%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.75 ±  4%      -0.2        0.51        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.50            -0.2        0.26 ±  3%  perf-profile.children.cycles-pp.do_sigpending
      0.67 ±  6%      -0.2        0.46 ±  3%  perf-profile.children.cycles-pp.__put_user_8
      0.80 ±  7%      -0.2        0.60 ±  4%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.30 ±  2%      -0.1        0.16 ±  2%  perf-profile.children.cycles-pp.rep_stos_alternative
      0.61 ±  7%      -0.1        0.47 ±  5%  perf-profile.children.cycles-pp.__get_user_8
      0.28 ±  4%      -0.1        0.14 ±  5%  perf-profile.children.cycles-pp.__check_object_size
      0.20 ±  5%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__set_task_blocked
      0.94            -0.1        0.84 ±  5%  perf-profile.children.cycles-pp.recalc_sigpending
      0.20 ±  2%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.do_sigaltstack
      0.22 ±  4%      -0.1        0.13 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.17 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.fpu__alloc_mathframe
      0.10 ±  7%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.hrtimer_init
      0.10 ±  4%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.ktime_add_safe
      0.10 ±  4%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.check_stack_object
      0.13 ± 11%      -0.0        0.08 ±  8%  perf-profile.children.cycles-pp.task_curr
      0.10 ±  7%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.sigismember@plt
      0.15 ±  5%      -0.0        0.12 ±  6%  perf-profile.children.cycles-pp.sigismember
      0.07 ±  5%      -0.0        0.06        perf-profile.children.cycles-pp.sched_tick
      0.48            +0.0        0.50        perf-profile.children.cycles-pp.error_entry
      0.75            +0.0        0.78        perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.08 ±  4%      +0.0        0.11        perf-profile.children.cycles-pp.sched_clock_noinstr
      0.13 ±  3%      +0.0        0.17 ±  4%  perf-profile.children.cycles-pp.hrtimer_active
      0.42 ±  2%      +0.0        0.47        perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.check_cfs_rq_runtime
      0.10            +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.irqentry_enter
      0.13 ±  3%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.13 ±  4%      +0.1        0.19 ±  4%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.perf_swevent_event
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.timer_settime@plt
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.dequeue_task
      0.60            +0.1        0.66        perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.sched_balance_domains
      0.36 ± 10%      +0.1        0.44 ±  4%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.06 ±  8%      +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.irqentry_exit
      0.21 ±  2%      +0.1        0.29 ±  5%  perf-profile.children.cycles-pp.__irqentry_text_end
      0.31 ± 11%      +0.1        0.40 ±  9%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.perf_swevent_get_recursion_context
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.evlist__event2evsel
      0.78 ±  3%      +0.1        0.87        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.1        0.09 ± 17%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.perf_trace_run_bpf_submit
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.sched_update_worker
      0.00            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.put_prev_entity
      2.09            +0.1        2.19        perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.00            +0.1        0.11 ± 10%  perf-profile.children.cycles-pp.__enqueue_entity
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.tracing_gen_ctx_irq_test
      0.00            +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.handle_softirqs
      0.10 ±  4%      +0.1        0.23 ±  4%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.1        0.14 ± 24%  perf-profile.children.cycles-pp.__update_idle_core
      0.00            +0.1        0.14 ± 12%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.cpuacct_charge
      0.00            +0.2        0.16 ± 16%  perf-profile.children.cycles-pp.evsel__parse_sample
      0.00            +0.2        0.16 ± 32%  perf-profile.children.cycles-pp.select_idle_sibling
      0.00            +0.2        0.16 ± 15%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.2        0.16 ±  9%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.2        0.16 ±  3%  perf-profile.children.cycles-pp.update_curr_se
      0.00            +0.2        0.16 ±  9%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.2        0.17        perf-profile.children.cycles-pp.hrtimer_forward
      1.46 ±  2%      +0.2        1.64        perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.2        0.18 ±  7%  perf-profile.children.cycles-pp.perf_trace_buf_alloc
      0.00            +0.2        0.18 ± 36%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.2        0.18 ± 36%  perf-profile.children.cycles-pp.start_kernel
      0.00            +0.2        0.18 ± 36%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +0.2        0.18 ± 36%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.00            +0.2        0.18 ±  9%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.2        0.18 ± 14%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.00            +0.2        0.19 ± 23%  perf-profile.children.cycles-pp.pick_next_task_idle
      0.00            +0.2        0.19 ±  9%  perf-profile.children.cycles-pp.wakeup_preempt
      0.62 ±  3%      +0.2        0.82 ±  3%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +0.2        0.22 ±  5%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.00            +0.2        0.25 ± 13%  perf-profile.children.cycles-pp.evlist__parse_sample
      1.16 ±  2%      +0.2        1.41        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.00            +0.2        0.25 ±  2%  perf-profile.children.cycles-pp.pick_eevdf
      0.21 ± 28%      +0.3        0.46 ±  2%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.3        0.25 ±  9%  perf-profile.children.cycles-pp.avg_vruntime
      0.00            +0.3        0.25 ± 12%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.00            +0.3        0.26 ±  6%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.3        0.26 ± 12%  perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.3        0.26 ±  3%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.3        0.28 ±  9%  perf-profile.children.cycles-pp.reweight_entity
      2.08 ±  3%      +0.3        2.37        perf-profile.children.cycles-pp.read_tsc
      2.39 ±  3%      +0.3        2.68        perf-profile.children.cycles-pp.ktime_get
      0.00            +0.3        0.29 ± 11%  perf-profile.children.cycles-pp.place_entity
      0.00            +0.3        0.30 ±  9%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.00            +0.3        0.30 ± 19%  perf-profile.children.cycles-pp.update_cfs_group
      0.00            +0.3        0.31 ±  7%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.00            +0.3        0.32 ±  3%  perf-profile.children.cycles-pp.update_min_vruntime
      0.44 ± 16%      +0.3        0.76 ±  6%  perf-profile.children.cycles-pp.timerqueue_del
      0.43 ±  2%      +0.3        0.76 ±  2%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.3        0.33 ± 21%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.4        0.36 ± 14%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.30            +0.4        0.67 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.58 ±  3%      +0.4        0.98        perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.4        0.42 ± 18%  perf-profile.children.cycles-pp.select_task_rq
      0.79 ±  2%      +0.4        1.21        perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.4        0.43 ± 13%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.00            +0.4        0.44 ± 13%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.00            +0.5        0.46 ±  9%  perf-profile.children.cycles-pp.os_xsave
      0.90 ±  2%      +0.5        1.38        perf-profile.children.cycles-pp.sched_clock
      0.00            +0.5        0.54 ± 10%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      1.04 ±  2%      +0.5        1.59        perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.6        0.56 ±  5%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.6        0.56 ± 11%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.6        0.57 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.6        0.58 ±  9%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.6        0.60 ± 24%  perf-profile.children.cycles-pp.hrtimer_init_sleeper
      0.00            +0.6        0.61 ±  6%  perf-profile.children.cycles-pp.perf_tp_event
      0.00            +0.6        0.62        perf-profile.children.cycles-pp.common_hrtimer_rearm
      0.00            +0.7        0.72 ±  9%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +0.8        0.79 ±  9%  perf-profile.children.cycles-pp.__switch_to
      0.22 ±  2%      +0.8        1.02 ±  3%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.8        0.84 ± 11%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.9        0.86 ± 11%  perf-profile.children.cycles-pp.prepare_task_switch
      0.00            +0.9        0.87 ± 18%  perf-profile.children.cycles-pp.get_timespec64
      0.00            +1.0        0.98 ±  5%  perf-profile.children.cycles-pp.queue_event
      0.00            +1.0        0.99 ±  5%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +1.0        1.02 ±  4%  perf-profile.children.cycles-pp.process_simple
      0.00            +1.0        1.04 ±  6%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      1.36 ±  4%      +1.1        2.41        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      6.65            +1.4        8.04 ±  2%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.00            +1.4        1.44 ±  3%  perf-profile.children.cycles-pp.update_curr
      0.00            +1.5        1.52 ±  2%  perf-profile.children.cycles-pp.reader__read_event
      0.00            +1.5        1.52 ±  2%  perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +1.5        1.52 ±  2%  perf-profile.children.cycles-pp.record__finish_output
      0.00            +1.6        1.62 ± 11%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +1.7        1.69 ± 10%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +1.8        1.78 ± 12%  perf-profile.children.cycles-pp.enqueue_task_fair
      1.63 ± 41%      +1.9        3.57 ± 24%  perf-profile.children.cycles-pp.__x64_sys_timer_getoverrun
      0.00            +2.1        2.10 ± 11%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +2.2        2.24 ± 10%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +2.4        2.40 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +2.4        2.44 ± 11%  perf-profile.children.cycles-pp.dequeue_task_fair
      6.62 ±  7%      +3.5       10.13 ±  7%  perf-profile.children.cycles-pp.timer_getoverrun
      1.70 ± 36%      +4.0        5.67 ± 10%  perf-profile.children.cycles-pp.posixtimer_deliver_signal
      0.64 ±  3%      +4.3        4.90 ±  9%  perf-profile.children.cycles-pp.complete_signal
      0.12 ±  5%      +4.3        4.43 ± 10%  perf-profile.children.cycles-pp.try_to_wake_up
      2.00            +4.3        6.32 ±  6%  perf-profile.children.cycles-pp.send_sigqueue
      2.57 ± 23%      +4.3        6.90 ±  9%  perf-profile.children.cycles-pp.dequeue_signal
      2.84 ±  8%      +4.3        7.19 ±  4%  perf-profile.children.cycles-pp.posix_timer_fn
      4.45 ± 20%      +4.4        8.85 ±  9%  perf-profile.children.cycles-pp.get_signal
      4.40 ± 11%      +4.5        8.94        perf-profile.children.cycles-pp.__hrtimer_run_queues
     10.60 ±  4%      +4.9       15.54        perf-profile.children.cycles-pp.hrtimer_interrupt
     12.94 ±  3%      +5.1       18.00        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     15.14 ±  2%      +5.6       20.70        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     22.12            +6.2       28.30        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +9.0        9.00 ±  8%  perf-profile.children.cycles-pp.schedule
      0.00           +11.1       11.05 ± 10%  perf-profile.children.cycles-pp.finish_task_switch
      0.00           +13.0       13.04 ± 10%  perf-profile.children.cycles-pp.start_secondary
      0.00           +13.2       13.21 ± 10%  perf-profile.children.cycles-pp.schedule_idle
      0.00           +13.2       13.22 ± 10%  perf-profile.children.cycles-pp.common_startup_64
      0.00           +13.2       13.22 ± 10%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00           +13.2       13.22 ± 10%  perf-profile.children.cycles-pp.do_idle
      0.00           +16.6       16.64 ±  4%  perf-profile.children.cycles-pp.do_nanosleep
     27.18 ±  6%     +16.9       44.07        perf-profile.children.cycles-pp.clock_nanosleep
      0.00           +17.9       17.93 ±  2%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.00           +18.1       18.09 ±  2%  perf-profile.children.cycles-pp.common_nsleep
      0.00           +19.4       19.43        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.00           +21.1       21.10 ±  9%  perf-profile.children.cycles-pp.__schedule
      5.29 ± 12%      -3.9        1.34        perf-profile.self.cycles-pp.fpu__clear_user_states
      6.87 ±  3%      -2.6        4.31        perf-profile.self.cycles-pp.clear_bhb_loop
      3.96 ±  2%      -2.0        1.98        perf-profile.self.cycles-pp.__restore_fpregs_from_user
      3.58            -1.6        1.97        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      7.07 ±  2%      -1.6        5.50        perf-profile.self.cycles-pp.native_irq_return_iret
      4.44 ±  3%      -1.4        3.01 ±  2%  perf-profile.self.cycles-pp._copy_from_user
      1.84 ±  4%      -1.4        0.44        perf-profile.self.cycles-pp.fpregs_mark_activate
      1.53 ±  6%      -1.4        0.17 ±  2%  perf-profile.self.cycles-pp.signal_setup_done
      1.95 ±  6%      -1.0        0.95 ±  3%  perf-profile.self.cycles-pp.stress_timer_handler
      1.54 ±  2%      -0.8        0.71        perf-profile.self.cycles-pp.x64_setup_rt_frame
      1.43 ±  2%      -0.7        0.70        perf-profile.self.cycles-pp.__get_user_nocheck_4
      1.36 ±  3%      -0.7        0.66        perf-profile.self.cycles-pp.__get_user_nocheck_8
      1.25 ±  3%      -0.6        0.61        perf-profile.self.cycles-pp.__fpu_restore_sig
      1.84 ±  4%      -0.6        1.21        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.06 ±  6%      -0.5        0.51        perf-profile.self.cycles-pp.__put_user_nocheck_4
      1.07 ±  7%      -0.5        0.52        perf-profile.self.cycles-pp.save_xstate_epilog
      1.01 ±  3%      -0.5        0.50        perf-profile.self.cycles-pp.check_xstate_in_sigframe
      0.86 ±  3%      -0.4        0.42        perf-profile.self.cycles-pp.restore_sigcontext
      1.57            -0.4        1.15 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.86 ±  2%      -0.4        0.44        perf-profile.self.cycles-pp._copy_to_user
      0.73 ±  6%      -0.3        0.39 ±  2%  perf-profile.self.cycles-pp.timer_settime
      0.50            -0.3        0.17 ±  2%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.65 ±  3%      -0.3        0.35 ±  2%  perf-profile.self.cycles-pp.sigpending
      0.98 ±  3%      -0.3        0.69        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.95            -0.3        0.67        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.75 ±  4%      -0.2        0.50        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.95            -0.2        0.72 ±  2%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.46            -0.2        0.24 ±  3%  perf-profile.self.cycles-pp.get_sigframe
      0.49 ±  2%      -0.2        0.28        perf-profile.self.cycles-pp.handle_signal
      0.39            -0.2        0.18 ±  4%  perf-profile.self.cycles-pp.common_timer_set
      0.41 ±  4%      -0.2        0.21 ±  2%  perf-profile.self.cycles-pp.do_timer_settime
      0.42 ±  3%      -0.2        0.24 ±  2%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.62            -0.2        0.44 ±  3%  perf-profile.self.cycles-pp.__put_user_8
      0.34 ±  5%      -0.2        0.17        perf-profile.self.cycles-pp.restore_fpregs_from_user
      0.91 ±  2%      -0.2        0.75        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.29 ±  4%      -0.1        0.15 ±  3%  perf-profile.self.cycles-pp.common_hrtimer_arm
      0.24 ±  3%      -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.restore_altstack
      0.34 ±  4%      -0.1        0.22 ±  3%  perf-profile.self.cycles-pp.get_itimerspec64
      0.21 ±  3%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.set_current_blocked
      0.22            -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.rep_stos_alternative
      0.16 ±  4%      -0.1        0.06        perf-profile.self.cycles-pp.__set_task_blocked
      0.56 ±  3%      -0.1        0.46 ±  6%  perf-profile.self.cycles-pp.__get_user_8
      0.32 ±  4%      -0.1        0.22 ±  2%  perf-profile.self.cycles-pp.__x64_sys_timer_settime
      0.89            -0.1        0.79 ±  6%  perf-profile.self.cycles-pp.recalc_sigpending
      0.21 ±  2%      -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.24 ±  5%      -0.1        0.15 ±  4%  perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.19 ±  2%      -0.1        0.10 ±  3%  perf-profile.self.cycles-pp.do_sigaltstack
      0.18 ±  5%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.do_sigpending
      0.16 ±  3%      -0.1        0.08        perf-profile.self.cycles-pp.fpu__restore_sig
      0.29            -0.1        0.22 ±  3%  perf-profile.self.cycles-pp.rseq_ip_fixup
      0.14 ±  4%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__check_object_size
      0.33 ±  3%      -0.1        0.26        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.14 ±  3%      -0.1        0.08        perf-profile.self.cycles-pp.fpu__alloc_mathframe
      0.54 ±  3%      -0.1        0.48        perf-profile.self.cycles-pp.x64_sys_call
      0.11 ± 12%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp.task_curr
      0.16 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.rseq_get_rseq_cs
      0.12 ±  3%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.sigismember
      0.08            +0.0        0.09        perf-profile.self.cycles-pp.irqentry_enter
      0.07            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.irq_enter_rcu
      0.28            +0.0        0.30        perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.32 ±  3%      +0.0        0.34        perf-profile.self.cycles-pp.dequeue_signal
      0.46            +0.0        0.48        perf-profile.self.cycles-pp.error_entry
      0.20            +0.0        0.22 ±  2%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.21 ±  2%      +0.0        0.24        perf-profile.self.cycles-pp.__irq_exit_rcu
      0.36            +0.0        0.39        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.08            +0.0        0.11        perf-profile.self.cycles-pp.sched_clock
      0.11 ±  4%      +0.0        0.15 ±  5%  perf-profile.self.cycles-pp.hrtimer_active
      0.11 ±  5%      +0.0        0.15 ±  8%  perf-profile.self.cycles-pp.rb_next
      0.38 ±  2%      +0.0        0.42        perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.sched_clock_noinstr
      0.21 ±  4%      +0.1        0.26 ±  4%  perf-profile.self.cycles-pp.posix_timer_fn
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.select_idle_sibling
      0.40 ±  3%      +0.1        0.46        perf-profile.self.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.dequeue_task
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.hrtimer_init_sleeper
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.reader__read_event
      0.54 ±  2%      +0.1        0.60 ±  2%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.14 ± 11%      +0.1        0.20 ± 12%  perf-profile.self.cycles-pp.timerqueue_del
      0.14 ±  3%      +0.1        0.21 ±  2%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.1        0.07 ± 14%  perf-profile.self.cycles-pp.__ordered_events__flush
      0.13 ±  7%      +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.enqueue_hrtimer
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.irqentry_exit
      0.00            +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.perf_swevent_get_recursion_context
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.sched_balance_domains
      0.60 ±  3%      +0.1        0.67        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.17 ±  5%      +0.1        0.25 ±  2%  perf-profile.self.cycles-pp.get_nohz_timer_target
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.perf_trace_run_bpf_submit
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.select_task_rq
      0.00            +0.1        0.08 ± 13%  perf-profile.self.cycles-pp.perf_trace_buf_alloc
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.sched_update_worker
      0.00            +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.00            +0.1        0.09 ± 14%  perf-profile.self.cycles-pp.evlist__event2evsel
      0.00            +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.common_hrtimer_rearm
      0.00            +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.wakeup_preempt
      0.54            +0.1        0.63 ±  8%  perf-profile.self.cycles-pp.send_sigqueue
      0.00            +0.1        0.09 ± 27%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.09 ± 12%  perf-profile.self.cycles-pp.__enqueue_entity
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.perf_trace_buf_update
      0.00            +0.1        0.10 ± 10%  perf-profile.self.cycles-pp.resched_curr
      0.00            +0.1        0.10 ± 20%  perf-profile.self.cycles-pp.put_prev_task_fair
      0.00            +0.1        0.10 ± 13%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      2.07            +0.1        2.17        perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.00            +0.1        0.10 ±  9%  perf-profile.self.cycles-pp.schedule_idle
      0.00            +0.1        0.11 ±  6%  perf-profile.self.cycles-pp.tracing_gen_ctx_irq_test
      0.06 ±  6%      +0.1        0.18 ±  5%  perf-profile.self.cycles-pp.rb_insert_color
      0.24 ±  3%      +0.1        0.35        perf-profile.self.cycles-pp.posixtimer_deliver_signal
      0.00            +0.1        0.12 ± 10%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.12 ± 11%  perf-profile.self.cycles-pp.perf_trace_sched_switch
      0.00            +0.1        0.12 ± 24%  perf-profile.self.cycles-pp.__update_idle_core
      0.00            +0.1        0.12 ±  5%  perf-profile.self.cycles-pp.get_timespec64
      0.00            +0.1        0.14 ±  9%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.1        0.14 ± 11%  perf-profile.self.cycles-pp.place_entity
      0.00            +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.update_curr_se
      0.00            +0.2        0.15 ±  5%  perf-profile.self.cycles-pp.common_nsleep
      0.00            +0.2        0.15 ± 10%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.10 ±  5%      +0.2        0.25        perf-profile.self.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.2        0.15 ± 15%  perf-profile.self.cycles-pp.evsel__parse_sample
      0.00            +0.2        0.16 ±  9%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.2        0.16 ± 13%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.00            +0.2        0.16 ±  2%  perf-profile.self.cycles-pp.hrtimer_forward
      0.43 ±  9%      +0.2        0.60 ±  8%  perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.00            +0.2        0.17 ± 13%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.2        0.17 ± 11%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.00            +0.2        0.18 ± 10%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.2        0.19 ±  6%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.00            +0.2        0.19 ± 16%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.00            +0.2        0.20 ± 12%  perf-profile.self.cycles-pp.__dequeue_entity
      0.35 ±  2%      +0.2        0.56        perf-profile.self.cycles-pp.timerqueue_add
      0.10 ±  7%      +0.2        0.32 ±  6%  perf-profile.self.cycles-pp.try_to_wake_up
      0.68 ±  3%      +0.2        0.90 ±  2%  perf-profile.self.cycles-pp.timer_getoverrun
      0.00            +0.2        0.23 ±  2%  perf-profile.self.cycles-pp.pick_eevdf
      0.00            +0.2        0.23 ±  9%  perf-profile.self.cycles-pp.avg_vruntime
      0.00            +0.2        0.24 ± 13%  perf-profile.self.cycles-pp.sched_balance_newidle
      0.17 ± 32%      +0.2        0.41 ±  3%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.2        0.24 ±  5%  perf-profile.self.cycles-pp.__calc_delta
      0.44 ±  4%      +0.2        0.68        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.3        0.26 ±  2%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.3        0.27 ± 10%  perf-profile.self.cycles-pp.reweight_entity
      2.01 ±  3%      +0.3        2.28        perf-profile.self.cycles-pp.read_tsc
      0.00            +0.3        0.28 ± 20%  perf-profile.self.cycles-pp.update_cfs_group
      0.00            +0.3        0.29 ±  9%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.3        0.29 ±  3%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.3        0.30 ± 12%  perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.3        0.31 ±  5%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.3        0.33 ±  2%  perf-profile.self.cycles-pp.stress_timer
      0.19 ±  5%      +0.3        0.52 ±  6%  perf-profile.self.cycles-pp.__x64_sys_timer_getoverrun
      0.28            +0.3        0.62 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.3        0.34 ± 11%  perf-profile.self.cycles-pp.enqueue_entity
      0.00            +0.4        0.36 ± 10%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.4        0.38 ±  9%  perf-profile.self.cycles-pp.schedule
      0.00            +0.4        0.39 ±  3%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.4        0.39 ±  2%  perf-profile.self.cycles-pp.__nanosleep
      0.00            +0.4        0.40 ±  7%  perf-profile.self.cycles-pp.perf_tp_event
      0.75 ±  2%      +0.4        1.17 ±  2%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.4        0.42        perf-profile.self.cycles-pp.__x64_sys_clock_nanosleep
      0.00            +0.4        0.42 ±  5%  perf-profile.self.cycles-pp.clock_nanosleep
      0.00            +0.4        0.45 ±  8%  perf-profile.self.cycles-pp.os_xsave
      0.00            +0.5        0.46 ± 11%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.5        0.47 ±  4%  perf-profile.self.cycles-pp.update_curr
      0.00            +0.5        0.50 ± 10%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.5        0.52 ±  9%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.6        0.58 ±  2%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.00            +0.6        0.61 ± 12%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.7        0.72 ±  9%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.8        0.76 ±  9%  perf-profile.self.cycles-pp.__switch_to
      0.00            +1.0        0.97 ±  5%  perf-profile.self.cycles-pp.queue_event
      1.23 ±  3%      +1.3        2.50 ±  3%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +1.4        1.45 ±  7%  perf-profile.self.cycles-pp.__schedule
      0.00            +1.5        1.46 ±  3%  perf-profile.self.cycles-pp.do_nanosleep
      0.00            +1.9        1.94 ±  9%  perf-profile.self.cycles-pp.finish_task_switch




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

