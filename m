Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E02A78F5D
	for <oe-lkp@lists.linux.dev>; Tue,  1 Jul 2025 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338421; cv=fail; b=ZzUToTZQaPLQWlTZL3i07gnbf7MMrH3SYi32YWtzt4Op4fJRL3j1o7XNIZJXO1i3CIOV7bRoMpOOdxwq48VMmK+xMJOOSzlEJyUNfKp4YymTbmuGfh6EnlwBJsXySEJTcDaTG3UHjbxgrcW57YJThosvHfWgnp9duAClkIr4P4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338421; c=relaxed/simple;
	bh=viBVSRQ96V3h/qVe+J57YzpI0pazHPu7vbZyF2GBYlo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D34UliMtadm2IzL614PUQOtn+nPHJ5IkrhNtOobUduuzo8jcYkn629grucD5yfxuFv+dBujrN6gZrB1d0GJzafAo7Mv42vF9+tFxJfTNKkwNdtj5ko0adCpzDtLZ32pw33eE2fIJFt2ox7eoceeIgXIzISBsaUGJ1Qd7WMW0r+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/x2n7S8; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/x2n7S8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751338419; x=1782874419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=viBVSRQ96V3h/qVe+J57YzpI0pazHPu7vbZyF2GBYlo=;
  b=I/x2n7S84OMDFsVHCAYrjlO9Y777nHj9drMOAyC0aMP2vBY393zqpsn1
   V5iRdTp4Vf1sVn/RSKWoPEtP7m98tLT9piuBcheG9ZI50l7LK0pVtJHcO
   9Me+QQyu1Sm0wkQvI22JcC+kZXK6uD7Px39zwjEr3WpabL+Ia/qGxpPa2
   XiYmczxrX7d5AQ4eud3QvJ7OX+Ew7FCHA5ahEIey+LT/P6xTPoraoZQy0
   mREiou+E3mvgd8bGr817O9k1x84x3Dhjy3wEw5P/dchyBAroJ4eNK7cH4
   KG3D11WoIRY0CbZ5/Hn3noPgpFfkJK8GxktCJSfUwu+6ubSrtA9g5FlmA
   g==;
X-CSE-ConnectionGUID: OvzIx7qKQmG7SKFxAUCMmA==
X-CSE-MsgGUID: uwPH4FXqQUa3Ap2Zub5okg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53706392"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53706392"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 19:53:36 -0700
X-CSE-ConnectionGUID: q0ouCDcUSnyRSGIDDcnPFA==
X-CSE-MsgGUID: jandSkMuT5yd0Hb4cSD08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153254584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 19:53:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 19:53:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 19:53:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 19:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhWiP5herxVU7HMlzqNOCribEUGaQM1Pmdolvw+vpogoxEl/vX9XQHUDC+2GgyaISnzo0XhBgBERy8pwQrXGZmd+TH2SX3Te4cQ1EFWcE9C2CeyaahI7BK/QZZENFxEqAj0mkXB7RKqZnVn9OqbviiPwLdEiNRIr6FBOzzscZZ7F948uU4qSMMgutf0iojazFit0jbTHHKLOWTP8mPNrA3NUzUKnC9JjlhULLej4Wy+kFk4V2v7ByJDSjfkadCvhXiqWazGWmizWhNLIQEGZYlYFCF2JHhM0aYFcajZRn/UILSrBVMr25wyWV8hAWlI1cIZkfLce4L/LTJzm3ALw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPZTxe8ADjuXuwe/W+pRydO5Ei7VG2N9x3kAKl1d4To=;
 b=NmWUi2Yho3pw9GP3sQY8to8rMnaWoLlfEsfW3WQ63by7wdIuo/vqD6r0SHjRMTEEoaUaWhb/pOCvgFO8FfWQ0VoDQx0bJfTaiKiBEgi5qJzEWK5RcydK6v1KeR9ub2zrzccjI9tag1prbgCo3CIyVUGan4heaa0ZOO7bIFYtxvfKEPIn03WjO9P0mgeSgn2jRLJWM4LTmgj921wUo2lDdE9mdc/4FSlbGTQd0QdFSmWQoN2cHu0PUOIVConHgLCyubI3VHN+PYzKh2AUSC+B9suhtE7YK9Llv9mjTwU/FSFCJSJgPsDi3qumEmsNmazKd1tyv/o+qymzj9tQrkA5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Tue, 1 Jul
 2025 02:53:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8880.026; Tue, 1 Jul 2025
 02:53:05 +0000
