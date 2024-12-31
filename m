Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626B2AEE9
	for <oe-lkp@lists.linux.dev>; Tue, 31 Dec 2024 06:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735626296; cv=fail; b=gi8djcWlXntjYtvMQveSQjtE/yTM4V4rpdbqcbe28z2mhj7lylWK0LBNIQGcA74kJ6SqrvCGw/P9P8QuoC3AjsBMH5nJ47t51oVfSv4JwJ+ePj3Jcv8iD3FMkF76K7PkLISjR1pVlfN53XHz1hmcmjIDXyzpiRgmlcwRF7i6oP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735626296; c=relaxed/simple;
	bh=U6hhYjTSf6YK7cVVxvhb3VkQM+56vGxFcG9SeSfQdfg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Eos3LECIE2UEf3VIPHEA7QqJ7mtCO6xrOB0SD9PBb4sn443RGl8cGYi0Pbr7wss2IKANkSqgRR8IKkzGMqd2HrleapiJHK345HYHo19QTzy0BYvj1r361/MEdAbSBuEM6bAyYc/oNiYXOk4A9/Bt/4xfGzOOcQOlLmY+gvaoGcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxOaKmJQ; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxOaKmJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735626294; x=1767162294;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=U6hhYjTSf6YK7cVVxvhb3VkQM+56vGxFcG9SeSfQdfg=;
  b=CxOaKmJQXEB/Xe5WY2IJjhWEGss8JNU7XPZQ5yeH+kqz/kNJO8d+AdGm
   uZ7Aja9D5GIjFN/9/QghZbvxl5UsFvz5Ay01EuiC6mz/SKJ4LuRCcu2FR
   fw5RQWnfXF0I53NAg12ljvBCkNkvvaqSUwS1yfaLJMTD1TvXZRDcyQS4U
   Zza8rJWoE/LAvO7O3+i8oWKgBBAWfgVQIDmJU5I9kHjQwERHcc/h9ws/j
   5EnpOQp8/lYs82O4odlLml4FO2qC4oJo3B/5XcC56hl80yeJqN2yf1hrZ
   DxBzZOKjYDtRsirZDiVL/BXLnAH50f87GxhU993JeoC/QEg2GYIT+DWSD
   g==;
X-CSE-ConnectionGUID: FOKx7CYAS1u2dVc2VvXPNw==
X-CSE-MsgGUID: D82VRklPTe6jNthb6/a/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35217153"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35217153"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 22:24:53 -0800
X-CSE-ConnectionGUID: RPLC7AH9Q8a+YbOI7wx2qA==
X-CSE-MsgGUID: tgX4KVbfRQeu4vmGI/rVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101825322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Dec 2024 22:24:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 22:24:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 22:24:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 22:24:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCcfpbw7KkOlLuqUdvP0X3YXLCqc8UFq6RoYXI74kcnls0NiiZKtpXDfnhU5k0DwOP9IcMLnTFqeCGQkunyC72yiYnZCO1qS6Ol/M0Hghl6RoPUI0oY+jGAQotPm+d16zDlL4gy73LLC4aICm/bfG4nmnhBYzIfB18Oe21AJnP9bt2n8ZjXXXu9lFctGObi+OBgt4dzUV6NuyHjU2FGFm6Saf5uC4L3fFUH+iXViWf+KMSptqVnSAlhhJlomenkhuMmPX69ofGpO7Wif2fVgWAGM/7Exc5U4QIrKs5Ujd2jSRU8472Xd8nZbX0O+vGxpBzu76BRjbV86G52w4HTbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEU2DRs8+QbMuoT7VN/I/btJjKswJf4Ng/hAqCeOY5w=;
 b=qiEFyEyCNV1irjpGEx5xD9LzdZd55QXOrCpniczToBxuUdMgnA1eQXgBymjw2BVNKR+iMtWM9nA3CYgqTF/hUCUArWL1MdiGj2nojlCbWnE+kzp10XdCHU6uPS3G1QuACIbUsMh8FyPBPLf81ELDcUm6igUpqh58R6Gtve0bhqI26VYCp3Ack7w5loz7FjUKjnxhD5KhhdhQlMKSe8YveABwfnw3xdXts82bAYYHsw1Cr9rAFh2AwF9qFd01UG5cMkeSOxW4e+ErGP1Kfl04m5kh2GRhqM+PuD7VO4NHKDUWJ0MFniMfjvd6/+qWy7IbppRa0rz/0GiYDpnM9xvO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 06:24:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 06:24:40 +0000
