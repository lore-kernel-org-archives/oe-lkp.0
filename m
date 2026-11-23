Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795421099;
	b=YgqqppBE5xRlSG9x4Tu/4YCGBCD4KwU7MTt/grNAxl8Z30XQt0jjB/qamrKZtWtvDW1Z
	 bYfCgYApRyTLQRMkhVnDNRVfqG6HgPpJwLfCCjMbX70S0pPjrsMzwhNTYKR3nNSI5b2km
	 ubR5r4EHcq1lrkAzYuN8khRPpLUD2sFomoVIlsepVAG7rAKMesijZ5GZAyzYK+mR2BYQB
	 DeL/+QVwO9Vjnvm119X4bCAZIaJHMxPpmr0a4mcuRW4/JLwAYi8q6w7+t6qOfZp6zUFo/
	 GiJQFSC/9r/EX55oxD4H+MTVyZLoUp1blqHgeinS1nYQxBDSM6aYEdI8I4WIpqTrTWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421099;
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
	bh=vEcTcjTULLmbIr2sRExS+K3zF8Y+imiAhHHKYIX9KgQ=;
	b=r9xp6SOj1+NSl+nExl7+gxYxnhWapEYoZ/Pq2V6gmZDQmzRIH1kAJE+zOI+vz5DrGiti
	 LgeLhcnR/OY1rUMkRu/8exvW86TSGchFvbyDikBAPoItI1ENd+196U0S8QbFapruGXqR6
	 2YdB7XKwiCX/pqO0ku3xNECGdFXoLInalZTHnBBDWp4xK1N5rhEE/uTPa2Yrg8wJaC4KK
	 NefYJTlJqtoE6cWifKiYqSLQYaMfeD7K5y1ggeoR3y0rIqB/ObEmTCbu76Rd3ifnZFQAI
	 IZZ9r8hZ5sVwx+sz/hfR+Ka6pliLoPUOdLoblmeL40xWire3xt3TS2arNKGyyvOJV/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=adpdCJfG;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=el5aEnOm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391C606A6B7
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 08:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8391C606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=adpdCJfG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=el5aEnOm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795421099; x=1826957099;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Utos+tGfhL01wmyfbWNE/d3Jaj0b2nfluRAWaASam2s=;
  b=adpdCJfG7Nc3pY7s0aB/AzNLEZ+2U5biR6Yqe5PQrlMiDhGzgWdwp8+W
   1Xvtssjv5YcYWZXLR1DRQMZks1DjwPQas6Woe0Lp7uvyVJ6WR31hjtZr7
   hsJvWELsiIYOyffYw38/IRcBJ7gG8Qs3FTJBay2XGaJN7tbhFqG0Xe+50
   7wCz6XCSiBp2TE/OXv2GBISfG+NqI6dRrbYnsNNNl0FrHMQTztSDokxaJ
   V/sX8wxQH0eKQxbFB8cEWKWCnGYvhsP9YFT97GAkiCY1qIOjEhIixxEdb
   +9XMl9UIcE14pTxCUIr+1Ovin9WRH/ic/BKOuCKDuDeV+uqzhFHlupzh7
   A==;
