Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332816B3BF
	for <oe-lkp@lists.linux.dev>; Mon, 19 Aug 2024 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724076426; cv=fail; b=mUUrmdtPcTEWUdUwRcY0Gn5P4rIC403eJ7latKhNCg/W7XxugvC+IHoPobWoltn+LMw85GlxJVVDh/hPIGL3IJY02P2fyGRUaSSOEf94BHrkhM2Bm6W5r9ZuEuyRoYwgq4bXjH7tL8jNfSSqLyp8Sjfl/8phjQNFB7yB0sruHIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724076426; c=relaxed/simple;
	bh=1jU/gIb1jbXYXk67lLm/sIz6VVIgp/lEMM7U3rg7zoo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=SFY+VdtowuIrmMmVVRTAUk9cW5kgiQay+h1E12yKN9u0mjRe1MBtNrja7e5vmx7CZeoPBtTphAYwYlYoCWz/3Pw18dIe+HiUZ9YHdiWYx72DIYifRh+0KugyE7bbHRGbuSTrVmgjsDzf1Vnn+sux8ukSPSGCLaGSX/vjkJ6cngs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxMM8Lco; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxMM8Lco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724076425; x=1755612425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1jU/gIb1jbXYXk67lLm/sIz6VVIgp/lEMM7U3rg7zoo=;
  b=UxMM8LcoadcX5tpYjVtSR57SK7bDOdMSNCZyNgNyYUMRvpT4AjqUJQ9+
   cpzHLBuz00LSRnu+Ex+dwsSNKK1O2u9oCcVwQ55l6R/gcSH616oTZ+8up
   /46rMpMn/QXaKHbK5DJCLs3Q8KH0XQ/US8/HMr39TCrXuDqYx05lCPr2c
   HvxNDhh1j6QX59tq+4qFTUqQtywWzK7/G4vgQfPyi6JiaBByTc1JMHTpY
   adKAD3o2dV7ANxUK+5+aonmPt3QvOqAQRdVXdDfg1Gq7J0ZsYttD0BlaN
   tIx2R6ZrS56AvzWJynPgCyAfFXIjqBHUHZBK8jt4M++hLKWpmSuEH/Y8S
   g==;
X-CSE-ConnectionGUID: Sva4LuBDT4G2voEje7sEaA==
X-CSE-MsgGUID: Ki+Kv6VcQyesTrFF9i9tXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22170398"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22170398"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 07:04:11 -0700
X-CSE-ConnectionGUID: FpUujcmlTIikRNlLFt1CFw==
X-CSE-MsgGUID: gn7nO+z+QNay4aVuzy5L8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60692383"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Aug 2024 07:04:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 07:04:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 07:04:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 07:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvfUK/pjWWjciqj+H9e+u7J3yAO0oo5OKxXGk5J4sRzvGdCQUlh6//2mzy01WNq5Y/WknHgxoLQafsVhKywuMve27Ck05nQeBGANXpAq/7V1x+1ctY2nMB85n6FKvteFZB8giUt2DISXCrqLwFzIbqbl4ZSmNl6uU1Wk6lbebEnERVJfbrABAg6oS1Uug+ZIyZxujZIYvA77qcoWdGKtmdMzpYHdNNM9+IIzx+QGVcZecYNL59J4f30oYPMfZsCWAgKuLGqcA9fGbnyK3HnonHTf+ZaniPReC/D8dCAoSBaLDbmuzNbHlV/6MOnMxFSe888DwBAqLaBCzpepZyyhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiJUYa1Y8i5FW8Ppd2oskiUClIAMHJ1u4aByNCTjCMk=;
 b=ywQxHk8bm8TMvlNvTPTOqeIyV+VUwdap0rLxOMqWKPLdwLRiyLDVm13ZsPf6NMt38jwG0C7Gm/BX9Pv3JQYtXLDsBBGzlj2YEXEOVkrant2WLdZEq/WhSVpxzQ4PfU0Wmf6vpHikc/xDX0sJLjzCjVJsoKU1ld4cRl5sRV3s9gT53oLezgGHpBrANQdpnzMTL0aBufXZr3QBVjgr8ZKYXz+5KDXAQI4JJa/Fw+sVEFZ1Kp/hc5loi9c4y+q5PfLWQVJhv6AXC81I5kIxbfLvrT+QzRlipyMhq2cMnOJd0nLF3rtNEUGdxLmZTjGmEPg1obzrFA5s93Ask2j5nnaVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 14:04:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 14:04:06 +0000
