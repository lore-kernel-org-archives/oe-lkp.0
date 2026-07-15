Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E63A7F52
	for <oe-lkp@lists.linux.dev>; Wed, 15 Jul 2026 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092145; cv=fail; b=eMK6scfG2yNNZ3prG5ftD2IQ6ea+xe9ErHJ8bTs5C6e5NKprG8x1wJSkLEAJHKzdUIiOCj2egmufwNxOvyQCdylB6VQyT6wZ4K6TsB410epVUGq/oZDPbhL4tlLTG6T1gZBqE71pWWG9RxX29hEb5j96zfTgX3eq9AaUja+kpOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092145; c=relaxed/simple;
	bh=xWGxWl9eWdEErB4Xc5FVdmZCPRch9uDRNerzEUJbpX0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MdEopAWgw6FTLknm25ECQhYpr0+Ey2wcRuu1Tt1AFBabWZ15UkLaORXrlTbUzTfE4C+X302d8mEB5c0VpD8MyG9MKLGppiIW8dmjEtbRzhnxfx8LR1GvIB9SnzA0nveFP7Yy2vp//XFYzMWJcmPmJs79G+gRlYD9qmMYLwBJA6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHgkomKQ; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHgkomKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784092144; x=1815628144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWGxWl9eWdEErB4Xc5FVdmZCPRch9uDRNerzEUJbpX0=;
  b=kHgkomKQ+LRyTGhEzxVf2UUNSqqGtFAy70vppezd0mgh85+lb/ZzsxTf
   f9tinBiGqy7GCG2WCAQ/cQEdxP8pzo33P0/rHJ3KTyErjtN2X6S725mte
   oZYEvdjjdQe2dCx1HoeyVRVpR8rFhCYnXStemd+laiJiJJJk8rwuq0kfl
   v2998qRIuDk7iO+vvyRbuH/OZn8zMN2a9vCSA/v/L6LyaZHFW1LPMqZE0
   PSmeeF/xzkQNQ608U3He5ReAaUAKoP9XWQEXhbwaZCKopQf4Ioi4VOk+n
   UKdt05/77pHcOqUUHmcSqrxhoMDOKFNF247nuNoCPyhj6f5xUINnbLv0M
   g==;
X-CSE-ConnectionGUID: TIdNEOb4STWVgrkp7v4bvA==
X-CSE-MsgGUID: BFDpH0f/SCCyeZTfcjD2Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110267240"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="110267240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 22:09:03 -0700
X-CSE-ConnectionGUID: M4d3QvuHSuaGxW142zvG0A==
X-CSE-MsgGUID: PFm/Dqs1S0atfHxeMDRIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="259892383"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 22:09:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 22:09:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 22:09:02 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 22:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab2yOW6Oq3Nzl8RY/dYSvM3J9s7nrAfLtcA4vKdMqo6RJSDYHZylRVasRKLS3zcpTYsiwQjXOvEDTa0Eq/9wzDQIiy9GgDYSjUnzQhzoYvyhgpzEwoAiyluqADz/Pzg2fHjioVv1DZuQsjEAB1dUfRLFNqqnpIeMqWPXxAz+4knbPwwk7wDoARXmaTi22dpN2imJYkx1ksbnNGeQ+k6c0gXgBZQZgFIcIfCFfKlYDgx9ZtL37mdAfTCCM7kv79qR+H1EVajS1zLkJ4mK+4BLMWCotthTi50vOSmKERwUAL9kVmFEgZ4z3fCBU6dkzgl2qWOrJC/UrWiIx1Zx2uI4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv+FpPVsjgHSktIu4d4vWD3LL6k4NOvtWI+nhk8hZJc=;
 b=wQK4AjslZYFCE5MTlnpIeR3DX4St152FcK5L+IS9LjDPvKkWOAmyzV18EcQcKi3avHC2MO/ALx9e21Dq9OdA4zBfmm5hDGARrGVNbJOyJPQt7QY4qfmmJNPHBK+J/266zdDi5bjVnrsrsRiWUey3fpP2iHeQaNuQuI72EixyJq4Al7uI789QPC8Ulu4jZd9IBEJHUGyclF0pX5ZOK5BjbieACT0jYh5ESWHNus7orMb6/Srgacs+VV7re8vnMNsge4EKXyps4TUkpZREotvbWKAnTnA3RtUeegUDoxz62/LIr3sChFFAjf2Kx/Mxqp432ERccvtG4MoPCycgld/xdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.19; Wed, 15 Jul 2026 05:08:54 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 05:08:54 +0000
