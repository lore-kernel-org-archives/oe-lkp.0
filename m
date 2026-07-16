Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260B3128B8
	for <oe-lkp@lists.linux.dev>; Thu, 16 Jul 2026 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188061; cv=fail; b=LoEqWHMJC51+3nWra6b0QHPqxcpatGsfN4AVbSBHvl9QtKNi7y+mXkOSAohQmu2eXfx1lLKeZFcXrqr7L9BbI1WVNdUbYi1QqpwEg0u30licLRKBw5LkmebBkkyTJ+EbuXbKxb6pzWNzdDsXTNJjDRJur9bXCdWjXx5iI7vceOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188061; c=relaxed/simple;
	bh=Gg4m5II3XdGXyZxFSpjeVMkZGFZGo/G5dawu8/6gZ/k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vBiBt7wpYSg4iWtriu7UFts9X8+G4Eq6ZyyJGxsJ9Lms6Zm/Liwb9qUCkujIiD9PuY3+Fbx6vScWDsQci8dKUBTkVW5x7FVG2jMo0PQ+DUI2hoopUXNWc66X9Q2hlpgECMWxeOOUWMWwTIZ7NyKiz0/l+8KYLxecJCsqPkSIIzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaMbM/hd; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaMbM/hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784188059; x=1815724059;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Gg4m5II3XdGXyZxFSpjeVMkZGFZGo/G5dawu8/6gZ/k=;
  b=AaMbM/hdLTYlm41NZClHaqdJ1Tat2Isin/iKcNeqWD/Hs/W+kqV6CWYE
   C41ULtcdC/v3sg7TfcirBPNkPtlxcFjammY/m9ENahR51pR2z1J1oKAc+
   /PM018WR9B+F94w4d/XbRbi8JXri52CQxqsP1yCUdJyKN2AiUnKrcmp9H
   fJhiuUMSPE9BMruIqygxgWyRDRq2T+tgVTdasOjluI6uZeQXAGLFTZgt2
   DGlKHTgULMDo5coM0RWGlRyfNPm0PYXO2NlwC1fcMCtPLhn6UMWUwQm29
   FG3RsjDnyggvMrDnVjBeVlB6zNqZ8CJPsp4EGFdaQo43Y5GAHZFuOtgbB
   Q==;
X-CSE-ConnectionGUID: girPg6cxQH6kiYaoU9D2+A==
X-CSE-MsgGUID: wiT/HHacRxqbcTKghd8PHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88741982"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88741982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 00:47:38 -0700
X-CSE-ConnectionGUID: 2o9Dt6ScQTq+fAe6JdnjAw==
X-CSE-MsgGUID: FivmQ9gBQumrFvYp3YIHhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253792949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 00:47:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:47:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:47:37 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4xTOviK4NB23lhHUNbNJo/Yx6wU2oakhW0w/VQAPuDIkJCZrsC2G6VhdYFMgSe0PXgDAEMmBngKbLGrQd0mBc1qPHJJ6f2pNKejYFwAR02dxum5n4Z1xD9b4VuEpOAYCSRMduxF4zq6j2W2tPHkYnTDgS3+JtaeCTlCL07JCxKRqV9CA2Qk5bF7e/0e0LMEk/9FpQp3+7ODnlt6dGOmzd6YGIsXBb16JjNOlNDVIuVGn1QpO7+3X2qSVP4J/eMH3wa3QuIeu4GVOXq215qHwVnw6uJfX6gxAaaGMk+WmuVswaYhRmeYC5isQHyTmfT6YqNTB5k87bs+NiXJHfRvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3Six34HXnMD+s/JAiVHTXpSIcfsL6QsTzV0HJE9DmY=;
 b=Alnwl1Y2e2RRixgjlNzXVNdEEAJyXjjCmpnsUXmz8a5s3OffTJzTBQQzEDWDeXMvKDk5blBwDtQCsGxoOpd6ZATlf0UYcY/IZeISsszh2e5+L6e5mEM8ppcFxikA2Xi/ZwLCADU/u9ylLHFzbafUWRUb9BlomNAPk2bOfD+U/5k2xXjkf2Ac3AwVFtHBSCnFz2/prEMP0bpZgdS2L7q2QWKAXBhZyqLmr2t3Yke5vEvCGEmzkgE3TQ1YkbypO19sb88+cGfa8AGRN3F1O/gX/4AkpEce/VxwWnD/n5yxf1aB8cnNwTe48Qwu6J+VAVs3/hj0xEdRD+lyPi2E/LxTHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 07:47:29 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 07:47:28 +0000
Date: Thu, 16 Jul 2026 15:47:20 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Harry Yoo <harry@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Danielle Costantino
	<dcostantino@meta.com>, Shakeel Butt <shakeel.butt@linux.dev>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: Re: [harry:kmalloc-no-objext-rfc-v1r3] [mm/slab] d6967566f4:
 RIP:mark_obj_codetag_empty
