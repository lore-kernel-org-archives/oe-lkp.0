Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F702629F
	for <oe-lkp@lists.linux.dev>; Thu,  6 Jun 2024 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658170; cv=fail; b=PiNest0iV+FWLN9wp4yera4ecOaPcNewmqR3xCUMeF0ytC9sShJwN0qEDpSjvWdqsT4+uU3xL8f1gJ1MdvwpvO3zGqjaJVybvXYrPXHajqQezUqCPr5gkNKTDumIrlvQTiAlldQjRMPBPC+irIFpk+KxV/GcQcpDcBbw0s8kYKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658170; c=relaxed/simple;
	bh=65V8Mr48f7RW3S4UEvcVuqYTAcc3wb7AGs4Vaq+P4dc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=V6sdwibUjAJLcBEBgxyA5QpgZAFlZnBcB0vjMsk6UpBqqetllvqgVKqm7CatSVFZ1P+Thz1L/hIh9WEB2TSV5umHW442ZUzw2g71gvOLQFLXvPutOsSdBBC2q/q615OQ0lKAR8P6ABApGRa3iCqpzHJLJF/Z5pqMAjlqbs1iPQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lv4X+N2Q; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lv4X+N2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717658169; x=1749194169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65V8Mr48f7RW3S4UEvcVuqYTAcc3wb7AGs4Vaq+P4dc=;
  b=Lv4X+N2QKNjEtX9F0cCGhP3fwEyJL/oOqBRZgVjmUwSi/cn+MNJa0cwh
   DeiA1pijWwqFHQwEKiwal4OIWBrY7YXaE79A+OCObIqYcNWidJcXlYj7p
   3n80upUkQ+i4EV0Lwdw66ysL7KpPG0seeGlJl+i/pIOCyfoVadJv+lcZJ
   0X18kO1APCIneNbYbKbyXvsw/fpub+2vmzouir2Q4ttgXr4WZiSxDGlzA
   epQTHeYe01NM4BIj14dudGGwJA+c/1GXjpTFy2pg82Jn8AUnbmWQejbDm
   ZuP9uAuF8zKAFcbMidLTtMLS9sXpoBCEJdZXzRI9GnZJtmgMKxs/dt+ac
   Q==;
X-CSE-ConnectionGUID: mV9RUAatSW23nxtFL0azKw==
X-CSE-MsgGUID: A3Vlv9bQQwaCiHGChDW2pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18096559"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="18096559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 00:16:04 -0700
X-CSE-ConnectionGUID: L1E+wAUISDyBDqKd6P2FIg==
X-CSE-MsgGUID: 9uxRFTwTRSa6FMH0OnKLag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37882069"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Jun 2024 00:16:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 00:15:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 00:15:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 00:15:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 00:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVmIgk30lUu5NEzvitQzXsjGO8J6XgKJmvvrMQWf4CXg7YpJo7pVClOA8poME2sDxm/zk82y3FIJSZk/Kv1P+fOAn9EeEA2m1PgSCH+OONzDxLIUasx4AYhE9eP1MUfNTMAqlXHWnYVuOVrtTRUD5ovTsFOKOarC71POvixkqalahJtwAIagj/6kAI/onk+QKffcZv4FuEcj0LGrir+3V7sui0ArR9NeSDsbDqwJUsgUrKt132iccrEyDFQklkkXcDpY6iYb9t6m6EP7AHlrEbPjbGRsVMZTU6w3qP596XGYwtBdEuixGtKZ6DzfNZhqXHvGWazdE8ppOXU5dYOqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asici5IMQhKom4/BOQlnJwGp/odNv97mklrYxVllk/8=;
 b=OznGMoXEDnfoqQs/ytqz5/WspA2NH8QoN5TUuUhd5Z+vdWwXXYX3ez7u99TvygvvBMFz5E/iVzJJLBOHfZYehjWVLo0w+bVW+AUJwjkcjA2ODNW2d6xivOP7JEK0tsMzme8g29CBPVMAizd8JohPLl9Y+ilXGoKlgE4z5+enzpJodLcq6BuFJvIRZu94IUcvw8Xae/kwcJ87fHPK7rcKPtGGOuvGEfhk7oMjTRBk/z6rIOMwaFZcIOpUS5y3746SDX416IB7245NtENlSCls1T/6W4Mo5lN5Lv7u7wS8FOu1iNpBaMMDZMFQ+8PGZVcNrTrajB5ZPr0MBFfBmt0acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Thu, 6 Jun
 2024 07:15:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 07:15:51 +0000
