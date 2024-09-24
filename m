Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596361E481
	for <oe-lkp@lists.linux.dev>; Tue, 24 Sep 2024 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727181792; cv=fail; b=jYi4yy7PcR2PMHCk76JNAK5jSpvK87w0Dtp+jl6WJrQFsFDj92WlnPKrhidT6guPJpowcUQeN3yjuCw98x+pZ9xEArenFcTbD67hMDFId6hmIJ5gsUwIWw2pPhlZcopi5iOseEw+Dnsgw1/gnml9hV8Ug2zl17ijzxKgSMw9Hto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727181792; c=relaxed/simple;
	bh=T2IH6FCRPcWK+vp/cHTF19PP519XKLnnE65KZ6DFUO4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lF1a6enKLF6IHnngkUQ8hV/B11SiSyLQ2qKpYeqZoCyp4h55Tbm6szTvTKfAAxRMj5Y0KXXprHo2w2AJj5qiwhLs7cp+wf8l8vGMWuNtbXg0nj+3fkXyi187N4ZRgEfujj+VT5kz4VhaZh700olR/9r546CYw4tKRe4W1uJ8REg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUg38Uez; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUg38Uez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727181789; x=1758717789;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=T2IH6FCRPcWK+vp/cHTF19PP519XKLnnE65KZ6DFUO4=;
  b=iUg38UezJUCSHTOikEBf0HIUEPnq1UhXgYy2BZhEeC2LM6UTABs//LqS
   DjNjDYJoX40t3ATppu7UwPcEg/yRYRmzooI2SQ015lxycQTNyT3yjFjLc
   kipPpuC1S97tvREkAJpVC4UXTWPuXWFYp/PUTVBQ0SZ2F/ipgDgYjs0VU
   sxOMo/bw5AkFWBfTUauHVrL0JCVyajWs4tpyerBwddk/VNkxdvFUXc47y
   72CBxrv+f3WtF1kMv1CHPTrVXJR7hg6l4eFZUCypbzJktejH4YIlSlA90
   pZWPoWVZCcF89J5xKpd1hs75MEHgXtQcqfb0MwvMyBmRABEx3nTtO4Wd/
   Q==;
X-CSE-ConnectionGUID: Kn8ZchzqRVO0w8dw6kIswA==
X-CSE-MsgGUID: u5gmE8q5SiCiE+ZhZQHEPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36758376"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="36758376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 05:43:08 -0700
X-CSE-ConnectionGUID: G/E6NeLcQumH7ieRxMrRew==
X-CSE-MsgGUID: DSnNO+H8SiCyhaDdA8gvCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="102166855"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Sep 2024 05:43:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 05:43:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 05:43:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 05:43:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 05:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3h6jkJRdaiF/vtZ5MOmlfEsNsE1g7ZekfY+B6T/CRhd1yQetRI6rlnb33mt3GiSDhcrJHdepSLBmZ+B2JcA4j7zwIMPpRi88VXLhtF/ZKeBQNY39J/9f527I8gIRU+bar5yYeeFgFlaA7VEYLUpVx0FhkyQYZ4bJLrWMRJL1R2was0hy4mQTanlt8crZxICBrwM+5+1oULG9y5PofxSxlj0gTUUCgsYVd+MkGTORz56wxU8FyPx5zNbBq30CcQeOauYE1Ex0pDjdgcp/koPeSPqrpm4VQNZB71soMjPdNCgE/wOC0ufkpqq6fN8Wq5vI2GWe8ECTVPrqSPPyJpdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8hxbWTlxsDftAEditCNqfTFeX/I49U506RRUc6KZVA=;
 b=BHc6ee7aF648a+sVHwSe/2s5RcTV27ynnBr41VQZ3esZUkDFf46IhJfeObsQQ1VGKxXyv2llRbbOhlbcrnubnpLCmZ26zg6up1T/WsmnYZm64w/3ENWZFVVJIW42f4DpAjl36Iz4qoUkzCucVVcS4u3TLPLSTfccQ1JwOa+KYaL3M4c1+/Mm4p5aSW7iNXQDOTJUPCWxxKuzpGZTdmlfbct3oFM4PNXssRGEiajD7CP0Z3htQlWOFq010wTlA9QHVd1oElMJQvQC5tEA3ULN2U9jlPL4HjUO6scuzQk1zBUNHrJ8+WXy+VQD1BI2uuogsKItD9t5QnVkLHyNd2OBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 12:43:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 12:43:02 +0000
