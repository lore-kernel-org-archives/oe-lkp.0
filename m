Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2581A83EF
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058274; cv=fail; b=bjyZxxWojh6Xyg8Os4VdR6IncAcruP0rCV0mbA5Ddu/CXc6Prl5o1PnS18XjD/gdvXOLDsyazvBq5XbP0JMYUyepmfkeSyOhsluZ9qOgKsCM1AIx11dQ4DFxuSVtmqGw6qicyM99RzYBIw4wyKcuvpiUdMh617TolRRQFEfYKu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058274; c=relaxed/simple;
	bh=hu9teF9RP/2+/F2KOUnBU2ZplZssxQ/a4ooGNbBYa/4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=In4tnFAOJRe7YEiyFSnA+W+qVvBDNzqiGK2rAsUXKkuiYbQHOl//7sqop46xC4Sk97x7RAl37UFLa4eXMZDWnAaAJ5eeedgd9iBtbzot7y4PyGM2jWZs6GHoH/+c0vNMpdcd8wV5uuDAhZ3wEaDRUGcctI8oQ9qT6C7I+qpoLE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnzv6MFo; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnzv6MFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738058268; x=1769594268;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=hu9teF9RP/2+/F2KOUnBU2ZplZssxQ/a4ooGNbBYa/4=;
  b=lnzv6MFoyYHjAUtPKJlcNXcuJ/nBm8uffNUuzzfrUD+djrKKeR/oliKI
   kwBypjhahXb+a5hzrHyByzYsaLomSWMtrfS4EfLV4zPOU1a/CgnsdmJBW
   yko92LOA4+91xQtZr8GplZNY2e3pv40d6WfhJItpycYBWM/OKHYtxhv/l
   IbM7SCTrwz6xvNLrzN1Pc0U0kVspgd9TfwOy+5cwb0OyBy8MKEnpwGHkE
   iuMI2RqBW8X+HolXL+04ISfQZb8zJDOpZ8uNcRJ8j3uog+34OXyBhxPR6
   ZAOQ/yDDWh2bQA2roK0BRqeXmgSrWZbdzzC1ZamihF9k5cN+DjrdZOmnD
   Q==;
X-CSE-ConnectionGUID: 5L3+gFuNSfq90HLhyCczxw==
X-CSE-MsgGUID: KS/wPlk0QnGJBpxTMvKWcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63895097"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="63895097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 01:57:46 -0800
X-CSE-ConnectionGUID: bqnTgvbMQYaW1x8oM+SK2A==
X-CSE-MsgGUID: kTVYFBZOQRiZEbBnAjs4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108540246"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jan 2025 01:57:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 01:57:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 01:57:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 01:57:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kX7sdzwSBUGXCYzlpIH1kXS8TWuqIlq74zIS7Ud6bhuqSYQX1YGJCKmPPNkuaMfUHhB6TYuAqeiw8jys6iQh8jJYyxLR/MSHPN2FDgPlRECPUtpGL58WVwtQJwR1dgL5YFLto3dLWjA5l4UcxM/DUkqjbkH4aBzeHqbrqfdgwc43IYvXkHj+Btacjy0nzk63OBIttAh5jCueiYRTyOU0LE0AeXs/eIqXAUVxiA4B3UFxnc2qy/n49JLVGRKWgBkrF3HrYW/lZaVTLO1UG+xzEwmayLuKFEiU0QjRwcTtmfOpvfyxIeckiRlwtr5dv9jdF7dXTH4LUDTvZsD4qny60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thx6Oo869x4NWZJYlftWdy++C4terwLFs1OBxmaOEIU=;
 b=X+x+8J7t1qNWdg9kZUZlF/R0gDVi6ho8ImosogM7+UnlJCIrj2NISjP08W/Ixq3HmQN38C3PAzwfsdKdHqORVBVY64E3sq5Z4TBB5bXJtjIQ0gX4/DqulipxBFGFY70XcvICrJ+Oje4LCGNxlCrxXsquW1zNcvEhJRLM3NXypo2BrHcknhzBI24jULrvb64AK2EiSXGRLc4z4fFm2t1e5TftaviVC/BWmyu72olRLlvNcqXwr8Sq9NehrjwzyTLGHuRCtMlkCg0SIfE0RDo0HkKPDusCsbk5X0HxR1Ok4jHloN14IWEofAIzZ+4ikhNz2Y3JHliYePgvvOqx49UjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 09:57:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 09:57:15 +0000
Date: Tue, 28 Jan 2025 17:57:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, David Rientjes <rientjes@google.com>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>,
	Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>, Peter Xu
	<peterx@redhat.com>, Will Deacon <will@kernel.org>, Zach O'Keefe
	<zokeefe@google.com>, Dan Carpenter <dan.carpenter@linaro.org>,
	<oliver.sang@intel.com>
Subject: [linus:master] [x86]  4817f70c25:  stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <202501281734.d408a35b-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fc6ede-180d-48b5-7a8e-08dd3f822481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oJbwi9FaoazK02sNN5q8XtwuK8MSzX5Z/TBRIztmILXlPJ+f8XqDtA5HHe?=
 =?iso-8859-1?Q?CPedo1H4P2c52WxWaPRFNhxlgLvhLAfpF3/DvnMyEZUQrZcvWWUlcUgAnI?=
 =?iso-8859-1?Q?RjseDMbSwHR7hqP02ZrsnAOYz3d8kYmwITRKuRazAiKPiIgYT/Q6bO2E4c?=
 =?iso-8859-1?Q?LGlKjObxIHiUMIKrwXK5tL9EutYopbQckmQb4zAfaGxxgf3e0Xt9aKZcHy?=
 =?iso-8859-1?Q?4Vj4uOPiLL1uMUmJLkTrXfPsb9M5w28VHR8PNczvNI03MRjAQluuKXgouZ?=
 =?iso-8859-1?Q?qn1ks3b222/OHW00+od/9zHf4l++Wtvoh8wOvZdMMOE3rIEmHhRPwCt4iH?=
 =?iso-8859-1?Q?VkVeOJeVt6O/4JvqaGVMZhubiLy/XXTGSV77K6Eu5JKF6CgTyRSvinsmbe?=
 =?iso-8859-1?Q?b34Dok+T3MVDtI+La5SJRAcQlPw+GF7HIpgCXSpTyeP5pO24qtLfnxfDcu?=
 =?iso-8859-1?Q?nBw6f5+vcq5rNovgfebBy6c1o1itk/e9qNVsCi1PuK+9IYNo6xK70JR74q?=
 =?iso-8859-1?Q?QogCJUyTdOH6fCbuWFE1rRpxQbIMhhgzAmCh1xWWjBWbXVfaSoUePjv9Fb?=
 =?iso-8859-1?Q?FBudjLY6k5MburIqw9ULJ4+FhytaTEzZv+IolEzBA8ANutd16vShqbCos1?=
 =?iso-8859-1?Q?px7psq6HbIuL4hdnMuSEv2Jl4UmSVnAho9YalcxNN9L/n7MlFWiXiRJIjZ?=
 =?iso-8859-1?Q?BOJ50trwXnH4CsWC/63gZfftawVWx8jtK/jhmhFVjVo/fhi8LRDTvafIZr?=
 =?iso-8859-1?Q?9voNWELr5uecuOtLYu5eZlK7uR1LJbjGQQVhqFc0lanetuBr/VydGZ6Wou?=
 =?iso-8859-1?Q?rd+YFuDCEhQ6TmQioLX11OPI+IFIfCazrPj/x872r5y1ln4PE+LR1oPFRj?=
 =?iso-8859-1?Q?UwYInZ5gav8uy0hG5lmtTZMr+nds/wSb1PoFK53cI99CsPwbfEAIlDctuW?=
 =?iso-8859-1?Q?Q6tkBfzk7x6fIgKG1uDDF672x+J1mwoN+BW+ZS4j3/24D4UA5A/UtFA9pQ?=
 =?iso-8859-1?Q?kiljMeK1o0OpwE6cvHm01iDZQ4xyKuNCDMfAdb7nEeunhzOTW8nq21P+Vm?=
 =?iso-8859-1?Q?DodRe/AyYlNqPADoBbxSvTqd5GhbPDQnvFKG9yJYMqCzSzhqpdjT0gd4Ag?=
 =?iso-8859-1?Q?kwh8zURUAgkPUtyOjhj8zgjvYBhx/TRyNVgy4rgzxWLkyDS2xXQqFYK/2W?=
 =?iso-8859-1?Q?5jp/9QkslLf+sEll7GQMBN9EppTdcHJL1ewMr68Bol3k8GCnbaz+M3y4/j?=
 =?iso-8859-1?Q?Afbhz2sCtzGUF4eaPWGMZxuUlfLHhji31fgJYXG91I94A68ePDQN+FLtbh?=
 =?iso-8859-1?Q?7ibV4jjJQ4bvMqItykQrgVBLnHysVa0vtpE8T4IBHbJo3Bxrj8fdVoO78x?=
 =?iso-8859-1?Q?XoDyxTbFGdulpPMrGv4DEcoSmpxN65vg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Tq5tBk8v+MHbevWhP5jpkpdEaPUof2FLeurfNGLbaLQqqbgzp/QegskRXM?=
 =?iso-8859-1?Q?sc8E8opeeMywIoPSRwPS6hC2qhKfbi8FKS1EquHU5W6noqSIhh9lMKS0nE?=
 =?iso-8859-1?Q?3KAQO/CVGWGoXSIYxVQYBONWGBuaYF9xBz4NOTMbvVp4kC9QORJ75ezfvf?=
 =?iso-8859-1?Q?WYDEXv9zAVqOEvmGHMUaQCQjuaH3bUwUsM/zovY5qeUJp36hTNqHCOcpie?=
 =?iso-8859-1?Q?bVIov4wepLkaknx0dzY80UHF/jMr5oowpH0FOAVZUr3wAtA/cZ7B+TEYd7?=
 =?iso-8859-1?Q?N2oBwHAcnB8ClpeHwL6mNqloz5qmD0Gruyph9RIoRfgDYdcZGweGLGNdp2?=
 =?iso-8859-1?Q?ivm/fN8IdhUrBS5UqEUFZl0ZTQ/Sy+N20y3Fjjf3JPTbFV7H+7fNLvm6K6?=
 =?iso-8859-1?Q?WSaR8xtRArUs2GmiGJJqx5LPU5BojD74Gg9Qn3eu5TI+088zk6WChnOrGG?=
 =?iso-8859-1?Q?Ys/OB2tuQgjRH4CKOwdbLvjdIgGm1T5Hg605Z8wJugRIlslkXIJgK3GEn+?=
 =?iso-8859-1?Q?eNux5wCS0vQNeMTN9nL8POg821UzdfdOGlH5LLKgxYN48SxJ5kjTGpQSx5?=
 =?iso-8859-1?Q?njZEmn+ZQjMqxwIU58mpM7S3vGjog+bK9XPJrIRXD44qh8UIPHEYHbxD4d?=
 =?iso-8859-1?Q?qHwKXL7yOKvgY+64rDGgbUIg+Zj0AyGKy+DvUSlvaqLxdatwW56YrS42A6?=
 =?iso-8859-1?Q?Q5bO9kz1JwMIg8yuVDtMnxTneV4jVPJccpcSlnqz45cMfgo2s0/n5s+pfU?=
 =?iso-8859-1?Q?1Ut4SAZTP7fyQRt06ct4AfGjEM5krh4J8s33QzNqDlg8C7bwqfWKpOby+X?=
 =?iso-8859-1?Q?SyyL7GyPCmGHpbitNiXTV4QI6QIpdwTWKLuboOMUsmtYLXZO99LprpZJ6D?=
 =?iso-8859-1?Q?i2SFrTil+5rIVZs/sEIyb8ZeUjG1V4vWDYhPbze30UisqIRc00FD5ps6XF?=
 =?iso-8859-1?Q?kUEGkgedzaqSrCEKwVOm/dQ92p2wDmzhSXQDYjklJD/oTzcQjTmLKafDj3?=
 =?iso-8859-1?Q?jHe+3FhT3jx1d0reQT2rvbkGUc7hDobOJt9+w2w1GYEM4MPcyZV76SpzUv?=
 =?iso-8859-1?Q?22uVUlhwJ6dxnMeGHkb77q2PHY0uyE/hI5ayQCBrbJQ21WPVSPouhOoOe9?=
 =?iso-8859-1?Q?MNmVGCNy/a01KLgmnDS0Yq0I+Bsz+X6evjnEVlTGFuQRs02l9F3olgYy1v?=
 =?iso-8859-1?Q?J8O9B55nAnShUjZJ6QwN35C8zai9T1rqwmdHNTFS6e2Wa81KGMpWTcmX5T?=
 =?iso-8859-1?Q?1xZ2Zo28wcBcdtXhcsBNeTq3CygV5D4aIOYauCL1afKcI9x/1uQ5yAq5My?=
 =?iso-8859-1?Q?/2SmEQ8XhThORy3PvKqawqotqbUZAbyj5ckX2QGGpdN21knziwwGoxQflU?=
 =?iso-8859-1?Q?g3+j8m0Gk5kaANuQJDWuj9V97Djd4AF/iC8Tpm2TOgQ94Md69rVHUkMUWx?=
 =?iso-8859-1?Q?WoQQx9vKH/nqBkYi0O31JtzESbzmIapTmrUgCXTHF/Pi/c1V1HdaidmHhB?=
 =?iso-8859-1?Q?odizEfegOTYHtJKKWO1s+BJCZbnORB52kNu7H5pfj4NavBB4pbUDnJrpXD?=
 =?iso-8859-1?Q?/A9xWclZJSJdTQ+jQWek8x++ugVmm1MnfJ6GA/9zcxSTS7dDDxhRp6NmbN?=
 =?iso-8859-1?Q?3X7OdDE3m6VEQzaaSnrIarqnDbZwAarw78FPzeeTtrVRt0kIiaR/ssQQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fc6ede-180d-48b5-7a8e-08dd3f822481
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 09:57:15.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11uQ40dU9V9f6rO1Go6SUeQpSvUjCgREjgpFljqPuHdfPkAU+yXH0NJ+xpB7m58tKV9NmBlohmk2pSG8Ayej2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
X-OriginatorOrg: intel.com


