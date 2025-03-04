Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81321E9907
	for <oe-lkp@lists.linux.dev>; Tue,  4 Mar 2025 05:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741064912; cv=fail; b=Yc/lcsglN+p3rslFB7pIG80mVZ8+E7p/Sx/EKqsjZKARIZB5NrxifCZkMZec8QOQakryE9qjcpOfXF2lqZ5C1zI24wrXVlcwDeSsqTvMivSZkb9mPW/WoPDMJJKKRS2QTE8T0/JxvG0csoBuWZQV1HH96pry7zca/XW1avMBK9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741064912; c=relaxed/simple;
	bh=ms1cFc7XuDo+DZN/0J4tMJWA8xvYbnu11xKDf859lqw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QD46IELM9wSXdBLW2ap476KNhrNW2nikZf8AgOlU4AmCTF9z0tortVD5PtW5GUKLGUtQmC0AJT2P3Cp0sI0P+0U4C4F2KAlPLCOgGpCa2LqmErh737kDRSpKO+p53W75fiXFruRSrzkpH0fQ4/D/iVVqNuEphD8JbWiDaR/SsyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvjIWI4l; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvjIWI4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741064910; x=1772600910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ms1cFc7XuDo+DZN/0J4tMJWA8xvYbnu11xKDf859lqw=;
  b=TvjIWI4l+mMOwJmmYInx0lTAeJtcfeiwt3L4qs4knAvxdJTuYXvsnkGm
   gE0HpvAxXXZKtNdbER8TNPS4Tg8uxeG0o9VvqwJNuIpcxYdyDp0ig68qj
   l/dnIE6+mCUvTEJMTQk/0Z7nBMRJHJWryqGidcZX90IdulD1UAdzTcYMN
   2wzJt23JgFRlZ+jcwBmK1GTm/HpbiW/Q7+R274mWPkIo6vz859RkXP/v2
   dBFNWCjzA0jAjeix+O4eOo9B1kzWfCJbRgF7Pe3/cy4Ukf6bW1LHYbkcn
   pIOpvdE+1dEOEDLQ2FgVX9HlQYwRPyNNlRNFfKIcOvfvOt1x+ITkDIU+e
   w==;
X-CSE-ConnectionGUID: 6AI6/4Q4T4O1fri+Uar6Uw==
X-CSE-MsgGUID: EcY7TTY/SrCJkHK5aPghpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42155351"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="42155351"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:08:29 -0800
X-CSE-ConnectionGUID: TmD9iY3pQ6+hyA3kGTqQpQ==
X-CSE-MsgGUID: S+DfyTpyR7StmIyX7DMttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118779012"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:08:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 21:08:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 21:08:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 21:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCVBvo22ET4GtiTSI9vNw15kjiMrXokwLEFn3NQZ3IDFeK71SRzIjgZRHn81vdlu3TKWY+2A7XCVJ/2d6zh3vF9fggnW11T4x9L5JV4KJ7V/zWrOccneNofvRckqCAA1gi9RhLXUCb1GhOH5/AQPuQJjMHcrPg4PjUahS0d8LznTbNYq+GWt8qpxij9XPw2AWt2IOQgz0LVGylYfm9wToAqfd/ILG0Kqah/1NXU3GMbSK7ilQDj163i5QzPHe6oBPbBMuatXPa1NRTYvE0z/VqNlV6L+XofSjDGuYdX3/hNJG19vlzUJhmb502q65w/ns1rn8pKGVjdZvAztdGvjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+QE16cVE39IrMTnbbntpFAUWhg8Au7g7NLPQl/9H2Y=;
 b=lkFs+Tkee93O/MJb4hYT1Ba8C2lFSYG8Ppy2JwUrvF8Q0MAh0+J48dOfWTDssID3pAQgahwU4amvhjEPTDnXNDibLRL6+jWcZQwudamUVPXPS+mF3XRkxTjZjP4XlRM9di9HACGvIDPhi1XsgnR+S9GwOox6sOj2H76pkiBoMWTYTrrA8Abe/Lei7+1vlqM0vCDwmSslUgYqnatoT6dDXcvufzcfnIHzNHRIXWEKN/keVbH/idqRbK0JMIwy5leOyxvbjmKw3WJk3gHp+DWKqJdU1soS1ztaR7C4ToE6qytbJhubWpCS9qgjSo1m8nTTEQN045Ll+wG/jGNZpT33Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 05:08:26 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 05:08:26 +0000