Date: Tue, 24 Sep 2024 20:42:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <kaixuxia@tencent.com>, <frankjpliu@tencent.com>, <kasong@tencent.com>,
	<sagazchen@tencent.com>, <kernelxing@tencent.com>, <aurelianliu@tencent.com>,
	<deshengwu@tencent.com>, <flyingpeng@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [sched]  44f5072e76:  netperf.Throughput_Mbps
 14.4% improvement
Message-ID: <202409241630.7e2e7b8a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9ca927-4bb3-4dca-2175-08dcdc966dac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ls8zKzWD8ftD0C4xISAzjXmbrIYsNbnLVp4jf1QH6dROU+Gi5fWLKC8Dgy?=
 =?iso-8859-1?Q?BlxrNbMyCiMqBP3ypdKInIpUOq4clK2mvWPkQ+Qb1EesJXki29uKjtwFQx?=
 =?iso-8859-1?Q?FixCWH+73nmzBs4dadBNzasW8dXUNCP5/I6UyUb+pIwfMFDpDrXz6Jw4VO?=
 =?iso-8859-1?Q?HgRoMivhMU6LBM8VktuOrF9JL01gdkRWveFWC7cH/hUc1dLd/8iChvl77K?=
 =?iso-8859-1?Q?pjApeImD45FHfa5nXuMKr8uNAaF9keN5K1ZaeblXlNRsR79pyT6XBczl7C?=
 =?iso-8859-1?Q?mKO9cy1wJJm++STZx4F+BK9xNsfCFsL5OhHq7w+pk+BiaS8E9WInwjaKuV?=
 =?iso-8859-1?Q?qxekz+FThPp3uRHO8D5XP4w9zL+EHismw3wgJ5SGYIKB0XNVuo0Fm17sPY?=
 =?iso-8859-1?Q?GLvt/v3Ugz0A17kKZojImXixPHHDEGfvzw/696CBdUDcSUdXIOZdY+WKee?=
 =?iso-8859-1?Q?SInfYjmtC/f0ae+oj9rQtYr5+8OwKTpe4WOcXEiAyUihgto8PmDxo/VMtE?=
 =?iso-8859-1?Q?FJFV9NOquXHxEr/VJbBpFcGtBDmBOUyaRS32Ppj4HUGcyxBwRk9AeyalRB?=
 =?iso-8859-1?Q?07V7ksOLg9G6Dm42iooB3L2oahdOKcXOgu6djesxba0CKCznFqqyVkGOsV?=
 =?iso-8859-1?Q?C8hFAdOqvAAJJWTTcq8XYo0e3FdfUa2ecT/JJc+Qw+YkNL6N7SIKz8yqLw?=
 =?iso-8859-1?Q?6oT81Ozdi8COCZ1yi5AmhQholcwo/FImoG+uEj/mX2NlI3q8UEo+eq4oEX?=
 =?iso-8859-1?Q?Thj8T6jDWuvloeZ/6D4Vj8GVut3tRfk9npLr8HSt63VCUOyLw6xTCixhjR?=
 =?iso-8859-1?Q?y9HlfM9l4EoNb+QNV21q9YhbrsBLHQbPQ3WDN58Qu1LFK+3pw8D4eJwzZl?=
 =?iso-8859-1?Q?USEOI24oupDdsZr2boAOZP1PBgjYNk8PnLBa2rtcFunlmmqWozVKeAi3U0?=
 =?iso-8859-1?Q?pr7JEMBcEV2/R81dNVF+P4dIBiQdjqtapWTKCfykaHPhu9yCzGC5bynTmK?=
 =?iso-8859-1?Q?xoN+k4tfagvZL9NxV1jpDniKNOPRXVDp5DOsVsxLGgYMcdfX6h+2OCVW5I?=
 =?iso-8859-1?Q?dZIj0g5eLVac61cQuSnYqjhVAvNQMaO7Y+Pkw7ucnfDcHM0uL8eZpGOx9O?=
 =?iso-8859-1?Q?qlJ2oe3HC47vzd6EOA31lCimyaBcSAwhd903Irc2PRRkADcA6Rcpt8sQQr?=
 =?iso-8859-1?Q?+LS+QgsZJLpZ5Itrvlldx7d6FCoxR/YFOBF09UfgXSRkfEGhgKxsrfP1F9?=
 =?iso-8859-1?Q?mUkYiaiPMlI13ozR2Se1/FzoyAv7LVUsZz0c2VN1/0lg0wWWh/pfbPQRdf?=
 =?iso-8859-1?Q?T/zgLRekzpoX5wf67+uquTUpr7VmX0hWT7GNhJrkPHCdHoPR3DCjSDiqwT?=
 =?iso-8859-1?Q?X5wKrdoHsi9UmduFMV1IVsX432nvcfeng7Gzo1YcK8lWQ2HFjpep4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hK5n5wl53Kun5MPTIvXWsKPxoFWYLMLYinU+JlveI8qDmz+pHsvLJnBzLp?=
 =?iso-8859-1?Q?0elrOz9w4/a1adDwPHLSDlWpAHU5Adac8D6ri6eD65lF/pfiIyIQ3hL8YU?=
 =?iso-8859-1?Q?Yos6A3P8Xwm+zombpAad4rXQf+fE/JmXfQQfg6gzPJZ2DCtNoA7TMe3cbZ?=
 =?iso-8859-1?Q?uGtY6vInnKWUG1qQr1P4xaTn1oYPGiiXeOrtF1k+uHsHzT3uQyNjeM8DRm?=
 =?iso-8859-1?Q?viA1K0iA+YAZsxFrq+8CfGCz9Cu6/NE71G6RWyiurCoq6G1qDVtns7UUKB?=
 =?iso-8859-1?Q?q/XxQ2yK7IlXfB/djKzRpGNXP/y5AHCdIBiDaPjnnhmnMcZRbcLtq0WmAd?=
 =?iso-8859-1?Q?mOiEKQSldNpppdvjgHhx4ZqQ7FVb6bx+KVaCQ+QYAhkj3OhgROevNdWprg?=
 =?iso-8859-1?Q?PddGkcnuiQZkS4zDVWwOpyRu0BBNivylY2YA4zl1Isuj3s8K4Tjxl0hNpL?=
 =?iso-8859-1?Q?1AkIVQT/Jt5lLCq3dtcWH9kvB1an5NeDu18hZPFkMh7drkZCeyjjcXOUuc?=
 =?iso-8859-1?Q?sUHlhaSVP/DH6tYHZFEnz/n8sSXfpoROb7SvIf+U6jO0N+f+g1zggHY2Jw?=
 =?iso-8859-1?Q?W1xF4o2drlrt0DLOT7ncX4QVUBDtr2DFC1hzh8VYBsTktEKzWWurfexD1L?=
 =?iso-8859-1?Q?UVpB/UlD9VXu4hoAmjmZtoAEr8DuurhD/003ZsurWHov/rXCEMHNZFO2Es?=
 =?iso-8859-1?Q?xmMkcjhLpiPzeThiOy2Me3xlKPrevS+txJk6YUGB3igB9IO3tq5V95hEao?=
 =?iso-8859-1?Q?Yn+9QwsXIoO68ByW5y9l+wWa0GPCuYj2eU/mX01CtqBFpqfpH66b/vdAG7?=
 =?iso-8859-1?Q?jxdSLALYeCDhmBObZGw7lccwFTQ64goP8AI4KW4jJ6OEjXsBG2Cdz7xOGF?=
 =?iso-8859-1?Q?RAKY+kX+sxZtHf1QGcTycvEQrvDCPcqQQ4QxcoAOzLNeIzC/gmNcT6l3Jv?=
 =?iso-8859-1?Q?yEswy9DYlN3azP+hebFInUmEq9+qwZqc3KfhbOw9o17EgV5cGF9rYNkcFa?=
 =?iso-8859-1?Q?3y5KoZYD898glUDJ9r7Mj7GGRk3wA358muQyBTvyPGUHPqCE51qLLjmh+j?=
 =?iso-8859-1?Q?uBELzMyN4zh1drBs0hvgv6mzNq+GHZy8aM6B4j3ANnhS2s715yvNhAI8N4?=
 =?iso-8859-1?Q?pWc7MwdlZAKsh2YKbmM/0lWvjg21M3uKsRuMVizHbAKuJynofmTK29GQDg?=
 =?iso-8859-1?Q?Lho1lt3rolkto374dQ2RL5DB2VgnNtiGa63Z9dtLcEcX9/PrDaaXz/LQE5?=
 =?iso-8859-1?Q?OYr5n4CxYEH4OxxLcsmkEtOoIfj8B1mGhXNyrNT4YQJSXszMYcmRbJVwy7?=
 =?iso-8859-1?Q?uxc3a/+BBw47BDjxXdb0Z0R7gOy0PL4fg53iv8Eu059rGZL4r1CqwghlgT?=
 =?iso-8859-1?Q?+Wy+dVhGJb1a438LI5AnYEumjVFOiU4qEzxrNv384r2iyYMQsAi9gEFOz1?=
 =?iso-8859-1?Q?6lAawuxT2jGALnRIOxZnqwKl/iXaV9BWEQVjyH8M14K8V6aASwfpjQ+hSM?=
 =?iso-8859-1?Q?0eW7k8QsYXzsggoFgl2lwoEOIEMH/Jm5MICSgjD/0GNx4D6tBiBx7X3w+X?=
 =?iso-8859-1?Q?63hVLlCG02IyKDUkpNkmayMoH3BuMfNQK/wgpWeANaI2PDyJCSPno2KzHV?=
 =?iso-8859-1?Q?dEJPL0kJXCMI75aOx1jP6ok6I7Y3+6scQXn17bwltxSAsBWHN6DBe6Lw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9ca927-4bb3-4dca-2175-08dcdc966dac
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 12:43:02.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWQJ1cK0ZvsISDQ60alPpiViIPd3nCOGe6/8c6f+G6YDfKrKKyv9I7lZRckhGgpch6w4dN0D/m2t0a4bHgm6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 14.4% improvement of netperf.Throughput_Mbps on:


