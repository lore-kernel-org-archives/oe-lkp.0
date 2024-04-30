Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269DD205E2E
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714467783; cv=fail; b=lpl8i9uYR3uCngSDjo8UddWZD3Bw0RAl5LolSOnvl+0JJgomhDbQuUv8jsMgV9Qe7+b55/z+Mv6cHejBwuredOHiaJ1NiKqE2ifezbJMx7WWMTxBurtsmeQtPbpt10lYTsN4SID7d+cTpPCpT/ggUpyLpGyiVwhV8giZA+6RQ6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714467783; c=relaxed/simple;
	bh=MiYRazsT0IO98+BBTCS6RU/h+hgp77hsGMHCl2le1P0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ek9y8ZR4ngc7Qn3TjMpt6+OVgtlPOdtujoRMsDU8TJQt7cx5XxLTk1Gw2HQeJ+NgW0lVRKgRJuXvavzfj/LlnBgeehwK5I/yiWP8eJsO8vTKEq522s/NylpsC2Q8qf8oJbVX8W5tzzMWTy72VpkyA94oWXDYTuQYPw49kBFXh1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwoyk3RV; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwoyk3RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714467781; x=1746003781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MiYRazsT0IO98+BBTCS6RU/h+hgp77hsGMHCl2le1P0=;
  b=Fwoyk3RViFnXaNX4wLLZVo4wf1YXBMT8vOoXv/CxVYd5b/jzpLvlGZVm
   wuUK7zKKyGnvyvdJmKuk7O6TgydiN6byhk6sVYVz8dpxTqR13O75flHAS
   yHXLL5qeikn7/4/qpLKjD2kcJ+kT6/XoUGZa+4pKfL32DMF6M9+48iERj
   wM9ECZih25457Ws3rfd64bWJyh2ycem36ZxenA25uJwZ9FixJiDj3Os8z
   AoLo/Eh9wyFXXv25uawNswFMNYtFri5fmrNgI3Rs4Kw6m/It7AcOc5vrV
   VGPFSJzCT1dyvV/RaaZOAAOY20Elv4jyRtG4JbOi55ioqD4sMNmWpQE8b
   g==;
X-CSE-ConnectionGUID: oaBDu2BmSmKXJYRcR/vD/Q==
X-CSE-MsgGUID: ethPNiU1R662WKcqvQTgEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13955042"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13955042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 02:03:00 -0700
X-CSE-ConnectionGUID: hmzEeO6UTluICF3TjqyEKg==
X-CSE-MsgGUID: DWJgrEMjSzy9+wWDGY8jjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="49598567"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Apr 2024 02:03:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 02:02:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 02:02:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 02:02:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 02:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTdwQ6ZwVx35pcOLkAqPY0jbzG8h74SWGMTJixNgj+F3dR2A4u9X0jf4NM3WePM44rJUtz1typEQ9LBmIhgHhudNBF0HKaq6B9Fuuxfczf3061PkM1yD6LsuHCrtrQiT3iR8tIXkvsusX3ccFOoeC5nBacamJJ7UlJ5oiAzy5f0/FXP5p0p8jzTu7wZ5JmP7lM7Dt4CKiSbAF6zi3YGLcnpqOGmXiHJdTkJTqEdpMfvDjxt3DD4dUo9hNsaU8jP5R+cdafPAWXNGeq9X66BpLIhU1SXWjbxbQB88gf2r4sctm4cgReqmeqZRibptzA+7e6UbiWX6dVAkTKy/LVgbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7j7GW1dIQg5eq7bV1qbeKTFcb4JfC4wAfZTK6PS4TE=;
 b=ZGk1HfXmHAISb0xcdbnDAwp5nkkxJ3iqeHi+JKhVP+QBhsLiwDvWpgfzGQcH24ASoV6SrUOxvX1X0f2A0fb+V3r4s9VwjFSTODFRXnrWNpU2+QET+41SC7R5nrqBFkkDKr3CsnBB/xqGwJ3HLhIppatJG5HDjXaf4QeC6kXVNb08VEHB5an1X4bTKfCNd4RPNZ52V4gNCyA82oEJ8os+o6AfcNohVs8KObknuSAoUDlRjHU76qhJ7pSG1HPibwuvstpF5+aBIZgRAkoaxf1J7k8EJwKVJRHpC4hCQiQz3UXefGdtywqJM6sfA3qK4x9ntMdE4Jo+WzyR386TvavTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 09:02:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 09:02:55 +0000
