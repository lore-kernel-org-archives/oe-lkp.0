Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C193C22488E
	for <oe-lkp@lists.linux.dev>; Thu,  6 Feb 2025 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831176; cv=fail; b=h5iZfX5NDyx0Y+dmK2vNxmdKvS3x+G2ZNy1gywqJuL/1gW/ZZWQjQjHmsEMsDF1bPeoYiiuVuXy10J58oW4WlH9Ui+3Kp3BfOSsQbVAQz9E9yHLbG+vnDTZL3teAZoeVZLjqe0Gl1fxMJXpezL6Xl1u4/7IluZDeSkHmKDmusFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831176; c=relaxed/simple;
	bh=E8q/2om8DLCTbqQjOogeU1O1827eTIHau3TPodfOQ9w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Tkb7fdGksGoVBhfnbxkNlukD+SqN4eIF6NNc188SK5mM9bPQU1fETILbKgXesGdSEx0wZzJ1aIjMxmwftOduPOoAtkoljNu6tz6S2ktkBGoR5rz5i/2gTJcz3a1x5jwF0iIKHFV4rImeLM0vyy0kVZQENrTHcgQ9TOJtCIF0pDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1g6Duj7; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1g6Duj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738831174; x=1770367174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8q/2om8DLCTbqQjOogeU1O1827eTIHau3TPodfOQ9w=;
  b=b1g6Duj7BSN8wGNYbNU0lLmA/x73UuS01Kn0W7+K+fMXZf6czTrV9nn1
   uWbfsLNynVC7+mgzwLMeIscctgvEi0W1zhT0hFEu93tc+CTIlANDCaZHO
   QRHSDVrfW8AKcqzyzn1xFgTFegSirAlNoVyZ9GvUKHQ+vDJsLeJoRc/yo
   FxzSLzBR54bc2OcIZZtQVc7aJ05AzfB7EYXt2nnPGeLfF/fDwKPmh6K85
   ZifptM93RdNNAIkopHRqKiFbz997ToyMg8lMl7EvCnP/PmXqSeoe8WTcL
   nPYjyA5vYcnhCTbTGsrYgXcPMdqQOspRRwOmdWEOez9kaW/64gKoBFY6l
   Q==;
X-CSE-ConnectionGUID: 14j+wM7KQluvdkYOuXdxvw==
X-CSE-MsgGUID: 8T40pMtuSGaKmE0/DcOsmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56970844"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="56970844"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 00:39:33 -0800
X-CSE-ConnectionGUID: m8jLRvEDR8OSEAlVhxqwlA==
X-CSE-MsgGUID: F5hLv7eQRZeck/QNfqg+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116181988"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 00:39:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 00:39:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 00:39:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 00:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MctBBs5Rbj7gulzL2xZ0Qa9SuCDWa4vvG5BLhp25l/wTDDHC+b0fJS/0aWLtMA7ZgE/Z3W2qUnikOMmgH3BFJ5EP1Uct3Erq031VSr9yi2IyQBaT9u20iJZwGzuEWcnlC3P1ZsPcVxxpFUGiroPtoAPuJT7tZxNHc36WSVbtndPaQP4Lyqhl3JkhnTmS5ga9LyrSUZI8oFtttvNaqiufAsYp15TMeakr0z7W5eYhRCso08CKMHC6bqeN6Bxz+yWBaTEMs0PEqMXbgGOAjiSoS040gZylOdqp34AruA89alQgtw9+bk/f0S8mbnCqX4/vVnGW8ypsTbdm+s6dNlQ4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+voePckEtHvPSB9AB2N8sv1eCKwd7QGFHRDClKWPWk=;
 b=BDJyPew8YTIAIPNHwKzD3pkKJ3SLfq5omHeLc0zRQFIbYktGInPRmkhzNzIMTPcJG3PByDUMNRcJ+/xlVjL2/gop3fgV4nAHQwjSVFsPlfSJ2PlgVKYk86v04/5LNxdjdfRn3tBr885Tyv0DCeXLix3loqR4i0HkDFp4CclF6E2r9XM/evXzJh3BUrKhwsR7HdWgOHbX3kdwEv79jPX1GFFnH6kVpZfqwTjfVWWXJWeWs/oZK2/rsaYlTgRludQ1BI2MP0zZ0Kp4O4GkokoRF6zbT9325yYWCM6bSBwo1HTG+EFo9L+5LK97iqQOLN9mA4nKg0JPnBLPrpH0JmwnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Thu, 6 Feb
 2025 08:38:57 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 08:38:57 +0000
