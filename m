Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56BC17BA3
	for <oe-lkp@lists.linux.dev>; Fri, 28 Mar 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152959; cv=fail; b=rDN+Pk7AsZ6dPRs4LwJCHi7wwZS6yD9vYpnj5aP5reAiCHpejABIr2EDfwkR9MmaVqxjj5ZeTTmQfpCp+lz8bAtadsKcO6QtUKn4nNoYWjgDXEKzi6R9sdg/ABie88iYXyqqn+K2manvDPBmLdBBC0YW/w0oOj+QP6kqhbKau68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152959; c=relaxed/simple;
	bh=MXYwoTPaRLtACh9PhimN4fuoiyL3aIdL33Syet/lqrU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=W44wDWMWSU/r83DSclUr2cupVjwjw7n/679hg0YtF7JdG8sn75OSJHgOhLGFHoVlnNLbU4F7PEnpExUftXlc5PNMfs/UD9M0/Ck2Zi6WeM9mqSuY8MCqSRYwcl6CHiRaJw1drWQb5wNRqvX2J/Kvx0tgQLYsIRKN/hkX3Q8qLGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c++aJtqz; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c++aJtqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743152955; x=1774688955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXYwoTPaRLtACh9PhimN4fuoiyL3aIdL33Syet/lqrU=;
  b=c++aJtqz1pDSmZ4Jpya7YlhT0H8dOHPd+y2qu4ksxGS9dF3SuCwlhOWR
   LX9wZK4jAlqX1y9df47wynD6/luRDetiimx3u/m29SVtCIlDivBl+tmfG
   Pg4KLtRVMlLD5fiuMedPtUMSZCBTQoZbQutsF6IBBbsHj8HHyDGdJCRQu
   6qPtaNJDNwjsZV2LAsqtPZJqHwA/uoDenWL+vpXPlKbSUtPhpS6zCbbGJ
   y62Tf5vGxPsCG1QI+CcBphjqb3q24rnWJJlc5n+5aq/kMLFAxowOh1Hvh
   Q2rbEEUhlNXwlcWDua2jutpu8PSF9DIcePFPXEgrs6ZumiCJBabAkqBmC
   g==;
X-CSE-ConnectionGUID: CKV3AQwjRBKN8mI2dHIseQ==
X-CSE-MsgGUID: rgZxqwVsQYCJ4kxUH0ngyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55877572"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="55877572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:09:15 -0700
X-CSE-ConnectionGUID: 7T3eI1PVSrey6iD7F5+fJA==
X-CSE-MsgGUID: ENuyr9D8RIyluSX/+RrApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125907919"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:09:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Mar 2025 02:09:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 02:09:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 02:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR1VfmsoVvJEaLsgWE7G+B8wlE0t+mW96b6x5eyh/9aXWn3rwYTj3fbuMAfTIjBTVy/qpKocSfvqceg7aZgj8gToIWcR5KlMLJgCGxO58faBBMq5rYIlJqTrjS2P1SN3cqdsDYZ5rjW4LH4asrqTM2pjofJgivoUg4OGtcj/G7Yk7lcpZnouegrJ2O4e2QHIJ0U0waSHwxOl4yfDae+nq2ViOx8D0jP2UYpShn5NiFv6m1+rGyzwThPzg0LuB70ubIaw/q9yxG5GG+75bwhKRqxPnnxmDkUG6MiHUrkp5NWZ+q+vkjlmcMTUcXcqDbubHedZuZKkAKINj8cdHQu+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LtqedrZAAtxKOdyWC/E4GWuttiSKvOkZye+I+Vabr8=;
 b=LO9Z+p1oMiOziMfR4jQPMmqyPt5/tn/yvcZykFJSTMAKxYkTIDWnGEcjBGcm2Y//w9Y+5ztlDny9j9+qb/LLZlKv5KpmktgEc4q0WN/Ha9nwJOvi0kXWrDFNcKMHZxa4EyXPe6wGITHRN0fHFcF8WOO5/2TIIG8eNtIF6oxrDPf2oQ9L18d+UYU37L133p2X3PkV+GH4gVs8ylBoHoIRBhCodVVgYbvQgiT/JQ+jha/MielJkz84RxL5AbXAPLYuWIaB+bUVCX7Z6xHO3FRXFtN7Hvny5E37p1LBdH++A+v4ChuSADRos4jf5hb/HbhruLgBOdQqzXlDoQMB0M5gPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:09:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:09:11 +0000