Date: Mon, 19 Aug 2024 22:03:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Rob Herring <robh@kernel.org>, Klara Modin
	<klarasmodin@gmail.com>, <devicetree@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [of]  4be66e3207:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202408192157.8d8fe8a9-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: d9db5a2f-83e7-40cd-7dca-08dcc057c98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jA6hIqi2pguMq8jdhFIPDDXcA9gPli2RGA64qDwoDZ4rC23KYxtp+CQf7ev1?=
 =?us-ascii?Q?aaEzgoMBPVfGqsoYxNZSEQqvML7RamhE3hzQSPqFX0scSpL7vVYW2eZ6FV7M?=
 =?us-ascii?Q?jxzU6u0CGcKGTf2woCP4dxdJncQdji+mWFR24qh0uaqwEFYL76plNW6usC+K?=
 =?us-ascii?Q?cowtsoPz56KcedyTWp1/WhPJU/Aw7eS3ePSiVDpy93Ghjo593stBwKXrjQPg?=
 =?us-ascii?Q?9qNrlAvCaQ3iTRDK6Yn0Xh173ybD2rlccsH8QtUaUMtryFrroOZ9ayIavAHj?=
 =?us-ascii?Q?cINMXFB9KF97gz68h0VJG0aphpWoPzfxkCZzlYBnHF9R8yXormFr/OkkvPX9?=
 =?us-ascii?Q?KiBbF1q1JfCRPVb93h+Lu2Bjrj6fY7JagZzW22hZvRJutuoPh22h7woUJbPz?=
 =?us-ascii?Q?zVEJEtmaZIGIvzyE9AQqy7EXMXf9hvOpw+NH86NvwQ0PnFDf+9lXQyewcoQk?=
 =?us-ascii?Q?YByjfFRfXBEw51pgSqROLIwgcOMsvDagZ5fE52DCdyV5xFdTigVPjTQ6abpy?=
 =?us-ascii?Q?qqehPk0YQnnmaIy2QeKUeRhB+a1PTX+beqJRuVEut2R4FIJGsGvMGNsJBAt/?=
 =?us-ascii?Q?/mX6UjT/LntWBsdyYuHJr2s6oh1Pl2ZjXMFBu5/GKGq6S1kNKFp0rzEeTKo4?=
 =?us-ascii?Q?QIzMPb+xiMnkMtVKQQ8OTFwGUSm9EGFuvZjMp1gxh4p47Lh436Dze0r4oMOT?=
 =?us-ascii?Q?fEaYaX0SUBZPUF5kuqUBIaYK8vdBldIcgBFW/PSV4zd3cPpFCk2b7epIS8Ok?=
 =?us-ascii?Q?+70kky7GDfaf/Syqx/f5MG+YsHXz+stI09WGrkfZCP/BsyPbPLG1vJqX1JHc?=
 =?us-ascii?Q?wV3npCXE3JEqcPFKF6i3zAFn8G33VWuB6HNnhIxzKb7Kbs4xPzzja+fFTgJO?=
 =?us-ascii?Q?HasrNIrPRTo4GeGfLpPRPCH+E/0ygBPI/d2bc4pErY/Uur2e6TH835s3UkRq?=
 =?us-ascii?Q?PAKHuPlsZiMatreY9aIRy1uzn6mRVcKCpMnYTON6ErCcmPzEOeA3io46dVBP?=
 =?us-ascii?Q?Es4+Y2mA9ddvQ6urlxNU4Gc0c5aNl71vrXhfzt1+LhEZJmRdDX9ZQgrncAOX?=
 =?us-ascii?Q?LIRWqYsQdytiL/R7X8Yk6SVGu7+HQ6YfJEvQ7z7qvbaY2ATBIcyHflJlSUy9?=
 =?us-ascii?Q?SCpuvb1ABKj/Nl9IeOLqN9Qlrh7XvMSgIYuBAozp0F0iAf3dOa+cO2QtbWS9?=
 =?us-ascii?Q?jnST2qUmjyWK1sqECJVb/wVayqrEyna5os7qMk90CQ+t4wQdwDPzMqerquFa?=
 =?us-ascii?Q?gx0AVDaDoJF6wG5vSyDSXCYTGmANHrv8qI1hnq9bcd9GPzfapKnu6FOcnvLF?=
 =?us-ascii?Q?srg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5P11ojfS7nKVopHmytb/R1Z0XqcHenLKKKJzCUCdjwsbAIQ15UuX1ecpR+7Z?=
 =?us-ascii?Q?SC9Fz+KBVXe0wnXXLEnfwNWC8pNR0XgZmZJycGkYQzijUeSJVpMUhgMO1vrX?=
 =?us-ascii?Q?eR+W9gdzq3GXS+jxP8L8YyO/ov23j/CwEB2hBZ20034JtPVPaQcZoTgOYapA?=
 =?us-ascii?Q?avA0NJ3UuXYkDgYDsp39qxRIbnPSq+lPe8BsUxKXkHL8WtpHXR5bSLYpS4qB?=
 =?us-ascii?Q?jeJARSDJCgeNB7G73l/YUbIPMB2wXX2zU6dwKyxf7qYdBlKUrNoBtIeDwjkL?=
 =?us-ascii?Q?pzODulPwNiRdJp8YBRSqmleZ/VH9uauomw4mr3eiFMsZf6db+M65FYl/putP?=
 =?us-ascii?Q?BoGqkx3yvTBzIa2BYVhhn5YRRVy4N5aZZKcneEB/Ec4yo+sxN9MDtY5VzDlP?=
 =?us-ascii?Q?ir5wXTanRWfCUncuROgCvYdr99nsKdozgc9KaE72kQrl005Cp3RhObneNerl?=
 =?us-ascii?Q?Qj8GO0/SuNe7EbyyvmrpbD68LaOmzZn5T+BR3sThZ8mNYA+gs0pGGLGMKDWa?=
 =?us-ascii?Q?W/zQfcaJXtncvkyJ8n+l9IBLhj249t4WDFV0cjl9uuRM3H9+m/zxrNVt4dkU?=
 =?us-ascii?Q?1ua3bVPcNKA3NvwnDtVijtMM7jWGCNVUkCkGe97KKjsKSu9IXAdmMCd2oXYO?=
 =?us-ascii?Q?dEUXWLxheZ8S8Ndh7EPZBaTehGfo4+9E0m10ENYk+dsLgFUDc+xZl2nSByZZ?=
 =?us-ascii?Q?u8y0DHTJZRJt40ZpbVM1EhLY433DZmOIK2d4XRh33cJSrWG1NsYgOCsgBzvO?=
 =?us-ascii?Q?rZkUQGB+pWYPoJCndC1mpHRVaX273hFLw22JKUxGhbaUQz6cpA199zRvLXCM?=
 =?us-ascii?Q?7PVkABSj6uqk5ZMlkBKUM6xjKOHsMHYIwF14PEDEdW1HGsSZ/OyphYyf4B1F?=
 =?us-ascii?Q?khzbGpWQIu4McrogwLWckVWxben/uGOUXtjVHRnZD3qmcPcMOvwmupFXUn6O?=
 =?us-ascii?Q?Mfcx9SqLfw3h4adhzLSQxCTmUym2/c9WUCh/J63ePSLocSSzfTlc4koH5vA3?=
 =?us-ascii?Q?MjfMm9mk0bQ54sTV/GWy5ZNcT8vR9ZVI4A9hf6kaVUvtQsFlitjwg2KAH/xw?=
 =?us-ascii?Q?cUg4ONHwcNnP7xkEeUpcNbxmqdzRUnBxPtILKCQm3WqE1knXD8o8TJEww7H0?=
 =?us-ascii?Q?y2hZ7K/s1S3aidwyhfa0bVAyBNb/IRA3f4wDoe+5Zb6KsvRE7qvk0tbc8Ij5?=
 =?us-ascii?Q?RE5ABtktnl7ph/soEKBlgrr2u377+9SKNmzeAOsG5gFertRNIH3atxIYY0/Q?=
 =?us-ascii?Q?LMd65a6IwjrKoIcm7LMANaE2sHZ81hAaxEoP0I7a4mymQfl2V/2oH3LttzQW?=
 =?us-ascii?Q?Zet+vonzLEaq9jogjc3horTPYdYG1co3fd/XuS54jU5DBnQ52sUsKR53vHyx?=
 =?us-ascii?Q?xtHLHXk9ElFUUdaLcm9kTHt3KG5BfX4lBoSTSOior8h/12LgXQs+sHu6tM9U?=
 =?us-ascii?Q?brpSzeCMZ/NbRRgK8838MdXm7OgYUP7k4UHO88v5ywa835SjOrojuHZNNLhH?=
 =?us-ascii?Q?3Y2KR9yrQfbhQwOKwLbEeMK7HTCHpKJ41YA8iU/FaeugNF4PjjgP5euHPVxE?=
 =?us-ascii?Q?kNC2mh/VEyD0bKfiPYHHc92lTUbNYfXut/V4HUr8gfYm6ah357YfR61EjsFD?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9db5a2f-83e7-40cd-7dca-08dcc057c98e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 14:04:05.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9F0OUXZHT7HrUHHAt7YAXe9rmf9RchKxlpsiY6F2Z9hhy+1X7Ne3MjFk1xtH1JJ8zdaHRryOFDv+g64UcV5RiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 4be66e32070d1e8da72934dbe4dff44a49bd2e5f ("of: reserved_mem: Restructure how the reserved memory regions are processed")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | d2a97be345 | 4be66e3207 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 15         | 0          |
