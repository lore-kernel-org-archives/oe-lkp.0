Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E255E27CB02
	for <oe-lkp@lists.linux.dev>; Wed,  3 Dec 2025 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744876; cv=fail; b=WyZ0SQTUE7u1WCXRV+Z3YOKpJdS4Q6KLSAV4vnKrAlYcgc9ECTY1pysVE5ru39LWtf5qyQ6c1RxYClqDkNuaZyouXHgPo4wAKN8PeZcEP6V6gcQdQS249qb9+x/O849h/VJ8cZ50E10dmIxGQGMVvPVlAHEEMAe9TgQor8gSPSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744876; c=relaxed/simple;
	bh=ek2AuaLV9EEOf910tTrLwEr0k0OJOJlYixcoiDk9ZiA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LZWBg1n+bM1qc6fWWWds5ju9UBLNzQLNHiwjQAuZwLZYgUgxre3cykj0KifbRj7/6lrePBSlJBo47A7BhY+4ir3NMfJtRzmgHTo/06TXbRoA0xB3CfYm6Rfe/61Lacsv0iviv4eAZNNj8ONXLNqxmH5tKGCWHPCiOjwisLwdpT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKtix8Py; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKtix8Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764744875; x=1796280875;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ek2AuaLV9EEOf910tTrLwEr0k0OJOJlYixcoiDk9ZiA=;
  b=OKtix8PyTWJtxpejimpLyxrGKDcI9g8hJtXtTpPOpLkAgeKD+PHcJb7/
   969tszXj2NYQxvGcfEMzGsdUMEXQz6kRPN80/qiQ1StnZX7eclIGH4V0n
   dRg6uAcRBYv6Vk/oi9+LefGb5rYX6Q2WUTa5PaCHiLmRoJ5i5+xTJiwcK
   +VZLDG615SxP0IPAV/rFmhHFaEADuJwLOyddiixzCUZi2dxEeQ9KqJVEO
   uFRyS1yrM6GeWOPp5GO87tKByAzfn5sLejuQ/5SqjAiQDV8iEJJtWBcZE
   aOiggfwM5L12Vpy/wsQ9Nu/SkHJFVmOMDnoOyqZDCzUhJBcZeY2e9vGey
   g==;
X-CSE-ConnectionGUID: FDhpMAiRSjW2Ygpu9/p7Hg==
X-CSE-MsgGUID: bnx/Od1AQJmSkMIlRZ228g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69322774"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="69322774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 22:54:34 -0800
X-CSE-ConnectionGUID: at0CNpQ/Q7ixdP9eXng3kQ==
X-CSE-MsgGUID: ux7LCcWQRmGiFvsDHTx5RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="193878541"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 22:54:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 22:54:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 22:54:33 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 22:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQecNXwojtBcUuy3FrxypsvqxHJBvR+GauDZN5LrtMXehbJECglO3VdaKji1JMwUjFIldSfdVY07nBW2xLqpBHZ4Yvlub0F/dgT+0b3BuEnz9ZLH9/nEx06SxQbCixCpR0U5HjddTGQNyi7JtYTyEWYkPTLGsLUuBVSQ3rCJzhJaHPIb5a2vEv3S+fy4x9vZcISz6OHzFtrHW+9KxGByGMbmXHHOON3AGBRQXCp/dls6OdV4Ut3ftLqk6RhK1XTuDrbROCdtzD7FSLbZ+Rz8ExR4yFNfBQ8DDQ9NVdped3f8MqUvxlwMt7OIt1/8Tm8gvnwEOGDIyDBvJY96ZQwofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NCcbqHmahLM0Df40StDhwYyG9qogauBJS/6FTMDXBg=;
 b=nnNBkMEWKRhKKRa76YmtriWBcUVSlPYipTb5MG6F3/cDMFdNPuRpRUIcZ32w8SL3hXR2whSWrSoy+oQc5mMAJLM+vgvZDPa0ecgApzNwtRcD+vHuaBj8veSmAOkcWeYHdBwEkkfySgl6f+Q8YuxBnetGY1KUG322I8s+sHlF6ptfi8M2z1RFvVs8aph0M3+1zVrN/K9gDLTVmpgKntV974iF2xYwoC0H7wpszJp4jHSshvYM+p7qxebFZcXslsigKGEyk4zHf69RZwxUJbvCAivMm0gbEizbdG8wU+b3taCNcp7nFZNMHImzha3fusrkgpGnFAYkmg20ww6aL0E1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 06:54:31 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 06:54:31 +0000
