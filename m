Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F601DFD8B
	for <oe-lkp@lists.linux.dev>; Tue, 10 Feb 2026 03:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692720; cv=fail; b=n46Rx8FjNV89XVizmggBGZE4xjKJmDNPw7e6UXXtE0qmFg7dUzI51yRAMmpmlK2L956tULyz2fPb0C6KG72MHP7DN3vrNLOwNMjb6sZmrcyh2dc1FanKS5hrFeoLcpkyn30c9/OJJ+0tNsS0uUb8pj6Hjg0exzKOcgHHO8JGGGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692720; c=relaxed/simple;
	bh=epULv7NxHPTssdDwUxsBmZVzJ/Z4UYubHLofQNrlhEc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uqR9PbLNVm1Q7yoIxdKQnG0Gm+hOgCoJvG3SGonJ8LYbN3bxtKRnJ9DtNPtLSmmGqpv0a7R/BMnZ7WCBPPVLnsjp76MxzOsDu0sqKZBiIqVjqY8ba6tDqiZ712XpA0ZuLpRiIdN9hG0f7ZK8/zAgpfKIKym454hhGBUWbACtZWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU3bLYWv; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU3bLYWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770692718; x=1802228718;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=epULv7NxHPTssdDwUxsBmZVzJ/Z4UYubHLofQNrlhEc=;
  b=UU3bLYWvlU1npoCwcyMmR8kqomH+coSw+h2T/UvI+qLf5ntHDe5F7zSN
   n+tNQ5GJGq/eGrwqG0YzXk3hgy8astwG80YY0KpEgqI69fEHHKAHXfPXE
   d7p3FJjTXMnMbF9pxUhSRkteHkh92PSAxniKsCEClwDcF1IdHSAmuvwCe
   KzrIt+kHV6h9NkHzEGXLTApNoHQrIJ9jdq4BQke1fnvKNiQUsyxEVcvVO
   GsXlOYL3x6Fg4Lqfwrgu34ZecUnmtqXlW7Ke7eDkFojooP6it2ivqBmZU
   ewn1OlUkvOKlK2OZdfxU/pNAjbAKctbEidisizASBy0F3b8klhlpKx38S
   Q==;
X-CSE-ConnectionGUID: gN1vhgfbQYeaUMhJU+AnSQ==
X-CSE-MsgGUID: 6nBuFonCQRSjqOoMVwgtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71801015"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71801015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 19:05:17 -0800
X-CSE-ConnectionGUID: WUi7FiELQcu7enmb3TlsoQ==
X-CSE-MsgGUID: mXKQFkp5SBSLkDcGSFTGpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="241821398"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 19:05:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:05:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 19:05:16 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1oFSrkVZB5VsTdwwpYVkb4U2PGF1t7E7GjZCeCJ+AyM6fsa75qRnbRTbN5wGn5Mk56UmiNC/ZcJDzSWhxEftyyIIMh5w97IYB0R0zVtbBjYXpy0duN9o7O4sYydmnRON1Zw7BNVL7f6XfaPoySeH3As5EtZuePZrWknimz1nc+1Zk5/7Uwur/VLGljmj3Z8lJwD5lpQIAS09TSIejLiTnEKNoz+Q7DxQSB/vH327a9nAfLqLUUINd3RVhA2ji9xEWrrCg2tcTXIOqTeD2NtKawAoBwIuT3cVCneOBaOTowV0ugNWQd91cpY6IHG2fdFFGOgmCn18STquC+wICxUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzqpLxNIrmeb1Fpu53a+QLgcTsz0oCaBVBsJliVlqSY=;
 b=UB6KVtqB7cfJfz6N76qHgf9DKynL919bzRGOG1mS+KVh17dPPHfg1nkj0DejKZSrlW8OdExO1IU/ksYv7W9/ZMzGtBOPC9eKZjbTCdnqdnc7C10uASfP05uwnhV7ymeGdfHwMr0OmLCUdfF+E74bScMybdzURUs8W4gOklCi48TKyr8tNvJhiHpk4ugU28ffTEBc+whIQJOHpq+5aZ6tZTHyCucdzlBSh6YQxh0rjwSgWrvjRiynZ99oeP8DWyLUzXbukn+0mR3No5Q/TlSrXJB9t64VI6drEQy+2lsZs1V/9xwkdRxKwi3ygEwwl7Cq86TuSX9uyyS/CO2f2gKljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 03:05:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 03:05:13 +0000
