Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50C46433
	for <oe-lkp@lists.linux.dev>; Fri, 28 Jun 2024 05:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552734; cv=fail; b=ig9cgSnWlATdooTtb8yxkiM+sFUpvw0GyVBYhop0T0pdI1XHZKQaRGH0pL+mGV55dDXbbHjeVCR1a3/fLMo7VmmRjAS9JmmpcPwBdzAQYO/UKszzeV3zygxU78L1Huu2aQ/fmYwZghGWRiLrEUdm7Top0jXbOKzRL0+sQRXrc80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552734; c=relaxed/simple;
	bh=Saz6p2wDUSWlVBy0Hj/6ak5VHbAt+rpAYuGMTLssykE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=osz58tteU0W+QiJg0RbuhYZ+teIPRLfUy1Sjn7QRpwJm9smAZ54ug9/qaMrxzgBjim5cTmmrQxE+odCd3ibQvWeMpdy6TahKeFMntEDipbhOK/gTWl8NfoAraQEbVW/XqdL4JrD2E4JhDPC+Cq4VgLMjnLZ3dk81YicLXmwbntw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5XQzg80; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5XQzg80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719552732; x=1751088732;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Saz6p2wDUSWlVBy0Hj/6ak5VHbAt+rpAYuGMTLssykE=;
  b=P5XQzg80aea7u0niicYqc9/U8geVqqS9ignDDVhroAR/nIEPBj4Ay4hU
   i329iSchMLk3RvEvOZM3Hc12w0ipI54vDHDuB1dJDVp8ddmCizyNRkmz8
   flA1qFt9X2x58egde+NPCejZLe6nx9qHQqrwdBlY7+R3O/btG8/dziDnD
   jBK/m2zVyoxkV42siyWT7v8OPjOkSJIFtmlQqtqY9euFj2/ZCwlNV7kiU
   RvHtlw1JMjGZvN5u2FJOlISE8bsLqgzvLs1mXko/CLLM9JIyfnhBck/Ls
   0uts4U+KIUCu/O//VQ7z+e0esSI7/x7I7BfTuhM01lYDjCNsl8hkfyB+l
   A==;
X-CSE-ConnectionGUID: qqSB25RIQ/qC9cRzYlns6g==
X-CSE-MsgGUID: iMyxwf0XSMGVLej4gABB4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="19621538"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="19621538"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 22:32:11 -0700
X-CSE-ConnectionGUID: PVprC4beS2WQg1hvouuLaQ==
X-CSE-MsgGUID: UXvNzjPiSL6vOlcWJonmuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="49584990"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jun 2024 22:32:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 22:32:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 22:32:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 22:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4I/6W5rfGhwVyhJ5+oYjrzzZ9AV5b7TR/9Z7G/PyrZNFeIPSVvo/w3tJ8pHobV5pfU0Je4efpO86lQkui1jXMgBqhYe/twP2nQKzzLO/BOzovNcYiwFW5BD392ji89I8l4tUfwShNAR/UfdzEswxcNQBrcnvfEK07roKF1KC39DFYnPaHV3RkeCXFZ1K+BVYVWGBmVLZbC5nr+lH5u9lg7UWUU052J7OPQ4Vr6TYcQW36UVV0c8l9WHVl442W201VTng/AGZhCpC46mTNraqB5f7HQr/tMVJswBNbqkf6Yy1JmpGQljF/MNXpJYicd4hVarn1zWH+nh7A/s2++lNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAYqfJpT9ifZ+3hoMM8y9iIdY+A7ShLjaciLSnmP0+M=;
 b=YNWz/reYXKdYNF7t+aFxj8UW4oI0EtzK0a57fZ+FJjvBbOCeDHIyCgZAJA9x7RN2Yk7ZHrIHHwTW6Iqf+wa9MxFBQiNkgs/21uymRusCkK47FY1xqE5jtEGmYtJqn4ncourBJPkGd/6ZJJr4bda9Iz0QBvPAcMkWvpaj5cFHaTDWr9OYmSoiUBkhRPod+cxY3AmflV7d5OiMH/n6n5hgyDnR0gS6dFiObiHQ/stxCgrvQ8SIoVOqdK0phFclzr5bGuAZhU3FlwbDIQtsNyVxp5uSsdHqfBoqG3m7ZxTjv+l+R8jI9HidziF4SGhwUfFPBOXmJFuCYM134M8MBZdoXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 05:32:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 05:32:07 +0000