Date: Thu, 6 Jun 2024 15:15:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [rppt-memblock:fixes] [memblock]  e0eec24e2e:
 WARNING:at_mm/memblock.c:#memblock_set_node
Message-ID: <202406061425.bf423dbe-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5b78b5-0d74-4e2e-aa0a-08dc85f87f20
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bW2nXqteJiu9C+KmJ9u5YyTBUzSDW3sfksBQRj5E4VInYk6wjJ0t+DYOM+VR?=
 =?us-ascii?Q?jNePOCefCGw81OyjAl3mDYz2/UQOmU6nfiblxFD+IG6wmcHLirw6l1uC6Yjj?=
 =?us-ascii?Q?XyonZxo8eF619jv1dzIZDmroUqvpReNVjqhXtiwzuP7Gt4XLmvgivvMr3L1U?=
 =?us-ascii?Q?cv9BruF/o7kjsO1TLIdoyDqgl7fYKKd7LebJtJWC0CQ/FJNS6uLA8cAfxBFr?=
 =?us-ascii?Q?5Ii+01ms45lG2K+vNw1bDggeKiRQ8/8R45Fpo7FfcuzdzzfmA/axMdAUduXl?=
 =?us-ascii?Q?cqV6yA66qUaVjTwd+2JLS6s8ZyLn93VyUHvcAKgX61kT9iNEfnDIAZ5/cd6u?=
 =?us-ascii?Q?VfAIccfK0rcbxWZSxTBmn27gxbU4erft5sGUUxBWkhPoO9RGBb3WVgCxsJXd?=
 =?us-ascii?Q?ThFu77XDnSGwTJdX/EiigLKOcAjaapjCHBallDQmI+dwKvXI2/YkCeZyf9Ok?=
 =?us-ascii?Q?gFmrhBWZ4UqzNrTh0D82td0E5X2icL+NTmMibApXyrL4kIPjWjrwtfFIHmx1?=
 =?us-ascii?Q?WHH12GC3i2w8jvoRuajE5FE4jCpKp9WffcAkzCvv2vY5HQPyUt96B+ig9hav?=
 =?us-ascii?Q?/fZzvRRGlfGoS+10EPj9TKEbi77Gr4YFQ1g4fFmliwCgNCLZkM+wnfoGMFFi?=
 =?us-ascii?Q?cI0OTqDEWtfyHm3gCljUFhudfvJuBC8SWcZwH70m3H9NFElSs9K7PJ56ExpM?=
 =?us-ascii?Q?96Ot1N/5u5brqttrNRDfTDgzeykqz3KF4eY3i7hJXN1+v661NAS7RqgTTx1e?=
 =?us-ascii?Q?RjXWLCBYm1xeU+IOrLTLcu4ZGyLq9kNAp7ZmKS2deN5za81fZfCHDQo1cPVW?=
 =?us-ascii?Q?+8oAFSN7Iwtp8gBwN49HgEVpLlB5QBoEIdZd/gxcqg51AxvS9V9WtrTbM+G9?=
 =?us-ascii?Q?+OtYx08JoCPKiab9/abz2yyZvUI0Lwmr/qQe/FuMdpHKjwOkzGZEU3x0Xz9t?=
 =?us-ascii?Q?YgjhgFnUhF91D+z9QDSnjjgk0psgJPyrGfokyxYcgbEdM+TkwShB6L7BBz7U?=
 =?us-ascii?Q?p8G7BVpX74zjyoh5EhOWXO+ss5ocWe3vUySM1qIc06xHXRQ4tI5LxXdWEqey?=
 =?us-ascii?Q?dAlARLre4b2b5vJ0XmEAhhaX8mQ/uePQrIGKZ6jUx1flMBP7wLpOoFy6dCWe?=
 =?us-ascii?Q?KwzVLgnGVcd8X7xofVND23VRxgfTwtHvhXkCuZAK9H2pHXBnFEKXpRiMooo9?=
 =?us-ascii?Q?6fI9+9XCWCwQYehjH+7FI/mZ96K8EWifc15DH9sggvJkjQhxNe1EN6c2U/Jq?=
 =?us-ascii?Q?41bqsLQgI3NlzgxSYO7aNKkwrcdChIsyFVxyGQoymw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lYFAWkuPkep10uSHjbKIoxPA/AqwKoX+A+H+wq66vLjMMcHxmta4+stRXVoc?=
 =?us-ascii?Q?+fdG5KQL1zOLGqsJZSMgUyZaaFc8Z1UWTqjgYnH4g5ToQaoFsmJTNYRyI95Q?=
 =?us-ascii?Q?Ixc4Krau3/SQA0thQoALg4gAJuzTvnwiBnmkyO4so6HnL7L+36PiTSCYOffM?=
 =?us-ascii?Q?6UmTR1vD8IzLIIHZ4fhysPLciGiGHTOh2XnZwbcjJJ15bzsMTtjQxWW6ae65?=
 =?us-ascii?Q?jdAgplnrTBn+IV2LW25Uo7xsrbbrvg6+0wjBNEvx2ELekVPAypCzfCgSpOOL?=
 =?us-ascii?Q?TUn/qkvULxKRC/H4a9S4jiOICqaf4l02jJhO4utyvulzsLToWWyI8LvdvbNX?=
 =?us-ascii?Q?MEd50pPu4bHCHkOq72/BKACM2craj0HaFawCvtR2SxCuqNAzFH0ld5UTbExX?=
 =?us-ascii?Q?cJpyRO40z7CRCtULzkrdfCRI1S0qElBUd6Hd8FvfIwlWftC+GYH183GfA2aE?=
 =?us-ascii?Q?BMGOuyDTO53BhUx2d5ryZUG9Cp9TtnKCCy5umjV7EZrBxqvwt+rIVQJ5nFMs?=
 =?us-ascii?Q?ADyJeGWdjAcu395YBau9GEWv5swp2l1SJ1qTIIVw+vD/G72zyjT9VqsA76dC?=
 =?us-ascii?Q?03LPt4utpSIJ2M3+pwiKHqz98657X6m3H9er4K/pYpUHCnvUzYmBgsXC7CHc?=
 =?us-ascii?Q?AV1Xxuvl2em+M6t1O8E7ixUXtw+so7ibElWc4fPtOhmcxgjDq4pjsNCjgbGw?=
 =?us-ascii?Q?isJETIlqa7vDR1rPInlHroXQZ3oMLhADw9Ubs3/7b1t1JmAkYX4CtItYJIpx?=
 =?us-ascii?Q?t4b6s+NXsBGuiQKMRAVsa7hS1+SJ+Xpizwr11tRu56oAYu7/TfP9j8Mouh5k?=
 =?us-ascii?Q?1zff/pQmOUjAhsWBpv3UOewUEpnH4OGzbIVMWO+9+z5MWV37VBo2sNbxfpDk?=
 =?us-ascii?Q?K4jQWNB2loNWspn3oOENM00eI3LUePDgm8+CCtnxZ7dFREF60aTsxrhKrYDL?=
 =?us-ascii?Q?CtClEYOuu/B8uqTsP+1BUC0R9ZER8tVEcuRasi8SWLyl+g2UIL56CCGCZYSM?=
 =?us-ascii?Q?p4Xr9siURX+WyHsHCBTwusJpSzetvzlhvNnIXNyOO+JyBjY15ghnsTYY7Ph6?=
 =?us-ascii?Q?8peGtVqGg/zMV4mUBf6eNVhxg9Ubf0PuKVH2BF0hhSGuyu+Ui3O1LUrNOouy?=
 =?us-ascii?Q?ZzTQoeF67usRXpwPTOIkpfmeKLjmN3KpkD2r6g2hN5slaMQCJoBDCQv2tRro?=
 =?us-ascii?Q?mQtfK8xpIksJ22CnsvYMH8Rg/Jnyo+QTBAXwSJ7jL+TGngP99FTJObukTsmK?=
 =?us-ascii?Q?jkBeVxnmBQdrM0wP4Zk9Zygrvvvw3ykgHtMLT7v0Kv2k2+FH+QCVrYUGmvyz?=
 =?us-ascii?Q?7KI81ZkkltR5BuxphjMhssFnREX7mVCPFpUQj9HK/dSkOOBotRFPY0b+m40a?=
 =?us-ascii?Q?8ixsY558iXUHhOoCs3QA2Zi5N1ZmJK50xPKe9ofHVYH9H0tQJ1qVC9F3DcOx?=
 =?us-ascii?Q?95xMa70bkiRNK9GtKg7mSSDYSs+zxAukwh0Wvh96zOFHXsu0vENWmHmxR1+P?=
 =?us-ascii?Q?gL7y803XvGZit8g2l2d0qzhvsyg1CKNaoNAWxW2P0PCl+cMdxF0lMFqvbWtn?=
 =?us-ascii?Q?AVwVT5ZDEknsz0wJv9HdSV16gsN0TFfMyLYbB5UnroNTyCggO+RNgs62v9TN?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5b78b5-0d74-4e2e-aa0a-08dc85f87f20
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 07:15:51.4018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on/TYJdPnkQJJTNB8WMTlfKA4LfksGTgTYP7EnJSfpgWcZ41+CliwWtK0f8x50R/uYd6qC029vZ1IscUQ9x9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
X-OriginatorOrg: intel.com