Date: Wed, 3 Dec 2025 14:54:20 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Tim Chen
	<tim.c.chen@linux.intel.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>, Chen Yu
	<yu.c.chen@intel.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Srikar Dronamraju <srikar@linux.ibm.com>, "Mohini
 Narkhede" <mohini.narkhede@intel.com>, <aubrey.li@linux.intel.com>
Subject: Re: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <aS/enCbsTTlXiAEL@xsang-OptiPlex-9020>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
 <aSgU0IDhF4uam0JA@gmail.com>
 <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>
 <20251128093430.GE3245006@noisy.programming.kicks-ass.net>
 <aS51CHrrzE3_7vM9@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aS51CHrrzE3_7vM9@gmail.com>
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cd5b31-cd35-4351-e9fc-08de3238cf28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?necRPuswuGlDUlyPihA+CPIfciKVzF2azVT63VYDgKtZS4kx6zU0Kj59VZTz?=
 =?us-ascii?Q?TzEnS+LsdxqkzcGLCMxF42fTFQWlvL9UUT5eW6lS9k5f5Xem68vV+YK46RVY?=
 =?us-ascii?Q?AprjyxYCGKQul0BNboR3+7gq/fNkKlIKqz8vQDKpk1MXxQxD4oLkvhGB9lmF?=
 =?us-ascii?Q?G5/oMR/B1XRCL5d9rsHPtciTjhxo4ZsUrjXfvgF3+N+AjIEAbf8OrGoH2a/j?=
 =?us-ascii?Q?NVkOTB9qzRHCgybm+bV4Rng0Sk1efw4u14UHNFbu3NwiYXDV4O6+94hLBeWh?=
 =?us-ascii?Q?6RFXUMSo4JtdLcYIxNHVbzPBCCpxeviwPunELUe2mxc0s5Y+ujqEMkEn+s8C?=
 =?us-ascii?Q?dHV+8nWzD94t/T/mCx7IyxfjFN85yWbowkzcGAggpdlfb0YLC/Jbkw2hgD+f?=
 =?us-ascii?Q?hiTmFt1x/J1B+JYf0s9P+m0pllKKGGjMcGx2GTonZewTZ6Zl6THc1mnpUgIL?=
 =?us-ascii?Q?/bFAmvxTkKyhQNBrQAEHYcjBF2rtXMsta1Wrk+PIAisfULKPiErkLCVTnO5O?=
 =?us-ascii?Q?MBBsogXb8eJ0acaHuPhRYp4SNq0N0YjqYFrXQmLgVRCc8CUn4mpa9eewH4HP?=
 =?us-ascii?Q?T7/PL3OxosxiSlNRK1YIsLU0DEdekI1jeWV6A1c8ykolhsD2ruX+tgbqLj7N?=
 =?us-ascii?Q?V3YukhKoawMW02UHKsA7qsvBmr1LLynjJPhA7mxDF9LfNL+Gdg3cqwneS7EG?=
 =?us-ascii?Q?/KPurgrC4UY0x9GcA0JiOoSmwbcRrAvtWX0ea5LLi4hAhjX0waeqOs98zty6?=
 =?us-ascii?Q?OWQLUTOB6SvU60rrBCZ9xVfaQ+PPBroCYxlWRzyFa4Z/hp3kdeGpW1EpFylz?=
 =?us-ascii?Q?Y6M2IU19mpTFo/smodjca7KVwk7wVYSIqxfv3k31HPHGLBgYuHIk2uN7Dwen?=
 =?us-ascii?Q?XsDE+/3ZUqiYCHlasg3LG3g0x3vNPusnU381HrAQ0pYxbZ5Z7i7KWWQTPcGl?=
 =?us-ascii?Q?A4eyLaq0nuOPxiEMdYMojtJW75K3a4QsXX4B9ayZIfPvH0NUwzL9LP8bQCQc?=
 =?us-ascii?Q?mvevZf2wDHNrS8PE9T1/xmC1h0800ch8QFVxXkxb4nf5v0kGRTpnpRmUUpQg?=
 =?us-ascii?Q?U8EtTwMBej4Lk9UBk1HaJjVws5FKd/NI6nd2jL2h3xcguH0pKQooGLcEln3v?=
 =?us-ascii?Q?7r4Q5FzcNfnzJ0ha27XPcnfuGuiJiPXSgtHf+HJUJAkTLvjuDyK2T7fyeQOo?=
 =?us-ascii?Q?cvqgwG5QRwwLJOsILPlUyVuS1Mhig7RbeXxk0jf2RgoBJVqPqfQElF/xrAL6?=
 =?us-ascii?Q?92sGaHJeL5Nh2hl+m/C8SxN6FIiq8018CjQ5eX7X2lColVd33GXzY+BtaMLw?=
 =?us-ascii?Q?5Nxmo1aiOFgSMRW1f0REZcXT3ibvJfwem3adI6ScjCoink2YflDnK/3RK6Qy?=
 =?us-ascii?Q?CynwmeZPBXGNnjAW4BarH1pU0XF2uRQ4ANl2QZcagUBg12rPZrrM6P+osWxs?=
 =?us-ascii?Q?tnAqEAHR5QA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FJ5ZMcdgTBEcO2iI78BnjfdGzPTBPJUzAljQYxsjx9Ba7j6vJA1IOwHF6TLB?=
 =?us-ascii?Q?YaF+APJ2c7zfgvOQe0zKAr+HQeoeOeN28Y3nUKWFKo2RF5ueFiB6IaCXr45b?=
 =?us-ascii?Q?2cu75pZuTzFp4lL+PzJ/NRLt3lpMIEOGynzamIhJGLRGD27kptNp/oHr5pK7?=
 =?us-ascii?Q?yOb7OPIvHCojoDPfPDfw9rQJ8QeLxYhU1m3poCbydWZbdozj7KMIL7wpFsnC?=
 =?us-ascii?Q?OiDXvpu7HxmYELFRuzpwR9F2vNznARLHoO4jmkMlK6WLqP8kEBUp6qCvmJVX?=
 =?us-ascii?Q?gQpXUAW6XWVogoFiGZ7ubcPsronJ6fivo6FFylOZj9agCJnX0F9SAm7mC8lz?=
 =?us-ascii?Q?Sx2KkjbYcIb4VttdjSBm79YUsaqPujG9kzLFxParM6ONy69MFvqhIsp59YW4?=
 =?us-ascii?Q?m26SjL+dq+W0JH50ud/u/b+7bDz8212dIfnA1nlQMO/2MS8MgeC4gB5inVvL?=
 =?us-ascii?Q?sr6WT1MvcvL7Hbm6udiHIGyq4Bad/KEjn/v1J5Mcq6w5Y82SwC3rOkEhCJwJ?=
 =?us-ascii?Q?tXLFSA8WpfBV41jNMZDwquJB/4q7NXxvA1Kr0o4hAJao58REnCPRESmG9Nj1?=
 =?us-ascii?Q?NDUghnKEmpfp6o1NAHo3a+0pnwbu72BZ+qUAp8Kb31xYG9WWizYaxy8O9Cwp?=
 =?us-ascii?Q?baWX01LBbypcugrK1tTTAXXklICT61SYhLBj1ny88rjfpReapthMbHEXAter?=
 =?us-ascii?Q?p2srR0F/TaXIB+/HsIQb5LN8fAgr+fanTIzI+PSfMqBSQ+/SQMxWSHW3TkC4?=
 =?us-ascii?Q?PNWr2O8TWeEHF9AfQs3wPrmiRSq/N/kJVBo/WbMjEcUtkFms64V9MsIxm8up?=
 =?us-ascii?Q?HUkvv/PcvDI6qnYMrKvWaRH0j0AihwTxwrN31bnChpc6rCWFqAScFl253XA3?=
 =?us-ascii?Q?rA4snPvSGFypZaNGY1KASNfByAujRaIdJLivzG5oz3vYt7fUeY1TeApL8UG4?=
 =?us-ascii?Q?U/JpaXyg/QudoTFfTgi0IPct9gN9/atubsN3E2Mxrt3TK38oMATis+DiD2JK?=
 =?us-ascii?Q?rkZ6hAGQFORE5/srMjB/E4ZSZG+mhcpPrd/kZTB7bEIPqdJfAIR+P9MHrsRs?=
 =?us-ascii?Q?SV1sE9bftXwwLC9SknX6Gz660meLC8ODIuxM6nS4oQcI54XQ9Ve0R9bWxb8a?=
 =?us-ascii?Q?hMG5tnLP2EI9Kqh+hcnxRDLshj7Xqyg4OD1bCEl8m1lQcBv82ZF6YoIhp0cr?=
 =?us-ascii?Q?lSkIHbj+ItMA7H/Hyc03mvSF83vTWiiMAUxHaAUPXit0X3LJ4cCSi7ve667V?=
 =?us-ascii?Q?vqkuIaI4wUkTvHfjkEIjcQxt2MckuK7vzaO5N5REg6xlrtXTyarpMW5ESf5i?=
 =?us-ascii?Q?phNZoR9N37ARZnWQNVLXKClfD36g7ozLnGJ42c7yz1BMUKOfPnXT/dZmJSkn?=
 =?us-ascii?Q?q+3bzawgfflzA0fPfb9g7Wa+yJ+ZxHYmmXVjeyjMXH1U8IPdJWeBmIyzemMZ?=
 =?us-ascii?Q?Nr/bpXcggFsccBm9iInGjSZseJfkjbD9xe6evSqmzOv2qsFVZ3PfzcNnI89t?=
 =?us-ascii?Q?mtN8fz08Y69CdMjo8mlT2Xl/olXRNazTJhg9spqdNwmEePellgmgcDAJZu05?=
 =?us-ascii?Q?3f9VnW3fW8oRCWvk1EhiD+jEz7D7q7tplTEteyA4dYH3A+leEKTujAyKjEIQ?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cd5b31-cd35-4351-e9fc-08de3238cf28
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:54:30.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYPmVVa3VjVSMDlJAzfpEfg6P3Ua2RvwEe+tleP+lm9ZbeTOPkkJGgk3rPyJ0WmQA3TIA/p05qFVRRPUBOxD5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-OriginatorOrg: intel.com