Date: Tue, 30 Apr 2024 17:02:45 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr] [intel_idle]
 42c771b6dd: WARNING:suspicious_RCU_usage
Message-ID: <202404301635.1294804e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f95813-0d82-4fe2-cf6b-08dc68f45307
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|921011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7K6yEoycIXIXnv2Cy92D3ErOp1+opKIuj99v8lVi7EVutpHTZeJBaDhT/gHP?=
 =?us-ascii?Q?vC3/tA1YiQZn6YGhMdAuSWZq9ZFtxuWU/u8/oekGYWC5lSstszcPJihurGDQ?=
 =?us-ascii?Q?8tLqppJnkh8lWRkAM04DaDe2+Fk1vkP7lYZl2gkMiLSGUBGb4TidM8fkswrt?=
 =?us-ascii?Q?7UQ4pzoIuzMZ9Y+0TedIeFRjxpGZvLEReXtKyOgP5/Kgb9QP/aQuUknWx5/a?=
 =?us-ascii?Q?oNrVa1vXV4+rPe7Fgl9jl5cO6eyUu8wPz31tckAoetMrPIt2I3oZzARnOH8J?=
 =?us-ascii?Q?FT46IN7/muD6ky2YDh3vkKHC+fWMvZ3pvqOgmUIrZVvNpIJPqHmvXKJBWy25?=
 =?us-ascii?Q?JK7rchLUVqAbSjniH1dvpMedsqzKUehox4R//hGUX8FnokIhCfC4EMCJ4aah?=
 =?us-ascii?Q?6u1bipodkycdnMlIVUrWY6Bb36PTave8fzRxSEpFpl3Asb28KSiOvHhYLkA8?=
 =?us-ascii?Q?2SqMwh+YzF/wfcm7zfmMaU5Cf8uUFiaB1Gp0Tr8FJIiAWQej3KcuPxZXiz1i?=
 =?us-ascii?Q?msp3/q5H8m4l4pxiwo9ZJaDzzi32XqK4G7d6UomXaL3jercDrVpvIE9O+0+I?=
 =?us-ascii?Q?aiJs6IAgxhx+gpYY3E/cgN7rvJAgt+cO9yfqlW0X/ILd1mrsuFTYzMoUqMGI?=
 =?us-ascii?Q?NCTIr6hFPcGb/l3c9McwH/JdH99F/w/uwmbc+r5heKmGI3JzSKc0B+9JuGwC?=
 =?us-ascii?Q?IvEhNKqyWAiDr0dpgfMGSBjrAs3lNjpCvu1HXFwaGA+9MP6HYosvblYH2wbH?=
 =?us-ascii?Q?oTLk1Ni7QOt2MpxBZcx8DuWyek3TOZZzRUm3tS5ci2yB6rnU6VPFnFPL8R7C?=
 =?us-ascii?Q?FqDQq18U0PuzwYHap9MS9hXuSBadfjie1YXO8ck4bAktL9W7CmzxJ6mJHVRq?=
 =?us-ascii?Q?tpbh/Mm/RF2GFtLBiOQ1VA2lDbRI7jqYIfCP4KCHRtQZqN+Be+tL6OahBJpG?=
 =?us-ascii?Q?hWrp6IKNYFsgT2AHuRnRHpoz3QWZ8SfsgesNmL9GMxlbGTE6W0sFDNPQ8CZy?=
 =?us-ascii?Q?VuppYoP9QNb4zDaq+IJrykVtn3RmpX1V9kdkY5rTjYjVgK1G+hzi0vDfGSsz?=
 =?us-ascii?Q?HwiUrD23zRUj4EL+22MNxbNyM4yHL9slMM6OUv/Y/EA7wZNgoDJBl80v/tkH?=
 =?us-ascii?Q?LJA+rNBWFlIy+U3+KUcPn21/LKWfio3hJwD6S+dolaromDLkhSZcpGRvju++?=
 =?us-ascii?Q?tiV5fxX2gMOxG5Q/3lECU1VRl9yHFTJgmqxxiezn/SVqWCdFLiZZKb3pa8aq?=
 =?us-ascii?Q?YFZTs+3DWVtpfHwFfBg2lciMqw9xKD5P9EoAcdIFeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m/g5OxvsAJopJKuJuSYvM705M8JaSrsDmZZa7i6vpy5/60m3RwrMEf7yQlDt?=
 =?us-ascii?Q?UYuZfgYQeMma9NBA/Qh0I2dL0z2sxQU/JfBrijbI/00GBDp8iUUMfaJ+C7Yd?=
 =?us-ascii?Q?YHtvpJvx4QUdN9HF0ZGw9DBzOJiXF62wtA7VDKttkFmjpMx8zfSSVyGci0Tp?=
 =?us-ascii?Q?FnC5M2OXznr2jSd2alZpSV2rNadQBGhEYhpRrnnTsQUWl0+eNTB2en+lswyJ?=
 =?us-ascii?Q?SoBSsKWSMARAaeVJxw6lTojXDsZVAS29St/0gjmJybd34ZeIJWN9+YLIIp1Q?=
 =?us-ascii?Q?3W+oOcUCZ71XMkPQNjQPVIn2JdMcDGr8FxUOww5YiSGG0p4EsFOTIWUt2uO+?=
 =?us-ascii?Q?kyXgKxeZF3Wjewk3xdirNTNJ+2FeyPP5KZa+mA6wYbIoWQOEqK1qyWsWVvf5?=
 =?us-ascii?Q?bf84atHMgMprOWjZVWg+NMn1348lzLk4ZU+8gxTwapXa4D5ZMWxpOBf9fSo4?=
 =?us-ascii?Q?3Tf18QqQ2QvnTZofPG3VfUEUECpcXFpdLBTZzwVLZQJ1AIFFOefPgOii7/sA?=
 =?us-ascii?Q?rFkCwphlGoBDq/WS9SQIJHL/jHvb1lUPukpQ3KldtLhZEcDHuKaW/Az5erwx?=
 =?us-ascii?Q?eS1r2NXZwnfTwsHzejkO166kGVbhNM7M7+pOzxPaNNQJk1oqq6dsX+aE7zVX?=
 =?us-ascii?Q?wn4EDucCbHhHqlkYnphSCoeKuv8fAT/v7U3+bWhEmjlTvBJvgeRZp8WFjN3V?=
 =?us-ascii?Q?FwLxrxGrFJEuWKVFjcKzXkf7o9D8St0qLCt0kAlDNvdGd757jq5ezMCPOnP6?=
 =?us-ascii?Q?6fC/Bz6r57cRSfDQj0OKYfObrw0LCbxwiz01Ey+cpq1YljynLo08FcjfmYnq?=
 =?us-ascii?Q?ZVK8D0oLcgDwARDRKeyotE2ms2kKY0Q3DWHMALVI5y7PkOUTsqQAlkyXcwr6?=
 =?us-ascii?Q?34RE4tupan30Gs3oenvyxRHFsSW7TwcnXUY6vUJiWTxZYu+KaAgdNZg7J4Mu?=
 =?us-ascii?Q?ups78XuQUpkSGKh0hp/k5+AFol5MVIWFT9YbJBCJvFnhQa7BG8FPSbPoucuh?=
 =?us-ascii?Q?AbCmtD4iO9ygTIqlFV94+XNZ00liYhIuspJ1V3LgrvmmdxXhylRsCnl7cM62?=
 =?us-ascii?Q?KP9Sus/0ZJWOAt25jBWjai9RKA1wzOnQkNWwpt3pIzgtIZOr4y53WfHarKnf?=
 =?us-ascii?Q?hjmNttOTux9G1dvScYLhupr5CORcgNV7RKTRhN6C2/UBFA62trxDqaTIniu7?=
 =?us-ascii?Q?KYLj3qABQCkFyAQW5b1jDwGDYglbbIxE4zaJcI2e9Ir6nOvUU+0U+iv3dTj8?=
 =?us-ascii?Q?+ypgEYp1mQegcg+LXjpOtpOipG9/5rMo1rg+L3lCfXmPy1+5EJ++aehQ9Gaa?=
 =?us-ascii?Q?9kOpX6VwkB00fNujbGN9DDWkGevgOlgTpfO77Zxvk7HhxcCpN/k2+xsnyciv?=
 =?us-ascii?Q?bXQl+BQYIEXar4dM0sUcpF8Vry9tPI5qGkLidnT9AgHVSfoq8yMECSDsmi2Q?=
 =?us-ascii?Q?8gAkxFAyU+DRke7W8JzPgtZr1RzGJ0/xEJdoYBnbnrnEUToVlyLaVCbeD3oN?=
 =?us-ascii?Q?Yn9MKN1PKAyKPW3OjZpA2F/nfqu0XnGFq1sLc0bZAxUhgl86HNhuyuy+wiOe?=
 =?us-ascii?Q?3G+uZxqMm8R/LVW6Ec7DTyEl7wFCRFwmLbEj/r2qH8Cdg6xXeoR/lR0lNkAj?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f95813-0d82-4fe2-cf6b-08dc68f45307
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 09:02:55.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vo4IMSj6gwjIW3yjFALzZizl6IkkOF9RmnlifOjKHbmlL2FkbDZfU0u3T+twXGxG4KwCIroEx2q6Z7Vroe7+ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 42c771b6dd50c65af13b8a3f51a6e8689f6af3b5 ("intel_idle: add Emerald Rapids Xeon support")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr

in testcase: kernel-selftests
version: kernel-selftests-x86_64-c7864053-1_20240419
with following parameters:

	group: netfilter
	test: nft_conntrack_helper.sh



compiler: gcc-12
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404301635.1294804e-lkp@intel.com


kern  :warn  : [  183.635146] WARNING: suspicious RCU usage
kern  :warn  : [  183.640454] 5.4.119-20-g42c771b6dd50 #1 Not tainted
kern  :warn  : [  183.646737] -----------------------------
kern  :warn  : [  183.652044] include/trace/events/tlb.h:38 suspicious rcu_dereference_check() usage!
kern  :warn  : [  183.661454]
other info that might help us debug this:

kern  :warn  : [  183.672818]
RCU used illegally from idle CPU!
rcu_scheduler_active = 2, debug_locks = 1
kern  :warn  : [  183.687404] RCU used illegally from extended quiescent state!
kern  :warn  : [  183.694664] no locks held by swapper/202/0.
kern  :warn  : [  183.700164]
stack backtrace:
kern  :warn  : [  183.706647] CPU: 202 PID: 0 Comm: swapper/202 Not tainted 5.4.119-20-g42c771b6dd50 #1
kern  :warn  : [  183.716252] Call Trace:
kern :warn : [  183.719801] dump_stack (lib/dump_stack.c:120) 
kern :warn : [  183.724331] lockdep_rcu_suspicious (kernel/locking/lockdep.c:5449) 
kern :warn : [  183.730229] trace_tlb_flush (include/trace/events/tlb.h:38 include/trace/events/tlb.h:38) 
kern :warn : [  183.735440] switch_mm_irqs_off (arch/x86/mm/tlb.c:430) 
kern :warn : [  183.740944] ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:46) 
kern :warn : [  183.746549] leave_mm (arch/x86/mm/tlb.c:161 arch/x86/mm/tlb.c:150) 
kern :warn : [  183.750883] cpuidle_enter_state (drivers/cpuidle/cpuidle.c:230) 
kern :warn : [  183.756485] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:3395 kernel/locking/lockdep.c:3440) 
kern :warn : [  183.762282] ? rcu_idle_exit (arch/x86/include/asm/irqflags.h:41 (discriminator 2) arch/x86/include/asm/irqflags.h:84 (discriminator 2) kernel/rcu/tree.c:775 (discriminator 2)) 
kern :warn : [  183.767490] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:32 (discriminator 38)) 
kern :warn : [  183.772997] cpuidle_enter (include/linux/compiler.h:293 drivers/cpuidle/cpuidle.c:352) 
kern :warn : [  183.777822] cpuidle_idle_call (kernel/sched/idle.c:117 kernel/sched/idle.c:207) 
kern :warn : [  183.783230] ? arch_cpu_idle_exit+0x40/0x40 
kern :warn : [  183.788732] ? __kasan_check_read (mm/kasan/common.c:93) 
kern :warn : [  183.794237] do_idle (kernel/sched/idle.c:270) 
kern :warn : [  183.798571] cpu_startup_entry (kernel/sched/idle.c:361 (discriminator 1)) 
kern :warn : [  183.803783] start_secondary (arch/x86/kernel/smpboot.c:272) 
kern :warn : [  183.808995] ? set_cpu_sibling_map (arch/x86/kernel/smpboot.c:212) 
kern :warn : [  183.814992] secondary_startup_64 (arch/x86/kernel/head_64.S:241) 

