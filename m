Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70241213E74
	for <oe-lkp@lists.linux.dev>; Fri, 28 Mar 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154174; cv=fail; b=G1KXNyqQdYG8cNX6FmTZIFZ03CCKLwsOFtKXXqFBxJzgwi4/A51qt3hROcxrmnun65LVQQgVfiLf645qIgz4UybFRJGKHScaT/iRP9WxBJOrbAVGK46Hz2ky3qbc1JW1s1Hxe8kaLkQG5LiYuO1vhWV+5AxWd8MGOxnV4DXn+GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154174; c=relaxed/simple;
	bh=k/MQJEqEJIgbJ2nfukr7fL74aukVE/bQ7SzRTTBPuws=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JDjZFdvNZFswgem3rZHpBYCSMMAY5juQ8r6QCdymZeby3iDugMje1b4UyuenZjPy7+mYhdHngqck3+YRx9lx/k/1TPYEfu3W5SONeHm9M3yj8qqKeMljtcK8+JBBhUPUcgOGR6zzbDonMGiwp84rDaMukE13aij7aB43O5L/Dac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8Uo6PAN; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8Uo6PAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743154172; x=1774690172;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=k/MQJEqEJIgbJ2nfukr7fL74aukVE/bQ7SzRTTBPuws=;
  b=T8Uo6PAN6rKmcJ8/WwJtQE4bC1gQJQvTElFjIl1ZeI76O2+/qXtC48G5
   y1C9+O7huoFdfnDy5/zjsrIDVNfYPTmKQpU4dgsQfZ7J2qkUNQ2eoXqYB
   aFgd3a26CERxQfye4wSZSLPs7H/GcuHg8p0mSwtafE5GYqqTNoBCU1xLt
   RCa69K1K9JZq1rz1keOIqiBsBTf7Ec4u17yOu4tuDKkO70XQ/FuN9HTOs
   JBcYYAUHly481ilMSg6/edYWq4EKf6ThB/C6gO2Jh3FGbO45XccEWJBhE
   BNwNP3/ue26UlAXbx+NzlHzZis1H/ZpL8lQkwjuYoBeYJfxszLRec44ph
   w==;
X-CSE-ConnectionGUID: wIOMSjoyTXCXMGTBkGDVKw==
X-CSE-MsgGUID: vLwCIDAqSvS3V+IDbhSFFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48292738"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="48292738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:29:32 -0700
X-CSE-ConnectionGUID: moQzUmLFTlOpm88wMKgLQA==
X-CSE-MsgGUID: A+Zvfjw+Qy6sgdjreh03nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125400651"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:29:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 02:29:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 02:29:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 02:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvf11fspflpWxxi1/AOJtNDOl8St/oHpaJ3868c6kdVGyUZSootVFXNTsAxEvISsK1PtUxCXiyu09J3Mld5vApUyhWaRZhbjQObdsUKKffH0pRPxSaVwJyr6FD9OV2wT68bQYdu28+1///PqKQg4Q3W1laqU8Rr3NWNtfNq8LXgWeSQbZ7xdU5SLJCFRoOuiYsRc4qB5qZgU38kmHa4XemTPtdOWWblNOR65GrmgqZoT54z0VFehOwbHo5Fl3F8JqVY1OJgKLaHDsqj1YbCvymiu+EwU8dMSTi0sSvAQ/9RpiGr7CUhSGTR3zp28rVXS0z9uU01ZbZ94AXNi+/biZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIofUa5jmnxLAkOH8ouGc/J9MX01ztqtZIh2s24ouLQ=;
 b=VQ45tj8qjplX2yNsC5juhVY/l5KQnNI8q/dzzcTcgqJeLgjwrzuZHwx5ipnryWu1uvGMHIViWwGcNqv+2SRcrXPHahaiqNT77i/gCW842ho+TBUsonltngDqvcT/cJI0ROvckytNYiJuoL89lacZHh9sBEH+rKQQNvM+ly0fzTixOoOhG1z+J5Vc6RND5gCEjQBNwo3dqxkU3tMW+M8UBaEY4jDk60yHqPyMHCH8xd4LPA23WQSrCIdcAaizyjJbtNrjkguTAmm6+jwfdeJGU5haAtrj3gGSXh+WJ9lx3G68wsye/UFlv0qgYLTfUJy5iZNZQ21s1H+Id2J4pvGvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:29:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:29:28 +0000
