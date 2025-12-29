Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62225BEE5
	for <oe-lkp@lists.linux.dev>; Mon, 29 Dec 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766997659; cv=fail; b=W8QN7QSxCeIpIAKmrmxw/rPleC2HRioG97o5R0+FbxgMql0+YtGGKfoKm6xiKviWxUpH46lMxpwfoQp8hPqMkHbrryccVtEbFR4WOwRHSzmHnCV3Uaw4oV46MdY9Ip4C+ZmA3oD9z6sybUWnOHJ+I4/S2yrcA3SaAvqzVmQQOE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766997659; c=relaxed/simple;
	bh=chFAWGIuB1aMcWslZaoG/aVvHmYOAGGCp3ws+PkbLGs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=s3KLVvZRg+5en9y93rH+5HvDnGOUAqdelf4nAnCkVWji6G3qyIuBoQsdrBtV3lbdKUrQZXpNgUf2bkqu516+Vf0FVXCYY0OIj9uzDoYxkElp8zlQq+AQ6LUmTL2G74KmI5lvCbRVFTTlyG2H9JU1IcVWnMuY/bSKxZCC43NmRr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJPMhIJu; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJPMhIJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766997657; x=1798533657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chFAWGIuB1aMcWslZaoG/aVvHmYOAGGCp3ws+PkbLGs=;
  b=kJPMhIJulMes+H0MzWSmE2kGoo7TGKUXJ4blJRbcdmkN98BAAuawfAMd
   bESGUqsUq5WI2dPboCFwkn9FReTNDZsD7BCyODFf/JAhJFwQ1ik1afgSN
   nra7lwpjwJIg0JrNbqp6VHKsfx+GYG4ZqsC0U0ueHbgjuquH4Z7bpxmRE
   oMAS/DhFFER8YDSPiqUsRp8ktJRqPE3E5Zr4W3ITQb7eRgcrp063v3h36
   lgUBBMFsKc6DYGHFn/BVyqILQF0eDUWOqWqXvcKAFHikPONDdphfPovlc
   5aO8V3/12WjCc6ouf4j8SkOwqrTYmSy1Lmo2UNXQI1huKTFMr0V0qdNTV
   g==;
X-CSE-ConnectionGUID: dEonO4orT3uBHtnTd+1Suw==
X-CSE-MsgGUID: TXe7IysoTlyWUA/goRia3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91264312"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="91264312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:40:56 -0800
X-CSE-ConnectionGUID: sBr7/PGvRM6rhLywkvKwTQ==
X-CSE-MsgGUID: xu+ej2oGSj+iXAHIdKsInA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205784038"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 00:40:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 00:40:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 00:40:53 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 00:40:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsYqbfI+veTcbL5hoiHBWOZmXkhRDh6KIvBf5o+GFzdXxktmSL8Dexiu0uK2ORSqDYjHA48rnnXc3hka97iAsYVR1RciLBMYGMjOgquzQ6h2ZlrxjvsVAHULpnTOehcx1G5BLg/PgzhHwm/F14wRoaL0l2LetQT6NwenzC5U2G9/57C+cWLFaeR+piQan9V2WORLfRuip2WVtxf84a4GLMfMRCWDX7m8fqjX/pBNmPBjNiwsY1vCG4PKb/42I7firwWHRQ8NKXlaNcNlVoQID+yMOmmhvmMkXP0HPSYw/Hkwf/wx7WuV7F0dOGF97LRiADSRTbKlhmAfADx9umavyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ansGWHWm2aPQIHGj0skUW3q85NdS0Ezb9W79sfmcppg=;
 b=IXbgF754p1rY7wU9e91e58zjCeNZ7CiZCzFxkVkSxGT6sLx5GTj1XLg5qxf+RtyLtAc/viAEKyGH8OlAKHSflsJYHtl7EDImsxvlR3PUIhsWpSUJvWs3oB1/8p0NERboECemLgpzajsaeuw4Nsq5PkcXgjdHddjCmp1s7YllHNexSYPg3Z4s6zJX+XrbZRxk4Lhtcrx+BWWxe/y9AdkCI+AwUxC1cRedi+W3AgStm5oQuqd9Ya1Hy7ZVKzL0e1btSqSN4XdJgnxVFIUttwh1iwW/MQCmOmW43a5p2ANZkauxAsQ8YX6gEWMQlrX14lZfzfcTPyq/eG0SrFH6MMiQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPF64C459891.namprd11.prod.outlook.com (2603:10b6:f:fc02::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 08:40:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 08:40:51 +0000
Date: Mon, 29 Dec 2025 16:40:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:hugetlb-init/v1] [arch, mm]  9cbe197f8d:
 kernel_BUG_at_arch/x86/mm/init_32.c