Date: Tue, 1 Jul 2025 10:52:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:kthread/core] [cpuset] 8fd7e2e827:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202507010400.9a28118e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0132a915-ac8e-45ab-5b06-08ddb84a6722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sa8bl3a2IjHfaRT+jSJkzi0OVe38BW8ve/6l3/sgh0hf9F59G95et8DpARDF?=
 =?us-ascii?Q?fm/Srh+AxA+VhNx5PyqMEeeyyAbKJTE4oFCDHe65eP2ztxaSyY9B7HN74E7L?=
 =?us-ascii?Q?1lLJIPipl2XPrXB8Sz3yCgAnx0OHLnj4Xuxja8Ml/RUVU5uECa29ud2lx9N1?=
 =?us-ascii?Q?QgwW2f46AuCuQCtgkrbtt4y/ql+ue2k4ZxqRSTZ/DIgMVi4MePQoHsB7g2ij?=
 =?us-ascii?Q?vNWR7FByUIE3XrYHdkwWBKmsDDoWlnXcGBRcByDPO+nVpSd4JH5VWerjCxqz?=
 =?us-ascii?Q?BMwFSKABoOdrfOpuc6FQTHFHCSv6poDx6jtO7+V86D6CQyuO266O0EiTxfmL?=
 =?us-ascii?Q?mpTub9M1wUyIrt7wWeYZwz8qpRdyfsq+8M+5oIw1Szhfs0Fjhy25XXj+Orj+?=
 =?us-ascii?Q?X74XaWo1CPeJIWgEEK75HdYhBDOT77qeGMrmrZ8YcaWVFA4ATAFlx0OBdLk1?=
 =?us-ascii?Q?tp41K1Sj1upZy67fbYfu7NeploBt/I4y+t1iJt+M04CAzIxkYQwIFYWyJo3w?=
 =?us-ascii?Q?TrFCeteP7NvtFtOyrg5sIfZOku1+EvzlMqVwqENML2XBHsPqGd8p7FtKJ8Iy?=
 =?us-ascii?Q?1uv7Av9Lva62IbQiEGzBrPKsPazZ+SUcwOmczPjRSV46yLhGgHIo2ngHa98t?=
 =?us-ascii?Q?dB9awQ+q3pu0t9fFKlIx8PUPm32j6pMvtMpGMKwAwjApiOotkCpTee2gxyAD?=
 =?us-ascii?Q?EFXRjX/9y0lQgAs9wApFxSYZp6Id3LfZSHVY6RPAmIhUv941FLWUtxaGMQVD?=
 =?us-ascii?Q?dpp/DfgtggHGmfTrHZtZpqiuRUF1iGdkZR0AbwVMYGceeak8GCZ0mOTWNudK?=
 =?us-ascii?Q?xLpbRQ6Bhszl8Rqua3WN4H1lxli5AVlQLqlCRTnKyNfs4A1N352K3HHMgnpq?=
 =?us-ascii?Q?Q/BL0+hHW99i7GLj1TO9ZgHlEDHEvuEYe9SE7A43+xonsIk9D5RxPmWMLfPO?=
 =?us-ascii?Q?vKvZezKgG3xXKrKl+beYQYaJc5YdbmfnELIxCzzlphfeIqC773/+CIkQiN8V?=
 =?us-ascii?Q?hEFvgfZGQqo8Johrtw9jNGyNcM3Mbyw2oA6PpmRKn4NC5iYT8vWNXzjlYM7D?=
 =?us-ascii?Q?mHGxQqZh9Tz0al6HiF8/MIGJ93sIr02Bkcj5jKMxkuZYV3BHxZKWjGLLkq0z?=
 =?us-ascii?Q?vpNbLD6hkgDngdsnpTL6ltY/MYxdUkZP+c0Z4O44s+DmDx+Dm2n+Rrd2wnS7?=
 =?us-ascii?Q?uriskxXkTTJ20x4Dn7Q3EYw0OKYmNgNlWWPM0nA28zLbJTamcoGaYdUowdDB?=
 =?us-ascii?Q?dfJd3YQdoa2EK1e4TxNzB2gtsiHauNfjRI1e/Yn7swN9pCFEvz+GKbg2Cgg7?=
 =?us-ascii?Q?tGxMHDUkd+YA4lAbtbuK5GnLynCnqfwyd0Gmz4YnEh8uALdYwP3AcP6ZBHIX?=
 =?us-ascii?Q?NcnMG+ZNyC4WSkZnCN7VDy6LD2i6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mK4mhd3sab8kaShynwvcAJOtIiVL7MyhsA5JPX/DwxAe1xXkprykdorPlpW?=
 =?us-ascii?Q?dcrFdL4fI7Sm/AU640zRUrWS6P6LJ/zKeXxEMx4UDB0I2V3834UmgA1APzem?=
 =?us-ascii?Q?eL+0uaaeOtkExtRjeyz+0lnSVdJE7cLhmClfrLO78ERTy290N2Y4q9bW0nuk?=
 =?us-ascii?Q?33/EYkCoxJ3vsaMbgxPiPFe34tlJl3pEmDX+qQNTfOqFobVzeRIjx6e38c26?=
 =?us-ascii?Q?wza3lGRKRq9sjeyPKegw/CMKY3BLjCfVB6dwZSTcnYzsd8ocsjhWoZIOTbpQ?=
 =?us-ascii?Q?Kb++TpjVHkN2oE9bahtTiZliKKGxCLG8rMVMfEAIZ/ENszOoBx0zecXoPiOS?=
 =?us-ascii?Q?3qAbHjyvD7Dr79Pk3JvDTKH9vepbddBiqHiIT45i7QDLySmhT9TK0F/vD1UT?=
 =?us-ascii?Q?4Yks2zLPmLWmJfQxxmBmAEseZQ6ud1JtkAegljiaD5V4M9aa/LTfeODHxoql?=
 =?us-ascii?Q?m1KBSNxCUpJ1VmTPr3qSnfU/GZK0WL/tHvRymTRksFTNubUtLpITDk3ng41M?=
 =?us-ascii?Q?DHgvJAYeDD15gKgeuIZkL8A2fIjO4Ol9dvj56zdE693YQckuODE+yKTC0He8?=
 =?us-ascii?Q?3CJy6k6+91InTmnEiwiZG5KUGbUpR7encaQcuTq/6z9YEZ8j+V/vT3eCK96V?=
 =?us-ascii?Q?ksgBV0L8H7cbgdzPXgy2+O8wQiLfUqdy23XYZXyruAmnAbsl7qh/tNVkaMJe?=
 =?us-ascii?Q?l9v7kzTNfPfKNCrhTyTdFpKFRKN+WROfzCtVErDomfyT9kuIatdO+gbBeW3d?=
 =?us-ascii?Q?dPvZAiWaq5VFZgIb6s+PQy4Day59AwAuCT42qu6IO1R2znLPtixJYTESVHv6?=
 =?us-ascii?Q?MMLc1S8THmhe1tEmlLK0LGcr45XhkwRHMY6+0RhyWCo3E1gGYtN87fFbmJNX?=
 =?us-ascii?Q?0MXcOoXh4DjhxvwtUubIs997s+AW1AhVaEXHLsCfrLO4i1+iE4oD8JN1YvSA?=
 =?us-ascii?Q?iH6Y8pAooaoLMfXbiPDZA9frkn1sHthFbOFXjnkalWEEOK8HFrd4PTRxGubq?=
 =?us-ascii?Q?jlqotr5NfE0A4jm4VHQLjbAseEt9sNVRH0pFH64b/2VfV4OefT/0wyPNvU7O?=
 =?us-ascii?Q?kSMuZ6mJTSR4ynTodylwqRTpT+nm9tOQblco2T6VcuWki4EQ7O8WFe2Q+vnA?=
 =?us-ascii?Q?Z5xt1748yOCGGL6nUTi4DwDXLvpefeXi/5Y4u546gG8lkJBqL0PlIKpxLXzr?=
 =?us-ascii?Q?nEpsqwagbxYEV+B7ryAb3dkZRzX/0PEYXDCjMPkDIgB1+ZP6P2zY+p7TqqhO?=
 =?us-ascii?Q?pNq7Ayps9z33XkAs0K3x9cOkX4K3b2iyEd54mDFgq/SHX54Dt3RGzE+KfGTS?=
 =?us-ascii?Q?c0Xc1nGF6RJk/mkhiXJtnphkhZUmrLIS1h6/1eHGrlfndxK5Qj1DD1WICyeC?=
 =?us-ascii?Q?B08dMvj5xfhEKW1U1ITX5unUwEF1j2tkmXZdEQqWxIv72boq2dLRimKT1FFP?=
 =?us-ascii?Q?yidcutTIY004KkKcFjVCNbBTcwk+Tb1KDcLobYlcDkSHFV67rvaoCRKGNP3y?=
 =?us-ascii?Q?IbWi/4we4YBZka9RzyjqqYgCgtuV9FjrAJFag88A28Vx5iAyCfOGGpAVaHDt?=
 =?us-ascii?Q?PkAhAwdSYOBtcWqhxPPWJnX97K4wp6ZuzIxubY0PX2J2ENdicsf0A/14iyrX?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0132a915-ac8e-45ab-5b06-08ddb84a6722
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 02:53:05.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7pVIXYX+GweNEgCJCczfU91b6bvfj0+Q+o+BMv/VOndVblc4myU/2ITTO8WXbJjDN6brDMziT5w/cyD2ymCEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: 8fd7e2e82721de266a81c03ce9fc043a117f658c ("cpuset: Propagate cpuset isolation update to workqueue through housekeeping")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git kthread/core

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: x86_64-randconfig-006-20250627
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+------------+
|                                                                                                                                                                           | 877f1548de | 8fd7e2e827 |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+------------+
| WARNING:possible_circular_locking_dependency_detected                                                                                                                     | 0          | 258        |
| WARNING:possible_circular_locking_dependency_detected_trinity-main_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock | 0          | 96         |
| WARNING:possible_circular_locking_dependency_detected_trinity-c0_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock   | 0          | 97         |
| WARNING:possible_circular_locking_dependency_detected_trinity-c5_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock   | 0          | 49         |
| WARNING:possible_circular_locking_dependency_detected_trinity-c2_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock   | 0          | 8          |
| RIP:rep_movs_alternative                                                                                                                                                  | 0          | 1          |
| WARNING:possible_circular_locking_dependency_detected_trinity-c3_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock   | 0          | 1          |
| WARNING:possible_circular_locking_dependency_detected_trinity-c1_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock   | 0          | 4          |
| WARNING:possible_circular_locking_dependency_detected_trinity-c4_is_trying_to_acquire_lock:at:static_key_slow_inc_but_task_is_already_holding_lock:at:sockopt_lock_sock   | 0          | 3          |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202507010400.9a28118e-lkp@intel.com


