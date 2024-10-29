Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1464418858E
	for <oe-lkp@lists.linux.dev>; Tue, 29 Oct 2024 05:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730179530; cv=fail; b=QnYC7tzHDTjmg/FjicT69/sr7u6f8hli604inzF64PyVBBJHM5dODLuv9mrfxLDZ6kvQqiWnNLbulqr836RF7UumVkujtV+GMaCdDK1drsn3t3e8tYbzpaVfoEMTAfd6trrM3H3g2K3y5MYgZ744GYQwzl3h9SYiMMOcMIDTUj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730179530; c=relaxed/simple;
	bh=KABq0lnVDNMWs01/8VOFIjdz2JhZA/CzGfF3pzRYBpY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HL6RZUNtPS9Gvj6C4S3nuaDa0G0sZF9NxrLfzz89Tyj93LBrhN0Sfz8dBqFHiNOhgi6asuiqb5KwM8NwPfOWU1pxN/yiz+EUoIe9FBecbMGO2JynI0oLM/Oafrb53+3Gx+30LOjrR5b+j8In0FYdyiywFHADclJYwh1k7aJDlvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwSVx0Dv; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwSVx0Dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730179527; x=1761715527;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KABq0lnVDNMWs01/8VOFIjdz2JhZA/CzGfF3pzRYBpY=;
  b=PwSVx0DvPEumh/Z5bAQBlhk54TZH3RVQWx3GqcsvjdLGErEi86IG8gXU
   s5Yla6BuvsHCJuCTJa7+SfxEdpixbe+ySk2u+Xl4P8bTLDgTQ88IDWjYi
   o39cnxBuibjwtOpSzU+EAtmoYQWkdrig0Mt9TmRrJPl3wjchjgMGWPfLH
   8YnnYaLjydvVHOwGvYhWS8q1PpL+CDhv7aOTLwMEWnFRPc60RM+ek+FHY
   0PRGdgdRw5OYhJMcuYM+aKKzgWofP60kL2CEwzlstxE+49G6GmtshM9D1
   lRw+d2okKuxnRKsQqaPOONC4hEwqByLzrFSB4X0Cz4TuxmQRvI5tDpot2
   w==;
X-CSE-ConnectionGUID: Qs4MDWfRTdW1qEfuTOM1DA==
X-CSE-MsgGUID: qLLWaJiqTyi+ihfpjiI7VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33499361"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33499361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:25:27 -0700
X-CSE-ConnectionGUID: NPkvA28/RjWF/gkuCr95RQ==
X-CSE-MsgGUID: 5G5/SrZWRGyLVpYRz8akGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86615651"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Oct 2024 22:25:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 22:25:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 22:25:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 22:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3YIkVhGhTLTRaDiiwtwYVTpIi7qsbSsxY47BDcpXDIurHTIeZbBGpTS22oT0F7oQsLq+P3dwyl8aJ1kKA2McC4RDMReB+HSwjMrswU9xuMW/NTou7A9Yf2zVMKzLxYNBEMr0aR1idsO/pqm5m83EkruhH5j7WJbTQqjQRILmjkigTL8NuuH0cPiQPwjlB7yz7Dx0YYKGNaG3vo5pcJYUqw1vlat8d8aUwhyE/zbnMTms4fObY257Mv78H8oJTkt4pibX8hKTcZTBRzgR5tntOckO29C7EDU2Zg0JXf8sH5Ybh+DQmEfZP0htRaVB/m/w12pKRE26qocOK+t+saYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kq4IGZcWsjPrnmEOqacKvlFBWf11qtHz6wDOeePR07I=;
 b=ViA4s51fH7AK7zs1AracV2R1vMad0yonIJfiXyHXbtNvBscTSiFvhKJLYZ9h0AKIo33QgdY3srZ+8fSFNqYZShi2YRIsmeNjwe5Vy38O3+Wk+vd9+f8OKxLChEY5Zv0PIIY+GOvdV5sVKr6VSgey17uAcMLEQS5OEAdN3uSRVQAww4PkWkWfo645RR2GYP7dH6adv9QBkACTSOCG8AISsTYx3cgY54a6LcDexXkukYX+LwV8RSGlWmP6e+pB2galMR7+FKp/d3+Z5+8HtJu9XnnUVVYdhzXFggQpgE65aw57gfhYmTzQ6QtBYVHJL4vCIBxpaRkxithMCygHBDI7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 05:25:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 05:25:17 +0000