Message-ID: <aliMiGyj4cgBNIzQ@xsang-OptiPlex-9020>
References: <202607142131.f70bbad3-lkp@intel.com>
 <7bdfdc92-7e75-4dc6-9549-e75b46218b93@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7bdfdc92-7e75-4dc6-9549-e75b46218b93@kernel.org>
X-ClientProxiedBy: SI3PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:4:297::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: d0025c0e-a813-4574-5d8d-08dee30e7bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: aFef1bp45A4Ov91LlDyKx4gctcsFw5pgUmzZ5yOkmoybE/XDrW0jtZAkJJy2velc/DmTGdMGbr17upkWPNwtJ4tauAgwyzCrYoxYN1QXFOo9ovxfooDLOU0IEnKv+vu4Dp4S5NRgmv2eSMmKIK3hhCRbBr4e3pJ9DiiZ6rWOc2YOph8jiKHlB3SXAraO1PDIuLWdXtA7Q4f/AuKiTuwVrb4nQG5+TkpY29S5UrnCgc+yoNlI28n4HxtgMniNATFBxqDaWgv7f5QAoaKQJWRpNeX2kR4vSgA61bss5X3SfUAwRwgvJ9Zaovr7p/j7OYbijWLuXntWGpIq/SUcoboCz48Pdm6CMXSGhJL1kecR8cr/jqg228Dd7+HM9c2siofAk6YoTAm+6AJAR451EY1R9nKQag6TjX5cj9wxA0yP0anCCmXWqGZOM8WweW4k89+3yQiTZzuYo7gIq7ou6tDpKkoPWeC5klkmVLzDKeK1xOM3I+XQOTqLxx5MLRS94NCZC007LZf2OxoEzPuKL7q9ypGIY0VvYLxir+5COECxbOW/9i1AVuvlJH/vw5bX+XxaB+ZPcXpN+33lQh0iRzlfy7YsaA7+MCuHJK9jUkg/CUzY2FHYJA6jDis2g746tYEF6SAngtCasjDbQIcPWzv7r3eSQAiC0htE7sFqCn+kJWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sS5Wj0noYqGdHJ0HWzMOEn9aPkCQoUBTR6xxebWtdOgwV9/4Ut3/87LsRSq6?=
 =?us-ascii?Q?Aed9jURqSTIlwiwngL7/5PYiKhUrsLf2/leHPpeeZP/kOBUXbS4S0rFhXg3I?=
 =?us-ascii?Q?/CPYLGN2Web4g2jcE+vZgRYT8/Feoyk3axspsrd9TO0bxpWN3PJz9MJMUlem?=
 =?us-ascii?Q?gCnfy26cr7vagg0VIyJwUf8NKPwngHkamoDXT6l/rL+tpD3rap0726f4v699?=
 =?us-ascii?Q?MVJAU80rUTQJR3s2vmwRu7/uFunLYewfTHet65YUMZxaS3ZT6uMOVHyArDyO?=
 =?us-ascii?Q?HnEbMlOeaE2bi7B2BtEj/k30Co3raTc5JySRB3mrPBSUf79x/qlz5eEEmz7k?=
 =?us-ascii?Q?+iQg4U5Ei1+Y9iCnynT4Kpc8a4X/9Wyvd4HbYQExNq9dWACCrTxW+aD5cgTY?=
 =?us-ascii?Q?B9QKK91G667LsUQWQdv2N7V9KG1p7VM22bBGGZ+X1D8ag/h2WWQqobPCjvff?=
 =?us-ascii?Q?h0RbkMtTDmK0344/GmYypNiZ2KS+OSjT+GMxeH6IwApXAnKLjOceYP41WFzA?=
 =?us-ascii?Q?KxFGBZo7nvW1erzwkBbC/F5Y+mDqsz/CveQ1dCyuLTpYeCrBfNb+I6Z1EKCS?=
 =?us-ascii?Q?2EAv3QMh6VdZoKRwM1AZf9m8NA6c/9z6w5r1pxIguTlLuMRQBSTQCvticyH0?=
 =?us-ascii?Q?4cngEFE8oWY8BoiTNEzS+Q5w2qG3I5IpCC1Z5vqBCZzVhJuWVVXLlC4KKt0M?=
 =?us-ascii?Q?W7zuYk6HSWfa6/4Ow3fr3LmEdhF0LxGzRLaX/VPxchXu07sZcMg8rvzHke02?=
 =?us-ascii?Q?dxzzSnT7uHv+p5WcoIY1u2vI4TNQ+xe32JYUv3kmuNHZlWfIw9b+72jZFxq3?=
 =?us-ascii?Q?a6W1wsrfWf70rBGsdA9mz9nBeZW8lC5j7nIWYplx0/DA0v+Ew6gmao1iuKJx?=
 =?us-ascii?Q?+9tC+QxBD070H7y1t5SHmYMpLb+ilTwgES+zeiVeCjhma3ox2flprrTA+w4e?=
 =?us-ascii?Q?fnZ4o7Dh53/4iftIi8u8Ng5B1oonfcrUZUE9jxesFSNgkiykR6kZ3/6dnTVN?=
 =?us-ascii?Q?LQ4ezmadmzjwb4DGlSlW62rqhSdG/Ag3OOOeUhzaDc9TSAxp46XXb8DZC9BK?=
 =?us-ascii?Q?ypj9dBemN0NWXSwth/bhwhVzWa2lx1Vb+cCD6rFlFI/+Nj1q+ryMYH/IclVp?=
 =?us-ascii?Q?TfVzttgJr/HLC49wOR8u0RMiw2FVnUA87d1kleYosqgwI/JGJ5BFUV9Js7Lo?=
 =?us-ascii?Q?RZH+7mWXu3LfkH3YOlf7XslffbshztDTWgQ0sP4sIaWT4pQfyc7Bf0mvM65R?=
 =?us-ascii?Q?AOL+Ud5F8s7KRMqhLWckSsBPj+mo9+sR6gIHUNwotP/47s00DnXXcqnGa+/u?=
 =?us-ascii?Q?leA+mytyUuosUmKGtavik8qHvusRXYOWSxampyPo8GwRWGv7tbGbD/AKjP6H?=
 =?us-ascii?Q?9xl3qLnJjtRucX6f+SxmAIgQ1Cw7G35K41/9DR5BEznGEY2IcK/7qZzZQJjy?=
 =?us-ascii?Q?UKxj0Pl9MgoacyDLTIO57Ze7/syWX78UFpBekECdNBwm62pxhy8eWB1rgumZ?=
 =?us-ascii?Q?c0oLLstZN8i+HvLfAxyNqV3o3Iida8X3Yn/ALuf+1Bwo+Q6BhhXVi2sdR4Hg?=
 =?us-ascii?Q?Q+oyuUFPy/XxwWcHzkzviE98SAt9Q3OLNTsmQiAhcsXVGmEl7KNZ6uIisrwb?=
 =?us-ascii?Q?nu2zck2CGmhAobEPB7+vyi0ykmfiSKOYYg71wIP9QI4CQDDu6FdoGMXIiF1j?=
 =?us-ascii?Q?1JZtuCbPJVXL72ONbZcGF7hYkpVaa5FgkocjSF+3lBiT2WBwmD5wgQKZjRSe?=
 =?us-ascii?Q?AtGEgPQCbA=3D=3D?=