Date: Fri, 28 Jun 2024 13:31:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <deshengwu@tencent.com>,
	<flyingpeng@tencent.com>, <jason.zeng@intel.com>, <wu.zheng@intel.com>,
	<yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [mbuf]  07131e4097:  hackbench.throughput -24.3%
 regression
Message-ID: <202406281349.948dca73-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0106.apcprd02.prod.outlook.com
 (2603:1096:4:92::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2fe6f1-fbb1-43af-30bc-08dc9733a691
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vmb4ePZSHCn1df1nYhncPsXQNGetxLHydGFbZUN68mfaTGFaD7Jhx9wPgd?=
 =?iso-8859-1?Q?Q6iJgVf+BP2e91imf68mYlUe2XwH4JghM4M7iwV5FaHasFFDBL1hDbW5fW?=
 =?iso-8859-1?Q?5sorheSvr9tHgL0MGEHIMrmmg9F0C3mWZBh1u00fZnJPt1s3LgVgXxKvBm?=
 =?iso-8859-1?Q?At3xRL6rO2W6TeHAG58KqLfPWXBSqEl4NXR0W0ZipUKL4WE9ShTyOrNjvZ?=
 =?iso-8859-1?Q?vKrmlP/FjRy2u/pG2eub1QakLfFtpYYgK4tmR1IAxIpeg86sRD7kDkj0A5?=
 =?iso-8859-1?Q?4iysUA5jAbtCzHB3OxA9r3ScZ1LuJd9/x8uo6tg8bZT98NqCTUu8h5ieOa?=
 =?iso-8859-1?Q?tmn2RDg8KevqFhR3sEjm9bAJhbQj/wE5lV4tXNlw+OFvy2c1gkeyt93JOD?=
 =?iso-8859-1?Q?pJInwgC23E5nJhKZwnApqolrQ2rW5SS1CvFbpbVJQXw1ZIzQ+7ve4NijjU?=
 =?iso-8859-1?Q?/h2UYBn8RUmetgEV7814B5ppiGUN0lm5ViDjBQ2bXlwiuOYmphEDcaQXW8?=
 =?iso-8859-1?Q?oUCoSoKYiBQYaFPpdESVGWpIQw+cDW3sXRnDgRkcaFMSCxEJ1VVdlAuMzB?=
 =?iso-8859-1?Q?209uM1Dk89q40em5rJzLwDsz6FgmTWLI5jBvrXWcZmLKxj0CthENh0pafO?=
 =?iso-8859-1?Q?gel4ufd39eKpVUWQisY5ou3TvrYC6+YqxDq5Tcb8Lhxo+Wxo6asdH5sNFk?=
 =?iso-8859-1?Q?YE6gKNZIKI8ZPlVjnMLFS6CkwR0khW3U9/4Q7EUbIOQbYX7+dVnMKjzPyj?=
 =?iso-8859-1?Q?faHOtUHW8BfXltxE964t2uvgCXXxqqK+TKy1lMlALM1sjNq26SsJBjhlnR?=
 =?iso-8859-1?Q?5D/vKflXox5nnj+Cmwrab9ndhIACQTG7g7zeCGWozSD3YBKiprmkHgABRm?=
 =?iso-8859-1?Q?QX1nxFcA1D903Fs/mZF9S9xlwuQ1dkjvEgBqzPW61vOsT93SRxysy0VMBk?=
 =?iso-8859-1?Q?he2zdem4BIx4EHoRG9ntsdM01zTkbjHoF7QkZ2cVSZhqdVlXp8SdaCsk+1?=
 =?iso-8859-1?Q?88OR2o+BzKcDIhmU8RoIdQlQLrXHWxCOi+ri+B6cJgNbC/PScXxRZ1ueWc?=
 =?iso-8859-1?Q?bhf2yHQ8lTRlSd5ripS8mcvSWD9s4IRO4+GX1DTAbLEwgiqK5o5mUXfboT?=
 =?iso-8859-1?Q?+/FZsZn9C6+YrbsOINxfz1hk3WEkAhxqE8YUx8ymn8iiE8C5tT096S3yBq?=
 =?iso-8859-1?Q?3VGIFMGGfJmiDdlGOUi9dEynt6uiFCSZtegBuXF8UqVkb06NdVEmGtQy6T?=
 =?iso-8859-1?Q?uFdS4bM1fzJZxioqbR5nP2U7T7GbnIHeE3Xmbt1wciwhjXFCPJLOVvnMTv?=
 =?iso-8859-1?Q?fAfQ78DqJQ8M6G9xsnGhgWwaAntumG6C1j+J6NXpVIfgGD0TpoIDAdKLOZ?=
 =?iso-8859-1?Q?XlQCye25D3LqXrzNQUNCd/iQyQfPSp/2+RDL8iaPzw3Pkd/CtBk6Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wgQFcBpRXUz69+RUcpI/XQbLIb3LPwPskQBcg6llyFpiPN1ybLnxqFbXBM?=
 =?iso-8859-1?Q?EjMoqjvA+wxJPZ8l7hZX5kmIy58aZrBlBI12Cw276k3tH4KSc2Rxcl3hzZ?=
 =?iso-8859-1?Q?t2c2v4JsiL2ZCayVcIlpwZxXJmspAI0OxHaq1qyuO/x5QhpNOETY0+QNgJ?=
 =?iso-8859-1?Q?54oTXV6l+Vr4N2SexZ2APlKsg2kJIB70qB1KOQRhmr5c4si+oLLSyHN2+x?=
 =?iso-8859-1?Q?6VIn7p7KNwmMQwUvuXojNLjTdpCcUy7RPSoG0luALacTLzb1WMhpFthJV5?=
 =?iso-8859-1?Q?Ql73msvKQ/Og6G4yjldTdb7j7b5PhvIsfBdZ2hBkiz4UA4saTxuqdZH8wA?=
 =?iso-8859-1?Q?qI1BIcft2TzuMMeCZlffTiIvJ00dY/GrDWMXbOueDDA8JG5Ps3g80d1+j/?=
 =?iso-8859-1?Q?f5h2R8UMsiGAj7PJdXUv1O/YOSdAME9MjdmfNXx6KqYr2OVlDD5R+BK1jI?=
 =?iso-8859-1?Q?LVLQqWIC2SKAkCJYaaQPFmDei6f2pllxJmQoSH1/Mi6YwLwst9H0jVO+zT?=
 =?iso-8859-1?Q?Z16l2Jo7lPZMrQtb4HpelqkhS36mbVPphjMAY0ln/cWWqp6V5SDEr5OBsE?=
 =?iso-8859-1?Q?+vZnHiUYdOh41H6JwtVaTup1vPqJuoBx0JUm//g2cF28cDpyW0QgPdyhkz?=
 =?iso-8859-1?Q?vAJVu1lozaFptBE/epVHgMgdg/TBVWRp4NG0t8CXLTaotB/NdSfLd0EWUl?=
 =?iso-8859-1?Q?2Wq8jUXUjvdPKqCNG5RuWJ7YhQ/L35qyA9QRfCFQXkiQLAgJ+VfZcn9VLi?=
 =?iso-8859-1?Q?bmTF+NYQjPsSt1a/AASY4ls1qx5tBlQoX1KSKBBG8RrenRC2VK4IvUitH2?=
 =?iso-8859-1?Q?IGW6XFJT3Zy3V4IEMHVKz4AIkeBECGDkTBnX37VkeChyrMUwQmLfw4DOV+?=
 =?iso-8859-1?Q?aTcbRM6XcbaF7WM8VdJG9tkJbKowA6NPvm7cBnTisT11ByVNTXzZ45gkPY?=
 =?iso-8859-1?Q?BETAOWa/EaMUpXg3f/ShhKfqA1v65FVmACWThr8EPN5rqNQXsBWXoSW64a?=
 =?iso-8859-1?Q?ST+IxONbxU6jV43SJXQjWhchf3B/OWnMjHZbMyMbxRci7XCdp2NvhicOtl?=
 =?iso-8859-1?Q?cCRMZi7SkfOU2LpqBVobHtPTiD7nAiJo6mSYfA7m4Qk6DP1UMHCNL3JTRc?=
 =?iso-8859-1?Q?ws+YilnbNjX/xk3tzvJqp7Ky4ci6GZGgZVUZa7T0Km7DZsP+rQL+bYIXoY?=
 =?iso-8859-1?Q?l5hZHPhosoPFyhrae+/yVF9Odqh4r4kgj81Eayi48N5/PQt6+r0QLAP1g2?=
 =?iso-8859-1?Q?6pvsfBnwJv5NtT3GC6cUvTkEs5wbFfQhdqPTdzTlto+QYr60AiiMxOY6g9?=
 =?iso-8859-1?Q?eTj1bUMMicKrwT68JCllzceVjVPtY8S46EcONx3LW0crj60Qvyx8to9U0K?=
 =?iso-8859-1?Q?46n8sEo/yG8rGDtl3iPXDfGsQqje1wWClVQiARcLA3bwKSfk/ecBvclWZa?=
 =?iso-8859-1?Q?/aViLI/yfkLlOU+n7rBaAl4HWtknuRg+iMThPVR38jNFW+JyiGqwqU3/Cs?=
 =?iso-8859-1?Q?TiYsnnAI4KDeyGWGC8sGViKDOOIQl3RLaokyoX0dEx0uo5Rs5ZqTS5d0AQ?=
 =?iso-8859-1?Q?s9TFJ3TNx2cNq/CkTUxrtWznViJE9zozOscT9YI0+j2ySjAapgfOjRMeeg?=
 =?iso-8859-1?Q?BnIBwn0g6q5/EFwmXolDvYjYnLrWlG0Vn0iijikndymTwK4mcyx83SOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2fe6f1-fbb1-43af-30bc-08dc9733a691
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 05:32:07.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIMwLwzibadNNOCXaXOh/l7Rfar6WibWsp4Au50prjlcALqV/yPGFng1ulol1nhA8rMRxqTY6TmnTSXIAjnHXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -24.3% regression of hackbench.throughput on:


commit: 07131e40971dc46a24d28e8ba9fdcf3f7266c398 ("mbuf: backport mbuf functions for memcontrol/cpuacct from tk3")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: hackbench
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	iterations: 8
	mode: process
	ipc: pipe
	cpufreq_governor: performance


we found the most change in this commit is wrapped by CONFIG_RQM, however,
the config used for both parent and this commit which is uploaded to [1] does
not include this config:
# CONFIG_RQM is not set

please advise if we must include this config while testing this branch. thanks


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406281349.948dca73-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


[1]
The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240628/202406281349.948dca73-oliver.sang@intel.com


=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-13/performance/pipe/8/x86_64-oc_stream_base_config/process/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/hackbench

commit: 
  63d5ef6b1a ("btrfs: make sure that WRITTEN is set on all metadata blocks")
  07131e4097 ("mbuf: backport mbuf functions for memcontrol/cpuacct from tk3")

63d5ef6b1a20a2c8 07131e40971dc46a24d28e8ba9f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  29145324 ±  7%    +193.6%   85561293 ± 81%  cpuidle..usage
     13.86 ± 50%      -5.2        8.65 ±  9%  mpstat.cpu.all.idle%
      0.02 ± 11%      +0.0        0.03 ± 41%  mpstat.cpu.all.soft%
     48132 ± 25%     -73.6%      12724 ± 95%  perf-c2c.HITM.local
     37775 ± 25%     -57.5%      16052 ± 54%  perf-c2c.HITM.remote
     85907 ± 25%     -66.5%      28777 ± 72%  perf-c2c.HITM.total
    356.33 ± 28%   +1168.7%       4520 ±153%  proc-vmstat.numa_pages_migrated
   3510080 ±  2%      +6.9%    3750764 ±  3%  proc-vmstat.pgfault
    356.33 ± 28%   +1168.7%       4520 ±153%  proc-vmstat.pgmigrate_success
    245.60 ± 27%     +77.3%     435.38 ± 48%  sched_debug.cfs_rq:/.avg_vruntime.stddev
    659.07 ± 50%    +123.2%       1471 ± 61%  sched_debug.cfs_rq:/.left_vruntime.avg
    245.60 ± 27%     +77.3%     435.39 ± 48%  sched_debug.cfs_rq:/.min_vruntime.stddev
    659.23 ± 50%    +123.2%       1471 ± 61%  sched_debug.cfs_rq:/.right_vruntime.avg
     62.68 ± 48%     +84.8%     115.83 ± 32%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     39.08 ± 81%    +375.3%     185.74 ± 62%  sched_debug.cpu.clock.stddev
    202.78 ± 20%     +62.2%     328.87 ± 29%  sched_debug.cpu.clock_task.stddev
      0.00 ± 73%    +367.0%       0.00 ± 58%  sched_debug.cpu.next_balance.stddev
   3353056           -24.3%    2538341        hackbench.throughput
   3190453           -29.8%    2240539 ± 14%  hackbench.throughput_avg
   3353056           -24.3%    2538341        hackbench.throughput_best
   2768362 ±  4%     -32.1%    1880416 ± 28%  hackbench.throughput_worst
     80.45           +43.0%     115.04 ± 16%  hackbench.time.elapsed_time
     80.45           +43.0%     115.04 ± 16%  hackbench.time.elapsed_time.max
 1.153e+08 ±  4%     +24.1%  1.431e+08 ±  6%  hackbench.time.involuntary_context_switches
     16453           +48.3%      24393 ± 14%  hackbench.time.system_time
 4.583e+08 ±  4%     +33.3%  6.109e+08 ± 15%  hackbench.time.voluntary_context_switches
     28.09 ±  2%      +3.5       31.55        perf-stat.i.cache-miss-rate%
 4.285e+08 ±  8%      +8.1%  4.633e+08 ±  3%  perf-stat.i.cache-misses
    438317 ±  9%     +45.1%     635850 ± 29%  perf-stat.i.cpu-migrations
      0.97 ±  6%     -21.2%       0.77 ±  3%  perf-stat.i.ipc
     22.44 ± 14%     -36.7%      14.20 ± 27%  perf-stat.i.major-faults
      0.56 ± 44%     +73.2%       0.96 ± 18%  perf-stat.overall.MPKI
      0.11 ± 44%      +0.1        0.17 ± 16%  perf-stat.overall.branch-miss-rate%
     23.29 ± 44%      +8.0       31.33        perf-stat.overall.cache-miss-rate%
      0.82 ± 44%     +58.8%       1.30 ±  2%  perf-stat.overall.cpi
 3.481e+08 ± 45%     +30.3%  4.536e+08 ±  3%  perf-stat.ps.cache-misses
    348183 ± 45%     +78.2%     620512 ± 31%  perf-stat.ps.cpu-migrations
     21.67 ± 30%     -19.6        2.07 ±212%  perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
     21.38 ± 34%     -19.3        2.03 ±212%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
     20.75 ± 35%     -18.7        2.03 ±212%  perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
     25.21 ± 30%     -16.7        8.48 ± 99%  perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record
     25.20 ± 30%     -16.7        8.48 ± 99%  perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record
     25.16 ± 30%     -16.7        8.47 ± 99%  perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
     18.53 ±  8%     -12.0        6.51 ±105%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     18.53 ±  8%     -12.0        6.51 ±105%  perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
     17.91 ±  8%     -11.5        6.46 ±105%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.do_exit.do_group_exit.get_signal
     17.91 ±  8%     -11.5        6.46 ±105%  perf-profile.calltrace.cycles-pp.task_work_run.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
     17.63 ±  9%     -11.2        6.38 ±105%  perf-profile.calltrace.cycles-pp.perf_event_release_kernel.perf_release.__fput.task_work_run.do_exit
     17.63 ±  9%     -11.2        6.40 ±105%  perf-profile.calltrace.cycles-pp.perf_release.__fput.task_work_run.do_exit.do_group_exit
     16.57 ± 10%     -10.6        5.94 ±105%  perf-profile.calltrace.cycles-pp.event_function_call.perf_event_release_kernel.perf_release.__fput.task_work_run
     16.55 ± 10%     -10.6        5.94 ±105%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_event_release_kernel.perf_release.__fput
      2.38 ± 54%      -1.6        0.73 ±118%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.67 ± 31%      -1.6        1.06 ±113%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      2.15 ± 36%      -1.4        0.75 ±117%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.28 ± 34%      -1.4        0.89 ±112%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.28 ± 34%      -1.4        0.89 ±112%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      2.14 ± 16%      -1.2        0.93 ±102%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.12 ± 14%      -1.2        0.93 ±102%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.14 ± 31%      -0.7        0.44 ±105%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
     22.71 ± 25%     -20.6        2.08 ±212%  perf-profile.children.cycles-pp.process_simple
     21.77 ± 31%     -19.7        2.03 ±212%  perf-profile.children.cycles-pp.ordered_events__queue
     21.39 ± 34%     -19.4        2.03 ±211%  perf-profile.children.cycles-pp.queue_event
     27.57 ± 21%     -19.1        8.51 ± 98%  perf-profile.children.cycles-pp.reader__read_event
     27.57 ± 21%     -19.0        8.52 ± 98%  perf-profile.children.cycles-pp.perf_session__process_events
     25.21 ± 30%     -16.7        8.48 ± 99%  perf-profile.children.cycles-pp.record__finish_output
     20.74 ±  9%     -12.9        7.88 ±102%  perf-profile.children.cycles-pp.do_exit
     20.74 ±  9%     -12.9        7.88 ±102%  perf-profile.children.cycles-pp.do_group_exit
     18.59 ±  8%     -12.1        6.52 ±105%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
     18.53 ±  8%     -12.0        6.52 ±105%  perf-profile.children.cycles-pp.get_signal
     18.78 ±  9%     -11.7        7.10 ±103%  perf-profile.children.cycles-pp.__fput
     18.40 ±  9%     -11.4        6.96 ± 98%  perf-profile.children.cycles-pp.task_work_run
     19.15 ±  9%     -11.3        7.86 ± 78%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
     17.63 ±  9%     -11.2        6.40 ±105%  perf-profile.children.cycles-pp.perf_event_release_kernel
     17.63 ±  9%     -11.2        6.40 ±105%  perf-profile.children.cycles-pp.perf_release
     19.28 ±  9%     -10.8        8.44 ± 67%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
     16.59 ± 10%     -10.6        5.95 ±105%  perf-profile.children.cycles-pp.event_function_call
     16.57 ± 11%     -10.6        5.95 ±105%  perf-profile.children.cycles-pp.smp_call_function_single
      5.68 ± 26%      -3.4        2.32 ±106%  perf-profile.children.cycles-pp.asm_exc_page_fault
      4.52 ± 29%      -2.7        1.85 ±105%  perf-profile.children.cycles-pp.exc_page_fault
      4.50 ± 29%      -2.7        1.84 ±106%  perf-profile.children.cycles-pp.do_user_addr_fault
      4.22 ± 28%      -2.6        1.58 ±108%  perf-profile.children.cycles-pp.handle_mm_fault
      4.06 ± 29%      -2.6        1.48 ±110%  perf-profile.children.cycles-pp.__handle_mm_fault
      2.37 ± 29%      -1.5        0.90 ±111%  perf-profile.children.cycles-pp.do_fault
      2.14 ± 29%      -1.3        0.80 ±113%  perf-profile.children.cycles-pp.do_read_fault
      2.03 ± 32%      -1.3        0.76 ±112%  perf-profile.children.cycles-pp.filemap_map_pages
      0.92 ± 26%      -0.7        0.27 ±103%  perf-profile.children.cycles-pp.__lookup_slow
      1.03 ± 24%      -0.6        0.45 ±103%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.86 ± 27%      -0.6        0.30 ±110%  perf-profile.children.cycles-pp.d_alloc
      0.37 ± 52%      -0.2        0.13 ±126%  perf-profile.children.cycles-pp.copy_pte_range
      0.02 ±223%      +0.2        0.23 ± 48%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.04 ±141%      +0.2        0.26 ± 38%  perf-profile.children.cycles-pp.__get_user_8
      0.08 ±141%      +0.8        0.90 ± 86%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.42 ± 46%      +0.9        1.33 ± 48%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.26 ± 56%      +2.2        2.46 ± 87%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.10 ±143%      +2.9        2.98 ±129%  perf-profile.children.cycles-pp.__mutex_lock
      0.45 ± 57%      +3.2        3.70 ± 83%  perf-profile.children.cycles-pp.mutex_lock
      0.17 ± 65%      +3.6        3.82 ± 87%  perf-profile.children.cycles-pp.schedule
      1.39 ± 32%      +4.1        5.46 ± 61%  perf-profile.children.cycles-pp.__schedule
      0.00            +6.6        6.62 ±134%  perf-profile.children.cycles-pp.atime_needs_update
      0.04 ±141%      +6.8        6.79 ±132%  perf-profile.children.cycles-pp.touch_atime
      0.06 ±147%     +16.5       16.58 ±101%  perf-profile.children.cycles-pp.pipe_write
      0.10 ±109%     +16.8       16.92 ±103%  perf-profile.children.cycles-pp.pipe_read
     51.52 ± 17%     +17.9       69.43 ± 17%  perf-profile.children.cycles-pp.do_syscall_64
      2.05 ± 11%     +17.9       19.97 ± 81%  perf-profile.children.cycles-pp.vfs_write
     51.56 ± 17%     +18.4       70.01 ± 18%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.05 ± 11%     +18.5       20.56 ± 81%  perf-profile.children.cycles-pp.ksys_write
      2.09 ± 13%     +22.2       24.29 ± 83%  perf-profile.children.cycles-pp.write
     21.12 ± 35%     -19.1        2.03 ±212%  perf-profile.self.cycles-pp.queue_event
     16.46 ± 11%     -10.6        5.87 ±105%  perf-profile.self.cycles-pp.smp_call_function_single
      0.23 ± 54%      -0.2        0.05 ±108%  perf-profile.self.cycles-pp.fput
      0.00            +0.1        0.10 ± 49%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.04 ±141%      +0.2        0.24 ± 38%  perf-profile.self.cycles-pp.__get_user_8
      0.04 ±141%      +0.7        0.74 ± 95%  perf-profile.self.cycles-pp.__schedule
      0.08 ±141%      +0.8        0.89 ± 86%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.10 ± 82%      +1.0        1.15 ± 88%  perf-profile.self.cycles-pp.read
      0.38 ± 52%      +3.0        3.34 ± 83%  perf-profile.self.cycles-pp.mutex_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

