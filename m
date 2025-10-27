Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4115C96
	for <oe-lkp@lists.linux.dev>; Mon, 27 Oct 2025 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547551; cv=fail; b=q6EeH5glFcBv+82JgkE13DrPrpfD6hsYSjQv+OH5vH0S9tVrAJtQpK2UFmyb5S5qn5MvKdjVTGLOnw5BeDSYA+sik/OxkEXow9CzdpMSzoE2KYKYbR2Ffp32dK2SMRWhDoZqUFgL3qUzTudxF8SnsCfVl+K/s0xrVzDXz4aLX1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547551; c=relaxed/simple;
	bh=o9hOjpzEN7iUuLeXdr2xWuL1uPZwJ49CqzZqcYaT/cE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Woy0oMSztpFEUpd68Mh+dKapHpbEt3wmYGrUJgjiPTPCLtA5qmV0WuxAySMcnjpCRK5ILxgAF3R7owaXAkF0XmgfPJtIrgCsUo34TOWlZ/oK+qjNw2Azxogbf4nW+yhyZiyJnFyO4Huvgn+7WOnDBcT6loshlMsqwbmrgLr7UzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSmUh0Ig; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSmUh0Ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761547550; x=1793083550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o9hOjpzEN7iUuLeXdr2xWuL1uPZwJ49CqzZqcYaT/cE=;
  b=dSmUh0IgT8zb2cwAAiP/Tvtb4mU95ul16t25h4Us2oYWmIV4jtfKlAnq
   XajuKZoqhAMVURJo6C0I6SWRWXQCFUvxKwBHAUcecK620ZVvoGzm+AeOK
   lZrCIwzP67OAREbliNTtSiQ/KE/j8Izb/2ahNC5d1YSc4GplsbkX4fPlf
   Wmr5UQ3fI/ChB1kLe8qVg7zHorLpzU51a5npQcZxscVPK/EC9RcUdK8K+
   soYILrwWY/mePQRWgcNa6edRpZahCkx6UeyoUk3loqdGN2JKhcRB4UUls
   WHdLY4KIJ6vgG6d7CPh6uojBjueH+l8IEF9k/88PT+oepNFnCkjj4eTB9
   g==;
X-CSE-ConnectionGUID: Nb1Msi1xRUC5cVqeIrcR4g==
X-CSE-MsgGUID: /zLWt+66SaONInmDiNM/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63323702"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63323702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:45:48 -0700
X-CSE-ConnectionGUID: VA4Abvq5QyWSL6hQJ4Zbqg==
X-CSE-MsgGUID: FfPbi7CORhqm7igL7EGCSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184143279"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:45:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:45:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 23:45:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeUfKQFZLD4CyER+8dYswKwycotAsZ0k58194aFo3unpwWJXfYloEaN79CAyImB40xNGzyoCAZuKGbqqc6UPLoK3EVF6Uh/ZnI6Sq+Zjkvld8xcBfr43QOP+2RyDLFLSuV8sNoWP2sshHAbF1IX0TGbbUH8rjre3iDuwf1gBG3nJVyGZlAEFCKe9Wmk9yrVzExvoULy7RXOspBn1UMmfYlHyP9arQnfP9RnYk4Q1d3sphDSRlNnW8VTNmbkRJuBzDZM3ai4J6s46hLO3ei+we8XEt5ffHjgEZrJd4Wq6v/RZxgjLxQ7rVKVVLvtqWVAWSeqyC8NPaIsD067HQS6Jsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frm3OOu+leAzh78rgl12VLSR9kPYNCN0oWi+ljqTl3w=;
 b=yFtXRj3DT8JgiAIVfOhTIKsToHuBicSyKeV8dTSqirM5Zc6stiZnRSf/7VrpKKbdBfU9DT4zHkxyaAeNErePDrkmCMiSTwyQNRUntfbeuoVUVv2Rz39Ar4zWdqOn8++uksoc40JynUmZLjDQuUuzNaJy546JOl9MknyuiGEbB5vjWVtyumbG32J5tx6na34CJUCzdiPqDLtYeLDM9RoOnhBI7In44YL3Bg1jMYlSWXBNDHtO/irHmD0Z9LvErR8I8/E46H+ft4OSkyYoRIgStWTq1bF13eEuQdBTiO5qTqShVE8AE5Pl3PV78goFnv47uPjvVDiDQZ6BVcC/QcC1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 06:45:33 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 06:45:33 +0000
Date: Mon, 27 Oct 2025 14:45:20 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-shrink-6a5] [dyndbg]  a2f8b47e22:
 WARNING:suspicious_RCU_usage
