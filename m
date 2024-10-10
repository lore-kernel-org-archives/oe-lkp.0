Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91011C1ACB
	for <oe-lkp@lists.linux.dev>; Thu, 10 Oct 2024 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544125; cv=fail; b=Gltrjm060Hbe9K6vWSMlbzE+6Dh3mQhIg8RW3TO3PU652RZOEFInYQQuL3K+aJ3wEZoyCPRW3m7F5vAZ12fEhAUacUi9IElpjG54YFFl6LRTge1OLSh6JFMVmKbBIuK0rf35ZXHlPtvED76WbpxMSudDy2TDq+FdBqOjAZH1cDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544125; c=relaxed/simple;
	bh=2AHnOEXKnUMSC7gGSrlM+s9VcA451gpDcGIob52rcNU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gMISqjmZu2MfNve0TqTsSRcSvpeo9nCEXlYK2TohPq1KdcDhAN3kue/7/2knZfQWXsSXpN1j10UQiDchWehGkhE4J9fRRDz1E52X401so3muDMaDfYiYzr2l1cVcdbZmLcK1vGXWTdbS9UtnmwTU8JBiB5H7anJ5Rdum8voZ0uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnlbMfZh; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnlbMfZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728544121; x=1760080121;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=2AHnOEXKnUMSC7gGSrlM+s9VcA451gpDcGIob52rcNU=;
  b=CnlbMfZhJLQwRddHEDjT4Oj948TrROVtYR6T7FurowwhCzcepxSkaSog
   7/tGbgtdtIv+p+6fErizGXo46MLHvhQh7gW3Mpmij0RzCyI4QEGgohxyY
   nXYZ6bdIEp0g+81D5iTeLkjfcIJbcbiimO7yA7C94cqA6vxyY6OhIlir/
   O5ShVlmnIvRWrBfuSbOcFRf2gjTKSsXBEVzE7b09DJ2HqoZHFaVefzWMw
   UjzE259HDHqbppyfxPKLhPt8+ZZo1sHGinJrVvwNg+16yIQXuOnRUySV6
   lk988mBfxyjwrmIpvweOAJk9eUEtxC+ev6snn86xt0BvPA4iQSG0lEH6X
   A==;
X-CSE-ConnectionGUID: Gax2wnq9Sx6lmCdu70OOcg==
X-CSE-MsgGUID: 8GeTYy+9RWiNn0uW1Fmr1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31780918"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="31780918"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 00:08:40 -0700
X-CSE-ConnectionGUID: j1vuDs6ORCqGL0juW2j0WA==
X-CSE-MsgGUID: v4oA1clGT4OtRso6gqUUSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="80500290"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Oct 2024 00:08:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 00:08:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 00:08:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 00:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxpxEHCdPJPnx6h8hbPvOf8IFZoZWEtg6fpp8AdLKkq5PPALjcnkvdR4SNQjrrbmPer3AqXNwLTtf+sRNFqcFnc7B6i0z3Ci5qEAtGQGx3jhM06PkH5eh3d3YjvFiCSwn6G+eqtpW9ZLXZsSw0XRvftdUxk055SU6EyQxz2Qmd/j1wHkHJ1aR/ZUxTYI3lKtpj57lGKx+LZ2K5dguv75drnbkL0Yh1KzmGXyiP6czXeMyX9goxeiJ/44f9mQcsfImCAF7PyL3sA1jhQbndLW4lEndwJQCBfKI2wlBvgdPEkxiSwnH9WnQj5SSN+k87jHZZyH1svhXvV46EdxCZRZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3mKbSBXgg7vgxEzUMb1NCRu229oAWtxFcdiFUzMnz4=;
 b=tRS9Hh6TqXBT/QZUdZuSd42aAVU/kERtAEJ8/yzNrnwDJdIGnIbvjIu6kA+hQ98rOdx++8vVxKtf4DBy2t6zM+QzAntk7Nh3xff+9McVTOFwk400zQ/6Qh3caW3qpjKi/XysQeK8y6q6X3wR2ft2DndQdHEpbfZHTEFNx+I27hD8fMH5U/pHF5PHtSH2q3uJF9DywHorCTNacxnMvRTGGjnAHtHQj/knH0At8GQFYm78ANFUO+Ph8tR9BHNfBQpx33Lo3HSXtGmUw0J4Snz5PW324bZ21d1pBEsIJ/cwX7GB0rHFkZA6mXeZhxbX9OVxsVTXSO4m00r1nNdebLwouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 07:08:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 07:08:28 +0000
Date: Thu, 10 Oct 2024 15:08:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <kaixuxia@tencent.com>, <frankjpliu@tencent.com>, <kasong@tencent.com>,
	<sagazchen@tencent.com>, <kernelxing@tencent.com>, <aurelianliu@tencent.com>,
	<deshengwu@tencent.com>, <flyingpeng@tencent.com>, <jingqunli@tencent.com>,
	<jason.zeng@intel.com>, <wu.zheng@intel.com>, <yingbao.jia@intel.com>,
	<pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [rue/mm]  75ad2bae3d:
 will-it-scale.per_thread_ops -67.6% regression
Message-ID: <202410101435.e18df1f5-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0192.apcprd06.prod.outlook.com (2603:1096:4:1::24)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 4484a25f-d09a-465b-fe92-08dce8fa56f0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?urO5OlOEjfhh7DqNLEcYGeHBjuprsz0WR7hEr3g5JXWoraQJZje/Uc7DB3?=
 =?iso-8859-1?Q?l9H/i5NAX6sZqdRABozHGHlal4wCiON8oXyUb7NAUNu5LzXZYsuQWG6nBr?=
 =?iso-8859-1?Q?iuud//v5lgHKVSZAOziyFiXPiYnk7icVgWv2GzHhBZ61GBv8eemBDdLz8u?=
 =?iso-8859-1?Q?wIP3UCyrzotG5nGLG+NjkzipbjtDh/z7L/H8fVtnKS4ujpKl7tZTOU1EMO?=
 =?iso-8859-1?Q?9qyEsiJcUWN0LxUvWIkEtwWS4oI6/NWkI0AuMW6pKDF7e/+cjql67KMGvy?=
 =?iso-8859-1?Q?Zlx+F3CAKmmOsXBhKBE3zEs32x6/BwyNfmsSWCR3yc7qBObyrCFD1gFbR4?=
 =?iso-8859-1?Q?lah21v1RkzMd5WFMvNPFeChxbtl2INi+KCzEaofN7hnph5wvajHwx8T7RW?=
 =?iso-8859-1?Q?ZGoYYaHwSx4TGT4GmMN9xp8OMgaAnsiuE6tjJIpgoF0HPzrnux2yYKAfTl?=
 =?iso-8859-1?Q?rhdhLc0zfXrRvgQfzS9xngAZhNNRrbvRwD4d34Jd8oEySdiStTfTtwNS+d?=
 =?iso-8859-1?Q?FFIvQU8S7BmewDEgX5716PBb6jq/Oi3xxd1gZZ65ZKMSG080fboWkchueQ?=
 =?iso-8859-1?Q?Y2viX+UN/sTEf6GB1y624uYXGvPzoVs6D26qWgVSIOKJa4cuVpu87r2s6/?=
 =?iso-8859-1?Q?PjeKbS1yWyhH4CDV8JwOqhOZwyJ+RAQR7/AOA8Wnbm1D3T6BjkkUFIslY8?=
 =?iso-8859-1?Q?mYhnj4uWFhLQv9xy0bE+nU4LODpRCjEFGJgGDfVCyKHanXOqPkFggXZIhb?=
 =?iso-8859-1?Q?HY72zEgYQ0mckyvU1woQH3xbExUt70LI87BPtCFuiVPRjm5jRxHwzT6jWI?=
 =?iso-8859-1?Q?TmJb0HRr0tmZxP7fqGKMOlMeCWqnZW8h4eDF+gbeyAtSDwGOsdn3CpGz7S?=
 =?iso-8859-1?Q?B5mft/QKjMUTCZrd0dv6dc8+eenByiDrhXcq4MjtWR3rOClDcxpdTDKi0O?=
 =?iso-8859-1?Q?k88UtThoPyJkxF0BuNB5z79t3pgr4EB4PdJbR9drUXkYvB3gWGIYUF/Myt?=
 =?iso-8859-1?Q?IUKgpw9nZAydhgNe5ZKWrDJzdH5z/gVvYK7KpqtCT5yPLItWHL5qrcGfGR?=
 =?iso-8859-1?Q?gGapj2Af5FeOSrCzV2o/XqQlHKs47XP24kq8W+Fu85SK78JUsJTJFVrHK7?=
 =?iso-8859-1?Q?4ROqaAZJu0xlJMZAsggFy32MWppHOss+CjE8SyJKHYbaxF7xhGC96zkt73?=
 =?iso-8859-1?Q?3qKpnD7C1b+VBXoIIueEaQTk2D7avvGjG/6bx19n1Uq3wGV/clGLMEd2KO?=
 =?iso-8859-1?Q?HG4/j0gH1JYrTHaKfw5gNjsNj+168wgydebYaTzv9TjLq059WKtW5u65lS?=
 =?iso-8859-1?Q?JYa0buQCWi1CTrYg6ax0SsgH0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AlLmXCgj5iBQARk8LJwsYPIXlfhbkaQbpunHGknS6oUKXAtmzcCrkTyclA?=
 =?iso-8859-1?Q?jH6VF4jBgY+Chkf7au6UMzaYCASgNbRn1xBGzPKMyzUj0wP0pxEx4Enghm?=
 =?iso-8859-1?Q?KKu2vlXrSHJyGoxVQ/z2Nw/WvUSKmc7iqn1nkpQvq6qosRkt5M32yC7/6e?=
 =?iso-8859-1?Q?XoHS8wn1L18/DQv43W0sbzcYwB084CCQfe/LOE+rd7/mcbbc3mxbmgP05k?=
 =?iso-8859-1?Q?wJ1OWvZlTcmTB1RtZurS2jFaq/Toyu7dpSecFlb9Cg5LS7NrQAFendEMJ6?=
 =?iso-8859-1?Q?DqN2OuWEZLFd5gDOyzFz060XM/WvcGnodqLQUOHHxv91R1vAahHsW0IDvx?=
 =?iso-8859-1?Q?PQIWojdeAj4vOpDm3hxMEsjhqH2rxjLGscuBug2Fj18UvO4Efa+gvsJmli?=
 =?iso-8859-1?Q?5Bb4UxlwmhVp4l50upySIaoKiMtaFk/+Xq/sJh5i3tsE7QyXgepsYpi609?=
 =?iso-8859-1?Q?OoKQ5Dv0dJsmSv97K7hYYPszYgWOkoFVp8X98kCrdPGs7MBvCCtOO4tqeD?=
 =?iso-8859-1?Q?v/t3uSVi7zucU0Ew248gb3N2qks8eRgWcAkfVkI8PddwAwOSOBJ+wu0f9j?=
 =?iso-8859-1?Q?LVAY620HuK/hAbTCaWx+DlNZFHik7eWBaH098Nj75BBNIor4yFK9QVp39U?=
 =?iso-8859-1?Q?mVKl20Nl2H4yfthFa+t8ax4/E7CYmULlIj0NuPUh2p4SJCLDzQ40zkPU51?=
 =?iso-8859-1?Q?ZTKT8sEznjJ4GQil3AijfjZbxHi3XUaKTPDjMRLi2hLjAdQ4lcNOWFg6T8?=
 =?iso-8859-1?Q?IAmbVcljbzcyH9JJQm1DET+ZH+VDNxpK6HLMrLqPqvG+pdWtrOlGWS5UKi?=
 =?iso-8859-1?Q?j6oKQHVq68lH2aCsye1UavhIoOi5p9DX7OSFb/xtSSVlyWAWQ0RHQbTekT?=
 =?iso-8859-1?Q?G5cWWci5x57iOGYzNydQ/ffSvK/N8n0gLjHNzBu8B3lDwb3UoDA9TpaMeg?=
 =?iso-8859-1?Q?WSSCMp4EL4THbuEouk/wN86U7KCRSghdmStIBF/Hlp7OfZuAncZdMT4lmu?=
 =?iso-8859-1?Q?I3T/DZzzgJouIFB17/VwRzylS5WRzlTNG5m81aKqHq52Szd+h3eIOr6bYu?=
 =?iso-8859-1?Q?9clTtu+2fT8hHuKtWMB3Uwg+f8+wAhZfnb6TWsDnoRUnJRiOOxnAzCYYv5?=
 =?iso-8859-1?Q?rTG8z5KwByQfRuUOzQVccY7xXn3z47Mx/gRzN1NJ4qAJP04xifro9CXkBQ?=
 =?iso-8859-1?Q?Oq3butKKsFU90WEwqpqiHPF6ag9I9ewYpH/RUwTHAs6aYb+tkM90cfjrZN?=
 =?iso-8859-1?Q?+5GsIeFh0a3N4fb212TryxMFE0pEwZAynkE89J8vzzz+jCwtCtM6dPCPPP?=
 =?iso-8859-1?Q?apQniQkdlxtip+EatcdAnmZtMJ3dzzpCXRasPgf6UE8/oVlhKwrSbqUFL0?=
 =?iso-8859-1?Q?2lN+hESMLpnUW2+Fz52xpbszVJfdcdTLrFCAxMtYTKaANck83vJPHP9fqF?=
 =?iso-8859-1?Q?8P/OWFGfQHOvj3omWaUsfQGf/eWFfIna+gr5p5WNscvrgod3GICK/V1FWj?=
 =?iso-8859-1?Q?TZBmgeI4njaiupKwvRDtEd5iijYtwHbcqBjV313z2jTpdYQYznKAtJjk8J?=
 =?iso-8859-1?Q?RM7YFkrUVT/qBIIvikt6MB+IgYOIjTc/s1azkGa0RfPE7o5eePIULT3adA?=
 =?iso-8859-1?Q?bZ8R9brgS/p2YBbdDNnmVTF02V9eH8kiWS1utB1FBoZsIII6qvwuiqaQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4484a25f-d09a-465b-fe92-08dce8fa56f0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 07:08:28.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qhdmjBwyQPtwK8ytRzR80nFT//A4+07IUklakC7QFLG3zzMV+52g46eiF0C3Boy/MyDCe+tCDp1Iwh9YxPQ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -67.6% regression of will-it-scale.per_thread_ops on:


commit: 75ad2bae3d3bec7c6597f2688ea9211976867247 ("rue/mm: pagecache limit per cgroup support")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: will-it-scale
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_task: 100%
	mode: thread
	test: fallocate2
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput -18.0% regression                             |
| test machine     | 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                            |
|                  | runtime=300s                                                                            |
|                  | size=256G                                                                               |
|                  | test=lru-shm-rand                                                                       |
+------------------+-----------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput -66.9% regression                             |
| test machine     | 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                            |
|                  | runtime=300s                                                                            |
|                  | size=1T                                                                                 |
|                  | test=lru-shm                                                                            |
+------------------+-----------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410101435.e18df1f5-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241010/202410101435.e18df1f5-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-oc_stream_base_config/thread/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/fallocate2/will-it-scale

commit: 
  56d80c4ea2 ("rue/mm: add memory cgroup async page reclaim mechanism")
  75ad2bae3d ("rue/mm: pagecache limit per cgroup support")

56d80c4ea2ec7c26 75ad2bae3d3bec7c6597f2688ea 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.00 ± 28%      +0.0        0.00 ± 37%  mpstat.cpu.all.soft%
     16908 ± 18%    +140.3%      40626 ± 52%  numa-meminfo.node2.Mapped
    252643           -18.1%     206805        meminfo.KReclaimable
    252643           -18.1%     206805        meminfo.SReclaimable
      7206 ±  2%     -48.5%       3710 ±  2%  vmstat.system.cs
    333515            -1.7%     327737        vmstat.system.in
  10652555 ±  3%     -67.6%    3454450 ±  6%  will-it-scale.256.threads
     41611 ±  3%     -67.6%      13493 ±  6%  will-it-scale.per_thread_ops
  10652555 ±  3%     -67.6%    3454450 ±  6%  will-it-scale.workload
     76.17 ±  8%    +145.5%     187.00 ± 55%  perf-c2c.DRAM.local
      7995 ±  5%    +222.4%      25774 ±  8%  perf-c2c.DRAM.remote
     29974 ±  4%     -40.5%      17821 ± 10%  perf-c2c.HITM.local
    718.50 ±  6%    +351.5%       3243 ± 16%  perf-c2c.HITM.remote
     30693 ±  4%     -31.4%      21065 ±  8%  perf-c2c.HITM.total
 1.773e+09           -78.9%  3.739e+08 ±  8%  numa-numastat.node0.local_node
 1.776e+09           -78.9%  3.741e+08 ±  8%  numa-numastat.node0.numa_hit
 1.772e+09           -68.2%  5.643e+08 ±  2%  numa-numastat.node1.local_node
 1.774e+09           -68.2%  5.647e+08 ±  2%  numa-numastat.node1.numa_hit
 1.436e+09 ±  8%     -67.6%  4.646e+08 ± 11%  numa-numastat.node2.local_node
 1.437e+09 ±  8%     -67.6%  4.649e+08 ± 11%  numa-numastat.node2.numa_hit
 1.452e+09 ±  8%     -52.7%  6.869e+08 ±  4%  numa-numastat.node3.local_node
 1.454e+09 ±  8%     -52.7%  6.872e+08 ±  4%  numa-numastat.node3.numa_hit
      1894            +6.4%       2015 ±  7%  proc-vmstat.nr_page_table_pages
     63165           -18.2%      51693        proc-vmstat.nr_slab_reclaimable
  6.44e+09 ±  3%     -67.5%  2.091e+09 ±  6%  proc-vmstat.numa_hit
 6.433e+09 ±  3%     -67.5%   2.09e+09 ±  6%  proc-vmstat.numa_local
 6.431e+09 ±  3%     -67.5%  2.089e+09 ±  6%  proc-vmstat.pgalloc_normal
   1567221            -1.5%    1543515        proc-vmstat.pgfault
  6.43e+09 ±  3%     -67.5%  2.088e+09 ±  6%  proc-vmstat.pgfree
     52807            -3.3%      51085        proc-vmstat.pgreuse
 1.776e+09           -78.9%  3.741e+08 ±  8%  numa-vmstat.node0.numa_hit
 1.773e+09           -78.9%  3.739e+08 ±  8%  numa-vmstat.node0.numa_local
 1.774e+09           -68.2%  5.647e+08 ±  2%  numa-vmstat.node1.numa_hit
 1.772e+09           -68.2%  5.643e+08 ±  2%  numa-vmstat.node1.numa_local
      4265 ± 19%    +138.0%      10150 ± 50%  numa-vmstat.node2.nr_mapped
 1.437e+09 ±  8%     -67.6%  4.649e+08 ± 11%  numa-vmstat.node2.numa_hit
 1.436e+09 ±  8%     -67.6%  4.646e+08 ± 11%  numa-vmstat.node2.numa_local
 1.454e+09 ±  8%     -52.7%  6.872e+08 ±  4%  numa-vmstat.node3.numa_hit
 1.452e+09 ±  8%     -52.7%  6.869e+08 ±  4%  numa-vmstat.node3.numa_local
      0.41 ± 22%     +89.3%       0.77 ± 24%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
      2.99 ± 21%     +44.3%       4.32 ± 14%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      0.41 ± 22%     +88.7%       0.77 ± 24%  sched_debug.cfs_rq:/.removed.util_avg.avg
      2.99 ± 21%     +43.1%       4.28 ± 14%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    205.80 ± 22%     -35.8%     132.18 ± 13%  sched_debug.cfs_rq:/.util_avg.min
    325668 ± 27%    +109.7%     682874 ± 33%  sched_debug.cpu.avg_idle.max
     21230 ± 54%    +126.7%      48121 ± 39%  sched_debug.cpu.avg_idle.stddev
      7.65 ± 32%    +812.3%      69.82 ± 33%  sched_debug.cpu.clock.stddev
      7.65 ± 32%    +812.3%      69.82 ± 33%  sched_debug.cpu.clock_task.stddev
      1598 ± 31%     -36.8%       1010 ± 24%  sched_debug.cpu.curr->pid.min
      0.00 ± 41%    +604.5%       0.00 ± 32%  sched_debug.cpu.next_balance.stddev
      1442 ± 27%     -46.2%     776.67 ± 19%  sched_debug.cpu.nr_switches.avg
      1010 ± 26%     -73.0%     273.21 ± 22%  sched_debug.cpu.nr_switches.min
      0.37 ± 23%    +243.3%       1.29 ± 10%  perf-stat.i.MPKI
 3.252e+10 ±  3%     -67.9%  1.045e+10        perf-stat.i.branch-instructions
      0.15 ±  7%      +0.0        0.20 ± 12%  perf-stat.i.branch-miss-rate%
  39398110 ±  2%     -53.9%   18156740 ±  2%  perf-stat.i.branch-misses
     20.81           +20.1       40.96        perf-stat.i.cache-miss-rate%
  32715721 ±  4%     +80.8%   59137161 ±  5%  perf-stat.i.cache-misses
 1.582e+08 ±  3%      -8.4%  1.449e+08 ±  4%  perf-stat.i.cache-references
      7197 ±  2%     -49.3%       3650 ±  2%  perf-stat.i.context-switches
      4.32          +224.3%      14.00        perf-stat.i.cpi
    318.36           -11.1%     283.08        perf-stat.i.cpu-migrations
     21315           -42.3%      12307 ±  4%  perf-stat.i.cycles-between-cache-misses
 1.571e+11 ±  3%     -67.5%  5.112e+10 ±  2%  perf-stat.i.instructions
      0.23           -66.9%       0.08 ±  5%  perf-stat.i.ipc
      0.06 ± 31%     +60.9%       0.09 ± 22%  perf-stat.i.major-faults
      0.21          +453.0%       1.16 ±  3%  perf-stat.overall.MPKI
      0.12            +0.1        0.17 ±  2%  perf-stat.overall.branch-miss-rate%
     20.73           +20.1       40.83        perf-stat.overall.cache-miss-rate%
      4.33          +220.5%      13.88        perf-stat.overall.cpi
     20732 ±  2%     -42.0%      12026 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.23           -68.8%       0.07        perf-stat.overall.ipc
 3.241e+10 ±  3%     -67.9%   1.04e+10        perf-stat.ps.branch-instructions
  39200769 ±  2%     -54.5%   17832621 ±  2%  perf-stat.ps.branch-misses
  32721938 ±  4%     +79.6%   58784139 ±  5%  perf-stat.ps.cache-misses
 1.578e+08 ±  3%      -8.8%  1.439e+08 ±  4%  perf-stat.ps.cache-references
      7169 ±  2%     -49.5%       3619 ±  2%  perf-stat.ps.context-switches
    316.28           -12.2%     277.58        perf-stat.ps.cpu-migrations
 1.566e+11 ±  3%     -67.5%  5.083e+10 ±  2%  perf-stat.ps.instructions
      0.06 ± 30%     +58.5%       0.09 ± 21%  perf-stat.ps.major-faults
 4.787e+13 ±  3%     -67.6%  1.553e+13 ±  2%  perf-stat.total.instructions
      0.13 ± 54%    +801.0%       1.18 ± 21%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      2.63 ± 47%     +44.1%       3.79 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.handle_pte_fault
      0.08 ± 10%    +249.0%       0.30 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr_locked
      0.10 ±154%   +2110.4%       2.27 ± 36%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__fput_sync.__x64_sys_close
      0.01 ± 68%    +760.9%       0.10 ± 25%  perf-sched.sch_delay.avg.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.16 ± 47%    +418.2%       0.82 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call
      0.12 ± 46%    +749.0%       1.02 ± 51%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_inode_acct_block.shmem_alloc_and_acct_folio.shmem_get_folio_gfp.shmem_fallocate
      0.14 ± 39%    +492.2%       0.84 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_undo_range.shmem_setattr.notify_change.do_truncate
      0.44 ±148%    +517.1%       2.73 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      0.14 ± 49%    +837.3%       1.36 ± 41%  perf-sched.sch_delay.avg.ms.__cond_resched.vfs_fallocate.__x64_sys_fallocate.x64_sys_call.do_syscall_64
      4.41 ±223%    +434.7%      23.59 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_client_buffer_vunmap.drm_fbdev_generic_helper_fb_dirty
      0.51 ±223%    +494.8%       3.06 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.98 ± 53%    +161.3%       2.56 ± 44%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.07 ± 18%   +1950.1%       1.49 ± 16%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
      1.76 ± 91%    +118.4%       3.85 ±  2%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      0.26 ± 48%     +87.7%       0.49 ± 15%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.03 ± 15%   +1398.0%       0.51 ± 70%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.__x64_sys_read
      0.16 ±  7%    +439.3%       0.87 ±  8%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.02 ±111%    +830.0%       0.16 ± 26%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 ± 70%    +963.8%       0.08 ± 30%  perf-sched.sch_delay.avg.ms.schedule_timeout.memcg_prio_reclaimd_async.kthread.ret_from_fork
      0.02 ± 10%   +2676.0%       0.68 ± 17%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.04 ± 13%    +182.4%       0.10 ± 13%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.11 ± 75%   +1006.3%       1.21 ±154%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.34 ± 44%    +110.0%       7.02        perf-sched.sch_delay.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.handle_pte_fault
      0.76 ±150%    +396.5%       3.77 ± 17%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__fput_sync.__x64_sys_close
      0.20 ±172%    +324.6%       0.86 ± 56%  perf-sched.sch_delay.max.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      2.91 ± 73%    +138.2%       6.93 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_block.shmem_alloc_and_acct_folio.shmem_get_folio_gfp.shmem_write_begin
      3.82 ± 17%     +77.8%       6.79 ± 30%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.44 ±148%   +1095.2%       5.28 ± 18%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      4.64 ±223%    +533.6%      29.41 ± 51%  perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_client_buffer_vunmap.drm_fbdev_generic_helper_fb_dirty
      0.51 ±223%    +882.8%       5.06 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      2.55 ± 51%    +132.5%       5.92 ± 27%  perf-sched.sch_delay.max.ms.__x64_sys_pause.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.41 ± 13%     +70.1%       5.80 ±  8%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
     23.74 ± 21%     -65.3%       8.24 ±101%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.ep_poll.do_epoll_wait
      4.22 ±  3%     +41.5%       5.98 ±  8%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.41 ±177%    +651.5%       3.08 ± 19%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.02 ±137%   +1476.3%       0.30 ± 40%  perf-sched.sch_delay.max.ms.schedule_timeout.memcg_prio_reclaimd_async.kthread.ret_from_fork
      3.51 ± 13%     +39.8%       4.91 ±  3%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3.88 ±  2%     +32.6%       5.14 ± 23%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     27.23 ± 16%   +2051.3%     585.70 ±126%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.13 ± 41%    +476.5%       0.76 ± 20%  perf-sched.total_sch_delay.average.ms
     98.84 ±  4%     +69.1%     167.19 ±  3%  perf-sched.total_wait_and_delay.average.ms
     41880 ±  6%     -29.2%      29637 ±  8%  perf-sched.total_wait_and_delay.count.ms
     98.71 ±  4%     +68.6%     166.42 ±  3%  perf-sched.total_wait_time.average.ms
     54.30 ±100%    +635.1%     399.12 ± 23%  perf-sched.wait_and_delay.avg.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.32 ± 47%    +418.5%       1.65 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call
      0.28 ± 39%    +491.5%       1.67 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shmem_undo_range.shmem_setattr.notify_change.do_truncate
      3.38 ±100%    +160.4%       8.80 ± 11%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      6.24 ± 23%    +372.2%      29.47 ± 15%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     40.23 ± 14%     +47.6%      59.38 ± 14%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.__x64_sys_read
      5.17           +18.9%       6.14 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    191.53 ±  3%    +140.4%     460.50 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      8638 ±  7%     -24.7%       6508 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call
      9357 ±  8%     -32.8%       6290 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.shmem_undo_range.shmem_setattr.notify_change.do_truncate
     11.50 ±  6%     +31.9%      15.17 ±  8%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    149.67 ±100%    +451.1%     824.83 ±  9%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      1648 ±  5%     -34.8%       1074 ± 12%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1989 ±  4%     -27.1%       1450 ±  5%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.__x64_sys_read
     26.50 ±  7%     +24.5%      33.00 ±  8%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
     44.17 ±  9%     +37.4%      60.67 ± 10%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
      5.17 ± 13%     +41.9%       7.33 ± 10%  perf-sched.wait_and_delay.count.schedule_timeout.memcg_prio_reclaimd_async.kthread.ret_from_fork
     14536 ±  7%     -55.3%       6494 ± 10%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1583 ±  8%     +37.7%       2181 ±  9%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    106.15 ±100%   +2651.9%       2921 ± 51%  perf-sched.wait_and_delay.max.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
     33.97 ±109%   +1937.6%     692.14 ± 63%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
     12.97 ±  7%     +20.2%      15.59 ±  5%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1040          +396.0%       5160 ±  8%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.13 ± 54%    +801.0%       1.18 ± 21%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      2.63 ± 47%     +43.5%       3.78 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.handle_pte_fault
      0.10 ±154%   +2110.4%       2.27 ± 36%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__fput_sync.__x64_sys_close
    101.52 ±  9%    +293.0%     399.02 ± 23%  perf-sched.wait_time.avg.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.16 ± 47%    +418.2%       0.82 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call
      0.12 ± 46%    +749.0%       1.02 ± 51%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_inode_acct_block.shmem_alloc_and_acct_folio.shmem_get_folio_gfp.shmem_fallocate
      0.14 ± 39%    +492.2%       0.84 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_undo_range.shmem_setattr.notify_change.do_truncate
      0.14 ± 49%    +837.3%       1.36 ± 41%  perf-sched.wait_time.avg.ms.__cond_resched.vfs_fallocate.__x64_sys_fallocate.x64_sys_call.do_syscall_64
      0.51 ±223%    +471.0%       2.94 ± 38%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.98 ± 53%    +161.3%       2.56 ± 44%  perf-sched.wait_time.avg.ms.__x64_sys_pause.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.37 ±  3%    +172.8%       6.46 ± 10%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
      1.76 ± 92%    +181.8%       4.95 ± 20%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      5.98 ± 22%    +384.8%      28.98 ± 15%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     40.20 ± 14%     +46.4%      58.87 ± 14%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.__x64_sys_read
      2.51 ±  5%    +407.8%      12.73 ±  5%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    191.50 ±  3%    +140.4%     460.40 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±133%   +4889.5%       0.63 ± 21%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3.34 ± 44%    +110.0%       7.02        perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.handle_pte_fault
      0.76 ±150%    +396.5%       3.77 ± 17%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__fput_sync.__x64_sys_close
    229.78 ± 17%   +1171.2%       2920 ± 51%  perf-sched.wait_time.max.ms.__cond_resched.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      2.91 ± 73%    +138.2%       6.93 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_block.shmem_alloc_and_acct_folio.shmem_get_folio_gfp.shmem_write_begin
      3.82 ± 17%   +4435.1%     173.09 ±214%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.51 ±223%    +882.8%       5.06 ± 29%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      2.55 ± 51%    +132.5%       5.92 ± 27%  perf-sched.wait_time.max.ms.__x64_sys_pause.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.31 ± 10%    +559.3%      74.57 ± 16%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1040          +395.9%       5158 ±  8%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.33 ±175%   +1447.6%       5.05 ± 24%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     48.86           -32.9       15.97 ± 13%  perf-profile.calltrace.cycles-pp.__folio_batch_release.shmem_undo_range.shmem_setattr.notify_change.do_truncate
     44.95           -31.7       13.21 ± 16%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.release_pages.__folio_batch_release.shmem_undo_range.shmem_setattr
     44.95           -31.7       13.21 ± 16%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.__folio_batch_release.shmem_undo_range
     44.89           -31.7       13.18 ± 16%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.__folio_batch_release
     46.05           -31.2       14.90 ± 12%  perf-profile.calltrace.cycles-pp.release_pages.__folio_batch_release.shmem_undo_range.shmem_setattr.notify_change
     43.21           -30.0       13.22 ± 16%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp.shmem_fallocate.vfs_fallocate
     43.48           -30.0       13.50 ± 16%  perf-profile.calltrace.cycles-pp.folio_add_lru.shmem_get_folio_gfp.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate
     42.32           -29.8       12.56 ± 16%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp.shmem_fallocate
     42.32           -29.8       12.56 ± 16%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp
     42.26           -29.7       12.54 ± 16%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru
      2.50            -1.8        0.66 ± 45%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.__folio_batch_release
      2.50            -1.8        0.66 ± 45%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.__folio_batch_release.shmem_undo_range
      2.50            -1.8        0.66 ± 45%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
      2.51            -1.8        0.68 ± 45%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.__folio_batch_release.shmem_undo_range.shmem_setattr
      2.53            -1.8        0.77 ± 16%  perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.__folio_batch_release.shmem_undo_range.shmem_setattr.notify_change
     50.66            -1.3       49.35        perf-profile.calltrace.cycles-pp.do_truncate.do_sys_ftruncate.__x64_sys_ftruncate.x64_sys_call.do_syscall_64
     50.66            -1.3       49.35        perf-profile.calltrace.cycles-pp.notify_change.do_truncate.do_sys_ftruncate.__x64_sys_ftruncate.x64_sys_call
     50.66            -1.3       49.36        perf-profile.calltrace.cycles-pp.ftruncate64
     50.66            -1.3       49.36        perf-profile.calltrace.cycles-pp.__x64_sys_ftruncate.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     50.66            -1.3       49.36        perf-profile.calltrace.cycles-pp.do_sys_ftruncate.__x64_sys_ftruncate.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.66            -1.3       49.36        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     50.66            -1.3       49.36        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.ftruncate64
     50.65            -1.3       49.35        perf-profile.calltrace.cycles-pp.shmem_setattr.notify_change.do_truncate.do_sys_ftruncate.__x64_sys_ftruncate
     50.66            -1.3       49.36        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.ftruncate64
     50.58            -1.3       49.28        perf-profile.calltrace.cycles-pp.shmem_undo_range.shmem_setattr.notify_change.do_truncate.do_sys_ftruncate
      0.59 ±  3%      +0.6        1.14 ± 62%  perf-profile.calltrace.cycles-pp.__folio_alloc.vma_alloc_folio.shmem_alloc_folio.shmem_alloc_and_acct_folio.shmem_get_folio_gfp
      0.56 ±  3%      +0.6        1.13 ± 63%  perf-profile.calltrace.cycles-pp.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio.shmem_alloc_and_acct_folio
     47.07            +0.8       47.90        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call
      0.00            +0.9        0.86 ±  5%  perf-profile.calltrace.cycles-pp.find_lock_entries.shmem_undo_range.shmem_setattr.notify_change.do_truncate
      0.00            +0.9        0.92 ± 18%  perf-profile.calltrace.cycles-pp.filemap_free_folio.filemap_remove_folio.truncate_inode_folio.shmem_undo_range.shmem_setattr
      0.00            +1.1        1.06 ± 67%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.00            +1.1        1.09 ± 15%  perf-profile.calltrace.cycles-pp.folio_add_lru.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call
     48.58            +1.3       49.93        perf-profile.calltrace.cycles-pp.fallocate64
     48.42            +1.5       49.86        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.fallocate64
     47.95            +1.5       49.44        perf-profile.calltrace.cycles-pp.vfs_fallocate.__x64_sys_fallocate.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     47.62            +1.6       49.24        perf-profile.calltrace.cycles-pp.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate.x64_sys_call.do_syscall_64
     48.20            +1.7       49.85        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fallocate64
     48.13            +1.7       49.83        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.fallocate64
     48.07            +1.7       49.80        perf-profile.calltrace.cycles-pp.__x64_sys_fallocate.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.fallocate64
      0.00           +30.0       30.00 ±  5%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.__mod_memcg_lruvec_state.__mod_lruvec_state.__mod_lruvec_page_state.filemap_unaccount_folio
      0.80 ±  3%     +30.3       31.09 ±  5%  perf-profile.calltrace.cycles-pp.__filemap_remove_folio.filemap_remove_folio.truncate_inode_folio.shmem_undo_range.shmem_setattr
      0.00           +30.4       30.42 ±  5%  perf-profile.calltrace.cycles-pp.__mod_memcg_lruvec_state.__mod_lruvec_state.__mod_lruvec_page_state.filemap_unaccount_folio.__filemap_remove_folio
      0.00           +30.5       30.46 ±  5%  perf-profile.calltrace.cycles-pp.page_counter_charge.__mod_memcg_lruvec_state.__mod_lruvec_state.__mod_lruvec_page_state.shmem_add_to_page_cache
      0.00           +30.5       30.48 ±  5%  perf-profile.calltrace.cycles-pp.__mod_lruvec_state.__mod_lruvec_page_state.filemap_unaccount_folio.__filemap_remove_folio.filemap_remove_folio
      0.00           +30.7       30.71 ±  5%  perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.filemap_unaccount_folio.__filemap_remove_folio.filemap_remove_folio.truncate_inode_folio
      0.00           +30.8       30.78 ±  5%  perf-profile.calltrace.cycles-pp.filemap_unaccount_folio.__filemap_remove_folio.filemap_remove_folio.truncate_inode_folio.shmem_undo_range
      0.00           +30.9       30.91 ±  5%  perf-profile.calltrace.cycles-pp.__mod_memcg_lruvec_state.__mod_lruvec_state.__mod_lruvec_page_state.shmem_add_to_page_cache.shmem_get_folio_gfp
      1.54           +31.0       32.52 ±  5%  perf-profile.calltrace.cycles-pp.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fallocate.vfs_fallocate.__x64_sys_fallocate
      0.00           +31.0       31.00 ±  5%  perf-profile.calltrace.cycles-pp.__mod_lruvec_state.__mod_lruvec_page_state.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fallocate
      1.27 ±  3%     +31.1       32.42 ±  5%  perf-profile.calltrace.cycles-pp.truncate_inode_folio.shmem_undo_range.shmem_setattr.notify_change.do_truncate
      0.00           +31.2       31.22 ±  5%  perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fallocate.vfs_fallocate
      0.96 ±  2%     +31.3       32.24 ±  5%  perf-profile.calltrace.cycles-pp.filemap_remove_folio.truncate_inode_folio.shmem_undo_range.shmem_setattr.notify_change
     89.85           -63.3       26.56 ± 16%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     90.26           -62.0       28.22 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     90.14           -62.0       28.16 ± 14%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     48.86           -32.9       15.97 ± 13%  perf-profile.children.cycles-pp.__folio_batch_release
     45.80           -31.8       14.01 ± 16%  perf-profile.children.cycles-pp.folio_batch_move_lru
     46.18           -31.2       14.98 ± 12%  perf-profile.children.cycles-pp.release_pages
     43.62           -29.0       14.64 ± 14%  perf-profile.children.cycles-pp.folio_add_lru
      2.53            -1.8        0.78 ± 17%  perf-profile.children.cycles-pp.lru_add_drain_cpu
     50.66            -1.3       49.35        perf-profile.children.cycles-pp.notify_change
     50.59            -1.3       49.28        perf-profile.children.cycles-pp.shmem_undo_range
     50.66            -1.3       49.36        perf-profile.children.cycles-pp.ftruncate64
     50.66            -1.3       49.35        perf-profile.children.cycles-pp.do_truncate
     50.66            -1.3       49.36        perf-profile.children.cycles-pp.__x64_sys_ftruncate
     50.65            -1.3       49.35        perf-profile.children.cycles-pp.shmem_setattr
     50.66            -1.3       49.36        perf-profile.children.cycles-pp.do_sys_ftruncate
      0.50 ±  4%      -0.3        0.25 ±  9%  perf-profile.children.cycles-pp.shmem_inode_acct_block
      0.64            -0.2        0.47 ±  7%  perf-profile.children.cycles-pp.lru_add_fn
      0.45 ±  2%      -0.1        0.31 ± 11%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.13 ±  2%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.xas_descend
      0.15 ±  3%      -0.1        0.05 ± 45%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.15 ±  3%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.filemap_get_entry
      0.34            -0.1        0.25 ±  8%  perf-profile.children.cycles-pp.lru_gen_del_folio
      0.35 ±  3%      -0.1        0.26 ±  8%  perf-profile.children.cycles-pp.xas_store
      0.14 ±  3%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.xas_clear_mark
      0.18 ±  4%      -0.1        0.10 ± 10%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      0.11 ±  6%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.shmem_pseudo_vma_init
      0.12 ±  4%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.__cond_resched
      0.13 ±  5%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.20 ±  4%      -0.1        0.12 ± 12%  perf-profile.children.cycles-pp.__dquot_alloc_space
      0.11            -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.file_modified
      0.17 ±  2%      -0.1        0.11 ±  4%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.12 ±  4%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.09 ±  4%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.folio_mark_dirty
      0.13 ±  5%      -0.1        0.08 ± 13%  perf-profile.children.cycles-pp.folio_unlock
      0.26 ±  3%      -0.0        0.21 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock
      0.06 ±  7%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.__folio_throttle_swaprate
      0.10 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.uncharge_folio
      0.09 ±  4%      -0.0        0.06 ± 15%  perf-profile.children.cycles-pp.__folio_cancel_dirty
      0.07            -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.xas_create
      0.06            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.memcg_check_events
      0.06 ±  6%      +0.0        0.09 ± 14%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.05 ±  7%      +0.0        0.09 ± 33%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.18 ±  5%      +0.1        0.23 ± 19%  perf-profile.children.cycles-pp.try_charge_memcg
      0.03 ± 70%      +0.1        0.08 ± 36%  perf-profile.children.cycles-pp.tick_sched_timer
      0.27 ±  2%      +0.1        0.34        perf-profile.children.cycles-pp.record__pushfn
      0.27 ±  3%      +0.1        0.34        perf-profile.children.cycles-pp.writen
      0.01 ±223%      +0.1        0.08 ± 37%  perf-profile.children.cycles-pp.tick_sched_handle
      0.01 ±223%      +0.1        0.08 ± 37%  perf-profile.children.cycles-pp.update_process_times
      0.27 ±  2%      +0.1        0.34        perf-profile.children.cycles-pp.write
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.kthread
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.ret_from_fork
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.14 ±  5%      +0.1        0.22 ± 31%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.25 ±  3%      +0.1        0.33        perf-profile.children.cycles-pp.__x64_sys_write
      0.24 ±  3%      +0.1        0.33        perf-profile.children.cycles-pp.ksys_write
      0.23 ±  4%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.vfs_write
      0.22 ±  3%      +0.1        0.31 ±  3%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.21 ±  3%      +0.1        0.30 ±  4%  perf-profile.children.cycles-pp.generic_perform_write
      0.09 ±  4%      +0.1        0.20 ±  9%  perf-profile.children.cycles-pp.shmem_write_begin
      0.00            +0.2        0.16 ± 12%  perf-profile.children.cycles-pp.__free_one_page
      0.33 ±  7%      +0.2        0.57 ± 36%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.09 ±  7%      +0.3        0.36 ± 13%  perf-profile.children.cycles-pp.__fdget
      0.09 ±  6%      +0.3        0.36 ± 13%  perf-profile.children.cycles-pp.__fget_light
      0.22 ± 10%      +0.3        0.50 ± 40%  perf-profile.children.cycles-pp.uncharge_batch
     99.35            +0.3       99.64        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.25            +0.3       99.60        perf-profile.children.cycles-pp.x64_sys_call
      0.40 ±  3%      +0.5        0.86 ±  5%  perf-profile.children.cycles-pp.find_lock_entries
     99.14            +0.5       99.62        perf-profile.children.cycles-pp.do_syscall_64
      0.17 ±  4%      +0.5        0.66 ± 67%  perf-profile.children.cycles-pp.free_unref_page_list
      0.62 ±  3%      +0.5        1.16 ± 61%  perf-profile.children.cycles-pp.__folio_alloc
      0.08 ± 10%      +0.6        0.63 ± 70%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.58 ±  3%      +0.6        1.15 ± 62%  perf-profile.children.cycles-pp.__alloc_pages
      0.00            +0.6        0.58 ± 77%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.24 ±  6%      +0.6        0.88 ± 78%  perf-profile.children.cycles-pp.rmqueue
      0.03 ±100%      +0.6        0.66 ±101%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.40 ±  3%      +0.7        1.07 ± 66%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.07 ±  5%      +0.9        0.93 ± 18%  perf-profile.children.cycles-pp.filemap_free_folio
     47.18            +0.9       48.10        perf-profile.children.cycles-pp.shmem_get_folio_gfp
     48.70            +1.3       49.97        perf-profile.children.cycles-pp.fallocate64
      0.00            +1.5        1.46 ± 31%  perf-profile.children.cycles-pp.propagate_protected_usage
     47.96            +1.5       49.44        perf-profile.children.cycles-pp.vfs_fallocate
     47.65            +1.6       49.25        perf-profile.children.cycles-pp.shmem_fallocate
     48.08            +1.7       49.80        perf-profile.children.cycles-pp.__x64_sys_fallocate
      0.18 ± 11%     +30.2       30.37 ±  5%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.82 ±  2%     +30.3       31.10 ±  5%  perf-profile.children.cycles-pp.__filemap_remove_folio
      0.43 ±  2%     +30.4       30.78 ±  5%  perf-profile.children.cycles-pp.filemap_unaccount_folio
      0.00           +30.6       30.59 ±  5%  perf-profile.children.cycles-pp.page_counter_charge
      1.60           +31.1       32.68 ±  5%  perf-profile.children.cycles-pp.shmem_add_to_page_cache
      1.29 ±  3%     +31.1       32.44 ±  5%  perf-profile.children.cycles-pp.truncate_inode_folio
      0.98 ±  2%     +31.3       32.26 ±  5%  perf-profile.children.cycles-pp.filemap_remove_folio
      0.79 ±  2%     +61.0       61.75 ±  5%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.49 ±  2%     +61.1       61.57 ±  5%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.84 ±  2%     +61.2       62.08 ±  5%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
     90.13           -62.0       28.16 ± 14%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.17 ±  4%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.shmem_fallocate
      0.15 ±  2%      -0.1        0.04 ± 45%  perf-profile.self.cycles-pp.fallocate64
      0.32 ±  2%      -0.1        0.22 ±  2%  perf-profile.self.cycles-pp.release_pages
      0.18 ±  3%      -0.1        0.09 ±  6%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.15 ±  4%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.__alloc_pages
      0.11 ±  6%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.vma_alloc_folio
      0.12 ±  4%      -0.1        0.04 ± 45%  perf-profile.self.cycles-pp.xas_clear_mark
      0.10 ±  4%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.__dquot_alloc_space
      0.14 ±  4%      -0.1        0.07 ±  9%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.21 ±  4%      -0.1        0.14 ±  9%  perf-profile.self.cycles-pp.xas_store
      0.11 ±  6%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.12 ±  6%      -0.1        0.07 ± 19%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.12 ±  4%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.12 ±  6%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.folio_unlock
      0.17            -0.0        0.13 ±  5%  perf-profile.self.cycles-pp.lru_add_fn
      0.09            -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.uncharge_folio
      0.08 ±  5%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.charge_memcg
      0.07            -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.__folio_cancel_dirty
      0.12 ±  3%      +0.0        0.14 ±  8%  perf-profile.self.cycles-pp.try_charge_memcg
      0.06 ±  7%      +0.0        0.09 ± 10%  perf-profile.self.cycles-pp.xas_find_conflict
      0.06 ±  9%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.free_unref_page_commit
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.filemap_unaccount_folio
      0.06 ±  6%      +0.1        0.11 ±  6%  perf-profile.self.cycles-pp.__filemap_remove_folio
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.memcg_check_events
      0.30            +0.1        0.37 ±  8%  perf-profile.self.cycles-pp.shmem_add_to_page_cache
      0.00            +0.1        0.07 ± 20%  perf-profile.self.cycles-pp.down_write
      0.02 ±142%      +0.1        0.14 ± 11%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.00            +0.2        0.16 ± 10%  perf-profile.self.cycles-pp.__free_one_page
      0.09 ±  5%      +0.3        0.35 ± 13%  perf-profile.self.cycles-pp.__fget_light
      0.34 ±  3%      +0.5        0.84 ±  5%  perf-profile.self.cycles-pp.find_lock_entries
      0.07 ±  5%      +0.9        0.92 ± 19%  perf-profile.self.cycles-pp.filemap_free_folio
      0.07 ±  6%      +1.0        1.09 ± 16%  perf-profile.self.cycles-pp.folio_add_lru
      0.00            +1.5        1.45 ± 31%  perf-profile.self.cycles-pp.propagate_protected_usage
      0.17 ± 12%     +29.6       29.81 ±  5%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.00           +30.1       30.12 ±  5%  perf-profile.self.cycles-pp.page_counter_charge


