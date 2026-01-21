Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F40D3A4F2F
	for <oe-lkp@lists.linux.dev>; Wed, 21 Jan 2026 06:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975716; cv=fail; b=qlLmuLLelBNl/FJcxNddzw6v+MRfeFY4vhSZXNYq4hctJn4NibpW6jhAwYaUy3G3sJPvnJQkgAUxozeDlK84R/h64Jes1jDyWpKUyaVg+934pKVt5dQYhAJoxaw7gUURIVOrcDILHMG5ftlDUOY8QPxdn67LNOzJ3pjGNXRhg14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975716; c=relaxed/simple;
	bh=xrbI2r5NFIkCAFi9LewbVjw64LKZBtN+hy6iZ35fuIw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n72HBpgod/45TS0Jz173+zALZRvWKUNjjn2OdmR8TstvuRDq6G2/T54T0vhkjYoGTFQjhMSB3+hl4b9eB21HqY/N5WbyJJIeQTxAlRrzH47+XqzQ1H5xA9bMa/KRmo7+48+f04j+f/vgaGzF5v/z9X5bFL+ahZoq3rD6FPQloYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwWwmF2U; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwWwmF2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768975712; x=1800511712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrbI2r5NFIkCAFi9LewbVjw64LKZBtN+hy6iZ35fuIw=;
  b=VwWwmF2UOGANTeVtr2KraZ4cXTyWjEDovTGsLsvHZJkvCG3A7kIEX4eh
   dIjwNZ2j5JRLkHjfA6rgacnu2AKoqQ52qPicqNmTSksUzoLN1PxsUo30f
   tqzQ47Kt6qRdTnU/WzNu6hMgSCncnv2Vy6/SPzmb5zBFWQeSM7fG0V215
   GFwQWwwHci/my3fSm0IHtAwwj/XvKFXgpxLG+xaBEWT8XrYKlgER6NTG2
   7h4vJSXQ47sZj8ygkUXrsVbdimi4645uAwfdMiuwAGG06hVFH3VnzVh4n
   Ytnwu4Hq/3KBCX5xxUIi5alEMrQhClmwMKeaInqnoiVa6fOGnoFRof8L0
   Q==;
X-CSE-ConnectionGUID: h2CGd08rQmeEJn4UaCOxvQ==
X-CSE-MsgGUID: vEOjN2GNQZ+TXp9I+n/vLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87609920"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="87609920"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:08:31 -0800
X-CSE-ConnectionGUID: YNrq+gb9TF6zVV7njb0Gqw==
X-CSE-MsgGUID: hBfIc1RXSGKkK6BYBSiDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205601548"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:08:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:08:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:08:30 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:08:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7SMRf5WMEN0jHE5IZhVYDsS89rooxm66beVqSqFKO2/YmqoV9n6DOI4HJ9QIsj4a2NNbW90EIKhqV7cja97OP7dvCAov/PiCyJjI/T4IfF/66oWOpTJhtS4V7BbwHLji9YNZSIdwzivHsfgDweAKkA9HmYSJkuOVoeKukpsBJzWhGJXsmpu9xtBJ/diwHZm0mfGN12XmZzGt+5kG9DWHx7HsxgI4D1BmXncEwNju1a/7dMiaf0INVI7u8k4O5NEzObeQTS2N+judQiGAHyf4WV4xJgxQuNUHigZpD42Wlz5Ak1hAUjR7fANM+b11YAArNW9X3NBG+juHwyjFlTX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCqOpiUia3tPLt5Tg6ZkM8U+dUqlXmTT/PVXTTm1/CY=;
 b=b5vnX4nrxzAB8zZWJ2FG0e+izBiDb6bNGKU1k1sMz6T2YXSYmyVfujCTqjeReanzwUnO2WTXPiA9GOOYO0GgYxkKfaOgZQyp/p07EkXfqmHmIXaN8jasa4SM9xJ0YLdtlb/DStAmXN8jS1tr5EjwBDfocsonVSFf4sAJGLivr3el2RGVk9q/8sUU/6NaOjwIumOV0DQPL6lK7yRs/soi7eZarGJjvgOY1uSZbwHdw+B0Yy1NgxRp+e/NL/eSLOPKXCjbnAiCpkoDR8ugw2MGKEJP8j/e/FaGB/z92Tv9uHAWm0kzaWQ0NKfZEHBo4+DraimTUKDfh+E3Y51+MFVOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ5PPF5CBB3CBCE.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 06:08:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:08:22 +0000
