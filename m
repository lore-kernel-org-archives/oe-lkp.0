Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B911DED63
	for <oe-lkp@lists.linux.dev>; Mon,  1 Jun 2026 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282059; cv=fail; b=UlY2tW8E3rDn9QedctPggUF9CJt8QpHHSqogkmQuko166WBVpLpfn4MZdh3iKnvXw7W+G44r9Y+MhKAXehoTHAn6QQ6G8VEmEwjaUk+Y1o8SAEOu0qNCAqqGjhtGB0sA2yArcRWR5WxUhP32XiG6PXgytIZ22U2T6ujFUcQruFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282059; c=relaxed/simple;
	bh=7mAA+1ZPj9y4beQu8AgT02iWuqKLS5D5SfNEkOeeQRY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KlqO5eRQeUPcJoORTK+U1zpsP4NRhQpt3Swl1NF6V39pfZsic4ko260Y2U4zXOwVizKMF7ZLx3ku5+JZTKPNng51d04L1xvafkHryNvX9sLI6AYdQRR36NeBr8XSO2XEaNVPOZHZF6ln3ucjgtRz38/z/6jwr+bvEiSs4OiwIWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBI0mZEX; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBI0mZEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780282058; x=1811818058;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7mAA+1ZPj9y4beQu8AgT02iWuqKLS5D5SfNEkOeeQRY=;
  b=cBI0mZEXL4ETaiJh7soF8aTw3PQ5Rk9eaCob51Vmu8p1VtwdXdl3qdB4
   gP/z3Tskr/ENj38rLTs8EKwVLRW9dPwE2SEVfv1hGvWD7WMoxoKrfD8S7
   TZFecbloOxaJIDaelwX3Ruc8T5UyrXUoH0pkdKTpypzXxpaS3y5VJQWCH
   gkU9REUsgRWWCplD/EWH3wOpgOEE17qyZaaP3YxyM4XQTzTcotH16bRYs
   OFf2ajqcesjAqpK2BywSMYJvGACKCGNPuNY/Ux/Kyg1Ob0wztG6e8JkgS
   pD3zD4CHahkujcsP7CaXU7+gnIRhglNdJBedrtPzA+yffm5jyaaCcT+mL
   A==;
X-CSE-ConnectionGUID: e8tonHO8Q9CgP6+CMJkCZQ==
X-CSE-MsgGUID: 1sQdS107SneWmVAI2sPx3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81094550"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="81094550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 19:47:38 -0700
X-CSE-ConnectionGUID: aDX0VK1iRBuxi9R11/Gz5A==
X-CSE-MsgGUID: axczFNZ1SwWIO0pnOSF+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="240445990"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 19:47:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 19:47:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 19:47:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 19:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7X+P41E8Nt/n7W96jZOByTi0mjcr1cXOEHuBZ/dFPckGXQxusnquI6dAiMpvXPGfMOO11d6uTX3LlOI3xH7F2a7MeYBug59wi8WauJL18/UxJzUwNaAiV34u1rPUzGN/NEZPefuD1QFE6Mz1q/SoLP7b5TkiVKti5yNCNAVwZY3qHaPRtZGmS6heIqOVxnP2zHfioBy5xyDAEyhEX/ezsqcfZn5JDkSr1Z3lAeFpgwyf35by6E81s46INh9PzZX8NIMPwN0WOqdn8eGg0SAcNLznLNg4RgVlxBZVx0ea5Egp2HMIhAwuhxe5ccsrzvy7xjQncHlGaeAuAaWGGaw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bF6ZvvWdGtVMHgjlWkVvPy6MP+QmvDCrLqS9/ONScF8=;
 b=tYwvTgHRm0NcRRti3Zs7h+XBWh1X3ceis5BA9XR0qpn7Lk6lNcfhrIZ3uMKQhqINh2Lqfq8BVi19P96+5aqf2y70+qlCbINMrLyy97xzwuOUXczzGrIRPTN6kFG6oxfPZiQke08qww482ZbULj027w71Rgn7hMmUDftY2vxT1F91+Qt5GNvNbhWTnCP2ieciumvpBkuRua+YlorwDHskJb7xOkmQOFpbpUvZ6ktElZ7vuznTPr43cmlBQGcR5itDux3i5gIA1T17zd7Q5dphLjWBRoaJSMBGPAUjsCbSS+BZOhKAHe2hTVAFrUrq7NtdNAJXjWhMVNb7pNq9equh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA4PR11MB8890.namprd11.prod.outlook.com (2603:10b6:208:55d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 02:47:26 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 02:47:26 +0000
Date: Mon, 1 Jun 2026 10:47:20 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master] [lib/Kconfig.debug] 888c290a02:
 BUG:MAX_LOCKDEP_CHAINS_too_low
