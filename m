Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E8245018
	for <oe-lkp@lists.linux.dev>; Thu,  3 Apr 2025 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670141; cv=fail; b=J07ix/xYtXEn46xtkiWaIe7TU6FcMPTiZ00MXw6GSABPKt0TpeVntRBfdZKtNPanMAl20QL8wn9RsuvNp+6C1dfzZWwbsU8H/K0njEszvl6BzhqjLw95iKMENrke/zHvbLww0KUsSIpzl9gl88N31baZROUd3Iw3mMwGn41GYIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670141; c=relaxed/simple;
	bh=O7weTwxEd0F4QukTm+KtcRKBC6+4gcik3ns0u5q/AXs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qQPGip4AmxsNkVMANO5Tr9uNVs3Z5Sl+6xw/KOAZHNiwwwp1JNqbPnAh1Ib8lT2pmF+vj/MkCC8pdUvhJYOo7edF93RfLdPFUMFEV1ikw92RgDtex+25w02+gTdCI9fU2gwnd8itRgPg/c8Hys4Zj9v2u3UX2dRrponw/k1T0CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epGmKjAW; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epGmKjAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743670134; x=1775206134;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=O7weTwxEd0F4QukTm+KtcRKBC6+4gcik3ns0u5q/AXs=;
  b=epGmKjAWAqFfB1F5iRswe5x+PM4Hw/xA9Yrg9tME17ADRVdNi/qefjF2
   OSJ4LRKQZxOFIY9rB5HTnItBY4wcpuO9HOaU16hLc2N4z9RiKqvmiZMue
   sXdojD5/N2zIR2531JS5SFojkv0a6muAgNYXgjo92XuF7/qyE9ChyJGL2
   ZiIlMAAjMbCAdk/Kvy7ROe3u5gru+Uc/pBL8p5Rrddy9RSl78FeHSkg5K
   B66jY/jEmvFeAs7RthNepkisdV1QlztAeCdkYKCAIuKi8UsR/5TjbNkVU
   tgGn8JZv8fxcvuFIJJQ1Uqp19OBBLG9e43NFLBqw0OKLJblPew7eooxkl
   A==;
X-CSE-ConnectionGUID: NCpIZHQ9QByu5UzYDdIA1g==
X-CSE-MsgGUID: zlOTAZkCQkigQWoXoTE1Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48726791"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="48726791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 01:48:52 -0700
X-CSE-ConnectionGUID: Z/Yt1of8RcWKre86s2V0yQ==
X-CSE-MsgGUID: NsjDmMxbRNS5orvbH3gaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127861980"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 01:48:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 01:48:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 01:48:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 01:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQYKToBWlBoRP4I1dVAYq9v5q/DNRoNGp8YWoqlglrm60QyfF5BbBp0PfC0+7vzaphAZs8AH64Jog8NCzcnnyoEB+/vaU+8VBT64PaHLrQIKcO7yJGStGBFHOMSN/noKPl1poxKhR/I0gNl3fLa5Qt4+fDLXXvz7fKSRXcI/m7+YCXpIgwJRz407m+aoZAU4NTd1x6BTij/F44smrxsYMVl2x/9ZiqIxa9ZnhMk34c9AsyTQ7EwpVpauLDI2BGrOgV+lJiXHYqi2Ucw+KyvuxlzfAV30WHEmEE8rC5Vw/yxx/9DUtSvwXfDuwYYtq2Q05mJgQ8Uv9ow8bIIrY7aVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+vqAo+4MEYquFr6W/VRn0Oj6uRloc3yoiaAGk5qHHM=;
 b=PWf11uuQeFv3I2EmhDy8BIcyz+oAqSno6OzOszQlwc23lyXFGRRE5cJgUq+wCEz6lSxGvpjZMZvt9fZM7PLQ1DiIYImDB+enfX+6tGTmDZ/akUZKCAszaR8lTn9oIRheHOeNV6yotivtsgCtPqixOUNyvIQBQi6yNzrozYuP91bBbNjguSS3pfD2SRwqaHznpF4MF9J9fzcBlGLhEh3IAXi3AibMT8qSoYITm+n+yB/GXa+987OYbX9hPTQY5h45rqhjjnYGTcTXq1PHT5SE/FvkSg5BZKWC5miRBx/XpBiFYHbmun1miJoED9F2K8FzdDolgpVonzYGeO7buk04lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:48:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 08:48:46 +0000
Date: Thu, 3 Apr 2025 16:48:36 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Brendan
 Jackman" <jackmanb@google.com>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [mm]  c2f6ea38fc:  vm-scalability.throughput
 56.4% regression
Message-ID: <Z+5LZIPG0Kx34r0Y@xsang-OptiPlex-9020>
References: <202503271547.fc08b188-lkp@intel.com>
 <20250402195042.GC198651@cmpxchg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402195042.GC198651@cmpxchg.org>
X-ClientProxiedBy: KL1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:820::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd94ca3-d3c6-4f50-cc8c-08dd728c582f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?V0/GsV2K9st3JD6adVHZ0zUSloMT6agtpC4LfFBskt24EtGb38M9Q296Y8?=
 =?iso-8859-1?Q?pDb/wWVZ+qiAgKsTHfyQjBqk9c7KJJaeOuA4lgJkcF3AvnW1r6PtGd7QXo?=
 =?iso-8859-1?Q?KrokZ3LPx+pwXBUrGTk2d5NrCSzN/9q0Ce818hdyOndTphn+kUpOyaXQpt?=
 =?iso-8859-1?Q?Vcnooj//fy2t9yGhZeMxg1TfWz+sMLy6q0zEMaY9I7WMu0vhTZx73B8S4W?=
 =?iso-8859-1?Q?LxiDvmXWrVmCr1RnF4TmS51rvzmSeTypsVJB25a6+5pToppRoSEa4mrmZL?=
 =?iso-8859-1?Q?cBTDCpf1cmaLaWm9582Jb5ZUr2YQGDPJb+JEClSIToAtzZD5OECSxGNZ97?=
 =?iso-8859-1?Q?RfZ8HZgAEcKFbsV/dMwlsLGT3sn/SGQyWsh0MfvRBQ6/pTEn+rDLgsGF39?=
 =?iso-8859-1?Q?AamyO9xBKHWhnn8MM6X/Pplb2jbS9MhfX0DMMAxNHMSTeJy4Dbxnb+CZQA?=
 =?iso-8859-1?Q?1nGwwSftzNIUNn0xD9MVTBIcXOu2t7FVeHi/YAcGhOM8p3VcbBvj2rklst?=
 =?iso-8859-1?Q?yABFc2PqZrFKgWd/bx2kSQkvDuzDDQR07vD/LKynu3KWCquzCDPpVNxxCM?=
 =?iso-8859-1?Q?IJDurBbnSdRre925MrBdk3E3Fo97JtXVxOSudzRjA05WTPH+15wBl3LUAK?=
 =?iso-8859-1?Q?5rB/wX4Krwu4P8yDSrYkDhRpeT3kahIidJ8LHPAkIhhKVuDJMqBnudIOyy?=
 =?iso-8859-1?Q?Qg8s/MNuu2czgO5wniJF31L7uYbs9iHe9nUGgggeZsZLQeM2sY6DX2YAqI?=
 =?iso-8859-1?Q?ZJF7ZhPqenJ7qRWrhvd5H/M1Yt+cxVr4Smx/qxCaIMHTKerHrRDmkpktiA?=
 =?iso-8859-1?Q?hskIUp7P1GsbVdAIfPzAkdETXQtAtuo4JLnnMTAQgrveqiB41XRG02q2xI?=
 =?iso-8859-1?Q?tbC7Mm9jGHgumcfEMPIHcJRgyhHM8Gra3A6nUrJT2P5Uky1EvtDqGemNZL?=
 =?iso-8859-1?Q?aK9N2Ldr/yyXrSBlabjpLwb04QJp5jjcacQoaZ9HhPtwEStk7mAx9/di8M?=
 =?iso-8859-1?Q?ZohzHkprjV6vX2jfhwN3mvBa+b6fEcUt6VEbQMBZ+a9TL8Ny7UHV5AsJ03?=
 =?iso-8859-1?Q?nw04JHcr+TPgEaKYnFPGjiPzBUl/fhMiAb0nCQS5JEx3A/FHWqM1Uq1rVs?=
 =?iso-8859-1?Q?J4i0wMUoffE7K+bthr2A8R42eqdorWVMUkjxaK+7oGCtzifSK6rzzKg08F?=
 =?iso-8859-1?Q?nkLgcX9RonCN7BPezNlvWSlGb0dNIbLuB9ReLGj0DT8bLIdbDZkEXIqfpO?=
 =?iso-8859-1?Q?SHfCghuH4aI/jLeHeqNXd2CFjEF4ZiQyfFmY9l8qlMFLEJP8kyKIKTzRuG?=
 =?iso-8859-1?Q?Av+O8Rl4n97/cLhXoFUFylC7cFpaL/c20rMsfBPAayxFTviBXko7G8k9hV?=
 =?iso-8859-1?Q?u5GJjpFzvB9pUUqkf5XzQzpviBo69Gx7Bk6F5WbLfrhtgb4xymyXJpdzRh?=
 =?iso-8859-1?Q?EdMn/oD3sWmc09W0YrggmECrzL9ZyMi+CHybAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EeyeydsPOjJtEHranRJ81MFXgcdA+htfq3/a1PftxPMnuTNct2QGAYL4nv?=
 =?iso-8859-1?Q?j8wpVcq9TlZyCMMC7JVc3jCuv9sP6WUoJsV/pG39zk9lAy9W7V3O0aDa2L?=
 =?iso-8859-1?Q?JyOa/6G3nY+Sg2/L2cMMAmCRuhNCqIX9+ObRd/MUS2ZPf6Eaic6dqzhkEL?=
 =?iso-8859-1?Q?kmeR5NKfN+v05Bckx5o1bLNMaVLX1wT9Kq4LqBHNwrv6LqyZOXQKr9rSOy?=
 =?iso-8859-1?Q?9fPBUziBFTj0DNk9wxYmKM85jcQkHkRyHhLe74g1wJ8uWUZU20jjOylGNY?=
 =?iso-8859-1?Q?eQmKT4ctw/azmZGJzck6Z95CBYTeNrMDUDd0LMN3ioDDFRSwFSzyqdsbi5?=
 =?iso-8859-1?Q?O7pPmklnb3fyYNBrlc6St9SeGDyLGsotxMyCqW8DEObsNVi5M5TpGNe6T2?=
 =?iso-8859-1?Q?rd7TIxD9qbP0BlNXkm7JsenAPa3coGuqSLxWLW5wCTfOPOwxEdjmyLi3kN?=
 =?iso-8859-1?Q?X+epdf5ViQXlf2+AYRgXpg0nY5GJL5TXS+gKDkFkzMujFEhbZ9HS2u2i8k?=
 =?iso-8859-1?Q?Vy6/2kiLvLJAaJ98PynClqR6IWAbWWnuWMlgHVLSwqPTxIHxHoZbouFRLV?=
 =?iso-8859-1?Q?kN3PmX+qcakRCSyji1C2bRP+zX4fpZGiwg9mreoWBNVju0Y3WRUEtIrNUJ?=
 =?iso-8859-1?Q?U7eviYmOFFkCim406jemXrjKGwILbdPSH4eeHIbz7I/sM7TbilCraSRzzU?=
 =?iso-8859-1?Q?ehuPxDTUSxtt3C8hPe9JkdwODLugSXkYEtblqGAYDgbgjiufouxbvccw/A?=
 =?iso-8859-1?Q?SrY2hLQmZ5/dbxF3FIJlk2yBPzXDjk8SPdxQGxHF54KbR5YV6zS0pgxsxN?=
 =?iso-8859-1?Q?dKJHbmmwQVnv9So/9DTxBAXoCJ4KZRxhYaYIwgaQ5J0YOQZT/kKgLn+wpz?=
 =?iso-8859-1?Q?LJYfX6DaYU4YJogREqic7ebi2fQ2PQPJt98ROpBVnGSjV4G/pPp3/Lms6z?=
 =?iso-8859-1?Q?hF+inI2Kv2UtVVGUZi6Xtv3f0xzl1ROzL6mgWt6s7P4KkiZzE+kuzff8Xx?=
 =?iso-8859-1?Q?1PyqWfZ0V/DDCK2NpkDIMbUBsuEtYfJuW3CthYJFXCOzlpwzy12MZbdyod?=
 =?iso-8859-1?Q?g+ZocJbK8SJ9z+7CTbevLOcbhrF67azqFnGmSMrJODtAEtG20EaNoOyJtH?=
 =?iso-8859-1?Q?6a4TMzuQe+RcYVTnt5/4QLCL5M2KA0kecdxFLU5VNJdWGdpyThC8Qq4T6n?=
 =?iso-8859-1?Q?CFHWnYREPrYzQJ35uuB5lriRrl0moCiEQSQY0QK9onbmuUnYXta6o0Iygi?=
 =?iso-8859-1?Q?g9JkDN3TPKCUXlHcUa7ZlJRmw3UIFpBlXFkJOXxdP9sOgU6I0fPce74yx7?=
 =?iso-8859-1?Q?leuXrKkhJZ1H7ClUB186MjBBdjqnSR6naK0nPFeB6YhwDXbRVXDACmrQkf?=
 =?iso-8859-1?Q?b29qLf54/vHZUYwOSyEYESk3uai34ToBRYD/QhGDeHc+8Rwj7k0kqPR8M9?=
 =?iso-8859-1?Q?0Ya24KUgr598Ja3YpBu0LIpbmYKDrho+old/YVSmNAluspXVcWC47/4nJj?=
 =?iso-8859-1?Q?hoOPhy8oojwKsPapCHjpnkXLSEhLsD2Wb/WeAEgmppXLqFeWK2iWKHb0S1?=
 =?iso-8859-1?Q?5AczWanatHus4ewTgy/xLzVnkKXjmnbHEld8b4xgoQpz6SyNSKBj68WUdc?=
 =?iso-8859-1?Q?s43lFKY4EHaoR1Wr8FhooBI1y6hk3muZlE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd94ca3-d3c6-4f50-cc8c-08dd728c582f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:48:46.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV6UTIk76Zb3hMioygNB+H7bsILw6zMDTaRPfjaMpLa8BcvqKfSR6E/fwIM60NML6nYPhWkhvF+yb2oIEu4Fjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-OriginatorOrg: intel.com

hi, Johannes Weiner,

On Wed, Apr 02, 2025 at 03:50:42PM -0400, Johannes Weiner wrote:
> Hello,
> 
> On Thu, Mar 27, 2025 at 04:20:41PM +0800, kernel test robot wrote:
> > kernel test robot noticed a 56.4% regression of vm-scalability.throughput on:
> > 
> > commit: c2f6ea38fc1b640aa7a2e155cc1c0410ff91afa2 ("mm: page_alloc: don't steal single pages from biggest buddy")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > 
> > testcase: vm-scalability
> > config: x86_64-rhel-9.4
> > compiler: gcc-12
> > test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
> > parameters:
> > 
> > 	runtime: 300s
> > 	test: lru-file-mmap-read
> > 	cpufreq_governor: performance
> 
> Thanks for the report.
> 
> Would you be able to re-test with the below patch applied?
> 
> There are more details in the thread here:
> https://lore.kernel.org/all/20250402194425.GB198651@cmpxchg.org/
> 
> It's on top of the following upstream commit:

we applied below patch upon acc4d5ff0b then run the same tests on acc4d5ff0b
and 2c847f27c3 (acc4d5ff0b+patch).

we noticed acc4d5ff0b has very similar performance results as c2f6ea38fc,
then 2c847f27c3 has a much better results comparing to f3b92176f4 (parent
of c2f6ea38fc).

so if that acc4d5ff0b and c2f6ea38fc has similar performance is expected, it
seems to us your patch not only recover the regression, but also make a big
improvement.

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/lru-file-mmap-read/vm-scalability