X-CSE-ConnectionGUID: nkTwRQtbTIKaCaMCiPWQcQ==
X-CSE-MsgGUID: 9NZeY7coSCGBxpiH9ebm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4254244"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4254244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:04:50 -0800
X-CSE-ConnectionGUID: pDAVzQa5QXyr2LTaWOUogw==
X-CSE-MsgGUID: 2iFqU4XsQ0G21VWELgLmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11797206"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:04:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 00:04:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 00:04:48 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 00:04:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1wqpipoK97o69qaO0NY/tkjkeJwTfn2x2qLBlxTVqLNBcxTwV9qQC9fKp4t4fLKsgyRDn7eHwNv5w0P/bNgLxLchuFZVi0JbJ7HUXi+9LEEBKN1ifRGGHKOvLKn95+TrqfmuVxVV+MtmJT1gMm+DvudOy00T08A1RWzfyLGsDPyMD7vaRknYFbOpjmbVRmAoY3F+SKFKKAGrdKGa7D8aS71aJnZLr2rLc9S/Wv/FogOfhNczxq7bIhTIOUk1dnthN5cjpPVi+wZ2BbMm1fCqbWMa/BRn4Cc15b4SCua2wnNKOcnR/+iVcKetw7U3HJaKCeVkuq7zPIHw+Upq4cgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEcTcjTULLmbIr2sRExS+K3zF8Y+imiAhHHKYIX9KgQ=;
 b=xrYdXW318Det1n5pPsqGBFjp7BUanpWkumsSvFq904yYejOHBnZt9hI2gdSdskTtynqPa4i1MNwAEuXxwa8jo2TzM2nlaFhtpWcHTxzVxP15STWD/Z5IfZW3D5iNYPEmrLN6nOMiccTiZ6VFCTxrTipBIngSEPwSVvETLPzVOLU9OjHQ5U0vT7jspHbSRIh9EAoetfFeFMw69sQ2u08PhofCl+vk5JBbgxOXF32cDjGXr5dYQgray2R63cRoHTWM9AKbEHmzllfNcsipdrLEXRn9x5rC//SRapECMoz0hjLweDsHx8Y628Mb8kjbm01KAp9r9tYAREWwebeKOwAdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEcTcjTULLmbIr2sRExS+K3zF8Y+imiAhHHKYIX9KgQ=;
 b=el5aEnOml1t4FhFoQQ1+SOpRdkH8Yc0HF3DxfkIMQcE84bJgbE7RqH38913/boJzif7XV3fZ3QAhIwM8LQXMBNs38p0UjLGQM0H7oOj5ZJvdNARMkiM4jLY8f0YRgaemOfImBoLcBbsfv6z/JnGs2814s91lTOOHul/sGA3Vn3w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 08:04:45 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 08:04:45 +0000
Date: Mon, 23 Nov 2026 15:53:43 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, kernel test robot
	<yi1.lai@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>
Subject: Re: [linus:master] [sched/fair] 486c3d06b9:
 stress-ng.switch.ops_per_sec 33.3% regression
