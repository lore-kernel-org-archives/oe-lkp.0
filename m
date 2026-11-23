Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795417861;
	b=qJdY1PTwuixtdp95beNNU3TIm427cQHk4vQwJ3B+dmdfwL/5hU6NuLh9w2bdlDkphWo9
	 LKVPaNVP+/8nvSO2GApwNpf5hhu6DSHd0C/6MA4lMG7HMLMLhp2FXEW4RB5+mTl7PbYDB
	 vgfeUYT1ERZxgFYiSNdGQaNrNOKbO3FClHXCRY0UHZT25kEq8EXoma9ZVOckeVzhlOm2w
	 JrDEKwh0Zan1yYQrztB2K2MUl22MjX8PjvdG566BQeaG4g4PB5pxXuv9QE5kXCgY8ALl/
	 WbXjG7+53AtcL7104DSV4X45RHSKzdf5ANZkVNWe2Wcijp/ZTA4mkHUsSGiTLgTMvZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417861;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=56ngRHOPavPPMWIA0sui9O2a1alHhAeRxIW13fKq7jE=;
	b=Lg/RyJlm4wAZUT+7abK9u1nL+Aer34i5zggVkOEzJoAfQtLgTNkfGAEvho5kn41jVVn8
	 L60ze18r0SIzSkVuI+33MjUIvjBPRw1MXprOavsosQ1xLfUokJ+QK0/1eD/XZw9PwM+Aa
	 vRfrg24BzaMLV5KXF2H+a991Vi8TsMLnH4RnZn/oX1fe+WqOqd8zVJVdTLwebapJv+KtB
	 RH6vwb0wTucb4R0v9OhNSyg83SIWZ58nQS1X+vkZ3rveujpTcTB1swqCb93+hYgnh96RO
	 Q4465Hgzz1znDsxYgoPDqFxklrFlJMNaaA9mW9VrU/LkrtcBsD0T5tuows2jpRb+e/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHDqtszN;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=at+6E29p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6F606A31F
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 07:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B6F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHDqtszN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=at+6E29p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795417860; x=1826953860;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s50ukQvUI9CDiyzNHZPmxC/B4Dfb6KbePqsru6Umr1k=;
  b=mHDqtszN85HynpWnk4M/81jKnDtz3sJQtWa/+WemsagwvRxixqdPczuA
   PiFgkgD//eOm1rmseQqbYX8Qb1JXjSxBETzhm+Ix3/xeAsinBO9vVostO
   5nAMOr/LEli60dfwD6KroPDyEhpCOhShZUT408bnZHS+xTnhvn8W0z22U
   I+kmw3Lh84kJmgevLu14vbRKjWUCLsIeHWymnQi7alyfpGcDp5yNhVh8g
   SL2/fCOXoZ85F4LTg53k0ElJHS7vBTychxYTHN0e0qCJ6vL1fZEf/+RPV
   XALbVBWFbahhNgiQQqd3rOQeIU0FQY6Puz7VgMDv4fxkm/vGULz3oqn7R
   g==;