kern  :warn  : [  183.820521] =============================
kern  :warn  : [  183.820521] WARNING: suspicious RCU usage
kern  :warn  : [  183.820521] 5.4.119-20-g42c771b6dd50 #1 Not tainted
kern  :warn  : [  183.820522] -----------------------------
kern  :warn  : [  183.820523] include/linux/rcupdate.h:620 rcu_read_lock() used illegally while idle!

kern  :warn  : [  183.820523] other info that might help us debug this:


kern  :warn  : [  183.820525] RCU used illegally from idle CPU!
kern  :warn  : [  183.820525] rcu_scheduler_active = 2, debug_locks = 1
kern  :warn  : [  183.820526] RCU used illegally from extended quiescent state!
kern  :warn  : [  183.820526] 4 locks held by swapper/202/0:
kern :warn : [  183.820526] #0: ffffffff85632b80 (console_lock){+.+.}, at: vprintk_emit (kernel/printk/printk.c:2023) 
kern :warn : [  183.820529] #1: ffffffff856326c0 (console_owner){-...}, at: console_unlock (kernel/printk/printk.c:2493) 
kern :warn : [  183.820531] #2: ffffffff85c97ff8 (printing_lock){....}, at: vt_console_print (drivers/tty/vt/vt.c:2966) 
kern :warn : [  183.820533] #3: ffffffff85656420 (rcu_read_lock){....}, at: __atomic_notifier_call_chain (kernel/notifier.c:185) 

