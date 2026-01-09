Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFF2DC793
	for <oe-lkp@lists.linux.dev>; Fri,  9 Jan 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767941028; cv=fail; b=g4lc7gv0du/zBR/Ukrt51lQAHYAizNWAMjtBitMutvRonpNOTkvUPSvCIUzBXmza985QNx8HxTHPa/V28yEoScBCtYR8i6IPBxOdxZum8qTa2QzRpXM8wXvlCerOiKmEvkb4Y1ZfxlSZErR78+bJsCOMIM06z4LX/Jz2zztvAXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767941028; c=relaxed/simple;
	bh=Z4ePJgRWvXAxywBu21GFD7M8iiZ7eJEofnoUBT018F0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dS0yVVfSnmhLMb1zK6EJ9XS4m2LfXZUBK07EtEvmHYCuMtiz5Kl1VCt6FGJzebrtaMrKN2GxkoN/5Dpee0/TAXz3tvVSRYTtEHGdaQkLWQubAPsRfoL/vKB/wLstyouK5aKnBX5RbDJAhGRMw/HKHvS3XsH6SSZ2tkdkn7aBqRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwMYgA1V; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwMYgA1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767941026; x=1799477026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4ePJgRWvXAxywBu21GFD7M8iiZ7eJEofnoUBT018F0=;
  b=HwMYgA1VdHEKKU8SnoJv77+N+5A8BbpD395ycB4McigPNljqca4EjkxB
   BRB8ADPxxglc5q666EFAdxqxHPUN9GzgwMylFTY68+D8mo0RYAOXguFxL
   1oapJaOffZGWoe1aTsZjfbSXoPiclk3I+M1Qxx9TvCxwjsMtxzFBlqTcL
   nODQr/HeQsMbXbPxYkH+Y/raphpyIvVooc3Pv+O+PUHvkP7clGqrBuiYB
   URZE7D1LVPzNFCdo8xn6toiP6Usu+slQj96eM3FQUjUlGteIC8LVjdAAk
   WHGtAeUWxUPWiHWeW6pj7K6Ifsku1/d8qpfc65MrPnaC6evgNvi45HdOE
   g==;
X-CSE-ConnectionGUID: X/7jZZ98Tkunq8VRNQiu1g==
X-CSE-MsgGUID: yJ5Bq8IuQ7mUfrUE1p3kmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="56876770"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="56876770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 22:43:46 -0800
X-CSE-ConnectionGUID: HB2H+3a5RnijxchkbpNVmA==
X-CSE-MsgGUID: d91Yd1WxQAaxt4VBNzCqtQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 22:43:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 22:43:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 22:43:45 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 22:43:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/GJAbaciGYCjn12NkC9dFbIxDvNtjnLk3Cgr6sHhi8j+0p2fY551PYB2KK/q8PsbWv+GPhhhtg85qE1m0Cr32fkIYz4iuli6tqTall9JLcoX1Zdcfh21svFBG2Ixq6Uv4odyQtw6hhZroVMjLDIImRNxVLQOB9tlzH/XVki9Mg4XCOfG3QNwLBncyXbFgPwpDwbHp1/X2WOK4BeLg/8HdSjf5mf+b9aH8fXz/yw+DT+OAWqQcckl4TzTi2NeIsi1rfLrJr4xzR8PJK4aFLt3fhPHCjxG5q2owvFBvnnnsPNUKfTLmVykInOvW+mUT54xi/dNnUJ2Uq5Oj3YrZgoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Wq3fyrMdZqbvIMSyVt333GwIZavORNLlJmHqi4x/8=;
 b=erUSH2SfDFkf8+/IP1KWywsiHKtsWedixuEe+OhESnX5Y6j7gV/MdswXS9hicUSAidvReIAuLpjhUM5OszAv9iHMWE/GdZwU9smhNPPpGwxLeDBnFOSARxWKejNZ1hqpymkKf02hfOp+hnoruuzjTUl+NaOuZFvr3VHiHYzhecCI2kDiQjSOLQcVolYEYLqzrgtX/POrUGLqF8AYCKmj5KJuZnpZIlDXLF7XeGGOjy/SbfO2gXMOZAstWGbrc49fUUNQKxB54r6ThPzXQMmKNcWNnVIUSXQkkRGQeHt/WD46B95XDCw8AIKWknbwDwM19P/G+fgLWeKKkMS/0FjCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:43:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 06:43:43 +0000