***************************************************************************************************
lkp-emr-2sp1: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-oc_stream_base_config/debian-12-x86_64-20240206.cgz/300s/256G/lkp-emr-2sp1/lru-shm-rand/vm-scalability

commit: 
  56d80c4ea2 ("rue/mm: add memory cgroup async page reclaim mechanism")
  75ad2bae3d ("rue/mm: pagecache limit per cgroup support")

56d80c4ea2ec7c26 75ad2bae3d3bec7c6597f2688ea 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   2000893 ±  5%     +20.3%    2407839 ±  2%  cpuidle..usage
      3.86 ±  8%      +5.0        8.86 ± 11%  mpstat.cpu.all.sys%
    116951 ±  6%     -27.0%      85343 ± 31%  numa-numastat.node1.other_node
      5099 ±  7%     +12.9%       5756 ±  7%  numa-vmstat.node0.nr_page_table_pages
    116951 ±  6%     -27.0%      85342 ± 31%  numa-vmstat.node1.numa_other
    110410           -17.8%      90736 ±  2%  vm-scalability.median
      0.23 ± 22%      +4.9        5.17 ±  3%  vm-scalability.median_stddev%
      0.20 ± 42%      +5.2        5.37        vm-scalability.stddev%
  28428947           -18.0%   23300140 ±  2%  vm-scalability.throughput
     64043 ±  3%     +16.2%      74390 ±  4%  vm-scalability.time.involuntary_context_switches
      1284          +186.9%       3685 ±  4%  vm-scalability.time.system_time
    276.97 ±  8%     +33.0%     368.32 ±  4%  perf-stat.i.cycles-between-cache-misses
      1.30 ±  9%     -34.3%       0.86 ± 11%  perf-stat.i.major-faults
      0.16            +0.0        0.17        perf-stat.overall.branch-miss-rate%
     62.55            +1.6       64.13        perf-stat.overall.cache-miss-rate%
      2.08           +21.8%       2.53        perf-stat.overall.cpi
    216.70           +23.2%     266.97        perf-stat.overall.cycles-between-cache-misses
      0.48           -17.9%       0.39        perf-stat.overall.ipc
      1.32 ± 10%     -34.4%       0.87 ± 12%  perf-stat.ps.major-faults
     14.59 ± 71%     -10.6        4.00 ±223%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     14.58 ± 71%     -10.6        4.00 ±223%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.99 ± 98%      -6.0        2.99 ±223%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.98 ± 98%      -6.0        2.99 ±223%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.98 ± 98%      -6.0        2.99 ±223%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.92 ± 98%      -5.9        2.99 ±223%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      8.92 ± 98%      -5.9        2.99 ±223%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      8.92 ± 98%      -5.9        2.99 ±223%  perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
      8.92 ± 98%      -5.9        2.99 ±223%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      8.67 ± 98%      -5.9        2.77 ±223%  perf-profile.calltrace.cycles-pp.task_work_run.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      8.66 ± 99%      -5.9        2.77 ±223%  perf-profile.calltrace.cycles-pp.____fput.task_work_run.do_exit.do_group_exit.get_signal
      8.66 ± 99%      -5.9        2.77 ±223%  perf-profile.calltrace.cycles-pp.__fput.____fput.task_work_run.do_exit.do_group_exit
      8.48 ± 99%      -5.8        2.71 ±223%  perf-profile.calltrace.cycles-pp.perf_event_release_kernel.perf_release.__fput.____fput.task_work_run
      8.49 ± 99%      -5.7        2.74 ±223%  perf-profile.calltrace.cycles-pp.perf_release.__fput.____fput.task_work_run.do_exit
      7.52 ±101%      -5.2        2.35 ±223%  perf-profile.calltrace.cycles-pp.event_function_call.perf_remove_from_context.perf_event_release_kernel.perf_release.__fput
      7.52 ±101%      -5.2        2.35 ±223%  perf-profile.calltrace.cycles-pp.perf_remove_from_context.perf_event_release_kernel.perf_release.__fput.____fput
      7.50 ±101%      -5.2        2.35 ±223%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_remove_from_context.perf_event_release_kernel.perf_release
      5.50 ± 86%      -4.5        1.01 ±223%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.34 ± 74%      -2.3        2.04 ±223%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      4.34 ± 74%      -2.3        2.04 ±223%  perf-profile.calltrace.cycles-pp.main
      4.34 ± 74%      -2.3        2.04 ±223%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
      9.07 ± 93%      -6.2        2.82 ±223%  perf-profile.children.cycles-pp.__fput
      9.21 ± 96%      -6.2        3.02 ±223%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      8.92 ± 95%      -6.1        2.82 ±223%  perf-profile.children.cycles-pp.task_work_run
      8.82 ± 96%      -6.0        2.82 ±223%  perf-profile.children.cycles-pp.____fput
      8.98 ± 98%      -6.0        2.99 ±223%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      8.92 ± 98%      -5.9        2.99 ±223%  perf-profile.children.cycles-pp.get_signal
      8.48 ± 99%      -5.8        2.71 ±223%  perf-profile.children.cycles-pp.perf_event_release_kernel
      8.49 ± 99%      -5.7        2.74 ±223%  perf-profile.children.cycles-pp.perf_release
      7.53 ±101%      -5.2        2.35 ±223%  perf-profile.children.cycles-pp.event_function_call
      7.52 ±101%      -5.2        2.35 ±223%  perf-profile.children.cycles-pp.perf_remove_from_context
      7.52 ±101%      -5.2        2.35 ±223%  perf-profile.children.cycles-pp.smp_call_function_single
      3.02 ± 66%      -2.4        0.63 ±205%  perf-profile.children.cycles-pp.do_sys_openat2
      3.00 ± 65%      -2.3        0.66 ±206%  perf-profile.children.cycles-pp.__x64_sys_openat
      2.70 ± 65%      -2.1        0.60 ±205%  perf-profile.children.cycles-pp.path_openat
      1.19 ± 75%      -1.0        0.16 ±190%  perf-profile.children.cycles-pp.setlocale
      1.10 ±104%      -1.0        0.14 ±176%  perf-profile.children.cycles-pp.alloc_bprm
      1.04 ±104%      -0.9        0.11 ±164%  perf-profile.children.cycles-pp.mm_alloc
      0.58 ± 98%      -0.5        0.10 ±121%  perf-profile.children.cycles-pp.tick_irq_enter
      0.44 ± 48%      -0.3        0.13 ±140%  perf-profile.children.cycles-pp.idle_cpu
      0.33 ± 54%      -0.2        0.10 ±123%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.21 ± 18%      -0.1        0.08 ± 79%  perf-profile.children.cycles-pp.trigger_load_balance
      0.71 ±148%      +4.8        5.52 ± 82%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.69 ±166%      +5.0        5.71 ± 82%  perf-profile.children.cycles-pp.__mod_lruvec_state
      7.44 ±101%      -5.2        2.26 ±223%  perf-profile.self.cycles-pp.smp_call_function_single



