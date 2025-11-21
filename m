Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500A1EFF9B
	for <oe-lkp@lists.linux.dev>; Fri, 21 Nov 2025 01:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763689834; cv=fail; b=e+Tai4VV4dvOyJ83oG56DMLWh6SV351HDb6Q26sFWpUpbOuK3FzRu0V1TrARBHFy1VK8K2TjtVDJkHf8zzB+LeKe1XlrM3Ep05Hn2NkoSNTiWKdBluNvmI5r/1IEqX9D8IwkZaydZ3BVnOKD34Lj+qsApoWjnfd51hDxFWlAlis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763689834; c=relaxed/simple;
	bh=+HW2P7hUMwXjZOoU4MuiiTOOYCBzxZ/p2Yh9lJHaW+Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eJEfZ0k7cxrBb2ZFDIP/C7qad/4EYdTlcCJ8U0GLeu0zfXHh27YBNQKApRs5LGavGqqyhkRbEkl832hKSD0r9E9voUY+qQUO7RJ/0iVe7QQcXEKTS/gVyQmJJX7Hklchg5u6+gR4cZnC7lJ+Rh3hrMle6/Gb/Oe5zyAya7PM/Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vr7+jt+t; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vr7+jt+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763689833; x=1795225833;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+HW2P7hUMwXjZOoU4MuiiTOOYCBzxZ/p2Yh9lJHaW+Q=;
  b=Vr7+jt+tYLLNGFtikEO/oJ94FJnbZyVZtToH6SSUAKk/jiAy7QTSuyZT
   RTgznwF+AINnTy7jBErZdX3vWxU433xPkO7NCk1KRIP4WE+SnlERVRD15
   5oq2+w3xHQm8GhRsx3M+7mF5ZLJmiZnzXGFBQnhwxf5xRlPOok0waOF4f
   WqBrUZOS6A2N/fdhdXSKTFHcFTYcyLcS8P4qg3zUZoTclo+MTlVcpU5rn
   fPZ7o2TYStTS6AFMNh4IVoZWEAnSCQafHMAEK/kgPrztUcRkrjlWIAEyx
   burNTZtiyfNDT4F6aVUFRZkV2tWZw7Vv8+WoC/sm+qAA1XpAUt97NzhYV
   A==;
X-CSE-ConnectionGUID: nEsuZ+BqQwGihQl6iSqWiw==
X-CSE-MsgGUID: UPW5yHEJR+uGeoK6qL44PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77246229"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="77246229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 17:50:33 -0800
X-CSE-ConnectionGUID: extCmX48RS2Ykw2vLahVwg==
X-CSE-MsgGUID: RmI7IUhtSl6ButG5j2YVDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="190834867"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 17:50:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 17:50:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 17:50:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 17:50:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Pu9e4ED464BK2C0y3sPqRVEm1nJOnjsChKlvigcummJegfUwfWS1gYSEuGYQmPSiYVSmAW/DuRhSZuQljOn2pf/2Tg/O7HQLucconCmqkySFf1+KcvtSsRvKORkp8S2ue6srZb5ujgy3iqLVhQ1kD6Q0M+raTNsDHSb0LUCsrmSWgFKRPyKAAfe8HI7A0SsHxhDkOnQSPY4J381Ld9vM+9u4mSTaVwlDn0ukkHyIOdbHvze/S/9E7dyAk46mXnp9xEeNi1uwwRtxY+aNQCQb6uGu4cZnMBMgfjiZIxkzqJmuU2jRkx8xiSARBLiyasPnMP3chaOQzr31+TbORZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XEMmC1PmNFZvRL63J8SqXugtp0MXj4rzcpjgF+Tc24=;
 b=pVogoSpTLl4zwk2jGkOcLVAcP4yrL9yubOfmoLWuYOIjNsIwqdRG0sQ3xLjm8Vo5uK3j1nokUvmfvLxP7FFq8yVdv0G4FNNKwctUalzYLxmOJfG/VUtknWCzfzDAuZAnwzL9ZYPP7q7Uu1OBxCB2PRoi39VXjt6evCDgazdvYpwhPKDqVRJ1EwBWTfGe5ZNzDnO5amx8of3fGDTzSx1QiwxSys971IBA1BNKr3Hr3enX8woUKt36Txr4zaln430goarrEMyLJlKd8//D6UhMHiQRl4a1L/01QoLD+vtkT0kg3PWh21Xuq2M6Qtpu1fwg83hxt4oJ17JpmmAmsXc9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 01:50:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 01:50:29 +0000
