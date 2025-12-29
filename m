Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252C165F1A
	for <oe-lkp@lists.linux.dev>; Mon, 29 Dec 2025 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766988630; cv=fail; b=k87z7LqhDj6E2JaJs9lHqdSyzOZlXLmwwZWS/vga5iDqMFzAhlYdkzBmQjrD7RCCxKk24wUbH7lwOp/HoaXEV61QbvItCQM0jU8cefX+cqKJuf7tHT40+E3PlP0NTxU9hTSjTr93UmRzz7T8XNTt+790TfbW1oeYOqzv1ilLcRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766988630; c=relaxed/simple;
	bh=nfW0zdys2hbXFKPTnsTINFwH4VgrV0KJreNRiuZeqZ0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=neJXF9OA9s6o+29y7c6HECBOUC35vspGxZBzUlcc/EqcTbFsxjfsH6IQRIOwzqfvJyLAtDY5OZtCtOd5k7bseBhaI0MC6g5ug9YrMqB8Tte4y9jgoxjRodudsnWfS+6BBP+w4FE4kKjicQqCI/gm/W5G0yxBhZFH8wmevnGv49c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRi6kWOy; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRi6kWOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766988629; x=1798524629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfW0zdys2hbXFKPTnsTINFwH4VgrV0KJreNRiuZeqZ0=;
  b=JRi6kWOyd0lCXMTGMRUM3SXygSyMGCeNUXZLBfrG5NRoTb97qgt7uN1Z
   Cj/8r4NXXJ8vfZ/lM06mC9zEAYr14znB3cVAG7rqSODOFe1JQOu+KrTOQ
   tSaF/ZOJrl4yFDjxUJzJBnmyss1pnuCAxsp/F8obx9Xx3pbh4eW6kILQw
   agKgkYCbhiXQVPXm+IqAvOlX1Msy6CYjCztAvUmeMpzN7rnOIgOSjDeYI
   ubbOkh2D2vys55onwoiBQtu7EQrXMTH+Z+sJevFSjf8nU6BYrwFnbhBRc
   8BSXL7oSMiIusBdqGS33SrzcUUjM5ymAc/fvpfxI5CfU0eDBwN7DXsBrr
   Q==;
X-CSE-ConnectionGUID: dJS1ui+nQHG2A4q+uT5F8Q==
X-CSE-MsgGUID: Nx0qFXFMSt+y3vnNBF5wWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68357263"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="68357263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 22:10:28 -0800
X-CSE-ConnectionGUID: 8XIIOhqFTYGE8CLAs5+FgA==
X-CSE-MsgGUID: PIgg7PcRR/GDqUYvsKoaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201770406"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 22:10:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 28 Dec 2025 22:10:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 28 Dec 2025 22:10:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 28 Dec 2025 22:10:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yK8pFAYFBwnIa9a1YiamvyHxkw6UI5hzMewI8pqoTPt+4QX2ARExqVAjndiA2U+jwXjA4NbLrovZw7Ipj10HTxmA8h3y1dwP7UXdyov1+w7irUndCls4f63VNLlTg9GgQ7/f6XHs5/otlamDUu4ujMByNMcfQcbOCX4qs2unXI87qOi+5KCbPLgFyBUh8BQZA5IHCZ5vO/7SKLLiG5m6q1Ar/H/r0GRIRbuxFdH4/LAN+1Mh5CJWyblngBq2WBx0/URSrmcfH0wl6d2OYcPpC739dGym/yh269vbxzN+lC5U8KHeU3TQ3j9w+3r1nYrUOkt8E7T9HKCeNvSvfeN0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD5B8Xzi5JF0xIDoDce/jxY68jAlmE1N4eh4/Px4dWU=;
 b=cHcJlweNOmFhryevrBkB1+jP4jlCw6Fl7aiAnC7tXqnsGC3yiRsfKAStnVI4t5Prz+mxk0jl/i0qcx64F4qlmvw++iBcqWMmqI28C7w2B9o0DwfU45SMFSa17jlk33eBR3NrIh3DVLUMY0GpHyRtwv6O29XkW+wV8zf+tSjZXKYhyi2Ug/TAq8TUDdfCFq4nCiNZ8yaCj1VasPBSAoWmcYayXpEadT3h4ZSpYT86Ke2ArdDb0ke7HqGkAxD6xQRy562BJKVMatEIO5gHGCiHnFLFALBGIgZcyzAHSntCOB5gV4AArYUBetfT2pHvAUTn4KqmkJubomTCPSK+yQ8Fbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Mon, 29 Dec
 2025 06:10:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 06:10:20 +0000
