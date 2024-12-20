Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4E1A0AE1
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734683978; cv=fail; b=N+Oufp5yCihC7Q+VNMepbtT15F9IBjTl55jntYoYnyoFyA7Hm9D0ISlYYMlNxwngVo8wWdxWqGWPwQXxS4PvbtXPNn/jSt8Gklm7UFf5JoTVWIu9r2U3ntyEwrJQ05Eamlo9cWo8pOi4JGIDu0/1XkK9byQWY/uyK1bEIABiVio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734683978; c=relaxed/simple;
	bh=HrmA102hqyZc1zyUgfscPj9be/P6p54Jihz0nJ23Mxk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hzpUad/2GbmHAXytX9joi0BsLjkLa9axUD5N1ATanaJ7VTf9YxrhvM+BwarfTfU1gwz+FdgKbyjTf5Tq4Lk8/+V0j4eXcK++PH6yolgMIcQ4B5U/vIX8b7m1Hs1vzYmlzg5wOozkJTMfdV3le1PB60ngLxd3ASIr8UviFfrG0i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lu5hQtdW; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lu5hQtdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734683974; x=1766219974;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=HrmA102hqyZc1zyUgfscPj9be/P6p54Jihz0nJ23Mxk=;
  b=Lu5hQtdWuvYue/wTngsm1VPK3nH2k1hVEIEd5V00nKBugJ7clW6sTLaq
   4zA8GGQrJk6XjdEbmwDDBxnmu1R8AOSqkHy0M/wy/ooM1f/Wu5Jamqpga
   u/LNkxWXjwp6VfXE5ipUsHAh6KtiozqCbojYVzNUQ+6mLJStiBLO+b7Tb
   9rIDqmS44AjGE4lq+wABsbvAB80sk1x6z8pXUzPmLJFc/zd9ndS02N1Uw
   ZyPp5/eTbT23a8MnVSoIh9SjY9nBzZcfYSDz0WXL/O9SrI/9zwpvHnulp
   5ZoUtmdxiPpVUDfwSPY9X9zvO0UwOJ7Evqb3AyAM/4CAppC2wlsLvDez6
   g==;
X-CSE-ConnectionGUID: TjmlyYc2QuGdlVjmQ5E0Jg==
X-CSE-MsgGUID: k40W7vpdS9Ovo9/QjG/PFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35115425"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35115425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:39:27 -0800
X-CSE-ConnectionGUID: 91C4uX/AT/KJgNmusoiFjA==
X-CSE-MsgGUID: JfRMYQvrQf23O9MNWhvgyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121732267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 00:39:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 00:39:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 00:39:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 00:39:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpO7UDXcqO5PCrpfkvOndb3rsLrPtqeEtSuuz8JOmQ+Oc9GCj3uGsa7i52sRek9QNFpVDg93ePJjTW/pFBPBMmTxc9RN7JlSLWlEGNodjPK/527QCh/dH8s2N42S9yMlbXIvDNcyRH/nJPIuU0o/9LidB4jvG1t9AxVIa5s6qKJeo8l7of8oQj13k0rbVKNwhZlAYFn3uksKcXCG6Kkhb2FDEtrgvcoi1mIVinAO6zDi6uBNUGfFJZolfft+xuX0nma3LEoP2tD7hmrooL7MIl59hvT7LC/dIPXUOi9CaW00smVx9zsPJGFRQmfg6QUua3zsmyjhnGtkoIpl+0g09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+y8PjnCaqeFurOoltfckI9AMsSS70RCZFPNyQ62BvQ=;
 b=GQVzS0cB4cjgaucSbNEX94tsAERBtaB1jSyR9EjwK7g1kK84aUoKPXzh4BQuWz+o1sHetcDan/NcgHmQYtNvcRje5ChNAPUwTxPgFxK8JcKcvniqqlU20lnesb6aBKI3jGEN7lvQKeOIJHGfXnW/DqIzdnDFZhMU2GXSxWZR+v2+Wz6o2JV/EpeGQPSQbS84vYYCCV62GRV3g/+47YAKXqeCHQaWwJGiSGYZC01iZNtwQFIwxcIZBtYVmMI46iY38Y+Nyy3hKL/+bncURQaYJ1Zj0zAqDWrPjfQ0h18Ar8rqaH5FtAe2/Tv1yJrh5EVNvojcI+YY5VDXkoDl0ABMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 08:39:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:39:01 +0000
Date: Fri, 20 Dec 2024 16:38:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v4.5] [futex]  6df37a9175:
 will-it-scale.per_thread_ops 99.1% regression