Date: Wed, 15 Jul 2026 13:08:46 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [morimoto:sound-cleanup-2026-07-01-3] [ASoC]  a5740d78e4:
 dmesg.kernel_BUG_at_lib/list_debug.c
Message-ID: <202607151058.c3835ba8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KUZPR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::15) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: f353d6c2-500a-4cc5-c13e-08dee22f2a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: NBklmL6SABQW3K//M81GjT0bQGo+3UfBkFMD9yzDoSlZ1BJkgFQM8BqzZu7W6W/Et7udhbJz+pWYN8ndslBHWUMbBizict6NropsEXD4p0fTX9jzUdAHtj7mJi+i1P93hAUnFjCbkJHEogGK9GJnTj+h1XvXTp+bD1CCaCYzYog5+UdoBeLhQFDz5wtP4YkQXgpsd0qbK6x9ZtLSz5/1cQb+M98ImQanExNIer+8XjcG2RwNr+xVgGv1fUfBvoEzRcXKBqIFQCm5XDlVlsFKaFP8WkwKS+z2wnrpapLAJ0dcbv0LLujkn71zbWkcaAFJu35hpi0ZnuS1Ktdz2knjdDoBUiM3Yn4+egaMp5nMpM2tY7FIjP/5LmUcFm1FRI2untjL22u2KEQoL6n3dXmDb7ijwnfh+xKXyg4TRIr8tTwH8quwCcgtPBcILnn2GhXFXD5Ei6jlcvs3E9PLR2rdi8M/ZFNDrNhNnbh0p02rGTtysC9ubgLNAnmsmx8ZxI5NIb39LIbIkUHFrETzhNO+MxarW19Id6Qi+s4aHX7zURIzAKpadsHL7/jjB+nAsGcOL5bcrZKcNpgn/gR/Dos1moST46/QiHJcIGkXGtA6pNa1xszvkP/Yq00iZT4wjEbf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZkQuRESjBp1s2mufR4eXYOq6FLScm94v0c6dxhX7pvBCwJqtHsstDOWFrrg?=
 =?us-ascii?Q?lZnxmqEC8VrFwyleUTVMKpyXrMv2jhFP84LTXQgPVq1aarsG5enngiqFU95m?=
 =?us-ascii?Q?7P2J8gft0HscZ23XGLk1df2uuZm0xYOsQRXqE2ukbUwIMqo1id7v7DBIWyoU?=
 =?us-ascii?Q?zeElwH/THtZyckQ8fEpJYoCK2jIBy+1UCGFIsWVFYmkYl2nla3/8IJnjZvAm?=
 =?us-ascii?Q?HLMxyTwnhC8ptOeAtyYWZHvuO3O5SaEvrKfpbjuF/Cct+gEVAL1GxNl0uFOt?=
 =?us-ascii?Q?QxbZaAr8dmQm1Cpm+KuZbW7A7Qudjrk5+buKLZ2+IlgWSwBRWJ/hTdUqc+dJ?=
 =?us-ascii?Q?GRNLdFrRB8GOAXTrH9oCcPsYZgHJTAgXZZGI96hGuOjRaxYvgk4KrbScvgjv?=
 =?us-ascii?Q?Xv46dapjVglO2FO0BO0qgPLjfwYvhjBzr6S7IcV9xZk5Hp4GDkgC906QevQg?=
 =?us-ascii?Q?bb8235qV2Mw5PtC3Cs4r4dntAejtu137n7XqEcm/jriovbSceJ8W+r0xvvDl?=
 =?us-ascii?Q?OhcTKt/bpeoqE6Ca1mO9ozf35KU3wIT1Wu1igJm3Vrf4rJ9UvS/+e/Hi6ee1?=
 =?us-ascii?Q?SjGei+1pzyVfhBgw8IfcB/TixbQEE6pQJUSDuZv6j5P7BaO8uY5FiXJFJl0Q?=
 =?us-ascii?Q?JbiyvTfghFNOe5rXeYX11xryUfuBgyC9Li1XGcNMpw/6VjYwcWmeEC3w35rd?=
 =?us-ascii?Q?CK0xYjAEH+rq5raBKGBIyJ9jfyb4Vc1QOD8sGPxMCArwExRALUQ2+bOan+D1?=
 =?us-ascii?Q?7ZzLm0g1LApcOARV0A2y59CgPR2j++1Q2oLyXFTWOS02da5r6n/pjtagqbY3?=
 =?us-ascii?Q?hnjun7aJugZdmibY/BWwRsG/cNq/rsdRn41E9LgEQDK9wDUPPsRI71o00LLn?=
 =?us-ascii?Q?TwX1hSaJY9a7kxXWfSdVu1tgFNck7xfCldHP07UkNEyp0/okkkfKkdHQ4CDW?=
 =?us-ascii?Q?TtnNFTs/7dg+02UL+FRkpuJLMY0AUAh5kuKRNYEbu0vPlBFTKj/RhQcxSwKE?=
 =?us-ascii?Q?LECuo3KjCi+Aa2JevY4vgZ5MZc5TdzIIZrVKLaWcVXbibrN1Upn/91gwPfd5?=
 =?us-ascii?Q?Q0oCJviYlDW1DA66czE6xPukbdtASFbEEQGmqBcXb0JzlaYpSLMQp0BJFzGq?=
 =?us-ascii?Q?pJzSmiY7tlaZFwBOJDGLLS0MDgGq+1Dqt1MHCs/VRAUnqox7F6LCh9BbSeuM?=
 =?us-ascii?Q?TxfJnrOJj79zkAooSeIsLsZmPyxzT5zU8N2EvG+CBBR0CbwX1+x844glRDjc?=
 =?us-ascii?Q?Ij8DDSN0cDdZkwdsI8Sp9Oxhkk81zD9qU63dBw/Cgp3ve1xB/f2dqQTDDnGD?=
 =?us-ascii?Q?8CEbUFtCdX4+ECOkg8jKvCaR8j6dMgUzSUJiY+KYIGbXCnG7t/jixGWSuGWB?=
 =?us-ascii?Q?y3F2xEMtYz+hB3ti1FmAVE4IUUoeIumhsW9puKOYTfTVyOdIlUpkxBfjjy3Z?=
 =?us-ascii?Q?rau5iR5FrNQ79W83xDDoBnziGQ6gtp2IZ0GYuxzpdUZqhqSjFLbk3haVbKlK?=
 =?us-ascii?Q?uN+IWSwNgCVCclvG5/dEeFCdfpxU/VEJ3S1gJD87aTiRzIkukeEZwjjiceyB?=
 =?us-ascii?Q?RXkevBBFnB/Wp9K5UBI3hETbfMCqBJ4Acs9lORvSGSr9b5Yr72xV46Fz8gmT?=
 =?us-ascii?Q?hNRgHdFLKmXaTF3V5FIXzzJhPnvZdmNtqR+whDjbzSim0fgyjsvXVeVI3L6F?=
 =?us-ascii?Q?knR6Yy1CsAH2ZOt6oxe7hjbdBR6NB73Y9UbT3D+vqYSXOZDdZoPBVVQz+Wns?=
 =?us-ascii?Q?mh2BuRDeuQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: p8MlEDCKbgOlWK+cL0QGWOAk007MSkXGNiDEo0/nrL00m2USpfeU6IEe5ZPRjWatpGMIsJEuxHMVxbhP0UaeOmI7avW5cSw+cqEHM1MUw4YPd4p7aoEX7t7fHk7Z7eyubTiqaA+p6S9iKmPTwudde4Vtyg8v6mDqY9/FxEntDo1EjnL12L2dtEsfwh3QheSkMC/7FAgZVyDiTNwhDsRgbFVt3MMw0wYXq9+sW4QjrLYA9N+gC3PwOsR+3fY8ygLbAA52w6gcTRGYrg277t08/T8ACtSfJyda5s2kTSVjxKEeINFQGP4B0nUcji+E0AtbnhL/IL1dGzDRp0fFKm+G1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f353d6c2-500a-4cc5-c13e-08dee22f2a94
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 05:08:54.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhpneMj75Zu58LVDSWM9hM4ocUjbdwePl73pl4s1uicd3Cs2qezHtkL14zE8LIEPmFApRojZxaap/t9HNbjc4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com