Message-ID: <awPxB4E9+mhwr3BT@chenyu-dev>
References: <202611230853.e2e6401-lkp@intel.com>
 <awPjsi/FiElpwjM+@chenyu-dev>
 <207b8999-73f3-4173-8a2e-8e9ee3b1a767@amd.com>
 <CAKfTPtCiENFwCzFnsA-p8+zDSh9riv5G-ZsiEU80+4QhrpYt=A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCiENFwCzFnsA-p8+zDSh9riv5G-ZsiEU80+4QhrpYt=A@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA3PR11MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 027caed0-8c70-4464-dde2-08df49386fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|11063799006|56012099006|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 0HaVc9w1JsxZimSotr0Gg2RAavRwJYIZ8FjRZp9f1vthLtcoWP+KWJP3CQrw9dLPofcH/6Y7Q99sJtvBJeo1y00n1tQCC0pwizX5Xo8x6RCbX2hnSab6hWH4MVhHymf4oV9DtboJFlKq5xUdA36TXRMecZJJi+SZ8FZFZfIEUg7DUXnJhMDk0on56ynJMBxqTPVnstGR7anEfXiTnn/f5eEf6rRitjnRsLUVWZlpo3SbbC3k1lc94GpV6g+lQaFDQbD/QRgGUl0wWL41xchVfyAYgzIfOWwNCASwx8Xx5QJUnT8PLVpBnYB7bR7aWxftBdVUUhx/3rl9lUobJAL+cCWHoEEGcsOqWRHb6gkT/taRd9YNa7+SbS02axoy8SzJY4XFkFKdGLdwJdoe2a+B1BJ+z2nyXqFihi0dTIfgjlhkgiEvAUJo8iYbgDLrJHXBXkbii138q6sr/hL1MuARd42cKGYa00ezGRcnz6Ef/xpoeZ9Op9RJKgPrpr8YAAuQKdDmNGNiChKg34dng9WbzZD0CVcEnb/fcJfT51EUtzb5EV04Z9Xyf8c+7QFYqUVagwkXOzjm7rcmsJG8aYOuKf311Ubk7VZj5DKxwaCyB4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hvusMDov37SLD13VvdR2YuLld2X7HeOD/G4wA5ochPsJLM4oPm1QwxYWTr84?=
 =?us-ascii?Q?NOxpp1N9YBTH2PfUkUSlqNpsh92hZJRqn3EgWlrXdZCjB6zNMaVeKRApMRLz?=
 =?us-ascii?Q?HS0KbXVqqqaNJZBaiJi57LZPH09xOzYtEZl2znfTMm5mnGrTy8oU5gUG+d3T?=
 =?us-ascii?Q?IOEaHfZIzXZ7c87RBjt9PiYB1cAvvM/B/9+AlWih/B7WazBD/6Jkrt0rdZ0i?=
 =?us-ascii?Q?EK1dhG5eOGgYmMQwxC/8Hv1/2za1B0YArHHRQRBIjKopHpXBB+Bn3WDiLfMt?=
 =?us-ascii?Q?iwQn+KRF1PPA4/8Na3hQcfjZSM4W/GeWsONFd/zW+GpZ+LTCxvcNUB99iztb?=
 =?us-ascii?Q?EC2fBAeKqAERggyoLjZVqObR7ZKt1QazthgR6bMJpImlzKIgoYY7Mg9liZGt?=
 =?us-ascii?Q?e11aVbeAzu25LMy97aVEHIiSFbUH3NVxnTj3eeYW1NcnQLsuxq/qPNupHq7o?=
 =?us-ascii?Q?k2lOXbShIB+mLx4mD+RUG2Ckl3VWbf3HVn27Y3DWxKDzf79V6LZxNw7BqN7f?=
 =?us-ascii?Q?NQV5XUuo0WrnbCCrEM7CyW2teK+QxQF1Dl9P0wKlHozVm1bXvvoig9/ieKY1?=
 =?us-ascii?Q?xqy3U3Lmy1IqWMTt1Ur14DSxO9TAfSmy8pGBfRlYhEv72IGuFKk3VxvSFFVw?=
 =?us-ascii?Q?Je7Trr0cry3T4EfPXphP8gWhcTJjYPFy37njNtT1jNbIOmCUjqxXofsDreqp?=
 =?us-ascii?Q?UNYKSWt6nqZ5N0fyTdNdsNpuVIfm4CsXQZeYGRmR10hoLnx3XTeog3d/vblz?=
 =?us-ascii?Q?jiWGqcZPuYGgxs7kP4jm5gM4LhCE1TviZpvFVuckgBeC8PCWGEZy8WeNKG8S?=
 =?us-ascii?Q?A1nSecO2mY0KTFbSLINGht2qfdkMUSYRo1tDp1ONZK8j1vmSM5M2mxKMG9SW?=
 =?us-ascii?Q?KmP6oyl6zzyhT/mUb/AALzd5UoQHpIUuC8tmy+7lTnE5L5iXrsHg7+B0W2gq?=
 =?us-ascii?Q?tDzrYTEfjRMaeRsnp7cZ3o6Nvidf+7jyBjvFdoQ/zGaVcUNuSE1sWl36rBXb?=
 =?us-ascii?Q?X0UipegjRGs/SVIngCUdMPROEq+QAZpO1N8tioGdquoxZlIv3Kbpi93PU5dh?=
 =?us-ascii?Q?e0O2AMO8mnghwMiV/GHAqNO0Atq9X10N0UhVnANGnkvmY8R/nZc/IAgU4lH3?=
 =?us-ascii?Q?044sbS7V49DLluzz/Al7xfCqf84az9eKUmrp6n3jJsfcVjWKq+SmRRUe9cX0?=
 =?us-ascii?Q?wWURMq1S6faxLZLsEUl5jCpM/z3rg0I7sUlMBfILqtSyX84uaMU8pXOWYY6n?=
 =?us-ascii?Q?ty96ooxLHLelgZXhIUxLaKPVWcDkFS3dJ2AINYubLwrAzIggF7o/K9ACPS09?=
 =?us-ascii?Q?NkaA7ZVEtxY0Aol2LsFeSGmlJZMaRyq2TrzjhSecv1l2u81dyD8fk7JRQILI?=
 =?us-ascii?Q?6mlq0p02nhNgQfEhxEI5zmZaCp/kSgZkvwS/wMy72KD8kQhyBuGf9f8rCijE?=
 =?us-ascii?Q?IC/1+d+zdVgj76lKhex/+UnTjECZHrxHVs3oho/RKbroIOlktM3r1Xk2Wq0C?=
 =?us-ascii?Q?gToLasOt53zyioMt+Lnjqg+eWQ0Mddz1SuZm2SgRNC68g7KppP4NcW5dPVKM?=
 =?us-ascii?Q?l6f9ZSCcOu1Rc5cPU7jcTVZpE36Bxe87/033BmVDXrOb+9J2FIRog4Wa3t+R?=
 =?us-ascii?Q?4w+tt3vTwMhak3KF2KtWZVIVxCt7FHQgKZl9FjZVQ0NPmjbS3uLX1+J63QXM?=
 =?us-ascii?Q?qDlrdoZCV1bm5zJdcqUqBQCYwhF6lHgNMfDcUwhXbXg/ebmA6A8T7LnZmNlN?=
 =?us-ascii?Q?5orAxEW2oQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: hKHSxfZIBzp/Jqh3xVz6x0/d8WSIYpLTK4uX0MQuBt5z0/+tkNzG98uAFSTyLNZy2QHWcYMPG6iVirwXt+eW1Z9oJyw1ttFVJ1PV0EDxZdlTuP1n/SgIEdc2W6mIZPBjQeOC9KRlYn0AtzM4QZ4AzRcK0c1lSly9Jb0fjUTdjaNBRKNcoZnfU0RurEW2h/TXvi1SyONHoZ+swAbtqK8puOz7hXmrcmt5KoPozSKo7WrvJKIS2iCG95oSZPdC6LIbw0pX/FQSp6xK828gQ616rwxWBzdTFW0/aBKZ4Opm10qpY9YUgyt8ynga3My9/B9bHDAJVEHU6IO+jniPVLB/hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 027caed0-8c70-4464-dde2-08df49386fb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:04:45.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fELjvnOha8/eRysetnQugZqV6ARpbVX6QvkFLUy3sY6Sue3IkNMf9IlupZEIK8TKJZ61aVCAmr9NhqG9Y6sFTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
