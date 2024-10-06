Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F7D139D04
	for <oe-lkp@lists.linux.dev>; Sun,  6 Oct 2024 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728226766; cv=fail; b=ivoe+O6SyCNJqogDZGoPwoOeuwb82SGYd6rHSyDKJj2oHxXE1K30+obWz6BvaZ+dBflGJJ5W7QGACd+3f+27SY2jSPY5cBNLcHMxo6cXXQyAsb86KAPyqaJDp+AxsoI0RXeKtenQM0fDFRk5XNuPK7rCsItoZtjsPTvjwzy8lAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728226766; c=relaxed/simple;
	bh=ORLmyAUth8CW9C3INIL1DE651Gce+lLhgURCgYrZoAI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pYsDol1ghjL6kG77Yj3UHPXr6Z/c7v3eYsy9BR8wMN2wPPeH76m4QGEJI3n6Cs9/El9pVQ+gdflBHk7P/oDJUWAM0GkxRA+z46NtrjUPeuawEUm4dhCvEkqo7sSNesiGQ6FewnLc3K32f3d6JmjsoubewrgqZJqwxIH2C8Igv5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRd1dUOY; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRd1dUOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728226764; x=1759762764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORLmyAUth8CW9C3INIL1DE651Gce+lLhgURCgYrZoAI=;
  b=GRd1dUOYJY1G05saawARdbLqQVi6QUCIDdcjwQb74EmMX6K0EnAqV8W/
   +ssEUr8K6Xlq3BXSUv6pM7q9614ry+Lt7qFJLlQmmXllIG7zOEoQM4oUA
   BuvY+UFjz5jlOiW7XAvoZoWJxVf8vH9WBnCB6RYlOT3V/44RKz9vpNVGQ
   JdSNI5qwwo/dutR352kQlu4Vn/mwDKcoxmL+KtjcDDd6ObEX9e1aDNrb7
   r0P6ias6kyUqFhfLGx4ZrMAzeEweZrswldi1hhl5vrBPQOo5g75fF2iiU
   I85fumurerFiCaznipjcsSsseHZcbbxW0sLq2vd1o4sZC2gCPf/B/KvX6
   g==;
X-CSE-ConnectionGUID: PRke1t8jQPe3buM6Yz8/Gw==
X-CSE-MsgGUID: RBIX9YJ9SyqYkdE6Vdgz4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="44851844"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="44851844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 07:59:24 -0700
X-CSE-ConnectionGUID: hDXrKIZ1Th+sEy7T413yAA==
X-CSE-MsgGUID: XznGF10KSP6Hw59q4BZo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="74790352"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2024 07:59:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 07:59:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 07:59:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 6 Oct 2024 07:59:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 6 Oct 2024 07:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c09s5GykLoVqq/TjTcJqA/tic1ZXVsoj4tMMG/eYnIZ+VZ1yNROUgwbE+sm34fHyc6KH4xvHlvr5AN3yJQW7FZEA9/iIGp3G/3VpvMVpfgCG/voKqo0b4Lc3MS8OtE8XWFrugE7edweJ9sOKL1speXsenOx2Yc2UnVnCjJe3e2D0AKPv0PTTmUC4u+j1WKIjKe2yWXkTzWMoIlASiO/0EssqKo+f2hZdPTBEOrYPsHEcXZsF516/ks5rBZhjwWjdFfg41p6usmNx18OfmeXL0P7O/yYJQckGLu8+s9OShSmUoel4qIUB2VR/1JXZFX7NnWcsG+ruQuIdSvR8vfcLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5ZMrPUwNibOks5oHz9F26V3U8XMRYv4QBu8d/2sh9k=;
 b=cCbOuYdpmWtBZmJgpq6xSjRkDDcMaVrTlLFhJ81cou4rSMgffbLiUaYqA0+smLSI1GSwVJ871+BLzoaXV6X5rezR+TKxqjkWEpNtPh1pyB6JHttyW7AjbozxNcQnCnQWbTMV9YaAIM1hxLWX0Gp6O6fTQ1AdDWYG9hf4p6fMhaqZ/TTcn4ymwQDpwBlLDr5UeUU8nOyRrrAg5asxPyqZHgtIv4S+H7D4HYsT/VQWnOHwxUQuw/FG2gXHYPc/Fi9v8DuFwl4dnhnof0s2hLMCZOBgEJVEbbkcX43cYPAeqq6EyIOLDlh2tVyMo+oEHcIk6jy1IkEgIqEpKtTP3eUdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sun, 6 Oct
 2024 14:59:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8026.019; Sun, 6 Oct 2024
 14:59:18 +0000
