Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640E17D8A6
	for <oe-lkp@lists.linux.dev>; Thu, 15 Aug 2024 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708361; cv=fail; b=RdUMOmU0xpbB2FxovBLxUhjrPLmJ8o0EnG33z6RViPjVjXJpE12gumCMnJxHRZMN7bwbwgJwus+GeVGRFnBITde4Kbzh+ljg40XIq+TQpscMBxXxWITy+rOqOi+EiKxNdYVkxUilzsSY9YB7fvXBcijIYA6jzCSqX1VeqmQj7/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708361; c=relaxed/simple;
	bh=ExduXI58fqpR3xUevVAyuXbHHpQBeFF9p3z8OLnP8Zg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fFspKoCvadloUcvbvzvUG+kZKsoDy/90D3BDwrJYnl6DKmj7P6XFQ3yTcOZ+k5zuMi7uCUg6WZGN3COlhrvZP0SdA5sLDr+Q4kWa6f43Pe/MiIun6YS3pxe9bzPg69anHbNtzcAS+T/XvahyriFJ1Y9NvozCmHCiFZQ/Cx2bm1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dcwn9K6n; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dcwn9K6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723708360; x=1755244360;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ExduXI58fqpR3xUevVAyuXbHHpQBeFF9p3z8OLnP8Zg=;
  b=Dcwn9K6nGK/et5Me1Fk4BAxzBR28lM9Eanucs+jvk+2I6mjMjhw2TOof
   s5AmTaK596+6YLn7sF1HfC7GI0ALLYl6Eu4MKd20T9LZb+QRIlnnnEaHE
   +2ZPm683vdIktOzDwWSPQak1MVfAMyr5bbPdtocD+Hq7AVCUwpvumNqzW
   PT1WYIKViZBf/N3l6veZVnppJoHJnqu9Bdv30vrRQ6JxPJ/XCB2hwmJcD
   dkWi+kVcuu5FpTazl07QPhxfyLqhh/rsp6zCdc+P8ncfvLOohnbnGSC1D
   iIPUmYpR0fR/Wm22pvMqdeA1O4sdM6MWKIM2PfhgRDusxZy+8EHlmSmel
   w==;
X-CSE-ConnectionGUID: 9C5oCnKUS6uZ/fMkzKjXpQ==
X-CSE-MsgGUID: 6i0NXU5iSJKLFU8rRBsnLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22105752"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="22105752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 00:52:39 -0700
X-CSE-ConnectionGUID: rxiuCR5gQSmJohASB9tJzA==
X-CSE-MsgGUID: QzUdtMm5SQWViHNb6uTijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="59132216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Aug 2024 00:52:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 00:52:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 00:52:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 00:52:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 00:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wws4BatlnphIfHbRmVh47UCba/Qe+S41CQ/BVBYwvRPDfcXKkB+Oe7TCPz7yKG7oXzMY0XXS6q9uVI6eCereU06KfLCmSpzJCMVGTU9eLxTq0rKRy190HvJU1W/27GQ0lQwi30RkSnx0ibh+QOcYaedkhM7+nfzbtQv21TRh3niajdYOZD3yYZMJOmP8sAM74xgbpHoS4JUaD4XPI7aQ7hfmEYqENyuOWWoknv7JZfnpvBWjEw6zKn+bg4DPOZv4Zh2ZwQjNViktcjjWc1f2euQLDTjlYypIWHsw3tNj68xjpVC1Hvcw7PsBT6Io10ShsiPebRVbHRiB9rW8FUKcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSVpe0KzAj1O/wcLHbmcz83L83b/ImhghgjR4MdBKmU=;
 b=k4xdIZFlextd1ywneaFDNjd47ZTDRhtD9wS3r8kXh3rNg53NmTIJy8CLnNFSZcVlbeEqGBSrpir6eN3h35wB8mO7grfEwoJfci76oMQ+nS2ETlExHc2/Qu87h6D6M7oVsmBHfQKyGIIiKNe1rJgTLxDQ00g9AJxROJIqCoe+b7EiAqM0XJSF3mqppghCeNdSMqqv44sz3adjLkOXyurF1tBFrh3x3ozKC7bWp7eAfkc8srTdHUZYNxRa32AgzYIMcAyxOT6NzapJa8ilw3qhBKtk+GhsmKTSGTjsfjuG+8vcZZm9ougDlJgMYnFTTGSW0F3raM7SjiGIZCsP483tOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 07:52:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 07:52:35 +0000