***************************************************************************************************
lkp-emr-2sp1: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-oc_stream_base_config/debian-12-x86_64-20240206.cgz/300s/1T/lkp-emr-2sp1/lru-shm/vm-scalability

commit: 
  56d80c4ea2 ("rue/mm: add memory cgroup async page reclaim mechanism")
  75ad2bae3d ("rue/mm: pagecache limit per cgroup support")

56d80c4ea2ec7c26 75ad2bae3d3bec7c6597f2688ea 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 5.745e+10           +13.7%   6.53e+10        cpuidle..time
   6440626 ±  2%     +16.3%    7489100 ±  5%  cpuidle..usage
    284.47           +22.1%     347.36        uptime.boot
     65710           +12.1%      73663        uptime.idle
     91.86            -9.5%      83.16        vmstat.cpu.id
     23.15           +95.5%      45.27 ±  4%  vmstat.procs.r
     55839 ±  9%     +44.4%      80625 ±  7%  vmstat.system.in
      0.01 ±  5%      -0.0        0.00 ± 23%  mpstat.cpu.all.soft%
      6.13            +8.9       15.06 ±  5%  mpstat.cpu.all.sys%
      2.01            -0.2        1.82 ±  5%  mpstat.cpu.all.usr%
    169.17 ± 39%     -98.1%       3.17 ± 11%  mpstat.max_utilization.seconds
     53.51 ±  3%     +77.8%      95.12        mpstat.max_utilization_pct
 2.653e+08           -13.2%  2.303e+08 ±  6%  numa-numastat.node0.local_node
 2.674e+08           -13.6%  2.311e+08 ±  6%  numa-numastat.node0.numa_hit
 2.686e+08            -8.9%  2.447e+08 ±  4%  numa-numastat.node1.local_node
   2.7e+08            -9.1%  2.454e+08 ±  4%  numa-numastat.node1.numa_hit
 2.653e+08 ±  2%     -10.3%  2.379e+08 ±  6%  numa-numastat.node2.local_node
 2.675e+08 ±  2%     -11.0%  2.381e+08 ±  6%  numa-numastat.node2.numa_hit
      3017 ± 13%    +151.5%       7589 ± 13%  sched_debug.cfs_rq:/.avg_vruntime.avg
     18327 ± 20%     +35.8%      24888 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.max
      1301 ± 20%    +336.5%       5680 ± 13%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.47 ± 14%     -19.6%       0.38 ± 12%  sched_debug.cfs_rq:/.h_nr_running.max
    492248 ± 14%     -19.6%     395748 ± 12%  sched_debug.cfs_rq:/.load.max
      3017 ± 13%    +151.5%       7589 ± 13%  sched_debug.cfs_rq:/.min_vruntime.avg
     18327 ± 20%     +35.8%      24888 ±  8%  sched_debug.cfs_rq:/.min_vruntime.max
      1301 ± 20%    +336.5%       5680 ± 13%  sched_debug.cfs_rq:/.min_vruntime.min
      0.47 ± 14%     -19.6%       0.38 ± 12%  sched_debug.cfs_rq:/.nr_running.max
  66953938            +8.6%   72740294 ±  4%  meminfo.Active
  66953938            +8.6%   72740294 ±  4%  meminfo.Active(anon)
  69880744            +8.6%   75878704 ±  4%  meminfo.Cached
  67545951            +8.8%   73509579 ±  4%  meminfo.Committed_AS
    253683 ±  5%     +83.3%     464906 ± 14%  meminfo.Inactive
    252337 ±  5%     +83.7%     463555 ± 14%  meminfo.Inactive(anon)
   4678745 ±  2%    +117.5%   10174968 ±  5%  meminfo.Mapped
  73659742            +7.9%   79452605 ±  4%  meminfo.Memused
     13352           +59.7%      21317 ±  5%  meminfo.PageTables
  66557425            +9.0%   72555110 ±  4%  meminfo.Shmem
      0.01           +32.6%       0.01        vm-scalability.free_time
   1123596           -68.3%     355860        vm-scalability.median
      1.99 ± 49%      +5.9        7.85 ±  4%  vm-scalability.median_stddev%
      2.03 ± 50%      +6.0        8.02 ±  4%  vm-scalability.stddev%
  2.81e+08           -66.9%   93027092        vm-scalability.throughput
    242.02           +26.0%     305.04        vm-scalability.time.elapsed_time
    242.02           +26.0%     305.04        vm-scalability.time.elapsed_time.max
     29180           +55.0%      45238 ±  7%  vm-scalability.time.involuntary_context_switches
      1956          +114.5%       4198 ±  5%  vm-scalability.time.percent_of_cpu_this_job_got
      3525          +224.3%      11435 ±  6%  vm-scalability.time.system_time
      1211           +13.6%       1376 ±  6%  vm-scalability.time.user_time
 4.742e+09            -8.9%  4.322e+09 ±  6%  vm-scalability.workload
  16749163            +8.7%   18200839 ±  4%  proc-vmstat.nr_active_anon
   4713359            -3.1%    4568219        proc-vmstat.nr_dirty_background_threshold
  18876485            -3.1%   18295218        proc-vmstat.nr_dirty_threshold
  17481073            +8.6%   18985620 ±  4%  proc-vmstat.nr_file_pages
  47434366            -3.1%   45981085        proc-vmstat.nr_free_pages
     62985 ±  5%     +83.8%     115790 ± 14%  proc-vmstat.nr_inactive_anon
     41711            +1.4%      42308        proc-vmstat.nr_kernel_stack
   1176665          +116.7%    2550052 ±  5%  proc-vmstat.nr_mapped
      3358           +60.7%       5396 ±  4%  proc-vmstat.nr_page_table_pages
  16649997            +9.0%   18154481 ±  4%  proc-vmstat.nr_shmem
  16749162            +8.7%   18200838 ±  4%  proc-vmstat.nr_zone_active_anon
     62985 ±  5%     +83.8%     115790 ± 14%  proc-vmstat.nr_zone_inactive_anon
 1.074e+09            -9.5%  9.719e+08 ±  6%  proc-vmstat.numa_hit
 1.065e+09            -9.0%  9.699e+08 ±  6%  proc-vmstat.numa_local
      7338 ±  2%     +24.9%       9167        proc-vmstat.unevictable_pgs_culled
      0.01 ± 10%   +1117.0%       0.11 ±109%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ± 53%     -82.7%       0.03 ± 32%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
      1.70 ± 50%     -91.4%       0.15 ± 81%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      0.19 ± 45%     -59.7%       0.08 ± 47%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
      0.01 ± 14%    +512.5%       0.07 ± 85%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.02 ± 16%   +3110.0%       0.48 ±123%  perf-sched.sch_delay.max.ms.__x64_sys_pause.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.22 ± 71%     -92.6%       2.45 ± 65%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.__x64_sys_wait4
     77.47 ± 45%     -79.7%      15.76 ± 97%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.do_poll.constprop.0
      0.03 ± 64%   +4365.2%       1.50 ± 90%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.02 ±103%    +804.9%       0.22 ±166%  perf-sched.sch_delay.max.ms.schedule_timeout.memcg_prio_reclaimd_async.kthread.ret_from_fork
      1267 ±130%     -89.7%     130.42 ±128%  perf-sched.total_sch_delay.max.ms
      2.48 ± 66%     -90.8%       0.23 ± 49%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
      3.34           +83.6%       6.13 ±  9%  perf-sched.wait_and_delay.avg.ms.sigsuspend.__x64_sys_rt_sigsuspend.x64_sys_call.do_syscall_64
    234.33 ± 26%    +259.0%     841.17 ± 28%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.irqentry_exit
    153.33           +43.2%     219.50 ±  8%  perf-sched.wait_and_delay.count.sigsuspend.__x64_sys_rt_sigsuspend.x64_sys_call.do_syscall_64
      1061 ±  5%     +25.1%       1327 ± 10%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     25.86 ± 43%    +149.7%      64.56 ± 44%  perf-sched.wait_and_delay.max.ms.sigsuspend.__x64_sys_rt_sigsuspend.x64_sys_call.do_syscall_64
      3.30           +84.1%       6.08 ± 10%  perf-sched.wait_time.avg.ms.sigsuspend.__x64_sys_rt_sigsuspend.x64_sys_call.do_syscall_64
     25.85 ± 43%    +149.6%      64.53 ± 44%  perf-sched.wait_time.max.ms.sigsuspend.__x64_sys_rt_sigsuspend.x64_sys_call.do_syscall_64
   1177267 ±  2%    +135.9%    2777760 ±  5%  numa-meminfo.node0.Mapped
      3490 ±  9%     +72.0%       6002 ±  5%  numa-meminfo.node0.PageTables
  16792771           +11.9%   18784094 ±  6%  numa-meminfo.node1.Active
  16792771           +11.9%   18784094 ±  6%  numa-meminfo.node1.Active(anon)
  16828204           +14.0%   19183446 ±  5%  numa-meminfo.node1.FilePages
   1156568 ±  2%    +112.1%    2453264 ±  4%  numa-meminfo.node1.Mapped
  17557849           +14.0%   20010606 ±  6%  numa-meminfo.node1.MemUsed
      3082 ± 11%     +59.2%       4908 ±  6%  numa-meminfo.node1.PageTables
  16755992           +11.2%   18627273 ±  5%  numa-meminfo.node1.Shmem
   1175757 ±  4%    +117.5%    2557242 ±  7%  numa-meminfo.node2.Mapped
      3656 ± 10%     +40.1%       5120 ± 10%  numa-meminfo.node2.PageTables
  16579190 ±  2%     +20.4%   19964582 ±  3%  numa-meminfo.node3.Active
  16579190 ±  2%     +20.4%   19964582 ±  3%  numa-meminfo.node3.Active(anon)
  16736753           +20.8%   20215245 ±  3%  numa-meminfo.node3.FilePages
    147628 ± 39%    +173.9%     404340 ±  6%  numa-meminfo.node3.Inactive
    147180 ± 38%    +174.4%     403838 ±  6%  numa-meminfo.node3.Inactive(anon)
   1175181 ±  2%    +103.0%    2386204 ±  7%  numa-meminfo.node3.Mapped
  17567957           +19.6%   21013454 ±  3%  numa-meminfo.node3.MemUsed
      3160 ± 13%     +71.6%       5423 ±  5%  numa-meminfo.node3.PageTables
  16615727           +21.6%   20203525 ±  3%  numa-meminfo.node3.Shmem
    296995 ±  2%    +132.6%     690671 ±  5%  numa-vmstat.node0.nr_mapped
    873.63 ±  8%     +70.8%       1491 ±  6%  numa-vmstat.node0.nr_page_table_pages
 2.674e+08           -13.6%  2.311e+08 ±  6%  numa-vmstat.node0.numa_hit
 2.653e+08           -13.2%  2.303e+08 ±  6%  numa-vmstat.node0.numa_local
   4202098           +11.8%    4696571 ±  6%  numa-vmstat.node1.nr_active_anon
   4210951           +13.9%    4796395 ±  5%  numa-vmstat.node1.nr_file_pages
    292081 ±  2%    +108.4%     608719 ±  3%  numa-vmstat.node1.nr_mapped
    774.49 ± 11%     +58.3%       1225 ±  6%  numa-vmstat.node1.nr_page_table_pages
   4192900           +11.1%    4657354 ±  5%  numa-vmstat.node1.nr_shmem
   4201986           +11.8%    4696443 ±  6%  numa-vmstat.node1.nr_zone_active_anon
   2.7e+08            -9.1%  2.454e+08 ±  4%  numa-vmstat.node1.numa_hit
 2.686e+08            -8.9%  2.447e+08 ±  4%  numa-vmstat.node1.numa_local
    294336 ±  3%    +114.8%     632357 ±  7%  numa-vmstat.node2.nr_mapped
    914.55 ± 10%     +38.8%       1269 ±  9%  numa-vmstat.node2.nr_page_table_pages
 2.675e+08 ±  2%     -11.0%  2.381e+08 ±  6%  numa-vmstat.node2.numa_hit
 2.653e+08 ±  2%     -10.3%  2.379e+08 ±  6%  numa-vmstat.node2.numa_local
   4149196 ±  2%     +20.4%    4994793 ±  3%  numa-vmstat.node3.nr_active_anon
   4188558           +20.7%    5057509 ±  3%  numa-vmstat.node3.nr_file_pages
     36771 ± 39%    +174.7%     101016 ±  6%  numa-vmstat.node3.nr_inactive_anon
    296273 ±  2%    +102.2%     599001 ±  6%  numa-vmstat.node3.nr_mapped
    796.55 ± 14%     +70.2%       1355 ±  5%  numa-vmstat.node3.nr_page_table_pages
   4158301           +21.6%    5054581 ±  3%  numa-vmstat.node3.nr_shmem
   4149118 ±  2%     +20.4%    4994651 ±  3%  numa-vmstat.node3.nr_zone_active_anon
     36771 ± 39%    +174.7%     101016 ±  6%  numa-vmstat.node3.nr_zone_inactive_anon
 2.972e+10           -27.1%  2.167e+10 ±  5%  perf-stat.i.branch-instructions
      0.32 ±  3%      -0.0        0.29 ±  5%  perf-stat.i.branch-miss-rate%
  26939895 ±  2%     -22.7%   20817001 ±  3%  perf-stat.i.branch-misses
 1.294e+08 ±  2%     -36.5%   82103474 ±  8%  perf-stat.i.cache-misses
 3.641e+08           -48.3%  1.883e+08 ±  7%  perf-stat.i.cache-references
      6693            -3.8%       6440 ±  2%  perf-stat.i.context-switches
      0.87 ±  2%     +56.0%       1.36 ±  7%  perf-stat.i.cpi
  6.53e+10           +94.2%  1.268e+11 ±  5%  perf-stat.i.cpu-cycles
    502.22           -11.6%     443.80 ±  2%  perf-stat.i.cpu-migrations
    428.84 ± 10%    +105.1%     879.72 ±  3%  perf-stat.i.cycles-between-cache-misses
 1.112e+11           -26.7%  8.152e+10 ±  5%  perf-stat.i.instructions
      1.28           -30.8%       0.89 ±  2%  perf-stat.i.ipc
      2.11 ±  6%     -37.9%       1.31 ±  8%  perf-stat.i.major-faults
     32.85           -28.0%      23.64 ±  5%  perf-stat.i.metric.K/sec
   4230917           -28.1%    3040077 ±  5%  perf-stat.i.minor-faults
   4230919           -28.1%    3040078 ±  5%  perf-stat.i.page-faults
      1.16 ±  3%     -14.2%       0.99 ±  3%  perf-stat.overall.MPKI
      0.09            +0.0        0.09 ±  2%  perf-stat.overall.branch-miss-rate%
     35.48 ±  3%      +8.1       43.58 ±  6%  perf-stat.overall.cache-miss-rate%
      0.59          +166.4%       1.56        perf-stat.overall.cpi
    506.47 ±  3%    +210.7%       1573 ±  4%  perf-stat.overall.cycles-between-cache-misses
      1.71           -62.5%       0.64        perf-stat.overall.ipc
      5853            +1.9%       5964        perf-stat.overall.path-length
 3.042e+10           -26.5%  2.235e+10 ±  5%  perf-stat.ps.branch-instructions
  27087627 ±  2%     -22.5%   20987737 ±  3%  perf-stat.ps.branch-misses
 1.317e+08 ±  2%     -36.6%   83563668 ±  8%  perf-stat.ps.cache-misses
 3.713e+08           -48.3%   1.92e+08 ±  7%  perf-stat.ps.cache-references
      6718            -3.9%       6455 ±  2%  perf-stat.ps.context-switches
 6.665e+10           +96.7%  1.311e+11 ±  5%  perf-stat.ps.cpu-cycles
    504.74           -11.6%     446.32 ±  2%  perf-stat.ps.cpu-migrations
 1.137e+11           -26.2%  8.394e+10 ±  5%  perf-stat.ps.instructions
      2.12 ±  6%     -37.7%       1.32 ±  8%  perf-stat.ps.major-faults
   4339757           -27.5%    3146089 ±  5%  perf-stat.ps.minor-faults
   4339759           -27.5%    3146090 ±  5%  perf-stat.ps.page-faults
     13.01 ±  6%      -6.9        6.10        perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_fault.handle_pte_fault.__handle_mm_fault
     13.11 ±  5%      -6.4        6.73        perf-profile.calltrace.cycles-pp.do_rw_once
      7.85 ±  5%      -4.2        3.69        perf-profile.calltrace.cycles-pp.next_uptodate_folio.filemap_map_pages.do_read_fault.do_fault.handle_pte_fault
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_unlinkat.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlinkat.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.evict.iput.do_unlinkat.__x64_sys_unlinkat.x64_sys_call
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.iput.do_unlinkat.__x64_sys_unlinkat.x64_sys_call.do_syscall_64
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.shmem_evict_inode.evict.iput.do_unlinkat.__x64_sys_unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      5.17 ± 29%      -3.6        1.60 ± 21%  perf-profile.calltrace.cycles-pp.shmem_undo_range.shmem_evict_inode.evict.iput.do_unlinkat
      5.82 ± 24%      -3.1        2.67        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      5.82 ± 24%      -3.1        2.67        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      5.82 ± 24%      -3.1        2.67        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      5.74 ± 24%      -3.1        2.63        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.73 ± 24%      -3.1        2.63        perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.71 ± 24%      -3.1        2.62        perf-profile.calltrace.cycles-pp.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread.ret_from_fork
      5.71 ± 24%      -3.1        2.62        perf-profile.calltrace.cycles-pp.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      5.55 ± 24%      -3.0        2.50        perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
      5.56 ± 24%      -3.0        2.52        perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread
      5.55 ± 24%      -3.0        2.50        perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail
      5.48 ± 25%      -3.0        2.47        perf-profile.calltrace.cycles-pp.memcpy_toio.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.write
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_write.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.ksys_write.__x64_sys_write.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      4.30 ± 36%      -2.4        1.91 ±  6%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.__x64_sys_write.x64_sys_call.do_syscall_64
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.calltrace.cycles-pp.devkmsg_write.vfs_write.ksys_write.__x64_sys_write.x64_sys_call
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.calltrace.cycles-pp.devkmsg_emit.devkmsg_write.vfs_write.ksys_write.__x64_sys_write
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.calltrace.cycles-pp.vprintk_emit.devkmsg_emit.devkmsg_write.vfs_write.ksys_write
      4.26 ± 36%      -2.4        1.89 ±  7%  perf-profile.calltrace.cycles-pp.console_flush_all.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write
      4.26 ± 36%      -2.4        1.89 ±  7%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write.vfs_write
      3.89 ± 37%      -2.2        1.72 ±  8%  perf-profile.calltrace.cycles-pp.univ8250_console_write.console_flush_all.console_unlock.vprintk_emit.devkmsg_emit
      3.86 ± 37%      -2.1        1.72 ±  8%  perf-profile.calltrace.cycles-pp.serial8250_console_write.univ8250_console_write.console_flush_all.console_unlock.vprintk_emit
      3.62 ±  5%      -1.9        1.71 ±  3%  perf-profile.calltrace.cycles-pp.folio_add_lru.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault
      3.59 ±  5%      -1.9        1.70 ±  3%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp.shmem_fault.__do_fault
      2.26 ± 30%      -1.6        0.66 ± 21%  perf-profile.calltrace.cycles-pp.__folio_batch_release.shmem_undo_range.shmem_evict_inode.evict.iput
      2.24 ± 30%      -1.6        0.65 ± 21%  perf-profile.calltrace.cycles-pp.release_pages.__folio_batch_release.shmem_undo_range.shmem_evict_inode.evict
      2.08 ± 29%      -1.4        0.71 ± 21%  perf-profile.calltrace.cycles-pp.truncate_inode_folio.shmem_undo_range.shmem_evict_inode.evict.iput
      2.34 ±  5%      -1.3        1.02        perf-profile.calltrace.cycles-pp.sync_regs.do_access
      1.71 ± 29%      -1.1        0.62 ± 21%  perf-profile.calltrace.cycles-pp.filemap_remove_folio.truncate_inode_folio.shmem_undo_range.shmem_evict_inode.evict
      1.89 ±  5%      -1.1        0.82 ±  5%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp.shmem_fault
      1.88 ±  5%      -1.1        0.82 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp
      1.76 ±  4%      -1.0        0.77 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru
      1.31 ± 16%      -0.8        0.54        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      1.40 ± 37%      -0.8        0.64 ±  7%  perf-profile.calltrace.cycles-pp.io_serial_out.serial8250_console_write.univ8250_console_write.console_flush_all.console_unlock
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.__munmap
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.x64_sys_call
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.x64_sys_call.do_syscall_64
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      1.38 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      1.36 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region.do_vmi_align_munmap
      1.36 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.unmap_single_vma.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      1.36 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      1.36 ±  5%      -0.7        0.69        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region
      1.22 ±  6%      -0.6        0.61 ±  2%  perf-profile.calltrace.cycles-pp.lru_add_fn.folio_batch_move_lru.folio_add_lru.shmem_get_folio_gfp.shmem_fault
      1.16 ±  6%      -0.6        0.56        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_single_vma.unmap_vmas
      1.41 ±  5%      -0.5        0.92        perf-profile.calltrace.cycles-pp.finish_fault.do_read_fault.do_fault.handle_pte_fault.__handle_mm_fault
      0.91 ±  4%      -0.5        0.42 ± 44%  perf-profile.calltrace.cycles-pp.set_pte_range.finish_fault.do_read_fault.do_fault.handle_pte_fault
      0.86 ±  5%      -0.2        0.65        perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fault.__do_fault
      0.91 ±  4%      -0.1        0.80        perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.__folio_alloc
      2.70 ±  5%      +0.2        2.90 ±  2%  perf-profile.calltrace.cycles-pp.vma_alloc_folio.shmem_alloc_folio.shmem_alloc_and_acct_folio.shmem_get_folio_gfp.shmem_fault
      1.50 ±  4%      +0.2        1.72 ±  3%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_alloc_folio
      2.37 ±  5%      +0.4        2.74 ±  2%  perf-profile.calltrace.cycles-pp.__folio_alloc.vma_alloc_folio.shmem_alloc_folio.shmem_alloc_and_acct_folio.shmem_get_folio_gfp
      2.31 ±  5%      +0.4        2.70 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio.shmem_alloc_and_acct_folio
      1.98 ±  5%      +0.5        2.50 ±  2%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.08 ±223%      +0.6        0.68        perf-profile.calltrace.cycles-pp.__dquot_alloc_space.shmem_inode_acct_block.shmem_alloc_and_acct_folio.shmem_get_folio_gfp.shmem_fault
      0.00            +0.9        0.92 ±  3%  perf-profile.calltrace.cycles-pp.folio_add_lru.shmem_fault.__do_fault.do_read_fault.do_fault
     73.94 ±  5%     +14.0       87.91        perf-profile.calltrace.cycles-pp.do_access
     60.50 ±  5%     +21.4       81.91        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     51.86 ±  5%     +26.3       78.21        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     51.29 ±  5%     +26.6       77.87        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     49.30 ±  5%     +27.1       76.42        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     48.15 ±  5%     +27.6       75.78        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     47.26 ±  5%     +28.1       75.31        perf-profile.calltrace.cycles-pp.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     46.87 ±  5%     +28.3       75.12        perf-profile.calltrace.cycles-pp.do_fault.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     46.47 ±  5%     +28.4       74.88        perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.handle_pte_fault.__handle_mm_fault.handle_mm_fault
     29.04 ±  5%     +35.9       64.99        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault.do_fault
     31.43 ±  5%     +36.1       67.57        perf-profile.calltrace.cycles-pp.__do_fault.do_read_fault.do_fault.handle_pte_fault.__handle_mm_fault
     31.38 ±  5%     +36.2       67.54        perf-profile.calltrace.cycles-pp.shmem_fault.__do_fault.do_read_fault.do_fault.handle_pte_fault
      3.03 ±  5%     +43.2       46.23        perf-profile.calltrace.cycles-pp.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault
      0.00           +43.4       43.41        perf-profile.calltrace.cycles-pp.page_counter_charge.__mod_memcg_lruvec_state.__mod_lruvec_state.__mod_lruvec_page_state.shmem_add_to_page_cache
      0.91 ±  5%     +43.6       44.47        perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fault.__do_fault
      0.00           +44.0       44.00        perf-profile.calltrace.cycles-pp.__mod_memcg_lruvec_state.__mod_lruvec_state.__mod_lruvec_page_state.shmem_add_to_page_cache.shmem_get_folio_gfp
      0.00           +44.1       44.12        perf-profile.calltrace.cycles-pp.__mod_lruvec_state.__mod_lruvec_page_state.shmem_add_to_page_cache.shmem_get_folio_gfp.shmem_fault
     18.52 ±  5%     -10.0        8.56        perf-profile.children.cycles-pp.do_rw_once
     13.36 ±  6%      -7.1        6.26        perf-profile.children.cycles-pp.filemap_map_pages
     11.96 ± 25%      -7.0        5.01 ±  8%  perf-profile.children.cycles-pp.do_syscall_64
     11.96 ± 25%      -6.9        5.01 ±  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     11.93 ± 25%      -6.9        4.99 ±  8%  perf-profile.children.cycles-pp.x64_sys_call
      8.30 ±  5%      -4.4        3.88        perf-profile.children.cycles-pp.next_uptodate_folio
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.children.cycles-pp.__x64_sys_unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.children.cycles-pp.do_unlinkat
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.children.cycles-pp.shmem_evict_inode
      5.25 ± 29%      -3.6        1.62 ± 21%  perf-profile.children.cycles-pp.unlinkat
      5.26 ± 29%      -3.6        1.63 ± 21%  perf-profile.children.cycles-pp.iput
      5.25 ± 29%      -3.6        1.63 ± 21%  perf-profile.children.cycles-pp.evict
      5.18 ± 29%      -3.6        1.60 ± 21%  perf-profile.children.cycles-pp.shmem_undo_range
      5.83 ± 24%      -3.1        2.68        perf-profile.children.cycles-pp.ret_from_fork
      5.83 ± 24%      -3.1        2.68        perf-profile.children.cycles-pp.ret_from_fork_asm
      5.82 ± 24%      -3.1        2.67        perf-profile.children.cycles-pp.kthread
      5.74 ± 24%      -3.1        2.63        perf-profile.children.cycles-pp.worker_thread
      5.73 ± 24%      -3.1        2.63        perf-profile.children.cycles-pp.process_one_work
      5.71 ± 24%      -3.1        2.62        perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      5.71 ± 24%      -3.1        2.62        perf-profile.children.cycles-pp.drm_fbdev_generic_helper_fb_dirty
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      5.55 ± 24%      -3.0        2.50        perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.commit_tail
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.drm_atomic_commit
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.drm_atomic_helper_commit
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail_rpm
      5.56 ± 24%      -3.0        2.52        perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      5.55 ± 24%      -3.0        2.50        perf-profile.children.cycles-pp.drm_fb_memcpy
      5.55 ± 24%      -3.0        2.50        perf-profile.children.cycles-pp.memcpy_toio
      4.29 ± 36%      -2.4        1.91 ±  7%  perf-profile.children.cycles-pp.vprintk_emit
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.children.cycles-pp.console_flush_all
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.children.cycles-pp.console_unlock
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.children.cycles-pp.devkmsg_write
      4.27 ± 36%      -2.4        1.90 ±  7%  perf-profile.children.cycles-pp.devkmsg_emit
      3.90 ± 37%      -2.2        1.74 ±  8%  perf-profile.children.cycles-pp.univ8250_console_write
      3.87 ± 37%      -2.1        1.73 ±  8%  perf-profile.children.cycles-pp.serial8250_console_write
      3.62 ±  5%      -1.9        1.71 ±  3%  perf-profile.children.cycles-pp.folio_batch_move_lru
      2.64 ± 24%      -1.8        0.83 ± 16%  perf-profile.children.cycles-pp.release_pages
      2.27 ± 30%      -1.6        0.66 ± 21%  perf-profile.children.cycles-pp.__folio_batch_release
      2.10 ± 29%      -1.4        0.71 ± 21%  perf-profile.children.cycles-pp.truncate_inode_folio
      2.41 ± 37%      -1.4        1.04 ±  9%  perf-profile.children.cycles-pp.io_serial_in
      2.41 ± 37%      -1.4        1.05 ±  9%  perf-profile.children.cycles-pp.wait_for_lsr
      3.99 ±  5%      -1.4        2.64 ±  2%  perf-profile.children.cycles-pp.folio_add_lru
      2.36 ±  5%      -1.3        1.04        perf-profile.children.cycles-pp.sync_regs
      2.37 ±  5%      -1.2        1.18 ±  2%  perf-profile.children.cycles-pp.native_irq_return_iret
      2.03 ±  5%      -1.1        0.89 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      1.74 ± 29%      -1.1        0.62 ± 20%  perf-profile.children.cycles-pp.filemap_remove_folio
      1.93 ±  4%      -1.1        0.84 ±  5%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      2.20 ±  4%      -1.1        1.11 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.98 ±  4%      -1.0        1.02 ±  5%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      1.50 ± 29%      -0.9        0.56 ± 21%  perf-profile.children.cycles-pp.__filemap_remove_folio
      1.47 ± 36%      -0.8        0.67 ±  6%  perf-profile.children.cycles-pp.io_serial_out
      1.31 ± 16%      -0.8        0.54        perf-profile.children.cycles-pp.cpu_startup_entry
      1.31 ± 16%      -0.8        0.54        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      1.30 ± 16%      -0.8        0.54        perf-profile.children.cycles-pp.do_idle
      1.41 ±  5%      -0.7        0.71        perf-profile.children.cycles-pp.unmap_page_range
      1.41 ±  5%      -0.7        0.71        perf-profile.children.cycles-pp.unmap_single_vma
      1.41 ±  5%      -0.7        0.72        perf-profile.children.cycles-pp.do_vmi_align_munmap
      1.42 ±  5%      -0.7        0.72        perf-profile.children.cycles-pp.do_vmi_munmap
      1.41 ±  5%      -0.7        0.72        perf-profile.children.cycles-pp.unmap_vmas
      1.41 ±  5%      -0.7        0.71        perf-profile.children.cycles-pp.zap_pmd_range
      1.39 ±  5%      -0.7        0.70        perf-profile.children.cycles-pp.__vm_munmap
      1.38 ±  5%      -0.7        0.70        perf-profile.children.cycles-pp.__x64_sys_munmap
      1.39 ±  5%      -0.7        0.70        perf-profile.children.cycles-pp.unmap_region
      1.17 ± 15%      -0.7        0.49        perf-profile.children.cycles-pp.start_secondary
      1.38 ±  5%      -0.7        0.69        perf-profile.children.cycles-pp.__munmap
      1.12 ± 16%      -0.7        0.45 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.25 ±  6%      -0.6        0.60        perf-profile.children.cycles-pp.zap_pte_range
      1.24 ±  6%      -0.6        0.62 ±  2%  perf-profile.children.cycles-pp.lru_add_fn
      1.03 ± 16%      -0.6        0.41        perf-profile.children.cycles-pp.call_cpuidle
      1.02 ± 16%      -0.6        0.41        perf-profile.children.cycles-pp.cpuidle_enter
      0.80 ± 30%      -0.6        0.24 ± 20%  perf-profile.children.cycles-pp.free_unref_page_list
      0.91 ± 16%      -0.6        0.36        perf-profile.children.cycles-pp.cpuidle_enter_state
      0.78 ± 30%      -0.6        0.22 ± 21%  perf-profile.children.cycles-pp.find_lock_entries
      1.21 ± 10%      -0.5        0.66 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.03 ±  3%      -0.5        0.49        perf-profile.children.cycles-pp.xas_find
      1.09 ± 10%      -0.5        0.55 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.47 ±  5%      -0.5        0.95        perf-profile.children.cycles-pp.finish_fault
      0.65 ± 30%      -0.5        0.19 ± 22%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.97 ±  4%      -0.4        0.53 ±  2%  perf-profile.children.cycles-pp.set_pte_range
      0.61 ± 29%      -0.4        0.18 ± 19%  perf-profile.children.cycles-pp.lru_gen_del_folio
      0.87 ±  6%      -0.4        0.44 ±  3%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.58 ± 30%      -0.4        0.17 ± 21%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.87 ±  6%      -0.4        0.46 ±  2%  perf-profile.children.cycles-pp.__perf_sw_event
      0.72 ± 29%      -0.4        0.32 ± 19%  perf-profile.children.cycles-pp.filemap_unaccount_folio
      0.78 ±  8%      -0.4        0.42 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.51 ± 30%      -0.4        0.15 ± 21%  perf-profile.children.cycles-pp.__free_one_page
      0.60 ±  5%      -0.4        0.25 ±  3%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.77 ±  8%      -0.4        0.42 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.69 ±  6%      -0.3        0.34 ±  3%  perf-profile.children.cycles-pp.___perf_sw_event
      0.68 ±  2%      -0.3        0.36 ±  2%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.75 ± 12%      -0.3        0.43 ±  3%  perf-profile.children.cycles-pp.xas_store
      0.69 ±  4%      -0.3        0.37 ±  3%  perf-profile.children.cycles-pp.folio_add_file_rmap_range
      0.63 ±  9%      -0.3        0.33 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.61 ±  9%      -0.3        0.32 ±  4%  perf-profile.children.cycles-pp.tick_sched_timer
      0.55 ±  6%      -0.3        0.27        perf-profile.children.cycles-pp.mtree_range_walk
      0.55 ±  7%      -0.3        0.28 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      0.54 ±  8%      -0.3        0.28 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.49 ±  2%      -0.3        0.23 ±  4%  perf-profile.children.cycles-pp.xas_load
      0.48            -0.2        0.23 ±  3%  perf-profile.children.cycles-pp.xas_descend
      0.42 ±  6%      -0.2        0.19 ±  2%  perf-profile.children.cycles-pp.__pte_offset_map
      0.39 ±  4%      -0.2        0.17 ±  4%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.90 ±  5%      -0.2        0.68 ±  2%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.44 ±  7%      -0.2        0.22 ±  2%  perf-profile.children.cycles-pp.page_remove_rmap
      0.44 ±  7%      -0.2        0.23 ±  5%  perf-profile.children.cycles-pp.scheduler_tick
      0.38 ±  5%      -0.2        0.17 ±  4%  perf-profile.children.cycles-pp.__count_memcg_events
      0.36 ± 56%      -0.2        0.16 ±  4%  perf-profile.children.cycles-pp.con_scroll
      0.36 ± 56%      -0.2        0.16 ±  4%  perf-profile.children.cycles-pp.fbcon_scroll
      0.36 ± 56%      -0.2        0.16 ±  4%  perf-profile.children.cycles-pp.lf
      0.36 ± 56%      -0.2        0.16 ±  4%  perf-profile.children.cycles-pp.vt_console_print
      0.72 ±  5%      -0.2        0.52 ±  3%  perf-profile.children.cycles-pp.charge_memcg
      0.35 ± 57%      -0.2        0.16 ±  4%  perf-profile.children.cycles-pp.fbcon_redraw
      0.32 ± 18%      -0.2        0.13        perf-profile.children.cycles-pp.intel_idle_xstate
      0.36 ± 35%      -0.2        0.17 ± 12%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.33 ± 57%      -0.2        0.14 ±  6%  perf-profile.children.cycles-pp.fbcon_putcs
      0.32 ± 58%      -0.2        0.14 ±  4%  perf-profile.children.cycles-pp.bit_putcs
      0.23 ± 29%      -0.2        0.06 ± 21%  perf-profile.children.cycles-pp.xas_clear_mark
      0.41 ±  5%      -0.2        0.24 ±  6%  perf-profile.children.cycles-pp.mas_walk
      0.38 ±  6%      -0.2        0.22 ±  5%  perf-profile.children.cycles-pp.bprm_execve
      0.28 ± 13%      -0.2        0.12 ±  5%  perf-profile.children.cycles-pp.handle_softirqs
      0.27 ± 15%      -0.2        0.12 ±  6%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.28 ± 14%      -0.2        0.12 ±  5%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.27 ± 57%      -0.1        0.12 ±  9%  perf-profile.children.cycles-pp.drm_fbdev_generic_defio_imageblit
      0.53 ±  7%      -0.1        0.38 ±  3%  perf-profile.children.cycles-pp.lock_mm_and_find_vma
      0.35 ±  6%      -0.1        0.20 ±  2%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.25 ±  6%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.error_entry
      0.25 ± 58%      -0.1        0.10 ±  7%  perf-profile.children.cycles-pp.fast_imageblit
      0.25 ± 57%      -0.1        0.11 ±  6%  perf-profile.children.cycles-pp.sys_imageblit
      0.27 ±  6%      -0.1        0.13 ±  3%  perf-profile.children.cycles-pp.pte_offset_map_nolock
      0.29 ±  6%      -0.1        0.15 ±  2%  perf-profile.children.cycles-pp.up_read
      0.28 ±  5%      -0.1        0.14 ±  4%  perf-profile.children.cycles-pp.filemap_get_entry
      0.30 ±  4%      -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.do_execveat_common
      0.30 ±  4%      -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.execve
      0.30 ±  4%      -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.21 ± 11%      -0.1        0.08 ± 10%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.92 ±  4%      -0.1        0.80 ±  2%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.23 ±  4%      -0.1        0.10 ±  4%  perf-profile.children.cycles-pp.xas_start
      0.23 ±  5%      -0.1        0.11 ±  4%  perf-profile.children.cycles-pp.tlb_batch_pages_flush
      0.19 ±  9%      -0.1        0.07 ± 12%  perf-profile.children.cycles-pp.trigger_load_balance
      0.43 ±  9%      -0.1        0.32 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.27 ± 14%      -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.__schedule
      0.20 ±  7%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.18 ±  9%      -0.1        0.07 ± 13%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.20 ±  7%      -0.1        0.09 ±  6%  perf-profile.children.cycles-pp.folio_unlock
      0.19 ±  6%      -0.1        0.10 ±  3%  perf-profile.children.cycles-pp.tlb_flush_mmu
      0.24 ± 15%      -0.1        0.15 ±  6%  perf-profile.children.cycles-pp.load_balance
      0.12 ± 15%      -0.1        0.04 ± 73%  perf-profile.children.cycles-pp.kick_ilb
      0.11 ± 10%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.rcu_core
      0.11 ± 10%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.rcu_core_si
      0.15 ± 14%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.20 ±  4%      -0.1        0.12 ±  4%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.14 ± 32%      -0.1        0.06 ± 15%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.14 ± 32%      -0.1        0.06 ± 15%  perf-profile.children.cycles-pp.rest_init
      0.14 ± 32%      -0.1        0.06 ± 15%  perf-profile.children.cycles-pp.start_kernel
      0.14 ± 32%      -0.1        0.06 ± 15%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.14 ± 32%      -0.1        0.06 ± 15%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.21 ± 14%      -0.1        0.13 ±  2%  perf-profile.children.cycles-pp.find_busiest_group
      0.21 ± 13%      -0.1        0.13 ±  5%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.14 ±  4%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.mmput
      0.20 ±  4%      -0.1        0.13 ±  2%  perf-profile.children.cycles-pp._compound_head
      0.14 ±  4%      -0.1        0.07        perf-profile.children.cycles-pp.folio_mark_accessed
      0.14 ±  5%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__mmput
      0.19 ± 15%      -0.1        0.12 ±  6%  perf-profile.children.cycles-pp.__pick_next_task
      0.19 ± 15%      -0.1        0.12 ±  6%  perf-profile.children.cycles-pp.pick_next_task
      0.09 ± 10%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.rebalance_domains
      0.18 ± 16%      -0.1        0.12 ±  4%  perf-profile.children.cycles-pp.newidle_balance
      0.16 ±  4%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.load_elf_binary
      0.16 ±  6%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.exec_binprm
      0.16 ± 14%      -0.1        0.09 ±  6%  perf-profile.children.cycles-pp.schedule
      0.12 ±  3%      -0.1        0.06        perf-profile.children.cycles-pp.exit_mmap
      0.16 ±  7%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.search_binary_handler
      0.13 ±  8%      -0.1        0.07        perf-profile.children.cycles-pp.access_error
      0.17 ± 15%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.12 ± 17%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.read
      0.11 ± 18%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.ksys_read
      0.10 ±  3%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.do_exit
      0.12 ±  6%      -0.1        0.06        perf-profile.children.cycles-pp._Fork
      0.11 ± 18%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.__x64_sys_read
      0.10 ±  4%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.10 ±  4%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.do_group_exit
      0.16 ± 16%      -0.1        0.11 ±  5%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.11 ± 18%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.vfs_read
      0.11 ±  4%      -0.1        0.06        perf-profile.children.cycles-pp.kernel_clone
      0.11 ±  9%      -0.1        0.06        perf-profile.children.cycles-pp.perf_swevent_event
      0.16 ± 19%      -0.1        0.11 ± 26%  perf-profile.children.cycles-pp.__memcpy
      0.10 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.__do_sys_clone
      0.10 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.__x64_sys_clone
      0.32 ±  6%      -0.0        0.28 ±  4%  perf-profile.children.cycles-pp.mt_find
      0.10 ±  4%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.__irqentry_text_end
      0.08 ±  5%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.path_openat
      0.19 ±  6%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.shmem_pseudo_vma_init
      0.17 ±  7%      -0.0        0.13        perf-profile.children.cycles-pp.xas_create
      0.18 ±  6%      -0.0        0.14 ±  5%  perf-profile.children.cycles-pp.xas_find_conflict
      0.10 ±  6%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__shmem_is_huge
      0.09 ±  4%      -0.0        0.05        perf-profile.children.cycles-pp.__x64_sys_openat
      0.09 ±  4%      -0.0        0.05        perf-profile.children.cycles-pp.do_filp_open
      0.09 ±  4%      -0.0        0.05        perf-profile.children.cycles-pp.do_sys_openat2
      0.10 ± 22%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.schedule_idle
      0.12 ±  8%      -0.0        0.09 ± 12%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.07 ±  6%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.mmap_region
      0.10 ±  7%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.perf_exclude_event
      0.08 ±  4%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.08 ±  7%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.do_mmap
      0.10 ±  9%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.12 ±  6%      -0.0        0.09 ±  9%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.13 ±  6%      -0.0        0.11 ±  6%  perf-profile.children.cycles-pp.__vm_enough_memory
      0.09 ± 11%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.policy_node
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.32 ±  5%      +0.1        0.41 ±  4%  perf-profile.children.cycles-pp.down_read_trylock
      0.07 ±  6%      +0.1        0.16 ± 17%  perf-profile.children.cycles-pp.blk_cgroup_congested
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.shmem_write_begin
      0.04 ± 44%      +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.cap_vm_enough_memory
      0.07 ± 18%      +0.1        0.22 ±  5%  perf-profile.children.cycles-pp.generic_perform_write
      0.18 ± 20%      +0.2        0.33 ±  6%  perf-profile.children.cycles-pp.handle_internal_command
      0.18 ± 20%      +0.2        0.33 ±  6%  perf-profile.children.cycles-pp.main
      0.18 ± 20%      +0.2        0.33 ±  6%  perf-profile.children.cycles-pp.run_builtin
      0.08 ± 16%      +0.2        0.22 ±  5%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.00            +0.2        0.16 ± 20%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.15 ± 29%      +0.2        0.32 ±  6%  perf-profile.children.cycles-pp.__cmd_record
      0.15 ± 29%      +0.2        0.32 ±  6%  perf-profile.children.cycles-pp.cmd_record
      0.13 ± 33%      +0.2        0.31 ±  6%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.12 ± 30%      +0.2        0.30 ±  5%  perf-profile.children.cycles-pp.perf_mmap__push
      0.08 ± 23%      +0.2        0.26 ±  7%  perf-profile.children.cycles-pp.record__pushfn
      0.08 ± 23%      +0.2        0.26 ±  7%  perf-profile.children.cycles-pp.writen
      0.06 ±  7%      +0.2        0.27 ±  2%  perf-profile.children.cycles-pp.inode_add_bytes
      1.54 ±  4%      +0.2        1.76 ±  3%  perf-profile.children.cycles-pp.rmqueue
      0.47 ± 11%      +0.2        0.71 ±  2%  perf-profile.children.cycles-pp.__dquot_alloc_space
      2.40 ±  5%      +0.4        2.77 ±  2%  perf-profile.children.cycles-pp.__alloc_pages
      2.41 ±  5%      +0.4        2.78 ±  2%  perf-profile.children.cycles-pp.__folio_alloc
      2.03 ±  5%      +0.5        2.53 ±  2%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.00            +0.8        0.76 ±  5%  perf-profile.children.cycles-pp.propagate_protected_usage
     70.44 ±  5%     +16.3       86.72        perf-profile.children.cycles-pp.do_access
     56.50 ±  5%     +23.8       80.28        perf-profile.children.cycles-pp.asm_exc_page_fault
     52.06 ±  5%     +26.3       78.34        perf-profile.children.cycles-pp.exc_page_fault
     51.54 ±  5%     +26.5       78.02        perf-profile.children.cycles-pp.do_user_addr_fault
     49.54 ±  5%     +27.0       76.56        perf-profile.children.cycles-pp.handle_mm_fault
     48.38 ±  5%     +27.6       75.93        perf-profile.children.cycles-pp.__handle_mm_fault
     47.46 ±  5%     +28.0       75.43        perf-profile.children.cycles-pp.handle_pte_fault
     47.00 ±  5%     +28.2       75.20        perf-profile.children.cycles-pp.do_fault
     46.63 ±  5%     +28.3       74.97        perf-profile.children.cycles-pp.do_read_fault
     29.13 ±  5%     +36.0       65.13        perf-profile.children.cycles-pp.shmem_get_folio_gfp
     31.47 ±  5%     +36.1       67.60        perf-profile.children.cycles-pp.__do_fault
     31.40 ±  5%     +36.1       67.55        perf-profile.children.cycles-pp.shmem_fault
      2.46 ±  4%     +42.8       45.30        perf-profile.children.cycles-pp.__mod_lruvec_page_state
      1.94 ±  6%     +43.0       44.94        perf-profile.children.cycles-pp.__mod_lruvec_state
      3.11 ±  5%     +43.3       46.36        perf-profile.children.cycles-pp.shmem_add_to_page_cache
      1.22 ±  6%     +43.4       44.62        perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.00           +43.5       43.50        perf-profile.children.cycles-pp.page_counter_charge
     16.98 ±  5%      -9.4        7.60        perf-profile.self.cycles-pp.do_rw_once
     15.62 ±  6%      -4.4       11.24        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      7.14 ±  5%      -3.8        3.33        perf-profile.self.cycles-pp.next_uptodate_folio
      6.43 ±  5%      -3.2        3.23        perf-profile.self.cycles-pp.do_access
      5.44 ± 24%      -3.0        2.46        perf-profile.self.cycles-pp.memcpy_toio
      4.58 ±  6%      -2.4        2.16        perf-profile.self.cycles-pp.filemap_map_pages
      2.41 ± 37%      -1.4        1.04 ±  9%  perf-profile.self.cycles-pp.io_serial_in
      2.36 ±  5%      -1.3        1.03        perf-profile.self.cycles-pp.sync_regs
      2.37 ±  5%      -1.2        1.18 ±  2%  perf-profile.self.cycles-pp.native_irq_return_iret
      1.96 ±  6%      -1.1        0.86 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      1.98 ±  4%      -1.0        1.01 ±  5%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.47 ± 36%      -0.8        0.67 ±  6%  perf-profile.self.cycles-pp.io_serial_out
      0.95 ± 16%      -0.6        0.34 ± 10%  perf-profile.self.cycles-pp.release_pages
      0.67 ± 30%      -0.5        0.20 ± 20%  perf-profile.self.cycles-pp.find_lock_entries
      0.97 ±  6%      -0.4        0.53 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.88 ±  5%      -0.4        0.47 ±  2%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.48 ± 31%      -0.3        0.14 ± 22%  perf-profile.self.cycles-pp.__free_one_page
      0.68 ±  7%      -0.3        0.36 ±  7%  perf-profile.self.cycles-pp.shmem_fault
      0.69 ±  3%      -0.3        0.38 ±  7%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      0.42 ± 29%      -0.3        0.12 ± 20%  perf-profile.self.cycles-pp.lru_gen_del_folio
      0.64 ±  2%      -0.3        0.34 ±  3%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.51 ±  2%      -0.3        0.23        perf-profile.self.cycles-pp.xas_find
      0.54 ±  6%      -0.3        0.26        perf-profile.self.cycles-pp.mtree_range_walk
      0.73 ±  5%      -0.3        0.46 ±  3%  perf-profile.self.cycles-pp.shmem_inode_acct_block
      0.56 ±  6%      -0.3        0.30 ±  4%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.53 ±  5%      -0.3        0.28 ±  2%  perf-profile.self.cycles-pp.___perf_sw_event
      0.53 ±  5%      -0.2        0.28 ±  2%  perf-profile.self.cycles-pp.handle_mm_fault
      0.39 ±  8%      -0.2        0.15 ±  5%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.41 ±  5%      -0.2        0.19 ±  3%  perf-profile.self.cycles-pp.zap_pte_range
      0.39 ±  7%      -0.2        0.17 ±  2%  perf-profile.self.cycles-pp.__pte_offset_map
      0.35 ±  5%      -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.38 ±  2%      -0.2        0.18 ±  5%  perf-profile.self.cycles-pp.xas_load
      0.38            -0.2        0.19        perf-profile.self.cycles-pp.xas_descend
      0.32 ± 18%      -0.2        0.13 ±  2%  perf-profile.self.cycles-pp.intel_idle_xstate
      0.33 ±  4%      -0.2        0.14 ±  4%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.40 ± 13%      -0.2        0.22 ± 11%  perf-profile.self.cycles-pp.xas_store
      0.31 ±  6%      -0.2        0.14 ±  2%  perf-profile.self.cycles-pp.lru_add_fn
      0.30 ±  6%      -0.2        0.14 ±  4%  perf-profile.self.cycles-pp.__count_memcg_events
      0.19 ± 29%      -0.2        0.03 ±102%  perf-profile.self.cycles-pp.xas_clear_mark
      0.29 ±  6%      -0.1        0.14 ±  2%  perf-profile.self.cycles-pp.do_read_fault
      0.25 ± 58%      -0.1        0.10 ±  7%  perf-profile.self.cycles-pp.fast_imageblit
      0.50 ±  6%      -0.1        0.36        perf-profile.self.cycles-pp.shmem_add_to_page_cache
      0.32 ±  7%      -0.1        0.19 ±  2%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.23 ±  4%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.27 ±  7%      -0.1        0.14        perf-profile.self.cycles-pp.up_read
      0.23 ±  6%      -0.1        0.11        perf-profile.self.cycles-pp.vma_alloc_folio
      0.22 ±  6%      -0.1        0.10        perf-profile.self.cycles-pp.error_entry
      0.65 ±  4%      -0.1        0.53        perf-profile.self.cycles-pp.rmqueue_bulk
      0.17 ±  9%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.42 ±  9%      -0.1        0.31 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.27 ±  7%      -0.1        0.16 ±  5%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.19 ±  5%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.xas_start
      0.28 ±  5%      -0.1        0.18 ±  2%  perf-profile.self.cycles-pp.__alloc_pages
      0.17 ±  6%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.set_pte_range
      0.18 ±  6%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.asm_exc_page_fault
      0.18 ±  7%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.folio_unlock
      0.25 ±  5%      -0.1        0.16 ±  2%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.16 ±  7%      -0.1        0.08        perf-profile.self.cycles-pp.shmem_alloc_folio
      0.14 ±  8%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.__perf_sw_event
      0.15 ±  5%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.handle_pte_fault
      0.19 ±  3%      -0.1        0.12 ±  4%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.14 ±  8%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.charge_memcg
      0.12 ±  7%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.finish_fault
      0.14 ±  7%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.pte_offset_map_nolock
      0.13 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.folio_mark_accessed
      0.16 ±  5%      -0.1        0.11 ±  4%  perf-profile.self.cycles-pp.folio_add_file_rmap_range
      0.12 ±  6%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.access_error
      0.12 ±  7%      -0.1        0.07        perf-profile.self.cycles-pp.do_fault
      0.12 ±  9%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.12 ±  8%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.page_remove_rmap
      0.16 ± 19%      -0.1        0.10 ± 28%  perf-profile.self.cycles-pp.__memcpy
      0.16 ±  4%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp._compound_head
      0.09 ± 10%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.perf_swevent_event
      0.09 ±  5%      -0.0        0.05 ±  7%  perf-profile.self.cycles-pp.__irqentry_text_end
      0.12 ± 16%      -0.0        0.08 ±  7%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.09 ±  6%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.__shmem_is_huge
      0.11 ±  9%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.16 ±  6%      -0.0        0.13 ±  2%  perf-profile.self.cycles-pp.shmem_pseudo_vma_init
      0.08 ±  8%      -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.perf_exclude_event
      0.11 ±  9%      -0.0        0.09 ± 10%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.06 ±  7%      -0.0        0.05        perf-profile.self.cycles-pp.__do_fault
      0.10 ±  5%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.mt_find
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.find_vma
      0.06 ±  8%      +0.1        0.16 ± 18%  perf-profile.self.cycles-pp.blk_cgroup_congested
      0.30 ±  5%      +0.1        0.40 ±  4%  perf-profile.self.cycles-pp.down_read_trylock
      0.00            +0.1        0.14 ± 18%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.00            +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.cap_vm_enough_memory
      0.16 ±  7%      +0.2        0.33 ±  3%  perf-profile.self.cycles-pp.__dquot_alloc_space
      0.06 ±  9%      +0.2        0.26 ±  3%  perf-profile.self.cycles-pp.inode_add_bytes
      0.48 ±  7%      +0.3        0.77 ±  2%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.44 ±  5%      +0.4        0.84 ±  6%  perf-profile.self.cycles-pp.rmqueue
      0.36 ±  7%      +0.6        0.92 ±  3%  perf-profile.self.cycles-pp.folio_add_lru
      0.00            +0.7        0.74 ±  5%  perf-profile.self.cycles-pp.propagate_protected_usage
      0.00           +43.1       43.13        perf-profile.self.cycles-pp.page_counter_charge





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