Date: Sun, 6 Oct 2024 22:59:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-xfs:xfs-group-geometry] [xfs]  c25d94d75e:
 UBSAN:shift-out-of-bounds_in_fs/xfs/libxfs/xfs_rtgroup.h
Message-ID: <202410062222.a048adb5-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: e934e7f8-2557-438c-10c8-08dce61773fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F44ZaXr6jggI1fbsKIqsL/p/dJmSuL1Ya2TjvauqZMhYALMoFcvjeWKUK6UC?=
 =?us-ascii?Q?ZO1cjxjduG7YAgywCpDC3VeQHpYckrR+Onf41vU0dE2xiRqg1iOKywQ22WEq?=
 =?us-ascii?Q?EKQKHmW5Axp+C41re3qXUoUdBTdrIMh9WFRW829ZcUZ/JelknOlns3pkI3Kv?=
 =?us-ascii?Q?smN1PXwcnV9QodPjGp0wDM0Jjdog2fpJseTdeTd72poV3czjaNEYgvXSYTK1?=
 =?us-ascii?Q?R+yQnAkIK/aXCT9Po8c7qjlOX8lRhpxpzaIlAOXHW7FQXZwBhBTQPRtO4DdZ?=
 =?us-ascii?Q?jWxgUKKZvYWZIUcVkjM7Uqlf537THKtRyMHMOaG2Pf7X6QhDBCBWDZias/sI?=
 =?us-ascii?Q?N3P2adpl2Bvyflrg86F20ly55AvHqchYYsqfPMpPYFXOnUE3+r3iP+6FZFN2?=
 =?us-ascii?Q?rRphcwv3FUO3FUWCr4U07GKVkVl8MYjskyubAesTi8B987NGIvNV09YjTkJG?=
 =?us-ascii?Q?Y1WZivXmPmzBJPx+DZRE0N/1bYSg+da3kZZXe7Zpiwm7GsBFbsmOae1ERvQr?=
 =?us-ascii?Q?qlbgicRqwaiYOJhAuhTP3V+YhxJ8FNobPHB5BapOr2/OC340C7Q4gZD3uu/W?=
 =?us-ascii?Q?GUhujyvbNbvtGEmwCNkev/9vjAfhY6sWM9yyIxEzHofN+sYzkE8PPZyNuOeY?=
 =?us-ascii?Q?0teVIVVSDSJdfiZ9MsleZF0mIC5UaOHVf9ZQoFQR6VMgxdxdOgjWu0a+072M?=
 =?us-ascii?Q?m+LcKXk666FMnqimtExNjYA+XXZouyB2+a0D0azzL/lIUUIVkcS+d+azBkLv?=
 =?us-ascii?Q?f4EZ2VAzvq2ZMzacJPeJBnJ0xhxfu98tclHyIzI9+Yc1gGl88lyjSebmlW2/?=
 =?us-ascii?Q?n/mw/cOBQ4nzCBpgkEZkeenTiIpx0yx7EeaDwAA/CNZRWdV1qZggHLGaBCUY?=
 =?us-ascii?Q?uGWWB4nASqUP/JygH/rbLT/V+BSNUShW5ayNoHsP3FkZs6hHxW49FJbYT6AU?=
 =?us-ascii?Q?fXQnBy9i3cFu+ZfcLKWEKaTz5vNwPJseurqXrMbYYdOl9Mpvd4+WCpfryqkW?=
 =?us-ascii?Q?1KI1eqQbXhkKkuwVD/Y8gdz0rcc0qGS8gjVcr6F/KinNbLwevj5kk4qFa/1n?=
 =?us-ascii?Q?e5MEqpm5pMQ8xifoxeikqbjOfGKxp/B6nqwpS6ZDu0e5YjA4EQ1TJZ9p9XBb?=
 =?us-ascii?Q?6WObxhNZdFH+m/dEHwgZ6jvGcTVR57LENYlR+mvM6Ah/uSQcOX/RYltGlF/Q?=
 =?us-ascii?Q?1/OxvDcSJISKKEqwGqdHZ0HgrzTT15RB41civUwPX3zVjWRGjZnSz2snjpzg?=
 =?us-ascii?Q?Ed6TCV8Ylt7dPOU1eWNplQ2unn+EW1zJ6hFPX6IVPjeuSyO3sdOlbZlZG27J?=
 =?us-ascii?Q?Af0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sRBNdUVParRVUvZn9MiA+Ow3ye6kGgdXS/77fXa+DZUwHS60biJHKOVD54V3?=
 =?us-ascii?Q?sxpyCqt4Uu01LDBYa0XsthGZUxWMIn6oNC6+C/3W1ZwiVz7YQBxIUb9UklSD?=
 =?us-ascii?Q?oCCqAfw1KII/O2wxQwZmgx/Q3yWWim7G4Y94ZwpSqYZPpP3w6G4dg2sHMmLf?=
 =?us-ascii?Q?IqgVyyzZ6ymajNgxbSzb3gwdOopGaHzteb4xnjTxbUsXLtxZEgBzrg9mdkZy?=
 =?us-ascii?Q?7Zwl22G8Whla+zo6LFQGLrl5XH02DcyJF7oUglFft8IaGREybd+QwMcprlBy?=
 =?us-ascii?Q?srmAF1eUCCn+QSZjSoY/PoCfxPE73eLJhwbScUPx02BY0ESVdjdOqasXXq86?=
 =?us-ascii?Q?dApvruJvwpeRqJxzZ3czqSvBFAkaauiRywGpQ0IdAGZMLMCB/REYKifLdCue?=
 =?us-ascii?Q?XdtOdhWpfXmMGcJ2FukdiH2LyHu4xVjlrSpxJ5RlnNv7n9zJnPbFRCxcpUtR?=
 =?us-ascii?Q?lKkJcIO5Ju8b/Q8+8hItAcUb5dco9BHp2XUUDoTwmQ1hZ6g7jvX/QGzyvOWq?=
 =?us-ascii?Q?cw6ESFwTlw05mL7E63N2aky4S2QyMi/2natE4uPHNVPTx84PQnwDtleRphIC?=
 =?us-ascii?Q?Tc2EJoZHgwSbD+RXsvspamsVoBbiHkISGKG5GI/T0DfoVVzcI5SZHc6NON88?=
 =?us-ascii?Q?eDv5KxdbkC0FT7xeTgfnR+OMrANNH2CwvAdx14L+6FjmmTEoc6mVv9fzTr++?=
 =?us-ascii?Q?e4UUqkdeNq79UrCHZ+Ox06DJ9cGh8noNyWnFVxXaSh8XGtQAVMYjayjxa5mk?=
 =?us-ascii?Q?8Ra0PEWJTYWz5LOnm61PY58lz9bVZl7ychiZnkM5Swy+8GwLfdz7yWI4XpFX?=
 =?us-ascii?Q?UYYhkH3p0WKL469LAX5RL+UL6M8JH3aBMDtQYg2nJpdYqTcFTFr27vUbA/fP?=
 =?us-ascii?Q?DdBKu80f1eWtecarpqClAfK0F53mu+Lx4qgypJFxAieYti5kBhi38jgl7Ntl?=
 =?us-ascii?Q?nTmFWAvf1IiFyzMKFz2NNVApTyez1fTXLnjBaiSSYCHmVsK65hAPH9VEXXRu?=
 =?us-ascii?Q?rAntGz7rSeefOJ96h2BA/+NQSA114EZfv/hBzYCFIcKsPKcTSsFSHcO6bRh8?=
 =?us-ascii?Q?KaQ/0IH41DYB2lHoOryATU4ohBmqUQIflQPvJPji775rqoWKYaZdqmPrn+/+?=
 =?us-ascii?Q?hSG17fDAy8uVCL7duFZNZMTcacodYNB1vqZMGZMf6+C1fpIOJlmxU8WzAosV?=
 =?us-ascii?Q?tX2a5fMYQy4RYQw3T+kK62JNqYEW0jyWVxIey3eJhFyW5HqZR8A2uPJgY9QU?=
 =?us-ascii?Q?aAM7WgsbBbMqvfWglFH9EUN51wxdaRjCPuCKpu3HO+do+i7nLWncmtx2wXcB?=
 =?us-ascii?Q?6aSN8XXmfFasVwPCkeNrAKnipmXWaBHlS2J17wdg2m1qFir7ZPmqchT75jxt?=
 =?us-ascii?Q?47oUMs5KlYoDsy0CM7aAnJSsVa5CYXMDMJae3q1yB3MZzaIEPuLdLq3iN/7H?=
 =?us-ascii?Q?cImFK1/RHz22oGM76p4hmjXa3M6WB/8DuFRSn5+puygmYY/HpWPzgLMQfviJ?=
 =?us-ascii?Q?97UU8uuH0on1JANNB0A7e1EiRLvodrWmL+F1v4qGKYAroN0iD9XF81RxKrdF?=
 =?us-ascii?Q?G9y4vlmMj8q5ghDtblCqyj7gAQc8siPArVDl7dhl/232jxaxfft4c9t4BaL+?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e934e7f8-2557-438c-10c8-08dce61773fc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 14:59:18.5524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbJaFkwuVDKCzXHKJ77GHVRwP+TTnCCivfSRbeZRATQdKkjXk8h4TFW5WqwXmj455pola37pm4npzXlXAV7eaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_fs/xfs/libxfs/xfs_rtgroup.h" on:

commit: c25d94d75e31b9b09ae00ab33933dfa237f250d7 ("xfs: open code the bno translation in xfs_daddr_to_rtb")
git://git.infradead.org/users/hch/xfs xfs-group-geometry

in testcase: xfstests
version: xfstests-x86_64-f71228e3-1_20240930
with following parameters:

	disk: 4HDD
	fs: xfs
	test: xfs-090



compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410062222.a048adb5-oliver.sang@intel.com


[   75.599826][ T2435] ------------[ cut here ]------------
[   75.605173][ T2435] UBSAN: shift-out-of-bounds in fs/xfs/libxfs/xfs_rtgroup.h:267:30
[   75.614777][ T2435] shift exponent 138 is too large for 64-bit type 'long long unsigned int'
[   75.623245][ T2435] CPU: 2 UID: 0 PID: 2435 Comm: xfs_scrub Tainted: G S                 6.12.0-rc1-00220-gc25d94d75e31 #1
[   75.634314][ T2435] Tainted: [S]=CPU_OUT_OF_SPEC
[   75.638938][ T2435] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[   75.648512][ T2435] Call Trace:
[   75.651660][ T2435]  <TASK>
[ 75.654462][ T2435] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1)) 
[ 75.658829][ T2435] __ubsan_handle_shift_out_of_bounds (lib/ubsan.c:232 lib/ubsan.c:468) 
[ 75.665119][ T2435] xfs_getfsmap_rtdev_rtbitmap.cold (fs/xfs/./xfs_trace.h:2141) xfs
[ 75.672058][ T2435] ? xfs_trans_alloc (include/linux/kernel.h:73 include/linux/percpu-rwsem.h:49 include/linux/fs.h:1716 include/linux/fs.h:1899 fs/xfs/xfs_trans.c:266) xfs
[ 75.677709][ T2435] ? __pfx_xfs_getfsmap_rtdev_rtbitmap (fs/xfs/xfs_fsmap.c:756) xfs
[ 75.684719][ T2435] ? xfs_trans_alloc_empty (fs/xfs/xfs_trans.c:333) xfs
[ 75.690690][ T2435] ? __pfx_xfs_trans_alloc_empty (fs/xfs/xfs_trans.c:333) xfs
[ 75.697181][ T2435] xfs_getfsmap+0x7ad/0xd10 xfs
[ 75.703403][ T2435] ? __pfx_xfs_getfsmap+0x10/0x10 xfs
[ 75.710144][ T2435] ? __pfx_rmqueue_bulk (mm/page_alloc.c:2284) 
[ 75.715029][ T2435] ? __lruvec_stat_mod_folio (mm/memcontrol.c:779) 
[ 75.720529][ T2435] ? __pfx_xfs_getfsmap_rtdev_rtbitmap (fs/xfs/xfs_fsmap.c:756) xfs
[ 75.727531][ T2435] ? __pfx_xfs_getfsmap_datadev_bnobt (fs/xfs/xfs_fsmap.c:665) xfs
[ 75.734447][ T2435] ? __kmalloc_large_node_noprof (arch/x86/include/asm/bitops.h:417 include/asm-generic/getorder.h:46 mm/slub.c:4239) 
[ 75.740122][ T2435] ? __kvmalloc_node_noprof (mm/util.c:661) 
[ 75.745444][ T2435] xfs_ioc_getfsmap (fs/xfs/xfs_fsmap.c:1293) xfs
[ 75.750975][ T2435] ? __pfx_xfs_ioc_getfsmap (fs/xfs/xfs_fsmap.c:1240) xfs
[ 75.757057][ T2435] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
[ 75.761599][ T2435] ? __mod_memcg_state (mm/memcontrol.c:569 mm/memcontrol.c:683) 
[ 75.766574][ T2435] ? lru_add (include/linux/list.h:150 include/linux/list.h:169 include/linux/mm_inline.h:329 mm/swap.c:199) 
[ 75.770686][ T2435] xfs_file_ioctl (fs/xfs/xfs_ioctl.c:1286) xfs
[ 75.776156][ T2435] ? __pfx_xfs_file_ioctl (fs/xfs/xfs_ioctl.c:1213) xfs
[ 75.782031][ T2435] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
[ 75.787264][ T2435] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
[ 75.793014][ T2435] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
[ 75.798767][ T2435] ? __lruvec_stat_mod_folio (mm/memcontrol.c:786) 
[ 75.804262][ T2435] ? __count_memcg_events (mm/memcontrol.c:569 mm/memcontrol.c:832) 
[ 75.809408][ T2435] ? __do_huge_pmd_anonymous_page (mm/huge_memory.c:1222) 
[ 75.815334][ T2435] ? __pfx_do_vfs_ioctl (fs/ioctl.c:805) 
[ 75.820219][ T2435] ? __handle_mm_fault (mm/memory.c:5626 mm/memory.c:5865) 
[ 75.825281][ T2435] ? __pfx___might_resched (kernel/sched/core.c:8586) 
[ 75.830435][ T2435] ? __pfx___might_resched (kernel/sched/core.c:8586) 
[ 75.835580][ T2435] ? rseq_get_rseq_cs (kernel/rseq.c:201) 
[ 75.840367][ T2435] ? rseq_ip_fixup (kernel/rseq.c:257 kernel/rseq.c:291) 
[ 75.844991][ T2435] ? __count_memcg_events (mm/memcontrol.c:569 mm/memcontrol.c:832) 
[ 75.850152][ T2435] ? __pfx_rseq_ip_fixup (kernel/rseq.c:275) 
[ 75.855141][ T2435] ? fdget (include/linux/file.h:63 fs/file.c:1150 fs/file.c:1155) 
[ 75.859069][ T2435] __x64_sys_ioctl (fs/ioctl.c:52 fs/ioctl.c:907 fs/ioctl.c:893 fs/ioctl.c:893) 
[ 75.863712][ T2435] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 75.868100][ T2435] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   75.873869][ T2435] RIP: 0033:0x7f7a00423c5b
[ 75.878157][ T2435] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
All code
========
   0:	00 48 89             	add    %cl,-0x77(%rax)
   3:	44 24 18             	rex.R and $0x18,%al
   6:	31 c0                	xor    %eax,%eax
   8:	48 8d 44 24 60       	lea    0x60(%rsp),%rax
   d:	c7 04 24 10 00 00 00 	movl   $0x10,(%rsp)
  14:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  19:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  1e:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  23:	b8 10 00 00 00       	mov    $0x10,%eax
  28:	0f 05                	syscall 
  2a:*	89 c2                	mov    %eax,%edx		<-- trapping instruction
  2c:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
  31:	77 1c                	ja     0x4f
  33:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  38:	64                   	fs
  39:	48                   	rex.W
  3a:	2b                   	.byte 0x2b
  3b:	04 25                	add    $0x25,%al
  3d:	28 00                	sub    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	89 c2                	mov    %eax,%edx
   2:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
   7:	77 1c                	ja     0x25
   9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   e:	64                   	fs
   f:	48                   	rex.W
  10:	2b                   	.byte 0x2b
  11:	04 25                	add    $0x25,%al
  13:	28 00                	sub    %al,(%rax)
	...