Message-ID: <ahzyuNj2Xhyyi5Wm@xsang-OptiPlex-9020>
References: <202605311625.72d32001-lkp@intel.com>
 <158ffe47-df83-43e1-9a6e-b2ebd4dab5ee@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <158ffe47-df83-43e1-9a6e-b2ebd4dab5ee@I-love.SAKURA.ne.jp>
X-ClientProxiedBy: TPYP295CA0011.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::6)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA4PR11MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 67770a23-7208-4a0b-daf3-08debf881d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vX0GnKeGJVfgv6/iwy+UufaIY0b2o8RexMR2zP5DwArRKOhePyadpCCM/KPanp9SqnTA3EyN9j9DOA7Jmxg+4yLwlkFE3Nb3wmZmQQJ2dH/nGUGrF71ny25i+fEXrbNIW/bgjMKlz3St4Amy/P6N5E4/KA5BbWtW90VbuKTtIwJVeBVgET/yAmW/uOG1E70CqdN2zhfyxhQCs15o4EkOkBZWsMyESXJy8Ecvm2cqNOcQNrROItRnM1ZPgLlNvCa980emDrJt9z6wrHazlwDHQ4ggNOJ+hGpf0rQJz9MwgFjskhhcjpwKeJgQ9Ukzg6TbskQizzOYF4wj+l2ob5GToXe5BroNCe+yhyIhDN4i0/K+0j0F6EeAsqtwUMhQJoaCDuCmS0H2I+sh1JwK/pzH7TMOFgbr5+cj4kaUSJo7xua/wZIinxiIzMsWDvRC/9YKEx/Qxgv+3svIlWfL32jgjxDL8nnQp3eJ/1OJU7PDsB05QEafOPzzPttqMh/STKkZyFb/MNrBvvzDi+/hbBjB0roLB1ZhZ66dYFuzr8PIubVFEDjyqQ1xAXG99yeMU0LQfOY5s6Gw8JbOW4qI/KLKb+9uYO3ypawXV3ckx3Jet1vl7Ybe6yEmOzT3DYZi81LbgnW/5Pq8ekVgwEFYmCcTVerG4h/w04IXx20Tde904cKbYS1xMRKfUuZ/3oEiImiS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SR2V9AneOBnEvRQR1DKcNRI8NY52rm4Xrl9+VFGU6or/txS10DAwSuPgJo4I?=
 =?us-ascii?Q?JNpUVLgkNSXtD8smCqN3zPy5Fc7FtFfE9bwWBIVlWdyY7jV0dAKnUI4txPCr?=
 =?us-ascii?Q?krlQVzEyT6HUqWWhrdXhFbnO7YWcUh1oEGpr76OyMR2gxLFZV3WH6bs7r0ON?=
 =?us-ascii?Q?0E8bHsMI0pG9xFeI/HOq5CFgrq2hI6dqeO00GyC36mUcpUBr0zHv8TLGbE1U?=
 =?us-ascii?Q?F7QWLShN+IFOzjIAklEfP7rDdOTNfmZe8wVYBbNwF6GE3PgobydwKxuZJLxG?=
 =?us-ascii?Q?rhzg1kRERT3hOjHYBjfDqI/D1giQSJL6TINvwUvsWthDReWBDPXkLLkD2CF/?=
 =?us-ascii?Q?m47EIQNwEp6FP6tK4cBHivgu+dvtR5leFXisOPGJK4xt31zEp7IeP3wZGWMY?=
 =?us-ascii?Q?6UqNEjEAEddkPovz7OKby3Ja+P5Y2pXFdJbSTaeqTQbMJTaRN//pH/hd3tXA?=
 =?us-ascii?Q?9iti18AJgDLsWqqGZHHOMRQoZdSS0I0joP/5Zup/CcZ5/ghorZcqgFSDHjeu?=
 =?us-ascii?Q?V2ZVbnDc6VNcqeIkjdTH7EQ3+/XHNkvNd7dNgVERVVvfupEIBMYUtFDeTUoR?=
 =?us-ascii?Q?WljQPU2NxklsjDSWkCx8p/+vZxv8maOU2WXN0QsQtnu2FPAqIGHF1fJ7u8X8?=
 =?us-ascii?Q?Y4y4xmQ5a9F7AibMPS8ry6YyRcInQBbZGNjC5NpVvYXYFN+rX7hvJKZiol8m?=
 =?us-ascii?Q?3ZYzUvc0+Q4CHjGUssqVSgWY6y04fhCGw7oRKD7eEUdFS5mld1XqRqNWmMqq?=
 =?us-ascii?Q?QhG1BNRrkE8hR7DgUd718cm+A4DVHsOP+R1WX/KQ5Qwo2xIRnEYQtOW3Y8Vg?=
 =?us-ascii?Q?ziV7TNitFpUq9Dpm0NdWCm1k0YaSpGwLnmBFXPSmHeEIuSoFTdsFaAn5yqM/?=
 =?us-ascii?Q?8DD7xw3smnkeoyM1LGqvQAFV/JeZVVuTzbuHJvqYbOnkAK+yFmJP1nywaLVG?=
 =?us-ascii?Q?INGtlgdQRslBsw32oR/uZtVvEisE9ekiRRxoOQeELj4gyjnW5CRtnsqBBtkz?=
 =?us-ascii?Q?Twpj1bK6EimXyPkDI/HUL2aqqXv+UziPZAvqUqXyh+97+kqxN9/kTH36bZFR?=
 =?us-ascii?Q?Dbybn3T/67uAB5dFzuXZ9yW6MkMeR44YaASXKAdX+rmmBtMzkokWFBOZr0RI?=
 =?us-ascii?Q?NaLr0E1R5FfnjCumvzxXJIeTaTQWlrUnFWWQVov44wwEV11ozEOBfEoV+XjM?=
 =?us-ascii?Q?iIzSKX2JaLtQnR2m4k+kEcnLKegXVSPNOFFcgsJdXSf/Tah+a9ONnybvj8e6?=
 =?us-ascii?Q?ZgG8oLX+5+38Ib9NZL3o8/mrDxmJMLPAd+EHC26+umluPMeK1eFeP0Kwn6Ng?=
 =?us-ascii?Q?ZE0PyRkCU8dbAXZPgwqLwL7CBN0fZ7rZqbYVGezROhb8PnyI/jB8k2yaJXDE?=
 =?us-ascii?Q?oz2RSSConWUHGIlAg5+LCvdVRUf55shHLMdhTFGrAWshwTWo9SbEqcV74Boh?=
 =?us-ascii?Q?ObMDiAveXmrhfwmDvmsl5uADaAPfJ0gM64x1h3Lviq7yAocNigBTsMr/3Hp5?=
 =?us-ascii?Q?1sJtsLhPOF3azoMhHPEwIEDRX/H2M4jGFAxNO1x1Rf+SMddPcohXASZmLlxB?=
 =?us-ascii?Q?AO2NxV4Q1B6PkuHuYlH6V1okvzJKHcjNpbtnt5USOiiDDszXYaJGOxsLXV6k?=
 =?us-ascii?Q?pj+VXSDkCkm4NTD9vsrrks8xG37BsRlFL/0g9q6EWb2xfbPVVGlPtpLpgFj0?=
 =?us-ascii?Q?NsRmUOs1MaaDzGIcVOz3b4bG9FFW9H/YeFObWgzLiihC0GIaIbTXfauyD4nB?=
 =?us-ascii?Q?QB0Hlbetng=3D=3D?=