Message-ID: <202510271402.c48bc913-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0144.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::36) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|IA1PR11MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 899cdaba-1513-4290-6f0e-08de15246c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ztf/HQqqBaSj3k5bKR8+ibXUedDLgQ7EpoUALbTnWl/KoAhl1NwRNXnT4gn+?=
 =?us-ascii?Q?RPBo8shbzFou5tjE+o7fW8t7X7KRTiRlc4zT9bgUlbWUsqoPdRiG2qwYbXOR?=
 =?us-ascii?Q?dUNp7LEj+s6/lqx3p2zcyEVIb77/ipbX4kY6e+yplc8KwmPuTqti+I5a/H/e?=
 =?us-ascii?Q?qToIo3fk4/4eL4yIrneRNYYeefbbZRnoeC8VM2U08UhhTiHk1OWL6dDEBVds?=
 =?us-ascii?Q?EGp91phtZ5+YyKgtV0j8GQy9eSix4HX4fbKic4Fcb9ghDNqfyVFWYDX5ATpj?=
 =?us-ascii?Q?mgaaCNle4S0WipQ7+30SMGagSZJsh40QiNzSxvteuvdIRJRx8LKnTkuMfJAQ?=
 =?us-ascii?Q?FqpnZz6M2i017P2fJ3e435+/e7genL0NCGYx2/mFGVVEzFrE63BAL6XhV4Xp?=
 =?us-ascii?Q?ltEjP54QPmMtgIsbmq4fDA9NGLcWTOxCDucRL825Ctd/2FeKZwIUnrXYusp3?=
 =?us-ascii?Q?Q+VIMVlbR4rarjOoiAWnnzxrKQ4LpHSj3Gy4PHa/jaGtssDHdyjE2INEvh+V?=
 =?us-ascii?Q?mYh/CqO3OVWc/2VR+fFwdD6kM9I/lzh3ki1BrW0DoZfZjAI934Mwrk0phVDX?=
 =?us-ascii?Q?M2z47EZcpmZbcQ+hyrt+4tenXYbWkYTlHnPHhXFVJzgwr7OH+KSxhoMQ//ML?=
 =?us-ascii?Q?eROfLFPPcmWY+bu1SD8LkXkz2s6Moxqi9BiKZQsBX8LEU0VrAySCeE3UA3Zt?=
 =?us-ascii?Q?1igrP0NS8Wo/Yc8JJyIw1ZrGPu1Z5qjpnzagFpBA3iUwt1XG5lPAOvF1NsNo?=
 =?us-ascii?Q?3A+OQ3IEUSM1NrSHrsNqtK8fn4wPLaiRdKRuEhfTVjjuC3SEHDfjNyS2wwsB?=
 =?us-ascii?Q?d+1zIeP0h7NNURcaEp9Y3kgqohZX7be97wprFSNBV7Jh58zBulGSk1/xMl1e?=
 =?us-ascii?Q?H/G0UqLNH4jsbg7GMDpSZe3L0WDm2F1wl8NOrJBeMtyHgPJKmxOiMsi3jtIq?=
 =?us-ascii?Q?S88ZetWWlPcagEHZJJVHu+NeoyNU70Anc2ma8AP51nVr+apLPAduBNNhTS2X?=
 =?us-ascii?Q?eEF9e30DjQxutjnj7KcC42LRQt2yMURXk4qBrHBBf2VMK2uZIpuPPIYYyLQF?=
 =?us-ascii?Q?qBBzErwm4Q0PuVw2HM7DbTKBYLyOOKO0R4NqKdbO/mje7iqsxVrmfwL4eeYF?=
 =?us-ascii?Q?T8jvBn8CQKF7vjYr8JQB5lIWtHqP6Lz3Q+hZ31uo8FszfWMJK8kPHYm8pqIE?=
 =?us-ascii?Q?3Uwp4pfQOUPcdnH/QfWvBlMZgUkD/elqfw+BVm55OstYrtTc94GaZEyjqIy7?=
 =?us-ascii?Q?qCKmVcLn6mw1k4aBlagjFFC9nz/o9kv1RbZH6XYDapEkalCsG3xm5kgWudqm?=
 =?us-ascii?Q?LEYklb1j1kWrWt2MAz8DBaUcM5RtbdRBedX2cLf2XROD+13CtDr+v5cAzoKF?=
 =?us-ascii?Q?O0L6YXmGBRcvbUFwoaSvH7TSrXpn8iuneZjxCCMFGGBhkPiI0jt7Afm7r/kF?=
 =?us-ascii?Q?5Ra46HbL6Xx2a+h1TlYjSYa+IYiRv2lHOi1qhQkGcyGLXSJNr9tVjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SM+LzC5j3NhABwV2AGV38+ILeQs+FeDg4LtDc14XlM8ePDgzYXtTOjb4RE75?=
 =?us-ascii?Q?Ge8+Y2zwKLBXaIXNgjAZQz2Pi6OZJ5qTj3js6aJCMty3cia875vqGi+80tyz?=
 =?us-ascii?Q?EjJ9T7O8shK8N4/w0a3jwGWnNNIEiXCGUnWeb7k6UsvMAcY71thIVDRv/KrJ?=
 =?us-ascii?Q?d9YN2H2yHWDy4HButWGDHptt/GWLgC5vWkB1tpk1lbpffstQ/PvXJM/KdsO2?=
 =?us-ascii?Q?ehARGuYmdhUEjCDItay/duITU4uy5wcM+ESljKG9gCgPPRcZ4NCu6ouAZGxd?=
 =?us-ascii?Q?3kxBB9eL2GQ0PJO0jQEsctc8PKkSERuF9pR6V3FhzhFwkATb6gRPPYJrk6sj?=
 =?us-ascii?Q?r1TYDMoWHQhkgGDD7dyOvuP37QqBT1/+/Pmy5xKXK/7OzONglAfuDOY1cDhE?=
 =?us-ascii?Q?b8sTbo7iTHIawnEMcDoFwXTno4kV6aA9IHx2rHv2Sl40M5glC1qjTZpAKWXD?=
 =?us-ascii?Q?aVxrsLqwBFM9xCWBtaZ8MvtY1DfI2H5ZglHj+udss4Ptwsrn2xVsH8h5sCVg?=
 =?us-ascii?Q?UoHQ7n2ka6Cdj/ZeLKEXLA817fuFM1b2z4QqQdtu0RoPLkNxAKeYaaA3NlDx?=
 =?us-ascii?Q?jmpt5O9Bfaw68eFcgdQeT17M0qgrAJI0n6OMM16umoXuQ5DoDXMgvHdOmOZQ?=
 =?us-ascii?Q?/EsJdaU0QbTFMovWKbNh3+wUErWSbNe6QzrIDSSBC7It3zZ01Y261YaTFB0T?=
 =?us-ascii?Q?OZwTxgXAMxR3We8l5scTGysxOC1mvzQOGZiN3df80BVlxs7ra7IP1H+EsX2r?=
 =?us-ascii?Q?a7pPOJShuD2cmdLoRV3ZDI2Kx5KC6wBZQ3DeCqiu5fpJCMjGFP2bGXh3Fxv6?=
 =?us-ascii?Q?DsHq1BwZG1oUYYEInRn8s/2Q72EyEJQwl7bQftBUVR1MdNWIyczYYfvCnRgB?=
 =?us-ascii?Q?Dkjj403lyoSsCLjbvNVqmW/I9tCKDXwAM+C6U/fI5XJdp4gEvb0obB53w4Kh?=
 =?us-ascii?Q?R2yDkI9idGp92++RCP3AZDYbr9rkr8MnUxSR8+Z/Vak5gc78YuHkRX/OYksG?=
 =?us-ascii?Q?ZVTdo5tboS4RRFJ47I1kbhXxnf4HNcqwUoBWSaPqel2vGcKrh4WuAP4PmMvu?=
 =?us-ascii?Q?t8gEAVa2ynPHXUZs7akANzuxYyCCacE2greknJRKYxbhEqFPLVBBcXnkEMST?=
 =?us-ascii?Q?QvRyXBmXHocCEA5+XC7gyErFUKzT88k37YnzuZwQvJ4hqwGZOEZXMBhmww2b?=
 =?us-ascii?Q?e2CUv/L12RT93i0LhX9SZibCCAqmdoCpr1UzBKm0wHqVUMv2zgAVaUmxm+wG?=
 =?us-ascii?Q?Vdv7+2OSGTynA3LwCoIveo2Tr6J5gxeLXsKBW6YpZ/i/ovWdDtpt8meQ4Rdp?=
 =?us-ascii?Q?B8OWyfGe6r7xcpISM2Msy7AfZAtH+UhzaxBgUgLU/vJYkrbmZtjpfMTTSkEP?=
 =?us-ascii?Q?1kJihV/XVUT80fg7aY41wuUAzkmCxD9RlL5p/UUWmkEotPLMRC4ESFdw1Cz9?=
 =?us-ascii?Q?4EQMUds1wxW6xXVsRNn0qNx2LtBztSTgFB0C0CK5r0VQpuJcT6AG2Y5Nk/Fb?=
 =?us-ascii?Q?tlW/9be2Gjoh1TKEUb/ZUnw5/KRJJpB15jCArY2GLs7WDrFrx0tt6FvR4ylT?=
 =?us-ascii?Q?0V8m2UwVzsI6QVyUkqWRkXiHc1K4sLTvlUTk8oztLeQ3+lYuK5DDUNqtWXEf?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899cdaba-1513-4290-6f0e-08de15246c3b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:45:33.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8EMzNJqW1HW/4SxI5ulY1nuo2V4nXKCBXZBk2FK1uH4iQ5iskEkFmLi4fQK7dv6lDQWLO6sNeLgLKtpnGNi/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: a2f8b47e22fa6a1a9852e392166bc9adf45cc17d ("dyndbg: simplify dynamic_debug_init()")
