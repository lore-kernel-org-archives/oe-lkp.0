Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F50C38B
	for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741588325; cv=fail; b=Ca1mZ7dT6Jbcw1InHdnRTeSodGIIcGxQPu8GwBC29G4yzueKaA5c2C6YquNO1qqZvPm2yvdk0dfiSHfwJoCaT+yJozpn/+FyvWbADsjBGBL/QoCobzynZ2Qgg5IA5P6UrakEAioZkM8nCXuTRUvk40GgpDxzElOaop1CXx4MiEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741588325; c=relaxed/simple;
	bh=EnATt9EGMHORgpEl9yLrq5kGY95Ds5RE6VP17OF5SXw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FUTyC0dMzY73sbeK2OKiZfP8ZdA1gnTZX75Q74HYeNXPS4gfz36yCKg8qefg+napHmz/pmrpF2dtMvWYZOfz02MTZqi1SrHtGkeXNf6FjIMLRYZOz/MGBOlkQ+J+np9XuBY5MjEsqimt/v6SPAD9x32NC2WRitY2DNXULsSJEyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkO3pODM; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkO3pODM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741588323; x=1773124323;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=EnATt9EGMHORgpEl9yLrq5kGY95Ds5RE6VP17OF5SXw=;
  b=NkO3pODMMz41nSPODo1cXqZLje4GLDZSMn2jeyL5CxKCPxbcD89ffKg/
   RDHUorBte0xtGx5e8f1yD1NU+i8PnH33B0ElaHPtfRXiPcPUFlCZu73mZ
   yEEqYoAl3qkuux15oQKLV5ONvjOhSUvbrGKj+ZV1V3FIgO6hYrKeQ3nZe
   pTMxtrJf4x6WX8XgU+Pv1xPkzhCNhkyCwFlj/9NNpB0vBAIX51zl8Jlsf
   KBzA/V6GwZzNrhrTvQrrAjmgNsh/zJPFXhsFt/EC6+Jfxx3zQS6ZDlvPN
   Lz5nbOGHRaR44LV6uRSS+uGbbC3hL4zl+m+ktjR37clohskIkoyoW7klu
   w==;
X-CSE-ConnectionGUID: UQXtgpcVRliHyQOQEbMisg==
X-CSE-MsgGUID: hHA199xATxOj8wX3aOZ9Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42603774"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42603774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:32:03 -0700
X-CSE-ConnectionGUID: 0+6JDqNVRti16uJlMC24Tw==
X-CSE-MsgGUID: xZhAMJnvQkOv9+mpvIu7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="125143470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Mar 2025 23:32:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Mar 2025 23:32:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 23:32:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 23:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfm5iXZjnH4wv+Hgy3qdBLZ+9xZgqxbCVbxlZZLLhUm1KRhk+bD7GnwN/SDQ99/HzpQj95ddZm2sOGRHpp37TwhEjqZUmwkZt+79WQHEiaY6M9d7V6jJNOP4Q2zzxLDd72DJt3PRhdXe0rfgMArtKKEHN+4WOawb51s4qOHp6iSJ41TSwnGTWBsT3iSnDVFR154k8w9BzPDxZtBJXQSqTbGfulpVMWlx3eSVAPckiWJ7xRhnoSyOnuoQcwbpA+8FSQdDB7lQrZiStkj9YVdyYME6f6kcqdQFVJ0pzibGSgtUS0HonowXp5NmDa4jvETehXSDalT/q6UcvpvY+B4s+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAi5fnIzsfs3oeOdaqOTvY3PInP3L3MjCxqnRJqP3Ng=;
 b=T3N26uF9V4b+kAfhKajm4h4tY2FT+7Vj25iloKFo3ZwtiCmMg51+/1Z0Dp59Fo0C/RqLWQGWG9CKMvsAH++nPpruH0PEPe45vOinGCkmYJdI74QQydQUevtediNA5J3EsOrkB8cO2ru1779NEU2FJZDVazd2JWCWLKRztyeap0wkZGTcLe459/eeX5YSYfvvKQULWI7uJ3wsM3lhXdH2vee0O0FSTry4SKwqKV4corsEY5jOXS2Dc+NNUKzbXBBjQr9ev/ou+arpT1+/1jruRbH1BkuWdGGPfRkJDVMsDHvj6FSjBZHz1INErs9vQzl+uI1deCm3ENPKcfSceOQPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 06:31:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 06:31:45 +0000