Date: Thu, 15 Aug 2024 15:52:25 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, kbuild test robot <lkp@intel.com>, Mateusz Guzik
	<mjguzik@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Mel Gorman
	<mgorman@suse.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Lorenzo
 Stoakes" <lstoakes@gmail.com>, <pedro.falcato@gmail.com>,
	<oliver.sang@intel.com>
Subject: Re: Need your help to check perf of a patch on different archs
Message-ID: <Zr2zuS5BLeJQB20e@xsang-OptiPlex-9020>
References: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bec741b-bb89-4f0e-8745-08dcbcff39e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Ks2PjforBqrqwEF47qEoxH2DxyDLRC2CUZMztzPZmjo7EVF5H2wKVzkSaty?=
 =?us-ascii?Q?9ErRww3eEYSNkGvcHz+cZbJWVNE3oj7pBb8LLWrleKlWk/hWz02SrypiNCEV?=
 =?us-ascii?Q?TXHLYHKWz7N6jXiiX2K8/9ZqAO9g4G5ExyK8a75D4SpXc6LiI5fTqJ7yh0Sh?=
 =?us-ascii?Q?e9wfqCJaIXtHc2eGQagnZ5eiYYhjlHzULWlZlfnf/+hO6qjKAN9+y5Jw/MS4?=
 =?us-ascii?Q?yF9BvG4Ap+c9VPJAiBHlR1x8ilpB+cBeAu8Pu1C0BRBB6hL3AlMlLjNrkgWe?=
 =?us-ascii?Q?eJ4O7RiDpWTR3Em63+XXCD/DxyC2KDHRKsuHWo4yC8AETmi0JdaSBksB4kSE?=
 =?us-ascii?Q?sKUgr+CiRYvduQQIMvCkZxbMiLpaURG/Djy7rCOsQifTEggDFTph+NUW/PEH?=
 =?us-ascii?Q?7FLsLoB+nvMzJY5wqX+/uztKktpgLH8w4chbb3QSWz6JoIJfF9g9sb4iP5JE?=
 =?us-ascii?Q?lgtFT0l4rlfm6Q6qUXCvtMHWmw//UNle8KHLBuNvSA/3520YxBFGK26nWbZU?=
 =?us-ascii?Q?dBK3jjK9ESIPz0PEnPIMuLBzaQMUQYlfHmfUdQ/bBDvydsYtZ37FqvXgJ+tr?=
 =?us-ascii?Q?xmmnZASsAJbng0gugYPh0p1Ra4Z1rwlMDLK/mmiT09+4WWltldCbOoHiRlt9?=
 =?us-ascii?Q?5ijqOFmxV2g2UMcy/8rqV1quar5yej9Qi7+ItNPih0JOJutLHFb27XPe8Cu7?=
 =?us-ascii?Q?852yvm/EIoKHMGW0+uBZOw0hfRRaV2IzuPPfMcChAjLMb9z1LHHH27e071tV?=
 =?us-ascii?Q?pYntZfzx4t+KKtGe0oeHkgJBeq7l4ZQTGyxQ7R7UpVCzqeQmHYCy8vJ6PttD?=
 =?us-ascii?Q?34Mbltt9/bAhh+bEuiygXJveDC2jewiDBnjZcHS+e1CfgNMz2lbSAX4OdwIC?=
 =?us-ascii?Q?RV6KYFo6DFtSSLWb3iZSL+SequHVIOZkeY5kTlwNF1VDnSn0zIh7vJrQ7JGh?=
 =?us-ascii?Q?jtak+7fPfBTw2NDWjw22XXVxxfdiUqwj60iIwx+RgrxAEeyI+3SCSwq/skMm?=
 =?us-ascii?Q?pZ47ZcKSc7rAvjNsentiYNoyZ1kBGm1r3O6xyiIZ9JKG6qFPtoWAchQL2xQE?=
 =?us-ascii?Q?TlCpTNq3N9M8DqgPn9oHTDQv+hU/k88XBT1Y2mDRSF1A4k+y3Cov+Fb9K5oC?=
 =?us-ascii?Q?O806bkbOr3auNVA1ZU4zrKF5mu5/zieT7ozwTx/RxRt/V5I9jf5VEyqaiBQE?=
 =?us-ascii?Q?z9Ed1XDqljQwFrbCcK+Kx037++HckCBFHsEMNbiqC9CTIBmxZj7D4c8TB5PJ?=
 =?us-ascii?Q?gEzQkdxNA5WFVu0kWobsIOz6OVDLfCyKmwFDJ8EzbFyqzK8A+7FUbx+l3soW?=
 =?us-ascii?Q?22M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N6cjAq0yNSZsBx10FDTmVkS5F1hmqAIVUculTRKRvO0H6nOVHGuAdlR8dgMI?=
 =?us-ascii?Q?o95eUkY0RYJ2w4XFRp1YkzFbOQyAA3rdz/ktnTIDH+L/UUcMAzlWdcP+DkLu?=
 =?us-ascii?Q?+GIhT+IVyBprIzdjAjoWxjOEVj5wAJafsIEGJc0FSDPrRwdU4Wg/bTjRtX4Z?=
 =?us-ascii?Q?84caZ/hOmqzhZ4wgFRC7fDgqoEKreqd77dr8JfXdQXJekkfVzv8T/RRi4Ijr?=
 =?us-ascii?Q?JB3EWCbLCmACvqq0gJdurvin0YM9lfQ+9V+SvzeOB2AfxGnh9btMfp2QYXDX?=
 =?us-ascii?Q?L17NjkFgRAMhOkGPMehN6meEgFXjRbtNhGCXQEg2aXrQGaXCWmUvCUlVGUgQ?=
 =?us-ascii?Q?aoGyKpuelvxfyp9vxdsAXcq9CHFk5cg5q92EMh05BMDz0Mx9Xp6B9F10LgYu?=
 =?us-ascii?Q?hbTiGyiKSmQUb72DWlyHSsIha8fwVXpYsW0U5/B5jQtaCH4gTW7RDz3cyrIw?=
 =?us-ascii?Q?O9HilARHx0fRmDIy06HSiZcxWFb5HMNmt/CSeLiqy4+XKwdHm7JASFouApJW?=
 =?us-ascii?Q?l3XeMxWdNcyqq7xccXLgWsgn3KDFNgg3WlvkNXNoExEL3ep+dFEEtzRrXkQ4?=
 =?us-ascii?Q?Fa1zNwoXJzdxJSFd2ZLIZ9zLYMpKdx2yPRAmrWAtmC4Oaox5R/9wgNzH7VTs?=
 =?us-ascii?Q?CbOkcDzQk2c3JTphUA2uPauQz4m2rTW651wImhdz4SRPTi9LoFK+Al4qJrIa?=
 =?us-ascii?Q?712t02Fl44iAp2xZmDEFbXE5iAAwRvwht1OdGaibt0Ui6kHo+pMhDzbIPWVC?=
 =?us-ascii?Q?1N1iWfl0KtK7FSMvbcrXhOVzANIfr5HXQb5WPUK9ks/ZFJendBicGOAoboO9?=
 =?us-ascii?Q?25I/0QHpwhxs1tBc9sFmcH9iJV4Ks/vkMtmJ8QHAzhpcqsX9RUuHIK/Y7108?=
 =?us-ascii?Q?Hz9lUxG/i/I4ACK39D7iI/OwUm5qKifhDGmQWex128PCxg+sBeEedu0tOvo8?=
 =?us-ascii?Q?iAUkBMWmkCd5p8SYHAWpOLRAG1T2oqslu4i9oay22upw2dFiKmpv17nDQQ7Y?=
 =?us-ascii?Q?hpneXIfa7jPRzD3bnhBpVya+Z3WvI6nMUAsTURjhEBizVR0faYp+4S9wX4FB?=
 =?us-ascii?Q?eBMIR6P87f7YUxDB2c9k5wQWmG35xQqdbXEwSqxsQviglX/lMZViMlFxpVAX?=
 =?us-ascii?Q?hUmUEzh8TiSa0R/IcN30XTly8uV3sb4IIT5TEI9KOzlivjrMvGCw3mfYDcHe?=
 =?us-ascii?Q?0uhmJ/VClUk0o8YWau0LPqyBAeQ6OYcoPULpO75BdxKJtzwXMeabcZwP8alo?=
 =?us-ascii?Q?82rzPBgky3kcRVZT7jRM8Uc3920BGMxCfo88/3tyHkAPfNce4hr6MScz7LvU?=
 =?us-ascii?Q?xiDKA1p5rP3wtHbrO0KZyos47pC/cygxG3CGyqUEFoxeAlT6IavZE9llyMw5?=
 =?us-ascii?Q?W7994k3Blm6sAHWJ76j6EfJERC+gNhybavsjgypL8NSHBQKAkDt+FOfGwZ8z?=
 =?us-ascii?Q?4XwA0NF+S94Ri7NZ1bLfWLIUib3YJ41IjYdjUhwZ11lbefon5UgE8p2vLfA2?=
 =?us-ascii?Q?Mi+wBOtr92kkqOn8xpGsCwvnbYAsXSG9ZHIOl1hr2BcAebDHC1oKRpO1pXeN?=
 =?us-ascii?Q?jhQuCHvEm5oRGm3LJ/4bIBlpX7YaezMUa2bcOx9IhveZlfUN33N/S1EoROb0?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bec741b-bb89-4f0e-8745-08dcbcff39e1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 07:52:35.4375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnArHSXAsq7Dfn5x5c/h3azVWHSV3wjH4d4YpOpvMSQuJx3/BOTQzDxAyIX9bbPK64aFx4A/vhI2RNGRTEeRsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
