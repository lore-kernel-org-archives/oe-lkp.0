Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FF258EE9
	for <oe-lkp@lists.linux.dev>; Mon, 25 May 2026 01:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779674017; cv=fail; b=qHQrR5EFFizzLT585bNL1uTBU/T4V6YDbZiAr1xtkCclJpFaZ41SBj96tyzFTAD7Uzxafdn0918+qUa6W7mnsoYrmWx2MWgsei5HdiuAk0RzeOGjH/jBMpy0FDI9ujs4XLfW9XR8yEYkdJlKg9mg+bw+Gsc5s035SG+H8dFBc3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779674017; c=relaxed/simple;
	bh=RCE47dKsDmgHZ6baoMMYjiiqOayktbPaj2LXMwIQHCw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=svsofMVGm8P/3MFMdlqJLK+2d6nXLE0TE6pkMJktaQoSv/6T1oe6cns7OwXwmwYZB4pmXvOounMvQbDyv0JtkNdIltK3Js2/fQxFACV2Drlatoie5vIWOUrVCLYKB4y3IdjkkpS8M3AIuoKFDFwOGpUTO5rnOV8QOjjrA4EivCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAjM9mnF; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAjM9mnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779674017; x=1811210017;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RCE47dKsDmgHZ6baoMMYjiiqOayktbPaj2LXMwIQHCw=;
  b=FAjM9mnFX3J9S6mS3fvzbNJ6ATFrDs5TlWmB5m0CyaRqIKILjsAHiGKK
   +8eydP0soz2b5KaldXwoCsSjIDjcat5ru4/6wDpfugHGscVWPVRqLKf+Q
   a3xSKYqX45FesEzlFBoruC7UfdYv+VjwijI2rKt1H66/IhkaI+Qs5gkzZ
   U86cBqZpH9XfvVywzcj75e8Z5gVljfN7lHvENS7FfDARuzSb5twaEBIUk
   ftWRswya69D+gOlxuIynanyDPA4v5HULLFXAfoKAROhteMHT4Db/JksUk
   MpjP4bUhggzSPYXbsRVAhWl5LdpePruD79T6asdghuCi8msfD9ieHRKB/
   w==;
X-CSE-ConnectionGUID: g0YNYftLQIyMUXr0ViG22Q==
X-CSE-MsgGUID: nTy42AkASYOBs4+ZaLTc3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="90794781"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="90794781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 18:53:36 -0700
X-CSE-ConnectionGUID: qoOqTYwgQGiKa+wVepQR4Q==
X-CSE-MsgGUID: UTXjGTi1T16k5KSajRHY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="240627310"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 18:53:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 18:53:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 24 May 2026 18:53:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 18:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9Ntkx+jPB+Cp98H0cwcFvPLDmOJDRCaMcqjkIJzbg/zByWKsPEGZM9PQz+fxzNTbe/FqnGOEOBna7ARaYnpcis26wqoWVwoQM2+UI+Vpg847SEnsY95BB3AlNYn945VseZ4QJRoC7EweGGDOs0AXagi46RokceyIm9xZWl/Af76S34UeB4Cyw/BayU1hS8twJFu0dF0qvuBAxkeIEpQRuZs5uOgpV7Qi9WIQSVddLI6xIHKlJWOF4MuK6gSPiJeizSsoRksbBlslZBQoZlnXaG34vyuK1OSa//pgOXYb1JcSvFfRt7mKGFGmXQbkh5jxxzm4EtTRz5sbQqGnsPIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrhNnXpFtgis4eZJ/B0maJyfL0o0g6+49PtnOWo/RHo=;
 b=abwSQtVKLZBkwkanlujme9/3nHhv0WLbvShM06HyL0ku7do1n8uUwG3ILgf5DnTXMnAnDxAwWKqRTAUCdJ3/Ck1eYCY7IuK3bZ7mW8pitLEIrmaKcPrsiPZjMllMfuPjLPqZil5CYU/SYsJAaJ3UCRnh/IQ/bC72RhahUoVapZ8UgDCAmTO+H+Y6BXxqYkwH7azXdxGGUgJm60beS2J8ZyGOLU8VE+Swg3Efnyy2bn0ENfbalSbSPaPfSQl+O9oIIvWjhNNsfNQ0ZBM3gXYwvq/skBnQ2TBdl/512hfiaVVCAz12U56PXvTiik9EnELyh3hy8TtuQgMCvy9BTtH2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 LV2PR11MB9600.namprd11.prod.outlook.com (2603:10b6:408:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 01:53:32 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 01:53:32 +0000
Message-ID: <9e921b33-4029-4a75-82f2-ad2891e9d3d5@intel.com>
Date: Mon, 25 May 2026 09:53:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:sched/core] [sched/fair] c9d93a73ce:
 WARNING:suspicious_RCU_usage
