Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38BA7A141
	for <oe-lkp@lists.linux.dev>; Wed, 24 Jul 2024 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721809555; cv=fail; b=uCxmMqdPth5LDMRILS4afoXHjvPwIASxpAE5SM0r8FOy+ihXQAk4Q6ieCMhGsUxKyuU6N3BJncMM1YE/1yHo2z/JVs+YJUah2iVUX/Cj7OagcBEnoTwihEHKphFJzU2w/jwwCuBg68ta1CKo8Z9hE7zfz4yNRXvw7clgED9lsks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721809555; c=relaxed/simple;
	bh=igQqKXDpjSA6/vBrtRd3zUccAcFJa2MWNJMTsuiCkoQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=o0CWOZN8ooD0aWKVCyFaJS6HyGVRIRyi6LGek+CLwR5EcN9pXIXqjjKwDfjMHR/xpV/ImBqrG7gumBrW1YpT9a8ZH4XexP8mmsu8v/7gz55Mq1bQmg3UNzQIHVgcHtIHRRh+e4C4Se3A2b81Iy4pkN4uis2lXMWub8Eq2nHvvU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/skB3Q4; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/skB3Q4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721809552; x=1753345552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igQqKXDpjSA6/vBrtRd3zUccAcFJa2MWNJMTsuiCkoQ=;
  b=H/skB3Q4W3qCQAXXnLK03Bjz8heFUfNDLMgupIK9mrtv6a15uKLPeuW4
   5V34Hy8O3eb8r4EGd2dFhkmyHxz8v05ZzKPmVmj2mJpUecmBFpPvizdr7
   XnmlTyc05LiXZyoLu5TROOzOOJ8g5HQr3r2f/d5mf/q270n7qhXLKWp4O
   eOqVd2e+cCGsnEL8PnIbReGnlvsOei4qqsVVs0JvE3fFawfJvxuV1tcuC
   FtJELeZwMP9haV8X8LSklGYn+EvHmIQxJv+daSqUBPdascpYd8sC+JdAI
   vNxZEAljH9kgroDCKScK8H/lX4Kfdr1N4Cy7y1uPL5bHWKW5w1WZ6mwLd
   Q==;
X-CSE-ConnectionGUID: g735mHefSmSEN39q2cDt6g==
X-CSE-MsgGUID: YVlBCYxfSxawdtPKsrxYFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19435762"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19435762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 01:25:52 -0700
X-CSE-ConnectionGUID: sGc2msdpS5iKrv8pJPahxw==
X-CSE-MsgGUID: ZobjYaI4TV25kWmE2bsugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="57320007"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jul 2024 01:25:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 01:25:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 01:25:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 01:25:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHPD/pPgjDdHusHsyQbfSc3MORARNWZgaJMxIWOSJ+tTU6SelcUZ+YvfOMtshs5TRuNN0e0m1c4BK3iY3h40bpH3yGovIONHYFmd/J6ItCPdM3HvRpnQPPKhC+zb63yjLFTpWepKAZpsxTQ42dJiAczaOLhgodkn5ob3Wg+W8hyDf2ysZ6JD1eyQpGgIYAYWBQC64iwLd3l3Mf9znAnAfgeRgppX0nVRLHmSk1NNlf8BeHVa/6y09amXHbae2mRU12YtvWoQ6rv0ZgauXmgNl365x59UuZRYtAa3CZW/fNxpUOxsc3p86gBLNBBSQmHhhBRCqfHa4DBU3aCVHjHo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTRMSV8t03YCcKA9CInLoYXgFHQbUws1Zu2obKuaGnE=;
 b=ObqkdaV4X6i+8vd4YC1Wkge/DUmvRuxFTzX8MwEMJS6V/iOAzVrA7XHNfDbzJj9DqqhOx5mZKtm+TSWPWvZs447waZiQCIlLmV9/GnddIq0skyTF5KC8qHu3BWJ/Tl6yQR0nzB5PZtMKruiCQhxIfCKyEtso58fMyGUj+ig1bdiCOmHVlrn8jGT5/FhQxoRAb4D4CQsL2UZMYKANRDuhCGO4CtF10qKsYyRz08HkpB1mplUGXgC8Q91vUTRaeQZfyJztraCH3TdmJ3ZKnBBaOX+Wo9XgQqC1YjAMqVDvyNAaLzhGBRTcNTsxgS2C0Zt0EcE/aQgEm6ge5M1zhhRgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 08:25:42 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7762.027; Wed, 24 Jul 2024
 08:25:42 +0000
