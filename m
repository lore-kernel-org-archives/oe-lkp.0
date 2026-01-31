Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A0352C2A
	for <oe-lkp@lists.linux.dev>; Sat, 31 Jan 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866204; cv=fail; b=WTFv/8zPlaW6FJwoM3YWaiWJEfS7Pbp1mdPgSNwciMBMV0+WhsUvtjjK4iSLlwv5Am6e4YuL1IIOa4bkN4Sfa0zKBBzz+K2oKmkKobzvaZ2I9f6nDO4kUgjtatb1c1alo/0pP2qfWd8oqCpy9mwwdJKq9pIhwDh1ppiSuv6ZglU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866204; c=relaxed/simple;
	bh=MVIlKe1Hglm2bZPCdvqFjJWq9zgDxO9vEZj1UytWeds=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=SJrqJNJCkNX7pKlQE5rAEKwebtMhEfCoPJfYiJ42ObAb86B9I5L9uGbVH8jrUJ+76ZgKL9psm0/vIkAsGKm5sIdASyjp2BuUW5PjZLpZTrvlOeTmldJVDdMgGZ7t5bOVq126J1C4sF4rwXRosQUodgXp43bycYSw+UmEhKUlNdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUXQ4IDb; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUXQ4IDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769866202; x=1801402202;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=MVIlKe1Hglm2bZPCdvqFjJWq9zgDxO9vEZj1UytWeds=;
  b=MUXQ4IDbnpNSmbjwDjXJWH1TaR14PXxmKaTAjAFlUVWqAMm6K744u8K7
   wTHw9d8biz/vYdgpbaWTwH2i3uLLee2WRpzWPJ7Gim+hKqfLSeQAYnmt/
   nzy21mSvPMvuzg3AI5bfAniyfFLaBtPRmUFPpkxTNbE+WYUxqE6tDLEBH
   E8WTJvEheVmW+i4KOZ64r2P3E2lmcNS7KgsCE5bSGOluAuwflL1o1tEn6
   CZol6R0Zm8Ih/DuaXCpunw+GW4fldEM2Qyny/FZKRR41Ic4l2VRSnceWF
   Ka88fDplM5nttQiekDn+zU0tbXx6Br1ghsQ46R2Ya+OS7+QLObyAEbKn7
   g==;
X-CSE-ConnectionGUID: VSv4RXLLRpm8AfTI69K+DA==
X-CSE-MsgGUID: lbTmSsuqRl6gu2U6SKIvYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70114675"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="70114675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 05:30:01 -0800
X-CSE-ConnectionGUID: vjKpYlU+SCOi39wF+B3ZQw==
X-CSE-MsgGUID: lygdID7qSi68KbgooRizfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209174651"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 05:30:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 31 Jan 2026 05:29:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 31 Jan 2026 05:29:59 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 31 Jan 2026 05:29:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0YzbMQZy2iI1UOV7i9TRXzZkVT07lkZRGn+zSqXgpsOxk0pRWVSxH9TJuYyjx0b4TpECS2EJJPiEEZ2OErTn7C93dvpu6S9gqOEGK5Kpr9tBd/pxnS8TB9a/S4WXst4N3qgAerjqw/2GEyN3Zw7snL7JcwU4RTOImfFWhB5g0WdTzrq3eHQwa3ndMSLi1jD03FMr/O4s9iM2/zNdJ+6FqCjSwJkde7U4M3pDxI45C3gWT1vor/VezMwY6XUDU1G5A3bz+YfBy7NFNKy4wjw8W03WwTYWDe0gORL4eLqCkDgLB1MpNO7xxzzTMqpTkVKU8kiuJ1wUHapJrNVXfrlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNrhOKL5HBmnbpGPmZztELG3+MPNMoMOaZr1cHABB3k=;
 b=SVFVbj/T+eqRBR2jyLL6hZP8av88qFBHvkQ4cXWcv4UzRlIowgFl/yePiAgZXEVEE94tG9h2x+kjB8AnRODdeF8W0b9Qd/GK2TcsfyLigAJJtGwx3YY8kz6oXJ3GIJ7FpGSu+otIjhrqvBp4BwcjcFk4VY+YR5VWosdIq/8wxdXGVd5sxYTueQvOAAzBwJnashyYpf+fhni0G/RTkhQkZKh3Rv7LwWqCJVxbwAFPujijt91Of/njXF+pyTFQ7djeBd4vea1Zzx9kZqvpSSiqAQ1GXc+PWaLw+SK3nMtlbit4eKO3FBb+BWtk/uTKnJ1C+qgT6geKLQqzYJzllIwEJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Sat, 31 Jan
 2026 13:29:57 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9564.014; Sat, 31 Jan 2026
 13:29:57 +0000
Date: Sat, 31 Jan 2026 21:29:46 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mel Gorman <mgorman@techsingularity.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Madadi Vineeth Reddy
	<vineethr@linux.ibm.com>, <aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>,
	<oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  4f70f106bc: netperf.Throughput_Mbps
 8.5% improvement
