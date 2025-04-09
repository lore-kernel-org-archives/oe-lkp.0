Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D5442C
	for <oe-lkp@lists.linux.dev>; Wed,  9 Apr 2025 03:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744170832; cv=fail; b=suKMpJodoFKmF2mGtYTtcYReZ15yBi07icz+qLWW4V5PZSPPoCPIvctyimq9BTo5ZYOXmqy2yM/QFPCRqLOyL71RyQ9+yMUDvGZ2AjdFbcs/PBBasg+LQ2iAfDH1oJQqIlhLd80LZf10jo1R8n3WGvRVcqQGDxf0nMiFwlxY+8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744170832; c=relaxed/simple;
	bh=5r2My6XAV03t2oN1ZFRfsD2OoqSZPaU3cE4Z1KkTYZg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BWrRoNkVI3vd5ItFes+GLfM3spcws5PikXAs7IUvIpD/VygfgnGzqpeoVbcTjIme5pgEFRH4rdjOVW1d5c4YhqfO4YxITf80jeQArnWM53pH0LgSd+5TfRSf4Jh3hhIiCuoQMc6gPXETyi7MfBitrV85Vqwz3ybSq4YxNnM/I7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3nxjays; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3nxjays"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744170830; x=1775706830;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=5r2My6XAV03t2oN1ZFRfsD2OoqSZPaU3cE4Z1KkTYZg=;
  b=l3nxjayswJ2sL9OX8q3vrWjbjU+B2AE4BYfAszjHpN0VrLPk9+qwqQEW
   AdYs4XXyqceKsdnrSk6lXl5NAXe0af8KL/utFk9OZwAuIXPxOFAZfH3DI
   nMKrbMT5MeBCQ5NlXqxqoVd9TNpTG/mcKsSs/kc1kSKJxys70pnPN+7vt
   iXpAP/SAchqz/HwUzeHsroW1171NhwCnDZf1vq+gm9v/XImEyakPx3R/a
   OHtBzrCgQZ7OnAFlikoNt5abYdZ/yRJnFRAzAczdnTdf4q5byGk9kDB95
   oM08MBYFgqF82mALbkTO4XdGnOTT4x5Gu8Ct4hcxFZSGj6foXIo6Yg1YK
   Q==;
X-CSE-ConnectionGUID: jvM49S/BQiqdCSIkAF8bVg==
X-CSE-MsgGUID: l4WaWnDtSXGwwtbfrbBXkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56998985"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="56998985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 20:53:50 -0700
X-CSE-ConnectionGUID: jOyrAggNT+e9jIKNtrZ5vg==
X-CSE-MsgGUID: cyr7l2bdSfmgoQV3lMmvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="151651918"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 20:53:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 20:53:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 20:53:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 20:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3/vJizEwBuSzQB0ETwTuwMpqKefaLXGkIRGLJRjod8+94OIjR0fej002QVuFFPEfyRtGTcE8hoWPfrkJotIkjwuGNjUfmp3PuhAW33Qhzwj2jVksvWmgwKWeTr2Egeazr3ja4oFKllkbJLne/7x8AIs9OAMwSCSxfvXFT275hY9xCIH9O8axQ2gTzO5hfGOjMwC/yGWH0GIrqeqY5oRYLUuDYyz4XCCZR/MIJKpEBAugoAUDukLH2fwaqpHv+wjmzfFg9r0EoKUggpmpSd27BqRm2HqXcH8w/0ZhiE1t4g1Fanp1ZcTT0CgtpmdmR35DEV+bdfs39oOhyD2JqmKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHBNqGpKZ/VoBNV2v0BluwTO6GToBkLEJs1OQZhlQbM=;
 b=afCBVsl+ETYOF0LsD9pbH7hFORfZ2z14ydIIVf5toHlo2sB1MO2w7rx7a5QzZgHcRhAzy1PUicDIAzLl7sDQ+cSS4BE3CHW6/P8WZrT0/+RQr9ysUsn/PYHqjXCSkjOxO5wCo+S7EjDW36LZDRQuJpj1/Sgtp5TdxgIKVw54cToggzt9ggPTMt73k+uyTALU1l9V47XnZ+Lyxr5SFf8oVrjpvwOZnJxfg80JOs/nnUQhjPrAHDNC8O4h4/2W4XlQ/fTFeF7XCy0+MslcZu3HdQOVHbJ8DWHdzIEmW712PSB6Y0cwiueFW3JVGHT3f4xcG3O6yYv9QLl0WGgDLh4vXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 9 Apr
 2025 03:53:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 03:53:45 +0000
Date: Wed, 9 Apr 2025 11:53:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [anolis-intel-cloud:devel-6.6] [sched/fair]  17423e1807:
 stress-ng.nanosleep.ops_per_sec 10.7% improvement