Date: Wed, 24 Jul 2024 16:25:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<maple-tree@lists.infradead.org>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-sheaves-v1r1] [maple_tree] 7b59fb4e4f:
 WARNING:at_lib/debugobjects.c:#debug_print_object
Message-ID: <202407241540.e3e27bab-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 77005b7f-9e59-4408-3800-08dcabba34d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jp9/eEPiqRZXMF1Oh90JRTbP0HgTt/kXCAW1HtSaOK9saqQwe80vkLi8rBbk?=
 =?us-ascii?Q?AWr7wWy6PNovylsXsn4x9sm7ND0iiGFo0qx/xM49/Yxh1J5WHHEXFbXtrIyi?=
 =?us-ascii?Q?XJdec/Swpuqww6Z/qVsDSiw2Ewas1bXDrQQyOYEBBUzNktgselGt8DEn8xKr?=
 =?us-ascii?Q?b9BpURoefYrEvTM0mAtv1bIaWGDTc7GUuKDlVWbo6dM6i+C5/PEqS76zUmcK?=
 =?us-ascii?Q?j7YUOhpL+6JM5bqMlrfAmB4+fOpgf+pe2jCoqrxdE7v/Xeiw3/BaXe/4kbzD?=
 =?us-ascii?Q?WHBMDPzNEVyQsIQeDyinGbaxrHwCb2OoAxo6qblExcP+d15rMeiMLoYea0XN?=
 =?us-ascii?Q?NFaD/G7QRW4u/awACOOASRPHPG0uxnc9HIajhte7MiJU8qDGORnw5DfKD6sa?=
 =?us-ascii?Q?xIDWl57RC1FJ1qOV6w8nbYAyZ/D+6YJxAnruRO1G4Ztny0sASxkZ8cFvFLBF?=
 =?us-ascii?Q?ZP5PQI528jhtbiYUsrFGngOXiNUXImO2kzCp5l+2l00P8UYVLOLcV3MRaXSC?=
 =?us-ascii?Q?14acwlZGgGySkZmN/RhalzGXj2WyqL0P1JQ30eyCYwNpgY2+4VBGbWohboKx?=
 =?us-ascii?Q?TPNya3XmJQI53oUdKHm/UQxxIMHGIzLsTvNULgDuaWqNYNuGoCuSA1hJUXuD?=
 =?us-ascii?Q?LEfxkUuSyVLvk0rOYsPzRzGm7FvqxdkZs1w+qsKHwoQk9spxHjtb+iomffm0?=
 =?us-ascii?Q?8+20sYbb3iGl5zz1BznoqLBzsssZWPRUUD2mHouEpw85CyjNQmvyWFdxMe9j?=
 =?us-ascii?Q?YkQ6tuTDHq2bjtJ4ectic3OVU5s+LIeqEi4zMg8b47IipMKA3bmtcKUg9LYT?=
 =?us-ascii?Q?Anu1BD9BFbOf0YRomptpCNe+IZjrxHwcicaUdnQnN5L0wXqk01tTvs/OD7Mb?=
 =?us-ascii?Q?2t51ZnupJU+Ltz/ph6xkg18/Rwn86gdFHaTo+s05pl5yxXhWfzASORb+IPbu?=
 =?us-ascii?Q?9K/Hyc0MTCfUdMTRvG1Pql4j2Ue6WKszJzujL3qm4+hMmuL9478eQLYGTfKC?=
 =?us-ascii?Q?d2f9MbBRwDIWRjwELXJgouTsuDL3fYgEFV8XA2x9OIrIaV5SgsDRdaPnztzK?=
 =?us-ascii?Q?jTZYaKBCIbmqCAlWSRLvaKOr5cfqRLzXaV4KFLMAmrh9g5KVEkgEgBjTVxUR?=
 =?us-ascii?Q?bUzZ53l+go5Rvn3dm/a21lz1LA3Ju8VWShMTYaVPnFo8nHGUe9NSBwdYS0GW?=
 =?us-ascii?Q?vhjl+LAKWPZNmTrfZf7wVZz/eJJyHdHbluR3j0ffr2TVtflD0dCr0v++ap9A?=
 =?us-ascii?Q?+roBcmtis+m21xXxdQv0j2zNYNMaxaf0kSyxg6GGa+kZqVA6O9RRNU4xnfnA?=
 =?us-ascii?Q?PTDa2OOukvqUG0heMWMuAH3S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wCzsOENLLmaRJ80OKk4KZoN60KLDHNx1rfoGFXwJR7LFIRgccHD9khokioFT?=
 =?us-ascii?Q?GYJWzxmOliypRKeARKs8WmFiE0VgyD8VwoGQ3TNacjie8k0gB6OHVDBuVh2q?=
 =?us-ascii?Q?3p3bjXRPasJEDY3ZyGXEhgZQ6Mh4wEsQega4Jr8u1eL9CEXHtjvvODBxJk65?=
 =?us-ascii?Q?fEw9OXb4h9UUFLKECOHeSoV7x+aAuDqrPQ6DWeXuduFIckJFfawfAVJoJRlT?=
 =?us-ascii?Q?C+EZYebTT/I38wLFxXcSPyGFAreDKbjg0DK7GuTxIDauygg0KUGDoWt/GNVw?=
 =?us-ascii?Q?/SSDZIrt8TxvSFphfTn/2gtQAS0AllPQF6ZgfbiD+9lLxGVo0QWI1/kkQckO?=
 =?us-ascii?Q?cIgJy0Rbj+Yrqt+Q+exq69AusXG8upGnZaQqlro4Kl2btef5sFelpgYmYS9g?=
 =?us-ascii?Q?0tm/0Oul3HnUfC+SG0uv8yr24dvLKlfau8bCRg69tIb1Z3cpXo1N3SYgTe4V?=
 =?us-ascii?Q?mUf2mLsrEgoXZ4FSTcI2tjRD9Zl5LpKTEy5CEu5GhQND3Yi0jm3s5eJuyqTV?=
 =?us-ascii?Q?Oq8Thf6nq5DR56cgcyWuY/uHoR/ef3W/XrSbH1KYfMJMfjY+/VDELyhdR5Hy?=
 =?us-ascii?Q?ct8EsoXjpfAwbsPnHX/z58zkjdGa9ufs4QimhmW3Tx/F8GEoeFdnt1MXDLAw?=
 =?us-ascii?Q?7qRXYsXb+jcooHnEd5/PH0wP4gC0lIIWw2kFU2lSin0PSkmWfObJk5F1uGv4?=
 =?us-ascii?Q?bvuxGS/7XLyX/JneDugYh4JX4iU1Y5JsDbJ/s1epbYKoyyu5jcLBWaqJts9H?=
 =?us-ascii?Q?Reue3naJ+ON/A0Y+4HBaeq4yFJ6133mJx7qhZoJsOmd19RmCiNCUfuFhw4Yg?=
 =?us-ascii?Q?XItASvNZpA2y0zetEOuPGcomg1tK+OK9WdSZo7l9qTS+8p7LuQy9xBS/d83+?=
 =?us-ascii?Q?VT0qxAo4ErX0jc3rvHIbo4T4joxc4JbbOcGX2tpo0BHcNpOZfDQtS1LL21vA?=
 =?us-ascii?Q?u/Wl9kdO7NdLMcmLRcjuqrBLT30p9i/+jASwoQcDlfcIro9/KbndqtQqgoks?=
 =?us-ascii?Q?8j0E4OcpLqNoMR2y/0CsfXyJPzAS+VL/XmoQpWCp5ZP2CklpuNRNjXDgiZQ5?=
 =?us-ascii?Q?txGFZ+s4S6wHUBN3eZMiv5z38k5dFTP6M+jl6J06TSLz5rGQkaOrMhm3Pnty?=
 =?us-ascii?Q?PFTHOgTAOm0OWJf52PgP+zbvWjaSztu0KVAunelSDhLtC+ZQe328ooAB4fK4?=
 =?us-ascii?Q?kDrRpowLzl1s26d6jS1EzaHZAd2N0I+jwJyBTRNdKgCpx62uAA3K/xYU2fxp?=
 =?us-ascii?Q?J2zkRAB+rGnnu/LDGvCFhCzDVFT1273OMk1a6AUlAvXaDUJauo4wAHGmFGtt?=
 =?us-ascii?Q?Kt3uNJ3jOyNqZzgRDfpbN3SSbdTngTMmt6tOfUKh9kWrwDRDKEHyC+G45ANG?=
 =?us-ascii?Q?qXdrnLk/l/Pr1+q/fDo/p+3RT+8HmB873eEUcM1FnvURr1cIC+pznswQU7Xm?=
 =?us-ascii?Q?tFXenIwsJ0BuPpA9HUTDWTJYrGMKZZrbJtRBgva1HaKSEzr7XQ4IUz6i2pLH?=
 =?us-ascii?Q?QiqgLacEHUgYRNE1KgV0/8wqY2P5peMmVGAZ84RXW2BVGujTWbWibsPUK0vO?=
 =?us-ascii?Q?X2sx3miW/PIdr0btu/PCcQ3DsbTiKE3rGedVt9821EF8izFChf6RyhDmNawl?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77005b7f-9e59-4408-3800-08dcabba34d2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 08:25:42.1283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P67E/rFoo/iD+d4QCj460f7ZbcvxuPimhSlTcmnlalvJsk9f3VIyGpvw/0soW0mdduQDDStH14dAsTbXc2KFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_lib/debugobjects.c:#debug_print_object" on:

commit: 7b59fb4e4fe7542ba1360cb804b62b72d72edf36 ("maple_tree: use percpu sheaves for maple_node_cache")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r1

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 721996749f | 7b59fb4e4f |
+---------------------------------------------------+------------+------------+
| WARNING:at_lib/debugobjects.c:#debug_print_object | 0          | 6          |
| RIP:debug_print_object                            | 0          | 6          |
| WARNING:at_kernel/rcu/tree.c:#kvfree_call_rcu     | 0          | 6          |
| RIP:kvfree_call_rcu                               | 0          | 6          |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407241540.e3e27bab-lkp@intel.com


[   48.462124][  T136] ------------[ cut here ]------------
[   48.462654][  T136] ODEBUG: activate active (active state 1) object: ffff888171f5d900 object type: rcu_head hint: 0x0
[ 48.463489][ T136] WARNING: CPU: 0 PID: 136 at lib/debugobjects.c:517 debug_print_object (lib/debugobjects.c:514) 
[   48.464448][  T136] Modules linked in: intel_agp intel_gtt ppdev tiny_power_button processor parport_pc button evbug evdev fuse qemu_fw_cfg
[   48.465997][  T136] CPU: 0 PID: 136 Comm: cron Not tainted 6.10.0-rc1-00010-g7b59fb4e4fe7 #1
[ 48.467033][ T136] RIP: 0010:debug_print_object (lib/debugobjects.c:514) 
[ 48.467764][ T136] Code: 4c 89 ff e8 39 71 b7 ff 4d 8b 0f 48 c7 c7 80 4d 99 83 48 8b 34 24 4c 89 ea 89 e9 4d 89 f0 41 54 e8 dc fa 5a ff 48 83 c4 08 90 <0f> 0b 90 90 ff 05 91 98 ea 02 48 83 c4 08 5b 41 5c 41 5d 41 5e 41
All code
========
   0:	4c 89 ff             	mov    %r15,%rdi
   3:	e8 39 71 b7 ff       	call   0xffffffffffb77141
   8:	4d 8b 0f             	mov    (%r15),%r9
   b:	48 c7 c7 80 4d 99 83 	mov    $0xffffffff83994d80,%rdi
  12:	48 8b 34 24          	mov    (%rsp),%rsi
  16:	4c 89 ea             	mov    %r13,%rdx
  19:	89 e9                	mov    %ebp,%ecx
  1b:	4d 89 f0             	mov    %r14,%r8
  1e:	41 54                	push   %r12
  20:	e8 dc fa 5a ff       	call   0xffffffffff5afb01
  25:	48 83 c4 08          	add    $0x8,%rsp
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	ff 05 91 98 ea 02    	incl   0x2ea9891(%rip)        # 0x2ea98c5
  34:	48 83 c4 08          	add    $0x8,%rsp
  38:	5b                   	pop    %rbx
  39:	41 5c                	pop    %r12
  3b:	41 5d                	pop    %r13
  3d:	41 5e                	pop    %r14
  3f:	41                   	rex.B

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	90                   	nop
   4:	ff 05 91 98 ea 02    	incl   0x2ea9891(%rip)        # 0x2ea989b
   a:	48 83 c4 08          	add    $0x8,%rsp
   e:	5b                   	pop    %rbx
   f:	41 5c                	pop    %r12
  11:	41 5d                	pop    %r13
  13:	41 5e                	pop    %r14
  15:	41                   	rex.B