[  202.721529][ T3701] WARNING: possible circular locking dependency detected
[  202.722192][ T3701] 6.16.0-rc2-00018-g8fd7e2e82721 #1 Tainted: G                T
[  202.722959][ T3701] ------------------------------------------------------
[  202.723602][ T3701] trinity-c0/3701 is trying to acquire lock:
[ 202.724227][ T3701] ffffffff94951df0 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_slow_inc (kernel/jump_label.c:191) 
[  202.725284][ T3701]
[  202.725284][ T3701] but task is already holding lock:
[ 202.725995][ T3701] ffff888125202f50 (sk_lock-AF_INET){+.+.}-{0:0}, at: sockopt_lock_sock (net/core/sock.c:1151) 
[  202.726912][ T3701]
[  202.726912][ T3701] which lock already depends on the new lock.
[  202.726912][ T3701]
[  202.727918][ T3701]
[  202.727918][ T3701] the existing dependency chain (in reverse order) is:
[  202.728915][ T3701]
[  202.728915][ T3701] -> #3 (sk_lock-AF_INET){+.+.}-{0:0}:
[ 202.729744][ T3701] lock_sock_nested (net/core/sock.c:3752) 
[ 202.730277][ T3701] sockopt_lock_sock (net/core/sock.c:1151) 
[ 202.730791][ T3701] do_ip_setsockopt (net/ipv4/ip_sockglue.c:1080) 
[ 202.731316][ T3701] ip_setsockopt (net/ipv4/ip_sockglue.c:1427) 
[ 202.731809][ T3701] udp_setsockopt (net/ipv4/udp.c:3085) 
[ 202.732382][ T3701] sock_common_setsockopt (net/core/sock.c:3944) 
[ 202.733025][ T3701] __sys_setsockopt (net/socket.c:?) 
[ 202.733582][ T3701] __ia32_compat_sys_socketcall (net/compat.c:491) 
[ 202.734172][ T3701] ia32_sys_call (arch/x86/entry/syscall_32.c:50) 
[ 202.734675][ T3701] __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:?) 
[ 202.735230][ T3701] do_fast_syscall_32 (arch/x86/entry/syscall_32.c:331) 
[ 202.735752][ T3701] do_SYSENTER_32 (arch/x86/entry/syscall_32.c:369) 
[ 202.736310][ T3701] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127) 
[  202.737054][ T3701]
[  202.737054][ T3701] -> #2 (rtnl_mutex){+.+.}-{4:4}:
[ 202.737805][ T3701] __mutex_lock (kernel/locking/mutex.c:602) 
[ 202.738296][ T3701] _mutex_lock_killable (kernel/locking/mutex.c:815) 
[ 202.738830][ T3701] rtnl_lock_killable (net/core/rtnetlink.c:91) 
[ 202.739353][ T3701] register_netdev (include/linux/rtnetlink.h:145 net/core/dev.c:11218) 
[ 202.739852][ T3701] e1000_probe (drivers/net/ethernet/intel/e1000/e1000_main.c:1196) 
[ 202.743585][ T3701] pci_device_probe (drivers/pci/pci-driver.c:325) 
[ 202.744132][ T3701] really_probe (drivers/base/dd.c:581) 
[ 202.744714][ T3701] __driver_probe_device (drivers/base/dd.c:?) 
[ 202.745366][ T3701] driver_probe_device (drivers/base/dd.c:829) 
[ 202.745898][ T3701] __driver_attach (drivers/base/dd.c:1216) 
[ 202.746410][ T3701] bus_for_each_dev (drivers/base/bus.c:369) 
[ 202.746926][ T3701] driver_attach (drivers/base/dd.c:1233) 
[ 202.747411][ T3701] bus_add_driver (drivers/base/bus.c:679) 
[ 202.747939][ T3701] driver_register (drivers/base/driver.c:250) 
[ 202.748557][ T3701] __pci_register_driver (drivers/pci/pci-driver.c:1443) 
[ 202.749204][ T3701] e1000_init_module (drivers/net/ethernet/intel/e1000/e1000_main.c:224) 
[ 202.749734][ T3701] do_one_initcall (init/main.c:1274) 
[ 202.750249][ T3701] do_initcall_level (init/main.c:1335) 
[ 202.750782][ T3701] do_initcalls (init/main.c:1349) 
[ 202.751273][ T3701] do_basic_setup (init/main.c:1372) 
[ 202.751771][ T3701] kernel_init_freeable (init/main.c:1586) 
[ 202.752400][ T3701] kernel_init (init/main.c:1476) 
[ 202.752964][ T3701] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 202.753522][ T3701] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[  202.754036][ T3701]
[  202.754036][ T3701] -> #1 (housekeeping_pcpu_lock){.+.+}-{0:0}:
[ 202.754826][ T3701] housekeeping_lock (include/linux/percpu-rwsem.h:53) 
[ 202.755351][ T3701] vmstat_shepherd (include/linux/sched/isolation.h:91 mm/vmstat.c:2124) 
[ 202.755868][ T3701] process_scheduled_works (kernel/workqueue.c:?) 
[ 202.756541][ T3701] worker_thread (include/linux/list.h:373 kernel/workqueue.c:946 kernel/workqueue.c:3403) 
[ 202.757125][ T3701] kthread (kernel/kthread.c:466) 
[ 202.757618][ T3701] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 202.758131][ T3701] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[  202.758643][ T3701]
[  202.758643][ T3701] -> #0 (cpu_hotplug_lock){++++}-{0:0}:
[ 202.759391][ T3701] __lock_acquire (kernel/locking/lockdep.c:?) 
[ 202.759915][ T3701] lock_acquire (kernel/locking/lockdep.c:5871) 
[ 202.760507][ T3701] cpus_read_lock (include/linux/percpu-rwsem.h:53) 
[ 202.761084][ T3701] static_key_slow_inc (kernel/jump_label.c:191) 
[ 202.761642][ T3701] udp_tunnel_encap_enable (include/net/udp_tunnel.h:219) 
[ 202.762182][ T3701] udp_lib_setsockopt (net/ipv4/udp.c:?) 
[ 202.762716][ T3701] udp_setsockopt (net/ipv4/udp.c:3081) 
[ 202.763214][ T3701] sock_common_setsockopt (net/core/sock.c:3944) 
[ 202.763757][ T3701] __sys_setsockopt (net/socket.c:?) 
[ 202.764354][ T3701] __ia32_sys_setsockopt (net/socket.c:2327 net/socket.c:2324 net/socket.c:2324) 
[ 202.764979][ T3701] ia32_sys_call (arch/x86/entry/syscall_32.c:50) 
[ 202.765544][ T3701] __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:?) 
[ 202.766264][ T3701] do_fast_syscall_32 (arch/x86/entry/syscall_32.c:331) 
[ 202.767136][ T3701] do_SYSENTER_32 (arch/x86/entry/syscall_32.c:369) 
[ 202.767974][ T3701] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127) 
[  202.769109][ T3701]
[  202.769109][ T3701] other info that might help us debug this:
[  202.769109][ T3701]
[  202.770778][ T3701] Chain exists of:
[  202.770778][ T3701]   cpu_hotplug_lock --> rtnl_mutex --> sk_lock-AF_INET
[  202.770778][ T3701]
[  202.772765][ T3701]  Possible unsafe locking scenario:
[  202.772765][ T3701]
[  202.774021][ T3701]        CPU0                    CPU1
[  202.774918][ T3701]        ----                    ----
[  202.775803][ T3701]   lock(sk_lock-AF_INET);
[  202.776593][ T3701]                                lock(rtnl_mutex);
[  202.777632][ T3701]                                lock(sk_lock-AF_INET);
[  202.778744][ T3701]   rlock(cpu_hotplug_lock);
[  202.779552][ T3701]
[  202.779552][ T3701]  *** DEADLOCK ***
[  202.779552][ T3701]
[  202.780935][ T3701] 1 lock held by trinity-c0/3701:
[ 202.781792][ T3701] #0: ffff888125202f50 (sk_lock-AF_INET){+.+.}-{0:0}, at: sockopt_lock_sock (net/core/sock.c:1151) 
[  202.783324][ T3701]
[  202.783324][ T3701] stack backtrace:
[  202.784373][ T3701] CPU: 1 UID: 65534 PID: 3701 Comm: trinity-c0 Tainted: G                T   6.16.0-rc2-00018-g8fd7e2e82721 #1 PREEMPT(full)
[  202.784384][ T3701] Tainted: [T]=RANDSTRUCT
[  202.784387][ T3701] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  202.784398][ T3701] Call Trace:
[  202.784407][ T3701]  <TASK>
[ 202.784427][ T3701] __dump_stack (lib/dump_stack.c:95) 
[ 202.784439][ T3701] dump_stack_lvl (lib/dump_stack.c:123) 
[ 202.784444][ T3701] dump_stack (lib/dump_stack.c:130) 
[ 202.784448][ T3701] print_circular_bug (kernel/locking/lockdep.c:2048) 
[ 202.784461][ T3701] check_noncircular (kernel/locking/lockdep.c:?) 
[ 202.784468][ T3701] __lock_acquire (kernel/locking/lockdep.c:?) 
[ 202.784474][ T3701] ? __lock_acquire (kernel/locking/lockdep.c:?) 
[ 202.784482][ T3701] ? __might_fault (mm/memory.c:6991) 
[ 202.784495][ T3701] lock_acquire (kernel/locking/lockdep.c:5871) 
[ 202.784499][ T3701] ? static_key_slow_inc (kernel/jump_label.c:191) 
[ 202.784510][ T3701] cpus_read_lock (include/linux/percpu-rwsem.h:53) 
[ 202.784520][ T3701] ? static_key_slow_inc (kernel/jump_label.c:191) 
[ 202.784524][ T3701] static_key_slow_inc (kernel/jump_label.c:191) 
[ 202.784529][ T3701] udp_tunnel_encap_enable (include/net/udp_tunnel.h:219) 
[ 202.784537][ T3701] udp_lib_setsockopt (net/ipv4/udp.c:?) 
[ 202.784544][ T3701] udp_setsockopt (net/ipv4/udp.c:3081) 
[ 202.784550][ T3701] ? __cfi_udp_push_pending_frames (net/ipv4/udp.c:1215) 
[ 202.784555][ T3701] sock_common_setsockopt (net/core/sock.c:3944) 
[ 202.784562][ T3701] __sys_setsockopt (net/socket.c:?) 
[ 202.784573][ T3701] __ia32_sys_setsockopt (net/socket.c:2327 net/socket.c:2324 net/socket.c:2324) 
[ 202.784579][ T3701] ia32_sys_call (arch/x86/entry/syscall_32.c:50) 
[ 202.784585][ T3701] __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:?) 
[ 202.784593][ T3701] ? irqentry_exit_to_user_mode (kernel/entry/common.c:187) 
[ 202.784600][ T3701] do_fast_syscall_32 (arch/x86/entry/syscall_32.c:331) 
[ 202.784605][ T3701] do_SYSENTER_32 (arch/x86/entry/syscall_32.c:369) 
[ 202.784609][ T3701] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127) 
[  202.784617][ T3701] RIP: 0023:0xf7f26539
[ 202.784636][ T3701] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:*	00 51 52             	add    %dl,0x52(%rcx)		<-- trapping instruction
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250701/202507010400.9a28118e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