Message-ID: <202504091001.84420816-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 0146e8e2-3bf3-45e5-8bd6-08dd771a204e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ygQnR9RHiCGZHdHDkwjfHCcpSYDPxp6o23j65CYdhJh5ETbEN2tPn+ESDT?=
 =?iso-8859-1?Q?uNvhQbkP6Cswxy3rhZcpa7kd0mfqU6yl8XNseTaXMpkjSJcgUpyaJaZ9hq?=
 =?iso-8859-1?Q?//nqoCCvx6Ffe8NRszh51paNqPQqqpQUqa/byXzHQq8dH1AuhTxIsBRF1Q?=
 =?iso-8859-1?Q?QuZIW+XJuqUwupNYlU1l+DFi7Tf6YMcMtkE5w2v8kaeU3L7/vJ+aTNu1gy?=
 =?iso-8859-1?Q?Jci9OEZ5ie1brmZowCymqJ/CDW5gRXzLXYBPFeXXH39MJqrC25i0J0bIfM?=
 =?iso-8859-1?Q?iuBRSKEH8Jse8tI9mHearJwcpJeIks2orDTDJm9WFlL/EnQ8wP23ejkEf3?=
 =?iso-8859-1?Q?neWE6QhHMr+mh/Icj/6+2YF17OJI66WpyYucJXPEj9uGhUQ1ZpojGexPIN?=
 =?iso-8859-1?Q?9kgvlTW4sLpfxL4+WYtdalUIqh7aP5S2Q0YuZajYNxELd1cEYjNEKvvXX8?=
 =?iso-8859-1?Q?2Fj/Yun89OBA/5hUPa6JsaZEAweB460nzGg5V91fppuM9HDS5OXFSAepqc?=
 =?iso-8859-1?Q?sClS0JWwVvUd0g1UOkHOfGRLs22ygdy6Rw5UVx4R4/XQhKj/dvlrak4HSR?=
 =?iso-8859-1?Q?EpCKrGgW5ZzDZFby6WcZVcwEOi8PifZ6D1bMbnmWMvYVwpXiqkakhtoNsc?=
 =?iso-8859-1?Q?sZ+LVI86CuX5K3LGZA9AZoacqPNIx4rIIj6l34typntWUa0gog7JMUaTnm?=
 =?iso-8859-1?Q?zPIlePGprLRWTanbqOsztlAR4to2RBCOK7OOOamB2pMiPw8YLaxY/T0/31?=
 =?iso-8859-1?Q?XdnIRZ1FsnJOuiDzs1JuFipSSKdh9wsQsEZ0uhrEyh4Opq42XpvfPIxdjw?=
 =?iso-8859-1?Q?8Z/z/b2/eCyDYhOCPOxP0wP9Ct3o8AmWKq7RagMd8YSNbsuhoMyFqm4WfU?=
 =?iso-8859-1?Q?yJvvXA4yxDzDYdbQFFxpvDQ4dIChQXzqxzQv4B3QMgRJHSc6aKOh0Exc5p?=
 =?iso-8859-1?Q?I3JtrKcT1RiOINswTcGdOdYduWueOuBezErd6V15u1na+66PFglKBAQjab?=
 =?iso-8859-1?Q?0kMyz08uIxEhx9d5nzZNs/hQQjy8LYS6yT+TomkSMRYArr/Qmt4/BStK1I?=
 =?iso-8859-1?Q?k+20u4XkfVHthy3QP6qgXSkcnO8AwzAwzz2V02uOgAdPOvVZrOhkrX2z1Y?=
 =?iso-8859-1?Q?ctkdPDQlUTUMl7xqp3Jeh1aI3XU2o0Aelp6+NtAeNolK1OEYvkpZ4nkJqD?=
 =?iso-8859-1?Q?AvoGL2iENruMnnPDVaDsQBA58Ac6Dn8BIsEVN3fwT0fL1cq6tKM0stw7t0?=
 =?iso-8859-1?Q?diFavFJrsjSdlJIQ7EQEpngnkCxVNP325/QC3pWbhSredonSy0nBSvXy05?=
 =?iso-8859-1?Q?SFptyPDpW0lQlPVx6FAD0ABAbmq5nSubtqULKQc01M3vjPa8/qljfKN9OM?=
 =?iso-8859-1?Q?nLbjbtacTl5s+IemIa2zU6lm85kDIe0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xeYfDVQIbrdsEtxPcu+ECFqNhN1kAWvs6FPZ4BFMkrKEF+QSiNVm45C+/w?=
 =?iso-8859-1?Q?0xS2OS6EzlAsL5MfeaEAiUsg/f8YtaKtv6VezDurjsXHsGJK6nineH5R2/?=
 =?iso-8859-1?Q?psaIEPmAWOSH21oZwwNY2FRmtEgGKNQZsxe2QoOrAq+JO2dwKYipoUtHng?=
 =?iso-8859-1?Q?fofXkcLOQrnhxlhRpGRIHNMx+F9oGLg5U3GBoLS8V1PcS8iTFUxbcAuxQ8?=
 =?iso-8859-1?Q?8fLqTwFAbSUHeI+BDSJnJOp9bHu5KcrmXEmpCaH1q/bAjkEk9z/XEECZ/A?=
 =?iso-8859-1?Q?Tele9/UjgaNklCYXIffOyEbjCG0Q0FSslUESMNbKSk+ofDJ3ltpxE3/VP9?=
 =?iso-8859-1?Q?IBXcFGcNIQiho7201AdRAY0z6tcCtk+0kpJjz7KCI6Ms2Y9owhjYwb4e5F?=
 =?iso-8859-1?Q?28Zj/5FPwYOkWl+jClNYudqWQfkt9g2VoEeuoiaN8ZRjMDInjVtZAaeNos?=
 =?iso-8859-1?Q?C/1r32WzGR+N0I0jaC5QkeidNS5hYE1rZLi51s7pKqRdZWSNao6fPHndri?=
 =?iso-8859-1?Q?DdzzmUmpjOjQ4OBsSiRkSISEdi9bQWL6EO9vt/rOqCTbsa2Ujr4oeGR2kg?=
 =?iso-8859-1?Q?QdIpbRJSugP3+bzy6rRsCmGVxcZ3dsMYmgGe4IFSyHN1lVxxRjkukcg7Ol?=
 =?iso-8859-1?Q?nsCpOF//15mFriq1h+2vGt8d2N9xeRRsU34R6W36iaaN2bBfOzoJW0oB2d?=
 =?iso-8859-1?Q?KU7fOreoVq7w1I24MlzI+Y9oYDdh0eb4aljpO2wdk3rmWNdkURc/9j9pmT?=
 =?iso-8859-1?Q?ejZLUmB6fWVxeaaIanQPv7zFMsJycAig1P9EreLTzb4teuu21ALpip1cMr?=
 =?iso-8859-1?Q?2yJbxNFUxUISH8wgXQHahJxSICpngPryxP4cSWGxX7CHwlnQh0NTtZLkpS?=
 =?iso-8859-1?Q?VaJMMc6342ElTRuWKJbaxVMCPsXMvE7ZoPYaMN3INQE6jlB9ia6BNxZ0rB?=
 =?iso-8859-1?Q?jpCAIYiIukaZY8S79prNye854A+D8rWIXw2piOkERSvXNXlEth3hznOcGx?=
 =?iso-8859-1?Q?TiG0kC/FvGzf0LBFh42kEqlh4U08NoeOjkKP4fRdfdrJWsxg1Jtfc54/KB?=
 =?iso-8859-1?Q?i31VCQXuGqHZw2aoL2bEPrjsC+JsuEm5KPI7G+Q+/x/isycWrk/V9KTYE8?=
 =?iso-8859-1?Q?jXnH450Ks9lfEB5YdocQyJ2laG6xo/b0dMRzoc5BDbqse10R2nKUPf80r0?=
 =?iso-8859-1?Q?8Z+RuCEZR9S02TpnpUM3vWlTFBN4+oFCExvSPjOJOumh3XIYoHhtBwyM3M?=
 =?iso-8859-1?Q?kyvoi+c2icPNkmak5Xixip/D/q51e24J4osyyGWZr1lSIETWHHI6ogZUwg?=
 =?iso-8859-1?Q?QrzVAZmBonFp/X3byOMeuKA1Z6WZZTvZ6LV6gqWnvq55IDMmbFCoGPnLrT?=
 =?iso-8859-1?Q?vfX+xEa5tNVrhgG7q+KESQwMft6VbKOqj/pAJKt13c6/ky1K2u3e66zG/p?=
 =?iso-8859-1?Q?0cujEJvzmcVO7dsQuze49ZhpKEBMMmPxCyMFCSh4rvZh8dSdIUvyADAij3?=
 =?iso-8859-1?Q?nOjcPKBRj50KTO041VflNB6qkdV2jkZ27XajKRA0ENmzLKI3jpgJ2b2EXG?=
 =?iso-8859-1?Q?4xhH+Dbk0686/mfjlA9Di5s1tjBRkrILgyFxdDErOR+v4xsix9lurMpZ+G?=
 =?iso-8859-1?Q?7wwHQnYc55UXrd8l0VYaDaYYOVTuhS61Xqz+83vD6z8H6dR+zEFKRR7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0146e8e2-3bf3-45e5-8bd6-08dd771a204e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 03:53:45.5343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sP9KDMYKj/LsLo1FlMjAG46YM8xOyP+BecoDY/G0rkaepTsEudqGK3roAiTljL3HIufwKSdu4SFp2yYBy2wWXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 10.7% improvement of stress-ng.nanosleep.ops_per_sec on:


commit: 17423e180741da4531140c94770850aefa730484 ("sched/fair: Implement delayed dequeue")
https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6

testcase: stress-ng
config: x86_64-anolis-intel-cloud-devel-6.6
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: nanosleep
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250409/202504091001.84420816-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-anolis-intel-cloud-devel-6.6/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-1ap1/nanosleep/stress-ng/60s

commit: 
  44a2c16652 ("sched: Teach dequeue_task() about special task states")
  17423e1807 ("sched/fair: Implement delayed dequeue")

44a2c16652b10070 17423e180741da4531140c94770 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    159537 ±  7%      +9.3%     174379        perf-c2c.HITM.total
     47.10 ± 11%     +45.5%      68.54 ± 22%  vmstat.cpu.id
 6.697e+09 ± 33%    +286.3%  2.587e+10 ± 90%  cpuidle..time
 2.647e+08           +29.5%  3.427e+08 ±  5%  cpuidle..usage
     45.49 ± 12%     +22.4       67.90 ± 23%  mpstat.cpu.all.idle%
     35.27 ± 10%     -15.3       20.00 ± 50%  mpstat.cpu.all.irq%
     13.30 ± 11%      -5.2        8.08 ± 50%  mpstat.cpu.all.sys%
  16365358 ±  3%     +15.5%   18903961 ±  9%  meminfo.Cached
  14034617 ±  3%     +13.8%   15975118 ±  7%  meminfo.Inactive
  14034617 ±  3%     +13.8%   15975118 ±  7%  meminfo.Inactive(anon)
  21120808 ±  2%     +10.6%   23361490 ±  6%  meminfo.Memused
  12933270 ±  4%     +19.6%   15471871 ± 11%  meminfo.Shmem
  21225306 ±  3%     +13.3%   24049958 ±  8%  meminfo.max_used_kB
      2.35 ± 40%     -53.7%       1.09 ± 34%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1.33 ± 37%     -51.2%       0.65 ± 34%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
      1.12 ± 41%     -53.9%       0.52 ± 35%  sched_debug.cfs_rq:/.removed.util_avg.avg
      0.00 ± 21%     -59.5%       0.00 ± 36%  sched_debug.cfs_rq:/.spread.avg
      0.01 ± 33%     -62.5%       0.00 ± 42%  sched_debug.cfs_rq:/.spread.max
      0.00 ± 20%     -57.3%       0.00 ± 34%  sched_debug.cfs_rq:/.spread.stddev
      2.27 ± 21%    +109.8%       4.76 ± 41%  sched_debug.cfs_rq:/.util_est_enqueued.avg
   4134707 ± 18%     +92.8%    7971120 ± 26%  sched_debug.sysctl_sched.sysctl_sched_features
    108551           -19.5%      87330 ±  3%  stress-ng.nanosleep.nanosec_sleep_overrun
  19985776           +10.7%   22114866        stress-ng.nanosleep.ops
    333073           +10.7%     368556        stress-ng.nanosleep.ops_per_sec
   4574701 ±  3%    +145.5%   11230560 ±  5%  stress-ng.time.involuntary_context_switches
      5013           +11.4%       5585        stress-ng.time.percent_of_cpu_this_job_got
      2169            +9.8%       2381        stress-ng.time.system_time
    855.33           +15.5%     988.12 ±  2%  stress-ng.time.user_time
 5.201e+08           +10.6%  5.754e+08        stress-ng.time.voluntary_context_switches
   4312961            -1.3%    4256986        proc-vmstat.nr_dirty_background_threshold
   8636468            -1.3%    8524381        proc-vmstat.nr_dirty_threshold
   4093007 ±  3%     +15.5%    4727138 ±  9%  proc-vmstat.nr_file_pages
  43498733            -1.3%   42938160        proc-vmstat.nr_free_pages
   3508960 ±  3%     +13.8%    3994413 ±  7%  proc-vmstat.nr_inactive_anon
   3234985 ±  4%     +19.6%    3869115 ± 11%  proc-vmstat.nr_shmem
   3508960 ±  3%     +13.8%    3994413 ±  7%  proc-vmstat.nr_zone_inactive_anon
   5704406            +5.0%    5988157 ±  2%  proc-vmstat.numa_hit
   5704379            +5.0%    5988157 ±  2%  proc-vmstat.numa_local
   5917395            +5.0%    6215578        proc-vmstat.pgalloc_normal
      2.02 ±  8%      -0.5        1.49 ± 28%  perf-stat.i.branch-miss-rate%
 4.523e+09 ± 10%     -44.5%  2.512e+09 ± 51%  perf-stat.i.cache-references
 4.725e+11 ± 10%     -40.1%  2.831e+11 ± 51%  perf-stat.i.cpu-cycles
    381854 ± 11%     -41.6%     222834 ± 50%  perf-stat.i.cycles-between-cache-misses
      1.71            -0.1        1.62        perf-stat.overall.branch-miss-rate%
      0.36            +0.1        0.47 ± 10%  perf-stat.overall.cache-miss-rate%
      3.54            -8.9%       3.22        perf-stat.overall.cpi
     28600           -16.3%      23934 ±  9%  perf-stat.overall.cycles-between-cache-misses
      0.28            +9.8%       0.31        perf-stat.overall.ipc
 4.435e+09 ± 11%     -43.7%  2.497e+09 ± 49%  perf-stat.ps.cache-references
 4.615e+11 ± 10%     -39.5%  2.794e+11 ± 49%  perf-stat.ps.cpu-cycles
 8.506e+12            +5.4%  8.969e+12        perf-stat.total.instructions
     44.51            -1.9       42.61        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
     43.75            -1.9       41.86        perf-profile.calltrace.cycles-pp.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
     43.73            -1.9       41.83        perf-profile.calltrace.cycles-pp.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
     27.84 ±  2%      -1.8       26.04 ±  2%  perf-profile.calltrace.cycles-pp.select_idle_cpu.select_idle_sibling.select_task_rq_fair.select_task_rq.try_to_wake_up
     13.40            -1.7       11.71 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule.do_nanosleep
     13.28            -1.7       11.59 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule
     33.57            -1.7       31.91        perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt
     14.47            -1.6       12.84 ±  2%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
     33.27            -1.6       31.70        perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.select_task_rq.try_to_wake_up.hrtimer_wakeup
     33.41            -1.6       31.84        perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues
     48.64            -1.5       47.19        perf-profile.calltrace.cycles-pp.clock_nanosleep
     42.64            -1.3       41.30        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     42.79            -1.3       41.46        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     33.05            -1.3       31.78        perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
     34.92            -1.3       33.66        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     33.75            -1.3       32.50        perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     33.71            -1.3       32.46        perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.20            -1.2       27.04        perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     27.43            -1.1       26.30        perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
     20.11 ±  2%      -1.0       19.11        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule
      4.70 ±  7%      -1.0        3.74 ± 10%  perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_cpu.select_idle_sibling.select_task_rq_fair.select_task_rq
      2.91            -0.5        2.42        perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.__schedule.schedule.do_nanosleep
      3.03            -0.5        2.54        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      2.28            -0.4        1.91        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.__schedule.schedule
      0.62 ±  3%      -0.4        0.26 ±100%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.nohz_run_idle_balance.do_idle.cpu_startup_entry.start_secondary
      2.62 ±  3%      -0.3        2.28 ±  2%  perf-profile.calltrace.cycles-pp.nohz_run_idle_balance.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      3.15 ±  3%      -0.2        2.91 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.clock_nanosleep
      3.14 ±  3%      -0.2        2.91 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.clock_nanosleep
      3.16 ±  3%      -0.2        2.92 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.clock_nanosleep
      0.88 ±  2%      -0.2        0.65 ±  3%  perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.pick_next_task.__schedule.schedule
      1.83 ±  4%      -0.2        1.60 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_nanosleep_ns
      1.83 ±  4%      -0.2        1.60 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_nanosleep_ns
      1.83 ±  3%      -0.2        1.60 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_nanosleep_ns
      1.85 ±  4%      -0.2        1.63 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.stress_nanosleep_ns
      1.42 ±  4%      -0.2        1.21 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.nohz_run_idle_balance.do_idle
      1.42 ±  4%      -0.2        1.21 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.nohz_run_idle_balance
      1.43 ±  4%      -0.2        1.22 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.nohz_run_idle_balance.do_idle.cpu_startup_entry
      1.44 ±  4%      -0.2        1.23 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.nohz_run_idle_balance.do_idle.cpu_startup_entry.start_secondary
      3.23 ±  3%      -0.2        3.03 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.clock_nanosleep
      1.53 ±  2%      -0.2        1.37 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__get_user_8.rseq_get_rseq_cs
      1.53 ±  2%      -0.2        1.37 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__get_user_8
      1.54 ±  2%      -0.2        1.39 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume
      1.53 ±  2%      -0.2        1.38 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup
      1.33            -0.1        1.20 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.hrtimer_active
      0.69 ±  3%      -0.1        0.56 ±  6%  perf-profile.calltrace.cycles-pp.llist_add_batch.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.hrtimer_wakeup
      1.33            -0.1        1.21 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.hrtimer_active.do_nanosleep
      1.34            -0.1        1.22 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.hrtimer_active.do_nanosleep.hrtimer_nanosleep.common_nsleep
      1.33            -0.1        1.21 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.hrtimer_active.do_nanosleep.hrtimer_nanosleep
      2.70            -0.1        2.60 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_active.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.35 ±  2%      -0.1        1.26 ±  2%  perf-profile.calltrace.cycles-pp.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues
      0.96            -0.1        0.88 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.96            -0.1        0.88 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.96            -0.1        0.88 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.97            -0.1        0.90 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.76 ±  4%      -0.1        0.70        perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_entities.dequeue_task_fair.__schedule
      0.70            -0.1        0.64        perf-profile.calltrace.cycles-pp.update_rq_clock.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.64 ±  4%      -0.1        0.58 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_mwc32
      0.64 ±  4%      -0.1        0.58 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_mwc32
      0.64 ±  4%      -0.1        0.58 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_mwc32
      0.74            -0.0        0.69 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.74            -0.0        0.70        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.73            -0.0        0.69        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep
      0.73            -0.0        0.69        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep
      0.68            +0.0        0.70        perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.cmd_sched.run_builtin.handle_internal_command
      0.68            +0.0        0.70        perf-profile.calltrace.cycles-pp.cmd_record.cmd_sched.run_builtin.handle_internal_command.main
      0.68            +0.0        0.70        perf-profile.calltrace.cycles-pp.cmd_sched.run_builtin.handle_internal_command.main
      0.68            +0.0        0.70        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record.cmd_record.cmd_sched
      0.68            +0.0        0.70        perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record.cmd_record.cmd_sched.run_builtin
      1.25            +0.0        1.28        perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.61 ±  2%      +0.0        0.66        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.54 ±  3%      +0.1        0.59 ±  2%  perf-profile.calltrace.cycles-pp.__switch_to_asm
      1.16            +0.1        1.22        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.98 ±  3%      +0.1        1.05 ±  3%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule_idle.do_idle.cpu_startup_entry
      6.64 ±  3%      +0.3        6.99        perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair
      5.02 ±  3%      +0.5        5.50 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.7        0.66        perf-profile.calltrace.cycles-pp.pick_task_fair.pick_next_task_fair.pick_next_task.__schedule.schedule
      1.48 ±  3%      +0.7        2.16 ±  4%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.do_nanosleep
      6.94 ±  6%      +0.7        7.63 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle
      7.73 ±  2%      +0.7        8.43        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      7.62 ±  6%      +0.7        8.31 ±  3%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      6.99 ±  6%      +0.7        7.69 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle.do_idle
      7.77 ±  2%      +0.7        8.48        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.59 ±  3%      +0.7        2.31 ±  3%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      8.02 ±  2%      +0.7        8.74        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      8.20 ±  2%      +0.7        8.94        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     11.79 ±  3%      +0.9       12.66 ±  2%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     11.63 ±  3%      +0.9       12.50 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
     16.33 ±  2%      +1.3       17.59        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     16.58 ±  2%      +1.3       17.86        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     17.33 ±  2%      +1.3       18.66        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     40.51            +1.8       42.34        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     40.55            +1.8       42.38        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     40.56            +1.8       42.40        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     40.74            +1.8       42.58        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     32.04            -2.0       30.05 ±  2%  perf-profile.children.cycles-pp.select_idle_cpu
     48.46            -1.9       46.57        perf-profile.children.cycles-pp.__hrtimer_run_queues
     47.62            -1.9       45.74        perf-profile.children.cycles-pp.hrtimer_wakeup
     47.61            -1.9       45.73        perf-profile.children.cycles-pp.try_to_wake_up
     48.90            -1.9       47.03        perf-profile.children.cycles-pp.hrtimer_interrupt
     48.97            -1.9       47.10        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     49.42            -1.8       47.57        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     50.00            -1.8       48.24        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     37.09            -1.6       35.44        perf-profile.children.cycles-pp.select_idle_sibling
     37.31            -1.6       35.66        perf-profile.children.cycles-pp.select_task_rq
     37.23            -1.6       35.59        perf-profile.children.cycles-pp.select_task_rq_fair
     48.83            -1.4       47.38        perf-profile.children.cycles-pp.clock_nanosleep
     42.72            -1.3       41.38        perf-profile.children.cycles-pp.do_syscall_64
     42.86            -1.3       41.52        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     34.93            -1.3       33.66        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
     33.08            -1.3       31.82        perf-profile.children.cycles-pp.do_nanosleep
     33.72            -1.3       32.46        perf-profile.children.cycles-pp.hrtimer_nanosleep
     33.81            -1.3       32.56        perf-profile.children.cycles-pp.common_nsleep
     28.37            -1.0       27.37        perf-profile.children.cycles-pp.schedule
     17.34            -0.6       16.71 ±  2%  perf-profile.children.cycles-pp.available_idle_cpu
      3.04            -0.5        2.56        perf-profile.children.cycles-pp.dequeue_task_fair
      2.66 ±  3%      -0.3        2.32 ±  2%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      2.56 ±  2%      -0.3        2.31 ±  3%  perf-profile.children.cycles-pp.llist_add_batch
      1.28            -0.2        1.04 ±  2%  perf-profile.children.cycles-pp.set_next_entity
      3.71 ±  2%      -0.2        3.48        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      3.03 ±  2%      -0.2        2.80 ±  2%  perf-profile.children.cycles-pp.__smp_call_single_queue
      2.90            -0.2        2.69        perf-profile.children.cycles-pp.__sysvec_call_function_single
      3.30            -0.2        3.09        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      3.01            -0.2        2.81        perf-profile.children.cycles-pp.sysvec_call_function_single
      1.57 ±  3%      -0.2        1.36 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      4.86            -0.2        4.67        perf-profile.children.cycles-pp.ttwu_do_activate
      3.70 ±  2%      -0.2        3.53 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock
      0.34 ±  2%      -0.2        0.19 ±  2%  perf-profile.children.cycles-pp.avg_vruntime
      2.63            -0.1        2.49        perf-profile.children.cycles-pp.enqueue_task
      2.59            -0.1        2.46        perf-profile.children.cycles-pp.enqueue_task_fair
      1.75 ±  5%      -0.1        1.62 ±  4%  perf-profile.children.cycles-pp.__bitmap_andnot
      2.72            -0.1        2.61 ±  2%  perf-profile.children.cycles-pp.hrtimer_active
      0.50 ±  2%      -0.1        0.40 ±  3%  perf-profile.children.cycles-pp.__dequeue_entity
      2.14            -0.1        2.04        perf-profile.children.cycles-pp.enqueue_entity
      2.92            -0.1        2.83        perf-profile.children.cycles-pp.dequeue_entities
      1.52 ±  2%      -0.1        1.43 ±  2%  perf-profile.children.cycles-pp._find_next_bit
      1.82            -0.1        1.76        perf-profile.children.cycles-pp.update_load_avg
      2.30            -0.1        2.25        perf-profile.children.cycles-pp.dequeue_entity
      0.25 ±  2%      -0.0        0.22        perf-profile.children.cycles-pp.update_min_vruntime
      0.08            -0.0        0.05        perf-profile.children.cycles-pp.__rb_erase_color
      0.07 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.put_prev_task_fair
      0.25 ±  2%      -0.0        0.23        perf-profile.children.cycles-pp.__update_load_avg_se
      0.16            -0.0        0.15        perf-profile.children.cycles-pp.update_process_times
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.rebalance_domains
      0.18            +0.0        0.19        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.timerqueue_add
      0.17 ±  2%      +0.0        0.18        perf-profile.children.cycles-pp.os_xsave
      0.12 ±  4%      +0.0        0.14        perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.68            +0.0        0.70        perf-profile.children.cycles-pp.cmd_sched
      0.68            +0.0        0.70        perf-profile.children.cycles-pp.perf_session__process_events
      0.68            +0.0        0.70        perf-profile.children.cycles-pp.reader__read_event
      0.68            +0.0        0.70        perf-profile.children.cycles-pp.record__finish_output
      0.26 ±  2%      +0.0        0.29        perf-profile.children.cycles-pp.get_nohz_timer_target
      0.47            +0.0        0.50        perf-profile.children.cycles-pp.update_rq_clock_task
      0.11 ±  3%      +0.0        0.14 ±  8%  perf-profile.children.cycles-pp.update_blocked_averages
      0.40 ±  2%      +0.0        0.43 ±  2%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.35 ±  2%      +0.0        0.38 ±  3%  perf-profile.children.cycles-pp.sched_clock
      0.11            +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.update_curr_se
      0.38 ±  3%      +0.0        0.42 ±  3%  perf-profile.children.cycles-pp.native_sched_clock
      0.32 ±  3%      +0.0        0.36 ±  9%  perf-profile.children.cycles-pp.menu_select
      0.53            +0.0        0.57 ±  5%  perf-profile.children.cycles-pp.___perf_sw_event
      0.62            +0.0        0.67        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.50            +0.0        0.54        perf-profile.children.cycles-pp.wakeup_preempt
      0.22            +0.1        0.28 ±  2%  perf-profile.children.cycles-pp.__enqueue_entity
      1.17            +0.1        1.23        perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__rb_insert_augmented
      1.02 ±  2%      +0.1        1.08        perf-profile.children.cycles-pp.__switch_to
      0.09 ± 15%      +0.1        0.16 ± 23%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.16 ±  7%      +0.1        0.23 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.10 ± 18%      +0.1        0.18 ± 23%  perf-profile.children.cycles-pp.find_busiest_group
      0.10 ± 15%      +0.1        0.18 ± 21%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.check_preempt_wakeup_fair
      1.83            +0.1        1.92        perf-profile.children.cycles-pp.prepare_task_switch
      1.69 ±  2%      +0.1        1.80        perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.14 ±  3%      +0.1        0.26        perf-profile.children.cycles-pp.pick_eevdf
      0.16 ± 14%      +0.1        0.29 ± 22%  perf-profile.children.cycles-pp.load_balance
      0.18 ±  8%      +0.2        0.33 ±  3%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.28 ±  9%      +0.2        0.46 ± 17%  perf-profile.children.cycles-pp.newidle_balance
      0.00            +0.2        0.19        perf-profile.children.cycles-pp.vruntime_eligible
      0.10 ±  4%      +0.2        0.34 ±  2%  perf-profile.children.cycles-pp.put_prev_entity
      5.04 ±  3%      +0.5        5.53 ±  3%  perf-profile.children.cycles-pp.intel_idle
      0.23            +0.5        0.74        perf-profile.children.cycles-pp.pick_task_fair
      1.98 ±  2%      +0.7        2.70 ±  3%  perf-profile.children.cycles-pp.pick_next_task_fair
      2.15 ±  2%      +0.8        2.91 ±  2%  perf-profile.children.cycles-pp.pick_next_task
     11.85 ±  3%      +0.9       12.73 ±  2%  perf-profile.children.cycles-pp.schedule_idle
     16.64 ±  2%      +1.3       17.93        perf-profile.children.cycles-pp.cpuidle_enter_state
     16.65 ±  2%      +1.3       17.94        perf-profile.children.cycles-pp.cpuidle_enter
     17.41 ±  2%      +1.3       18.76        perf-profile.children.cycles-pp.cpuidle_idle_call
     40.71            +1.8       42.54        perf-profile.children.cycles-pp.do_idle
     40.56            +1.8       42.40        perf-profile.children.cycles-pp.start_secondary
     40.74            +1.8       42.58        perf-profile.children.cycles-pp.cpu_startup_entry
     40.74            +1.8       42.58        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      9.31 ±  3%      -1.1        8.19 ±  3%  perf-profile.self.cycles-pp.select_idle_cpu
     17.19            -0.6       16.57 ±  2%  perf-profile.self.cycles-pp.available_idle_cpu
      2.56 ±  2%      -0.2        2.31 ±  3%  perf-profile.self.cycles-pp.llist_add_batch
      1.57 ±  3%      -0.2        1.36 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.33            -0.2        0.18 ±  2%  perf-profile.self.cycles-pp.avg_vruntime
      1.72 ±  5%      -0.1        1.59 ±  4%  perf-profile.self.cycles-pp.__bitmap_andnot
      0.34            -0.1        0.25        perf-profile.self.cycles-pp.set_next_entity
      1.37 ±  2%      -0.1        1.29 ±  2%  perf-profile.self.cycles-pp._find_next_bit
      0.38 ±  2%      -0.1        0.32 ±  3%  perf-profile.self.cycles-pp.__dequeue_entity
      0.95 ±  2%      -0.0        0.90        perf-profile.self.cycles-pp.update_rq_clock
      0.63 ±  2%      -0.0        0.59        perf-profile.self.cycles-pp.dequeue_entities
      0.25 ±  2%      -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.update_min_vruntime
      0.44            -0.0        0.41 ±  2%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.22 ±  3%      -0.0        0.19        perf-profile.self.cycles-pp.__update_load_avg_se
      0.73            -0.0        0.70        perf-profile.self.cycles-pp.enqueue_entity
      0.06 ±  7%      -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.pick_next_task_idle
      0.16 ±  3%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp.place_entity
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.__hrtimer_init
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.do_syscall_64
      0.15            +0.0        0.16        perf-profile.self.cycles-pp.pick_next_task_fair
      0.08            +0.0        0.09        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.24            +0.0        0.26        perf-profile.self.cycles-pp.lapic_next_deadline
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.os_xsave
      0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.32            +0.0        0.34        perf-profile.self.cycles-pp.perf_swevent_event
      0.26 ±  2%      +0.0        0.28        perf-profile.self.cycles-pp.get_nohz_timer_target
      0.27 ±  2%      +0.0        0.29 ±  2%  perf-profile.self.cycles-pp.read_tsc
      0.12 ±  4%      +0.0        0.14 ±  5%  perf-profile.self.cycles-pp.newidle_balance
      0.38            +0.0        0.40        perf-profile.self.cycles-pp.update_rq_clock_task
      0.49            +0.0        0.51        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.07            +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.put_prev_entity
      0.17 ±  2%      +0.0        0.20 ± 17%  perf-profile.self.cycles-pp.___perf_sw_event
      0.38 ±  2%      +0.0        0.42        perf-profile.self.cycles-pp.cpuidle_enter_state
      0.10 ±  4%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.update_curr_se
      0.37 ±  2%      +0.0        0.40 ±  2%  perf-profile.self.cycles-pp.native_sched_clock
      0.38 ±  3%      +0.0        0.42        perf-profile.self.cycles-pp.update_curr
      0.70            +0.0        0.74        perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.07 ± 17%      +0.1        0.12 ± 24%  perf-profile.self.cycles-pp.update_sg_lb_stats
      1.19 ±  2%      +0.1        1.24 ±  2%  perf-profile.self.cycles-pp.finish_task_switch
      0.22            +0.1        0.27 ±  2%  perf-profile.self.cycles-pp.__enqueue_entity
      0.10 ±  3%      +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.pick_next_task
      1.00 ±  2%      +0.1        1.06        perf-profile.self.cycles-pp.__switch_to
      1.43            +0.1        1.49        perf-profile.self.cycles-pp.prepare_task_switch
      0.12 ±  4%      +0.1        0.22 ±  2%  perf-profile.self.cycles-pp.pick_eevdf
      1.68 ±  2%      +0.1        1.79        perf-profile.self.cycles-pp.switch_mm_irqs_off
      2.83            +0.1        2.94        perf-profile.self.cycles-pp.__schedule
      0.00            +0.2        0.18 ±  2%  perf-profile.self.cycles-pp.vruntime_eligible
      5.04 ±  3%      +0.5        5.53 ±  3%  perf-profile.self.cycles-pp.intel_idle




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