Date: Tue, 31 Dec 2024 14:24:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <lin.x.wang@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:6.6-velinux] [hrtimer]  013ccf26c7:  unixbench.throughput
 75.5% improvement
Message-ID: <202412311424.5043f49a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL4PR11MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe38fbb-a817-4379-2415-08dd2963ce62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Yu1pG3tZHmoQeeclkuQAP8GpcjcFvJx3SN+ZLFLUajsxjkTfWLTNdpvym4?=
 =?iso-8859-1?Q?NfydHF3sEM7Efs1e5l3jnShaRszpqz4taNo8yN89yLMxluq1P0eu6eZiwe?=
 =?iso-8859-1?Q?ZqIU5YmBoNZnIqUJcQ0yCIdwuOX1A+pHkU0WsXe80F0UBhs6W1HU3BFVu2?=
 =?iso-8859-1?Q?D+FdOpQdmGsnUKVyFITClHXow+NNXtnNPOKByg+5eJhczYclDE9zJL25v5?=
 =?iso-8859-1?Q?uAUEqkeON9n6d25spTtgnuTWuLpN6NrsKqx+iTn+cqxWXm+ZP7uofGvbIW?=
 =?iso-8859-1?Q?mMYKh1/w/NC9haONswVTCDPu4QqxU+Pv4kHxX2twG36fJeJ3kKNv7JKbdB?=
 =?iso-8859-1?Q?6j7LfKDMktPldO6gRY5OC/mYXphReSiHsZJN6xOR6i2lKPR07piBT4JuWe?=
 =?iso-8859-1?Q?9KJ37Ehgunmb9Cx+qhEfm6SfoDigKsCiqHalg/FSPoW+HqyS7TAeNispRG?=
 =?iso-8859-1?Q?M2WhecDXxtk6W0R4lueyQgAkD9DZTn3agmbye4BDOz0K3sfaH+Z6TeUnXi?=
 =?iso-8859-1?Q?4fKvnDrmvCM7/VXmnPCzYBmkIDRj6FKoJp+CfFiM8bYvu5NkqZor9cMSms?=
 =?iso-8859-1?Q?SwCbut8Fq9WjbQWQ43Adxb5PcTm2dFLN98YNF0mpYsvHytp+mUvy+JtN3t?=
 =?iso-8859-1?Q?hiAfHuhiDql+N1KWVsLMwE3RomilijcjDTAdw1GTzbJRxn8IRr50GCvrdr?=
 =?iso-8859-1?Q?FsHNqP27uUpV8JoZyt/xOi77VJuSEluhtapLmFjJgscVTIPJkPN6lTyNRt?=
 =?iso-8859-1?Q?hVR5tnDOrUWrn+5F+2EKMi+6a3N5BfBXsT1mWO0vzh7Nm+y2R2pi8f24CI?=
 =?iso-8859-1?Q?RNu4JKy7J7h9Oy8cj08Ci3pzv75kvN1XXEJIDY5Ai9aUXn3pxqAHGkh+6N?=
 =?iso-8859-1?Q?0zMeemGm6Hpm0XpeSWHSwAlAlGDJJuSqPkP1lYmm8HHyCqxJTpCJJ2kPxT?=
 =?iso-8859-1?Q?D1ZYUUATPjht6u+0WB1gsz9BW3i1YifU1uO9bmtr6XqmjsMrFhrrSe4Ldt?=
 =?iso-8859-1?Q?ugtIWI2DewFiJDNGYRjB7EuU/Tean+Av+8hmTmHwPMWzuVgFY6Ht8JwHN9?=
 =?iso-8859-1?Q?aGw05O/ubYvzIESD8pAY947aBr77WAFRLvzh9MDWCOXTzZiLhPcSvRDbm6?=
 =?iso-8859-1?Q?ca+bGS5TEnQvinku1o83ikSXp/OcXdTGeh3D8Ao9ceKtfJfQGTpzSW0wRJ?=
 =?iso-8859-1?Q?iETzjSX+Qh2jg3zluzyeoSCX/VN7islUIT0PHa4ctcXcbGQmDsaQXuahCp?=
 =?iso-8859-1?Q?/F1bO3B2Aw0MmGCutzAvUa8kMen8rSBgZk631PkYdha2WuQE0OyOySRVqg?=
 =?iso-8859-1?Q?rDm2+jv324cZWyHeZM9g2LZ7tKDbBbQ4cZ/jG5uTdKrcOUO+jzjgwWPCAr?=
 =?iso-8859-1?Q?J0nyPbhRiVC+VjwG7sN+hKKp/2sF8zCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wACpu5KtiPo8RsRUtoZVJ2JK3HHPDVq8Qt2yo90JWvDUNyIKWInHapK+Da?=
 =?iso-8859-1?Q?lkeTZ8FrXOtsGQs1wLkGrwVz4TrtCB/2NPZ9Ec5KtNQOmimXBqL75/PBPz?=
 =?iso-8859-1?Q?8/VutaBciXzO5AJZJEsw5tvEl7GKPfbI893SDKV2/O6iXCvp3huU2abpaS?=
 =?iso-8859-1?Q?kNHsMWhIjlMgIDIzOnitBsKFHDYjy8uoPmZmjSbQWiuHTiMYDuczl50iZt?=
 =?iso-8859-1?Q?wi1/A78N0wNVHqteDrHGZYGgQrdI5Q2L7StfDOU2+4r2tHjBeSM2ChWJU0?=
 =?iso-8859-1?Q?1yXNHlQWwqF4ok81APB2JWpx629BGlWoZLeI2jcpzI4XGFdULnNZVtdonn?=
 =?iso-8859-1?Q?Tm5VEVUrFfwJ3dzjH1yZMbrzmBhbvpdMeat/2jsILQIGefcHzIs46mtgo+?=
 =?iso-8859-1?Q?HxEPL5B0ksbTPLvA3xCzQaWSvTfnJk0S3BRC3CgjrCS0zj/P9d3uu0fHej?=
 =?iso-8859-1?Q?+rMx4IniBcScHwOLNpjcQQD7F8SsXr5qnQS+tjPBhStbidLOEGMnFRskFe?=
 =?iso-8859-1?Q?rCgi+nbC5khiICEDFScPMpuu6k6f/u5tLsvn6TLtOCqbD7keai1EJAycjk?=
 =?iso-8859-1?Q?BYEKu3ZJQTW+a/uOz71zBcUvkqIUdaoupjCvOC/+3N285goW2/yszAsB/3?=
 =?iso-8859-1?Q?VsKrY1MVOJq8T/EktFSbqYLczz5s0A1KC77xWMzk+54t218UiCB0g7PL9D?=
 =?iso-8859-1?Q?53sPubiVKdFuqKiG8NmBwcPxOsHeSTF2e616nmc/iKVuGMW8iLEBPwc8am?=
 =?iso-8859-1?Q?4CTNn/MgDTe3cunU8u8bPgjvROaNkPbNnNpG+fSGhnWwfJXg8eb0ozq+uG?=
 =?iso-8859-1?Q?GXazZoiAEFJbA/8Kzdq4qZW/bKX6RFLMeFJqg4BPAPesB9BYDSQc1o57hC?=
 =?iso-8859-1?Q?1rCyStYSNSoiuZ8OMyBou0YBg73ypZHYlWXC5+vKbwjDqn3zIYbO44tn1o?=
 =?iso-8859-1?Q?SLwxrS1DswO8iJzEQGpGk+H5+1tO5HomX7Mv7W2v4S4ZOircL1stK18grB?=
 =?iso-8859-1?Q?vYu3LIN9T2OHtxY58rgLmAAOHPRce/qz0PMxnUlCqxwKC/FPrg6yFYCLy6?=
 =?iso-8859-1?Q?5PfTzubOqmdT0CMNywswCegPEb/LamK6nPHMo+gnWr8xXu4SQD4IcAJdOV?=
 =?iso-8859-1?Q?+B2LkX9v5Ds71GVfEeWafytj0sPueyfmLcA2Nmcz6luw84OP1oGi7jRz7e?=
 =?iso-8859-1?Q?sJSsBFX5f4gdcJsyEdNAzi9P2CU61ZP5FXi+/Mkq0bfFpJNXWganOVY3XD?=
 =?iso-8859-1?Q?OBAsgfFUBGrYRk9bExsdgnxrq7i4KbeICWI7phlL+VCEZDNqmUeCy26pII?=
 =?iso-8859-1?Q?Zc+PaM9LTOvxSwANg9+GZJq0fN3xyIfXVXXcythfZqJ/qZJI6Dze+7HoL+?=
 =?iso-8859-1?Q?4VMpzyyQvgwEn6kcZhCh2UwDkFZAE/wjG5O162RulqlWhobJjfS6JOKwiU?=
 =?iso-8859-1?Q?WAJE4WwZ0K69TadI5z+EqcqTSPxDz7IOlhYeNOD8ZI0KDi6cD9T3AGF8zJ?=
 =?iso-8859-1?Q?yB51myY3F3laq9iR7deqMCd0qIxvORgOqVD7wU9TdW7qhfyy6KVN8Fo2dL?=
 =?iso-8859-1?Q?LrxeEwUtvtqVAdVtUZ08bJhIVv52WXrMZbvV0WsDCwpRAzCg+TwB3suWbA?=
 =?iso-8859-1?Q?kyA41t5DBM38vWNYbK0FJn7zg+vPxxPfCGIl2mT02CYxrra8E4YHYFXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe38fbb-a817-4379-2415-08dd2963ce62
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 06:24:40.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UATFgHE82sxCcoHvREKyEg6GXKK1ui+fHz9fTDYpVeiCa5ZOBWoXvQNQMk4AkR/sfQIvgW/4n6P/751LOI3rww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 75.5% improvement of unixbench.throughput on:


commit: 013ccf26c770360a421533af04ab9c8340800743 ("hrtimer: Report offline hrtimer enqueue")
https://github.com/bytedance/kernel.git 6.6-velinux

testcase: unixbench
config: x86_64-bytedance-6.6-velinux
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: pipe
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241231/202412311424.5043f49a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-bytedance-6.6-velinux/100%/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-1ap1/pipe/unixbench

commit: 
  5889d60ad0 ("usb: dwc3: pci: add support for the Intel Arrow Lake-H")
  013ccf26c7 ("hrtimer: Report offline hrtimer enqueue")

5889d60ad020f439 013ccf26c770360a421533af04a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      6.10            +6.1       12.16        mpstat.cpu.all.usr%
      6.07           +99.0%      12.07        vmstat.cpu.us
   6259536            -1.1%    6190155        proc-vmstat.numa_hit
   6259545            -1.1%    6190131        proc-vmstat.numa_local
   6378240            -1.1%    6311019        proc-vmstat.pgalloc_normal
   7485679            -1.6%    7368770        proc-vmstat.pgfault
    233701           +75.5%     410248        unixbench.score
 2.907e+08           +75.5%  5.103e+08        unixbench.throughput
     66218            -8.7%      60478        unixbench.time.system_time
      5755           +99.7%      11491        unixbench.time.user_time
 1.143e+11           +75.5%  2.006e+11        unixbench.workload
      8.32 ±  3%     +43.4%      11.93 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    100.17 ±  9%     +63.4%     163.67 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
    103.33 ±  5%     +57.7%     163.00 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
    110.83 ±  5%     +70.8%     189.33 ±  4%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2600 ±  3%     -10.3%       2331 ±  3%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    589.33 ±  4%     -30.5%     409.83 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     24.65 ±  7%     +23.9%      30.54 ±  9%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.32 ±  3%     +43.4%      11.93 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     24.65 ±  7%     +23.9%      30.53 ±  9%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
 8.525e+10           +75.7%  1.498e+11        perf-stat.i.branch-instructions
 4.399e+08           +75.6%  7.725e+08        perf-stat.i.branch-misses
      1.13 ±  3%      +1.5        2.67        perf-stat.i.cache-miss-rate%
    592720 ±  3%      -9.3%     537625 ±  4%  perf-stat.i.cache-misses
  98629842 ±  2%     -88.4%   11433967 ±  3%  perf-stat.i.cache-references
      1.53 ±  3%     -36.4%       0.97 ±  5%  perf-stat.i.cpi
 6.169e+11            -6.9%  5.742e+11        perf-stat.i.cpu-cycles
  26241927 ±  3%      -7.3%   24331948 ±  2%  perf-stat.i.cycles-between-cache-misses
  4.42e+11           +75.7%  7.766e+11        perf-stat.i.instructions
      0.74           +71.5%       1.27        perf-stat.i.ipc
      0.00 ±  4%     -48.6%       0.00 ±  3%  perf-stat.overall.MPKI
      0.60 ±  4%      +4.1        4.67 ±  3%  perf-stat.overall.cache-miss-rate%
      1.40           -47.0%       0.74        perf-stat.overall.cpi
      0.72           +88.7%       1.35        perf-stat.overall.ipc
 8.519e+10 ±  2%     +75.6%  1.496e+11        perf-stat.ps.branch-instructions
 4.396e+08 ±  2%     +75.5%  7.716e+08        perf-stat.ps.branch-misses
    596874 ±  3%      -9.7%     538776 ±  3%  perf-stat.ps.cache-misses
  98813013 ±  2%     -88.3%   11534822 ±  3%  perf-stat.ps.cache-references
 6.164e+11            -7.0%  5.736e+11        perf-stat.ps.cpu-cycles
 4.417e+11 ±  2%     +75.6%  7.758e+11        perf-stat.ps.instructions
 1.752e+14           +75.3%  3.071e+14        perf-stat.total.instructions
   5253557 ±  7%     -15.1%    4461591 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.avg
   5284277 ±  7%     -15.1%    4488647 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
   4497625 ±  6%     -15.3%    3810669 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.25 ± 15%     -25.2%       0.19 ±  9%  sched_debug.cfs_rq:/.h_nr_running.max
   5253557 ±  7%     -15.1%    4461591 ±  5%  sched_debug.cfs_rq:/.min_vruntime.avg
   5284277 ±  7%     -15.1%    4488647 ±  5%  sched_debug.cfs_rq:/.min_vruntime.max
   4497625 ±  6%     -15.3%    3810669 ±  4%  sched_debug.cfs_rq:/.min_vruntime.min
      0.32 ± 69%    +827.0%       3.00 ±117%  sched_debug.cfs_rq:/.removed.load_avg.avg
      0.16 ± 73%    +115.6%       0.33 ± 39%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
      0.16 ± 73%    +115.6%       0.33 ± 39%  sched_debug.cfs_rq:/.removed.util_avg.avg
    161.95 ± 14%     -18.7%     131.60 ±  5%  sched_debug.cfs_rq:/.util_avg.max
    148534 ±  7%     -15.3%     125877 ±  5%  sched_debug.cpu.avg_idle.avg
    156070 ±  6%     -16.0%     131077 ±  4%  sched_debug.cpu.avg_idle.max
      9477 ±  8%     -15.8%       7980 ±  9%  sched_debug.cpu.avg_idle.stddev
     64374 ±  7%     -15.1%      54665 ±  5%  sched_debug.cpu.clock.avg
     64382 ±  7%     -15.1%      54671 ±  5%  sched_debug.cpu.clock.max
     64366 ±  7%     -15.1%      54658 ±  5%  sched_debug.cpu.clock.min
     64374 ±  7%     -15.1%      54665 ±  5%  sched_debug.cpu.clock_task.avg
     64382 ±  7%     -15.1%      54671 ±  5%  sched_debug.cpu.clock_task.max
     64366 ±  7%     -15.1%      54658 ±  5%  sched_debug.cpu.clock_task.min
      2737 ±  7%     -15.1%       2325 ±  5%  sched_debug.cpu.curr->pid.max
     75428 ±  7%     -15.2%      64000 ±  5%  sched_debug.cpu.max_idle_balance_cost.avg
     78049 ±  6%     -15.8%      65742 ±  3%  sched_debug.cpu.max_idle_balance_cost.max
    647.67 ±  7%     -15.1%     549.67 ±  5%  sched_debug.cpu.next_balance.avg
    647.67 ±  7%     -15.1%     549.67 ±  5%  sched_debug.cpu.next_balance.max
    647.67 ±  7%     -15.1%     549.67 ±  5%  sched_debug.cpu.next_balance.min
      0.26 ± 16%     -27.3%       0.19 ±  9%  sched_debug.cpu.nr_running.max
      0.01 ± 16%     -31.0%       0.01 ± 10%  sched_debug.cpu.nr_running.stddev
    382.08 ±  7%     -14.3%     327.59 ±  5%  sched_debug.cpu.nr_switches.avg
    213.80 ±  6%     -14.2%     183.36 ±  6%  sched_debug.cpu.nr_switches.min
     64366 ±  7%     -15.1%      54658 ±  5%  sched_debug.cpu_clk
 6.477e+08 ±  7%     -15.1%  5.497e+08 ±  5%  sched_debug.jiffies
     64233 ±  7%     -15.1%      54546 ±  5%  sched_debug.ktime
     65213 ±  7%     -15.2%      55305 ±  5%  sched_debug.sched_clk
     50.14           -46.7        3.43        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.pipe_read.vfs_read.ksys_read
     50.44           -46.4        4.07        perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.vfs_read.ksys_read.do_syscall_64
     59.53           -38.0       21.56        perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     62.71           -35.0       27.72        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     64.71           -33.2       31.55        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     66.75           -31.9       34.87        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     67.79           -30.9       36.88        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     73.35           -24.0       49.38        perf-profile.calltrace.cycles-pp.read
      0.25 ±100%      +0.4        0.60        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.03            +0.4        1.42        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.60            +0.5        1.12        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.90 ±  2%      +0.6        1.46        perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touch_atime.pipe_read.vfs_read
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.59        perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      0.00            +0.7        0.67        perf-profile.calltrace.cycles-pp.__raw_spin_unlock_irq.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.fsnotify_perm.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.70        perf-profile.calltrace.cycles-pp.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
      0.83 ±  2%      +0.7        1.56        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.75        perf-profile.calltrace.cycles-pp.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00            +0.8        0.75        perf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.80 ±  2%      +0.8        1.56        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.8        0.77        perf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.85            +0.8        1.65        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.8        0.82        perf-profile.calltrace.cycles-pp.main
      0.95            +0.8        1.78        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +0.8        0.83        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      0.88            +0.8        1.72        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.9        0.89        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +0.9        0.89        perf-profile.calltrace.cycles-pp.__get_task_ioprio.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.91        perf-profile.calltrace.cycles-pp.__get_task_ioprio.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.94        perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.pipe_write.vfs_write
      0.89            +0.9        1.83        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.09 ±  2%      +0.9        2.03        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.10 ±  2%      +1.0        2.13        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.23            +1.1        2.29        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.15            +1.1        2.25        perf-profile.calltrace.cycles-pp.__raw_spin_lock_irqsave.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      1.28            +1.2        2.48        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.pipe_write.vfs_write.ksys_write
      1.38            +1.2        2.60        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      1.65            +1.5        3.11        perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.45 ±  2%      +2.3        4.76        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.71 ±  2%      +2.4        5.07        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read
      2.89            +2.5        5.40        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write
      3.32 ±  2%      +2.9        6.22        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read.ksys_read
      3.84 ±  2%      +3.3        7.16        perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.91            +3.5        7.37        perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write.ksys_write
      4.64            +4.1        8.78        perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.vfs_write.ksys_write.do_syscall_64
      5.46            +5.1       10.56        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      4.98            +5.6       10.62        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
     14.15           +13.1       27.21        perf-profile.calltrace.cycles-pp.pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.87           +15.7       32.59        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     18.82           +17.4       36.24        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     20.80           +19.2       39.96        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     21.79           +20.1       41.90        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     27.92           +25.9       53.79        perf-profile.calltrace.cycles-pp.write
     50.34           -46.5        3.83        perf-profile.children.cycles-pp.atime_needs_update
     50.53           -46.3        4.25        perf-profile.children.cycles-pp.touch_atime
     60.03           -37.4       22.61        perf-profile.children.cycles-pp.pipe_read
     63.01           -34.7       28.27        perf-profile.children.cycles-pp.vfs_read
     64.88           -33.0       31.87        perf-profile.children.cycles-pp.ksys_read
     74.75           -23.2       51.58        perf-profile.children.cycles-pp.read
     88.26           -12.2       76.04        perf-profile.children.cycles-pp.do_syscall_64
     89.80           -10.7       79.10        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.27 ±  2%      +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.28 ±  2%      +0.0        0.30        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.27 ±  2%      +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.30 ±  2%      +0.0        0.33        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.12 ±  3%      +0.1        0.22        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.09            +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.write@plt
      0.26 ±  3%      +0.2        0.41        perf-profile.children.cycles-pp.make_vfsuid
      0.24            +0.2        0.41        perf-profile.children.cycles-pp.amd_clear_divider
      0.18 ±  2%      +0.2        0.36        perf-profile.children.cycles-pp.read@plt
      0.21 ±  2%      +0.2        0.39        perf-profile.children.cycles-pp.make_vfsgid
      0.22            +0.2        0.41        perf-profile.children.cycles-pp.__wake_up_sync_key
      0.24 ±  2%      +0.2        0.46        perf-profile.children.cycles-pp.__x64_sys_write
      0.23            +0.2        0.48        perf-profile.children.cycles-pp.__x64_sys_read
      0.27 ±  2%      +0.3        0.57        perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.57            +0.3        0.90        perf-profile.children.cycles-pp.fpregs_assert_state_consistent
      0.50            +0.3        0.83        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.35 ±  2%      +0.3        0.69        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.43 ±  2%      +0.4        0.81        perf-profile.children.cycles-pp.fsnotify_perm
      0.37            +0.4        0.79        perf-profile.children.cycles-pp.kill_fasync
      0.61            +0.4        1.02        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.44 ±  2%      +0.5        0.90        perf-profile.children.cycles-pp.__wake_up_common
      0.53            +0.5        1.01        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.50            +0.5        0.99        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.54 ±  2%      +0.5        1.05        perf-profile.children.cycles-pp.timestamp_truncate
      0.60 ±  2%      +0.5        1.12        perf-profile.children.cycles-pp.rcu_all_qs
      0.63 ±  2%      +0.6        1.25        perf-profile.children.cycles-pp.rw_verify_area
      0.74 ±  6%      +0.6        1.36 ±  2%  perf-profile.children.cycles-pp.main
      1.00            +0.6        1.64        perf-profile.children.cycles-pp.current_time
      0.71 ±  2%      +0.6        1.36        perf-profile.children.cycles-pp.security_file_permission
      1.14            +0.6        1.79        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.56            +0.7        1.26        perf-profile.children.cycles-pp.__raw_spin_unlock_irq
      0.90 ±  2%      +0.8        1.75        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      1.04            +1.0        2.03        perf-profile.children.cycles-pp.__get_task_ioprio
      1.12 ±  2%      +1.0        2.13        perf-profile.children.cycles-pp.__cond_resched
      1.19 ±  2%      +1.1        2.32        perf-profile.children.cycles-pp.__raw_spin_lock_irqsave
      1.50            +1.4        2.89        perf-profile.children.cycles-pp.inode_needs_update_time
      2.44            +1.5        3.95        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.55            +1.5        3.06        perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.78            +1.6        3.39        perf-profile.children.cycles-pp.__fget_light
      1.81            +1.6        3.43        perf-profile.children.cycles-pp.file_update_time
      1.75            +1.7        3.43        perf-profile.children.cycles-pp.mutex_unlock
      2.43 ±  2%      +2.2        4.60        perf-profile.children.cycles-pp.__fdget_pos
      2.78            +2.4        5.21        perf-profile.children.cycles-pp.mutex_lock
      2.88 ±  2%      +2.5        5.38        perf-profile.children.cycles-pp.copyout
      2.70 ±  2%      +2.5        5.24        perf-profile.children.cycles-pp.__wake_up_common_lock
      2.22            +2.7        4.88        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.10            +2.7        5.77        perf-profile.children.cycles-pp.copyin
      3.45 ±  2%      +3.0        6.44        perf-profile.children.cycles-pp._copy_to_iter
      3.98 ±  2%      +3.5        7.43        perf-profile.children.cycles-pp.copy_page_to_iter
      4.04            +3.6        7.60        perf-profile.children.cycles-pp._copy_from_iter
      4.77            +4.3        9.03        perf-profile.children.cycles-pp.copy_page_from_iter
      6.03            +6.1       12.10        perf-profile.children.cycles-pp.entry_SYSCALL_64
     14.74           +13.6       28.34        perf-profile.children.cycles-pp.pipe_write
     17.28           +16.0       33.29        perf-profile.children.cycles-pp.vfs_write
     19.05           +17.5       36.59        perf-profile.children.cycles-pp.ksys_write
     29.03           +27.3       56.35        perf-profile.children.cycles-pp.write
     48.83           -47.2        1.60        perf-profile.self.cycles-pp.atime_needs_update
      0.08            +0.1        0.13 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.04 ± 44%      +0.1        0.10        perf-profile.self.cycles-pp.read@plt
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.write@plt
      0.21 ±  4%      +0.1        0.31        perf-profile.self.cycles-pp.make_vfsuid
      0.16 ±  2%      +0.1        0.27        perf-profile.self.cycles-pp.make_vfsgid
      0.14 ±  4%      +0.1        0.25        perf-profile.self.cycles-pp.__wake_up_sync_key
      0.13            +0.1        0.24        perf-profile.self.cycles-pp.__x64_sys_write
      0.16 ±  2%      +0.1        0.27        perf-profile.self.cycles-pp.amd_clear_divider
      0.12            +0.1        0.26        perf-profile.self.cycles-pp.__x64_sys_read
      0.30 ±  2%      +0.2        0.50        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.19            +0.2        0.42        perf-profile.self.cycles-pp.touch_atime
      0.20            +0.2        0.45        perf-profile.self.cycles-pp.kill_fasync
      0.26            +0.3        0.51        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.22 ±  2%      +0.3        0.48        perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.47            +0.3        0.75        perf-profile.self.cycles-pp.fpregs_assert_state_consistent
      0.36 ±  2%      +0.3        0.67        perf-profile.self.cycles-pp.rcu_all_qs
      0.32 ±  2%      +0.3        0.64        perf-profile.self.cycles-pp.file_update_time
      0.56 ±  2%      +0.3        0.88        perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.51            +0.3        0.84        perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.37            +0.3        0.70        perf-profile.self.cycles-pp.fsnotify_perm
      0.36 ±  2%      +0.4        0.76        perf-profile.self.cycles-pp.__wake_up_common
      0.44 ±  2%      +0.4        0.85        perf-profile.self.cycles-pp.timestamp_truncate
      0.46 ±  2%      +0.4        0.90        perf-profile.self.cycles-pp.rw_verify_area
      0.74            +0.5        1.21        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.68 ±  2%      +0.5        1.15        perf-profile.self.cycles-pp.current_time
      0.56 ±  2%      +0.5        1.03        perf-profile.self.cycles-pp._copy_to_iter
      0.53            +0.5        1.01        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.50            +0.5        0.99        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.41 ±  2%      +0.5        0.90        perf-profile.self.cycles-pp.__raw_spin_unlock_irq
      0.56 ±  2%      +0.5        1.06        perf-profile.self.cycles-pp.copy_page_to_iter
      0.46            +0.5        0.98        perf-profile.self.cycles-pp.main
      0.62 ±  2%      +0.5        1.14        perf-profile.self.cycles-pp.ksys_write
      0.60 ±  2%      +0.5        1.13        perf-profile.self.cycles-pp.security_file_permission
      0.66 ±  2%      +0.6        1.22        perf-profile.self.cycles-pp.__fdget_pos
      0.64 ±  2%      +0.6        1.22        perf-profile.self.cycles-pp.__cond_resched
      0.70 ±  2%      +0.6        1.35        perf-profile.self.cycles-pp.ksys_read
      0.72            +0.7        1.40        perf-profile.self.cycles-pp.inode_needs_update_time
      0.78 ±  2%      +0.7        1.47        perf-profile.self.cycles-pp.__wake_up_common_lock
      0.77 ±  2%      +0.7        1.49        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.77 ±  2%      +0.7        1.50        perf-profile.self.cycles-pp.copy_page_from_iter
      0.93 ±  2%      +0.8        1.77        perf-profile.self.cycles-pp._copy_from_iter
      0.92            +0.9        1.80        perf-profile.self.cycles-pp.__get_task_ioprio
      1.02            +0.9        1.90        perf-profile.self.cycles-pp.do_syscall_64
      1.11 ±  2%      +1.1        2.18        perf-profile.self.cycles-pp.__raw_spin_lock_irqsave
      1.59            +1.4        2.97        perf-profile.self.cycles-pp.mutex_lock
      1.62            +1.4        3.01        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.47            +1.4        2.90        perf-profile.self.cycles-pp._raw_spin_lock_irq
      1.67 ±  2%      +1.5        3.14        perf-profile.self.cycles-pp.vfs_read
      1.65            +1.5        3.15        perf-profile.self.cycles-pp.__fget_light
      1.56            +1.5        3.09        perf-profile.self.cycles-pp.vfs_write
      1.64            +1.6        3.21        perf-profile.self.cycles-pp.mutex_unlock
      1.61 ±  2%      +1.6        3.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.00            +2.0        3.96        perf-profile.self.cycles-pp.pipe_read
      2.31            +2.3        4.58        perf-profile.self.cycles-pp.pipe_write
      2.79 ±  2%      +2.4        5.22        perf-profile.self.cycles-pp.copyout
      2.49            +2.5        4.95        perf-profile.self.cycles-pp.read
      2.15            +2.6        4.75        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.04            +2.6        5.68        perf-profile.self.cycles-pp.copyin
      2.25            +2.7        4.92        perf-profile.self.cycles-pp.write




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

