Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE067F9
	for <oe-lkp@lists.linux.dev>; Thu, 13 Jun 2024 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718243746; cv=fail; b=gH3oHG75nCObjh67OFOAHi9lMQAZFx1lKiD85/44e4rJQ4pXarAJNo4RX6gm5xEN+NH7xvo00FaEWwHCNUvRk3Ks27I6WStlsbOwyXY4M4Qki1q82Cd//1kyPlTk0jdw0JoLF/A8oY9Nkg2N/H3EkaY5cF4iaOr4E1F7KpCY4Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718243746; c=relaxed/simple;
	bh=QyRdAI4TAbaLHa3wHdLDIXl4IGACHlVezpReSKxdI4g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HySZAUYObYGnbKNfsywVpj5D8BBSAfcjufsvdkctCl1n29b1Ysj0yB9eDt8+kH//PpBdKLE112fPDYGdZAuuSL4XyOcOP+Yf8IFyBXVBCvnFuXTHSwQZBaiEELlDkSZeaM0aDPwypLfkn4e7Eu8EHM4osU8YYITFvfe2ktskOQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLUlFf7g; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLUlFf7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718243745; x=1749779745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QyRdAI4TAbaLHa3wHdLDIXl4IGACHlVezpReSKxdI4g=;
  b=RLUlFf7g8MCux2YlDM1n5tZ9w7HUFMlhRKVtjm8TlEmQp9WLlOJNydh+
   O7hz03nKrUnpmOPmdMcqN2AdMM4F7c2x37ZOXAn2+HhXzTDZ4J2ZVinSx
   WZYAa7qPoxmqvytNbiV7PyH3+4YeipHTjTVC8IjvEfjKoZeEJnwD9x1ML
   BuVuPWSh8MmLVA3KRQiLNgT73ZDBuhPp5adEfMWSod1NrVeKR1onNo4s+
   4H6nki2Vu7B0hUo2T4IEeu+5GZGjZGxgd3qMEPZsySxxkSV69PM7pze6X
   OOdzk6YG5Kyt5GM+qlUY/PQ3qd4PkvgRebUfOZH9Sww3rhJ4m8V4jcXVc
   w==;
X-CSE-ConnectionGUID: 3qRQRh6+QRao5D2KaZ6sVw==
X-CSE-MsgGUID: /rIswDLLSi6e+4AC2HQkRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18821240"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18821240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 18:55:44 -0700
X-CSE-ConnectionGUID: TvP27yPQTfe0cOgOGxR1fw==
X-CSE-MsgGUID: Fotk3TprRvuJBUelIEBT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44880602"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jun 2024 18:55:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 18:55:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 18:55:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 18:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhPSHQZCVyZF5sZ5b6Dr6UHOwNbPuhAZe7KRNwBgMCs/QAKqrkHap87htPNcorg6D4ePzOO85wpoGB3a8p87orZD0ZmQ7G4EOn4y6UsmFAEmt/cj9hSVi5bo649L07z0P6AIfhU8V3uo0qfn52OqLvNdgfq6CP3fxyT0RyQQGr7Zj+UVXFc2uc7jqCq0FVgfAr9Cy5N1/td4xinLYtPJIC+yO2vfyUPi/lb9AuZzHITWcoeGaM5STD8n7i4WUKcvJ0rlXH8eWCoX3+KtejIpwUYuBacJ9ZWwP173TDwSzS58noVSBJufFxmqfxc7zxLRDR1UprNM6mTor2iYKHR+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC2m8EmJ72mT2tgD4kBBzmQm5acX0s7VEC1QOYCQYj8=;
 b=HsW1xrGkDemk6E+FTwi3TD9A614iqYZToCelpXRJDypBoWmt8RdNq9yVL9FMJVh9fMJaYSii2o3Wix5jlMpqHKvk+XXTqx5X5IzaJEXomLZmkaa1gy9s246+qxOZztUXLpV0d9yRDguJ313DdDk6yoYg3QRYyQ52ZSJxtbtZRePtmoCc+DDVZapGNoYW5bo+wladrRxn+idLXC2jyxQjoPIZwDq3+E9MLPYE3JaO4PeXWcVmT4UJ/IB58UQk2xv6tDqdy0BuQF6LfcHS7gHpj4p0D+AKY31N2X1RvZzVooENiOn2h76nOQ34HiXygVt1MLzNzX/CnSmzc8x/h4tAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 01:55:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 01:55:41 +0000