Date: Mon, 29 Dec 2025 14:10:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:hugetlb-init/v0] [dev]  76602f76e0:
 kernel_BUG_at_arch/x86/mm/init_32.c
Message-ID: <202512291348.f898b0e5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW6PR11MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 63582b73-3521-4b89-4bf4-08de46a0f228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z6VOhbmRtj47PCifCtSqKcu2HF5oShGfjvfQ+CgmRzIKGZgxE3JBhINVCHtx?=
 =?us-ascii?Q?pRZcXMS0ryfANU+/Bmn99Pq2LHB6J2NbEvQHmtVQ1aXv9PLwfQeGtw0GxEfA?=
 =?us-ascii?Q?Tg1NHjUI7uIfJtQYhg/Mu8ro/7myY6CGRnwYDbA6mpZKUNL2W3w1nSxZ7fvT?=
 =?us-ascii?Q?MV01exddL2xGcZQe9bytnJvLK04ZNhVbZjC0AcGvnprN0V4HpqWpRW7fpjUE?=
 =?us-ascii?Q?UAgxazVzAaCIjhsfEs/NsRnstaQcMDDq1WRQ4H+rlz9TrFG0YSomK40DAcJA?=
 =?us-ascii?Q?/nTSmTrEVEcC4Xvd0wDeCV8kUuLIM42NsGCqZkadasu01dpH/hExjyeeb0QO?=
 =?us-ascii?Q?tNqm9p6gFN+RZ3IJQKunmShuQSiwwVUmsKOn6KQcuWFIzVGhlBrFz4CBa0Hs?=
 =?us-ascii?Q?ySiZ5+0tDZoEvFal6KNBTJP61PGSjTXEFAPo80leK5MaBBq0PyA9+ORpiPQN?=
 =?us-ascii?Q?zBElX1I01Mx2Eie/54/3QG6l4T0uHdIxmWWOXDPYViOrOrr33/3Udg3xyWoP?=
 =?us-ascii?Q?YlUKg1K5MgLHKSCrAOHMdCc087NJO1Q45TUXicIUslUmbtJ2fARCrl1zS7Ul?=
 =?us-ascii?Q?Fre4E00UBLVyz6xsD9UYqbRM2QoGd7GHJRNi3j0eOsASSuDHOQd7k0rDfVOq?=
 =?us-ascii?Q?kBMN8VPiszbGniq7aqcKKqOqDK0V8gxFMQKMIvN3VXMnN7aPhgmdagyPQuP6?=
 =?us-ascii?Q?3mVL9QvhZJldiMFpGB8Z1OnovYaOHh7Dyfea8teZ9GHZg3sk9ECduVMBgSPr?=
 =?us-ascii?Q?rDldDcs7k8RyPKYqquxUDENJjV9+nTE4jzdOAeP15ZnCap+a54kid++AUSsT?=
 =?us-ascii?Q?bC2Hc7I6AODwrMaU+8gFCn1/WQMCH1T7/lqxYIOeIekLp8/eUG7O0ZBfAREf?=
 =?us-ascii?Q?lzqf/yfLmt0IYAuwKj+zTyEu9/JFqrM+KM3iNEiRdoDQLvgYnoP/q8SU8dkc?=
 =?us-ascii?Q?5Yg2RHMzS2iOjgFBWJmk2FlcmGOxcxuurOnDWWel7/Z4LOjtcJ1zpOumOMGN?=
 =?us-ascii?Q?E8T8WA4bbFVRj0f4tTjknpAtyI/evpqDZN/SN5ktB6mp0YYC3fe84tZawUxd?=
 =?us-ascii?Q?qrfTA5Kz1mbRq5tvJCcZl/KOiBHf8QfK0ljDAY4PWfPvkZy0InyzdoxnVOlF?=
 =?us-ascii?Q?Wbs5vENXbapSzyIWONA6EVAucyf/lau074LFLQhpTX4N/ASJ19qUgtJdFVSP?=
 =?us-ascii?Q?vX30DdFGNK2wyb6Iec31SIY/JP9q23ktvIsmNSpVA6WAGEnEUVtMGkeKCP8f?=
 =?us-ascii?Q?fljg+E/T2sTdmtGcm6GuMBmR5LVYpJTDilLAF8Hr6eN4XIe9ZvVGSttNX7Cw?=
 =?us-ascii?Q?QwFUBfVzMk7TK69uq43ev50rX2aQAt9mxHqPHxahZg/W26BtxO3mer9ucw7A?=
 =?us-ascii?Q?+c4f4clFzAn0akHMo3dZoJhuyyoJBfKVmushAiYhPb0VM3GF4rMsx9SRP7j/?=
 =?us-ascii?Q?Gp/n+k/Grh1tVzCbmVkv0SV93p5WMBtG0Pd7eccBkkE+oCfQaWmgHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L0EGZ/zWUUBS4s7wtF8qKRO/CyVV43SslY3+xUxMSj6N+cls5ACOfmbZHCaJ?=
 =?us-ascii?Q?XzMgixcMCRnewkwhyHrkmb04tE1JLFeKkvkx0cQ6Aml0DPI4si3mA2N8fZD4?=
 =?us-ascii?Q?3HA+PHv17DXqu8emK8OvwFEnar8F5yU/F9Ig+Udqun+ZjR8hNHgTINnuDqsY?=
 =?us-ascii?Q?pQ5dGxlRYwDk0/rzI7yDDbmHm9vZRbFecAf/jIfwr4Kb3NVnmGOcoMMI7z7E?=
 =?us-ascii?Q?5idNgZK6Cha+kMNADjdR4IfDWkkqMmo+tW9LAFLWXVttFN3Icc2hbPJo5p8n?=
 =?us-ascii?Q?Vko67KNbmtv5rHedCBegVn4hR8P9fPqyuJer7uOhLCkbEQpNrQC4nwXxbNfV?=
 =?us-ascii?Q?rLw8bzl8OMGXdauoEOOyheyVvJ6QpriJUpFmgtk66Vk5+soag7fgCNA1XQtO?=
 =?us-ascii?Q?WKrB5qNT7CIN/yTpcHsSkjURiGGEmMd5xzdcB2cHgyT1cEkt0ogzD8/VhV1i?=
 =?us-ascii?Q?lOpDARrpRWtDbAn4/5ebEc2Ltb1V6yzwpeDydaw3IKrT9lgM4IZbe8jIsb+g?=
 =?us-ascii?Q?xKtrul7ASaLdWIea3UuoPrc7WYWLqpkD8+RsPxbISCeT6ck1jjf2fj/0kGGU?=
 =?us-ascii?Q?tayTamts04jWE/z4TjoO9smsCF+D9U0Mqt+uuzIiDsoc1+zRzDzhhQdUejY8?=
 =?us-ascii?Q?wz186cMqbzgZUAhVwZY8WwD5U8JwI79nkluV4A4Gxpp+WDv1HHG2f5yQZMMh?=
 =?us-ascii?Q?DEJLScoZ5MoIfU/9lbt42Nh7qTmLjUaCQQaFMkwdmG8MqWGFLRckhD1xCXf0?=
 =?us-ascii?Q?0V3H/M9A5kfXCELPoG5sNdapJCaVfLeNKhXrdILb6azARdIXZf7b6uKIk3NH?=
 =?us-ascii?Q?LL7wM2aTpB8rGb2QH91ANRwPlmKOF9oiKGa2KUmH06V2ux8ud0w7fjtIrqfK?=
 =?us-ascii?Q?+3R2UJbpeqH9YhtqMEVi+bojFxVavoSrtZiUDVBwYw0UEqJnxQ0QAm3l5JfO?=
 =?us-ascii?Q?xRRRXDwNSky9oIucXSPtUlesi97qfAm2eVSZ0cS9Z4lR9jybzMBvx/842d41?=
 =?us-ascii?Q?BoIP2F7CzBH/048MuQ1iqOhQzxqPXqVnDmGqQgH6jxGDVcgfCmMEf6BuyMKo?=
 =?us-ascii?Q?PAHZOP6GjCvQ62tcqLa4REB7UT4E0breGvHneByJwixeW0+/nlQpaJFulvWB?=
 =?us-ascii?Q?TA46l44uCsohj96SUt+1gnQUWuO7KWwcOXdFIDHI2UnzaCOSTvqeBacCBkCS?=
 =?us-ascii?Q?kRVVOPMAqKU+wD+sw3BqzHE1/56Trn7Lj2PUI0VHgtRKNlIhsAoq8aR9TxLb?=
 =?us-ascii?Q?0T8bzGhiulgXTisW4lLpqBirUTFWWKM290JPp7yDPJ2Cd46cRQ/I1c5GUPAq?=
 =?us-ascii?Q?GbDIDeJmYUAHb4BGnyoRCRnWMurDbLn7qvcs02H9j4Yk9QvRytf0C/2rDyT1?=
 =?us-ascii?Q?CZVaXSArkjrAB6WcBFwZ2U3091Q6TFlFi4YIz2rAXzemfqWuSYOG+Kq9TxEg?=
 =?us-ascii?Q?5a/bFoLW/3m2FAY9PNvd/Wlu86ishj2SpL85qAW8yaNhskfZ8/1lWTNkIgSe?=
 =?us-ascii?Q?IA641POEcSjJR3YvEaHoScFSY/nVxnQwLghw6xEm9FbbSL2Bhvk70P3dcvEf?=
 =?us-ascii?Q?uD63F7R3Fy78l/mNipGoit+kW+eMUIVpSCPAhMlX+thmjHtko7Lhxrq4yvWn?=
 =?us-ascii?Q?PvWUoSbl1F21RhCDgepW3rT8Yd38P4R94+5bwyIVcolFvhwLbkpMQArRHAFd?=
 =?us-ascii?Q?JkBNiQNvuZcTdeTtxY0CM/3wAtyibcXAcfZMNeAOmk/6zNR/tnMH1qCiwyCR?=
 =?us-ascii?Q?kT0kN8AaLA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63582b73-3521-4b89-4bf4-08de46a0f228
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 06:10:20.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzvi4D0GdsNhagZVnSE18fAypUGZcblIA5dvVkByDszKZzRQ/Ch7lzh5iVlCBEH2nja4lfz9NEBV4AESNkVdQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8410
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/init_32.c" on:

commit: 76602f76e089f4ee2c930724377963f43d513b47 ("dev: call arch_zone_limits_init() from mm initialization")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git hugetlb-init/v0

in testcase: boot

config: i386-randconfig-011-20251225
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | b7e81cbba5 | 76602f76e0 |
+------------------------------------------+------------+------------+
| boot_successes                           | 21         | 0          |
| boot_failures                            | 0          | 12         |
| kernel_BUG_at_arch/x86/mm/init_32.c      | 0          | 12         |
| Oops:invalid_opcode:#[##]                | 0          | 12         |
| EIP:arch_mm_preinit                      | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512291348.f898b0e5-lkp@intel.com


[    0.234917][    T0] ------------[ cut here ]------------
[    0.236290][    T0] kernel BUG at arch/x86/mm/init_32.c:689!
[    0.237768][    T0] Oops: invalid opcode: 0000 [#1]
[    0.238916][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc1-00022-g76602f76e089 #1 PREEMPT(undef)  c8d24fbcd25ff6aea7081c5f4582d232be127691
[    0.242532][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.245122][    T0] EIP: arch_mm_preinit (arch/x86/mm/init_32.c:689)
[    0.246338][    T0] Code: c5 fd 83 c4 08 5d 31 c0 31 c9 31 d2 c3 90 90 90 e8 87 87 ce fd 55 89 e5 e8 bb d7 fe ff 83 3d bc 76 ba c3 00 74 04 5d 31 c0 c3 <0f> 0b b8 38 ab e0 c2 e8 1a b6 c6 fd 90 90 e8 5f 87 ce fd 55 89 e5
All code
========
   0:	c5 fd 83             	(bad)
   3:	c4                   	(bad)
   4:	08 5d 31             	or     %bl,0x31(%rbp)
   7:	c0 31 c9             	shlb   $0xc9,(%rcx)
   a:	31 d2                	xor    %edx,%edx
   c:	c3                   	ret
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	e8 87 87 ce fd       	call   0xfffffffffdce879c
  15:	55                   	push   %rbp
  16:	89 e5                	mov    %esp,%ebp
  18:	e8 bb d7 fe ff       	call   0xfffffffffffed7d8
  1d:	83 3d bc 76 ba c3 00 	cmpl   $0x0,-0x3c458944(%rip)        # 0xffffffffc3ba76e0
  24:	74 04                	je     0x2a
  26:	5d                   	pop    %rbp
  27:	31 c0                	xor    %eax,%eax
  29:	c3                   	ret
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 38 ab e0 c2       	mov    $0xc2e0ab38,%eax
  31:	e8 1a b6 c6 fd       	call   0xfffffffffdc6b650
  36:	90                   	nop
  37:	90                   	nop
  38:	e8 5f 87 ce fd       	call   0xfffffffffdce879c
  3d:	55                   	push   %rbp
  3e:	89 e5                	mov    %esp,%ebp

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 38 ab e0 c2       	mov    $0xc2e0ab38,%eax
   7:	e8 1a b6 c6 fd       	call   0xfffffffffdc6b626
   c:	90                   	nop
   d:	90                   	nop
   e:	e8 5f 87 ce fd       	call   0xfffffffffdce8772
  13:	55                   	push   %rbp
  14:	89 e5                	mov    %esp,%ebp
[    0.250972][    T0] EAX: 00000000 EBX: 00020800 ECX: 00000000 EDX: 00000000
[    0.252639][    T0] ESI: 00000000 EDI: ffffffff EBP: c2dd7f78 ESP: c2dd7f78
[    0.254325][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210046
[    0.255951][    T0] CR0: 80050033 CR2: 00000000 CR3: 034b1000 CR4: 00000090
[    0.256842][    T0] Call Trace:
[    0.257250][    T0]  mm_core_init (mm/mm_init.c:2706)
[    0.257783][    T0]  start_kernel (init/main.c:1068)
[    0.258342][    T0]  i386_start_kernel (arch/x86/kernel/head32.c:79)
[    0.258931][    T0]  startup_32_smp (arch/x86/kernel/head_32.S:293)
[    0.259518][    T0] Modules linked in:
[    0.260018][    T0] ---[ end trace 0000000000000000 ]---
[    0.260657][    T0] EIP: arch_mm_preinit (arch/x86/mm/init_32.c:689)
[    0.261245][    T0] Code: c5 fd 83 c4 08 5d 31 c0 31 c9 31 d2 c3 90 90 90 e8 87 87 ce fd 55 89 e5 e8 bb d7 fe ff 83 3d bc 76 ba c3 00 74 04 5d 31 c0 c3 <0f> 0b b8 38 ab e0 c2 e8 1a b6 c6 fd 90 90 e8 5f 87 ce fd 55 89 e5
All code
========
   0:	c5 fd 83             	(bad)
   3:	c4                   	(bad)
   4:	08 5d 31             	or     %bl,0x31(%rbp)
   7:	c0 31 c9             	shlb   $0xc9,(%rcx)
   a:	31 d2                	xor    %edx,%edx
   c:	c3                   	ret
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	e8 87 87 ce fd       	call   0xfffffffffdce879c
  15:	55                   	push   %rbp
  16:	89 e5                	mov    %esp,%ebp
  18:	e8 bb d7 fe ff       	call   0xfffffffffffed7d8
  1d:	83 3d bc 76 ba c3 00 	cmpl   $0x0,-0x3c458944(%rip)        # 0xffffffffc3ba76e0
  24:	74 04                	je     0x2a
  26:	5d                   	pop    %rbp
  27:	31 c0                	xor    %eax,%eax
  29:	c3                   	ret
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 38 ab e0 c2       	mov    $0xc2e0ab38,%eax
  31:	e8 1a b6 c6 fd       	call   0xfffffffffdc6b650
  36:	90                   	nop
  37:	90                   	nop
  38:	e8 5f 87 ce fd       	call   0xfffffffffdce879c
  3d:	55                   	push   %rbp
  3e:	89 e5                	mov    %esp,%ebp

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 38 ab e0 c2       	mov    $0xc2e0ab38,%eax
   7:	e8 1a b6 c6 fd       	call   0xfffffffffdc6b626
   c:	90                   	nop
   d:	90                   	nop
   e:	e8 5f 87 ce fd       	call   0xfffffffffdce8772
  13:	55                   	push   %rbp
  14:	89 e5                	mov    %esp,%ebp


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251229/202512291348.f898b0e5-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

