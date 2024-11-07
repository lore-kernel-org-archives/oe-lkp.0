Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B7193064
	for <oe-lkp@lists.linux.dev>; Thu,  7 Nov 2024 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730960969; cv=fail; b=g3Vlu62MzjLUdVhNtqSlXiawEV0UrV+GaWKH6d7ObUqsoGCA9IATO8d3HbY+qPdRFqXrv7EtDpN6pSaEwlCbRpqqIKKUCXFJOrmPCSx8C/sLsw6HgcCf6to8KFpEZtFx2/TM2sQr/gi/rUcNWWsXu9Fg4dxP/6vThmVT7seB+mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730960969; c=relaxed/simple;
	bh=Mejy+ov0E1C8jFpaDarAgJmVjeweKoZUmFeDUf4NSmE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lZvxJgoPv/Fu0+gX02YKoZD8by+lxQxQvUgMb7DOKdz1V/DQ0Xc51ovA/5dBerG4hbr0fkxzcI2ZIAYLPqaZi0XteJbvlDNcwrlXeqpJlPdB+bb/WkcRFHrywGForaIlfhohnWCPCDfgD1ROLBOQTbuKocUP1NaaMWo4vLQQKX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqCg7VgU; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqCg7VgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730960967; x=1762496967;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Mejy+ov0E1C8jFpaDarAgJmVjeweKoZUmFeDUf4NSmE=;
  b=PqCg7VgUJ8oHoSBXhTAiw98g5YTxMjpcuyrGsHsqNmRt8B8AnvTUiy39
   1EYGnJZTc4pxF7YQ1kUz17rnP20nVpEY707uleoEsskXQUc+vKVORuPO0
   c3rkKpIpNwBVqH5TyfIVuPlWUEKcwxeEsCepHMA9Rpf/HccyNvUdrrNzA
   JrKhTBhBHI6CRhDYyOJfOZdIKwNd5ocl9GE9ffUqusVvHD/+J0lri6R+j
   Uk6ekc/N2LPn7dpiyueWx6XBxMT3XKWbrUyuSrdAIFuz2J7itBeuHemJU
   HMtNYq+Chz1xom7qmUmZwWYhTwnpLeznZyD/lAFcc7ZJw1wi7ZMBIzppE
   A==;
X-CSE-ConnectionGUID: xGwbWDE4Q4SV8LS7xkeSKQ==
X-CSE-MsgGUID: cJa/c+QvSLOUcB/68kZKuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34711933"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="34711933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 22:28:38 -0800
X-CSE-ConnectionGUID: pk4A6nS/TDapLAgcPkjo6w==
X-CSE-MsgGUID: NY+zrLjgTW+YxRyI8ZpUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="115760592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 22:28:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 22:28:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 22:28:37 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 22:28:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGLj4xSNTHoZ4fuj1ruSfXouTftfYw3yO/caf7vYQdxWI3JQXq+p1HFs/bWGNZSjBHFelzvbwy3Zgup+IzTEL1r3JhQg4IWkaoIh8cbafWPK1VsKTQGBjAU8XL9VG1dyb/XjsaDVUYtOxYu1FRNoF7dgqBRX9zXU54/BHwjhjK085Yidf44JooDRmZQjmkYIy8/xb/RCuSdXkyVZbaCn/TiX8V0ssnaz4vRWBbI298HFPI7kCu9TiqutqkpeAIvrc8olr9Pku0mjb01rnx/17vsnUDM8R68VSJGWZvnqW/WyCBl6NABf3v4lq3FkuAY9mNrjyGEc/XZvbhBGd6kNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwTKGN/X1pGQcedowYf1GflzIK1ZPzb3kNLv0cV7gig=;
 b=BJl5L0wALtvp19QRc/igHdyo1GpQnr0WCROppi/jXoxFmwZXp87zGyOphrTQ0NDxvGsBWtUk0aVkcOJmMK5P828Ymy8WICDP9D1S5VcgusFPXFST/M5CvmvVc73EXv07jtgFXiNrQW4KtPGDyPuS54uQIV5HfwDcFK5CSq5iJEQdCoubdlJKIEDqx4Ft5yCRv5iIDtZUrfKBsnctsH4ldbJjl0Oyw7BiLr3wU45A0GAaE4YBXBOXpA9kH/b0DWTKM6AnWwR9fhes/a7f7gQmdhbjI4QSs7kIxIB73zhxR4RzyI3iSDgyaZJsGnY90S7zh0hn0OwevMJr4g28Exg/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.33; Thu, 7 Nov
 2024 06:28:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 06:28:35 +0000