To: kernel test robot <oliver.sang@intel.com>, Andrea Righi
	<arighi@nvidia.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<aubrey.li@linux.intel.com>
References: <202605232131.cfcd45a2-lkp@intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <202605232131.cfcd45a2-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU0P306CA0050.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:28::7) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|LV2PR11MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d0f306-528c-4ac8-4f1a-08deba006c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 8ARWeASwCCNVp48//eXiUSVWdbZ/ca1ae8ZJzVeJZCJz6OMXg/Ftc8JoY8SPR2d/4m+4oOv8TDtvf3+lfGZ/MdwskQE26KONMtBq4hgnR5uPGGG1Yr956QojdMZ6nhdNiXT7XLUl5K3N2nCvhcfTcOzICqmWNrAOJRo96LuLqikT4ydQj/EOaZk7ETW+1kEYtextUfJfnmh4tUByCRFz6PiKQdn1b7H7s7RMRxJzdbTeDo6P9fMJXOkBbnzuemIJ27i97kq9m9D1d1KlsIU7Mhz1oWtTwYKDBak/xfA4AOQxE/JrLDFrGM47Ewy43kUNyK2abmrlM2tIHH/+/vTAWXytlFk6IDkjtX0Y1K5uylvRojw7FgR5Er3bQTYxQnQzArkUi4S36GpEbSD8b8rKTAR7k4vpq8zJ7dhnalNBJTIOFrolrLZSr9kC+t9gDXvWu7IoCpIN19zPFNMAuT3KRKZGqmYZcK0JLAvUUGDnBzsP3shcgW3DzhfpdMHPgNk63dOgps1BE9sSYraR0qPz8lKiSQ3SyJNu5UQFcf5Q2cgpaBNthvUiMuXbiEGLekFhlY/LaMmlaQ0J6M/yGYV+JK3U9DJvjGYYcgVbIweFjF1IGPTwKegXqBv8kwRZRXvmUNCRgjQW/1mhkMwoKT9Khbdqlq0twAfDBxgfJFGM/zUXD3yQcuvW1nMY1efPE95w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1N3djgzWXVCRUUzOVQ3NXhvU1FBOGZXK1NIbThiZG14VmFkcHE5c1JHSUZz?=
 =?utf-8?B?aWFwZkRuM3V5MnU5QzdYQkRIZTQ4S1kzTmZPblRLTklML3Z2Z1doRGhCR1NK?=
 =?utf-8?B?WlhFZk9qTy9ndHZQd1RQd1Bvc05yNGxuOGVKaE5JRDJxbDBjV3JlWkZFNjZP?=
 =?utf-8?B?NUgvRGh3cmt0VWJyb1lrVjhQNlBITThndUZTaGpVc082UExsRGw5cGhjQWJ6?=
 =?utf-8?B?MkpYR1dlSjJkcjZ0RXZ6WVVNWXVuMmtHSVJTMmVNYXFsdW1oTjZxTDUwR0Fn?=
 =?utf-8?B?cG1oUFJTS29NYXFhRFppV1c4TjF5Vmo0WnVEMXhDK2s3Q2l5bVFQVzA1bExV?=
 =?utf-8?B?cnlSTEJRMnFWWkt3bzV0bzR5ZzlTMVVvVzBrRzV0RG5NbVhHcnNURG1wbnQv?=
 =?utf-8?B?a0FDNUU1Y01NNE1oQitMWTdVRnBKR2pXL2pLQ2R2UDArY1QrZGJuR2xINGpu?=
 =?utf-8?B?K2xjK0hsaVRjWjh3dlhub1JvUzFMbTJEMVZoMjF6VEgvNSs1QXFCM1Z2d3hL?=
 =?utf-8?B?d3h1VzdibW9pRUlPclhUaElTQUxuT3Z1bm5HNjdvWkg0TTVJNWVqK0JSNUZI?=
 =?utf-8?B?L3IzM2VMVmFwSFRlM1NzME9WRXdROWJmYmpMRTdNaEJ2LzREN2lMNzdRTlR3?=
 =?utf-8?B?WHc4UDVlN2NpNVo0VXZ0QVJ4Nm1HOXJEQWxiVWNjcjFtUmFHWGdSSjIyanIx?=
 =?utf-8?B?bDBQaVhuY1BqQm9mVjBOQlpsblUvd3lyUS9sYTlhZXdZbW1ESmoyU25HNzRG?=
 =?utf-8?B?UElsSHUxSUx6WFg1bDZKYkVEKzdFT0FaQ0tzdVBTZE9UZDRqUWZiMDNlN1RU?=
 =?utf-8?B?UGZzSm5jdGRoTGdzM1BnVldCUUhHK0lqSHpkTHQyR0Nzdy9UelJ5d2dtQXRR?=
 =?utf-8?B?bERkQUpvWFJqTWZHekVqZi91NXMzbHFhWFNNdmMzemRybVBzVlgva3FXQlBn?=
 =?utf-8?B?YUJrdStDb0d0RksrOThrd3d1YVI5K0tBazRmYndVSDNXQnhlMHFoRWt6ODF3?=
 =?utf-8?B?RDVYUzlCQWJ1NjRMS1JBTWZUQytaNUtmeGtJWW1RbWlMRU1zSUk2RDFDTnln?=
 =?utf-8?B?ZnFNL3hOWUVRVFpzRnF3VXhVMFkwZHdKNUVyeFdSbnpkZmtVcUVxVUJEVVdJ?=
 =?utf-8?B?RU1PdHNFYm0zTlRNUGZRS3NjMWR2TDl2SXhiTnZnck12RkxCbWFGKzJwS3ZV?=
 =?utf-8?B?eWtkQmFhcElRRTBUcHZXN2lxTWFSSzZ5Z25iTis5d0Z0T3Z1SDF0dzFQYlll?=
 =?utf-8?B?K1Z0bnA1bVROMVBCZEZTUU9JMHlOWjF0RFBvTUEzeGZjR1pKYjVtcnY0VVA5?=
 =?utf-8?B?SElFdmtVTXkxRWE0b1F5S1RhcnZoSmtmVjRRVlMwMzYzaFg0clJWdEJQbzh3?=
 =?utf-8?B?QVFRbFV0aHVBeDVYMTVxMUtBUU1qLy9BU2FuWld5d3VORGZUK2Z3ekdCQmpY?=
 =?utf-8?B?K0haeFRYb245UEJCVzF4MGtMVS81a1d2eGw3QWx2aVJuYTNjYjF5b2VaTzNP?=
 =?utf-8?B?aG9BaDdrb3JQamR6OEJNZjhYazdub1ZxZEtnN1greHQwVVJYRitmTW5McWdF?=
 =?utf-8?B?UGVnQ0NMVDEyZTVHb2RibEJDSC9tZVB3MHNlWEV0dVB6ZDNXUUYzdWpxUjZt?=
 =?utf-8?B?ZmJ4Smk5aTJWbldid21oWEpUOUtvK3NKdHJhTDB4VDhML1J5bmFXbFBpZVdB?=
 =?utf-8?B?NFJTWGZiSG1vV2pGZVlxajNOWnhFNGFMLzZWS0dTeDd4ZVFqbUZ1WFp0MkV2?=
 =?utf-8?B?anF4YzhWbHhFQU1GVTRnQ2xCbmpKdCt0SSsrb0doZ0ZTQWg3dng0UmdJN08x?=
 =?utf-8?B?ZTQrdno2RURCenQ0VVlTRitkOGFDOGRRZG5qMjNVd3ZWSDlnZFpTNkZWRkdG?=
 =?utf-8?B?RkJXVlpBaWlSZEwzUGhrNXc3cytqVERyNXF6NDM4c1NDWUxKelJUVm44cEw3?=
 =?utf-8?B?OHU3czRLRlJTYlhmU3ZtS2p5RXRzVTVEU01qN0hmRGY0SC9QMXc1M0tnRE5S?=
 =?utf-8?B?U2Fpb0FTOU9DSmxYRWpKOXhENnZaWFROVkZMdGpySGt2UkY5Q3FqM3BhTmkx?=
 =?utf-8?B?eC9uMVhoblppT3lBMEVrQmJNZXVRb1Y2Q0IwMWJ2MWp5SGtISEJ0cHRMM2Zp?=
 =?utf-8?B?YXNRVUFGRDZBN2x2VDdHa01CWEZIYkpiMzN6bkRLVVBVZ3hUanRpUWdhN0po?=
 =?utf-8?B?VnB4Q2tJcklMZW5pM0pLcktjamoxWER5M0YzdlE1TllWNDEwVGViTEcvM0hJ?=
 =?utf-8?B?Vm9ETUVBV0pFNHREVldXMDEvd1hnejdsN2pzSi9NbElFVkhZcGZscnRUQW1k?=
 =?utf-8?B?WVIwWmNPZTU4WmdvOGdvMndtQWdCVFlVZlBBbW1kdWpXUFh2d2tlUT09?=