Date: Tue, 29 Oct 2024 13:25:08 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [riteshharjani:atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1]
 2eda7299be: xfstests.generic.350.fail
Message-ID: <ZyBxtLUMt3X0ZPI3@xsang-OptiPlex-9020>
References: <202410281346.cfd98861-oliver.sang@intel.com>
 <87frogmy9a.fsf@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87frogmy9a.fsf@gmail.com>
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b14a7a-8613-42bc-58f6-08dcf7da12ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8lYcFHdxSxnMqzmkjBvs/9jraBewjqUdPo8Vh9LZP6vrBct/8SDA9d2Iuugy?=
 =?us-ascii?Q?hMzbJe+pzt2c03hh5wQYieBnYb/CjbS3LIaiYQ+5j+WTrvLqprfTGx0pt8L0?=
 =?us-ascii?Q?04QPj/BSa1I3T24dwEReINwVPcz62YcipzHz2t2M5deI1kgdON8ZvfV+3Fch?=
 =?us-ascii?Q?TfwQJOSXJln7PpQIrOo2bsNa9mYtMBGQMSvfyx6oD3RqQdrzHrPAd6X/JTGj?=
 =?us-ascii?Q?E6fw9y/ibqJ7j8wfQq9Eq2L7EYk1PE/7+qKrnFcOjIbWErQhjbD4fHThRBl0?=
 =?us-ascii?Q?niCAWKZ1k7ARpPftBm3kWG5w2+1mUJJKPAwIGNTcFHZs3zeEVjLO7+uucqJo?=
 =?us-ascii?Q?4ur/syJXL0FJri6a2VwEqweukSv+LsMjmo9lbKFSgyxNYLaoXl+i+oMi8N4+?=
 =?us-ascii?Q?UiaGumMCJKq88Y7mCRvG7AdRWM41iVp/hNJP12aGW/wWt/QKDAOYdHkCTHWD?=
 =?us-ascii?Q?B/z17tZ1PPnjUAf1xsP5HZ11vrRZB7rDloJg3AeyImP1eyjIFHzQK0zP0/uj?=
 =?us-ascii?Q?v4J0EfaT5M1m//XiRXYbm5+y5IRIINwyBn2sYEr/FvqWOwrPNDN4Mvsh2XsR?=
 =?us-ascii?Q?LtYRm2EMeUcOngpGuMf4IFdZVrl+9+Mbek+jp/+WXTADo8gFNJlduAI4Y4WS?=
 =?us-ascii?Q?01PsbNlrQb9kv6cJLedQHGqf6n+q7YVE4OcGgONp/XsGgBW3TLZew3XufcEx?=
 =?us-ascii?Q?q70ZDA2xZ5BFGdS+RcbQNR6eiUKASHu5tqDc3tCquYAZfxmTdfbulxJXS8pB?=
 =?us-ascii?Q?iTDXmxxc6vSw7jxnOXim7V7HKLkwE1GBAze0qiPUmuXJ0CnvWxOHv96n3yfQ?=
 =?us-ascii?Q?JYllK9lSokZ3LyAxLK8VMd1GqcW8ENLvjjhONV52jv3p/k8/MbWkctmdL1kv?=
 =?us-ascii?Q?rxeVehGdHfAVvmLLxfzTzaVE9TqTXu/dQbNNC4QLyyf8uvVuPyrMAMUcZGtB?=
 =?us-ascii?Q?OA+zhRl4rIAOpWodER4TRzQlDPdjeMuEpEzW3aKcU8hZkfa3EJZEvvhSV2Np?=
 =?us-ascii?Q?/lLgFFOil9RkGMoTzTJmpBhCro9OuJf2tfO+iW6PlMzrHbccti0oV1efS0hf?=
 =?us-ascii?Q?bquGpeZvSanc3FCNKORgpwvHj6FtqSB6705nDHRUVN4J4vGONlFQoa6tl9hu?=
 =?us-ascii?Q?NfyyyAv4Ecpka5WinWywKJTVz5dwd2cc/0TYmO2qaOdLDBqv81hNZM2qpc6y?=
 =?us-ascii?Q?TLqa5GMtXeBmmxf7IVoBb48ifvV2hJJgPW+7Jaash/LgA85tzHD+GeWZ5+Do?=
 =?us-ascii?Q?qyPuSf8ekGqhc20V5kH+Rm6ATrPp5AjUbrD569O4XQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aBDUb6+4wGiagCuDZJQnsE4rkAQLckM+K8Z2TqJTGFUtnC+OggCq4TnD7M1y?=
 =?us-ascii?Q?4GEtE5sCDVDE/H8x+VHpBABoTnTw3zRTskD/dd9gI9G9ya996HfExdhJvBjq?=
 =?us-ascii?Q?/OKifjzrhEizHMPb2HtEFraxYRRoMEY9n4vAfGpZSNaLcChANceSaPhKuNU+?=
 =?us-ascii?Q?jojqDekaItKU0N4lMvR1bRFMyWS66P/94W4xS94L8XiA4aTjHVJ4k+XMMui2?=
 =?us-ascii?Q?yN+yslOGsQ32u8QHiuTZopJ/cJeCnM5FlyvG4kntn9PObMNEdPjdshgF1MNj?=
 =?us-ascii?Q?k3/cjqIWkfYYXWEyIlfI7DK/eOYtSvtP749Ldp2l5Nq12XbCkHsS6wFiP3PP?=
 =?us-ascii?Q?rQptMMV+v4qSmXb/HiRTySr5scIGddyqzi8Kb0ZTlOzLnmqoYq9hTgh0Judw?=
 =?us-ascii?Q?DartEjWynCkT25E40CCePkpOowOuLhMRPgTAV7jGCh/6BvxWZNjaQJAiE5oW?=
 =?us-ascii?Q?ipkSHwwi6feZkMFy3e389qP1LKWddwI68uu+RrNrCPjgHSWYHyC4JTI54L4o?=
 =?us-ascii?Q?7tsqYHSGdizt36/6jki3treLCs029geLS2UlpxFZ0RvxuO9qwdsTGyoPoWbD?=
 =?us-ascii?Q?EUAvCxWmIw1B0tHN1tSYTSEBUwrJTGk4X3KWB5fo5s92duYVCzkcJ75RBkwY?=
 =?us-ascii?Q?K6zqMKcqoZ8hLgecoUfH1w+CeHRK5negX3nMb8Okx8QMLCwsYaJPb5n6Yz6z?=
 =?us-ascii?Q?pJCON7IQwy0VQcANik4Xw4ViVwHH73VwjKeb9iCnEzIdZA0+3jK4Id9kRkdD?=
 =?us-ascii?Q?4GUluDgm0xvR+SEHO9kBna5Pt8nOlomejA5QVKrQXOiMx5VKSLPGKciitclY?=
 =?us-ascii?Q?mODjs720V4Gj00uP5F1cQDD+ulIGEu/Lzo8vXe1r/Z0wKQuqYUbyzlTzn7kO?=
 =?us-ascii?Q?V44ctWBjbWkAnDzuj3gsHMIdN2isZ+fP3OGCPY7HJBqk3Ay2u/sW1gtbsMCs?=
 =?us-ascii?Q?FxoHOrKinOSDw7SZ6oyjpTyaqV6SLaIml+u3PKPM8a+lQ8TXPC0mjEb4omFj?=
 =?us-ascii?Q?J1Un4ez277lvwNJQ8NYPgfkKMthrj1TT7QT3Mjr3W0LMqx2se0k5FoAt5ylU?=
 =?us-ascii?Q?ynf7csFUlcfzhYKtA4yj27Y0l94cP/6oYq4AcRylZqaEvQTanCh1lZWDfm4b?=
 =?us-ascii?Q?ax+mXy+aRvfzVCAj6KdRx7dfRhPywHOzIvtTKk/jYOE6RGWAyIQ45MJ2wq/w?=
 =?us-ascii?Q?7m1LXdbWsT7PnO/H4NFYdNxoiFYsPfXhKiZno676DTb71DME5dYldw+b3H0w?=
 =?us-ascii?Q?9BWFp7Xu1Fc43E2TOEeVHNju8o2Rt1PKQZwzZxWFDC2UADKaMC5lH4VLVDxs?=
 =?us-ascii?Q?2Jw5EdkzuzQ9uXOGjG19WlpuF5841Jynos+gp6eFFUeM97vVp8W9nktUzv3I?=
 =?us-ascii?Q?5cqNM+scReXtv/HuGJXr75QAjvOEXSb69dLX3D4zge0FAu4lwcZpludDlTK7?=
 =?us-ascii?Q?eJhk64nPum3tTHCYAfp1LjL5BPLPKReZWzQkvcHvWLE7hsBVnWgepbL76w0f?=
 =?us-ascii?Q?fsUxkUvsWYYOczT/nRPFPoltSE4yz3WTsteAho9LHjFmi+BW7aKD2EiwmMVj?=
 =?us-ascii?Q?6n2CBY9tE12QOu3YAHozUXeQzGrI9JH30nINtxnfwQFaDyrRKLVcpPQrJdRZ?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b14a7a-8613-42bc-58f6-08dcf7da12ab
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 05:25:17.1352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDJpIHeY0KhMwxrma3A6u/yEz0vq10y2WUybycNIhYTVAxhdlQrHITf1zGcLOfsSD0LPsMNDAF1AVGKJkZu6kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
X-OriginatorOrg: intel.com