Date: Tue, 4 Mar 2025 13:08:18 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Brendan Jackman <jackmanb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, "Johannes
 Weiner" <hannes@cmpxchg.org>, Oscar Salvador <osalvador@suse.de>, "Vlastimil
 Babka" <vbabka@suse.cz>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/page_alloc]  b4cfcc26f5:
 WARNING:at_mm/page_alloc.c:#set_pageblock_migratetype
Message-ID: <202503041001.181427fb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 47aa7057-ce04-4db3-bb20-08dd5ada9899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1sToBM1iEGJUdHBeE4WiPXOaQciFDEfI6iF1GlCWpoyV5QwZT9ZfSgprHnX9?=
 =?us-ascii?Q?OQZKIKwQnmeylNdd8m54s8ozqUr9L8vOCwW3aMl8uCSq1iGcM5KWR7oz/LB6?=
 =?us-ascii?Q?zhjWZs3228HZILxyMQ0qizyzyfbEIM2EKhFzyLpkqs9AGdZ+VTKMTjBEnGWw?=
 =?us-ascii?Q?BtTlsMxYicp/1sUNESsmlWo1oBki/3wY2nefEvbSgdNlJUxEEW6XdYCcNx0+?=
 =?us-ascii?Q?Ixy9ALmOF0NedHpnuP/NBJSk9YwXHwidwSaiHnHTmBQtQ7dzqzECY227jTpf?=
 =?us-ascii?Q?0pbVm8NA8sjAWIWdvdNIeBfERelmHgIcqLkqeRlJ4JRypUttHs4N+lWy9EAF?=
 =?us-ascii?Q?O7ro0AK7Y0jpOGfU3KG+29PunZjyKfLVNRpICvcaxjq9OQakVG+4Xupcgxhg?=
 =?us-ascii?Q?IvG8Sv3WZqdk5qf0ClMP5gTNsgXCEcymRiKTqz+vPgjHYTL4Vk0RR1tSyIRH?=
 =?us-ascii?Q?3IEK+FkzEsU6y84De2U0IRiuPL/YYf77v0pEXAUzdQZhvlVr4ItRz0hnlO8j?=
 =?us-ascii?Q?ZRuZ1YMjjiXk/ZeKDeZsny5PTiaEkugP4oE4HrE9cOY0A/DlgYPda50TYJTe?=
 =?us-ascii?Q?Tu7/xt8Tx4Esfkm0YaMX3oZmj/bo2ThXQ0Vo5jR5Ez/9htxE1tiR5LmWdGl0?=
 =?us-ascii?Q?UNuhlGNhA/pZijk8hoSbU0dZs7gRm20OVuAab9Mcf8beZLM0qwQGAZEBMZEQ?=
 =?us-ascii?Q?gtU+hqiREqHvl5Ny/pDsO3HevZfi2LdwCUhDJF3QqfRmyy/h6QVARd5QnWDe?=
 =?us-ascii?Q?PZ933oLqkRdq6kGdT2Fsjy2qK4tUHxa3kMdV4uDbgyjTo1IJGCBogogvQ8st?=
 =?us-ascii?Q?5HPlywnvGWmVolkKE/FCqAH/WIHgW+ylxkEO6DfBVIGJGxwCr00vifvMNETH?=
 =?us-ascii?Q?P1uxEpaXLHm/95W9w4Naug66/gJ4N3gRjUMrjK98PdSLu0tIV/50ezmgBhux?=
 =?us-ascii?Q?YUXBgxjUKlPuy1P9p6ICDmWzYM9VwfdTpdAs0rH7ozVTyAskmMTZCT9GWkYt?=
 =?us-ascii?Q?35MQtJbGlR/7rzgW1s9epKTRmpP99zXj21NWIHdIWWRpGrR/y9Wv0a/kUMgX?=
 =?us-ascii?Q?mZhCKudQGvwPsqcD0evBNml0axhyJufTE/RuDEjGOIQE6AqivBoS/ysdTGKb?=
 =?us-ascii?Q?wlCJEOSflnADo2tdHNNQjUNkP8S72jYFbfUKsdWn4c59AAF35nN6b4/Dg28O?=
 =?us-ascii?Q?ltVK1c8afE9r0HM2fH92+vDMsc3jaHm8fB0jEuH/NaSoykAbYYeqMPZu7QDd?=
 =?us-ascii?Q?EYNfp/beckj8MstloWjEjr61GzmNU5Ezjdb2gB/QHhJ5GnZ9jy1mN9HtG3pa?=
 =?us-ascii?Q?Zngan6zuKMBm3rsT0plpd+SDUp9O77uuNheiTHJPHDUl6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yA7vdIrOTXLRZyRYhbuvMp3K/hDwVarG9qb4aS5fH4Va4LpeL1Qqzqrq2j59?=
 =?us-ascii?Q?vWS/mDTY65+eSQ8R1ioNDpFQ8OxUe+rJhIypDPxOiWAjorqcFq1KyuD7heAX?=
 =?us-ascii?Q?w3qLziHP+sPgqDzt5Pt9L9Kk9+YDe80rn6AU//If1oitZYLKISV+7Uedtxew?=
 =?us-ascii?Q?GpNLY9hRv+kdr1omVRXGhDSbCHVKhMv2yEEJG6RuIkpy2ec6tdyG7GBrheo8?=
 =?us-ascii?Q?O33yvFJtHPG8xjwTEG7Al0xjEs4VuJLItkXrmXYlBURV52sd/W1G4eOJh3jl?=
 =?us-ascii?Q?vVeWYnITbdZp3XAFNGzCALPdQhXPdD3KV4E49g5rrdF1RxdvxCb7rN9i3hbt?=
 =?us-ascii?Q?I+acqm+jY/8tM7auq2vd4srshxozYufgXEW1crN6vyBByKKCfjDbqcPdSt8W?=
 =?us-ascii?Q?AgSJnHXswvjTAJvuvOo5831bKHS7UKZvyEtmtwTe/5XDsBMHP6f9EBXW7r3e?=
 =?us-ascii?Q?9TCmehPwb66A7+QEkY21sUJs7lMGM/l4GTgAtbMhS8x+2eF97wcFJLCuS4r+?=
 =?us-ascii?Q?eSNqHXfrSlhTZokjCT+Z7ZgaG5Nf4Zo45bXG3tZfDtFODViPLdE9IvVxMywB?=
 =?us-ascii?Q?Dp83Rtpiu9H+HOJGmLVm1oFiZ1CR0EpX6jdKNo78fLLuVTbiyEUNGVwdIHDx?=
 =?us-ascii?Q?cSv3UNiYvfUYYjusyMn56fgcte+WhD2wOfz0Wc6Yqe03iEVOrJexqQH2TZIY?=
 =?us-ascii?Q?Fib/6QZnmgaRp+Yack+sFFIJlwkoaJTuWRm2ARR82OuUANeU0TxQJSZUx7RC?=
 =?us-ascii?Q?XUWdxFW+2MAHRMjuaw3v2VseMhwAtUPo+v88E+oQMTdHMCOiKGXu4ThJyrWn?=
 =?us-ascii?Q?lu9o+/zxeauYBG/sYf0rzkUWpgyMX7AVd2j+0Ti+Z0uCaS8yqr6Af2rdSOML?=
 =?us-ascii?Q?p74WVu6s53duZ56y4uIO8bD960ocWIafbzanEcvbirXOQpl9WdF8tIpFn2F2?=
 =?us-ascii?Q?41EgQCOROxL5Chb7FY3alHKdolHYmqiLkh0rqjP3oT50NlvXuumak7WTtbMw?=
 =?us-ascii?Q?xOskOhRoOdmPRU9+94OC1HmGXfc8LWRVABJybpFN7kN3m671/YcjhYUjHiNE?=
 =?us-ascii?Q?1+CBKD+UCOaZ2dWFat2mNXj6j0+SiG4ptbf9DDfPNPoZdyrX2kzchblS/ymH?=
 =?us-ascii?Q?anmxiW92/HUmy9FT77hPEU2LIclZzXd0Mgi14Fq+B5gOpgXh17EfXWY2y6hP?=
 =?us-ascii?Q?/iF61NgpgbY+6kF9HeuRtkif1ujoUE7IKFF5HssUpFUJVmuAz5HzMDDwIZ18?=
 =?us-ascii?Q?CTTv5OXw2ykCC/VpqW8A47t2o0GLN060/HRQs9ygmKeryv+6+YCHO674N7Nc?=
 =?us-ascii?Q?G5oxSoxoH8qer7edbWBqgF63yfIXX9vx5pFRLfxFOhzWwLCWFHGeScB+7Zgy?=
 =?us-ascii?Q?5UDrHG5XygXZ9XiXzAvRP1jgf0yiVwxCZ1rxmioMD9FMbljuUyylIFf5w7SO?=
 =?us-ascii?Q?Von8GXgDoc3LXYBjlS2flPoC/9l/vcXCQDyHW+JujGuyiqa+G7vLdYWAhx4t?=
 =?us-ascii?Q?PoKK7tnTa9KN73vYeuRwiChIRTsknyr4o7uYCc/A+F1OEF6SKxMtWm5KOlY7?=
 =?us-ascii?Q?FLIAO7OvvVE2qdpqoIBJ8y4cf41VkIRP31wOPWm5EZ32vN9HCBeFB/EssEc+?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47aa7057-ce04-4db3-bb20-08dd5ada9899
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 05:08:26.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHbSBu/FkIbCA3ZIVWJAUoj3UUD+XehORw+1LRfmL+EEk84DdCsJXNyvRRQnwSkpW1s+CCJehqAa7WOQAsBLeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_mm/page_alloc.c:#set_pageblock_migratetype" on:

commit: b4cfcc26f507ecef2861ccfb883698933083fce6 ("mm/page_alloc: add lockdep assertion for pageblock type change")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d]

in testcase: boot

config: x86_64-rhel-9.4-kselftests
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------+------------+------------+
|                                                       | 9ddc3bc5d4 | b4cfcc26f5 |
+-------------------------------------------------------+------------+------------+
| WARNING:at_mm/page_alloc.c:#set_pageblock_migratetype | 0          | 12         |
| RIP:set_pageblock_migratetype                         | 0          | 12         |
+-------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503041001.181427fb-lkp@intel.com


[    1.719769][   T29] ------------[ cut here ]------------
[ 1.720287][ T29] WARNING: CPU: 1 PID: 29 at mm/page_alloc.c:420 set_pageblock_migratetype (mm/page_alloc.c:420) 
[    1.720287][   T29] Modules linked in:
[    1.720287][   T29] CPU: 1 UID: 0 PID: 29 Comm: pgdatinit0 Not tainted 6.14.0-rc3-00328-gb4cfcc26f507 #1
[    1.720287][   T29] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 1.720287][ T29] RIP: 0010:set_pageblock_migratetype (mm/page_alloc.c:420) 
[ 1.720287][ T29] Code: 77 6a 4c 89 e0 be ff ff ff ff 48 c1 e0 04 4c 29 e0 48 c1 e0 07 49 8d bc 05 28 06 00 00 e8 8b f4 3c 02 85 c0 0f 85 17 ff ff ff <0f> 0b e9 10 ff ff ff 48 c7 c7 d4 1c 28 87 e8 b0 18 0c 00 e9 bd fe
All code
========
   0:	77 6a                	ja     0x6c
   2:	4c 89 e0             	mov    %r12,%rax
   5:	be ff ff ff ff       	mov    $0xffffffff,%esi
   a:	48 c1 e0 04          	shl    $0x4,%rax
   e:	4c 29 e0             	sub    %r12,%rax
  11:	48 c1 e0 07          	shl    $0x7,%rax
  15:	49 8d bc 05 28 06 00 	lea    0x628(%r13,%rax,1),%rdi
  1c:	00 
  1d:	e8 8b f4 3c 02       	call   0x23cf4ad
  22:	85 c0                	test   %eax,%eax
  24:	0f 85 17 ff ff ff    	jne    0xffffffffffffff41
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 10 ff ff ff       	jmp    0xffffffffffffff41
  31:	48 c7 c7 d4 1c 28 87 	mov    $0xffffffff87281cd4,%rdi
  38:	e8 b0 18 0c 00       	call   0xc18ed
  3d:	e9                   	.byte 0xe9
  3e:	bd                   	.byte 0xbd
  3f:	fe                   	.byte 0xfe

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 10 ff ff ff       	jmp    0xffffffffffffff17
   7:	48 c7 c7 d4 1c 28 87 	mov    $0xffffffff87281cd4,%rdi
   e:	e8 b0 18 0c 00       	call   0xc18c3
  13:	e9                   	.byte 0xe9
  14:	bd                   	.byte 0xbd
  15:	fe                   	.byte 0xfe