Date: Thu, 13 Jun 2024 09:55:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>, Michael Golant
	<michael.golant@intel.com>, Johannes Berg <johannes.berg@intel.com>,
	"Emmanuel Grumbach" <emmanuel.grumbach@intel.com>, Miri Korenblit
	<miriam.rachel.korenblit@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [iwlwifi-chromeos:chromeos-5.10__release/core59-42] [ANDROID]
 dc5104c1e9:
  UBSAN:array-index-out-of-bounds_in_drivers/cpufreq/cpufreq_times.c
Message-ID: <202406121648.3131bad6-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: fef4e5aa-8544-4972-d10e-08dc8b4bedc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zp9GUH1Pw7fKZOYa/2dwJA1pGUCQgc1e1Iaopvq1IqnDe3skidfLgzHICjhZ?=
 =?us-ascii?Q?7aPL237BnxDfl6XnWdFsDJ27bnRpLKU8cTDe6nXysFjoHjbIyqTjFDG/MszZ?=
 =?us-ascii?Q?L6PERxZiJvOz/eeRhAmSNuhng5g57KIPhQgWrk7VJI4i8kCIxwQYPy0FOlG9?=
 =?us-ascii?Q?yd8CLOhDiBQ7MqBVqDqXfVR3+++LyJorNvNZD7jC6xls4clVnvHBfObY/8UI?=
 =?us-ascii?Q?jrBW+8/7cQ58tAQ9Psjqqq6Co+lDm2ORzQ4Po+TWl4fmp/PIoM6LScNdaMxZ?=
 =?us-ascii?Q?gPnWJmw2NzlXt/12ct7op3uniyHkcReHwv41RjLTScRDiUnhMXKLVCtMcfVz?=
 =?us-ascii?Q?70rb0QwVhI45Y/yt6LXzp9c6dH92PEeIN9gtAfiAqsfqDMqonLe+7FeLltzy?=
 =?us-ascii?Q?LBxDLOLGaTJCkn4UqybJclYGQRLhHLw6J3pMovCC3zXYkjdkwuqIlge88D9w?=
 =?us-ascii?Q?0xXn9o0aK4L2lDX5gUkue1QHpKcAYIsmUiEbAzyKZQ7ipNawvqDYp1n2MpNT?=
 =?us-ascii?Q?XxUJQJI9bhVLzi0rgiRWGL7EqgiEd3U3PU/aeljlBUqPNX0y9gQpXAySJnB2?=
 =?us-ascii?Q?JytAnkUJZffpzftO5olXPf976lAxrLgGgckUjBgc5oT2AK4FFKnloo9Jj3IM?=
 =?us-ascii?Q?Lkrpds8avb86W5s4gsCaGaH0a69Kc9YcT0l4att0uWhFqDOHHavJ5kW65/F+?=
 =?us-ascii?Q?yYpkqeZZ/QbsPZTFaZccv0ZVxQgHYozwnUiodhhKaWMtuz077ifmL59rH/O4?=
 =?us-ascii?Q?qELtftRG+JmYHbbjqrTFLNKP3dzcUYpoelwvaWXQc95exiH1pn1kW+gEVDvK?=
 =?us-ascii?Q?K6at3VMvUrFtFEymlSn0Oniai647FRbJTujzNTafzCdNwpPg39MUS9rHqvvU?=
 =?us-ascii?Q?RQ5hRxdrV5qmQenYnFVed9zYo+4LIaMrQiq5zfpj0dXvEBXALVHSUe6/ZLtO?=
 =?us-ascii?Q?licxv4Owx2bcuKjTeG4OQJjuP2f88AQd2zgWi9sdPmgVqEi6W9fMZmde5RVt?=
 =?us-ascii?Q?a0bHlVeCMruxJqSMafwoTj/4Y+JAIrNjNmg0cySRVNBH1yUxDHkPK52O6frg?=
 =?us-ascii?Q?M7o4HELddbjTWHp1rqwGmZNKbo+ZdbeN4QIw3w3f/VIONcO3chNaX46maOby?=
 =?us-ascii?Q?SDazcyVlp+bsoJVQ7wfGeExms+BPjq1QvE72f3gq3Qbo2QTgc8rEBEAj4+PV?=
 =?us-ascii?Q?utvQsxUQBWDXZxR/IsTt8iNUbVXfnYioKkqCmd3wH6g5K+nusL7KgR6yw2zs?=
 =?us-ascii?Q?xhepCuSkIKLVx+kSZjlbPEn2JwAkWjjk2sOSEHKENA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1x9KyWSkALKvXqJuIGHah/Zg3NF3mqis+ReB74fonfPqo0QlCG5SVuoC0Czq?=
 =?us-ascii?Q?2yjRXgBMvgN3bA81CT3Fs3ju+ozz6verEbthn075dTMdykTx6ieJNweIwLdi?=
 =?us-ascii?Q?Uv3rdpMmDH/2rJN/F0vLGRjBFqxVeq/fvKpVHStJ9I468gI0sKUOMO5nVLvw?=
 =?us-ascii?Q?ulCHRzMTj7RSokYrEhCH3NmD/4Kt1Yq2DG5ElIxZhomMxhM+MmsWBzUmV9Ow?=
 =?us-ascii?Q?EIO9yfPmMlk6VWaFR1lsdUrZb6B5Uoq9QTDYWhCw0m17xaZpxmnMWpubyRIE?=
 =?us-ascii?Q?mLeLzQ8m1ghAgb4XJwI4Jgj84Pg6sPXf+JPRq4fA5khNr5fxwzwCoqhgXvdO?=
 =?us-ascii?Q?Pd7wi7/laWS7HGOIrJLVvyVEFmdtP3LcdQFYVSPPkzULha8Ty5O0WYYm2HR4?=
 =?us-ascii?Q?jwJ76XkuEuQerAtN9KMHVoPFsDmLxK4DiW7q4ovh7u+DX0YTUNDRUdZDK63b?=
 =?us-ascii?Q?GXIbQPi2I63WgdXLbhdWlz522sSx+akZnu8rCbpBT4qI1NZcqwWBgnuZqyPq?=
 =?us-ascii?Q?BpzibS5tUla2ov7iKCA5SmZPnu0Wc1f9qAKREFvFmtK1T2eVc66ZzN8gugSh?=
 =?us-ascii?Q?fRLq5g4/bKzFw9hUv2bLITAPQXaiqB+asd7+zl4sIgnnunVss5aMpE/nFjI3?=
 =?us-ascii?Q?ipgFr6WT5HaMh2mgMlxoQIAg/GBScJi0OdGVgrHYZe2mJY0YohHJnMd78NZH?=
 =?us-ascii?Q?BrsPr9PjVWC0pYtMt9Vvqhlhn3+rEsPhoyARwOgJu0iCb4uaojAjDAmpjb/K?=
 =?us-ascii?Q?uCP6/e2XLlBTSdjZiocQna0a604uMwTBNCZ6btMTyLKM7AEhjGJwwGjZfvm5?=
 =?us-ascii?Q?zN9IvR3Lk2dRfXbq570N40m6rEWL9d9OBK8a+qza2gnIAPAYgLI/QjnvdxlF?=
 =?us-ascii?Q?nuVB3iINEuZbdyi3Mg05d7j11LyzOycq8DkBwsFd9p0fIT6GmqJg7XKUj++Q?=
 =?us-ascii?Q?QOlu7ptLXvv7k+DCxPG1lduo1hPEcNsq5URfUdH6iMmdGdYHJMFfcPN/iCme?=
 =?us-ascii?Q?4c8tca4te+APIq6i1s87xCP+nhB73iPYWF+t9tOK8RqKFYB43V2AOHtMnGmM?=
 =?us-ascii?Q?bRo8nCPzSZqKgOO+N2y6HgAyWohuDBQ16FcANAqz/5zNfAhXuTM6kjDArOa0?=
 =?us-ascii?Q?3G+7sNYa2cQwx+NxlpevrFtFxi5nnt5FBXAaP8qNdwDdealK4vxIMvb7HFiT?=
 =?us-ascii?Q?MTr+ZsW2BdIrxGmK1PseSE2wQFVcUfrUVkir97W9qb1xzuhgDyyvx5FXLFIX?=
 =?us-ascii?Q?lZaRLi7rWSOQVlda7CsrVG3gJvX9WH6d8qLhqWJT7WafX8GBtLzAbzZMceIB?=
 =?us-ascii?Q?jhJTM7idc1pMN3NN/kQrZGiNb0ngYY+LP9fDN/z8o60GD1544z9zybr4E4VB?=
 =?us-ascii?Q?hQDInEotgwlpP1HJOZnwHA3YFDFCogjelZ/jn5jMZK1PVLa+f/i0oWhyAX9Y?=
 =?us-ascii?Q?N5o+Z6PtMdTBR9B3fr3CKbRyeyIqDaZqv7seXN1WhRXDh4SW+Vhwwro9GoDL?=
 =?us-ascii?Q?1vMs/G/0/mtq6/j9lEeRwTQ3eWdFAuNZzIg5Zj+gXC46KMpayqnlt+Zqqtpz?=
 =?us-ascii?Q?NY3o6j4ySIRzsI86EwniOgJMHXQZPE5v6XYuozeO7xJQcmB5RDtoWh/KE8tl?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fef4e5aa-8544-4972-d10e-08dc8b4bedc9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 01:55:41.1157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYylkfaPi7gxkiMZQuj1yVp4EbBhV1rLSh9IIDhbH3UFERCHNN4WsCfJscTanWQdVOyv4UPN/MypPsXLIJyGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_drivers/cpufreq/cpufreq_times.c" on:

commit: dc5104c1e9120632e66bf34df3cd450f3252bf7c ("ANDROID: cpufreq: create dummy cpufreq driver")
https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42

in testcase: boot

compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we noticed there are various UBSAN:array-index-out-of-bounds issues for both
dc5104c1e9 and its parent, but
UBSAN:array-index-out-of-bounds_in_drivers/cpufreq/cpufreq_times.c
only shows on this commit


f9e26868187498e4 dc5104c1e9120632e66bf34df3c
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_drivers/acpi/pci_link.c
           :20         100%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_drivers/cpufreq/cpufreq_times.c
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_include/linux/memcontrol.h
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_include/net/netns/generic.h
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_mm/memcontrol.c
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_mm/mmu_gather.c
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_net/core/net_namespace.c
         20:20           0%          20:20    dmesg.UBSAN:array-index-out-of-bounds_in_net/ipv4/fib_trie.c



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406121648.3131bad6-oliver.sang@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240612/202406121648.3131bad6-oliver.sang@intel.com


[   14.315440][    T1] ================================================================================
[   14.317241][    T1] UBSAN: array-index-out-of-bounds in drivers/cpufreq/cpufreq_times.c:188:20
[   14.319143][    T1] index 0 is out of range for type 'unsigned int [*]'
[   14.320380][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-00030-gdc5104c1e912 #1
[   14.321918][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   14.323105][    T1] Call Trace:
[   14.323105][    T1]  dump_stack+0xb2/0xe9
[   14.323105][    T1]  ubsan_epilogue+0x5/0x3e
[   14.323105][    T1]  __ubsan_handle_out_of_bounds.cold+0x40/0x45
[   14.323105][    T1]  cpufreq_times_create_policy+0x222/0x5a0
[   14.323105][    T1]  cpufreq_online+0x593/0x10d0
[   14.323105][    T1]  cpufreq_add_dev+0x133/0x1a0
[   14.323105][    T1]  subsys_interface_register+0x25a/0x3d0
[   14.323105][    T1]  ? subsys_register+0x1b0/0x1b0
[   14.323105][    T1]  ? __ww_mutex_check_kill+0x510/0x510
[   14.323105][    T1]  cpufreq_register_driver+0x307/0x590
[   14.323105][    T1]  ? CPU_FREQ_GOV_CONSERVATIVE_init+0x10/0x10
[   14.323105][    T1]  do_one_initcall+0xb9/0x3e0
[   14.323105][    T1]  ? perf_trace_initcall_level+0x410/0x410
[   14.323105][    T1]  ? rcu_tasks_kthread+0x670/0x670
[   14.323105][    T1]  do_initcalls+0x260/0x28a
[   14.323105][    T1]  kernel_init_freeable+0x217/0x241
[   14.323105][    T1]  ? rest_init+0x32e/0x32e
[   14.323105][    T1]  kernel_init+0xb/0x122
[   14.323105][    T1]  ? rest_init+0x32e/0x32e
[   14.323105][    T1]  ret_from_fork+0x1f/0x30
[   14.347822][    T1] ================================================================================
[   14.349494][    T1] ================================================================================
[   14.351171][    T1] UBSAN: array-index-out-of-bounds in drivers/cpufreq/cpufreq_times.c:155:24
[   14.352988][    T1] index 0 is out of range for type 'unsigned int [*]'
[   14.354270][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-00030-gdc5104c1e912 #1
[   14.355853][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   14.357687][    T1] Call Trace:
[   14.358240][    T1]  dump_stack+0xb2/0xe9
[   14.358598][    T1]  ubsan_epilogue+0x5/0x3e
[   14.358598][    T1]  __ubsan_handle_out_of_bounds.cold+0x40/0x45
[   14.358598][    T1]  cpufreq_times_create_policy+0x2f2/0x5a0
[   14.358598][    T1]  cpufreq_online+0x593/0x10d0
[   14.358598][    T1]  cpufreq_add_dev+0x133/0x1a0
[   14.358598][    T1]  subsys_interface_register+0x25a/0x3d0
[   14.358598][    T1]  ? subsys_register+0x1b0/0x1b0
[   14.358598][    T1]  ? __ww_mutex_check_kill+0x510/0x510
[   14.358598][    T1]  cpufreq_register_driver+0x307/0x590
[   14.358598][    T1]  ? CPU_FREQ_GOV_CONSERVATIVE_init+0x10/0x10
[   14.358598][    T1]  do_one_initcall+0xb9/0x3e0
[   14.358598][    T1]  ? perf_trace_initcall_level+0x410/0x410
[   14.358598][    T1]  ? rcu_tasks_kthread+0x670/0x670
[   14.358598][    T1]  do_initcalls+0x260/0x28a
[   14.358598][    T1]  kernel_init_freeable+0x217/0x241
[   14.358598][    T1]  ? rest_init+0x32e/0x32e
[   14.358598][    T1]  kernel_init+0xb/0x122
[   14.358598][    T1]  ? rest_init+0x32e/0x32e
[   14.358598][    T1]  ret_from_fork+0x1f/0x30
[   14.377576][    T1] ================================================================================
[   14.385687][    T1] intel_pstate: CPU model not supported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