Message-ID: <202601312046.dea2a8bf-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PPFE8B1F622C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a66f0ba-eb75-4f1d-b4f5-08de60ccd369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7K9OiCFOV7w5JerwQRee+g/5a9oh1JsFIOXxofGiNOqyRIL+GbMNz/wRxL?=
 =?iso-8859-1?Q?rQQrHV06ClUEVFOElpB7IpRPn2ZoaqBDWtCxmKr1pES3N1IxPo7c6/Olt6?=
 =?iso-8859-1?Q?5e8clcgVu30mP6XiAX9uModqmvxl+DRil8AUMLAYkWDNB//pvFQAv59lT3?=
 =?iso-8859-1?Q?oBEcaIZZm6joeXuS5LR00zdX5UO5DAwz2Kysp255ygN3NgJ/VuAwV+m9KA?=
 =?iso-8859-1?Q?zV1mkhJX+JzExSA/9wn4sciYZ3/lSwzPEV9lbs/WStFGiUrL9Okt0ivcS7?=
 =?iso-8859-1?Q?KPB6/tOhQHvZ0VlAkKgYWCoL411qbAIhK7JAVC9wJrO1biclIigN9xAC+i?=
 =?iso-8859-1?Q?hBawWfAeCBf0GeF7opzdblTIEg09ZiKuH5oSnxfXsVe+bZ1GmVzwkvRlxD?=
 =?iso-8859-1?Q?5uvEYvuXVlwUsgNnauR/l1yWzb0x0yJav+edwjNQ87RK0+dae+nf7nci/x?=
 =?iso-8859-1?Q?Nkuz6LFT/GZ+oYvbcSZ4x/TQs0T/o+U+MbTxM3aMVtTKP331YJs6fFuFFs?=
 =?iso-8859-1?Q?YACPT8PNydqmEKi9DFYYVF50IwQqdRIZbDithWR7g6mgbAzugoX376dPuf?=
 =?iso-8859-1?Q?P1fQqR1GWP30LR/KkB3ia1AlxzbnkyG0E93+IW1Oeb4DSfAnCx2DxJk1cb?=
 =?iso-8859-1?Q?7HWyqE5g5LY9Na0jr5FgTWm+RGY2khJcU5yfox0VxCC0XK4yryso6N9qlg?=
 =?iso-8859-1?Q?4FsACGsOHWa2bX/uzacRtGMljoFpS+a9yE+3BjCcxx9gOo6NGSDNEGzB0N?=
 =?iso-8859-1?Q?ls2O1y70dNYs9z64+FSeDv/9hf84aqBmS/ffrLw3VrRxhv6Vs02ymHDp6k?=
 =?iso-8859-1?Q?pNT04+UC3xbI0GPk/DmiKi1WEhrx4nlVURbF0h1G4U13uHogwZbk1AwkLF?=
 =?iso-8859-1?Q?xT2eOE3IekEY5dv5tanJVj7l6LEJ9GOQz9Bg35S/GF32v5k+EY+JxYd+Jj?=
 =?iso-8859-1?Q?sCCxCNh+xv3kHRdCtG9A0h5QbgsXGWmUT4zIyYCsdtrbPKRSdYP2xF4wJQ?=
 =?iso-8859-1?Q?3H3BtuTIxc3itcpywVDjU6oXmOfBcKojhQ4bXCdgMtR6d5rPfDOGHEi16F?=
 =?iso-8859-1?Q?7Nq0KrHikz5vyHnyDo/j0YQ1WRUCo9T7/HiBBVzguVXJ4GT0whYFcyZVLM?=
 =?iso-8859-1?Q?v4n0KEHHsGQr/dzkf84RnI/X5Vq9O5XRPqCqWFpQN8pPO2DVZAa2nhVIWA?=
 =?iso-8859-1?Q?N8avviv42jrgctsMLELizXRl7OAUONJlsuwImy+L+/WgO42odbnX5wG9/C?=
 =?iso-8859-1?Q?A7nQNHhPc0/X9gEfZLJLSEPLHj5+n40spQgpuSv25otMe9xNhy4roDaRNw?=
 =?iso-8859-1?Q?MaF1eg6YfZOZxjREJmyCjS5zn6OVDZHTmQf4iFUT5QkKVEgqJxXpz8wdbY?=
 =?iso-8859-1?Q?+WMkVWSF98K34HenCe+De0LljEQOmrRYriNCy+BOOkOUf3Nj5JGCI1vN4L?=
 =?iso-8859-1?Q?ULOvan9+UGsB5EsO1vUQ0jW1GPwMGSNpkqds+CpfwOZQySnNXkx+YJ8ham?=
 =?iso-8859-1?Q?19q8DApcpN/JMm15j6qrN+rM9lmYNQljv8pE84TzoMeVpU08XAWeF0Svgp?=
 =?iso-8859-1?Q?SmTBTgTIcakeyo/BedmQcO8S8XlkfaeSn6jPNMUHfOj9uOxTv8xxxq44Cn?=
 =?iso-8859-1?Q?ppuo3yzT2HyGHOMwz0WfTZsFY9w19EQKNI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?17jiodv9bQGwC70Fhra0ogQQ0tVeXetKoURUkHVaqzfZY+WI4380gV/Exe?=
 =?iso-8859-1?Q?ow4YkDe5YMpo7p7rn/3GTrbGJ96KSYT/znqkBKOBymuCu6DqJZ2FIgb+ff?=
 =?iso-8859-1?Q?LXPO9P6gHDbgbMPytlmmuX7UjQRGCqr8e/xfTsOnkHz5mjYL1510Df91/4?=
 =?iso-8859-1?Q?Wc2iWkCDH51aMVc4vDX7om6CIZjGhvY7Oy1DGpRwaDNYoCagmhqaNAprxP?=
 =?iso-8859-1?Q?ltoxugePyvxdrORggOR8tIgFgwqBSs3YGJu6x58F+uaO0lfLJhKKBvmSXs?=
 =?iso-8859-1?Q?Qw+CDlAxhuE4NNPsoTMusA20+rcHWv9m49hQgKF4zWYBtsbN3LAQY2Zns7?=
 =?iso-8859-1?Q?+A9tkiONZuxFxyPO1gt53aCfimjTBzYyzHdsMLTFLhmxZiox3nfLBxtzhL?=
 =?iso-8859-1?Q?NrNkzqXgsDRtbWr4A6fck+wTVGdB6454ODYIeVdcQrviIXonFtBbU881pz?=
 =?iso-8859-1?Q?VI6Xjxl5yO1x5awXv0Pi9iKy4KLYxt3mmXsKMdaw2Ywf6srT7yVweOdKXf?=
 =?iso-8859-1?Q?dc6xhE0uLrmxMV8ZGXEIj4KJNdK/OtW915Ri9yPcpdvGcmZn0Xh+YWm88y?=
 =?iso-8859-1?Q?HWtrlgetTNXRkRTFf96UAwpURn0tewjKhAvKJ+wSisNhwLKRab4GB4i9P0?=
 =?iso-8859-1?Q?aq/n0ar2UbJ2jZb7lOMQglMJbfPNkE+A+bGRG5zukbp5TY5qzKF7rboxE0?=
 =?iso-8859-1?Q?u9UnztCrvpbjuC9C0iOXDu6K4ROlOz/SaykJi3vC3YL1haLpaD2TlCogik?=
 =?iso-8859-1?Q?u36kyQxycwnrZxYVu/fKEIVOzIUZQTc37e/xUOr7GXbjDkqrb0Z29Z270E?=
 =?iso-8859-1?Q?1rAwkGBHWRsnRpChf1SqhJZk2UTOkCNQrqJfM5usAmUr0wEFzfJDaZkKUe?=
 =?iso-8859-1?Q?OjThvXb78l6QPJ+AUYpTx8HAPY9hjutpwVD3IfuptqMJpYz4yk8TnJq/va?=
 =?iso-8859-1?Q?5wuIGpLmIfbWGgluj7xN7HCeWzzHA3hjUKe5TFTNZmuTyRuL/2TZtbfAia?=
 =?iso-8859-1?Q?axlnWq6mRnJM6/PVhyfuYR64t9aZfnUlj3YP0mGxtA6uiZiO+EUBX7SvB6?=
 =?iso-8859-1?Q?2JiVvA35Pko2jdtpNbhpf2OgmoZ9TJ5vI21/2z2kKirTPG49ecNdeRfGlj?=
 =?iso-8859-1?Q?BRTWpcIWx3HcHMBzyK8IUyl+stwrEcddRa3DWzQqZiW0jhdehsmed+YL3f?=
 =?iso-8859-1?Q?aUGitQVcfYWs1XVrqaqpJOlbbQHSvSGuRInHY8WQmDintx0j4wKfuW8q28?=
 =?iso-8859-1?Q?pa0YuIOa+g2ardlNjjtJSpN/RuJrOxHsKTgNhwYoeapAdTEcAKPE0meLAx?=
 =?iso-8859-1?Q?MzY3AVU+r2zEGYV9ZWIz1R56KBmk2BsOgGVM9JMR+RUUB282u9Q1l59VNR?=
 =?iso-8859-1?Q?ylGPf/vojSVqduluK5IGly6SdCuYMCUyN6sJbDuyoMD2wvhvZdHwnX00O9?=
 =?iso-8859-1?Q?mrRpvJ+u1bLXBzBonVJJ5dfitpBMjHYO5GH9tJiqI6HvpnoKU5uW5t2MIh?=
 =?iso-8859-1?Q?rzgSZJdao4wIqBMs4YfvheWNbtWQr6KKh6uvtc5pHHV+HQXEKm00fgKzhj?=
 =?iso-8859-1?Q?2I2bnknvdmOoWWR09Jw+XfvjI83cbPWpyxSQEn+ohee5kmMQBUHUVDXyRZ?=
 =?iso-8859-1?Q?MzJKhBKng6UprwZ5KdCWVUK+zvceh4I43mGXU8ziTEUe6m1D/tmM+aggy4?=
 =?iso-8859-1?Q?hNBSHey2xEuufy+uFDHBH7T20+w8efZQ/lgC7mb70vQZv5Cb9PP4AN6thG?=
 =?iso-8859-1?Q?pVGxgewdrzy4LFu4hXXSvabMeNnu5JyaRWZqG3TPNXF9r7ivKQHrjfjwbU?=
 =?iso-8859-1?Q?EMIwBBGiLw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a66f0ba-eb75-4f1d-b4f5-08de60ccd369
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 13:29:57.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0yprFpfHReYHHtnHOwuEE2qAegNTnRQNup6hq6tY2XksDbxk1h6tlrYzXBqAvPrqlZyu3O0SjMzgBCVyhMKrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 8.5% improvement of netperf.Throughput_Mbps on:


commit: 4f70f106bca1a56bd66d00830ac91680bd754974 ("sched/fair: Disable scheduler feature NEXT_BUDDY")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: netperf
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	test: TCP_STREAM
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260131/202601312046.dea2a8bf-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-srf-2sp3/TCP_STREAM/netperf

commit: 
  98c88dc8a1 ("sched/fair: Fix pelt clock sync when entering idle")
  4f70f106bc ("sched/fair: Disable scheduler feature NEXT_BUDDY")

98c88dc8a1ace642 4f70f106bca1a56bd66d00830ac 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.94 ±  2%      +0.1        1.08 ±  2%  mpstat.cpu.all.usr%
      1546 ± 11%     +30.3%       2015 ±  6%  perf-c2c.HITM.local
     91440 ±  2%      +8.3%      99068 ±  3%  vmstat.system.cs
      0.08 ± 44%     +33.3%       0.10        turbostat.IPC
    338.84 ± 44%     +21.4%     411.43        turbostat.PkgWatt
 6.134e+08            +9.1%  6.692e+08        numa-numastat.node0.local_node
 6.135e+08            +9.1%  6.693e+08        numa-numastat.node0.numa_hit
 6.189e+08            +7.2%  6.637e+08        numa-numastat.node1.local_node
  6.19e+08            +7.2%  6.638e+08        numa-numastat.node1.numa_hit
 6.135e+08            +9.1%  6.692e+08        numa-vmstat.node0.numa_hit
 6.134e+08            +9.1%  6.692e+08        numa-vmstat.node0.numa_local
  6.19e+08            +7.2%  6.637e+08        numa-vmstat.node1.numa_hit
 6.189e+08            +7.2%  6.636e+08        numa-vmstat.node1.numa_local
   2244672            +6.4%    2388374        meminfo.Active
   2244656            +6.4%    2388358        meminfo.Active(anon)
   2608934            +5.6%    2756130        meminfo.Committed_AS
  11862311           -10.9%   10566854        meminfo.Memused
   1269914           +10.9%    1408300 ±  2%  meminfo.Shmem
  12102805           -12.0%   10644904        meminfo.max_used_kB
    561006            +6.4%     597080        proc-vmstat.nr_active_anon
   1235403            +2.8%    1270160        proc-vmstat.nr_file_pages
    317342           +11.0%     352098 ±  2%  proc-vmstat.nr_shmem
    561006            +6.4%     597080        proc-vmstat.nr_zone_active_anon
 1.232e+09            +8.2%  1.333e+09        proc-vmstat.numa_hit
 1.232e+09            +8.2%  1.333e+09        proc-vmstat.numa_local
 9.843e+09            +8.2%  1.065e+10        proc-vmstat.pgalloc_normal
 9.842e+09            +8.2%  1.064e+10        proc-vmstat.pgfree
      2799            +8.5%       3038        netperf.ThroughputBoth_Mbps
   1075104            +8.5%    1166788        netperf.ThroughputBoth_total_Mbps
      2799            +8.5%       3038        netperf.Throughput_Mbps
   1075104            +8.5%    1166788        netperf.Throughput_total_Mbps
   5393466           -16.6%    4498332 ±  3%  netperf.time.involuntary_context_switches
      8777            -2.3%       8573        netperf.time.percent_of_cpu_this_job_got
     26432            -2.6%      25744        netperf.time.system_time
    241.24           +18.7%     286.46        netperf.time.user_time
   7798392           +29.3%   10081565        netperf.time.voluntary_context_switches
 2.461e+09            +8.5%  2.671e+09        netperf.workload
      5.81           -19.1%       4.70        perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     32.01 ±  7%   +3062.1%       1012 ± 63%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      5.81           -19.1%       4.70        perf-sched.total_sch_delay.average.ms
     32.01 ±  7%   +3062.1%       1012 ± 63%  perf-sched.total_sch_delay.max.ms
     17.05           -14.0%      14.67 ±  2%  perf-sched.total_wait_and_delay.average.ms
    432781 ±  2%     +21.2%     524343 ±  5%  perf-sched.total_wait_and_delay.count.ms
     11.24           -11.3%       9.97 ±  2%  perf-sched.total_wait_time.average.ms
     17.05           -14.0%      14.67 ±  2%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    432781 ±  2%     +21.2%     524343 ±  5%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     11.24           -11.3%       9.97 ±  2%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3.02            -8.1%       2.78        sched_debug.cfs_rq:/.h_nr_runnable.avg
      5.44 ±  5%      -7.1%       5.06 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.84 ±  2%     -13.6%       0.73 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      3077            -8.3%       2822        sched_debug.cfs_rq:/.runnable_avg.avg
      5181 ±  2%     -11.2%       4602 ±  5%  sched_debug.cfs_rq:/.runnable_avg.max
    713.34 ±  3%     -19.0%     577.80 ±  2%  sched_debug.cfs_rq:/.runnable_avg.stddev
      1907 ±  2%      -5.6%       1801 ±  2%  sched_debug.cfs_rq:/.util_est.avg
    633.28 ±  4%      -8.6%     578.69 ±  3%  sched_debug.cfs_rq:/.util_est.stddev
    791240            -8.3%     725705 ±  2%  sched_debug.cpu.avg_idle.avg
    247015 ±  3%     +10.0%     271600 ±  2%  sched_debug.cpu.avg_idle.stddev
    130423 ± 10%     +26.9%     165570 ±  7%  sched_debug.cpu.nr_switches.max
      8579 ± 36%     +69.3%      14527 ± 21%  sched_debug.cpu.nr_switches.stddev
     51.90           -12.1%      45.62        perf-stat.i.MPKI
 1.103e+10            +9.8%  1.211e+10        perf-stat.i.branch-instructions
      0.32            -0.0        0.29        perf-stat.i.branch-miss-rate%
     62.97            -6.4       56.58        perf-stat.i.cache-miss-rate%
 2.908e+09            -3.0%  2.821e+09        perf-stat.i.cache-misses
 4.614e+09            +8.0%  4.981e+09        perf-stat.i.cache-references
     89826 ±  2%      +7.6%      96633 ±  3%  perf-stat.i.context-switches
     10.89            -9.4%       9.86        perf-stat.i.cpi
    211.22            +3.0%     217.51        perf-stat.i.cycles-between-cache-misses
 5.591e+10           +10.3%  6.167e+10        perf-stat.i.instructions
      0.10            +9.8%       0.11        perf-stat.i.ipc
     52.02           -12.1%      45.75        perf-stat.overall.MPKI
      0.32            -0.0        0.29        perf-stat.overall.branch-miss-rate%
     63.04            -6.4       56.63        perf-stat.overall.cache-miss-rate%
     10.91            -9.4%       9.89        perf-stat.overall.cpi
    209.70            +3.1%     216.12        perf-stat.overall.cycles-between-cache-misses
      0.09           +10.3%       0.10        perf-stat.overall.ipc
      6872            +1.5%       6973        perf-stat.overall.path-length
 1.096e+10            +9.8%  1.204e+10        perf-stat.ps.branch-instructions
 2.892e+09            -3.0%  2.805e+09        perf-stat.ps.cache-misses
 4.587e+09            +8.0%  4.953e+09        perf-stat.ps.cache-references
     89124 ±  2%      +7.5%      95840 ±  2%  perf-stat.ps.context-switches
 5.558e+10           +10.3%  6.132e+10        perf-stat.ps.instructions
 1.691e+13           +10.1%  1.862e+13        perf-stat.total.instructions
      9.28            -2.3        6.96 ±  2%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
      9.46            -2.3        7.14 ±  2%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.__free_frozen_pages.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
      8.78            -2.3        6.50 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages
      8.81            -2.3        6.54 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data
     10.82            -2.2        8.65 ±  2%  perf-profile.calltrace.cycles-pp.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     10.81            -2.2        8.65 ±  2%  perf-profile.calltrace.cycles-pp.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     10.46            -2.1        8.32 ±  2%  perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg
      9.36            -2.1        7.25 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      9.86            -2.1        7.74 ±  2%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      9.87            -2.1        7.76 ±  2%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      9.40            -2.1        7.29 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
      9.95            -2.1        7.85 ±  2%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
     10.56            -2.1        8.50 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg
     10.53            -2.1        8.48 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill
     10.54            -2.0        8.49 ±  2%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked
     10.47            -2.0        8.42 ±  2%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill
     10.71            -1.9        8.78 ±  2%  perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
     10.71            -1.9        8.80 ±  2%  perf-profile.calltrace.cycles-pp.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     28.86            -0.7       28.20        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      1.02 ± 14%      -0.7        0.36 ±103%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      1.01 ± 14%      -0.7        0.36 ±103%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
      1.00 ± 14%      -0.6        0.35 ±103%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
     29.17            -0.6       28.53        perf-profile.calltrace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     47.34            -0.6       46.70        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_stream.main
     47.36            -0.6       46.73        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_stream.main
     47.22            -0.6       46.61        perf-profile.calltrace.cycles-pp.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.89            -0.6       46.30        perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     47.45            -0.6       46.87        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_stream
     47.44            -0.6       46.87        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner
      1.99 ±  2%      -0.5        1.46 ±  7%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      1.99 ±  2%      -0.5        1.46 ±  7%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      1.99 ±  2%      -0.5        1.46 ±  7%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      1.86 ±  2%      -0.4        1.45 ±  7%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      3.02            -0.3        2.73 ±  9%  perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core.process_backlog.__napi_poll
      3.02            -0.3        2.73 ±  9%  perf-profile.calltrace.cycles-pp.ip_local_deliver.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      3.00 ±  2%      -0.3        2.72 ±  9%  perf-profile.calltrace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core
      3.01            -0.3        2.73 ±  9%  perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core.process_backlog
      2.76            -0.2        2.52 ± 10%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      3.54 ±  2%      -0.2        3.32 ±  3%  perf-profile.calltrace.cycles-pp.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
      3.58 ±  2%      -0.2        3.39 ±  3%  perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
      3.59 ±  2%      -0.2        3.40 ±  3%  perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output
      3.09            -0.2        2.90 ±  3%  perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.handle_softirqs
      3.12 ±  2%      -0.2        2.94 ±  4%  perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
      3.11            -0.2        2.94 ±  4%  perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.handle_softirqs.do_softirq
      0.64            -0.1        0.57        perf-profile.calltrace.cycles-pp.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      0.74            -0.0        0.70        perf-profile.calltrace.cycles-pp.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      3.52            +0.3        3.80 ±  3%  perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb
      0.68 ±  3%      +0.4        1.07 ±  6%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established
      0.68 ±  3%      +0.4        1.07 ±  6%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      0.68 ±  3%      +0.4        1.07 ±  6%  perf-profile.calltrace.cycles-pp.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      0.17 ±141%      +0.4        0.57        perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      0.73 ±  3%      +0.4        1.17 ±  5%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      0.17 ±141%      +0.6        0.74 ±  8%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue
      0.09 ±223%      +0.6        0.73 ±  8%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule
     51.15            +0.7       51.82        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child
     50.99            +0.7       51.66        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     50.99            +0.7       51.66        perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     51.00            +0.7       51.68        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     51.05            +0.7       51.74        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni
     51.05            +0.7       51.74        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests
      2.08            +0.8        2.84 ±  3%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg
      2.09            +0.8        2.86 ±  3%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      2.10            +0.8        2.87 ±  3%  perf-profile.calltrace.cycles-pp.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      1.56 ±  2%      +0.8        2.39 ±  2%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
      1.57 ±  2%      +0.8        2.41 ±  3%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked
     50.68            +0.8       51.52        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      1.60 ±  2%      +0.8        2.44 ±  2%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg
      2.00 ±  2%      +1.0        2.98 ±  2%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      2.21 ±  2%      +1.1        3.28 ±  2%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     36.33            +3.7       39.99        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     36.32            +3.7       39.99        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     34.51            +3.9       38.37        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
     18.51            -4.6       13.93 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     18.65            -4.6       14.10 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      9.70            -2.5        7.24 ±  2%  perf-profile.children.cycles-pp.free_frozen_page_commit
      9.52            -2.5        7.06 ±  2%  perf-profile.children.cycles-pp.free_pcppages_bulk
     11.30            -2.4        8.89 ±  2%  perf-profile.children.cycles-pp.skb_release_data
     10.75            -2.3        8.45 ±  2%  perf-profile.children.cycles-pp.__free_frozen_pages
     10.82            -2.2        8.65 ±  2%  perf-profile.children.cycles-pp.skb_attempt_defer_free
     10.00            -2.2        7.85 ±  2%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      9.99            -2.2        7.83 ±  2%  perf-profile.children.cycles-pp.rmqueue_bulk
     10.08            -2.1        7.94 ±  2%  perf-profile.children.cycles-pp.rmqueue
     10.62            -2.1        8.52 ±  2%  perf-profile.children.cycles-pp.get_page_from_freelist
     10.68            -2.1        8.58 ±  2%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     10.69            -2.1        8.59 ±  2%  perf-profile.children.cycles-pp.alloc_pages_mpol
     10.69            -2.1        8.59 ±  2%  perf-profile.children.cycles-pp.alloc_pages_noprof
     10.84            -2.0        8.87 ±  2%  perf-profile.children.cycles-pp.skb_page_frag_refill
     10.85            -2.0        8.89 ±  2%  perf-profile.children.cycles-pp.sk_page_frag_refill
     29.32            -0.9       28.47        perf-profile.children.cycles-pp._copy_from_iter
     29.53            -0.8       28.71        perf-profile.children.cycles-pp.skb_do_copy_data_nocache
     47.58            -0.8       46.79        perf-profile.children.cycles-pp.tcp_sendmsg
     47.81            -0.8       47.04        perf-profile.children.cycles-pp.__x64_sys_sendto
     47.80            -0.8       47.04        perf-profile.children.cycles-pp.__sys_sendto
     47.26            -0.8       46.50        perf-profile.children.cycles-pp.tcp_sendmsg_locked
     48.33            -0.7       47.62        perf-profile.children.cycles-pp.send_omni_inner
      1.58 ±  4%      -0.7        0.88 ±  3%  perf-profile.children.cycles-pp.__tcp_push_pending_frames
     48.18            -0.6       47.60        perf-profile.children.cycles-pp.send_tcp_stream
      3.21 ±  2%      -0.3        2.92 ±  3%  perf-profile.children.cycles-pp.tcp_rcv_established
      3.28 ±  2%      -0.3        2.99 ±  3%  perf-profile.children.cycles-pp.tcp_v4_do_rcv
      0.38 ±  5%      -0.3        0.11 ±  9%  perf-profile.children.cycles-pp.validate_xmit_skb
      0.36 ±  5%      -0.3        0.09 ±  7%  perf-profile.children.cycles-pp.__skb_gso_segment
      0.36 ±  5%      -0.3        0.09 ±  9%  perf-profile.children.cycles-pp.inet_gso_segment
      0.36 ±  5%      -0.3        0.09 ±  7%  perf-profile.children.cycles-pp.skb_mac_gso_segment
      0.34 ±  5%      -0.3        0.08 ±  8%  perf-profile.children.cycles-pp.skb_segment
      0.35 ±  5%      -0.3        0.09 ± 12%  perf-profile.children.cycles-pp.tcp_gso_segment
      0.43 ±  9%      -0.2        0.22 ±  8%  perf-profile.children.cycles-pp.__release_sock
      0.49 ±  8%      -0.2        0.28 ±  6%  perf-profile.children.cycles-pp.release_sock
      1.08            -0.2        0.88        perf-profile.children.cycles-pp.simple_copy_to_iter
      1.21            -0.2        1.03        perf-profile.children.cycles-pp.check_heap_object
      1.24            -0.2        1.07        perf-profile.children.cycles-pp.__check_object_size
      0.32 ± 12%      -0.2        0.15 ± 19%  perf-profile.children.cycles-pp.napi_consume_skb
      0.77            -0.1        0.62        perf-profile.children.cycles-pp.__alloc_skb
      0.52            -0.1        0.37        perf-profile.children.cycles-pp.kmem_cache_free
      0.20 ±  3%      -0.1        0.11        perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      0.54 ±  6%      -0.1        0.45 ±  6%  perf-profile.children.cycles-pp.skb_defer_free_flush
      0.31            -0.1        0.23        perf-profile.children.cycles-pp.__slab_free
      0.13 ±  3%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.kmalloc_reserve
      0.16 ±  4%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__kfree_skb
      0.76            -0.1        0.70        perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      0.09 ±  8%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.14 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.45            -0.1        0.40        perf-profile.children.cycles-pp.__free_one_page
      0.26 ±  2%      -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.sock_rfree
      0.11 ±  4%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.18 ±  2%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.skb_clone
      0.18 ±  2%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.prep_new_page
      0.07            +0.0        0.08        perf-profile.children.cycles-pp.__inet_lookup_skb
      0.07            +0.0        0.08        perf-profile.children.cycles-pp.lock_sock_nested
      0.09            +0.0        0.10        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.07 ±  6%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.06            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__inet_lookup_established
      0.07            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.__mod_timer
      0.11            +0.0        0.13 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_bh
      0.07 ±  8%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.tcp_check_space
      0.28            +0.0        0.30        perf-profile.children.cycles-pp.__del_page_from_free_list
      0.10            +0.0        0.12        perf-profile.children.cycles-pp.read_tsc
      0.07            +0.0        0.09        perf-profile.children.cycles-pp._find_next_bit
      0.06            +0.0        0.08        perf-profile.children.cycles-pp.rb_erase
      0.07            +0.0        0.09        perf-profile.children.cycles-pp.sk_reset_timer
      0.12            +0.0        0.14        perf-profile.children.cycles-pp.__virt_addr_valid
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.fdget
      0.15 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.37 ±  3%      +0.0        0.40        perf-profile.children.cycles-pp.hrtimer_interrupt
      0.16 ±  3%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.kfree_skbmem
      0.21 ±  3%      +0.0        0.24        perf-profile.children.cycles-pp.ktime_get
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.tcp_rbtree_insert
      0.17 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.__schedule
      0.08 ±  4%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.sk_stream_wait_memory
      0.18 ±  2%      +0.0        0.21 ±  2%  perf-profile.children.cycles-pp.schedule
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.sk_stream_write_space
      0.12 ±  3%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.sock_def_readable
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.sk_wait_data
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.try_to_wake_up
      0.07            +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.schedule_timeout
      0.07 ±  5%      +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.wait_woken
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.__wake_up_common
      0.96            +0.1        1.10 ±  3%  perf-profile.children.cycles-pp.tcp_clean_rtx_queue
      1.02            +0.1        1.17 ±  3%  perf-profile.children.cycles-pp.tcp_ack
      0.77 ±  2%      +0.2        0.95 ±  7%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      0.59 ±  3%      +0.2        0.78 ±  8%  perf-profile.children.cycles-pp.refill_stock
      0.58 ±  3%      +0.2        0.77 ±  8%  perf-profile.children.cycles-pp.drain_stock
      0.85 ±  3%      +0.2        1.05 ±  8%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.91 ±  3%      +0.3        1.17 ±  6%  perf-profile.children.cycles-pp.tcp_try_rmem_schedule
      1.00 ±  2%      +0.3        1.31 ±  5%  perf-profile.children.cycles-pp.tcp_data_queue
      3.81            +0.4        4.17        perf-profile.children.cycles-pp.tcp_write_xmit
     51.25            +0.7       51.92        perf-profile.children.cycles-pp.process_requests
     51.25            +0.7       51.92        perf-profile.children.cycles-pp.recv_omni
     51.25            +0.7       51.92        perf-profile.children.cycles-pp.spawn_child
     50.99            +0.7       51.67        perf-profile.children.cycles-pp.tcp_recvmsg
     51.00            +0.7       51.68        perf-profile.children.cycles-pp.inet_recvmsg
     51.00            +0.7       51.68        perf-profile.children.cycles-pp.sock_recvmsg
     51.06            +0.7       51.74        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     51.05            +0.7       51.74        perf-profile.children.cycles-pp.__sys_recvfrom
      2.13            +0.8        2.89 ±  4%  perf-profile.children.cycles-pp.tcp_wmem_schedule
     50.68            +0.8       51.53        perf-profile.children.cycles-pp.tcp_recvmsg_locked
      3.10            +1.0        4.14 ±  4%  perf-profile.children.cycles-pp.__sk_mem_schedule
      3.09            +1.0        4.13 ±  4%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
     36.33            +3.7       39.99        perf-profile.children.cycles-pp.__skb_datagram_iter
     36.33            +3.7       40.00        perf-profile.children.cycles-pp.skb_copy_datagram_iter
     34.73            +3.9       38.65        perf-profile.children.cycles-pp._copy_to_iter
     18.51            -4.6       13.93 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
     29.20            -0.9       28.34        perf-profile.self.cycles-pp._copy_from_iter
      1.06            -0.2        0.87        perf-profile.self.cycles-pp.check_heap_object
      0.31            -0.1        0.22 ±  2%  perf-profile.self.cycles-pp.__slab_free
      0.32            -0.1        0.26        perf-profile.self.cycles-pp.tcp_write_xmit
      0.41            -0.1        0.35        perf-profile.self.cycles-pp.__free_one_page
      0.51            -0.1        0.46        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.53            -0.0        0.48        perf-profile.self.cycles-pp.__alloc_skb
      0.13 ±  3%      -0.0        0.08        perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.17 ±  2%      -0.0        0.13 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      0.26 ±  2%      -0.0        0.22        perf-profile.self.cycles-pp.sock_rfree
      0.18 ±  2%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.skb_clone
      0.17 ±  2%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.prep_new_page
      0.07            +0.0        0.08        perf-profile.self.cycles-pp.__sys_sendto
      0.11            +0.0        0.12        perf-profile.self.cycles-pp.send_omni_inner
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.__inet_lookup_established
      0.09            +0.0        0.10        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.09            +0.0        0.10        perf-profile.self.cycles-pp.read_tsc
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.rmqueue
      0.13            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.11            +0.0        0.12 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.12 ±  5%      +0.0        0.14 ±  2%  perf-profile.self.cycles-pp.ktime_get
      0.28            +0.0        0.30        perf-profile.self.cycles-pp.__del_page_from_free_list
      0.17 ±  2%      +0.0        0.19        perf-profile.self.cycles-pp.fdget
      0.07            +0.0        0.09        perf-profile.self.cycles-pp._find_next_bit
      0.06            +0.0        0.08        perf-profile.self.cycles-pp.rb_erase
      0.12            +0.0        0.14        perf-profile.self.cycles-pp.__virt_addr_valid
      0.15 ±  3%      +0.0        0.17        perf-profile.self.cycles-pp.__zone_watermark_ok
      0.16 ±  3%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.kfree_skbmem
      0.11            +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.free_frozen_page_commit
      0.06            +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      0.28            +0.0        0.31 ±  2%  perf-profile.self.cycles-pp.tcp_recvmsg_locked
      0.05            +0.0        0.08        perf-profile.self.cycles-pp.tcp_rbtree_insert
      0.14 ±  3%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.21 ±  2%      +0.0        0.25        perf-profile.self.cycles-pp.get_page_from_freelist
      0.41            +0.0        0.44        perf-profile.self.cycles-pp.__tcp_transmit_skb
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__check_object_size
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.ip_finish_output2
      0.15            +0.1        0.20        perf-profile.self.cycles-pp.skb_defer_free_flush
      0.28            +0.1        0.35        perf-profile.self.cycles-pp.tcp_clean_rtx_queue
      0.37 ±  2%      +0.1        0.44 ±  3%  perf-profile.self.cycles-pp.__dev_queue_xmit
      1.11            +0.1        1.23        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      0.14 ±  3%      +0.1        0.28        perf-profile.self.cycles-pp.skb_page_frag_refill
      1.00            +0.2        1.16        perf-profile.self.cycles-pp.__free_frozen_pages
      0.84 ±  3%      +0.2        1.04 ±  8%  perf-profile.self.cycles-pp.page_counter_try_charge
      1.38            +0.8        2.15 ±  3%  perf-profile.self.cycles-pp.__sk_mem_raise_allocated
     34.57            +3.9       38.47        perf-profile.self.cycles-pp._copy_to_iter




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