[   75.897628][ T2435] RSP: 002b:00007f79fd7ff9f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   75.905907][ T2435] RAX: ffffffffffffffda RBX: 00007ffc33999770 RCX: 00007f7a00423c5b
[   75.913745][ T2435] RDX: 00007f79f7000010 RSI: 00000000c0c0583b RDI: 0000000000000004
[   75.921582][ T2435] RBP: 00007f79fd7ffab0 R08: 00000000ffffffff R09: 0000000000000000
[   75.929418][ T2435] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffc33999770
[   75.937255][ T2435] R13: 00007f79f7000010 R14: 00005622445907f0 R15: 00007f79fd000000
[   75.945106][ T2435]  </TASK>
[   75.948069][ T2435] ---[ end trace ]---
[   76.024047][ T2458] XFS (sda4): Unmounting Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   76.542912][ T2607] XFS (sda4): Mounting V5 Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   76.571836][ T2607] XFS (sda4): Ending clean mount
[   76.666180][ T2645] XFS (sda4): EXPERIMENTAL online scrub feature in use. Use at your own risk!
[   77.448019][ T2687] XFS (sda4): Unmounting Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   77.901786][ T2836] XFS (sda4): Mounting V5 Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   77.930459][ T2836] XFS (sda4): Ending clean mount
[   78.024282][ T2874] XFS (sda4): EXPERIMENTAL online scrub feature in use. Use at your own risk!
[   78.742112][ T2913] XFS (sda4): Unmounting Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   79.224660][ T3062] XFS (sda4): Mounting V5 Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   79.255998][ T3062] XFS (sda4): Ending clean mount
[   79.287012][ T3075] XFS (sda1): Unmounting Filesystem 2fa3d713-9833-413f-b8a5-2ffac0b38dd5
[   79.386961][ T3090] XFS (sda4): EXPERIMENTAL online scrub feature in use. Use at your own risk!
[   79.825997][ T3132] XFS (sda4): Unmounting Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   80.369323][ T3278] XFS (sda4): Mounting V5 Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   80.420613][ T3278] XFS (sda4): Ending clean mount
[   80.436692][ T3288] XFS (sda4): Unmounting Filesystem 6e2ec410-787c-429d-adc1-1a752f129ff6
[   80.509772][  T286] xfs/090       _check_dmesg: something found in dmesg (see /lkp/benchmarks/xfstests/results//xfs/090.dmesg)
[   80.509782][  T286]
[   80.523442][  T286]
[   80.523448][  T286]
[   80.530064][  T286] Ran: xfs/090
[   80.530086][  T286]
[   80.535892][  T286] Failures: xfs/090
[   80.535898][  T286]
[   80.542180][  T286] Failed 1 of 1 tests



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241006/202410062222.a048adb5-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