[   48.470027][  T136] RSP: 0018:ffffc9000105f2e8 EFLAGS: 00010286
[   48.470784][  T136] RAX: ffffffff81167f7f RBX: dffffc0000000000 RCX: ffff8881720ca9c0
[   48.471718][  T136] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff844e1270
[   48.472687][  T136] RBP: 0000000000000001 R08: ffffffff844e1273 R09: 1ffffffff089c24e
[   48.473612][  T136] R10: dffffc0000000000 R11: fffffbfff089c24f R12: 0000000000000000
[   48.474563][  T136] R13: ffffffff83994f00 R14: ffff888171f5d900 R15: ffffffff8345e2c0
[   48.475499][  T136] FS:  0000000000000000(0000) GS:ffffffff8408f000(0000) knlGS:0000000000000000
[   48.476563][  T136] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   48.477329][  T136] CR2: 00007fbe470c4790 CR3: 0000000176132000 CR4: 00000000000406b0
[   48.478250][  T136] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   48.479206][  T136] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   48.480141][  T136] Call Trace:
[   48.480566][  T136]  <TASK>
[ 48.480935][ T136] ? __warn (kernel/panic.c:239) 
[ 48.481460][ T136] ? debug_print_object (lib/debugobjects.c:514) 
[ 48.482092][ T136] ? report_bug (lib/bug.c:?) 
[ 48.482697][ T136] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 48.483222][ T136] ? exc_invalid_op (arch/x86/kernel/traps.c:260) 
[ 48.483814][ T136] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 48.484438][ T136] ? __warn_printk (include/linux/context_tracking.h:155) 
[ 48.485022][ T136] ? debug_print_object (lib/debugobjects.c:514) 
[ 48.485668][ T136] debug_object_activate (lib/debugobjects.c:?) 
[ 48.486321][ T136] kvfree_call_rcu (kernel/rcu/rcu.h:227 kernel/rcu/tree.c:3773) 
[ 48.486946][ T136] mas_wr_modify (lib/maple_tree.c:?) 
[ 48.487578][ T136] ? stack_depot_save_flags (lib/stackdepot.c:609) 
[ 48.488296][ T136] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
[ 48.488884][ T136] ? kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68) 
[ 48.489473][ T136] ? __kasan_slab_alloc (mm/kasan/common.c:341) 
[ 48.490077][ T136] ? kmem_cache_alloc_noprof (include/linux/kasan.h:201 mm/slub.c:4356 mm/slub.c:4587 mm/slub.c:4594) 
[ 48.490795][ T136] ? mmap_region (mm/mmap.c:2952) 
[ 48.491373][ T136] ? do_mmap (mm/mmap.c:1398) 
[ 48.491924][ T136] ? vm_mmap_pgoff (mm/util.c:573) 
[ 48.492499][ T136] ? elf_load (fs/binfmt_elf.c:?) 
[ 48.493024][ T136] ? load_elf_binary (fs/binfmt_elf.c:1132) 
[ 48.493638][ T136] ? bprm_execve (fs/exec.c:1797) 
[ 48.494211][ T136] ? do_execveat_common (fs/exec.c:1998) 
[ 48.494851][ T136] ? __x64_sys_execve (fs/exec.c:2072 fs/exec.c:2148 fs/exec.c:2143 fs/exec.c:2143) 
[ 48.495429][ T136] ? do_syscall_64 (arch/x86/entry/common.c:?) 
[ 48.495992][ T136] ? entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[ 48.496761][ T136] ? mas_wr_walk_descend (lib/maple_tree.c:? lib/maple_tree.c:3573) 
[ 48.497396][ T136] ? mas_wr_walk (lib/maple_tree.c:?) 
[ 48.497932][ T136] ? mas_wr_end_piv (lib/maple_tree.c:4067) 
[ 48.498564][ T136] ? mas_wr_store_entry (lib/maple_tree.c:?) 
[ 48.499210][ T136] mas_store_prealloc (include/linux/maple_tree.h:548) 
[ 48.499874][ T136] mmap_region (mm/mmap.c:2958) 
[ 48.500496][ T136] do_mmap (mm/mmap.c:1398) 
[ 48.501032][ T136] vm_mmap_pgoff (mm/util.c:573) 
[ 48.501633][ T136] elf_load (fs/binfmt_elf.c:?) 
[ 48.502175][ T136] load_elf_binary (fs/binfmt_elf.c:1132) 
[ 48.502821][ T136] ? load_elf_binary (fs/binfmt_elf.c:?) 
[ 48.503468][ T136] bprm_execve (fs/exec.c:1797) 
[ 48.504087][ T136] do_execveat_common (fs/exec.c:1998) 
[ 48.504722][ T136] __x64_sys_execve (fs/exec.c:2072 fs/exec.c:2148 fs/exec.c:2143 fs/exec.c:2143) 
[ 48.505309][ T136] do_syscall_64 (arch/x86/entry/common.c:?) 
[ 48.505891][ T136] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   48.506649][  T136] RIP: 0033:0x7fbe46ee4a17
[ 48.507204][ T136] Code: Unable to access opcode bytes at 0x7fbe46ee49ed.

