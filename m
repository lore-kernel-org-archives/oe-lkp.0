Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B83803C2
	for <oe-lkp@lists.linux.dev>; Sun, 31 May 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780217560; cv=fail; b=Kr/8ufUfhiIBfz1IZokQz5jLvWUxXQ4LMRZfx0lQYJk/LDjVELPKOsLMs5lBiH0iS7OCU9bZDuaebQ4DMcferBtPKVnpBc7+43xmB0x0os5pRHaL/yoExSc2SV0I/sTqL8C1qzsSdsINb67Lx7ScljMqGXFI9Ari7pHNpw+heno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780217560; c=relaxed/simple;
	bh=CIpIcU+SJlsBpboyXi6mIRu/XMu90JJngU/GrME9W1U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HwH7/cmYPFsFDnFsCKgY6H+Uzl0CYg2vrVgAYqrtcpE+jzfImpsCuzXvi0vAAOqYIG/HFCSdZ4utxhVWELhiLSOtX+TT+yn3kJ1CcUwXuD4fpr0I2bI2WnnHFgwvHJ/94njxLevy7NLFF9F8lSAbGa1W0goPOy6fqP25LmyHapU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QW21NM3F; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QW21NM3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780217558; x=1811753558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CIpIcU+SJlsBpboyXi6mIRu/XMu90JJngU/GrME9W1U=;
  b=QW21NM3FZldMFePlLIBdUiC1UOPuVDyEb9zAKIdAnK3fS83hsLevRovp
   P8mpnEJIAu2cBYOk/Oxl20HLXg7Yqe/R6NgMBooKJSBYumJPRH2JsMemB
   z5A7/BKYiag16e/x+7AuTPJNBiwjw3hqXW4W2Q8Xy3tTf4mxatxneiAVI
   ElSp5TDzFxusr8IrtwlnGkdACYb+lyQwnRdWCVlLJIcy7o9Ugd9xeyMMm
   Cq/CnbUwchJPB0PsFg61bMrjt+fpXQuq7U3AQj8+fdEVxnnj6j24DevgK
   WLehxjIrkcc36iGlhF+FzczP9TzBM4goFd0mPobNr94uhENJMeRHzx66Q
   g==;
X-CSE-ConnectionGUID: U28PefAiSv+GNTR8VL14hA==
X-CSE-MsgGUID: 7sKs4L/xRG2+IRXXQoX0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="68537548"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="68537548"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 01:52:37 -0700
X-CSE-ConnectionGUID: ENppxubPTi2sTolD8PHpvg==
X-CSE-MsgGUID: y1k52OIPQ3+nE9vkjmZp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="267152224"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 01:52:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 01:52:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 01:52:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 01:52:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9QPhCHsOiTuZcamhjv99uIdlh12rzLkRw5vFoGzVdMmdleHUC1UG0M0STuAggNLIp/ciOSUggWYCeQdr5RoOUyXrQsIYYbY/02UkprhKxOdtCqgUx71V+krrVCCSalHfAJzFCLUWlmzLlY6O7JVtXMqidSevsy45QVajatzkEzcigatrVlUFowjto5QIpRqWVXeIotwENKVygF2X+V3y7xKj/lfsdnQwOTJTGBO4Y8SOJbJU1kDUCzZktXEnt2kbR+XdSdc7wCMIYtK+V3CWlw8XRbzegbcNK3GmrO63V0v6PNugXn+8Z4RSz3TcNYgowI6OiaQDvmQcfYkbqPaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG0C8Tcg8EFpkHyDiRkV7DITeNR/k4oKO0zyNdqLsQw=;
 b=Gdy+uA1WWGqkBcUV48OVO1m9G9t2NtKbWs02WdNCkTD7mo+rlo0BuR2hyfUq/bpxRVOSklQw1YCOlYf9WLyuwvfv/zMe5EIE+tbq/4TGsevv04EjeNHt8+/b3aa5jSBGyFx9atIu5UWxMJpaCXcS2iLxldK7bxYJd3q5qvY2irTWTYnABItwGZsstHtqrEciMrG6DVdv3GmUMvXseo2B+n1sWWjvmm+CfOBLcXzkM7HQbPP8KUfwyMvkv7v1E1eEv3fBmvLXZ2SW2nNZY2uQsIREYv8A91CTN+HRO1npbJ7LBOuOU/GtlpkAd0AmTcONvH/Mmrzf/pyqlsRRPA9ceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sun, 31 May
 2026 08:52:32 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 08:52:32 +0000