kern  :warn  : [  183.820536] stack backtrace:
kern  :warn  : [  183.820536] CPU: 202 PID: 0 Comm: swapper/202 Not tainted 5.4.119-20-g42c771b6dd50 #1
kern  :warn  : [  183.820537] Call Trace:
kern :warn : [  183.820537] dump_stack (lib/dump_stack.c:120) 
kern :warn : [  183.820538] lockdep_rcu_suspicious (kernel/locking/lockdep.c:5449) 
kern :warn : [  183.820538] __atomic_notifier_call_chain (include/linux/rcupdate.h:620 kernel/notifier.c:188) 
kern :warn : [  183.820538] atomic_notifier_call_chain (kernel/notifier.c:200) 
kern :warn : [  183.820539] vt_console_print (drivers/tty/vt/vt.c:3013) 
kern :warn : [  183.820539] ? serial8250_config_port (drivers/tty/serial/8250/8250_port.c:3166) 
kern :warn : [  183.820540] ? unblank_screen (drivers/tty/vt/vt.c:2955) 
kern :warn : [  183.820540] call_console_drivers+0x16c/0x2e0 
kern :warn : [  183.820541] console_unlock (kernel/printk/printk.c:2505) 
kern :warn : [  183.820541] ? console_unlock (kernel/printk/printk.c:2493) 
kern :warn : [  183.820542] ? __down_trylock_console_sem (kernel/printk/printk.c:243) 
kern :warn : [  183.820542] ? vprintk_emit (kernel/printk/printk.c:2023) 
kern :warn : [  183.820542] vprintk_emit (kernel/printk/printk.c:2024) 
kern :warn : [  183.820543] vprintk_default (kernel/printk/printk.c:2054) 
kern :warn : [  183.820543] vprintk_func (kernel/printk/printk_safe.c:394) 
kern :warn : [  183.820544] ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:46) 
kern :warn : [  183.820544] printk (kernel/printk/printk.c:2079) 
kern :warn : [  183.820545] ? log_store.cold (kernel/printk/printk.c:2079) 
kern :warn : [  183.820545] ? tick_nohz_next_event (kernel/time/tick-sched.c:717) 
kern :warn : [  183.820546] ? tick_nohz_restart (kernel/time/tick-sched.c:661) 
kern :warn : [  183.820546] ? trace_hardirqs_on_thunk (arch/x86/entry/thunk_64.S:41) 
kern :warn : [  183.820546] ? trace_hardirqs_on_caller (kernel/trace/trace_preemptirq.c:60 (discriminator 38)) 
kern :warn : [  183.820547] ? __kasan_check_read (mm/kasan/common.c:93) 
kern :warn : [  183.820547] ? rcu_is_watching (include/linux/compiler.h:266 arch/x86/include/asm/atomic.h:31 include/asm-generic/atomic-instrumented.h:27 kernel/rcu/tree.c:301 kernel/rcu/tree.c:908) 
kern :warn : [  183.820548] lockdep_rcu_suspicious (kernel/locking/lockdep.c:5411) 
kern :warn : [  183.820548] trace_tlb_flush (include/trace/events/tlb.h:38 include/trace/events/tlb.h:38) 
kern :warn : [  183.820549] switch_mm_irqs_off (arch/x86/mm/tlb.c:430) 
kern :warn : [  183.820549] ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:46) 
kern :warn : [  183.820549] leave_mm (arch/x86/mm/tlb.c:161 arch/x86/mm/tlb.c:150) 
kern :warn : [  183.820550] cpuidle_enter_state (drivers/cpuidle/cpuidle.c:230) 
kern :warn : [  183.820550] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:3395 kernel/locking/lockdep.c:3440) 
kern :warn : [  183.820551] ? rcu_idle_exit (arch/x86/include/asm/irqflags.h:41 (discriminator 2) arch/x86/include/asm/irqflags.h:84 (discriminator 2) kernel/rcu/tree.c:775 (discriminator 2)) 
kern :warn : [  183.820551] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:32 (discriminator 38)) 
kern :warn : [  183.820552] cpuidle_enter (include/linux/compiler.h:293 drivers/cpuidle/cpuidle.c:352) 
kern :warn : [  183.820552] cpuidle_idle_call (kernel/sched/idle.c:117 kernel/sched/idle.c:207) 
kern :warn : [  183.820552] ? arch_cpu_idle_exit+0x40/0x40 
kern :warn : [  183.820553] ? __kasan_check_read (mm/kasan/common.c:93) 
kern :warn : [  183.820553] do_idle (kernel/sched/idle.c:270) 
kern :warn : [  183.820554] cpu_startup_entry (kernel/sched/idle.c:361 (discriminator 1)) 
kern :warn : [  183.820554] start_secondary (arch/x86/kernel/smpboot.c:272) 
kern :warn : [  183.820555] ? set_cpu_sibling_map (arch/x86/kernel/smpboot.c:212) 
kern :warn : [  183.820555] secondary_startup_64 (arch/x86/kernel/head_64.S:241) 