X-OriginatorOrg: intel.com

On Mon, Nov 23, 2026 at 08:48:08AM +0100, Vincent Guittot wrote:
> On Mon, 23 Nov 2026 at 08:16, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >
> > Hello Chenyu,
> >
> > On 11/23/2026 12:26 PM, Chen Yu wrote:
> > > I fed this to AI and asked it to reproduced it on a server, later AI told me:
> > > -     int h_nr_runnable = 0;
> > > +     int h_nr_runnable = 1;
> > > was missing in dequeue_hierarchy() from https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> > > when merging into 486c3d06b902
> > >
> > > From 850d8788c72d6ae459034b85584cd5ea01df920e Mon Sep 17 00:00:00 2001
> > > From: Chen Yu <yu.c.chen@intel.com>
> > > Date: Mon, 23 Nov 2026 14:27:20 +0800
> > > Subject: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
> > >
> > > commit 486c3d06b902 ("sched/fair: Avoid transient double
> > > accounting for delayed tasks") changed the default of h_nr_runnable in
> > > dequeue_hierarchy() from 0 to 1 and only cleared it for an already
> > > delayed entity:
> > >
> > >       int h_nr_runnable = 1;
> > >       ...
> > >       /* Already accounted via set_delayed(). */
> > >       if (se->sched_delayed)
> > >               h_nr_runnable = 0;
> > >
> > > The adjust of h_nr_runnable to 1 was lost when merging into vanilla,
> > > h_nr_runnable is now 0 for every dequeue, which breaks logic consuming
> > > h_nr_runnable.
> > >
> > > Bring back the adjustment for h_nr_runnable.
> > >
> > > [1] https://lore.kernel.org/all/20261112083447.25603-1-kprateek.nayak@amd.com/
> > >
> > > Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> > > Reported-by: kernel test robot <yi1.lai@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com
> > > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> 
> There is a similar patch on the mailing list at
> https://lore.kernel.org/all/20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>

Above fix was earlier, so I'd like to give the credit to him, let me reply to this patch with my Tested-by
Thanks Prateek, would you mind also reply to that patch?

thanks,
Chenyu
 
> > > ---
> > >  kernel/sched/fair.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index da0d9e19c457..8a55571b9719 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -8242,7 +8242,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
> > >  {
> > >       struct sched_entity *se = &p->se;
> > >       bool task_throttled = flags & DEQUEUE_THROTTLE;
> > > -     int h_nr_runnable = 0;
> > > +     int h_nr_runnable = 1;
> >
> > Sorry for not spotting that earlier on the tip! Feel free to include:
> >
> > Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> >
> > >       int h_nr_idle = task_has_idle_policy(p);
> > >       bool dequeue = true;
> > >
> >
> > --
> > Thanks and Regards,
> > Prateek
> >