Message-ID: <202512291601.5baf5c49-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPF64C459891:EE_
X-MS-Office365-Filtering-Correlation-Id: ced30680-3625-43b0-e8a1-08de46b5f926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r/gCHyR//DbX24DW7rKko2cw9N3KR3lDZAE48unlsJd/ZSvEihbBUFYKJrla?=
 =?us-ascii?Q?hZCuNDlBbb9dYpDD0aipmU/WEBX6hE0ETIYajqwk3A6Wsi7On0cJ4DsvAu2A?=
 =?us-ascii?Q?/3ciYtxH9E3g4PpAEgo5aY+yZxXzZewO2DbpMvfsFl8Luefp5Sk+lCn5xqs5?=
 =?us-ascii?Q?o7+YeFk/ZKUe0iT6bEOJ0SAWUeiD5nPf57R5HeYvxNb8uf9nbBhwCqY28th9?=
 =?us-ascii?Q?EyqemkZrhiRSZe5dIvZ8dM7qpPDscHqBeKvGqTeGyH26xxk4A2S49jHVJZOG?=
 =?us-ascii?Q?6K4ne1GNjJWxlgWN5SnKs/Cp7ncxdN6OY0eYLOPPFUWgxTzykfhxdWrZNa5R?=
 =?us-ascii?Q?ye1meWpuKWufLWIU+jsowpgK7wGG3Nqc7IUZD1+ds96qTMrdiPXpAhjaFsSd?=
 =?us-ascii?Q?Sxuw7NQUsj2s8lb/GVsgBBUasOR6I1UyyePQvFYQM6b7G0aycDrDovdSBgz1?=
 =?us-ascii?Q?C5PJwvZNnHyGxmhS+bcoCXVN0IF6vSsqSEAWvIbw1BXCtPw07egsjAnrupJc?=
 =?us-ascii?Q?npHszjaQ/DfI4oazPjfiD+nahgj0wYvZwQaaiIifxuLBm4Bzqp/l/OAZ1zCA?=
 =?us-ascii?Q?DKZlhUQ2Y8N2JHhud010rxmk0tk9DF+XCsycIztohuWd6aL4ZKIx4K1nVWLB?=
 =?us-ascii?Q?sVLnydsx7jxB/zw7OCoG/okU6zulZ0ac58OHTTpcNuhQ2v6EdOWndYk/Rbiw?=
 =?us-ascii?Q?GEnyKXcVwJaYgKfROh6waaJFPNUls1h5MipGLkFvctrLUVxz8L5kRy+bT1bE?=
 =?us-ascii?Q?ygGkog4rR/Wcov+mRcVdZCRoaAD5n3VoXyUap+DmgJxFGN3+fc7mGPzz5V6H?=
 =?us-ascii?Q?DolzTyV0HXlau3NHHRlZ5nbQb+kgmmaw5DaPhQBdLkQN4P/beh+ro9XsLYCf?=
 =?us-ascii?Q?b57AvPDpUuvDKwdAnRGGWT2LjW1n5eJlcXhwzYDf+SsM7Zv4dlgFau1Q8xKY?=
 =?us-ascii?Q?dIxw9zfXzwdMBxXFSRio7LixWvwQc2rNXTgzKleplfKwbACEdXfWKDOlYHMt?=
 =?us-ascii?Q?0nS7adLuh1O78KsKvwXyXZS1QjT+xGbSMZ09qBf7ZwrICrSRe4x0PykY1d+3?=
 =?us-ascii?Q?sWfg0wt3JtoJ75TOWajn42uhiq1qKvGrd5wCLiPFDtN8mFOqUHZqSHn2Ip4M?=
 =?us-ascii?Q?LtqD96n1dmuR1YLUl/RB56qJRIy6GhFD3pFgyh29xW7FImNKlRH2MRGgWPlt?=
 =?us-ascii?Q?JPBpK7nyTin90vF5uDFdRERzojZGZuG1Le/HbcDhyszhQ9lEGyKeNt3zZIGm?=
 =?us-ascii?Q?udSixmPRmXNxDlh/fGh9WrHhX7DKaWgURaL3Rh/Ry+RRi3V4nsemBxx8Eao4?=
 =?us-ascii?Q?F5ZoaIHdAE7qmTGNly1DU8omhlaMimp31ID9SOnmAsOqyJExOGwQGQNpZKLv?=
 =?us-ascii?Q?wD1wx+ktT6AIcjL1WWD10UNM1AVZuhInqO3U4ObDHSlIeitNeJD9pLr8s2i2?=
 =?us-ascii?Q?3YE6Q3UqadWp4w4tWb/hI1PTS+tPRVdbDrR5b2SR2pn7FBLNA+mpFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5kqH8ybVxz9J7p1qn8wqe1K5MnlYI38om8KIC3CI8Rjc+S4sENQfbawOY3oB?=
 =?us-ascii?Q?tLYWNnQQirZsBhyH8umfAgTpfkTRf/QIU4iEJRi6eafmRJV4pGZbXNJ3iZJU?=
 =?us-ascii?Q?cG4JotBMmIFkMafYYeJ3tv62eEPLIvzlWfyaAEHmkNbNUyaz1ICMAiNLr+oM?=
 =?us-ascii?Q?DUvYgKkDwR++htpdH7X6ywXvDdqCSE6ATrvGK1Saq9t2V0hDZOmGEwfSdelh?=
 =?us-ascii?Q?Q0byfhm0mLTW4bGbJLuxgA6A8jrUMs3PLmpCWu5rn5h/HgJSY13fYdOaVga9?=
 =?us-ascii?Q?ndm0XrpXctUbJRsiE8fTQXSSl7l+pFqh+Qe2G8ZlCulNf9erofzHOhNmzzCH?=
 =?us-ascii?Q?WcC8xxGE/3vI0cDf9LdPAvWHJs5Gb3iJee62qadhwO9Zy2Ov/7pwG/s0g20v?=
 =?us-ascii?Q?jCthuwh5HtwWQn/GFN6+kcbCpam+U8C23IAbS7EUBBf8nabawrAfn4idOpDE?=
 =?us-ascii?Q?LcwFzD+3I5EEGZ/MG0ELxjY0TJXJtoc34P5MfRbYThbv6itFMZroehJzkL45?=
 =?us-ascii?Q?gQajvQouilZ88WgiOW6n9A8WMCBrVdrqmZhhuKP9bu8hI8kiPuWx3HYY3eGH?=
 =?us-ascii?Q?1jCreg0ztLeEovCjWi8Ob5zRn5oAQIFbmZpXZVHccnl3W+3lbm4jBaSHZ6ju?=
 =?us-ascii?Q?gf7wSaA69HvSnZAXV/PYl+LNlwzYaBZEfR90SLm6YyFmmxZXjlnkA1oxaQRj?=
 =?us-ascii?Q?KXC9m2x3KdMXbitJXOqJiZccWJvJmUtUfq4K/ZTrFAMo62X0BlNaxXHQfJjj?=
 =?us-ascii?Q?8SK9jX4tTs4J3kmenT+A/yep7PVKC6d7jCFKqVXN7PyGnrkv/wvHGoH6TuJA?=
 =?us-ascii?Q?la6+CeD+QkZ0GR38w+LtFDbloWrqMpNXmgf1Af2ykKM8u5kPd4Ye/Kt3PAhr?=
 =?us-ascii?Q?BVZMekvRLgk3pG7vL1f1oZ9yurrv9rXxNT+J5/u78WzYW3Q/DGEQCmy3bZXW?=
 =?us-ascii?Q?V5qV5GlpBlZgZpqOo4C7ShMo3adLGsK4B6KSV6YbP0km0EcNUasoYcz+S0u1?=
 =?us-ascii?Q?AzR55Dhgh/N2tZJbxj6j/wkBb91+RzdqE3tZG0SzzGR2OeQffogiGIVyUhtI?=
 =?us-ascii?Q?xjZsfxOudEz9xprJpbw+FA6sDZcQkOP/qNCA6p69pIRsiMDb0Psmt8v475pk?=
 =?us-ascii?Q?OBZUDd8Lx0EEiE/xUy/+A73PuuyRR2UesISqYT8VO9NMHcrHx8k6maO9uBt8?=
 =?us-ascii?Q?uMKKPJIzaf0duYD5vkJbs63HEtWHTF2r4MkgPu4hXFP4sdThhpbLK6VIXm3b?=
 =?us-ascii?Q?yURjwJXoBNzSklzHeyoNmnCPT6aOXDzMyq1Xq+5lvw3jh3Uiue2wozdtOVgS?=
 =?us-ascii?Q?LKNNk7b5kLYJ8azKj+RaYzI8deO3ucWE7KXClh5fXGltofZNm73yNLNPgapO?=
 =?us-ascii?Q?RKxlguz8AuhmaiVlWod+hFAnq6PnAHbAsiyQtlar8k14WmUEdYvk5yFejl/l?=
 =?us-ascii?Q?OpMhtHUEkUZ2Ynt4vC1/f0gek2Yjh2XOnW6EekiBuV21w0eRl6o2OtkqhRPO?=
 =?us-ascii?Q?OoIanm5iDqkK+xpqCQLR+F+qSYGflS4L7BVTcljdqoqNs3SoGZOkngUJjWS+?=
 =?us-ascii?Q?rYr8UhucmpnWw032AcMwpmgfO8YV9I6Pet/oCBKEZxrdYMuaT9gkZY3g5Zso?=
 =?us-ascii?Q?BxcXHyw1oxvToNKxUnDP7UvsuGMYdw5K7BFMipP2hPe83+NFS0tLPftmIF5F?=
 =?us-ascii?Q?ke2lHeJvcavanRICXk1bKepBh51u+ZBZGDiF43gs4F+HqWp7FC7bKXBd7fnv?=
 =?us-ascii?Q?2VMoWnTpqw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ced30680-3625-43b0-e8a1-08de46b5f926
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 08:40:51.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITHyw0zMkXF5sowDD3qJQ1s/1cxFTxYNrJiiui447OvTO7Ij69ltcQvFkq+pAO230DVMnqCmvrkRDf+sdbqLaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF64C459891
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/init_32.c" on:

commit: 9cbe197f8d7866d1bbff91f3031301b726a6aea3 ("arch, mm: consolidate initialization of nodes, zones and memory map")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git hugetlb-init/v1

in testcase: boot

config: i386-randconfig-002-20251228
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | bfe5bb4f40 | 9cbe197f8d |
+------------------------------------------+------------+------------+
| boot_successes                           | 12         | 0          |
| boot_failures                            | 0          | 12         |
| kernel_BUG_at_arch/x86/mm/init_32.c      | 0          | 12         |
| Oops:invalid_opcode:#[##]SMP             | 0          | 12         |
| EIP:arch_mm_preinit                      | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512291601.5baf5c49-lkp@intel.com


[    0.172502][    T0] ------------[ cut here ]------------
[    0.172850][    T0] kernel BUG at arch/x86/mm/init_32.c:689!
[    0.173223][    T0] Oops: invalid opcode: 0000 [#1] SMP
[    0.173566][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G                T   6.19.0-rc1-00022-g9cbe197f8d78 #1 PREEMPT(undef)  298f246f9eeee98b3bf304fd18fc66aa0eb8200e
[    0.174580][    T0] Tainted: [T]=RANDSTRUCT
[    0.174852][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.175524][    T0] EIP: arch_mm_preinit (arch/x86/mm/init_32.c:689)
[    0.175840][    T0] Code: e8 bb 92 ed fd 83 c4 08 5d 31 c0 31 c9 31 d2 c3 e8 bb 36 f5 fd 55 89 e5 e8 83 b9 fe ff 83 3d c0 b3 94 83 00 74 04 5d 31 c0 c3 <0f> 0b b8 d8 ca b0 82 e8 3a 1b ee fd 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	e8 bb 92 ed fd       	call   0xfffffffffded92c0
   5:	83 c4 08             	add    $0x8,%esp
   8:	5d                   	pop    %rbp
   9:	31 c0                	xor    %eax,%eax
   b:	31 c9                	xor    %ecx,%ecx
   d:	31 d2                	xor    %edx,%edx
   f:	c3                   	ret
  10:	e8 bb 36 f5 fd       	call   0xfffffffffdf536d0
  15:	55                   	push   %rbp
  16:	89 e5                	mov    %esp,%ebp
  18:	e8 83 b9 fe ff       	call   0xfffffffffffeb9a0
  1d:	83 3d c0 b3 94 83 00 	cmpl   $0x0,-0x7c6b4c40(%rip)        # 0xffffffff8394b3e4
  24:	74 04                	je     0x2a
  26:	5d                   	pop    %rbp
  27:	31 c0                	xor    %eax,%eax
  29:	c3                   	ret
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 d8 ca b0 82       	mov    $0x82b0cad8,%eax
  31:	e8 3a 1b ee fd       	call   0xfffffffffdee1b70
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 d8 ca b0 82       	mov    $0x82b0cad8,%eax
   7:	e8 3a 1b ee fd       	call   0xfffffffffdee1b46
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[    0.177153][    T0] EAX: 00000000 EBX: ffffffff ECX: 00000000 EDX: 00000000
[    0.177604][    T0] ESI: 00000000 EDI: 00000000 EBP: 82ae1f74 ESP: 82ae1f74
[    0.178055][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
[    0.178538][    T0] CR0: 80050033 CR2: 00000000 CR3: 03251000 CR4: 00000090
[    0.178989][    T0] Call Trace:
[    0.179196][    T0]  mm_core_init (mm/mm_init.c:2702)
[    0.179465][    T0]  start_kernel (init/main.c:1068)
[    0.179752][    T0]  i386_start_kernel (arch/x86/kernel/head32.c:79)
[    0.180060][    T0]  startup_32_smp (arch/x86/kernel/head_32.S:293)
[    0.180360][    T0] Modules linked in:
[    0.180605][    T0] ---[ end trace 0000000000000000 ]---
[    0.180948][    T0] EIP: arch_mm_preinit (arch/x86/mm/init_32.c:689)
[    0.181258][    T0] Code: e8 bb 92 ed fd 83 c4 08 5d 31 c0 31 c9 31 d2 c3 e8 bb 36 f5 fd 55 89 e5 e8 83 b9 fe ff 83 3d c0 b3 94 83 00 74 04 5d 31 c0 c3 <0f> 0b b8 d8 ca b0 82 e8 3a 1b ee fd 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	e8 bb 92 ed fd       	call   0xfffffffffded92c0
   5:	83 c4 08             	add    $0x8,%esp
   8:	5d                   	pop    %rbp
   9:	31 c0                	xor    %eax,%eax
   b:	31 c9                	xor    %ecx,%ecx
   d:	31 d2                	xor    %edx,%edx
   f:	c3                   	ret
  10:	e8 bb 36 f5 fd       	call   0xfffffffffdf536d0
  15:	55                   	push   %rbp
  16:	89 e5                	mov    %esp,%ebp
  18:	e8 83 b9 fe ff       	call   0xfffffffffffeb9a0
  1d:	83 3d c0 b3 94 83 00 	cmpl   $0x0,-0x7c6b4c40(%rip)        # 0xffffffff8394b3e4
  24:	74 04                	je     0x2a
  26:	5d                   	pop    %rbp
  27:	31 c0                	xor    %eax,%eax
  29:	c3                   	ret
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 d8 ca b0 82       	mov    $0x82b0cad8,%eax
  31:	e8 3a 1b ee fd       	call   0xfffffffffdee1b70
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 d8 ca b0 82       	mov    $0x82b0cad8,%eax
   7:	e8 3a 1b ee fd       	call   0xfffffffffdee1b46
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251229/202512291601.5baf5c49-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