[    1.720287][   T29] RSP: 0000:ffffc900001f7818 EFLAGS: 00010246
[    1.720287][   T29] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
[    1.720287][   T29] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffff88843ffca128
[    1.720287][   T29] RBP: ffffea0004200000 R08: 0000000000000001 R09: fffffbfff0d0a3f5
[    1.732783][   T29] R10: ffffffff86851fab R11: 0000000250a00000 R12: 0000000000000002
[    1.733766][   T29] R13: ffff88843ffc8c00 R14: 0000000000108400 R15: 0000000000108400
[    1.735764][   T29] FS:  0000000000000000(0000) GS:ffff8883aef00000(0000) knlGS:0000000000000000
[    1.736802][   T29] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.737630][   T29] CR2: 0000000000000000 CR3: 0000000254c86000 CR4: 00000000000406f0
[    1.739766][   T29] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    1.740742][   T29] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    1.741750][   T29] Call Trace:
[    1.742299][   T29]  <TASK>
[ 1.742880][ T29] ? __warn (kernel/panic.c:748) 
[ 1.743568][ T29] ? set_pageblock_migratetype (mm/page_alloc.c:420) 
[ 1.745303][ T29] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 1.746115][ T29] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 1.746574][ T29] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 1.747300][ T29] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:574) 
[ 1.748222][ T29] ? set_pageblock_migratetype (mm/page_alloc.c:420) 
[ 1.749624][ T29] ? set_pageblock_migratetype (mm/page_alloc.c:420) 
[ 1.750302][ T29] deferred_init_maxorder (mm/mm_init.c:1949 mm/mm_init.c:2072) 
[ 1.751310][ T29] ? __pfx_deferred_init_maxorder (mm/mm_init.c:2040) 
[ 1.752300][ T29] ? __pfx___next_mem_pfn_range_in_zone (mm/memblock.c:1364) 
[ 1.753301][ T29] ? find_held_lock (kernel/locking/lockdep.c:5341) 
[ 1.754190][ T29] ? find_held_lock (kernel/locking/lockdep.c:5341) 
[ 1.755598][ T29] deferred_init_memmap_chunk (mm/mm_init.c:2097) 
[ 1.760658][ T29] ? __pfx_deferred_init_memmap_chunk (mm/mm_init.c:2084) 
[ 1.761657][ T29] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:116) 
[ 1.762299][ T29] ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114) 
[ 1.763299][ T29] ? padata_mt_helper (kernel/padata.c:487) 
[ 1.764181][ T29] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/atomic/atomic-instrumented.h:33 include/asm-generic/qspinlock.h:57 kernel/locking/spinlock_debug.c:101 kernel/locking/spinlock_debug.c:141) 
[ 1.764602][ T29] padata_mt_helper (include/linux/spinlock.h:351 kernel/padata.c:488) 
[ 1.765307][ T29] ? padata_work_init (include/linux/list.h:37 kernel/padata.c:114) 
[ 1.766175][ T29] padata_do_multithreaded (kernel/padata.c:564) 
[ 1.767609][ T29] ? __pfx_padata_do_multithreaded (kernel/padata.c:506) 
[ 1.768305][ T29] ? __pfx_padata_mt_helper (kernel/padata.c:466) 
[ 1.769248][ T29] ? __pfx___next_mem_pfn_range_in_zone (mm/memblock.c:1364) 
[ 1.770666][ T29] ? __pfx_deferred_init_mem_pfn_range_in_zone (mm/mm_init.c:2004) 
[ 1.771688][ T29] deferred_init_memmap (mm/mm_init.c:2148) 
[ 1.772310][ T29] ? __pfx_deferred_init_memmap (mm/mm_init.c:2109) 
[ 1.773256][ T29] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:116) 
[ 1.774592][ T29] ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114) 
[ 1.775296][ T29] ? __pfx_try_to_wake_up (kernel/sched/core.c:4177) 
[ 1.776188][ T29] ? __pfx_deferred_init_memmap_chunk (mm/mm_init.c:2084) 
[ 1.777635][ T29] ? __kthread_parkme (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/kthread.c:291) 
[ 1.778302][ T29] ? __pfx_deferred_init_memmap (mm/mm_init.c:2109) 
[ 1.779277][ T29] kthread (kernel/kthread.c:464) 
[ 1.780556][ T29] ? __pfx_kthread (kernel/kthread.c:413) 
[ 1.781304][ T29] ? __pfx_kthread (kernel/kthread.c:413) 
[ 1.782093][ T29] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 1.782726][ T29] ? __pfx_kthread (kernel/kthread.c:413) 
[ 1.783300][ T29] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[    1.784206][   T29]  </TASK>
[    1.784520][   T29] irq event stamp: 755
[ 1.785224][ T29] hardirqs last enabled at (765): __up_console_sem (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:97 (discriminator 1) arch/x86/include/asm/irqflags.h:155 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1)) 
[ 1.786827][ T29] hardirqs last disabled at (776): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1)) 
[ 1.788797][ T29] softirqs last enabled at (360): handle_softirqs (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:408 kernel/softirq.c:589) 
[ 1.790803][ T29] softirqs last disabled at (355): __irq_exit_rcu (kernel/softirq.c:596 kernel/softirq.c:435 kernel/softirq.c:662) 
[    1.791785][   T29] ---[ end trace 0000000000000000 ]---
[    1.889842][   T29] node 0 deferred pages initialised in 170ms



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250304/202503041001.181427fb-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

