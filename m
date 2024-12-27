Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F91876
	for <oe-lkp@lists.linux.dev>; Fri, 27 Dec 2024 05:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735276566; cv=fail; b=ssFkmW4nh5dG/ICmG0Y4/IJ8Boz+XEPnVovu/W1CorNCOZlX6d3/6WjV2zDTUEoy3c7M6gTv0qpRnXapPR+Q6IfWsiXS2/k7/fgwduuQ3M613wkR2/axgThXZXn+wM+ewhlG7urhDKY401uOpbEG0Ih4j6839goA3oIrHAhDl/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735276566; c=relaxed/simple;
	bh=RDeq7nybICK4axNZtLgiAXhOjSjFk8q/5r3C9xBU+EM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=N2KofEnqptL3FibQ9HoW/KC2SfI+Tqpa64JVpYO0fXtdlAyEC/lD+5Smf8QRxOn7NYc1Njn2HB0ui/wu1dd9ItWPKjuBqDA4zqpZCUdSybUZ07CVUq/ySJql+dAHKwRTUyiF82Rj6UeSWDMDShGR9ZtuRqu76lLVfbVOrNc54JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8nBpFuh; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8nBpFuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735276565; x=1766812565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RDeq7nybICK4axNZtLgiAXhOjSjFk8q/5r3C9xBU+EM=;
  b=P8nBpFuhtI7hVq5esGHR6Tr3Z2fejNkpUSW9HJc3rF9Ovm0CsVQKPK1v
   IB6GIP9gfKJsxOOkg3Wfk+jlSGgd3MIbx/hqhsafYUSM8Z8swizuM4UNd
   k1iN9mbrcZ2RqIWQAURACLUaf/4ujBhj3tj4kO0z/UTHt/hIfIyAPa1t1
   HURpAAcM/VLXHsDr1/Iy2BI6TMR0qbVI1VU3tX1orGqHhLQWAxHIEcZFY
   U4bzhy/4vuwj3uxJd2EYBWDWeM96GbkUZWUoHbnkl2pdQolpXL16Fz7EY
   /o2hqBBGsMjXAJ/tiNk+Xcq5mLsQ2qNO584vJUuSg7O6JzsfDKGobf2j7
   Q==;
X-CSE-ConnectionGUID: M/5LzmEDRH2X6Y93PjwzWw==
X-CSE-MsgGUID: bkiyfKvgS8qVncJOt5fv+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="58145833"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="58145833"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 21:15:57 -0800
X-CSE-ConnectionGUID: rzw/8tx3R7+KuT3HAA38Fw==
X-CSE-MsgGUID: r4+aBvidTkiIA5MGQkyXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104704782"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Dec 2024 21:15:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 26 Dec 2024 21:15:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 26 Dec 2024 21:15:54 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 26 Dec 2024 21:15:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+JqB3C2gOOkqH4oJaVYChTRO75Nwdf8p9+rN85+OCTl6lsWeTuJaZPiOgjKEkSWT7YSM5MmatsZHIFWu0tCmDvdKUFL8Culsy0ArZBbo6U/q8evBaG8ydANwBDAoy4VoCb1f0263uQl1Nl7rALU2BB8w5Mqkxt/av2bu5p4rJXOGcepVFE+BpS+ZYnR/BpQtGeyhMB7Z4sSwgJGd50wJj04tqRjuqmq9mTz1LC52PXNf/oweK0XTyC4cGm64w+MxO0PVBjirNjgb3mqNwKAcTu2MejioT620JQzQV2AWjXnvvK6oe7cc30GNdx6GBS6/s18UQxEDBzbE9dUQwG9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qcFbZ7RoUwwiaV4guShotVtZ8iZMecWLW6PolJz/N0=;
 b=gBgtzjuzUX8gHpGFYh/TLO3xuDZYeYvzEIPCxtjue11bIgY+02nXEX99zF4OI7vT5dcNi6JaXlnEHm6R2c2OH7Ar9tB84N5XlbjNj9g8pqAszoEYz8F6EYfcnjUPq7zBGio4MYy1rG5MV+cYxRcnCb440MApRx7w8I/fG+OlcjP6WihdFk0MHIiMN7xVppJkNnMJcAPnEJNq0X4LWvhYXIBUBQJhrgzXZCf5X6n7RGTXIU7bCTC1xxZp4BBHfejhB9yYUl0kbXSyFH3AMNLoWMcrqt+7H1Hb9/minE4VstU+BSvgndUoWY0YxsWe1dHIcEIbCqmd61ITZBAE6+BXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Fri, 27 Dec
 2024 05:15:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 05:15:43 +0000
Date: Fri, 27 Dec 2024 13:15:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, <oliver.sang@intel.com>
Subject: [linus:master] [x86/vdso]  e93d2521b2:
 kernel-selftests.mm.run_vmtests.sh.virtual_address_range.fail
