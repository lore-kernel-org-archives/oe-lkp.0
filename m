Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775F134AC
	for <oe-lkp@lists.linux.dev>; Sun,  8 Sep 2024 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725805599; cv=fail; b=cAkeUo2N9cVWsCgAMkTuhkNjatNigZ53dvrE4t/PcPLt3UriuB2iDPBva68S1mG3iGHQRAHWHGsEM/peBohBLBH25f3vb1+rfZOBhPTc6i4j1qq1zmduC41JCdMwbYShBPG63kEdps49jgU7llrxxTsfJ9M0VN+e/z2BYwNWWL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725805599; c=relaxed/simple;
	bh=wNu9CGbWZxyxkIwqyafuERkn5HN30t5r2S+rp9NZpOE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kz1/CO8f3WIwqyzY0nDZdM0ZtWon9CFD2/8FMjMvsUzhyP0Gq058y3EQ0dpDhYorkx0AM57WoE8leTjRjhNMBOJO9lJMhwar9EIromaed+2EyCl7MREihd1OyquRRECzTHelnXdw6+vclWPcg9YNhKZvyNg95tEC08C18NgoUAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESfm2AUz; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESfm2AUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725805596; x=1757341596;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=wNu9CGbWZxyxkIwqyafuERkn5HN30t5r2S+rp9NZpOE=;
  b=ESfm2AUz2+dL9R9QmyGxopxOj1iZr8/IuRguAgo5xSMcU9ixe3J99WAw
   wwH64OfYmeU/UVNV+dr1uOuTNwprncTzAWoynP2vpkArF2tD8iwHF+Nb4
   8U/g8vpOEST8LJF/KoC2H/EY9so6sREVbvG7WfsOS9qlGK6J/Qzs0Innr
   C9GH9jXFl/xAw/UzewFQzZhWuKLtAvAYN2TA/O+5EHTD/SQrjFfM9b7eU
   SLAAOOJA2pQGqUkSywLcwROPdD7A0g+Ywp68g8DB+e5s6yzf6VOm9Ijzh
   3dE794j4IE6D6W9+0l/IF7FWm1+11x1D9OsVXBwPCP0beWH51KrXsoDbM
   w==;
X-CSE-ConnectionGUID: KKdYK8GuQn2n84Zb+ZW0eg==
X-CSE-MsgGUID: J29HY3D2Tja728sFYIxePw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="41979558"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="41979558"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 07:26:35 -0700
X-CSE-ConnectionGUID: /QH2A5zvTFmEVvOEPsUvVA==
X-CSE-MsgGUID: x/qpMvGeRgOd2Oh42evMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="71375938"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Sep 2024 07:26:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 07:26:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 8 Sep 2024 07:26:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 8 Sep 2024 07:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fauCHt7y/6VWwyQoUsawvmFdsH+WSsjbHR3XueQQeAgIstVTERzTYfOEXHMB+4T9pb/0W8GgcypmNr2rTdal+3aXhqgVCXuswhiGimg8cZxfNLyiY9B/llfGsx8rZplKfT63UCSWqG/gjoe6sbkSc6+lYgm8CBrB30ZpqdHzj5LmxAHbygBy7qKj5fru9Ocwc5k1aY4jTjF3A2RScCgzjLvqla7sfLGCN62W3cPzy6Be9dOVZK7XNPlvkyuS1UaQKu2cOwDO6ubAipxpgY/x9rZiYRBohlKx7auENG+duepWZkYzQMlj1miagdgg+VYi0jJvTAKfYqgXXoHmjOt1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV/cXK/zKOi4FZaZqggS0DbrU5r5tCVCqchhP7DpH2k=;
 b=DN9wyZMjwcr7egMscNo4sN/YM2MZdCQpmeQZTgL/1NV49NS6opmEdl2U/3gu3bkltpOlK3nLfk/Bn9UTEiLaE/uKbsYC9ryaFTdJr5mb+48XjVwSs/c7y0c5qPfAET3mQTfvCKNQNBdQgwygYbTirou2lj5WzNFQL5C/qbi/jnPx74ZLr6Ki6PO+9EQuJ8uCzjnd3CemTH3u3doet+CSBoS2rHOU9x2wfRpSFrbbnAQaPtvym9adfOVvPlL5DVASHhuee6PiG/ndZ2Q5X04Mpi7texjoZ43tc9YOQ32dcaV1r7M7GzC7YsvvqaaRjuB99wOUJmY3meElO6fjMHviDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.21; Sun, 8 Sep
 2024 14:26:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.020; Sun, 8 Sep 2024
 14:26:29 +0000
Date: Sun, 8 Sep 2024 22:26:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yu Zhao <yuzhao@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "kernel test
 robot" <oliver.sang@intel.com>, Janosch Frank <frankja@linux.ibm.com>, "Marc
 Hartmayer" <mhartmay@linux.ibm.com>, Muchun Song <muchun.song@linux.dev>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>
Subject: [linux-next:master] [mm/hugetlb_vmemmap]  c2a967f6ab:
 vm-scalability.throughput 128.6% improvement