https://github.com/jimc/linux.git dd-shrink-6a5

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: x86_64-randconfig-075-20251025
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------------+------------+------------+
|                                                           | 9d3aabecbe | a2f8b47e22 |
+-----------------------------------------------------------+------------+------------+
| WARNING:suspicious_RCU_usage                              | 0          | 30         |
| lib/maple_tree.c:#suspicious_rcu_dereference_check()usage | 0          | 30         |
+-----------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510271402.c48bc913-lkp@intel.com


[   23.695945][    T1] WARNING: suspicious RCU usage
[   23.705921][    T1] 6.17.0-00051-ga2f8b47e22fa #1 Not tainted
[   23.720195][    T1] -----------------------------
[   23.729772][    T1] lib/maple_tree.c:844 suspicious rcu_dereference_check() usage!
[   23.741453][    T1]
[   23.741453][    T1] other info that might help us debug this:
[   23.741453][    T1]
[   23.753628][    T1]
[   23.753628][    T1] rcu_scheduler_active = 1, debug_locks = 1
[   23.762172][    T1] no locks held by swapper/0/1.
[   23.770029][    T1]
[   23.770029][    T1] stack backtrace:
[   23.780966][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00051-ga2f8b47e22fa #1 PREEMPTLAZY  38e889c81473e39d3110c5fb5596ce5e6e0e62d6
[   23.781069][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   23.781124][    T1] Call Trace:
[   23.781165][    T1]  <TASK>
[   23.781254][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[   23.781389][    T1]  lockdep_rcu_suspicious.cold (kernel/locking/lockdep.c:6877)
[   23.781517][    T1]  mas_start (lib/maple_tree.c:844 (discriminator 11) lib/maple_tree.c:1377 (discriminator 11))
[   23.781654][    T1]  mas_walk (lib/maple_tree.c:3629 lib/maple_tree.c:4939)
[   23.781840][    T1]  mas_find (lib/maple_tree.c:6019 lib/maple_tree.c:6058)
[   23.781909][    T1]  ? ddebug_store_range (lib/dynamic_debug.c:1510)
[   23.782009][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1914 (discriminator 1))
[   23.782139][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1873)
[   23.782228][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   23.782388][    T1]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[   23.782432][    T1]  ? add_device_randomness (drivers/char/random.c:944)
[   23.782552][    T1]  ? add_device_randomness (drivers/char/random.c:944)
[   23.782618][    T1]  ? __lock_release+0x54/0x160
[   23.782691][    T1]  ? rcu_is_watching (kernel/rcu/tree.c:752 (discriminator 3))
[   23.782852][    T1]  ? mix_pool_bytes (drivers/char/random.c:944)
[   23.782946][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1873)
[   23.783015][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1873)
[   23.783112][    T1]  do_one_initcall (init/main.c:1270)
[   23.783200][    T1]  ? __lock_release+0x54/0x160
[   23.783271][    T1]  ? trace_initcall_finish (init/main.c:1260)
[   23.783338][    T1]  ? do_raw_spin_unlock (kernel/locking/spinlock_debug.c:103 (discriminator 4) kernel/locking/spinlock_debug.c:141 (discriminator 4))
[   23.783459][    T1]  ? _raw_spin_unlock (include/linux/spinlock_api_smp.h:143 (discriminator 3) kernel/locking/spinlock.c:186 (discriminator 3))
[   23.783526][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1413)
[   23.783596][    T1]  ? queue_delayed_work_on (kernel/workqueue.c:2563 (discriminator 3))
[   23.783755][    T1]  kernel_init_freeable (init/main.c:1374 (discriminator 3) init/main.c:1568 (discriminator 3))
[   23.783851][    T1]  ? rest_init (init/main.c:1461)
[   23.783944][    T1]  kernel_init (init/main.c:1471)
[   23.784012][    T1]  ? rest_init (init/main.c:1461)
[   23.784080][    T1]  ret_from_fork (arch/x86/kernel/process.c:154)
[   23.784174][    T1]  ? rest_init (init/main.c:1461)
[   23.784269][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[   23.784500][    T1]  </TASK>
[   23.784560][    T1]
[   24.143237][    T1] =============================
[   24.149840][    T1] WARNING: suspicious RCU usage
[   24.159712][    T1] 6.17.0-00051-ga2f8b47e22fa #1 Not tainted
[   24.169961][    T1] -----------------------------
[   24.179705][    T1] lib/maple_tree.c:800 suspicious rcu_dereference_check() usage!
[   24.191810][    T1]
[   24.191810][    T1] other info that might help us debug this:
[   24.191810][    T1]
[   24.203691][    T1]
[   24.203691][    T1] rcu_scheduler_active = 1, debug_locks = 1
[   24.212003][    T1] no locks held by swapper/0/1.
[   24.219733][    T1]
[   24.219733][    T1] stack backtrace:
[   24.231089][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00051-ga2f8b47e22fa #1 PREEMPTLAZY  38e889c81473e39d3110c5fb5596ce5e6e0e62d6
[   24.231194][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   24.231251][    T1] Call Trace:
[   24.231292][    T1]  <TASK>
[   24.231381][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[   24.231514][    T1]  lockdep_rcu_suspicious.cold (kernel/locking/lockdep.c:6877)
[   24.231644][    T1]  mtree_range_walk (lib/maple_tree.c:800 (discriminator 11) lib/maple_tree.c:2797 (discriminator 11))
[   24.231874][    T1]  mas_walk (lib/maple_tree.c:3636 lib/maple_tree.c:4939)
[   24.231971][    T1]  mas_find (lib/maple_tree.c:6019 lib/maple_tree.c:6058)
[   24.232036][    T1]  ? ddebug_store_range (lib/dynamic_debug.c:1510)
[   24.232134][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1914 (discriminator 1))
[   24.232262][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1873)
[   24.232328][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   24.232485][    T1]  ? find_held_lock (kernel/locking/lockdep.c:5350 (discriminator 1))
[   24.232525][    T1]  ? add_device_randomness (drivers/char/random.c:944)
[   24.232623][    T1]  ? add_device_randomness (drivers/char/random.c:944)
[   24.232710][    T1]  ? __lock_release+0x54/0x160
[   24.232783][    T1]  ? rcu_is_watching (kernel/rcu/tree.c:752 (discriminator 3))
[   24.232944][    T1]  ? mix_pool_bytes (drivers/char/random.c:944)
[   24.233038][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1873)
[   24.233107][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1873)
[   24.233205][    T1]  do_one_initcall (init/main.c:1270)
[   24.233293][    T1]  ? __lock_release+0x54/0x160
[   24.233364][    T1]  ? trace_initcall_finish (init/main.c:1260)
[   24.233431][    T1]  ? do_raw_spin_unlock (kernel/locking/spinlock_debug.c:103 (discriminator 4) kernel/locking/spinlock_debug.c:141 (discriminator 4))
[   24.233551][    T1]  ? _raw_spin_unlock (include/linux/spinlock_api_smp.h:143 (discriminator 3) kernel/locking/spinlock.c:186 (discriminator 3))
[   24.233619][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1413)
[   24.233692][    T1]  ? queue_delayed_work_on (kernel/workqueue.c:2563 (discriminator 3))
[   24.233852][    T1]  kernel_init_freeable (init/main.c:1374 (discriminator 3) init/main.c:1568 (discriminator 3))
[   24.233950][    T1]  ? rest_init (init/main.c:1461)
[   24.234045][    T1]  kernel_init (init/main.c:1471)
[   24.234113][    T1]  ? rest_init (init/main.c:1461)
[   24.234203][    T1]  ret_from_fork (arch/x86/kernel/process.c:154)
[   24.234299][    T1]  ? rest_init (init/main.c:1461)
[   24.234398][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[   24.234622][    T1]  </TASK>
[   24.591095][    T1] Must use shrinker_alloc() to dynamically allocate the shrinker


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251027/202510271402.c48bc913-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