Date: Fri, 9 Jan 2026 14:43:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [isilence:zcrx/large-buffers-v8-test] [net]  8177b4e8d2:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202601091437.636c7d12-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d7c540-9304-4832-e7f4-08de4f4a6e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l88S+25xpJtIs6H3LCgybFvbM/BVpVRkoEN8NGDIyA1A+KQKcCMkQ4J3kuM+?=
 =?us-ascii?Q?7U9rPtdKSXKrmADpHApwMAcEHhbWO+NWn05CujaC61GNyxa084fv7ufwkQ2H?=
 =?us-ascii?Q?WiHETrnUFVQQKLdS6llHxG+C7rBQbeuQvNcwGOC0z8bUMztCcK25KqeuxKCJ?=
 =?us-ascii?Q?4HRHP7TZkkvn8O2sovkh/AyA0oEquAlAAAZB7C50af96GEVqTpPVKh5INZ6z?=
 =?us-ascii?Q?2DD8XUXbhbEiFxqPuAQfgGLJVV6JaZCSZXbtf1eXYfubEAY0KRY73A3oKVuy?=
 =?us-ascii?Q?0sQULkACQFkeL+WIH79WTmsNwYqg7MnZy/SCdIhmjYGffKF14R2irk3wY5Ad?=
 =?us-ascii?Q?G9qzX38wnWyJ6G8+Y1+fMqdWqwBUvyqa23K0aGlKL5Y7WHvrLNWHhXCWgwct?=
 =?us-ascii?Q?3mzkuq48Zsirm73iOEH7+rIgvQwqvJbjrlYn5lBqILbHZR9wGT+dq3tlvXCN?=
 =?us-ascii?Q?uc8x9zB9Q8A5Q3RcIexDFGxYkygHfT27KV/Q1zZSxYNbjiCN4paGxv/Mc6JE?=
 =?us-ascii?Q?Z6E9uteQTBRlvSR6hABiq7jx8GY7I/ibw9fyZXd4Uct0837Zf50pi/xgLvNm?=
 =?us-ascii?Q?DNSQjAhSL9qL/NCJDAsw2LdX9FEWqTojuz5eAme4a61WY3u7BYtNHvQqysY0?=
 =?us-ascii?Q?manJWlHyceMoVQ11lA4eKAS4DiDfzTv9Xjp/7HzPD6f3OaTROCHkCHCKDo4Q?=
 =?us-ascii?Q?CtfDSmOJx1/XccquHJmXSPBp3R7ZAEzswAtBuJSi3P/0RBxq2Jvdvxp426/B?=
 =?us-ascii?Q?8lB/pnA68M4cNRT4Or/6PfKDRGLLDUYJt5kKMADusXLDENoTWvxsMbavh0zj?=
 =?us-ascii?Q?FkkPRjxvJkxJBVJZQQ4rMTxSVy2VadkXw7njyNv1xLJ5HuDxzu+aqqaUzxeV?=
 =?us-ascii?Q?Jctp4SIXRJKx0Ryux5OuAYGW2jPwxAiWW6bEud4I19ZrHcrcAiMVpV3be3Oa?=
 =?us-ascii?Q?Rpp47JpnUiRyZ6h2C4sXn0vGvejvcCp2jkBDR52vpA8sdwmvdqkOaBaUUdLd?=
 =?us-ascii?Q?vjolk6HyXymh87+NqcIFdboGhffvWCjlRlqjr/MVj85PW9TM1blT9S5JbP6N?=
 =?us-ascii?Q?vWiXANlA1hfR/OIbfDuEFTRk/JgmmILRblbEa1JUS5aLWocH70LpRaTuDXnk?=
 =?us-ascii?Q?8VhAJl4ewGpL48hD9krG34OTMB9WxJAEyo7zKA5ZMIXBAbPg+3EX84RkcQ+G?=
 =?us-ascii?Q?Pp/XS/loYzDKOHIwQGmo8n99Bcsa12UXRpIoUiaymzNakUnIXixvpUXRhWqv?=
 =?us-ascii?Q?ZIU+kccYIpHo5w7JH7o/Rz9jHtDGel86zBqYHNGEwyv84cxsK9B2rBwkgVkJ?=
 =?us-ascii?Q?twl7Y0KjdS3semcxyEpkDVPKU8GZxNr0ufDAupkPpr82WbHN+hkJXf6bWxTY?=
 =?us-ascii?Q?hPEanxbthRRStz1v/Lt1Dfur3mns0jvEvnHgAyv+qaM2ltMQvB0Dw5UyjLso?=
 =?us-ascii?Q?tRt0z2dIo3NQsmNTeOvNmd8nLpe73qlH7+se7sbiAAqdxVs/rnXJ4g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oH2P1uU0QQeq+K1NvBv8RgiKOhSI99rppqW/xldkgI8zfwnslDsliqasaVJ6?=
 =?us-ascii?Q?WMA5CxeD9D5f8cUKR7e7f92VaFmae+fZUdF0emYztkli7EMSK0ER/z2tlnr2?=
 =?us-ascii?Q?8/zuwls7uC0U8qs1VGa/1aMzAww3uRV2htpVlH4IQXDIxD6iwmiHsFFyOeVw?=
 =?us-ascii?Q?8EQLHd6aIV8qsCAORyWrzFCfCYPoAUjWCAJC6RrJcbsqwvBdzV9ZHi2UUpTI?=
 =?us-ascii?Q?lomo1UxEj58jbaft5Y17R44pbU5pxykI+ysYi4zg+OeL/G8BMRSaqjlB8Bik?=
 =?us-ascii?Q?NambsDueco0ajgA++3HvlmQbBPKhUk+J98DVGRF5lNn6AsndZyq3sFh7BUPX?=
 =?us-ascii?Q?Ac57WFFeVVmu2d38/61BPLq7nQ5/PryWkx9wj/2RSITrrMyP6/n5TdJLlw56?=
 =?us-ascii?Q?fptPymTxIxFRv5Lz61nxFAD4GJfZ60qD3sU5/3HYjy9AVsvlE9s8Fva6c6D0?=
 =?us-ascii?Q?mjepesiN6VVlzR+VTOl38+9BQJkZFgVZ9Uz8aCdNSXqJsGiUyPvsKlU4UuYp?=
 =?us-ascii?Q?UBmZwDYED9Oqf7Trug3FTQ9K0J2YBEN+oAOBj6YPk10zlXyoHNW/yUoeQWvF?=
 =?us-ascii?Q?eK62zPnJkbzFlrNN37D0Oo0b+kUN/KnIwlG2ctbbPwtpzRepY1B0ko+fVeBs?=
 =?us-ascii?Q?4arfdzLZQWODulAJ1ERnn5NcLLaQ7BzzBVHZ+JhIIuabOq03IMVu9MVHZ4MN?=
 =?us-ascii?Q?quB6pmK198qTH0rNzRz2E7mwAWU8eqhbxLUgOMAnXKeYNNoj0SvY2B6Fqa5M?=
 =?us-ascii?Q?IaIJBxHu1YAaMeA2+Tz6ppXuBRzRIz1IdpWRICPyvouvGHY+uTp6saV5ObzL?=
 =?us-ascii?Q?97b5laK2gdtfga9ZtgANMhSQE4+5NFFScYfeM7jhXJNMGSOMuXR3nQ1WuEgF?=
 =?us-ascii?Q?iN3OmAi7QRROOgCp1EoKmtdo17dDwzmLewqlDYBpHx+Co0CA5c0LNkPfQZ/y?=
 =?us-ascii?Q?ZiBvD7REtbpBLcfe4RebBdTSD4oGqbBGeFaCg2LNT7Ry/l7FTCjGmsVcfEss?=
 =?us-ascii?Q?s+wwHPs3E2iLlsFrpERfJ7F53caOE6ZLSF1IwoeHrYOXA+wPUe8ajZ2GD6/Z?=
 =?us-ascii?Q?Vm0xcn5ZlrqHNITcoz6IReXLfBgPhrUrFKvClcS/hYSfDMQTKXOv0rUHNAYX?=
 =?us-ascii?Q?URxsZG9NeTtUpgQZI6jgstIJvVPv63mfGakswFC87jgmkqpS3Um2Iku/b46C?=
 =?us-ascii?Q?cIdmLpl3xgzvMMMQggDLxGLVOL5wOFeS5ZGJ8ppaPuRELIict3BzRwKN6Oag?=
 =?us-ascii?Q?wwRIOz5O6yx/mj2tooGGhs+XcF6h+rhCMqZObhIFtAAVIP71gcxAr+jDsR13?=
 =?us-ascii?Q?RMPUdOWWRzzrzuvEDR0XWK0jDHYOD/N0e2SWj/QU7d03vgXXvb44e6oey1ll?=
 =?us-ascii?Q?cHc/Nd2ku7LvWByoSQ11zKTpdGfgrGgumkIUz+Se2QIFLdd++4LE3WUU9Tdc?=
 =?us-ascii?Q?dVNdQ9a3hXxyQwXpIdr3gLQBQ3Vl7iNBs/urVEOo6vTvGSfjU6IQ8KHHn5wB?=
 =?us-ascii?Q?4yQLYQbRgKFtWZe50IxmugVFnd5PT9Np3ogi30mHzBJw8nS4PA+LXgrRH2jm?=
 =?us-ascii?Q?OdW+imCiGOC1j5XpTKiWDSDy5UZVF8ki6zgG455IJx/napb4LpRrqOEm1Sm5?=
 =?us-ascii?Q?z12ox0JR71dkyhSoXfK5kmoBjqcG4LKOBQy/jcTAXOMVVcBmBb7fRKeqUtPZ?=
 =?us-ascii?Q?nUIHRKKMZzccGtGxwwt2gpOqgrcBaqNjdRguXCnAiij0q04VNM/fEwZLNkKx?=
 =?us-ascii?Q?u911TS380A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d7c540-9304-4832-e7f4-08de4f4a6e94
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:43:43.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dDYnwYmrlZTN1kUNBNdfaU++YXNZfsM+l0VZPFwHbH+wmIiRyAxvlJUJRgQiFXJQoyfZ3GlgWIq27OsSn7inQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 8177b4e8d28dafa6ddb07f09d2968ce812567410 ("net: add qcfg init")
https://github.com/isilence/linux zcrx/large-buffers-v8-test