commit: 44f5072e7684629650ca645a35698d5388c23ad7 ("Revert "sched: adaptive default skew_tick value"")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: netperf
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 50%
	cluster: cs-localhost
	send_size: 10K
	test: SCTP_STREAM_MANY
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240924/202409241630.7e2e7b8a-oliver.sang@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send_size/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-oc_stream_base_config/50%/debian-12-x86_64-20240206.cgz/300s/10K/lkp-emr-2sp1/SCTP_STREAM_MANY/netperf

commit: 
  a1aa259039 ("Merge branch 'likexu/kvm/cube-optimization' into 'master' (merge request !158)")
  44f5072e76 ("Revert "sched: adaptive default skew_tick value"")

a1aa2590392cbeea 44f5072e7684629650ca645a356 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.096e+08 ±  2%     +13.9%  3.526e+08 ±  3%  cpuidle..usage
      0.00 ± 28%     -42.6%       0.00 ± 11%  sched_debug.cpu.next_balance.stddev
     52332 ± 21%     +78.9%      93622 ± 20%  sched_debug.cpu.nr_switches.min
     17.74 ±  2%     +15.3%      20.45 ±  2%  vmstat.procs.r
   1985288 ±  2%     +14.7%    2276309 ±  3%  vmstat.system.cs
     53740 ±  2%      +8.4%      58264 ±  3%  vmstat.system.in
      0.99 ±  2%      +0.2        1.23 ±  2%  mpstat.cpu.all.soft%
      5.10 ±  2%      +0.9        6.05 ±  3%  mpstat.cpu.all.sys%
      0.19            +0.0        0.22        mpstat.cpu.all.usr%
      8.35 ±  3%     +23.1%      10.28 ±  3%  mpstat.max_utilization_pct
     17.50 ± 21%     +46.7%      25.67 ± 10%  perf-c2c.DRAM.local
      1456 ±  5%    +124.4%       3269 ±  2%  perf-c2c.DRAM.remote
      9427 ±  6%     +17.7%      11098 ±  6%  perf-c2c.HITM.local
    720.17 ±  5%     +39.4%       1004 ±  6%  perf-c2c.HITM.remote
     10148 ±  6%     +19.3%      12102 ±  5%  perf-c2c.HITM.total
   5468174           +12.3%    6142120 ±  5%  meminfo.Cached
   3087455 ±  3%     +21.8%    3760849 ±  8%  meminfo.Committed_AS
   2141836 ±  4%     +31.5%    2815792 ± 11%  meminfo.Inactive
   2140829 ±  4%     +31.4%    2813119 ± 11%  meminfo.Inactive(anon)
     81575           +20.7%      98438 ±  8%  meminfo.Mapped
   2148304 ±  4%     +31.3%    2820586 ± 11%  meminfo.Shmem
      4117 ± 88%     +73.3%       7133 ± 50%  numa-vmstat.node2.nr_mapped
    562669 ±  8%     +28.1%     720575 ± 14%  numa-vmstat.node3.nr_file_pages
    529864 ±  5%     +32.2%     700439 ± 11%  numa-vmstat.node3.nr_inactive_anon
      9314 ±  2%     +38.3%      12876 ± 16%  numa-vmstat.node3.nr_mapped
    529765 ±  5%     +32.2%     700351 ± 11%  numa-vmstat.node3.nr_shmem
    529864 ±  5%     +32.2%     700439 ± 11%  numa-vmstat.node3.nr_zone_inactive_anon
     16353 ± 87%     +73.6%      28387 ± 49%  numa-meminfo.node2.Mapped
   2250470 ±  8%     +28.0%    2880924 ± 14%  numa-meminfo.node3.FilePages
   2120053 ±  5%     +32.1%    2800479 ± 11%  numa-meminfo.node3.Inactive
   2119249 ±  5%     +32.1%    2800379 ± 11%  numa-meminfo.node3.Inactive(anon)
     35285 ±  2%     +39.5%      49230 ± 15%  numa-meminfo.node3.Mapped
   2858241 ±  4%     +25.2%    3577576 ±  9%  numa-meminfo.node3.MemUsed
   2118855 ±  5%     +32.1%    2800027 ± 11%  numa-meminfo.node3.Shmem
      2420 ±  2%     +14.4%       2770 ±  3%  netperf.ThroughputBoth_Mbps
    309868 ±  2%     +14.4%     354616 ±  3%  netperf.ThroughputBoth_total_Mbps
      2420 ±  2%     +14.4%       2770 ±  3%  netperf.Throughput_Mbps
    309868 ±  2%     +14.4%     354616 ±  3%  netperf.Throughput_total_Mbps
     11228 ±  2%     +27.6%      14328 ±  3%  netperf.time.involuntary_context_switches
      1036           +15.9%       1200 ±  3%  netperf.time.percent_of_cpu_this_job_got
      3068           +15.9%       3556 ±  3%  netperf.time.system_time
     59.04           +11.4%      65.76 ±  2%  netperf.time.user_time
 1.135e+09 ±  2%     +14.4%  1.299e+09 ±  3%  netperf.workload
   1366778           +12.4%    1535834 ±  5%  proc-vmstat.nr_file_pages
    534938 ±  4%     +31.5%     703580 ± 11%  proc-vmstat.nr_inactive_anon
     20750           +20.4%      24985 ±  8%  proc-vmstat.nr_mapped
    536809 ±  4%     +31.4%     705449 ± 11%  proc-vmstat.nr_shmem
    534938 ±  4%     +31.5%     703580 ± 11%  proc-vmstat.nr_zone_inactive_anon
 1.466e+09 ±  2%     +14.5%  1.678e+09 ±  3%  proc-vmstat.numa_hit
 1.464e+09 ±  2%     +14.5%  1.676e+09 ±  3%  proc-vmstat.numa_local
 8.422e+09 ±  2%     +14.5%  9.639e+09 ±  3%  proc-vmstat.pgalloc_normal
   1647051            +1.8%    1677130        proc-vmstat.pgfault
 8.421e+09 ±  2%     +14.5%  9.638e+09 ±  3%  proc-vmstat.pgfree
 1.169e+10 ±  2%     +14.7%  1.341e+10 ±  3%  perf-stat.i.branch-instructions
      0.48            -0.0        0.47        perf-stat.i.branch-miss-rate%
  55170417 ±  2%     +11.1%   61308068 ±  2%  perf-stat.i.branch-misses
  80142341           +11.7%   89535369 ±  2%  perf-stat.i.cache-misses
  1.68e+09 ±  2%     +14.6%  1.925e+09 ±  3%  perf-stat.i.cache-references
   2005173 ±  2%     +14.8%    2301925 ±  3%  perf-stat.i.context-switches
 7.149e+10 ±  2%     +15.4%  8.253e+10 ±  4%  perf-stat.i.cpu-cycles
    474.46            +3.5%     491.30        perf-stat.i.cpu-migrations
 6.504e+10 ±  2%     +14.7%  7.462e+10 ±  3%  perf-stat.i.instructions
      7.83 ±  2%     +14.8%       8.99 ±  3%  perf-stat.i.metric.K/sec
      5073            +2.2%       5184        perf-stat.i.minor-faults
      5073            +2.2%       5184        perf-stat.i.page-faults
      0.02 ±  6%     -25.8%       0.02 ± 12%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
      0.05 ±  4%     -19.0%       0.04 ± 10%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.09 ±  2%     +12.2%       0.10 ±  3%  perf-sched.sch_delay.avg.ms.schedule_timeout.sctp_wait_for_sndbuf.sctp_sendmsg_to_asoc.sctp_sendmsg
      0.11 ±  8%   +3964.3%       4.51 ±216%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.30 ±  5%     -18.8%       0.25 ± 13%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.87 ±  5%     -25.5%       1.40 ± 11%  perf-sched.total_wait_and_delay.average.ms
   2029785 ±  5%     +32.8%    2695971 ± 11%  perf-sched.total_wait_and_delay.count.ms
      1.87 ±  5%     -25.7%       1.39 ± 11%  perf-sched.total_wait_time.average.ms
     25.91 ± 63%     -59.0%      10.62 ± 21%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    189.87 ± 16%     +91.0%     362.66 ± 19%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
      0.30 ±  5%     -24.8%       0.23 ± 11%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
     49.67 ± 13%     +52.0%      75.50 ± 19%  perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.sctp_sendmsg.inet_sendmsg
      1536           -16.7%       1280        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr_locked
     29.33 ± 13%     -28.4%      21.00 ± 10%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     66.50 ± 15%     -47.9%      34.67 ± 21%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
   1991444 ±  5%     +33.5%    2658433 ± 11%  perf-sched.wait_and_delay.count.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
      2429           -10.2%       2181        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.74            -9.3%       2.48        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr_locked
     25.87 ± 63%     -59.1%      10.58 ± 21%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    189.78 ± 16%     +91.0%     362.52 ± 19%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
      0.30 ±  5%     -25.0%       0.22 ± 11%  perf-sched.wait_time.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
     49.66 ±142%     -87.0%       6.45 ± 92%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      0.84 ±  2%      +0.0        0.89 ±  2%  perf-profile.calltrace.cycles-pp.__sk_mem_reclaim.sctp_wfree.skb_release_head_state.consume_skb.sctp_chunk_put
      0.82 ±  3%      +0.1        0.88 ±  2%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.__sk_mem_reclaim.sctp_wfree.skb_release_head_state.consume_skb
      1.57            +0.1        1.63        perf-profile.calltrace.cycles-pp.sctp_wfree.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_chunk_free
      1.65            +0.1        1.72        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_chunk_free.sctp_outq_sack
      4.22            -0.1        4.08 ±  2%  perf-profile.children.cycles-pp.__schedule
      2.01            -0.1        1.90 ±  3%  perf-profile.children.cycles-pp.schedule_idle
      0.14 ± 11%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.27 ±  4%      -0.1        0.22 ±  4%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.22 ±  9%      -0.0        0.17 ±  5%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.20 ±  6%      -0.0        0.16 ±  6%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
      0.78            -0.0        0.74 ±  2%  perf-profile.children.cycles-pp.sctp_packet_transmit_chunk
      0.18 ±  7%      -0.0        0.14 ±  5%  perf-profile.children.cycles-pp.quiet_vmstat
      0.10 ±  5%      -0.0        0.06 ± 11%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.11 ±  3%      -0.0        0.10 ±  5%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.05 ±  7%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.tick_program_event
      0.53            +0.0        0.55 ±  2%  perf-profile.children.cycles-pp.drain_stock
      0.18 ±  5%      +0.0        0.20 ±  3%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.04 ± 44%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.idle_cpu
      0.22 ±  6%      +0.0        0.25 ±  4%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.22 ±  7%      +0.0        0.26 ±  4%  perf-profile.children.cycles-pp.find_busiest_group
      0.90 ±  2%      +0.0        0.94        perf-profile.children.cycles-pp.refill_stock
      0.26 ±  5%      +0.0        0.31 ±  4%  perf-profile.children.cycles-pp.load_balance
      0.14 ±  3%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      0.08            +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.scheduler_tick
      1.68            +0.1        1.74        perf-profile.children.cycles-pp.sctp_wfree
      0.13 ±  4%      +0.1        0.19 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.06 ±  9%      +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.update_blocked_averages
      0.16 ±  2%      +0.1        0.24 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.07 ±  9%  perf-profile.children.cycles-pp.trigger_load_balance
      0.15 ±  3%      +0.1        0.22 ±  5%  perf-profile.children.cycles-pp.tick_sched_timer
      0.08 ± 13%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.rebalance_domains
      4.48            +0.1        4.56        perf-profile.children.cycles-pp.consume_skb
      1.98 ±  2%      +0.1        2.06 ±  2%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      3.35            +0.1        3.45        perf-profile.children.cycles-pp.skb_release_head_state
      0.21 ±  3%      +0.1        0.31 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.21 ±  2%      +0.1        0.32 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.19 ± 10%      +0.1        0.31 ±  7%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.52 ±  4%      +0.1        0.64 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.13 ± 11%      +0.1        0.26 ±  8%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.56 ±  4%      +0.1        0.70 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.12 ± 11%      +0.1        0.26 ±  8%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.36 ±  7%      +0.2        0.53 ±  6%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.36 ±  6%      +0.2        0.53 ±  6%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.20 ± 10%      +0.2        0.37 ±  6%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.10            -0.0        0.08        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.09 ±  5%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.ipv4_dst_check
      0.18 ±  4%      +0.0        0.20 ±  3%  perf-profile.self.cycles-pp.ktime_get
      0.09 ±  5%      +0.0        0.11 ±  8%  perf-profile.self.cycles-pp.lock_sock_nested
      0.16 ±  4%      +0.0        0.18 ±  3%  perf-profile.self.cycles-pp.sctp_outq_tail
      0.03 ± 70%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.sctp_sf_do_prm_send




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

