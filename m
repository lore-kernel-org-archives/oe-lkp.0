Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1154248176
	for <oe-lkp@lists.linux.dev>; Fri, 28 Nov 2025 01:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764294140; cv=fail; b=SL9Cw8kY3g24LkuxWSMVnSXIRilz3OTsZJQn7KhqPGGajL9LACuloRWtq7zBiXIFCVas4favDr3ZgZEjQCfx5yg+WAh10um2P0jtBsoODNSwc3t98aR8IDRnz5aW5pRaecwDi7rInIj2LtSzzmQPIVWHMorunVtmM/b30xEofoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764294140; c=relaxed/simple;
	bh=hEo6hITAZf0O9xMgE992t9KVqF5cKR+cSs/tuRjiz84=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mhffQgxXMVbmNJisJLniycmNGha2M1YmLOgBNwcUIF6i8Grr14yRmcXzerq2HogXB6C4rfu1dffbxWRgWZW9RqCEvPVGOyIngh0d9FYN8b2UddUgdja1NEwM/vlkt8DLms3vibcXqzhv6R9NM+zMFq3WmyeQfvNCtgTWLQqN/6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Py7N28TV; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Py7N28TV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764294139; x=1795830139;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hEo6hITAZf0O9xMgE992t9KVqF5cKR+cSs/tuRjiz84=;
  b=Py7N28TVMZdL1/A85cx7porFO6+tgTUx5Zi8vNtDIncryZakGej/zf3e
   HqWB7YXxc4NzUXzP/M14pq7jui+5uYmY7hHnAVdgsGodhCwkKY4fwRG/i
   cN0q9YX4ZnrWJvIWGh9r2u1MsIMe0ad0zGGg7jt8nn0yiLSY/SMWmp0w1
   Vdai1UTqVFNoR6+bWPTrFUVnZdRwVxEy12058fbJxaijGzavm60Ch0qkf
   SRyeB0L8Vn9DniedYT8uuh2udj5/MZki1cXsUpaKpcHHDJxeNbe8jeUpG
   s4M/tXdev0opp651QJTJ6/yOsBE8O5rpDQGUa5gcDb6WqMUhD5zlEPfYt
   A==;
X-CSE-ConnectionGUID: eTj6byAoQLKtNNa2q3tQNA==
X-CSE-MsgGUID: AARAUcU9QgKfTEUMgevYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65518031"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="65518031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:42:18 -0800
X-CSE-ConnectionGUID: lSFTaUMSSx+6a1zFKHAvcw==
X-CSE-MsgGUID: 2+gvwrzSTAub1xrFUrdYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="216697918"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:42:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 17:42:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 17:42:17 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 17:42:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyRKi8p+Vqb7C4R6Eugwu4TrdrZxaPLUEh/YvKNjSiqXPz8seSmEe1n7l5Jg+Bh+26hD1waEV9atIWK+CKdiCd148uxRkNYICFbXrtJLGt/N6okGyJNCzqS4eIdddO5sEvX0uNvsPpFNnQhmEE8bDfGAWj3f2PGLUA3v3DJVOunYePPOHIeRp/xnSN8/NGJaPy/J2bdexThNBK9XTdhNqmqXgytajB16ufXMEHzbMeud8MK0Y7XLVbKMTWW51XgGZ58g6VthyJu6MBMdF4QJheb1TKeKtLZ4rvRsoA53hPdd22+2fWvZ6bLKMtRh6vCgYqx7xdl1w++WXrhmH0tdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aRZR1KMGy/w4KS3dKHzlzy3Caiqa94wR8IVLAp6wjU=;
 b=ND0LrGOEGo23NzOtipyduvxdt5S46pLslhB4t57ujJW/AYopdL+7b+VdRroVeeO+c3n8yvYMP0l5IzMNctcC6//qNo7DaT7YRjbkvwslDv4RZsMxF/4mUBN3VtiiHkLffFXb9DxAhTEQei+ZPzwW8HnoMhwDNTdCz2IpaCgGftdpdkry3+nCekWkv5bGveqKAvbM2qYvFIKF1PmzX6yFHMWGbQg6b2HouH51HbDYHhstXcXEV8RqBF7SahH1MakbCCo17k9xZ8wtaKWsIkeQCjYqceqU7KJb9oQQiYGwTcK/hD8lek8CS7uui2fitS7SiO9fgnEnCuD7mfE04s/2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 01:42:15 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 01:42:14 +0000