X-CSE-ConnectionGUID: SWwMre6CQgSC+OxTbRQlJQ==
X-CSE-MsgGUID: KimmULo3TMCgw4jFef6Ifw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4303634"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4303634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 23:10:59 -0800
X-CSE-ConnectionGUID: 3SLJDTrNTAqkNVPDBtxs4Q==
X-CSE-MsgGUID: SZgTwv2hTeq7PbpLi72xVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11174641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 23:11:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 23:10:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 23:10:58 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 23:10:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBFAxKdP5yb4yFT0j8omYMPji31YCjlqOWms1yH5QI8Hoz4Bs/wMMPJ2uuzxiQC1ckxcgg98lBbyjZSgUtIxExBNZWS2TaYO9Prpq9G83wfky2dZy4B+uErpoQO8O0t89Rix212SypUdX1SVZrI2p1bkQy9bSSJ30AUyooduJQtGNqBD7BfI6TAlbUHbBLIhojeCRZqCCAB2bgrp55IxsD/MB6uodCt26pqlW54gEGEb63tTbLQSE5YXVSsMu4FTsjcKWe8v/qf67Z7WLDHsg47W8CaAV8Doo2oN8DXJhKmXNDGLbJEK2TBmYXM01DGwG1Qt4lw4+C96Lf5kG0HF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56ngRHOPavPPMWIA0sui9O2a1alHhAeRxIW13fKq7jE=;
 b=bHRZ1tszoWwgGYy9G48tFHOlouF2Mz5mSgDgQDcynoURjavydtLHfq2sXretU/n8j3+ovnOQTTzpS8ksUm9WQm5IkQw2G76I00xmgX2vEEk6WDdr83Y6bRCOZqrAvrcJnpyfGURnT+cTvDi7JbWa6Z5XvmxYf6cR6No6IYOHZt536eVbSpzFaGqbbhFXXrR9A18AwM5YtfywS/UDR4Fcwmxc5xyhVP4JyR98+r/pK/PQMsgJZqX6tCgXSbIVkCKrKE7XWOIZYPmHh0FvuWQ1aBWQW38byk51SubBpBaF4OCDvCwTEwEo0R3v4mRPkmOLInP+Rzx8cVvv0mSkCsoSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56ngRHOPavPPMWIA0sui9O2a1alHhAeRxIW13fKq7jE=;
 b=at+6E29pv1DXNZFGrzpSzP1xtSpBx1QcxQ7H1RGO+ME6ds1aO9wQOiXXDXyX/lME+mxmzwuVU0STtBVO3A/4ni3cCuM0CNAvv7K8Kz//XgTiCV8/2EngS5lTSU9js77yPNzYtMDlnTK9Y06PEdiq+aLeYOr9dHPLq73UyOc/yAw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 07:07:53 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:07:53 +0000
Date: Mon, 23 Nov 2026 14:56:50 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: kernel test robot <yi1.lai@intel.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Peter Zijlstra <peterz@infradead.org>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<aubrey.li@linux.intel.com>
Subject: Re: [linus:master] [sched/fair]  486c3d06b9:
 stress-ng.switch.ops_per_sec 33.3% regression
