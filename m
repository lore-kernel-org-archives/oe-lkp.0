Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE525A625
	for <oe-lkp@lists.linux.dev>; Wed,  9 Apr 2025 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204060; cv=fail; b=LCrpevfLh2o8+XvgH6HG/7a34OtJ0mAcXXGhkVOmIHR8gVyo7QxXuc0gPOxGGG7WHpBYjVm7/cs8m8bbRoBa+enqLTtYJRdMu4biz63rWpQrxmfZn9HUbDFzzubn8li/4uwwY983m16ZAndwgTY5ZMZQr26hCz0HHIWWetQFvIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204060; c=relaxed/simple;
	bh=LY/7P8sZ2KUdDYs3c9pEuqfC8ihTI6Ngx+cdhUDzfYs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KaHfKAXlssnD2gLsY5e2MGy4yhUW5/s4vz8n8MqjnqQ9QxgJCR58QLwJZpZlN7yTmlS0BUTKk29vnOLFWeewfBZCIdYJ7YPiVidAq3oT4hEQZw3R667QI2HNS2wLKjEsWrKqYN06Ba9gljQpprvYLsWNQwckX/7oepVd/u7UanQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huNwurN0; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huNwurN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744204059; x=1775740059;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LY/7P8sZ2KUdDYs3c9pEuqfC8ihTI6Ngx+cdhUDzfYs=;
  b=huNwurN0zO0bhagO5Rmn6oeiy8az7oOb3TDpHZY1EDo6lfZhaDgZSDYH
   XxlELVvSeg6fACwaEQ3i2JfdSLbCTLUwbt8C04XSOe922I0BdjmVMLDam
   kbQldNo/8uvVpnBTjmoveJg5GKm2fah7cA3LNx5+gJDy8LE/VEYSNVUYt
   LnZJc2S4IXGUKq1iV6atj2EFYCDHaXvSu0uKrwjf29ycwmwGMQVyUy4y0
   7qx+hQL5vhG6uv6grkjxUqNF/pL56vzkCgMBXBAADpwIYQ59s6yFakiYc
   gKCtQ++fR/tA6xui7ReXFPLvMGrLPPUK9R0eeeHx27qww4SaIY1yBRwx9
   g==;
X-CSE-ConnectionGUID: hi1qQlrTSyGI6gOv/zlTVQ==
X-CSE-MsgGUID: h15nesitQzGSOtzjp5g8Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56312026"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56312026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:07:37 -0700
X-CSE-ConnectionGUID: VMySsC91Q4mBalSXrn07yw==
X-CSE-MsgGUID: DL/wRRORSHOdpS9J1au6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128323860"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:07:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 06:07:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 06:07:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 06:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJV5VToJUTDv2biIsPdeodD681EkAGAZVB47kFP1+2Ka3U9d7RLtOk3OLe4tZitEkoWJtinGoqwXo/kDiduvUuNO4v5MZmdo3m46gk1dbXjl9a4BI+5R+pXzthc9PcuOBjvXKIHJjFq5Kei3R6/BEs73Go77W9oEgZtWEQJ7GbVE4O3zXyloiimf/Yeqdn4P4Co3Kdbd5stzi3mR0ayQVvBiRPT2uwrFHVpMVeP3JJxEqgBTu20RSHi27TSl8p1gUODlSCt9q8RwjnIFj0wM2CR7G2gGF4tvKgCmrpvLMjhZ0nTqrUw+ElDRkUuT5UKEqNjpoL60XfEPWHFgkfV1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDs3Bj/aDAJ/NnPOaIVCjT/Z42SY4dyJ82qsuxKSXy0=;
 b=n46NbKjZr29c3rk6zQlv+AzGnsjtsqxXufdLppJvbjBMe0yenvygNHuFsH3+UBUj4wAfVDIRbSWAPf1ncvNF0KCBfqRlWAm7nP2B8SL90n6zbnqkpc6QEGNYCUUM+1KMhpLcpxWk9peiN91o5hVkLXeWXe4eaSEAXxlkc0v6DRSV7FEyUOO6flrbL8+r2ArQN9JflXzJuJNSlwKz7RvCHYK94SYxL2n3SL/RUjC/VTfHue9IvHhE96qI1UGhny7ND7VMsOkiNfy69ICjZXlvMd16TQKXhEtzoId7PUjH5zxhXskSfh10Vc4tstlfIBAnnkqq2333fHeerS6MO/j0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 13:07:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 13:07:33 +0000