kern  :warn  : [  183.820556] =============================
kern  :warn  : [  183.820556] WARNING: suspicious RCU usage
kern  :warn  : [  183.820557] 5.4.119-20-g42c771b6dd50 #1 Not tainted
kern  :warn  : [  183.820557] -----------------------------
kern  :warn  : [  183.820558] include/linux/rcupdate.h:669 rcu_read_unlock() used illegally while idle!

kern  :warn  : [  183.820559] other info that might help us debug this:


kern  :warn  : [  183.820560] RCU used illegally from idle CPU!
kern  :warn  : [  183.820560] rcu_scheduler_active = 2, debug_locks = 1
kern  :warn  : [  183.820561] RCU used illegally from extended quiescent state!
kern  :warn  : [  183.820561] 4 locks held by swapper/202/0:
kern :warn : [  183.820561] #0: ffffffff85632b80 (console_lock){+.+.}, at: vprintk_emit (kernel/printk/printk.c:2023) 
kern :warn : [  183.820564] #1: ffffffff856326c0 (console_owner){-...}, at: console_unlock (kernel/printk/printk.c:2493) 
kern :warn : [  183.820566] #2: ffffffff85c97ff8 (printing_lock){....}, at: vt_console_print (drivers/tty/vt/vt.c:2966) 
kern :warn : [  183.820568] #3: ffffffff85656420 (rcu_read_lock){....}, at: __atomic_notifier_call_chain (kernel/notifier.c:185) 