Date: Thu, 7 Nov 2024 14:28:27 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Frederic Weisbecker
	<frederic@kernel.org>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [paulmckrcu:dev.2024.11.01a] [rcutorture] 622baf5d79:
 WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_one_extend_check[rcutorture]
Message-ID: <ZyxeC9WVcbdTAu0x@xsang-OptiPlex-9020>
References: <202411051012.f9224879-lkp@intel.com>
 <1092459d-48e2-4839-a84d-c38d96fa2a36@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1092459d-48e2-4839-a84d-c38d96fa2a36@paulmck-laptop>
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad8ddf9-e336-4ad4-4af5-08dcfef56892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?07vygi+0lRrpYzYoEF7j5p21t5XGKeSjYDF36J/k7a2VbFkFZs2HXVJmxtxP?=
 =?us-ascii?Q?HxcwjYnWg/8/tiw6ZMhddEO4tgYac5Na75Yf88lCGiZpFzSyzZmHrZiOThgI?=
 =?us-ascii?Q?4vyU0XhOZdCB+pOfTvHcgqEbbb4Hz86StYIkLsForPiMqIqyEG/ad+C5vvto?=
 =?us-ascii?Q?xCXZjyWEOzxbHbhx1CZiQh6510NZkkGa+lOkSm4oRSkfw9JX2rg1EybTK+3z?=
 =?us-ascii?Q?EFzozxcRHXH+ca7Kw1rXz66aTM+NsO51GWedKB5hIMNDuAb+9zssgZmhY/Xi?=
 =?us-ascii?Q?hWl30IqLeoHdsezSWIEJ45aZ+kxZI0botLEUnA6Fjdj9SOE2pM7BsnzD2bdV?=
 =?us-ascii?Q?ZmCvaPKI6bS95B+hDX2cIqQDeA1RA9bSyWvGL6b2CtrmVutJsLcoS9DfsJG5?=
 =?us-ascii?Q?/8Jc2Y2KkMLp6AiRdgdK5NAzzrYL43v0fU/Jz8M29TVrfF6XB+jd0AEf8Lgp?=
 =?us-ascii?Q?jz7SmfUzgivBydZBKUTTG9Ii4d92wmRY5u3fP3r6nTCJbHxx/P5/p9CKmJbI?=
 =?us-ascii?Q?0KakoPOOykvsyQFN01VU3IREhimsuxb1kqCmivrLNim1EB7Fc0Eeqg2M4fzz?=
 =?us-ascii?Q?Z4y8RJy2QvXel04QNcH2+yMFzzAjWfxg8NWXfneJATsqR3tVLsvDzJPsjk3q?=
 =?us-ascii?Q?2HVyLdKFspHjYlaIrR3MsVYhVIRvcqXTnEsyLCj6J5AN+i4Xra5hgwXGtyf2?=
 =?us-ascii?Q?DnCmVOWp/pMgXZVoyRkwaMorEArYssGVXuKSVcFGk4mb0Z3NS5K8OxHKGU0H?=
 =?us-ascii?Q?YsG7Z3TPUt+M93i5jigQZEBEofGurMDYcOyf+Bj4Rx3dLIGBbyHWZD6TJg9U?=
 =?us-ascii?Q?P9RQC6PMsSzxWh1KXGbwvUgyaR5/s+fC0fcgOgLMFbyDSUrGLNcxYZMuczLB?=
 =?us-ascii?Q?MxGWIj//HDv65nEJMUDBphGxnezRnIduUoh2dj/WZrcpyE/c/Nzi05bpSKwd?=
 =?us-ascii?Q?DJDNErgimR+uKUkFsqL9PraaW7wW/O2KZ8seMTb/L6s1y12IERb15FtRvuH1?=
 =?us-ascii?Q?ZXqdwt8GNSUfAw4LCHCzkwZqDsveBZ25j6QMO1aFTdDBmpO6byzdvDwxBmDT?=
 =?us-ascii?Q?DFBI5ufntH27E9yat2XX3lXKhA6nEeuOkb8uP12+FFbQMZVjYLlNepOQ1eFg?=
 =?us-ascii?Q?HCDKiwvFMe+yNijWsaIGwZFSeb7Q5qFOqlVYasKTk9fsKdMG0uAcbbCJaEzy?=
 =?us-ascii?Q?liGso3teAyQEs0+Ekk7aEFER0ayzgvvycvY5qJUM4a5XM5lyidFhR5ctDfDF?=
 =?us-ascii?Q?CNyPvrlT48BwHdvS+HiK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3vjFKLuHkhe2ksmfSSgoDKX+MKmxlbXJ3Uv7d2QYcWvoS8HctGpqCpgBwXRK?=
 =?us-ascii?Q?++O7TMaEKcQjE2X4ZrXu+24nPe4DDgzYYlhXasUsryycr3/z5D/WV1uQO5MK?=
 =?us-ascii?Q?6KJ4yKzhVlWkF/nhtfN+zNbxNvsLxp2yh57mn1Pbxj5GcmKLr6H6UChdTvtM?=
 =?us-ascii?Q?eWyzVPiJP4I8FvcTqh1BbgFkEWT2EW1UD4ykYVJXvATe98lVg0n6WlolJKoP?=
 =?us-ascii?Q?gj0cgjFKnBiDq/xRQtdZT6r0EncNUnGUz7zfd4POTV1wi5OumFEvXm1HoL40?=
 =?us-ascii?Q?jcP9ZhTM6H76RWvHbQ409hFIFyCV2Jqx0R8ruAoH84O9fpqxGxasqX/uzIL9?=
 =?us-ascii?Q?w8uGiG66hfU3ZstsjyakdOXgg90tzqMS6urSip7tuDGvi65pdpG98jiG/Nai?=
 =?us-ascii?Q?Cs4mMmS2CLhW5WTiv4CxGSk/xHrUjKfDYEOTXwmoyd/OOqcZ9vlcA9S6B/f9?=
 =?us-ascii?Q?H65u3qZF8zuleGbC6I9AVdJuIU6wxHe+stCZT1jiO/38xtb/PiVQotK1tpjp?=
 =?us-ascii?Q?i+lcMBCGsh+T5vA2nxvxY3iXV3wlJ7PJt3ZLO4VEmXAYQ3im+r+noetm0rt7?=
 =?us-ascii?Q?itwWLAhxRFGOEB/U0ps/0JsW9YMk7rVDxpNZxNSlwkxfAVD0QJU15SwXEBu2?=
 =?us-ascii?Q?ony0zIS5fSDz9186y1Kenf/aiodDujNmPRlrhk1j/npt42qnXeEJun1gXhye?=
 =?us-ascii?Q?a5RWIYea9fKRretAL+UMC+tmhHLKA3S2pIZTNDe9dHGkYPwp/nEhnqvWXNGX?=
 =?us-ascii?Q?d9OLX5Yylu61AtGis4gDLM9wEGV8lNs47kLotnnoPwCiL6AVpwBzmHwmHCJc?=
 =?us-ascii?Q?ajGI+fGtX86G46sohhCkZndV0qMAAlXxTHxbUVRh2pkZSp3oeRp58eW/BlUj?=
 =?us-ascii?Q?mnoZSOnSwLBQ9c8+IWgXIKnEP349jCrVAGKUTLtKwzudwh1thyouI+0OGSEB?=
 =?us-ascii?Q?dctFxp5jrTGbAHauq079IU6OhzcMMN0euQb19o047qOsjkUDXN6kJ9rEOHak?=
 =?us-ascii?Q?Ukbio6T3wo21RC30vhrS4WCJNAVJvWfBmSi6Bp17t85A7CJvGoCkAeT1X+KF?=
 =?us-ascii?Q?gk0EfsSTeP2JektlIIk88Kk5diylqLS6LVVpW5vtqmV7DxZDLp6hxtXlIrKO?=
 =?us-ascii?Q?JtlU6C+f7BynwulZLHWciuq1yHzYD62lt6yQOMCA/53WkjneZ3NGDqL9dd0Z?=
 =?us-ascii?Q?DPJG2lnWT3l7tCicjyHWlawn6PT/mMjh1WkSGUUhLGxFwN67stzJRejImOjj?=
 =?us-ascii?Q?QjAV6kGzyewmyLKB86kbP3XHeZ5SwTG38Ph9kb9gRA6vMnUDKzJ31v6KKbXF?=
 =?us-ascii?Q?jwRH4JG3NKQCLXixmczDn11RCSkSBJs7J+tRnkD6EuC+YBMLyU2p340iNEyM?=
 =?us-ascii?Q?lkaNN9Cz0/FGm2tU8+E0uGW+Xdxc6TWHk2JUrNWdZK9JBpvVC187U3eDqeo8?=
 =?us-ascii?Q?Se0qvAhY7bS2PW9Q1CuwVNhTGxzDEsntNJre0VvGUV987AjrwCbMT+4Uz/ey?=
 =?us-ascii?Q?PVq56GfoB5CdMFlQyqOehyAnJTGPr7GzBy4j4JnusDsAFs8m0BpGyV9DoYpy?=
 =?us-ascii?Q?A0O0FzbXKFkSafbUuyrei5DzIKQ2H+anb+2uSrT+9fDyIP+pS3zPKxik0Du9?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad8ddf9-e336-4ad4-4af5-08dcfef56892
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 06:28:35.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Tcq2JBbLtSdrOUcMxTjz7myJVDUWgK+TxRxibMC7OT9D3YR9F2YBq59oZYX/M7BRFEyPRaSGlP1fQ1/r3a5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
X-OriginatorOrg: intel.com

hi, Paul,

On Wed, Nov 06, 2024 at 12:07:37PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 05, 2024 at 01:00:53PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_one_extend_check[rcutorture]" on:
> > 
> > commit: 622baf5d79169496973d50fc43636469e6af02b7 ("rcutorture: Make rcutorture_one_extend() check reader state")
> > https://github.com/paulmckrcu/linux dev.2024.11.01a
> 
> This is an old commit that failed to handle any torture_type other than
> "rcu", including the "srcu" that you tested with.  It has since been
> replaced by a series of newer commits fixing this and other bugs, with
> the current version here:
> 
> c815d319a933 ("rcutorture: Make rcutorture_one_extend() check reader state")
> 
> Does this one work for you?

yes, this one works. issue gone when we run same test case up to 20 times.

d5e74d8e46e8e45c 622baf5d79169496973d50fc436 c815d319a9331530032be3df69c
---------------- --------------------------- ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
           :6          100%           6:6            0%            :20    dmesg.EIP:rcutorture_one_extend_check
           :6          100%           6:6            0%            :20    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_one_extend_check[rcutorture]

thanks!

> 
> Either way, thank you for your testing efforts!
> 
> 							Thanx, Paul
> 