hi, Ingo Molnar, hi, Peter Zijlstra,

On Tue, Dec 02, 2025 at 06:11:36AM +0100, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Fri, Nov 28, 2025 at 09:42:04AM +0800, Oliver Sang wrote:
> > > hi,
> > > 
> > > On Thu, Nov 27, 2025 at 10:07:28AM +0100, Ingo Molnar wrote:
> > > > 
> > > > * Peter Zijlstra <peterz@infradead.org> wrote:
> > > > 
> > > > > On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> > > > > > 
> > > > > > 
> > > > > > Hello,
> > > > > > 
> > > > > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > > > > > 
> > > > > > commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> > > > > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp
> > > > > 
> > > > > Not sure what this branch is, but tip/sched/core has the fixed commit.
> > > > 
> > > > Not sure how the test-bot picked up this temporary 
> > > > branch and reported it despite it being gone from the 
> > > > repo, but the branch hasn't been in -tip for days.
> > > > 
> > > > This report can be safely ignored.
> > > 
> > > sorry for the noise. yeah, our so-called 'gitmirror' mechnism fetched the
> > > tmp.tmp branch about 10 days ago, then it merged into our hourly kernel to
> > > be running tests. so it's kind of 'stored' in our repo.
> > > 
> > > since the bad commit caused crash issue on various test machines, we made out
> > > the report, but missed the check of whether branch is still existing remotely.
> > > 
> > > we will refine our code/process to avoid this kind of meaningless report.
> > 
> > Might it make sense to exclude all branches named tmp ?
> 
> So the tmpfs project might disagree. ;-)
> 
> But a '^tmp\.' prefix exclusion pattern should be 
> pretty robust IMO.
> 
> > [...] IIRC there are some patterns that the robot 
> > skips over, but I forever forget what they are :/
> 
> I'm curious about those patterns, although 99% of the 
> time I'm *happy* when the LKP robot finds a new 
> development branch that I pushed out, quite often it 
> will find bugs that my own testing doesn't catch, and 
> the reports are useful & relevant these days. Beyond 
> the bugreports the 'SUCCESS' reports are useful as 
> well, as they can be used to phase the flow of 
> development commits. So no complaints from me.
> 
> This tmp.tmp case was an exception to the rule really, 
> and given the overwhelmingly positive net utility of 
> the LKP test-bot I'd just ignore it, especially since 
> the LKP bot was technically correct and the crashes 
> were real (albeit fixed already).

we do have some default pattern for branches to ignore:
default_branch_denylist: (.*experimental.*|.*dont-build|origin/.*|remotes/.*|.*/orphan-.*)
(https://github.com/intel/lkp-tests/blob/master/repo/linux/DEFAULTS#L5)

but we also support repo specific configurations. such like for tip:
branch_denylist: auto-.*|tmp.*|base-.*|test.*|.*-for-linus|tip
(https://github.com/intel/lkp-tests/blob/master/repo/linux/tip#L19)

the "tmp.*" is just updated from previous "tmp-.*" to cover tmp.tmp
(https://github.com/intel/lkp-tests/commit/acd36193a0dd2bbc1c6d4ef59dd2b33a2eece3e0)

thanks

> 
> Thanks,
> 
> 	Ingo
> 