Hello,


we noticed a new added WARN is hit in boot tests. we are not sure if any
further changes should be made to remove this WARN, just report what we
observed in our tests FYI.



kernel test robot noticed "WARNING:at_mm/memblock.c:#memblock_set_node" on:

commit: e0eec24e2e199873f43df99ec39773ad3af2bff7 ("memblock: make memblock_set_node() also warn about use of MAX_NUMNODES")
git://git.kernel.org/cgit/linux/kernel/git/rppt/memblock.git fixes

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+-----------+------------+
|                                             | v6.10-rc1 | e0eec24e2e |
+---------------------------------------------+-----------+------------+
| WARNING:at_mm/memblock.c:#memblock_set_node | 0         | 24         |
| RIP:memblock_set_node                       | 0         | 24         |
+---------------------------------------------+-----------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406061425.bf423dbe-oliver.sang@intel.com


[    0.035952][    T0] ------------[ cut here ]------------
[    0.036565][    T0] Usage of MAX_NUMNODES is deprecated. Use NUMA_NO_NODE instead
[ 0.037482][ T0] WARNING: CPU: 0 PID: 0 at mm/memblock.c:1343 memblock_set_node (mm/memblock.c:1342) 
[    0.038582][    T0] Modules linked in:
[    0.039067][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.10.0-rc1-00001-ge0eec24e2e19 #1
[    0.040111][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.041385][ T0] RIP: 0010:memblock_set_node (mm/memblock.c:1342) 
[ 0.042030][ T0] Code: 24 07 48 83 c0 18 48 ff c9 75 ef 48 89 df e8 ad 01 00 00 31 c0 eb a2 c6 05 6d 19 02 01 01 48 c7 c7 d9 64 8b 82 e8 c6 9a 17 ff <0f> 0b e9 5a ff ff ff e8 4a 58 ff ff 66 2e 0f 1f 84 00 00 00 00 00
All code
========
   0:	24 07                	and    $0x7,%al
   2:	48 83 c0 18          	add    $0x18,%rax
   6:	48 ff c9             	dec    %rcx
   9:	75 ef                	jne    0xfffffffffffffffa
   b:	48 89 df             	mov    %rbx,%rdi
   e:	e8 ad 01 00 00       	call   0x1c0
  13:	31 c0                	xor    %eax,%eax
  15:	eb a2                	jmp    0xffffffffffffffb9
  17:	c6 05 6d 19 02 01 01 	movb   $0x1,0x102196d(%rip)        # 0x102198b
  1e:	48 c7 c7 d9 64 8b 82 	mov    $0xffffffff828b64d9,%rdi
  25:	e8 c6 9a 17 ff       	call   0xffffffffff179af0
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 5a ff ff ff       	jmp    0xffffffffffffff8b
  31:	e8 4a 58 ff ff       	call   0xffffffffffff5880
  36:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  3d:	00 00 00 

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 5a ff ff ff       	jmp    0xffffffffffffff61
   7:	e8 4a 58 ff ff       	call   0xffffffffffff5856
   c:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  13:	00 00 00 
[    0.044270][    T0] RSP: 0000:ffffffff82a03eb0 EFLAGS: 00010046 ORIG_RAX: 0000000000000000
[    0.045274][    T0] RAX: 0000000000000000 RBX: ffffffff82f382b0 RCX: 0000000000000000
[    0.046228][    T0] RDX: ffffffff82a03c90 RSI: 00000000ffff7fff RDI: 0000000000000001
[    0.047133][    T0] RBP: 0000000000000040 R08: 0000000000000000 R09: ffffffff82a03c88
[    0.048027][    T0] R10: 00000000ffff7fff R11: ffffffff82b19a60 R12: 0000000000000000
[    0.048944][    T0] R13: 0000000000000000 R14: ffffffffffffffff R15: 0000000000000000
[    0.049872][    T0] FS:  0000000000000000(0000) GS:ffffffff834ba000(0000) knlGS:0000000000000000
[    0.050844][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.051565][    T0] CR2: ffff88843ffff000 CR3: 0000000002a30000 CR4: 00000000000000b0
[    0.052517][    T0] Call Trace:
[    0.052923][    T0]  <TASK>
[ 0.053261][ T0] ? __warn (kernel/panic.c:693) 
[ 0.053768][ T0] ? memblock_set_node (mm/memblock.c:1342) 
[ 0.054363][ T0] ? report_bug (lib/bug.c:?) 
[ 0.054878][ T0] ? early_fixup_exception (arch/x86/mm/extable.c:415) 
[ 0.055510][ T0] ? early_idt_handler_common (arch/x86/kernel/head_64.S:542) 
[ 0.056167][ T0] ? memblock_set_node (mm/memblock.c:1342) 
[ 0.056772][ T0] ? flush_tlb_one_kernel (arch/x86/include/asm/cpufeature.h:178 arch/x86/mm/tlb.c:1125) 
[ 0.057396][ T0] ? __pfx_x86_acpi_numa_init (arch/x86/mm/srat.c:106) 
[ 0.058058][ T0] ? numa_init (arch/x86/mm/numa.c:616) 
[ 0.058547][ T0] ? x86_numa_init (arch/x86/mm/numa.c:694) 
[ 0.059064][ T0] ? setup_arch (arch/x86/kernel/setup.c:1100) 
[ 0.059579][ T0] ? start_kernel (init/main.c:481 init/main.c:927) 
[ 0.060115][ T0] ? x86_64_start_reservations (??:?) 
[ 0.060784][ T0] ? x86_64_start_kernel (arch/x86/kernel/head64.c:437) 
[ 0.061394][ T0] ? common_startup_64 (arch/x86/kernel/head_64.S:421) 
[    0.062021][    T0]  </TASK>
[    0.062360][    T0] ---[ end trace 0000000000000000 ]---
[    0.063236][    T0] No NUMA configuration found
[    0.063784][    T0] Faking a node at [mem 0x0000000000000000-0x000000043fffffff]
[    0.064681][    T0] NODE_DATA(0) allocated [mem 0x43fff0000-0x43fff4fff]



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240606/202406061425.bf423dbe-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

