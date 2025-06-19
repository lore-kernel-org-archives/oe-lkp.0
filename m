Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F00248868
	for <oe-lkp@lists.linux.dev>; Thu, 19 Jun 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318375; cv=fail; b=OvXqntmKG1H8WkVcQ2VEmJI5nNd4roP2MbRYEg+GMxMvZpY5+WLsFe2yT5ivORTNAbNuGhG6K1Dpg9RUU78hoeJ1o21MfTqTrBEEnSI53VI27ip1nibQKJpGtZiH1M9ruO9jQluTUlD87TBeWo6lt1CsvV4Gm80KF9QRReWllFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318375; c=relaxed/simple;
	bh=lnSzsyyfLsSgjjDnu3YOjBVeoyx+YhVlqGfsv7maDRU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jBl7DXlRg7d/i8PJafEYNzGAsgbV9T8meWSAeIcJBfHLvMiMpBY6ti17tDgv2B1wXLIHBqFBTthJJXC15h3W94OJR3vnp8SAVZrh2AJPwvYaJMuNXLo2aALBNxjZ5j+vK9B5jdbzBzOkoPHupiXwOkEFEXju8ctOWOeWMRtfVFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3zytePG; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3zytePG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750318373; x=1781854373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnSzsyyfLsSgjjDnu3YOjBVeoyx+YhVlqGfsv7maDRU=;
  b=E3zytePGXN0auBCz4VudYTwQ+wQsgiJ6TmhnzgcAzOLbE6ZOANlhIjB1
   fBUigLW60MYYjnSxHPgqLiOJobOT9qmnjOk5iWqDNPmjlflJsoQRRakv2
   VysOx8Jwcm6QXC94nq364oCK3+OqE83ozhRZ/zXrO4bNInJrRsSAENMwO
   1I9PQRGNIS0PrnXfRlhacqFdJ/lXvi+wextZkB2HmvE49iTpIYrJV3Hr2
   zXxJl0/3ASddBuXFbYLa2xwjjr/6Ifg/cBJoYVIbVSGBIcVIpg1U6m0iC
   QsEu8d8+SzSh9txC+fcQIxT7cbkMdJpPOrErnOmoyA6eOfTXyG5R2UYLL
   A==;
X-CSE-ConnectionGUID: QYyYTsrcQlqEXEwIjicOeA==
X-CSE-MsgGUID: cLzrhpGwQ2y7Ja77uN70xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56360360"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="56360360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 00:32:52 -0700
X-CSE-ConnectionGUID: 6OX4XQYDTXuInMXPD0i9Sw==
X-CSE-MsgGUID: kYl+GVcuQ66+3bx9WrFM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154500783"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 00:32:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 00:32:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 00:32:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 00:32:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVQQt0RiRPwRRYI7Xh7xe310IVd2NTbPvP6tumk5j/8D6QsXyhZ+q7nmfgTIrd6w95dbNTh6b2a/cjDVEYzb/xIqL9O0tRAeQB9zdXXWzVQa8JGnwPEmckFHf0R22T6/wTqWgjqFRevnhsBeQ377WlqVrNCQLMrpYH9ULoFuJ7GDigYTiPRMvsVfUbtoR+jVYh0SRhXFhZ3Sxqjd1AITVBDvBpH6aR4VwXDCcfT11i+ncdTnvp7ySnRHndVHSjCb1Gjonuiyks1ecGHZwffaTdRFoKV6zHRbkvmU0SkwFyjPrlnuGjhD8uFMWJE1QdVGFgGRONHcX0ZUQt+GgdM72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JamrIzR6cjJQuysrqnwIOGCVLEyad929il2bgtLpVDA=;
 b=ZIc7x6trwiMiAH/tFe96Yg4JqO9b4uRZ+KLDaaD//zxuDgtliyQAzOB1eLCyl1D4WCGi0n8sqBRCpkbZj71lUZk3/ZaUrSR+4e7mz5kstWMhHk5yEHclDbtlNKaQdeqcbhg3RE8k9L0RYLJzzPg8QemF6JuqlV+42AnzaTfGzMCdj8QMcQ7nTcdxXnElbptK+Qb/tdYK0hJeC3YdSYG4YNZ2IhVwJWBvsryAqfG8es7zEVTMDkn6iIFFM/VBtKtF7s4FoiiCy89qNB5PmnAaftsCb8M9hHBIPUmN2WPXCMquANt6rnkQcf8+KxZOBJemL+t3r5jMJj73oL0D0BbLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:32:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Thu, 19 Jun 2025
 07:32:22 +0000