Date: Thu, 6 Feb 2025 16:38:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [willy-pagecache:folio-mk-pte] [mm]  af07c8c757:
 segfault_at_ip_sp_error
Message-ID: <202502061612.1f8d78d8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR0401CA0025.apcprd04.prod.outlook.com
 (2603:1096:820:e::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: e2574946-7dce-48de-36c6-08dd4689b244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pcQ0kpI9F3zYem8apFkKY6F3r8PueSDaAfS9caxHPKvogYxRjzKaywFoYZNv?=
 =?us-ascii?Q?Pi/ERRAo1w83zWBucGMlQQW3drYA034IKhG78u3GM/568azWEdP9IQWckz0O?=
 =?us-ascii?Q?fribyIppRiojr9WA5zX4zADCMiJUHh4gJxy+VM0MthJF3lwBshwzj8U3AYXN?=
 =?us-ascii?Q?WuEuoNRV3QFz01bYXq658lLPtZIysZhYC64rcloK3yaypEUbNKyoeQjRfjxV?=
 =?us-ascii?Q?CjFCjYoqsTzW5UkiDDIgt2NabQlvkQuvBve8avTeh7H0ZU7ofrl3/ouEKfXf?=
 =?us-ascii?Q?d0wSqapeejBlzL7foiqYo3rJNoQTnSil0FQ1XO/Xo0mBa/YQwbxk+RrNFAfI?=
 =?us-ascii?Q?gLtN58oqlqNMdRZZtGGRGUzbx3tkWn9JlwCv/C84GVScHRdLizjE+R1TUlXM?=
 =?us-ascii?Q?mNeEJoso1gl32rzHkODc2RYFxj/UzUWa9FivUqfuLECp+DDwRldciysF9f5X?=
 =?us-ascii?Q?UmI5qVEochbb6LzU+j/qjNbMdbGofsWr8ZLGfbu6g6X7xYtmKuGtisJt6x+d?=
 =?us-ascii?Q?+l6I0vyPVNTlAwxsNz4UgxU7d0MrUScayF12yLkv8JI8NfD8jOoA49JbZYj+?=
 =?us-ascii?Q?1t5gwBDckep/HQVn526TdG6v/9+TfD1v7J58T1Eko087r1n8tv8jhNrd7B6X?=
 =?us-ascii?Q?ZYN3mWWxTbkvuiK9xUyvkB93UpnK3/SThz3ER4uAffipdZ7A18iRrE6VoMQj?=
 =?us-ascii?Q?RysseZZnj8ZhEzA/uG5HyZLHdxxECLUih936GqtgbmiLjw6ki1ImYdX9snXB?=
 =?us-ascii?Q?L7kq0BMn6AARCBuVhvBzr4UlSdWyA/dA90BVM22eV4GP5DVFT5LtQufcwgHX?=
 =?us-ascii?Q?1y35tqFtKu5SaO20oiAioaZckz8utGvWHZSbkn2UabEyTkDj4bzW2Tloe5r0?=
 =?us-ascii?Q?UAAhVQ2NFkYcql1XND6rMRc5CGoBz9e34jWjMvSDXzNDtVAIsWHq6vcVyKhM?=
 =?us-ascii?Q?LSAQ0kb6orQohhiy4KubMDxSNrtBUQ6CambaIBhgbCLck9mkpJ7EJQTMWsDx?=
 =?us-ascii?Q?OrgfMr1s+QjjIRkWJ6qhpX/JxHw+fRRzcyzDBc6EfDHoKgbHz3NvFW7093HJ?=
 =?us-ascii?Q?RJl9CbsN8S4zPOPYdEgGgkEMJwpw6zHZ9DfB75DZM6iDA0nU5VkTXife2j3p?=
 =?us-ascii?Q?XBle6sZ+U2iJQX6rvcZ2RZmKPx44QHF8H6WR7nelHxaiuyYCVuCGWfxJ1q6h?=
 =?us-ascii?Q?uPw4BowsqCpHCxBystIE2FeKPqmQeV09bod1uByy1JXBlEtnIRRputgoxUaw?=
 =?us-ascii?Q?+Nfe1kMXUH1zpQfNFAbbx03U5CTDHTUDddgGin69JSPYbAJ9wjE/4lXZObSj?=
 =?us-ascii?Q?f5/OIvcChFWoare3R0LZWW1e6yXOjbr/rPXXHc9gCOu8Kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HXG4i7mvvNrJ3dD5yw1spEkWSrpK470qXzx7BohvQlQas2U2+PnUyjOJF9K2?=
 =?us-ascii?Q?qFdzZujh0tFqkNI0bBn1uyRAn8z/WyZF8zax+jnMCLa/34Fb2Q4F4cCN/f0h?=
 =?us-ascii?Q?ndJuYEIt+ZxqENZoH/El3AdhuPLT0gjuc6vNHMWrHCuHEg/lHIBDqHnt9m/V?=
 =?us-ascii?Q?Jzx8tqvx932I1Mve2zkN+BEakmfSkCl8hc71k7Ktyz9W0PSSyC8zEFH3NWxV?=
 =?us-ascii?Q?CAfA5rYSttD1iL6bnKKY+ejkR+Bgrpppb7t8BqKByHAk3WknpFpBxHOBxgmq?=
 =?us-ascii?Q?7LbWPHm+EvmzpIJinlhyNiBFGH+eF+Pncs2WzF5bgiXBktY5uFq4ShWIMN1N?=
 =?us-ascii?Q?4a7vonMSl6gGfTp3toS61folL8jmDsR68mSWBsE/2/QkLAlUSSo7FgOqyJ36?=
 =?us-ascii?Q?8RaNqO7NkSbQve8AB80vntLZNSq2E2v6fG+5GRSxs+kInfKVIThVlEVHXhPB?=
 =?us-ascii?Q?tHdftcy3I6nGUpxshAnO0nslEAvJ9MeTh2vCSQKylk0pU4nGDNXEYTpTnIZ4?=
 =?us-ascii?Q?94IdT3afhyQxsgXKPQjqSr97JmmUACiETKd9BkWBWPlyW+Hs/Uww0lgCErvm?=
 =?us-ascii?Q?Ci0hZHx8Jt1JdVC73Jn6ItAWQu54BXqm7izf4uBNvdPaqltjKOH2ZZjvLclw?=
 =?us-ascii?Q?Ixe4gsu3zYXxQDrp+xmMFXJNgG+tP/t1wGmL6dqulW25WHJbJR14mzAVGvb2?=
 =?us-ascii?Q?F/vczkmDmo+0ZwD4K+vHB93cV2yMplGX6OesfSGeLSz/n3fKFur0O/hrDaop?=
 =?us-ascii?Q?wG0BSCSGTjTwtoFihDb0VigW6wf2Eb2jzGRkfeT2cfT0BXAS4tk9voevBSkx?=
 =?us-ascii?Q?mpXUxWH0akRwwoOaO05sYXeBTmmVG1fvd4MfISRxuPrfa7zCZiRbqI+tSk/a?=
 =?us-ascii?Q?SnnWKkXzNDEQ/PH2HmE0nQck1mBFlzR8kfIcN/bOM46rDYgM9kyel2adL4Sz?=
 =?us-ascii?Q?PAekygnQXEkfsSq7WmwkN32BT7lXfaDdvRj3OsizlZmn45K71lYccXQWgNmL?=
 =?us-ascii?Q?YrHZclQonbsc9ITJt1Ybd+Bc4Mq3yPrYSfotFY4/4Q9qiiZ28GVyElm8pyxj?=
 =?us-ascii?Q?fIJJkeEfFSHehEFmtUqoNc9lzR93FijnF36Nj60sgV5ZpIRJAndS65hqqNXF?=
 =?us-ascii?Q?fs+Z7MOQ/TjqZKtZnxC+JhvVCFZ8iIo0y7PzSjH2xfJnY8p9FqG/3HcLRnQW?=
 =?us-ascii?Q?6TMBonlWfaliZgmWU5piVNTiT3OxvjIVgHKW/n9tyt4hf5dzrVqUtCx0ee60?=
 =?us-ascii?Q?D6/QPoIzDEQWfclsLVz4qtYLqHh6dvMwDLC+LBVbaf8LnWB0gVibTmmJHhF2?=
 =?us-ascii?Q?xp68JKCvRTGPiq1LUnDYQuHnD+lMh0SeaNMjfripkEcg1OxRM0K84eeRhPwB?=
 =?us-ascii?Q?rcdFkFu0TJtops7coPgTU9kEKFnkCSweokeClz27ih3nukBPVmcAvTRCL7mj?=
 =?us-ascii?Q?JOIdrHt2v4nG4ETaadWqjirp8dW0kt5++4AAqGp/43GlSmB3f019fNI1awz7?=
 =?us-ascii?Q?QFo+8q7PvRPGzje0wNVrZap/rwtVzYZkMf1/oHv0+T9Crt2JfwPbs3eQnFcm?=
 =?us-ascii?Q?d0i9KRkkf866cqks23OFViklni/r+rvjrkiZGOM0nxc1ZtDmKOnScCYxBgRS?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2574946-7dce-48de-36c6-08dd4689b244
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:38:57.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knoX8sfpwtZtGi+EjlZlseZdLVxHYCz10JpFMpQ7c80dMxFz9mm+jlZDYY1vYfypzPT+WvehDQTF6QPe6qJoig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "segfault_at_ip_sp_error" on:

commit: af07c8c75785d3a4f6f07fd9f55889eaddc8d7b6 ("mm: Set the pte dirty if the folio is already dirty")
git://git.infradead.org/users/willy/pagecache folio-mk-pte

in testcase: boot

config: i386-randconfig-141-20250201
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------+------------+------------+
|                               | d15aed2013 | af07c8c757 |
+-------------------------------+------------+------------+
| boot_successes                | 12         | 0          |
| boot_failures                 | 0          | 12         |
| segfault_at_ip_sp_error       | 0          | 12         |
| BUG:kernel_hang_in_test_stage | 0          | 12         |
+-------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202502061612.1f8d78d8-lkp@intel.com


[   14.966355][    T1]     vga=normal
[   14.967107][    T1]     audit=0
[   14.967848][    T1]     ia32_emulation=on
[   14.968654][    T1]     riscv_isa_fallback=1
[   15.926262][    C1] random: crng init done
[   15.970491][   T82] rc.local[82]: segfault at 6fb931b8 ip b7fe4c4b sp bfc82840 error 4 in ld-2.15.so[ac4b,b7fda000+20000] likely on CPU 1 (core 1, socket 0)
[ 15.975531][ T82] Code: ec 2c 8b 90 4c 01 00 00 89 5c 24 1c e8 69 df 00 00 81 c3 c2 63 01 00 89 74 24 20 85 d2 89 7c 24 24 89 6c 24 28 74 5b 8b 52 04 <8b> 3a 89 b8 78 01 00 00 8b 4a 08 8b 72 04 8d 69 ff 85 cd 75 69 89
All code
========
   0:	ec                   	in     (%dx),%al
   1:	2c 8b                	sub    $0x8b,%al
   3:	90                   	nop
   4:	4c 01 00             	add    %r8,(%rax)
   7:	00 89 5c 24 1c e8    	add    %cl,-0x17e3dba4(%rcx)
   d:	69 df 00 00 81 c3    	imul   $0xc3810000,%edi,%ebx
  13:	c2 63 01             	ret    $0x163
  16:	00 89 74 24 20 85    	add    %cl,-0x7adfdb8c(%rcx)
  1c:	d2 89 7c 24 24 89    	rorb   %cl,-0x76dbdb84(%rcx)
  22:	6c                   	insb   (%dx),%es:(%rdi)
  23:	24 28                	and    $0x28,%al
  25:	74 5b                	je     0x82
  27:	8b 52 04             	mov    0x4(%rdx),%edx
  2a:*	8b 3a                	mov    (%rdx),%edi		<-- trapping instruction
  2c:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
  32:	8b 4a 08             	mov    0x8(%rdx),%ecx
  35:	8b 72 04             	mov    0x4(%rdx),%esi
  38:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  3b:	85 cd                	test   %ecx,%ebp
  3d:	75 69                	jne    0xa8
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	8b 3a                	mov    (%rdx),%edi
   2:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
   8:	8b 4a 08             	mov    0x8(%rdx),%ecx
   b:	8b 72 04             	mov    0x4(%rdx),%esi
   e:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  11:	85 cd                	test   %ecx,%ebp
  13:	75 69                	jne    0x7e
  15:	89                   	.byte 0x89
[   16.000067][    T1] init: Error while reading from descriptor: Bad file descriptor
[   16.002247][    T1] init: Error while reading from descriptor: Bad file descriptor
[   16.004517][    T1] init: kernel-tests main process (82) killed by SEGV signal
[   16.007122][    T1] init: hostname main process (83) killed by SEGV signal
[   16.009669][    T1] init: plymouth main process (84) killed by SEGV signal
[   16.020244][    T1] init: hwclock main process (85) killed by SEGV signal
[   16.035819][    T1] init: mountall main process (86) killed by SEGV signal
[   16.046863][   T87] sh[87]: segfault at 27dcf138 ip b7f4dc4b sp bf8d6970 error 4 in ld-2.15.so[ac4b,b7f43000+20000] likely on CPU 1 (core 1, socket 0)
[ 16.052245][ T87] Code: ec 2c 8b 90 4c 01 00 00 89 5c 24 1c e8 69 df 00 00 81 c3 c2 63 01 00 89 74 24 20 85 d2 89 7c 24 24 89 6c 24 28 74 5b 8b 52 04 <8b> 3a 89 b8 78 01 00 00 8b 4a 08 8b 72 04 8d 69 ff 85 cd 75 69 89
All code
========
   0:	ec                   	in     (%dx),%al
   1:	2c 8b                	sub    $0x8b,%al
   3:	90                   	nop
   4:	4c 01 00             	add    %r8,(%rax)
   7:	00 89 5c 24 1c e8    	add    %cl,-0x17e3dba4(%rcx)
   d:	69 df 00 00 81 c3    	imul   $0xc3810000,%edi,%ebx
  13:	c2 63 01             	ret    $0x163
  16:	00 89 74 24 20 85    	add    %cl,-0x7adfdb8c(%rcx)
  1c:	d2 89 7c 24 24 89    	rorb   %cl,-0x76dbdb84(%rcx)
  22:	6c                   	insb   (%dx),%es:(%rdi)
  23:	24 28                	and    $0x28,%al
  25:	74 5b                	je     0x82
  27:	8b 52 04             	mov    0x4(%rdx),%edx
  2a:*	8b 3a                	mov    (%rdx),%edi		<-- trapping instruction
  2c:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
  32:	8b 4a 08             	mov    0x8(%rdx),%ecx
  35:	8b 72 04             	mov    0x4(%rdx),%esi
  38:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  3b:	85 cd                	test   %ecx,%ebp
  3d:	75 69                	jne    0xa8
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	8b 3a                	mov    (%rdx),%edi
   2:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
   8:	8b 4a 08             	mov    0x8(%rdx),%ecx
   b:	8b 72 04             	mov    0x4(%rdx),%esi
   e:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  11:	85 cd                	test   %ecx,%ebp
  13:	75 69                	jne    0x7e
  15:	89                   	.byte 0x89
[   16.061637][    T1] init: mountall post-stop process (87) killed by SEGV signal
[   16.078333][    T1] init: Error while reading from descriptor: Bad file descriptor
[   16.080704][    T1] init: plymouth-stop pre-start process (88) killed by SEGV signal
[   16.099555][   T89] sh[89]: segfault at dfc8d138 ip b7ef1c4b sp bfa63cf0 error 5 in ld-2.15.so[ac4b,b7ee7000+20000] likely on CPU 1 (core 1, socket 0)
[ 16.104368][ T89] Code: ec 2c 8b 90 4c 01 00 00 89 5c 24 1c e8 69 df 00 00 81 c3 c2 63 01 00 89 74 24 20 85 d2 89 7c 24 24 89 6c 24 28 74 5b 8b 52 04 <8b> 3a 89 b8 78 01 00 00 8b 4a 08 8b 72 04 8d 69 ff 85 cd 75 69 89
All code
========
   0:	ec                   	in     (%dx),%al
   1:	2c 8b                	sub    $0x8b,%al
   3:	90                   	nop
   4:	4c 01 00             	add    %r8,(%rax)
   7:	00 89 5c 24 1c e8    	add    %cl,-0x17e3dba4(%rcx)
   d:	69 df 00 00 81 c3    	imul   $0xc3810000,%edi,%ebx
  13:	c2 63 01             	ret    $0x163
  16:	00 89 74 24 20 85    	add    %cl,-0x7adfdb8c(%rcx)
  1c:	d2 89 7c 24 24 89    	rorb   %cl,-0x76dbdb84(%rcx)
  22:	6c                   	insb   (%dx),%es:(%rdi)
  23:	24 28                	and    $0x28,%al
  25:	74 5b                	je     0x82
  27:	8b 52 04             	mov    0x4(%rdx),%edx
  2a:*	8b 3a                	mov    (%rdx),%edi		<-- trapping instruction
  2c:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
  32:	8b 4a 08             	mov    0x8(%rdx),%ecx
  35:	8b 72 04             	mov    0x4(%rdx),%esi
  38:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  3b:	85 cd                	test   %ecx,%ebp
  3d:	75 69                	jne    0xa8
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	8b 3a                	mov    (%rdx),%edi
   2:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
   8:	8b 4a 08             	mov    0x8(%rdx),%ecx
   b:	8b 72 04             	mov    0x4(%rdx),%esi
   e:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  11:	85 cd                	test   %ecx,%ebp
  13:	75 69                	jne    0x7e
  15:	89                   	.byte 0x89
[   16.114058][    T1] init: mountall-shell main process (89) killed by SEGV signal
[   16.124734][   T90] sh[90]: segfault at 97b8b138 ip b7f31c4b sp bfda86e0 error 4 in ld-2.15.so[ac4b,b7f27000+20000] likely on CPU 1 (core 1, socket 0)
[ 16.129436][ T90] Code: ec 2c 8b 90 4c 01 00 00 89 5c 24 1c e8 69 df 00 00 81 c3 c2 63 01 00 89 74 24 20 85 d2 89 7c 24 24 89 6c 24 28 74 5b 8b 52 04 <8b> 3a 89 b8 78 01 00 00 8b 4a 08 8b 72 04 8d 69 ff 85 cd 75 69 89
All code
========
   0:	ec                   	in     (%dx),%al
   1:	2c 8b                	sub    $0x8b,%al
   3:	90                   	nop
   4:	4c 01 00             	add    %r8,(%rax)
   7:	00 89 5c 24 1c e8    	add    %cl,-0x17e3dba4(%rcx)
   d:	69 df 00 00 81 c3    	imul   $0xc3810000,%edi,%ebx
  13:	c2 63 01             	ret    $0x163
  16:	00 89 74 24 20 85    	add    %cl,-0x7adfdb8c(%rcx)
  1c:	d2 89 7c 24 24 89    	rorb   %cl,-0x76dbdb84(%rcx)
  22:	6c                   	insb   (%dx),%es:(%rdi)
  23:	24 28                	and    $0x28,%al
  25:	74 5b                	je     0x82
  27:	8b 52 04             	mov    0x4(%rdx),%edx
  2a:*	8b 3a                	mov    (%rdx),%edi		<-- trapping instruction
  2c:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
  32:	8b 4a 08             	mov    0x8(%rdx),%ecx
  35:	8b 72 04             	mov    0x4(%rdx),%esi
  38:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  3b:	85 cd                	test   %ecx,%ebp
  3d:	75 69                	jne    0xa8
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	8b 3a                	mov    (%rdx),%edi
   2:	89 b8 78 01 00 00    	mov    %edi,0x178(%rax)
   8:	8b 4a 08             	mov    0x8(%rdx),%ecx
   b:	8b 72 04             	mov    0x4(%rdx),%esi
   e:	8d 69 ff             	lea    -0x1(%rcx),%ebp
  11:	85 cd                	test   %ecx,%ebp
  13:	75 69                	jne    0x7e
  15:	89                   	.byte 0x89
[   16.137710][    T1] init: mountall-shell post-stop process (90) killed by SEGV signal
BUG: kernel hang in test stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250206/202502061612.1f8d78d8-lkp@intel.com


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