X-Exchange-RoutingPolicyChecked: cvAD9AOeyDO3X93UvcFNFvR6hU00dJGmcg1YbKK3oF1cU4AL0SnDjSZfWkAAEja415yAS8CjkDoQAhIEEjx/5TkqEm1bNe5z3LHheSdOfs/jjtFyXIPpkc5pSx++emPi7ePJ4rQ/6HA1zL+6m/vaGFvh3YJsnAAaXTiVuBWgIhzwWYvGGePTgsvwLWGXe+u2G8HDsoQbo1M7oxEay9xqWqvIkcHxifPysT8Smb0Q3xyf9amEHj68SnMb//UjVxgoFm8rOJHPxdpFi3FT01Z8FBRC00I9vLS4+EEwZcLp+Off/91s7NOv0Xy+jHxGhByETduXjCTSlkHvcSfwdeBBsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67770a23-7208-4a0b-daf3-08debf881d9d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 02:47:26.7578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzbsOy6Xnj1qMrc4vRVv2xY89YGwXBPWKlby8Cq9xKNT8aJxwCBUA9hwLP5eR0fZ3rHpn7qaReyWcGuHz2lBmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8890
X-OriginatorOrg: intel.com

hi, Tetsuo Handa,

On Sun, May 31, 2026 at 07:09:28PM +0900, Tetsuo Handa wrote:
> Hello.
> 
> The "lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels." patch was working
> for a while without problems. I think you can test with "CONFIG_DEBUG_AID_FOR_SYZBOT=n"

thanks for information!

> to avoid this problem. Can you tell me what your problem is?

we don't have problem. this is just a bot to test/bisect linux kernels. as you
can see in our oiginal report, this is a trinity test with randconfig. and with
888c290a02, there are some expected config diff then we just report what the
issues we saw in this trinity tests.

ok, we won't report this commit any longer. thanks

> 
> On 2026/05/31 17:52, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > 
> > this report is just FYI.
> > 
> > as we understand, this is a debug patch. and by it, we notice below config diff:
> > 
> 
