Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFADB2749DC
	for <oe-lkp@lists.linux.dev>; Mon, 29 Dec 2025 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766996518; cv=fail; b=cyUbn4SWrVO6Fni2MAavPT4m8vKjbtXlxxsDlndfgjiWkh/CZ1Qe8jtv3KdgBpTFuVB8mp985ooM8g2ZnIyT2FSJTZ53192chrlMvLucxp+mHl3Zhq1pIZ23RCvAVN4O38/tokfPMeoEaCbOg6Bup0vDESBln/MfDObAOeirTl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766996518; c=relaxed/simple;
	bh=jQNARcY3PHpt1FPK++hGFxxyBqJsaKsRMcEVHaAl1RA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VKPs8d5A9DHJYsdDt71nOd7HGL3PjBYsn1c9HLH00J7x1O5OAoDTxrmSh9kkwoQ6WeenSdXnoxNgP+qAJJZVTfu4axjhdmXKlqwtglZvdDn19INAzEAJuxxhnYGG/t3fzsOK9kil2qQffDOPPhvGq8GjAWYVl/OswYNFESB2F8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2J8qXwL; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2J8qXwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766996516; x=1798532516;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=jQNARcY3PHpt1FPK++hGFxxyBqJsaKsRMcEVHaAl1RA=;
  b=m2J8qXwL+kdeq8thKhokMOdBao+b43enofKv37tkXqyPjqZAN1i6MnRw
   FWb8vaWTQ9ecbHkj6Cgq3dqlp5r5ZjXfXtVLVEeFZ3VXUuD1gg7+0gwbT
   OGAwhvuKpoLyB3ignmMCiYqwNYFHm7nLvyGMRLBIRzhUYP0u0dd08qWrb
   F4mem4YOE56sIkY8mijbX7bU0YIidEKYnDBEuKh7aYl44Tv0o9EuZHr4S
   l7yPwdGQf2YwX8GJUHlkY4d+ZE8Qb112k1aSroXHnJajIw2gGPkzn1jWm
   dpNWuJ9cIA26gzHaUvReJPprI9/qvgfJ4NHDGsE9AM8hHwZwKB72B9yi3
   g==;
X-CSE-ConnectionGUID: aI50FH5eT+GF6ZCIWFex3A==
X-CSE-MsgGUID: pJbbu09GS9eQa/t5YiTfWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68643976"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="68643976"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:21:55 -0800
X-CSE-ConnectionGUID: z7gM7dl4R1au81W2h5lUjA==
X-CSE-MsgGUID: 1fzXZm9XTbWjbsbHzcsFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205780212"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:21:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 00:21:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 00:21:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 00:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG03PrRsI/jfhzOPhZivgsvQNmcIPJ1bHF5nfN7D7LKqgItUC6vvEtOe34Mo4gQD4wSsAhGKdUZ52FFAd9R7n1bvZAZoPzbHUYNfZqLh5H5qXERbxWh0hyHSDUnXYcxmoTYzIdDwTT+pwUckjof1YsoEfQB9nwkQCogfRF8tupbGJ/8ax5e43UHQtdOMGUhl1r4Z2VOChOmW0jnjGfr1wuSJzqi9AsJc7c4qCGNncQFHTNQwlpG7QxEHMqKpIZTHLbyRiYOc+T1ELF4rBCKu0EzQbmxiaZkDxNBrCidG6FLrbU3qeueGez4dVrg3dan1A5mjI+3PgdRhZqmRSUOObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwybCWOzmCc3uNY/kRB1meWCPf0tekP5Q4h/xTTnZaU=;
 b=Xjx3grMST3SzdNVWZZ7ngZk634Y4MgYKGbT9iQvh94YvIn0GXetcw/L+/Pevsfs2BRJKRIpoEUJQotM49gwK0FpGGBALLr8Dv/d15bv1eIZk/1q/pVarA28+ggGEEe6C5DPuSE3adUlSfEkLmVk9QqDYssqw7Q18mjt86eyUa+S000mwBQR6eXrYHtsFCC3wRtq9yaPDpGbl83GCZnXpne7Ns9wH9P72DQpx6JpEd/ifOiSMiDIldocW59R1o+M+EhXAZdg2OaSs9b+Zj5UoanfBbXdF/yuuOPCXBDMt3nyzPPVtflEVEPkhI+0q91vl/tOLG+HJHNGwZtM8+h4c0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Mon, 29 Dec
 2025 08:21:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 08:21:51 +0000
