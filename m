Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B31249EB
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 02:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663189; cv=fail; b=KQ5zUhxuWdJa7rvCW+2/2z8m63QOa4cvS0A8r6KkfbLPjvzwgHXnqPRMRpFK3XjBhdSGbfecEGxr2UYY2y2+buEpEJW1bBrt4/V6W4shCX/IYJnPCDHfmHD7PTjhZR/WNm33VZAhcSMzyKsb35a402p3np6+eeL9hzgJsJkUJP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663189; c=relaxed/simple;
	bh=8ePULWCwODw+53rvXJuAzmvxKDA+5ORzjL63nAZ5jBc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cBwNIbgglscljaTOOa+iYjY6qKqWjP3ViwlVq1aog3aQdydQ3opJTvis96X8FaYMqM+HoBHYD4xvJGw3W6AD9gvoqE7Xf7Y1rKH3E0cw4/G8r2GSTVmJ1lvG8bl+ltPvUEpai7ucVxfDriDxvbZj827qbkj3gj5j8Pi9vDPB/UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3f3grJQ; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3f3grJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734663187; x=1766199187;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=8ePULWCwODw+53rvXJuAzmvxKDA+5ORzjL63nAZ5jBc=;
  b=Y3f3grJQOqulGQG12eKsKsHpEYJaSjYiJSvMyrFJK8XxMzLjeU3CWAT4
   r9FoE5N9tf4T6nmNSJS2+AVF7AwUntGFJiJ8N8ByCWZIFcOVusY09lqss
   +p9ng6WERKFZ6OYV65p+K+67l84IyXLmPK/pTNkIPQIeBnzZXnpWtb8pu
   72Elm9hekJEP/mhJ2XWyabc1IfN7dYvWZ+5ya/Wfy8tlNnulHtshrJU1G
   Gxjpr515VBtF3EMDPEwIe6OgGhoMLioStaqp2G0wcoZpEzvvMln6JHLXt
   Ncw3TXXQNfi6di8HOVie3XBcRxCHWXrJ4UU/M+OUURZfskLYooiLmLZQ/
   w==;
X-CSE-ConnectionGUID: snH6S4X6QhGNqTXaG15LrA==
X-CSE-MsgGUID: +JBRFof9QROb7iLVjFs58Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60587474"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="60587474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 18:52:35 -0800
X-CSE-ConnectionGUID: ZTCnPiaHTyeO1wHoQ43+Fw==
X-CSE-MsgGUID: FMoM4ZqhQCmHfwEkN6hazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99210582"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 18:52:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 18:52:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 18:52:26 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 18:52:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCdWpm4JsMON5ZmzOjKEB1zpKKpnC59MWXatN+FKBR4GQ0CkosJ48AcNo7G8avRLEUxNy7G2gytDgjqSIfdJTCptn7glzh4ioFJMTOpM4RwwUrrlHdP75PWcwP19sLf9VcFHuXWGdOqikb5znW6+Tf7lRxCyr42B2SdJxmAVnU9YI7zrnJcnRIsajUtLRxhVRKu506VXIOpEVyXjVSOmtbX8v60N3UOsznI8daQWRQoz92LwsPgmw8XxoIjmsb8WZ5HozIV5pkMu6LgdfFpD4kgFnhjswihqttwd6h3SJJozsDEoHnfZLJ/a/RZM1CudAnw+DF5+8tUFgw6As29ZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt8wekQGi09mOYAhGVvQqoTJaq9S9G2SFdivSuVmnj0=;
 b=b/Bhf5aww3qghvCKqnGCXUYHP5IWanq1W0Zwif2dwohQK5u7Hy2t91i+yZbtBjYnmElNz2sh8WMGLXdb+FODrfwcOjs8haOzJQlxwq2lXcWvLs7PcvBZdMQzFbczAykVXJo+JojcKWIxuKBvDa459hDbPdDXZBJolxe8r/kLf+9mSa+lPt7utHA7i7q7tdfjPnedATNbOUKchPYrN91fLYBk5/n+HrqhPKY1iaNSjKf9hzH0V4HdBBjrKQWfgHclGEmPnj5bRQv9SqbLVVM6WVRbm2QdAC3u5ZCWcK2tAzpC5Vdg9Ey0uWF/lfNaHAUH2F6H7nNV5Y4wL8L+eVgIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 02:52:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 02:52:24 +0000
