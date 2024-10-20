Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF32194AD5
	for <oe-lkp@lists.linux.dev>; Sun, 20 Oct 2024 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729431834; cv=fail; b=sgp9vk45lYkzY15XadlgkKS98w1NfA2fPLqB8C6sgBgqu3+7ssbPTexQ7TVpeliRc+ARlc/zWkXGbf75o4hQOrcAGUtsX70Dhl4yqyicr5maQQXxAKv/+UBNd9B0tKsHK5+U023WJlWe71ncpn0L4GAR8crA27HfsnWMy3rxMEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729431834; c=relaxed/simple;
	bh=eu+G6YLTiDEY4Cq44SQd++lOzITkCFFdkDmdjiZy1bA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GpXEU6W04727v+xjnmyqUCZGFt7Mstp0+VG+0mX+m0XFdqCqD51Rdge7YxL1wd0b/XQv7OQEQa2CiKcfduy8WyULSR0Ye271MQ0uUQf6eqh+mtC9RQ6nq2rU6hKqSbFNn80TzGrCzN34n9VlGIF4bSdzPGqXI+0tWrxUuggV7No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqdO9kCx; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqdO9kCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729431832; x=1760967832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eu+G6YLTiDEY4Cq44SQd++lOzITkCFFdkDmdjiZy1bA=;
  b=cqdO9kCx19X9OXVyu5WP4GJixWNmlcW9kL8/Dm4ew9ZxT/h/rpod8TW3
   YXHFEj6TNZWY3l2bo1jdR1ZdT6o2m6TJYOjDmII4E+Dz+SpW89dJIRE9h
   5+VlZZQ9rRlMCcsngyjxtYYl7cIFunlsWqE0sKUTKnnwTYvPZFTCvnMdL
   J2ePHVtKCTBJP/uLdIkhrRlKNXG1Te6CFOw684qNtJvonnMNd8zvKU2Rh
   tcgT+hd7Pgm0tQWoniVOISOou9Wsq3MuZCgjdSr0jAiEdWy8of5n8L5oe
   4aNRgaDv0lTJRGkAjJAsy0Ud4H34ImEP985v8Cp9RfFA/1q3E7mXLDjX5
   w==;
X-CSE-ConnectionGUID: FxoNPPDkT02sEwzteiMHAw==
X-CSE-MsgGUID: LIKveAW9TbKG07z1l5vrQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="46415669"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="46415669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 06:43:52 -0700
X-CSE-ConnectionGUID: Kr9teJ5lSBK/crhJGcNfBQ==
X-CSE-MsgGUID: IQSuhGjKTw6eS1vLeup4Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110040442"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2024 06:43:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 06:43:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 06:43:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 06:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k53VuX/oKGtvEkLevRYeiP4u4XMlhfR1bkN4SAh98/GTVoN1jgH01b2Uo5uH5JrfCsSyjbyKpvvhiJ1NxTF2TrLTkMalRR8bqemci4oTQ0xpuICvCXCjlcQ1DumVGheWz/6DpIDkFA9fnfjcePMF3Hz9OxRByVUA61GOmXQwgpOlh9+ntcCM1L//zTBxwAAb9rTrb1bIcuIDiHyWF474yugAQY5HNbOK6Twe6H0ES4CfWljIK7gMwDU+ik20Fu03GbCen+AteQbU2sdzly55N4JxckV2FegoCw7clgGcAQ5oWFclcETB++lMH3ZBW7yjpmGiKosy15ta5FAVZ8unEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSBbhFWLOWCJ4wAdmEqGvFyOstIVogIrYVzMtL3k5RE=;
 b=WQAFhnqZYr88tbuuZKZ/vxdrXf8HdIBvHHGOOJK05Uric29blUs/VFntJbMhkvm5xkCDvFl7FEWdYajQzBFQQhLXyDjEQGeVmbXFuDmCFxAIjnLKZPbOj5B82imZk/7+8gvMyxENzVhljxeQJt8fXM8CI1V8V2qBcCw692+b6+o5/6R182K1qciuSLcAfqqz1KQMNkdwpBdyy68PbXk0kjt7UwJhA3+6HnnARZLYF2frIZ3ZsaNbyzVP0tkAWdDY9cUTBQecSPLn/DBr1APuiyxTWVmCwmhvBObyrFTq+qr+ZTkQf1ksXyIoVArGV0dSEEBYxy/+CPBbZITQIe5c/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW6PR11MB8340.namprd11.prod.outlook.com (2603:10b6:303:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sun, 20 Oct
 2024 13:43:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 13:43:45 +0000
Date: Sun, 20 Oct 2024 21:43:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:rdma-next] [blk]  236cc3d387:
 WARNING:at_block/blk-merge.c:#blk_map_iter_next