Date: Sun, 31 May 2026 16:52:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [lib/Kconfig.debug]  888c290a02:
 BUG:MAX_LOCKDEP_CHAINS_too_low
Message-ID: <202605311625.72d32001-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c23c42-6b30-4a5e-47c6-08debef1f3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|11063799006|56012099006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: y3yxU4DaTsnYSlvcvL1ETp5yi8B74Dgr4bszuUS0C8R9w2lX8jkKKvH0iVm2KW21NDvWC/MntX9Ei3Xp203+iZJtWwfGN7R6XrErbHZ0JN3vOO3YyPAc5oFfSFVD6+9z8IlZJ/A6K7JNac5qe8uqyFLxZYXVMn37QB1YofHqH68C2udG37tZzD/FyUNd2Q6WifvsUZwUwpFwgIcGZTzzc3VY6eS1C4umNjdwgOa/dyQQRgH9kAf1sfsY9xsC84hiX2raJAE3O66TiUhcWLGVKgRPpxoQ2/wRvn7ggMfH7c+9pHsHI3YsXZqRbM0+kjPIg0FijbOYpu92f4VjmFPMjohE/nYvqoYo6cYgMHFTEeMZwm0tGxbc3psRhGo63h7glHbNXagngIJBiYqv10EaKL8fay3B3/eKTZXwv7x4Qvb+uxCXxDObyAiM3jG7Bo9lcdlTu2YD9snKg9/9Iyn6oQpy7i3YGGA2Dxl7zJn1dFvEIxj/mKL9jBrHjoxdzwKk/QcEkrLnkZRbX8YdZ7i277b+Z8Fm1JUtkYO3C5VS8nBJKOY58EZzwj7wDHx1Ggy9VJfoa/+blQBK9qkIrMUG+Wca9CH7mhMDS+6lf5qeJpgLsiGzSQ+8kpqHfxjZt5AeZ5cV5xUYjMfmhsjh85KBlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c//wuy/ko9V+v9VSdzERNjN3Zig+oTBOzNEhMH/MRuzb+m7j+yNmHCXlUJbq?=
 =?us-ascii?Q?C/PULzxgPNN1ijYpkDD0chDsM7cEfTAVGq/MKL0ZnYObxWe2pHyNjE8ZJvfG?=
 =?us-ascii?Q?wNBb0DKoPswRYE06t9WUwTVW/1WHP13pI6tcE9wpoTLpY0OywvJ1fMrWJMrY?=
 =?us-ascii?Q?mCKtTKZD/Ce+ugQB3Ex6uxEKeECpRaNrM6ONxt1Nm2LCPRqZ3dsTd3KyEhWQ?=
 =?us-ascii?Q?1FXqmyacSSoDoQDTxrF71FzVwPJl4E6X1WXq4jpr6UFZuL5Yq4q4CAcIvGUq?=
 =?us-ascii?Q?/YSbakLGdpGZSbjNfHlnuKg2KpGNIQym+D7qRDADIzmZ/NvnW7DDRFpfOkEc?=
 =?us-ascii?Q?Rxjq+qZGPlLMB5fMslIIEgI4xRaRhwz1t9bpV0aEyd/y33M/6lKBfMkOUtMw?=
 =?us-ascii?Q?VAiIfEYNXLklUdl+Nh+qejMXkFBb1JFuqUIl4u1m+5IXIQVpGrBNKOnlDehM?=
 =?us-ascii?Q?QfQ25bKOTOSVDKo1UJLEkttqeoV+Jr4OPwGHNwfMsaay0Gq8JMG3ur9VTHAR?=
 =?us-ascii?Q?AGNl0Hhx8X6S/0XzdHNzkc1k0GncJnCFNM/5oRLQKIQv98r2JZhK+pcn8XiX?=
 =?us-ascii?Q?IyCy4mwxN+jvGASudp1JDDxVx9we9QcrDQFA9BSm4NOy2jxKXOo8DIvlzDNA?=
 =?us-ascii?Q?ArrJSChX9heEQp377XjaRiaNsTPYsrXK/gY2IuJN4apAvNblrDr7flViJUJe?=
 =?us-ascii?Q?JXDXxtsz9lgHz2UDcsvyveIGxILtHWQVe8NsdEuC7YKsuckPV5sbZYbb862f?=
 =?us-ascii?Q?mEpeO4bZ1JXf3LwvEc9p3G17uVtmj8fUubScLonlKVaXgQwa0AmVcMgfrD2s?=
 =?us-ascii?Q?vooAkpoJF6yVBAmfsdxvoufj0VkFbvJ2Nk3xGS9ucLGqtn1cNGAWRdUSSxD/?=
 =?us-ascii?Q?hRTf6DXIXe+pZ+HYhf3xGDWQfnJ1pTYhPWBZEp+9zEkSVuxim4b0ziB63IQs?=
 =?us-ascii?Q?61Ngjh5aHnaEw/6e0mtCYv2tnWzggeM2BlHeYixx9Z7yvi/Hj9CAMekqQ1o7?=
 =?us-ascii?Q?f2nDGXChq0xag+ydUkEy7o/zm/7jkfJycZkyDQYPRXWr/oirpDMthG9tA66Y?=
 =?us-ascii?Q?GBGMSshrKe60G4PA4y2XRkvxHCDiYC1v68XCexI5KrzyEBdxK6bdvYITUyRR?=
 =?us-ascii?Q?KvhOUOfciASJ4NnwLbmS8ubmV/BhfYBylp3uz03zrBe8AYh8s8gHUNnjJ3fO?=
 =?us-ascii?Q?RugqmTOwMlQ5W1EWh5KIggGdVkBZyNxRf72n+fxyyky+yfbx3nCXBZngxc6a?=
 =?us-ascii?Q?z6YgNJlOjR7dke1C9gdFsbabtscZ0CzsHa1j76jaKN4LQPzI7oWNZeoggxHC?=
 =?us-ascii?Q?3pDNstsyd2OFiTUN0sbFF9wuuh9pyu1voHh4j4EUc2qw4sTKuaiuNugoYTvI?=
 =?us-ascii?Q?Ri4zNhb87onhY3NvRcUAwdyFDSl2Weh4dTolSbI4E5DiKMeU3RKMteOA4NDZ?=
 =?us-ascii?Q?GtN+fMfmkFxgqZa2Cn5wyjDwwnZqTzhPtX1K1i60i8Nr1LXAoaZzWTYVSIv2?=
 =?us-ascii?Q?s7o2fuzWD2j1RRe2nz14uxoDjzqT5E7Izjk1Jv42ZGQLAZTNp4TNP9ISPh5C?=
 =?us-ascii?Q?SP9+TuUlMo66xpCBG5bij7uiMbISvhx5uqhfVH+t+qhnKR5V1eLCg2FVK5wf?=
 =?us-ascii?Q?oyYvfYGnnEqd//53semuAG9PN0Wx8ses/jSVvzW0YX7Y3O6t0YI89Dgikz+T?=
 =?us-ascii?Q?JC4+Sgg2uwyiNIYWXt/Hzlq/Om6K2yvlb/9clXhdFg3fKJIyKUjMxWMJGizh?=
 =?us-ascii?Q?GggNHg1kFg=3D=3D?=
