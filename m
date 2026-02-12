Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB33446C7
	for <oe-lkp@lists.linux.dev>; Thu, 12 Feb 2026 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904775; cv=fail; b=lsg3+wbLJ1yCsDFKM9uDydYpnzG4VLuB8+ZG++VF448cAf4OUOH/kDhtD7PI5HMgb1hgbDP+UXljt8VstY8gRCzJM0EFp+uXtCt5MSOR+gX6b85Y3z+ykezXZJKcVu7DuQDd+KFNg6UWtc1qcLHZbCGZXuPEH1nQ47M0P0+YwGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904775; c=relaxed/simple;
	bh=NNBes4a5wml8I63p5DRdknB2vlw7wahuAop8/kVYWyY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uFOIR5/HvxMLOWX30M9Y1FzlDCIKDh8JoOFXeHfO9uj0U6CCasrbpMb5EIdq8XCdahRD8qRhUL+kwz/t8TrvYh+dPO0qvkGTmDxPPkAzHO9Ft9rP2uxyg7gQtu6/V/yDgahq89pUzJHIMF5ce5DxpSsJ7PRolDHSYe89OO4gV5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrZZARaA; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrZZARaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770904772; x=1802440772;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=NNBes4a5wml8I63p5DRdknB2vlw7wahuAop8/kVYWyY=;
  b=RrZZARaAL8Xxgwr7psLS4mRhJkR36AtrszWIFgA3alWwbHPh1WAbPdWb
   09U2qiYyjnCTnEmXvC7sw6XpNr1bwmMKaM7jfTkQtL7yy00ZzEEOI63Xr
   xhyDd09eDK6L0RvMgfnvnA9tuaK1u9Yrr6+SfOSe2T7UWOq4jjbdtd+p5
   9PmCq7lSDr3TGHfGNdVgapcAM0sx0wsXhblKVvY5EBngNdVnzGimqSxlU
   RE4mRLbaJkjAQx+vN4j5qEvDvqXMQPsqQPjBigANGaflr92Pes60Tj7Sw
   EfoPQIxvLzK7Tc575FuO/Q7Vy1oevFrzr3avO4pdgn6uBcCkOW7+mf+/V
   w==;
X-CSE-ConnectionGUID: ehTYDCnsSAibO+alYP8n7w==
X-CSE-MsgGUID: /VxoZ0RXRJ27UTsK3urIUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71790396"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71790396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 05:59:32 -0800
X-CSE-ConnectionGUID: J+gXMEK7QJWnD3cXibIgoA==
X-CSE-MsgGUID: N0S2/bP0QP2SROMfXu/dYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211421548"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 05:59:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 05:59:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 05:59:30 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 05:59:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAehHLOQOhI1tyMPFE0ZpS6FIFCvdqUvxuysbd/dEJ56y5WJ/p1YopgKStS92bw4HGX2X35e/tSY53mD/3JfIxR9I2ru9BYLVnM30uBKJtHcQEUkeYKHsldovYWCuLcGZuiGoNYNjltJwMXIs1I3AtlF4+FFR6TmP37d7p59PSU/1Us/Sf8FsnzSYRVeCcS3x9odMXIGnFyKmZTF80ApTyB4hGDwQM+2Ryxae2uIiZkNiTBxIUhdHxR5ZWFhchOAzEEt3JgV5LaJLOlBz4qKOan/DSDtqI+M5Sok0YT2KHuL0FQBG/SPcviZbkV6SZjGdrj+7eFYQgZJQ7t1FWJWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q0mIIeccDV7c83OkACrXk+rc2udUSPhW7d+beF8vAc=;
 b=QdFKylCZOUoQ4bV0tKgR9T8Z3Ca/1eTXdv/6cSreqVzX3odoCntNspDWeWPz75YaabfC+QKaPX0lCJWfD9cWq0vo/QpSRdPxXGAomg2JJjmKhJk8AmusGLQO0gwGJO7Qy+6C7xw/zjEmK6TsEhVkfFzavlSuZbXY6QOO9K5T+oPzKEaYGHGxNGSbkIb2xe9PQGuFsen1QZ4okb7/gpoUClIk1rZMO4OC72Wut99cqxEZ170aQCKUUzzYYSJZvfsyGqbXrZFvHoxE3Z9bd6B9RdFU9DxiTYbx7IG6RndsBU882SV4ddENRF7C3ecx0jwNF43v/0nNnMB7e0y6wYc2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 13:59:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 13:59:22 +0000
Date: Thu, 12 Feb 2026 21:59:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  15257cc2f9: stress-ng.sigrt.ops_per_sec
 8.0% improvement