Date: Thu, 19 Jun 2025 15:32:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, <maple-tree@lists.infradead.org>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [maple_tree]  540335e987:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202506191556.6bfc7b93-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b377359-6070-4686-8b72-08ddaf036dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mEP0zyjrcrgQ/39RaVkC3XGbpabFgMn3PTdsUohxTQgK+hsoMeBZGfYnHozM?=
 =?us-ascii?Q?oa0c+7uEWe9poTe1jaPJbE6S58vMB6LIyp+kg3MSAUr7O6u6R/LxBb3M4evs?=
 =?us-ascii?Q?8T5yGHiG0yIKHgzsMFl+ARmMGzot9a8j2++qRbd10gFylAIn9i97fQ+qVvlC?=
 =?us-ascii?Q?162h/HClInNwGVqLhEkTnnFxR2No8yDWrDnXr6enyn35Q1DOHBfh22a+tVrD?=
 =?us-ascii?Q?sSanvSRhzAUao54GEix26t3fDJ3RcUxaWpyC6ssvLnqG3++sA860PlJ6PcIt?=
 =?us-ascii?Q?UY1nbyD+aTYrIKZzAYx8Qu9YqpSlpYZv4r1I6bPUkXJrmDqAOJMLzFXMvNl5?=
 =?us-ascii?Q?1F+Oe7EUCbPXxYDmyzpBQm4aDCV3VyJyXsAy8VcuZ6BnLnfdnnEj+m3ngEfP?=
 =?us-ascii?Q?rAUonvZJLo4d9jqM5AYu4eesagLPtnX7OweN3OpacExAuj8ZDO2PmNCOS2N3?=
 =?us-ascii?Q?O+6G9ftcGP91zF3y86K5RSv/J6oqkVG2xlVI07IE4u+KkYN3CayRjtX7JYbr?=
 =?us-ascii?Q?W4RMX0eG3EjQmLrRt7roOJnONMAZaHt8nQgaDUwf8aHo+VYj46P3U2psUJxt?=
 =?us-ascii?Q?HFZ3sCbP30gCBTGsUiiKsvGx+TSSO4VnyI/9mXd0dOUrI9qz3EjoM4+jv62H?=
 =?us-ascii?Q?z4E0EI1JI+iMEMsLHNnEVSdRKYovZeXlyqRYNxTxm+JK9h3zJm5gnnjT2w5b?=
 =?us-ascii?Q?kvpCB+nhbFCDFzWSpvwsMguFomxrS7cwnjlr+xhAy/+8Y0WC5BfjGxhG5Fte?=
 =?us-ascii?Q?tzNMEp1urBfH0dRFbXU2LvZ23PgYulOAehK/LEVxlPdQsl0z8eM3YWVwneAB?=
 =?us-ascii?Q?mlF2029RvBb32xuiZjP5CvUSglXmJ677h7NlD+DhXYQafw5JACZF9bninT3k?=
 =?us-ascii?Q?+f0XQyIs2h3ubIHg/f983uvWCgRe2vXPUMkPHBqFAxmxajfyhVcubgx77LTY?=
 =?us-ascii?Q?YZXsDhex0u7JaGWoSbaWZupJ9yVGBPMxvC0vQWWbItF9X/Wi/mRzrh+z9n9l?=
 =?us-ascii?Q?M0vcx/GPzTKNCb83hpNmCLVRUEFZLGyGXdtCgqbUUMnaWcWhuexrBFqMI24E?=
 =?us-ascii?Q?k+WBiK9mLK9jQLdQ/PSap+84C2JedK/OfYIaRnsgh0bDGGWk+lFxqYU/5Mcz?=
 =?us-ascii?Q?K8+QR8t42GYPtSsxSkziuAiJvOXxk6FaqR46lBqopr56CQBjLbyEN3vbKFY6?=
 =?us-ascii?Q?HkbP5tuHDYTGydfvfOImPuO/QIYW2LhvyzOpLKUox1B9FYqcRx2cLozNYspj?=
 =?us-ascii?Q?UbaK5cHWhfuSZ91/sykZbo7PjOZiSPog1HwQ5kDvgI2ldEjddQBgYoY5JfTi?=
 =?us-ascii?Q?ot6r2Ilani+wwr+m+WAxCvgst4iWc9Wo8qdkgRqAQebd3Wbvo/TxR/k3us51?=
 =?us-ascii?Q?dH62g8MbdzFadQdlrBhUJd3e9CU6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9P1isMFrElVWVqUq0aezWDx7Aj63G4GoeLnGRUipOEX4Sc+BhGun2cgUZQp9?=
 =?us-ascii?Q?fO+IXweth/JOnx4Wvm+/lFau+nzJmYVB1MNkoGke/jxk5ubY4HKw/BlNYBIA?=
 =?us-ascii?Q?dztcU2vZA68CcBnbpXWvH1h7Mp0DjH7cKxGp701P5NxDq4mhZ1JUbyi2P1K+?=
 =?us-ascii?Q?l+9hHD7MMuIQnM5clVwpce6g88InidtBNEGM0CIOpqF85e+20u3euaV2y7TJ?=
 =?us-ascii?Q?uTVQy2rwVudUzFfu2plyboZ8x+FEprbnynwvS1PHgrwk1tKcWAbckQLXjVyM?=
 =?us-ascii?Q?Ii2bPNPUNBJQ7VoC9KGF3H8KgJekFuNScb+tXic3IQRyB02zUup+R+EZ/Rkx?=
 =?us-ascii?Q?WcQni8THhhL1UzROh6BNkg27JVeRZjg9IZ/eyAvP978JkYVAU5HMKpLDSdOd?=
 =?us-ascii?Q?SKo7Uh2Qtk84e3W+wZt3ULp2lAwB4qkS1MdNpYSY7a6xiDFBmuxMxp3dL+lM?=
 =?us-ascii?Q?4nOuhCS8stLetDo1cZuHW/Og+WDl06R0Yd94MApInxC6vLI2wtG/gvQrB3kf?=
 =?us-ascii?Q?lwh1JVsFHZbboammUh639NKUsIzPCaK3g2r/bS+CfMhlcNzDNQUj2AMh3HIV?=
 =?us-ascii?Q?TEGvn+hWvmygpv47T3Ly8x3rqjLjPXdXfA3QduXt7bXstndFw9nm5IKruMkM?=
 =?us-ascii?Q?Ypuz2GuwiDRhe+x9VR2stpgA1ASfeM3TnF1PSnLo9NpDGo9mIz3zCM+MJZTe?=
 =?us-ascii?Q?jdsNYO6+1GHlUCerDJQ/b2KNPRZJy8oGtnP0nmhSxTo3twhf5t0dPNvmOoYQ?=
 =?us-ascii?Q?REqX4adq2Y/YOcJcno7WVQ8bBe92VV/VPPqLFL5IaDP1kVe64g2f2jfFPQ9s?=
 =?us-ascii?Q?1bIWzgxJXBKBTo7ya2Xk5HK7sEWtikDanbc1Iv6Gfx62xeR2WfedaLAzuaT8?=
 =?us-ascii?Q?gfVuxvB6JIAonuSXTbTINEZt+L70z80H66pvp89Xor6fjJzHSaK+VgwwpCP6?=
 =?us-ascii?Q?InU+B/z5d/42TJ9PbkOLNOZON/JzEfzn5Ixz3GIvJG5w0gl+aGF8oGdXmoI5?=
 =?us-ascii?Q?9AQbCMOs48akoYfcgQxoQlckeSzm4U1sihQQ1KihsWFc49DDTx1jzZAjJopH?=
 =?us-ascii?Q?YzgqKSlybU0mraqJ67m7GOM1XYbUV04D08IXpeYhl3NzhRHmOz8MHw9gOuUv?=
 =?us-ascii?Q?NEtvqqMsJu8BKj3Uaa354vi0dCWkF86ZQCJaHN+60Y0Um1Dcs+d766JAYW9A?=
 =?us-ascii?Q?EvUgKzw3ft66nRd94XZMpjH2B9Zd3KH6eYysXgrV+qH2LGzHe/yuwPeqy4mJ?=
 =?us-ascii?Q?vXi7CaO3rrluVn9Nrt4vDEvm+kvOEW73Vb4kYLeRq2Sa0uE+xz7VXxm5HQHl?=
 =?us-ascii?Q?NP1s7D49j1DC1HB0wGvKsJ3kKETrLtW0ABU1jtbkKc0gee2MaJiKBKJRPlz2?=
 =?us-ascii?Q?hCxdeE9qxbY4CtAJH+60PaW0uwu+pda1kKhwvlCXNvEntWuS7d68i820UCRc?=
 =?us-ascii?Q?EUqIDbxCftLaNAFyhCngX1TL6OR0/360QKDoQH18Wf+roFqHKGvkxbfsnlXj?=
 =?us-ascii?Q?zTvU3pfyxCiwatpINU3Y1rf7/mzYETpvfFPvvIc8GFr4shFS9hU3ZtbCMxBw?=
 =?us-ascii?Q?kHpxqudJIupqNLa+5M56VIUS7HsEUH9meXgef38OWNSV7t0TPX0KroIFDTLM?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b377359-6070-4686-8b72-08ddaf036dc6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:32:22.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNbuD6GOQL7zXHgSXn+T6/ZbNTQeVeyXqlHQVWjIg9fnMRW9lkBMea3Y1KYQg+JHMjZUqJHY3k9BI6tgbWP0pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 540335e9878005bf238ab4e1f91e8df0e3091a03 ("maple_tree: restart walk on correct status")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 6e5ab6fee68df8c40b338baeae6e269fa25a7e25]

