Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9286921CA03
	for <oe-lkp@lists.linux.dev>; Fri, 29 Aug 2025 02:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756434605; cv=fail; b=i3EFtyqaXXONWZXBhCPnQLLFdaWQ7IkoDfSORBmbBEfWlbp8ALAjLhMSzhmCrya+w3HrzTT3kFo8wwl+fL6LVdnR5XidsR8s2be5LSWSTvh077iMZD8NlWlSRYU4cp//rjDM6jDfjMs9wNNqwAH+IkHhswlhXXHSRnLMV9xn6aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756434605; c=relaxed/simple;
	bh=7OhfhYHQYEuSWSWMnLC8EG+jBpl1a3BDMQ2tCA7aN/0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Cu6a1kONDQFpdFC0MF+azoFZ0tfJqT1K+QuZCjccHZfzrazD2XDq37XUfoqxYHUVrtQ/jUsnWbVyvUzr7YoYiOiPLW48azUk6pdBry9Kua1NmPf42xHtZxi0x25k67f8SNNTvwekc2rFr7U9eIyif8h2qmtSpKf2b9DR4WHbZ3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxQFlU2k; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxQFlU2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756434604; x=1787970604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7OhfhYHQYEuSWSWMnLC8EG+jBpl1a3BDMQ2tCA7aN/0=;
  b=IxQFlU2kekgHRfWziQkR7XYLLbZQKN/OPmHQb3xVEUwbCu6noVMhBeg9
   MexvKJOWluNvwZpANcBa0D1GtA6zPWA2b0b5NnhAHh12HbTpmX5BJm+VV
   5oQ+ojyGzV2GY8/b0pX5VIdGk8aJODkLlm8rjJtNLGJprpsPzqTw7xYBD
   +GSRDgi7Qm1eOYMu7D7aPsXEKSd71UFRJXaUo94IJx/C1WeffPDtkyd8C
   AQZQYW6evp8YoLbVjXEg3EgsTYHcBIe3NjX8kE5vfDVQ6OxyXp1IB7+P5
   vCPLTGikHL5lb5swxfJsQ5Xvoblj7g+H4zcgAL93y5MBx7BWcJUXWQOa9
   w==;
X-CSE-ConnectionGUID: oHFrmu6VSTGqiM5u5adGwA==
X-CSE-MsgGUID: 2x1BnUEWQ3ix474si87Xqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69815453"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="69815453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 19:30:02 -0700
X-CSE-ConnectionGUID: 3HVDzpLiSsC92IgAnO7fXA==
X-CSE-MsgGUID: i4u/8EZrSymJ3LcoS8H5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="193931539"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 19:30:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 19:30:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 19:30:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 19:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoZix5vehMUcw69QwpiP7plFU4VvzvjvO5hUlAAq4n8NiNaOGFVkqSbrLSdgM1uzEq/4lZi7FBCRfeB70x3Q91ZO7DLZKb1WgsmhZJJV+iSrsYL3JOF3E7DeJ2D+kLDNKyX08+RhxDtwwVlxLElDmvVuL5HjgL9whm3L2kyU+GmbAu56KOjjjGjA+AA6iTLirHmHkljBJttIgmVHHbn2mCQJSBIe358gdVwoqpMLyQR4K/oxg318WiTZFy88613Yq3oU1s5Fg7mLbautDwgSYKoZ2hrN0Kd6WJ37mWZbP/7WOzp6zZaS1+n/m825/G94fyJ9RFJF2q+IuAMp1gaD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCkboM3ZVdFzoDrHFSqWj/b7jzIPk/B9MR+9kn+OokQ=;
 b=Lh3ZDremaLbITBXwQecDizuFjsvacM7HSRHAN81eHGc970nJQ6l6RYy34Hk4lJN3+cQp6BR9zkpvnjmLWSaKF70qbJz2nEpkQrzb3qTPaEnK+DktSv9CSwTjvKC/I+5Ex7pmvDagxSDs5JOxCLbjzjSfDmv2H6jV/cj3aa3OfI+ikiLo7wOnUqUWJOEyOlt0VLL2byIzdpsCogBvs5SAuHKEoblDBYrQDRW4s+ugosUNbFvVdiZ9bW65ak2YnDmHBUXknz9wugQF8XqWwolvfwrAlPQ9TKA4sEAecv8irulZ5qey7Ok3Odv+YFF7hfZV+Gn+u7wL/0/ciDjGdTedMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 29 Aug
 2025 02:29:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 02:29:49 +0000