Date: Fri, 28 Mar 2025 17:29:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [anolis-intel-cloud:devel-6.6] [sched/core]  2bbba4ed1a:
 hackbench.throughput 16.5% improvement
Message-ID: <202503281610.cdaf2597-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: 760dca92-844c-4e7e-9bf9-08dd6ddb09c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+uMeM5/vo/KlGgRRlW/jn1AcS3dvYKyQ5hGhXvEDGjhpOScXXZ4BCl3kDf?=
 =?iso-8859-1?Q?lGf/jiGnCopgsHeY2ecZXMNWLQNedMK4qD2fUM+HCunzooYIygTqzLCs62?=
 =?iso-8859-1?Q?G9qUNvVuStIsvwQi4pTgazEh0bkOL7N8y4wlUFvZWMSP0EvT2+E5gVgu2u?=
 =?iso-8859-1?Q?VaSxpQZAlQJ5CMxEhxqEay8+SIlQZICXcIvQi1VDc9Lf7tFv9lnMc90krn?=
 =?iso-8859-1?Q?xZT8vqbmndzHcB1goi/IclVxijsRWhhca+7swmrCMrs6LAnIR942GNHIbI?=
 =?iso-8859-1?Q?c3tlfxHlOwwZbBuCiHPsVMfeF3s6h7rXnt0m2UuD+qVy6I8M0Inu+NwXXm?=
 =?iso-8859-1?Q?XTsFUSLSTA4Wp+vWOc64wkc93DGS2dMe01PfUiPXL17U4tTSTfS6cLhFHI?=
 =?iso-8859-1?Q?BPNIJS2GDMZCE32h/g+Q7Un6Vi8QvfkZU3dzpY3CzX1iphQvTp12ocqcBg?=
 =?iso-8859-1?Q?rjtEK3gU/nU1QsT3ym/2kMn7DaygeKEkAZ9AKiUb1jgCPsYOYqRaE4B1l6?=
 =?iso-8859-1?Q?gzLKEa3KbZtvOX6UdhrH02RsDoE5wv7M45gJSodPlDIX2KpEngJQiK17Mg?=
 =?iso-8859-1?Q?rEOM8nKB6FN4ZzaTHc6+HMfT4MdYdlQN+qDhe+6i/y1Abr80H4/Z2Dpgjp?=
 =?iso-8859-1?Q?iowPb3wkn/VbX5P4U7pkwtPJyL++Sjd47eAMrf9LnacnXp/bQatUxzeJNg?=
 =?iso-8859-1?Q?tIVhQbzHHdM+92y2mXDV1Ymv28acjHb9K07hHp3S9TBCE3MIFmGEZnCo+N?=
 =?iso-8859-1?Q?05IUxq5P6uyZqQgnoY4jJacM/xJcqhv1NteljeNYX8OYJevubmQFSs22Td?=
 =?iso-8859-1?Q?Y6nA1JoyL2VidndPHq0+lEHIRaEIDnM6rvwMayn6aZy4/tf3I2sdw07K4/?=
 =?iso-8859-1?Q?4SBbcZ00ZxmtTyG75ZKeG55cPP2bSWPEh9ppzPWLBImravseshI74ESZLl?=
 =?iso-8859-1?Q?zA7XpHjR2DCz/QuH3uh2RCgASl3nBmLZuPpNnsjGZDiCLJCsQbKzwL3AtB?=
 =?iso-8859-1?Q?OTRqFBuUktSWnWf/K89p4+dJMRH5+EunRNrMwXxTLDwOvGSvdJRjHMz9vb?=
 =?iso-8859-1?Q?Z6p/ClHmxiaQl/k5XOPzulZvC1pLhmtPWG0kigtjDN3g6l8bY9VHVfYohT?=
 =?iso-8859-1?Q?IDaw8IZba17fYsepwJgnLv1eu0j7tiWWsadSQsnCQDs/oiRO62v0/8pdNh?=
 =?iso-8859-1?Q?5+GxsYv473/5pGtRMzPGGTzUdVVZb2LRvwOQOTV7u7xHg7W5Ys7o89v9iN?=
 =?iso-8859-1?Q?YY2EhOfCfl/uxNF27MT6R+Fzyor/DKiX63JxM/EUpjZprzxTSgIiX1ZyBh?=
 =?iso-8859-1?Q?hagw29rh3zRYgZqp2Jx2uAQcMg/JMlNzbBGTd+IltjZET4jUv6EDWFqdw3?=
 =?iso-8859-1?Q?qPTMv0J6EH8F06LN1FAgfnpK04Ss4K1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iAjaqwS1uwKvKjdgdwuWXP64UZlkIGSESGPMHvvx2koYYwdDBTtwrn4eAA?=
 =?iso-8859-1?Q?ms7WMCA3+Jn1OET9oldIfN0qZyKAfGIG00K+UXF/z/pk+jjg76l7yJVg2i?=
 =?iso-8859-1?Q?+iYFLPWBdgoEYj2TFrzANcKg+Yoe8x3pZoNNmMhvFeOHJ8I6ro8tFRIOxz?=
 =?iso-8859-1?Q?5zc+fXUoedCr5YsUFQs8uJ5pbbudQTFtHu2KJamiLgN8giFTM0fv8WNWwN?=
 =?iso-8859-1?Q?Qnk7GDlUHv+FT9MYev8hNHwXhwA4jfZsxdoEGHA8ZRwaSYG4NCdlsGrU4r?=
 =?iso-8859-1?Q?S0pwzmKKCapEF2YA2E1sQvo3wOwO2ojnzMsrPHi3m6pu7YhidoN1WhK6pN?=
 =?iso-8859-1?Q?13hw7oQ8ADBRoQWJM7L/l4/SGsPcuDPTTmur7+FWyV65bovIXG4OCSy9lQ?=
 =?iso-8859-1?Q?OOYy3wDCBlhVx3YV0CYEbZpErjxzTwGM7u+RkTywyR4Q2EWS51AQS4pqnp?=
 =?iso-8859-1?Q?PXquysBIkrf0qwWlXVcEAvPWvJ6CInV8Re+L0qobb/6yS1NzbZFWr8/0Vg?=
 =?iso-8859-1?Q?6MY5yk4XouDcmrsAJOnIr3esNwd7e115G828y9OE/7k/k6Ag2yc1FkpaPO?=
 =?iso-8859-1?Q?t0E/PA3dFtft2RjVDXgytbXyj+VkDTpe0+44V18Kctuayliw7X8ZC7xdpB?=
 =?iso-8859-1?Q?BT0QplkMomYYxiPhA3FgfqLE/DEYoSZ4AV//IJEvQxI9izT3L1SquB5HMe?=
 =?iso-8859-1?Q?O6/nNyuBW/+GcTaXTTdqvlOXVTXH2bvNK4+ewhQLhnnJ0UdADQeeJY2Smg?=
 =?iso-8859-1?Q?KIdmPBP2I6zo3DKgwllHd8VZez+AKuj7mqtjJ4KMxaTz5/dEz7q96IL6uu?=
 =?iso-8859-1?Q?n6dXrIx+huV+Oth8Fe0fX+LPkY60UhqpN3mK7ke+O4iLUSK91s+0E6Q2tt?=
 =?iso-8859-1?Q?TZ06Jg13j8QRo0BuBnfDfEjLaM56q3/1mgtIADGw4+iNW4hcxL+EZFIWUa?=
 =?iso-8859-1?Q?mOI/f1/bwvlMlesqStbMUebc7nNE8CEeSdvkJZSNE6ubk1ZYhumpziV48+?=
 =?iso-8859-1?Q?sXKMbdmr9nSkEFghrYMulxrE+NFJIeLODBqAOtOJrDjrM92CVRTeML6b1Z?=
 =?iso-8859-1?Q?2BIj2lPxO/xdX0DNJLL3i56mI270U7Qubj3crTb/QbxrNdSsHulpBn8n6/?=
 =?iso-8859-1?Q?63b1NLEKEu5u9PbVPcrgXqA1tsaU+cKaeoCNh3EV9n/PH0bBU6+BHIIlI8?=
 =?iso-8859-1?Q?uSb0P1MjlpwYCm8cEgLG0082lMy4eWwOB7WScmg5fc+IzlRGbyist9H6I6?=
 =?iso-8859-1?Q?lPttlaRMHzkOX7IeDlXoHMoie1XinEC87Xy2CI7Xmw24FWMu/SeLbIHshF?=
 =?iso-8859-1?Q?sXecLy9g3SxDBcKq9bCmM79Qi/ugBm+/NTXiEV5m1guRL6ivQvMasM1S9d?=
 =?iso-8859-1?Q?ikBTJHHGslwUr9VVNzUDwoC+BTcRnybNCJI94t447VwBWlsTMp+r/SOGCW?=
 =?iso-8859-1?Q?lrbXH7jfgQAYPg2Nx9SBGaF/49s46ldiRAG4jfWTZJC22O6tfVR5GaL7Iz?=
 =?iso-8859-1?Q?TmZeXP+ZlwCEsgQQGjjsY20DCuSiAzfOTxiz+FGuRl5QoL6AadsGKYuii0?=
 =?iso-8859-1?Q?9ZaZShi8ACcmeDJUvwOI6pNWsNqKAaW5GWtoztTXXA8DOD4VB81UcmnXnT?=
 =?iso-8859-1?Q?mrC7GKzkTNViRtO4kmCMoxrFwiH4EVyVsxamvMNfp/P7HapcgAPdIiWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 760dca92-844c-4e7e-9bf9-08dd6ddb09c7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:29:28.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEK8GglrK1Vsk2E0cSxZMFCV4vl0Shy8fbGDRNPBzAlMyH3ZlKvy6wLfjOOgxAQOJzrMtUMohJXHXz/0/lXLRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 16.5% improvement of hackbench.throughput on:


commit: 2bbba4ed1af8762acb6a4609428e5e68cbad9e1c ("sched/core: Prioritize migrating eligible tasks in sched_balance_rq()")
https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6

testcase: hackbench
config: x86_64-anolis-intel-cloud-devel-6.6
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	nr_threads: 100%
	iterations: 8
	mode: threads
	ipc: socket
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250328/202503281610.cdaf2597-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/8/x86_64-anolis-intel-cloud-devel-6.6/threads/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-1ap1/hackbench

commit: 
  3b40c40b07 ("sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE")
  2bbba4ed1a ("sched/core: Prioritize migrating eligible tasks in sched_balance_rq()")

3b40c40b074ad510 2bbba4ed1af8762acb6a4609428 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1101 ±  2%     -12.2%     966.93 ±  2%  uptime.boot
      0.74 ±  8%      +0.1        0.88 ±  7%  mpstat.cpu.all.idle%
      1.32 ±  2%      +0.2        1.53 ±  2%  mpstat.cpu.all.usr%
   3481937 ±  3%     +23.0%    4284294 ±  3%  vmstat.system.cs
    283458            +2.4%     290255        vmstat.system.in
   3379331            -3.2%    3269587        proc-vmstat.numa_hit
   3379263            -3.2%    3269586        proc-vmstat.numa_local
   5014552            -4.0%    4814510        proc-vmstat.pgalloc_normal
   2106380            -6.6%    1967239        proc-vmstat.pgfault
   3994058 ±  2%      -5.5%    3775204 ±  2%  proc-vmstat.pgfree
     77964 ±  2%      -9.9%      70219 ±  3%  proc-vmstat.pgreuse
    258987           +16.5%     301667        hackbench.throughput
    241051 ±  3%     +16.7%     281381 ±  3%  hackbench.throughput_avg
    258987           +16.5%     301667        hackbench.throughput_best
    221205 ±  6%     +18.3%     261772 ±  4%  hackbench.throughput_worst
    939.56 ±  3%     -14.3%     805.44 ±  3%  hackbench.time.elapsed_time
    939.56 ±  3%     -14.3%     805.44 ±  3%  hackbench.time.elapsed_time.max
    221035 ±  3%     -14.6%     188843 ±  3%  hackbench.time.system_time
    112.62 ±124%     -81.1%      21.30 ± 45%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    777.68 ±177%     -87.3%      98.64 ± 32%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    225.24 ±124%     -94.8%      11.79 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     15.83 ± 48%     -84.2%       2.50 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1555 ±177%     -97.3%      41.66 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    112.62 ±124%     -81.1%      21.30 ± 45%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    777.68 ±177%     -87.3%      98.64 ± 32%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     31301 ± 10%     +17.2%      36678 ±  3%  sched_debug.cpu.avg_idle.min
    612334 ±  3%      -9.9%     552008 ±  2%  sched_debug.cpu.clock.avg
    614558 ±  3%      -9.8%     554156 ±  2%  sched_debug.cpu.clock.max
    610102 ±  3%      -9.9%     549882 ±  2%  sched_debug.cpu.clock.min
    611822 ±  3%      -9.9%     551531 ±  2%  sched_debug.cpu.clock_task.avg
    614099 ±  3%      -9.8%     553724 ±  2%  sched_debug.cpu.clock_task.max
    598998 ±  3%     -10.1%     538796 ±  2%  sched_debug.cpu.clock_task.min
    610092 ±  3%      -9.9%     549870 ±  2%  sched_debug.cpu_clk
    609212 ±  3%      -9.9%     548990 ±  2%  sched_debug.ktime
    611296 ±  3%      -9.9%     551072 ±  2%  sched_debug.sched_clk
      0.06 ±  3%      +8.0%       0.07 ±  3%  perf-stat.i.MPKI
 3.949e+10           +10.6%  4.367e+10        perf-stat.i.branch-instructions
      0.32            +0.0        0.35        perf-stat.i.branch-miss-rate%
 1.301e+08 ±  2%     +17.1%  1.523e+08        perf-stat.i.branch-misses
      1.51 ±  3%      +0.1        1.59 ±  3%  perf-stat.i.cache-miss-rate%
  11308788 ±  2%     +18.8%   13432573 ±  4%  perf-stat.i.cache-misses
 7.608e+08 ±  3%     +13.5%  8.638e+08 ±  3%  perf-stat.i.cache-references
   3487968 ±  3%     +22.8%    4283449 ±  3%  perf-stat.i.context-switches
      4.55 ±  3%     -12.7%       3.97 ±  3%  perf-stat.i.cpi
     52450 ±  2%     +27.0%      66632 ±  2%  perf-stat.i.cpu-migrations
     97825 ±  4%     -20.7%      77540 ±  6%  perf-stat.i.cycles-between-cache-misses
 1.914e+11           +11.7%  2.137e+11        perf-stat.i.instructions
      0.24 ±  2%     +11.7%       0.27        perf-stat.i.ipc
     14.61 ±  3%     +22.8%      17.94 ±  3%  perf-stat.i.metric.K/sec
      2247 ±  2%      +8.5%       2437        perf-stat.i.minor-faults
      2247 ±  2%      +8.5%       2437        perf-stat.i.page-faults
      0.33            +0.0        0.35        perf-stat.overall.branch-miss-rate%
      4.26 ±  2%     -10.6%       3.81        perf-stat.overall.cpi
     70448 ±  2%     -15.2%      59748 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.23 ±  2%     +11.9%       0.26        perf-stat.overall.ipc
 3.916e+10           +10.6%  4.332e+10        perf-stat.ps.branch-instructions
 1.282e+08 ±  2%     +17.2%  1.503e+08        perf-stat.ps.branch-misses
  11480788 ±  2%     +18.0%   13549830 ±  5%  perf-stat.ps.cache-misses
 7.498e+08 ±  3%     +13.6%  8.515e+08 ±  3%  perf-stat.ps.cache-references
   3423024 ±  3%     +23.1%    4214009 ±  3%  perf-stat.ps.context-switches
     50182 ±  2%     +27.4%      63951        perf-stat.ps.cpu-migrations
 1.896e+11 ±  2%     +11.7%  2.119e+11        perf-stat.ps.instructions
      2096 ±  2%      +8.5%       2274        perf-stat.ps.minor-faults
      2096 ±  2%      +8.5%       2274        perf-stat.ps.page-faults
 1.783e+14            -4.2%  1.708e+14        perf-stat.total.instructions
     38.54            -0.8       37.76        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
     38.86            -0.6       38.24        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.80 ± 21%      +0.3        1.12 ±  9%  perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.94 ± 26%      +0.4        1.31 ± 13%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.19 ±142%      +0.5        0.66 ± 11%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.24 ±146%      +0.5        0.76 ± 17%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.86 ± 18%      +0.5        2.39 ±  8%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.36 ±107%      +0.5        0.90 ± 27%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      0.38 ±106%      +0.6        0.94 ± 26%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.39 ±107%      +0.6        0.98 ± 26%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.57 ± 81%      +0.6        1.18 ± 26%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     38.60            -0.7       37.85        perf-profile.children.cycles-pp.unix_stream_sendmsg
     38.87            -0.6       38.26        perf-profile.children.cycles-pp.sock_write_iter
      0.07 ± 19%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.kmalloc_slab
      0.05 ± 49%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.__scm_recv_common
      0.04 ± 72%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.05 ± 49%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.pick_task_fair
      0.08 ± 20%      +0.0        0.12 ± 10%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.07 ± 24%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp.__get_task_ioprio
      0.07 ± 28%      +0.0        0.11 ± 14%  perf-profile.children.cycles-pp.aa_file_perm
      0.05 ± 51%      +0.0        0.09 ± 13%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.07 ± 23%      +0.0        0.11 ± 12%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.03 ±100%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.08 ± 22%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.06 ± 49%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.__switch_to_asm
      0.08 ± 27%      +0.0        0.12 ± 14%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.03 ±100%      +0.0        0.07 ± 11%  perf-profile.children.cycles-pp.os_xsave
      0.03 ±100%      +0.0        0.07 ± 13%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.03 ±100%      +0.0        0.07 ± 13%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.02 ±141%      +0.0        0.06 ± 15%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.06 ± 51%      +0.0        0.10 ± 16%  perf-profile.children.cycles-pp.__enqueue_entity
      0.13 ± 20%      +0.0        0.17 ± 10%  perf-profile.children.cycles-pp.__check_heap_object
      0.02 ±142%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.kfree
      0.03 ±101%      +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.rw_verify_area
      0.02 ±142%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.10 ± 23%      +0.0        0.14 ± 10%  perf-profile.children.cycles-pp.x64_sys_call
      0.10 ± 21%      +0.0        0.14 ± 11%  perf-profile.children.cycles-pp.mutex_unlock
      0.06 ± 51%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp.__dequeue_entity
      0.02 ±142%      +0.0        0.06 ± 11%  perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.07 ± 48%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.put_pid
      0.10 ± 22%      +0.0        0.15 ± 12%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.10 ± 24%      +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.rcu_all_qs
      0.10 ± 27%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.09 ± 41%      +0.1        0.14 ± 22%  perf-profile.children.cycles-pp.update_curr
      0.01 ±223%      +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.12 ± 24%      +0.1        0.17 ± 11%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.11 ± 24%      +0.1        0.17 ± 12%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.14 ± 23%      +0.1        0.20 ± 12%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.12 ± 32%      +0.1        0.18 ± 15%  perf-profile.children.cycles-pp.set_next_entity
      0.10 ± 46%      +0.1        0.17 ± 25%  perf-profile.children.cycles-pp.dequeue_entity
      0.13 ± 27%      +0.1        0.20 ± 14%  perf-profile.children.cycles-pp.mutex_lock
      0.15 ± 22%      +0.1        0.22 ± 13%  perf-profile.children.cycles-pp.copyin
      0.14 ± 27%      +0.1        0.21 ± 14%  perf-profile.children.cycles-pp.switch_fpu_return
      0.18 ± 22%      +0.1        0.25 ± 11%  perf-profile.children.cycles-pp.skb_unlink
      0.17 ± 27%      +0.1        0.26 ± 14%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.16 ± 26%      +0.1        0.25 ± 14%  perf-profile.children.cycles-pp.fput
      0.18 ± 22%      +0.1        0.26 ± 10%  perf-profile.children.cycles-pp.refill_obj_stock
      0.12 ± 51%      +0.1        0.21 ± 29%  perf-profile.children.cycles-pp.dequeue_entities
      0.13 ± 49%      +0.1        0.22 ± 28%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.18 ± 23%      +0.1        0.26 ± 12%  perf-profile.children.cycles-pp._copy_from_iter
      0.03 ±163%      +0.1        0.12 ± 50%  perf-profile.children.cycles-pp.ordered_events__queue
      0.03 ±163%      +0.1        0.12 ± 50%  perf-profile.children.cycles-pp.process_simple
      0.03 ±163%      +0.1        0.12 ± 50%  perf-profile.children.cycles-pp.queue_event
      0.19 ± 24%      +0.1        0.28 ± 12%  perf-profile.children.cycles-pp.__cond_resched
      0.22 ± 23%      +0.1        0.34 ± 11%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.24 ± 26%      +0.1        0.36 ± 13%  perf-profile.children.cycles-pp.security_file_permission
      0.26 ± 22%      +0.1        0.38 ± 11%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.25 ± 36%      +0.1        0.39 ± 19%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.25 ± 36%      +0.1        0.40 ± 19%  perf-profile.children.cycles-pp.pick_next_task
      0.37 ± 26%      +0.2        0.54 ± 13%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.36 ± 29%      +0.2        0.55 ± 13%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.46 ± 23%      +0.2        0.67 ± 11%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.63 ± 20%      +0.2        0.87 ± 10%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.62 ± 22%      +0.3        0.90 ± 10%  perf-profile.children.cycles-pp.mod_objcg_state
      0.56 ± 28%      +0.3        0.85 ± 13%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.62 ± 22%      +0.3        0.91 ± 11%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.82 ± 21%      +0.3        1.14 ± 10%  perf-profile.children.cycles-pp.__kmem_cache_free
      0.66 ± 27%      +0.3        1.00 ± 13%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.88 ± 26%      +0.3        1.23 ± 13%  perf-profile.children.cycles-pp.copyout
      0.84 ± 29%      +0.4        1.19 ± 16%  perf-profile.children.cycles-pp.__slab_free
      0.96 ± 26%      +0.4        1.34 ± 13%  perf-profile.children.cycles-pp._copy_to_iter
      0.64 ± 44%      +0.4        1.06 ± 27%  perf-profile.children.cycles-pp.schedule_timeout
      0.72 ± 42%      +0.5        1.19 ± 25%  perf-profile.children.cycles-pp.unix_stream_data_wait
      0.80 ± 41%      +0.5        1.30 ± 24%  perf-profile.children.cycles-pp.schedule
      0.79 ± 42%      +0.5        1.29 ± 25%  perf-profile.children.cycles-pp.__schedule
      1.87 ± 18%      +0.5        2.41 ±  8%  perf-profile.children.cycles-pp.kmem_cache_free
      0.05 ± 49%      +0.0        0.08 ± 10%  perf-profile.self.cycles-pp.kmalloc_slab
      0.08 ± 20%      +0.0        0.11 ± 11%  perf-profile.self.cycles-pp.ksys_read
      0.07 ± 23%      +0.0        0.10 ±  8%  perf-profile.self.cycles-pp.ksys_write
      0.05 ± 48%      +0.0        0.08 ± 10%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.08 ± 24%      +0.0        0.11 ± 12%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.07 ± 19%      +0.0        0.10 ±  8%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.05 ± 48%      +0.0        0.08 ± 13%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.06 ± 48%      +0.0        0.09 ± 11%  perf-profile.self.cycles-pp.__get_task_ioprio
      0.08 ± 23%      +0.0        0.11 ± 12%  perf-profile.self.cycles-pp.security_file_permission
      0.08 ± 23%      +0.0        0.11 ±  9%  perf-profile.self.cycles-pp._copy_to_iter
      0.08 ± 26%      +0.0        0.11 ± 14%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.06 ± 48%      +0.0        0.09 ±  9%  perf-profile.self.cycles-pp.rcu_all_qs
      0.10 ± 18%      +0.0        0.14 ± 11%  perf-profile.self.cycles-pp.mutex_unlock
      0.04 ± 72%      +0.0        0.08 ± 12%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.08 ± 23%      +0.0        0.12 ± 10%  perf-profile.self.cycles-pp.x64_sys_call
      0.06 ± 50%      +0.0        0.09 ±  9%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.06 ± 51%      +0.0        0.10 ± 15%  perf-profile.self.cycles-pp.aa_file_perm
      0.08 ± 22%      +0.0        0.11 ± 13%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.12 ± 22%      +0.0        0.16 ±  9%  perf-profile.self.cycles-pp.__check_heap_object
      0.03 ±100%      +0.0        0.07 ± 11%  perf-profile.self.cycles-pp.__scm_recv_common
      0.10 ± 23%      +0.0        0.14 ±  9%  perf-profile.self.cycles-pp.do_syscall_64
      0.06 ± 49%      +0.0        0.10 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
      0.02 ±141%      +0.0        0.06 ± 13%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.04 ± 73%      +0.0        0.08 ± 14%  perf-profile.self.cycles-pp.__dequeue_entity
      0.03 ±100%      +0.0        0.07 ± 10%  perf-profile.self.cycles-pp.__fdget_pos
      0.03 ±101%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.03 ±101%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.03 ±100%      +0.0        0.07 ± 13%  perf-profile.self.cycles-pp.os_xsave
      0.03 ±101%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.sock_recvmsg
      0.09 ± 24%      +0.0        0.14 ± 11%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.06 ± 51%      +0.0        0.10 ± 16%  perf-profile.self.cycles-pp.__enqueue_entity
      0.02 ±142%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp._copy_from_iter
      0.03 ±100%      +0.0        0.07 ± 11%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.03 ±101%      +0.0        0.08 ± 12%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.03 ±101%      +0.0        0.08 ± 12%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.__build_skb_around
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.09 ± 27%      +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.mutex_lock
      0.11 ± 23%      +0.1        0.16 ± 11%  perf-profile.self.cycles-pp.unix_write_space
      0.01 ±223%      +0.1        0.06 ± 15%  perf-profile.self.cycles-pp.__get_user_8
      0.10 ± 24%      +0.1        0.15 ± 11%  perf-profile.self.cycles-pp.consume_skb
      0.10 ± 24%      +0.1        0.16 ± 10%  perf-profile.self.cycles-pp.__cond_resched
      0.10 ± 24%      +0.1        0.16 ± 12%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.13 ± 21%      +0.1        0.19 ± 10%  perf-profile.self.cycles-pp.__check_object_size
      0.11 ± 24%      +0.1        0.17 ± 12%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.12 ± 22%      +0.1        0.19 ±  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.14 ± 24%      +0.1        0.20 ± 10%  perf-profile.self.cycles-pp.sock_read_iter
      0.15 ± 22%      +0.1        0.22 ± 15%  perf-profile.self.cycles-pp.copyin
      0.17 ± 22%      +0.1        0.24 ± 11%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.38 ± 12%      +0.1        0.45 ±  5%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.16 ± 28%      +0.1        0.23 ± 15%  perf-profile.self.cycles-pp.fput
      0.23 ± 17%      +0.1        0.30 ±  8%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.16 ± 24%      +0.1        0.24 ± 11%  perf-profile.self.cycles-pp.sock_write_iter
      0.17 ± 22%      +0.1        0.25 ± 10%  perf-profile.self.cycles-pp.refill_obj_stock
      0.16 ± 25%      +0.1        0.23 ± 13%  perf-profile.self.cycles-pp.vfs_write
      0.16 ± 24%      +0.1        0.24 ± 12%  perf-profile.self.cycles-pp.vfs_read
      0.21 ± 24%      +0.1        0.30 ± 11%  perf-profile.self.cycles-pp.skb_release_data
      0.03 ±163%      +0.1        0.12 ± 52%  perf-profile.self.cycles-pp.queue_event
      0.22 ± 24%      +0.1        0.33 ± 12%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.16 ± 37%      +0.1        0.28 ± 25%  perf-profile.self.cycles-pp.__schedule
      0.38 ± 19%      +0.1        0.50 ± 10%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.31 ± 22%      +0.1        0.46 ± 11%  perf-profile.self.cycles-pp.write
      0.31 ± 22%      +0.1        0.46 ± 11%  perf-profile.self.cycles-pp.read
      0.51 ± 19%      +0.2        0.69 ±  9%  perf-profile.self.cycles-pp.__kmem_cache_free
      0.36 ± 27%      +0.2        0.54 ± 13%  perf-profile.self.cycles-pp.skb_set_owner_w
      0.56 ± 22%      +0.2        0.80 ± 10%  perf-profile.self.cycles-pp.mod_objcg_state
      0.60 ± 30%      +0.3        0.86 ± 16%  perf-profile.self.cycles-pp.sock_wfree
      0.83 ± 28%      +0.3        1.17 ± 16%  perf-profile.self.cycles-pp.__slab_free
      0.94 ± 27%      +0.4        1.38 ± 13%  perf-profile.self.cycles-pp.unix_stream_read_generic




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