Message-ID: <202412201525.7043e9be-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 039e1f57-8271-4678-eb7f-08dd20d1c0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CYZ7nzECdoBWvT/2Jfwio0O1G2cKouKWRUy32WVcqCxWAvaZNdG+ODYrye?=
 =?iso-8859-1?Q?3dLWx1TwyTGPabXgc8a5JqHexdmVGXN5bp3NxUwXiOS8zmw2guJHYnP0VZ?=
 =?iso-8859-1?Q?MX+Ttbiw+5Ow6TdRtqxni4LyFek5MxhaEhKtGwJ0IqCJDEDImJCVwF8Xz5?=
 =?iso-8859-1?Q?8Bw/ASEpSeloFbpTX/IRia2BiE9W1B9XgBDWR2yVHfP9NH8et0KN7M89Lr?=
 =?iso-8859-1?Q?WaXZwytlJz7Pup4qdQ/M8kcLY9UrmpL8o+JjxzxY8RAjLBHfW6wIrP9Eqa?=
 =?iso-8859-1?Q?2RlHNG4X7CXxHpWYpvRGGwLsv/5I8eglupgQr2+jZGIeb+vNe/doYcfGgu?=
 =?iso-8859-1?Q?PFknqZd0iXKEmFC294TsOmljoQsxrjYgzEY9sfphR/bM5b9UluvIurW2oC?=
 =?iso-8859-1?Q?tPDLInm1u/F2vymp2xOfpgpqydUI1ARHrL5U9qMexDlm6hBd+CoytpkmUj?=
 =?iso-8859-1?Q?8CrmxKsiT/7zBh1l+qnVhpnP72UxSO5zteX+Wmuj5xIPozR/dX6ViGSDLP?=
 =?iso-8859-1?Q?rNNsK+lqXDoxpZIZa3ERuNyjRpaCBxfo4Y3zAQYVhT1lI4Jdu5eN1LbY5C?=
 =?iso-8859-1?Q?ZtU2ccv4qGfIT1rEBTwS+2IH7yyE+QykYECdzRIUrgxiNJFsb5FHGg8G6c?=
 =?iso-8859-1?Q?WAOpuwiUSurEhBFUv0mE/9znspynwP9j7rQCeD0GTBxy4SK5G3ypAHmxgT?=
 =?iso-8859-1?Q?h67TEMTe9DyE7W86dgbPPlhvpA4Aa3yy2/nLLBksEXmGVOZvtlyjeyjmsk?=
 =?iso-8859-1?Q?lUOjxm/Gu4dNQfj16TgegJ07e1xX//EQK3Ti0oCIMEVJyQMtp80gVPyYfu?=
 =?iso-8859-1?Q?ounNHSYokVwEH36GSn+DIQjaQisMzQqYm53zvoolLwhMm+87UVNzamz454?=
 =?iso-8859-1?Q?f/mA0zp3K8Fj/Gw4I58iyfdtQbbMHsfjg54QrJdq4+273OmK5o2mAmYJV8?=
 =?iso-8859-1?Q?dgUqYBL4JOE0nkOPAKj099gT0JPwtqp/G2rQ8UxXWNLXwULClDoyN8RmG7?=
 =?iso-8859-1?Q?6YiEWGlDEmoU+DEJ6mv0NfwbnX24YGqgwyiMy0UsABJGVwmAnBapAyiJBt?=
 =?iso-8859-1?Q?7HkwNsNt1GuWU6Id4pOAQ4/wUYQgyxxoULDKZ+VbOK9MAl6SRtvlY0wGq4?=
 =?iso-8859-1?Q?cRLhghY8wrD2z1yP2z7trM7cBlLIi2Z5UVrFvO6SkDSADM/cI6NtMKFyTx?=
 =?iso-8859-1?Q?0823b5ytZUlPmqSNS7FY/iOTkrZ9PdFTEttNi9cNSGRxkbyagO9ILgRWJG?=
 =?iso-8859-1?Q?7+8aIM0b7LDqGMw93GZ43FHraE5q1+D7zGoO5jIa+kIwijQhxbjGH0cnUG?=
 =?iso-8859-1?Q?vTNt7wcT7CjirYRUN6qD5oBSyi2NKBhs+1HkaHbA4Es39zm4HMsw5Og5E/?=
 =?iso-8859-1?Q?NtZFpcCYV88pZFHEnH19GGiOpt/p1F5S8ATQ4zZR4TDm/l/mwA60FwwnDP?=
 =?iso-8859-1?Q?1m8yyynx8/DqVMmR0KroSpw/tPF54tl6BcRr/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JyrLR7vDRNl4X4bgnPSqVxVb/2ko/Uli5PowJQ8LmS3qjsWfHjxzfsoxyn?=
 =?iso-8859-1?Q?uzSBRE39Vbk/mEAD95LIssK33G/Q/Y6g8fW9JNwJNEyjypngJFRJjWobN6?=
 =?iso-8859-1?Q?uuPIaL2e/ffgp6NJ3rFC/mNyzw+q+rMhyiuqtzm6Cyla2JK775enxRB1Ec?=
 =?iso-8859-1?Q?s3xXLFMB1R/SL2eNjPHWhkPfKjbxFgch4SPL/LNWWV96nLoCvAjz7LetVm?=
 =?iso-8859-1?Q?r052N11CwKxXPAsIUxypWqG10DJFg4YETm9CvSB+Z7LHbKGW/DI2sqQLno?=
 =?iso-8859-1?Q?d7fnXQGsHf2/KAQh1uq3eVm27nMTEmkfrldzpsXsNLjFpntS6vfRSlTv32?=
 =?iso-8859-1?Q?2OPPvLwLCq9PJ8yz8u7WRqwDGb438ZCVc8b82HyVSGS3vR42DFc+GC+n0U?=
 =?iso-8859-1?Q?f4BN6QHGC2AvEJl5rZM9DkmzoVaRgTA0T85OQUTfrOEMg26zicwTp5KIbq?=
 =?iso-8859-1?Q?CLC2c3Yc41EHQy93Rb7tLxetenaItvoWE0dctljlfr6znn/+vR7ni3SOrF?=
 =?iso-8859-1?Q?vnDyjsL4ZmfvZQTqZf2om3F6DeXqcw6NK0AW6VeZNOqvNndpuIcSvZvIG6?=
 =?iso-8859-1?Q?TU0dRG8VF7LiFi/ZZgmskz6LLruDx6iXafa+jtPu82+GLoWgEl9GtEwlTy?=
 =?iso-8859-1?Q?sUz96riInHme4UaUUgy87yyZPtn9Lctd2jsOfv6e3cGxOyhR4sJD28qD8Z?=
 =?iso-8859-1?Q?yotfM8Dta0bc1hTTrI+CHBb1m8Op92BmtB9dqdOKPMLfcY+j1hm38Gm+CY?=
 =?iso-8859-1?Q?cRfauAuOvcr0SO8q61crrMRjDKGbhyOiReoSMraW/79IVExRG7O9rVsDrd?=
 =?iso-8859-1?Q?oQxlW8hP/NLkz0CT+PcRaclsF+X/H72Tx81xan2hnOF4mYcT/yLrLgRDIQ?=
 =?iso-8859-1?Q?xT0tRbO5u+AY8BIZw74n1PZHOqLW8r6WCmtld0DtqPfKkois8rU3mBCDvH?=
 =?iso-8859-1?Q?jHZ0GB5WUnkKwtKE0UWEvtPizrc9DWNU4E6Z2gRxREUx5KRHfwSCxEqq95?=
 =?iso-8859-1?Q?FQxJENJLwyKLDWZr3qD9T5f3QffQiuN03Qy1Vzu4CbHsAgNUI2uQi6/hvW?=
 =?iso-8859-1?Q?syYxtrfli5vGdckHMnWRUmXLEIkFqnJWHB0xqkMGa3SrIk4smlBFpDeNqL?=
 =?iso-8859-1?Q?sIiXsJcgdATlk31htrylP/9L8egYZNQWsXUuAKXqdrA1W1uoIqBxcAbnLx?=
 =?iso-8859-1?Q?vPeCGwUlLjvoickfDgSTOSOr10IzIPF5M5uKIwYRjOa7TUgnH8s7K4cAaL?=
 =?iso-8859-1?Q?FmKvriXguolwl9f/toGvspkzRKyptK9XYrmeDEqMnRso8RKfZzj8jscALq?=
 =?iso-8859-1?Q?Ur+Z2VEM4w67VdTuIT5gSKlObx8yca5RV3/neJaFhuMXMmQUFG/Ann06KZ?=
 =?iso-8859-1?Q?4au+IedKnAJR01As7euAvi/eWincEhs1MtypoEQK/LpUNVH4SW1eyImbpg?=
 =?iso-8859-1?Q?9/INOFcYQZIUUfgdZsrFMR58Lb2bpA04fB5WcPq2/AZu2eAVGtADfiWpXG?=
 =?iso-8859-1?Q?VVByv3NfQzcJNCJZsOdEOfplUtg8kmzr/LbnZ0JM7YrBYLX+zofe72elWu?=
 =?iso-8859-1?Q?9ExodtsogbYDuswOz4wPT/R+X1pHgFRZochkI25OVY280qxaN6Bv9FCTUu?=
 =?iso-8859-1?Q?lmciYxdVea8oFpnld69eLOt2REyTGIEw2t89Ow/PxPLo5DaUyVktWCuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 039e1f57-8271-4678-eb7f-08dd20d1c0f1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:39:01.6969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdlRHILd99X2naS+PDFg94db85haOVln3Ya95tBufkx8jDLFB5GyD070cMbID9kN2Uo96N1QpU2ssyoVVSqMgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 99.1% regression of will-it-scale.per_thread_ops on:


commit: 6df37a9175b2332651f820dabcf09d958e2838b4 ("futex: Track the futex hash bucket.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v4.5

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 100%
	mode: thread
	test: futex3
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops 19.3% improvement                                      |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=thread                                                                                        |
|                  | nr_task=100%                                                                                       |
|                  | test=pthread_mutex5                                                                                |
+------------------+----------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201525.7043e9be-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201525.7043e9be-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/futex3/will-it-scale

commit: 
  f9c3465f79 ("futex: Hash only the address for private futexes.")
  6df37a9175 ("futex: Track the futex hash bucket.")

f9c3465f79b97231 6df37a9175b2332651f820dabcf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    216553           -42.1%     125385 ±  4%  cpuidle..usage
      0.01 ±  3%      +0.0        0.04 ±  2%  mpstat.cpu.all.soft%
     76.68           +21.1       97.82        mpstat.cpu.all.sys%
     22.24           -21.1        1.14 ±  4%  mpstat.cpu.all.usr%
     21.97           -95.1%       1.07 ±  5%  vmstat.cpu.us
      2644 ±  2%     +33.7%       3534        vmstat.system.cs
    264029            +4.5%     275990 ±  2%  vmstat.system.in
 1.145e+09           -99.1%   10220847 ±  3%  will-it-scale.224.threads
   5111063           -99.1%      45628 ±  3%  will-it-scale.per_thread_ops
 1.145e+09           -99.1%   10220847 ±  3%  will-it-scale.workload
     21.83 ± 19%    +567.8%     145.80 ± 27%  perf-c2c.DRAM.local
    480.67 ±  7%    +772.6%       4194 ± 23%  perf-c2c.DRAM.remote
    708.83 ± 17%   +1170.8%       9007 ± 21%  perf-c2c.HITM.local
    404.83 ±  9%    +417.2%       2093 ± 24%  perf-c2c.HITM.remote
      1113 ± 10%    +896.8%      11101 ± 22%  perf-c2c.HITM.total
     47559 ± 74%    +386.5%     231392 ± 40%  numa-meminfo.node0.Mapped
      2490 ± 10%     +27.6%       3179 ± 16%  numa-meminfo.node0.PageTables
     23012 ±132%    +998.7%     252847 ± 27%  numa-meminfo.node1.Mapped
     22426 ±120%    +766.3%     194289 ± 24%  numa-meminfo.node2.Mapped
     43422 ± 65%    +877.3%     424370 ± 14%  numa-meminfo.node3.Mapped
      2180 ± 10%    +100.9%       4381 ± 12%  numa-meminfo.node3.PageTables
     11997 ± 74%    +382.0%      57832 ± 40%  numa-vmstat.node0.nr_mapped
    622.66 ± 10%     +27.6%     794.27 ± 16%  numa-vmstat.node0.nr_page_table_pages
      5783 ±132%    +994.4%      63295 ± 27%  numa-vmstat.node1.nr_mapped
      5634 ±121%    +762.1%      48577 ± 24%  numa-vmstat.node2.nr_mapped
     10996 ± 65%    +863.6%     105959 ± 14%  numa-vmstat.node3.nr_mapped
    544.94 ± 10%    +100.9%       1094 ± 12%  numa-vmstat.node3.nr_page_table_pages
   1553391           +29.1%    2004812 ± 18%  meminfo.Active
   1553391           +29.1%    2004812 ± 18%  meminfo.Active(anon)
    779945           +10.6%     862841        meminfo.AnonPages
    137214          +704.0%    1103213 ± 20%  meminfo.Mapped
   6676542           +25.0%    8348555 ±  4%  meminfo.Memused
      8696           +42.0%      12344 ±  2%  meminfo.PageTables
    777002           +47.5%    1145945 ± 31%  meminfo.Shmem
    388384           +29.0%     501083 ± 18%  proc-vmstat.nr_active_anon
    194965           +10.6%     215693        proc-vmstat.nr_anon_pages
   1070569            +8.6%    1162643 ±  7%  proc-vmstat.nr_file_pages
     34502          +699.9%     275986 ± 20%  proc-vmstat.nr_mapped
      2172           +42.0%       3084 ±  2%  proc-vmstat.nr_page_table_pages
    194308           +47.4%     286383 ± 31%  proc-vmstat.nr_shmem
     36661            +1.3%      37154        proc-vmstat.nr_slab_reclaimable
     88110            +4.0%      91596        proc-vmstat.nr_slab_unreclaimable
    388384           +29.0%     501083 ± 18%  proc-vmstat.nr_zone_active_anon
     55590 ±  9%    +107.6%     115430 ± 43%  proc-vmstat.numa_hint_faults
     14771 ± 16%    +190.5%      42918 ± 34%  proc-vmstat.numa_hint_faults_local
    205921 ± 22%    +162.6%     540759 ± 26%  proc-vmstat.numa_pte_updates
   1444186           -28.0%    1040142 ± 10%  proc-vmstat.pgfree
     62061           -22.1%      48345 ± 20%  proc-vmstat.pgreuse
      0.00 ±  3%  +1.7e+05%       6.48        perf-stat.i.MPKI
  1.67e+11           -98.9%  1.903e+09 ±  3%  perf-stat.i.branch-instructions
      0.01 ±  4%      +0.5        0.56 ±  2%  perf-stat.i.branch-miss-rate%
  12706268 ±  2%     -11.5%   11248669 ±  2%  perf-stat.i.branch-misses
     15.04 ±  2%     +27.8       42.87        perf-stat.i.cache-miss-rate%
   1619360 ±  6%   +2904.5%   48654422 ±  3%  perf-stat.i.cache-misses
  12260198 ±  3%    +825.7%  1.135e+08 ±  3%  perf-stat.i.cache-references
      2581 ±  2%     +33.2%       3438        perf-stat.i.context-switches
      1.24         +9114.1%     113.84 ±  3%  perf-stat.i.cpi
 7.821e+11            +8.9%   8.52e+11        perf-stat.i.cpu-cycles
    301.46           -13.3%     261.32        perf-stat.i.cpu-migrations
    665106 ±  7%     -97.4%      17524 ±  2%  perf-stat.i.cycles-between-cache-misses
 6.328e+11           -98.8%  7.598e+09 ±  3%  perf-stat.i.instructions
      0.81           -98.9%       0.01 ±  3%  perf-stat.i.ipc
      0.01 ± 63%    +214.7%       0.03 ± 51%  perf-stat.i.major-faults
      0.00 ±  6%  +2.5e+05%       6.42        perf-stat.overall.MPKI
      0.01 ±  2%      +0.6        0.58 ±  2%  perf-stat.overall.branch-miss-rate%
     12.97 ±  3%     +29.9       42.88        perf-stat.overall.cache-miss-rate%
      1.24         +8997.7%     112.44 ±  3%  perf-stat.overall.cpi
    485320 ±  6%     -96.4%      17524 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.81           -98.9%       0.01 ±  3%  perf-stat.overall.ipc
    166478           +33.5%     222214        perf-stat.overall.path-length
 1.664e+11           -98.9%   1.88e+09 ±  3%  perf-stat.ps.branch-instructions
  12596385 ±  2%     -12.9%   10967444        perf-stat.ps.branch-misses
   1612398 ±  6%   +2886.3%   48150254 ±  2%  perf-stat.ps.cache-misses
  12422547 ±  3%    +804.1%  1.123e+08 ±  2%  perf-stat.ps.cache-references
      2570 ±  2%     +31.6%       3381        perf-stat.ps.context-switches
 7.794e+11            +8.2%  8.432e+11        perf-stat.ps.cpu-cycles
    299.35           -14.7%     255.41 ±  2%  perf-stat.ps.cpu-migrations
 6.306e+11           -98.8%  7.507e+09 ±  3%  perf-stat.ps.instructions
      0.01 ± 63%    +207.1%       0.03 ± 52%  perf-stat.ps.major-faults
 1.906e+14           -98.8%  2.271e+12 ±  3%  perf-stat.total.instructions
  38348453           -11.0%   34112278        sched_debug.cfs_rq:/.avg_vruntime.avg
  67424249 ± 11%    +274.8%  2.527e+08 ± 28%  sched_debug.cfs_rq:/.avg_vruntime.max
  34251697 ±  2%     -37.5%   21423393 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.min
   2343085 ± 18%    +698.5%   18708664 ± 24%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.75 ± 11%     -68.0%       0.24 ± 33%  sched_debug.cfs_rq:/.h_nr_running.min
      0.12 ±  9%     +51.1%       0.18 ±  4%  sched_debug.cfs_rq:/.h_nr_running.stddev
      6929 ±141%   +5350.7%     377703 ± 62%  sched_debug.cfs_rq:/.left_deadline.avg
   1552183 ±141%   +5350.7%   84605534 ± 62%  sched_debug.cfs_rq:/.left_deadline.max
    103477 ±141%   +5350.7%    5640312 ± 62%  sched_debug.cfs_rq:/.left_deadline.stddev
      6929 ±141%   +5350.8%     377703 ± 62%  sched_debug.cfs_rq:/.left_vruntime.avg
   1552173 ±141%   +5350.8%   84605475 ± 62%  sched_debug.cfs_rq:/.left_vruntime.max
    103477 ±141%   +5350.8%    5640308 ± 62%  sched_debug.cfs_rq:/.left_vruntime.stddev
     41599 ±157%    +538.3%     265515 ± 58%  sched_debug.cfs_rq:/.load.max
      3457 ± 10%     -68.9%       1074 ± 33%  sched_debug.cfs_rq:/.load.min
      3040 ±143%    +493.8%      18055 ± 57%  sched_debug.cfs_rq:/.load.stddev
      3.11 ± 10%     -64.0%       1.12 ± 31%  sched_debug.cfs_rq:/.load_avg.min
  38348453           -11.0%   34112279        sched_debug.cfs_rq:/.min_vruntime.avg
  67424249 ± 11%    +274.8%  2.527e+08 ± 28%  sched_debug.cfs_rq:/.min_vruntime.max
  34251697 ±  2%     -37.5%   21423393 ± 14%  sched_debug.cfs_rq:/.min_vruntime.min
   2343085 ± 18%    +698.5%   18708675 ± 24%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.75 ± 11%     -68.0%       0.24 ± 33%  sched_debug.cfs_rq:/.nr_running.min
      0.04 ± 13%    +102.3%       0.09 ±  4%  sched_debug.cfs_rq:/.nr_running.stddev
    170.67           +19.2%     203.52        sched_debug.cfs_rq:/.removed.load_avg.max
      6929 ±141%   +5350.8%     377703 ± 62%  sched_debug.cfs_rq:/.right_vruntime.avg
   1552173 ±141%   +5350.8%   84605475 ± 62%  sched_debug.cfs_rq:/.right_vruntime.max
    103477 ±141%   +5350.8%    5640308 ± 62%  sched_debug.cfs_rq:/.right_vruntime.stddev
      1594 ±  6%     +24.1%       1979 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
    767.22 ± 11%     -62.0%     291.88 ± 50%  sched_debug.cfs_rq:/.runnable_avg.min
     80.26 ± 10%    +106.6%     165.79 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
    659.19 ± 11%     -76.7%     153.84 ± 37%  sched_debug.cfs_rq:/.util_avg.min
     56.72 ± 17%     +76.2%      99.95 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
      1371 ±  7%     +30.4%       1788 ±  3%  sched_debug.cfs_rq:/.util_est.max
    379.72 ± 68%     -90.5%      35.96 ±164%  sched_debug.cfs_rq:/.util_est.min
     87768 ± 12%     +34.5%     118032 ±  6%  sched_debug.cpu.avg_idle.stddev
    196042           -12.5%     171520        sched_debug.cpu.clock.avg
    196077           -11.9%     172787        sched_debug.cpu.clock.max
    196002           -13.2%     170197        sched_debug.cpu.clock.min
     21.40 ±  9%   +3428.4%     755.23 ± 16%  sched_debug.cpu.clock.stddev
    195166           -12.5%     170715        sched_debug.cpu.clock_task.avg
    195357           -11.9%     172182        sched_debug.cpu.clock_task.max
    182273           -14.1%     156586        sched_debug.cpu.clock_task.min
    879.67 ±  6%     +49.3%       1313 ± 10%  sched_debug.cpu.clock_task.stddev
      9794           -20.3%       7809 ±  9%  sched_debug.cpu.curr->pid.max
      4128 ±  4%     -41.7%       2404 ±  9%  sched_debug.cpu.curr->pid.min
    544581 ±  6%     +17.4%     639606 ±  8%  sched_debug.cpu.max_idle_balance_cost.max
      3550 ± 66%    +188.2%      10231 ± 32%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 33%   +1805.0%       0.00 ± 16%  sched_debug.cpu.next_balance.stddev
      0.11 ± 10%     +49.3%       0.17 ±  2%  sched_debug.cpu.nr_running.stddev
    865.72 ±  2%     -30.3%     603.52 ±  2%  sched_debug.cpu.nr_switches.min
    196003           -13.2%     170178        sched_debug.cpu_clk
    195151           -13.2%     169326        sched_debug.ktime
      0.00          +284.0%       0.00 ± 12%  sched_debug.rt_rq:.rt_nr_running.avg
      0.17          +260.0%       0.60        sched_debug.rt_rq:.rt_nr_running.max
      0.01          +269.9%       0.04 ±  5%  sched_debug.rt_rq:.rt_nr_running.stddev
    196817           -13.1%     170992        sched_debug.sched_clk
     29.07           -29.1        0.00        perf-profile.calltrace.cycles-pp.clear_bhb_loop.syscall
     20.40           -20.4        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
      7.72            -7.7        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     98.13            +0.4       98.53        perf-profile.calltrace.cycles-pp.syscall
      0.00            +0.6        0.56 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.futex_hash_priv_put.futex_wake.do_futex.__x64_sys_futex
      0.00            +0.6        0.59 ±  3%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.00            +0.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.__cmd_record
      0.00            +0.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record
      0.00            +0.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.00            +0.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record
      0.00            +1.5        1.52 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.futex_hash.futex_wake.do_futex.__x64_sys_futex
      0.00           +34.9       34.87        perf-profile.calltrace.cycles-pp.futex_hash_priv_put.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
      5.03 ±  3%     +50.6       55.63        perf-profile.calltrace.cycles-pp.futex_hash.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     39.98           +58.2       98.15        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     36.78           +61.3       98.13        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     21.65           +76.3       97.92        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     17.90           +80.0       97.89        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     13.70           +84.1       97.81        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.26           -29.1        0.20 ±  3%  perf-profile.children.cycles-pp.clear_bhb_loop
     13.10           -13.0        0.10 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      7.93            -7.8        0.17 ±  8%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      7.78            -7.7        0.06        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.30 ±  2%      -0.1        0.23 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
     98.66            -0.1       98.59        perf-profile.children.cycles-pp.syscall
      0.27 ±  3%      -0.1        0.21 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.06 ±  6%      +0.0        0.10 ±  7%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.kthread
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.ret_from_fork
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.00            +0.3        0.26 ±  2%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.00            +0.3        0.26 ±  2%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.02 ±141%      +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.handle_internal_command
      0.02 ±141%      +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.main
      0.02 ±141%      +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.run_builtin
      0.02 ±141%      +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.cmd_record
      0.02 ±141%      +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.perf_mmap__push
      0.02 ±141%      +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.00            +0.4        0.40 ±  2%  perf-profile.children.cycles-pp.generic_perform_write
      0.00            +0.4        0.40 ±  2%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.00            +0.4        0.40 ±  2%  perf-profile.children.cycles-pp.record__pushfn
      0.00            +0.4        0.40 ±  2%  perf-profile.children.cycles-pp.vfs_write
      0.00            +0.4        0.40 ±  2%  perf-profile.children.cycles-pp.writen
      0.00            +0.4        0.40 ±  2%  perf-profile.children.cycles-pp.ksys_write
      0.00            +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.write
      0.00            +0.6        0.59 ±  3%  perf-profile.children.cycles-pp.queue_event
      0.00            +0.6        0.60 ±  3%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +0.6        0.60 ±  3%  perf-profile.children.cycles-pp.process_simple
      0.00            +0.6        0.62 ±  4%  perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +0.6        0.62 ±  4%  perf-profile.children.cycles-pp.reader__read_event
      0.00            +0.6        0.62 ±  4%  perf-profile.children.cycles-pp.record__finish_output
      0.02 ±141%      +1.0        1.03 ±  3%  perf-profile.children.cycles-pp.__cmd_record
      0.47 ±  4%      +1.1        1.57 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00           +35.3       35.27        perf-profile.children.cycles-pp.futex_hash_priv_put
      4.62           +51.6       56.26        perf-profile.children.cycles-pp.futex_hash
     40.50           +58.3       98.77        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     37.13           +61.6       98.73        perf-profile.children.cycles-pp.do_syscall_64
     22.04           +75.9       97.92        perf-profile.children.cycles-pp.__x64_sys_futex
     18.23           +79.7       97.89        perf-profile.children.cycles-pp.do_futex
     14.37           +83.5       97.87        perf-profile.children.cycles-pp.futex_wake
     29.09           -28.9        0.20 ±  3%  perf-profile.self.cycles-pp.clear_bhb_loop
     10.90           -10.8        0.08 ±  7%  perf-profile.self.cycles-pp.syscall
      7.38            -7.3        0.06        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      6.53            -6.4        0.12 ± 10%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      5.81            -5.8        0.01 ±200%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.63            -0.4        6.26 ±  2%  perf-profile.self.cycles-pp.futex_wake
      0.00            +0.3        0.25 ±  3%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.00            +0.6        0.58 ±  3%  perf-profile.self.cycles-pp.queue_event
      0.00           +35.1       35.10        perf-profile.self.cycles-pp.futex_hash_priv_put
      4.10           +51.9       55.98        perf-profile.self.cycles-pp.futex_hash
      0.21 ±149%   +1579.9%       3.53 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.10 ±223%   +1414.6%       1.51 ± 49%  perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      0.38 ± 99%    +825.2%       3.55 ± 18%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.50 ±223%    +626.9%       3.62 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.04 ±  9%   +4470.9%       1.68 ±119%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.25 ±144%   +1158.1%       3.13 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.12 ±223%   +3404.5%       4.21 ± 18%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.29 ±110%   +3467.5%      10.20 ±121%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.01 ± 71%    +543.0%       0.06 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.31 ± 34%    +357.5%       1.40 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.15 ±220%   +2476.6%       3.77 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.76 ± 53%    +526.3%       4.78 ± 25%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.38 ± 45%    +475.9%       2.21 ± 11%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.03 ± 19%  +29641.2%       9.47 ±187%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 ± 14%   +1537.8%       0.10 ± 29%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.73 ±201%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      0.51 ±142%    +555.6%       3.33 ±  5%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      1.44 ±  4%    +222.9%       4.64 ± 79%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.02 ± 19%  +13135.4%       2.10 ±163%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.50 ± 48%    +342.7%       2.21 ± 37%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.00 ± 71%   +2091.3%       0.08 ± 34%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.05 ±  9%  +13771.3%       6.50 ±175%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ±  7%   +1034.2%       0.06 ± 39%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ± 10%    +487.1%       0.03 ±  4%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 24%   +2810.7%       0.21 ±152%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.62 ±  7%    +487.2%       3.67 ±117%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.53 ± 11%    +498.2%       3.17 ±  5%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.03 ± 45%  +34580.8%       8.96 ± 96%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.80 ± 11%   +1759.6%      70.73 ±182%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.21 ±149%   +2730.0%       5.94 ± 15%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.10 ±223%   +3112.9%       3.20 ± 48%  perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      0.39 ± 99%   +4784.3%      18.89 ±126%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.50 ±223%   +1616.3%       8.55 ± 38%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.25 ±144%   +3022.2%       7.77 ± 16%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.12 ±223%   +5581.4%       6.83 ± 28%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      4.15 ±  8%   +9818.7%     411.53 ±191%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.29 ±110%   +3713.3%      10.90 ±110%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      4.00           +46.3%       5.85 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      3.00 ± 19%     +80.8%       5.43 ± 24%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.15 ±220%  +17249.0%      25.39 ±143%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1.84 ± 66%    +293.6%       7.24 ± 15%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.72 ± 70%    +301.6%       6.91 ± 26%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.97 ±  4%  +2.2e+05%       2114 ±199%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 ± 15%   +2117.8%       0.20 ± 19%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.74 ±197%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      0.88 ±142%    +652.7%       6.65 ± 26%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      5.53 ± 38%   +7144.0%     400.59 ±182%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      3.84 ± 54%     -87.5%       0.48 ±100%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     12.03 ± 35%  +21629.8%       2614 ±158%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.04 ±  2%    +624.4%      29.25 ±164%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.00 ± 71%   +2237.4%       0.09 ± 36%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      2.17 ± 55%  +42355.2%     921.21 ±188%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 85%   +2112.1%       0.28 ± 77%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.04 ±119%    +590.5%       0.28 ± 18%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     13.50 ± 35%  +22769.7%       3086 ±186%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.57 ± 56%    +272.5%       5.83 ± 24%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3.13 ± 24%  +1.1e+05%       3404 ±154%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.43 ±  4%    +622.1%       3.08 ±113%  perf-sched.total_sch_delay.average.ms
     15.19 ± 24%  +25981.4%       3962 ±133%  perf-sched.total_sch_delay.max.ms
     13684 ±  4%    +153.1%      34634 ± 57%  perf-sched.total_wait_and_delay.count.ms
      3700 ± 19%    +202.0%      11173 ± 86%  perf-sched.total_wait_and_delay.max.ms
      3700 ± 19%    +202.0%      11173 ± 86%  perf-sched.total_wait_time.max.ms
    305.70 ± 14%    +234.6%       1022 ± 48%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.31 ± 34%    +745.1%       2.58 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.87 ±173%   +1237.0%      38.38 ± 21%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1.53 ±  6%   +1877.9%      30.28 ±126%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.33 ±  2%     +42.7%      10.46 ± 44%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.06 ± 21%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1.57 ±  6%   +2633.7%      42.82 ± 65%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      7.45 ±  4%     -44.2%       4.15 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    611.50           +25.9%     770.05 ± 19%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.70 ± 26%    +447.8%       9.33 ± 99%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    481.66 ±  3%     +45.5%     700.99 ± 20%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      6.50 ± 76%  +11730.8%     769.00 ± 62%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     10.17 ±  3%    +128.2%      23.20 ± 61%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     10.00           +96.0%      19.60 ± 39%  perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    349.00 ± 10%    +131.5%     807.80 ± 46%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    663.33 ±  3%     -67.2%     217.40 ± 82%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    396.17 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      2006 ± 13%    +102.5%       4061 ± 59%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
    661.00 ±  4%    +208.1%       2036 ± 41%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      5269 ±  6%    +227.6%      17264 ± 57%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    360.00 ±  3%    +225.1%       1170 ± 60%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1965 ± 20%    +273.0%       7333 ± 64%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.00 ± 19%    +240.5%      10.23 ± 28%  perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     11.06 ± 38%   +9578.2%       1070 ±132%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      7.68 ± 54%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1034 ±  3%    +649.2%       7751 ±114%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     16.71 ±124%  +13109.3%       2207 ±174%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    239.66 ±  8%     -92.3%      18.57 ±146%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2993 ± 21%    +235.4%      10041 ± 83%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.21 ±149%   +5795.1%      12.38 ± 74%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.38 ± 99%    +823.1%       3.54 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.50 ±223%   +4641.6%      23.62 ±167%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.25 ±144%   +5833.1%      14.77 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.12 ±223%   +3404.5%       4.21 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
    305.69 ± 14%    +234.6%       1022 ± 48%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.15 ±220%   +2360.4%       3.60 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      2.87 ±173%   +1237.0%      38.38 ± 21%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1.50 ±  6%   +1288.4%      20.82 ± 99%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.73 ±201%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      0.64 ±142%    +403.9%       3.21 ±  4%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      3.67 ±  2%     +55.0%       5.68 ± 47%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.44 ±  4%   +1293.4%      20.03 ± 36%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      2.90 ±  7%     -76.2%       0.69 ±122%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1.52 ±  6%   +2291.0%      36.32 ± 45%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      7.44 ±  4%     -44.6%       4.13 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    611.49           +25.9%     769.84 ± 19%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.08 ± 44%    +424.7%       5.66 ± 87%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.53 ± 11%    +488.5%       3.12 ±  8%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    481.64 ±  3%     +43.7%     692.03 ± 20%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.80 ± 11%   +1759.6%      70.73 ±182%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.21 ±149%  +2.9e+05%     608.49 ± 80%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.39 ± 99%   +4784.3%      18.89 ±126%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.50 ±223%  +41581.6%     207.64 ±190%  perf-sched.wait_time.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.25 ±144%  +82323.0%     205.23 ±193%  perf-sched.wait_time.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.12 ±223%   +5581.4%       6.83 ± 28%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1965 ± 20%    +273.0%       7333 ± 64%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.15 ±220%  +17249.0%      25.39 ±143%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.74 ±197%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      1.14 ±142%    +440.1%       6.17 ± 25%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      5.53 ± 38%  +12036.3%     671.14 ±116%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      9.43 ± 60%  +10515.6%       1000        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      3.84 ± 54%     -87.3%       0.49 ± 97%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1034 ±  3%    +572.1%       6953 ±107%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.99           -85.4%       0.73 ±122%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     16.01 ±130%   +8187.9%       1326 ±158%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    239.66 ±  8%     -92.3%      18.46 ±147%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2993 ± 21%    +235.4%      10041 ± 83%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.57 ± 56%    +272.5%       5.83 ± 24%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open


***************************************************************************************************
lkp-cpl-4sp2: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/pthread_mutex5/will-it-scale

commit: 
  f9c3465f79 ("futex: Hash only the address for private futexes.")
  6df37a9175 ("futex: Track the futex hash bucket.")

f9c3465f79b97231 6df37a9175b2332651f820dabcf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    249211 ±  5%     -12.6%     217791 ±  4%  meminfo.Mapped
      0.73            -0.1        0.65 ±  2%  mpstat.cpu.all.usr%
    171009 ±  4%      -8.5%     156505 ±  2%  vmstat.system.cs
 4.397e+08          +182.3%  1.241e+09 ±122%  cpuidle..time
  11572000 ±  3%     +44.7%   16746422 ±  3%  cpuidle..usage
      2395 ±  2%     +20.5%       2886 ±  2%  sched_debug.cpu.avg_idle.min
     19.17 ±  6%      -7.6%      17.72 ±  5%  sched_debug.cpu.clock.stddev
    117008 ±  3%      -7.6%     108083 ±  4%  sched_debug.cpu.nr_switches.avg
     17533 ± 44%     -65.6%       6031 ± 28%  numa-vmstat.node2.nr_mapped
     12394 ± 42%     -56.5%       5385 ± 26%  numa-vmstat.node2.nr_slab_reclaimable
    531719 ± 69%     -98.4%       8326 ±198%  numa-vmstat.node2.nr_unevictable
    531719 ± 69%     -98.4%       8326 ±198%  numa-vmstat.node2.nr_zone_unevictable
    564.17 ± 27%     -40.5%     335.80 ± 30%  perf-c2c.DRAM.local
     31523 ±  2%     -10.1%      28329 ±  3%  perf-c2c.DRAM.remote
     24225 ±  2%     -10.6%      21654 ±  3%  perf-c2c.HITM.remote
     37087            -9.1%      33705 ±  4%  perf-c2c.HITM.total
  12683598           +19.3%   15128378 ±  2%  will-it-scale.224.threads
      0.11 ±  4%     +23.5%       0.14        will-it-scale.224.threads_idle
     56622           +19.3%      67536 ±  2%  will-it-scale.per_thread_ops
  12683598           +19.3%   15128378 ±  2%  will-it-scale.workload
     49577 ± 42%     -56.5%      21544 ± 26%  numa-meminfo.node2.KReclaimable
     69331 ± 43%     -65.6%      23847 ± 28%  numa-meminfo.node2.Mapped
   2778125 ± 52%     -73.5%     737515 ± 24%  numa-meminfo.node2.MemUsed
     49577 ± 42%     -56.5%      21544 ± 26%  numa-meminfo.node2.SReclaimable
    137905 ± 13%     -26.0%     102005 ±  6%  numa-meminfo.node2.Slab
   2126878 ± 69%     -98.4%      33306 ±198%  numa-meminfo.node2.Unevictable
    493659            -2.8%     479977        proc-vmstat.nr_active_anon
    197492            -0.8%     195981        proc-vmstat.nr_anon_pages
   1173403            -1.0%    1161422        proc-vmstat.nr_file_pages
     61995 ±  5%     -12.5%      54220 ±  5%  proc-vmstat.nr_mapped
    297145            -4.1%     284994        proc-vmstat.nr_shmem
    493659            -2.8%     479977        proc-vmstat.nr_zone_active_anon
     18032 ± 54%     +96.1%      35368 ± 26%  proc-vmstat.numa_pages_migrated
     18032 ± 54%     +96.1%      35368 ± 26%  proc-vmstat.pgmigrate_success
      0.05 ± 12%     +20.0%       0.06 ± 11%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.08 ±  4%     +20.0%       0.10 ±  6%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      7.89 ± 68%     -52.1%       3.78 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.78 ±  4%     +18.6%       4.49 ±  4%  perf-sched.total_wait_and_delay.average.ms
    453207 ±  4%     -13.2%     393197 ±  4%  perf-sched.total_wait_and_delay.count.ms
      3.77 ±  4%     +18.7%       4.48 ±  4%  perf-sched.total_wait_time.average.ms
      4.39          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1344          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    442497 ±  4%     -13.9%     381078 ±  4%  perf-sched.wait_and_delay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
      1542 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.33 ± 15%     -40.6%       1.38 ± 35%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    554.50 ±190%     -99.3%       3.91 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.shmem_alloc_folio
      1541 ±  6%     -18.3%       1260 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.06 ± 76%    +931.0%       0.66 ± 77%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
    367.70 ±118%     -97.8%       7.94 ±145%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1.70 ±  7%     +25.1%       2.12 ±  3%  perf-stat.i.MPKI
  38930792 ±  7%     +23.5%   48074667 ±  3%  perf-stat.i.cache-misses
  69228168 ±  5%     +19.5%   82708343 ±  2%  perf-stat.i.cache-references
    172005 ±  4%      -8.4%     157491 ±  2%  perf-stat.i.context-switches
    295.15            +1.7%     300.20        perf-stat.i.cpu-migrations
     21924 ±  7%     -21.1%      17292 ±  5%  perf-stat.i.cycles-between-cache-misses
      0.01 ±  2%     -23.4%       0.01 ± 18%  perf-stat.i.metric.K/sec
      1.69 ±  7%     +25.4%       2.12 ±  4%  perf-stat.overall.MPKI
     56.10            +1.9       58.02        perf-stat.overall.cache-miss-rate%
     21862 ±  7%     -20.2%      17448 ±  4%  perf-stat.overall.cycles-between-cache-misses
    546682           -16.5%     456641 ±  2%  perf-stat.overall.path-length
  38798683 ±  7%     +23.5%   47912740 ±  3%  perf-stat.ps.cache-misses
  69090235 ±  5%     +19.5%   82560051 ±  2%  perf-stat.ps.cache-references
    171454 ±  4%      -8.4%     156978 ±  2%  perf-stat.ps.context-switches
    293.82            +1.6%     298.66        perf-stat.ps.cpu-migrations
     58.45            -0.6       57.80        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_wake.do_futex.__x64_sys_futex
     58.50            -0.6       57.86        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     58.72            -0.4       58.28        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.36            +0.1       99.45        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.36            +0.1       99.46        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.32            +0.1       99.42        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.32            +0.1       99.43        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.26            +0.3       40.60        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
     40.25            +0.3       40.59        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait
     40.35            +0.5       40.84        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     40.58            +0.6       41.14        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     40.59            +0.6       41.14        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.49            +0.6       41.06        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     58.72            -0.4       58.28        perf-profile.children.cycles-pp.futex_wake
     98.73            -0.3       98.41        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     98.79            -0.3       98.48        perf-profile.children.cycles-pp._raw_spin_lock
      0.37 ±  2%      -0.1        0.29 ±  3%  perf-profile.children.cycles-pp.pthread_mutex_lock
      0.12 ±  3%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__schedule
      0.08 ±  4%      -0.0        0.06        perf-profile.children.cycles-pp.schedule
      0.09 ±  5%      -0.0        0.07        perf-profile.children.cycles-pp.futex_wait_queue
      0.09 ±  4%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.08 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.08 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.08 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.06 ±  9%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.futex_q_unlock
     99.39            +0.1       99.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.38            +0.1       99.48        perf-profile.children.cycles-pp.do_syscall_64
     99.32            +0.1       99.42        perf-profile.children.cycles-pp.do_futex
     99.32            +0.1       99.43        perf-profile.children.cycles-pp.__x64_sys_futex
      0.00            +0.2        0.18 ±  2%  perf-profile.children.cycles-pp.futex_hash_priv_put
      0.02 ±142%      +0.2        0.25 ±  8%  perf-profile.children.cycles-pp.futex_hash
     40.35            +0.5       40.84        perf-profile.children.cycles-pp.futex_q_lock
     40.58            +0.6       41.14        perf-profile.children.cycles-pp.__futex_wait
     40.59            +0.6       41.14        perf-profile.children.cycles-pp.futex_wait
     40.49            +0.6       41.06        perf-profile.children.cycles-pp.futex_wait_setup
     98.28            -0.3       97.97        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.37 ±  2%      -0.1        0.28 ±  3%  perf-profile.self.cycles-pp.pthread_mutex_lock
      0.12 ±  4%      -0.0        0.11 ±  6%  perf-profile.self.cycles-pp.futex_wake
      0.05 ±  8%      +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.futex_q_unlock
      0.00            +0.2        0.17 ±  2%  perf-profile.self.cycles-pp.futex_hash_priv_put
      0.02 ±142%      +0.2        0.25 ±  8%  perf-profile.self.cycles-pp.futex_hash





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