Date: Fri, 29 Aug 2025 10:29:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <oliver.sang@intel.com>
Subject: [rgushchin:bpfoom.2.0] [mm]  94f4694e6a: WARNING:suspicious_RCU_usage
Message-ID: <202508281655.1822675f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL1PR11MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d65191-5530-41ff-820d-08dde6a3ed16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4+ky2QNvW9Ati4cr1g4N/yiSK9LvBfNBmkrcZZtDQpsZVD1g9A6d0ZyhkOq8?=
 =?us-ascii?Q?TyjKbybqL30QV52lgr6cCKKkMgmLvVMOWiLGe/jjV+Agsu/9CLKpzfuPapiy?=
 =?us-ascii?Q?xlc1r0gyUxZ7ITBfey+gIRr21BBC2rZV7qTLF6QkqNdFWlH2qZE8rJBxMBhp?=
 =?us-ascii?Q?37Uwr9nWCAMikbgAIwFKcgBhct71LayrjSapJIBL3jg4lWyvY7f2pO/qnrCu?=
 =?us-ascii?Q?Ak/Xehjgmr8pMqnZLVgqdoLm6zS8anQ8ciWxOCPuqukaxvw0Lqpj8+OFsvgI?=
 =?us-ascii?Q?dw7GQusuJoAIHO+iCGbxsbtokCxsr+g/dep2Aor4REpTMh604IkeXx3EsC7f?=
 =?us-ascii?Q?WAN6d9X6tlYtx8hl1X1awc4JDEcTFUu3mtJ+ReQBQ9y0Uc9Rt+87S6CBn+tq?=
 =?us-ascii?Q?IrQzLJQmrWlJkAM0VHfCYKLbOPyPUPo+6+92eZXsmwBXmoYvxOHaQ1GZx1WS?=
 =?us-ascii?Q?0RSr/PB0fMB74IVbEv7OwBm5GnRoixmNcsnh190PjOlv7MZ8T/QWrtSOin1v?=
 =?us-ascii?Q?zm4K7Qea4nO4jqqCLhK4qbtC53xmyO8hMvHBqRo4Vzv/dIn/8rLOwTe9Ng3P?=
 =?us-ascii?Q?qXdKKcf6SCsZkmR/YYhSqDwL5Se38e6iGPHuoj0CUtvfUdpCjoK0JFE9fXzZ?=
 =?us-ascii?Q?sKDoKrk/zrTB1qAg0EIBTMQJBKPMU7hNp9yDaAWfAfRHaX+OPNv57x+a2bhc?=
 =?us-ascii?Q?KTxcrwsz9cN7b96D4rMaEI8b9w7rCEbP6i5BcKvQPTyWRv+u53RdELuUv2do?=
 =?us-ascii?Q?LpF+FBvUNIRrrDdZoGoFXCCYltmMVzYa6yNBQLUTklophmu7c8oSP0GkibK7?=
 =?us-ascii?Q?IGp6DwgFjvoYB/II/VoUQkTzfbFRTEy38SU+bFYCZ9KVRGjmIn6g8JLV4ahf?=
 =?us-ascii?Q?Mg63j+NfnoXvqzMgLuM9cXiDK45lgBKmnrfJCdGd290PntAekVH0GEenYF5m?=
 =?us-ascii?Q?ik6HpaAn71G0bumStMtdlkAiOE5hmahrUa7Iqx98wrVyNUpgEY2Au8d8inNH?=
 =?us-ascii?Q?Da37B1oEjeEFGlwyZ0ULheZZG44W4orSfPjrw8rBFL7RLnhCH7alF/MWdjlc?=
 =?us-ascii?Q?N6RHjsga0CTpEwm7NAx0N/15puadtGYjt6LxJaBRVifkKMP8N9TScdxUXZlj?=
 =?us-ascii?Q?+MLaIhQZHEaxsWUYiwEBvJ41GelbRWelXmfDkPxz1y76YhMfmYramJLeaYww?=
 =?us-ascii?Q?viQYC/u3E1pvpUhIpR90m6o2OslCxu1KjBlG6KpvexMXFGp9H3h4jC4CUU91?=
 =?us-ascii?Q?TSBWr4HSfmv3ltP33DGk3YvP4F8sSXFkpWxwOr9UjqTzDNF/SINDhs6ZOZkk?=
 =?us-ascii?Q?a07H2OzgFTKu8uFRmzp2ZXttA46XX5WI8IXy9Cyyn51BQyWwi+ui/p9jo1KE?=
 =?us-ascii?Q?JBuUS+hsYaJH70T6ZsxeXrLWZtwa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1FR0lsw7WJfRHDlsMf8642+q1TnB4kM0oZcBv2E0i0kNoJRw2Fzx0lKhHTLN?=
 =?us-ascii?Q?Q4kyJMXQ1njzc2Um+1wYu9Vult7/oSbcNVXyyA2+2VetruChAUd1LzJsye98?=
 =?us-ascii?Q?ekP893beoUeT4TQwBfNJOCYxdU/zWzOsuSe3yuByXqUEAsgdNDLd4yjQZJad?=
 =?us-ascii?Q?ZV+wUe6y6QzPCWXUDE4QqCX4py/D0oRTFRJEknURDb1ynZ38thHJamSEbWCF?=
 =?us-ascii?Q?Cb3/GaaOKvpStoBH5vzHv6jbGZI6vgaGaLQzn4RGkMgZpamw0DOAZWRrzKG0?=
 =?us-ascii?Q?q+/Lajf5dxCqDvkp7P0n5kSSr1mStBpRbv/zen3aNSinl2eXg2i11Nr02vQU?=
 =?us-ascii?Q?Tm9QTcq0U31gcSRDMsD8SQL3S78W1UWQfD7RyN8pbI4f2kbRUugojzuc/SUy?=
 =?us-ascii?Q?fAYxC+qFxJvzrTv/C6nqClIhZNyifXb7a3CGjN+2oHOCtDpdRNa7rmHUnWrp?=
 =?us-ascii?Q?RvVbA3IFXP9SWdhE0CvOngMTsBy/cTVl4DgHIi/cn5H0JTu1Asp6BKg0tOhG?=
 =?us-ascii?Q?/6eNkGoGygpMNS0h99kDVSa7i23fgI8WOSC4PHQ70bEZwdlNYHexFhbfnoNA?=
 =?us-ascii?Q?abyLlCuTFpiEHb5OCWhhfGqmCeeWk2e2iwePRW1MCtGwnCeRJe96O59hexnr?=
 =?us-ascii?Q?DBwjHsJ5N5EHWC54c4cNzeRbZ2qdn7ZtIIn86GAN4QSMGqDW29Kma+4S/3Xk?=
 =?us-ascii?Q?CuT/os/eDm6309xZ3w7wbMJ8f/3q4uPe1ddxBMIG7yT6z6cU/px4BjgredPI?=
 =?us-ascii?Q?iPxumA+Q/5c2xblmk1xnp0UhPfEJobXjCeoJzTgDQzhdwIcpM5OsCvYojZcg?=
 =?us-ascii?Q?p3vE35wU7jA7LKvTf1J1QH4fmZ8hJxrSZ488wHTQF+YdWsJhI+fxUy2IeVUh?=
 =?us-ascii?Q?bTigdbYRHUPsUeLxBGdyL+dA5LH6KTt20ZM7Vgiuo2l6HUEJ/r5ktfptkvaQ?=
 =?us-ascii?Q?vs4H1ct54nPGGcgqRhVsPaCKwA3tkFh22jcfUAfrxtTvE/PuMNU31BvaIQ2a?=
 =?us-ascii?Q?KPr0Cbr0D3nLiE5RkOz6/6jMcXW0OHtTuVp2ad5yUyED/s0PKA4A39wgusJ6?=
 =?us-ascii?Q?ZWWW2gg1YimMWLsy1QCb9plFyhiYw9x1D/zvU6JTciNxWRzNXlGvdQID0uCH?=
 =?us-ascii?Q?yZKtdQzxfuMI178QXf1//y543LhHKVR4HHCH67OIKhLrxav9cizRu4hKQiRn?=
 =?us-ascii?Q?FPcWqu77XgcoyhFiReB2gXqzmkRi3GUhQVoYOaz2Sh2J/7tddcMPA/7mBvup?=
 =?us-ascii?Q?ssXLwkb7t9HiUx3aEg1RZtNDRNY++FIAKY4/9k0T0wCGhuB7tmMf1udIo/nQ?=
 =?us-ascii?Q?oMI4SsX9AVT2aRA018hDdt/ilnCwORxYCaaIKgHpVxcR7ocWT6DmsGaOXz6D?=
 =?us-ascii?Q?2P1zKGNDBn8dT+ufFX9aG29XtUpTsFcJNOMjWsliyDpUuO8TtPdzto4QTp8b?=
 =?us-ascii?Q?BYLKIQjF+BnvcRwVS2Y8YU8ik96X4ZjCLBq1aNbdy/tBVLjcMQv7WeGeqaYU?=
 =?us-ascii?Q?qOJ0jSf5wI3mzZMdhJnt27A0PhmDAUV94VLFJSkecE/jvMjqFhHDvkB1/Dzc?=
 =?us-ascii?Q?qVhvkk9VC7ufJA56iHQEs58R0PdziT6GAoJCFt08Eb/AejuTehZK64BvTalv?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d65191-5530-41ff-820d-08dde6a3ed16
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 02:29:49.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttaNuLu9QakLjV04r+ox4ZC2Tuup2v8WSvM0EuX8sON3OTxiGRWYJhbhbYhB4lhRhsBsni3h0bJvhn8yYbkdBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 94f4694e6ac8c51cbdeb6f8b51944ef03dd62984 ("mm: introduce bpf struct ops for OOM handling")
https://github.com/rgushchin/linux.git bpfoom.2.0

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5