Message-ID: <202409082259.783d11c3-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: cdca7544-348d-4253-723f-08dcd0123ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vyuRLiRLPZk/4KQSmAuigpWFvP7wMdHMZcuwEahsRyyy59G+Yhwv6MMR6L?=
 =?iso-8859-1?Q?3BYiOxQuXKqgJv6HDAx2ekI8/ESB0b7StXh4E7p5qbHv+ZA1neHdwhfQPs?=
 =?iso-8859-1?Q?h3KCbXbMTLua6dLGnL7EZOGnXnzRtBuiohlk48W+G7b+nXwmFdsuwVXjEi?=
 =?iso-8859-1?Q?cHimQ8kU3LMRiPERv1iTQMEKEhPHHz9gHSLfRU/hFxbuGnx6AwzjvBgxrz?=
 =?iso-8859-1?Q?LlFr8xnHMwqks0gVysjcXBCzbpCZlkKmfdzaUVvvWE24y+Smdps0MTPU5g?=
 =?iso-8859-1?Q?B1/QtmIrGbEMcfW/AbA2qLVi/uz2bcEmXzcHQXesjq9vwqeYc0BNP5lHfS?=
 =?iso-8859-1?Q?25jMrj9GfzyC83Wrzum4ufxrAn3sbAg/g/c2WdWhDUMuvvOj6Ca5ex8kqf?=
 =?iso-8859-1?Q?zr21w9DBDt3CSrQwY0a5RbHPpL47J+D+S/+z4lTeWCzfEMObFTCw++BZ06?=
 =?iso-8859-1?Q?E/BVCrrtmhwcSTOZ1e9RNrHxAOioaf4poNhrFogXMBEhBks/k3I1LGXjc+?=
 =?iso-8859-1?Q?unKBjRgvuIQLF/0PeZ/t+BcyNVgfoIx7u+mR7Z8+RCbHvLWY3GTHuHgvUy?=
 =?iso-8859-1?Q?dorY6xR7mZTSzDCLrj2qQ5oof9zZLk0SMs3DbeZj7w7IkUJywG2Gp1M84G?=
 =?iso-8859-1?Q?z9kTdZJoyLStZRo4XDToUGUJ9/xIPD3XdmUXXt6pfPWRVTO59yc2VWcdsM?=
 =?iso-8859-1?Q?bEcSdVY0I7dTVHg5rK2wDUBS+1nLkmUW54J0xCp34+1BdhmHuZQaxLs5ay?=
 =?iso-8859-1?Q?P31OMO1E0wTAWTdq6gO8mSd+pO2K0lrhCkTCv2EgJG9pBqRKD7d0DUsxK6?=
 =?iso-8859-1?Q?6Z79ZCh0zFVHW+FOAs0oECtMZs6+rqJGzllyuFzFacubW/t6g2yo0ZkZmX?=
 =?iso-8859-1?Q?ZW9lWhT7Mz0kKrYNqpXpEKzTOL5S+kz9G8Nb9+PCqb6YGImICvqQYKzldS?=
 =?iso-8859-1?Q?D40fsKs5xXzNPcAvtRwxgqQP82HDHZNxLOCxm2D04g7r0tnXJZ1JdNpLz+?=
 =?iso-8859-1?Q?eShzHY4ucPHzQO9ENb4CjxFCgHIEshbad5XpGWcNnqSQJSESqxWAJDYO6l?=
 =?iso-8859-1?Q?MtuIXsM0zYnAChtm6noYc1Wb+y+IVyD4BiWEepVbk8k5u418k8vqh0/kPc?=
 =?iso-8859-1?Q?k8vZWKrCJHGUlGalZzV6RZyAbEPnYGtKNofuwk7nzGQCPbJBpbsOZSO/QM?=
 =?iso-8859-1?Q?1+6MrG9VA+r/xYRARZ1APWAE35J7k/sMA3IJsl2MHfbCxW3oBCQWhd9e+n?=
 =?iso-8859-1?Q?tQwpvvAOfXY0l0BDYmEJBI2tXJdm/ZmRcwHBW3qVQm4LBnL3p1lAsIy8Ak?=
 =?iso-8859-1?Q?lkdbf5KF506PD/0IHqR0ORwuS5OXmgzinA3OlZqqkg21ZRf4NOPGuYKx9Q?=
 =?iso-8859-1?Q?6amrWSIpZyqJf/jsCJ0gP7aXxztKWiJvuLQzlNiQ73IHfsIjQE81c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Mk3JxkjZfzVr++qpcHaX02LcuOye92++kttAMMj6A4nKye0f+cRo93JhCi?=
 =?iso-8859-1?Q?wKfGELvn76szN34J6LfTUuG292aEEo3A88xBum5HdGM9qHsVjV4IhkdgLy?=
 =?iso-8859-1?Q?PlHilp/re62KkXgFOTBHRyVHxe5iX2uFYzzaXDy4StogP1SEmIOud1L45g?=
 =?iso-8859-1?Q?EVW7EiW4jKqLPqmL9w76RyZgekfevc0Y51us4X3NOpjVwAgUNA0EDWK3Fz?=
 =?iso-8859-1?Q?fC+ml4qrK8QcMhw6rYoVB5+fSUBxI/u7iIYgkKHYho8lxzDCmYyWaUxSQb?=
 =?iso-8859-1?Q?7O/+IBah3z52oaKDWZbTXibqINx+nbQGSiMXhQtZGv4nUA+Ntb1Tjlsm/a?=
 =?iso-8859-1?Q?RJG5Vo1ihD2MAOogGF/j3HIItxs6evYyItAdYawAbzVke1XjexFrjCjZbt?=
 =?iso-8859-1?Q?esDMMlBSVmaFwZmEokpoGFgLRiel3DNMpOijBw+PjIVPiVSKYbI59/ZmAO?=
 =?iso-8859-1?Q?Dlnb9Hzl5UHD3cWGMIK45z6GHJjUGmNGxcIfF1ch+VStQlJSvnovKBdnqz?=
 =?iso-8859-1?Q?K7wTFKqGHQUe2CT6qTLxofQCQAaeWSnxPYW5zdo4M+/uUE2VQU+86qjjwH?=
 =?iso-8859-1?Q?49dviy3bKZ7y5N6jGJbxr5KoxL6zV/fM3cQOe0c2MDdskT7qr/1j2qr9rh?=
 =?iso-8859-1?Q?qdWAVecpHQSSeNZkJc+tNstDU1SRYDFkyycyBNrfQ+YBJpsyZS0CBH1LnB?=
 =?iso-8859-1?Q?NtUQJJ9cg/UFxc39vttC35JOiASuKT0iwSG2Fyw0SJ9P10NItdyW30gfdp?=
 =?iso-8859-1?Q?aVkvnkPibvZCSrKTs9/bYlbN6ym0E4V/9EfIZr0s9Lg2AzdV1KXLTaoXbR?=
 =?iso-8859-1?Q?wRhITH5InOOYllAbK2GjWhFLIbR+sMRnYFEJLE4BUaAAv30ySQZhfCSXg4?=
 =?iso-8859-1?Q?MSyq8U7yIrD3tsYQ0Sn0QGkepQRchei0NhTcZXmPa/Ium+UE74U/eed6IM?=
 =?iso-8859-1?Q?o2Ygbk9Y1m1eUrJe/PKlyKoGVLOHDkbD7bBO1jjAdY0/MuAQOxvOabsiAf?=
 =?iso-8859-1?Q?gV7D9/+RMrQOZ2uxsxTdkogoo+Pu22CxUE9hbIhnXLoVGQJJLXoAH/ZgaQ?=
 =?iso-8859-1?Q?lCQybCqYbPzS4mpZRqEwrlV9QjPRYVjaOkTPzKjkX1Nl8JJjICvwclIib3?=
 =?iso-8859-1?Q?b32vcG41jeWjhd7nOR3cnyPxUSRVnuB2L9FMbPRNUmwRWAkqeJ9nLN/zwO?=
 =?iso-8859-1?Q?8NHXj+PtB8aw1D7h5i4VlFyc8UWmJP0h8zPZaQ/9sSMMOBc3hlomwURCia?=
 =?iso-8859-1?Q?ZMeLSA65pKQDrKUyRypWIt2P4AW0IArlNPHQORi6spgQE4jm9aEbE/M+sa?=
 =?iso-8859-1?Q?7/iBoWO9Xt4cAm/ZyZs6J23daRbQh9Mod9lrQa6RZgk6mVezZroGRkZyWN?=
 =?iso-8859-1?Q?LXFyMvPWVNGorRidC5fisiPSfHGXfKkZ4u6Bs/cHv9Zq+bHFk+JR2K/gvH?=
 =?iso-8859-1?Q?pNHofZk7PGu9xALXIftFAzu+AQmebiXSQyBRWx9LlJb8MhWFE4qrSy+44p?=
 =?iso-8859-1?Q?WOrZbIB3RtjvwERuERS3rUZcAOnxCgEJ7JoxOJ+s8w8Kdl5ulVQNJWVyJm?=
 =?iso-8859-1?Q?wGqo4EhdUoy58RAOdeHX7q1Lgggy9UxOMY6I+XYVk8KPgqvamwNcrOLV5e?=
 =?iso-8859-1?Q?hrZBby2Vm04MWM7S1hUkeEluZbd4bFhuoBAZ6JEi6dfl9yIE7rk238yQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdca7544-348d-4253-723f-08dcd0123ad8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 14:26:29.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3qllC49DGfTQ6MDnLlaadQpft0wVEEB6BfXf44FfUJiyVS/Y5MEjcJ+m1PhPjU0XdyPrEsQeVwfCpeiywFylg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 128.6% improvement of vm-scalability.throughput on:


commit: c2a967f6ab0ec896648c0497d3dc15d8f136b148 ("mm/hugetlb_vmemmap: don't synchronize_rcu() without HVO")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: vm-scalability
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	runtime: 300s
	size: 8T
	test: anon-w-seq-hugetlb
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240908/202409082259.783d11c3-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-12-x86_64-20240206.cgz/300s/8T/lkp-icl-2sp2/anon-w-seq-hugetlb/vm-scalability

commit: 
  9eace7e8e6 ("shmem_quota: build the object file conditionally to the config option")
  c2a967f6ab ("mm/hugetlb_vmemmap: don't synchronize_rcu() without HVO")

9eace7e8e60c3ac8 c2a967f6ab0ec896648c0497d3d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     31940           -74.5%       8147 ±  2%  uptime.idle
 2.578e+10           -91.7%  2.135e+09 ±  9%  cpuidle..time
  16240610 ±  2%     -91.1%    1448729 ±  3%  cpuidle..usage
   1059015 ± 23%    +143.4%    2577289 ± 20%  numa-numastat.node0.local_node
     23613 ± 31%    +375.6%     112309 ± 24%  numa-numastat.node0.numa_foreign
   1844937 ±  3%     +98.8%    3667008 ±  2%  numa-numastat.node0.numa_hit
    560064 ± 11%     +33.0%     744848 ±  9%  numa-numastat.node1.local_node
     23613 ± 31%    +375.9%     112379 ± 24%  numa-numastat.node1.numa_miss
     65.77           -91.1%       5.85 ±  8%  vmstat.cpu.id
     16.20 ±  2%    +176.7%      44.82        vmstat.cpu.us
     45.10 ±  2%    +178.5%     125.61        vmstat.procs.r
     11694           -59.8%       4695 ±  3%  vmstat.system.cs
    107920 ±  3%     +41.4%     152607        vmstat.system.in
     65.42           -60.1        5.30 ± 10%  mpstat.cpu.all.idle%
      0.35 ±  2%      +0.4        0.78 ±  3%  mpstat.cpu.all.irq%
      0.07            +0.0        0.08 ±  4%  mpstat.cpu.all.soft%
     17.82 ±  2%     +30.9       48.71        mpstat.cpu.all.sys%
     16.34 ±  2%     +28.8       45.13        mpstat.cpu.all.usr%
    145.50 ± 56%     -90.3%      14.17 ± 51%  mpstat.max_utilization.seconds
     82327 ±  2%    +134.2%     192839 ±  2%  vm-scalability.median
     10.16 ±  7%      -7.9        2.31 ± 46%  vm-scalability.median_stddev%
     11.28 ±  7%      -7.6        3.71 ± 72%  vm-scalability.stddev%
  10919990 ±  2%    +128.6%   24965297 ±  2%  vm-scalability.throughput
     48989 ±  6%    +789.8%     435923 ±  3%  vm-scalability.time.involuntary_context_switches
   1514783 ±  2%    +133.7%    3540338 ±  2%  vm-scalability.time.minor_page_faults
      4345 ±  2%    +174.6%      11931        vm-scalability.time.percent_of_cpu_this_job_got
      6920 ±  3%    +171.3%      18777        vm-scalability.time.system_time
      6381 ±  3%    +174.6%      17520        vm-scalability.time.user_time
   1364249 ±  2%     -97.9%      28851 ±  3%  vm-scalability.time.voluntary_context_switches
 3.115e+09 ±  2%    +134.1%  7.294e+09 ±  2%  vm-scalability.workload
  12586523           -86.1%    1749922 ± 17%  numa-vmstat.node0.nr_free_pages
    210.72 ± 52%     -95.6%       9.23 ± 98%  numa-vmstat.node0.nr_inactive_file
     40699 ±  5%     +12.2%      45671 ±  4%  numa-vmstat.node0.nr_slab_unreclaimable
    210.72 ± 52%     -95.6%       9.23 ± 98%  numa-vmstat.node0.nr_zone_inactive_file
     23613 ± 31%    +375.6%     112309 ± 24%  numa-vmstat.node0.numa_foreign
   1844407 ±  3%     +98.8%    3666145 ±  2%  numa-vmstat.node0.numa_hit
   1058484 ± 23%    +143.4%    2576426 ± 20%  numa-vmstat.node0.numa_local
     32680 ± 13%    +104.0%      66656 ± 16%  numa-vmstat.node1.nr_active_anon
      7227 ± 35%    +104.6%      14787 ± 18%  numa-vmstat.node1.nr_mapped
     28822 ±  6%     -12.1%      25343 ±  7%  numa-vmstat.node1.nr_slab_unreclaimable
     32680 ± 13%    +104.0%      66656 ± 16%  numa-vmstat.node1.nr_zone_active_anon
    558726 ± 11%     +33.1%     743806 ±  9%  numa-vmstat.node1.numa_local
     23613 ± 31%    +375.9%     112379 ± 24%  numa-vmstat.node1.numa_miss
     10828 ±  2%    +171.3%      29376 ±  4%  numa-meminfo.node0.HugePages_Free
     38486           +53.6%      59107 ±  2%  numa-meminfo.node0.HugePages_Surp
     38486           +53.6%      59107 ±  2%  numa-meminfo.node0.HugePages_Total
    843.20 ± 52%     -95.6%      37.05 ± 97%  numa-meminfo.node0.Inactive(file)
  50130416           -84.4%    7832175 ± 41%  numa-meminfo.node0.MemFree
  81554535           +51.9%  1.239e+08 ±  2%  numa-meminfo.node0.MemUsed
    162789 ±  5%     +12.2%     182674 ±  4%  numa-meminfo.node0.SUnreclaim
    204499 ±  9%     +15.7%     236612 ±  8%  numa-meminfo.node0.Slab
    130875 ± 13%    +103.8%     266757 ± 16%  numa-meminfo.node1.Active
    130833 ± 13%    +103.9%     266732 ± 16%  numa-meminfo.node1.Active(anon)
    346.50 ± 29%    +344.5%       1540 ± 33%  numa-meminfo.node1.HugePages_Surp
    346.50 ± 29%    +344.5%       1540 ± 33%  numa-meminfo.node1.HugePages_Total
     28293 ± 34%    +106.5%      58430 ± 18%  numa-meminfo.node1.Mapped
   4467756 ± 19%     +54.5%    6901715        numa-meminfo.node1.MemUsed
    115289 ±  6%     -12.1%     101363 ±  7%  numa-meminfo.node1.SUnreclaim
    141692 ± 15%    +113.9%     303149 ±  3%  meminfo.Active
    141525 ± 15%    +114.1%     302985 ±  3%  meminfo.Active(anon)
      1060           -94.9%      54.41 ± 82%  meminfo.Buffers
  92057649           -24.9%   69146326        meminfo.CommitLimit
   1068336 ±  2%     +18.2%    1262643        meminfo.Committed_AS
     10864 ±  2%    +171.5%      29498        meminfo.HugePages_Free
     10865 ±  2%    +171.5%      29499        meminfo.HugePages_Rsvd
     38880           +57.5%      61254        meminfo.HugePages_Surp
     38880           +57.5%      61255        meminfo.HugePages_Total
  79627804           +57.5%  1.255e+08        meminfo.Hugetlb
      1197           -89.8%     122.49 ± 66%  meminfo.Inactive(file)
     38220 ±  3%    +104.6%      78211 ± 11%  meminfo.Mapped
 1.765e+08           -26.0%  1.307e+08        meminfo.MemAvailable
 1.776e+08           -25.8%  1.318e+08        meminfo.MemFree
  86118884           +53.2%   1.32e+08        meminfo.Memused
    275702 ±  8%     +68.7%     465190        meminfo.Shmem
 3.609e+08 ± 12%     +70.6%  6.157e+08 ± 27%  proc-vmstat.compact_daemon_free_scanned
 3.609e+08 ± 12%     +70.6%  6.157e+08 ± 27%  proc-vmstat.compact_free_scanned
   1354752 ±  2%    +134.1%    3171840 ±  2%  proc-vmstat.htlb_buddy_alloc_success
     35383 ± 15%    +114.2%      75782 ±  3%  proc-vmstat.nr_active_anon
   4412727           -25.2%    3301489 ±  2%  proc-vmstat.nr_dirty_background_threshold
   8836244           -25.2%    6611050 ±  2%  proc-vmstat.nr_dirty_threshold
    843423            +5.6%     890521        proc-vmstat.nr_file_pages
  44475421           -25.0%   33346678 ±  2%  proc-vmstat.nr_free_pages
    196067            +4.1%     204088        proc-vmstat.nr_inactive_anon
    299.62           -89.8%      30.58 ± 66%  proc-vmstat.nr_inactive_file
      9813 ±  3%    +103.3%      19952 ± 11%  proc-vmstat.nr_mapped
      2689            +5.5%       2837        proc-vmstat.nr_page_table_pages
     68907 ±  8%     +68.8%     116343        proc-vmstat.nr_shmem
     69518            +2.1%      71010        proc-vmstat.nr_slab_unreclaimable
     35383 ± 15%    +114.2%      75782 ±  3%  proc-vmstat.nr_zone_active_anon
    196068            +4.1%     204089        proc-vmstat.nr_zone_inactive_anon
    299.62           -89.8%      30.58 ± 66%  proc-vmstat.nr_zone_inactive_file
     23613 ± 31%    +375.6%     112309 ± 24%  proc-vmstat.numa_foreign
     29590 ± 34%     +88.6%      55811 ± 13%  proc-vmstat.numa_hint_faults
      8999 ± 32%     +84.8%      16627 ±  5%  proc-vmstat.numa_hint_faults_local
   2469706           +79.8%    4440194        proc-vmstat.numa_hit
   1621730 ± 12%    +105.0%    3324181 ± 17%  proc-vmstat.numa_local
     23613 ± 31%    +375.9%     112379 ± 24%  proc-vmstat.numa_miss
     51238 ± 10%    +112.4%     108806 ±  4%  proc-vmstat.pgactivate
     47212 ± 13%    +150.5%     118274 ±  2%  proc-vmstat.pgalloc_dma
   7800626 ±  5%    +139.0%   18639703 ±  2%  proc-vmstat.pgalloc_dma32
 6.871e+08 ±  2%    +133.9%  1.607e+09 ±  2%  proc-vmstat.pgalloc_normal
   2426642           +84.7%    4481472        proc-vmstat.pgfault
 6.935e+08 ±  2%    +134.4%  1.625e+09 ±  2%  proc-vmstat.pgfree
     52701           +20.3%      63424        proc-vmstat.pgreuse
      2330 ± 13%    +123.8%       5216 ±  5%  proc-vmstat.unevictable_pgs_culled
      1.16 ± 51%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.common_startup_64
      1.16 ± 51%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.16 ± 51%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.do_idle
      1.14 ± 52%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.start_secondary
      1.14 ± 51%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.08 ± 51%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.cpuidle_enter
      1.08 ± 51%      -1.1        0.03 ±100%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.06 ± 51%      -1.0        0.02 ± 99%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.06 ± 51%      -1.0        0.02 ± 99%  perf-profile.children.cycles-pp.acpi_safe_halt
      2.65 ± 16%      -0.9        1.78 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.31 ± 12%      -0.3        0.97 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.03 ±  8%      -0.2        0.86 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.00 ±  8%      -0.2        0.84 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.23 ± 24%      -0.1        0.11 ±  8%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.22 ± 25%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.handle_softirqs
      0.79 ±  6%      -0.1        0.68 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.74 ±  6%      -0.1        0.65 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.67 ±  6%      -0.1        0.58 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.07 ± 12%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.08 ±  8%      +0.0        0.10        perf-profile.children.cycles-pp.task_mm_cid_work
      0.10 ± 13%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.04 ± 80%      +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.fast_imageblit
      0.04 ± 80%      +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.drm_fbdev_shmem_defio_imageblit
      0.04 ± 80%      +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.sys_imageblit
      0.07 ± 62%      +0.1        0.16 ± 19%  perf-profile.children.cycles-pp.con_scroll
      0.07 ± 62%      +0.1        0.16 ± 19%  perf-profile.children.cycles-pp.fbcon_scroll
      0.07 ± 62%      +0.1        0.16 ± 19%  perf-profile.children.cycles-pp.lf
      0.06 ± 79%      +0.1        0.16 ± 19%  perf-profile.children.cycles-pp.bit_putcs
      0.07 ± 62%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.vt_console_print
      0.06 ± 79%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.fbcon_putcs
      0.06 ± 79%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.fbcon_redraw
      0.06            -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.04 ± 80%      +0.1        0.12 ± 19%  perf-profile.self.cycles-pp.fast_imageblit
      0.67 ±  6%      +0.1        0.75 ±  2%  perf-profile.self.cycles-pp.folio_zero_user
      4.83           +48.9%       7.19        perf-stat.i.MPKI
 1.053e+10 ±  2%    +143.4%  2.563e+10 ±  2%  perf-stat.i.branch-instructions
      0.82 ±  2%      -0.8        0.05 ± 10%  perf-stat.i.branch-miss-rate%
   7434133 ±  2%     +13.9%    8468122        perf-stat.i.branch-misses
     50.36           +41.4       91.77        perf-stat.i.cache-miss-rate%
  2.15e+08          +171.8%  5.843e+08 ±  2%  perf-stat.i.cache-misses
 2.529e+08 ±  2%    +150.8%  6.343e+08 ±  2%  perf-stat.i.cache-references
     12140           -61.4%       4689 ±  3%  perf-stat.i.context-switches
      3.18           +24.8%       3.97 ±  2%  perf-stat.i.cpi
    128470            +1.4%     130236        perf-stat.i.cpu-clock
 1.128e+11 ±  2%    +184.1%  3.204e+11        perf-stat.i.cpu-cycles
    731.50 ±  5%     -64.5%     259.50 ±  4%  perf-stat.i.cpu-migrations
    915.11 ±  5%     -37.3%     574.09 ±  7%  perf-stat.i.cycles-between-cache-misses
  3.34e+10 ±  2%    +142.0%  8.084e+10 ±  2%  perf-stat.i.instructions
      0.41 ±  2%     -37.4%       0.26 ±  2%  perf-stat.i.ipc
      0.31 ± 34%     +82.3%       0.56 ± 22%  perf-stat.i.major-faults
      7499           +95.9%      14692 ±  2%  perf-stat.i.minor-faults
      7500           +95.9%      14692 ±  2%  perf-stat.i.page-faults
    128470            +1.4%     130236        perf-stat.i.task-clock
      6.45           +12.0%       7.23        perf-stat.overall.MPKI
      0.07 ±  3%      -0.0        0.03 ±  2%  perf-stat.overall.branch-miss-rate%
     85.15            +6.9       92.02        perf-stat.overall.cache-miss-rate%
      3.39 ±  2%     +16.7%       3.95 ±  2%  perf-stat.overall.cpi
      0.30 ±  2%     -14.3%       0.25 ±  2%  perf-stat.overall.ipc
 1.077e+10 ±  2%    +134.0%   2.52e+10 ±  2%  perf-stat.ps.branch-instructions
 2.204e+08          +160.6%  5.745e+08 ±  2%  perf-stat.ps.cache-misses
 2.589e+08          +141.1%  6.242e+08 ±  2%  perf-stat.ps.cache-references
     11680           -60.4%       4621 ±  2%  perf-stat.ps.context-switches
 1.157e+11 ±  2%    +171.5%  3.141e+11        perf-stat.ps.cpu-cycles
    706.28 ±  5%     -64.2%     252.70 ±  4%  perf-stat.ps.cpu-migrations
 3.416e+10 ±  2%    +132.7%  7.948e+10 ±  2%  perf-stat.ps.instructions
      0.36 ± 29%     +57.7%       0.56 ± 22%  perf-stat.ps.major-faults
      7637           +88.3%      14379 ±  2%  perf-stat.ps.minor-faults
      7637           +88.3%      14380 ±  2%  perf-stat.ps.page-faults
  1.05e+13 ±  2%    +131.7%  2.432e+13        perf-stat.total.instructions
   5752707 ±  8%    +241.6%   19652361        sched_debug.cfs_rq:/.avg_vruntime.avg
   6235901 ±  8%    +224.1%   20207800        sched_debug.cfs_rq:/.avg_vruntime.max
   4671237 ±  9%    +273.8%   17460516 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.min
    296257 ± 16%     +50.4%     445559 ± 19%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.47 ± 37%     +84.8%       0.87        sched_debug.cfs_rq:/.h_nr_running.avg
      1.42 ± 16%     +43.1%       2.03 ± 12%  sched_debug.cfs_rq:/.h_nr_running.max
      0.17 ± 57%    +266.7%       0.61 ± 25%  sched_debug.cfs_rq:/.h_nr_running.min
      7787 ±110%   +1165.4%      98542 ± 28%  sched_debug.cfs_rq:/.left_deadline.avg
    996783 ±110%    +914.7%   10114565 ± 18%  sched_debug.cfs_rq:/.left_deadline.max
     87759 ±110%   +1007.3%     971722 ± 20%  sched_debug.cfs_rq:/.left_deadline.stddev
      7787 ±110%   +1165.4%      98541 ± 28%  sched_debug.cfs_rq:/.left_vruntime.avg
    996755 ±110%    +914.7%   10114478 ± 18%  sched_debug.cfs_rq:/.left_vruntime.max
     87756 ±110%   +1007.3%     971713 ± 20%  sched_debug.cfs_rq:/.left_vruntime.stddev
      9220 ± 16%     +58.4%      14608 ±  8%  sched_debug.cfs_rq:/.load.avg
      1335 ± 57%    +261.0%       4820 ± 25%  sched_debug.cfs_rq:/.load.min
   5752707 ±  8%    +241.6%   19652362        sched_debug.cfs_rq:/.min_vruntime.avg
   6235901 ±  8%    +224.1%   20207800        sched_debug.cfs_rq:/.min_vruntime.max
   4671237 ±  9%    +273.8%   17460531 ±  2%  sched_debug.cfs_rq:/.min_vruntime.min
    296257 ± 16%     +50.4%     445558 ± 19%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.47 ± 37%     +77.1%       0.83 ±  4%  sched_debug.cfs_rq:/.nr_running.avg
      0.17 ± 57%    +266.7%       0.61 ± 25%  sched_debug.cfs_rq:/.nr_running.min
      7787 ±110%   +1165.4%      98541 ± 28%  sched_debug.cfs_rq:/.right_vruntime.avg
    996755 ±110%    +914.7%   10114489 ± 18%  sched_debug.cfs_rq:/.right_vruntime.max
     87756 ±110%   +1007.3%     971714 ± 20%  sched_debug.cfs_rq:/.right_vruntime.stddev
    496.10 ± 36%     +83.3%     909.20        sched_debug.cfs_rq:/.runnable_avg.avg
      1271 ± 11%     +58.2%       2010 ± 14%  sched_debug.cfs_rq:/.runnable_avg.max
    492.02 ± 36%     +75.7%     864.59 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
      1125 ± 11%     +35.7%       1527 ± 15%  sched_debug.cfs_rq:/.util_avg.max
    100.63 ± 47%    +449.9%     553.35 ±  8%  sched_debug.cfs_rq:/.util_est.avg
    814.39 ± 11%    +102.6%       1649 ± 10%  sched_debug.cfs_rq:/.util_est.max
      0.61 ±100%   +2045.5%      13.11 ± 41%  sched_debug.cfs_rq:/.util_est.min
    202.99 ± 33%     +76.9%     359.01 ±  9%  sched_debug.cfs_rq:/.util_est.stddev
   1304244 ±  8%     +17.7%    1535515 ±  9%  sched_debug.cpu.avg_idle.max
     99574 ± 12%     +30.7%     130140 ± 10%  sched_debug.cpu.avg_idle.stddev
    945.30 ±  3%     +13.1%       1069        sched_debug.cpu.clock_task.stddev
      4198 ± 48%    +133.6%       9809 ±  5%  sched_debug.cpu.curr->pid.avg
      8874 ±  4%     +22.9%      10903        sched_debug.cpu.curr->pid.max
    673918 ±  6%     +17.5%     792166 ±  9%  sched_debug.cpu.max_idle_balance_cost.max
     21690 ± 31%    +111.3%      45830 ± 21%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.47 ± 38%     +85.7%       0.87        sched_debug.cpu.nr_running.avg
      1.42 ± 16%     +47.1%       2.08 ± 11%  sched_debug.cpu.nr_running.max
     14507 ±  7%     -54.9%       6544 ±  3%  sched_debug.cpu.nr_switches.avg
      6659 ± 22%     -62.9%       2473 ±  4%  sched_debug.cpu.nr_switches.min
      0.35 ± 48%     -98.8%       0.00 ± 84%  sched_debug.cpu.nr_uninterruptible.avg
     57.48 ± 40%     -69.4%      17.58 ± 17%  sched_debug.cpu.nr_uninterruptible.max
    -37.57           -53.0%     -17.64        sched_debug.cpu.nr_uninterruptible.min
     13.26 ± 14%     -59.9%       5.32 ±  4%  sched_debug.cpu.nr_uninterruptible.stddev
      0.00 ± 51%  +1.5e+05%       0.92 ± 28%  sched_debug.rt_rq:.rt_time.avg
      0.08 ± 51%  +1.5e+05%     117.15 ± 28%  sched_debug.rt_rq:.rt_time.max
      0.01 ± 51%  +1.5e+05%      10.31 ± 28%  sched_debug.rt_rq:.rt_time.stddev
      0.03 ±215%   +2879.8%       0.96 ± 49%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.13 ±103%   +1189.9%       1.68 ±119%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.mmput
      0.85 ± 86%    +231.7%       2.80 ± 54%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ±223%   +7452.6%       0.98 ± 52%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.26 ± 87%    +749.2%       2.17 ± 20%  perf-sched.sch_delay.avg.ms.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      0.01 ±223%  +17506.7%       2.20 ± 46%  perf-sched.sch_delay.avg.ms.__cond_resched.hugetlb_no_page.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.03 ±147%  +11098.0%       3.71 ± 36%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.10 ±152%    +369.6%       0.45 ± 35%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ±223%  +29071.4%       0.34 ± 40%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.04 ±212%   +3041.4%       1.28 ± 77%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.02 ± 75%  +10356.6%       2.13 ± 25%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.14 ± 80%    +760.6%       1.22 ± 53%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.12 ±186%   +1544.3%       1.93 ± 53%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.10 ± 76%    +418.1%       0.50 ± 71%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.02 ± 53%    +246.5%       0.08 ± 18%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.24 ±112%    +242.9%       0.82 ± 42%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown]
      0.13 ±105%   +8124.3%      10.43 ±111%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.01 ±205%  +17479.3%       1.70 ± 12%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.48 ±106%    +537.5%       3.07 ± 11%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.32 ±107%    +241.4%       1.08 ± 38%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.08 ±107%    +626.3%       0.58 ± 20%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.12 ± 57%    +236.4%       0.40 ± 32%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.09 ±109%    +412.2%       0.46 ± 51%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.12 ±105%   +1550.9%       1.90 ± 42%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.hugetlb_fault
      0.01 ± 11%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      0.04 ± 69%   +1461.9%       0.58 ± 36%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.02 ± 50%   +1633.6%       0.37 ± 62%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ± 43%  +68186.5%       4.21 ±132%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      0.02 ± 97%   +3038.3%       0.49 ± 41%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.03 ±215%   +9695.3%       3.15 ± 42%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.02 ±223%  +18158.3%       3.29 ± 43%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     27.49 ±100%   +1156.8%     345.46 ± 69%  perf-sched.sch_delay.max.ms.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      0.03 ±223%  +23123.8%       6.66 ± 66%  perf-sched.sch_delay.max.ms.__cond_resched.hugetlb_no_page.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.05 ±169%  +20804.3%      11.25 ± 70%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.17 ±108%   +2409.6%       4.37 ± 58%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ±223%  +55471.4%       0.65 ± 88%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.04 ±210%   +6953.3%       2.89 ± 67%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.07 ± 86%   +8775.7%       6.33 ± 12%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.68 ±193%    +754.2%       5.82 ± 28%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.09 ± 62%    +102.7%       0.19 ± 14%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.17 ±127%  +85837.7%     150.10 ±137%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.01 ±209%  +35140.8%       4.46 ± 15%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
     39.02 ±126%    +657.8%     295.69 ± 67%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.04 ±126%    +520.1%       6.42 ± 39%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.30 ±126%   +4472.7%      13.93 ± 97%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      1.13 ±116%   +1283.8%      15.68 ± 79%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.08 ± 44%    +703.6%       0.62 ±170%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     22.08 ±162%    +310.8%      90.72 ± 70%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.95 ±144%  +21640.8%     206.94 ±103%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.hugetlb_fault
      0.54 ±  7%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      1.51 ± 85%    +414.6%       7.77 ± 77%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.10 ± 52%   +2736.0%       2.70 ± 49%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ± 43%  +68186.5%       4.21 ±132%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      0.20 ±155%   +1877.9%       3.99 ± 20%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.09 ± 64%   +1395.6%       1.31 ± 21%  perf-sched.total_sch_delay.average.ms
      0.32 ±123%   +1292.2%       4.50 ± 19%  perf-sched.wait_and_delay.avg.ms.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
    639.13 ±  9%     -69.6%     194.08 ± 92%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.26 ±148%   +2285.7%       6.17 ± 12%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.12 ±148%    +612.4%       0.85 ± 33%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     22.35 ± 33%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      4.07 ± 18%     +48.6%       6.05 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    167.00 ±106%   +1946.1%       3417 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      3.17 ±103%    +268.4%      11.67 ± 45%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    334.67 ± 46%     +84.4%     617.17 ± 19%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     97.67 ±142%   +3017.4%       3044 ± 21%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     39.17 ±144%   +2545.5%       1036 ± 34%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    344.33 ± 46%     +89.1%     651.17 ± 17%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     22121 ± 48%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      1246 ± 19%     -29.3%     881.00 ± 15%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     74.50 ±142%   +3556.4%       2724 ± 65%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    779.50 ±  3%     +28.5%       1001 ±  4%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     23.15 ±127%   +2309.5%     557.71 ± 65%  perf-sched.wait_and_delay.max.ms.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      7.10 ±152%   +7819.7%     562.68 ± 73%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.69 ±172%   +1807.7%      32.30 ± 74%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    329.10 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
     86.41 ± 72%    +200.7%     259.84 ± 32%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3082 ± 15%     -40.8%       1823 ± 19%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±223%   +7452.6%       0.98 ± 52%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.17 ± 85%   +1266.7%       2.33 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      0.01 ±223%  +18110.7%       2.28 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.hugetlb_no_page.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.03 ±147%  +11280.9%       3.77 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.17 ±115%    +430.6%       0.92 ± 49%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.05 ±223%    +914.1%       0.49 ± 91%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.04 ±220%   +3132.1%       1.28 ± 77%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    639.01 ±  9%     -69.7%     193.44 ± 92%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      6.93 ± 59%    +214.4%      21.79 ± 53%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.24 ±112%    +242.9%       0.82 ± 42%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown]
      0.13 ±106%   +4417.1%       5.68 ±135%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.38 ±105%    +711.6%       3.09 ± 12%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.14 ± 50%    +215.8%       0.45 ± 34%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.19 ± 80%    +997.8%       2.08 ± 41%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.hugetlb_fault
     22.34 ± 33%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      1.22 ± 44%    +524.5%       7.61 ± 21%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      4.02 ± 18%     +46.1%       5.88 ± 11%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ±158%   +3518.8%       0.29 ± 60%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3783 ± 31%     -57.4%       1612 ± 78%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.02 ±223%  +18158.3%       3.29 ± 43%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      8.25 ±116%   +3088.9%     263.05 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.folio_zero_user.hugetlb_no_page.hugetlb_fault.handle_mm_fault
      0.03 ±223%  +23123.8%       6.66 ± 66%  perf-sched.wait_time.max.ms.__cond_resched.hugetlb_no_page.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.05 ±169%  +20804.3%      11.25 ± 70%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.hugetlb_fault.handle_mm_fault.do_user_addr_fault
      0.55 ±149%   +1198.6%       7.14 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.05 ±223%   +2800.0%       1.41 ±161%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.04 ±213%   +7040.3%       2.89 ± 67%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.17 ±128%  +37273.6%      64.84 ±198%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     29.13 ±164%    +865.7%     281.34 ± 73%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.72 ± 91%   +1062.5%      19.99 ± 54%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      3.12 ± 55%     +73.5%       5.41 ± 15%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2.11 ± 90%   +9785.3%     208.45 ±102%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.hugetlb_fault
    329.10 ±  2%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
     10.87 ± 54%   +1057.8%     125.85 ± 46%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     79.98 ± 83%    +191.2%     232.93 ± 19%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.20 ±162%   +1849.9%       3.80 ± 26%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3082 ± 15%     -40.9%       1821 ± 19%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

