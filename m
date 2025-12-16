Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE772E8B67
	for <oe-lkp@lists.linux.dev>; Tue, 16 Dec 2025 02:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852961; cv=fail; b=rZegOGG60s4Gz+LSdFvLPBZP+/R1aTfOLoKx7fP/hS/UHl11mJLP5Zfpu6a5OWDoUKE4oK8wQxVlQqTvm76Qpxqdn4lVKc7NdfUHLRYx6TnATCZne/DAZ+y/9DtDiD4wpDcfSQ8d8RX0GiSgkmUYhcbAknnB2AzB2QICBuWPmqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852961; c=relaxed/simple;
	bh=mEPXQX7MGngdCS1LtwYyPauc57UGNf23PUM8nD4ONYI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=crCa+QoJyBmHGjItFG+kHLz4IRNsrp+neUf/cMbT/JcEVLKib1G9o7k/ZIyGpqsBKAxUp8a8wxzsp3jp1QVxSy3tWl8XedyyRuQeSK38HVjM839c5OcIWJz+fzOjN1BzCT0BQAdEt8U1FRpc6Edxj26wPzdde7EE6rTFAGS/AYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3gNtof5; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3gNtof5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765852961; x=1797388961;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mEPXQX7MGngdCS1LtwYyPauc57UGNf23PUM8nD4ONYI=;
  b=U3gNtof5DCOyUCI0AB2rflZn2/dHlLj17IoUlvb2zvuDr+LYlqQACoET
   HzW7bpHrIKof288yMIndlQPxJbAOYl27I61obm8D2HVEpaZBAWbaHvubb
   zjLCrxKegVbmYzO+fRxOegTfVeJy+KOiN+PoTDrgyofe1DIXVLRkkPJWU
   t255R2/jET1LjgH0gmCba+bf31BxJxku2Rg4Fy4phaUDXves3uZ3k2ZeP
   SDzSrpo9L6mVHpkbusQQp3f9oP+cyAjOUV9yWMxzUtIND99hge+H13r99
   PgfmBmKVKIb0RDmA5UGfYWIcFv1lmy/rmkloZbqXD9KmYviO7sLUMXzRT
   Q==;
X-CSE-ConnectionGUID: yV9uP1JIT4uol+DhTVzriA==
X-CSE-MsgGUID: VQ0Rzfw/QSWSTj4c+8NGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85358500"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85358500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 18:42:40 -0800
X-CSE-ConnectionGUID: JxaO+yOWTKOUKQTp/3mmLw==
X-CSE-MsgGUID: MGtevxSNQVqGoPej40WTLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202291831"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 18:42:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 18:42:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 18:42:38 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 18:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kufrql+En/QP83kOll26k3tCiy5E9JIl7OGKxOkYKR6y0x1tD5PpIJ37pTlEvM4vEXZpmp+HyvufEQyoU3Ryz6k9Qm2qjgm9AAr32iazATsb/45vxfDGgq0diuAWZXqoVoEKeO9Yyokez4NX1keEG+4W2xfOKHesmSACSQrsOosxRS06+CUevtLP+PunfEPYQU5/ZqfsCxRHEtTNG/FcPsgeWITiaD69nZ/olLQfy4MDik6S9EW73xl8zosAnjSo7PdTwJZ1Euj6PbZS8uLYmLwpHFy9B5NFacJyZb7tSb5oody3oAG8vKcaC4beZZe9JKWS663P7VE2MaMnnbCGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i9R3MDPNLLodrBN0EQwdWIshwDcRvkO1NFcWRPHrak=;
 b=wmlACTSVtobVIZYfNoNoePwOZFzKKUmrOR8Vyg/h3WlInEPJZfY1kFPhuhOXgyIuK1Wml2LlzYtl/EToa7n7gzTl2MjEOODZ3m3dxmh/fNOpuc1cq6jxHlmA82+pNyZOgYJqPfsnhy1h8AbLorm1vTFEvgaEAIojz2HYvupiq5SpyBGggMb3+z25HaspSVw3ZNI72cYPjTpFVSEHLMnqxAmY51ZU/qcYiVVGRfuVbnAhdq//p+ht/OGcAIltVBgvzA0ssUgzuTddnUzDx3S0jTf7pX/A4auH3VAPvMtfqoTwVAtGKn0P/Api1eX64SfPSN4oE8ovcMvDNcs67RSnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:42:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:42:37 +0000