Date: Tue, 10 Feb 2026 11:05:04 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/deadline]  1151354225:
 stress-ng.sysbadaddr.ops_per_sec 16.9% regression
Message-ID: <202602101005.d6ed888c-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a41f6ba-e6fa-40a7-f420-08de68513559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IBHRrqw1tix5ZAIbQqj6lHQtcTvIBCu7v74jlsgKgkPgIQiMks+/gUT4tr?=
 =?iso-8859-1?Q?QdN489gBZnA1VrwKWuoAR+7RmjUfw/cjVsuDp/KM9BwG3d+uoZyf8Sqp85?=
 =?iso-8859-1?Q?+XjPFE4PV/JPkJFEQbgGNOLuk2yQimOSMjx2eHkAjYO6X3tRclXAlhyCjW?=
 =?iso-8859-1?Q?ieLz0LbYHy4UBcSIEQQd7hZEgcz4p9DLFniWVPDUl76a6Wj7xLzZci3DUs?=
 =?iso-8859-1?Q?YRt0FfafW32XCthXsk16GmLedh49AhPeldOwq9iTDlzNkgPdTqWMghB8IX?=
 =?iso-8859-1?Q?uU7gFsFkp96cRy23BK8bI1JTfamEooG6SmF99vcM7qbVZdUttbHAe4VHMG?=
 =?iso-8859-1?Q?z3w/8gTLxDYd9IrXwNqVKX1o0pAyE8omU4p0fYrKflZc6NIPNS0Lor7YlP?=
 =?iso-8859-1?Q?5Jz49pVwQvrsgLZBTvpLfGrqkAW5IHBYiQblCDuBuKO+FcHtP2bwEsNlCc?=
 =?iso-8859-1?Q?sPYykeo/vjDGRRwYKsOGEqHWEkpxTkVdXqisiDcPGfXka5eW+XOPy7zriu?=
 =?iso-8859-1?Q?B+PqWNC8UKjhzrXV9uLjTc37pe7lJnxtTFa/ZE5lsHqNKZxiWUFn0YqHky?=
 =?iso-8859-1?Q?e/uRxC/r2APHRiPtYZbk3ol6mxHp6cbCSZV8Ui00eYzny4ogRjfKEpN8KW?=
 =?iso-8859-1?Q?KZCxXL0CqKHK8fppZfF94FOKF5z2UFN2qYF+cv/U9WoJZijwuyFVo7cALr?=
 =?iso-8859-1?Q?RqZye5gy1uzKKvVS9/yYjiAW5dflVjxYAWy7OM//FxvXta+ZvB6R0hOg2D?=
 =?iso-8859-1?Q?2oPtIhH2k/I5VQ/S5AXbnWYxOwtua6fhIEsvcrXh/8KE3PCQX3ld8PXMZw?=
 =?iso-8859-1?Q?R6oGR5RW9DKWd3e+KCDPtSp779TFBKOqj/fv15fBjZp02UO94o35GQLOvk?=
 =?iso-8859-1?Q?LLxkVgnjm+eTx0MCmkFczYzO5eBMpAv0Xxqr7+zvFbEA27rHwfZeAch67U?=
 =?iso-8859-1?Q?XKw/vA01XVCag+qtJM5Dnikjv1BiDVr89haimbVdK6KwPwWGdwqOZH/UII?=
 =?iso-8859-1?Q?SNhEcBuOmJpNv5bfnkGu1SWYiuJyx/LU2Qjy4viR7X+HP07i4H+TolEfxJ?=
 =?iso-8859-1?Q?pg8l8bdlPYxpLslbymSqfLdaQ8iChXbh76uiHfhXDifOSnwWnIRADivWAG?=
 =?iso-8859-1?Q?yJyxOoLWTHWWMV6fxm6KiP7I0eVi5lTvpBfIW9XZbuP3XUKfcS/wwbDNRu?=
 =?iso-8859-1?Q?I44Nq5UX919gG4y/pAC/4dC+t5a943Hfap+jfE5LBFvSkgmb9+0k88HRtG?=
 =?iso-8859-1?Q?IkIVDIj+kZ2pRsgCIwFUEQpdEx+euP8vxE3xYAaT/m1zHPdWgzWJZiTxif?=
 =?iso-8859-1?Q?VZwHbJc+BgK+T/OWDcTWBBspI/bJHFDvs+7GRaMiYHZsX6s9pOpEuengj2?=
 =?iso-8859-1?Q?80lWNXQNDe5OlVxBe2x3NRCD/bMbf7H7q9wdDcg5ccO28FjdeL1wxxnJgC?=
 =?iso-8859-1?Q?A801damYfSQdEjB7WyRVC+vMj1mDxo/Do1NWKh+p4w6k2vSfisY30TYKVa?=
 =?iso-8859-1?Q?54vuWuOH9+gkd5EsJH7GgjdFdLqLGxSykFmjFFtyvVK1AmgQSvhzQQwsIf?=
 =?iso-8859-1?Q?cdUnBZoAiKZxgH78a1mTFQ2jALTb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fVcjz8GBaKMP5fnar/JlF4jbddzRnBL7pI9hZIdh5xUdxNHJlT9lMjradg?=
 =?iso-8859-1?Q?Sq5TCSE5AFNcRsg59TJ0DmW4FdY4+u01jz6Sj6rXyvBRhLnQnvru28Xink?=
 =?iso-8859-1?Q?/Qa8Mn0QEQzPOBdgKQUpvGIWKC+0GnotBasR9D6GizS8bIdz7F07zMmtkK?=
 =?iso-8859-1?Q?L3xYREqspQP8/HWdPI2B/+cMtLnSTIFv7vLsv88WTN1wMMQQWOU+6Z+CyX?=
 =?iso-8859-1?Q?TKORsLwIikw5n0ly/5WkqDZXO4TNMhHZVV9oNDs6BU4W3qBw+X/tmQUgm4?=
 =?iso-8859-1?Q?tQKa12xgpKszRsaTNxWtWTweSXctSUZ1dNswR6opghBYmrdeJ/jgp9VJSA?=
 =?iso-8859-1?Q?HO1jdev7WB3S3ezmWzVCOM2JFI/PDU7gguKcLYFu+uBNxXXt0LGolBUWTs?=
 =?iso-8859-1?Q?Q0X5iy+p7WZceGKzkbW6KJda7aa+ltag4LXR9nBxFtqjWWq5nUHOi+gxqu?=
 =?iso-8859-1?Q?SYlkbmP65Pe8Bj01Qwb6x6Kwt2q4ioP4j70j10cmIfeo3tqUwh2jNRbqvv?=
 =?iso-8859-1?Q?P5eMavynvn2AT9T/Mt/vJkP9bZMDl6Hz9x/dWDh1z1eA7BVMUBCQoRMZPq?=
 =?iso-8859-1?Q?C9RlLh5aZP57noYT+N3I97m0tk4zDKSIN3gTZ7JUqFKdGD71P2Oc4ml4FZ?=
 =?iso-8859-1?Q?GBhaPPBFW5zCdTutnUMOAF2E7DyTBKxE6jsgX/DyUL0K4TbSrSm5spOg8B?=
 =?iso-8859-1?Q?sswPm4t3fZ7293t+0vh7Y1lNXlPRe/8+0KXaFlgrYbkJwx2PjTZJTYjBNz?=
 =?iso-8859-1?Q?R7k4PLkRt4XesbrhQUHhw6xBHByJUarhoJbKkF1JTFojpvakF/AAmwbiKJ?=
 =?iso-8859-1?Q?IywMNct0NfmpEamcHJrBYHa07onMGgliGXSG6su5cGvHPSaQmYROJOmcMr?=
 =?iso-8859-1?Q?kqSy4q03usOOctiArT3L+vFNqOZEDFWrA4IwY0S4+YQ3cDS2YqCazDBXMX?=
 =?iso-8859-1?Q?BVQtOhcmcPlAXV1t7r9uOzCTbI6fjGGKuDZS/mgbqDOxmeMSPqNoSGw3rU?=
 =?iso-8859-1?Q?R97MHiygAMSBGJF2uvET/6sXJe9mpwiG/RgDe+RixniB0MsYy8VBA620Y7?=
 =?iso-8859-1?Q?nlo53ZCpRE0dwAqlRhvx5pvpjZlMJh3onFOjGF//nmoF9/z9PQ9DQISK7J?=
 =?iso-8859-1?Q?DDWgGGtVuvJzjASVU5LtD1tH/WQyZWCw15K8AFzXE1/29m/tDgd7SmvRJB?=
 =?iso-8859-1?Q?P1kiDG3LC4wVyAnELMT10zIicUOmK5Ym8XEdvp1dKCcI+b8hUZyJk/vkAw?=
 =?iso-8859-1?Q?bgpGtUO6IUw32+ae2DdzjS+m0HzwQCNsYO5QQAzsZpTVk1YNsoXdqcT7+Y?=
 =?iso-8859-1?Q?GTgxjBwU9gLaW9tB3jXl5SxPV9MvSr0RdI6MVZl303peIEPZ8PAIEqafqU?=
 =?iso-8859-1?Q?sZIGZ5ggTTNEyFx79PotfRSHHOlsypvCwpb3lamcYT6z6Ae9N/uEkgnxVI?=
 =?iso-8859-1?Q?ZJtN4l/5IhCqbxinYJqZylV+NKjYr4McTXgpxrn083E93eYMfbFbSzyv5w?=
 =?iso-8859-1?Q?QBIiBCzn1YF0w9+sXW+TXrTAYbHcMd/dmetHElMyMHDrccj612jNt3ceSd?=
 =?iso-8859-1?Q?4ESP6N5cq9xKzYZQgblJwp2blcgxi2VBddLmgC6qfhUF0ppCFNSh6tPOd2?=
 =?iso-8859-1?Q?f5l/8Lj/PnXyMXJzg74B32MOLro38mcFj5zygCHgH+ClDlVwJ6XvqirEOC?=
 =?iso-8859-1?Q?y9+WW48PJwMhint7uQfLqo93e2mMsEGH+l/x3N+FvFSO42gkeT3xtLoklo?=
 =?iso-8859-1?Q?WD/ci1FdYrKJriz+SSbKKqYBRAA/LkQE/HJHKuK6Beg+op7PjEkorPS2dF?=
 =?iso-8859-1?Q?pMGWRlN+uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a41f6ba-e6fa-40a7-f420-08de68513559
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 03:05:13.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rJEyZFIy1ATYUiNAw4dn31Ot3QV6pUXUY+NI4eh61X4tI2EzEfgP4q3pxRXzhuwNPmztlavM5I8AovunXGp/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 16.9% regression of stress-ng.sysbadaddr.ops_per_sec on:


commit: 115135422562e2f791e98a6f55ec57b2da3b3a95 ("sched/deadline: Fix 'stuck' dl_server")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      e7aa57247700733e52a8e2e4dee6a52c2a76de02]
[still regression on linux-next/master 9845cf73f7db6094c0d8419d6adb848028f4a921]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sysbadaddr
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602101005.d6ed888c-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260210/202602101005.d6ed888c-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sysbadaddr/stress-ng/60s

commit: 
  v6.19-rc7
  1151354225 ("sched/deadline: Fix 'stuck' dl_server")

       v6.19-rc7 115135422562e2f791e98a6f55e 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     89928 ±  7%     -15.9%      75673 ± 11%  numa-meminfo.node0.PageTables
 1.052e+10            +5.4%  1.109e+10        cpuidle..time
  20439789           -15.1%   17344810        cpuidle..usage
    272197            +8.0%     293980 ±  2%  meminfo.Mapped
    171599 ±  3%      -8.4%     157102 ±  3%  meminfo.PageTables
     56.50 ±  7%     -16.0%      47.45 ±  9%  vmstat.procs.r
    402557           -20.4%     320282        vmstat.system.cs
    570332           -19.2%     461095 ±  2%  vmstat.system.in
      0.55            -0.1        0.47        mpstat.cpu.all.irq%
      0.35            -0.1        0.30 ±  2%  mpstat.cpu.all.soft%
     21.37            -3.2       18.20 ±  2%  mpstat.cpu.all.sys%
      1.19            -0.1        1.08        mpstat.cpu.all.usr%
  47574572 ±  3%     -15.1%   40407618        numa-numastat.node0.local_node
  47713303 ±  3%     -15.1%   40509520        numa-numastat.node0.numa_hit
  46372877 ±  2%     -15.6%   39140423 ±  3%  numa-numastat.node1.local_node
  46483726 ±  2%     -15.5%   39282616 ±  3%  numa-numastat.node1.numa_hit
     22589 ±  7%     -16.4%      18874 ± 11%  numa-vmstat.node0.nr_page_table_pages
  47714521 ±  3%     -15.1%   40508990        numa-vmstat.node0.numa_hit
  47575808 ±  3%     -15.1%   40407088        numa-vmstat.node0.numa_local
  46484027 ±  2%     -15.5%   39282306 ±  3%  numa-vmstat.node1.numa_hit
  46373132 ±  2%     -15.6%   39140113 ±  3%  numa-vmstat.node1.numa_local
     10441 ±  5%     -49.8%       5240 ± 38%  perf-c2c.DRAM.local
     27988           -77.6%       6255 ± 89%  perf-c2c.DRAM.remote
     30307           -77.7%       6760 ± 89%  perf-c2c.HITM.local
     20500           -77.8%       4551 ± 91%  perf-c2c.HITM.remote
     50808           -77.7%      11311 ± 90%  perf-c2c.HITM.total
  11382479           -16.8%    9471558 ±  2%  stress-ng.sysbadaddr.ops
    189863           -16.9%     157870 ±  2%  stress-ng.sysbadaddr.ops_per_sec
    730453           -20.2%     583015 ±  2%  stress-ng.time.involuntary_context_switches
 1.462e+08           -16.4%  1.222e+08 ±  3%  stress-ng.time.minor_page_faults
      5002           -15.5%       4226 ±  2%  stress-ng.time.percent_of_cpu_this_job_got
      2450           -14.3%       2100 ±  2%  stress-ng.time.system_time
    558.73           -17.9%     458.84 ±  2%  stress-ng.time.user_time
   7545032           -19.3%    6088160        stress-ng.time.voluntary_context_switches
    702.00           -15.4%     593.67 ±  2%  turbostat.Avg_MHz
     24.26            -3.8       20.46 ±  2%  turbostat.Busy%
     54.46            -8.2       46.28        turbostat.C1E%
     21.40           +11.9       33.35 ±  3%  turbostat.C6%
      2.13 ±  5%    +419.1%      11.07 ± 10%  turbostat.CPU%c6
  41047137           -18.9%   33275561        turbostat.IRQ
   2895550           -26.4%    2130628 ± 13%  turbostat.NMI
    476.92            -4.9%     453.72        turbostat.PkgWatt
     33.86            -8.1%      31.12        turbostat.RAMWatt
   1261819            -1.0%    1249785        proc-vmstat.nr_file_pages
     57044            -3.0%      55319        proc-vmstat.nr_kernel_stack
     68078            +8.0%      73522 ±  2%  proc-vmstat.nr_mapped
     16.31 ± 35%    +541.9%     104.69 ± 23%  proc-vmstat.nr_mlock
     42826 ±  3%      -8.7%      39120 ±  3%  proc-vmstat.nr_page_table_pages
    336366            -3.6%     324322        proc-vmstat.nr_shmem
    137143            -1.7%     134832        proc-vmstat.nr_slab_unreclaimable
  94199637 ±  2%     -15.3%   79794929 ±  2%  proc-vmstat.numa_hit
  93950007 ±  2%     -15.3%   79550817 ±  2%  proc-vmstat.numa_local
 1.003e+08 ±  2%     -15.3%   84985632 ±  2%  proc-vmstat.pgalloc_normal
 1.469e+08           -16.3%   1.23e+08 ±  3%  proc-vmstat.pgfault
  99165759 ±  2%     -15.5%   83766426 ±  2%  proc-vmstat.pgfree
     87487           -16.7%      72919 ±  2%  proc-vmstat.unevictable_pgs_culled
     93994           -16.1%      78879        proc-vmstat.unevictable_pgs_mlocked
     93984           -16.1%      78842        proc-vmstat.unevictable_pgs_munlocked
     87454           -16.7%      72878 ±  2%  proc-vmstat.unevictable_pgs_rescued
    102462           -17.1%      84961 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
     67126 ±  2%     -23.1%      51633 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
    113508 ± 15%     -27.4%      82463 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     90.19 ± 19%     -67.4%      29.37 ± 84%  sched_debug.cfs_rq:/.removed.load_avg.avg
    250.01 ± 14%     -46.2%     134.57 ± 47%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     36.07 ± 21%     -65.6%      12.39 ± 83%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    107.04 ± 16%     -44.0%      59.99 ± 45%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     36.08 ± 21%     -65.8%      12.34 ± 83%  sched_debug.cfs_rq:/.removed.util_avg.avg
    107.00 ± 16%     -44.1%      59.82 ± 45%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    239.44 ±  4%     -12.1%     210.47 ± 10%  sched_debug.cfs_rq:/.runnable_avg.stddev
    238.92 ±  4%     -14.4%     204.47 ± 11%  sched_debug.cfs_rq:/.util_avg.stddev
    102432           -17.1%      84930 ±  2%  sched_debug.cfs_rq:/.zero_vruntime.avg
     67124 ±  2%     -23.1%      51633 ±  4%  sched_debug.cfs_rq:/.zero_vruntime.min
    113448 ± 15%     -27.3%      82455 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    249249 ± 13%     -24.0%     189403 ± 20%  sched_debug.cpu.avg_idle.stddev
   1193041           -16.1%    1000474 ±  2%  sched_debug.cpu.curr->pid.max
     56973           -19.5%      45891        sched_debug.cpu.nr_switches.avg
     75866 ±  2%     -15.6%      64019 ±  3%  sched_debug.cpu.nr_switches.max
      6795 ±  5%     -18.8%       5519 ±  6%  sched_debug.cpu.nr_switches.stddev
      0.01 ±118%   +1691.7%       0.24 ± 69%  sched_debug.cpu.nr_uninterruptible.avg
 1.587e+10            -9.1%  1.442e+10        perf-stat.i.branch-instructions
 1.412e+08            -8.0%  1.299e+08        perf-stat.i.branch-misses
 4.647e+08            -9.8%  4.191e+08 ±  3%  perf-stat.i.cache-misses
 1.273e+09            -9.3%  1.155e+09 ±  2%  perf-stat.i.cache-references
    421189           -12.6%     367928        perf-stat.i.context-switches
 1.601e+11            -9.3%  1.452e+11        perf-stat.i.cpu-cycles
     19252           -10.8%      17178        perf-stat.i.cpu-migrations
    347.41            +4.1%     361.51 ±  3%  perf-stat.i.cycles-between-cache-misses
 8.202e+10            -9.1%  7.453e+10        perf-stat.i.instructions
     23.97           -10.7%      21.40 ±  2%  perf-stat.i.metric.K/sec
   2416028           -10.0%    2173992 ±  2%  perf-stat.i.minor-faults
   2532961           -10.0%    2278615 ±  2%  perf-stat.i.page-faults
 1.557e+10           -14.1%  1.338e+10        perf-stat.ps.branch-instructions
 1.384e+08           -14.3%  1.185e+08        perf-stat.ps.branch-misses
 4.554e+08           -15.8%  3.834e+08 ±  3%  perf-stat.ps.cache-misses
 1.248e+09           -14.8%  1.064e+09 ±  2%  perf-stat.ps.cache-references
    412177           -19.6%     331200        perf-stat.ps.context-switches
 1.571e+11           -14.2%  1.349e+11 ±  2%  perf-stat.ps.cpu-cycles
     18872           -16.9%      15690 ±  2%  perf-stat.ps.cpu-migrations
 8.051e+10           -14.2%  6.911e+10        perf-stat.ps.instructions
   2369827           -15.8%    1995000 ±  3%  perf-stat.ps.minor-faults
   2484512           -15.8%    2090911 ±  3%  perf-stat.ps.page-faults
  4.92e+12           -15.1%  4.178e+12        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