| boot_failures                               | 0          | 15         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 15         |
| Oops                                        | 0          | 15         |
| EIP:fdt_ro_probe                            | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408192157.8d8fe8a9-oliver.sang@intel.com


[    0.052331][    T0] BUG: kernel NULL pointer dereference, address: 00000004
[    0.052785][    T0] #PF: supervisor read access in kernel mode
[    0.053163][    T0] #PF: error_code(0x0000) - not-present page
[    0.053541][    T0] *pde = 00000000
[    0.053774][    T0] Oops: Oops: 0000 [#1] SMP
[    0.054060][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G                T  6.11.0-rc1-00018-g4be66e32070d #1
[    0.054748][    T0] Tainted: [T]=RANDSTRUCT
[ 0.055020][ T0] EIP: fdt_ro_probe_ (scripts/dtc/libfdt/libfdt.h:? lib/../scripts/dtc/libfdt/fdt.c:?) 
[ 0.055319][ T0] Code: 56 8b 30 03 12 31 c9 39 d6 19 c9 b8 01 00 00 00 39 d6 77 02 89 c8 5e 5d 31 c9 31 d2 c3 b9 ed ff ff ff a8 07 75 5e 55 89 e5 56 <8b> 50 04 8b 30 0f ce 81 fe 12 01 f2 2f 74 28 b9 f7 ff ff ff 81 fe
All code
========
   0:	56                   	push   %rsi
   1:	8b 30                	mov    (%rax),%esi
   3:	03 12                	add    (%rdx),%edx
   5:	31 c9                	xor    %ecx,%ecx
   7:	39 d6                	cmp    %edx,%esi
   9:	19 c9                	sbb    %ecx,%ecx
   b:	b8 01 00 00 00       	mov    $0x1,%eax
  10:	39 d6                	cmp    %edx,%esi
  12:	77 02                	ja     0x16
  14:	89 c8                	mov    %ecx,%eax
  16:	5e                   	pop    %rsi
  17:	5d                   	pop    %rbp
  18:	31 c9                	xor    %ecx,%ecx
  1a:	31 d2                	xor    %edx,%edx
  1c:	c3                   	retq   
  1d:	b9 ed ff ff ff       	mov    $0xffffffed,%ecx
  22:	a8 07                	test   $0x7,%al
  24:	75 5e                	jne    0x84
  26:	55                   	push   %rbp
  27:	89 e5                	mov    %esp,%ebp
  29:	56                   	push   %rsi
  2a:*	8b 50 04             	mov    0x4(%rax),%edx		<-- trapping instruction
  2d:	8b 30                	mov    (%rax),%esi
  2f:	0f ce                	bswap  %esi
  31:	81 fe 12 01 f2 2f    	cmp    $0x2ff20112,%esi
  37:	74 28                	je     0x61
  39:	b9 f7 ff ff ff       	mov    $0xfffffff7,%ecx
  3e:	81                   	.byte 0x81
  3f:	fe                   	.byte 0xfe

Code starting with the faulting instruction
===========================================
   0:	8b 50 04             	mov    0x4(%rax),%edx
   3:	8b 30                	mov    (%rax),%esi
   5:	0f ce                	bswap  %esi
   7:	81 fe 12 01 f2 2f    	cmp    $0x2ff20112,%esi
   d:	74 28                	je     0x37
   f:	b9 f7 ff ff ff       	mov    $0xfffffff7,%ecx
  14:	81                   	.byte 0x81
  15:	fe                   	.byte 0xfe
[    0.056594][    T0] EAX: 00000000 EBX: c27b018c ECX: ffffffed EDX: c27b018c
[    0.057045][    T0] ESI: 00000000 EDI: 00000010 EBP: c296bedc ESP: c296bed8
[    0.057495][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
[    0.058060][    T0] CR0: 80050033 CR2: 00000004 CR3: 03032000 CR4: 00000090
[    0.058716][    T0] Call Trace:
[ 0.059024][ T0] ? __die_body (arch/x86/kernel/dumpstack.c:478 arch/x86/kernel/dumpstack.c:420) 
[ 0.059420][ T0] ? __die (arch/x86/kernel/dumpstack.c:434) 
[ 0.059780][ T0] ? page_fault_oops (arch/x86/mm/fault.c:711) 
[ 0.060248][ T0] ? is_prefetch (arch/x86/mm/fault.c:119 arch/x86/mm/fault.c:132) 
[ 0.060672][ T0] ? kernelmode_fixup_or_oops (arch/x86/mm/fault.c:738) 
[ 0.061202][ T0] ? __bad_area_nosemaphore (arch/x86/mm/fault.c:785) 
[ 0.061710][ T0] ? bad_area_nosemaphore (arch/x86/mm/fault.c:834) 
[ 0.062185][ T0] ? do_user_addr_fault (arch/x86/mm/fault.c:?) 
[ 0.062678][ T0] ? trace_irq_disable (include/trace/events/preemptirq.h:36) 
[ 0.063149][ T0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 0.063595][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 0.064166][ T0] ? handle_exception (init_task.c:?) 
[ 0.064622][ T0] ? i2c_hid_irq (include/linux/pm_wakeup.h:213 drivers/hid/i2c-hid/i2c-hid-core.c:542 drivers/hid/i2c-hid/i2c-hid-core.c:556) 
[ 0.065042][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 0.065621][ T0] ? fdt_ro_probe_ (scripts/dtc/libfdt/libfdt.h:? lib/../scripts/dtc/libfdt/fdt.c:?) 
[ 0.066043][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 0.066624][ T0] ? fdt_ro_probe_ (scripts/dtc/libfdt/libfdt.h:? lib/../scripts/dtc/libfdt/fdt.c:?) 
[ 0.067049][ T0] fdt_path_offset_namelen (lib/../scripts/dtc/libfdt/fdt_ro.c:256) 
[ 0.067561][ T0] ? _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 0.068095][ T0] fdt_path_offset (lib/../scripts/dtc/libfdt/fdt_ro.c:300) 
[ 0.068502][ T0] fdt_scan_reserved_mem_reg_nodes (drivers/of/of_reserved_mem.c:192) 
[ 0.069054][ T0] ? copy_device_tree (drivers/of/fdt.c:1127) 
[ 0.069489][ T0] unflatten_device_tree (drivers/of/fdt.c:1243) 
[ 0.069940][ T0] unflatten_and_copy_device_tree (drivers/of/fdt.c:1262) 
[ 0.070441][ T0] x86_flattree_get_config (arch/x86/kernel/devicetree.c:313) 
[ 0.070908][ T0] setup_arch (arch/x86/kernel/setup.c:1100) 
[ 0.071284][ T0] ? vprintk (kernel/printk/printk_safe.c:?) 
[ 0.071632][ T0] ? _printk (kernel/printk/printk.c:2376) 
[ 0.071993][ T0] start_kernel (init/main.c:927) 
[ 0.072406][ T0] i386_start_kernel (arch/x86/kernel/head32.c:79) 
[ 0.072867][ T0] startup_32_smp (??:?) 
[    0.073307][    T0] Modules linked in:
[    0.073675][    T0] CR2: 0000000000000004
[    0.074063][    T0] ---[ end trace 0000000000000000 ]---
[ 0.074579][ T0] EIP: fdt_ro_probe_ (scripts/dtc/libfdt/libfdt.h:? lib/../scripts/dtc/libfdt/fdt.c:?) 
[ 0.075010][ T0] Code: 56 8b 30 03 12 31 c9 39 d6 19 c9 b8 01 00 00 00 39 d6 77 02 89 c8 5e 5d 31 c9 31 d2 c3 b9 ed ff ff ff a8 07 75 5e 55 89 e5 56 <8b> 50 04 8b 30 0f ce 81 fe 12 01 f2 2f 74 28 b9 f7 ff ff ff 81 fe
All code
========
   0:	56                   	push   %rsi
   1:	8b 30                	mov    (%rax),%esi
   3:	03 12                	add    (%rdx),%edx
   5:	31 c9                	xor    %ecx,%ecx
   7:	39 d6                	cmp    %edx,%esi
   9:	19 c9                	sbb    %ecx,%ecx
   b:	b8 01 00 00 00       	mov    $0x1,%eax
  10:	39 d6                	cmp    %edx,%esi
  12:	77 02                	ja     0x16
  14:	89 c8                	mov    %ecx,%eax
  16:	5e                   	pop    %rsi
  17:	5d                   	pop    %rbp
  18:	31 c9                	xor    %ecx,%ecx
  1a:	31 d2                	xor    %edx,%edx
  1c:	c3                   	retq   
  1d:	b9 ed ff ff ff       	mov    $0xffffffed,%ecx
  22:	a8 07                	test   $0x7,%al
  24:	75 5e                	jne    0x84
  26:	55                   	push   %rbp
  27:	89 e5                	mov    %esp,%ebp
  29:	56                   	push   %rsi
  2a:*	8b 50 04             	mov    0x4(%rax),%edx		<-- trapping instruction
  2d:	8b 30                	mov    (%rax),%esi
  2f:	0f ce                	bswap  %esi
  31:	81 fe 12 01 f2 2f    	cmp    $0x2ff20112,%esi
  37:	74 28                	je     0x61
  39:	b9 f7 ff ff ff       	mov    $0xfffffff7,%ecx
  3e:	81                   	.byte 0x81
  3f:	fe                   	.byte 0xfe

Code starting with the faulting instruction
===========================================
   0:	8b 50 04             	mov    0x4(%rax),%edx
   3:	8b 30                	mov    (%rax),%esi
   5:	0f ce                	bswap  %esi
   7:	81 fe 12 01 f2 2f    	cmp    $0x2ff20112,%esi
   d:	74 28                	je     0x37
   f:	b9 f7 ff ff ff       	mov    $0xfffffff7,%ecx
  14:	81                   	.byte 0x81
  15:	fe                   	.byte 0xfe


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240819/202408192157.8d8fe8a9-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