Message-ID: <202602122113.ef9298c3-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU1PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:802:18::32) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ecc425-ea35-4187-30da-08de6a3eec80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0dYtwHkMo//fOaXkAoyTGQx3C8E+9CuCmEG5lMdXk2yb2N3xfAHy+HD9Kk?=
 =?iso-8859-1?Q?41lD/n2leHrNEaEeS98ea/3DwN+udb31MMbZHPqS1RCuf0PMhjULgXmIha?=
 =?iso-8859-1?Q?pvSq3mnhbhEpr/mfxHrDAIFaptLl/jSUHnRuOBaRnV4rqYC1aD2D/phl5x?=
 =?iso-8859-1?Q?hkT56Ul+RJrJuxMvJmZWqZy3AKP0l2gQ3zuGC0EyEDWS81QC7l/T1wbG3W?=
 =?iso-8859-1?Q?nWnPgX65wR9YdaA94oOAPuZd2ZCoxUV87YZYnuv6Yc6Nrcw5zWeZ1XehOd?=
 =?iso-8859-1?Q?5eEi2UT3fORFnK+/oWMpOKqzMphDQPccrao6zNiQkjiLT/M556+5UFpBkB?=
 =?iso-8859-1?Q?ywxzprSAwbUAxHlLFmnbWN3Wmfr0mWjZ5BpGTuk4rpjp2EIJmUPKyaNnAS?=
 =?iso-8859-1?Q?9ZOmUh/HVz4sh+bv7eG9wZz0hPttsFmNmXdUWoLZfiTRLQnvaAy2rYCnr9?=
 =?iso-8859-1?Q?YMPuTqayhtui+JHymMdRcBRb3FX7M5gXmaGA7WCkoBGo/ftHT29U6PkPbT?=
 =?iso-8859-1?Q?RKt9Ta8/KwjvxRJJN7vf5EeNsfCz97CUrxYM0HugIRLdMc3jeFpTK1OR3s?=
 =?iso-8859-1?Q?7wA+4b1AJL9BekKr9y/N7+LVX8fiD4fftK+SU6fvUrsjnDlWtlKjP5Nz3k?=
 =?iso-8859-1?Q?D16hYEQy3lcp3xIk1WQaE3ThlCl/0BgaXAPPIzIbFAJN9bNvqsaZPRaXif?=
 =?iso-8859-1?Q?L3/j4rdM/J87oPBWkhG9IdBpdcGvougwK/9WfAAfXC+GtDEjYvwLYX8lSb?=
 =?iso-8859-1?Q?BJaS3U8Jl4Zhbfm6+jt5O6Bf4SwRiwdn3P0Tj0H6CoWQSQ2kI/2VqIVHvr?=
 =?iso-8859-1?Q?DoVFn2dUONS0LQnsGQefI7jilGQYRViywSXuGwZzRiqUqP2TlgdN93VSzu?=
 =?iso-8859-1?Q?GXGu7TROZYwKcOEmk/2Pz8YSPqlEIqRjjIUENUcnwZIOz6LZbDwxt9swZJ?=
 =?iso-8859-1?Q?cROBFmNreJ7FS6lWpzT5C+/TwtEzs78w55DVHOy3ew6RGG2YYViFe0fBcA?=
 =?iso-8859-1?Q?OX7XnBLpIBEvoNF0XZ9Wr6ScikWBSMIBMZxtMmJRaReNDCm5YtfV8NiMbJ?=
 =?iso-8859-1?Q?p9OgtrHot4G1tUPnAP4GdtVWehr2zyhWf9nSUyWMITrI1K5GtO/8wJh2KM?=
 =?iso-8859-1?Q?KjvyQcXuGdHQUlUnEhDnWjEiWJSnq+gbU8+60c1h1seg3FAPlNH0bbyzVv?=
 =?iso-8859-1?Q?RUm91F1o70bsTGjkRj0I+ffcwKFGtDPlYh+Z6PWRCbc0VFcc1hesyi+Pyl?=
 =?iso-8859-1?Q?+iliDwDUlalwL6vbLlS3ifFhghMejmE1QhDpdSBCwqi1OmERIr26NemNu4?=
 =?iso-8859-1?Q?b2tuBCS9BOb3L+IAnwy8lT4epHqOIfNiJGV4E5a3cN9GKa4Z3KVRqPlYvT?=
 =?iso-8859-1?Q?pNkcjsqY6cKB6wJ5U9HANI0/2TUtfltzR5ZhDbyVtiy1vzX25NTg1j+eUj?=
 =?iso-8859-1?Q?NfgEXfepIrpHPuML5UijZ2cknStx3uVQyXzQ+2TdymHMnBATkQWKqfh1De?=
 =?iso-8859-1?Q?MHe19TDWTaowv1A0nmbdu47cVoso1PzT1QZDPHJp18fR72fDLg096LBCNG?=
 =?iso-8859-1?Q?qNbngX+F8d7kZh8BLO4A363p0O+9tMDgBFkba7iNCFvravCkSHccl7FyZT?=
 =?iso-8859-1?Q?Vv4aKJCUMqK021x+G57PBhvLdBf8kN3zDR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9usm5lzp49zNQlPkdUWxQ2MklT/YUtJr5FjA6sgP/kwL2Ivav4Ke24b4GW?=
 =?iso-8859-1?Q?WK7R8JZXVh+DHQO8sFAqvV3nxrod201xJaQHV6r5Akq65FXJIt4UYq9gz3?=
 =?iso-8859-1?Q?pUZCGkCAa8LaFV927jHvxQN9e85pDtlXXAMGAfBoka+I0a7Rplqdb6eXp9?=
 =?iso-8859-1?Q?rEHOrzuAz8iSxddK3YKXjYB70Q03UtzFWxl0YkPoi643J16nndWSpjzX4g?=
 =?iso-8859-1?Q?yHeMEBpRoVAQ0IFW7ZbQ7oi5ikCii/hE57T06WwRp8WT8lluJX0ymMNNau?=
 =?iso-8859-1?Q?rqlKkOQ6e45azPhOpYy9l33hArWtjwjCuhzoM9TERBj0E//R3DQiA5wMS5?=
 =?iso-8859-1?Q?XdaiIoFi/XXYCcQRnxuvVG0+ccrk4f3BqoVLehc0KHZh77zUVYU5zB5lne?=
 =?iso-8859-1?Q?qyLlBQWU35osa2jfZToOPNo28RrgslgwHIB53qlC6hvYlzAdbBQquoMJ+D?=
 =?iso-8859-1?Q?s4TAVJ0RwrtbIRW2BAuaFtoMeMXGCaoXh9S1/5hf9kYDBV1Zj1tf5ZkTeE?=
 =?iso-8859-1?Q?spY4YxkUo6SQALWmr4X2Anamv/xDFpC9LL0hNKmZcHucDeTLhV22Qxb7KX?=
 =?iso-8859-1?Q?iOaW15rPaPigC9bE07ZcU/annwvHnuyYA1j6IzSQoaRtCuo94n6sQokhkV?=
 =?iso-8859-1?Q?z23thyJujNv4qbbsJ1CQqfH2NX3iXQTfRw7Rd5/OIyWSxPuSW8WX2zjw3L?=
 =?iso-8859-1?Q?jg/8Wn5buYMW03hXAe7qdzbso3nuomx6NaNWg9JdLB1c+Xb4eCiaE8iPTh?=
 =?iso-8859-1?Q?JJT9jmeUJgvERod36mbu2KW6rvrqPIAsN9mGTfpQZrrWzRhyxKMz6XwXPB?=
 =?iso-8859-1?Q?e8/cEseLtl4fsHKG39hAdkuTNQVwkRsMsdVCPvIAXyVUgjKNibEzillrbc?=
 =?iso-8859-1?Q?CUNwQBr3KOeX03wsaPAGZ6VFHEfBD3uW2hXvAb67Mw1UiPvpRQxKKTv850?=
 =?iso-8859-1?Q?3vXqaU5CiwilrpXbTQkye4vXTBndV4ReqoxK0IxFBwSGPdipUrMkxV0rk/?=
 =?iso-8859-1?Q?UZWPY5+P0i1101ByBoUYhzRVJnjAC2Vw1S6Nmai/lMnjysFFWft4UxN8Y7?=
 =?iso-8859-1?Q?Aj6uPkjUZMj/rgG+AhFeh0PJToqCzAHwRDm3CotjWeXFxJPuPsAmgEP7m0?=
 =?iso-8859-1?Q?g8WP1K/4d5WpDxULGKHvzXL9PsqB3kStePSRt8WniRX9MpAYMh7qcxv1Lr?=
 =?iso-8859-1?Q?H9IxfSAxPSZYmoRNWWH9t+lDIYanzU8gUNAIgTre6aiBnDWQ7EwyRMJWvj?=
 =?iso-8859-1?Q?VWYPMcGUEcpSIBaNNAHmVJlG70zXvf5J1xVgK3rWfC575QomReQG7R/Nf0?=
 =?iso-8859-1?Q?94uEg9M00HSUlp2Lz5aKy+WWzl/O7GSLy03/nxtIZ5cIHh8DLmrmonmxSn?=
 =?iso-8859-1?Q?DAa77hwFjAgchQ5tOHaZ2eIYhDBcyOyoqdsXdu+a8iu57nDWmmd/FY1ucB?=
 =?iso-8859-1?Q?mADILkT7xx3KXmVQuwFf2bbn/fwJ3w4cplPtQgx9tjMPu2FNK4EG0QNSpi?=
 =?iso-8859-1?Q?Gk7Ebzp968ZMkEiZD2UP9oGyzS6t5efFgXILxSsaJl+52YsVsHENcpdNnl?=
 =?iso-8859-1?Q?Umub636naCoYbHUVac5AIqfLBCufCAv8fKRB3dn474amGsYH+ivdZKLBAT?=
 =?iso-8859-1?Q?sqF1TG67t1ihrfONQn8xMn0CSX5zuYm3KeyXvH9OWoQWfdJn9ODFkYIjsb?=
 =?iso-8859-1?Q?tRadrehlDRgG0wsPoOUYpuDmdmDg3I9EqQv7d7sX40NlosC+wL8NDAa2ja?=
 =?iso-8859-1?Q?0OcPlvlnBHGfgjWNLIlguY22cLA8SCKhQetYKwmJGQY+JRQ0rDKVhoOL4R?=
 =?iso-8859-1?Q?M3DiIiHdaA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ecc425-ea35-4187-30da-08de6a3eec80
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 13:59:22.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3Ikyp842h1Z2mR4DIQu61FWhyyOL0BJjkDOlnYATFmnSc/5lQj/IwzfeX9Xn7BZXajgzZ+JA3Jl6EL9QsCQ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 8.0% improvement of stress-ng.sigrt.ops_per_sec on:


commit: 15257cc2f905dbf5813c0bfdd3c15885f28093c4 ("sched/fair: Revert force wakeup preemption")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sigrt
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260212/202602122113.ef9298c3-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sigrt/stress-ng/60s

commit: 
  4f70f106bc ("sched/fair: Disable scheduler feature NEXT_BUDDY")
  15257cc2f9 ("sched/fair: Revert force wakeup preemption")

4f70f106bca1a56b 15257cc2f905dbf5813c0bfdd3c 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   7521030 ± 16%     -45.9%    4071714 ± 14%  cpuidle..usage
      1778 ± 20%     -51.3%     866.50 ± 31%  perf-c2c.DRAM.local
      1.68 ± 15%      -0.6        1.04 ± 18%  turbostat.C1E%
      0.47 ±  3%      +0.1        0.53 ±  4%  mpstat.cpu.all.irq%
     10.39 ± 12%      -1.9        8.47 ±  8%  mpstat.cpu.all.usr%
    887.66 ±  2%    +100.4%       1778 ±  2%  vmstat.procs.r
   5768162           -30.4%    4016564        vmstat.system.cs
   2494804 ±  8%     -12.8%    2176354 ±  4%  meminfo.Active
   2494788 ±  8%     -12.8%    2176338 ±  4%  meminfo.Active(anon)
    161957 ±  3%     -24.0%     123128 ± 15%  meminfo.Mapped
   1467515 ± 14%     -21.8%    1147100 ±  8%  meminfo.Shmem
    624246 ±  8%     -13.1%     542505 ±  4%  proc-vmstat.nr_active_anon
   1292900 ±  3%      -6.3%    1210843        proc-vmstat.nr_file_pages
    145668            -1.2%     143902        proc-vmstat.nr_kernel_stack
     40502 ±  2%     -24.7%      30482 ± 15%  proc-vmstat.nr_mapped
    367446 ± 13%     -22.3%     285390 ±  7%  proc-vmstat.nr_shmem
     48398            -4.2%      46351        proc-vmstat.nr_slab_reclaimable
    624246 ±  8%     -13.1%     542505 ±  4%  proc-vmstat.nr_zone_active_anon
    101289 ±  3%    +258.0%     362606 ±  2%  stress-ng.sigrt.nanosecs_between_sigqueue_and_sigwaitinfo_completion
 2.109e+08            +6.8%  2.252e+08        stress-ng.sigrt.ops
   3550220            +8.0%    3832626        stress-ng.sigrt.ops_per_sec
 1.391e+08           -63.7%   50478067        stress-ng.time.involuntary_context_switches
    565845           +14.8%     649440 ±  2%  stress-ng.time.minor_page_faults
     11582            +2.9%      11922        stress-ng.time.system_time
      1367 ± 12%     -18.1%       1119 ±  9%  stress-ng.time.user_time
 2.106e+08            -8.1%  1.934e+08        stress-ng.time.voluntary_context_switches
   1228025 ±  8%     -36.3%     782452 ± 23%  sched_debug.cfs_rq:/.avg_vruntime.stddev
    251.33 ± 10%     -23.7%     191.85 ± 21%  sched_debug.cfs_rq:/.util_avg.avg
      1345 ± 13%     -16.1%       1129 ±  4%  sched_debug.cfs_rq:/.util_avg.max
   1226071 ±  8%     -36.2%     782377 ± 23%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    105.26 ± 10%     -37.1%      66.17 ± 38%  sched_debug.cpu.clock.stddev
    798317           -30.5%     555027        sched_debug.cpu.nr_switches.avg
   1127713 ±  5%     -30.6%     782727 ±  6%  sched_debug.cpu.nr_switches.max
    150870 ±  7%     -27.2%     109891 ± 12%  sched_debug.cpu.nr_switches.stddev
      3.50 ± 16%     -30.9%       2.42 ± 20%  sched_debug.cpu.nr_uninterruptible.avg
  14867143 ±  4%     -11.6%   13144218        perf-stat.i.cache-misses
 1.783e+08 ±  4%      -9.0%  1.622e+08 ±  4%  perf-stat.i.cache-references
   5878928           -30.4%    4093415        perf-stat.i.context-switches
     44760 ±  6%     +58.1%      70778 ± 12%  perf-stat.i.cpu-migrations
     26.31           -29.9%      18.44        perf-stat.i.metric.K/sec
     17967            +4.0%      18691        perf-stat.i.minor-faults
     17968            +4.0%      18691        perf-stat.i.page-faults
      0.19 ±  5%     -12.6%       0.17 ±  7%  perf-stat.overall.MPKI
     44065 ±  6%     +14.1%      50294        perf-stat.overall.cycles-between-cache-misses
  13997205 ±  5%     -12.4%   12260391        perf-stat.ps.cache-misses
 1.698e+08 ±  5%     -10.9%  1.514e+08 ±  5%  perf-stat.ps.cache-references
   5760534           -30.6%    3996103        perf-stat.ps.context-switches
     37802 ±  7%     +51.5%      57253 ± 11%  perf-stat.ps.cpu-migrations
      1.08 ± 13%    +280.6%       4.10 ± 27%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      5677 ±  8%     +97.5%      11210 ± 31%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      1.08 ± 13%    +280.6%       4.10 ± 27%  perf-sched.total_sch_delay.average.ms
      5677 ±  8%     +97.5%      11210 ± 31%  perf-sched.total_sch_delay.max.ms
     10.95 ±  6%    +139.4%      26.21 ± 29%  perf-sched.total_wait_and_delay.average.ms
   2783337 ± 17%     -18.2%    2277663        perf-sched.total_wait_and_delay.count.ms
     11357 ±  8%     +92.4%      21849 ± 30%  perf-sched.total_wait_and_delay.max.ms
      9.87 ±  6%    +124.0%      22.11 ± 30%  perf-sched.total_wait_time.average.ms
      6008 ±  8%     +85.9%      11172 ± 30%  perf-sched.total_wait_time.max.ms
     10.95 ±  6%    +139.4%      26.21 ± 29%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   2783337 ± 17%     -18.2%    2277663        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     11357 ±  8%     +92.4%      21849 ± 30%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      9.87 ±  6%    +124.0%      22.11 ± 30%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      6008 ±  8%     +85.9%      11172 ± 30%  perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     18.97            -2.4       16.55        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigqueue
      3.16            -2.3        0.88 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.19            -2.3        0.91 ±  2%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigqueue
     60.66            -1.2       59.44        perf-profile.calltrace.cycles-pp.sigqueue
      2.38 ±  2%      -1.1        1.24 ±  3%  perf-profile.calltrace.cycles-pp.pick_task_fair.pick_next_task_fair.__pick_next_task.__schedule.schedule
      2.57 ±  6%      -0.7        1.84 ± 13%  perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      2.54 ±  6%      -0.7        1.81 ± 13%  perf-profile.calltrace.cycles-pp.switch_fpu_return.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      2.27 ±  6%      -0.6        1.63 ± 12%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.55 ±  5%      -0.3        2.22 ±  7%  perf-profile.calltrace.cycles-pp.stress_sighandler_nop
      1.69 ±  8%      -0.3        1.39 ±  6%  perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.59 ±  5%      -0.3        1.32 ±  8%  perf-profile.calltrace.cycles-pp._copy_from_user.__x64_sys_rt_sigqueueinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigqueue
      1.55 ±  9%      -0.3        1.29 ±  6%  perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      1.45            -0.2        1.30 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.44 ±  2%      -0.1        1.29 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.72 ±  3%      -0.1        0.62        perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.schedule_hrtimeout_range_clock.do_sigtimedwait
      0.89 ±  2%      -0.1        0.81 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigtimedwait.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.89 ±  2%      -0.1        0.81 ±  2%  perf-profile.calltrace.cycles-pp.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.96 ±  2%      +0.1        1.02        perf-profile.calltrace.cycles-pp.recalc_sigpending.dequeue_signal.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
      1.35 ±  2%      +0.2        1.53 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
      0.76 ±  4%      +0.2        0.97 ±  5%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.__send_signal_locked.do_send_sig_info.kill_pid_info_type.__x64_sys_rt_sigqueueinfo
      8.08 ±  3%      +0.5        8.57        perf-profile.calltrace.cycles-pp.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.56 ±  3%      +0.6        8.19        perf-profile.calltrace.cycles-pp.schedule.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
      7.43 ±  2%      +0.7        8.08        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait
      1.80 ±  3%      +0.9        2.67 ±  4%  perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.schedule_hrtimeout_range_clock.do_sigtimedwait
      1.74 ±  2%      +0.9        2.61 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
      1.78 ±  3%      +0.9        2.65 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.schedule_hrtimeout_range_clock
     38.76            +1.7       40.48        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigqueueinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigqueue
     36.55            +2.0       38.59        perf-profile.calltrace.cycles-pp.kill_pid_info_type.__x64_sys_rt_sigqueueinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigqueue
     36.10            +2.1       38.16        perf-profile.calltrace.cycles-pp.do_send_sig_info.kill_pid_info_type.__x64_sys_rt_sigqueueinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.74            +2.2       36.92        perf-profile.calltrace.cycles-pp.__send_signal_locked.do_send_sig_info.kill_pid_info_type.__x64_sys_rt_sigqueueinfo.do_syscall_64
     31.74 ±  2%      +2.3       34.05        perf-profile.calltrace.cycles-pp.stress_run
     28.05            +2.4       30.41 ±  2%  perf-profile.calltrace.cycles-pp.sig_get_ucounts.__send_signal_locked.do_send_sig_info.kill_pid_info_type.__x64_sys_rt_sigqueueinfo
     28.02            +2.4       30.38 ±  2%  perf-profile.calltrace.cycles-pp.inc_rlimit_get_ucounts.sig_get_ucounts.__send_signal_locked.do_send_sig_info.kill_pid_info_type
     12.70            +2.4       15.14        perf-profile.calltrace.cycles-pp.__sigqueue_free.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     12.69            +2.4       15.13        perf-profile.calltrace.cycles-pp.dec_rlimit_put_ucounts.__sigqueue_free.dequeue_signal.get_signal.arch_do_signal_or_restart
     28.11            +2.7       30.80        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
     28.12            +2.7       30.81        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_run
     13.90            +2.8       16.68        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.69            +2.8       16.48        perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      0.00            +2.8        2.82 ±  4%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
      0.00            +2.9        2.86 ±  4%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_run
     10.76 ±  2%      -1.7        9.04        perf-profile.children.cycles-pp.__schedule
     10.80 ±  2%      -1.7        9.12        perf-profile.children.cycles-pp.schedule
      4.52 ±  2%      -1.4        3.12 ±  4%  perf-profile.children.cycles-pp.__pick_next_task
      4.42 ±  2%      -1.4        3.02 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
     60.92            -1.3       59.66        perf-profile.children.cycles-pp.sigqueue
      2.87 ±  4%      -0.9        1.92 ± 12%  perf-profile.children.cycles-pp.switch_fpu_return
      2.40 ±  2%      -0.9        1.47 ±  3%  perf-profile.children.cycles-pp.pick_task_fair
      3.11 ±  4%      -0.9        2.18 ± 11%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      2.38 ±  5%      -0.6        1.76 ± 12%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      1.12 ±  7%      -0.5        0.62 ±  3%  perf-profile.children.cycles-pp.__switch_to
      1.18 ±  3%      -0.5        0.73 ±  6%  perf-profile.children.cycles-pp.__dequeue_entity
      1.17 ±  2%      -0.4        0.81        perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.74 ±  4%      -0.3        0.41 ±  3%  perf-profile.children.cycles-pp.prepare_task_switch
      1.44 ±  2%      -0.3        1.15 ±  2%  perf-profile.children.cycles-pp.update_curr
      0.36 ± 37%      -0.3        0.10 ± 57%  perf-profile.children.cycles-pp.common_startup_64
      0.36 ± 37%      -0.3        0.10 ± 57%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.36 ± 37%      -0.3        0.10 ± 57%  perf-profile.children.cycles-pp.do_idle
      1.86 ±  6%      -0.2        1.61 ±  8%  perf-profile.children.cycles-pp._copy_from_user
      0.34 ± 37%      -0.2        0.10 ± 57%  perf-profile.children.cycles-pp.start_secondary
      0.26 ± 37%      -0.2        0.06 ± 75%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.51 ±  3%      -0.2        0.31 ±  3%  perf-profile.children.cycles-pp.__pick_eevdf
      0.85 ±  3%      -0.2        0.66 ±  5%  perf-profile.children.cycles-pp.set_next_entity
      0.23 ± 35%      -0.2        0.06 ± 74%  perf-profile.children.cycles-pp.cpuidle_enter
      0.23 ± 35%      -0.2        0.06 ± 74%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.69 ±  6%      -0.1        0.54 ±  4%  perf-profile.children.cycles-pp.update_se
      0.49 ±  4%      -0.1        0.35 ±  3%  perf-profile.children.cycles-pp.__enqueue_entity
      2.17 ±  2%      -0.1        2.05        perf-profile.children.cycles-pp.dequeue_entity
      0.38 ± 11%      -0.1        0.27 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.40 ± 17%      -0.1        0.30 ± 16%  perf-profile.children.cycles-pp.__switch_to_asm
      0.38 ± 11%      -0.1        0.29 ±  8%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.29            -0.1        0.20        perf-profile.children.cycles-pp.wakeup_preempt
      0.29 ±  5%      -0.1        0.20 ±  5%  perf-profile.children.cycles-pp.___perf_sw_event
      0.24            -0.1        0.16 ±  2%  perf-profile.children.cycles-pp.os_xsave
      0.15 ±  3%      -0.1        0.08 ± 19%  perf-profile.children.cycles-pp.finish_task_switch
      0.15 ±  3%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.30 ±  4%      -0.1        0.22 ±  4%  perf-profile.children.cycles-pp.__calc_delta
      0.40 ±  7%      -0.1        0.33 ±  7%  perf-profile.children.cycles-pp.prepare_signal
      0.22 ±  2%      -0.1        0.16 ±  2%  perf-profile.children.cycles-pp.check_preempt_wakeup_fair
      0.17 ± 11%      -0.1        0.12 ±  8%  perf-profile.children.cycles-pp.send_signal_locked
      0.44 ±  2%      -0.0        0.40 ±  6%  perf-profile.children.cycles-pp.handle_internal_command
      0.44 ±  2%      -0.0        0.40 ±  6%  perf-profile.children.cycles-pp.main
      0.44 ±  2%      -0.0        0.40 ±  6%  perf-profile.children.cycles-pp.run_builtin
      0.13 ± 28%      -0.0        0.08 ± 21%  perf-profile.children.cycles-pp.__libc_current_sigrtmax
      0.08 ± 21%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.task_active_pid_ns
      0.15 ± 15%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      0.20 ±  5%      -0.0        0.16 ±  8%  perf-profile.children.cycles-pp.__task_pid_nr_ns
      0.08 ±  4%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.css_rstat_updated
      0.12 ±  5%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.14 ±  2%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.choose_new_asid
      0.10            -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.11 ±  3%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.update_rq_clock
      0.06 ±  7%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.strnlen
      0.09 ±  5%      -0.0        0.07        perf-profile.children.cycles-pp.__set_next_task_fair
      0.09 ±  4%      -0.0        0.07 ±  7%  perf-profile.children.cycles-pp.from_kuid_munged
      0.11 ±  6%      -0.0        0.09        perf-profile.children.cycles-pp.vruntime_eligible
      0.08            -0.0        0.06        perf-profile.children.cycles-pp.native_sched_clock
      0.09            -0.0        0.07        perf-profile.children.cycles-pp.sched_clock
      0.09 ±  6%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.update_curr_dl_se
      0.08 ±  6%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.map_id_range_up
      0.05 ±  8%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.signal_setup_done
      0.28 ±  5%      +0.1        0.34 ±  6%  perf-profile.children.cycles-pp.__account_obj_stock
      0.22            +0.1        0.28        perf-profile.children.cycles-pp.avg_vruntime
      0.44 ±  5%      +0.1        0.50 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.13 ± 10%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.pick_next_task
      0.31 ±  4%      +0.1        0.39 ±  5%  perf-profile.children.cycles-pp.obj_cgroup_charge_account
      0.44 ±  4%      +0.1        0.54 ±  4%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.set_next_buddy
      0.57 ±  9%      +0.1        0.67 ±  4%  perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      1.68            +0.1        1.78        perf-profile.children.cycles-pp.recalc_sigpending
      0.50 ±  3%      +0.1        0.61 ±  3%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.14 ±  2%      +0.1        0.25 ±  3%  perf-profile.children.cycles-pp.__rb_insert_augmented
      0.13 ±  5%      +0.1        0.26 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.12 ±  4%      +0.1        0.26 ±  3%  perf-profile.children.cycles-pp.update_entity_lag
      0.48 ±  6%      +0.1        0.61 ± 18%  perf-profile.children.cycles-pp.generic_perform_write
      0.48 ±  6%      +0.1        0.62 ± 18%  perf-profile.children.cycles-pp.ksys_write
      0.07 ± 47%      +0.2        0.22 ±  7%  perf-profile.children.cycles-pp.__slab_free
      0.77 ±  4%      +0.2        0.98 ±  5%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.76 ±  4%      +0.3        1.05 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      0.26            +0.3        0.56 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     19.71            +0.4       20.06        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      3.02 ±  2%      +0.4        3.40 ±  3%  perf-profile.children.cycles-pp.dequeue_entities
      0.48 ± 16%      +0.4        0.92 ± 31%  perf-profile.children.cycles-pp.update_cfs_group
      8.08 ±  3%      +0.5        8.57        perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      1.81 ±  3%      +0.9        2.68 ±  4%  perf-profile.children.cycles-pp.try_to_block_task
      1.78 ±  3%      +0.9        2.66 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
     91.02            +1.5       92.57        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     90.33            +1.7       92.02        perf-profile.children.cycles-pp.do_syscall_64
     38.76            +1.7       40.49        perf-profile.children.cycles-pp.__x64_sys_rt_sigqueueinfo
     36.56            +2.0       38.60        perf-profile.children.cycles-pp.kill_pid_info_type
     36.10            +2.1       38.16        perf-profile.children.cycles-pp.do_send_sig_info
     34.75            +2.2       36.93        perf-profile.children.cycles-pp.__send_signal_locked
     31.74 ±  2%      +2.3       34.05        perf-profile.children.cycles-pp.stress_run
     28.02            +2.4       30.38 ±  2%  perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
     28.06            +2.4       30.41 ±  2%  perf-profile.children.cycles-pp.sig_get_ucounts
     26.67            +2.7       29.36        perf-profile.children.cycles-pp.__sigqueue_free
     26.66            +2.7       29.35        perf-profile.children.cycles-pp.dec_rlimit_put_ucounts
     13.94            +2.8       16.70        perf-profile.children.cycles-pp.get_signal
     16.23            +2.8       19.00        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     29.21            +3.1       32.26        perf-profile.children.cycles-pp.dequeue_signal
      2.38 ±  5%      -0.6        1.76 ± 12%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      1.09 ±  7%      -0.5        0.60 ±  3%  perf-profile.self.cycles-pp.__switch_to
      1.00 ±  3%      -0.4        0.64 ±  6%  perf-profile.self.cycles-pp.__dequeue_entity
      1.02 ±  2%      -0.3        0.70        perf-profile.self.cycles-pp.switch_mm_irqs_off
      1.42 ±  8%      -0.3        1.16 ±  6%  perf-profile.self.cycles-pp.__schedule
      0.46 ±  5%      -0.2        0.21 ±  3%  perf-profile.self.cycles-pp.prepare_task_switch
      1.84 ±  7%      -0.2        1.60 ±  8%  perf-profile.self.cycles-pp._copy_from_user
      0.49 ±  5%      -0.2        0.24 ± 15%  perf-profile.self.cycles-pp.switch_fpu_return
      0.41 ±  5%      -0.2        0.21 ±  8%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.45 ±  3%      -0.2        0.25 ±  4%  perf-profile.self.cycles-pp.__pick_eevdf
      0.43 ±  5%      -0.1        0.29 ±  4%  perf-profile.self.cycles-pp.__enqueue_entity
      0.60 ± 17%      -0.1        0.46 ±  5%  perf-profile.self.cycles-pp.sigqueue
      0.18 ±  3%      -0.1        0.07        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.33 ± 10%      -0.1        0.22 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock
      0.40 ± 17%      -0.1        0.30 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
      0.37 ± 10%      -0.1        0.28 ±  8%  perf-profile.self.cycles-pp.update_curr
      0.24            -0.1        0.16 ±  2%  perf-profile.self.cycles-pp.os_xsave
      0.17 ±  2%      -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.check_preempt_wakeup_fair
      0.29 ±  4%      -0.1        0.21 ±  4%  perf-profile.self.cycles-pp.__calc_delta
      0.15 ±  2%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.40 ±  8%      -0.1        0.32 ±  7%  perf-profile.self.cycles-pp.prepare_signal
      0.20 ± 16%      -0.1        0.14 ± 11%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.31 ±  4%      -0.1        0.26 ±  8%  perf-profile.self.cycles-pp.update_load_avg
      0.30 ±  2%      -0.1        0.24 ±  5%  perf-profile.self.cycles-pp.pick_task_fair
      0.08 ± 23%      -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.task_active_pid_ns
      0.12 ±  4%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.set_next_entity
      0.08 ±  7%      -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.css_rstat_updated
      0.20 ±  4%      -0.0        0.16 ±  9%  perf-profile.self.cycles-pp.__task_pid_nr_ns
      0.06            -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.strnlen
      0.14 ±  3%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.choose_new_asid
      0.15 ±  9%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.___perf_sw_event
      0.20 ±  3%      -0.0        0.17 ±  7%  perf-profile.self.cycles-pp.update_se
      0.09 ±  5%      -0.0        0.07 ±  7%  perf-profile.self.cycles-pp.__set_next_task_fair
      0.09 ±  7%      -0.0        0.07 ±  8%  perf-profile.self.cycles-pp.__x64_sys_rt_sigtimedwait
      0.09 ±  4%      -0.0        0.07        perf-profile.self.cycles-pp.vruntime_eligible
      0.07 ±  5%      -0.0        0.05        perf-profile.self.cycles-pp.ttwu_do_activate
      0.12 ±  4%      -0.0        0.10 ±  8%  perf-profile.self.cycles-pp.dequeue_signal
      0.08 ±  4%      -0.0        0.06        perf-profile.self.cycles-pp.native_sched_clock
      0.06            -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.send_signal_locked
      0.07 ±  5%      -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.map_id_range_up
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.try_to_wake_up
      0.13 ±  3%      +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.18            +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.__restore_fpregs_from_user
      0.06            +0.0        0.08 ±  9%  perf-profile.self.cycles-pp.get_signal
      0.11 ±  4%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.do_perf_trace_sched_stat_runtime
      0.09 ±  4%      +0.0        0.11 ±  5%  perf-profile.self.cycles-pp.place_entity
      0.08 ±  5%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.obj_cgroup_charge_account
      0.18 ±  5%      +0.0        0.22 ±  4%  perf-profile.self.cycles-pp.kmem_cache_free
      0.17 ±  6%      +0.0        0.21 ± 10%  perf-profile.self.cycles-pp.reweight_entity
      0.28 ±  4%      +0.0        0.33 ±  5%  perf-profile.self.cycles-pp.__account_obj_stock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.kill_pid_info_type
      0.20            +0.1        0.26        perf-profile.self.cycles-pp.avg_vruntime
      0.06 ±  6%      +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.update_entity_lag
      0.41 ±  5%      +0.1        0.48 ±  2%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.32 ±  5%      +0.1        0.41 ±  7%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.32 ±  3%      +0.1        0.42 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.08 ±  8%      +0.1        0.18 ±  8%  perf-profile.self.cycles-pp.pick_next_task
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.set_next_buddy
      1.67            +0.1        1.77        perf-profile.self.cycles-pp.recalc_sigpending
      0.13 ±  3%      +0.1        0.25 ±  4%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.05            +0.1        0.18 ±  9%  perf-profile.self.cycles-pp.put_prev_entity
      0.10 ±  3%      +0.1        0.25 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.07 ± 47%      +0.2        0.22 ±  7%  perf-profile.self.cycles-pp.__slab_free
      0.25            +0.2        0.46 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.48 ± 16%      +0.4        0.92 ± 32%  perf-profile.self.cycles-pp.update_cfs_group
     28.02            +2.4       30.37 ±  2%  perf-profile.self.cycles-pp.inc_rlimit_get_ucounts
     26.66            +2.7       29.35        perf-profile.self.cycles-pp.dec_rlimit_put_ucounts




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