Date: Wed, 9 Apr 2025 21:07:26 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-lkp@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: RFB: unrolled inline memset and memcpy
Message-ID: <Z/ZxDjbEDx+wkLOO@xsang-OptiPlex-9020>
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 50265bce-e5f4-4ab8-6a41-08dd77677df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CmDY6l4nTMvayhRyXdoL9wqTKXGumeLA5qLXhPeRH/ue6RIN3ONIJQcCfy/2?=
 =?us-ascii?Q?3ODToHoKdGBq4jwI/w8rhiPyiuU51E33CgmuXL3L6tRqLN/iO+3+CtaLFlzP?=
 =?us-ascii?Q?cp2oALS7gew6ExRIEivTMuJmhELrqPG0NWprUPN7gBtN8KV4YwX7ODVF7Fnl?=
 =?us-ascii?Q?4XaWf2DOrYkpWQ4zsDXlcxAMXtMI50knuaPT5wXJRcbeIUVxPbWMEd7arukl?=
 =?us-ascii?Q?tg2JUygQ/0MT0umTR38Q1eY7PtojWWgHvI2bvU3NjlI52XyLRqXNkWPmPnR6?=
 =?us-ascii?Q?K1Sgb9TIWG5E6rqOwoUJGmUBH7jQKeJUEF3Bdlvo1CG2pxfIg6KhXMtVDns/?=
 =?us-ascii?Q?7U4KLjqkPMeGhQ4mxbtJapdSThse3hwLlqcukciBsvngwyB/QnZfiNy7Gc6C?=
 =?us-ascii?Q?LrQKpilMjXusAz9kuMGfFrtuDFANVwixzGLIAJUL3BaF6CkkVh2IpIypzQno?=
 =?us-ascii?Q?ptlNJhy3+iQlCtLbEoy/W/SqDrg4GgrNpj0bdKakO/UclOd7aF68rmDqmnOl?=
 =?us-ascii?Q?PZeGu9Pwsv5WILVQMZwkeoE7mKe4aL1E4mw2ITIt6V/zy8U9E26WwG1mJ8Bw?=
 =?us-ascii?Q?4fyNA42Z5c+LMXKU6fj8eMalbmoV72EVx0KTJYIapLLf2VlsvpSf3OHhpvqj?=
 =?us-ascii?Q?bCyDJso64jQ2uvb+1Nq8G4/ZixH/qmYwVKCnIVZ/dtGHg2BpRumvxGIKDiIi?=
 =?us-ascii?Q?YlsEfdiw0/Z0aHdQ176OcuJpB8VNvcyq5XsVVbeU1Eqe7Im6cFmqx1JU2dw5?=
 =?us-ascii?Q?tWldp9o53cm+8cn3G2LKdx0tkfMdAavVZCj/kKaIk2yjzUI4GLe5Pm0x8CYk?=
 =?us-ascii?Q?oIThoOZQxzrb578eULl5uYo4VmxirdNyU3mx6dmz2oN0hSCkwQbIVsEZevxh?=
 =?us-ascii?Q?eJCpwfb4rHBN9ea2gLe2+39D3Ie91SNlX1usyShSghpbrJnim98MlVaq221w?=
 =?us-ascii?Q?ZRLDmymS2lpoT5eHM+ak122LrHGYmcNEPJuOWFQBq9n+avZAKk2+Qy47ZE9R?=
 =?us-ascii?Q?3FCbcVrGx0sGvB9gvZw7UhLllL9v2P2ktL4HztYtlHXUUoynVwXztfCBY+pL?=
 =?us-ascii?Q?mMOklF7stgodNcHguKgSdtLosEnH2Vk4/jqG8MJqvz5bqSo2JbymiemD4Clg?=
 =?us-ascii?Q?EO5hvlrZxcAguAzMYuYuoSHPoIWwkkBfFkclqyVmbNTtWCYvH9wgKMrGVI5c?=
 =?us-ascii?Q?eMINpyCsOM/520kztnSrSnRLVj4dGCS0B7KVcIvd+Vc2lfW3BmmKnfVDZVSL?=
 =?us-ascii?Q?c/2NYgz7LRt6qo6+KA9XemDdwOPs7F02/SGr1uNGDl2DOsbOsr689MSrKXNx?=
 =?us-ascii?Q?wC6sxYJLxewkUXbzYBt6vIXRbzGwtCcojAbaI5YqjVpG8RY0RlEInt1Tq6Wc?=
 =?us-ascii?Q?eG7J+5Z2D7OvfSXxyhq1N8jI/ggS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a9d3Hb8K9wxiAXitMf0IBtwwFagZSFxj2fzefQvySY2cdHkK9jyrawCXr7PK?=
 =?us-ascii?Q?dmv9R/zikqo9YxRL4eYNLeSnAc0WfGDlIYnJcSYQBSb8wNMN/C1d056ZRo34?=
 =?us-ascii?Q?PNIFibg9GE5m8sumYfFJx/P2rn7vQ3t6lK/RjzZMnRmWw9CTHh8PGxSJft97?=
 =?us-ascii?Q?DVGkgNyo3HJT688oe9/LW2nwycSY+TaFrDIILDOBxWSyWohJgABXx+ZWTRdo?=
 =?us-ascii?Q?3PzFDa/L6YRr83WJaeXswd4RH98Ym7Zl5c2oE/YZQ4vCCdS9uMPeOU0FPUjX?=
 =?us-ascii?Q?waq0aYk2HS45dYQYdw6iMOn/zVEOHcQ7RWeKT/41AtazOv0u4EAp3ci/gQHa?=
 =?us-ascii?Q?KNdamBi6EG1jk/hKm+xWzL+SMzocCNAGl5PpWG2XlbHV6TKHeRhUJmYOjcpl?=
 =?us-ascii?Q?4zJ6fjr9aj4syB6o+sAY948MXkFyBwGEExanTaOF7YZJgxX9u2+mJG3Wq86h?=
 =?us-ascii?Q?iWBZSVN0c98LuRkwyBfZYMTZIlOLfrHkq7o1jyeHa+aK5WwX2fsuyGxrSzIT?=
 =?us-ascii?Q?Cb3+Ed45rnI/037XJg+yuGOMk5GsjqGYwUAx5DiK1SurK9Kp81SRxv3JFlAU?=
 =?us-ascii?Q?0HCjXLpfagOIs0HY/LZYTaJUl/Se0TIsCcy6JXyFiAm0gp1cadpLrdKv3Gli?=
 =?us-ascii?Q?DLKpCcL9Sw7CgdZlEuR0OoQPPPGP7W4ZhyHveYH9nODrJmu4jLLLCAE7hLiH?=
 =?us-ascii?Q?VbVUYHXfTqv+HVLGA/i2JaiX+ZPGtGbrT4Iu6hHpgcSIE5ibaXtmU0e/LzDZ?=
 =?us-ascii?Q?PaIQlZLK9Ni4j1mfHP+WB3IzHrPJB+dlujWx8pD/qehx5HkQHsyoE2YrX8BM?=
 =?us-ascii?Q?429+zmnD3W4fPRiWx2U+Pz2KO4/gvqADluf+rWmPLBZJv7Os/e7NEypFpEKx?=
 =?us-ascii?Q?oeAJgJlej3pr0PjZiPGEEPaUGgykkcknrMNHc+JeBv2w+gWRGFHace1wlbEz?=
 =?us-ascii?Q?eGbE/ULDcv+ykf5UZsdrM+ogvOjs/7qxSE7KBL6KbzSMX5Q0yeEEwX55FtCh?=
 =?us-ascii?Q?u46uD7IXu+SEJFn/w5FSJi6iee7HJp8L1MOOw+WHyRj6xGLklX6NCv0mMBgE?=
 =?us-ascii?Q?/KNJdzTAamfn/hJqP5PW2PFjiwgl3zC5VqT0CquFfwfp+1OKIXHm0W9qSUuX?=
 =?us-ascii?Q?x0ShN2AiuNI++iQ5fs1OZOftSjWH2SvyU6zKXeJ2oy8SHylohYtcXjZ2IP5c?=
 =?us-ascii?Q?4aS7EysprFlo01In4W/IehBy4pzHbWb9Juq12IaIeVuD4YY5eUEnKGuMdxYO?=
 =?us-ascii?Q?kLvv6M+eJqhMHDs/fShcD6XKrF8kpkcAieBrBiAKlpXRjXNj3jrIP+F+XUDh?=
 =?us-ascii?Q?sxb9HvCyNjlYqNGE3HNriNG30YuyTue5RSdZAg/BUJiihG7XonuRU9b2pGlV?=
 =?us-ascii?Q?aCtoEmKdX/TXJ9/YvpKih3pf4fi07xhdJqbYJbsNs91jbSP0hlsCuZumYgYJ?=
 =?us-ascii?Q?af+VvCLFNTQEFrBKbW9/GNXrywROzWAIc6HrAfWEjkB8YtNYE14rvjE9YhbB?=
 =?us-ascii?Q?vhlfliNSVwWxiccsVD9taiFQ7yl5PdxuWWIligLegHKufXKsIAMn8IsJPM39?=
 =?us-ascii?Q?j0ZBSN0xp2ec8z/kv/mPmJRmfPAKqSJxQyeqj+CwdxhvScLMGI6C06x5eoi1?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50265bce-e5f4-4ab8-6a41-08dd77677df6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:07:33.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPDR1mGSIDCo8ky4rioxVYWu0j6zLX+1gbIG75t+WYqSHZXZdcMG2UVE/Ig81iRNkNnCgyYtNDYCFajY2NQ0xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