Date: Fri, 20 Dec 2024 10:52:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, "Andy Shevchenko" <andy@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH v2 07/11] x86: drop SWIOTLB and PHYS_ADDR_T_64BIT for PAE
Message-ID: <202412201005.77fb063-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241210144945.2325330-8-arnd@kernel.org>
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc30c7f-7701-4a7c-2cac-08dd20a154e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UH4j95okFWVDrnFloHNDFs2BlxS9xLXZaZ/A/vff5xJVsQDCiDCs6kRd1Osj?=
 =?us-ascii?Q?RTgPP7mMwGLVjf8BWsx1yBVcliz0LLwXxrmTF4lOs9Miq2CR67FNspc8KvPr?=
 =?us-ascii?Q?17JbbV0VRreMWZCTLU/Q0E47ypatpLAqFGYi+wyt8I2NHpDWe3yDBGAm3cyM?=
 =?us-ascii?Q?2g+DNhKL6IyK1/n/55itbDV6vbxeO2OhQsebSAV3U5pQ4Rd/xa7MnyKZcYps?=
 =?us-ascii?Q?5Fi2DjVa8ijFa0Ax+c0keBNDurSu9TI1x4Xv/ld/sYtrQDWfhwP14rxhRvra?=
 =?us-ascii?Q?8z5yMFOjPxC6pmpbSLhWTAE9AgAFGxxGakyqbpTUT4wO447ug/9FZPOLespY?=
 =?us-ascii?Q?Vh1p2DhiJsWSTJAxMB81x+VYbE951B6NsRdOJ2ZKXoEmyrn0z+qO9oRacbRt?=
 =?us-ascii?Q?J3Ri9d3PIeThopU9tZvBUNNOOn3I2ncuXjm8bnFLzGCrNSZl2d9jThw2mZZt?=
 =?us-ascii?Q?+DIBI8SmYb0ZBeDyF1EEYd9dPUaLwW4mcfBMFpkZTkSLBbhNwiCkzBg63TqG?=
 =?us-ascii?Q?IE8EBBpRBI03PdmHqpahwo8dROW1izUDRuEH/cWP+H0QwWBWgzCCkPDo+xro?=
 =?us-ascii?Q?dtSzVa/5g0GpRpWhNfgZNy8tdjwS356cFRkSGeJelpWPZa9LH2AxlrWtORb9?=
 =?us-ascii?Q?s7I9DEtwOx0MecVHEuaHjMllURzpF4RQb50FObfa/UMQeot8OCO9IYVHXqa7?=
 =?us-ascii?Q?ApQYIRP6tZiJ+cITpzcRc7CxiizBG6wZN+hxafYa7X5jMo5oy1aklN0p2pFF?=
 =?us-ascii?Q?PRXGdi95iUo/GddxtG437oJVA9sBsUdE6lSCbFafafAyz+7cvRYZQuTRAx+U?=
 =?us-ascii?Q?t8tTvfCunWkIB729s+eN8UDgK3UGtf9OWa0jZiO2SqwT8brJWaYUIpDxFroK?=
 =?us-ascii?Q?kkydoHkvaGAvhDfckUA289fJhhAlntW/owk1v3G2dnJvlnDYJ62nF3hqUDNc?=
 =?us-ascii?Q?KSP0dRsdxy3oyri+c7TxsKcYVTNsECBOHUQWs6cej4wCfnFIZfDPUj90GHj4?=
 =?us-ascii?Q?ChCJU0u/xI7fmhKWKe1ZqLAIQSJ3bEBp2/JCoZDgGdrAaULrqzeu2oim9y61?=
 =?us-ascii?Q?lqFgKYqxOoo9DBqUN1r7daZEpgQ790RkU+LHMBmlvCO5Zq1UpyBhX5A2Uzzl?=
 =?us-ascii?Q?0KIsn6sQFZPr8acA60aaEghNnhHnmEWR10r82z2U5SdusrLPbP9Q7GLZM5Yb?=
 =?us-ascii?Q?bCv51O9YiluZJ26GMCfhjDDROQ8LHQ+a3sC9qYhoi83CgJSKXZy7Y2RjHZRO?=
 =?us-ascii?Q?FHwICwCNR42O1TDuXhwpvVLuKfXL2cG1gFTGSBzW9263zdtvLH96O/b90tDj?=
 =?us-ascii?Q?of8PI54gAY581EfS1hFYS1jEvh4hyrioC0ScPLNXkXDVyGhwhyivop/6N10t?=
 =?us-ascii?Q?TZ0SR9XR848VUUCAA3l6Iw5hUuTuEPKp8fmFRKHnR342EyqI9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lAw0WpvYpO/Ot5prqISZRlFyxjSKDEz7/iYVmsXz3kJC+uQlVb1P6OJj6aiN?=
 =?us-ascii?Q?kEwUT8NTdR12cxltqAKOW9hAPNF/8gwVa8QDG+URUSnQ8vipgl4uyFZbrZ34?=
 =?us-ascii?Q?oOSp3tvfB52B1n3FDAMz2aFBeD7ZTnVcGrGU7e+O2Y/kXuJuh0vg40aE3oXB?=
 =?us-ascii?Q?EnTamMcShBedtfosfR6rZBQerLAJzuWhMslq8bmdpSlEny13Erusl1qtUUsY?=
 =?us-ascii?Q?fiQ9NYhbyvR1qPLWggxzemlK2dmNNLIXH6uiGfSXmuVccfu4qT9KBDxx1MZq?=
 =?us-ascii?Q?jo0Nk7oQoV/SHlKrKAOh8Mq+oyjjZUFowc6DphHLorTHT20yeuYmloaaVMMk?=
 =?us-ascii?Q?UfxmPDf+ztdB0offgGwYK6gFt+f3IrqMnbRA4Yr6IghrCossi/odwWvz/rV5?=
 =?us-ascii?Q?QWDK/nkZVfiZSMSX6ewxtNNAcb06N95RrE+supqw6pOaOl9jurmWTHx2kyPC?=
 =?us-ascii?Q?2OkZesjhYruTnXmfn7OjZw0b6fr4o8STzRPevxzUnYvfIJcC+U6MV97us+Qx?=
 =?us-ascii?Q?Q+ODd5BWdF3S24sxRMiqYDcKjHFJMzeVVRu0kTEwTWwS4v9uTY74rkx2PD6L?=
 =?us-ascii?Q?O0dqted6w1e1r1D0/PZJPuws0RCUNYugbBHnualjL7pVFCwsV/Bb3Fnbqk1e?=
 =?us-ascii?Q?DhPYrf/oDSp0OkeWpsjIJbKyWoYMarg8gOxNgwHe5h+WmY4h2Rtw31gvmIfW?=
 =?us-ascii?Q?Kydv5X3Wx/n9PL251kjqG0zMplbpjp/J4FEwK6WYZO5dGb0kTtIL0VEUC1J2?=
 =?us-ascii?Q?XHZ4ZlvODW2kd5xfjXnfaLu6SUjdCiOR5RCIAnSwZTiKtoTVGcWe+AYg2hOL?=
 =?us-ascii?Q?HOkCoR2QDqbfGmtEtnBGjqelqfLzP+kc19EFaUewyCyewEAEejsMXPKkJHj1?=
 =?us-ascii?Q?QQhixAlsMpSis5otW2tkm4+4p+071iqF8JbEYR3l6lg8VZgXzXrgbd4MlOJg?=
 =?us-ascii?Q?2NSU+R+o9B8n66OZSP2Z3zN0zybMG0UVhUqbp/i2sGoVrcjSmQP8EDyZ4qu/?=
 =?us-ascii?Q?W98Osos3epuM8yTAbEr11N+Z5NERYI9GALoCCnaCEYXSUNLAIwWuOawmNAxA?=
 =?us-ascii?Q?EvcslMOvXSJqU2sxCqqN9Dls1xJ1WsytzUnNthPu76riu+frcH8uhrX+cy/o?=
 =?us-ascii?Q?dsTOkC5khm58DxymgCvXt+NUzRHkdn6+kbT7YixEjPrvm4CCLawVo9DPZq/7?=
 =?us-ascii?Q?XNJ+KuFkHYvy16nkoHgFnPoX/5ZpExVJiiwgS2Sm/fz3tk6m+S1nyUDRdXIX?=
 =?us-ascii?Q?R5f/W7EIK68PxiegurDMzXYkDV6XkY26VIIMJtoJkCDYa56XUmfNXTr96yrY?=
 =?us-ascii?Q?8ili9rFpVH89mWL2vABsZscw4m9WnCJIADKwmBPLoEL1JYyTZh0zyfEp9IvO?=
 =?us-ascii?Q?WD1c2DYOLUJnUiQx12VldobEv7DWdgI6AO+7+YIR4sDZJx/tjvbfCu+f2aAE?=
 =?us-ascii?Q?JwxLrZS6Dx05a/CeuMTszZP4FCL6qqa0BCS39Pwq2tRk1Rdn6edMtfRnvy08?=
 =?us-ascii?Q?LPXu9ExNwoafEpn9o8C5fahVVc2W085GJ8HgDf4Xq9chWcdEK2OKfZNE7v11?=
 =?us-ascii?Q?onfEXNy5WH5gQFiX5k1Apq5on4yvtpRSNuhRXXTmZFVIT+NQgYFcv9TW9SGy?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc30c7f-7701-4a7c-2cac-08dd20a154e0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 02:52:24.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTzwYxLDanPovqRIbOkFzv+ubjaYj3P9JRMmmN1Fg+W15P2k1kBeCF75nUGL9+JE/+WznYWlifI+n8nJKtai/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_mm/sparse.c:#sparse_init" on:

commit: a20f815a6f361e18a0a2a9480b5a5340c5860c7f ("[PATCH v2 07/11] x86: drop SWIOTLB and PHYS_ADDR_T_64BIT for PAE")
url: https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/x86-Kconfig-Geode-CPU-has-cmpxchg8b/20241210-225443
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git f576cfc3d433316990802cd521ddea645eb3971b
patch link: https://lore.kernel.org/all/20241210144945.2325330-8-arnd@kernel.org/
patch subject: [PATCH v2 07/11] x86: drop SWIOTLB and PHYS_ADDR_T_64BIT for PAE

in testcase: boot

config: i386-randconfig-001-20241213
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | 620a8e2d2b | a20f815a6f |
+------------------------------------------------+------------+------------+
| WARNING:at_mm/sparse.c:#sparse_init            | 0          | 12         |
| EIP:sparse_init                                | 0          | 12         |
| BUG:kernel_NULL_pointer_dereference,address    | 0          | 12         |
| Oops                                           | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception       | 0          | 12         |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201005.77fb063-lkp@intel.com


[    0.068283][    T0] ------------[ cut here ]------------
[ 0.068644][ T0] WARNING: CPU: 0 PID: 0 at mm/sparse.c:149 sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[    0.069169][    T0] Modules linked in:
[    0.069424][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc2-00153-ga20f815a6f36 #1 55e1ad47972e976fedebf027f6853ef569639c5a
[    0.070285][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.070972][ T0] EIP: sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[ 0.071277][ T0] Code: 85 d2 74 d1 8b 0d 44 5f 72 b2 85 c9 7e 1c 89 54 24 08 31 c0 31 d2 89 44 24 0c 89 54 24 04 c7 04 24 d8 e5 04 b2 e8 55 ea a2 fe <0f> 0b eb a7 90 8b 0d 80 16 e7 b2 31 d2 8d b4 26 00 00 00 00 90 83
All code
========
   0:	85 d2                	test   %edx,%edx
   2:	74 d1                	je     0xffffffffffffffd5
   4:	8b 0d 44 5f 72 b2    	mov    -0x4d8da0bc(%rip),%ecx        # 0xffffffffb2725f4e
   a:	85 c9                	test   %ecx,%ecx
   c:	7e 1c                	jle    0x2a
   e:	89 54 24 08          	mov    %edx,0x8(%rsp)
  12:	31 c0                	xor    %eax,%eax
  14:	31 d2                	xor    %edx,%edx
  16:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  1a:	89 54 24 04          	mov    %edx,0x4(%rsp)
  1e:	c7 04 24 d8 e5 04 b2 	movl   $0xb204e5d8,(%rsp)
  25:	e8 55 ea a2 fe       	call   0xfffffffffea2ea7f
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb a7                	jmp    0xffffffffffffffd5
  2e:	90                   	nop
  2f:	8b 0d 80 16 e7 b2    	mov    -0x4d18e980(%rip),%ecx        # 0xffffffffb2e716b5
  35:	31 d2                	xor    %edx,%edx
  37:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  3e:	90                   	nop
  3f:	83                   	.byte 0x83

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb a7                	jmp    0xffffffffffffffab
   4:	90                   	nop
   5:	8b 0d 80 16 e7 b2    	mov    -0x4d18e980(%rip),%ecx        # 0xffffffffb2e7168b
   b:	31 d2                	xor    %edx,%edx
   d:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  14:	90                   	nop
  15:	83                   	.byte 0x83
[    0.072580][    T0] EAX: 00000000 EBX: b218feb4 ECX: 00000000 EDX: 0000009f
[    0.073047][    T0] ESI: b218febc EDI: 00000000 EBP: b218fecc ESP: b218feb4
[    0.073513][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: febc EFLAGS: 00210046
[    0.074016][    T0] CR0: 80050033 CR2: 00000000 CR3: 02773000 CR4: 00000090
[    0.074492][    T0] Call Trace:
[ 0.074709][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:479)
[ 0.074989][ T0] ? sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[ 0.075283][ T0] ? __warn (kernel/panic.c:748)
[ 0.075550][ T0] ? sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[ 0.075845][ T0] ? sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[ 0.076140][ T0] ? report_bug (lib/bug.c:180 lib/bug.c:219)
[ 0.076437][ T0] ? sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[ 0.076731][ T0] ? early_fixup_exception (arch/x86/mm/extable.c:415)
[ 0.077081][ T0] ? early_idt_handler_common (arch/x86/kernel/head_32.S:352)
[ 0.077450][ T0] ? register_lock_class (kernel/locking/lockdep.c:195 kernel/locking/lockdep.c:1322)
[ 0.077799][ T0] ? sparse_init (mm/sparse.c:149 mm/sparse.c:227 mm/sparse.c:268 mm/sparse.c:565)
[ 0.078113][ T0] ? native_flush_tlb_global (arch/x86/include/asm/irqflags.h:154 arch/x86/mm/tlb.c:1225)
[ 0.078480][ T0] paging_init (arch/x86/mm/init_32.c:685)
[ 0.078759][ T0] native_pagetable_init (arch/x86/mm/init_32.c:481)
[ 0.079101][ T0] ? _printk (kernel/printk/printk.c:2461)
[ 0.079367][ T0] ? dma_contiguous_reserve (kernel/dma/contiguous.c:250)
[ 0.079722][ T0] setup_arch (arch/x86/kernel/setup.c:1130)
[ 0.080011][ T0] start_kernel (init/main.c:924 (discriminator 3))
[ 0.080301][ T0] ? load_ucode_bsp (arch/x86/kernel/cpu/microcode/core.c:135)
[ 0.080622][ T0] i386_start_kernel (??:?)
[ 0.080936][ T0] startup_32_smp (arch/x86/kernel/head_32.S:292)
[    0.081247][    T0] irq event stamp: 0
[ 0.081500][ T0] hardirqs last enabled at (0): 0x0
[ 0.081922][ T0] hardirqs last disabled at (0): 0x0
[ 0.082349][ T0] softirqs last enabled at (0): 0x0
[ 0.082771][ T0] softirqs last disabled at (0): 0x0
[    0.083193][    T0] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201005.77fb063-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