hi, Qi Zheng,

this is more a FYI report than a regression report.

by 4817f70c25, parent/4817f70c25 configs have below diff,

--- /pkg/linux/x86_64-rhel-9.4/gcc-12/718b13861d2256ac95d65b892953282a63faf240/.config  2025-01-27 16:20:43.419181382 +0800
+++ /pkg/linux/x86_64-rhel-9.4/gcc-12/4817f70c25b63ee5e6fd42d376700c058ae16a96/.config  2025-01-26 09:27:16.848625105 +0800
@@ -1236,6 +1236,8 @@ CONFIG_IOMMU_MM_DATA=y
 CONFIG_EXECMEM=y
 CONFIG_NUMA_MEMBLKS=y
 CONFIG_NUMA_EMU=y
+CONFIG_ARCH_SUPPORTS_PT_RECLAIM=y
+CONFIG_PT_RECLAIM=y

 #
 # Data Access Monitoring


this report seems show the impact of PT_CLAIM feature for this stress-ng case.

To us, this is not a code logic regression, but is kind of 'regression' from a
new feature. anyway, below full report just FYI.


Hello,

kernel test robot noticed a 63.0% regression of stress-ng.mmapaddr.ops_per_sec on:


commit: 4817f70c25b63ee5e6fd42d376700c058ae16a96 ("x86: select ARCH_SUPPORTS_PT_RECLAIM if X86_64")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      805ba04cb7ccfc7d72e834ebd796e043142156ba]
[test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b183]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mmapaddr
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501281734.d408a35b-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250128/202501281734.d408a35b-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/mmapaddr/stress-ng/60s

commit: 
  718b13861d ("x86: mm: free page table pages by RCU instead of semi RCU")
  4817f70c25 ("x86: select ARCH_SUPPORTS_PT_RECLAIM if X86_64")