Hello,

kernel test robot noticed "dmesg.kernel_BUG_at_lib/list_debug.c" on:

commit: a5740d78e4c663847aa2d91c6d97b90789824627 ("ASoC: soc-topology-test: use snd_soc_card_register()")
https://github.com/morimoto/linux sound-cleanup-2026-07-01-3

in testcase: kunit
version: 
with following parameters:

	group: group-00



config: x86_64-rhel-9.4-kunit
compiler: gcc-14
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607151058.c3835ba8-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260715/202607151058.c3835ba8-lkp@intel.com


[  146.608726][ T6314] KTAP version 1
[  146.612757][ T6314] 1..1
[  146.616156][ T6314]     KTAP version 1
[  146.619916][ T6314]     # Subtest: snd_soc_tplg_test
[  146.624877][ T6314]     # module: soc_topology_test
[  146.624890][ T6314]     1..11
[  146.633348][ T6316]  non-paged memory
[  146.636995][ T6316] list_del corruption, ffff88813723ba48->next is LIST_POISON1 (dead000000000100)
[  146.645917][ T6316] ------------[ cut here ]------------
[  146.651200][ T6316] kernel BUG at lib/list_debug.c:56!
[  146.656321][ T6316] Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
[  146.662375][ T6316] CPU: 2 UID: 0 PID: 6316 Comm: kunit_try_catch Tainted: G S  B   W        N  7.2.0-rc1+ #1 PREEMPT(lazy)
[  146.673509][ T6316] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [W]=WARN, [N]=TEST
[  146.681021][ T6316] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[  146.688877][ T6316] RIP: 0010:__list_del_entry_valid_or_report (kbuild/src/lib/list_debug.c:56 (discriminator 8))
[  146.695620][ T6316] Code: 00 00 5b b8 01 00 00 00 5d 41 5c c3 cc cc cc cc 4c 89 e7 e8 a6 cc 42 ff 4c 89 e2 48 89 de 48 c7 c7 a0 28 9e 84 e8 74 c6 87 fe <0f> 0b 48 89 ef e8 8a cc 42 ff 48 89 ea 48 89 de 48 c7 c7 00 29 9e
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	5b                   	pop    %rbx
   3:	b8 01 00 00 00       	mov    $0x1,%eax
   8:	5d                   	pop    %rbp
   9:	41 5c                	pop    %r12
   b:	c3                   	ret
   c:	cc                   	int3
   d:	cc                   	int3
   e:	cc                   	int3
   f:	cc                   	int3
  10:	4c 89 e7             	mov    %r12,%rdi
  13:	e8 a6 cc 42 ff       	call   0xffffffffff42ccbe
  18:	4c 89 e2             	mov    %r12,%rdx
  1b:	48 89 de             	mov    %rbx,%rsi
  1e:	48 c7 c7 a0 28 9e 84 	mov    $0xffffffff849e28a0,%rdi
  25:	e8 74 c6 87 fe       	call   0xfffffffffe87c69e
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 89 ef             	mov    %rbp,%rdi
  2f:	e8 8a cc 42 ff       	call   0xffffffffff42ccbe
  34:	48 89 ea             	mov    %rbp,%rdx
  37:	48 89 de             	mov    %rbx,%rsi
  3a:	48                   	rex.W
  3b:	c7                   	.byte 0xc7
  3c:	c7                   	.byte 0xc7
  3d:	00 29                	add    %ch,(%rcx)
  3f:	9e                   	sahf

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 89 ef             	mov    %rbp,%rdi
   5:	e8 8a cc 42 ff       	call   0xffffffffff42cc94
   a:	48 89 ea             	mov    %rbp,%rdx
   d:	48 89 de             	mov    %rbx,%rsi
  10:	48                   	rex.W
  11:	c7                   	.byte 0xc7
  12:	c7                   	.byte 0xc7
  13:	00 29                	add    %ch,(%rcx)
  15:	9e                   	sahf
