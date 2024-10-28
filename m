Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263B190678
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105381; cv=fail; b=h0Mq90hj876F48cjFZxMq8DW8qrCmHtilNb5kQwexYAQ3dp272YBQDgSFMBxEG1SkTZythllEW2LrtUs3aTFzlvwVm+jZInZ65f+wXxkw/4nL42YEsNQVi3sGEOEGLfz+1Wh9XPeeKjylp8lWDPjFJ3fSIPktCyNrtg3GnO1Bu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105381; c=relaxed/simple;
	bh=zGWeXC3nCmfWf1QTbfALYB8Hp5R/B5o4UUrVyw9gJ7s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=o2aFID2cYIV/APJQMslzY2SAJ+5oAKXDU+nu0JeQw0A+SjbnLRNPCYMdM/0oWc30X+CgUMO7gXpaKzuAMEpFPRWt7xhP2KJ/fNTtg5vdui4ZDBMh85/iHEx+dX74Ewp/IvePJSdbf2hZLKzUqjfLxKqh410HRAmgg9y/1KA43xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsf1fynn; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsf1fynn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730105378; x=1761641378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGWeXC3nCmfWf1QTbfALYB8Hp5R/B5o4UUrVyw9gJ7s=;
  b=gsf1fynnXUTm6+5BVN3i4x/0f94Pq6yncw4pO5ZVsRo05zpq86cDjIGR
   hbWR+fY8iIHJVa+9lZcKFMUt/U3HifPkyVYce8Jm8p2GMgrYFjbGvco2j
   gQ/vlbl1W1mZyj4KTLuMOEkhxdflQcOofTMW/yVTLh7VxpCi2+V7HgOZu
   NOLrqFcGAtFmMwknmH5Szn44/fwbp7GgX03C7KSTnl5n0DqDuEe5+YcyU
   73/t9hsECh/wDkB0OMFN7vwIiP95TWf9NgYqV2N84AcGqQ5v4ywNKThQ9
   3fd/lz1UsW8fPKmQ/CChgmBscltzCq6fbyjdswrwJJETvtMuBLQMJngN4
   Q==;
X-CSE-ConnectionGUID: DplYO3SmTXic8HaqAN8p2Q==
X-CSE-MsgGUID: OyNrP7m/RH62g8vgRoRPkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33603197"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33603197"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 01:49:37 -0700
X-CSE-ConnectionGUID: i2CUwPYGQTuzWZuMTJsEAg==
X-CSE-MsgGUID: f5HuweVMRRWRkjQ4gju5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86127135"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Oct 2024 01:49:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 01:49:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 01:49:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 01:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDjVB+nwhC9w7SYMFXv9rqsrT4PtWerM/FOOXen8/I1K+kNDbKPRo3PTGXIp1N4IYZIiDPbu90y6e6dDS1F0vSixinQEWQTfR5m0fdF55Yn2p+FvKLaMHafZs47Q4pE4+1j+xbb/KvZ/T9IaQ/d7fHXDNzXWEUOesBg/nGnazHQbMIv6IwStXrmcQHUpnUTI3ZZswbJHS1+KkIKhKN+VjmFeOSSMbi952it2V+x+8C7jSuOggtAZ5NoFvANGUNXUS0s5uT0gPQHytj5Gh6dK2CP9YxRlNX0Ak3i3Xb0dF4fjSUEzyD2fBHgXVJp21d+Ox17Yoax2d/rO2vgpj2pkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRXMwRiXsHebJ8O1v4NhlYSu02/ybt44yACsy4qbqoM=;
 b=qhRBubPvTxLHXr0YKf1P84CB9rdkwd9VVFU00K68jSKh8OUoqWQwV2J9sg8tvhfdzqwycJRitccBm4Vv0wBiXU6yFItQxv81wyK9U6qCglpytvQb2L4d+/krWxMkpNX7zRkIClMav9FBQkpUhQG8tLt8BOREcH/5xYNN6gsh+1CQNwpqO11Mv+zVl8+zqU4ie62xd/rJqbVf9OeWHpzSWFB4D//AUZotf7Gjt1dWpMlxQS6nM81QWI3XTYeYXZlPzwsBg2/BMfbSszTDHafspkdG2WthB95suAQrTT3X3krsVprcfkHi+FPyu8NvRUiduOTlkE8K+WOIuN4Xpunh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 08:49:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 08:49:33 +0000