config: x86_64-randconfig-075-20250826
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508281655.1822675f-lkp@intel.com


[  283.625742][T20487] WARNING: suspicious RCU usage
[  283.626675][T20487] 6.17.0-rc1-00277-g94f4694e6ac8 #1 Not tainted
[  283.627705][T20487] -----------------------------
[  283.628856][T20487] mm/bpf_oom.c:32 RCU-list traversed without holding the required lock!!
[  283.630068][T20487]
[  283.630068][T20487] other info that might help us debug this:
[  283.630068][T20487]
[  283.632349][T20487]
[  283.632349][T20487] rcu_scheduler_active = 2, debug_locks = 1
[  283.634185][T20487] 3 locks held by modprobe/20487:
[283.635099][T20487] #0: ffff88813f6d0448 (vm_lock){++++}-{0:0}, at: lock_vma_under_rcu (mm/mmap_lock.c:147) 
[283.636413][T20487] #1: ffffffff873ed0f0 (oom_lock){+.+.}-{4:4}, at: __alloc_pages_may_oom (mm/page_alloc.c:3974) 
[283.638007][T20487] #2: ffffffff8744cc10 (bpf_oom_srcu){.+.+}-{0:0}, at: bpf_handle_oom (include/linux/srcu.h:161 include/linux/srcu.h:253 mm/bpf_oom.c:31) 
[  283.639306][T20487]
[  283.639306][T20487] stack backtrace:
[  283.640657][T20487] CPU: 0 UID: 0 PID: 20487 Comm: modprobe Not tainted 6.17.0-rc1-00277-g94f4694e6ac8 #1 PREEMPT(lazy)
[  283.640663][T20487] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  283.640665][T20487] Call Trace:
[  283.640668][T20487]  <TASK>
[283.640670][T20487] dump_stack_lvl (lib/dump_stack.c:123) 
[283.640677][T20487] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6877) 
[283.640683][T20487] bpf_handle_oom (mm/bpf_oom.c:32) 
[283.640688][T20487] ? bpf_handle_oom (include/linux/srcu.h:161 include/linux/srcu.h:253 mm/bpf_oom.c:31) 
[283.640697][T20487] out_of_memory (mm/oom_kill.c:1179) 
[283.640704][T20487] __alloc_pages_may_oom (mm/page_alloc.c:4025) 
[283.640713][T20487] __alloc_pages_slowpath (mm/page_alloc.c:4836) 
[283.640725][T20487] __alloc_frozen_pages_noprof (mm/page_alloc.c:5161) 
[283.640733][T20487] __folio_alloc_noprof (mm/page_alloc.c:5182 mm/page_alloc.c:5192) 
[283.640736][T20487] folio_prealloc (mm/memory.c:1065) 
[283.640741][T20487] handle_mm_fault (mm/memory.c:5598) 
[283.640747][T20487] ? handle_mm_fault (mm/memory.c:?) 
[283.640762][T20487] do_user_addr_fault (arch/x86/mm/fault.c:?) 
[283.640775][T20487] exc_page_fault (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 arch/x86/mm/fault.c:1484 arch/x86/mm/fault.c:1532) 
[283.640796][T20487] asm_exc_page_fault (arch/x86/include/asm/idtentry.h:623) 
[  283.640799][T20487] RIP: 0023:0xf7f4ee16
[ 283.640803][T20487] Code: 5b 89 c8 5e 5f 5d c3 8d b4 26 00 00 00 00 8d b6 00 00 00 00 55 89 e5 57 e8 be bf 01 00 81 c7 f7 91 02 00 56 53 83 ec 3c 0f 31 <89> 87 80 f7 ff ff 8b 87 3c ff ff ff 89 97 84 f7 ff ff 8d 97 3c ff
All code
========
   0:	5b                   	pop    %rbx
   1:	89 c8                	mov    %ecx,%eax
   3:	5e                   	pop    %rsi
   4:	5f                   	pop    %rdi
   5:	5d                   	pop    %rbp
   6:	c3                   	ret
   7:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   e:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  14:	55                   	push   %rbp
  15:	89 e5                	mov    %esp,%ebp
  17:	57                   	push   %rdi
  18:	e8 be bf 01 00       	call   0x1bfdb
  1d:	81 c7 f7 91 02 00    	add    $0x291f7,%edi
  23:	56                   	push   %rsi
  24:	53                   	push   %rbx
  25:	83 ec 3c             	sub    $0x3c,%esp
  28:	0f 31                	rdtsc
  2a:*	89 87 80 f7 ff ff    	mov    %eax,-0x880(%rdi)		<-- trapping instruction
  30:	8b 87 3c ff ff ff    	mov    -0xc4(%rdi),%eax
  36:	89 97 84 f7 ff ff    	mov    %edx,-0x87c(%rdi)
  3c:	8d                   	.byte 0x8d
  3d:	97                   	xchg   %eax,%edi
  3e:	3c ff                	cmp    $0xff,%al