Date: Wed, 21 Jan 2026 14:08:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-shrink] [dyndbg]  1663ffb9c1:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202601211325.7e1f336-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ5PPF5CBB3CBCE:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e832b8c-0fe0-4803-56c6-08de58b37b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QvnL7m3QB31uqlIFtOK4mJwWuedOP0b8YIwS4JT0UBBh3rCV//xpe8/3i7U2?=
 =?us-ascii?Q?q13P59eT75OMbOmgZpd3My/HORnEK0NsrfyTtyMFP7BwoJXAJ0KcC5iNytz5?=
 =?us-ascii?Q?63cbt8YtcWuzKEI/BBSXhrNdozKdt0QvoUg624SEncVLmNenFqXkajRiFOlg?=
 =?us-ascii?Q?K/KXFRQwlVNZ9VWD+5dTqR/rT86+DxbxMKnK1Gkdu4/ZBZIwEwC8WrUkr8Uy?=
 =?us-ascii?Q?ygHpl7S77j8WmEJyiD1Kl8vOZ8zSiwcaasbY131wqMgmMnkTaH64HtaePvhD?=
 =?us-ascii?Q?TG7Y0zk1AwQzUitYistUAZgkE9UpQVGJhuOZfzYV/eIdiefMjXU/gjvkjwmh?=
 =?us-ascii?Q?Zd+Xa+XOcsJOYkG6J00qB5JASG6Dwl+jtv7cmA421UPq7ZoNKjVawNHrsCRt?=
 =?us-ascii?Q?Ax2J/7OvqfXI307Wy0RjJEKA48eBuhWiJf4H7oiwkgsPukIgKrzeJQRZIMAc?=
 =?us-ascii?Q?tmD8MjZO7YhOvzGLZfm8yTcdD3BZ7xAJ1373gNLBcf+XYMb8VD7Oh9ua7ZBY?=
 =?us-ascii?Q?l0KNO9rnSuAU5gyR/ojka3jVOXQoGxBkGOUtIb9ISeKS5Vp3X5cMllpkBdqK?=
 =?us-ascii?Q?E2YaajsdKwvBnX9NR/Qutg9TgC0YkjuF9JPuZyZANZdw48yV8WRhiKgeuG7R?=
 =?us-ascii?Q?scU8PZz2SGeb9WK924Yxj0b0fWITqj5YzyQ+vRg4lm8IxqjB+42tjXHlFG+a?=
 =?us-ascii?Q?R9+WgJjC85Nf67ZwPYxV/IIXVdP7Uq1i89+3WK/1+o5ta3RpcdEdZ+dWaa+v?=
 =?us-ascii?Q?SDmtPFWU28v4kW4uGsfRUvzPZNae/iHoBKGNWu4hTXGycg6n1E4+c2sZUB5+?=
 =?us-ascii?Q?KJi2F08cCqIMpoRCKtc3GnYDbnVct9ytAr335Z708THynwkttqnQips8QUw8?=
 =?us-ascii?Q?G5Cnv6NPovF2cnBmOJa0TRLoXAwRQY8VoJnaIkGjirdYKW/yFJGt4I0CtzTh?=
 =?us-ascii?Q?NCG5+StZomj5C6CBME5nX+mADYWjSzyqTXhwb1IO/6mid9MXI/vqXfva6ipd?=
 =?us-ascii?Q?yc31e2VoI6wO8ZNdu1XEJP6Wtp7W9rlF1nmYb0XbPXmMBmt1DqINuT36FYCA?=
 =?us-ascii?Q?iIDX51OH06E/QVSSU7z6sYGqeoP7i5ptalD553lN0CQ5QkmzlQT9ueSRPrX/?=
 =?us-ascii?Q?qPxuojFS2utPs3b6kaf8LTA8SDnHXoKTC+arC1Xy4HdyRR2RPlNJkExwyq1X?=
 =?us-ascii?Q?ttPSoFPzjPjy69ipFLxqvjnRRV5GSGAiqp7+mmqRib2OnhK+SDvnhqirC4eZ?=
 =?us-ascii?Q?SZtzAOVmsZIZxquRirXJOJBw+LqnvFk0fQKLQKYwIPx3Wo2iuWpa8Et+mcS2?=
 =?us-ascii?Q?G2iZzn7rjyTId/GRDq5mex2MSuY1Al3eTl/5yq52Oazcy34KoK2UcX0kbXFZ?=
 =?us-ascii?Q?C+5SpX7uHksS5pVV9Ul7GSVgzsdk9wJbn2gEzTwM+c++2BY2aGUKSQ1dqadV?=
 =?us-ascii?Q?04kleQdS3d3oQVoAWWHlzmxwIvpfdw783erw5+YeKiLclRNzCeMZ2EnepYPw?=
 =?us-ascii?Q?ThLXI6lMknbjYIrdrcjslYjG2c5sEXdmVAvp7ZBYdXamzRAVFLG+OD5vD5WD?=
 =?us-ascii?Q?hIhIqAfNNl4HRqNswpEd+h7eR44YXexc+p4H1zGP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGRjPd6ve3NSOmq6jUbfaafETe/YyA1tFdX5AQhhdveGilhQ5Zoxr3SDW5tQ?=
 =?us-ascii?Q?teSjaWkbV09FG2/IlPbutJywTdGojOJQuIJxNR8My7dTXGC3QJArtYGK1KYx?=
 =?us-ascii?Q?VTs3Y5ZBjuQGYMQaCcVUL/wgdium4uTOkcXUmYMDaKjtENHQrUKTSkMZjLvl?=
 =?us-ascii?Q?5IbF7bvwOmqbsuZnoU1BK44aDKvAifrousvnGOFVFGsJJ8X/tQ1a6b1ZWYHg?=
 =?us-ascii?Q?oo3r8hbXHK7Dba81lQHeG/MdOi+ALyGtNBv9lFeoITz5mpTKuSkBP/4iY9YL?=
 =?us-ascii?Q?PqdWzhfIfIwwjRdtCTEqtSmtxOYCcOTu2QRbL1FIbqocGHft6TvRosvPh5C9?=
 =?us-ascii?Q?by46sC/29XaXJWc4Ak/iatRdNTkzlIydV9kPh1z324I+pJc7M+Egv3ZETlPj?=
 =?us-ascii?Q?/Tv9yKp9iy2A9ANw9t4sE16bUsKh2c/gAyk31nrHzdnhlR+Whti8dBZLIa9g?=
 =?us-ascii?Q?t0Tk0iL1NFFo5b78D+wZeYJOSzVS9iJlBbWcSLV9KEZB6RAGReNSooF43/ll?=
 =?us-ascii?Q?sNwCxWsARIvy6FYwVt9XuCUpL3goUuFd8vVnn21P+5oSNmRo0tLwQJuamHZc?=
 =?us-ascii?Q?urs39XyuwiCkDXpofm9eI8Y4bbziSUDYw/u3cCh0lWL3GoeJb23GzqkE583z?=
 =?us-ascii?Q?x+nJk73gvOYuRXXLxz4Maol5KlME9qoLmSb3j8kP0m8zpEP4AZ3yPg5Gl1ul?=
 =?us-ascii?Q?oupoNJxsxUgtQvkHtL/ehQJr2vBONAzPsJ7MTx5LW6/u33qqKq2/xiznUts2?=
 =?us-ascii?Q?14r7sv3LVFY9T1LrGjIm4IqmNTELRZykQNWnAJ/DuuHeLxUIyPdNVObmVPTk?=
 =?us-ascii?Q?Ecr8kQArRfeQpms1n1IvsJMe+3594r6oszUoXs2DR4umDRy3xQY264uCsu3W?=
 =?us-ascii?Q?JHmAf3aikHoicKrC/YpxOi+ny7LJbA0xNUreM+xGukczoC8QJfnxwI50yEtE?=
 =?us-ascii?Q?XdXcH19wtlHkFKtxxfMfNadiCGKoplBXN0AbKCpiPdB0QdV8DawMCmnSOi25?=
 =?us-ascii?Q?BS3KPwcPIV2la/8dGjAZyDavgQ4Na26DG8T9t/8Ud5vXJVPq0tjw/1ze96l3?=
 =?us-ascii?Q?J2YP+gmximGdjI1bi/1qJrotFDoY2ziXykl9rZRMxLsXBFso7NuurODIoZvR?=
 =?us-ascii?Q?bWP0GYWHy3qlzdJ90eGLXvcj0XHcQ+oPl7NsoG8DSpMGgXTb4/ITYjANSiZc?=
 =?us-ascii?Q?L1xkTa83K7XQ774c6dAH7sQNfVVCKT35cNTo6TU3wC4fnfmJc93L9475wM8i?=
 =?us-ascii?Q?S1rBvKgZTYzIgBpAfUcvjF4/1Z1r556d3JgDMPnjcP41lEFCBjP9ArYFdh78?=
 =?us-ascii?Q?A1tI+2NTa7V4r2IDFvwe4n8aLOe9kx5DlePlbjTH56zYRHonCJnuvPU+xsUg?=
 =?us-ascii?Q?ijWltAIRl+SPEWpJtXNaNTVnWV8eyLOLpNL8Qzz0QvmRsYPkxkAvGZQbKd7y?=
 =?us-ascii?Q?l8GF1zik3goXJT8LGxDQNLBT77Fsb274H0/p2c1/kP0zCOuRBGsAfl1uvN9q?=
 =?us-ascii?Q?O6prLCmPNi9a18lz4MgKZHKGrwxhgxL7Qcpz73J6W+yA7eMfXxnP/PQh+uRg?=
 =?us-ascii?Q?lqG86GpAxYO5Fp8DVKuEsUz+tz6aOy31pYikc4oWgs1xvAxTfOiPhIeA7egJ?=
 =?us-ascii?Q?Ico4hCXMeDhO2JYIshymKZJmJqGMUQ2q+18MTFADcYU7INfyeXavsvuMfNyZ?=
 =?us-ascii?Q?zQvmvtdQfe3qZsb0KK0krZpFrKdg36jEEvXiAnhAP+SpyoYzHa5X/7TgFMXe?=
 =?us-ascii?Q?h2dmPwJwng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e832b8c-0fe0-4803-56c6-08de58b37b5a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 06:08:22.6211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+hIABdyWGRK82YbUPKgwxtXFIKw8Rr2N5nK36Ay750laXPiDJH3jiuoaq41vV3Cw6CDYV2UZEHz+WBeHWxXlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5CBB3CBCE
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 1663ffb9c19cba56a091fac48e06e248f009be26 ("dyndbg: resolve "protection" of class'd pr_debug")
https://github.com/jimc/linux.git dd-shrink