Message-ID: <202412271148.2656e485-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: dd24f7a0-3943-42a1-1846-08dd26358258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?voEyOI9a9PkYqI+zoIY9JFfu7MX8Nr+6BU1aEybMNATzGQVm4jxK1sWdfn1d?=
 =?us-ascii?Q?6V2H6crudVSgoRBDOxw/EC72Knyow1sbhpLEK/u4VQBZ7YL7vAkP4c3a2JdJ?=
 =?us-ascii?Q?pWKuB3zPENcA3hLLr53WhpIcU2CTxwytzNrpjeuwj/5pvAuj+LX/uEUj2KWA?=
 =?us-ascii?Q?VrPeP1q0+Dh7Xtxcwbph2ArOMjSWaUMDXZSAQBWs2aI1EAll1D8etEmcJ2u+?=
 =?us-ascii?Q?kRGrieDm47+d6EnMJvWJ9ru65B8IAQkB/ZE5qKfxjyeUq980bZyt0Id7b2En?=
 =?us-ascii?Q?gtuzL4RlMEzL7XfrOJW9JxxDnmoPs2lwObPBrcLdmFq/hUtNtJI0iRXfiKLw?=
 =?us-ascii?Q?hjDcY+OEUBAbEv2/Iy23DiKq+yYWZaiSIYzouFqCX1JgqP/O7ZsgCzH1w+ZI?=
 =?us-ascii?Q?LdtRXbaLhTcylRuLAEuiiPggXLSFG+qmD1AIdttGdxGQ+hbhB1ZQEnPlSH+g?=
 =?us-ascii?Q?s0Qdpz/BNn5tPVKFRBxfgw0ZDiLYgvGt20DmFO3fB0SQ03OUgdTT/B7RnRWB?=
 =?us-ascii?Q?ICRCkHnbCJyaN/EGoHwPMfGBXfRqi3dTuwMLxM3sTDfbAJgvWemf9DY/swPT?=
 =?us-ascii?Q?ppekKcwTj//WBJZFzrlxiUB5iqGxIjNRBnr4NAMfVkOICq9Vtum7aArYFJjU?=
 =?us-ascii?Q?oQLk/j4Yid2UaAD+eHNK8ggFRHhisKYGMfYCtmEz9xbA4BOZJwWdAFQ6Y/gD?=
 =?us-ascii?Q?eLlo9stJngilz6Ofl1Yf+84yE/Ab+gDYUDWyPHkDK7CQ0pVp5GIO6SxSW6v6?=
 =?us-ascii?Q?kxfPnPcnL1VAY/r8w8S5rmfCgWIqF0choktOEWtFQj9h6k5QjscYMsgxeqwi?=
 =?us-ascii?Q?A7YNmPZRI3zbAh6H4kQxv6otcNC1PeRBn+/PA012mcdGtmmH8L1h69+hbJh3?=
 =?us-ascii?Q?9bBP+sc1BU1zLwOTaziChlFOvKwvf/IwtOR/awCbxTW9t6hmaTTkTGaZfn1A?=
 =?us-ascii?Q?ARmMBreOSTi8AJVm4CsCYprqav7KeHj+m3gSoSGE7oaM5M23VyNYl36RtX0n?=
 =?us-ascii?Q?idWs9Q4vPAgMLHdC7Szc2sScNdBd49tLrNCbgUEDoQC7/RQ9wjDQIy0VlxmW?=
 =?us-ascii?Q?nL1vqQA0mVSlgfO0RphNkYObN6aph8a0g8XsHcbsTF4fgMokYqsjWGpf+Rmd?=
 =?us-ascii?Q?UP5ctcwyOMlDP8CTO1lP98iD1TA29eqOLDxmOuJs2lCFqENp6iLR6fpw9InG?=
 =?us-ascii?Q?TzWSbcHLauFqXfsR8wtP5Q7HnOh2hjMcxcAPlTXHXoZiTfyZOL0i/E+CXA8U?=
 =?us-ascii?Q?ExqhWzfIYQrLdep0Dd9/xgU3sZWbqJ736BubG12rbUsmOceapZD99l78ipCM?=
 =?us-ascii?Q?UGXHQjUTHoYW1NnfJtdH0KHiSn4GrPmT+QZ6LvB8I4IIgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oe2zDBIKa5kUdKRctVX+lOzSjPc1gq7qviNu5gTvTHJRNTADNmllJZPjDAby?=
 =?us-ascii?Q?y0BZNQHdf+RRZkAQ9j5r729n4waj5Ac54HZgUFsRO7jyhuu3VW2V+9sihmPl?=
 =?us-ascii?Q?F4cm9YOba/fDZuaugLUK81RCTiDTrHq84CLmcdEveXUWkuHgI2uXiVDCJMal?=
 =?us-ascii?Q?rmPdkjeGaBPd9wsquxqFO2uxGf8FTt0QJntBhwqfxsDbfWry8sPrWqlDWtcW?=
 =?us-ascii?Q?INojUYFXdFJcQFnxDsXqqWB+fiLZN0PdE5QkHMg+bSoAtf9SWsX/U1YMvLsw?=
 =?us-ascii?Q?nLAja2KZJQBdFh7ES14xHcf6qlNJCug6mVzXu1ew7zQkG7AEv0CIY7KlSnVx?=
 =?us-ascii?Q?ehbyf/DVi7+1+OR4bJHv08SFsVeyihMChHQTojVTO27SGFZSMtB7l7bWwaMv?=
 =?us-ascii?Q?o7KiIlrfhBKe70Im510bV+ltgIwmJN1m5R9dvPjckkCEQx4vWmqEA5Xa6BXu?=
 =?us-ascii?Q?EdTrpr019uzRxtptTowaz0Beaf7MD2EFKkF7BtSW7kDa2VbwDyD2Q4zJhB5Z?=
 =?us-ascii?Q?0T3Q3MSbEAtZWYMaefKqOxKiOyyYCPB1CfcDloT+Q1imPh42Il9GN+kqQAM1?=
 =?us-ascii?Q?JbWrypBnqmPSQT0v2d8iuTKZJpREpp//7Lu5MXO6imB0dfILTyQE3UYOTFKG?=
 =?us-ascii?Q?Tbb5gEzBVtwXjmIUNvjVuP+ZMyLc+V8yEqZGVqOGt82V31e0KR3GtSzJWxOs?=
 =?us-ascii?Q?Ufkp1VPePEHTi3F4jp0OrhkYTdoubPlCqmhhh9crsitItittltUv/teg3/Oj?=
 =?us-ascii?Q?vpJ6jHqxDM9NK/JxMIhALidjIZMH8uXtKFJ7XvutsTYMjnxTw3FyzdRA5Nti?=
 =?us-ascii?Q?8RFIcE8o+fW8LQ0qTMKsqFT/vfLIRIXxd4q1m9A0TDF4z14xVzVbmtFl0fWY?=
 =?us-ascii?Q?0eWNzT4BlYzhTQAg5w6YcE3JuXtDZzbcNyME1c7F2YCFaM9iY2eXe6e59PW0?=
 =?us-ascii?Q?1zWIvBR75ES48S+CY+kwWyYKB2AaA5tdt1PKh+JykQAuKoGLzglNc3W11Pgg?=
 =?us-ascii?Q?cjkpoBq0kxf5GFGpIPmM/7UZ5xe7uH5xW5Qpv5+yQfXueY1e9GtYV2R7MiQS?=
 =?us-ascii?Q?ELn8glxiAGD834X5za72Wk6X+KbIHnwZuBLK5pk0/H2bJneb9xMzLDUloQ1b?=
 =?us-ascii?Q?xIVIOf4uoXb+dExBL+FxeqoiytPeb06JItf+U8jhH4O3GAnzQcYDBv6TKK0f?=
 =?us-ascii?Q?VEwbLLSx0Q0EcY0wtuJbnL6eBJB2hqMWrHJsIa3jAWBDSDWIcXHNk9uU3aEj?=
 =?us-ascii?Q?kKVs0R/K2Y0o3dWeBItBNfxT7aduI4XTVldYHniMF/qKur7gxzQyjZcDx6Hm?=
 =?us-ascii?Q?XMfzhvb03BEPeA+oVhw0j4RctHw3PRbwOs3rq3QuXvJOvi9GaO52jw8a+ra5?=
 =?us-ascii?Q?XHDw/WCaYYrLsWgjEPDwzTv3c+vRiQkiwB8jDK5xSkqixIaS/jf7qsenE4MN?=
 =?us-ascii?Q?VhTfltMAs86eWxBxKH1oNK2rakQNMYlAnseDvsnAUTyKCb50JabYsBxxL2hi?=
 =?us-ascii?Q?dNqZG5THGXMTwfDu4iG5GdBcWDI6kOKllKshcpRIBtrMBnmkMiftWNZM+kyp?=
 =?us-ascii?Q?LUrliokVE5VSDivJEL8JLlETYzsFbYUo+6OE8Ac8fE6nx2lBeIv6TR/LlRoC?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd24f7a0-3943-42a1-1846-08dd26358258
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 05:15:43.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gC5GVS30pjhyU5pxqaJioFzkudMr4cKXDApGdK20GTvoK0cJrrPiAB+efCOVt82/ub13kK+e60dXgtrAsd4hmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.mm.run_vmtests.sh.virtual_address_range.fail" on:

commit: e93d2521b27f0439872dfa4e4b92a9be6d73496f ("x86/vdso: Split virtual clock pages into dedicated mapping")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      4bbf9020becbfd8fc2c3da790855b7042fad455b]
[test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

in testcase: kernel-selftests
version: kernel-selftests-x86_64-7503345ac5f5-1_20241208
with following parameters:

	group: mm
	sc_nr_hugepages: 2



config: x86_64-rhel-9.4-kselftests
compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412271148.2656e485-lkp@intel.com



# # -------------------------------
# # running ./virtual_address_range
# # -------------------------------
# # TAP version 13
# # 1..1
# # not ok 1 BUG in mmap() or /proc/self/maps
# # # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
# # [FAIL]
# not ok 31 virtual_address_range # exit=1



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241227/202412271148.2656e485-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