Message-ID: <202410202120.3314a034-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0221.apcprd06.prod.outlook.com
 (2603:1096:4:68::29) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW6PR11MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 2024bf1e-9ca7-46fb-d782-08dcf10d37f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Yro6sQXz23P65BjD3HaZ7mP3MBW1AfC9/Rv2ZQ3hSEZYaOubr40iwIhWjlA?=
 =?us-ascii?Q?SQR8um4V7EKZC7aHYIQiGmZOyBS3iK0qSOghJAhPQlqIUbVczpKOO4ZvUlyM?=
 =?us-ascii?Q?y+0BHxnN3mlWbBYyuwKEcIsZpKL3tsyVkR+eQkwNa3II1NOvGBHnbxEN9B/4?=
 =?us-ascii?Q?imzcyRePywRDbocfoU+9aVwIb12kxppR78AyiC3c04UAS31JzyK0UVdb4t+r?=
 =?us-ascii?Q?0h0anR5bv/0ZwG7v2c1JfpiE6GkVK7te3JbRxOohQDaSaJTleRlYi6H/SbQt?=
 =?us-ascii?Q?oVEayCNQUiL/dCIFypNRoHKoMrbXSbt3bmkSXRz0Df2FXiESFNwgTV48ipXc?=
 =?us-ascii?Q?NQVxQ1Zi/5NBumipZmv5FHJN73FzLmRZ3VxYq8U7c4iR/IlmXiz9EzVa58ap?=
 =?us-ascii?Q?YtMyRnHwUmCRo7b1oNBuCenwnQi052dYLEfqOLeuYN8wrP0+fewOQ64jshN/?=
 =?us-ascii?Q?TQfGBZ6ksG9XZFbLwJMWTTM2u/lnHiYfnyLwzCfJXRNT2wRK0nAnj051AC9V?=
 =?us-ascii?Q?bDJHS7mcWLi3s4bh5wnB5saKqASsdzRWH68KgEFoy5jkpYdKLG3iXxESxJeq?=
 =?us-ascii?Q?rehkfhRKZ/Tlrx1F4GiQrdqO1MEpXRux8sJ7R3CAeLiHI+6Gl1qGlkg6PVia?=
 =?us-ascii?Q?gzeELVt2EgT7C68F37XCq4mxt5Kv5yfM7kwYZM7LyUwsPstxZdFGehDmXPQt?=
 =?us-ascii?Q?YHm6DKmBplHanwG7bFMqmYchnfX9EoptncuLEoD6WxuIKUcV2wo1rAiWeRit?=
 =?us-ascii?Q?+4EGkPaIj5q8uWOS7m6e7IsyPIu+GCcyR8Turf4rrBoiy4IpLYn+8slYT2hU?=
 =?us-ascii?Q?8g6hoH5sjK2/sxT+E+v9bFtTMdMmSUFiFHCTyhw8CYyJKgBZ6n2XapFkm7dB?=
 =?us-ascii?Q?ljeGZbrh198HvZJfns5is08Yo0awdXHAJnumv5vwSaSG/bKnU4870XL8XLqs?=
 =?us-ascii?Q?5M3VtDlqtr2BLrQ9wAMUM7SUkdeqMd91sBHQivkCgUnBtZxhJK3zRxNAn0fN?=
 =?us-ascii?Q?olEm1gQcKUxI96L6kZUfvbOp+fuxIHL6lPzCzeXXmQ0fqIVr6HKOy+IuViKc?=
 =?us-ascii?Q?mxaDkWx77MPfIVk6v499MAawKEk+SF1ot5O5jkaLVXO8iveoMePyBHHsg6eg?=
 =?us-ascii?Q?0hehn1mmWXG5wkMuArhNi5827d1Bv//g2rpufAgqUyOKXSe9zRWbTUEVzhqR?=
 =?us-ascii?Q?CECdp5nOZwOr/dIvqiMwnvVvzb3UuGQ8dG+1bcHziv/e7onj4ycQQMT6SArY?=
 =?us-ascii?Q?8gvo7r7/7MaHbBFNzdLYdSG3OpR1U0EUcf8W62Lqlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ZS4rHv/IIH9iIVm0QWG++O4GzwoClqSEWeX8FKMTIuOJqoEvkyTipXAlBYl?=
 =?us-ascii?Q?wPC/Vf6jZwOzpELV/JM3fJcAl8nGJYt3JVAG/21xPYuHqX9P5pgcL2a5c4vS?=
 =?us-ascii?Q?xGDPf8ybQ/h3V5vJG0W/3saX8kU1dsA/JrWJveiSdgJLCzj/pYhJAcLjho0K?=
 =?us-ascii?Q?hGuOQ3BKFtpdbwPnfdjJEw4d5xB20hsRMZOZr0+dSLMP7jntg3s1PhEs6m+7?=
 =?us-ascii?Q?cNyN10aEChEe8ms5RZpvbwf2oPWOVe9mG8WKLRR3Iwtk+KWmNuzXsMDVndB/?=
 =?us-ascii?Q?F/Pz5BT/jUeNnuwN+zwenS18C2geRqPgtiKrxgJddzJJkYgfOUbt+g66Srmk?=
 =?us-ascii?Q?X3S5vc4bDHDOWb1QgK3UotyeBAuLJMgBA1F9npkQeg77LGsC0kkI4ieHbKgh?=
 =?us-ascii?Q?Z7iZKxkAGrypGxsNcQ2q5CcHUDRvMdMAMJjM9UYZqbPNeyKyzUFUYGl0JLPm?=
 =?us-ascii?Q?O8BqUptNBNK+s07SizLEjyb0qyQ7mTsjLe1P9N7C6RTFozOnYZhNTNklVmZ9?=
 =?us-ascii?Q?jk/1OUmx5MvU1Di52nKMZxvr47BGQBep83WHM+o+PSSCHI+3h7eW+Wmvfd+x?=
 =?us-ascii?Q?yiPB/KpSbbsi9cpze7bkZHMgFcHWiOGP6ScpIAdnNo8mTgTjoLoTLw04Q+5m?=
 =?us-ascii?Q?CdtNSEnniwNWbnXqAbiSQxQCkjGA6XHIHX5L0sVHzmbv3S8OrNUomV8o3f+J?=
 =?us-ascii?Q?0odD/S8eleaP8l9Me2xjWGZJGde9051QTQHyY6QaUj9KfnZGbUkbUXdmy2aO?=
 =?us-ascii?Q?3lGZFK1vKL2jB7mXPL84h03+hL41QizeWBeSyA3beWTENVOG1pkgQkUNAghc?=
 =?us-ascii?Q?P+ldHSjLJIcTLDO4zmDDFJX11M8xPjVifJOFqfN/JOz5QfhRbHjSfNIv/ohK?=
 =?us-ascii?Q?ypggolvjQOS/vVsOGVBs2NVd5jrcMnNyoXl8sBCaWJYgVSomRrkGeP2iR9Zb?=
 =?us-ascii?Q?znmkzJgEXPV2+pyu6DApig/aaCe/HA229T++SWQGZg0M1s9Rfj/2NeaA6Arn?=
 =?us-ascii?Q?jwpiThjLyeHIuejFV8gqNDaeiKIvNSbhxm0zaJaE78lYa8bAbNhJAhtXhHF9?=
 =?us-ascii?Q?x54tiPhcMGnEQfzyo8luERRBzXTaEaQ4r3p7WqsN0DJUwIVFhSsWY2x2YASM?=
 =?us-ascii?Q?GB4xHgZcXJeh5AmxC5Hjrxbb0PCILhWZ7G7/tSdoAXufdH/KDjAc8inuQMf3?=
 =?us-ascii?Q?oPV1UNggI5RXg0K3Pyhu4w/2/FfWyDcFCpN9tvpYYEX2WkVl2OilW5f0IV29?=
 =?us-ascii?Q?ZrRRahEHLvUzzIUDvzEF2kon54aWBH0GdgvCUvP8JxuXxBxwtnAYBJQaE47q?=
 =?us-ascii?Q?F5pFbTHyDWKd9NAgVAbN+u8IW9A9ah8cmGlxjCOUgtMWveCjXzKtd5VXOLPN?=
 =?us-ascii?Q?gqGsHCL0qL5peQrHkN0f1mHtvp3juJ8B22AgVoXOVg1/22f1jHp3mwIxk74x?=
 =?us-ascii?Q?DYmCShE4PyZVl1a530JVFBkNvGt7fTkcjG9HY0m2ckqW2XaRmJSmt0o2pGwM?=
 =?us-ascii?Q?J04Wok/R3T20MkGyxvZPo87LptxR32H3alI2VVNfBolZnnNoevhvvSklV5jy?=
 =?us-ascii?Q?72WHE8bTNDAfgC6FKzybqJfu6fDGRUoU920eIckm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2024bf1e-9ca7-46fb-d782-08dcf10d37f8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 13:43:45.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4alH9NKkT7CDTi6lvrptoGcPHDj20oVPd41pEbzBI42GYxJ4HIzUD7nSSu/6/v1NWs1VZW1iYIBw7p3RALlePQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8340
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_block/blk-merge.c:#blk_map_iter_next" on:

commit: 236cc3d387f299ace2fd7298439a1bd5c976bcdd ("blk-mq: add a dma mapping iterator")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git rdma-next

in testcase: xfstests
version: xfstests-x86_64-f71228e3-1_20240930
with following parameters:

	disk: 4HDD
	fs: xfs
	test: xfs-246



config: x86_64-rhel-8.3-func
compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410202120.3314a034-oliver.sang@intel.com


[ 21.772085][ T201] WARNING: CPU: 2 PID: 201 at block/blk-merge.c:490 blk_map_iter_next (block/blk-merge.c:490 (discriminator 1)) 
1;39me2scrub_all[   21.855201][  T201] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[ 21.873219][ T201] Code: 24 50 48 8b 4c 24 58 e9 5b f5 ff ff 4c 89 54 24 50 48 89 4c 24 58 e8 6c 0f 7d ff 4c 8b 54 24 50 48 8b 4c 24 58 e9 14 f5 ff ff <0f> 0b e9 17 f9 ff ff 48 c7 c7 08 94 ae 84 4c 89 14 24 48 89 4c 24
All code
========
   0:	24 50                	and    $0x50,%al
   2:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   7:	e9 5b f5 ff ff       	jmpq   0xfffffffffffff567
   c:	4c 89 54 24 50       	mov    %r10,0x50(%rsp)
  11:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  16:	e8 6c 0f 7d ff       	callq  0xffffffffff7d0f87
  1b:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
  20:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
  25:	e9 14 f5 ff ff       	jmpq   0xfffffffffffff53e
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	e9 17 f9 ff ff       	jmpq   0xfffffffffffff948
  31:	48 c7 c7 08 94 ae 84 	mov    $0xffffffff84ae9408,%rdi
  38:	4c 89 14 24          	mov    %r10,(%rsp)
  3c:	48                   	rex.W
  3d:	89                   	.byte 0x89
  3e:	4c                   	rex.WR
  3f:	24                   	.byte 0x24

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e9 17 f9 ff ff       	jmpq   0xfffffffffffff91e
   7:	48 c7 c7 08 94 ae 84 	mov    $0xffffffff84ae9408,%rdi
   e:	4c 89 14 24          	mov    %r10,(%rsp)
  12:	48                   	rex.W
  13:	89                   	.byte 0x89
  14:	4c                   	rex.WR
  15:	24                   	.byte 0x24