hi, Ritesh,

On Mon, Oct 28, 2024 at 01:53:45PM +0530, Ritesh Harjani wrote:
> kernel test robot <oliver.sang@intel.com> writes:
> 
> > Hello,
> >
> >
> > it seems a debug patch to us, below report just FYI what we observed in our
> > tests.
> >
> >
> > kernel test robot noticed "xfstests.generic.350.fail" on:
> >
> > commit: 2eda7299be1daa307b815b480cb9dd0b14ad062b ("scsi debug 350mb device and 2x shosts and DEF_PER_HOST_STORE=true")
> > https://github.com/riteshharjani/linux atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1
> 
> yes. I thought *wip* does not gets tested by default?
> 
> I did submit a patch to only allow for certain branches -
> https://github.com/intel/lkp-tests/commit/3a68b7ad329bea895c3d2c31a6b93a99d2eca536 

the date of this commit is Oct. 24. before that, atomic-writes-v6.12-fs-v10-ext4-rfcv2-wip1
branch is already merged into our so-called hourly kernel and under test
pipeline.

this will not happen in the future.

> 
> It has some "integration_testing_branches" and "branch_allowlist".

the "integration_testing_branches" is misleading, sorry for that.

in brief, it does not mean branches to do itegration runtime tests. it's for
patch applying stage. we monitor lots of mailing lists and our bot need to
guess the base for patches there. if a branch is in "integration_testing_branches",
it will be regarded as a candidate base for some patches (details will be more
complex, but hope these information is enough)

> But what
> I was looking for was, is there any report for what all gets tested, what
> tests passed, how does it decides what tests to run? 

sorry, we don't supply runtime tests summary. regarding runtime tests, our
bot is regression driven. we merge repo/branches under our monitoring and
patches from mailing lists into so-called hourly kernels, test them and compare
with base (e.g. milestone releases), bisect if there is regression. you will
only receive reports if a first-bad-commit found in your repo/branch or your
patch-set sent to mailing lest.

as above, it's a long pipeline, we cannot guarantee the full coverage.

> (Note I am aware of build success test report which gets generated which
> is quite useful too.)
> 
> -ritesh
> 