sorry for late.

On Mon, Mar 31, 2025 at 01:38:18PM +0200, Mateusz Guzik wrote:
> Can you guys please bench the following, 

do you mean you want some performance comparison between with and without below
change?

any benchmark you are interested? we only support some micro benchmark with
limited coverage.

is it possible to push below change to a branch that we can access? if so, the
change could be merged into our so-called hourly kernel, which could have bigger
coverage. otherwise, we need to use on-demand performance tests, which only
cover some tests on part of our machine pool. [1]

> at least on one CPU *with*
> FSRM and one without?

do you mean Fast Short REP MOVSB (FSRM) feature?
if so, this is supported starting with Intel's Ice Lake. do you mean you want
run same tests on machines with and without FSRM to see below patch's impact?

thanks


[1]
perf-fs:
  lkp-icl-2sp8:
    - stress-ng-1hdd-ext4.yaml
  lkp-icl-2sp6:
    - filebench-part1-ext4.yaml
    - sysbench-fileio.yaml
  lkp-csl-2sp3:
    - blogbench-1ssd.yaml
  lkp-gnr-4sp1:
    - blogbench-1ssd.yaml
    - stress-ng-1ssd-ext4.yaml
  lkp-skl-fpga01:
    - will-it-scale-fs-part1.yaml
  lkp-cpl-4sp2:
    - will-it-scale-fs-part2.yaml
    - will-it-scale-fs-part3.yaml
  lkp-icl-2sp7:
    - will-it-scale-fs-part4.1.yaml
  lkp-spr-2sp4:
    - will-it-scale-fs-part4.2.yaml