X-OriginatorOrg: intel.com

hi, Suren Baghdasaryan,

On Wed, Aug 14, 2024 at 12:53:52PM -0700, Suren Baghdasaryan wrote:
> Hi Oliver and LKP folks,
> In the thread [1] Mateusz and I were investigating performance
> regression caused by adjacent cacheline prefetching when we try to
> move vm_lock into vm_area_struct. Mateusz thinks that my Broadwell
> machine is the reason this regression is so pronounced and other
> microarchitectures would not suffer as much. Would it be possible to
> use your infrastructure to check that claim?
> In technical terms what I need is to get results of PFT (pagefault
> test) benchmark from mmtests suite [2] with and w/o the patch from [1]
> from different microarchitectures. If your infra is not setup to run
> PFT then any test that measures pagefault path performance would do.
> Please let me know if you can help me collect this data and if you
> need additional information.
> Thanks,
> Suren.
> 
> [1] https://lore.kernel.org/all/20240808185949.1094891-1-mjguzik@gmail.com/

what's the base? I tried to apply it upon latest mainline.
1fb918967b56d Merge tag 'for-6.11-rc3-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux

but fail

> [2] https://github.com/gormanm/mmtests

we don't have a test for this repo, but we noticed
https://github.com/gormanm/mmtests/tree/master/shellpack_src/src/pft
points to https://github.com/gormanm/pft

we have a test named as 'pft' just use this https://github.com/gormanm/pft
is it ok to use it directly for your purpose?

thanks