in testcase: boot

config: i386-randconfig-015-20260120
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 9d6b17ecee | 1663ffb9c1 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 12         | 0          |
| boot_failures                               | 0          | 12         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 12         |
| Oops                                        | 0          | 12         |
| EIP:strcmp                                  | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601211325.7e1f336-lkp@intel.com



[    1.266156][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    1.267870][    T1] #PF: supervisor read access in kernel mode
[    1.269056][    T1] #PF: error_code(0x0000) - not-present page
[    1.269056][    T1] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
[    1.269056][    T1] Oops: Oops: 0000 [#1] SMP
[    1.269056][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.19.0-rc6-00029-g1663ffb9c19c #1 PREEMPT(lazy)  d32193f03a93c27f95904822137a3e5139e15ea4
[    1.269056][    T1] Tainted: [T]=RANDSTRUCT
[    1.269056][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    1.269056][    T1] EIP: strcmp (arch/x86/lib/string_32.c:97)
[    1.269056][    T1] Code: 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04 5e 5f 5b 5d 31 c9 31 d2 c3 90 90 90 90 90 90 90 90 90 55 89 e5 57 56 89 d7 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
All code
========
   0:	06                   	(bad)
   1:	ac                   	lods   %ds:(%rsi),%al
   2:	aa                   	stos   %al,%es:(%rdi)
   3:	84 c0                	test   %al,%al
   5:	75 f7                	jne    0xfffffffffffffffe
   7:	31 c0                	xor    %eax,%eax
   9:	aa                   	stos   %al,%es:(%rdi)
   a:	89 d8                	mov    %ebx,%eax
   c:	83 c4 04             	add    $0x4,%esp
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5b                   	pop    %rbx
  12:	5d                   	pop    %rbp
  13:	31 c9                	xor    %ecx,%ecx
  15:	31 d2                	xor    %edx,%edx
  17:	c3                   	ret
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	56                   	push   %rsi
  26:	89 d7                	mov    %edx,%edi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	31 d2                	xor    %edx,%edx
  3f:	c3                   	ret

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	31 d2                	xor    %edx,%edx
  15:	c3                   	ret
[    1.269056][    T1] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
[    1.269056][    T1] ESI: 00000000 EDI: 00000000 EBP: 46981c84 ESP: 46981c7c
[    1.269056][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[    1.269056][    T1] CR0: 80050033 CR2: 00000000 CR3: 05e58000 CR4: 000406b0
[    1.269056][    T1] Call Trace:
[    1.269056][    T1]  ? dynamic_debug_init (lib/dynamic_debug.c:1651)
[    1.269056][    T1]  ? rest_init (init/main.c:1570)
[    1.269056][    T1]  ? do_one_initcall (init/main.c:1378)
[    1.269056][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674)
[    1.269056][    T1]  ? xas_create (include/linux/xarray.h:1217 (discriminator 2))
[    1.269056][    T1]  ? lock_acquire (kernel/locking/lockdep.c:5868)
[    1.269056][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    1.269056][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    1.269056][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    1.269056][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    1.269056][    T1]  ? rest_init (init/main.c:1570)
[    1.269056][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1612)
[    1.269056][    T1]  ? rest_init (init/main.c:1570)
[    1.269056][    T1]  ? do_pre_smp_initcalls (init/main.c:1483 (discriminator 2))
[    1.269056][    T1]  ? rest_init (init/main.c:1570)
[    1.269056][    T1]  ? kernel_init_freeable (init/main.c:1678)
[    1.269056][    T1]  ? kernel_init (init/main.c:1580)
[    1.269056][    T1]  ? ret_from_fork (arch/x86/kernel/process.c:164)
[    1.269056][    T1]  ? rest_init (init/main.c:1570)
[    1.269056][    T1]  ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    1.269056][    T1]  ? entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    1.269056][    T1] Modules linked in:
[    1.269056][    T1] CR2: 0000000000000000
[    1.269056][    T1] ---[ end trace 0000000000000000 ]---
[    1.269056][    T1] EIP: strcmp (arch/x86/lib/string_32.c:97)
[    1.269056][    T1] Code: 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04 5e 5f 5b 5d 31 c9 31 d2 c3 90 90 90 90 90 90 90 90 90 55 89 e5 57 56 89 d7 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
All code
========
   0:	06                   	(bad)
   1:	ac                   	lods   %ds:(%rsi),%al
   2:	aa                   	stos   %al,%es:(%rdi)
   3:	84 c0                	test   %al,%al
   5:	75 f7                	jne    0xfffffffffffffffe
   7:	31 c0                	xor    %eax,%eax
   9:	aa                   	stos   %al,%es:(%rdi)
   a:	89 d8                	mov    %ebx,%eax
   c:	83 c4 04             	add    $0x4,%esp
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5b                   	pop    %rbx
  12:	5d                   	pop    %rbp
  13:	31 c9                	xor    %ecx,%ecx
  15:	31 d2                	xor    %edx,%edx
  17:	c3                   	ret
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	56                   	push   %rsi
  26:	89 d7                	mov    %edx,%edi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	31 d2                	xor    %edx,%edx


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260121/202601211325.7e1f336-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