Date: Mon, 10 Mar 2025 14:31:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:mm_init/mem_init/v0.1] [dev]  90b020c4d0:
 kernel_BUG_at_arch/x86/mm/physaddr.c
Message-ID: <202503101306.cca8a4c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: KL1PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: da1ad30e-5c35-4f3c-4d1a-08dd5f9d3ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?34dAlXJW7zAXcQhsItTlTpgv3ioE+2N6jDIfaCInySmFNPGH3RkSRS5d+zSZ?=
 =?us-ascii?Q?+qclnpynfuJdNSbT75K2VCpXkGoVgiSvOSyrjyomAzZpvn2c51D9z2yeJ/nE?=
 =?us-ascii?Q?LAao3M8ld7qeom3zUjkNaDdK5P3nlfjqJHdbfsoGXiwmM0q55hlLd0SmdYWz?=
 =?us-ascii?Q?Zm492aoYpNApmrLPCr8MTyEpnVZwJGwEA0c5aJjqovXh7i3+BmoPeVDr5Ssr?=
 =?us-ascii?Q?5Yz8NbsgQGa7BxKobRvLZx8Kw/OhG+ve+Qb60A2q2ZutV6l/jI5tO0lyqSEJ?=
 =?us-ascii?Q?g4d8AWgKdTQJPOIyLZ/7Y5HPZBk2eqnP6Z9sz2r5Qxy4u0uumCnXRk7u3xbC?=
 =?us-ascii?Q?kVJYDmHQLsRxWoIldxgXcp5oZTVxZPp9IPunZvPS19O767ccOZH4/+Vz+fyJ?=
 =?us-ascii?Q?k8U9eav1hgaLOMIqU8K96yI5qHdVEmM4nR8Q9ZxwBfQe/TIPuU/D3nERz6pM?=
 =?us-ascii?Q?HoN8/h3bi1pTeWoZfstNH7ItqVAcMyKDBIv3NRCCEGveTmXZc6U0/yX7W2fY?=
 =?us-ascii?Q?V+XGJADS6PZ/tXb6hraut+34hKIAM65T+fi7UVILN6L24ShC7S0q4NUrqxJd?=
 =?us-ascii?Q?cMS8MqpLoZWNoXcV8160+/4k1Xw7Yu0rcBAoV+T27rK9F54XSeSygF+fufGt?=
 =?us-ascii?Q?cnaZ2ZxzPF/JTjNueq6WNrFx2J8fbK2D4AK6mSFFaFbA35OjOketTfDkN+mL?=
 =?us-ascii?Q?EYGsFLMpcRmLzW/PVGv117+6P97ea/3oGnZSL1Pgs1oVqpchu4W8TdNGOh5M?=
 =?us-ascii?Q?UTLSWxdZhE9MxZ2qv6k379exigr+WFWl0rpV5E9kvHuCY76nDIKkvnW7WzAT?=
 =?us-ascii?Q?zfhFnFYuwzenX2xMDJqSKYkpkMLC6GWkPHcTQcDUo6JIcXMdagd6lobtUl1J?=
 =?us-ascii?Q?KSBjjYfRIDX9uY1lO/oDJ8xevF8UwDyTt6r1ZDUhaT+mXAcIbXjJEQTYM6nn?=
 =?us-ascii?Q?LK10pqC7g/MMc59zAIMw+Pc9UZ9PTwDT9p9sS4xAuAqgR0a0AGzxyPrfYGe2?=
 =?us-ascii?Q?8xzk8hCKqmB2TOQWBcoAkUoSC50TgJLy86wwL4/1AJ/80DKoL+okWlNIVRGr?=
 =?us-ascii?Q?zMmz08ddH8hBdHlevVzt6EtRkDAbyc14OtTOx4S1+0139wQq1S2A16OtOGOO?=
 =?us-ascii?Q?6Up4sEGXIqbxsCNFeq911OrFVRxbUt9T9dQtLPyVFObZm4gs3oKWsKibAMx1?=
 =?us-ascii?Q?No+E/2F/pUER6ZaVVXhrXjPzzOFu+9niv/j4yVwtNCSQI3VW6jN0rxNm3N8/?=
 =?us-ascii?Q?47+pX8QKTH+iXCzUovOOf2vy3H3DETUy5Ch8OMSXWQdyOHogO0jTd/ZTlIpI?=
 =?us-ascii?Q?BmK/s0iyvulOdbaGH7Mv4pTdnW+SAU0njQuHwrBK8DtNyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4wwTuCTL6Q4TzURKRjDc0QxNMrq+MCYRcF2Pq7u5X9sodRe2nZkQjIK/4MU7?=
 =?us-ascii?Q?GHZ8phWfuIGaJhdusePQXbvb09VwRxhzpXqz9G6MUAps9svnm1mJ/sY4VzMe?=
 =?us-ascii?Q?5M78HFiVcewJCUIAhpY3oRrc+S5aw/Hvi0DVS8jwPRcxb68EEZirZ7uq+KZ4?=
 =?us-ascii?Q?dFAYf6ZWwGBkdSONiZUhuF2h/vIRx1h43x9y/7pO31Rc9UVMK4O0pOxn5Egh?=
 =?us-ascii?Q?2grfqd6PjR6qI0TnWN1jUUkwZzX/nW4HVmNamFwGmEo75kDodDGxd3frdb2F?=
 =?us-ascii?Q?I5Wycknwe5xAC3U56ByWEBqSJvf7lBiDyY70rYLxK0+2Vk5GLmw9OL4n+4YD?=
 =?us-ascii?Q?w1KE2G2grJFuPOXtj00BgwL0Oy4vLu1v2dvtTGjjcMHWEQ96HXC1JylZRQ3B?=
 =?us-ascii?Q?gC1eR+q0BJ5AMAwGIX0Hmv/IA+cQt6qik/JvlB3M75yxba77qCTWTCj7WSJK?=
 =?us-ascii?Q?KumZ0CcE2d4YwfxqtzUfSqwAv1tvOoU6YaB+1OvdUV8dP/o16PVwfX6qG6u5?=
 =?us-ascii?Q?2/rSwxptbqoIZsIMLdIDPdAWfKsPkN/KMNI9CEVHokHiIGxr+s6jNMtIRar8?=
 =?us-ascii?Q?jATUv92yZBx+aDrumFdi6tjDeIuXAgukRu+ST/KE1obSeJOQ3IwNH175IgCo?=
 =?us-ascii?Q?lg3aFAZEeeYy04XOQBh+NDZznX8Kh1jUWmdA2pgzS6l85qukvd7bFLAnmO/V?=
 =?us-ascii?Q?jDDQx+kVF+mwGvicqRqenTofqk0NfDKxtq0yrL2jJ4Snxn2Ef+zeJ5Q87a4Q?=
 =?us-ascii?Q?2uxEO2FTrY0rmJvpY2yq/n50/Bs9MMx+j+VsVdBTecmFRxJiGFnyLTSwMSsy?=
 =?us-ascii?Q?nUPllqesXLuXGu9IIdhi84MvgXp/YLCCYawCJjkGYuvDcX5gl59h3r328Qd7?=
 =?us-ascii?Q?Ud8gzUeChqZlV7pwocWZFYkuzq3LIx5eTKLrMyOktjElM41fZqh6IqCjoHs1?=
 =?us-ascii?Q?pwhN8qV/StakQfcq50WJN9uNnC/m2E5lELcC88+S8V74NZxV1rCp6OKCOFS1?=
 =?us-ascii?Q?Q5IWldxDCqh7KyA6zc3RAeSqS+g/dw/Dk5vY9AWQlI9dlplklvLLv8NA0exP?=
 =?us-ascii?Q?CvQSm4oiY/XDbJjurBesoeTvBFiF53WHpYJ+yJ2CWNzwyJED8pg4uok9OmSr?=
 =?us-ascii?Q?SuGM2Q1ZFUVOJ26H3CxDg2oBxfhH0LAUF03bvRX/vri1c3KcWDlOt/fpuNQX?=
 =?us-ascii?Q?6PUiBBU014AHfNP3oFMeI061iInX0NRIiA2kTTqWd7lTE28mw4LyvmsoEfgG?=
 =?us-ascii?Q?mgeFD4PpUHosSJlmoRCbO0L/OHjOi2bnLvWlc//NQuyqAlQog79LXODl994Q?=
 =?us-ascii?Q?4iPUvAzjBGxyrlGVNLphUff6rr8DVsdbG/Jn8k7RZ8Al0DOrHL8Qif6D/eC0?=
 =?us-ascii?Q?Fn5NInoyqF213e9jDAi7Rp8srFoob5ZKmEDsjcGsyYJ3PnDKbnCFzgbhYsBO?=
 =?us-ascii?Q?4mmkVGpiuPHzE/3znZrjC1pSilFqqS9kxbfeITIeeOMCtCMNVM5kdxMlaK5V?=
 =?us-ascii?Q?FTAGUoTb2zCmJ0SfS90XQsoZuIUnkUf9fBzghJwvV2R6jUFk7sK0fF/z4LvN?=
 =?us-ascii?Q?x2+V+FHW4V9Ahq4JOsnAUUwO84tCCzj6dyADQcfak/MJcSBRmUOWM+yqY354?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da1ad30e-5c35-4f3c-4d1a-08dd5f9d3ac7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 06:31:45.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WCasBHTpV4/eb8K6/8cFijF7Hxr8jhzmMby3vQamvQJNYEN6rm/WpsWh5uRRGlrU2zRwOe3qAJKQ1PhO6nuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/physaddr.c" on:

commit: 90b020c4d0ae9512cc4e6082a2df43125bfd5460 ("dev: arch, mm: set high_=
memory in free_area_init()")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git mm_init/mem_ini=
t/v0.1

in testcase: boot

config: i386-randconfig-053-20250305
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------=
+
|                                                | 6daa1f5d8e | 90b020c4d0 =
|
+------------------------------------------------+------------+------------=
+
| kernel_BUG_at_arch/x86/mm/physaddr.c           | 0          | 6          =
|
| PANIC:early_exception                          | 0          | 6          =
|
| EIP:__phys_addr                                | 0          | 6          =
|
+------------------------------------------------+------------+------------=
+


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503101306.cca8a4c-lkp@intel.com


[    0.016426][    T0] ------------[ cut here ]------------
[    0.016774][    T0] kernel BUG at arch/x86/mm/physaddr.c:77!
PANIC: early exception 0x06 IP 60:41083081 error 0 cr2 0x0
[    0.017496][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.14.=
0-rc4-00003-g90b020c4d0ae #1 53e88cc57dbf9b69aac81f1290b58b1874bb31c1
[ 0.018309][ T0] EIP: __phys_addr (arch/x86/mm/physaddr.c:77 (discriminator=
 9))=20
[ 0.018605][ T0] Code: 80 3d a8 99 de 43 01 75 2d 89 f0 e8 09 4f 2b 00 89 c=
3 0f b6 d0 b8 f8 0a cc 43 31 c9 6a 00 e8 e6 0c 17 00 83 c4 04 84 db 74 1f <=
0f> 0b b8 f8 72 77 43 e8 c3 53 9b 00 b8 f8 0a cc 43 31 d2 31 c9 6a
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	80 3d a8 99 de 43 01 	cmpb   $0x1,0x43de99a8(%rip)        # 0x43de99a=
f
   7:	75 2d                	jne    0x36
   9:	89 f0                	mov    %esi,%eax
   b:	e8 09 4f 2b 00       	call   0x2b4f19
  10:	89 c3                	mov    %eax,%ebx
  12:	0f b6 d0             	movzbl %al,%edx
  15:	b8 f8 0a cc 43       	mov    $0x43cc0af8,%eax
  1a:	31 c9                	xor    %ecx,%ecx
  1c:	6a 00                	push   $0x0
  1e:	e8 e6 0c 17 00       	call   0x170d09
  23:	83 c4 04             	add    $0x4,%esp
  26:	84 db                	test   %bl,%bl
  28:	74 1f                	je     0x49
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 f8 72 77 43       	mov    $0x437772f8,%eax
  31:	e8 c3 53 9b 00       	call   0x9b53f9
  36:	b8 f8 0a cc 43       	mov    $0x43cc0af8,%eax
  3b:	31 d2                	xor    %edx,%edx
  3d:	31 c9                	xor    %ecx,%ecx
  3f:	6a                   	.byte 0x6a

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	0f 0b                	ud2
   2:	b8 f8 72 77 43       	mov    $0x437772f8,%eax
   7:	e8 c3 53 9b 00       	call   0x9b53cf
   c:	b8 f8 0a cc 43       	mov    $0x43cc0af8,%eax
  11:	31 d2                	xor    %edx,%edx
  13:	31 c9                	xor    %ecx,%ecx
  15:	6a                   	.byte 0x6a
[    0.019856][    T0] EAX: 43cc0af8 EBX: 44873001 ECX: 00000010 EDX: 00000=
001
[    0.020305][    T0] ESI: 44873000 EDI: 04873000 EBP: 43715f08 ESP: 44873=
000
[    0.020756][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: ffec EFLAGS:=
 00210002
[    0.021240][    T0] CR0: 80050033 CR2: 00000000 CR3: 040af000 CR4: 00000=
090
[    0.021691][    T0] Call Trace:
[ 0.021898][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:478 (discriminato=
r 1))=20
[ 0.022170][ T0] ? early_fixup_exception (arch/x86/include/asm/jump_label.h=
:46 arch/x86/include/asm/nospec-branch.h:595 arch/x86/include/asm/irqflags.=
h:53 arch/x86/include/asm/irqflags.h:115 arch/x86/mm/extable.c:437)=20
[ 0.022509][ T0] ? early_idt_handler_common (arch/x86/kernel/head_32.S:352)=
=20
[ 0.022865][ T0] ? execmem_arch_setup (arch/x86/mm/init.c:1088 (discriminat=
or 10))=20
[ 0.023195][ T0] ? execmem_arch_setup (arch/x86/mm/init.c:1092 (discriminat=
or 1))=20
[ 0.023520][ T0] ? __phys_addr (arch/x86/mm/physaddr.c:77 (discriminator 9)=
)=20
[ 0.023810][ T0] ? one_page_table_init (arch/x86/mm/init_32.c:100 (discrimi=
nator 10))=20
[ 0.024134][ T0] ? page_table_range_init (arch/x86/mm/init_32.c:227 (discri=
minator 1))=20
[ 0.024471][ T0] ? permanent_kmaps_init (include/linux/pgtable.h:191 includ=
e/linux/pgtable.h:196 arch/x86/mm/init_32.c:395)=20
[ 0.024800][ T0] ? paging_init (arch/x86/mm/init_32.c:677)=20
[ 0.025073][ T0] ? native_pagetable_init (arch/x86/mm/init_32.c:481)=20
[ 0.025412][ T0] ? dma_contiguous_reserve (kernel/dma/contiguous.c:250)=20
[ 0.025754][ T0] ? setup_arch (arch/x86/kernel/setup.c:1131)=20
[ 0.026039][ T0] ? start_kernel (init/main.c:920)=20
[ 0.026332][ T0] ? i386_start_kernel (arch/x86/kernel/head32.c:79 (discrimi=
nator 1))=20
[ 0.026655][ T0] ? startup_32_smp (arch/x86/kernel/head_32.S:292)=20
Linux version 6.14.0-rc4-00003-g90b020c4d0ae #1
Command line: ip=3D::::vm-meta-26::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/res=
ult/boot/1/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-053-20250=
305/clang-19/90b020c4d0ae9512cc4e6082a2df43125bfd5460/0 BOOT_IMAGE=3D/pkg/l=
inux/i386-randconfig-053-20250305/clang-19/90b020c4d0ae9512cc4e6082a2df4312=
5bfd5460/vmlinuz-6.14.0-rc4-00003-g90b020c4d0ae branch=3Drppt/mm_init/mem_i=
nit/v0.1 job=3D/lkp/jobs/scheduled/vm-meta-26/boot-1-yocto-i386-minimal-201=
90520.cgz-i386-randconfig-053-20250305-90b020c4d0ae-20250307-53456-e45ett-0=
.yaml user=3Dlkp ARCH=3Di386 kconfig=3Di386-randconfig-053-20250305 commit=
=3D90b020c4d0ae9512cc4e6082a2df43125bfd5460 mem=3D4G intremap=3Dposted_msi =
vmalloc=3D256M initramfs_async=3D0 page_owner=3Don carrier_timeout=3D60 rcu=
pdate.rcu_self_test=3D0 max_uptime=3D600 LKP_SERVER=3Dinternal-lkp-server s=
elinux=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_t=
imeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_pani=
c=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0=
 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty=
0 earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw mem=3D4=
G rcuperf.shutdown=3D0 rcuscale.shutdown=3D0 refscale.shutdown=3D0 watchdog=
_thresh=3D240 audit=3D0 kunit.enable=3D0 ia32_emulation=3Don riscv_isa_fall=
back=3D1



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250310/202503101306.cca8a4c-lkp@i=
ntel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