X-Exchange-RoutingPolicyChecked: tM4QXgv0BaUbihdgAgI66S9OFnkERa4gBX/I8wSkp91qZQ+/M8gDzczS7LABMi8eJMEw6vjSE/7Wr63UdJK6Z+lT8LDnuPQAhxWH2Oke0T6bphSMyWCZaZ/K+KWJqmhYESHRVER6lT3SJPdLt4pBpMjTzIhsyjpOVOCvMHbVT8WYLgwBQKn2XYwMA58AlSwWurK7RTbJ/yINtu7tPmR306u53px7L0Snu4gP1xuJ4CYxgPKXMl/HuKQa3svlw7aeOhBWwJtrT+5ZO0Z1fq5XVZDaus+DDSkW773/SH49RckwCNr7is8ouXzxErvypjaStxG5axVZicH1wrX4bAUeAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0025c0e-a813-4574-5d8d-08dee30e7bf3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:47:28.4076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAO97/3gSsp698ChjUZKR8y/qcErKPJc83tN4qiV4AG9wZfS3JLAF9O3ZAYkQ/12aS4o1ulKq+gL/AzmkucVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
X-OriginatorOrg: intel.com

hi, Harry,

On Thu, Jul 16, 2026 at 11:27:11AM +0900, Harry Yoo wrote:
> 
> Thanks for reporting!
> 
> Indeed I've seen this false warning and it was fixed in v2.
> 

thanks a lot for information!

I remember I checked if the branch is latest when reporting, now I check again:

  kmalloc-no-objext-rfc-v1r2
  kmalloc-no-objext-rfc-v1r3
  kmalloc-no-objext-v2r1    <-----
  kmalloc-no-objext-v2r2
  kmalloc-no-objext-v3r1

oh, I guess kmalloc-no-objext-v* is the following version to kmalloc-no-objext-rfc-v*,
am I right?

will be more careful in the future. sorry for noise.