Date: Fri, 28 Mar 2025 17:09:03 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:rcu/for-next] [rcutorture]  84e0a11498:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <202503281620.ed5fa280-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: be8d3f15-5186-4d1e-99f5-08dd6dd83448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7+YMIUZMJVrQREHb7o++ULm2lCCwed6jZc0TXHoCAfxuOT91qeQfdD9J5hT3?=
 =?us-ascii?Q?10WjcTu8iLeeuC/TO2RaILDFsK7VzvPApABZNWpxX+tsFedbUFgUS5E/wfd2?=
 =?us-ascii?Q?jK7SZlH+xha4YfGAxipa/mOeYtcFcSebkJI9J4GI/++NXpoWvtCWpPbaGU0h?=
 =?us-ascii?Q?a8EjRMfrhegzS/AOa91K12idLX+edx/YK8cUVWjKSvWV6dzNVm3NNJXSkEwo?=
 =?us-ascii?Q?iws5ZdxszJah86McjelQY4PcAGJTPp+BpMlQ3x/U3OjmNMu4fggpOsdscm5i?=
 =?us-ascii?Q?odbPSDWJWiM0GuZirdCAJ73xeAv9kx1w2kGIteRee1h3r+dsAY908RNPhkBX?=
 =?us-ascii?Q?nE5uAa8Iye6zH8dV2SXRGL9Datq+MO6RxyGEIK1LB4ev6zQgFPT3aiGgMCS+?=
 =?us-ascii?Q?kJOF0uxKu/E5NQrzQEh1jqyIOBJTGpaZLZgY6LR0RQUuUGcYI/ZsucCKgoZg?=
 =?us-ascii?Q?OJmV+YLWm8w1qWV1CnUkkhpbMfgZfg2HGX+rRgCVNZyUNRgNiuKV0Ou+gikv?=
 =?us-ascii?Q?UZzLZXmhEe1aTUpBeUeh9chdsjEHPcarAJV3MjMO/dVAD+vdAdVrcNO7UX1t?=
 =?us-ascii?Q?ZToun17Gq/FlRfGwmP+d7D0wgsnllzi8pQz5jGs7pkilydHBCxim0JxjYYSI?=
 =?us-ascii?Q?cVAvR25gwLdfNzE3l8fvJMUYxx0dvxFhqAKnTx1JjSRGzG7LepaLRqtVCmQE?=
 =?us-ascii?Q?PAYLH2Snrze1PYA0rRir5XYYgV68eJvnZ3mrkr33Hu7E3wfnZUU/qa9w1Noj?=
 =?us-ascii?Q?Gx9FgBlKJxn+nbg/u7krZxrNvVZlUjTCz934ILMF9qd4VRP1QrCAVwvrMUdn?=
 =?us-ascii?Q?3oP9+2zVOPU6jM93VNG1R2YuG1LxAte6/ugFl5NU4l7SJZTPIqC7rLim6MIN?=
 =?us-ascii?Q?QeD07UTcxt8HZ9qMBT8t1pU+XqShJuXeEBJxR73P8R+eo6Oia1HFR1C0akpN?=
 =?us-ascii?Q?n99PBXgfy6PpJf+t55bOaTxJEIDJYXxA/pPDrULFw/YSt9qZmKVeXw3JtwvX?=
 =?us-ascii?Q?4DXNR/PjFQwxsRl4s4u2sTU/QmK4+dThCIo9RSU4RIZqppsGXnCnACKvSzJx?=
 =?us-ascii?Q?mXkRIsDbhB3yX8ujQzTh+zUtMHITG/znzdOQYPI9imji+YMdePQgEjMuPe+z?=
 =?us-ascii?Q?FGEo11OywAcFmfGjbKI869+L5CmEG9tXIdVHwFAPi2w+Rqjah8jODq3PMt+z?=
 =?us-ascii?Q?mBJ+hgdeOb797+hmxQOB+mZLN10hYsQqlRNADcLhRaAOAONDTcwDCoxQ6yWI?=
 =?us-ascii?Q?v/owlIu6XMwjjg9oy4575k76gc4OcqOElETlYxEfew2HFTxMw2QiBarUg2TG?=
 =?us-ascii?Q?x6mOIe3hiJ9kRAdJThhdXGWDOX9Lzrmtq2bg+1YFfoM2ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBysZqEae7ION1Uq9YaYx462Rbrshv7fFThcZkDihllFYFDTwy4J6pHBic3X?=
 =?us-ascii?Q?UQPsIB2LcUMzq3R7iuR4NoHN+o48nLB4It2Kesl2ecrq1a0eLqE3dVl892/T?=
 =?us-ascii?Q?4ulkGYKP/jIfwlfXSd9vCA6u/QduqD1OWRApjEyr8qaFebcmiw5RLrEXsnM3?=
 =?us-ascii?Q?fXBthF7TDcJiON050DXLnThou5xC1CxjMEoleVuhX0s6jpsezVkdyXCPI6/+?=
 =?us-ascii?Q?7G9b5d3w0SFwJsBBmIdqzcEuGiaP1PBxrXEeEOUtO1dS0HEqgVTZ5ZjETfHC?=
 =?us-ascii?Q?7D3OMm3nFPaXHud5OCh+o9c6tt6K8Vezp7XNmU0iIjYlQIOZturVklUOHmna?=
 =?us-ascii?Q?Zwkhys8q8fOSTQswoHwpwPggN7tGPch2ha7dT4feZ2elj3pIG7Jt4gV6j01q?=
 =?us-ascii?Q?msIzw5Tt1zUTvtqB3fDA+6nZPplzwOOmn4aeqPMttY3nR5jotR2QbIgb53Ws?=
 =?us-ascii?Q?JCxZsuejb/pGlbQU5kZjJ4x9bGbXWYUYebJDJDmomwOxu5NkO11FTxgh3usQ?=
 =?us-ascii?Q?4j63H/v/GDrJl141Fu2Bmv+93QdvQXXJrD1FiggugoNKOWuK+bpnO8Y8MYZX?=
 =?us-ascii?Q?2C6+kiLGGzZ4GTJd7YgbhimpZahKdOdcYZixM5xxnn0zFvqDucfLSNNeLX6h?=
 =?us-ascii?Q?f5j+U/OVanNjzd2+Fg4nIilOyKYdoAINXhIbPq64vSv5JAYXsnTSMkrN7Rlh?=
 =?us-ascii?Q?p9nz9oIyuMDBzCDkE5FGpdGOk9bCkv10E703uYojoSLhQ3uo3R0nw26oHOgj?=
 =?us-ascii?Q?WrhU6SBHiMjy5Ux6XAsdsRzJER4pIFvAEJEtE2J4ZZ94oik2uAYThlDI1y2H?=
 =?us-ascii?Q?TiKljGNCZSmqRAi01YIiZkm+pjtdAqp05A8DBsTPyhtncVnAMacLQ0gaplff?=
 =?us-ascii?Q?8vH0en+IgEP9vUKhavQm1RhNnHhgPE0KPzzoaAnZWhp7FJ4mcCN9jgV+yhrf?=
 =?us-ascii?Q?1eRGdfR7yzaFiU47P0hBZRKm2p1a3oQ5K5/bqkMaRn5og43TotUQK4gXK11D?=
 =?us-ascii?Q?VGclNYkP0XDML2LC8HM29Iq3n262cNIuVk+qigiBy1sfIvaFBKTfzW+qjPsj?=
 =?us-ascii?Q?plqMK8MZEOZLyI1qsbFibWmiIeqVsrRaahFyEXViIa38b9i7ZPap7AtFw4VQ?=
 =?us-ascii?Q?5xXPNt2oyzH+VgtvBm8vas1AlTiKjT0w5U+6yHNzxTbe4zocdZUQEu69q3ug?=
 =?us-ascii?Q?WQonf5l0t0MLPBLVXW4Y9GUNUFW2xiCRDFunKtBtcLKV1TpkXTjLVfSNCaxp?=
 =?us-ascii?Q?Bfxk2tX6sZNhDEiYvg7V235nznAzU7FTb7SRRsULiZ1Itpn3eVT/Kkjgli54?=
 =?us-ascii?Q?j5t1wSHTuzjgDUx5wFEqoJU1jfHs18NkyoGAOlv5Ll/A31eC4i4KULLY6nLl?=
 =?us-ascii?Q?l8iGUz9ABXL62KKlJQEdlIEBpn5iGVfyRbIonyFFwj/fE1i04Co1jqIIu9Ex?=
 =?us-ascii?Q?s77f9UrsmkNZlK6cYIpBioaQoHUY6nWiA4MpPnkmM6jXPRUno6hVC+4WIchI?=
 =?us-ascii?Q?hNP5nEp93omxse4f1phTdaJXq5mqcIJyS2rmXtXWoAgIEU8NuW6P+TIivO2k?=
 =?us-ascii?Q?n6/4rSqgWLAX8GgImJIL7fTkG15gpIbn/oseQuLi+d6UFU5G2VROvRtWikIK?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be8d3f15-5186-4d1e-99f5-08dd6dd83448
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:09:11.7273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12BbOSuj0qERR4FboSW6Y3SGzLutVzIVbQm8OMJ6/IhzRbYTm+8wzWt+WxvcUPjqm66Qe55gg87XvdfCTKz19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]" on:

commit: 84e0a11498cf967ae236f1feaf8b8b25ea738f2d ("rcutorture: Add tests for SRCU up/down reader primitives")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git rcu/for-next

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: srcu



config: i386-randconfig-012-20250327
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------+------------+------------+
|                                                                    | 906bd1fdb0 | 84e0a11498 |
+--------------------------------------------------------------------+------------+------------+
| WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture] | 0          | 5          |
| EIP:rcu_torture_updown                                             | 0          | 5          |
| INFO:task_blocked_for_more_than#seconds                            | 0          | 5          |
| BUG:kernel_hang_in_test_stage                                      | 0          | 5          |
+--------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503281620.ed5fa280-lkp@intel.com




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250328/202503281620.ed5fa280-lkp@intel.com


[  349.997265][  T402] ------------[ cut here ]------------
[  349.997645][  T402] WARNING: CPU: 0 PID: 402 at kernel/rcu/rcutorture.c:2501 rcu_torture_updown+0x158/0x182 [rcutorture]
[  349.998434][  T402] Modules linked in: rcutorture(-) torture intel_rapl_msr bochs drm_client_lib usbtest evdev input_leds font drm_shmem_helper syscopyarea sysfillrect sysimgblt fb_sys_fops led_class intel_rapl_common intel_agp drm_kms_helper intel_gtt pcspkr psmouse serio_raw i2c_piix4 fb agpgart qemu_fw_cfg tiny_power_button button drm drm_panel_orientation_quirks backlight
[  350.001106][  T402] CPU: 0 UID: 0 PID: 402 Comm: rcu_torture_upd Not tainted 6.14.0-rc1-00087-g84e0a11498cf #1
[  350.001807][  T402] EIP: rcu_torture_updown+0x158/0x182 [rcutorture]
[  350.002299][  T402] Code: c3 64 02 00 00 8b 15 04 0e 58 ef 69 05 10 07 58 ef 64 02 00 00 01 d0 39 c3 72 dd eb 11 89 d8 e8 ed aa b6 d1 80 7b 28 00 74 d5 <0f> 0b eb d1 89 d0 e8 f0 40 c9 d1 31 c0 a3 04 0e 58 ef b8 c1 06 5f
[  350.003704][  T402] EAX: 00000001 EBX: eaad84c8 ECX: 00000000 EDX: 00000000
[  350.004199][  T402] ESI: 00000000 EDI: eaadca50 EBP: eaa17f64 ESP: eaa17f54
[  350.004729][  T402] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010202
[  350.005259][  T402] CR0: 80050033 CR2: 00493adc CR3: 2a9db000 CR4: 00040690
[  350.005751][  T402] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  350.006242][  T402] DR6: fffe0ff0 DR7: 00000400
[  350.006576][  T402] Call Trace:
[  350.006862][  T402]  ? show_regs+0x64/0x70
[  350.007169][  T402]  ? rcu_torture_updown+0x158/0x182 [rcutorture]
[  350.007628][  T402]  ? __warn+0x97/0x130
[  350.007926][  T402]  ? report_bug+0xde/0x13b
[  350.008246][  T402]  ? rcu_torture_updown+0x158/0x182 [rcutorture]
[  350.008703][  T402]  ? exc_overflow+0x3d/0x3d
[  350.009026][  T402]  ? handle_bug+0x3d/0x5c
[  350.009333][  T402]  ? exc_invalid_op+0x24/0x49
[  350.009667][  T402]  ? handle_exception+0x11a/0x11a
[  350.010027][  T402]  ? xa_find+0x69/0xc0
[  350.010317][  T402]  ? exc_overflow+0x3d/0x3d
[  350.010644][  T402]  ? rcu_torture_updown+0x158/0x182 [rcutorture]
[  350.011154][  T402]  ? exc_overflow+0x3d/0x3d
[  350.011476][  T402]  ? rcu_torture_updown+0x158/0x182 [rcutorture]
[  350.011935][  T402]  kthread+0x142/0x147
[  350.012227][  T402]  ? rcu_torture_one_read_start+0x102/0x102 [rcutorture]
[  350.012726][  T402]  ? kthread_is_per_cpu+0x1c/0x1c
[  350.013083][  T402]  ret_from_fork+0x1e/0x37
[  350.013399][  T402]  ? kthread_is_per_cpu+0x1c/0x1c
[  350.013756][  T402]  ret_from_fork_asm+0x12/0x20
[  350.014095][  T402]  entry_INT80_32+0x10c/0x10c
[  350.014440][  T402] irq event stamp: 2657215
[  350.014797][  T402] hardirqs last  enabled at (2657325): [<c10a22fc>] __up_console_sem+0x5e/0x72
[  350.015410][  T402] hardirqs last disabled at (2657332): [<c10a22e3>] __up_console_sem+0x45/0x72
[  350.016029][  T402] softirqs last  enabled at (2657322): [<c1067e55>] handle_softirqs+0x2ca/0x2fa
[  350.016651][  T402] softirqs last disabled at (2657223): [<c17cdd3f>] __do_softirq+0xf/0x13
[  350.017238][  T402] ---[ end trace 0000000000000000 ]---
[  350.017837][  T402] srcu-torture: rcu_torture_updown is stopping
[  350.022138][  T413] srcu-torture: torture_stutter is stopping
[  350.054328][  T401] srcu-torture: rcu_torture_reader is stopping
[  350.551011][  T420] srcu-torture: rcu_torture_read_exit is stopping
[  350.551522][  T838] srcu-torture: Stopping rcutorture_read_exit task
[  350.552059][  T838] srcu-torture: Stopping rcu_torture_fwd_prog task
[  350.552526][  T416] rcu_torture_fwd_prog n_max_cbs: 50000
[  350.552894][  T416] rcu_torture_fwd_prog: Starting forward-progress test 0
[  350.553360][  T416] rcu_torture_fwd_prog_cr: Starting forward-progress test 0
[  357.078863][  T407] srcu-torture: rtc: 3041ac47 ver: 591 tfle: 0 rta: 592 rtaf: 0 rtf: 581 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbf: 0 rtb: 0 nt: 10173 barrier: 0/0:0 read-exits: 320 nocb-toggles: 0:0
[  357.080072][  T407] srcu-torture: Reader Pipe:  31012756 6308 0 0 0 0 0 0 0 0 0
[  357.080574][  T407] srcu-torture: Reader Batch:  31001386 17678 0 0 0 0 0 0 0 0 0
[  357.081080][  T407] srcu-torture: Free-Block Circulation:  591 590 588 587 586 585 584 583 582 581 0
[  357.081699][  T407] rcu: srcu-torture: Tree SRCU g4462 state 0 (SRCU_SIZE_SMALL) per-CPU(idx=0): 0(12,3 C) T(12,3)
[  357.082384][  T407] srcu-torture: rcu_torture_stats is stopping
[  973.526852][   T24] INFO: task rcu_torture_fak:389 blocked for more than 491 seconds.
[  973.527493][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[  973.528053][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  973.528648][   T24] task:rcu_torture_fak state:D stack:0     pid:389   tgid:389   ppid:2      task_flags:0x208040 flags:0x00004000
[  973.529454][   T24] Call Trace:
[  973.529699][   T24]  __schedule+0x3d7/0x409
[  973.530019][   T24]  schedule+0x42/0x5e
[  973.530302][   T24]  schedule_timeout+0x2f/0xb9
[  973.530639][   T24]  ? usleep_range_state+0x8b/0x8b
[  973.531066][   T24]  __wait_for_common+0x91/0xe4
[  973.531427][   T24]  wait_for_common+0x15/0x1b
[  973.531756][   T24]  wait_for_completion+0x17/0x1f
[  973.532121][   T24]  __synchronize_srcu+0x10b/0x122
[  973.532467][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[  973.532831][   T24]  synchronize_srcu_expedited+0x1a/0x21
[  973.533209][   T24]  srcu_torture_synchronize_expedited+0x12/0x16 [rcutorture]
[  973.533718][   T24]  rcu_torture_fakewriter+0x135/0x351 [rcutorture]
[  973.534184][   T24]  kthread+0x142/0x147
[  973.534479][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[  973.534938][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.535300][   T24]  ret_from_fork+0x1e/0x37
[  973.535605][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.535960][   T24]  ret_from_fork_asm+0x12/0x20
[  973.536311][   T24]  entry_INT80_32+0x10c/0x10c
[  973.536665][   T24] INFO: task rcu_torture_fak:390 blocked for more than 491 seconds.
[  973.537233][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[  973.537809][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  973.538402][   T24] task:rcu_torture_fak state:D stack:0     pid:390   tgid:390   ppid:2      task_flags:0x208040 flags:0x00004000
[  973.539297][   T24] Call Trace:
[  973.539548][   T24]  __schedule+0x3d7/0x409
[  973.539865][   T24]  schedule+0x42/0x5e
[  973.540156][   T24]  schedule_timeout+0x2f/0xb9
[  973.540503][   T24]  ? usleep_range_state+0x8b/0x8b
[  973.540864][   T24]  __wait_for_common+0x91/0xe4
[  973.541215][   T24]  wait_for_common+0x15/0x1b
[  973.541550][   T24]  wait_for_completion+0x17/0x1f
[  973.541902][   T24]  __synchronize_srcu+0x10b/0x122
[  973.542262][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[  973.542637][   T24]  synchronize_srcu+0xa7/0xb3
[  973.543015][   T24]  srcu_torture_synchronize+0x12/0x16 [rcutorture]
[  973.543517][   T24]  rcu_torture_fakewriter+0x330/0x351 [rcutorture]
[  973.543985][   T24]  kthread+0x142/0x147
[  973.544277][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[  973.544692][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.545057][   T24]  ret_from_fork+0x1e/0x37
[  973.545367][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.545730][   T24]  ret_from_fork_asm+0x12/0x20
[  973.546079][   T24]  entry_INT80_32+0x10c/0x10c
[  973.546433][   T24] INFO: task rcu_torture_fak:394 blocked for more than 491 seconds.
[  973.547041][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[  973.547594][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  973.548182][   T24] task:rcu_torture_fak state:D stack:0     pid:394   tgid:394   ppid:2      task_flags:0x208040 flags:0x00004000
[  973.549000][   T24] Call Trace:
[  973.549236][   T24]  __schedule+0x3d7/0x409
[  973.549563][   T24]  schedule+0x42/0x5e
[  973.549851][   T24]  schedule_timeout+0x2f/0xb9
[  973.550207][   T24]  ? usleep_range_state+0x8b/0x8b
[  973.550574][   T24]  __wait_for_common+0x91/0xe4
[  973.550966][   T24]  wait_for_common+0x15/0x1b
[  973.551305][   T24]  wait_for_completion+0x17/0x1f
[  973.555756][   T24]  __synchronize_srcu+0x10b/0x122
[  973.556118][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[  973.556510][   T24]  synchronize_srcu_expedited+0x1a/0x21
[  973.556904][   T24]  srcu_torture_synchronize_expedited+0x12/0x16 [rcutorture]
[  973.557433][   T24]  rcu_torture_fakewriter+0x135/0x351 [rcutorture]
[  973.557904][   T24]  kthread+0x142/0x147
[  973.558204][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[  973.558636][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.559053][   T24]  ret_from_fork+0x1e/0x37
[  973.559412][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.559758][   T24]  ret_from_fork_asm+0x12/0x20
[  973.560086][   T24]  entry_INT80_32+0x10c/0x10c
[  973.560440][   T24] INFO: task rcu_torture_fak:398 blocked for more than 491 seconds.
[  973.560968][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[  973.561489][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  973.562047][   T24] task:rcu_torture_fak state:D stack:0     pid:398   tgid:398   ppid:2      task_flags:0x208040 flags:0x00004000
[  973.562849][   T24] Call Trace:
[  973.563079][   T24]  __schedule+0x3d7/0x409
[  973.563392][   T24]  schedule+0x42/0x5e
[  973.563657][   T24]  schedule_timeout+0x2f/0xb9
[  973.563992][   T24]  ? usleep_range_state+0x8b/0x8b
[  973.564337][   T24]  __wait_for_common+0x91/0xe4
[  973.564674][   T24]  wait_for_common+0x15/0x1b
[  973.564987][   T24]  wait_for_completion+0x17/0x1f
[  973.565337][   T24]  __synchronize_srcu+0x10b/0x122
[  973.565692][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[  973.566085][   T24]  synchronize_srcu+0xa7/0xb3
[  973.566427][   T24]  srcu_torture_synchronize+0x12/0x16 [rcutorture]
[  973.566926][   T24]  rcu_torture_fakewriter+0x330/0x351 [rcutorture]
[  973.567431][   T24]  kthread+0x142/0x147
[  973.567700][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[  973.568112][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.568454][   T24]  ret_from_fork+0x1e/0x37
[  973.568763][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.569103][   T24]  ret_from_fork_asm+0x12/0x20
[  973.569426][   T24]  entry_INT80_32+0x10c/0x10c
[  973.569760][   T24] INFO: task rcu_torture_fwd:416 blocked for more than 491 seconds.
[  973.570303][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[  973.570912][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  973.571499][   T24] task:rcu_torture_fwd state:D stack:0     pid:416   tgid:416   ppid:2      task_flags:0x208040 flags:0x00024000
[  973.572290][   T24] Call Trace:
[  973.572518][   T24]  __schedule+0x3d7/0x409
[  973.572824][   T24]  schedule+0x42/0x5e
[  973.573091][   T24]  schedule_timeout+0x2f/0xb9
[  973.573418][   T24]  ? usleep_range_state+0x8b/0x8b
[  973.573759][   T24]  __wait_for_common+0x91/0xe4
[  973.574083][   T24]  wait_for_common+0x15/0x1b
[  973.574389][   T24]  wait_for_completion+0x17/0x1f
[  973.574719][   T24]  __synchronize_srcu+0x10b/0x122
[  973.575096][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[  973.575458][   T24]  synchronize_srcu+0xa7/0xb3
[  973.575760][   T24]  srcu_torture_synchronize+0x12/0x16 [rcutorture]
[  973.576221][   T24]  rcu_torture_fwd_prog_cr+0x55/0x2cf [rcutorture]
[  973.576672][   T24]  ? vprintk+0x13/0x17
[  973.576942][   T24]  ? _printk+0x14/0x16
[  973.577220][   T24]  rcu_torture_fwd_prog+0x106/0x196 [rcutorture]
[  973.577677][   T24]  kthread+0x142/0x147
[  973.577973][   T24]  ? rcu_torture_fwd_prog_cr+0x2cf/0x2cf [rcutorture]
[  973.578452][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.578825][   T24]  ret_from_fork+0x1e/0x37
[  973.579136][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[  973.583603][   T24]  ret_from_fork_asm+0x12/0x20
[  973.583948][   T24]  entry_INT80_32+0x10c/0x10c
[  973.584284][   T24] INFO: task rmmod:838 blocked for more than 491 seconds.
[  973.584763][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[  973.585294][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  973.585871][   T24] task:rmmod           state:D stack:0     pid:838   tgid:838   ppid:375    task_flags:0x400100 flags:0x00004000
[  973.586653][   T24] Call Trace:
[  973.586923][   T24]  __schedule+0x3d7/0x409
[  973.587233][   T24]  schedule+0x42/0x5e
[  973.587522][   T24]  schedule_timeout+0x2f/0xb9
[  973.587864][   T24]  ? usleep_range_state+0x8b/0x8b
[  973.588188][   T24]  __wait_for_common+0x91/0xe4
[  973.588514][   T24]  wait_for_common+0x15/0x1b
[  973.588827][   T24]  wait_for_completion+0x17/0x1f
[  973.589168][   T24]  kthread_stop+0xaa/0x111
[  973.589482][   T24]  _torture_stop_kthread+0x3c/0x50 [torture]
[  973.589897][   T24]  rcu_torture_cleanup+0x1b8/0x914 [rcutorture]
[  973.590331][   T24]  ? __mutex_unlock_slowpath+0x25/0x1ae
[  973.590709][   T24]  ? lockdep_assert_rq_held+0x21/0x21
[  973.591131][   T24]  __do_sys_delete_module+0xf9/0x201
[  973.591565][   T24]  __ia32_sys_delete_module+0xf/0x11
[  973.591929][   T24]  ia32_sys_call+0x4c1/0x10e2
[  973.592254][   T24]  __do_fast_syscall_32+0xa4/0xc7
[  973.592602][   T24]  do_fast_syscall_32+0x28/0x4f
[  973.592941][   T24]  do_SYSENTER_32+0x15/0x19
[  973.593255][   T24]  entry_SYSENTER_32+0xa2/0x102
[  973.593594][   T24] EIP: 0xb7efe579
[  973.593839][   T24] EAX: ffffffda EBX: 0048a37c ECX: 00000800 EDX: 0046f939
[  973.594314][   T24] ESI: 0048a340 EDI: 0048a340 EBP: bfcb6c19 ESP: bfcb5f98
[  973.594841][   T24] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00200202
[  973.595398][   T24] 
[  973.595398][   T24] Showing all locks held in the system:
[  973.595915][   T24] 1 lock held by khungtaskd/24:
[  973.596249][   T24]  #0: c20c0f60 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x3/0x27
[  973.596914][   T24] 1 lock held by in:imklog/150:
[  973.597246][   T24] 1 lock held by dmesg/305:
[  973.597556][   T24] 
[  973.597724][   T24] =============================================
[  973.597724][   T24] 
[ 1465.046858][   T24] INFO: task rcu_torture_fak:389 blocked for more than 983 seconds.
[ 1465.047451][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[ 1465.047999][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1465.048575][   T24] task:rcu_torture_fak state:D stack:0     pid:389   tgid:389   ppid:2      task_flags:0x208040 flags:0x00004000
[ 1465.049364][   T24] Call Trace:
[ 1465.049605][   T24]  __schedule+0x3d7/0x409
[ 1465.049922][   T24]  schedule+0x42/0x5e
[ 1465.050203][   T24]  schedule_timeout+0x2f/0xb9
[ 1465.050533][   T24]  ? usleep_range_state+0x8b/0x8b
[ 1465.050967][   T24]  __wait_for_common+0x91/0xe4
[ 1465.051320][   T24]  wait_for_common+0x15/0x1b
[ 1465.051640][   T24]  wait_for_completion+0x17/0x1f
[ 1465.051991][   T24]  __synchronize_srcu+0x10b/0x122
[ 1465.052344][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[ 1465.052705][   T24]  synchronize_srcu_expedited+0x1a/0x21
[ 1465.053092][   T24]  srcu_torture_synchronize_expedited+0x12/0x16 [rcutorture]
[ 1465.053591][   T24]  rcu_torture_fakewriter+0x135/0x351 [rcutorture]
[ 1465.054044][   T24]  kthread+0x142/0x147
[ 1465.054329][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[ 1465.054748][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.055140][   T24]  ret_from_fork+0x1e/0x37
[ 1465.055454][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.055812][   T24]  ret_from_fork_asm+0x12/0x20
[ 1465.056154][   T24]  entry_INT80_32+0x10c/0x10c
[ 1465.056491][   T24] INFO: task rcu_torture_fak:390 blocked for more than 983 seconds.
[ 1465.057030][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[ 1465.057582][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1465.058154][   T24] task:rcu_torture_fak state:D stack:0     pid:390   tgid:390   ppid:2      task_flags:0x208040 flags:0x00004000
[ 1465.058962][   T24] Call Trace:
[ 1465.059199][   T24]  __schedule+0x3d7/0x409
[ 1465.059508][   T24]  schedule+0x42/0x5e
[ 1465.059784][   T24]  schedule_timeout+0x2f/0xb9
[ 1465.060116][   T24]  ? usleep_range_state+0x8b/0x8b
[ 1465.060464][   T24]  __wait_for_common+0x91/0xe4
[ 1465.060799][   T24]  wait_for_common+0x15/0x1b
[ 1465.061125][   T24]  wait_for_completion+0x17/0x1f
[ 1465.061466][   T24]  __synchronize_srcu+0x10b/0x122
[ 1465.061809][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[ 1465.062172][   T24]  synchronize_srcu+0xa7/0xb3
[ 1465.062509][   T24]  srcu_torture_synchronize+0x12/0x16 [rcutorture]
[ 1465.062994][   T24]  rcu_torture_fakewriter+0x330/0x351 [rcutorture]
[ 1465.063450][   T24]  kthread+0x142/0x147
[ 1465.063736][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[ 1465.064150][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.064501][   T24]  ret_from_fork+0x1e/0x37
[ 1465.064801][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.065191][   T24]  ret_from_fork_asm+0x12/0x20
[ 1465.065513][   T24]  entry_INT80_32+0x10c/0x10c
[ 1465.065851][   T24] INFO: task rcu_torture_fak:394 blocked for more than 983 seconds.
[ 1465.066381][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[ 1465.066957][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1465.067557][   T24] task:rcu_torture_fak state:D stack:0     pid:394   tgid:394   ppid:2      task_flags:0x208040 flags:0x00004000
[ 1465.068359][   T24] Call Trace:
[ 1465.068596][   T24]  __schedule+0x3d7/0x409
[ 1465.068909][   T24]  schedule+0x42/0x5e
[ 1465.069192][   T24]  schedule_timeout+0x2f/0xb9
[ 1465.069520][   T24]  ? usleep_range_state+0x8b/0x8b
[ 1465.069869][   T24]  __wait_for_common+0x91/0xe4
[ 1465.070205][   T24]  wait_for_common+0x15/0x1b
[ 1465.070519][   T24]  wait_for_completion+0x17/0x1f
[ 1465.070891][   T24]  __synchronize_srcu+0x10b/0x122
[ 1465.071244][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[ 1465.071607][   T24]  synchronize_srcu_expedited+0x1a/0x21
[ 1465.071989][   T24]  srcu_torture_synchronize_expedited+0x12/0x16 [rcutorture]
[ 1465.072521][   T24]  rcu_torture_fakewriter+0x135/0x351 [rcutorture]
[ 1465.072977][   T24]  kthread+0x142/0x147
[ 1465.073260][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[ 1465.073669][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.074013][   T24]  ret_from_fork+0x1e/0x37
[ 1465.074319][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.074664][   T24]  ret_from_fork_asm+0x12/0x20
[ 1465.075046][   T24]  entry_INT80_32+0x10c/0x10c
[ 1465.075389][   T24] INFO: task rcu_torture_fak:398 blocked for more than 983 seconds.
[ 1465.075929][   T24]       Tainted: G        W          6.14.0-rc1-00087-g84e0a11498cf #1
[ 1465.076485][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1465.077071][   T24] task:rcu_torture_fak state:D stack:0     pid:398   tgid:398   ppid:2      task_flags:0x208040 flags:0x00004000
[ 1465.077875][   T24] Call Trace:
[ 1465.078122][   T24]  __schedule+0x3d7/0x409
[ 1465.078443][   T24]  schedule+0x42/0x5e
[ 1465.078737][   T24]  schedule_timeout+0x2f/0xb9
[ 1465.079132][   T24]  ? usleep_range_state+0x8b/0x8b
[ 1465.079496][   T24]  __wait_for_common+0x91/0xe4
[ 1465.079854][   T24]  wait_for_common+0x15/0x1b
[ 1465.080189][   T24]  wait_for_completion+0x17/0x1f
[ 1465.080556][   T24]  __synchronize_srcu+0x10b/0x122
[ 1465.080907][   T24]  ? rcu_tasks_pregp_step+0xf/0xf
[ 1465.081265][   T24]  synchronize_srcu+0xa7/0xb3
[ 1465.081621][   T24]  srcu_torture_synchronize+0x12/0x16 [rcutorture]
[ 1465.082083][   T24]  rcu_torture_fakewriter+0x330/0x351 [rcutorture]
[ 1465.082553][   T24]  kthread+0x142/0x147
[ 1465.082879][   T24]  ? srcu_read_delay+0x55/0x55 [rcutorture]
[ 1465.083310][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.083683][   T24]  ret_from_fork+0x1e/0x37
[ 1465.084005][   T24]  ? kthread_is_per_cpu+0x1c/0x1c
[ 1465.084370][   T24]  ret_from_fork_asm+0x12/0x20
[ 1465.084714][   T24]  entry_INT80_32+0x10c/0x10c
[ 1465.085077][   T24] Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings
[ 1465.085703][   T24] 
[ 1465.085703][   T24] Showing all locks held in the system:
[ 1465.086263][   T24] 1 lock held by khungtaskd/24:
[ 1465.086617][   T24]  #0: c20c0f60 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x3/0x27
[ 1465.087324][   T24] 1 lock held by in:imklog/150:
[ 1465.087665][   T24] 1 lock held by dmesg/305:
[ 1465.087983][   T24] 
[ 1465.088154][   T24] =============================================
[ 1465.088154][   T24] 
BUG: kernel hang in test stage


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