perf-net:
  lkp-icl-2sp2:
    - netperf.yaml
  lkp-icl-2sp8:
    - stress-ng-network.yaml

perf-scheduler:
  lkp-spr-r02:
    - stress-ng-scheduler.yaml
  lkp-cpl-4sp2:
    - hackbench.yaml
  lkp-icl-2sp6:
    - schbench.yaml

perf-mm:
  lkp-csl-2sp3:
    - vm-scalability.yaml

perf-other:
  lkp-icl-2sp9:
    - unixbench.yaml
  lkp-spr-2sp4:
    - will-it-scale-fpu-test.yaml
  lkp-icl-2sp7:
    - stress-ng-cpu-cache.yaml
  lkp-skl-fpga01:
    - will-it-scale-part1.yaml
  lkp-ivb-2ep2:
    - reaim.yaml


> 
> there may be whitespace damage below, should be ez to apply by hand in
> an editor though:
> 
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 0fc7e8fd1a2e..a6f3ef7a67cf 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -181,6 +181,9 @@ else
>          KBUILD_RUSTFLAGS += -Cno-redzone=y
>          KBUILD_RUSTFLAGS += -Ccode-model=kernel
> 
> +       KBUILD_CFLAGS +=
> -mmemcpy-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
> +       KBUILD_CFLAGS +=
> -mmemset-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
> +
>          percpu_seg := gs
>  endif
> 
> -- 
> Mateusz Guzik <mjguzik gmail.com>