718b13861d2256ac 4817f70c25b63ee5e6fd42d3767 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     65.65           +31.3%      86.18 ±  6%  vmstat.procs.r
      4130           -11.3%       3662        vmstat.system.cs
     19038 ±  9%    +125.3%      42902 ±  3%  perf-c2c.DRAM.local
      4363 ± 24%    +258.4%      15640 ±  7%  perf-c2c.HITM.local
      5776 ± 26%    +202.4%      17466 ±  7%  perf-c2c.HITM.total
      1.61            +0.4        2.03 ± 21%  mpstat.cpu.all.idle%
      8.63           +44.0       52.59        mpstat.cpu.all.soft%
     82.73           -42.1       40.67 ±  2%  mpstat.cpu.all.sys%
      6.62            -2.3        4.27 ±  5%  mpstat.cpu.all.usr%
  6.02e+08           -50.6%  2.971e+08 ±  4%  numa-numastat.node0.local_node
 6.023e+08           -50.6%  2.974e+08 ±  4%  numa-numastat.node0.numa_hit
 5.759e+08           -57.3%  2.459e+08 ±  2%  numa-numastat.node1.local_node
  5.77e+08           -57.4%  2.459e+08 ±  2%  numa-numastat.node1.numa_hit
    158851 ±  6%     -26.4%     116951 ±  8%  numa-meminfo.node0.SUnreclaim
     61139 ± 73%    +103.4%     124379 ± 31%  numa-meminfo.node0.Shmem
    205605 ± 17%     -24.1%     156110 ± 22%  numa-meminfo.node0.Slab
    150312 ±  6%     -23.9%     114347 ±  7%  numa-meminfo.node1.SUnreclaim
    565504 ± 11%     -38.9%     345270 ± 11%  numa-meminfo.node1.Shmem
   1369712 ±  3%     -14.0%    1178177        meminfo.Active
   1369712 ±  3%     -14.0%    1178177        meminfo.Active(anon)
   5967086           +15.4%    6885433        meminfo.Memused
    306207           -24.5%     231181 ±  2%  meminfo.SUnreclaim
    631776 ±  5%     -26.2%     466421        meminfo.Shmem
    398422           -18.9%     323163        meminfo.Slab
   6120536           +40.3%    8586058 ±  2%  meminfo.max_used_kB
 1.295e+08           -63.0%   47952430 ±  2%  stress-ng.mmapaddr.ops
   2157512           -63.0%     798823 ±  2%  stress-ng.mmapaddr.ops_per_sec
     99937           -15.2%      84776 ±  3%  stress-ng.time.involuntary_context_switches
 2.589e+08           -63.0%   95933891 ±  2%  stress-ng.time.minor_page_faults
      5575           -51.1%       2727 ±  2%  stress-ng.time.percent_of_cpu_this_job_got
      3204           -50.9%       1573 ±  2%  stress-ng.time.system_time
    147.95           -54.5%      67.31 ±  2%  stress-ng.time.user_time
     15299 ± 72%    +102.2%      30938 ± 31%  numa-vmstat.node0.nr_shmem
     39236 ±  4%     -24.4%      29655 ±  7%  numa-vmstat.node0.nr_slab_unreclaimable
 6.031e+08           -50.7%  2.976e+08 ±  4%  numa-vmstat.node0.numa_hit
 6.028e+08           -50.7%  2.973e+08 ±  4%  numa-vmstat.node0.numa_local
    144406 ± 11%     -40.4%      86028 ± 10%  numa-vmstat.node1.nr_shmem
     37004 ±  6%     -21.3%      29123 ±  8%  numa-vmstat.node1.nr_slab_unreclaimable
 5.777e+08           -57.4%   2.46e+08 ±  2%  numa-vmstat.node1.numa_hit
 5.767e+08           -57.3%  2.461e+08 ±  2%  numa-vmstat.node1.numa_local
    341476 ±  3%     -13.7%     294764        proc-vmstat.nr_active_anon
    185064            -3.4%     178756        proc-vmstat.nr_anon_pages
   1038531            -3.9%     998118        proc-vmstat.nr_file_pages
    157193 ±  5%     -25.7%     116777        proc-vmstat.nr_shmem
     77416           -26.3%      57093 ±  2%  proc-vmstat.nr_slab_unreclaimable
    341476 ±  3%     -13.7%     294764        proc-vmstat.nr_zone_active_anon
 1.181e+09           -54.0%  5.433e+08 ±  2%  proc-vmstat.numa_hit
 1.179e+09           -54.0%  5.431e+08 ±  2%  proc-vmstat.numa_local
 1.196e+09           -54.0%  5.505e+08 ±  2%  proc-vmstat.pgalloc_normal
 2.594e+08           -62.9%   96338070 ±  2%  proc-vmstat.pgfault
 1.196e+09           -54.0%  5.501e+08 ±  2%  proc-vmstat.pgfree
   6170812 ±  9%     +90.6%   11763974 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.avg
  15545976 ±  8%     +56.6%   24351118 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.max
   2092478 ±  4%    +103.2%    4252078 ± 23%  sched_debug.cfs_rq:/.avg_vruntime.min
   2835619 ±  6%     +59.1%    4510851 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     77.16 ± 23%    +263.1%     280.20 ± 18%  sched_debug.cfs_rq:/.load_avg.avg
     10.67 ± 25%    +150.0%      26.67 ± 37%  sched_debug.cfs_rq:/.load_avg.min
   6170814 ±  9%     +90.6%   11763976 ± 10%  sched_debug.cfs_rq:/.min_vruntime.avg
  15545976 ±  8%     +56.6%   24351075 ± 12%  sched_debug.cfs_rq:/.min_vruntime.max
   2092478 ±  4%    +103.2%    4252078 ± 23%  sched_debug.cfs_rq:/.min_vruntime.min
   2835619 ±  6%     +59.1%    4510847 ± 12%  sched_debug.cfs_rq:/.min_vruntime.stddev
    487.75           -36.1%     311.44 ± 14%  sched_debug.cfs_rq:/.util_est.avg
      2229 ± 10%     -13.7%       1925 ±  5%  sched_debug.cpu.nr_switches.stddev
      0.78          +710.4%       6.30        perf-stat.i.MPKI
 2.599e+10           -58.2%  1.087e+10 ±  2%  perf-stat.i.branch-instructions
      0.29 ±  3%      +0.2        0.46 ±  4%  perf-stat.i.branch-miss-rate%
  76374602 ±  4%     -33.7%   50658159 ±  5%  perf-stat.i.branch-misses
     63.53           +23.8       87.29        perf-stat.i.cache-miss-rate%
  99053780          +249.5%  3.462e+08 ±  2%  perf-stat.i.cache-misses
 1.565e+08          +153.2%  3.962e+08 ±  2%  perf-stat.i.cache-references
      4007           -12.7%       3497        perf-stat.i.context-switches
      1.50          +136.5%       3.55 ±  2%  perf-stat.i.cpi
    148.92           +71.9%     256.04 ±  2%  perf-stat.i.cpu-migrations
      1969           -71.5%     561.93 ±  2%  perf-stat.i.cycles-between-cache-misses
 1.298e+11           -57.8%  5.482e+10 ±  2%  perf-stat.i.instructions
      0.67           -57.5%       0.28 ±  2%  perf-stat.i.ipc
      0.76          +727.5%       6.31        perf-stat.overall.MPKI
      0.29 ±  3%      +0.2        0.47 ±  4%  perf-stat.overall.branch-miss-rate%
     63.30           +24.1       87.36        perf-stat.overall.cache-miss-rate%
      1.50          +137.1%       3.56 ±  2%  perf-stat.overall.cpi
      1967           -71.3%     563.87 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.67           -57.8%       0.28 ±  2%  perf-stat.overall.ipc
 2.557e+10           -58.2%  1.068e+10 ±  2%  perf-stat.ps.branch-instructions
  75409925 ±  4%     -33.7%   50023582 ±  5%  perf-stat.ps.branch-misses
  97420420          +248.9%  3.399e+08 ±  2%  perf-stat.ps.cache-misses
 1.539e+08          +152.7%   3.89e+08 ±  2%  perf-stat.ps.cache-references
      3946           -13.0%       3435        perf-stat.ps.context-switches
    146.11           +71.5%     250.60 ±  2%  perf-stat.ps.cpu-migrations
 1.277e+11           -57.8%  5.384e+10 ±  2%  perf-stat.ps.instructions
 7.767e+12           -57.8%   3.28e+12 ±  2%  perf-stat.total.instructions
      2.22 ±  8%    +988.1%      24.19 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      2.32 ±  7%    +986.2%      25.21 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      2.12 ±  4%   +1019.8%      23.77 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof
      2.17 ± 16%    +500.0%      13.02 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof
      2.22 ±  7%    +987.7%      24.09 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      2.19 ±  7%   +1023.0%      24.60 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      2.46 ± 19%    +850.3%      23.36 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      0.15 ± 27%    +290.5%       0.59 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.16 ±  6%   +1065.6%      25.23 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
      2.06 ± 10%   +1120.0%      25.19 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.24 ±  8%    +869.6%      21.68 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      2.28 ±  7%    +895.1%      22.66 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.madvise_vma_behavior.do_madvise.part
      2.34 ± 10%    +933.7%      24.15 ± 29%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.move_vma.__do_sys_mremap.do_syscall_64
      2.20 ± 23%   +1030.0%      24.86 ± 33%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_link.copy_vma.move_vma
      1.74 ± 11%   +1366.6%      25.45 ± 34%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
      2.03 ±  9%   +1080.5%      23.94 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.12 ± 16%   +1123.1%      25.92 ± 26%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.24 ± 14%   +1072.7%      26.28 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      2.12 ±  6%    +947.0%      22.25 ± 23%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.do_madvise.part.0
      2.16 ±  4%   +1074.1%      25.41 ± 16%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.25 ±  5%    +899.5%      22.49 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      2.05 ±  9%    +891.4%      20.35 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
      2.19 ±  5%   +1046.3%      25.10 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      2.00 ± 36%    +930.1%      20.60 ± 40%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      2.14 ± 10%   +1027.6%      24.14 ± 21%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.copy_vma.move_vma
      2.26 ±  4%    +969.4%      24.16 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
      2.22 ± 11%    +925.7%      22.72 ± 19%  perf-sched.sch_delay.avg.ms.__cond_resched.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64
      2.35 ± 13%    +949.4%      24.66 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.02 ± 83%   +5657.4%       1.10 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.48 ± 43%    +272.7%       5.50 ± 32%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      1.95 ± 24%   +1253.5%      26.41 ± 54%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      2.13 ±  9%   +1013.9%      23.75 ±  5%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      2.19 ± 14%   +1031.0%      24.73 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1.99 ±  3%   +1228.8%      26.40 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.85 ± 28%    +849.5%       8.08 ± 75%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.17 ± 85%    +313.9%       0.70 ± 49%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.60 ±132%    +601.2%       4.20 ± 76%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      1.48 ± 35%    +465.0%       8.35 ± 18%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.13 ± 99%    +836.7%       1.20 ± 42%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.20 ± 50%    +679.9%       1.52 ± 20%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.05 ± 34%    +662.9%       0.37 ± 40%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.82 ± 25%   +1170.3%      10.45 ± 51%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.10 ±113%   +1864.2%       1.98 ± 61%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.27 ± 16%    +143.7%       0.66 ± 31%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.42 ± 42%    +457.6%       2.35 ± 43%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.04 ± 59%   +2242.9%       0.87 ± 30%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.03 ± 20%   +5951.6%       1.54 ±  8%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.38 ± 10%   +1094.5%      16.49 ± 16%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.44 ± 27%    +319.4%       1.83 ± 17%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      9.92 ± 10%    +922.8%     101.47 ±  3%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     11.41 ± 19%    +764.6%      98.64 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      7.85 ± 22%   +1131.2%      96.64 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof
      5.12 ± 28%    +776.1%      44.81 ± 28%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof
     11.85 ± 16%    +765.1%     102.49 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     11.67 ± 20%    +775.3%     102.18 ±  3%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      4.67 ± 27%   +1628.0%      80.62 ± 19%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
     13.90 ± 14%     -96.2%       0.53 ±222%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      6.66 ± 34%    +783.5%      58.82 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     10.58 ± 15%    +848.3%     100.35 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
      8.13 ± 18%   +1164.1%     102.74 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.40 ± 17%   +1052.3%      96.76 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      8.94 ± 19%    +982.2%      96.72 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.madvise_vma_behavior.do_madvise.part
      7.46 ± 26%   +1119.7%      90.94 ±  9%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.move_vma.__do_sys_mremap.do_syscall_64
      5.45 ± 26%   +1396.0%      81.51 ± 15%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_link.copy_vma.move_vma
      4.29 ± 13%   +1610.7%      73.47 ± 22%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
     10.51 ± 26%    +815.4%      96.19 ± 10%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      8.45 ± 29%   +1008.5%      93.66 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.80 ± 27%   +1083.5%      92.29 ±  2%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      8.48 ± 18%   +1018.2%      94.82 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.do_madvise.part.0
      9.07 ± 17%    +976.6%      97.61 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.10 ± 15%    +891.6%     100.17 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      8.82 ± 25%    +958.9%      93.45 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
     11.63 ± 13%    +754.0%      99.34 ±  3%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      6.00 ± 60%    +980.0%      64.81 ± 30%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      8.45 ± 21%   +1077.3%      99.42 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.copy_vma.move_vma
     10.86 ± 19%    +775.0%      95.04 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
      9.53 ± 33%    +930.0%      98.17 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64
      8.33 ±  5%   +1117.6%     101.42 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.54 ±196%   +2824.2%      15.76 ± 13%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      7.68 ± 13%    +599.1%      53.65 ± 43%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      4.15 ± 11%   +1554.1%      68.66 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
     11.51 ± 20%    +793.7%     102.88 ±  3%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      6.59 ± 19%   +1250.1%      89.01 ± 11%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      8.31 ± 25%   +1059.2%      96.32 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.20 ±127%   +1017.8%      13.44 ± 86%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     12.46 ± 11%    +689.6%      98.42 ±  3%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      3.34 ± 37%    +354.0%      15.17 ± 50%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      4.25 ± 20%    +117.9%       9.27 ± 18%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      4.37 ±  8%    +740.3%      36.72 ± 25%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      5.85 ± 34%   +1008.0%      64.84 ± 24%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.85 ±135%   +1271.9%      11.67 ± 83%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      3.58 ± 31%    +311.7%      14.74 ± 79%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      4.20 ± 54%   +1445.7%      64.84 ± 35%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      4.78 ± 22%    +311.9%      19.67 ±  2%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     11.74 ± 17%    +790.5%     104.54 ±  4%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      6.65 ±  7%    +726.5%      54.94 ± 35%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.07 ±  4%    +946.6%      11.19 ±  4%  perf-sched.total_sch_delay.average.ms
     15.37 ±  7%    +602.8%     108.02 ±  5%  perf-sched.total_sch_delay.max.ms
     55.76           +29.6%      72.24 ±  3%  perf-sched.total_wait_and_delay.average.ms
     18874           -12.7%      16487 ±  3%  perf-sched.total_wait_and_delay.count.ms
     54.69           +11.6%      61.05 ±  3%  perf-sched.total_wait_time.average.ms
      4.45 ±  8%    +988.2%      48.39 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      4.43 ±  7%    +987.6%      48.19 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      4.38 ±  7%   +1023.0%      49.20 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      4.49 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      4.33 ±  6%   +1065.5%      50.47 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
      2.03 ±100%   +2380.7%      50.37 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.06 ±  9%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      4.33 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.50 ±  5%    +899.5%      44.99 ± 13%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      4.38 ±  5%   +1046.2%      50.20 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      4.52 ±  4%    +969.4%      48.32 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
      0.67 ±223%   +7208.1%      49.32 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     79.92 ± 13%     -53.8%      36.96 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.26 ±  9%   +1013.9%      47.49 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      3.32 ± 44%   +1490.0%      52.80 ± 13%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.86 ±  9%    +131.2%       4.30 ± 33%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.95 ± 35%    +465.1%      16.70 ± 18%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      3.32 ±  2%     +64.8%       5.47 ± 11%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      8.41 ± 11%    +360.3%      38.70 ± 15%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    193.33 ±  6%    +150.8%     484.83 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
    169.33 ±  7%     -91.3%      14.67 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof
    304.17 ±  5%    +180.1%     852.00 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
    422.83 ±  7%    +110.4%     889.50 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      2014 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
    503.50 ±  4%     -32.5%     339.67 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
     51.83 ±100%    +810.6%     472.00 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
    162.17 ±  7%     -51.8%      78.17 ± 47%  perf-sched.wait_and_delay.count.__cond_resched.down_write.madvise_vma_behavior.do_madvise.part
    122.83 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
    152.67 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
    189.00 ±  5%     -43.1%     107.50 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
    443.50 ±  2%     -42.9%     253.17 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
    219.83 ±  4%     -38.6%     135.00 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
     16.33 ±223%   +4089.8%     684.33 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     65.50 ± 36%   +2839.9%       1925 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    124.00            -8.5%     113.50 ±  3%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    102.83 ±  5%     -14.6%      87.83 ±  6%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1819 ±  7%     -46.4%     974.83 ± 15%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      1514 ±  2%     -28.1%       1088 ±  8%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      4917           -34.5%       3222 ±  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    154.33           -75.7%      37.50 ±142%  perf-sched.wait_and_delay.count.usleep_range_state.tpm_try_transmit.tpm_transmit.tpm_transmit_cmd
     19.84 ± 10%    +922.8%     202.94 ±  3%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     23.69 ± 16%    +765.1%     204.97 ±  4%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     23.35 ± 20%    +775.3%     204.37 ±  3%  perf-sched.wait_and_delay.max.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
     27.80 ± 14%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
     21.16 ± 15%    +848.3%     200.70 ±  7%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
      8.29 ±102%   +2379.5%     205.47 ±  8%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
     21.02 ± 26%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     18.13 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.20 ± 15%    +891.6%     200.33 ±  6%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
     23.27 ± 13%    +754.0%     198.68 ±  3%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
     21.72 ± 19%    +775.0%     190.07 ±  7%  perf-sched.wait_and_delay.max.ms.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
      2.67 ±223%   +7504.8%     202.85 ±  4%  perf-sched.wait_and_delay.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     23.02 ± 20%    +793.7%     205.75 ±  3%  perf-sched.wait_and_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
     14.59 ± 51%   +1220.6%     192.64 ±  8%  perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     13.83 ± 15%    +416.7%      71.46 ± 40%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     24.93 ± 11%    +689.6%     196.84 ±  3%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     11.37 ± 23%    +898.1%     113.53 ± 21%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2.22 ±  8%    +988.1%      24.19 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      2.32 ±  7%    +986.2%      25.21 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      2.12 ±  4%   +1019.8%      23.77 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof
      2.17 ± 16%    +500.0%      13.02 ± 38%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof
      2.22 ±  7%    +987.7%      24.09 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      2.19 ±  7%   +1023.0%      24.60 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      2.46 ± 19%    +850.3%      23.36 ± 37%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      2.16 ±  6%   +1065.6%      25.23 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
      2.06 ± 10%   +1120.0%      25.19 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.24 ±  8%    +869.6%      21.68 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      2.28 ±  7%    +895.1%      22.66 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.madvise_vma_behavior.do_madvise.part
      2.34 ± 10%    +933.7%      24.15 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.move_vma.__do_sys_mremap.do_syscall_64
      2.20 ± 23%   +1030.0%      24.86 ± 33%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_link.copy_vma.move_vma
      1.74 ± 11%   +1366.6%      25.45 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
      2.03 ±  9%   +1080.5%      23.94 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.12 ± 16%   +1123.1%      25.92 ± 26%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.24 ± 14%   +1072.7%      26.28 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      2.12 ±  6%    +947.0%      22.25 ± 23%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.do_madvise.part.0
      2.16 ±  4%   +1074.1%      25.41 ± 16%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.25 ±  5%    +899.5%      22.49 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      2.05 ±  9%    +891.4%      20.35 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
      2.19 ±  5%   +1046.3%      25.10 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      2.00 ± 36%    +930.1%      20.60 ± 40%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      2.14 ± 10%   +1027.6%      24.14 ± 21%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.copy_vma.move_vma
      2.26 ±  4%    +969.4%      24.16 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
      2.22 ± 11%    +925.7%      22.72 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64
      2.35 ± 13%    +949.4%      24.66 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     79.90 ± 13%     -55.1%      35.85 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.95 ± 24%   +1253.5%      26.41 ± 54%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      2.13 ±  9%   +1013.9%      23.75 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      2.18 ± 14%   +1026.6%      24.61 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1.98 ±  3%   +1230.0%      26.40 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     56.28 ±139%    +159.9%     146.28 ± 41%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.65 ± 10%    +137.5%       3.91 ± 35%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.40 ±160%    +684.8%       3.12 ± 77%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      1.48 ± 35%    +465.2%       8.35 ± 18%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.13 ± 99%    +836.7%       1.20 ± 42%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.20 ± 50%    +706.6%       1.57 ± 20%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      3.09 ±  9%     +86.1%       5.75 ± 21%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.28 ±  2%     +40.0%       4.59 ±  7%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    124.20            -6.8%     115.78 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      7.03 ± 12%    +216.1%      22.21 ± 14%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      9.92 ± 10%    +922.8%     101.47 ±  3%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     11.41 ± 19%    +764.6%      98.64 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      7.85 ± 22%   +1131.2%      96.64 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof
      5.12 ± 28%    +776.1%      44.81 ± 28%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof
     11.85 ± 16%    +765.1%     102.49 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     11.67 ± 20%    +775.3%     102.18 ±  3%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      4.67 ± 27%   +1628.0%      80.62 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
     13.90 ± 14%     -96.2%       0.53 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
     10.58 ± 15%    +848.3%     100.35 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.down_read.__mm_populate.vm_mmap_pgoff.do_syscall_64
      8.13 ± 18%   +1164.1%     102.74 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.down_read.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.40 ± 17%   +1052.3%      96.76 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      8.94 ± 19%    +982.2%      96.72 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.down_write.madvise_vma_behavior.do_madvise.part
      7.46 ± 26%   +1119.7%      90.94 ±  9%  perf-sched.wait_time.max.ms.__cond_resched.down_write.move_vma.__do_sys_mremap.do_syscall_64
      5.45 ± 26%   +1396.0%      81.51 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_link.copy_vma.move_vma
      4.29 ± 13%   +1610.7%      73.47 ± 22%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
     10.51 ± 26%    +815.4%      96.19 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      8.45 ± 29%   +1008.5%      93.66 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.80 ± 27%   +1083.5%      92.29 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      8.48 ± 18%   +1018.2%      94.82 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.do_madvise.part.0
      9.07 ± 17%    +976.6%      97.61 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.10 ± 15%    +891.6%     100.17 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      8.82 ± 25%    +958.9%      93.45 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
     11.63 ± 13%    +754.0%      99.34 ±  3%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      6.00 ± 60%    +980.0%      64.81 ± 30%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      8.45 ± 21%   +1077.3%      99.42 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.copy_vma.move_vma
     10.86 ± 19%    +775.0%      95.04 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.mincore_pte_range.walk_pmd_range.isra.0
      9.53 ± 33%    +930.0%      98.17 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64
      8.33 ±  5%   +1117.6%     101.42 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      4.15 ± 11%   +1554.1%      68.66 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
     11.51 ± 20%    +793.7%     102.88 ±  3%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      6.59 ± 19%   +1250.1%      89.01 ± 11%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      8.31 ± 25%   +1059.2%      96.32 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    335.06 ±140%    +155.0%     854.50 ± 43%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     12.86 ± 14%    +452.1%      71.03 ± 40%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.90 ±148%   +1048.0%      10.28 ± 91%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     12.46 ± 11%    +689.6%      98.42 ±  3%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      3.34 ± 37%    +354.0%      15.17 ± 50%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      4.25 ± 20%    +123.1%       9.48 ± 18%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
     15.28 ±  4%    +348.9%      68.60 ± 33%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      7.67 ± 17%    +655.9%      57.97 ± 21%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     24.49           -23.8        0.65 ±  2%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     30.56           -23.6        7.00 ±  2%  perf-profile.calltrace.cycles-pp.__munmap
     29.60           -23.0        6.61 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     29.55           -23.0        6.59 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     29.23           -22.8        6.42 ±  2%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     29.26           -22.8        6.45 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     28.78           -22.5        6.26 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.31           -22.2        6.11 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     22.04           -22.0        0.00        perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
     21.93           -21.9        0.00        perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas
     21.65 ±  2%     -21.6        0.00        perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes
     19.87 ±  2%     -19.9        0.00        perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
     19.53 ±  2%     -19.5        0.00        perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
     19.23 ±  2%     -19.2        0.00        perf-profile.calltrace.cycles-pp.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge_folios.folios_put_refs.free_pages_and_swap_cache
     19.15 ±  2%     -19.2        0.00        perf-profile.calltrace.cycles-pp.page_counter_cancel.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge_folios.folios_put_refs
     22.25           -18.6        3.67        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     21.00           -17.7        3.29        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     19.90           -11.0        8.88        perf-profile.calltrace.cycles-pp.mremap
     19.28           -10.6        8.63        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mremap
     19.25           -10.6        8.62        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mremap
     19.08           -10.5        8.54        perf-profile.calltrace.cycles-pp.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe.mremap
     18.03            -9.9        8.16        perf-profile.calltrace.cycles-pp.move_vma.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe.mremap
     14.66            -8.7        5.92 ±  2%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     11.13            -8.5        2.59        perf-profile.calltrace.cycles-pp.do_vmi_munmap.move_vma.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.93            -8.4        2.52        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.move_vma.__do_sys_mremap.do_syscall_64
      9.05            -7.3        1.73        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.move_vma.__do_sys_mremap
      8.76            -7.1        1.62        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.move_vma
     12.01            -7.1        4.91 ±  2%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.28            -6.8       23.50 ±  2%  perf-profile.calltrace.cycles-pp.__mmap
     28.87            -5.9       22.99 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
     28.79            -5.8       22.96 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     28.18            -5.5       22.72 ±  2%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      8.14            -4.7        3.45 ±  2%  perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
     10.23            -3.8        6.44        perf-profile.calltrace.cycles-pp.mincore
      4.47            -2.9        1.58 ±  2%  perf-profile.calltrace.cycles-pp.__madvise
      8.40            -2.6        5.77        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mincore
      8.30            -2.6        5.73        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mincore
      3.71            -2.4        1.30 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise
      3.66            -2.4        1.28 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      3.38            -2.2        1.18 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      3.32            -2.2        1.15 ±  2%  perf-profile.calltrace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      7.59            -2.1        5.47        perf-profile.calltrace.cycles-pp.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe.mincore
      3.47            -2.0        1.49 ±  2%  perf-profile.calltrace.cycles-pp.copy_vma.move_vma.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.92            -1.9        1.02 ±  2%  perf-profile.calltrace.cycles-pp.do_mincore.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe.mincore
      3.25            -1.8        1.44 ±  2%  perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      2.60            -1.6        1.02 ±  2%  perf-profile.calltrace.cycles-pp.mas_store_prealloc.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
      2.45            -1.6        0.87 ±  3%  perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      2.99            -1.6        1.42 ±  2%  perf-profile.calltrace.cycles-pp.vm_area_alloc.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
      2.24            -1.5        0.78 ±  2%  perf-profile.calltrace.cycles-pp.walk_page_range_mm.do_mincore.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.74            -1.4        1.34 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region.do_mmap
      2.18            -1.3        0.89 ±  2%  perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_prealloc.__mmap_new_vma.__mmap_region.do_mmap
      2.06            -1.3        0.78 ±  2%  perf-profile.calltrace.cycles-pp.__get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.79            -1.2        0.62 ±  2%  perf-profile.calltrace.cycles-pp.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.84            -1.1        0.70 ±  2%  perf-profile.calltrace.cycles-pp.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64
      1.85            -1.1        0.73 ±  2%  perf-profile.calltrace.cycles-pp.perf_event_mmap.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      1.38            -1.1        0.26 ±100%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      1.88            -1.1        0.77 ±  3%  perf-profile.calltrace.cycles-pp.vma_link.copy_vma.move_vma.__do_sys_mremap.do_syscall_64
      1.90            -1.1        0.82 ±  3%  perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      1.78            -1.0        0.76 ±  3%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      1.61            -1.0        0.59 ±  3%  perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      1.65            -1.0        0.65 ±  3%  perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.__mmap_region.do_mmap.vm_mmap_pgoff
      1.34            -0.7        0.60 ±  2%  perf-profile.calltrace.cycles-pp.mas_preallocate.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
      1.22            -0.7        0.57 ±  2%  perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.move_vma.__do_sys_mremap
      0.98            -0.6        0.43 ± 44%  perf-profile.calltrace.cycles-pp.vm_area_dup.copy_vma.move_vma.__do_sys_mremap.do_syscall_64
      2.60            +0.4        2.99        perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.87            +0.5        1.36 ±  2%  perf-profile.calltrace.cycles-pp.__pmd_alloc.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64
      2.21            +0.6        2.84        perf-profile.calltrace.cycles-pp.free_pgd_range.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.64            +0.7        1.29 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.__pmd_alloc.move_page_tables.move_vma.__do_sys_mremap
      0.62            +0.7        1.28 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc.move_page_tables.move_vma
      0.60            +0.7        1.26 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc.move_page_tables
      0.00            +0.7        0.67 ±  2%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof
      0.00            +0.7        0.69 ±  4%  perf-profile.calltrace.cycles-pp.__free_one_page.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials
      0.00            +0.7        0.71 ± 12%  perf-profile.calltrace.cycles-pp._raw_spin_trylock.free_frozen_pages.rcu_do_batch.rcu_core.handle_softirqs
      2.04            +0.7        2.76        perf-profile.calltrace.cycles-pp.free_p4d_range.free_pgd_range.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas
      0.00            +0.7        0.73 ± 15%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages
      0.64 ±  5%      +0.7        1.38 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs
      0.00            +0.7        0.75 ± 15%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials
      0.00            +0.8        0.83 ±  9%  perf-profile.calltrace.cycles-pp.free_frozen_pages.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      3.10            +0.9        3.96        perf-profile.calltrace.cycles-pp.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.80 ±  4%      +0.9        1.68 ±  2%  perf-profile.calltrace.cycles-pp.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      0.62            +1.0        1.57 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      0.00            +1.0        0.98 ± 20%  perf-profile.calltrace.cycles-pp.cgroup_rstat_updated.__mod_memcg_state.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.17 ±141%      +1.0        1.18 ±  2%  perf-profile.calltrace.cycles-pp.__p4d_alloc.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vma_page_range
      0.00            +1.0        1.03 ±  6%  perf-profile.calltrace.cycles-pp.__free_pages.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      1.72            +1.0        2.76 ±  2%  perf-profile.calltrace.cycles-pp.get_free_pages_noprof.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe.mincore
      1.16            +1.1        2.22        perf-profile.calltrace.cycles-pp.__pte_alloc.move_page_tables.move_vma.__do_sys_mremap.do_syscall_64
      0.00            +1.1        1.06 ±  6%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.vm_area_free_rcu_cb.rcu_do_batch.rcu_core
      1.70            +1.1        2.76 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.get_free_pages_noprof.__x64_sys_mincore.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.61            +1.1        1.68        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      0.00            +1.1        1.14 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof.__p4d_alloc
      1.56            +1.1        2.71 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof.__x64_sys_mincore.do_syscall_64
      0.00            +1.2        1.15 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.get_zeroed_page_noprof.__p4d_alloc.__handle_mm_fault
      0.00            +1.2        1.16 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.get_zeroed_page_noprof.__p4d_alloc.__handle_mm_fault.handle_mm_fault
      0.00            +1.2        1.16 ±  2%  perf-profile.calltrace.cycles-pp.get_zeroed_page_noprof.__p4d_alloc.__handle_mm_fault.handle_mm_fault.__get_user_pages
      0.93            +1.2        2.16        perf-profile.calltrace.cycles-pp.pte_alloc_one.__pte_alloc.move_page_tables.move_vma.__do_sys_mremap
      1.42            +1.3        2.71        perf-profile.calltrace.cycles-pp.free_pud_range.free_p4d_range.free_pgd_range.free_pgtables.vms_clear_ptes
      1.33            +1.3        2.63 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof.__x64_sys_mincore
      0.00            +1.3        1.30 ± 15%  perf-profile.calltrace.cycles-pp._raw_spin_trylock.free_frozen_pages.tlb_remove_table_rcu.rcu_do_batch.rcu_core
      0.82            +1.3        2.12        perf-profile.calltrace.cycles-pp.alloc_pages_noprof.pte_alloc_one.__pte_alloc.move_page_tables.move_vma
      0.80            +1.3        2.12        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.__pte_alloc.move_page_tables
      1.97            +1.5        3.49        perf-profile.calltrace.cycles-pp.__pud_alloc.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vma_page_range
      0.00            +1.5        1.53 ±  9%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials.kmem_cache_free
      0.00            +1.5        1.55 ±  9%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_frozen_pages.__put_partials.kmem_cache_free.rcu_do_batch
      0.00            +1.6        1.58        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof.tlb_remove_table
      0.00            +1.6        1.60 ±  9%  perf-profile.calltrace.cycles-pp.free_frozen_pages.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core
      0.00            +1.6        1.64 ± 11%  perf-profile.calltrace.cycles-pp.free_frozen_pages.tlb_remove_table_rcu.rcu_do_batch.rcu_core.handle_softirqs
      0.00            +1.6        1.65        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof.tlb_remove_table.___pte_free_tlb
      0.00            +1.7        1.67        perf-profile.calltrace.cycles-pp.alloc_pages_noprof.get_free_pages_noprof.tlb_remove_table.___pte_free_tlb.free_pud_range
      0.00            +1.7        1.67        perf-profile.calltrace.cycles-pp.get_free_pages_noprof.tlb_remove_table.___pte_free_tlb.free_pud_range.free_p4d_range
      0.00            +1.7        1.70        perf-profile.calltrace.cycles-pp.tlb_remove_table.___pte_free_tlb.free_pud_range.free_p4d_range.free_pgd_range
      1.50            +1.8        3.33 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.__pud_alloc.__handle_mm_fault.handle_mm_fault.__get_user_pages
      0.00            +1.8        1.84 ±  8%  perf-profile.calltrace.cycles-pp.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      0.71            +1.8        2.55 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      1.46            +1.9        3.32 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc.__handle_mm_fault.handle_mm_fault
      0.00            +1.9        1.87        perf-profile.calltrace.cycles-pp.___pte_free_tlb.free_pud_range.free_p4d_range.free_pgd_range.free_pgtables
      1.38            +1.9        3.26        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc.__handle_mm_fault
      0.00            +2.0        1.98 ±  2%  perf-profile.calltrace.cycles-pp.__mod_memcg_state.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.08 ±223%      +2.1        2.14 ±  6%  perf-profile.calltrace.cycles-pp.try_charge_memcg.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.79            +2.1        2.86 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      2.98            +2.4        5.41        perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vma_page_range
      0.00            +2.4        2.45 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      0.00            +2.5        2.47 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
      0.71            +2.5        3.20        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      2.22            +2.6        4.77 ±  2%  perf-profile.calltrace.cycles-pp.__pmd_alloc.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vma_page_range
      1.37 ±  4%      +2.6        3.98 ±  4%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      2.50            +2.8        5.26 ±  2%  perf-profile.calltrace.cycles-pp.__pte_alloc.do_anonymous_page.__handle_mm_fault.handle_mm_fault.__get_user_pages
      1.70            +2.9        4.60 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.__pmd_alloc.__handle_mm_fault.handle_mm_fault.__get_user_pages
      1.66            +2.9        4.58 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      1.58            +2.9        4.52 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc.__handle_mm_fault
      2.10            +3.0        5.14 ±  2%  perf-profile.calltrace.cycles-pp.pte_alloc_one.__pte_alloc.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.96 ±  2%      +3.1        4.03 ±  2%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.get_free_pages_noprof
      1.86            +3.2        5.05 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.pte_alloc_one.__pte_alloc.do_anonymous_page.__handle_mm_fault
      0.00            +3.2        3.19 ±  3%  perf-profile.calltrace.cycles-pp.free_page_and_swap_cache.tlb_remove_table_rcu.rcu_do_batch.rcu_core.handle_softirqs
      1.81            +3.2        5.03 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.76            +3.4        4.14        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     12.14            +4.3       16.42 ±  2%  perf-profile.calltrace.cycles-pp.__mm_populate.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      1.77 ±  4%      +4.5        6.26 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      2.47            +4.6        7.04        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.__pte_alloc
      0.00            +4.8        4.75 ±  2%  perf-profile.calltrace.cycles-pp.clear_page_erms.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.00            +5.0        4.99 ±  6%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      0.64 ±  4%      +5.1        5.75 ±  2%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
     10.99            +5.1       16.10 ±  2%  perf-profile.calltrace.cycles-pp.populate_vma_page_range.__mm_populate.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.80            +5.2       16.00 ±  2%  perf-profile.calltrace.cycles-pp.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff.do_syscall_64
      0.00            +5.3        5.30 ±  2%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      8.67            +6.6       15.24 ±  2%  perf-profile.calltrace.cycles-pp.handle_mm_fault.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
      8.27            +6.8       15.07 ±  2%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.__get_user_pages.populate_vma_page_range.__mm_populate
      0.00           +35.4       35.42 ±  2%  perf-profile.calltrace.cycles-pp.page_counter_cancel.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge.__folio_put
      0.00           +35.5       35.54 ±  2%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge.__folio_put.tlb_remove_table_rcu
      0.00           +35.8       35.77 ±  2%  perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge.__folio_put.tlb_remove_table_rcu.rcu_do_batch
      0.00           +35.9       35.87 ±  2%  perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge.__folio_put.tlb_remove_table_rcu.rcu_do_batch.rcu_core
      0.00           +35.9       35.91 ±  2%  perf-profile.calltrace.cycles-pp.__folio_put.tlb_remove_table_rcu.rcu_do_batch.rcu_core.handle_softirqs
      0.00           +40.8       40.79 ±  2%  perf-profile.calltrace.cycles-pp.tlb_remove_table_rcu.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      2.98 ±  4%     +48.2       51.20 ±  2%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      2.99 ±  4%     +48.2       51.23 ±  2%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      3.00 ±  4%     +48.2       51.24 ±  2%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      3.00 ±  4%     +48.2       51.24        perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.00 ±  4%     +48.3       51.32        perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.02 ±  4%     +48.3       51.36 ±  2%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      3.02 ±  4%     +48.3       51.36 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      3.02 ±  4%     +48.3       51.36 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     90.11           -44.3       45.80 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     89.76           -44.1       45.66 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
     40.08           -31.2        8.92        perf-profile.children.cycles-pp.do_vmi_munmap
     39.27           -30.6        8.64        perf-profile.children.cycles-pp.do_vmi_align_munmap
     31.38           -26.0        5.43        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     29.79           -24.9        4.92        perf-profile.children.cycles-pp.vms_clear_ptes
     30.79           -23.7        7.09 ±  2%  perf-profile.children.cycles-pp.__munmap
     24.51           -23.5        0.97 ±  2%  perf-profile.children.cycles-pp.tlb_finish_mmu
     29.25           -22.8        6.42 ±  2%  perf-profile.children.cycles-pp.__vm_munmap
     29.27           -22.8        6.46 ±  2%  perf-profile.children.cycles-pp.__x64_sys_munmap
     22.06           -22.1        0.00        perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
     21.96           -22.0        0.00        perf-profile.children.cycles-pp.free_pages_and_swap_cache
     21.66           -21.7        0.00        perf-profile.children.cycles-pp.folios_put_refs
     19.89 ±  2%     -19.9        0.00        perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
     19.96           -11.1        8.90        perf-profile.children.cycles-pp.mremap
     19.10           -10.6        8.55        perf-profile.children.cycles-pp.__do_sys_mremap
     18.04            -9.9        8.17        perf-profile.children.cycles-pp.move_vma
     14.70            -8.8        5.94 ±  2%  perf-profile.children.cycles-pp.do_mmap
     12.06            -7.1        4.93 ±  2%  perf-profile.children.cycles-pp.__mmap_region
     30.50            -6.9       23.59 ±  2%  perf-profile.children.cycles-pp.__mmap
     28.23            -5.5       22.74 ±  2%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      8.18            -4.7        3.47 ±  2%  perf-profile.children.cycles-pp.__mmap_new_vma
     10.50            -4.0        6.54        perf-profile.children.cycles-pp.mincore
      6.10            -3.5        2.58 ±  3%  perf-profile.children.cycles-pp.mas_wr_node_store
      4.60            -3.0        1.63 ±  2%  perf-profile.children.cycles-pp.__madvise
      4.94            -2.8        2.19 ±  2%  perf-profile.children.cycles-pp.mas_store_gfp
      5.39            -2.6        2.83 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      3.81            -2.3        1.51 ±  3%  perf-profile.children.cycles-pp.mas_store_prealloc
      6.71            -2.3        4.43        perf-profile.children.cycles-pp.__irq_exit_rcu
      7.06            -2.3        4.79        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.38            -2.2        1.18 ±  2%  perf-profile.children.cycles-pp.__x64_sys_madvise
      7.09            -2.2        4.90        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      3.34            -2.2        1.16 ±  2%  perf-profile.children.cycles-pp.do_madvise
      7.67            -2.2        5.50        perf-profile.children.cycles-pp.__x64_sys_mincore
      3.48            -2.0        1.50 ±  2%  perf-profile.children.cycles-pp.copy_vma
      3.06            -2.0        1.08 ±  2%  perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      2.93            -1.9        1.02 ±  2%  perf-profile.children.cycles-pp.do_mincore
      2.62            -1.7        0.92 ±  3%  perf-profile.children.cycles-pp.mas_find
      3.01            -1.6        1.43 ±  2%  perf-profile.children.cycles-pp.vm_area_alloc
      2.35            -1.5        0.82 ±  2%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      2.26            -1.5        0.79 ±  2%  perf-profile.children.cycles-pp.walk_page_range_mm
      2.25            -1.4        0.81 ±  2%  perf-profile.children.cycles-pp.clear_bhb_loop
      1.82            -1.4        0.41 ±  2%  perf-profile.children.cycles-pp.up_write
      2.44            -1.4        1.05 ±  3%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      2.10            -1.4        0.72 ±  2%  perf-profile.children.cycles-pp.mt_find
      2.19            -1.4        0.82 ±  2%  perf-profile.children.cycles-pp.__get_unmapped_area
      2.04            -1.3        0.75 ±  2%  perf-profile.children.cycles-pp.unmap_vmas
      2.52            -1.3        1.23 ±  2%  perf-profile.children.cycles-pp.__call_rcu_common
      1.84 ±  2%      -1.3        0.56        perf-profile.children.cycles-pp._raw_spin_lock
      1.98            -1.3        0.71 ±  3%  perf-profile.children.cycles-pp.mas_walk
      1.76            -1.2        0.54 ±  2%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      1.82            -1.2        0.63        perf-profile.children.cycles-pp.madvise_vma_behavior
      1.91            -1.2        0.72 ±  2%  perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      1.86            -1.1        0.73 ±  2%  perf-profile.children.cycles-pp.perf_event_mmap
      1.89            -1.1        0.78 ±  3%  perf-profile.children.cycles-pp.vma_link
      1.74            -1.1        0.64 ±  3%  perf-profile.children.cycles-pp.unmap_page_range
      1.66            -1.1        0.57        perf-profile.children.cycles-pp.find_vma
      1.95            -1.1        0.89 ±  2%  perf-profile.children.cycles-pp.mas_preallocate
      1.68            -1.0        0.66 ±  3%  perf-profile.children.cycles-pp.perf_event_mmap_event
      1.54 ±  2%      -1.0        0.58 ±  5%  perf-profile.children.cycles-pp.down_write
      1.57            -1.0        0.60 ±  2%  perf-profile.children.cycles-pp.flush_tlb_func
      1.34            -0.9        0.47 ±  2%  perf-profile.children.cycles-pp.zap_pmd_range
      2.63            -0.8        1.82 ±  2%  perf-profile.children.cycles-pp.vm_area_free_rcu_cb
      1.22            -0.8        0.43 ±  3%  perf-profile.children.cycles-pp.follow_page_mask
      1.80            -0.8        1.04        perf-profile.children.cycles-pp.mas_alloc_nodes
      1.13            -0.7        0.38 ±  3%  perf-profile.children.cycles-pp.zap_pte_range
      1.02 ±  2%      -0.7        0.28 ±  3%  perf-profile.children.cycles-pp.down_write_killable
      1.13            -0.7        0.39 ±  2%  perf-profile.children.cycles-pp.__walk_page_range
      1.22            -0.7        0.49 ±  3%  perf-profile.children.cycles-pp.perf_iterate_sb
      1.17            -0.7        0.44        perf-profile.children.cycles-pp.__cond_resched
      1.16            -0.7        0.43 ±  4%  perf-profile.children.cycles-pp.__mmap_prepare
      1.11            -0.7        0.40        perf-profile.children.cycles-pp.vma_modify_flags_name
      1.07            -0.7        0.37 ±  2%  perf-profile.children.cycles-pp.walk_pgd_range
      1.08            -0.7        0.38 ±  3%  perf-profile.children.cycles-pp.mas_prev_slot
      0.90            -0.7        0.21        perf-profile.children.cycles-pp.down_read
      1.13            -0.7        0.46 ±  2%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      1.09            -0.7        0.42        perf-profile.children.cycles-pp.vm_unmapped_area
      1.05            -0.7        0.38        perf-profile.children.cycles-pp.vma_modify
      1.03            -0.7        0.37 ±  3%  perf-profile.children.cycles-pp.find_vma_prev
      1.04            -0.7        0.38        perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.02            -0.6        0.37 ±  2%  perf-profile.children.cycles-pp.vma_merge_existing_range
      0.96            -0.6        0.32 ±  2%  perf-profile.children.cycles-pp.mas_next_slot
      1.19            -0.6        0.56 ±  4%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      1.09 ±  3%      -0.6        0.48        perf-profile.children.cycles-pp.__memcpy
      0.92 ±  2%      -0.6        0.31 ±  2%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.80            -0.6        0.20 ± 11%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.91            -0.6        0.30 ±  3%  perf-profile.children.cycles-pp.walk_p4d_range
      0.91            -0.6        0.32 ±  3%  perf-profile.children.cycles-pp.mas_wr_store_type
      0.86            -0.6        0.30 ±  4%  perf-profile.children.cycles-pp.mtree_load
      0.81 ±  5%      -0.5        0.27 ±  3%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      1.12            -0.5        0.57 ±  2%  perf-profile.children.cycles-pp.vm_area_dup
      0.94 ±  3%      -0.5        0.41 ±  3%  perf-profile.children.cycles-pp.obj_cgroup_charge
      1.01            -0.5        0.47 ±  7%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.81            -0.5        0.28 ±  3%  perf-profile.children.cycles-pp.move_ptes
      0.76            -0.5        0.24 ±  2%  perf-profile.children.cycles-pp.walk_pud_range
      0.74            -0.5        0.23 ±  3%  perf-profile.children.cycles-pp.follow_page_pte
      0.77            -0.5        0.28 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.90            -0.5        0.40        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.76            -0.5        0.30        perf-profile.children.cycles-pp.unmapped_area_topdown
      0.68            -0.4        0.23 ±  2%  perf-profile.children.cycles-pp.mas_update_gap
      0.72            -0.4        0.28 ±  3%  perf-profile.children.cycles-pp.native_flush_tlb_one_user
      5.84            -0.4        5.41 ±  5%  perf-profile.children.cycles-pp.__slab_free
      0.75            -0.4        0.31 ±  4%  perf-profile.children.cycles-pp.mod_objcg_state
      1.69            -0.4        1.27        perf-profile.children.cycles-pp.___slab_alloc
      0.68            -0.4        0.26 ±  3%  perf-profile.children.cycles-pp.native_flush_tlb_local
      0.61            -0.4        0.20 ±  2%  perf-profile.children.cycles-pp.walk_pmd_range
      0.58            -0.4        0.17 ±  4%  perf-profile.children.cycles-pp.pmd_install
      0.68            -0.4        0.28 ±  4%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.61            -0.4        0.23 ±  2%  perf-profile.children.cycles-pp.mas_pop_node
      0.49            -0.3        0.16 ±  3%  perf-profile.children.cycles-pp.mincore_pte_range
      0.50            -0.3        0.17 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.45 ±  4%      -0.3        0.12 ±  3%  perf-profile.children.cycles-pp.perf_output_begin
      0.60 ±  2%      -0.3        0.27 ±  3%  perf-profile.children.cycles-pp.stress_mmapaddr_child
      0.48            -0.3        0.16 ±  2%  perf-profile.children.cycles-pp.gup_vma_lookup
      0.51            -0.3        0.19 ±  2%  perf-profile.children.cycles-pp.arch_get_unmapped_area
      0.50 ±  2%      -0.3        0.19        perf-profile.children.cycles-pp.mremap_to
      0.53 ±  2%      -0.3        0.22 ±  6%  perf-profile.children.cycles-pp.mas_put_in_tree
      0.46 ±  2%      -0.3        0.16 ±  3%  perf-profile.children.cycles-pp.find_vma_intersection
      0.48            -0.3        0.19        perf-profile.children.cycles-pp.mas_empty_area_rev
      0.44 ±  2%      -0.3        0.16 ±  4%  perf-profile.children.cycles-pp.___pmd_free_tlb
      0.37            -0.3        0.09 ±  4%  perf-profile.children.cycles-pp.tlb_gather_mmu
      0.42            -0.3        0.14 ±  4%  perf-profile.children.cycles-pp.mas_next_range
      0.82            -0.3        0.55        perf-profile.children.cycles-pp.up_read
      0.38            -0.3        0.12 ±  3%  perf-profile.children.cycles-pp.zap_present_ptes
      0.35 ±  2%      -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.___pte_offset_map
      0.43            -0.2        0.20 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.36            -0.2        0.13 ±  7%  perf-profile.children.cycles-pp.mas_prev
      0.34 ±  2%      -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.mas_leaf_max_gap
      0.39            -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.__split_vma
      0.33 ±  2%      -0.2        0.11 ±  6%  perf-profile.children.cycles-pp.mas_next_setup
      0.40            -0.2        0.18 ±  3%  perf-profile.children.cycles-pp.policy_nodemask
      0.26 ±  3%      -0.2        0.06        perf-profile.children.cycles-pp.downgrade_write
      0.32 ±  2%      -0.2        0.12 ±  4%  perf-profile.children.cycles-pp.lru_add_drain
      0.32 ±  2%      -0.2        0.12        perf-profile.children.cycles-pp.unmapped_area
      0.33 ±  2%      -0.2        0.13 ±  4%  perf-profile.children.cycles-pp.mas_rev_awalk
      0.29 ±  3%      -0.2        0.09 ±  7%  perf-profile.children.cycles-pp.uncharge_folio
      0.30 ±  4%      -0.2        0.12 ±  4%  perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.27            -0.2        0.09 ±  5%  perf-profile.children.cycles-pp.__check_object_size
      0.24            -0.2        0.09 ±  4%  perf-profile.children.cycles-pp.mas_prev_node
      0.26 ±  2%      -0.1        0.12 ±  4%  perf-profile.children.cycles-pp.x64_sys_call
      0.24 ±  3%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.___pud_free_tlb
      0.23 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.security_mmap_file
      0.26            -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.get_pfnblock_flags_mask
      0.21            -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.mas_wr_store_entry
      0.22 ±  2%      -0.1        0.09 ±  7%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.19            -0.1        0.06        perf-profile.children.cycles-pp.check_heap_object
      0.21 ±  2%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.mas_prev_range
      0.21 ±  2%      -0.1        0.08 ±  5%  perf-profile.children.cycles-pp.mas_prev_setup
      0.19 ±  2%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.do_munmap
      0.21 ±  2%      -0.1        0.09 ±  7%  perf-profile.children.cycles-pp.stress_mmapaddr_check
      0.18 ±  2%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.mas_ascend
      0.21 ±  2%      -0.1        0.10 ±  5%  perf-profile.children.cycles-pp.commit_merge
      0.18 ±  2%      -0.1        0.07        perf-profile.children.cycles-pp.mas_empty_area
      0.18            -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.cond_accept_memory
      0.18 ±  4%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.vma_merge_new_range
      0.16 ±  2%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.mas_destroy
      0.18 ±  3%      -0.1        0.08 ±  7%  perf-profile.children.cycles-pp.stress_mmapaddr_get_addr
      0.15 ±  2%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.17 ±  2%      -0.1        0.08 ±  5%  perf-profile.children.cycles-pp._find_first_bit
      0.16 ±  3%      -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.mas_data_end
      0.15 ±  3%      -0.1        0.06        perf-profile.children.cycles-pp.__mod_node_page_state
      0.15 ±  3%      -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.13 ±  2%      -0.1        0.04 ± 45%  perf-profile.children.cycles-pp.mincore@plt
      0.13 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.vma_complete
      0.13 ±  2%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.randomize_page
      0.12 ±  4%      -0.1        0.05        perf-profile.children.cycles-pp.mas_anode_descend
      0.13 ±  4%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.local_clock
      0.11 ±  6%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.__task_pid_nr_ns
      0.12            -0.1        0.05        perf-profile.children.cycles-pp.get_random_u64
      0.12 ±  3%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.userfaultfd_unmap_complete
      0.23 ±  3%      -0.1        0.17 ±  2%  perf-profile.children.cycles-pp.setup_object
      0.60 ±  2%      -0.1        0.54 ±  2%  perf-profile.children.cycles-pp.shuffle_freelist
      0.12 ±  3%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.11 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.__count_memcg_events
      0.08            -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.blk_finish_plug
      0.15 ±  2%      -0.0        0.10 ± 19%  perf-profile.children.cycles-pp.refill_obj_stock
      0.10 ±  3%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.native_sched_clock
      0.20 ±  3%      -0.0        0.16 ±  5%  perf-profile.children.cycles-pp.stress_munmap_retry_enomem
      0.23 ±  5%      +0.0        0.26        perf-profile.children.cycles-pp.tick_nohz_handler
      0.19 ±  4%      +0.0        0.22        perf-profile.children.cycles-pp.update_process_times
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.task_tick_fair
      0.24 ±  5%      +0.0        0.27        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.10            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.sched_tick
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.__schedule
      0.00            +0.1        0.08 ± 18%  perf-profile.children.cycles-pp.shmem_write_end
      0.90 ±  2%      +0.1        0.98        perf-profile.children.cycles-pp.allocate_slab
      0.00            +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.shmem_alloc_and_add_folio
      0.00            +0.1        0.13 ± 19%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.06 ±  9%      +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.discard_slab
      0.00            +0.1        0.13 ± 21%  perf-profile.children.cycles-pp.shmem_write_begin
      0.00            +0.2        0.16 ±  7%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.20 ±  2%      +0.2        0.40        perf-profile.children.cycles-pp._copy_to_user
      0.07 ±  8%      +0.2        0.30 ± 16%  perf-profile.children.cycles-pp.generic_perform_write
      0.08 ±  6%      +0.3        0.33 ± 15%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.08 ±  4%      +0.3        0.34 ± 16%  perf-profile.children.cycles-pp.vfs_write
      0.08 ±  8%      +0.3        0.36 ± 14%  perf-profile.children.cycles-pp.ksys_write
      0.08 ±  8%      +0.3        0.36 ± 14%  perf-profile.children.cycles-pp.write
      0.08 ±  4%      +0.3        0.36 ± 14%  perf-profile.children.cycles-pp.record__pushfn
      0.08 ±  4%      +0.3        0.36 ± 14%  perf-profile.children.cycles-pp.writen
      0.08 ±  4%      +0.3        0.38 ± 15%  perf-profile.children.cycles-pp.perf_mmap__push
      0.08 ±  4%      +0.3        0.38 ± 14%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.10 ±  3%      +0.3        0.41 ± 14%  perf-profile.children.cycles-pp.handle_internal_command
      0.10 ±  3%      +0.3        0.41 ± 14%  perf-profile.children.cycles-pp.main
      0.10 ±  3%      +0.3        0.41 ± 14%  perf-profile.children.cycles-pp.run_builtin
      0.09 ±  6%      +0.3        0.40 ± 14%  perf-profile.children.cycles-pp.__cmd_record
      0.09 ±  6%      +0.3        0.40 ± 14%  perf-profile.children.cycles-pp.cmd_record
      2.65            +0.4        3.02        perf-profile.children.cycles-pp.free_pgtables
      2.22            +0.6        2.84        perf-profile.children.cycles-pp.free_pgd_range
      0.50            +0.7        1.18 ±  2%  perf-profile.children.cycles-pp.__p4d_alloc
      0.10 ±  4%      +0.7        0.78 ±  4%  perf-profile.children.cycles-pp.__free_one_page
      0.46            +0.7        1.16 ±  2%  perf-profile.children.cycles-pp.get_zeroed_page_noprof
      2.05            +0.7        2.76        perf-profile.children.cycles-pp.free_p4d_range
      0.46 ±  2%      +0.7        1.19 ±  5%  perf-profile.children.cycles-pp.__free_pages
      1.92            +0.8        2.72        perf-profile.children.cycles-pp.free_pud_range
      3.11            +0.8        3.96        perf-profile.children.cycles-pp.move_page_tables
      1.64            +1.0        2.59 ±  9%  perf-profile.children.cycles-pp._raw_spin_trylock
      1.88            +1.0        2.92 ±  6%  perf-profile.children.cycles-pp.try_charge_memcg
      0.00            +1.1        1.09 ±  4%  perf-profile.children.cycles-pp.free_one_page
      0.45 ±  2%      +1.4        1.87        perf-profile.children.cycles-pp.___pte_free_tlb
      1.98            +1.5        3.50        perf-profile.children.cycles-pp.__pud_alloc
      0.13            +1.6        1.73 ±  9%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.65            +1.6        2.27 ±  7%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.40            +1.7        2.07 ±  7%  perf-profile.children.cycles-pp.__put_partials
      0.00            +1.7        1.73        perf-profile.children.cycles-pp.tlb_remove_table
      0.32 ±  2%      +1.8        2.09 ±  2%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.60 ±  2%      +2.3        2.95 ±  2%  perf-profile.children.cycles-pp.__mod_memcg_state
      3.00            +2.4        5.43 ±  2%  perf-profile.children.cycles-pp.do_anonymous_page
      1.74            +2.7        4.45 ±  2%  perf-profile.children.cycles-pp.get_free_pages_noprof
      3.10            +3.0        6.14 ±  2%  perf-profile.children.cycles-pp.__pmd_alloc
      0.00            +3.4        3.39 ±  3%  perf-profile.children.cycles-pp.free_page_and_swap_cache
      1.10            +3.8        4.88        perf-profile.children.cycles-pp.free_frozen_pages
      3.68            +3.8        7.48        perf-profile.children.cycles-pp.__pte_alloc
      3.04            +4.3        7.30        perf-profile.children.cycles-pp.pte_alloc_one
     12.16            +4.3       16.43 ±  2%  perf-profile.children.cycles-pp.__mm_populate
      2.94            +4.5        7.48 ±  2%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      1.05            +4.6        5.68 ±  2%  perf-profile.children.cycles-pp.clear_page_erms
     11.00            +5.1       16.10 ±  2%  perf-profile.children.cycles-pp.populate_vma_page_range
     10.84            +5.2       16.01 ±  2%  perf-profile.children.cycles-pp.__get_user_pages
      2.04            +5.2        7.22 ±  2%  perf-profile.children.cycles-pp.rmqueue
      0.35 ±  3%      +5.5        5.87 ±  3%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.59 ±  2%      +5.6        6.15 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.50 ±  2%      +6.1        6.59 ±  2%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.08 ±  4%      +6.3        6.38 ±  2%  perf-profile.children.cycles-pp.rmqueue_bulk
      8.71            +6.6       15.30        perf-profile.children.cycles-pp.handle_mm_fault
      8.32            +6.8       15.12        perf-profile.children.cycles-pp.__handle_mm_fault
      4.10           +10.1       14.16        perf-profile.children.cycles-pp.get_page_from_freelist
      8.69           +13.3       21.99        perf-profile.children.cycles-pp.alloc_pages_noprof
      8.64           +13.6       22.28        perf-profile.children.cycles-pp.alloc_pages_mpol
      8.04           +14.0       22.03        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     19.54 ±  2%     +18.5       38.05 ±  2%  perf-profile.children.cycles-pp.uncharge_batch
     19.26 ±  2%     +18.6       37.81 ±  2%  perf-profile.children.cycles-pp.page_counter_uncharge
     19.19 ±  2%     +18.6       37.75 ±  2%  perf-profile.children.cycles-pp.page_counter_cancel
      0.00           +38.2       38.16 ±  2%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.00           +38.2       38.20 ±  2%  perf-profile.children.cycles-pp.__folio_put
      0.00           +44.2       44.17 ±  2%  perf-profile.children.cycles-pp.tlb_remove_table_rcu
      9.68           +46.0       55.64        perf-profile.children.cycles-pp.rcu_do_batch
      9.69           +46.0       55.66        perf-profile.children.cycles-pp.rcu_core
      9.71           +46.0       55.68        perf-profile.children.cycles-pp.handle_softirqs
      3.00 ±  4%     +48.2       51.24        perf-profile.children.cycles-pp.run_ksoftirqd
      3.00 ±  4%     +48.3       51.32        perf-profile.children.cycles-pp.smpboot_thread_fn
      3.02 ±  4%     +48.3       51.36 ±  2%  perf-profile.children.cycles-pp.kthread
      3.02 ±  4%     +48.3       51.36 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
      3.02 ±  4%     +48.3       51.36 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
      2.23            -1.4        0.80 ±  2%  perf-profile.self.cycles-pp.clear_bhb_loop
      1.67            -1.4        0.29 ±  5%  perf-profile.self.cycles-pp.up_write
      1.68 ±  2%      -1.3        0.38 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock
      1.86            -1.2        0.65 ±  2%  perf-profile.self.cycles-pp.mt_find
      1.79            -1.1        0.65 ±  3%  perf-profile.self.cycles-pp.mas_walk
      1.29 ±  2%      -0.8        0.46 ±  5%  perf-profile.self.cycles-pp.down_write
      1.35 ±  5%      -0.8        0.58 ±  6%  perf-profile.self.cycles-pp.mas_wr_node_store
      1.57            -0.7        0.86 ±  4%  perf-profile.self.cycles-pp.__call_rcu_common
      0.79 ±  3%      -0.6        0.16 ±  2%  perf-profile.self.cycles-pp.down_write_killable
      1.18            -0.6        0.56 ±  4%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.73            -0.6        0.13 ±  2%  perf-profile.self.cycles-pp.down_read
      1.04            -0.6        0.44 ±  3%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.75            -0.6        0.17 ± 11%  perf-profile.self.cycles-pp.page_counter_try_charge
      1.01 ±  2%      -0.6        0.45 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.81            -0.5        0.30 ±  4%  perf-profile.self.cycles-pp.mas_wr_store_type
      0.78            -0.5        0.28 ±  3%  perf-profile.self.cycles-pp.mtree_load
      0.73 ±  6%      -0.5        0.23 ±  2%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.75            -0.5        0.26        perf-profile.self.cycles-pp.mas_next_slot
      0.76            -0.5        0.27 ±  3%  perf-profile.self.cycles-pp.mas_prev_slot
      0.75            -0.5        0.27 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.72            -0.4        0.28 ±  2%  perf-profile.self.cycles-pp.native_flush_tlb_one_user
      0.80 ±  4%      -0.4        0.36        perf-profile.self.cycles-pp.__memcpy
      0.79 ±  3%      -0.4        0.36 ±  2%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.73            -0.4        0.32 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.64            -0.4        0.23 ±  3%  perf-profile.self.cycles-pp.mas_find
      0.66            -0.4        0.25 ±  3%  perf-profile.self.cycles-pp.native_flush_tlb_local
      0.60            -0.4        0.20 ±  3%  perf-profile.self.cycles-pp.__cond_resched
      0.56            -0.4        0.20 ±  2%  perf-profile.self.cycles-pp.mas_store_gfp
      0.62 ±  2%      -0.4        0.26 ±  4%  perf-profile.self.cycles-pp.mod_objcg_state
      0.48            -0.4        0.13 ±  2%  perf-profile.self.cycles-pp.flush_tlb_mm_range
      0.46 ±  2%      -0.4        0.11 ±  5%  perf-profile.self.cycles-pp.tlb_finish_mmu
      0.52            -0.3        0.17 ±  2%  perf-profile.self.cycles-pp.__mmap_region
      0.55            -0.3        0.21 ±  3%  perf-profile.self.cycles-pp.mas_pop_node
      0.55            -0.3        0.24 ±  6%  perf-profile.self.cycles-pp.kmem_cache_free
      0.53 ±  2%      -0.3        0.22 ±  3%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.40 ±  3%      -0.3        0.10 ±  4%  perf-profile.self.cycles-pp.perf_output_begin
      0.76            -0.3        0.46 ±  2%  perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.52 ±  2%      -0.3        0.22 ±  2%  perf-profile.self.cycles-pp.___slab_alloc
      0.49 ±  2%      -0.3        0.21 ±  6%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.44            -0.3        0.16 ±  3%  perf-profile.self.cycles-pp.mas_preallocate
      0.48 ±  2%      -0.3        0.21 ±  5%  perf-profile.self.cycles-pp.mas_put_in_tree
      0.51 ±  2%      -0.3        0.24 ±  4%  perf-profile.self.cycles-pp.stress_mmapaddr_child
      0.34 ±  2%      -0.3        0.07 ±  5%  perf-profile.self.cycles-pp.tlb_gather_mmu
      0.74            -0.3        0.48 ±  3%  perf-profile.self.cycles-pp.up_read
      0.42 ±  3%      -0.3        0.16 ±  3%  perf-profile.self.cycles-pp.mincore
      0.46            -0.3        0.20 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.53            -0.3        0.28 ±  3%  perf-profile.self.cycles-pp.rmqueue
      0.36            -0.2        0.12 ±  3%  perf-profile.self.cycles-pp.rcu_all_qs
      0.30            -0.2        0.07 ±  5%  perf-profile.self.cycles-pp.pmd_install
      0.39            -0.2        0.16 ±  4%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.31            -0.2        0.08 ±  8%  perf-profile.self.cycles-pp.__pmd_alloc
      0.31            -0.2        0.08 ±  4%  perf-profile.self.cycles-pp.zap_present_ptes
      0.33            -0.2        0.11 ±  3%  perf-profile.self.cycles-pp.mas_store_prealloc
      0.37            -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.__munmap
      0.34            -0.2        0.12 ±  3%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.36            -0.2        0.14 ±  5%  perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.36 ±  2%      -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.32            -0.2        0.10 ±  4%  perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.32 ±  2%      -0.2        0.11        perf-profile.self.cycles-pp.mas_update_gap
      0.35            -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.76            -0.2        0.55 ±  2%  perf-profile.self.cycles-pp.free_pud_range
      0.48            -0.2        0.28 ±  4%  perf-profile.self.cycles-pp.vm_area_free_rcu_cb
      0.32            -0.2        0.12 ±  5%  perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.36            -0.2        0.16 ±  5%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.30            -0.2        0.09 ±  4%  perf-profile.self.cycles-pp.___pte_offset_map
      0.30            -0.2        0.10 ±  4%  perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.30 ±  2%      -0.2        0.12 ±  6%  perf-profile.self.cycles-pp.__mmap
      0.32            -0.2        0.14 ±  4%  perf-profile.self.cycles-pp.unmap_page_range
      0.37 ±  2%      -0.2        0.19 ±  4%  perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.28 ±  2%      -0.2        0.10 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.29            -0.2        0.12 ±  4%  perf-profile.self.cycles-pp.do_mmap
      0.25 ±  4%      -0.2        0.08 ±  8%  perf-profile.self.cycles-pp.uncharge_folio
      0.26 ±  2%      -0.2        0.10        perf-profile.self.cycles-pp.__x64_sys_mincore
      0.21            -0.2        0.05        perf-profile.self.cycles-pp.__pud_alloc
      0.26 ±  2%      -0.2        0.10 ±  3%  perf-profile.self.cycles-pp.__get_user_pages
      0.22 ±  2%      -0.2        0.08 ±  6%  perf-profile.self.cycles-pp.madvise_vma_behavior
      0.24            -0.1        0.09        perf-profile.self.cycles-pp.mas_rev_awalk
      0.25 ±  5%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.mremap
      0.24            -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.follow_page_mask
      0.23            -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.alloc_pages_mpol
      0.23 ±  2%      -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.alloc_pages_noprof
      0.20 ±  2%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.find_vma_prev
      0.20 ±  2%      -0.1        0.07        perf-profile.self.cycles-pp.mas_prev
      0.22 ±  2%      -0.1        0.09 ±  4%  perf-profile.self.cycles-pp.x64_sys_call
      0.21 ±  2%      -0.1        0.09 ±  4%  perf-profile.self.cycles-pp.policy_nodemask
      0.20 ±  2%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.mas_alloc_nodes
      0.21 ±  2%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.zap_pte_range
      0.21            -0.1        0.09 ±  4%  perf-profile.self.cycles-pp.handle_mm_fault
      0.19            -0.1        0.07        perf-profile.self.cycles-pp.follow_page_pte
      0.29            -0.1        0.17 ±  3%  perf-profile.self.cycles-pp.perf_iterate_sb
      0.18 ±  2%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.___pmd_free_tlb
      0.16 ±  2%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.move_ptes
      0.20 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.22            -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.get_pfnblock_flags_mask
      0.17 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.mas_wr_store_entry
      0.17 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.do_madvise
      0.19            -0.1        0.08        perf-profile.self.cycles-pp.perf_event_mmap_event
      0.17 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.vm_area_alloc
      0.18 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.vm_mmap_pgoff
      0.19 ±  3%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.lru_add_drain_cpu
      0.16 ±  2%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__mmap_new_vma
      0.16 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.flush_tlb_func
      0.16 ±  2%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.mas_ascend
      0.18 ±  2%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.stress_mmapaddr_check
      0.17 ±  2%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.__vm_munmap
      0.16            -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.perf_event_mmap
      0.15 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.__get_unmapped_area
      0.16 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.mas_prev_setup
      0.15 ±  2%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.cond_accept_memory
      0.15 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.security_mmap_file
      0.14 ±  4%      -0.1        0.05        perf-profile.self.cycles-pp.__madvise
      0.14            -0.1        0.05        perf-profile.self.cycles-pp.unmap_vmas
      0.12 ±  4%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.15 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.zap_pmd_range
      0.16 ±  3%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.perf_event_mmap_output
      0.15 ±  2%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.free_pgd_range
      0.14 ±  3%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.free_pgtables
      0.13            -0.1        0.05        perf-profile.self.cycles-pp.mincore_pte_range
      0.13 ±  3%      -0.1        0.05 ±  8%  perf-profile.self.cycles-pp.walk_p4d_range
      0.13 ±  2%      -0.1        0.05        perf-profile.self.cycles-pp.mas_prev_range
      0.12 ±  4%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.vms_clear_ptes
      0.13            -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.__mmap_prepare
      0.14 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.13 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.mas_data_end
      0.14 ±  3%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.stress_mmapaddr_get_addr
      0.13 ±  3%      -0.1        0.07 ±  7%  perf-profile.self.cycles-pp._find_first_bit
      0.12 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.move_vma
      0.10 ±  5%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.___pud_free_tlb
      0.11 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.__mod_node_page_state
      0.08 ±  5%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.vm_area_dup
      0.09            -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.native_sched_clock
      0.10            -0.1        0.05        perf-profile.self.cycles-pp.rcu_do_batch
      0.10 ±  3%      -0.0        0.05 ±  7%  perf-profile.self.cycles-pp.__do_sys_mremap
      0.14            -0.0        0.10 ± 19%  perf-profile.self.cycles-pp.refill_obj_stock
      0.08 ±  9%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.stress_munmap_retry_enomem
      0.25            +0.0        0.27 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.46            +0.1        0.52 ±  4%  perf-profile.self.cycles-pp.free_frozen_page_commit
      0.00            +0.1        0.11 ±  8%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.06 ±  9%      +0.1        0.19 ±  2%  perf-profile.self.cycles-pp.discard_slab
      0.00            +0.1        0.14 ±  6%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.18            +0.2        0.38        perf-profile.self.cycles-pp._copy_to_user
      0.73            +0.4        1.08        perf-profile.self.cycles-pp.get_page_from_freelist
      0.44 ±  2%      +0.6        0.99 ±  2%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.09 ±  4%      +0.6        0.67 ±  4%  perf-profile.self.cycles-pp.__free_one_page
      0.42 ±  2%      +0.7        1.16 ±  5%  perf-profile.self.cycles-pp.__free_pages
      0.64 ±  4%      +0.8        1.40 ±  9%  perf-profile.self.cycles-pp.__memcg_kmem_charge_page
      1.50 ±  2%      +1.0        2.45 ±  9%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.06 ±  6%      +1.1        1.12        perf-profile.self.cycles-pp.rmqueue_bulk
      1.00            +1.5        2.54 ±  6%  perf-profile.self.cycles-pp.try_charge_memcg
      0.29            +1.7        1.99 ±  2%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.00            +3.4        3.36 ±  3%  perf-profile.self.cycles-pp.free_page_and_swap_cache
      0.96            +4.4        5.38 ±  2%  perf-profile.self.cycles-pp.clear_page_erms
      0.35 ±  3%      +5.5        5.87 ±  3%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
     17.98 ±  2%     +19.7       37.65 ±  2%  perf-profile.self.cycles-pp.page_counter_cancel




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