Date: Tue, 16 Dec 2025 10:42:27 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Fernand Sieber <sieberf@amazon.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, Ingo Molnar <mingo@kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linus:master] [sched/fair]  79104becf4:
 stress-ng.resched.ops_per_sec 44.6% regression
Message-ID: <aUDHE/SYbnKNVHMU@xsang-OptiPlex-9020>
References: <202512112111.39299a7e-lkp@intel.com>
 <20251212101244.GN3911114@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251212101244.GN3911114@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: ca906163-034a-447f-d054-08de3c4cc5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U2vvSogFS/NENHSBzjky3h0uzDVZvFY6y/loMMcY7riBuyMRKf6pbxlETZjv?=
 =?us-ascii?Q?ivhk1JJuiXg0b3Wd2OtK7N7gXitBkUpm6JYHbF9umPGXLbatxQLMFCn3k2mN?=
 =?us-ascii?Q?hfP8NC7Zfs3Cdr9193VWotpcutn8wNaLRLWYunAMpwODNGLieQoz/Ge0QMkC?=
 =?us-ascii?Q?H2peuFn2QtNSvOYYawHLMbGYJW89VPU1l3gcGGJD8ymUtr3qPYya2p0nAKvd?=
 =?us-ascii?Q?EUHfm+Es7wUPAnF6q8+Y0ZlxDyjIm0Kb5wETASB8Efdh/r3i9E5+sAuri8PT?=
 =?us-ascii?Q?GjbJTKWTMh/JzSUftP1tEsAi2oodne1lpIWEKiilXYIZiZLRIrEouwGzlIYL?=
 =?us-ascii?Q?wTxCBIe+FZlKHj7cbJxO5BSMTa4p7BNIRSgMqcdsNRMftfA/qcVSw4tz+SkI?=
 =?us-ascii?Q?penHIhR1lCscqg90LvxOI+lwrDhVxZHb+FDNzXDnvJbOzdlT8xMcOKyGkRY2?=
 =?us-ascii?Q?95v2dMW4NiT/qkZXRm4wDKQiP8uaerC34SxZwZHIK7MJiemrGeg7suS+RrPd?=
 =?us-ascii?Q?mBKQOwbn+lIDH8NHAmzTW0ovZxlWDOtbFmzrLHcRNjwXVFFABhTpbf/FDFuY?=
 =?us-ascii?Q?aF2y86hBaHcq0GoPOQvDOYQLUMWyKnN03y/IPFxioOj4O9WW0t8k2/PnlcXp?=
 =?us-ascii?Q?brrF+vqHz+3CUlmeE4NkH29fQIutKQxeTijhCCEPxv4rcoh3+JydEniOxel5?=
 =?us-ascii?Q?ujov9GU4VTgxayaBeH3VclJWbUv7VUp4DeVmNvEgRpO5CLCp2YoFYp6DS5BF?=
 =?us-ascii?Q?uwLZD7sxgAY3bp2YkRsiPjpgebh1GENRFEL2Z+SyIQoJ9+xF43sIHEdJcOh3?=
 =?us-ascii?Q?6y0DD+Ext11zk1VgOQCtqevU5+2LCcUKsGDGv9KHzvDzyuAxVh4R1hGQIHvT?=
 =?us-ascii?Q?1vt/sOeEIgSIChJv67a5B2TmJSeezfw1OFAgzYWsnAG/XOzH2Qy6S13tHsy3?=
 =?us-ascii?Q?hDy/3UUgLRc0eouxluFsYyCSsywMKQLP9NaBXtfsDKtMCitgWXJBa4OJFaLb?=
 =?us-ascii?Q?vaP/eMMcGBLIYVFgpV1qZLxxWG1jFp+zedlE4yl4Ni6dYSfYTbAEkGuV/mnN?=
 =?us-ascii?Q?QzTAT4uV5RJhV098JetpeihcSLO7EzZBw59nmH/fbMqGwOnib4pieD2coBDb?=
 =?us-ascii?Q?Pbiy+Ez8KKmK6e1WGzfO4QR6CatiI92/SV18PXRsJ3jHnKrZZg7jWhARqu3h?=
 =?us-ascii?Q?v1kCs6FkYYnjYB1op+kkrJ4VFPksSwbEE+mrlRDb+hqmlVaS8TZaqlMm2pmc?=
 =?us-ascii?Q?mFPzFeonTfr+GKGdUmZEdRKhHa5tbYIw0xw2cwr+vQDeiKrHDQPMbIf5DTlD?=
 =?us-ascii?Q?ScLVxNFWKqkhoojCIlFFZHp8i5V2Mo44LaGVvzgnwMkR9+bK24hjzZhYAxMe?=
 =?us-ascii?Q?CTYreNeTzutEwE+8elwfLH3zjw++rz8f+wnWpPs/N+oRbdZ2T9QsPuANTwSW?=
 =?us-ascii?Q?SljrYSUa5Gp8M4R3xmyVCVKzOV8Mt0fPOCoTyNar8fi2xBQbkg4t5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C7lnU1t4wOzApWl14cZyAKoK+pqs+y9OeEpNWbWwiinEHb+loln1QPq9XCRt?=
 =?us-ascii?Q?sHOpnTxqjEarH2Atp4PvxY3/dQWt/y5t0KXQfFqT36AINUn1Fc85JW+Kwr1y?=
 =?us-ascii?Q?qf/gFPaRqfBg46WPEAARtkcWTdiKnG4s2n+peOBzsIORr/615XECTNglChop?=
 =?us-ascii?Q?/mCz2+yl3pedOj2U8dWGKhzapyzsd2IR707Xv2CeRMHzow6kJYs8BYlg4eC2?=
 =?us-ascii?Q?Hf75Sw/cbQvXRT/DhFZDwOBzaLXKGwHYwZabU+kM7bowsJ3nHnorzfJOrc8D?=
 =?us-ascii?Q?heLrxUHpX04/MsbTTQZ1jlQpfoviH3N5j8CFzjleGZOuXuLnJb5799L0EGCI?=
 =?us-ascii?Q?EoSBtHDNQ9sFm0phMJB8ZLvxB87PPFYzZof/9XtsM/BcDJ6jqmocd5CubK6g?=
 =?us-ascii?Q?J6rkW3Lnvw4OpbMPfH+SIu1UEDFm8z5ec7x0t1+PaAj/WxshAXJfzF6VBls1?=
 =?us-ascii?Q?bjY7tK9snlKviWmmbgAPNe8tqBluS1MkGT/vOt8RD30rKPxwvgUyWVm/PA8r?=
 =?us-ascii?Q?/aVVwmGbs761jJdMgenWuK66XITVxgg/WrDAznrKUwuipDOZE2xCnYzazIK0?=
 =?us-ascii?Q?TpBLl4J004GBrKTH00zuzYcx6uAbXtpb3TTpTCHmOpV7OI9imsoDfpVPo3zX?=
 =?us-ascii?Q?nTVmAw+s1KofBMSybFPGqNfPGqJqH/tOr4T82aGjdlUwTdPlH9NQVuUVsbSi?=
 =?us-ascii?Q?JUC/vCcvkilU4qGHc4K0H/8QtsEi7wdXvJiaO028gx0SrecRv7H5Dn5gsvKI?=
 =?us-ascii?Q?Ldkc/HPfD1B4Y0Ic/JFQbiUpR/Q8sGnz/WYSFoFkL/628ZJYVpdnVTnOPBUr?=
 =?us-ascii?Q?5pE/EFRB7ww+J8o/oOp3R5Xsk14QmRPdff5VEjPXky9T3h1XMkWg9mzBfXij?=
 =?us-ascii?Q?cowaZN7thSB8RhDD9rIAU3TqIutHHdIZZDeP8pW2be+y85n0NhIRzuHy17YY?=
 =?us-ascii?Q?zcOtMAIRMLAqoMCqTu7AdXQXycVrUsDiNQSxO7w3FxqTgok5hMwXuFl6u9KI?=
 =?us-ascii?Q?o628P5Rm+f5Y8PhRkmmuotq9d+agBBuriXS15ZPi391xNIrBfVMWmtkwmV4n?=
 =?us-ascii?Q?RMgLsDjpTHYfB2oVTLa7EhOuFHpL02wZcdEYhL1mNBiLsYd1BdQXO8NiMb1D?=
 =?us-ascii?Q?i+YwLQnOvjAkz8QGrRdORj36NQkF3Wy/CPUhXeVxWCZuYF8NmEANfmoJLBJ4?=
 =?us-ascii?Q?OQDcvtXF7OUJr6cR3udaHfTAjI6m8KbadpyTIEk29D7S+EseHv6sYVm1g8CO?=
 =?us-ascii?Q?ofOaD1XkV/bxraVay6KqPOxTVUHnh6MlJA3wwVy6GfSuxjfmAJL+Ut33BIrp?=
 =?us-ascii?Q?LTdwcQ4b5sITwEM0Pu0/B1I4U6ViqVlPoEnsSQs9xM8PjPQ8WqsMB8YKUbXs?=
 =?us-ascii?Q?AIrDtTx60J7fyHyfqSb/Defv61kv+z55FjJQAZr32MxUlPDCo6xtn3gUE9jL?=
 =?us-ascii?Q?/76ZVN9kJtU9CQ/tZ0t9Ww+5jnEXvpiKPch1vj9REMjEHa9xMHlhf+HyXpxw?=
 =?us-ascii?Q?fSN4uH86KwjtRptZz8tmDiQdabIsYHFJj2lxQKoCFByGtzYTSqbk8HaCJRi3?=
 =?us-ascii?Q?/29aJ+lLQDAujSLgfLOcdfIG/3miLQt1rrcssJq/zyTMTJItsxsBL2vrXEAU?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca906163-034a-447f-d054-08de3c4cc5da
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:42:37.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhNQ004lUqksUGD+AMkOEf4+XVhhSlTBUNnNAHIUpepTIwTYZbGbhokmMC4KVc1ojvBXAq/3QcRZWyqNV28WcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

On Fri, Dec 12, 2025 at 11:12:44AM +0100, Peter Zijlstra wrote:
> On Thu, Dec 11, 2025 at 10:21:15PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 44.6% regression of stress-ng.resched.ops_per_sec on:
> > 
> > 
> > commit: 79104becf42baeeb4a3f2b106f954b9fc7c10a3c ("sched/fair: Forfeit vruntime on yield")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> After nearly 2 decades of telling people that using yield() is UB
> (except in the Real-Time cases where it is well defined), I'm >.< close
> to not caring about this.
> 
> IIRC this benchmark is literally something like running yield() in a
> loop, so boohoo. I'll look when there's a real workload that has a
> problem.

got it. we won't report performance impact of this commit from micro benchmark
tests again.

> 
> > [still regression on linus/master      cfd4039213e7b5a828c5b78e1b5235cac91af53d]
> > [still regression on linux-next/master 82bcd04d124a4d84580ea4a8ba6b120db5f512e7]
> 
> What's with the still? AFAIK this is the first report of this.

our report is based on bisect results. for mainline report, we do a further
check upon latest linus/master and linux-next/master. we only report when the
regression still exists there. so above 2 lines is just for information.