Date: Mon, 28 Oct 2024 16:49:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Hua Su <suhua.tanke@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <linux-mm@kvack.org>, Wei Yang
	<richard.weiyang@gmail.com>, <oliver.sang@intel.com>
Subject: [rppt-memblock:for-next] [memblock]  c404f7bfe1:
 kernel_BUG_at_include/linux/mm.h
Message-ID: <202410281628.9a7b7fed-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bf497e-f79d-4ee6-0467-08dcf72d715d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yvx2qdUXlPCirSl4pCeKrUwSCS5IbBn5lyLUF2D6JF6NInQyVO+WDfxwcVk4?=
 =?us-ascii?Q?cDrGBnAKJe3jY4DMTSZBhTPg9NkPaMBeboiKCRaE1WxS7C3DH8cFOlLnxWbf?=
 =?us-ascii?Q?Gj0f78VIZt1uNSkkqiLOoRo1lvR6kGvNEz+RKQytP4HWBT4yZSMCK5u5Pb1u?=
 =?us-ascii?Q?LNGdPfzTPoYUVXkot0c9Z5wg/lyrHBwfDHuh9/8aYTPR3YvPK8I2hmwdZ+e4?=
 =?us-ascii?Q?ieeHSe5ghuI9cssBpOSqnlhKwbqTMTWRzsubcUknTtoH2F5zltGClYzpBTV4?=
 =?us-ascii?Q?kh2AD5bs/GiOBMhSuJeU+YGj6UqGjlTxPN4DN/fjdfq9Cq0+51a6o6dycTek?=
 =?us-ascii?Q?/fQdo6sAwlWdbVGHjJ6nn2xMgVEuFYIbkvKzibMU6Pqjlf+/9aBJXT8S2uQ7?=
 =?us-ascii?Q?5sUDMD8WwGBsUaVHl209XRuUI6hMUxykb9YWDYA9/9Lf7NiRLcSR8fvK2Ko5?=
 =?us-ascii?Q?fqBv0g4srZ9/P7iAl5Ae7tESeZe0vGRCZG+1VQw/XikalScsUMgntiIxUvQ4?=
 =?us-ascii?Q?2/62TJyFsx8gCMFgSXga/sUPbT68kC2KrWNpa7Wj0qm6zm7joN33vkR6fKEs?=
 =?us-ascii?Q?bn21L19zpsHkLfByKgqPKFt/n0oTBILGl73v/G9W+fJaHLTkC8ZgOdQRbYGM?=
 =?us-ascii?Q?JJlM8+nUjeCEn2KXkXdZRjdAvYJI6YgBPWrE9t4Ne9zpLUieOhPvEGmmUyoi?=
 =?us-ascii?Q?Ag3yml0I2Fh8l4hQ+sW9vO5gecTX0MVKWTtLqUGpmUq11mEzjxVlJgNzVvS9?=
 =?us-ascii?Q?ATkBhnVOdlyOsXpIx2J90oaHb5tg8U4l9oKVX7fsyK2tYb/Hh8z5W5BV7vFX?=
 =?us-ascii?Q?K/EFd0H3CzmNrflrP3f1abnPiF4wqsYU9j/plz+ZVUZA6nSoUi2dSmFG2IOx?=
 =?us-ascii?Q?u4sZAlCTGZ9axUNWIQkb8aR/jzIYvb7qdaxQGA+MLgKUMh+kFdmrpNGjlyTS?=
 =?us-ascii?Q?dCF07YDiW6fCoe/Fpjw5PX3DB9QmpNfe8dh4E9/m1rKYJR99QuYosQ61GjQB?=
 =?us-ascii?Q?lGhW6M4mmc/eMoFkxHDA6SkqqN1J7WIYzSBXzofDodWWgmur+/4LZrVED0nx?=
 =?us-ascii?Q?jyUItQlz5T5VnETHSzSFXo6Vc/iiZovSo5of1TpQv2FdimCtXlAkzovCRQEL?=
 =?us-ascii?Q?AH+fzuTLJBkXHTi+PPSmthX5Y7Cr8X7km79iuvvjny6tlGeMUpOjw7oj6Xpo?=
 =?us-ascii?Q?MR4kOeoO9ANFwVuRhh5JAHPV7KUKsyLhtKukeem8u9i/wbxSlk1gpKDSyUKJ?=
 =?us-ascii?Q?rIK2VBVNTR8sXlfdo/pbF8NW5uiP0vXP19In2P0ctA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JvUyZUE7YXaN3lwaKqK+N9HnYJF9OgVu1gwqMe2tbSrp04e7V+7Bze9gTCWo?=
 =?us-ascii?Q?WkRka6UeWuTrYvBxnRyP23LwOSPgaHf8YHq/N8w90fz+l4qxz5Bgqb+ZB+7K?=
 =?us-ascii?Q?hz4fyhMaZ49exyqSY6VTknaA2jroyNQCf+UX343G9shWkl1eybjvaMno5PKy?=
 =?us-ascii?Q?S/LbyBqDcZGDO+5nTF2Hyp7D+iLo6Qe356EbwNjRNVIzhRDtr5UyXth5t9k6?=
 =?us-ascii?Q?sTdsYXjhWjdwCNwtKjiznWzVXwdQQzaxqLSUgS7Q0/lMHu3QMLBw8VIZqlP9?=
 =?us-ascii?Q?XLiwpeBZ9P4OwUV96gkPjTcjC0XIKHULy/jmCLGYiGX3rcV/eU4xgz4iL21V?=
 =?us-ascii?Q?r1U1ePI4+kaa4jInLNMk7DktT5vhFVr4UjebtIoWXdcTNe5ARvI7NaHsBI4L?=
 =?us-ascii?Q?4z0U78YYfPzzaGOAci9NrgdKKDkI3A6CQqXod3eSBbUqNEPxQfNPQlv+4KE5?=
 =?us-ascii?Q?0ezLcdTKiboUAr6z+hGfWjIdvmzfpzIhNG/Zp16Vjm7U7nmnTmW6ouowqrPj?=
 =?us-ascii?Q?YLG6fdbQ47zXUyfWuGmQgzmdth4GW9UWIzEK1ckAWEhvJeENT+v6QuIxj6Yr?=
 =?us-ascii?Q?N9nUQxlWvNbTGHgVKv7QXCsNphSAX4y2T8u6oTavuSDnrX+VjwE8ckUD0cVv?=
 =?us-ascii?Q?lxml9KD+ZnsBMPBP2VLPTpfB2iOyveDDtbw9Oick5sqsiK6tukwMu5H1qcSc?=
 =?us-ascii?Q?GxhZ47EMzKKR0hCf8I1YWtEwUk6s9zXzAkEzOV49qmOkKKtZzyczpZVVS3bc?=
 =?us-ascii?Q?uFHg9XhOft3HludqW5g9+d+pffunqBpiv+DrF87/6xYRjZjSWVZfier/wFG3?=
 =?us-ascii?Q?WURkImwK7pQO9fotMD7ot9/iuKe5cox+RYtWrB79jJCRGXg8IEWtKkx4Bz/N?=
 =?us-ascii?Q?3dSuIL4tbGqTc7ha4SUHgnv3iQGy9vIzUx3cko9MMdzYLfRhji7fjm3CzCf1?=
 =?us-ascii?Q?ZfynraWaoQ6rLBXXbrLyJS1NdPD16TD4VsIAhe/6pdoHXPD6FvvZLOnwmj2Z?=
 =?us-ascii?Q?HVQvitggCqzujDlotlzOvMkmRs0QT/ELDE0ILvQ63zUROfwaPCOpd2wYF7rz?=
 =?us-ascii?Q?fIbB9vXNdh+Lh8IhZXazkeDWIKTkEApbwALOtQzj1ronoet6Kr7eDOGf8cgA?=
 =?us-ascii?Q?luF6VK5WvVx1z3aURb65PJkbrbjJElrBBALRPaZ2MC/w+AVeqKVCjeFXS1g3?=
 =?us-ascii?Q?dp/Bxp0SrR/m95SQ8u1L/NCe4RH1o4DnlFmqqP9KAcEGUpVXX3Tb7ANNQJut?=
 =?us-ascii?Q?R2gmLL7Sv8QNqAOEWd4XOam98L16ntK1J0rmUd644vxn32XUmB4PV3tXcTyb?=
 =?us-ascii?Q?+7lQzx4cWIky/OvxmhV0T8CY7eJfV65xDkvz4BYZxlHf/EWRFGai4P33dqlo?=
 =?us-ascii?Q?ioxx+f+oK4L394n1Hv83Ds7GCCOGM6Z9c+nSvdfxEWhs+DoKXEjhSqtlFzso?=
 =?us-ascii?Q?OvBEPmE5mqZ3qgk19U+v708ltLFKeN0gAuf8Vv6+XDmvt70Qmk7DCJpGpcIr?=
 =?us-ascii?Q?Y8u28P14QUoQyII58Q5csz5FwjSdz90J9Bd6T6xWFP3X69u6zOun5oMbmaAO?=
 =?us-ascii?Q?LuinyM0DFMr/Pw+zvwqrvL+haN9eTVIGsPbYHG/+jPzMbaORvgess14mI95o?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bf497e-f79d-4ee6-0467-08dcf72d715d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 08:49:33.0770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PdENuRC+eJ7dtTIVFj6OtMtUmBVYA7EBKu5zNq1uAUCCxCi85C/rt344ca65MW6zBagB8x3GUdyIEzFc7eJlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_include/linux/mm.h" on:

commit: c404f7bfe175730b83e0f5fe5822a02509800b9c ("memblock: uniformly initialize all reserved pages to MIGRATE_MOVABLE")
https://git.kernel.org/cgit/linux/kernel/git/rppt/memblock.git for-next

in testcase: boot

config: x86_64-randconfig-015-20241025
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | 4bb21dbb67 | c404f7bfe1 |
+------------------------------------------+------------+------------+
| boot_successes                           | 18         | 0          |
| boot_failures                            | 0          | 18         |
| kernel_BUG_at_include/linux/mm.h         | 0          | 18         |
| Oops:invalid_opcode:#[##]PREEMPT_SMP     | 0          | 18         |
| RIP:set_pfnblock_flags_mask              | 0          | 18         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 18         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410281628.9a7b7fed-lkp@intel.com


[    0.201373][    T0] ------------[ cut here ]------------
[    0.201738][    T0] kernel BUG at include/linux/mm.h:1637!
[    0.202128][    T0] Oops: invalid opcode: 0000 [#1] PREEMPT SMP
[    0.202538][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G                T  6.12.0-rc3-00002-gc404f7bfe175 #1 4771f81984738db694a7cfb2266994a5aa541fc1
[    0.203527][    T0] Tainted: [T]=RANDSTRUCT
[    0.203812][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.204509][ T0] RIP: 0010:set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.204923][ T0] Code: 21 c1 48 09 f1 f0 49 0f b1 4c d1 18 74 ed eb ec 48 c7 c6 c6 15 11 83 e8 7e b0 fb ff 0f 0b 48 c7 c6 b2 74 09 83 e8 70 b0 fb ff <0f> 0b 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 66
All code
========
   0:	21 c1                	and    %eax,%ecx
   2:	48 09 f1             	or     %rsi,%rcx
   5:	f0 49 0f b1 4c d1 18 	lock cmpxchg %rcx,0x18(%r9,%rdx,8)
   c:	74 ed                	je     0xfffffffffffffffb
   e:	eb ec                	jmp    0xfffffffffffffffc
  10:	48 c7 c6 c6 15 11 83 	mov    $0xffffffff831115c6,%rsi
  17:	e8 7e b0 fb ff       	call   0xfffffffffffbb09a
  1c:	0f 0b                	ud2
  1e:	48 c7 c6 b2 74 09 83 	mov    $0xffffffff830974b2,%rsi
  25:	e8 70 b0 fb ff       	call   0xfffffffffffbb09a
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  33:	0f 1f 84 00 00 00 00 
  3a:	00 
  3b:	66                   	data16
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	66                   	data16
  3f:	66                   	data16

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   9:	0f 1f 84 00 00 00 00 
  10:	00 
  11:	66                   	data16
  12:	66                   	data16
  13:	66                   	data16
  14:	66                   	data16
  15:	66                   	data16
[    0.206241][    T0] RSP: 0000:ffffffff83203e38 EFLAGS: 00010046
[    0.206645][    T0] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff83212800
[    0.207184][    T0] RDX: 0000000000000000 RSI: 00000000ffff7fff RDI: 0000000000000001
[    0.207717][    T0] RBP: c000000000000000 R08: 0000000000000000 R09: 0000000000000001
[    0.208253][    T0] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000042d400
[    0.208784][    T0] R13: 4000000000000000 R14: 000000000042fc30 R15: ffffea0010b50000
[    0.209316][    T0] FS:  0000000000000000(0000) GS:ffff88842fc00000(0000) knlGS:0000000000000000
[    0.209912][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.210350][    T0] CR2: ffff88843ffff000 CR3: 000000000321a000 CR4: 00000000000000b0
[    0.210883][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.211421][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.211953][    T0] Call Trace:
[    0.212166][    T0]  <TASK>
[ 0.212358][ T0] ? __die_body (arch/x86/kernel/dumpstack.c:421) 
[ 0.212647][ T0] ? die (arch/x86/kernel/dumpstack.c:?) 
[ 0.212899][ T0] ? do_trap (arch/x86/kernel/traps.c:171) 
[ 0.213174][ T0] ? set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.213543][ T0] ? do_error_trap (arch/x86/kernel/traps.c:217) 
[ 0.213853][ T0] ? set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.214223][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:312) 
[ 0.214532][ T0] ? handle_invalid_op (arch/x86/kernel/traps.c:254) 
[ 0.214859][ T0] ? set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.215233][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:316) 
[ 0.215542][ T0] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 0.215877][ T0] ? set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.216248][ T0] ? set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.216617][ T0] reserve_bootmem_region (include/linux/mm.h:174 mm/mm_init.c:568 mm/mm_init.c:729 mm/mm_init.c:765) 
[ 0.216977][ T0] memmap_init_reserved_pages (mm/memblock.c:2183) 
[ 0.217353][ T0] free_low_memory_core_early (mm/memblock.c:?) 
[ 0.217729][ T0] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:103 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
[ 0.218053][ T0] memblock_free_all (mm/memblock.c:2252 include/linux/atomic/atomic-arch-fallback.h:2672 include/linux/atomic/atomic-long.h:121 include/linux/atomic/atomic-instrumented.h:3261 include/linux/mm.h:76 mm/memblock.c:2253) 
[ 0.218363][ T0] mem_init (arch/x86/mm/init_64.c:1349) 
[ 0.218620][ T0] mm_core_init (mm/mm_init.c:2658) 
[ 0.218906][ T0] start_kernel (init/main.c:965) 
[ 0.219211][ T0] x86_64_start_reservations (??:?) 
[ 0.219574][ T0] x86_64_start_kernel (??:?) 
[ 0.219902][ T0] common_startup_64 (arch/x86/kernel/head_64.S:414) 
[    0.220230][    T0]  </TASK>
[    0.220425][    T0] Modules linked in:
[    0.220681][    T0] ---[ end trace 0000000000000000 ]---
[ 0.221042][ T0] RIP: 0010:set_pfnblock_flags_mask (include/linux/mm.h:1637) 
[ 0.221453][ T0] Code: 21 c1 48 09 f1 f0 49 0f b1 4c d1 18 74 ed eb ec 48 c7 c6 c6 15 11 83 e8 7e b0 fb ff 0f 0b 48 c7 c6 b2 74 09 83 e8 70 b0 fb ff <0f> 0b 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 66
All code
========
   0:	21 c1                	and    %eax,%ecx
   2:	48 09 f1             	or     %rsi,%rcx
   5:	f0 49 0f b1 4c d1 18 	lock cmpxchg %rcx,0x18(%r9,%rdx,8)
   c:	74 ed                	je     0xfffffffffffffffb
   e:	eb ec                	jmp    0xfffffffffffffffc
  10:	48 c7 c6 c6 15 11 83 	mov    $0xffffffff831115c6,%rsi
  17:	e8 7e b0 fb ff       	call   0xfffffffffffbb09a
  1c:	0f 0b                	ud2
  1e:	48 c7 c6 b2 74 09 83 	mov    $0xffffffff830974b2,%rsi
  25:	e8 70 b0 fb ff       	call   0xfffffffffffbb09a
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  33:	0f 1f 84 00 00 00 00 
  3a:	00 
  3b:	66                   	data16
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	66                   	data16
  3f:	66                   	data16

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   9:	0f 1f 84 00 00 00 00 
  10:	00 
  11:	66                   	data16
  12:	66                   	data16
  13:	66                   	data16
  14:	66                   	data16
  15:	66                   	data16


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241028/202410281628.9a7b7fed-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