in testcase: trinity
version: trinity-x86_64-ba2360ed-1_20241228
with following parameters:

	runtime: 600s



config: x86_64-randconfig-008-20250618
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------------------------+------------+------------+
|                                                                                      | cedafc1185 | 540335e987 |
+--------------------------------------------------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address                                          | 0          | 6          |
| Oops                                                                                 | 0          | 6          |
| RIP:mtree_range_walk                                                                 | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception                                             | 0          | 6          |
+--------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506191556.6bfc7b93-lkp@intel.com


[   85.005305][ T5293] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   85.006027][ T5293] #PF: supervisor read access in kernel mode
[   85.006448][ T5293] #PF: error_code(0x0000) - not-present page
[   85.006895][ T5293] PGD 156b29067 P4D 156b29067 PUD 0
[   85.007264][ T5293] Oops: Oops: 0000 [#1] SMP
[   85.007587][ T5293] CPU: 1 UID: 65534 PID: 5293 Comm: trinity-c7 Not tainted 6.16.0-rc2-00111-g540335e98780 #1 PREEMPT(full)  36afef0ad633c67fb03a70379195b878849f7042
[ 85.008687][ T5293] RIP: 0010:mtree_range_walk (lib/maple_tree.c:2773) 
[ 85.010012][ T5293] Code: 89 45 a0 e8 4d d8 86 ff 48 8b 45 a0 48 39 45 c0 74 18 49 83 fc 03 76 0f 4c 89 e6 48 c7 c7 a0 8d 3e 9c e8 c2 85 b1 ff 45 89 ef <4d> 8b 2e 48 8b 53 08 49 39 d5 73 32 49 8d 46 08 41 b4 01 45 38 fc
All code
========
   0:	89 45 a0             	mov    %eax,-0x60(%rbp)
   3:	e8 4d d8 86 ff       	call   0xffffffffff86d855
   8:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   c:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
  10:	74 18                	je     0x2a
  12:	49 83 fc 03          	cmp    $0x3,%r12
  16:	76 0f                	jbe    0x27
  18:	4c 89 e6             	mov    %r12,%rsi
  1b:	48 c7 c7 a0 8d 3e 9c 	mov    $0xffffffff9c3e8da0,%rdi
  22:	e8 c2 85 b1 ff       	call   0xffffffffffb185e9
  27:	45 89 ef             	mov    %r13d,%r15d
  2a:*	4d 8b 2e             	mov    (%r14),%r13		<-- trapping instruction
  2d:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  31:	49 39 d5             	cmp    %rdx,%r13
  34:	73 32                	jae    0x68
  36:	49 8d 46 08          	lea    0x8(%r14),%rax
  3a:	41 b4 01             	mov    $0x1,%r12b
  3d:	45 38 fc             	cmp    %r15b,%r12b

Code starting with the faulting instruction
===========================================
   0:	4d 8b 2e             	mov    (%r14),%r13
   3:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   7:	49 39 d5             	cmp    %rdx,%r13
   a:	73 32                	jae    0x3e
   c:	49 8d 46 08          	lea    0x8(%r14),%rax
  10:	41 b4 01             	mov    $0x1,%r12b
  13:	45 38 fc             	cmp    %r15b,%r12b
[   85.011432][ T5293] RSP: 0018:ffffb56182fffd88 EFLAGS: 00010246
[   85.011917][ T5293] RAX: 0000000000000000 RBX: ffffb56182fffe80 RCX: 0000000000000000
[   85.012541][ T5293] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   85.013167][ T5293] RBP: ffffb56182fffdf0 R08: 0000000000000000 R09: 0000000000000000
[   85.013806][ T5293] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000fff
[   85.014420][ T5293] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   85.015039][ T5293] FS:  00007f93d413a740(0000) GS:ffff922b1356c000(0000) knlGS:0000000000000000
[   85.015721][ T5293] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   85.016227][ T5293] CR2: 0000000000000000 CR3: 000000016d4f8000 CR4: 00000000000406b0
[   85.016837][ T5293] DR0: 00007f93d220d000 DR1: 0000000000000000 DR2: 0000000000000000
[   85.017464][ T5293] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
[   85.018096][ T5293] Call Trace:
[   85.018359][ T5293]  <TASK>
[ 85.018588][ T5293] ? mmap_write_lock (include/linux/seqlock.h:431 include/linux/mmap_lock.h:87 include/linux/mmap_lock.h:357) 
[ 85.018970][ T5293] mas_state_walk (lib/maple_tree.c:3630) 
[ 85.019311][ T5293] mas_walk (lib/maple_tree.c:279 lib/maple_tree.c:4937) 
[ 85.019619][ T5293] mas_find (lib/maple_tree.c:5990 lib/maple_tree.c:6044) 
[ 85.019967][ T5293] vma_find (include/linux/mm.h:856) 
[ 85.020288][ T5293] __do_sys_set_mempolicy_home_node (mm/mempolicy.c:1723) 
[ 85.020764][ T5293] __x64_sys_set_mempolicy_home_node (mm/mempolicy.c:1688) 
[ 85.021229][ T5293] x64_sys_call (kbuild/obj/consumer/x86_64-randconfig-008-20250618/./arch/x86/include/generated/asm/syscalls_64.h:451) 
[ 85.021592][ T5293] do_syscall_64 (arch/x86/entry/syscall_64.c:96) 
[ 85.021973][ T5293] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   85.022454][ T5293] RIP: 0033:0x7f93d423e719
[ 85.022822][ T5293] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[   85.024289][ T5293] RSP: 002b:00007ffd10d04c48 EFLAGS: 00000246 ORIG_RAX: 00000000000001c2
[   85.024897][ T5293] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f93d423e719
[   85.025466][ T5293] RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
[   85.026060][ T5293] RBP: 00007f93d2b43058 R08: 0000000000000001 R09: 0000000000002000
[   85.026652][ T5293] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000001c2
[   85.027238][ T5293] R13: 00007f93d413a6c0 R14: 00007f93d2b43058 R15: 00007f93d2b43000
[   85.027870][ T5293]  </TASK>
[   85.028106][ T5293] Modules linked in: polyval_clmulni ghash_clmulni_intel sha512_ssse3 sha1_ssse3 crypto_hash aesni_intel gf128mul libaes aead crypto_skcipher cryptomgr crypto_algapi crypto evdev qemu_fw_cfg
[   85.029570][ T5293] CR2: 0000000000000000
[   85.030009][ T5293] ---[ end trace 0000000000000000 ]---
[ 85.037300][ T5293] RIP: 0010:mtree_range_walk (lib/maple_tree.c:2773) 
[ 85.037762][ T5293] Code: 89 45 a0 e8 4d d8 86 ff 48 8b 45 a0 48 39 45 c0 74 18 49 83 fc 03 76 0f 4c 89 e6 48 c7 c7 a0 8d 3e 9c e8 c2 85 b1 ff 45 89 ef <4d> 8b 2e 48 8b 53 08 49 39 d5 73 32 49 8d 46 08 41 b4 01 45 38 fc
All code
========
   0:	89 45 a0             	mov    %eax,-0x60(%rbp)
   3:	e8 4d d8 86 ff       	call   0xffffffffff86d855
   8:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   c:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
  10:	74 18                	je     0x2a
  12:	49 83 fc 03          	cmp    $0x3,%r12
  16:	76 0f                	jbe    0x27
  18:	4c 89 e6             	mov    %r12,%rsi
  1b:	48 c7 c7 a0 8d 3e 9c 	mov    $0xffffffff9c3e8da0,%rdi
  22:	e8 c2 85 b1 ff       	call   0xffffffffffb185e9
  27:	45 89 ef             	mov    %r13d,%r15d
  2a:*	4d 8b 2e             	mov    (%r14),%r13		<-- trapping instruction
  2d:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  31:	49 39 d5             	cmp    %rdx,%r13
  34:	73 32                	jae    0x68
  36:	49 8d 46 08          	lea    0x8(%r14),%rax
  3a:	41 b4 01             	mov    $0x1,%r12b
  3d:	45 38 fc             	cmp    %r15b,%r12b

Code starting with the faulting instruction
===========================================
   0:	4d 8b 2e             	mov    (%r14),%r13
   3:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   7:	49 39 d5             	cmp    %rdx,%r13
   a:	73 32                	jae    0x3e
   c:	49 8d 46 08          	lea    0x8(%r14),%rax
  10:	41 b4 01             	mov    $0x1,%r12b
  13:	45 38 fc             	cmp    %r15b,%r12b


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250619/202506191556.6bfc7b93-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