[  146.714936][ T6316] RSP: 0018:ffffc900027dfa60 EFLAGS: 00010286
[  146.720813][ T6316] RAX: 000000000000004e RBX: ffff88813723ba48 RCX: 0000000000000000
[  146.728584][ T6316] RDX: 000000000000004e RSI: 0000000000000008 RDI: fffff520004fbf3f
[  146.736354][ T6316] RBP: dead000000000122 R08: 0000000000000001 R09: fffff520004fbf08
[  146.744123][ T6316] R10: ffffc900027df847 R11: 0000000000000001 R12: dead000000000100
[  146.751897][ T6316] R13: ffff88813723cad0 R14: 0000000000000008 R15: dffffc0000000000
[  146.759668][ T6316] FS:  0000000000000000(0000) GS:ffff888422776000(0000) knlGS:0000000000000000
[  146.768397][ T6316] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  146.774791][ T6316] CR2: 00007f8a3a9f00ac CR3: 000000041b674001 CR4: 00000000001726f0
[  146.782561][ T6316] DR0: ffffffff87d71888 DR1: ffffffff87d71889 DR2: ffffffff87d7188a
[  146.790332][ T6316] DR3: ffffffff87d7188b DR6: 00000000ffff0ff0 DR7: 0000000000000600
[  146.798102][ T6316] Call Trace:
[  146.801219][ T6316]  <TASK>
[  146.803992][ T6316] soc_card_unbind (kbuild/src/include/linux/list.h:132 kbuild/src/include/linux/list.h:246 kbuild/src/include/linux/list.h:260 kbuild/src/sound/soc/soc-card.c:1004 kbuild/src/sound/soc/soc-card.c:990) snd_soc_core
[  146.809827][ T6316] snd_soc_card_unregister (kbuild/src/sound/soc/soc-card.c:1474) snd_soc_core
[  146.816250][ T6316]  release_nodes (kbuild/src/drivers/base/devres.c:546)
[  146.820577][ T6316]  devres_release_all (kbuild/src/drivers/base/devres.c:576)
[  146.825335][ T6316]  ? __pfx_devres_release_all (kbuild/src/include/linux/list.h:46 (discriminator 2))
[  146.830695][ T6316]  device_unbind_cleanup (kbuild/src/drivers/base/dd.c:597)
[  146.835721][ T6316]  device_release_driver_internal (kbuild/src/drivers/base/dd.c:1354 kbuild/src/drivers/base/dd.c:1372)
[  146.841598][ T6316]  bus_remove_device (kbuild/src/drivers/base/bus.c:664)
[  146.846356][ T6316]  ? __pfx_bus_remove_device (kbuild/src/drivers/base/bus.c:623)
[  146.851632][ T6316]  ? __pfx_device_remove_attrs (kbuild/src/drivers/base/core.c:3143)
[  146.857077][ T6316]  device_del (kbuild/src/drivers/base/core.c:3961)
[  146.861232][ T6316]  ? __pfx_device_del (kbuild/src/include/linux/kobject.h:89)
[  146.865903][ T6316]  ? _raw_spin_lock_irqsave (kbuild/src/include/linux/instrumented.h:55 kbuild/src/include/linux/atomic/atomic-instrumented.h:1301 kbuild/src/include/asm-generic/qspinlock.h:111 kbuild/src/include/linux/spinlock.h:187 kbuild/src/include/linux/spinlock_api_smp.h:133 kbuild/src/kernel/locking/spinlock.c:166)
[  146.871090][ T6316]  ? __pfx__raw_spin_lock_irqsave (kbuild/src/kernel/locking/spinlock.c:273)
[  146.876793][ T6316]  device_unregister (kbuild/src/drivers/base/core.c:4002)
[  146.881376][ T6316]  kunit_remove_resource (kbuild/src/include/kunit/resource.h:115 kbuild/src/include/linux/kref.h:65 kbuild/src/include/kunit/resource.h:138 kbuild/src/lib/kunit/resource.c:59 kbuild/src/lib/kunit/resource.c:48)
[  146.886476][ T6316]  kunit_cleanup (kbuild/src/lib/kunit/test.c:1052)
[  146.890802][ T6316]  ? kobject_put (kbuild/src/include/linux/instrumented.h:112 kbuild/src/include/linux/atomic/atomic-instrumented.h:400 kbuild/src/include/linux/refcount.h:389 kbuild/src/include/linux/refcount.h:432 kbuild/src/include/linux/refcount.h:450 kbuild/src/include/linux/kref.h:64 kbuild/src/lib/kobject.c:737)
[  146.895040][ T6316]  ? __pfx_kunit_try_run_case_cleanup (kbuild/src/lib/kunit/test.c:945)
[  146.901091][ T6316]  ? __pfx_kunit_generic_run_threadfn_adapter (usercopy_64.c:?)
[  146.907827][ T6316]  kunit_generic_run_threadfn_adapter (kbuild/src/lib/kunit/try-catch.c:30)
[  146.913874][ T6316]  kthread (kbuild/src/kernel/kthread.c:436)
[  146.917769][ T6316]  ? recalc_sigpending (kbuild/src/include/linux/instrumented.h:97 kbuild/src/include/asm-generic/bitops/instrumented-atomic.h:41 kbuild/src/include/linux/thread_info.h:109 kbuild/src/kernel/signal.c:181)
[  146.922700][ T6316]  ? __pfx_kthread (kbuild/src/include/linux/list.h:404 (discriminator 2))
[  146.927120][ T6316]  ret_from_fork (kbuild/src/arch/x86/kernel/process.c:158)
[  146.931531][ T6316]  ? __pfx_ret_from_fork (kbuild/src/arch/x86/include/asm/entry-common.h:54)
[  146.936458][ T6316]  ? switch_fpu (kbuild/src/include/linux/instrumented.h:82 kbuild/src/include/asm-generic/bitops/instrumented-non-atomic.h:141 kbuild/src/include/linux/thread_info.h:133 kbuild/src/include/linux/sched.h:2087 kbuild/src/arch/x86/include/asm/fpu/sched.h:34)
[  146.940696][ T6316]  ? __switch_to (kbuild/src/arch/x86/kernel/process_64.c:403 kbuild/src/arch/x86/kernel/process_64.c:663)
[  146.945115][ T6316]  ? __switch_to_asm (kbuild/src/arch/x86/entry/entry_64.S:206)
[  146.949710][ T6316]  ? __pfx_kthread (kbuild/src/include/linux/list.h:404 (discriminator 2))
[  146.954121][ T6316]  ret_from_fork_asm (kbuild/src/arch/x86/entry/entry_64.S:245)
[  146.958716][ T6316]  </TASK>
[  146.961573][ T6316] Modules linked in: soc_topology_test snd_soc_core snd_compress iio_rescale industrialio hid_uclogic cros_ec_proto drm_kunit_helpers linear_ranges utf8data ext4 crc16 mbcache jbd2 binfmt_misc snd_hda_codec_intelhdmi snd_hda_codec_hdmi intel_rapl_msr btrfs intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_alc269 libblake2b raid6_pq snd_hda_codec_realtek_lib xor kvm_intel snd_hda_scodec_component i915 snd_hda_codec_generic kvm snd_hda_intel sd_mod sg snd_hda_codec snd_hda_core drm_buddy intel_gtt snd_intel_dspcfg irqbypass dell_wmi ttm snd_intel_sdw_acpi rapl dell_smbios snd_hwdep drm_client_lib intel_cstate dell_wmi_descriptor snd_pcm drm_display_helper sparse_keymap ahci rfkill libahci cec pcspkr dcdbas mei_wdt intel_uncore snd_timer i2c_i801 libata mei_me i2c_smbus lpc_ich drm_kms_helper snd mei video soundcore wmi fuse drm [last unloaded: siphash_kunit]
[  147.040993][ T6316] ---[ end trace 0000000000000000 ]---
[  147.046283][ T6316] RIP: 0010:__list_del_entry_valid_or_report (kbuild/src/lib/list_debug.c:56 (discriminator 8))
[  147.053042][ T6316] Code: 00 00 5b b8 01 00 00 00 5d 41 5c c3 cc cc cc cc 4c 89 e7 e8 a6 cc 42 ff 4c 89 e2 48 89 de 48 c7 c7 a0 28 9e 84 e8 74 c6 87 fe <0f> 0b 48 89 ef e8 8a cc 42 ff 48 89 ea 48 89 de 48 c7 c7 00 29 9e
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	5b                   	pop    %rbx
   3:	b8 01 00 00 00       	mov    $0x1,%eax
   8:	5d                   	pop    %rbp
   9:	41 5c                	pop    %r12
   b:	c3                   	ret
   c:	cc                   	int3
   d:	cc                   	int3
   e:	cc                   	int3
   f:	cc                   	int3
  10:	4c 89 e7             	mov    %r12,%rdi
  13:	e8 a6 cc 42 ff       	call   0xffffffffff42ccbe
  18:	4c 89 e2             	mov    %r12,%rdx
  1b:	48 89 de             	mov    %rbx,%rsi
  1e:	48 c7 c7 a0 28 9e 84 	mov    $0xffffffff849e28a0,%rdi
  25:	e8 74 c6 87 fe       	call   0xfffffffffe87c69e
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 89 ef             	mov    %rbp,%rdi
  2f:	e8 8a cc 42 ff       	call   0xffffffffff42ccbe
  34:	48 89 ea             	mov    %rbp,%rdx
  37:	48 89 de             	mov    %rbx,%rsi
  3a:	48                   	rex.W
  3b:	c7                   	.byte 0xc7
  3c:	c7                   	.byte 0xc7
  3d:	00 29                	add    %ch,(%rcx)
  3f:	9e                   	sahf

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 89 ef             	mov    %rbp,%rdi
   5:	e8 8a cc 42 ff       	call   0xffffffffff42cc94
   a:	48 89 ea             	mov    %rbp,%rdx
   d:	48 89 de             	mov    %rbx,%rsi
  10:	48                   	rex.W
  11:	c7                   	.byte 0xc7
  12:	c7                   	.byte 0xc7
  13:	00 29                	add    %ch,(%rcx)
  15:	9e                   	sahf