a Check for All [   21.892706][  T201] RSP: 0018:ffffc900009fee50 EFLAGS: 00010287
[   21.900056][  T201] RAX: 000000000001c000 RBX: ffffc900009fefc0 RCX: ffff888135229b00
[   21.909206][  T201] RDX: ffffc900009fefcc RSI: 0000000000010000 RDI: 00000000ffffffff
[   21.917113][  T201] RBP: ffffc900009fef38 R08: ffffc900009fefd0 R09: 0000000000000000
[   21.917115][  T201] R10: ffffc900009fefa0 R11: 0000000000000000 R12: 00000000c9efffff
1;39mfstrim.time[   21.917120][  T201] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
unused blocks on[   21.917138][  T201] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   21.917140][  T201] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   21.917141][  T201] Call Trace:
[   21.917142][  T201]  <TASK>
[ 21.917143][ T201] ? __warn (kernel/panic.c:749) 
[ 21.997673][ T201] ? blk_map_iter_next (block/blk-merge.c:490 (discriminator 1)) 
[ 21.997677][ T201] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 21.997709][ T201] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 22.023651][ T201] ? blk_map_iter_next (block/blk-merge.c:490 (discriminator 1)) 
[ 22.028712][ T201] ? __kasan_slab_alloc (mm/kasan/common.c:319 mm/kasan/common.c:345) 
[ 22.033603][ T201] ? kmem_cache_alloc_noprof (mm/slub.c:4085 mm/slub.c:4134 mm/slub.c:4141) 
[ 22.039036][ T201] ? __pfx_blk_map_iter_next (block/blk-merge.c:467) 
[ 22.044393][ T201] ? mempool_alloc_noprof (mm/mempool.c:402) 
1;39mlogrotate.t[ 22.049655][ T201] ? is_bpf_text_address (kernel/bpf/core.c:768) 
rotation of log[ 22.062150][ T201] ? __pfx___blk_rq_map_sg (block/blk-merge.c:544) 
[ 22.068825][ T201] ? sg_init_table (include/linux/scatterlist.h:416 lib/scatterlist.c:130) 
[ 22.074069][ T201] scsi_alloc_sgtables (include/linux/blk-mq.h:1069 drivers/scsi/scsi_lib.c:1142) 
[ 22.079191][ T201] ? __pfx_scsi_alloc_sgtables (drivers/scsi/scsi_lib.c:1110) 
[ 22.079202][ T201] scsi_queue_rq (drivers/scsi/scsi_lib.c:1826) 
[ 22.079220][ T201] blk_mq_dispatch_rq_list (block/blk-mq.c:2031) 
1;39msystemd-tmp[ 22.079228][ T201] ? __blk_mq_alloc_driver_tag (block/blk-mq.c:1760) 
up of Temporary [ 22.123779][ T201] ? __pfx___blk_mq_do_dispatch_sched (block/blk-mq-sched.c:88) 
[ 22.131245][ T201] __blk_mq_sched_dispatch_requests (block/blk-mq-sched.c:185 block/blk-mq-sched.c:309) 
[ 22.138718][ T201] ? __pfx___blk_mq_sched_dispatch_requests (block/blk-mq-sched.c:271) 
[ 22.145426][ T201] ? dd_insert_requests (include/linux/list.h:373 block/blk-mq.h:373 block/mq-deadline.c:742) 
[ 22.145430][ T201] blk_mq_sched_dispatch_requests (block/blk-mq-sched.c:331) 
0m] Reached targ[ 22.162731][ T201] blk_mq_dispatch_plug_list (block/blk-mq.c:2751) 
[ 22.183291][ T201] blk_mq_flush_plug_list (block/blk-mq.c:2799 (discriminator 1)) 
[ 22.189793][ T201] __blk_flush_plug (block/blk-core.c:1206) 
[ 22.194508][ T201] ? __pfx___blk_flush_plug (block/blk-core.c:1196) 
[ 22.194511][ T201] blk_finish_plug (block/blk-core.c:1227 block/blk-core.c:1223) 
0m] Listening on[ 22.209908][ T201] ? __pfx_workingset_update_node (mm/workingset.c:627) 
s System Message[ 22.229978][ T201] force_page_cache_ra (mm/readahead.c:344) 
[ 22.236399][ T201] filemap_get_pages (mm/filemap.c:2549) 
[ 22.242504][ T201] ? __pfx_filemap_get_pages (mm/filemap.c:2525) 
[ 22.247879][ T201] ? __pfx___might_resched (kernel/sched/core.c:8586) 
[ 22.247882][ T201] ? copy_page_to_iter (lib/iov_iter.c:364 lib/iov_iter.c:349) 
[ 22.263724][ T201] ? __pfx_filemap_read (mm/filemap.c:2612) 
[ 22.268623][ T201] ? do_anonymous_page (mm/memory.c:4842) 
0m] Reached targ[ 22.273734][ T201] blkdev_read_iter (block/fops.c:768) 
[ 22.279830][ T201] vfs_read (fs/read_write.c:488 fs/read_write.c:569) 

[ 22.303062][ T201] ? __pfx___seccomp_filter (kernel/seccomp.c:1218) 
[ 22.308374][ T201] ksys_read (fs/read_write.c:712) 
[ 22.312549][ T201] ? __pfx_ksys_read (fs/read_write.c:702) 
[ 22.312553][ T201] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
0m] Reached targ[   22.328838][  T201] RIP: 0033:0x7f22a851219d
[   22.365114][  T201] RAX: ffffffffffffffda RBX: 000055620ed92e80 RCX: 00007f22a851219d
[   22.374400][  T201] RDX: 0000000000040000 RSI: 00007f22a7112038 RDI: 000000000000000f
[   22.382256][  T201] RBP: 0000000000040000 R08: 00000000ffffffff R09: 0000000000000000
[   22.390142][  T201] R10: 0000000000000022 R11: 0000000000000246 R12: 00007f22a7112010
[   22.398028][  T201] R13: 0000000000040000 R14: 000055620ed92ed8 R15: 00007f22a7112028
[   22.405882][  T201]  </TASK>
[   22.408819][  T201] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241020/202410202120.3314a034-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