Date: Mon, 29 Dec 2025 16:21:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:kerne-unload] [tracing]  a28f9a04b2:
 will-it-scale.per_process_ops 16.3% improvement
Message-ID: <202512291622.e268300c-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0005.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: a1019eb5-f8bd-4519-f731-08de46b351af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nimwqY6eUgRH1F+3w5N1d7/CnllTPICCygCXfzCpySt539x6fO5Jr305Qg?=
 =?iso-8859-1?Q?5p1BgIPTAc5tIfmnObKuNFvBInjrGBq1V+ejdWXnLlHunA6sL0zW1ceQbU?=
 =?iso-8859-1?Q?xfe0UtDcOeZeVkDx19t1mPAyMzFs9LiT1hc4TO3Bx04Q/cPTkxkk81auoE?=
 =?iso-8859-1?Q?7YR2FoGE1lp9aOwLG1b1hYMKUdEc/1lis9NSohuL74Hf0zN4PzvVNOUPw9?=
 =?iso-8859-1?Q?NsFh3bdG8hspPG+e3fPJHaLLyXIfbLweXEzCMmUiJ5astgxEB0yLz/rzN4?=
 =?iso-8859-1?Q?09WZEpy2S+wHWdRBaNmMjHPbFeeHTyZoWNNdqABCcbKGuo3W0YAprk3WiO?=
 =?iso-8859-1?Q?VYmupxym7CbvujKjFUIXg1lS+HNWZdmig7KZryUtIrWTNIm/7Z3q8qmUzJ?=
 =?iso-8859-1?Q?fAcUuTzpSNuli0/krC1HcTr8jSpzuwND0gNgBbi1dE7fC+qRYdJacA2cZZ?=
 =?iso-8859-1?Q?9vFD/fiiCLObNEdTVzueXUC+PJqa7Ki5v3/eBkqCSpQ5TIUjoU/Md6qQS8?=
 =?iso-8859-1?Q?LLy8a4gSC6JVTSErltpUF7DMMJU5mQe6iTzlnUzYmVhxKq3XMwxsInIKiv?=
 =?iso-8859-1?Q?gOY+v7J7kQ+JdI6uo1hYI05XoGz2Kr22BFFdyfYyLMopISgxFNwf6IMmgg?=
 =?iso-8859-1?Q?glCZG2Cm3/8iBPE2S5bX5N65rdqJk7d5e4FuWoHU2lWCMktsDKtq1xuZe0?=
 =?iso-8859-1?Q?xMLpq4eo+YLe3rIEvPySCrlTv4mpR4t4XdYM67Z5SSOrRUOQ19Iz9wf6Oh?=
 =?iso-8859-1?Q?m+0Da+qxtNYDQC551sF8/75z38WdYGVDEgfuRFF7vL7INHUllw3DMsiZay?=
 =?iso-8859-1?Q?3y5FcExsHyUD8mWtHFB2SQvNNOSFgg2157arbUlL26yS+uBbiptZJDBXVn?=
 =?iso-8859-1?Q?WtjSqjlCsKfHq/BNErofmrg+O/BC6YciqVx16XY5S4/sc1IKtgDnC+PZUd?=
 =?iso-8859-1?Q?KLIB7+SpvZDZABSiyCVy/z8NCk/8G3oz0bLxvpWmNrfmvZrdnbRqaAtKO1?=
 =?iso-8859-1?Q?/Nvrd5S1YBfd8mpSqqGDRuAedNOntdtV5UHFAbvGh/tjFaUjXXhD2XKGs9?=
 =?iso-8859-1?Q?qUppMajgFLx7Z/Ay9nloOnEegRQvAawIfSM+siAiSffrfe4exo6mJNSuBG?=
 =?iso-8859-1?Q?KIliz9MmVssYoTW8pbgQ21HBgE98Xt+WTFySqvK/fk4tTPxb51zFZx17y8?=
 =?iso-8859-1?Q?yxz3a7JleG/aU67x0NmabKigjvmMfstXCY5adWdlcvWHtR4/rSIHToMyj2?=
 =?iso-8859-1?Q?2toxjqLo3wKfYsdEdvOV9LIz6jVu5qEyR+KVGxzEQVXvXUJG9TiiWvPhof?=
 =?iso-8859-1?Q?/9bO4x8XkFwMSUmvRw4a43G6D65Uxq/VjDE+NyHjjU1iFouH4EYCmTmjK3?=
 =?iso-8859-1?Q?D0u1wcLkgc3Ak0ZocDdUz6ioK07Pt3m/LFInZaX3tTi6z+Xbpukz87medX?=
 =?iso-8859-1?Q?dzNLmBOWXgpzM/YW/RqODUwGKgkxv25oXOUaIbdqXkmOYXybCjz0GZQItc?=
 =?iso-8859-1?Q?Bw8GS5Kpwhx+N26dR2GiDCTcKLIW7vvENXycCNb4BnDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?84n2WrehcmcWth2nsL70ALKxkyhi7UHsqsmk4SzkLsZTYFFigdtZy1y51j?=
 =?iso-8859-1?Q?jpIM8818SBhGZ8DDpBkAVLwBj3tRVerSp1bzfz8whSndu753EMrUOxioA/?=
 =?iso-8859-1?Q?ADuelG1axwYTOc2ze9HgqMfbRXXTXPMkGCmj+HLiumww85jISjPu5K1g5m?=
 =?iso-8859-1?Q?2deQsWDJvOR8XnPaCXZsJm7tc5t4U3SAmW+aDX+s8xguF684VBvd/pa8hI?=
 =?iso-8859-1?Q?bVN7vTP9n2ahNwYJCJKF8ffBSFNEW0W7VT7p2pPGqg7B3BaGXAlX2QJMVF?=
 =?iso-8859-1?Q?4r7Udi64PdatQ9TbIgfPwLi6KDqp8qrzjrhf7GOgzfkBna3BWHC1fXbMq1?=
 =?iso-8859-1?Q?1i5he2yf2cOXABgbd5sN2qUV/5jmpQBRl/3qVfp3wCdSUc48EXlqG9cR2Q?=
 =?iso-8859-1?Q?IQkjdlif/k5KNu8HjDHX8kDhuG8oZhjoVZejCd9rWzMYuTvfeMEzcx9ASe?=
 =?iso-8859-1?Q?/EiHKcPk+CtAyWstkNpbay2g2NdGydgdEVh56S+c/HaLNM7VsUufzjEioi?=
 =?iso-8859-1?Q?ocHFld1tr2rTbe91hNkEVx5r3TTi2pUolrbwdCOOGtbHmY/AG5JvdsUVe8?=
 =?iso-8859-1?Q?xi64Jtlwu5AoZzJ6I94Kp69lWsR7hhfg5xsDHcdN1XZviCE/T2L95l8uqm?=
 =?iso-8859-1?Q?omrEaycuTGb+BhrvxIJcIw6LNcQx3g7NTHlFHe9/D8KZvIfYQNF7zkCt4y?=
 =?iso-8859-1?Q?m0beFV2XelLidH726S61ttaRUID7rbwdkc06+ycgdZvMwt5gsWMFrhqo7K?=
 =?iso-8859-1?Q?Ra9CMpjkx5EYOA2sKwld/IRfFgfjWF7/jD3O13AWuGNrIhBep1B9zWespy?=
 =?iso-8859-1?Q?Tu4K5AO6nFUW+48Is+bqrTG5YuSYsXJaeEwtIZlp5v1Op6WN3B4yfImJKh?=
 =?iso-8859-1?Q?J26Aoik7FUGr5RQooa8Q3lQKi15xS8PIk5Mrvep6tjlWNew7B21EEIveJR?=
 =?iso-8859-1?Q?mVxwIngyzFK1gyqc7VOlGmjccco8RQUhRvALk2ytWyhMQm/Cwh+JTEYZk9?=
 =?iso-8859-1?Q?02lzPu1xD4kBHoDA3rfEe9NNLfham+kWm0LGyceRCOyQVY+gnwmMb7fjzo?=
 =?iso-8859-1?Q?1s9RI7e6yGjiJ6bigWruXGDJ0EG+GajGSNI4hRdXG3Qm1ELHJo38OhZVCt?=
 =?iso-8859-1?Q?DHWJuqJybru4mgBjabM64LUoKTqi0RdWacoNpewOHVeAS9ysrl0WAE/2VS?=
 =?iso-8859-1?Q?sfVEAYSoA7ZE698T4xX8zKcc4MykQwdpxcyP/9H/919S98sGq5zJvILFOM?=
 =?iso-8859-1?Q?VrHYN/J5zxum8f5X4haflvv514DO+pE/uxXRc0XAX2VKWAeqcDds5FOZoC?=
 =?iso-8859-1?Q?OFFzxQOD3cb+5qzL4URWU2voQ2lt+E2LhYI+UbWRrHVgPFM0YkvaHI3DuD?=
 =?iso-8859-1?Q?/1owLzAyia0E2CdD0mJROt1BEVsymfK+5S8jZVaBwqd+ohu93/ic8UqCtA?=
 =?iso-8859-1?Q?rBGq/MLDbXDDqAtsm8oRINCgcr6swsJUb2AfhC8j4Uao5v8xWde/TtLFw6?=
 =?iso-8859-1?Q?ybU16zCsNEG+wfE18p7bCH37lC2iTDjM2h3x1HWkA8oFzkiGLuyyaQ8X6r?=
 =?iso-8859-1?Q?SFCGlAtHECLh/EyW51BrWFpbAbJcD+FTj/+c1E/2enlRXHTE+nFlrD0w12?=
 =?iso-8859-1?Q?70WfujBzn70MBb+wTa+4g4PzpgZuwosq+8PPnbxmZll8Ssqs90Iymkf5B0?=
 =?iso-8859-1?Q?kj8nKBU14rSGt8PsenXrvasIFwbJlTmcoIrjNbkPK9VDfkaKIRiMkc41W8?=
 =?iso-8859-1?Q?7w3xpTuddFKoV9SaJNwKh6ZXYmM1IwRQa8cjtl0CcnXDS3DsI0+1swpuBX?=
 =?iso-8859-1?Q?gi3ICgmJHw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1019eb5-f8bd-4519-f731-08de46b351af
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 08:21:51.7835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9PWTtNP13cmSfPpXuDmQO8nKJtaSoV5hnkR96W1Ui5Llq+LsGhsSKB1WvfbNdVgayNcSTbtQl9HBycbv+qJoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 16.3% improvement of will-it-scale.per_process_ops on:


commit: a28f9a04b26374e653258db4f852469961dfdb68 ("tracing: Remove size parameter in __trace_puts()")
https://github.com/norov/linux kerne-unload

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 100%
	mode: process
	test: lseek1
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251229/202512291622.e268300c-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-cpl-4sp2/lseek1/will-it-scale

commit: 
  12c3bbf898 ("kernel.h: include linux/instruction_pointer.h explicitly")
  a28f9a04b2 ("tracing: Remove size parameter in __trace_puts()")

12c3bbf89800653f a28f9a04b26374e653258db4f85 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     24.86            +3.0       27.84        mpstat.cpu.all.usr%
      0.14 ±  6%     -13.0%       0.12 ±  9%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      0.50           +16.9%       0.59        turbostat.IPC
     36479 ± 75%    +143.7%      88884 ± 21%  numa-vmstat.node1.nr_active_anon
     36479 ± 75%    +143.7%      88884 ± 21%  numa-vmstat.node1.nr_zone_active_anon
     21982 ± 32%     -47.0%      11653 ± 12%  numa-vmstat.node3.nr_mapped
    800.17 ±  6%     -22.6%     619.67 ± 14%  perf-c2c.DRAM.remote
      1142 ±  8%     -47.5%     600.33 ± 14%  perf-c2c.HITM.local
    710.00 ±  8%     -21.9%     554.50 ± 15%  perf-c2c.HITM.remote
 1.332e+09           +16.3%  1.549e+09        will-it-scale.224.processes
   5947747           +16.3%    6914856        will-it-scale.per_process_ops
 1.332e+09           +16.3%  1.549e+09        will-it-scale.workload
    146159 ± 75%    +143.3%     355653 ± 21%  numa-meminfo.node1.Active
    145938 ± 75%    +143.5%     355428 ± 22%  numa-meminfo.node1.Active(anon)
    761026 ± 26%    +221.4%    2445772 ± 60%  numa-meminfo.node1.MemUsed
     88069 ± 32%     -47.8%      45967 ± 13%  numa-meminfo.node3.Mapped
      0.01 ±  2%     -11.5%       0.01 ±  3%  perf-stat.i.MPKI
 1.915e+11           +16.2%  2.226e+11        perf-stat.i.branch-instructions
 3.414e+08           +14.7%  3.917e+08        perf-stat.i.branch-misses
     10.14 ±  6%      +3.0       13.12 ±  3%  perf-stat.i.cache-miss-rate%
   1730502 ±  4%     -11.3%    1535699 ±  3%  perf-stat.i.cache-misses
  17825894 ±  6%     -26.7%   13057672 ±  2%  perf-stat.i.cache-references
      1.32           -14.2%       1.13        perf-stat.i.cpi
    654783 ±  5%     +24.7%     816265        perf-stat.i.cycles-between-cache-misses
 5.859e+11           +16.2%  6.808e+11        perf-stat.i.instructions
      0.76           +16.6%       0.89        perf-stat.i.ipc
      0.35 ±  4%     -15.5%       0.29 ±  9%  perf-stat.i.major-faults
      0.00 ±  4%     -23.6%       0.00 ±  3%  perf-stat.overall.MPKI
      9.72 ±  4%      +2.0       11.76 ±  3%  perf-stat.overall.cache-miss-rate%
      1.32           -14.3%       1.13        perf-stat.overall.cpi
    446928 ±  4%     +12.1%     500993 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.76           +16.7%       0.89        perf-stat.overall.ipc
 1.909e+11           +16.2%  2.218e+11        perf-stat.ps.branch-instructions
 3.403e+08           +14.7%  3.904e+08        perf-stat.ps.branch-misses
   1724803 ±  4%     -11.2%    1531111 ±  3%  perf-stat.ps.cache-misses
  17787512 ±  6%     -26.8%   13028723 ±  2%  perf-stat.ps.cache-references
  5.84e+11           +16.2%  6.785e+11        perf-stat.ps.instructions
      0.34 ±  4%     -15.4%       0.29 ±  9%  perf-stat.ps.major-faults
 1.765e+14           +16.1%   2.05e+14        perf-stat.total.instructions
     26.52            -6.5       20.02        perf-profile.calltrace.cycles-pp.clear_bhb_loop.llseek
      2.43            -0.4        2.04        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      3.67            -0.3        3.42        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.llseek
      1.63            -0.1        1.57 ±  2%  perf-profile.calltrace.cycles-pp.generic_file_llseek_size.__x64_sys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      0.73 ±  3%      +0.1        0.81 ±  2%  perf-profile.calltrace.cycles-pp.testcase
     98.60            +0.1       98.68        perf-profile.calltrace.cycles-pp.llseek
      2.51            +0.1        2.64        perf-profile.calltrace.cycles-pp.shmem_file_llseek.__x64_sys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      0.82            +0.5        1.30 ± 18%  perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.llseek
     31.77            +0.7       32.48        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      6.18            +1.0        7.20        perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
      6.70            +1.0        7.74        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.llseek
      7.50            +1.1        8.60        perf-profile.calltrace.cycles-pp.fdget_pos.__x64_sys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.llseek
     35.81            +1.2       37.04        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.llseek
     24.16            +3.8       28.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.llseek
     26.74            -6.4       20.31        perf-profile.children.cycles-pp.clear_bhb_loop
      2.79            -0.4        2.36        perf-profile.children.cycles-pp.x64_sys_call
      4.11            -0.2        3.92        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.90            -0.1        0.82        perf-profile.children.cycles-pp.its_return_thunk
      1.64            -0.1        1.58 ±  2%  perf-profile.children.cycles-pp.generic_file_llseek_size
      0.61 ±  2%      -0.1        0.56        perf-profile.children.cycles-pp.lseek@plt
      2.69            +0.2        2.85        perf-profile.children.cycles-pp.shmem_file_llseek
     32.18            +0.7       32.92        perf-profile.children.cycles-pp.do_syscall_64
      4.56            +0.7        5.30        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      6.23            +1.0        7.28        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      7.50            +1.1        8.61        perf-profile.children.cycles-pp.fdget_pos
     36.37            +1.4       37.72        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      9.20            +1.7       10.90        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     17.66            +2.7       20.40        perf-profile.children.cycles-pp.entry_SYSCALL_64
     26.55            -6.5       20.08        perf-profile.self.cycles-pp.clear_bhb_loop
      3.81            -1.2        2.61 ±  2%  perf-profile.self.cycles-pp.__x64_sys_lseek
      2.62            -0.4        2.20        perf-profile.self.cycles-pp.x64_sys_call
      4.11            -0.2        3.91        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.82            -0.1        0.71        perf-profile.self.cycles-pp.its_return_thunk
      1.46            -0.1        1.36 ±  2%  perf-profile.self.cycles-pp.generic_file_llseek_size
      7.15            +0.1        7.25        perf-profile.self.cycles-pp.do_syscall_64
      2.68            +0.2        2.84        perf-profile.self.cycles-pp.shmem_file_llseek
      2.37            +0.4        2.79        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      3.92            +0.7        4.61        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      6.04            +1.0        7.05        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      7.28            +1.2        8.43        perf-profile.self.cycles-pp.fdget_pos
      8.97            +1.3       10.28        perf-profile.self.cycles-pp.entry_SYSCALL_64
      8.76            +1.6       10.40        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
     12.00            +2.0       14.02        perf-profile.self.cycles-pp.llseek




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