Date: Fri, 28 Nov 2025 09:42:04 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Tim Chen
	<tim.c.chen@linux.intel.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>, Chen Yu
	<yu.c.chen@intel.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Srikar Dronamraju <srikar@linux.ibm.com>, "Mohini
 Narkhede" <mohini.narkhede@intel.com>, <aubrey.li@linux.intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
 <aSgU0IDhF4uam0JA@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aSgU0IDhF4uam0JA@gmail.com>
X-ClientProxiedBy: KU3P306CA0004.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::16) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcfbb18-1f97-4af9-37cc-08de2e1f5b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G1gyE0+6Hm5Q8pTubSuaCyglrObDR+GJFzb4Jkg3ZdCQWN1rBOnewJtwzdXC?=
 =?us-ascii?Q?Fqh5GgtGt0KJDdDh0WBKKSQM2P0tw3s4xLJh6sFtUPDyPZq/nPUXsLlGuNYc?=
 =?us-ascii?Q?0MFMOpERz5ZTbTpvQdoQamJ95gBqZIPJd8JafOKTJlTRSx/3RIVTWqLxFLJM?=
 =?us-ascii?Q?ym65R9lpYAW6DlffCluTPbHOvN29Prcb9QDngOqJIY0tg1x1bTDsDWIBNPZl?=
 =?us-ascii?Q?zeKEet8lHYxWwnOE+DauWfaLwWtel0qgZ+H0gO3pOjSCLOmAhPLhK2SIoTJ3?=
 =?us-ascii?Q?AJCi1o6ttLKXatR4meCx7IrEJbwQ4g1q0YH2VqsM5L24nttubwZ7R6c4xIZq?=
 =?us-ascii?Q?tV+MBHnnTNWO75PfEWEotjBcYtORbQ0VD6XHeG8EREk3/pKed7EPqW1PtOD7?=
 =?us-ascii?Q?cDbZFJ06rYKMvlBHstCPMwNK/pE0+JyxUQsOKvaIvebPGiMEsiiM4qkVE6j7?=
 =?us-ascii?Q?rTMYQO9x5lX2c2P95BybyJ7NdWXz7NYh8Mj+xs2eWooPKPTd4e/4UOeAZgNP?=
 =?us-ascii?Q?hf16DEfafblewu8L6Pr4ON3GDHKlPPs1yDRRH66CHntBIV6mBJZLshyoXU1F?=
 =?us-ascii?Q?RNcVoXZmCVIxygcW8S8NgM7jT+lnuCT1gvl+x9zp7t0bE0OX0mjxH1GpA0rA?=
 =?us-ascii?Q?Fi4xwbt+JETJ9J3JLUQu9BhP4HfBtUTFI/S10mRXEuPyrEWXKF9SKJJZoFyd?=
 =?us-ascii?Q?Z1trMsHWGktfGCTiX96lh0d8WvwlGVfhA9CSnVRCIQQR5AOZF7+F1zxixwEg?=
 =?us-ascii?Q?Be+RtlwpOAHSyps+1V4x7UeIhmw45E9CEksCGnbMsWIJiTH+ksRH1zi9fm49?=
 =?us-ascii?Q?oEqAWZWyzgdgijYS9MJ5UJzJFE+DP2yuv9EEIAiYYk/vmpTc2XunA89RoVcO?=
 =?us-ascii?Q?YqZl/kZ29djfaaaq6taG4IsAElXD3x4eZw1vYk5AXVDVoPpW51CXsg8kFm/7?=
 =?us-ascii?Q?kiEs1fuehvyh5BG/I1eR2JQU3F1t/+NvkBEu6oAvMYk9eLT8zu/oa05wZ+tW?=
 =?us-ascii?Q?w+bjjezYRVyO9FFJB+vb2V7q+OCLIYuyRAAGOXGEmlH2IagTuRpzhjFJfZ5Z?=
 =?us-ascii?Q?2+z1qRGD+NZBn9TBbsyuU09mdFTvknKyvxcnFNgyizBhACQWNJkYDafisEOI?=
 =?us-ascii?Q?/OEDVh5DKJ/4Hl0a7dDBWyaPsJ3Sghua44UOQ7xlD0/UJ1EGdzgEmksd0egi?=
 =?us-ascii?Q?fNWVBf3idWZ0d2dtWMzbZUQGSdhO0Dskwf9HerAkN9fuuc5b30aSPXNPts8Y?=
 =?us-ascii?Q?aXT8JMYhe495K0f86SWvBnJx1gZWylnq+P7HiTysiKOtsXUE7YN0CiysvUUn?=
 =?us-ascii?Q?VDuGbSNQIckxPnMUdrfWLRhjf5nRrRbNR4gTa/noTvdF+DUwLUF149+vdYFm?=
 =?us-ascii?Q?goHtmmm3NWjPPzNqz2co+QsqQ4J7d04TbNVZPoEqqi+VGZ6Rf4X7Fs3ewCHu?=
 =?us-ascii?Q?R9UM0LhAUBFlm6T7zImgSaUOpaQCBmzXoC5d1wD3Y2/HkmseZfBLIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2RVt7ItfzdjEQDhn+BGHUDu8zsLyJLfdfdxRQEtkgJTe+FvN4KwcXcUczXvt?=
 =?us-ascii?Q?tqkgw4jYZ+sCJagRvpvNvoVfU/rcqh5K7FZZqS57BfOWE21xvdbST3F7R5R8?=
 =?us-ascii?Q?7gUq4FE33QYnzd/j/TtTQVNaLJCC5nJqIDjR7UpTj/b5xzhaiUjJlReVIG5v?=
 =?us-ascii?Q?yTL0doZG/4P8cmzQc5KeOK2pZ3CbVGU/MVL7VfCIPNgdk4vZGipFyPvo8Yia?=
 =?us-ascii?Q?1B/o5PZ9070ljI4eKGI28Cd3RwfQURqzvfqRDce3CIXv4BMYZ5um6NKi47gs?=
 =?us-ascii?Q?zdjW90Zfxz61XA3Mpr9tY7N92y2XPz9Vz2f+4mTefVwG0MzN5SDmZcFWtlxi?=
 =?us-ascii?Q?sHXfb1i4T3m0IRJGQFj2uVnOfovNfuyHCmdpwPjOg/MQNhUTyXHpobd8D0m9?=
 =?us-ascii?Q?8R4gYhS659i1qAy5xJzEcXGE6IhiGnt6ovUWgnugrZ0SneLhsUyHjcOZ1n5j?=
 =?us-ascii?Q?YqdfGR9/O+7srp/Y6IONPN+PWu1MWFUMyzfCDx8SukXE537IPe93PmKtQuPp?=
 =?us-ascii?Q?RH4W7JGeLeR1na0fQGqKOeY1IlEdfm0LLXzFx+87tj43oyc/UP01cMtBUdvj?=
 =?us-ascii?Q?VgYCEiWtTrDjtL0r2zLj+OdY5AuBePBfS6Du0QQF0/4S+K5WIoVr3qUOKFKV?=
 =?us-ascii?Q?bszHmEB4iw/UM4dIdKVrjmtdO9vVLrODaO2+tqEUsl7a78/56UJAeQzg5/Mc?=
 =?us-ascii?Q?W229CuZZcZwUvobReCvRRuJyC4Hp0iV1KPs7Wh3ikp8xv4SuxJtQPI9SHeWo?=
 =?us-ascii?Q?vQ8p8/K5wjFvSR4IPefiLnqjcfvBnZaKz6jECW2h2PiJ0qHFwXKN8scZkg3U?=
 =?us-ascii?Q?NnQe4TLwMxMIJiz6C8PcSxZULqvb43iTUkhmdJgPZghik5BS225+y9XK09Ui?=
 =?us-ascii?Q?5xCxAhj0f8li5njVKGka+N1uD5Otamj0cC73z2W/vZwwe7qA8q6nxcgVgIY5?=
 =?us-ascii?Q?prQu+yayi9Hvy1McgW5zZe79jXHSB12sx/GtgXz+IO5L6Fgk4dbDKG30A9gi?=
 =?us-ascii?Q?aEAkgB1OFg4JMh256dXaCQCw4mZgB5Uc5qK9LnGJ9gcWPlDi8ZV4e1zk8Ul+?=
 =?us-ascii?Q?V1p2TkcGc7/GTTRqP+zwrgqNumYFwsCrK5dqqnZcOgsve8GG7rvsu4VRMr3W?=
 =?us-ascii?Q?fpLRAJxmQXoyCmlAh61NUkggagAAfHQ3HSbSfbSTkQwAXji+7d5uwWTROdvq?=
 =?us-ascii?Q?sQVJfGbAXDOh6glv2WvqcGCdS0F/P0HxedaNk9//Lg4qyz1agdEgmN+Lwoib?=
 =?us-ascii?Q?h0JWMymy0tM0RsOHRCFLzwdaqrgwzA03KgLifkrZQTkAqpKcYyWGK5Er7tSQ?=
 =?us-ascii?Q?kPdvPDcYi9YZXRt9lJlExREt9pQY0E4Ac/KxexSMQZlSQ2XZh8baUQRfqUYE?=
 =?us-ascii?Q?PLnajcofYE8QyRimUFzUDMxGHXFTcCxR+jIgpHy2U49z45DkNHUFgBxgcl9E?=
 =?us-ascii?Q?gKP04YBYmWpQSV11wVJ238qpVIxeUElD9EzsSE+9Ygds5lmC6m5h7bwLHAWA?=
 =?us-ascii?Q?JTgoe4sfLNnzQBVgXSn3e2XtepdFpgUooPCBTOBMDxNlibw0z7ZJneoYp2T4?=
 =?us-ascii?Q?sOktJxCMrrYaAG9ctu80g8gMlHhbWBeIQVnIX53DJb6W4m3mVccX+3FK8Siw?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcfbb18-1f97-4af9-37cc-08de2e1f5b59
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 01:42:14.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8wVidB0JsGBvrqofCP6yCK3vgTJkia8zX0NYXw2jh5Mz2sF1/mo4QQvfQBmKbUEWc7rXP4lNIZXWBca3Jkg1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-OriginatorOrg: intel.com

hi,

On Thu, Nov 27, 2025 at 10:07:28AM +0100, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > > 
> > > commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp
> > 
> > Not sure what this branch is, but tip/sched/core has the fixed commit.
> 
> Not sure how the test-bot picked up this temporary 
> branch and reported it despite it being gone from the 
> repo, but the branch hasn't been in -tip for days.
> 
> This report can be safely ignored.

sorry for the noise. yeah, our so-called 'gitmirror' mechnism fetched the
tmp.tmp branch about 10 days ago, then it merged into our hourly kernel to
be running tests. so it's kind of 'stored' in our repo.

since the bad commit caused crash issue on various test machines, we made out
the report, but missed the check of whether branch is still existing remotely.

we will refine our code/process to avoid this kind of meaningless report.

thanks

> 
> Thanks,
> 
> 	Ingo
> 