commit: 
  f3b92176f4 ("tools/selftests: add guard region test for /proc/$pid/pagemap")
  c2f6ea38fc ("mm: page_alloc: don't steal single pages from biggest buddy")
  acc4d5ff0b ("Merge tag 'net-6.15-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
  2c847f27c3 ("mm: page_alloc: speed up fallbacks in rmqueue_bulk()")   <--- your patch

f3b92176f4f7100f c2f6ea38fc1b640aa7a2e155cc1 acc4d5ff0b61eb1715c498b6536 2c847f27c37da65a93d23c237c5
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
  25525364 ±  3%     -56.4%   11135467           -57.8%   10779336           +31.6%   33581409        vm-scalability.throughput


full comparison is as below FYI.
please feel free to add
Tested-by: kernel test robot <oliver.sang@intel.com>
if above tests has no problem. thanks

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/lru-file-mmap-read/vm-scalability

commit: 
  f3b92176f4 ("tools/selftests: add guard region test for /proc/$pid/pagemap")
  c2f6ea38fc ("mm: page_alloc: don't steal single pages from biggest buddy")
  acc4d5ff0b ("Merge tag 'net-6.15-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
  2c847f27c3 (mm: page_alloc: speed up fallbacks in rmqueue_bulk())

f3b92176f4f7100f c2f6ea38fc1b640aa7a2e155cc1 acc4d5ff0b61eb1715c498b6536 2c847f27c37da65a93d23c237c5
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 1.702e+10 ± 12%     -53.7%  7.876e+09 ±  5%     -24.4%  1.287e+10 ± 57%     -48.4%  8.785e+09 ±  6%  cpuidle..time
   3890512 ±  5%     -48.0%    2022625 ± 19%     -53.7%    1799850 ± 17%      +5.4%    4101844 ±  9%  cpuidle..usage
    320.71 ±  5%     +18.2%     379.03           +31.2%     420.83 ± 13%     -28.7%     228.56        uptime.boot
     26286 ±  8%     -33.8%      17404 ±  4%      +0.9%      26520 ± 47%     -30.9%      18161 ±  3%  uptime.idle
     28.91 ±  7%     -59.9%      11.58 ±  7%     -44.0%      16.20 ± 45%     -23.7%      22.05 ±  6%  vmstat.cpu.id
    166.61 ±  2%     +25.4%     208.98           +18.1%     196.82 ±  8%      +8.6%     180.94        vmstat.procs.r
      3642 ±  3%      +3.8%       3780 ±  4%      -2.4%       3556 ±  2%     +34.1%       4883 ±  7%  vmstat.system.cs
    550402 ±  6%     -39.8%     331592 ±  2%     -44.5%     305715 ±  9%     +59.8%     879806 ±  2%  vmstat.system.in
      2742 ± 27%     -13.5%       2372 ± 10%     -23.6%       2095 ± 11%     -99.9%       3.25 ± 62%  perf-c2c.DRAM.local
      7978 ± 21%     +28.4%      10242 ±  9%     +15.9%       9242 ± 12%     -99.8%      15.50 ± 24%  perf-c2c.DRAM.remote
      4782 ± 22%     +23.4%       5901 ±  8%     +13.9%       5445 ± 12%     -99.9%       6.88 ± 50%  perf-c2c.HITM.local
      2840 ± 24%     +25.8%       3574 ± 10%     +15.8%       3289 ± 14%     -99.8%       7.00 ± 43%  perf-c2c.HITM.remote
      7623 ± 22%     +24.3%       9475 ±  9%     +14.6%       8735 ± 12%     -99.8%      13.88 ± 24%  perf-c2c.HITM.total
     28.49 ±  8%     -17.4       11.09 ±  7%     -12.7       15.75 ± 47%      -7.3       21.18 ±  6%  mpstat.cpu.all.idle%
      0.00 ± 50%      +0.0        0.00 ± 94%      -0.0        0.00 ± 59%      -0.0        0.00 ±100%  mpstat.cpu.all.iowait%
      0.31 ±  4%      -0.0        0.28            -0.0        0.27 ±  8%      +0.1        0.42        mpstat.cpu.all.irq%
      0.05 ±  2%      -0.0        0.04 ±  8%      -0.0        0.04 ± 13%      +0.0        0.06 ±  4%  mpstat.cpu.all.soft%
     68.92 ±  3%     +17.8       86.74           +13.3       82.25 ±  8%      +6.1       75.00        mpstat.cpu.all.sys%
      2.23 ±  6%      -0.4        1.85            -0.5        1.69 ±  9%      +1.1        3.34        mpstat.cpu.all.usr%
    765416 ±  4%     +13.2%     866765 ±  3%     +15.0%     880593 ±  7%     -24.7%     576338 ±  5%  meminfo.Active(anon)
     16677 ±  3%      +6.3%      17724 ±  7%    +181.7%      46975 ±108%     +18.9%      19822 ±  6%  meminfo.AnonHugePages
   1731797 ±  3%      +7.2%    1855684 ±  2%      +7.9%    1868615 ±  5%     -26.0%    1280873        meminfo.Committed_AS
    781325 ±  5%      +1.2%     790721 ±  3%      +1.8%     795332 ± 11%     -35.2%     506126 ±  3%  meminfo.Inactive(anon)
 1.435e+08           +13.2%  1.623e+08            +6.0%   1.52e+08 ±  9%      +0.7%  1.445e+08        meminfo.Mapped
  20964191 ±  2%     -44.7%   11597836 ±  4%      +9.0%   22842984 ± 65%      -3.0%   20338164 ±  3%  meminfo.MemFree
   2690300 ±  2%      +5.8%    2847331            -4.7%    2564772 ±  9%     +26.6%    3406653        meminfo.PageTables
    852601 ±  7%     +12.8%     962045 ±  4%     +15.4%     983850 ± 10%     -55.8%     377229 ±  3%  meminfo.Shmem
    274.21 ±  6%     +20.6%     330.73           +20.7%     330.85           -34.1%     180.74        time.elapsed_time
    274.21 ±  6%     +20.6%     330.73           +20.7%     330.85           -34.1%     180.74        time.elapsed_time.max
    327511           +46.7%     480523 ±  7%     +36.9%     448208 ±  5%     +16.8%     382566 ± 14%  time.involuntary_context_switches
      1348 ±  3%    +344.1%       5987 ±  3%    +355.6%       6142 ±  8%    +280.8%       5134 ± 18%  time.major_page_faults
  10706144 ±  4%     -73.6%    2825142 ± 18%     -70.7%    3137988 ± 22%     -61.2%    4148705 ± 11%  time.maximum_resident_set_size
  93328020           -34.2%   61436664           -36.8%   59002722            +1.9%   95067700        time.minor_page_faults
     15802 ±  2%     +24.3%      19641           +24.8%      19721            +9.6%      17317        time.percent_of_cpu_this_job_got
     41920 ±  4%     +51.6%      63539           +52.3%      63860           -28.5%      29977        time.system_time
      1352            +5.2%       1422            +2.7%       1388            -2.3%       1320        time.user_time
      3779           -11.1%       3360 ±  2%     -11.8%       3331 ±  2%      -7.3%       3501        time.voluntary_context_switches
      0.12 ±  2%     -51.3%       0.06 ±  3%     -48.3%       0.06 ±  6%     -43.5%       0.07 ±  8%  vm-scalability.free_time
    121005 ±  3%     -58.8%      49845           -60.2%      48099           +21.8%     147354        vm-scalability.median
      4346 ± 16%   -2970.6        1376 ± 17%   -3164.2        1182 ±  6%   -3226.7        1119 ±  8%  vm-scalability.stddev%
  25525364 ±  3%     -56.4%   11135467           -57.8%   10779336           +31.6%   33581409        vm-scalability.throughput
    274.21 ±  6%     +20.6%     330.73           +20.7%     330.85           -34.1%     180.74        vm-scalability.time.elapsed_time
    274.21 ±  6%     +20.6%     330.73           +20.7%     330.85           -34.1%     180.74        vm-scalability.time.elapsed_time.max
    327511           +46.7%     480523 ±  7%     +36.9%     448208 ±  5%     +16.8%     382566 ± 14%  vm-scalability.time.involuntary_context_switches
      1348 ±  3%    +344.1%       5987 ±  3%    +355.6%       6142 ±  8%    +280.8%       5134 ± 18%  vm-scalability.time.major_page_faults
  10706144 ±  4%     -73.6%    2825142 ± 18%     -70.7%    3137988 ± 22%     -61.2%    4148705 ± 11%  vm-scalability.time.maximum_resident_set_size
  93328020           -34.2%   61436664           -36.8%   59002722            +1.9%   95067700        vm-scalability.time.minor_page_faults
     15802 ±  2%     +24.3%      19641           +24.8%      19721            +9.6%      17317        vm-scalability.time.percent_of_cpu_this_job_got
     41920 ±  4%     +51.6%      63539           +52.3%      63860           -28.5%      29977        vm-scalability.time.system_time
      1352            +5.2%       1422            +2.7%       1388            -2.3%       1320        vm-scalability.time.user_time
 4.832e+09           -30.7%  3.346e+09           -33.0%  3.239e+09            +0.0%  4.832e+09        vm-scalability.workload
   4896915 ±  5%     -39.0%    2988750 ±  8%     +19.0%    5827893 ± 64%      +1.9%    4992149 ±  7%  numa-meminfo.node0.MemFree
    665421 ±  3%      +6.6%     709460            -4.4%     635976 ±  9%     +28.3%     853921 ±  3%  numa-meminfo.node0.PageTables
  12227553 ±  3%     +12.0%   13694479 ±  4%      +3.8%   12691397 ±  9%      +2.4%   12522980 ±  4%  numa-meminfo.node1.Active
  35323186 ±  3%     +15.9%   40935721 ±  2%      +7.7%   38058602 ±  9%      +3.8%   36672727 ±  2%  numa-meminfo.node1.Mapped
   5320950 ±  6%     -43.3%    3017277 ±  5%     +13.3%    6030412 ± 66%      -1.2%    5257151 ±  7%  numa-meminfo.node1.MemFree
    668594 ±  2%      +5.7%     706819            -4.8%     636211 ±  9%     +27.4%     851702        numa-meminfo.node1.PageTables
    677517 ±  8%     +13.1%     766377 ±  5%      +2.6%     694945 ±  9%      +1.0%     684143 ±  8%  numa-meminfo.node2.KReclaimable
  35949507 ±  3%     +13.6%   40822797 ±  3%      +7.3%   38557650 ± 10%      +1.3%   36413009 ±  2%  numa-meminfo.node2.Mapped
   5273037 ±  8%     -42.7%    3019409 ±  4%     +14.1%    6015871 ± 64%      -0.1%    5268423 ±  3%  numa-meminfo.node2.MemFree
    667862 ±  2%      +5.9%     707231            -5.3%     632171 ±  9%     +27.5%     851776 ±  2%  numa-meminfo.node2.PageTables
    677517 ±  8%     +13.1%     766377 ±  5%      +2.6%     694945 ±  9%      +1.0%     684143 ±  8%  numa-meminfo.node2.SReclaimable
    850745 ±  7%     +11.1%     945010 ±  4%      +1.5%     863702 ±  7%      +0.3%     853639 ±  6%  numa-meminfo.node2.Slab
  12355499           +11.5%   13779785 ±  4%      +7.2%   13245341 ±  8%      +1.3%   12511162 ±  3%  numa-meminfo.node3.Active
  11930599 ±  2%     +11.0%   13243137 ±  3%      +6.8%   12737603 ±  8%      +3.4%   12331424 ±  3%  numa-meminfo.node3.Active(file)
    457041 ± 42%      +7.5%     491478 ± 17%      +5.4%     481915 ± 22%     -65.0%     159787 ± 64%  numa-meminfo.node3.Inactive(anon)
  35933100 ±  4%     +14.0%   40967998            +6.6%   38295485 ±  9%      +0.8%   36206962 ±  3%  numa-meminfo.node3.Mapped
   5570339 ±  4%     -46.1%    3002472 ±  3%      +7.6%    5991739 ± 64%      -8.3%    5105868 ±  5%  numa-meminfo.node3.MemFree
    685019 ±  5%      +3.1%     706516            -7.7%     632019 ±  9%     +22.0%     835716 ±  3%  numa-meminfo.node3.PageTables
    649934 ± 25%     +16.1%     754493 ±  9%     +14.9%     746997 ± 14%     -67.8%     209052 ± 33%  numa-meminfo.node3.Shmem
  53331064 ±  4%     -40.0%   32001591 ±  2%     -42.3%   30773977 ±  2%      -1.1%   52762661        numa-numastat.node0.local_node
  11230540 ± 10%     -14.4%    9615282           -14.9%    9553492 ±  3%     +15.0%   12914957 ±  9%  numa-numastat.node0.numa_foreign
  53443666 ±  4%     -40.0%   32082061 ±  2%     -42.3%   30857092 ±  2%      -1.1%   52844556        numa-numastat.node0.numa_hit
  18920287 ±  9%     -43.6%   10668582 ±  4%     -46.0%   10214237 ±  4%     -31.2%   13023140 ± 11%  numa-numastat.node0.numa_miss
  19025905 ±  9%     -43.5%   10749724 ±  3%     -45.9%   10299624 ±  4%     -31.1%   13105066 ± 11%  numa-numastat.node0.other_node
  56535277 ±  4%     -42.5%   32511952 ±  3%     -45.1%   31014584            -4.9%   53743966 ±  2%  numa-numastat.node1.local_node
  14228056 ±  6%     -29.9%    9967849 ±  3%     -33.3%    9488657 ±  3%      -2.5%   13871144 ± 16%  numa-numastat.node1.numa_foreign
  56618771 ±  4%     -42.4%   32596415 ±  3%     -45.1%   31109797            -4.9%   53829937 ±  2%  numa-numastat.node1.numa_hit
  10146402 ±  5%      -3.8%    9758929 ±  2%      -3.4%    9799142 ±  6%     +19.3%   12105407 ±  6%  numa-numastat.node1.numa_miss
  10233076 ±  5%      -3.8%    9843695 ±  2%      -3.3%    9894436 ±  6%     +19.2%   12193463 ±  6%  numa-numastat.node1.other_node
  53165000 ±  5%     -38.0%   32981697 ±  2%     -41.0%   31364931 ±  2%      -0.4%   52973679        numa-numastat.node2.local_node
  13182856 ±  7%     -22.6%   10202650 ±  5%     -26.7%    9659290 ±  3%      -4.8%   12544230 ±  6%  numa-numastat.node2.numa_foreign
  53265107 ±  5%     -37.9%   33065351 ±  2%     -41.0%   31452697 ±  2%      -0.4%   53065111        numa-numastat.node2.numa_hit
  12626193 ±  4%     -23.6%    9641387 ±  5%     -25.8%    9367817 ±  3%      +6.9%   13500636 ±  8%  numa-numastat.node2.numa_miss
  12723206 ±  4%     -23.5%    9727091 ±  5%     -25.7%    9454042 ±  3%      +6.8%   13593388 ±  8%  numa-numastat.node2.other_node
  53553158 ±  4%     -38.8%   32791369           -40.7%   31754688 ±  2%      -0.3%   53375310        numa-numastat.node3.local_node
  14822055 ± 13%     -32.0%   10075025 ±  4%     -33.3%    9887745 ±  4%     -17.6%   12217967 ±  6%  numa-numastat.node3.numa_foreign
  53612301 ±  4%     -38.7%   32888921           -40.6%   31838271 ±  2%      -0.3%   53456894        numa-numastat.node3.numa_hit
  11766242 ± 12%     -16.8%    9789841 ±  4%     -21.7%    9207177 ±  2%      +9.8%   12916504 ±  7%  numa-numastat.node3.numa_miss
  11826951 ± 12%     -16.4%    9886570 ±  4%     -21.5%    9289581 ±  2%      +9.9%   13002401 ±  7%  numa-numastat.node3.other_node
      5.95 ±  3%     -22.1%       4.63 ±  4%     -27.4%       4.32 ±  9%     -11.6%       5.26 ±  2%  perf-stat.i.MPKI
  3.24e+10 ±  3%     -41.7%  1.888e+10           -48.4%  1.673e+10 ± 13%     +14.0%  3.694e+10        perf-stat.i.branch-instructions
      0.33            +0.0        0.34            +0.2        0.52 ± 32%      -0.0        0.29        perf-stat.i.branch-miss-rate%
  95838227 ±  2%     -45.2%   52482057           -43.6%   54055222 ± 16%     -22.3%   74458420        perf-stat.i.branch-misses
     66.91            +3.8       70.68            -1.8       65.13 ± 11%      +0.3       67.21        perf-stat.i.cache-miss-rate%
 6.536e+08 ±  4%     -56.4%  2.852e+08           -61.7%  2.506e+08 ± 14%      -3.8%   6.29e+08        perf-stat.i.cache-misses
 1.004e+09 ±  4%     -59.5%  4.069e+08           -64.4%  3.575e+08 ± 13%      -4.6%  9.578e+08        perf-stat.i.cache-references
      3578 ±  3%      +6.3%       3804 ±  4%      -1.2%       3536 ±  3%     +33.6%       4781 ±  7%  perf-stat.i.context-switches
      5.02 ±  3%    +111.1%      10.59           +99.2%       9.99 ± 11%      -9.7%       4.53        perf-stat.i.cpi
    225243            +1.0%     227600            +1.1%     227710            -0.2%     224716        perf-stat.i.cpu-clock
 5.886e+11 ±  2%     +23.7%   7.28e+11           +12.4%  6.617e+11 ± 13%     +12.2%  6.606e+11        perf-stat.i.cpu-cycles
    290.25 ±  2%      -7.7%     267.91 ±  2%     -12.4%     254.28 ±  3%     +12.3%     326.01        perf-stat.i.cpu-migrations
    859.86 ±  2%    +201.8%       2594          +196.7%       2551 ±  7%     +10.0%     945.58 ±  2%  perf-stat.i.cycles-between-cache-misses
 1.172e+11 ±  2%     -42.6%  6.733e+10           -49.1%  5.971e+10 ± 13%     +11.2%  1.303e+11        perf-stat.i.instructions
      0.33 ±  3%     -35.8%       0.21           -19.3%       0.27 ± 25%      -5.6%       0.32 ±  2%  perf-stat.i.ipc
      5.53 ±  7%    +240.6%      18.83 ±  3%    +218.6%      17.61 ± 17%    +401.8%      27.73 ± 18%  perf-stat.i.major-faults
      2.83 ± 12%     -81.7%       0.52 ±  3%     -84.1%       0.45 ± 14%     +62.6%       4.60        perf-stat.i.metric.K/sec
    346126 ±  7%     -43.9%     194284           -50.6%     171036 ± 13%     +49.7%     518309        perf-stat.i.minor-faults
    346131 ±  7%     -43.9%     194303           -50.6%     171054 ± 13%     +49.8%     518337        perf-stat.i.page-faults
    225243            +1.0%     227600            +1.1%     227710            -0.2%     224716        perf-stat.i.task-clock
      5.70 ±  2%     -26.5%       4.19           -27.4%       4.13           -15.4%       4.82        perf-stat.overall.MPKI
      0.30            -0.0        0.28            +0.0        0.33 ±  2%      -0.1        0.20        perf-stat.overall.branch-miss-rate%
     64.60            +5.2       69.79            +5.1       69.73            +1.0       65.63        perf-stat.overall.cache-miss-rate%
      5.28 ±  2%    +116.9%      11.46          +123.9%      11.83            -3.7%       5.09        perf-stat.overall.cpi
    927.91          +194.9%       2736          +208.6%       2863           +13.7%       1055        perf-stat.overall.cycles-between-cache-misses
      0.19 ±  2%     -53.9%       0.09           -55.4%       0.08            +3.8%       0.20        perf-stat.overall.ipc
      6654 ±  3%      -0.9%       6597            -0.4%       6628           -25.1%       4982        perf-stat.overall.path-length
  3.23e+10 ±  3%     -42.4%  1.859e+10           -47.4%  1.701e+10 ±  8%     +15.7%  3.736e+10        perf-stat.ps.branch-instructions
  97953773 ±  2%     -46.6%   52288618           -42.0%   56848683 ± 10%     -23.3%   75098323        perf-stat.ps.branch-misses
 6.662e+08 ±  4%     -58.2%  2.782e+08           -62.3%  2.514e+08 ±  9%      -4.6%  6.354e+08        perf-stat.ps.cache-misses
 1.031e+09 ±  4%     -61.3%  3.986e+08           -65.0%  3.606e+08 ±  9%      -6.1%  9.682e+08        perf-stat.ps.cache-references
      3562 ±  3%      +3.9%       3702 ±  4%      -1.9%       3494 ±  2%     +34.1%       4775 ±  8%  perf-stat.ps.context-switches
 6.177e+11 ±  2%     +23.2%  7.612e+11           +16.5%  7.195e+11 ±  8%      +8.6%  6.707e+11        perf-stat.ps.cpu-cycles
    285.57 ±  2%     -10.4%     255.87 ±  2%     -15.4%     241.61 ±  4%     +13.5%     324.22        perf-stat.ps.cpu-migrations
 1.169e+11 ±  2%     -43.2%  6.643e+10           -48.0%  6.083e+10 ±  9%     +12.7%  1.318e+11        perf-stat.ps.instructions
      4.92 ±  6%    +266.3%      18.02 ±  3%    +254.3%      17.43 ± 13%    +471.3%      28.11 ± 17%  perf-stat.ps.major-faults
    344062 ±  6%     -45.4%     188002           -50.5%     170284 ±  9%     +52.4%     524213        perf-stat.ps.minor-faults
    344067 ±  6%     -45.4%     188020           -50.5%     170301 ±  9%     +52.4%     524242        perf-stat.ps.page-faults
 3.215e+13 ±  3%     -31.3%  2.208e+13           -33.2%  2.147e+13           -25.1%  2.407e+13        perf-stat.total.instructions
   1226884 ±  5%     -36.0%     785027 ±  8%     +23.2%    1511805 ± 65%      +2.8%    1261046 ±  7%  numa-vmstat.node0.nr_free_pages
    166318 ±  4%      +5.8%     175958            -5.1%     157824 ± 10%     +28.0%     212909 ±  3%  numa-vmstat.node0.nr_page_table_pages
  11230540 ± 10%     -14.4%    9615282           -14.9%    9553492 ±  3%     +15.0%   12914957 ±  9%  numa-vmstat.node0.numa_foreign
  53443303 ±  4%     -40.0%   32082034 ±  2%     -42.3%   30856944 ±  2%      -1.1%   52844258        numa-vmstat.node0.numa_hit
  53330701 ±  4%     -40.0%   32001564 ±  2%     -42.3%   30773829 ±  2%      -1.1%   52762363        numa-vmstat.node0.numa_local
  18920287 ±  9%     -43.6%   10668582 ±  4%     -46.0%   10214237 ±  4%     -31.2%   13023140 ± 11%  numa-vmstat.node0.numa_miss
  19025905 ±  9%     -43.5%   10749724 ±  3%     -45.9%   10299624 ±  4%     -31.1%   13105066 ± 11%  numa-vmstat.node0.numa_other
   2404851 ± 17%     -81.8%     436913 ± 19%     -80.5%     468574 ± 24%     -29.4%    1697340 ± 14%  numa-vmstat.node0.workingset_nodereclaim
   3035160 ±  3%     +12.0%    3400384 ±  4%      +3.3%    3133854 ± 10%      +4.6%    3174439 ±  7%  numa-vmstat.node1.nr_active_file
   1332733 ±  6%     -40.3%     795144 ±  6%     +17.7%    1568458 ± 66%      -0.4%    1327571 ±  7%  numa-vmstat.node1.nr_free_pages
   8817580 ±  3%     +15.4%   10171927 ±  2%      +6.9%    9428593 ± 10%      +3.6%    9132555 ±  2%  numa-vmstat.node1.nr_mapped
    166937 ±  2%      +5.0%     175300            -5.4%     157885 ± 10%     +27.2%     212407        numa-vmstat.node1.nr_page_table_pages
   3039792 ±  3%     +12.1%    3406582 ±  4%      +3.4%    3142072 ± 10%      +4.6%    3179577 ±  7%  numa-vmstat.node1.nr_zone_active_file
  14228056 ±  6%     -29.9%    9967849 ±  3%     -33.3%    9488657 ±  3%      -2.5%   13871144 ± 16%  numa-vmstat.node1.numa_foreign
  56618372 ±  4%     -42.4%   32596203 ±  3%     -45.1%   31109326            -4.9%   53829441 ±  2%  numa-vmstat.node1.numa_hit
  56534878 ±  4%     -42.5%   32511740 ±  3%     -45.1%   31014114            -4.9%   53743471 ±  2%  numa-vmstat.node1.numa_local
  10146402 ±  5%      -3.8%    9758929 ±  2%      -3.4%    9799142 ±  6%     +19.3%   12105407 ±  6%  numa-vmstat.node1.numa_miss
  10233076 ±  5%      -3.8%    9843695 ±  2%      -3.3%    9894436 ±  6%     +19.2%   12193463 ±  6%  numa-vmstat.node1.numa_other
    954127 ± 20%     -73.1%     256611 ± 34%     -71.6%     270621 ± 33%     +25.2%    1195021 ± 24%  numa-vmstat.node1.workingset_nodereclaim
   3046975 ±  3%     +12.3%    3422217 ±  3%      +3.6%    3156615 ± 12%      +0.8%    3070205 ±  5%  numa-vmstat.node2.nr_active_file
   1320090 ±  8%     -39.7%     796670 ±  4%     +18.4%    1562543 ± 64%      +0.9%    1331463 ±  4%  numa-vmstat.node2.nr_free_pages
   8977022 ±  3%     +13.0%   10145019 ±  3%      +6.4%    9553399 ± 11%      +1.0%    9070716 ±  2%  numa-vmstat.node2.nr_mapped
    166832 ±  2%      +5.2%     175431            -6.0%     156887 ± 10%     +27.4%     212464 ±  2%  numa-vmstat.node2.nr_page_table_pages
    169424 ±  8%     +12.7%     191016 ±  5%      +2.2%     173094 ±  9%      +0.9%     170930 ±  8%  numa-vmstat.node2.nr_slab_reclaimable
   3051630 ±  3%     +12.4%    3431556 ±  3%      +3.6%    3162379 ± 12%      +0.9%    3079502 ±  5%  numa-vmstat.node2.nr_zone_active_file
  13182856 ±  7%     -22.6%   10202650 ±  5%     -26.7%    9659290 ±  3%      -4.8%   12544230 ±  6%  numa-vmstat.node2.numa_foreign
  53264088 ±  5%     -37.9%   33064447 ±  2%     -41.0%   31451863 ±  2%      -0.4%   53064445        numa-vmstat.node2.numa_hit
  53163982 ±  5%     -38.0%   32980793 ±  2%     -41.0%   31364093 ±  2%      -0.4%   52973013        numa-vmstat.node2.numa_local
  12626193 ±  4%     -23.6%    9641387 ±  5%     -25.8%    9367817 ±  3%      +6.9%   13500636 ±  8%  numa-vmstat.node2.numa_miss
  12723206 ±  4%     -23.5%    9727091 ±  5%     -25.7%    9454042 ±  3%      +6.8%   13593388 ±  8%  numa-vmstat.node2.numa_other
    919386 ± 31%     -64.5%     326738 ± 18%     -68.2%     292149 ± 38%      -5.5%     869137 ±  9%  numa-vmstat.node2.workingset_nodereclaim
   3025992            +9.3%    3308587 ±  3%      +5.2%    3184016 ±  9%      +2.4%    3097552 ±  4%  numa-vmstat.node3.nr_active_file
   1395961 ±  3%     -43.3%     791816 ±  3%     +11.4%    1555626 ± 65%      -7.6%    1289705 ±  5%  numa-vmstat.node3.nr_free_pages
    113754 ± 41%      +8.1%     122994 ± 17%      +6.0%     120611 ± 22%     -64.9%      39920 ± 63%  numa-vmstat.node3.nr_inactive_anon
   8971283 ±  4%     +13.5%   10181092            +5.8%    9488578 ±  9%      +0.5%    9016607 ±  3%  numa-vmstat.node3.nr_mapped
    171114 ±  5%      +2.4%     175296            -8.3%     156889 ± 10%     +21.8%     208408 ±  3%  numa-vmstat.node3.nr_page_table_pages
    163305 ± 25%     +16.0%     189436 ±  9%     +15.4%     188460 ± 15%     -67.9%      52479 ± 33%  numa-vmstat.node3.nr_shmem
   3030697            +9.4%    3314830 ±  3%      +5.3%    3189831 ±  9%      +2.4%    3102693 ±  4%  numa-vmstat.node3.nr_zone_active_file
    113675 ± 41%      +8.2%     122992 ± 17%      +6.1%     120610 ± 22%     -64.9%      39918 ± 63%  numa-vmstat.node3.nr_zone_inactive_anon
  14822055 ± 13%     -32.0%   10075025 ±  4%     -33.3%    9887745 ±  4%     -17.6%   12217967 ±  6%  numa-vmstat.node3.numa_foreign
  53610436 ±  4%     -38.7%   32888516           -40.6%   31837112 ±  2%      -0.3%   53455092        numa-vmstat.node3.numa_hit
  53551293 ±  4%     -38.8%   32790963           -40.7%   31753529 ±  2%      -0.3%   53373507        numa-vmstat.node3.numa_local
  11766242 ± 12%     -16.8%    9789841 ±  4%     -21.7%    9207177 ±  2%      +9.8%   12916504 ±  7%  numa-vmstat.node3.numa_miss
  11826951 ± 12%     -16.4%    9886570 ±  4%     -21.5%    9289581 ±  2%      +9.9%   13002401 ±  7%  numa-vmstat.node3.numa_other
    925252 ± 26%     -66.0%     314477 ± 22%     -67.3%     302227 ± 15%      +5.2%     973634 ± 17%  numa-vmstat.node3.workingset_nodereclaim
  26042583 ±  5%     +24.2%   32343080 ± 10%     +43.8%   37446150 ±  5%     -38.5%   16024952 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.avg
  28289592 ±  6%     +20.6%   34111958 ± 11%     +38.7%   39248002 ±  6%     -40.0%   16973252 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.max
   5569284 ± 52%     -96.3%     205900 ± 37%     -62.4%    2094368 ±140%     -93.8%     346140 ±170%  sched_debug.cfs_rq:/.avg_vruntime.min
   2663785 ± 13%     +37.7%    3669196 ±  6%     +53.8%    4096457 ±  5%     -26.9%    1948436 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.60 ±  7%     +41.6%       0.85 ±  2%     +39.7%       0.84 ±  6%      +6.2%       0.64 ± 12%  sched_debug.cfs_rq:/.h_nr_queued.avg
      1.55 ±  8%     +29.4%       2.01 ±  5%     +26.7%       1.96 ±  8%      +7.5%       1.67 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.29 ±  6%     -29.3%       0.21 ±  9%     -31.6%       0.20 ±  6%     -34.5%       0.19 ± 10%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.60 ±  7%     +41.6%       0.85           +39.7%       0.84 ±  6%      +6.2%       0.64 ± 12%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      1.52 ±  9%     +32.2%       2.01 ±  5%     +28.1%       1.94 ±  8%      +7.8%       1.64 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.29 ±  6%     -29.5%       0.21 ± 10%     -32.0%       0.20 ±  6%     -35.0%       0.19 ±  8%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
     27841 ± 24%     -17.5%      22967 ± 11%     -16.0%      23393 ± 14%     -33.7%      18446 ± 17%  sched_debug.cfs_rq:/.load.avg
    137171 ± 12%      -8.6%     125407 ±  6%      -4.3%     131315 ± 10%     -24.4%     103716 ± 13%  sched_debug.cfs_rq:/.load.stddev
     33.98 ± 16%     -16.6%      28.35 ±  6%     -15.9%      28.58 ±  9%      +4.9%      35.65 ± 76%  sched_debug.cfs_rq:/.load_avg.avg
  26042586 ±  5%     +24.2%   32343084 ± 10%     +43.8%   37446154 ±  5%     -38.5%   16024954 ± 14%  sched_debug.cfs_rq:/.min_vruntime.avg
  28289592 ±  6%     +20.6%   34111958 ± 11%     +38.7%   39248002 ±  6%     -40.0%   16973252 ± 15%  sched_debug.cfs_rq:/.min_vruntime.max
   5569284 ± 52%     -96.3%     205900 ± 37%     -62.4%    2094368 ±140%     -93.8%     346140 ±170%  sched_debug.cfs_rq:/.min_vruntime.min
   2663785 ± 13%     +37.7%    3669195 ±  6%     +53.8%    4096457 ±  5%     -26.9%    1948437 ± 14%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.59 ±  7%     +38.8%       0.82           +37.2%       0.81 ±  6%      +4.4%       0.62 ± 13%  sched_debug.cfs_rq:/.nr_queued.avg
      0.26 ±  6%     -59.4%       0.11 ± 26%     -62.7%       0.10 ± 15%     -56.9%       0.11 ± 31%  sched_debug.cfs_rq:/.nr_queued.stddev
    226.57 ± 21%      -2.1%     221.83 ± 38%     -27.4%     164.57 ±  6%     +36.5%     309.30 ± 43%  sched_debug.cfs_rq:/.removed.load_avg.max
     30.84 ± 20%     -18.5%      25.14 ± 35%     -29.3%      21.81 ± 29%     +33.3%      41.10 ± 46%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    116.17 ± 22%      +2.8%     119.39 ± 60%     -27.6%      84.10 ±  8%     +30.4%     151.49 ± 39%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    116.17 ± 22%      -9.9%     104.72 ± 39%     -27.6%      84.10 ±  8%     +24.2%     144.27 ± 39%  sched_debug.cfs_rq:/.removed.util_avg.max
    625.72 ±  7%     +41.3%     883.96           +39.1%     870.63 ±  6%      +7.6%     673.15 ± 13%  sched_debug.cfs_rq:/.runnable_avg.avg
      1492 ±  5%     +31.8%       1967 ±  3%     +27.8%       1906 ±  4%     +10.9%       1654 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    284.33 ±  6%     -29.2%     201.27 ±  8%     -33.0%     190.51 ±  6%     -35.7%     182.69 ± 11%  sched_debug.cfs_rq:/.runnable_avg.stddev
    613.28 ±  7%     +38.6%     850.28           +36.7%     838.66 ±  6%      +6.5%     653.13 ± 13%  sched_debug.cfs_rq:/.util_avg.avg
      1227 ±  3%     +12.3%       1377 ±  3%     +10.1%       1351 ±  5%     +11.2%       1365 ±  9%  sched_debug.cfs_rq:/.util_avg.max
    250.81 ±  4%     -54.7%     113.67 ± 16%     -59.3%     102.11 ± 11%     -48.2%     129.80 ± 10%  sched_debug.cfs_rq:/.util_avg.stddev
    472.34 ±  6%     +14.7%     541.81 ±  9%     +17.6%     555.66 ±  8%      -8.8%     430.79 ± 20%  sched_debug.cfs_rq:/.util_est.avg
      1293 ±  8%     +34.5%       1739 ±  5%     +25.4%       1621 ±  8%     +11.3%       1438 ± 11%  sched_debug.cfs_rq:/.util_est.max
    307.05 ±  7%      -1.6%     302.05 ±  6%      -8.5%     280.94 ±  5%     -24.9%     230.63 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
    113130 ± 21%     +55.7%     176123 ± 28%    +113.7%     241712 ± 47%     +40.5%     159001 ± 45%  sched_debug.cpu.avg_idle.min
    170684 ±  6%      +6.9%     182523 ±  8%     +30.8%     223234 ± 16%     -31.2%     117363 ± 12%  sched_debug.cpu.clock.avg
    170713 ±  6%      +7.0%     182635 ±  8%     +30.8%     223304 ± 16%     -31.2%     117399 ± 12%  sched_debug.cpu.clock.max
    170647 ±  6%      +6.9%     182402 ±  8%     +30.8%     223148 ± 16%     -31.2%     117320 ± 12%  sched_debug.cpu.clock.min
     17.82 ± 12%    +263.4%      64.74 ± 14%    +163.0%      46.85 ± 28%     +24.7%      22.22 ± 21%  sched_debug.cpu.clock.stddev
    170095 ±  6%      +7.0%     182084 ±  8%     +31.0%     222761 ± 16%     -31.3%     116885 ± 12%  sched_debug.cpu.clock_task.avg
    170366 ±  6%      +7.0%     182343 ±  8%     +30.9%     222981 ± 16%     -31.2%     117187 ± 12%  sched_debug.cpu.clock_task.max
    157562 ±  7%      +7.5%     169450 ±  9%     +33.7%     210623 ± 17%     -33.5%     104794 ± 13%  sched_debug.cpu.clock_task.min
      3198 ±  4%     +52.1%       4863           +50.0%       4798 ±  6%     +13.6%       3634 ± 13%  sched_debug.cpu.curr->pid.avg
      9729 ±  3%      -0.4%       9694 ±  5%      +5.8%      10289 ±  4%     -19.4%       7840 ±  6%  sched_debug.cpu.curr->pid.max
      1544 ±  5%     -41.8%     898.71 ±  9%     -42.5%     887.59 ±  6%     -44.5%     858.09 ± 11%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 26%    +198.9%       0.00 ± 15%    +156.3%       0.00 ± 12%      -4.8%       0.00 ± 12%  sched_debug.cpu.next_balance.stddev
      0.56 ±  4%     +52.3%       0.85           +50.2%       0.84 ±  6%     +14.1%       0.64 ± 13%  sched_debug.cpu.nr_running.avg
      1.68 ± 13%     +22.8%       2.07 ±  6%     +21.5%       2.04 ± 10%      +1.5%       1.71 ±  7%  sched_debug.cpu.nr_running.max
      0.30 ±  8%     -27.8%       0.21 ±  9%     -30.3%       0.21 ±  8%     -34.5%       0.19 ±  9%  sched_debug.cpu.nr_running.stddev
      2958 ±  4%      +5.1%       3109 ± 11%     +16.1%       3433 ±  7%     -17.1%       2453 ± 16%  sched_debug.cpu.nr_switches.avg
      1028 ±  8%     -13.5%     889.74 ±  7%      -4.3%     984.66 ±  8%     -37.5%     643.32 ± 12%  sched_debug.cpu.nr_switches.min
      2121 ±  7%     +15.2%       2444 ± 15%     +23.7%       2623 ± 10%      +1.0%       2142 ± 17%  sched_debug.cpu.nr_switches.stddev
    170653 ±  6%      +6.9%     182400 ±  8%     +30.8%     223145 ± 16%     -31.3%     117323 ± 12%  sched_debug.cpu_clk
    169804 ±  6%      +6.9%     181548 ±  8%     +30.9%     222295 ± 16%     -31.4%     116473 ± 12%  sched_debug.ktime
    171435 ±  6%      +6.9%     183225 ±  8%     +30.6%     223900 ± 16%     -31.1%     118087 ± 12%  sched_debug.sched_clk
   4828005 ±  2%     -36.7%    3055295           -39.3%    2930398            -3.9%    4637517        proc-vmstat.allocstall_movable
     19547 ±  3%    +181.7%      55069          +174.3%      53609          +230.1%      64518        proc-vmstat.allocstall_normal
 1.308e+08 ± 18%     +81.5%  2.373e+08 ± 18%     +71.5%  2.243e+08 ± 13%    +234.1%  4.369e+08 ± 18%  proc-vmstat.compact_daemon_free_scanned
 1.503e+08 ± 13%     -82.4%   26384666 ± 37%     -83.2%   25185230 ± 16%     -81.0%   28501389 ± 16%  proc-vmstat.compact_daemon_migrate_scanned
      2891 ± 12%     -97.4%      76.17 ± 29%     -96.9%      90.75 ± 19%     -92.7%     211.62 ± 43%  proc-vmstat.compact_daemon_wake
   1520826 ± 19%     -99.9%       1855 ± 38%     -99.8%       2497 ± 67%     -99.7%       5024 ±100%  proc-vmstat.compact_fail
 1.762e+08 ± 14%     +35.6%  2.388e+08 ± 18%     +28.4%  2.262e+08 ± 13%    +150.7%  4.416e+08 ± 17%  proc-vmstat.compact_free_scanned
  33090251 ± 10%     -40.6%   19664055 ± 31%     -40.4%   19726165 ± 13%     -25.3%   24731462 ± 11%  proc-vmstat.compact_isolated
 1.826e+10 ±  5%     -99.7%   49399799 ± 29%     -99.7%   54234660 ± 36%     -99.6%   79280517 ± 47%  proc-vmstat.compact_migrate_scanned
   2450182 ± 21%     -99.4%      15045 ± 15%     -99.3%      16582 ± 29%     -98.8%      28362 ± 47%  proc-vmstat.compact_stall
    929355 ± 26%     -98.6%      13190 ± 13%     -98.5%      14085 ± 22%     -97.5%      23338 ± 36%  proc-vmstat.compact_success
      3716 ± 15%     -96.4%     134.00 ± 18%     -94.6%     200.50 ± 33%     -89.7%     382.62 ± 36%  proc-vmstat.kswapd_low_wmark_hit_quickly
    191553 ±  3%     +13.4%     217163 ±  3%     +15.2%     220698 ±  7%     -24.8%     144034 ±  4%  proc-vmstat.nr_active_anon
  12143003 ±  2%      +8.5%   13179985 ±  2%      +3.0%   12506962 ±  8%      +1.0%   12267487        proc-vmstat.nr_active_file
    174346            +0.2%     174651            -0.3%     173784            +1.6%     177080        proc-vmstat.nr_anon_pages
  41767951            +5.4%   44014874            -1.1%   41312209 ±  8%      -0.5%   41549076        proc-vmstat.nr_file_pages
   5235973 ±  2%     -43.9%    2939596 ±  2%     +10.5%    5788020 ± 65%      -1.6%    5151177 ±  4%  proc-vmstat.nr_free_pages
    195319 ±  5%      +1.1%     197415 ±  2%      +1.8%     198737 ± 12%     -35.1%     126699 ±  3%  proc-vmstat.nr_inactive_anon
  28515253            +4.1%   29688629            -3.0%   27651676 ±  9%      -0.8%   28282751        proc-vmstat.nr_inactive_file
     75.88 ± 13%     -20.3%      60.50 ± 29%     -28.6%      54.18 ± 37%     +82.1%     138.19 ± 20%  proc-vmstat.nr_isolated_file
     42800            +2.6%      43922            +1.3%      43348            +1.3%      43362        proc-vmstat.nr_kernel_stack
  35859536           +12.9%   40468962            +5.7%   37892928 ±  9%      +0.4%   36017924        proc-vmstat.nr_mapped
    672657 ±  2%      +5.5%     709985            -4.9%     639808 ±  9%     +26.3%     849359        proc-vmstat.nr_page_table_pages
    213344 ±  7%     +12.8%     240725 ±  4%     +15.5%     246461 ± 10%     -55.7%      94464 ±  3%  proc-vmstat.nr_shmem
    746816 ±  2%      +4.2%     777915            -3.5%     720723 ±  9%      +4.6%     781061        proc-vmstat.nr_slab_reclaimable
    192129 ±  3%     +13.1%     217232 ±  3%     +14.9%     220760 ±  7%     -25.0%     144112 ±  4%  proc-vmstat.nr_zone_active_anon
  12164300 ±  2%      +8.6%   13206949 ±  2%      +3.0%   12532232 ±  8%      +1.0%   12291549        proc-vmstat.nr_zone_active_file
    194816 ±  5%      +1.3%     197412 ±  2%      +2.0%     198733 ± 12%     -35.0%     126681 ±  3%  proc-vmstat.nr_zone_inactive_anon
  28495099            +4.1%   29661915            -3.0%   27626694 ±  9%      -0.8%   28258909        proc-vmstat.nr_zone_inactive_file
  53463509 ±  2%     -25.4%   39860806           -27.8%   38589184            -3.6%   51548300 ±  3%  proc-vmstat.numa_foreign
     46231 ± 15%     -74.8%      11635 ± 61%     -75.0%      11553 ± 35%     -64.9%      16238 ± 54%  proc-vmstat.numa_hint_faults
     36770 ± 26%     -84.6%       5645 ± 68%     -81.9%       6670 ± 52%     -72.7%      10054 ± 71%  proc-vmstat.numa_hint_faults_local
 2.169e+08 ±  3%     -39.8%  1.306e+08           -42.3%  1.253e+08            -1.7%  2.132e+08        proc-vmstat.numa_hit
 2.166e+08 ±  3%     -39.8%  1.303e+08           -42.3%  1.249e+08            -1.7%  2.129e+08        proc-vmstat.numa_local
  53459124 ±  2%     -25.4%   39858740           -27.8%   38588374            -3.6%   51545689 ±  3%  proc-vmstat.numa_miss
  53809139 ±  2%     -25.3%   40207081           -27.6%   38937684            -3.6%   51894319 ±  3%  proc-vmstat.numa_other
      6545 ± 80%     -92.1%     517.83 ± 48%     -83.5%       1081 ± 68%     -94.8%     340.12 ± 18%  proc-vmstat.numa_pages_migrated
    136643 ± 40%     -70.2%      40747 ± 85%     -55.3%      61018 ± 62%     -53.5%      63487 ± 84%  proc-vmstat.numa_pte_updates
      3746 ± 15%     -96.0%     149.50 ± 17%     -94.2%     218.12 ± 31%     -89.2%     403.12 ± 33%  proc-vmstat.pageoutrun
  94282999           -24.3%   71368473           -26.6%   69232966            +0.8%   95049121        proc-vmstat.pgactivate
  10012599 ±  4%     -43.2%    5686084 ±  3%     -45.4%    5462427 ±  3%     -13.4%    8674039 ±  4%  proc-vmstat.pgalloc_dma32
 1.069e+09           -34.4%  7.014e+08           -36.9%  6.748e+08            +0.1%   1.07e+09        proc-vmstat.pgalloc_normal
  94463121           -33.7%   62613232           -36.2%   60238525            +1.5%   95858739        proc-vmstat.pgfault
 1.095e+09           -34.6%  7.165e+08           -37.0%  6.898e+08            -0.4%  1.091e+09        proc-vmstat.pgfree
      1339 ±  3%    +346.2%       5975 ±  3%    +358.0%       6133 ±  8%    +282.7%       5124 ± 18%  proc-vmstat.pgmajfault
     74970 ± 36%     -95.3%       3527 ± 22%     -94.9%       3850 ± 22%     -93.7%       4693 ± 34%  proc-vmstat.pgmigrate_fail
  16249857 ± 11%     -39.5%    9827004 ± 31%     -39.3%    9858267 ± 13%     -24.0%   12351659 ± 11%  proc-vmstat.pgmigrate_success
      2211            +6.1%       2345            +4.6%       2313 ±  2%     +53.8%       3401 ± 39%  proc-vmstat.pgpgin
  20426382 ± 10%     -45.8%   11078695           -48.3%   10560458 ±  2%      -2.5%   19913760        proc-vmstat.pgrefill
     53930 ±  5%      -2.1%      52803            +0.5%      54210 ±  6%     -27.2%      39267        proc-vmstat.pgreuse
 1.191e+09           -26.3%  8.784e+08           -29.2%  8.432e+08           +10.1%  1.312e+09        proc-vmstat.pgscan_direct
 1.394e+09           -33.9%  9.209e+08           -36.6%  8.844e+08            +0.2%  1.397e+09        proc-vmstat.pgscan_file
      3200 ±122%    +251.2%      11238 ±  8%    +311.7%      13175 ± 15%     +60.3%       5128 ± 11%  proc-vmstat.pgscan_khugepaged
 2.027e+08 ±  8%     -79.0%   42500310 ±  3%     -79.7%   41212659 ±  4%     -57.9%   85419213 ±  5%  proc-vmstat.pgscan_kswapd
      8913 ±  5%     -27.3%       6476 ±  3%     -28.5%       6370 ±  4%     -35.2%       5772 ±  2%  proc-vmstat.pgskip_normal
 8.692e+08           -28.3%  6.229e+08           -31.3%  5.971e+08           +10.5%  9.601e+08        proc-vmstat.pgsteal_direct
 1.041e+09           -36.9%  6.566e+08           -39.5%    6.3e+08            -1.0%   1.03e+09        proc-vmstat.pgsteal_file
 1.714e+08 ±  7%     -80.3%   33771596 ±  4%     -80.8%   32889815 ±  5%     -59.0%   70248436 ±  6%  proc-vmstat.pgsteal_kswapd
  24999520 ± 10%     -76.1%    5984550 ±  5%     -78.5%    5362533 ±  5%     -26.9%   18265931 ±  6%  proc-vmstat.slabs_scanned
   5158406 ±  6%     -74.7%    1306603 ±  4%     -74.9%    1293326 ± 16%      -8.9%    4699442 ±  2%  proc-vmstat.workingset_nodereclaim
   3779163 ±  3%      +7.9%    4077693            -0.5%    3758804 ±  9%      +4.4%    3943980 ±  2%  proc-vmstat.workingset_nodes
      0.78 ± 54%    +265.2%       2.84 ± 51%   +1249.1%      10.49 ±182%     -12.5%       0.68 ±138%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      1.45 ± 30%    +133.0%       3.39 ± 27%    +160.4%       3.78 ± 29%     -25.1%       1.09 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      0.98 ± 53%     +77.2%       1.74 ±136%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      2.39 ±  5%    +135.5%       5.63 ± 11%    +145.0%       5.86 ± 17%      -2.1%       2.34 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      2.62 ± 56%     +78.5%       4.68 ± 24%    +133.0%       6.11 ± 39%     -12.8%       2.29 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      2.32 ± 14%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
      2.56 ± 10%    +126.4%       5.80 ± 10%     +93.6%       4.96 ± 14%     -22.2%       1.99 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      2.04 ± 15%    +244.6%       7.04 ±115%    +324.0%       8.66 ±166%     +16.6%       2.38 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      1.52 ± 38%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      2.40 ± 24%     -24.7%       1.80 ±107%     +46.8%       3.52 ± 38%     -60.1%       0.96 ± 82%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.00 ±223%  +1.9e+06%      27.79 ±210%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      1.54 ± 27%    +148.8%       3.83 ± 34%    +215.4%       4.86 ± 30%     -64.0%       0.55 ± 42%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.63 ± 49%    +165.4%       4.33 ± 60%    +532.2%      10.32 ±146%     +56.2%       2.55 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.page_cache_ra_order.filemap_fault.__do_fault
      2.27 ± 87%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
      2.44 ± 21%    +114.5%       5.24 ± 10%    +124.0%       5.48 ± 17%      -1.5%       2.41 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.01 ±223%  +21626.2%       2.35 ± 83%  +22370.0%       2.43 ±126%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.01 ± 64%  +14883.3%       1.05 ±135%  +12248.2%       0.86 ±115%    +598.2%       0.05 ± 97%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      4.10 ± 35%    -100.0%       0.00           -99.8%       0.01 ±264%     -99.1%       0.04 ± 84%  perf-sched.sch_delay.avg.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      3.31 ± 61%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
      2.20 ± 12%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
      2.18 ± 14%    -100.0%       0.00          -100.0%       0.00           -86.0%       0.30 ±264%  perf-sched.sch_delay.avg.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.50 ±215%  +18617.1%      94.12 ±210%    +389.8%       2.46 ±112%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.74 ±150%    +236.4%       2.50 ± 62%    +399.0%       3.71 ± 69%      -2.1%       0.73 ±169%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
      2.69 ± 23%    -100.0%       0.00         +2113.9%      59.50 ±264%     -65.8%       0.92 ±226%  perf-sched.sch_delay.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
      0.85 ± 51%     +90.7%       1.62 ± 84%     +66.6%       1.42 ± 28%     -99.7%       0.00 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.alloc_bprm
      0.05 ±223%   +4260.6%       2.05 ±100%   +5335.9%       2.55 ± 59%     -89.9%       0.00 ±202%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      2.96 ± 14%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.66 ± 21%    -100.0%       0.00          -100.0%       0.00           +24.0%       2.06 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
      3.61 ± 18%     -34.7%       2.36 ± 73%     -10.3%       3.24 ± 52%     -36.1%       2.31 ± 35%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      2.61 ±  5%     +81.1%       4.73 ± 10%     +91.8%       5.01 ± 14%     -18.0%       2.14 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      1.59 ± 11%    +171.8%       4.31 ± 46%    +238.6%       5.37 ± 22%     -47.8%       0.83 ± 58%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.68 ± 33%     +37.0%       3.67 ±  9%     +64.8%       4.42 ± 62%     -41.5%       1.57 ± 25%  perf-sched.sch_delay.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      0.63 ± 76%   +3515.1%      22.67 ±195%   +1455.1%       9.75 ±189%     +58.3%       0.99 ± 76%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      6.17 ± 89%     +97.1%      12.16 ± 37%     -18.1%       5.05 ± 66%     -96.5%       0.22 ± 90%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.38 ± 17%    +150.2%       0.94 ± 38%    +256.4%       1.34 ± 37%     -16.1%       0.32 ± 37%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.86 ± 93%    -100.0%       0.00           -98.5%       0.01 ±229%     -70.3%       0.25 ±107%  perf-sched.sch_delay.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      0.77 ± 19%     +94.0%       1.50 ± 57%    +168.3%       2.08 ± 47%     -67.1%       0.26 ± 78%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.53 ± 15%    +133.5%       5.91 ± 41%    +142.1%       6.12 ± 32%      -6.5%       2.36 ± 10%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.92 ± 41%     +60.5%       1.48 ±100%    +191.6%       2.69 ± 54%     -30.9%       0.64 ±103%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      2.82 ± 16%    +130.6%       6.49 ± 40%     +88.1%       5.30 ± 15%      -2.7%       2.74 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.38 ±105%     +73.0%       0.66 ± 66%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.31 ±141%    +251.7%       4.62 ±100%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.23 ± 46%     +14.1%       2.54 ± 42%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.79 ± 43%   +1820.1%      15.24 ±188%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      6.19 ±169%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00 ±264%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
      0.97 ± 14%     +55.7%       1.51 ± 90%    +136.6%       2.30 ± 72%     -68.0%       0.31 ± 70%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.88 ±140%     +59.5%       6.18 ±158%     +30.2%       5.05 ±171%     -92.5%       0.29 ± 67%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.11 ±130%    -100.0%       0.00           -93.9%       0.01 ±132%     -87.2%       0.01 ± 89%  perf-sched.sch_delay.avg.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
      0.79 ± 15%     +70.1%       1.34 ± 61%    +164.1%       2.08 ± 80%     -70.4%       0.23 ± 43%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.59 ± 23%    +224.0%       1.91 ± 26%    +158.7%       1.52 ± 37%     -55.4%       0.26 ± 11%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.16 ± 65%    +272.6%       0.61 ±198%      -5.7%       0.16 ±163%     -81.2%       0.03 ± 56%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.36 ± 29%      +9.2%       1.49 ±117%     +29.4%       1.76 ± 85%     -67.8%       0.44 ±104%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      1.26 ± 24%    +181.3%       3.54 ± 23%    +186.8%       3.61 ± 17%     -62.1%       0.48 ±  7%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.38 ± 60%    +527.9%      14.95 ± 78%   +6008.8%     145.45 ±240%     -11.9%       2.10 ±132%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      4.40 ± 38%    +250.7%      15.42 ± 19%    +381.9%      21.18 ± 61%     -33.0%       2.94 ± 39%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      1.34 ± 46%    +118.8%       2.93 ±147%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    208.26 ± 51%    +146.1%     512.53 ± 45%    +235.7%     699.12 ± 43%     -60.2%      82.98 ± 43%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     18.01 ± 57%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
    128.58 ± 48%    +493.6%     763.29 ± 40%    +203.4%     390.06 ± 60%     -60.1%      51.28 ± 51%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      1.13 ±207%    +550.5%       7.37 ± 84%    +675.5%       8.78 ± 64%     -57.8%       0.48 ±249%  perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      6.41 ± 42%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      6.74 ± 39%     +49.0%      10.05 ±123%     +97.5%      13.32 ± 40%     -57.0%       2.90 ± 73%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.00 ±223%  +1.2e+07%     186.87 ±216%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      3.42 ± 46%   +1591.8%      57.78 ±149%    +260.1%      12.30 ± 35%     -53.8%       1.58 ±100%  perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      4.63 ± 77%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
     20.61 ± 74%    +914.8%     209.17 ±121%   +1062.6%     239.64 ± 80%     +85.9%      38.32 ±108%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.01 ±223%  +43838.5%       4.76 ± 83%  +37171.5%       4.04 ±129%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.03 ±168%  +25398.1%       8.84 ±113%  +23276.6%       8.10 ± 53%   +2781.7%       1.00 ±141%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      9.80 ± 40%     -65.4%       3.39 ±129%     -87.7%       1.21 ±162%     -58.8%       4.04 ± 55%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     23.01 ±114%    -100.0%       0.00          -100.0%       0.01 ±264%     -99.8%       0.06 ± 64%  perf-sched.sch_delay.max.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      5.92 ± 48%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
     25.32 ± 28%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
     17.84 ± 26%    -100.0%       0.00          -100.0%       0.00           -97.9%       0.37 ±264%  perf-sched.sch_delay.max.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.51 ±210%  +36510.2%     187.87 ±210%    +764.1%       4.43 ± 93%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.74 ±150%    +731.1%       6.18 ± 68%    +755.9%       6.37 ± 95%     +16.2%       0.86 ±153%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
      9.68 ± 42%    -100.0%       0.00         +1716.6%     175.82 ±264%     -79.7%       1.96 ±156%  perf-sched.sch_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
      1.89 ± 44%    +441.0%      10.22 ± 79%    +292.0%       7.41 ± 47%     -99.8%       0.00 ±155%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.alloc_bprm
      0.05 ±223%  +10820.9%       5.13 ±101%  +13454.5%       6.37 ± 47%     -89.9%       0.00 ±202%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      7.52 ± 19%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
     26.92 ± 77%    -100.0%       0.00          -100.0%       0.00           -61.7%      10.31 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
    200.50 ± 36%    +180.0%     561.35 ± 52%    +249.3%     700.26 ± 27%     -61.2%      77.75 ± 64%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      3.26 ± 29%     -28.7%       2.32 ± 60%     -26.5%       2.39 ± 78%     -66.5%       1.09 ±102%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.21 ± 71%  +17474.9%     213.15 ±210%  +11182.9%     136.84 ±239%    +127.5%       2.76 ± 94%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      6.98 ± 71%     +81.7%      12.68 ± 30%     -21.7%       5.46 ± 60%     -94.7%       0.37 ± 85%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      5.86 ± 47%    +207.0%      18.00 ± 94%    +426.3%      30.86 ± 61%      +9.5%       6.42 ± 50%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.65 ±168%    -100.0%       0.00           -99.9%       0.02 ±240%     -88.3%       1.83 ±109%  perf-sched.sch_delay.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      2.60 ± 31%    +273.0%       9.68 ± 82%    +416.2%      13.40 ± 42%     -19.7%       2.08 ± 83%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.87 ± 38%    +213.0%       5.85 ± 93%    +651.4%      14.04 ± 17%      +8.3%       2.02 ± 88%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
    368.10 ±127%    +154.7%     937.69 ± 43%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.31 ±141%    +356.6%       6.00 ± 82%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     19.65 ±105%     -22.5%      15.23 ± 57%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      4.84 ± 74%   +3625.1%     180.43 ±206%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     62.50 ±201%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00 ±264%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
    121.47 ±162%     +52.3%     185.00 ±204%     -34.2%      79.91 ±215%     -98.3%       2.12 ± 54%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.86 ±151%    -100.0%       0.00           -98.7%       0.01 ±154%     -96.2%       0.03 ± 92%  perf-sched.sch_delay.max.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
     58.28 ±121%    +153.5%     147.75 ±103%    +490.6%     344.22 ±119%     -86.4%       7.95 ± 89%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    184.61 ± 15%    +245.5%     637.81 ± 19%    +212.8%     577.38 ± 28%     -68.2%      58.76 ± 22%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    184.34 ± 18%    +264.7%     672.25 ± 31%    +364.8%     856.74 ± 55%     -65.4%      63.72 ± 24%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.66 ±  9%     +93.7%       3.21 ± 20%     +78.5%       2.96 ± 14%     -20.9%       1.31 ± 13%  perf-sched.total_sch_delay.average.ms
    662.36 ± 55%     +73.5%       1148 ±  9%     +89.2%       1253 ± 27%     -71.9%     185.98 ± 87%  perf-sched.total_sch_delay.max.ms
    133.24 ±  5%      -7.9%     122.73 ± 12%     -12.3%     116.85 ±  9%     -23.6%     101.83 ±  8%  perf-sched.total_wait_and_delay.average.ms
     20314 ± 10%      -3.3%      19639 ± 14%      -0.9%      20122 ± 17%     +44.6%      29380 ±  8%  perf-sched.total_wait_and_delay.count.ms
    131.58 ±  5%      -9.2%     119.52 ± 12%     -13.4%     113.89 ±  9%     -23.6%     100.51 ±  9%  perf-sched.total_wait_time.average.ms
      4.79 ±  5%    +135.3%      11.27 ± 11%    +144.9%      11.72 ± 17%      -2.1%       4.68 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      5.31 ±  6%    +123.3%      11.86 ± 12%    +106.7%      10.98 ± 14%      -7.5%       4.91 ± 16%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      4.08 ± 15%    -100.0%       0.00          -100.0%       0.00           +16.6%       4.76 ± 14%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      6.19 ± 13%     +69.9%      10.51 ± 19%     +96.3%      12.14 ± 20%     -32.9%       4.15 ± 13%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.23 ± 75%    +224.3%      10.49 ± 10%    +238.7%      10.95 ± 17%     +49.0%       4.82 ± 13%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      4.40 ± 12%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
      4.58 ± 20%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      2.61 ± 49%    -100.0%       0.00          -100.0%       0.00           +85.2%       4.84 ± 42%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
      5.21 ±  5%    +132.3%      12.11 ±  8%    +141.9%      12.61 ± 12%      +5.9%       5.52 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      4.92 ± 22%    +130.6%      11.35 ± 29%    +183.4%      13.95 ± 61%     -75.7%       1.19 ±140%  perf-sched.wait_and_delay.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      4.40 ± 18%    +241.9%      15.06 ± 39%    +331.2%      18.99 ± 26%     -69.1%       1.36 ±180%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    400.86            +2.5%     410.98 ±  3%     -28.8%     285.40 ± 19%     -22.0%     312.53 ±  7%  perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      4.99 ± 16%    +136.4%      11.80 ± 41%    +145.4%      12.25 ± 32%      -5.3%       4.73 ± 10%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      5.66 ± 16%    -100.0%       0.00          -100.0%       0.00            +1.4%       5.74 ±  8%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     49.92 ± 40%     -58.5%      20.72 ± 31%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    467.69 ±  7%      -5.3%     442.80 ±  7%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    387.51 ±  4%      +6.8%     413.92 ±  5%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      5.67 ±  7%    +233.8%      18.94 ± 43%    +218.4%      18.07 ± 59%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    308.58 ±  7%     +52.0%     469.04 ±  3%     +47.9%     456.38 ±  3%     +42.4%     439.45 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      5.96 ±  4%     +34.5%       8.01 ± 22%     +53.9%       9.16 ± 27%     -22.3%       4.63 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    621.78 ±  7%     +35.1%     839.89 ± 10%     +42.5%     886.03 ± 10%      -8.9%     566.75 ±  8%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3130 ± 11%      +5.8%       3310 ± 20%      -3.6%       3018 ± 16%     +99.8%       6255 ± 18%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      1626 ±  6%     -23.8%       1239 ± 21%     -30.0%       1138 ± 15%      -6.1%       1528 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
    148.00 ± 23%    -100.0%       0.00          -100.0%       0.00          +150.2%     370.25 ± 21%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      1042 ±  7%     -17.3%     861.83 ± 15%     -21.0%     823.50 ± 14%     +22.3%       1275 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     70.50 ± 72%    +505.7%     427.00 ± 29%    +478.0%     407.50 ± 21%    +931.9%     727.50 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
    394.83 ± 11%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
    696.83 ± 25%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.17 ±223%   +2800.0%       4.83 ± 45%   +2225.0%       3.88 ± 52%     +50.0%       0.25 ±173%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      3434 ±  7%     -11.2%       3049 ± 20%     -17.8%       2823 ± 15%     +44.1%       4949 ± 14%  perf-sched.wait_and_delay.count.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     50.00 ± 18%     -74.0%      13.00 ± 65%     -65.5%      17.25 ± 40%     -72.8%      13.62 ± 99%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    135.83 ±  6%     -89.7%      14.00 ±223%     -90.9%      12.38 ±264%     -88.2%      16.00 ±264%  perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     10.00           +13.3%      11.33 ± 19%     +83.8%      18.38 ± 11%     +48.8%      14.88 ±  7%  perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    206.83 ± 10%     +18.2%     244.50 ± 19%      +9.3%     226.00 ± 17%     +50.7%     311.62 ± 15%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
    168.50 ± 16%    -100.0%       0.00          -100.0%       0.00          +237.2%     568.25 ± 19%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1644 ± 45%    +103.2%       3340 ± 25%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
     26.00 ±  7%      -9.6%      23.50 ± 15%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
     13.00            +7.7%      14.00 ± 15%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    115.67 ±  3%      -6.8%     107.83 ± 19%     -18.6%      94.12 ± 43%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    985.67 ±  2%      -7.3%     914.17 ± 24%     -14.2%     845.25 ± 24%     +21.4%       1196 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2500 ± 15%     -49.3%       1268 ± 11%     -51.6%       1210 ± 11%     +27.4%       3185 ± 17%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1105 ± 80%    +118.9%       2420 ± 58%    +199.3%       3309 ± 38%    +112.7%       2351 ± 45%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    416.51 ± 51%    +146.1%       1025 ± 45%    +235.7%       1398 ± 43%     -60.2%     165.95 ± 43%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
    494.23 ± 70%    +158.3%       1276 ± 27%    +100.5%     991.08 ± 42%     +84.8%     913.47 ± 34%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
     43.31 ± 65%    -100.0%       0.00          -100.0%       0.00           -19.4%      34.90 ± 68%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
     32.05 ±114%   +1205.3%     418.33 ±121%   +1395.4%     479.28 ± 80%    +139.1%      76.64 ±108%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     50.65 ± 28%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
    196.51 ±182%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
    167.85 ±223%    +511.9%       1027          +443.6%     912.41 ± 38%     +49.2%     250.43 ±173%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
    401.00 ± 36%    +238.8%       1358 ± 29%    +247.9%       1395 ± 19%    +313.1%       1656 ± 46%  perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      3117 ± 18%     -31.6%       2131 ± 67%     -16.8%       2593 ± 41%     -58.2%       1304 ± 67%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     19.38 ± 38%     -62.3%       7.31 ±223%     -73.0%       5.23 ±264%     -91.2%       1.70 ±264%  perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    105.15 ±102%    +558.6%     692.52 ± 66%    +598.5%     734.40 ± 63%     -95.2%       5.04 ±135%  perf-sched.wait_and_delay.max.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     44.08 ± 33%    +151.5%     110.86 ± 31%    +660.4%     335.24 ±119%     -40.4%      26.29 ±203%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     54.90 ± 67%    -100.0%       0.00          -100.0%       0.00          +281.8%     209.58 ±147%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1475 ±  5%     +51.9%       2241 ± 19%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1030 ±  4%      -0.3%       1027          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    505.03           +19.3%     602.66 ± 30%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     44.18 ± 28%    +522.5%     275.00 ±119%    +453.2%     244.39 ± 92%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    119.88 ±117%    +153.2%     303.58 ± 99%    +347.4%     536.35 ± 98%     -82.9%      20.48 ± 70%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1.44 ± 29%   +1635.4%      24.97 ±130%    +714.9%      11.73 ±187%     -30.0%       1.01 ± 52%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      0.98 ± 53%     +75.6%       1.73 ±138%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      2.40 ±  5%    +135.1%       5.63 ± 11%    +144.7%       5.86 ± 17%      -2.2%       2.34 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      2.62 ± 56%     +78.5%       4.68 ± 24%    +133.0%       6.11 ± 39%     -12.8%       2.29 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      2.32 ± 14%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
      2.75 ±  5%    +120.5%       6.06 ± 16%    +118.9%       6.01 ± 18%      +6.3%       2.92 ± 23%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      0.18 ±223%   +1644.4%       3.11 ± 99%   +1583.1%       3.00 ± 84%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      2.04 ± 15%    +244.6%       7.04 ±115%    +323.9%       8.66 ±166%     +16.6%       2.38 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      1.52 ± 38%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      0.00 ±223%  +9.9e+06%     149.06 ± 94%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      4.65 ±  9%     +43.8%       6.68 ± 13%     +56.8%       7.29 ± 16%     -22.6%       3.59 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.63 ± 49%    +165.4%       4.33 ± 60%    +532.2%      10.32 ±146%     +56.2%       2.55 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.page_cache_ra_order.filemap_fault.__do_fault
     28.89 ±104%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
      2.45 ± 21%    +114.3%       5.24 ± 10%    +123.8%       5.48 ± 17%      -1.5%       2.41 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.00 ±203%  +40515.4%       0.88 ±155%  +34769.2%       0.76 ±133%   +1619.2%       0.04 ±130%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
    131.00 ±166%     -98.4%       2.13 ±155%     -99.3%       0.92 ±195%     +20.4%     157.67 ±128%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     45.09 ±137%    -100.0%       0.00          -100.0%       0.01 ±264%     -87.7%       5.56 ±262%  perf-sched.wait_time.avg.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      3.35 ± 59%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
      2.20 ± 12%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
      2.40 ± 27%    -100.0%       0.00          -100.0%       0.00           -87.3%       0.30 ±264%  perf-sched.wait_time.avg.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.74 ±150%    +235.3%       2.49 ± 62%    +398.9%       3.71 ± 69%      -2.1%       0.73 ±169%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
     20.77 ± 70%    -100.0%       0.00          +403.9%     104.64 ±175%     +84.7%      38.36 ±132%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
      2.96 ± 14%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.66 ± 21%    -100.0%       0.00          -100.0%       0.00           +67.5%       2.78 ± 70%  perf-sched.wait_time.avg.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
    175.04 ± 74%     -98.4%       2.81 ± 89%     -96.6%       5.90 ±134%     -78.7%      37.24 ±157%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      2.60 ±  4%    +183.8%       7.38 ±  9%    +192.2%       7.60 ± 13%     +29.9%       3.38 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.39 ± 48%    +579.8%       2.66 ± 59%    +891.3%       3.89 ± 29%     +16.7%       0.46 ± 49%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.24 ± 15%    +242.5%       7.68 ± 40%    +325.2%       9.53 ± 65%     -30.0%       1.57 ± 25%  perf-sched.wait_time.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      4.03 ± 21%    +250.4%      14.12 ± 40%    +338.2%      17.65 ± 25%     -17.1%       3.34 ± 35%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.86 ± 93%    -100.0%       0.00           -93.7%       0.05 ±208%    +625.9%       6.24 ±256%  perf-sched.wait_time.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
    400.08            +2.3%     409.48 ±  3%     -29.2%     283.32 ± 19%     -21.9%     312.27 ±  6%  perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.46 ± 18%    +139.4%       5.90 ± 41%    +148.7%       6.12 ± 32%      -4.0%       2.36 ± 10%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.90 ± 41%     +58.7%       1.43 ±100%    +926.1%       9.22 ±188%     -36.1%       0.57 ±107%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      2.84 ± 16%    +128.4%       6.49 ± 40%     +86.8%       5.31 ± 15%      +5.4%       3.00 ± 18%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     49.54 ± 40%     -59.5%      20.06 ± 31%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    465.46 ±  7%      -5.4%     440.26 ±  7%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    386.71 ±  3%      +3.1%     398.68 ±  5%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     98.02 ± 46%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00 ±264%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
      4.70 ±  9%    +270.7%      17.43 ± 40%    +269.6%      17.37 ± 42%      -7.8%       4.33 ± 20%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    304.70 ±  7%     +51.9%     462.85 ±  2%     +48.1%     451.33 ±  2%     +44.1%     439.16 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.12 ±120%    -100.0%       0.00           -91.4%       0.01 ±136%     -41.3%       0.07 ±130%  perf-sched.wait_time.avg.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
      5.17 ±  2%     +29.1%       6.67 ± 14%     +37.1%       7.09 ± 12%     -15.0%       4.39        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    621.19 ±  7%     +34.9%     837.98 ± 10%     +42.4%     884.51 ± 10%      -8.8%     566.49 ±  8%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    167.70 ±222%    +410.0%     855.18 ± 44%    +355.8%     764.33 ± 56%     -23.9%     127.67 ±259%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      4.40 ± 38%   +7795.2%     347.10 ±135%   +3073.1%     139.50 ±234%     -37.6%       2.74 ± 53%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      1.34 ± 46%    +118.7%       2.93 ±147%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    208.26 ± 51%    +146.1%     512.53 ± 45%    +235.7%     699.12 ± 43%     -60.2%      82.98 ± 43%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     18.01 ± 57%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
      0.54 ±223%    +931.2%       5.52 ± 90%    +980.9%       5.79 ± 78%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      6.41 ± 42%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
    336.71 ±139%     +98.4%     668.00 ± 70%    +124.2%     755.05 ± 56%     +12.2%     377.89 ±127%  perf-sched.wait_time.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.00 ±223%  +4.6e+07%     697.43 ± 69%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      3.42 ± 46%   +1591.8%      57.78 ±149%    +260.1%      12.30 ± 35%     -53.8%       1.58 ±100%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
    106.54 ±138%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
     20.61 ± 74%    +914.8%     209.17 ±121%   +1062.6%     239.64 ± 80%     +85.9%      38.32 ±108%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.03 ±202%  +24357.2%       7.34 ±134%  +25094.6%       7.56 ± 55%   +3114.6%       0.96 ±149%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1310 ±138%     -99.7%       3.39 ±129%     -99.9%       1.21 ±162%     -32.3%     887.78 ± 98%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
    215.44 ± 60%    -100.0%       0.00          -100.0%       0.01 ±264%     -89.7%      22.14 ±263%  perf-sched.wait_time.max.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      6.01 ± 47%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
     25.32 ± 28%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
    181.35 ±201%    -100.0%       0.00          -100.0%       0.00           -99.8%       0.37 ±264%  perf-sched.wait_time.max.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
    335.43 ±141%    +156.3%     859.60 ± 44%    +165.6%     891.01 ± 37%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.74 ±150%    +731.1%       6.18 ± 68%    +755.9%       6.37 ± 95%     +16.2%       0.86 ±153%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
    304.80 ± 58%    -100.0%       0.00           -27.5%     220.96 ±209%     -62.1%     115.59 ±150%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
    167.80 ±223%    +511.9%       1026          +444.1%     913.01 ± 37%     +49.2%     250.43 ±173%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      7.52 ± 19%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
     26.92 ± 77%    -100.0%       0.00          -100.0%       0.00          +399.1%     134.36 ±243%  perf-sched.wait_time.max.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
      2273 ± 72%     -99.3%      15.34 ±105%     -96.4%      81.35 ±220%     -81.7%     416.33 ±143%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
    200.50 ± 36%    +513.0%       1228 ± 31%    +450.3%       1103 ± 10%    +726.1%       1656 ± 46%  perf-sched.wait_time.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      3117 ± 18%     -28.0%       2245 ± 57%     -16.8%       2593 ± 41%     -58.2%       1304 ± 67%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      8.07 ± 34%     +93.9%      15.65 ± 57%    +175.8%      22.27 ± 26%     -51.9%       3.89 ± 47%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     25.24 ±105%   +2617.2%     685.79 ± 68%   +2508.9%     658.46 ± 68%     -45.0%      13.87 ±142%  perf-sched.wait_time.max.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
    334.70 ±141%    +107.0%     692.98 ± 70%    +165.6%     888.93 ± 37%     -61.8%     127.70 ±258%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     42.20 ± 40%    +160.7%     110.01 ± 32%    +690.0%     333.38 ±120%     +32.9%      56.09 ± 74%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.65 ±168%    -100.0%       0.00           -98.3%       0.27 ±241%    +706.1%     126.19 ±261%  perf-sched.wait_time.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      1.87 ± 38%    +213.0%       5.85 ± 93%   +7228.8%     136.97 ±238%      -2.4%       1.82 ± 92%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      1475 ±  5%     +51.9%       2241 ± 19%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1015 ±  2%      -0.1%       1014          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    502.63            +1.2%     508.90          -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    365.80 ± 22%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00 ±264%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
     35.15 ± 40%    +673.9%     272.04 ±121%    +587.8%     241.76 ± 86%     +60.7%      56.48 ± 57%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.90 ±143%    -100.0%       0.00           -98.2%       0.02 ±142%     -73.2%       0.24 ±169%  perf-sched.wait_time.max.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
     64.94 ±111%    +165.2%     172.21 ± 90%    +259.3%     233.31 ± 98%     -80.6%      12.59 ± 57%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     21.49 ± 11%     -21.5        0.00           -21.5        0.00           -20.0        1.47 ±158%  perf-profile.calltrace.cycles-pp.__alloc_pages_direct_compact.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     20.75 ± 11%     -20.8        0.00           -20.8        0.00           -19.3        1.46 ±158%  perf-profile.calltrace.cycles-pp.try_to_compact_pages.__alloc_pages_direct_compact.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     20.75 ± 11%     -20.7        0.00           -20.7        0.00           -19.3        1.46 ±158%  perf-profile.calltrace.cycles-pp.compact_zone.compact_zone_order.try_to_compact_pages.__alloc_pages_direct_compact.__alloc_pages_slowpath
     20.75 ± 11%     -20.7        0.00           -20.7        0.00           -19.3        1.46 ±158%  perf-profile.calltrace.cycles-pp.compact_zone_order.try_to_compact_pages.__alloc_pages_direct_compact.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
     19.28 ± 11%     -19.3        0.00           -19.3        0.00           -18.1        1.22 ±162%  perf-profile.calltrace.cycles-pp.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages.__alloc_pages_direct_compact
     14.19 ±  7%     -14.2        0.00           -14.2        0.00            -9.7        4.53 ± 76%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     13.84 ±  7%     -13.8        0.00           -13.8        0.00            -9.8        4.08 ± 78%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     12.76 ± 16%     -12.8        0.00           -12.8        0.00           -12.1        0.65 ±164%  perf-profile.calltrace.cycles-pp.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
     11.50 ±  8%     -11.5        0.00           -11.5        0.00            -8.4        3.10 ± 77%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
     11.47 ±  8%     -11.5        0.00           -11.5        0.00            -8.4        3.06 ± 77%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      6.99 ± 20%      -5.6        1.35 ± 11%      -7.0        0.00            -6.9        0.10 ±264%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move
      5.65 ± 78%      -5.5        0.17 ±223%      -5.5        0.15 ±264%     +48.3       53.97 ± 22%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      6.86 ± 17%      -5.4        1.48 ± 10%      -6.9        0.00            -6.9        0.00        perf-profile.calltrace.cycles-pp.__folio_batch_add_and_move.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault
      6.84 ± 18%      -5.4        1.47 ± 10%      -6.8        0.00            -6.8        0.00        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.__folio_batch_add_and_move.filemap_add_folio.page_cache_ra_order.filemap_fault
      6.49 ± 18%      -5.1        1.37 ± 11%      -6.5        0.00            -6.5        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.filemap_add_folio
      6.50 ± 18%      -5.1        1.37 ± 10%      -6.5        0.00            -6.5        0.00        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.filemap_add_folio.page_cache_ra_order
      7.18 ± 16%      -5.1        2.12 ±  6%      -5.3        1.92 ±  7%      +0.3        7.47 ± 95%  perf-profile.calltrace.cycles-pp.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
     90.95 ±  2%      -3.7       87.21            -3.6       87.32           -62.6       28.37 ± 68%  perf-profile.calltrace.cycles-pp.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault.do_pte_missing
      3.00 ± 14%      -3.0        0.00            -3.0        0.00            -2.1        0.94 ± 86%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      3.00 ± 14%      -3.0        0.00            -3.0        0.00            -2.1        0.93 ± 86%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +30.8       33.78 ± 29%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +30.9       33.80 ± 29%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +31.2       34.10 ± 30%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +31.2       34.16 ± 30%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +32.1       35.04 ± 31%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +32.2       35.16 ± 31%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +32.2       35.19 ± 31%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      2.95 ± 76%      -2.9        0.09 ±223%      -2.9        0.08 ±264%     +32.2       35.19 ± 31%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      2.95 ± 76%      -2.8        0.10 ±223%      -2.9        0.08 ±264%     +32.5       35.44 ± 31%  perf-profile.calltrace.cycles-pp.common_startup_64
      2.02 ± 21%      -1.0        1.06 ±  8%      -1.1        0.92 ± 10%      -1.0        1.03 ±128%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
      2.01 ± 21%      -1.0        1.05 ±  8%      -1.1        0.91 ± 10%      -1.0        1.02 ±128%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.evict_folios.try_to_shrink_lruvec.shrink_one
      1.33 ±  7%      -0.9        0.45 ± 44%      -1.3        0.07 ±264%      +3.5        4.88 ± 64%  perf-profile.calltrace.cycles-pp.read_pages.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
      1.32 ±  7%      -0.9        0.45 ± 44%      -1.3        0.07 ±264%      +3.5        4.87 ± 64%  perf-profile.calltrace.cycles-pp.iomap_readahead.read_pages.page_cache_ra_order.filemap_fault.__do_fault
      1.91 ± 23%      -0.8        1.08 ±  8%      -1.0        0.93 ±  7%      -1.3        0.59 ±142%  perf-profile.calltrace.cycles-pp.folio_referenced.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      1.90 ± 23%      -0.8        1.08 ±  8%      -1.0        0.92 ±  7%      -1.3        0.58 ±143%  perf-profile.calltrace.cycles-pp.__rmap_walk_file.folio_referenced.shrink_folio_list.evict_folios.try_to_shrink_lruvec
      1.82 ± 24%      -0.8        1.04 ±  8%      -0.9        0.90 ±  7%      -1.3        0.56 ±143%  perf-profile.calltrace.cycles-pp.folio_referenced_one.__rmap_walk_file.folio_referenced.shrink_folio_list.evict_folios
      1.24 ±  6%      -0.7        0.58 ±  5%      -0.7        0.54 ±  3%      +2.3        3.59 ± 60%  perf-profile.calltrace.cycles-pp.do_rw_once
      2.27 ±  8%      -0.4        1.84 ±  3%      -0.4        1.89 ±  7%     +13.9       16.12 ± 35%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      2.27 ±  8%      -0.4        1.84 ±  3%      -0.4        1.89 ±  7%     +13.9       16.12 ± 35%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      2.27 ±  8%      -0.4        1.84 ±  3%      -0.4        1.89 ±  7%     +13.9       16.12 ± 35%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +0.0        0.00            +0.0        0.00            +3.8        3.75 ± 80%  perf-profile.calltrace.cycles-pp.truncate_folio_batch_exceptionals.truncate_inode_pages_range.xfs_fs_evict_inode.evict.do_unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +3.8        3.83 ± 78%  perf-profile.calltrace.cycles-pp.update_process_times.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.0        0.00            +4.6        4.55 ± 77%  perf-profile.calltrace.cycles-pp.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.0        0.00            +6.2        6.17 ± 83%  perf-profile.calltrace.cycles-pp.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone.compact_node
      0.00            +0.0        0.00            +0.0        0.00            +6.2        6.18 ± 83%  perf-profile.calltrace.cycles-pp.migrate_pages_sync.migrate_pages.compact_zone.compact_node.kcompactd
      0.00            +0.0        0.00            +0.0        0.00            +6.6        6.63 ± 74%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.0        0.00            +7.4        7.39 ± 74%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt
      0.00            +0.0        0.00            +0.0        0.00            +7.4        7.41 ± 74%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry
      0.00            +0.0        0.00            +0.0        0.00            +8.0        8.02 ± 82%  perf-profile.calltrace.cycles-pp.migrate_pages.compact_zone.compact_node.kcompactd.kthread
      0.00            +0.0        0.00            +0.0        0.00            +8.5        8.54 ± 82%  perf-profile.calltrace.cycles-pp.compact_node.kcompactd.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.0        0.00            +0.0        0.00            +8.5        8.54 ± 82%  perf-profile.calltrace.cycles-pp.compact_zone.compact_node.kcompactd.kthread.ret_from_fork
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.47 ± 85%  perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.xfs_fs_evict_inode.evict.do_unlinkat.__x64_sys_unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.xfs_fs_evict_inode.evict.do_unlinkat.__x64_sys_unlinkat.do_syscall_64
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.calltrace.cycles-pp.unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.7        9.68 ± 72%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.00            +0.0        0.00            +0.0        0.00           +10.2       10.19 ± 63%  perf-profile.calltrace.cycles-pp.kcompactd.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.0        0.00            +0.0        0.00           +11.2       11.16 ± 73%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.00            +0.0        0.00            +0.7        0.66 ±  4%      +0.0        0.00        perf-profile.calltrace.cycles-pp.prep_move_freepages_block.try_to_claim_block.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      0.00            +0.0        0.00            +0.7        0.74 ±  4%      +0.0        0.00        perf-profile.calltrace.cycles-pp.try_to_claim_block.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
      0.00            +0.0        0.00            +1.2        1.15 ± 12%      +5.9        5.90 ±104%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru
      0.00            +0.0        0.00            +1.2        1.17 ± 12%      +6.1        6.06 ±103%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.filemap_add_folio
      0.00            +0.0        0.00            +1.2        1.17 ± 12%      +6.1        6.08 ±103%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.filemap_add_folio.page_cache_ra_order
      0.00            +0.0        0.00            +1.3        1.26 ± 12%      +6.9        6.88 ± 98%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru.filemap_add_folio.page_cache_ra_order.filemap_fault
      0.00            +0.0        0.00            +1.3        1.27 ± 12%      +6.9        6.93 ± 98%  perf-profile.calltrace.cycles-pp.folio_add_lru.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault
      0.00            +0.4        0.37 ± 71%      +0.6        0.55 ±  4%      +0.0        0.00        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_lru_noprof.xas_alloc.xas_create.xas_store.__filemap_add_folio
      0.00            +0.4        0.37 ± 71%      +0.6        0.55 ±  4%      +0.0        0.00        perf-profile.calltrace.cycles-pp.xas_alloc.xas_create.xas_store.__filemap_add_folio.filemap_add_folio
      0.00            +0.4        0.37 ± 71%      +0.6        0.55 ±  4%      +0.0        0.00        perf-profile.calltrace.cycles-pp.xas_create.xas_store.__filemap_add_folio.filemap_add_folio.page_cache_ra_order
      0.00            +0.5        0.46 ± 45%      +0.6        0.56 ±  4%      +0.0        0.00        perf-profile.calltrace.cycles-pp.xas_store.__filemap_add_folio.filemap_add_folio.page_cache_ra_order.filemap_fault
      0.00            +0.6        0.63 ±  7%      +0.6        0.64 ±  4%      +0.3        0.32 ±101%  perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault
      0.00            +0.6        0.64 ±  6%      +0.4        0.42 ± 57%      +0.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.unreserve_highatomic_pageblock.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.00            +0.6        0.64 ±  6%      +0.4        0.42 ± 57%      +0.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.unreserve_highatomic_pageblock.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      0.00            +0.6        0.64 ±  5%      +0.4        0.42 ± 57%      +0.0        0.00        perf-profile.calltrace.cycles-pp.unreserve_highatomic_pageblock.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      0.00            +0.7        0.66 ±  2%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.prep_move_freepages_block.try_to_steal_block.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      0.00            +0.7        0.70 ±  3%      +0.7        0.71 ±  2%      +0.0        0.00        perf-profile.calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.00            +0.8        0.75 ±  2%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.try_to_steal_block.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
      0.00            +1.3        1.32 ±  7%      +1.4        1.41 ± 11%      +0.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_one_page.free_unref_folios.shrink_folio_list
      0.00            +1.3        1.32 ±  7%      +1.4        1.41 ± 11%      +0.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_one_page.free_unref_folios.shrink_folio_list.evict_folios
      0.00            +1.3        1.32 ±  7%      +1.4        1.41 ± 11%      +0.0        0.00        perf-profile.calltrace.cycles-pp.free_one_page.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     91.27 ±  2%      +1.8       93.05            +2.0       93.23           -62.9       28.41 ± 68%  perf-profile.calltrace.cycles-pp.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
     91.27 ±  2%      +1.8       93.05            +2.0       93.23           -62.9       28.41 ± 68%  perf-profile.calltrace.cycles-pp.filemap_fault.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
     82.42 ±  2%      +2.1       84.56            +2.5       84.90           -66.4       15.99 ± 70%  perf-profile.calltrace.cycles-pp.folio_alloc_noprof.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
     82.39 ±  2%      +2.2       84.54            +2.5       84.89           -66.5       15.85 ± 71%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order.filemap_fault.__do_fault
     82.38 ±  2%      +2.2       84.54            +2.5       84.88           -66.6       15.84 ± 71%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order.filemap_fault
      0.88 ± 11%      +2.2        3.08            +2.2        3.06            -0.7        0.14 ±173%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.do_read_fault
      0.88 ± 11%      +2.2        3.08            +2.2        3.06            -0.7        0.14 ±173%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.do_read_fault.do_pte_missing
      0.88 ± 11%      +2.2        3.08            +2.2        3.06            -0.7        0.14 ±173%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.pte_alloc_one.do_read_fault.do_pte_missing.__handle_mm_fault
      0.88 ± 11%      +2.2        3.08            +2.2        3.06            -0.7        0.14 ±173%  perf-profile.calltrace.cycles-pp.pte_alloc_one.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      0.00            +2.4        2.37 ±  2%      +2.3        2.32            +0.0        0.00        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.00            +2.8        2.78 ± 10%      +2.8        2.82 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_pages_slowpath
      0.00            +2.8        2.78 ± 10%      +2.8        2.82 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      0.00            +3.1        3.08            +3.1        3.05            +0.0        0.00        perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     93.16 ±  2%      +3.5       96.62            +3.6       96.74           -60.9       32.28 ± 66%  perf-profile.calltrace.cycles-pp.do_access
     92.48 ±  2%      +3.8       96.30            +4.0       96.46           -63.0       29.51 ± 67%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     92.40 ±  2%      +3.8       96.24            +4.0       96.40           -63.1       29.35 ± 67%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     92.40 ±  2%      +3.8       96.25            +4.0       96.40           -63.1       29.35 ± 67%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     92.36 ±  2%      +3.9       96.23            +4.0       96.39           -63.1       29.25 ± 67%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     92.33 ±  2%      +3.9       96.21            +4.0       96.37           -63.2       29.17 ± 67%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     92.33 ±  2%      +3.9       96.21            +4.0       96.37           -63.2       29.16 ± 67%  perf-profile.calltrace.cycles-pp.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     92.35 ±  2%      +4.0       96.31            +4.0       96.38           -63.1       29.21 ± 67%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     17.83 ±  9%      +5.3       23.11            +5.5       23.31           -15.3        2.51 ± 67%  perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list
     17.84 ±  9%      +5.3       23.12            +5.5       23.32           -15.3        2.51 ± 67%  perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list.evict_folios
     17.84 ±  9%      +5.3       23.12            +5.5       23.32           -15.3        2.52 ± 67%  perf-profile.calltrace.cycles-pp.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     17.84 ±  9%      +5.3       23.12            +5.5       23.32           -15.3        2.52 ± 67%  perf-profile.calltrace.cycles-pp.try_to_unmap_flush.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.00            +5.7        5.72 ± 10%      +5.8        5.80 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      0.00            +5.7        5.73 ± 10%      +5.8        5.80 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault
      0.00            +5.7        5.73 ± 10%      +5.8        5.80 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault.__do_fault
      0.00            +5.7        5.73 ± 10%      +5.8        5.80 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault.__do_fault.do_read_fault
      0.00            +5.7        5.75 ± 10%      +5.8        5.83 ±  9%      +0.0        0.00        perf-profile.calltrace.cycles-pp.page_cache_ra_unbounded.filemap_fault.__do_fault.do_read_fault.do_pte_missing
     22.03 ±  7%      +7.3       29.35 ±  2%      +8.1       30.12 ±  2%     -19.2        2.79 ± 82%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     21.90 ±  7%      +7.4       29.28 ±  2%      +8.1       30.05 ±  2%     -19.2        2.70 ± 83%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.shrink_folio_list.evict_folios
     21.68 ±  7%      +7.5       29.17 ±  2%      +8.3       29.94 ±  2%     -19.3        2.36 ± 87%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.shrink_folio_list
     21.65 ±  7%      +7.5       29.16 ±  2%      +8.3       29.93 ±  2%     -19.4        2.23 ± 93%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios
     22.13 ±  7%      +8.7       30.85 ±  2%      +9.6       31.71 ±  2%     -19.0        3.08 ± 80%  perf-profile.calltrace.cycles-pp.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     45.19 ±  8%     +11.0       56.15           +11.7       56.85           -36.3        8.90 ± 70%  perf-profile.calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     45.07 ±  8%     +11.7       56.81           +12.5       57.52           -36.3        8.82 ± 70%  perf-profile.calltrace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     45.06 ±  8%     +11.7       56.80           +12.5       57.52           -36.2        8.81 ± 70%  perf-profile.calltrace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
     45.04 ±  8%     +11.7       56.79           +12.5       57.51           -36.2        8.80 ± 70%  perf-profile.calltrace.cycles-pp.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath
     45.03 ±  8%     +11.8       56.79           +12.5       57.51           -36.2        8.79 ± 70%  perf-profile.calltrace.cycles-pp.shrink_one.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages
     46.17 ±  7%     +12.2       58.42           +13.0       59.20           -35.0       11.16 ± 65%  perf-profile.calltrace.cycles-pp.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     44.27 ±  8%     +12.4       56.63           +13.1       57.40           -37.1        7.18 ± 77%  perf-profile.calltrace.cycles-pp.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node.do_try_to_free_pages
     43.67 ±  7%     +13.4       57.06           +14.3       58.02           -34.5        9.12 ± 64%  perf-profile.calltrace.cycles-pp.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
     68.15 ±  2%     +16.1       84.30           +16.5       84.64           -56.9       11.27 ± 72%  perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     10.91 ± 10%     +20.1       31.00           +19.8       30.74            -8.3        2.66 ± 80%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
     10.90 ± 10%     +20.1       30.99           +19.8       30.74            -8.3        2.64 ± 80%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      0.42 ± 72%     +31.5       31.88           +31.2       31.61            -0.3        0.09 ±264%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_slowpath
      0.43 ± 72%     +31.5       31.90           +31.2       31.63            -0.3        0.09 ±264%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      0.91 ± 19%     +31.6       32.48           +31.3       32.20            -0.7        0.21 ±188%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      0.84 ± 20%     +33.9       34.72           +33.6       34.47            -0.7        0.12 ±264%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     21.49 ± 11%     -21.5        0.00           -21.5        0.00           -19.9        1.56 ±147%  perf-profile.children.cycles-pp.__alloc_pages_direct_compact
     20.91 ± 11%     -20.9        0.03 ±223%     -20.9        0.06 ±211%      -9.2       11.71 ± 55%  perf-profile.children.cycles-pp.compact_zone
     20.76 ± 11%     -20.8        0.00           -20.8        0.00           -19.2        1.54 ±147%  perf-profile.children.cycles-pp.try_to_compact_pages
     20.75 ± 11%     -20.8        0.00           -20.8        0.00           -19.2        1.54 ±147%  perf-profile.children.cycles-pp.compact_zone_order
     19.29 ± 11%     -19.3        0.00           -19.3        0.00           -17.4        1.89 ± 99%  perf-profile.children.cycles-pp.isolate_migratepages
     12.77 ± 16%     -12.8        0.00           -12.8        0.00           -11.5        1.28 ± 78%  perf-profile.children.cycles-pp.isolate_migratepages_block
      7.53 ± 17%      -5.7        1.87 ± 10%      -7.2        0.32 ±  8%      -7.3        0.22 ±128%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      7.54 ± 17%      -5.7        1.88 ± 10%      -5.9        1.61 ± 11%      +0.0        7.56 ± 90%  perf-profile.children.cycles-pp.folio_batch_move_lru
      7.14 ± 18%      -5.4        1.76 ± 10%      -5.6        1.50 ± 11%      -0.7        6.48 ± 99%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      7.20 ± 16%      -5.1        2.14 ±  6%      -5.3        1.94 ±  7%      +0.3        7.47 ± 95%  perf-profile.children.cycles-pp.filemap_add_folio
      3.83 ± 22%      -3.8        0.00            -3.8        0.00            -3.4        0.40 ±151%  perf-profile.children.cycles-pp.fast_find_migrateblock
     90.95 ±  2%      -3.6       87.33            -3.6       87.37           -62.6       28.40 ± 67%  perf-profile.children.cycles-pp.page_cache_ra_order
      2.96 ± 75%      -2.7        0.28 ± 62%      -2.7        0.24 ± 73%     +32.2       35.19 ± 31%  perf-profile.children.cycles-pp.start_secondary
      3.10 ± 71%      -2.7        0.42 ± 41%      -2.7        0.38 ± 46%     +29.7       32.76 ± 29%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +31.0       34.01 ± 29%  perf-profile.children.cycles-pp.acpi_safe_halt
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +31.1       34.02 ± 29%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +31.1       34.04 ± 29%  perf-profile.children.cycles-pp.acpi_idle_enter
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +31.4       34.35 ± 29%  perf-profile.children.cycles-pp.cpuidle_enter_state
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +31.4       34.41 ± 29%  perf-profile.children.cycles-pp.cpuidle_enter
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +32.3       35.30 ± 30%  perf-profile.children.cycles-pp.cpuidle_idle_call
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +32.5       35.44 ± 31%  perf-profile.children.cycles-pp.common_startup_64
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +32.5       35.44 ± 31%  perf-profile.children.cycles-pp.cpu_startup_entry
      2.96 ± 75%      -2.7        0.29 ± 65%      -2.7        0.25 ± 75%     +32.5       35.44 ± 31%  perf-profile.children.cycles-pp.do_idle
      2.80 ± 18%      -1.3        1.46 ±  8%      -1.5        1.28 ±  8%      +0.1        2.93 ± 65%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.17 ± 18%      -1.2        0.00            -1.2        0.00            -1.0        0.15 ± 77%  perf-profile.children.cycles-pp.get_pfnblock_flags_mask
      2.42 ± 22%      -0.9        1.49 ±  8%      -1.1        1.30 ±  7%      -1.1        1.27 ± 91%  perf-profile.children.cycles-pp.__rmap_walk_file
      1.35 ±  7%      -0.8        0.53 ±  5%      -0.9        0.49 ±  4%      +3.5        4.90 ± 64%  perf-profile.children.cycles-pp.iomap_readahead
      1.35 ±  7%      -0.8        0.54 ±  5%      -0.9        0.49 ±  4%      +3.5        4.90 ± 64%  perf-profile.children.cycles-pp.read_pages
      1.49 ±  6%      -0.8        0.70 ±  5%      -0.8        0.65 ±  4%      +3.0        4.47 ± 58%  perf-profile.children.cycles-pp.do_rw_once
      1.26 ±  7%      -0.8        0.50 ±  5%      -0.8        0.46 ±  4%      +3.4        4.67 ± 63%  perf-profile.children.cycles-pp.iomap_readpage_iter
      1.08 ±  8%      -0.6        0.44 ±  6%      -0.7        0.40 ±  5%      +2.9        4.00 ± 63%  perf-profile.children.cycles-pp.zero_user_segments
      1.08 ±  7%      -0.6        0.44 ±  6%      -0.7        0.40 ±  5%      +2.9        3.98 ± 63%  perf-profile.children.cycles-pp.memset_orig
      0.75 ± 37%      -0.6        0.13 ±109%      -0.7        0.08 ±110%      +0.9        1.64 ±103%  perf-profile.children.cycles-pp.shrink_slab_memcg
      0.71 ± 39%      -0.6        0.12 ±110%      -0.6        0.07 ±110%      +0.9        1.61 ±105%  perf-profile.children.cycles-pp.do_shrink_slab
      2.27 ±  8%      -0.4        1.84 ±  3%      -0.4        1.89 ±  7%     +13.9       16.12 ± 35%  perf-profile.children.cycles-pp.kthread
      1.07 ± 21%      -0.4        0.64 ±  8%      -0.5        0.55 ±  6%      -0.5        0.53 ± 94%  perf-profile.children.cycles-pp.lru_gen_look_around
      2.27 ±  8%      -0.4        1.85 ±  3%      -0.4        1.90 ±  7%     +13.9       16.13 ± 35%  perf-profile.children.cycles-pp.ret_from_fork
      2.27 ±  8%      -0.4        1.86 ±  3%      -0.4        1.90 ±  7%     +13.9       16.13 ± 35%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.36 ± 14%      -0.3        0.03 ±223%      -0.3        0.06 ±210%      +9.4        9.74 ± 62%  perf-profile.children.cycles-pp.migrate_pages_batch
      0.36 ± 14%      -0.3        0.03 ±223%      -0.3        0.06 ±210%      +9.4        9.75 ± 62%  perf-profile.children.cycles-pp.migrate_pages
      0.32 ± 18%      -0.3        0.03 ±223%      -0.3        0.06 ±210%      +7.1        7.40 ± 64%  perf-profile.children.cycles-pp.migrate_pages_sync
      0.28 ± 25%      -0.3        0.03 ±223%      -0.2        0.06 ±211%      +9.9       10.19 ± 63%  perf-profile.children.cycles-pp.kcompactd
      1.42 ± 14%      -0.2        1.18 ±  4%      -0.3        1.16 ±  4%      -0.3        1.11 ± 21%  perf-profile.children.cycles-pp._raw_spin_lock
      0.21 ± 13%      -0.2        0.00            -0.2        0.01 ±264%      +1.6        1.78 ± 34%  perf-profile.children.cycles-pp.migrate_folio_unmap
      0.32 ± 10%      -0.2        0.11 ±  6%      -0.2        0.10 ±  6%      +0.5        0.79 ± 60%  perf-profile.children.cycles-pp.__filemap_remove_folio
      0.21 ± 12%      -0.2        0.00            -0.2        0.01 ±264%      +1.4        1.56 ± 31%  perf-profile.children.cycles-pp.isolate_freepages
      0.21 ± 12%      -0.2        0.00            -0.2        0.01 ±264%      +1.5        1.67 ± 32%  perf-profile.children.cycles-pp.compaction_alloc
      0.19 ± 15%      -0.2        0.00            -0.2        0.00            -0.2        0.03 ±109%  perf-profile.children.cycles-pp.folio_mapping
      0.48 ± 18%      -0.2        0.29 ±  7%      -0.2        0.27 ±  5%      -0.1        0.39 ± 79%  perf-profile.children.cycles-pp.try_to_unmap
      0.33 ±  9%      -0.2        0.14 ±  6%      -0.2        0.13 ±  4%      +0.4        0.72 ± 58%  perf-profile.children.cycles-pp.isolate_folios
      0.32 ±  9%      -0.2        0.14 ±  7%      -0.2        0.13 ±  5%      +0.4        0.71 ± 58%  perf-profile.children.cycles-pp.scan_folios
      0.45 ± 18%      -0.2        0.28 ±  6%      -0.2        0.26 ±  4%      -0.1        0.37 ± 79%  perf-profile.children.cycles-pp.try_to_unmap_one
      0.26 ± 15%      -0.2        0.09 ± 12%      -0.2        0.08 ± 21%      +0.6        0.87 ± 83%  perf-profile.children.cycles-pp.asm_sysvec_call_function
      0.24 ±  8%      -0.2        0.07 ±  6%      -0.2        0.06 ±  7%      +0.5        0.74 ± 27%  perf-profile.children.cycles-pp.lru_add
      0.23 ±  8%      -0.2        0.08 ± 10%      -0.2        0.07 ±  4%      +0.3        0.58 ± 30%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.59 ± 10%      -0.1        0.45 ±  6%      -0.1        0.44 ±  4%      -0.1        0.49 ± 81%  perf-profile.children.cycles-pp.__drain_all_pages
      0.21 ±  5%      -0.1        0.07 ±  6%      -0.1        0.07 ±  6%      +0.6        0.77 ± 43%  perf-profile.children.cycles-pp.iomap_release_folio
      0.22 ±  8%      -0.1        0.09 ±  6%      -0.1        0.08 ±  5%      +1.0        1.21 ± 31%  perf-profile.children.cycles-pp.__free_one_page
      0.20 ±  9%      -0.1        0.08 ±  8%      -0.1        0.07            +1.0        1.20 ± 40%  perf-profile.children.cycles-pp.lru_gen_del_folio
      0.11 ±  6%      -0.1        0.00            -0.1        0.00            +0.7        0.79 ± 30%  perf-profile.children.cycles-pp.kfree
      0.18 ±  6%      -0.1        0.07 ±  6%      -0.1        0.07 ±  4%      +0.3        0.52 ± 61%  perf-profile.children.cycles-pp.filemap_map_pages
      0.23 ±  7%      -0.1        0.13 ±  5%      -0.1        0.13 ±  4%     +10.1       10.32 ± 70%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.18 ±  7%      -0.1        0.07 ± 15%      -0.1        0.06 ±  8%      +0.5        0.69 ± 52%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.25 ± 13%      -0.1        0.15 ±  8%      -0.1        0.14 ±  4%      +0.7        0.90 ± 54%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.14 ± 11%      -0.1        0.04 ± 72%      -0.1        0.03 ± 78%      +0.5        0.63 ± 35%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.08 ± 26%      -0.1        0.00            -0.1        0.00            +1.2        1.25 ± 60%  perf-profile.children.cycles-pp.workingset_update_node
      0.20 ±  6%      -0.1        0.12 ±  4%      -0.1        0.11 ±  4%      +7.5        7.74 ± 71%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.19 ±  7%      -0.1        0.11 ±  4%      -0.1        0.11 ±  4%      +7.5        7.73 ± 71%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.14 ± 19%      -0.1        0.08 ±  8%      -0.1        0.07 ±  8%      -0.1        0.09 ± 92%  perf-profile.children.cycles-pp.get_pfn_folio
      0.06 ±  7%      -0.1        0.00            -0.1        0.00            +0.5        0.56 ± 27%  perf-profile.children.cycles-pp.ifs_free
      0.10 ± 18%      -0.1        0.04 ± 44%      -0.1        0.03 ± 78%      +0.0        0.14 ± 70%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.16 ±  4%      -0.1        0.09 ±  5%      -0.1        0.09 ±  5%      +6.8        6.94 ± 71%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.12 ± 20%      -0.1        0.06 ±  9%      -0.1        0.06 ± 12%      +0.0        0.13 ± 75%  perf-profile.children.cycles-pp.sysvec_call_function
      0.51 ±  5%      -0.1        0.45 ±  6%      -0.1        0.44 ±  4%      -0.0        0.48 ± 81%  perf-profile.children.cycles-pp.drain_pages_zone
      0.10 ± 17%      -0.1        0.04 ± 44%      -0.1        0.03 ± 78%      +0.0        0.11 ± 76%  perf-profile.children.cycles-pp.__sysvec_call_function
      0.06 ± 73%      -0.1        0.00            -0.1        0.00            +1.2        1.22 ± 40%  perf-profile.children.cycles-pp.isolate_freepages_block
      0.12 ±  6%      -0.0        0.08 ±  6%      -0.0        0.07 ±  6%      +4.7        4.79 ± 73%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.11 ±  6%      -0.0        0.07 ±  8%      -0.0        0.07 ±  7%      +3.9        4.05 ± 74%  perf-profile.children.cycles-pp.update_process_times
      0.04 ± 44%      -0.0        0.00            -0.0        0.00            +0.0        0.08 ± 23%  perf-profile.children.cycles-pp.task_tick_fair
      0.04 ± 44%      -0.0        0.00            -0.0        0.00            +3.0        3.02 ± 68%  perf-profile.children.cycles-pp.handle_softirqs
      0.08 ±  5%      -0.0        0.05 ±  7%      -0.0        0.05 ±  6%      +1.4        1.51 ± 71%  perf-profile.children.cycles-pp.sched_tick
      0.03 ± 70%      -0.0        0.00            -0.0        0.00            +2.1        2.13 ± 66%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.02 ± 99%      -0.0        0.00            -0.0        0.00            +0.2        0.20 ± 26%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.02 ± 99%      -0.0        0.00            -0.0        0.00            +0.8        0.87 ± 60%  perf-profile.children.cycles-pp.__slab_free
      0.02 ± 99%      -0.0        0.00            -0.0        0.00            +1.7        1.70 ± 61%  perf-profile.children.cycles-pp.rcu_core
      0.02 ±141%      -0.0        0.00            -0.0        0.00            +2.3        2.32 ± 81%  perf-profile.children.cycles-pp.folios_put_refs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.4        0.38 ± 45%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +1.5        1.53 ± 61%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ± 38%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.11 ± 13%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.14 ± 71%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.16 ± 17%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.16 ± 63%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.17 ± 56%  perf-profile.children.cycles-pp.xas_start
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.17 ± 28%  perf-profile.children.cycles-pp.filemap_unaccount_folio
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.18 ± 39%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.21 ± 73%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.21 ± 70%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.22 ± 58%  perf-profile.children.cycles-pp.mem_cgroup_from_slab_obj
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.22 ± 69%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.23 ± 18%  perf-profile.children.cycles-pp.folio_unlock
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.23 ± 66%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.25 ± 71%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.27 ± 39%  perf-profile.children.cycles-pp.__split_unmapped_folio
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.29 ± 70%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.29 ± 74%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.30 ± 71%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.31 ± 85%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.34 ± 72%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.35 ± 64%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.36 ± 69%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.36 ± 70%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.37 ± 77%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.40 ± 70%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.41 ± 75%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.43 ± 74%  perf-profile.children.cycles-pp.sched_balance_rq
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.45 ± 76%  perf-profile.children.cycles-pp.xas_clear_mark
      0.00            +0.0        0.00            +0.0        0.00            +0.5        0.45 ± 69%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.0        0.00            +0.0        0.00            +0.5        0.48 ± 52%  perf-profile.children.cycles-pp.xas_load
      0.00            +0.0        0.00            +0.0        0.00            +0.5        0.48 ± 76%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.00            +0.0        0.00            +0.0        0.00            +0.5        0.50 ± 49%  perf-profile.children.cycles-pp.__free_frozen_pages
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.drm_fb_memcpy
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.memcpy_toio
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.commit_tail
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.60 ± 49%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.60 ± 49%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.60 ± 49%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.63 ± 45%  perf-profile.children.cycles-pp.process_one_work
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.64 ± 80%  perf-profile.children.cycles-pp.xas_get_order
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.64 ± 44%  perf-profile.children.cycles-pp.worker_thread
      0.00            +0.0        0.00            +0.0        0.00            +0.7        0.65 ± 88%  perf-profile.children.cycles-pp.__page_cache_release
      0.00            +0.0        0.00            +0.0        0.00            +0.7        0.69 ± 95%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      0.00            +0.0        0.00            +0.0        0.00            +0.7        0.70 ± 77%  perf-profile.children.cycles-pp.list_lru_del
      0.00            +0.0        0.00            +0.0        0.00            +0.7        0.70 ± 70%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.0        0.00            +0.0        0.00            +1.0        0.96 ± 79%  perf-profile.children.cycles-pp.list_lru_del_obj
      0.00            +0.0        0.00            +0.0        0.00            +1.0        0.99 ± 77%  perf-profile.children.cycles-pp.__folio_migrate_mapping
      0.00            +0.0        0.00            +0.0        0.00            +1.0        1.02 ± 79%  perf-profile.children.cycles-pp.sched_balance_domains
      0.00            +0.0        0.00            +0.0        0.00            +1.0        1.02 ± 72%  perf-profile.children.cycles-pp.xas_find
      0.00            +0.0        0.00            +0.0        0.00            +1.0        1.03 ± 72%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.0        0.00            +0.0        0.00            +1.1        1.06 ± 71%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.0        0.00            +0.0        0.00            +1.1        1.10 ± 73%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.0        0.00            +0.0        0.00            +1.6        1.57 ± 76%  perf-profile.children.cycles-pp.get_jiffies_update
      0.00            +0.0        0.00            +0.0        0.00            +1.6        1.59 ± 75%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.00            +0.0        0.00            +0.0        0.00            +1.8        1.83 ± 68%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.0        0.00            +0.0        0.00            +1.9        1.87 ± 66%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.0        0.00            +0.0        0.00            +2.4        2.40 ± 83%  perf-profile.children.cycles-pp.find_lock_entries
      0.00            +0.0        0.00            +0.0        0.00            +3.8        3.77 ± 81%  perf-profile.children.cycles-pp.truncate_folio_batch_exceptionals
      0.00            +0.0        0.00            +0.0        0.00            +4.5        4.49 ± 78%  perf-profile.children.cycles-pp.copy_mc_fragile
      0.00            +0.0        0.00            +0.0        0.00            +4.5        4.52 ± 78%  perf-profile.children.cycles-pp.folio_mc_copy
      0.00            +0.0        0.00            +0.0        0.00            +5.8        5.83 ± 79%  perf-profile.children.cycles-pp.__migrate_folio
      0.00            +0.0        0.00            +0.0        0.00            +5.9        5.93 ± 78%  perf-profile.children.cycles-pp.move_to_new_folio
      0.00            +0.0        0.00            +0.0        0.00            +8.5        8.54 ± 82%  perf-profile.children.cycles-pp.compact_node
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.children.cycles-pp.evict
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.children.cycles-pp.xfs_fs_evict_inode
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.children.cycles-pp.__x64_sys_unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.children.cycles-pp.do_unlinkat
      0.00            +0.0        0.00            +0.0        0.00            +9.5        9.48 ± 85%  perf-profile.children.cycles-pp.unlinkat
      0.00            +0.0        0.00            +0.0        0.03 ±264%      +0.8        0.76 ± 36%  perf-profile.children.cycles-pp.__folio_split
      0.00            +0.0        0.00            +0.8        0.79 ±  4%      +0.0        0.00        perf-profile.children.cycles-pp.try_to_claim_block
      0.00            +0.0        0.00            +1.3        1.28 ± 12%      +7.4        7.38 ± 89%  perf-profile.children.cycles-pp.folio_add_lru
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.2        0.25 ± 41%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.2        0.25 ± 41%  perf-profile.children.cycles-pp.start_kernel
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.2        0.25 ± 41%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.2        0.25 ± 41%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.00            +0.0        0.02 ±142%      +0.1        0.06 ± 20%      +0.0        0.00        perf-profile.children.cycles-pp.copy_process
      0.00            +0.0        0.02 ±142%      +0.1        0.06 ± 24%      +0.0        0.00        perf-profile.children.cycles-pp.kernel_clone
      0.10 ± 17%      +0.0        0.12 ±  8%      +0.0        0.12 ± 11%      +0.4        0.51 ± 55%  perf-profile.children.cycles-pp.vfs_write
      0.00            +0.0        0.03 ±100%      +0.1        0.05 ±  6%      +0.0        0.00        perf-profile.children.cycles-pp.__pud_alloc
      0.08 ± 14%      +0.0        0.12 ±  8%      +0.0        0.12 ± 11%      -0.1        0.00        perf-profile.children.cycles-pp.record__pushfn
      0.08 ± 14%      +0.0        0.12 ±  8%      +0.0        0.12 ± 11%      -0.1        0.00        perf-profile.children.cycles-pp.writen
      0.07 ± 18%      +0.0        0.11 ±  9%      +0.0        0.11 ± 12%      -0.1        0.00        perf-profile.children.cycles-pp.generic_perform_write
      0.07 ± 20%      +0.0        0.12 ± 10%      +0.0        0.11 ± 12%      -0.1        0.00        perf-profile.children.cycles-pp.shmem_file_write_iter
      0.13 ± 10%      +0.0        0.17 ±  7%      +0.0        0.16 ±  9%      -0.1        0.00        perf-profile.children.cycles-pp.perf_mmap__push
      0.14 ± 10%      +0.0        0.18 ±  6%      +0.0        0.17 ±  8%      -0.1        0.00        perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.00            +0.1        0.05 ±  7%      +0.0        0.04 ± 62%      +0.0        0.01 ±173%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +0.1        0.05 ±  7%      +0.0        0.04 ± 62%      +0.0        0.01 ±174%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +0.1        0.05 ±  8%      +0.0        0.04 ± 62%      +0.0        0.01 ±174%  perf-profile.children.cycles-pp.bprm_execve
      0.03 ±100%      +0.1        0.09 ± 11%      +0.1        0.09 ± 14%      -0.0        0.00        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.03 ±100%      +0.1        0.09 ± 11%      +0.1        0.09 ± 14%      -0.0        0.00        perf-profile.children.cycles-pp.shmem_write_begin
      0.03 ±100%      +0.1        0.09 ±  9%      +0.1        0.09 ± 15%      -0.0        0.00        perf-profile.children.cycles-pp.shmem_alloc_and_add_folio
      0.00            +0.1        0.06 ± 25%      +0.1        0.06 ± 12%      +0.0        0.00        perf-profile.children.cycles-pp.alloc_anon_folio
      0.01 ±223%      +0.1        0.07 ± 14%      +0.1        0.07 ± 17%      -0.0        0.00        perf-profile.children.cycles-pp.shmem_alloc_folio
      0.00            +0.1        0.07 ± 18%      +0.1        0.06 ± 13%      +0.0        0.00        perf-profile.children.cycles-pp.copy_string_kernel
      0.00            +0.1        0.07 ± 26%      +0.1        0.07 ± 10%      +0.0        0.00        perf-profile.children.cycles-pp.do_anonymous_page
      0.00            +0.1        0.08 ± 16%      +0.1        0.07 ±  9%      +0.0        0.00        perf-profile.children.cycles-pp.__get_user_pages
      0.00            +0.1        0.08 ± 16%      +0.1        0.07 ±  9%      +0.0        0.00        perf-profile.children.cycles-pp.get_arg_page
      0.00            +0.1        0.08 ± 16%      +0.1        0.07 ±  9%      +0.0        0.00        perf-profile.children.cycles-pp.get_user_pages_remote
      0.00            +0.1        0.08 ± 14%      +0.1        0.09 ± 28%      +0.0        0.00        perf-profile.children.cycles-pp.do_sync_mmap_readahead
      0.27 ± 24%      +0.1        0.40 ±  8%      +0.1        0.40 ±  4%     +12.9       13.13 ± 53%  perf-profile.children.cycles-pp.do_syscall_64
      0.27 ± 24%      +0.1        0.40 ±  8%      +0.1        0.40 ±  4%     +12.9       13.13 ± 53%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.13 ± 11%      +0.1        0.12 ±  8%      +0.0        0.00        perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      0.00            +0.2        0.16 ± 12%      +0.2        0.15 ±  9%      +0.0        0.03 ±135%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +0.2        0.16 ± 12%      +0.2        0.15 ±  9%      +0.0        0.03 ±135%  perf-profile.children.cycles-pp.do_execveat_common
      0.00            +0.2        0.16 ± 12%      +0.2        0.15 ±  9%      +0.0        0.03 ±135%  perf-profile.children.cycles-pp.execve
      0.46 ± 22%      +0.2        0.65 ±  6%      +0.2        0.66 ±  3%      +4.3        4.75 ± 56%  perf-profile.children.cycles-pp.xas_store
      0.01 ±223%      +0.2        0.20 ±  9%      +0.1        0.07 ± 17%      -0.0        0.00        perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      0.30 ± 32%      +0.3        0.60 ±  7%      +0.3        0.62 ±  4%      +0.8        1.09 ± 26%  perf-profile.children.cycles-pp.xas_create
      0.29 ± 34%      +0.4        0.64 ±  7%      +0.4        0.65 ±  4%      +0.1        0.42 ± 67%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.35 ± 17%      +0.4        0.70 ±  2%      +0.4        0.71 ±  4%      -0.3        0.00        perf-profile.children.cycles-pp.prep_move_freepages_block
      0.14 ± 70%      +0.4        0.55 ±  8%      +0.4        0.57 ±  4%      -0.1        0.02 ±129%  perf-profile.children.cycles-pp.xas_alloc
      0.22 ± 51%      +0.4        0.62 ±  8%      +0.4        0.64 ±  5%      +0.1        0.33 ± 69%  perf-profile.children.cycles-pp.___slab_alloc
      0.14 ± 70%      +0.5        0.60 ±  8%      +0.5        0.61 ±  5%      -0.1        0.02 ±129%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.14 ± 72%      +0.5        0.60 ±  8%      +0.5        0.62 ±  6%      -0.1        0.00        perf-profile.children.cycles-pp.allocate_slab
      0.05 ±223%      +0.7        0.71 ±  5%      +0.6        0.60 ±  8%      -0.0        0.00        perf-profile.children.cycles-pp.unreserve_highatomic_pageblock
      0.00            +0.8        0.80            +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.try_to_steal_block
      0.00            +1.5        1.50 ±  7%      +1.6        1.60 ± 10%      +0.1        0.09 ± 86%  perf-profile.children.cycles-pp.free_one_page
     91.27 ±  2%      +1.9       93.12            +2.0       93.23           -62.8       28.44 ± 67%  perf-profile.children.cycles-pp.filemap_fault
     91.27 ±  2%      +1.9       93.12            +2.0       93.24           -62.8       28.44 ± 67%  perf-profile.children.cycles-pp.__do_fault
      0.88 ± 11%      +2.2        3.12            +2.2        3.10            -0.6        0.25 ± 82%  perf-profile.children.cycles-pp.pte_alloc_one
      0.89 ± 11%      +2.4        3.29            +2.4        3.28            -0.6        0.25 ± 83%  perf-profile.children.cycles-pp.alloc_pages_noprof
     93.43 ±  2%      +3.3       96.74            +3.4       96.86           -61.7       31.68 ± 66%  perf-profile.children.cycles-pp.do_access
     92.33 ±  2%      +4.0       96.28            +4.0       96.37           -63.1       29.21 ± 67%  perf-profile.children.cycles-pp.do_read_fault
     92.33 ±  2%      +4.0       96.31            +4.1       96.40           -63.1       29.22 ± 67%  perf-profile.children.cycles-pp.do_pte_missing
     92.49 ±  2%      +4.0       96.52            +4.1       96.60           -62.9       29.61 ± 67%  perf-profile.children.cycles-pp.asm_exc_page_fault
     92.41 ±  2%      +4.0       96.46            +4.1       96.54           -63.0       29.44 ± 67%  perf-profile.children.cycles-pp.exc_page_fault
     92.41 ±  2%      +4.0       96.46            +4.1       96.54           -63.0       29.43 ± 67%  perf-profile.children.cycles-pp.do_user_addr_fault
     92.37 ±  2%      +4.1       96.52            +4.2       96.59           -63.0       29.33 ± 67%  perf-profile.children.cycles-pp.handle_mm_fault
     92.35 ±  2%      +4.2       96.51            +4.2       96.59           -63.1       29.29 ± 67%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.30 ± 15%      +5.5        5.78 ± 10%      +5.6        5.86 ±  9%      -0.3        0.00        perf-profile.children.cycles-pp.page_cache_ra_unbounded
     17.97 ±  9%      +5.6       23.56            +5.8       23.77           -15.1        2.84 ± 67%  perf-profile.children.cycles-pp.try_to_unmap_flush
     17.97 ±  9%      +5.6       23.56            +5.8       23.77           -15.1        2.84 ± 67%  perf-profile.children.cycles-pp.arch_tlbbatch_flush
     17.97 ±  9%      +5.6       23.58            +5.8       23.79           -15.1        2.84 ± 67%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
     17.97 ±  9%      +5.6       23.58            +5.8       23.79           -15.1        2.84 ± 67%  perf-profile.children.cycles-pp.smp_call_function_many_cond
     82.68 ±  2%      +7.8       90.43            +8.1       90.79           -66.7       16.00 ± 70%  perf-profile.children.cycles-pp.folio_alloc_noprof
     22.07 ±  7%      +7.9       29.92 ±  2%      +8.6       30.70 ±  2%     -18.1        3.95 ± 44%  perf-profile.children.cycles-pp.free_frozen_page_commit
     22.20 ±  7%      +7.9       30.09 ±  2%      +8.7       30.86 ±  2%     -18.0        4.16 ± 49%  perf-profile.children.cycles-pp.free_pcppages_bulk
     22.13 ±  7%      +9.3       31.42 ±  2%     +10.2       32.29 ±  2%     -17.9        4.22 ± 40%  perf-profile.children.cycles-pp.free_unref_folios
     83.71 ±  2%     +10.8       94.50           +11.2       94.86           -67.6       16.14 ± 71%  perf-profile.children.cycles-pp.alloc_pages_mpol
     83.71 ±  2%     +10.8       94.52           +11.2       94.88           -67.6       16.13 ± 71%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     47.00 ±  8%     +12.0       58.98           +12.7       59.67           -34.1       12.93 ± 64%  perf-profile.children.cycles-pp.shrink_node
     46.98 ±  8%     +12.0       58.97           +12.7       59.66           -34.1       12.92 ± 64%  perf-profile.children.cycles-pp.shrink_many
     46.97 ±  8%     +12.0       58.96           +12.7       59.65           -34.1       12.91 ± 64%  perf-profile.children.cycles-pp.shrink_one
     45.19 ±  8%     +12.0       57.22           +12.7       57.89           -36.3        8.90 ± 70%  perf-profile.children.cycles-pp.try_to_free_pages
     45.07 ±  8%     +12.1       57.18           +12.8       57.86           -36.3        8.82 ± 70%  perf-profile.children.cycles-pp.do_try_to_free_pages
     46.21 ±  7%     +12.6       58.81           +13.3       59.55           -35.0       11.25 ± 64%  perf-profile.children.cycles-pp.try_to_shrink_lruvec
     46.18 ±  7%     +12.6       58.79           +13.4       59.54           -35.0       11.19 ± 64%  perf-profile.children.cycles-pp.evict_folios
     43.67 ±  7%     +13.7       57.42           +14.7       58.34           -34.5        9.14 ± 64%  perf-profile.children.cycles-pp.shrink_folio_list
     16.71 ±  7%     +18.9       35.65           +18.7       35.46           -12.1        4.63 ± 77%  perf-profile.children.cycles-pp.rmqueue
     17.15 ±  6%     +18.9       36.10           +18.7       35.90           -12.0        5.15 ± 75%  perf-profile.children.cycles-pp.get_page_from_freelist
     52.45 ±  6%     +19.0       71.46           +19.2       71.60           -35.9       16.55 ± 72%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     12.76 ±  7%     +20.1       32.82 ±  2%     +19.8       32.60            -9.3        3.47 ± 75%  perf-profile.children.cycles-pp.__rmqueue_pcplist
     12.73 ±  7%     +20.1       32.81 ±  2%     +19.8       32.58            -9.3        3.43 ± 76%  perf-profile.children.cycles-pp.rmqueue_bulk
     48.52 ±  6%     +20.4       68.92           +20.7       69.26           -34.1       14.39 ± 69%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     68.16 ±  2%     +26.1       94.26           +26.5       94.61           -56.9       11.28 ± 72%  perf-profile.children.cycles-pp.__alloc_pages_slowpath
     11.45 ± 16%     -11.4        0.00           -11.4        0.00           -10.5        0.91 ±102%  perf-profile.self.cycles-pp.isolate_migratepages_block
      2.95 ± 75%      -2.7        0.29 ± 66%      -2.7        0.25 ± 75%     +20.7       23.67 ± 10%  perf-profile.self.cycles-pp.acpi_safe_halt
      1.17 ± 17%      -1.2        0.00            -1.2        0.00            -1.0        0.14 ± 75%  perf-profile.self.cycles-pp.get_pfnblock_flags_mask
      1.24 ±  6%      -0.7        0.58 ±  5%      -0.7        0.54 ±  4%      +3.1        4.33 ± 58%  perf-profile.self.cycles-pp.do_rw_once
      1.07 ±  7%      -0.6        0.44 ±  6%      -0.7        0.40 ±  5%      +2.9        3.93 ± 63%  perf-profile.self.cycles-pp.memset_orig
      0.69 ±  6%      -0.4        0.32 ±  5%      -0.4        0.30 ±  5%      +0.6        1.27 ± 61%  perf-profile.self.cycles-pp.do_access
      0.18 ±  9%      -0.1        0.06 ±  9%      -0.1        0.05            +0.6        0.81 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.14 ±  5%      -0.1        0.05 ±  8%      -0.1        0.04 ± 37%      +0.9        1.02 ± 29%  perf-profile.self.cycles-pp.xas_create
      0.13 ± 12%      -0.1        0.04 ± 71%      -0.1        0.03 ± 77%      +0.4        0.54 ± 44%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.18 ±  8%      -0.1        0.09 ±  6%      -0.1        0.09 ±  8%      +0.3        0.50 ± 62%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.16 ±  8%      -0.1        0.08 ±  6%      -0.1        0.08 ±  6%      +1.0        1.13 ± 34%  perf-profile.self.cycles-pp.__free_one_page
      0.08 ±  5%      -0.1        0.00            -0.1        0.00            +0.1        0.17 ±  8%  perf-profile.self.cycles-pp.free_frozen_page_commit
      0.12 ±  8%      -0.1        0.04 ± 71%      -0.1        0.01 ±264%      +0.9        1.00 ± 47%  perf-profile.self.cycles-pp.lru_gen_del_folio
      0.14 ±  7%      -0.1        0.06 ±  9%      -0.1        0.05            +0.3        0.39 ± 35%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.08 ±  7%      -0.1        0.00            -0.1        0.00            +0.6        0.68 ± 37%  perf-profile.self.cycles-pp._raw_spin_lock
      0.23 ± 14%      -0.1        0.16 ±  5%      -0.1        0.15 ±  6%      +0.1        0.29 ± 76%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.14 ± 18%      -0.1        0.08 ±  9%      -0.1        0.07 ±  7%      -0.1        0.08 ± 91%  perf-profile.self.cycles-pp.get_pfn_folio
      0.19 ± 12%      -0.1        0.12 ±  7%      -0.1        0.12 ±  5%      +0.5        0.66 ± 54%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.06 ±  7%      -0.1        0.00            -0.1        0.00            +0.5        0.55 ± 28%  perf-profile.self.cycles-pp.ifs_free
      0.10 ± 17%      -0.1        0.04 ± 44%      -0.1        0.01 ±173%      -0.0        0.08 ± 89%  perf-profile.self.cycles-pp.try_to_unmap_one
      0.04 ± 45%      -0.0        0.00            -0.0        0.00            +0.2        0.24 ± 42%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.03 ± 70%      -0.0        0.00            -0.0        0.00            +0.2        0.19 ± 56%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.02 ± 99%      -0.0        0.00            -0.0        0.00            +0.2        0.18 ± 24%  perf-profile.self.cycles-pp.lru_add
      0.02 ± 99%      -0.0        0.00            -0.0        0.00            +1.6        1.64 ± 73%  perf-profile.self.cycles-pp.xas_store
      0.02 ±141%      -0.0        0.00            -0.0        0.00            +0.2        0.19 ± 27%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.4        0.38 ± 45%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.5        0.46 ± 41%  perf-profile.self.cycles-pp.free_unref_folios
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.5        0.54 ± 53%  perf-profile.self.cycles-pp.folios_put_refs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.9        0.86 ± 59%  perf-profile.self.cycles-pp.__slab_free
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.06 ± 17%  perf-profile.self.cycles-pp.folio_add_lru
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ± 38%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.11 ± 37%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.13 ± 64%  perf-profile.self.cycles-pp.kfree
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.14 ± 70%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.14 ± 48%  perf-profile.self.cycles-pp.workingset_update_node
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.15 ± 20%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.16 ± 58%  perf-profile.self.cycles-pp.xas_start
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.19 ± 72%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.20 ± 70%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.21 ± 73%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.21 ± 70%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.22 ± 58%  perf-profile.self.cycles-pp.mem_cgroup_from_slab_obj
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.22 ± 18%  perf-profile.self.cycles-pp.folio_unlock
      0.00            +0.0        0.00            +0.0        0.00            +0.2        0.23 ± 66%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.27 ± 75%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.30 ± 47%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.36 ± 77%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.37 ± 48%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.41 ± 75%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.43 ± 76%  perf-profile.self.cycles-pp.xas_clear_mark
      0.00            +0.0        0.00            +0.0        0.00            +0.5        0.52 ± 80%  perf-profile.self.cycles-pp.truncate_folio_batch_exceptionals
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.59 ± 50%  perf-profile.self.cycles-pp.memcpy_toio
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.60 ± 81%  perf-profile.self.cycles-pp.xas_get_order
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.62 ± 72%  perf-profile.self.cycles-pp.tick_nohz_handler
      0.00            +0.0        0.00            +0.0        0.00            +0.6        0.63 ± 79%  perf-profile.self.cycles-pp.sched_balance_domains
      0.00            +0.0        0.00            +0.0        0.00            +0.7        0.66 ± 78%  perf-profile.self.cycles-pp.list_lru_del
      0.00            +0.0        0.00            +0.0        0.00            +0.8        0.84 ± 76%  perf-profile.self.cycles-pp.xas_find
      0.00            +0.0        0.00            +0.0        0.00            +0.9        0.86 ± 40%  perf-profile.self.cycles-pp.isolate_freepages_block
      0.00            +0.0        0.00            +0.0        0.00            +0.9        0.92 ± 88%  perf-profile.self.cycles-pp.find_lock_entries
      0.00            +0.0        0.00            +0.0        0.00            +1.6        1.57 ± 76%  perf-profile.self.cycles-pp.get_jiffies_update
      0.00            +0.0        0.00            +0.0        0.00            +1.7        1.70 ± 68%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.0        0.00            +0.0        0.00            +4.5        4.45 ± 78%  perf-profile.self.cycles-pp.copy_mc_fragile
      0.00            +0.0        0.00            +0.1        0.09 ±  5%      +0.0        0.00        perf-profile.self.cycles-pp.try_to_claim_block
      0.00            +0.1        0.09            +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.try_to_steal_block
      0.35 ± 17%      +0.4        0.70 ±  2%      +0.4        0.71 ±  4%      -0.3        0.00        perf-profile.self.cycles-pp.prep_move_freepages_block
     17.81 ±  9%      +5.7       23.46            +5.9       23.67           -15.1        2.72 ± 67%  perf-profile.self.cycles-pp.smp_call_function_many_cond
     52.45 ±  6%     +19.0       71.46           +19.2       71.60           -35.9       16.55 ± 72%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


> 
> commit acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1 (origin/master, origin/HEAD)
> Merge: 3491aa04787f f278b6d5bb46
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Tue Apr 1 20:00:51 2025 -0700
> 
>     Merge tag 'net-6.15-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> 
> Thanks!
> 
> ---
> 
> From 13433454403e0c6f99ccc3b76c609034fe47e41c Mon Sep 17 00:00:00 2001
> From: Johannes Weiner <hannes@cmpxchg.org>
> Date: Wed, 2 Apr 2025 14:23:53 -0400
> Subject: [PATCH] mm: page_alloc: speed up fallbacks in rmqueue_bulk()
> 
> Not-yet-signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  mm/page_alloc.c | 100 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 74 insertions(+), 26 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index f51aa6051a99..03b0d45ed45a 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2194,11 +2194,11 @@ try_to_claim_block(struct zone *zone, struct page *page,
>   * The use of signed ints for order and current_order is a deliberate
>   * deviation from the rest of this file, to make the for loop
>   * condition simpler.
> - *
> - * Return the stolen page, or NULL if none can be found.
>   */
> +
> +/* Try to claim a whole foreign block, take a page, expand the remainder */
>  static __always_inline struct page *
> -__rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
> +__rmqueue_claim(struct zone *zone, int order, int start_migratetype,
>  						unsigned int alloc_flags)
>  {
>  	struct free_area *area;
> @@ -2236,14 +2236,26 @@ __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
>  		page = try_to_claim_block(zone, page, current_order, order,
>  					  start_migratetype, fallback_mt,
>  					  alloc_flags);
> -		if (page)
> -			goto got_one;
> +		if (page) {
> +			trace_mm_page_alloc_extfrag(page, order, current_order,
> +						    start_migratetype, fallback_mt);
> +			return page;
> +		}
>  	}
>  
> -	if (alloc_flags & ALLOC_NOFRAGMENT)
> -		return NULL;
> +	return NULL;
> +}
> +
> +/* Try to steal a single page from a foreign block */
> +static __always_inline struct page *
> +__rmqueue_steal(struct zone *zone, int order, int start_migratetype)
> +{
> +	struct free_area *area;
> +	int current_order;
> +	struct page *page;
> +	int fallback_mt;
> +	bool claim_block;
>  
> -	/* No luck claiming pageblock. Find the smallest fallback page */
>  	for (current_order = order; current_order < NR_PAGE_ORDERS; current_order++) {
>  		area = &(zone->free_area[current_order]);
>  		fallback_mt = find_suitable_fallback(area, current_order,
> @@ -2253,25 +2265,28 @@ __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
>  
>  		page = get_page_from_free_area(area, fallback_mt);
>  		page_del_and_expand(zone, page, order, current_order, fallback_mt);
> -		goto got_one;
> +		trace_mm_page_alloc_extfrag(page, order, current_order,
> +					    start_migratetype, fallback_mt);
> +		return page;
>  	}
>  
>  	return NULL;
> -
> -got_one:
> -	trace_mm_page_alloc_extfrag(page, order, current_order,
> -		start_migratetype, fallback_mt);
> -
> -	return page;
>  }
>  
> +enum rmqueue_mode {
> +	RMQUEUE_NORMAL,
> +	RMQUEUE_CMA,
> +	RMQUEUE_CLAIM,
> +	RMQUEUE_STEAL,
> +};
> +
>  /*
>   * Do the hard work of removing an element from the buddy allocator.
>   * Call me with the zone->lock already held.
>   */
>  static __always_inline struct page *
>  __rmqueue(struct zone *zone, unsigned int order, int migratetype,
> -						unsigned int alloc_flags)
> +	  unsigned int alloc_flags, enum rmqueue_mode *mode)
>  {
>  	struct page *page;
>  
> @@ -2290,16 +2305,47 @@ __rmqueue(struct zone *zone, unsigned int order, int migratetype,
>  		}
>  	}
>  
> -	page = __rmqueue_smallest(zone, order, migratetype);
> -	if (unlikely(!page)) {
> -		if (alloc_flags & ALLOC_CMA)
> +	/*
> +	 * Try the different freelists, native then foreign.
> +	 *
> +	 * The fallback logic is expensive and rmqueue_bulk() calls in
> +	 * a loop with the zone->lock held, meaning the freelists are
> +	 * not subject to any outside changes. Remember in *mode where
> +	 * we found pay dirt, to save us the search on the next call.
> +	 */
> +	switch (*mode) {
> +	case RMQUEUE_NORMAL:
> +		page = __rmqueue_smallest(zone, order, migratetype);
> +		if (page)
> +			return page;
> +		fallthrough;
> +	case RMQUEUE_CMA:
> +		if (alloc_flags & ALLOC_CMA) {
>  			page = __rmqueue_cma_fallback(zone, order);
> -
> -		if (!page)
> -			page = __rmqueue_fallback(zone, order, migratetype,
> -						  alloc_flags);
> +			if (page) {
> +				*mode = RMQUEUE_CMA;
> +				return page;
> +			}
> +		}
> +		fallthrough;
> +	case RMQUEUE_CLAIM:
> +		page = __rmqueue_claim(zone, order, migratetype, alloc_flags);
> +		if (page) {
> +			/* Replenished native freelist, back to normal mode */
> +			*mode = RMQUEUE_NORMAL;
> +			return page;
> +		}
> +		fallthrough;
> +	case RMQUEUE_STEAL:
> +		if (!(alloc_flags & ALLOC_NOFRAGMENT)) {
> +			page = __rmqueue_steal(zone, order, migratetype);
> +			if (page) {
> +				*mode = RMQUEUE_STEAL;
> +				return page;
> +			}
> +		}
>  	}
> -	return page;
> +	return NULL;
>  }
>  
>  /*
> @@ -2311,6 +2357,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
>  			unsigned long count, struct list_head *list,
>  			int migratetype, unsigned int alloc_flags)
>  {
> +	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
>  	unsigned long flags;
>  	int i;
>  
> @@ -2321,7 +2368,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
>  	}
>  	for (i = 0; i < count; ++i) {
>  		struct page *page = __rmqueue(zone, order, migratetype,
> -								alloc_flags);
> +					      alloc_flags, &rmqm);
>  		if (unlikely(page == NULL))
>  			break;
>  
> @@ -2934,6 +2981,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
>  {
>  	struct page *page;
>  	unsigned long flags;
> +	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
>  
>  	do {
>  		page = NULL;
> @@ -2945,7 +2993,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
>  		if (alloc_flags & ALLOC_HIGHATOMIC)
>  			page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
>  		if (!page) {
> -			page = __rmqueue(zone, order, migratetype, alloc_flags);
> +			page = __rmqueue(zone, order, migratetype, alloc_flags, &rmqm);
>  
>  			/*
>  			 * If the allocation fails, allow OOM handling and
> -- 
> 2.49.0