X-Exchange-RoutingPolicyChecked: r3vXyg4H54tPhLNUWJiGlj7IX0/zuGNqJ7TLqKnOyxID5dm5vZjZfvGiWiO67ISkeC0Uj+Kc0D4VKq9E6Xj+Hf1McfCJ/s/LWOGmP8dxICFqkTbI9904+tfX28TWTcv/QwaI/Wt9JdogisyJVZxhcx7wkqDomK/fnzlGBcrk8hR+YvWoU7sVGqS8xSMHYde6v1bVlD1AjyFHv2AauLBNRLacs8c/XuLMGBONDLeaYYaNldWqj+MkIFddNNrlFzi7OxPWyUBDtG9p2EXMYNd8kKJee31CqKx3AuWjKVtCYOWA9bdn+/kEWfQYyOmZv7Q7aqcknzeGZsBrPN2RTdbYpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c23c42-6b30-4a5e-47c6-08debef1f3a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 08:52:32.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bsq1/I0ykXFHrq1nLjMDPF8+L1C+JfdXOevVIj9Ludw0huci91q0555hZ1+31Vrg0wViOVEUa8VuJSHkLcmP1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-OriginatorOrg: intel.com



Hello,


this report is just FYI.

as we understand, this is a debug patch. and by it, we notice below config diff:

--- /pkg/linux/x86_64-randconfig-161-20260529/gcc-14/e66d61ddb1d8504e4bfd3dcc3fa26293f9d14d9d/.config   2026-05-30 00:10:22.784053022 +0800
+++ /pkg/linux/x86_64-randconfig-161-20260529/gcc-14/888c290a0240da1ce1a4d69beafe44f9abec93c0/.config   2026-05-29 23:38:02.317371800 +0800
@@ -97,6 +97,7 @@ CONFIG_HRTIMER_REARM_DEFERRED=y
 CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
 CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
 CONFIG_CONTEXT_TRACKING=y
+CONFIG_CONTEXT_TRACKING_IDLE=y

 #
 # Timers subsystem
@@ -129,7 +130,8 @@ CONFIG_PREEMPT_BUILD=y
 CONFIG_ARCH_HAS_PREEMPT_LAZY=y
 # CONFIG_PREEMPT is not set
 CONFIG_PREEMPT_LAZY=y
-# CONFIG_PREEMPT_RT is not set
+CONFIG_PREEMPT_RT=y
+CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=y
 CONFIG_PREEMPT_COUNT=y
 CONFIG_PREEMPTION=y
 # CONFIG_PREEMPT_DYNAMIC is not set
@@ -150,9 +152,11 @@ CONFIG_PSI=y
 #
 # RCU Subsystem
 #
-CONFIG_TINY_RCU=y
+CONFIG_TREE_RCU=y
+CONFIG_PREEMPT_RCU=y
 CONFIG_RCU_EXPERT=y
-CONFIG_TINY_SRCU=y
+CONFIG_TREE_SRCU=y
+# CONFIG_FORCE_NEED_SRCU_NMI_SAFE is not set
 CONFIG_TASKS_RCU_GENERIC=y
 CONFIG_FORCE_TASKS_RCU=y
 CONFIG_NEED_TASKS_RCU=y
@@ -162,7 +166,18 @@ CONFIG_TASKS_RUDE_RCU=y
 CONFIG_FORCE_TASKS_TRACE_RCU=y
 CONFIG_TASKS_TRACE_RCU=y
 CONFIG_TASKS_TRACE_RCU_NO_MB=y
+CONFIG_RCU_STALL_COMMON=y
 CONFIG_RCU_NEED_SEGCBLIST=y
+CONFIG_RCU_FANOUT=64
+CONFIG_RCU_FANOUT_LEAF=2
+CONFIG_RCU_BOOST=y
+CONFIG_RCU_BOOST_DELAY=500
+CONFIG_RCU_EXP_KTHREAD=y
+CONFIG_RCU_NOCB_CPU=y
+# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
+# CONFIG_RCU_NOCB_CPU_CB_BOOST is not set
+CONFIG_RCU_LAZY=y
+# CONFIG_RCU_LAZY_DEFAULT_OFF is not set
 # CONFIG_RCU_DOUBLE_CHECK_CB_TIME is not set
 # end of RCU Subsystem