[  147.072371][ T6316] RSP: 0018:ffffc900027dfa60 EFLAGS: 00010286
[  147.078265][ T6316] RAX: 000000000000004e RBX: ffff88813723ba48 RCX: 0000000000000000
[  147.086051][ T6316] RDX: 000000000000004e RSI: 0000000000000008 RDI: fffff520004fbf3f
[  147.093842][ T6316] RBP: dead000000000122 R08: 0000000000000001 R09: fffff520004fbf08
[  147.101779][ T6316] R10: ffffc900027df847 R11: 0000000000000001 R12: dead000000000100
[  147.109705][ T6316] R13: ffff88813723cad0 R14: 0000000000000008 R15: dffffc0000000000
[  147.117504][ T6316] FS:  0000000000000000(0000) GS:ffff888422776000(0000) knlGS:0000000000000000
[  147.126251][ T6316] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  147.132704][ T6316] CR2: 00007f8a3a9f00ac CR3: 000000041b674001 CR4: 00000000001726f0
[  147.140498][ T6316] DR0: ffffffff87d71888 DR1: ffffffff87d71889 DR2: ffffffff87d7188a
[  147.148293][ T6316] DR3: ffffffff87d7188b DR6: 00000000ffff0ff0 DR7: 0000000000000600
[  147.156088][ T6316] Kernel panic - not syncing: Fatal exception
[  147.162002][ T6316] Kernel Offset: disabled


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