Message-ID: <awPjsi/FiElpwjM+@chenyu-dev>
References: <202611230853.e2e6401-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611230853.e2e6401-lkp@intel.com>
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: c44584f3-8370-4c68-d796-08df49307ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|3023799007|13003099007|11063799006|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: RrTig1BrgWUTlvH3EEAfbco6ZYF6iHVslTM3v8kh+Rlhp2KJkHLY7XKgXCtVI4O2tg0Ev0bZ7haNhznH3D94rebIhoetZVY55shwwp86yKQ8zuyt22oowzSjWI/8QD14VAk0TgIe0rJK2bZP8Mk5iECeEXaNSYR+M0qp1heMNuRKy5IAAVsKID0bntxokwoRHZFgsidoD/Nk7M6bOD6NzjG/WwMNu9TkpLN/GFMBao+iKTdPzmrbmlsWTt2FcUF0t2B17yf8I7xMyk8VkeZYQA00g4MTlH0vtldPLhLlp1e+AcwCVQBqQShtlDkDEGj712Jp6LPhK1rKJDNpEyJngo8gIZr94sxHYwt6UFtX7ZOjGhXXR5I2CzuwWxP1AktIlhgPZUefrVROBjWLPAr9BgtqyCW0LJivxBjTbUKVESIxq7fuXDtMnCj5FacfJGzQ7a0T2hAtK6cuaa+ER2rFTI9Q09H186swAXNGktxwGm6AEvkcvyTl9vOCg5RFW5YKS9kIutL/R8gCC+jXwgGmGWoJcW90go3gva2aJDAg5cfCdAsBv0BnHxtC+RAIHj/FQUNBKtaTVuxOH47hfpVpH5Ynq2usRC0Tn6w0FSdSn6vysAXrrR7niJLeOkGqN8Tx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(13003099007)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEvXiRfzXGaOJzl7Fc1pgO12DvcjlzGpBItJA4GHJFlTXp6Cw0FHdmmSLwjV?=
 =?us-ascii?Q?2B1of614mDmhUqkVgI2I0Wj5ihw+lcxi1qSEuMONOHdIZH6VwZx+dGTfFCyj?=
 =?us-ascii?Q?Gwri4nG6VodnuxOvX9506DX+zW8YuupULIWLXnSko0iT45a9jPUpgmtWzS4T?=
 =?us-ascii?Q?IUST5SRd2AvvI6IXKB7tQ6IAU4qvc/bdLOpSoxrPKxLdOXAtRUz+tW/tG/Os?=
 =?us-ascii?Q?1XQX0B3Ffqjo6QVoeSPtcqZlcCDBu0SiwHtY9l3fnf36eLXuKGLNQGGzsLPY?=
 =?us-ascii?Q?4c9MTWJ4paO1jU+BoQaIhnIP+eW6Lf2E7h38acJBmgWqzFxkC2eJSKaRUzi8?=
 =?us-ascii?Q?vreltoEiYZ6J6ATqT18cTE9cJCIMu44Id9w7+EqXy16lRyZ6w6mgyq9Mr+Y2?=
 =?us-ascii?Q?IWrXfJkYfAogJ/iZ1oUAWWDgpU3B1fIp4FjMSljMfK30t5xWn3gHvUICTnYd?=
 =?us-ascii?Q?VtI6oMcpXp9JA3WiIriqdw1me1Wkm0SEjC4lkqMftyR7Vqe+Nqc1un5d8mSO?=
 =?us-ascii?Q?jB+pcJehwQYdf7CWoHd36Y5F8XORAdIQ3dprdCthDXsI/QIMrvCGNp+5gfxb?=
 =?us-ascii?Q?VN/7Z+F4Wc5GnPMqazY5h4RFuBdrldzcijgU5U2C+n1qc7gz5pWyyTjQ7nvD?=
 =?us-ascii?Q?ZnF2tMgERJkxZ8KrzHcHpw3rlbrlwJIi5Lqh8xNU5aKV9qE8Tz8pE1WJt5/h?=
 =?us-ascii?Q?+TQYhvc3Klme9wWSo1HXt01jD8/mHCOZPyDuQujsF60I8b0YJcikZvJwaBoh?=
 =?us-ascii?Q?SPSYdwfp/ePM2nkiLWGu1+8FC3IGhf4xRSG7eB2lQA1tjJym0SZhycPfIgHj?=
 =?us-ascii?Q?vfEKOquPbsWb1QcmoJwZwnQBQWTTtSBxaA5NCcTRgdHIgtJmO68v/4ygVGJV?=
 =?us-ascii?Q?mdpVkNAtBYQ427teaOkcS/ttt5iRea1NLS7/O2dsOS5y7K/A7u9gAZ4flvlz?=
 =?us-ascii?Q?+tSkouEuK1wcI3+07J2nkfb/LgYpCfG2Ut7lBw79WQIR9oUzFGzVe645wi+k?=
 =?us-ascii?Q?F89hdkpO0OVgSXK5Ko+jVDY+rxnHyPWMXmaAk2dcX0rW5JXKfMPzwrLZhpr5?=
 =?us-ascii?Q?YpuxvcrvVqHliW/5i2ivbVXgG3NT5uzQ7HoY4219xXGEfwXjO1EhM/pdflv/?=
 =?us-ascii?Q?+5vfTDU/VT6iFrGzyVDg4MTtWt6HqgXctliwBmvEJZywgQducV/U3BzWRsgd?=
 =?us-ascii?Q?5pVJBASqr7C8isa3v03YG05AIde5AyKtQZE9ttcVH4zMvttvtcSNTYjb0aah?=
 =?us-ascii?Q?qxWjgWxFhY2ErbnpjvxeOvt1d3dVLjLn/8Q6+iShHHje3wXIUt+kopt4Bdqw?=
 =?us-ascii?Q?Xicw8vRg6SSSS8m+5M4b1wV+ysKLw/AqhA0KIPrf2EoljIUSGIv4JliHy/Hm?=
 =?us-ascii?Q?DhBGIC8izxKqyceKOTdEebPw+iYMnSN1tEstvg9UxVHmPlMINCJTqxkWrCjp?=
 =?us-ascii?Q?w2thLbGjP4bdabTmxBZeTMiKSTCBJwOjLefTZRHMJMDoQ/27UEeBBEx70j0d?=
 =?us-ascii?Q?uER45wjYS8PdfoGXSXihUEW2do7LQuy7eFqmCt79B9WBNTx1RiYvzm6QH3ys?=
 =?us-ascii?Q?giYL2th0fxBq9laukpRSaPWlO8aP//WOIWHYl2SfjSg9UZHRgxu5gLvS4V6u?=
 =?us-ascii?Q?NgnbPzsXFucxvWlqmpa523ToIsnkKsRY2OFBa/h5+ZJr90+oD6DE5/ymKjGR?=
 =?us-ascii?Q?QrhuouG9oTi9e5iSBd64OR8xZt7u8zkLn1xpdKLDa1ya6BSLFj/UkPLn+XiQ?=
 =?us-ascii?Q?8Pu937VT7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: goobZpQZ+Tsn10RDwX4FvEWztie6V9yUaR+ePvRjVZYP2Kn/7xNiJ6u//TaJyb2eALsS0DSW3HY8is0rYjtfAN+e3sHNU5Ql3Dx1mgzq8420HHMBbRQEC64E2q/sKn/PQJ7HGgy7z78EG9QUf6IkonM/tcKeikh+ATwF3ad8If3cw/kqzIfcDE4e9d6V0vyTn5/1tpdsSLNMlpV10syivvUDfjjZeL4PDhIExAZp2lQEGwW2N46F8A4U7QAfQhTa6S3GWQsFkXH+7GXxZhfDv1tjJuywa6pF3WLRG5k/2QPb2j5M4AFzu2njV3hSnl52bNtyRryptd7G82jR4WL6+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c44584f3-8370-4c68-d796-08df49307ddc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:07:53.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQeFTbKCoswol9hnTZbhYUoz8VoPS1gM4joq1IFX4BBUcitPZidEzrQ7IumvcUOaBNR4KpWbwqxGTPLZuyHqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 08:47:54AM +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed a 33.3% regression of stress-ng.switch.ops_per_sec on:
> 
> 
> commit: 486c3d06b90240860e99686d29ed9f15637dc314 ("sched/fair: Avoid transient double accounting for delayed tasks") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> parameters:
> 
>   nr_threads: 100%
>   testtime: 60s
>   test: switch
>   method: pipe
>   cpufreq_governor: performance
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com

I fed this to AI and asked it to reproduced it on a server, later AI told me:
-	int h_nr_runnable = 0;
+	int h_nr_runnable = 1;
was missing in dequeue_hierarchy() from https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
when merging into 486c3d06b902

From 850d8788c72d6ae459034b85584cd5ea01df920e Mon Sep 17 00:00:00 2001
From: Chen Yu <yu.c.chen@intel.com>
Date: Mon, 23 Nov 2026 14:27:20 +0800
Subject: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()

commit 486c3d06b902 ("sched/fair: Avoid transient double
accounting for delayed tasks") changed the default of h_nr_runnable in
dequeue_hierarchy() from 0 to 1 and only cleared it for an already
delayed entity:

	int h_nr_runnable = 1;
	...
	/* Already accounted via set_delayed(). */
	if (se->sched_delayed)
		h_nr_runnable = 0;

The adjust of h_nr_runnable to 1 was lost when merging into vanilla,
h_nr_runnable is now 0 for every dequeue, which breaks logic consuming
h_nr_runnable.

Bring back the adjustment for h_nr_runnable.

[1] https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/

Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..8a55571b9719 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8242,7 +8242,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
 {
 	struct sched_entity *se = &p->se;
 	bool task_throttled = flags & DEQUEUE_THROTTLE;
-	int h_nr_runnable = 0;
+	int h_nr_runnable = 1;
 	int h_nr_idle = task_has_idle_policy(p);
 	bool dequeue = true;
 
-- 
2.25.1