in testcase: boot

config: x86_64-kexec
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 41c5f52fb5 | 8177b4e8d2 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 15         | 0          |
| boot_failures                               | 0          | 15         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 15         |
| Oops                                        | 0          | 15         |
| RIP:register_netdevice                      | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601091437.636c7d12-lkp@intel.com


[    8.916973][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000028
[    8.920203][    T1] #PF: supervisor read access in kernel mode
[    8.920275][    T1] #PF: error_code(0x0000) - not-present page
[    8.920275][    T1] PGD 0 P4D 0
[    8.920275][    T1] Oops: Oops: 0000 [#1] SMP PTI
[    8.920275][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc3-00127-g8177b4e8d28d #1 PREEMPT(voluntary)
[    8.920275][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    8.920275][    T1] RIP: 0010:register_netdevice (net/core/dev.c:11279 net/core/dev.c:11333)
[    8.920275][    T1] Code: 48 08 48 89 08 48 89 58 20 4c 89 78 28 48 89 c2 48 83 c2 10 48 89 50 10 48 89 50 18 48 89 83 20 01 00 00 4c 8b b3 c8 07 00 00 <49> 39 4e 28 74 3e 83 bb c0 03 00 00 00 74 35 41 bc a8 00 00 00 45
All code
========
   0:	48 08 48 89          	rex.W or %cl,-0x77(%rax)
   4:	08 48 89             	or     %cl,-0x77(%rax)
   7:	58                   	pop    %rax
   8:	20 4c 89 78          	and    %cl,0x78(%rcx,%rcx,4)
   c:	28 48 89             	sub    %cl,-0x77(%rax)
   f:	c2 48 83             	ret    $0x8348
  12:	c2 10 48             	ret    $0x4810
  15:	89 50 10             	mov    %edx,0x10(%rax)
  18:	48 89 50 18          	mov    %rdx,0x18(%rax)
  1c:	48 89 83 20 01 00 00 	mov    %rax,0x120(%rbx)
  23:	4c 8b b3 c8 07 00 00 	mov    0x7c8(%rbx),%r14
  2a:*	49 39 4e 28          	cmp    %rcx,0x28(%r14)		<-- trapping instruction
  2e:	74 3e                	je     0x6e
  30:	83 bb c0 03 00 00 00 	cmpl   $0x0,0x3c0(%rbx)
  37:	74 35                	je     0x6e
  39:	41 bc a8 00 00 00    	mov    $0xa8,%r12d
  3f:	45                   	rex.RB

Code starting with the faulting instruction
===========================================
   0:	49 39 4e 28          	cmp    %rcx,0x28(%r14)
   4:	74 3e                	je     0x44
   6:	83 bb c0 03 00 00 00 	cmpl   $0x0,0x3c0(%rbx)
   d:	74 35                	je     0x44
   f:	41 bc a8 00 00 00    	mov    $0xa8,%r12d
  15:	45                   	rex.RB
[    8.920275][    T1] RSP: 0000:ffffc90000013a00 EFLAGS: 00010282
[    8.920275][    T1] RAX: ffff88810d3531c0 RBX: ffff88810d380000 RCX: 0000000000000000
[    8.920275][    T1] RDX: ffff88810d3531d0 RSI: ffffffff838304f0 RDI: ffffffff826e1e01
[    8.920275][    T1] RBP: ffff88889c4ff000 R08: 0000000000000040 R09: 0000000000000000
[    8.920275][    T1] R10: 00000000ffffffff R11: 0000000000000000 R12: 0000000000000000
[    8.920275][    T1] R13: 0000000000000001 R14: 0000000000000000 R15: ffff88810d380110
[    8.920275][    T1] FS:  0000000000000000(0000) GS:ffff88889c4ff000(0000) knlGS:0000000000000000
[    8.920275][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.920275][    T1] CR2: 0000000000000028 CR3: 0000000002a30000 CR4: 00000000000406f0
[    8.920275][    T1] Call Trace:
[    8.920275][    T1]  <TASK>
[    8.920275][    T1]  register_netdev (net/core/dev.c:11526)
[    8.920275][    T1]  loopback_net_init (drivers/net/loopback.c:219)
[    8.920275][    T1]  ops_init (net/core/net_namespace.c:138)
[    8.920275][    T1]  register_pernet_operations (net/core/net_namespace.c:1390)
[    8.920275][    T1]  register_pernet_device (net/core/net_namespace.c:1476)
[    8.920275][    T1]  net_dev_init (net/core/dev.c:13261)
[    8.920275][    T1]  ? __pfx_net_dev_init (net/core/dev.c:13191)
[    8.920275][    T1]  do_one_initcall (init/main.c:1378)
[    8.920275][    T1]  ? __alloc_frozen_pages_noprof (mm/page_alloc.c:5210)
[    8.920275][    T1]  ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
[    8.920275][    T1]  ? __pfx_ignore_unknown_bootoption (init/main.c:1424)
[    8.920275][    T1]  ? parameq (kernel/params.c:81 kernel/params.c:91 kernel/params.c:99)
[    8.920275][    T1]  ? parameq (kernel/params.c:90 kernel/params.c:99)
[    8.920275][    T1]  ? __pfx_ignore_unknown_bootoption (init/main.c:1424)
[    8.920275][    T1]  ? parse_args (kernel/params.c:153 kernel/params.c:186)
[    8.920275][    T1]  do_initcall_level (init/main.c:1439)
[    8.920275][    T1]  do_initcalls (init/main.c:1453)
[    8.920275][    T1]  kernel_init_freeable (init/main.c:1692)
[    8.920275][    T1]  ? __pfx_kernel_init (init/main.c:1570)
[    8.920275][    T1]  kernel_init (init/main.c:1580)
[    8.920275][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    8.920275][    T1]  ? __pfx_kernel_init (init/main.c:1570)
[    8.920275][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[    8.920275][    T1]  </TASK>
[    8.920275][    T1] Modules linked in:
[    8.920275][    T1] CR2: 0000000000000028
[    8.920275][    T1] ---[ end trace 0000000000000000 ]---
[    8.920275][    T1] RIP: 0010:register_netdevice (net/core/dev.c:11279 net/core/dev.c:11333)
[    8.920275][    T1] Code: 48 08 48 89 08 48 89 58 20 4c 89 78 28 48 89 c2 48 83 c2 10 48 89 50 10 48 89 50 18 48 89 83 20 01 00 00 4c 8b b3 c8 07 00 00 <49> 39 4e 28 74 3e 83 bb c0 03 00 00 00 74 35 41 bc a8 00 00 00 45
All code
========
   0:	48 08 48 89          	rex.W or %cl,-0x77(%rax)
   4:	08 48 89             	or     %cl,-0x77(%rax)
   7:	58                   	pop    %rax
   8:	20 4c 89 78          	and    %cl,0x78(%rcx,%rcx,4)
   c:	28 48 89             	sub    %cl,-0x77(%rax)
   f:	c2 48 83             	ret    $0x8348
  12:	c2 10 48             	ret    $0x4810
  15:	89 50 10             	mov    %edx,0x10(%rax)
  18:	48 89 50 18          	mov    %rdx,0x18(%rax)
  1c:	48 89 83 20 01 00 00 	mov    %rax,0x120(%rbx)
  23:	4c 8b b3 c8 07 00 00 	mov    0x7c8(%rbx),%r14
  2a:*	49 39 4e 28          	cmp    %rcx,0x28(%r14)		<-- trapping instruction
  2e:	74 3e                	je     0x6e
  30:	83 bb c0 03 00 00 00 	cmpl   $0x0,0x3c0(%rbx)
  37:	74 35                	je     0x6e
  39:	41 bc a8 00 00 00    	mov    $0xa8,%r12d
  3f:	45                   	rex.RB

Code starting with the faulting instruction
===========================================
   0:	49 39 4e 28          	cmp    %rcx,0x28(%r14)
   4:	74 3e                	je     0x44
   6:	83 bb c0 03 00 00 00 	cmpl   $0x0,0x3c0(%rbx)
   d:	74 35                	je     0x44
   f:	41 bc a8 00 00 00    	mov    $0xa8,%r12d
  15:	45                   	rex.RB


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260109/202601091437.636c7d12-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