Code starting with the faulting instruction
===========================================
[   48.508094][  T136] RSP: 002b:00007ffdccfdf008 EFLAGS: 00000202 ORIG_RAX: 000000000000003b
[   48.509076][  T136] RAX: ffffffffffffffda RBX: 000056370a8ab230 RCX: 00007fbe46ee4a17
[   48.510011][  T136] RDX: 000056370a807780 RSI: 000056370a8ab230 RDI: 000056370a8a6900
[   48.510962][  T136] RBP: 00007ffdccfdf2d0 R08: 00007fbe46fe2c60 R09: 000056370a80c7e0
[   48.511901][  T136] R10: 000056370a787200 R11: 0000000000000202 R12: 00007ffdccfdf0cc
[   48.512793][  T136] R13: 00000000ffffffff R14: 00007ffdccfdf550 R15: 000056370a7ec560
[   48.513756][  T136]  </TASK>
[   48.514149][  T136] irq event stamp: 3365
[ 48.514667][ T136] hardirqs last enabled at (3375): console_unlock (kernel/printk/printk.c:341 arch/x86/include/asm/irqflags.h:127 kernel/printk/printk.c:341 kernel/printk/printk.c:2746 kernel/printk/printk.c:3065) 
[ 48.515701][ T136] hardirqs last disabled at (3382): console_unlock (kernel/printk/printk.c:339 kernel/printk/printk.c:2746 kernel/printk/printk.c:3065) 
[ 48.516417][ T136] softirqs last enabled at (3330): __irq_exit_rcu (include/linux/sched.h:2189 kernel/softirq.c:620 kernel/softirq.c:639) 
[ 48.517085][ T136] softirqs last disabled at (3319): __irq_exit_rcu (include/linux/sched.h:2189 kernel/softirq.c:620 kernel/softirq.c:639) 
[   48.517749][  T136] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240724/202407241540.e3e27bab-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