X-Exchange-RoutingPolicyChecked: nmUyTmjHtE1sqC1dgfDJ5P/aJ9m3bF/fwr1to4+VOwstf5j+WDIyx2a7SQipbi9S+7nfOgNmuK9sZv7liesknUYLkhC3NgJpcIZp13RTgzn2up4uyiNrzgAv0HVc83pbNdEhM1BtBIfoYdwY//cwYU6OKyVX97J5gAz1/XBX8KTC+TXJ1YyucCUb0dZX3JTwrr+TY9YBQC6w8ds/PifbB+UzraiIvTb2G6I8uu6l5kms3PD8QYZscjU19l5vjTfK9jjBfZX91801nuodhqPTQ3A0qhwTNRjI5or8uILbJdOwURZsAR7IoGsJeu+Sg4t5QfrFXskA1QCvUhGtWyEh3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d0f306-528c-4ac8-4f1a-08deba006c6c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 01:53:31.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmammxabuqdsfH/FT39GSnh56yk4aSPDdFbWz4hUM4oss1Ba2M2XekXRx5n0RfhczPHQMykaKhjsnnO/gfp1jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9600
X-OriginatorOrg: intel.com

On 5/23/2026 9:27 PM, kernel test robot wrote:

> 
> [  102.159951][   T23]
> [  102.160730][   T23] =============================
> [  102.162072][   T23] WARNING: suspicious RCU usage
> [  102.163398][   T23] 7.1.0-rc2-00011-gc9d93a73ce87 #1 Not tainted
> [  102.165064][   T23] -----------------------------
> [  102.167687][   T23] kernel/sched/fair.c:12793 suspicious rcu_dereference_check() usage!
> [  102.169994][   T23]

sched_cpu_deactivate() does not hold RCU read lock, nor are 
preemption/IRQs/BH disabled,
how about this:
  static void set_cpu_sd_state_busy(int cpu)
  {
         struct sched_domain *sd;
-       sd = rcu_dereference_all(per_cpu(sd_llc, cpu));
+       sd = rcu_dereference_all_check(per_cpu(sd_llc, cpu),
+                                      lockdep_is_cpus_held());

         /*
          * sd->nohz_idle only pairs with nr_busy_cpus on sd->shared; if 
this
@@ -12815,7 +12817,8 @@ void nohz_balance_exit_idle(struct rq *rq)
  static void set_cpu_sd_state_idle(int cpu)
  {
         struct sched_domain *sd;
-       sd = rcu_dereference_all(per_cpu(sd_llc, cpu));
+       sd = rcu_dereference_all_check(per_cpu(sd_llc, cpu),
+                                      lockdep_is_cpus_held());

         /* See set_cpu_sd_state_busy(): nohz_idle is only used with 
sd->shared. */
         if (!sd || !sd->shared || sd->nohz_idle)