kern  :warn  : [  183.820570] stack backtrace:
kern  :warn  : [  183.820571] CPU: 202 PID: 0 Comm: swapper/202 Not tainted 5.4.119-20-g42c771b6dd50 #1
kern  :warn  : [  183.820571] Call Trace:
kern :warn : [  183.820571] dump_stack (lib/dump_stack.c:120) 
kern :warn : [  183.820572] lockdep_rcu_suspicious (kernel/locking/lockdep.c:5449) 
kern :warn : [  183.820572] __atomic_notifier_call_chain (include/linux/rcupdate.h:669 kernel/notifier.c:190) 
kern :warn : [  183.820573] atomic_notifier_call_chain (kernel/notifier.c:200) 
kern :warn : [  183.820573] vt_console_print (drivers/tty/vt/vt.c:3013) 
kern :warn : [  183.820574] ? serial8250_config_port (drivers/tty/serial/8250/8250_port.c:3166) 
kern :warn : [  183.820574] ? unblank_screen (drivers/tty/vt/vt.c:2955) 
kern :warn : [  183.820575] call_console_drivers+0x16c/0x2e0 
kern :warn : [  183.820575] console_unlock (kernel/printk/printk.c:2505) 
kern :warn : [  183.820575] ? console_unlock (kernel/printk/printk.c:2493) 
kern :warn : [  183.820576] ? __down_trylock_console_sem (kernel/printk/printk.c:243) 
kern :warn : [  183.820576] ? vprintk_emit (kernel/printk/printk.c:2023) 
kern :warn : [  183.820577] vprintk_emit (kernel/printk/printk.c:2024) 
kern :warn : [  183.820577] vprintk_default (kernel/printk/printk.c:2054) 
kern :warn : [  183.820578] vprintk_func (kernel/printk/printk_safe.c:394) 
kern :warn : [  183.820578] ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:46) 
kern :warn : [  183.820578] printk (kernel/printk/printk.c:2079) 
kern :warn : [  183.820579] ? log_store.cold (kernel/printk/printk.c:2079) 
kern :warn : [  183.820579] ? tick_nohz_next_event (kernel/time/tick-sched.c:717) 
kern :warn : [  183.820580] ? tick_nohz_restart (kernel/time/tick-sched.c:661) 
kern :warn : [  183.820580] ? trace_hardirqs_on_thunk (arch/x86/entry/thunk_64.S:41) 
kern :warn : [  183.820581] ? trace_hardirqs_on_caller (kernel/trace/trace_preemptirq.c:60 (discriminator 38)) 
kern :warn : [  183.820581] ? __kasan_check_read (mm/kasan/common.c:93) 
kern :warn : [  183.820582] ? rcu_is_watching (include/linux/compiler.h:266 arch/x86/include/asm/atomic.h:31 include/asm-generic/atomic-instrumented.h:27 kernel/rcu/tree.c:301 kernel/rcu/tree.c:908) 
kern :warn : [  183.820582] lockdep_rcu_suspicious (kernel/locking/lockdep.c:5411) 
kern :warn : [  183.820582] trace_tlb_flush (include/trace/events/tlb.h:38 include/trace/events/tlb.h:38) 
kern :warn : [  183.820583] switch_mm_irqs_off (arch/x86/mm/tlb.c:430) 
kern :warn : [  183.820583] ? trace_hardirqs_off (kernel/trace/trace_preemptirq.c:46) 
kern :warn : [  183.820584] leave_mm (arch/x86/mm/tlb.c:161 arch/x86/mm/tlb.c:150) 
kern :warn : [  183.820584] cpuidle_enter_state (drivers/cpuidle/cpuidle.c:230) 
kern :warn : [  183.820585] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:3395 kernel/locking/lockdep.c:3440) 
kern :warn : [  183.820585] ? rcu_idle_exit (arch/x86/include/asm/irqflags.h:41 (discriminator 2) arch/x86/include/asm/irqflags.h:84 (discriminator 2) kernel/rcu/tree.c:775 (discriminator 2)) 
kern :warn : [  183.820585] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:32 (discriminator 38)) 
kern :warn : [  183.820586] cpuidle_enter (include/linux/compiler.h:293 drivers/cpuidle/cpuidle.c:352) 
kern :warn : [  183.820586] cpuidle_idle_call (kernel/sched/idle.c:117 kernel/sched/idle.c:207) 
kern :warn : [  183.820587] ? arch_cpu_idle_exit+0x40/0x40 
kern :warn : [  183.820587] ? __kasan_check_read (mm/kasan/common.c:93) 
kern :warn : [  183.820587] do_idle (kernel/sched/idle.c:270) 
kern :warn : [  183.820588] cpu_startup_entry (kernel/sched/idle.c:361 (discriminator 1)) 
kern :warn : [  183.820588] start_secondary (arch/x86/kernel/smpboot.c:272) 
kern :warn : [  183.820589] ? set_cpu_sibling_map (arch/x86/kernel/smpboot.c:212) 
kern :warn : [  183.820589] secondary_startup_64 (arch/x86/kernel/head_64.S:241) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240430/202404301635.1294804e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