@@ -176,7 +191,6 @@ CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
 #
 # Scheduler features
 #
-# CONFIG_SCHED_PROXY_EXEC is not set
 # end of Scheduler features

 CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
@@ -772,7 +786,6 @@ CONFIG_MODULES_USE_ELF_RELA=y
 CONFIG_ARCH_HAS_EXECMEM_ROX=y
 CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
 CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
-CONFIG_SOFTIRQ_ON_OWN_STACK=y
 CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
 CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
 CONFIG_HAVE_EXIT_THREAD=y
@@ -974,7 +987,6 @@ CONFIG_MMU_NOTIFIER=y
 CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
 CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
 CONFIG_ARCH_WANTS_THP_SWAP=y
-# CONFIG_TRANSPARENT_HUGEPAGE is not set
 CONFIG_PAGE_MAPCOUNT=y
 CONFIG_PGTABLE_HAS_HUGE_LEAVES=y
 CONFIG_HAVE_GIGANTIC_FOLIOS=y
@@ -4202,9 +4214,9 @@ CONFIG_DRM_ETNAVIV_THERMAL=y
 # CONFIG_DRM_GMA500 is not set
 CONFIG_DRM_GUD=y
 CONFIG_DRM_HISI_HIBMC=y
-# CONFIG_DRM_I915 is not set
 # CONFIG_DRM_LOGICVC is not set
 CONFIG_DRM_MGAG200=y
+CONFIG_DRM_MGAG200_DISABLE_WRITECOMBINE=y
 CONFIG_DRM_NOUVEAU=y
 CONFIG_NOUVEAU_DEBUG=5
 CONFIG_NOUVEAU_DEBUG_DEFAULT=3
@@ -4895,7 +4907,6 @@ CONFIG_LEDS_TRIGGER_DISK=y
 CONFIG_LEDS_TRIGGER_MTD=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_BACKLIGHT=y
-# CONFIG_LEDS_TRIGGER_CPU is not set
 CONFIG_LEDS_TRIGGER_ACTIVITY=y
 CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
@@ -7388,7 +7399,6 @@ CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
 CONFIG_BOOTPARAM_HUNG_TASK_PANIC=0
-CONFIG_DETECT_HUNG_TASK_BLOCKER=y
 CONFIG_WQ_WATCHDOG=y
 CONFIG_BOOTPARAM_WQ_STALL_PANIC=0
 # CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
@@ -7415,9 +7425,7 @@ CONFIG_PROVE_RAW_LOCK_NESTING=y
 # CONFIG_LOCK_STAT is not set
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
 CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
-CONFIG_DEBUG_RWSEMS=y
 CONFIG_DEBUG_LOCK_ALLOC=y
 CONFIG_LOCKDEP=y
 CONFIG_LOCKDEP_BITS=15
@@ -7463,8 +7471,13 @@ CONFIG_RCU_TORTURE_TEST_CHK_RDR_STATE=y
 # CONFIG_RCU_TORTURE_TEST_LOG_CPU is not set
 CONFIG_RCU_TORTURE_TEST_LOG_GP=y
 CONFIG_RCU_REF_SCALE_TEST=m
+CONFIG_RCU_CPU_STALL_TIMEOUT=21
+CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
+CONFIG_RCU_CPU_STALL_CPUTIME=y
+CONFIG_RCU_CPU_STALL_NOTIFIER=y
 CONFIG_RCU_TRACE=y
 CONFIG_RCU_EQS_DEBUG=y
+CONFIG_RCU_STRICT_GRACE_PERIOD=y
 # CONFIG_RCU_DYNTICKS_TORTURE is not set
 # CONFIG_TRIVIAL_PREEMPT_RCU is not set
 # end of RCU Debugging


then we notice issues as below full report.
just FYI what we observed in our tests.