Date: Fri, 21 Nov 2025 09:50:08 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Christoph Hellwig <hch@lst.de>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>, "Alexander
 Potapenko" <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, <kasan-dev@googlegroups.com>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master] [mempool] 022e94e2c3:
 BUG:KASAN:double-free_in_mempool_free
Message-ID: <aR/FUAPSZHuKr6Zn@xsang-OptiPlex-9020>
References: <202511201309.55538605-lkp@intel.com>
 <20251120072726.GA31171@lst.de>
 <9e066a2f-28fd-4da7-bca8-c10f7b58f811@gmail.com>
 <7ffb1908-464a-4158-8712-7735100ae630@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7ffb1908-464a-4158-8712-7735100ae630@suse.cz>
X-ClientProxiedBy: TPYP295CA0035.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::7)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 1765a387-798e-4f1d-151a-08de28a052ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QafFDs0gBgKdpX751LzEanX492xVLPu+zS/CHTKcYEWmtV9j+FPSnnwmVHpn?=
 =?us-ascii?Q?UltcKKnO4aBhq7AZD+hj/op7bLCxkdbfhHn8vTG2P0/6ZLXHkA4TShM9DhuQ?=
 =?us-ascii?Q?7F73bp2tIival9pjea++L/qyN4SMG/qZYnvtNBClF9VT073Bb9dg19nEKVvo?=
 =?us-ascii?Q?tKS4bk4Umrmmif2bNrbJEDVFKhYYoJ3KXixpyP/BiASFcmnUd/NANLZkHOCu?=
 =?us-ascii?Q?ufj49k9B3utDfwIBtsCnZSrp7QfeBomfbWY0PaQdtNv9W9XNO+cPRXfI/24H?=
 =?us-ascii?Q?SAcpccF3YBl3Z4WbToaMBrNxUu+LG+WR4gh2elG8sRmYDuKy8akTorA8bQ9U?=
 =?us-ascii?Q?SjUQdWU+DqnFk4b3h38sYh+pntCirbbn5QwRMnk/x4HEkUw+fnlnBZ9m9tkV?=
 =?us-ascii?Q?4hC74l1C3Vu06oiaoqPvGXDF3k5a9FLpQxBL48YwOOQjtLe9zddLFKKdrI/2?=
 =?us-ascii?Q?KQE+olWmlbNe8lsfRzA2O4wll++tlfXbzIcKLNOVfdmGKAVCiaGRUOGBosQB?=
 =?us-ascii?Q?PWShCErzRk5QJxOABR7DdNy+IPUzHquyc1JOIsKxlAi8LTroLzSbj7QVTGaT?=
 =?us-ascii?Q?TzRKtKQevLjPov5dYMCkITJJQGSm+Oxae8j2py3ngTj0Bu7JRTSalH5ttgsO?=
 =?us-ascii?Q?lXwrJX1Kr1+0TOCo2Iy7hJainu7YSfMqFhDEVImptfUQxL+/S8sC6sKE7cO2?=
 =?us-ascii?Q?4SW96lWcyZR5DsDC67+15Fq8H5YqQ1fRfBefcKDX3UXuBjLTtc/tFCVrZUvn?=
 =?us-ascii?Q?93SW29TdPBUuYe+ZIgKADn1Y8YI9Ie5wwqI0BIRk4DRdPQhqwHEj2/MXTCdj?=
 =?us-ascii?Q?Etrg8tNVRMdPy4WvW17vLM2MvNINXsnkps8w+cuMso8sCdSaSPrhr+q8MTf0?=
 =?us-ascii?Q?TPen+43lpOMGHnn1e89djt6wlyT+bL2AaMLhhJ7ICNMdulq189TXK/Vsv8TU?=
 =?us-ascii?Q?aiN+HlfxCycBQ8rEvFTvkuEWqCB4O+AxTUORFtqZXdxQEsM2TOW0glDjUph1?=
 =?us-ascii?Q?4qfJITR0wkUxfIENvUbElLVmyeDVnyB69sPz7PYYGD7P75jM3e52EmumlJkz?=
 =?us-ascii?Q?GiRo8ic+r5W7lPwz3yxHuVkvODKMBviDiAk0v6QNFCGZ7cHnvnS7gi1tzH+w?=
 =?us-ascii?Q?pZeCybV6owVzV7u1T4Ft9vp9mhKqdcYtw/ZRs0KlgUp0CCTqnKYSo7FsfBN2?=
 =?us-ascii?Q?72arjATp/xys307/6vK35RS6YusduUXPrFOyHBa6kKAgzXpYam0+smxEuISL?=
 =?us-ascii?Q?fFhOdGmItruGiuLjmIHm4S9A9aK8uxzQtpwr/lkjmoI3DodOVB5U3bSxI5cb?=
 =?us-ascii?Q?pqiaOQGpw3CHrKscy0U5URmBNE071u+vR5p8SLnXHWk56OyesBZzP7TdoCTG?=
 =?us-ascii?Q?kIs1Y38n5OEK4+Bsp4NFDIJLatl/YHwY/2WtkRq12JTHe+Lrz5oEVmZJfNmC?=
 =?us-ascii?Q?gHGj5hK4SdUh7QNpz19TFD8HYKbppgEb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwXeZC8TwEQk20KOZZk1jieA+EcZ2qyEBy9eKEeJ7k5XAkDl7qP2oJ3Va8iI?=
 =?us-ascii?Q?pADFG4IQtpwr1M4u800I9YJ4PotWmBB0bFus/jiUgvGDveMPSWZmnQZFSw2K?=
 =?us-ascii?Q?GhX9VywySAS4uAzJnwEsdTGhOPA0+pPlvcY7E8B4sVsy+CiB1J2/hhE7Hmx1?=
 =?us-ascii?Q?KC/mSPfLzXTcFw38X7FHU1E0eWvcmkfPYgtdNadH6Ykt1I5tQQXE8net1mgB?=
 =?us-ascii?Q?rtLnQZ3v4C439st7Z1B69dZVmEjI+OrsTBgvRuf9TRWVWzp41xgrQ2cMefBx?=
 =?us-ascii?Q?470N0mFY8y9BpMYT7vb/2zW7YmQaMLoEFyFYOysk7btNDCTz6YPZW3afGGfB?=
 =?us-ascii?Q?3/DmBITuPWaBoWSQT7PMJJ/c4QYn++Vx5rWOqBg0TtvUdZdZhlRvNt6nh45Q?=
 =?us-ascii?Q?fmb6a6lI2p19fU56qFIaBGOYoNEmwE3ayO2/57JU7k3MTT4Q1tP7jGz9eeBD?=
 =?us-ascii?Q?+Aj2eQO/k4sFHz6hnMMIgEw/24faHSVVKmcIyEzgUyblZ8nQvUPV4jxF6N/1?=
 =?us-ascii?Q?1gPJsGBVM+pa/UJN31xhbpb3sTpKpzOLWW7BFjOZIewCMw39LjkOgtfgeYWA?=
 =?us-ascii?Q?l76dMesbmqnCCYTTbUfI+nG/lD1CIewFCV1Hy4fIZ1oJnBu2A+/44kAkenHX?=
 =?us-ascii?Q?Tad/QkQxtJKGIJuku3fYSe7ArIaR8fsYpTrBxWnoMDADmG2zrt7u8qXXEFsQ?=
 =?us-ascii?Q?Z1KUd5pYC02KsUjalClUBgccSceMAkL7qepxtox3OnqfVeZULM0xDkDaj5vN?=
 =?us-ascii?Q?vMtlYNgNmmt1Stdq8wvqigKbt4krIO+CyJkr/hM7hz/h0CXjAM4a+/B/oQxx?=
 =?us-ascii?Q?Qv1/kJrqKlRwV3JMb5gqgFqXH9qeQXi8qrqiQLp8qMz31B48xcxRXChkUGIv?=
 =?us-ascii?Q?dw9AXFTvFDcEV8eqA2R0XKPIkdB3/bJrGYD4bbGLfz1iQyO1YYwUd9Lzp6nQ?=
 =?us-ascii?Q?bbFWMjAwo5dwcr3NpCcOKuNelsAk/StZHkWQjV5DpQgVMydoDHnEwYu/qF++?=
 =?us-ascii?Q?l4CP3Uet2rcXcKsK1PRyrqcZfgnqLJxyyvU9bjgpE3g1g8DDNHV4K8wyIpf4?=
 =?us-ascii?Q?LoB9qb1vNj8+0rhUswQnP84XN4tWr6wO/x3FS637lQFV1WZSeVi+tbbYNmO4?=
 =?us-ascii?Q?306aKbrb5xNlLO8Lmkvpo4VgxPgbgy1iRKD7EuH07exklBl0ak4fxTRTHkCh?=
 =?us-ascii?Q?jQsu8OSGt8F9A1zbht2vyPnM/mZVBD1ZLhDjuMoY2PSml056O9maOdKLUY6Q?=
 =?us-ascii?Q?NCP60oDfS1qybE+i/t/CeJI9mx6vGCMIZPLudjM1uudqbIyvN/uVPlkzlipU?=
 =?us-ascii?Q?6qLArncM3Gg3GnTw/5YPV1549AHOdfBcoQWck7CGP3+Ff4YeMO8EY0zMyFdE?=
 =?us-ascii?Q?uvi1Ie43vzJF28SWMRPqHErbaChSYI0KSq0KJp32cSwv+MnGZWXoUYKa7YGF?=
 =?us-ascii?Q?oMdP1fk60ShAZOpdsFRlOEC0SmCxv1/tWH5NBny1pxS3pF+Hh6TJWhRzjNT+?=
 =?us-ascii?Q?/otnMNtrfhQXNAC9By+JwJrJxEt81uPIr5mr4DAJR4qS8+jbZjLFSwPtkkJ7?=
 =?us-ascii?Q?IB6JIm2aru5VxtOhgX3eAqOe/8cEGjcHilmJOkGNC1Jz99y4S0smCDPZvnAW?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1765a387-798e-4f1d-151a-08de28a052ef
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 01:50:28.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOdGCbQaN5p+DPMVrqf9q/KPylh2PcrqitieXhop8RtafbzIPXhUcepM4TselEuAnAkQxIYwqhNw2BU/uPfUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
X-OriginatorOrg: intel.com

hi, all,

On Thu, Nov 20, 2025 at 01:58:02PM +0100, Vlastimil Babka wrote:
> On 11/20/25 12:17, Andrey Ryabinin wrote:
> > 
> > 
> > On 11/20/25 8:27 AM, Christoph Hellwig wrote:
> >> Maybe I'm misunderstanding the trace, but AFAICS this comes from
> >> the KASAN kunit test that injects a double free, and the trace
> >> shows that KASAN indeed detected the double free and everything is
> >> fine.  Or did I misunderstand the report?
> >> 
> > 
> > Right, the report comes from the test, so it's expected behavior.
> 
> I assume the bot was filtering those, but the changed stacktrace (now
> including the new mempool_free_bulk()) now looks new and the filter needs
> updating?

thanks a lot for information! and sorry for false positive.

we will check the kunit test final results in the future.
kernel test robot doesn't have filter so far. we will consider how to improve
this. thanks