Code starting with the faulting instruction
===========================================
   0:	89 87 80 f7 ff ff    	mov    %eax,-0x880(%rdi)
   6:	8b 87 3c ff ff ff    	mov    -0xc4(%rdi),%eax
   c:	89 97 84 f7 ff ff    	mov    %edx,-0x87c(%rdi)
  12:	8d                   	.byte 0x8d
  13:	97                   	xchg   %eax,%edi
  14:	3c ff                	cmp    $0xff,%al
[  283.640806][T20487] RSP: 002b:00000000fff1b990 EFLAGS: 00010286
[  283.640809][T20487] RAX: 00000000127e2506 RBX: 0000000000000000 RCX: 0000000000000000
[  283.640811][T20487] RDX: 00000000000000cd RSI: 0000000000000000 RDI: 00000000f7f78000
[  283.640812][T20487] RBP: 00000000fff1b9d8 R08: 0000000000000000 R09: 0000000000000000
[  283.640813][T20487] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  283.640814][T20487] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  283.640826][T20487]  </TASK>
[  283.713022][T20487] modprobe invoked oom-killer: gfp_mask=0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=0, oom_score_adj=0
[  283.713022][T20487] oom_policy=default
[  283.716287][T20487] CPU: 0 UID: 0 PID: 20487 Comm: modprobe Not tainted 6.17.0-rc1-00277-g94f4694e6ac8 #1 PREEMPT(lazy)
[  283.716296][T20487] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  283.716300][T20487] Call Trace:
[  283.716305][T20487]  <TASK>
[283.716310][T20487] dump_stack_lvl (lib/dump_stack.c:123) 
[283.716321][T20487] dump_header (mm/oom_kill.c:75 mm/oom_kill.c:479) 
[283.716333][T20487] oom_kill_process (mm/oom_kill.c:460) 
[283.716344][T20487] out_of_memory (mm/oom_kill.c:1198) 
[283.716355][T20487] __alloc_pages_may_oom (mm/page_alloc.c:4025) 
[283.716370][T20487] __alloc_pages_slowpath (mm/page_alloc.c:4836) 
[283.716389][T20487] __alloc_frozen_pages_noprof (mm/page_alloc.c:5161) 
[283.716401][T20487] __folio_alloc_noprof (mm/page_alloc.c:5182 mm/page_alloc.c:5192) 
[283.716407][T20487] folio_prealloc (mm/memory.c:1065) 
[283.716415][T20487] handle_mm_fault (mm/memory.c:5598) 
[283.716425][T20487] ? handle_mm_fault (mm/memory.c:?) 
[283.716457][T20487] do_user_addr_fault (arch/x86/mm/fault.c:?) 
[283.716479][T20487] exc_page_fault (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 arch/x86/mm/fault.c:1484 arch/x86/mm/fault.c:1532) 
[283.716488][T20487] asm_exc_page_fault (arch/x86/include/asm/idtentry.h:623) 
[  283.716494][T20487] RIP: 0023:0xf7f4ee16
[ 283.716499][T20487] Code: 5b 89 c8 5e 5f 5d c3 8d b4 26 00 00 00 00 8d b6 00 00 00 00 55 89 e5 57 e8 be bf 01 00 81 c7 f7 91 02 00 56 53 83 ec 3c 0f 31 <89> 87 80 f7 ff ff 8b 87 3c ff ff ff 89 97 84 f7 ff ff 8d 97 3c ff
All code
========
   0:	5b                   	pop    %rbx
   1:	89 c8                	mov    %ecx,%eax
   3:	5e                   	pop    %rsi
   4:	5f                   	pop    %rdi
   5:	5d                   	pop    %rbp
   6:	c3                   	ret
   7:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   e:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  14:	55                   	push   %rbp
  15:	89 e5                	mov    %esp,%ebp
  17:	57                   	push   %rdi
  18:	e8 be bf 01 00       	call   0x1bfdb
  1d:	81 c7 f7 91 02 00    	add    $0x291f7,%edi
  23:	56                   	push   %rsi
  24:	53                   	push   %rbx
  25:	83 ec 3c             	sub    $0x3c,%esp
  28:	0f 31                	rdtsc
  2a:*	89 87 80 f7 ff ff    	mov    %eax,-0x880(%rdi)		<-- trapping instruction
  30:	8b 87 3c ff ff ff    	mov    -0xc4(%rdi),%eax
  36:	89 97 84 f7 ff ff    	mov    %edx,-0x87c(%rdi)
  3c:	8d                   	.byte 0x8d
  3d:	97                   	xchg   %eax,%edi
  3e:	3c ff                	cmp    $0xff,%al

Code starting with the faulting instruction
===========================================
   0:	89 87 80 f7 ff ff    	mov    %eax,-0x880(%rdi)
   6:	8b 87 3c ff ff ff    	mov    -0xc4(%rdi),%eax
   c:	89 97 84 f7 ff ff    	mov    %edx,-0x87c(%rdi)
  12:	8d                   	.byte 0x8d
  13:	97                   	xchg   %eax,%edi
  14:	3c ff                	cmp    $0xff,%al


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250828/202508281655.1822675f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