kernel test robot noticed "BUG:MAX_LOCKDEP_CHAINS_too_low" on:

commit: 888c290a0240da1ce1a4d69beafe44f9abec93c0 ("lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f7af91adc230aa99e23330ecf85bc9badd9780ad]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



config: x86_64-randconfig-161-20260529
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605311625.72d32001-lkp@intel.com



[  467.321357][ T4078] BUG: MAX_LOCKDEP_CHAINS too low!
[  467.321374][ T4078] turning off the locking correctness validator.
[  467.321400][ T4078] CPU: 0 UID: 65534 PID: 4078 Comm: trinity-main Tainted: G                T   7.1.0-rc5-00005-g888c290a0240 #1 PREEMPT_{RT,LAZY}
[  467.321419][ T4078] Tainted: [T]=RANDSTRUCT
[  467.321431][ T4078] Call Trace:
[  467.321436][ T4078]  <TASK>
[  467.321443][ T4078]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[  467.321482][ T4078]  dump_stack (dump_stack.c:129)
[  467.321492][ T4078]  add_chain_cache (locking/lockdep.c:3755)
[  467.321512][ T4078]  validate_chain (locking/lockdep.c:3857 locking/lockdep.c:3878)
[  467.321526][ T4078]  __lock_acquire (locking/lockdep.c:5239)
[  467.321539][ T4078]  ? lock_hrtimer_base+0x32/0x80
[  467.321552][ T4078]  lock_acquire (locking/lockdep.c:5870)
[  467.321561][ T4078]  ? lock_hrtimer_base+0x32/0x80
[  467.321574][ T4078]  ? __lock_acquire (locking/lockdep.c:5239)
[  467.321588][ T4078]  _raw_spin_lock_irqsave (linux/spinlock_api_smp.h:132 (discriminator 1) locking/spinlock.c:166 (discriminator 1))
[  467.321609][ T4078]  ? lock_hrtimer_base+0x32/0x80
[  467.321621][ T4078]  lock_hrtimer_base+0x32/0x80
[  467.321633][ T4078]  hrtimer_start_range_ns (time/hrtimer.c:1489)
[  467.321645][ T4078]  ? __hrtimer_start_range_ns (time/hrtimer.c:1460)
[  467.321658][ T4078]  ? kvm_clock_read (x86/kernel/kvmclock.c:80 (discriminator 1))
[  467.321672][ T4078]  hrtick_cond_restart (linux/hrtimer.h:220 sched/core.c:924)
[  467.321684][ T4078]  hrtick_schedule_exit+0x2c/0x80
[  467.321695][ T4078]  finish_task_switch+0x38f/0x540
[  467.321708][ T4078]  ? finish_task_switch+0x376/0x540
[  467.321723][ T4078]  __schedule (sched/core.c:5391 sched/core.c:7189)
[  467.321738][ T4078]  ? io_schedule_timeout (sched/core.c:8102)
[  467.321753][ T4078]  ? might_alloc (linux/sched/mm.h:317)
[  467.321766][ T4078]  preempt_schedule_notrace (sched/core.c:7463)
[  467.321779][ T4078]  preempt_schedule_notrace_thunk (x86/entry/thunk.S:13)
[  467.321795][ T4078]  rcu_is_watching (rcu/tree.c:753 (discriminator 1))
[  467.321807][ T4078]  lock_acquire (trace/events/lock.h:24 (discriminator 11) locking/lockdep.c:5833 (discriminator 11))
[  467.321817][ T4078]  ? kernfs_fop_open (kernfs/file.c:619)
[  467.321828][ T4078]  ? lock_acquire (locking/lockdep.c:5870)
[  467.321837][ T4078]  ? kernfs_fop_open (linux/slab.h:950 linux/slab.h:1188 kernfs/file.c:641)
[  467.321846][ T4078]  __fs_reclaim_acquire (page_alloc.c:4325)
[  467.321857][ T4078]  ? might_alloc (linux/sched/mm.h:317)
[  467.321867][ T4078]  fs_reclaim_acquire (page_alloc.c:4339 (discriminator 1))
[  467.321877][ T4078]  might_alloc (linux/sched/mm.h:317)
[  467.321887][ T4078]  __kmalloc_cache_noprof (slub.c:4521 slub.c:4876 slub.c:5415)
[  467.321902][ T4078]  kernfs_fop_open (linux/slab.h:950 linux/slab.h:1188 kernfs/file.c:641)
[  467.321916][ T4078]  ? kernfs_fop_release (kernfs/file.c:789)
[  467.321924][ T4078]  do_dentry_open (open.c:947)
[  467.321941][ T4078]  vfs_open (open.c:1079)
[  467.321952][ T4078]  do_open (namei.c:4699)
[  467.321969][ T4078]  path_openat (namei.c:4858)
[  467.321980][ T4078]  ? kernel_tmpfile_open (namei.c:4800)
[  467.321992][ T4078]  ? rt_mutex_slowunlock (locking/rtmutex.c:350 locking/rtmutex.c:1463)
[  467.322007][ T4078]  do_file_open (namei.c:4887)
[  467.322018][ T4078]  ? path_openat (namei.c:4875)
[  467.322032][ T4078]  ? mark_wakeup_next_waiter (locking/rtmutex.c:1364)
[  467.322063][ T4078]  do_sys_openat2 (open.c:1364 (discriminator 1))
[  467.322075][ T4078]  ? file_open_root (open.c:1352)
[  467.322090][ T4078]  ? __lock_acquire (locking/lockdep.c:5239)
[  467.322102][ T4078]  do_sys_open (open.c:1370)
[  467.322113][ T4078]  ? filp_open (open.c:1340)
[  467.322124][ T4078]  ? vtime_user_exit (sched/cputime.c:743 (discriminator 1))
[  467.322136][ T4078]  ? __lock_release+0x4e/0x140
[  467.322149][ T4078]  __ia32_compat_sys_openat (open.c:1432 open.c:1430 open.c:1430)
[  467.322162][ T4078]  ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-161-20260529/./arch/x86/include/generated/asm/syscalls_32.h:296)
[  467.322174][ T4078]  __do_fast_syscall_32 (x86/entry/syscall_32.c:83 x86/entry/syscall_32.c:307)
[  467.322186][ T4078]  ? preempt_latency_start (linux/ftrace.h:1168 sched/core.c:5837)
[  467.322198][ T4078]  ? __do_fast_syscall_32 (linux/randomize_kstack.h:58 x86/entry/syscall_32.c:279)
[  467.322210][ T4078]  do_fast_syscall_32 (x86/entry/syscall_32.c:332)
[  467.322220][ T4078]  do_SYSENTER_32 (x86/entry/syscall_32.c:370)
[  467.322229][ T4078]  entry_SYSENTER_compat_after_hwframe (x86/entry/entry_64_compat.S:126)
[  467.322241][ T4078] RIP: 0023:0xf7fb938c
[  467.322252][ T4078] Code: d2 74 05 c1 e8 0c 89 02 8b 5d fc 31 c0 c9 31 d2 31 c9 c3 cc 90 90 90 90 90 90 90 90 90 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	d2 74 05 c1          	shlb   %cl,-0x3f(%rbp,%rax,1)
   4:	e8 0c 89 02 8b       	call   0xffffffff8b028915
   9:	5d                   	pop    %rbp
   a:	fc                   	cld
   b:	31 c0                	xor    %eax,%eax
   d:	c9                   	leave
   e:	31 d2                	xor    %edx,%edx
  10:	31 c9                	xor    %ecx,%ecx
  12:	c3                   	ret
  13:	cc                   	int3
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	0f 1f 00             	nopl   (%rax)
  21:	51                   	push   %rcx
  22:	52                   	push   %rdx
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:*	5d                   	pop    %rbp		<-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	cc                   	int3
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	cc                   	int3
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260531/202605311625.72d32001-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

