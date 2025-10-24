Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44C1DB127
	for <oe-lkp@lists.linux.dev>; Fri, 24 Oct 2025 02:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273771; cv=fail; b=h/Mrq+X3ju6EGKD6b/xPojaLYhAUAW8F/96+gCW7f6lOct3ZzNVsCDmjUNzPwmmD192D7vjSdZsSL+eqZF2BCMkOYL8S4izV2HCloaeDXosnSlnscedWcsbqRWWpx8nw3Jz97/H8FsM6i6Mw0DptTaYZIHWcEbcNG2Ce/YcXurw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273771; c=relaxed/simple;
	bh=bjgQM7NcTjjgDX6ai6ARUfayGKOQRO1RRx7RR8+eqiE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Q2d8P80CKg5uw6BG08CVmDLJ5Mz5zGBF6XqfbwIKRhmM8YHy5eWdxb1hnikPIEf7qggObJUeuLmMjxJK9yfOEvtLdA0342YAR+81A7mGOjVd6cmvRZTZkaR1W7+NezjMVJJmd4j5EoATkrxZsdge7XzI/W5bvCs+FWm40VTqRkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx3Kw5e1; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx3Kw5e1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761273769; x=1792809769;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=bjgQM7NcTjjgDX6ai6ARUfayGKOQRO1RRx7RR8+eqiE=;
  b=hx3Kw5e1JlbDy2VusisAHYt0DaaG6yGI/9A9z0e/5ErPHwzJBt3iUtco
   GUKoxApZtsqLZH81EWDWlFJZOYN+LQYjN33T7lQRREsBSIGsq8nofmlno
   ITzk3eT1CYvZtJ1wtq0U1vaafxzfNH94AaKWRWhaRKEF84kOQD28tCFH1
   QtaXxxp5eWSUn2GLxpm/U3pf0owUzbu/lZxsZOHIQhShru6j9rVR7lOCd
   r+RoRjatBiwhYK1n0laLlsjMAK1br5O0N9EggGwLX6h/rTEFOMjq2xOzX
   nKty1z3BamoCJyPQx4w5wZu8VQX715F2GAe2f4go+KGi0T1iDE3YS4/AN
   g==;
X-CSE-ConnectionGUID: vZ84uz6nSv+9ym6zNd0zaA==
X-CSE-MsgGUID: eDjWe6oKSamIIeMkluC5vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74058361"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74058361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 19:42:47 -0700
X-CSE-ConnectionGUID: AbE0+SNyRB63Zz/FyXaOMA==
X-CSE-MsgGUID: yH3a6fkNQCypLKNChcb4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="215241805"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 19:42:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 19:42:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 19:42:46 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 19:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVO1tPskRLgO3IckBKRWnCP1/q6OCI72cHsDkK+lMoj1RkYWWcU/XLMJLBYtSqx/8yv1deIfpGaZAmm2hNc6looS/sB+Rzt6PhvZvy3u8Nm1So89a9oZEjmN2RwjKszDGPelahjCtJO/2oRbVNKx3JHSlZgp6joNbkIXNaVfqxwAMNop1uiZWzMTCdB/k7xrFFPlxhOeCBGNDFEyIjVwJU3pkyefqkLY7sm37kqqJw2xRHQIY/6a31ZSTxTrKLTco4PQ5sqgo09rPIRe40E31q7OXkLTAfEIYFOoNtThdxhnzS5I1J1KOGbA+oCOWGbhhJ9QGPYRZTYM7QQiEzaFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV2mNbao3LXk2aPe8/34ll6f8a4/B9+Rfd7tYa+Bjbk=;
 b=SKs7sTknyBaymjpmRAlFWbWKa/8zFpnHU8H327UUwSMbNvXWW5iPpCcMqgcePoK/JCNyc6hJffQx+176BU+6VKpHIiby7wcKbfvp2Y1Ib8JUFbYhLlqJDW2KzohSgZJnky1sTKgn0jUNrvD6sc9f68RCbql/LlkvSxkJj20jUwJZ5z+AGAdBVwFhj7FBOV3PTn5X0DDtFpGIW+ROs+4uRqlpy6g/KswbyWyKBs9DesjIETH/up8qw7UqqQw/8zFPCKxG9M9BgusOKJJ7faGItQ3jHihMzw8MvpWfgHMH0zSW6dR6T5OzooS2pDv8qkZ8v8IfllfnYxbKiP9jpdq50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:42:39 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:42:39 +0000
Date: Fri, 24 Oct 2025 10:42:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [memcg]  08499e8c4a:
 vm-scalability.throughput 29.6% improvement
Message-ID: <202510241006.51895f3e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0054.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 8769f8f2-142f-427e-ee5a-08de12a6ff8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HS8tewzPPvIWeOqMiRi67FRklCHhrG7E+JYU9G5Qebh3tJm8y90HFrIaRb?=
 =?iso-8859-1?Q?149LPlnJLSGY9pAfvAvS8GZw2AMQZsTQaP4n4R/F60j0dBSXeJANV/Bb4O?=
 =?iso-8859-1?Q?Sy6QTLXTtgDGyW321x1Nrq/M5XCdE+S8lFxrBs8O225p5QLrhTpFMnf0uz?=
 =?iso-8859-1?Q?uUWfViqDVrO6eL9vWb6ReMZ+aKBez9pqLQNPxrbuzaPjn14TyMA5E/ICsq?=
 =?iso-8859-1?Q?AX/GMdjHlrqe/Ka07x92ttt0Ev0DqJU/3EbSJPPrWsDR07Qo2Oixfpi/hd?=
 =?iso-8859-1?Q?8UErRiKDeXb4DeiktGorNQjWKQJaTcQNmOe1zA2k+elXE91fwdRHahkYWz?=
 =?iso-8859-1?Q?6ZAyxbsTDd8idu7V/2jkFiAzNJoPyxij51Eu3Dh6NPoQREKJSOrEFZ2MAL?=
 =?iso-8859-1?Q?jN0PejQvtUcJm4oxExFvGS/d2sPum4cxLfYDQzyML9vAchks6Ck7h0dlWd?=
 =?iso-8859-1?Q?aVx8+TlrvdHgAzDGOCKh287ZuJ6YDCKj6kjnwBLIp2HtaztswGc489Q7Vu?=
 =?iso-8859-1?Q?+lzbYBei6YHK8RuYh0EfDQZ7TcahgAVZNnnJxTXD18txJGI30mdKnziRpi?=
 =?iso-8859-1?Q?Q4IS+RnV2mqSdDRQQnxEEW5/Qv2VYr7mC45rJX+Tnz2EOn5S2rCt1dp4Ih?=
 =?iso-8859-1?Q?NE3QsjadYf9KeFR1XE7FLwY+ESF0EM6iadZgJnXJYMpVpY1g/T02KmLi7I?=
 =?iso-8859-1?Q?wZH7aAaTjiBLe0PPbUstL5pn/hpLFzG2E81bTyXpSAopqZdmfSIcMB4mb5?=
 =?iso-8859-1?Q?9tXpV+AwZxnSDM8j+ElOjeP3T+/HFFU09h/2JRxXX+kZyxQS76/drEDHjD?=
 =?iso-8859-1?Q?GRdtPQqIBVHHZ09iNI5u6BZgx4XQAXKzQ4niENUfTXkBP19edAM0KQ3Ij+?=
 =?iso-8859-1?Q?zXpSmO/YbKTcXvxsHHA14/7pmWmshwSYu7D0IogTWFVecPpssiNlnPUElT?=
 =?iso-8859-1?Q?yO2PBFNgbhpIWCMe/ofIsoz7a5mFpwVCMC72JlXs2lK43bGdD/4EEW5JSn?=
 =?iso-8859-1?Q?yxW0K+8xtOJjAw7urnoRYkGNu2QSmJxAqqsPMUzjC+L5YOWkZwos+rmzqq?=
 =?iso-8859-1?Q?vsc4+ZFEziTqZ2ag0KGMdd1j5aksLzzXnV7YfEq4reSu38FohSZJicp9QA?=
 =?iso-8859-1?Q?Ixj5ycyG3u+tzkXfoYHT9npZvnfZ/C+7Z3MIPAVmsyXrHl5++u+HgPRZWv?=
 =?iso-8859-1?Q?a2jrpJOaUkJ1gzHJUd3fXytcaFgYsh7C8ZXNf5ovjwILyaWSoc1Ub2ElIm?=
 =?iso-8859-1?Q?Ap0HMt3ZZVHwdrbw7IGOgGMq2AACS4Ax3HUevGUWIgMwVvJtM31I2BLiYB?=
 =?iso-8859-1?Q?2nU/iQdB8qfYISkksH05bmPlRbDWbrgI4H/jLWwpa/jMZsd8/sibiv3uM/?=
 =?iso-8859-1?Q?RNAy36FeCqY92TTiMrRbfQ+kTPhUhDj9AeRJQthoa2gFBfhriZVpNZjvT2?=
 =?iso-8859-1?Q?WqNFQm+R2B3AEHFbyQyfCsz3WIQvytw8iwydl+Sk0YwKXv0aMthMgQSEAm?=
 =?iso-8859-1?Q?RmKLJu8+1r4vjqVHNHEOBz5XXilhsbv4aTHT3vVtSTAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ie+XMbH5NKrkKKVXQmxaCpvRo70YDNgGJ7HoxlYQfE8Z2aETjYSR1+Am26?=
 =?iso-8859-1?Q?/MTCI7kYi3ROhhCTolcqffNRkCK9HGuz+nCeJo5jsiCqhMixvnFq5j5u+f?=
 =?iso-8859-1?Q?nERHjSY7tCm7LLYd1q/hP1fXRnqCzXmdXQmJlL6VRXHWTPvS+bmh3mqs55?=
 =?iso-8859-1?Q?NFYdApqtLyn7uWNI2UkMbyQkm00PD3Wk6MGEje0cOk+hc+6hXSDVD5GuSO?=
 =?iso-8859-1?Q?Z8QuJIFcTJuN0fUl8nUprtdXhuk1vRT+ilHDLXQgem93h0rAuRWidelBJi?=
 =?iso-8859-1?Q?S700tTCqr6g/HDFQdKMta/66qMEWwmcSbhswhrO2iFl1MgeAp5ZFe5wt8S?=
 =?iso-8859-1?Q?rIpWk/WH9qL1E36yK0hs2HXj9BGoXI1Qli/XpPTJAy+6gGWYmUf8lT3Hm1?=
 =?iso-8859-1?Q?79sEgjR2aAwYeJiRChxHPda4uqXehizK0N1+ghjPwU3qeH3JjHDV0rExaL?=
 =?iso-8859-1?Q?SbPz8J/VXhHD+zO00opamKZe7XRzChWqE6oPB1yfMLeDs+A+jF9n4XibJp?=
 =?iso-8859-1?Q?qH4/XaisZggxZMCDYFs2uVsTpS9M+cL9wM30LWphYQZlNCoc2NojlrYzQh?=
 =?iso-8859-1?Q?T8uIvQkU/KWkw7E53AB66pS6vlbiSR8KS3eY9wxORFXRR8y/7oS+OAqyyO?=
 =?iso-8859-1?Q?o0I5/wDBjWvmuKnftrdYY352GU4qebdGi8Rz7FTM2KteAV8tnyaYn8Knu5?=
 =?iso-8859-1?Q?7HPe99bDgH+1basDtKes2QoFZiAMyBBBTg7A+4w+oV5D0FWrXLxbA+x/wT?=
 =?iso-8859-1?Q?ymTrfXu0z3baztKX3Y+G1bz1P/Ir/C/cs4I/i1e4MaGWXlhadR6UL/0AkH?=
 =?iso-8859-1?Q?Qn/qjvc6g/QrGRuGEwrZ9amG2aFCJfzTwVq/LyfkmHy4sOjCaSJSsGSWDT?=
 =?iso-8859-1?Q?TDVE/AuGzqlqtrWTBLW1fQSoSdpbWFdz5E6VTodxWFVWSuAns7S3d+L9JA?=
 =?iso-8859-1?Q?qZfIn5LGe4XxNhus0uG2zx3zZN1ZQF+y0gM5hi/XlGs3Djlc8GNi88MWms?=
 =?iso-8859-1?Q?zjM4AGyVBDrky42jKhABAahD8WHoBLpdAOk3GbPWzVddZBHGO70jB4ni97?=
 =?iso-8859-1?Q?KszkiJab6nHvP8ndG1hVO0024pjsMkPpGzL2gyaUGA69/oe0nKamdVn0Gl?=
 =?iso-8859-1?Q?dlb/0Hvb0j71OdnbWCpeabwAZsCW1aEQfgdoZMS2fJGv+uuE1PV1tcMYjr?=
 =?iso-8859-1?Q?6EtEYDu2pJhYQCRZD9nwjYokpjecEG5hjXYtpC6C3Ek54mJuNn1zDCGcGK?=
 =?iso-8859-1?Q?xC2l/E3gK4IAeagUib4+RLr2QdV+bdYZ/Ni76ayA6uNOP1gCOcgjTcJbvn?=
 =?iso-8859-1?Q?ZpGhmcFjEYmUfGJ5P9ghA9OS3PZtSkcnRvGOJSmlCgN1K+EGH+dDAQE8dT?=
 =?iso-8859-1?Q?lewNnYNXfiQpLdl1R5hL7YwISu3DWc1kz6am/ilIbqZisOzLdHR/pilDrn?=
 =?iso-8859-1?Q?nJeqhoeEI/Ocrskcon+eOGByZgFidWszUakJ7EUzGbxJMkATE7EPFN9osr?=
 =?iso-8859-1?Q?eCG6ex6qI9QcWAFRvhuvAgsBEaGTnxIkLlrLsF8sLNPDELe2FRvZSoQvrS?=
 =?iso-8859-1?Q?inysVDTKZhvgPtIf0/zOxHqQRTlhnyweNifCzRIVR+GiSI1NA9KZ89zf+4?=
 =?iso-8859-1?Q?t2Cnon79Sg4vPEmUIOipQGk9LmVTZ9LDwBwzjYs+dCmBian5FQCUyEhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8769f8f2-142f-427e-ee5a-08de12a6ff8f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:42:39.6102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0I/27IMAw69r+TXIKnsOn/VOTG9+bLAQ0s5gRyHtnV2YFq5EU5/2Cz35biMQSzOmng5uJfKti6p7PMxSG4zcZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6728
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 29.6% improvement of vm-scalability.throughput on:


commit: 08499e8c4a692547edae0eed8b39444bf10938aa ("memcg: increase MEMCG_CHARGE_BATCH to 64")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: vm-scalability
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	runtime: 300s
	size: 1T
	test: lru-shm
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251024/202510241006.51895f3e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-bytedance-5.15-velinux/debian-13-x86_64-20250902.cgz/300s/1T/lkp-gnr-2sp3/lru-shm/vm-scalability

commit: 
  f3a11508a0 ("mm: page_counter: rearrange struct page_counter fields")
  08499e8c4a ("memcg: increase MEMCG_CHARGE_BATCH to 64")

f3a11508a0b9e4e0 08499e8c4a692547edae0eed8b3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   3652216 ±  9%     -24.9%    2744254 ±  4%  numa-meminfo.node1.Mapped
    885619 ± 12%     -22.5%     686541 ±  3%  numa-vmstat.node1.nr_mapped
    937.42 ±  3%     -15.0%     797.17 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    926.00 ±  4%     -14.8%     789.17 ±  4%  sched_debug.cfs_rq:/.util_avg.max
      0.01 ±  4%      +0.0        0.01 ±  5%  mpstat.cpu.all.soft%
      9.65            -2.0        7.62        mpstat.cpu.all.sys%
      1.54            +0.2        1.72        mpstat.cpu.all.usr%
      8337 ±  9%     -21.6%       6536 ±  6%  proc-vmstat.nr_active_anon
   1693699 ±  8%     -18.2%    1385943 ±  2%  proc-vmstat.nr_mapped
      4032 ±  4%     -10.8%       3595        proc-vmstat.nr_page_table_pages
      8337 ±  9%     -21.6%       6536 ±  6%  proc-vmstat.nr_zone_active_anon
    405.00           -16.2%     339.50        turbostat.Avg_MHz
     11.26            -1.8        9.43        turbostat.Busy%
     88.69            +1.9       90.59        turbostat.C1%
   6702650           -13.7%    5781490        turbostat.IRQ
     33741 ±  9%     -22.9%      26005 ±  6%  meminfo.Active
     33325 ±  9%     -23.2%      25590 ±  6%  meminfo.Active(anon)
  13491576 ±  7%     -14.3%   11556470 ± 11%  meminfo.DirectMap2M
   6965705 ±  8%     -20.7%    5522955 ±  3%  meminfo.Mapped
     16469 ±  5%     -13.2%      14290 ±  2%  meminfo.PageTables
      0.01 ±  5%     -19.7%       0.01        vm-scalability.free_time
    808072           +33.0%    1074715        vm-scalability.median
      3.44 ± 30%      -2.1        1.31 ± 36%  vm-scalability.median_stddev%
      3.48 ± 44%      -2.6        0.92 ± 13%  vm-scalability.stddev%
 2.102e+08           +29.6%  2.724e+08        vm-scalability.throughput
    112.40            -7.2%     104.32        vm-scalability.time.elapsed_time
    112.40            -7.2%     104.32        vm-scalability.time.elapsed_time.max
     13579            -8.8%      12390        vm-scalability.time.involuntary_context_switches
      2762           -17.6%       2277        vm-scalability.time.percent_of_cpu_this_job_got
      2676           -27.9%       1929        vm-scalability.time.system_time
    429.18            +4.1%     446.90        vm-scalability.time.user_time
     13.53 ±  4%      -1.4       12.16 ±  5%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      6.97 ± 11%      -1.2        5.78 ±  9%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.87 ± 22%      -0.6        0.29 ±102%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.rebalance_domains
      1.04 ± 62%      +1.0        1.99 ± 22%  perf-profile.calltrace.cycles-pp.proc_pid_status.proc_single_show.seq_read_iter.seq_read.vfs_read
     17.03 ± 42%      +3.7       20.74 ±  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.03 ± 42%      +3.8       20.78 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.63 ±  7%      -2.0        7.62 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      8.17 ± 10%      -1.5        6.66 ±  8%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     13.53 ±  4%      -1.4       12.16 ±  5%  perf-profile.children.cycles-pp.cpu_startup_entry
     13.53 ±  4%      -1.4       12.16 ±  5%  perf-profile.children.cycles-pp.do_idle
     13.53 ±  4%      -1.4       12.16 ±  5%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      4.23 ± 10%      -1.0        3.27 ± 14%  perf-profile.children.cycles-pp.lookup_fast
      1.20 ± 44%      +0.8        1.99 ± 22%  perf-profile.children.cycles-pp.proc_pid_status
      1.65            -6.5%       1.54        perf-stat.i.MPKI
 3.036e+10            +6.4%  3.229e+10        perf-stat.i.branch-instructions
      0.10            +0.0        0.11        perf-stat.i.branch-miss-rate%
  13417219            +5.9%   14205132        perf-stat.i.branch-misses
     56.09            -5.4       50.64        perf-stat.i.cache-miss-rate%
 3.175e+08            +7.7%  3.419e+08        perf-stat.i.cache-misses
 3.778e+08            +7.7%  4.068e+08        perf-stat.i.cache-references
      7355            +3.2%       7593        perf-stat.i.context-switches
      0.72            -6.0%       0.68        perf-stat.i.cpi
  1.03e+11           -15.3%  8.723e+10        perf-stat.i.cpu-cycles
    429.99            +2.6%     440.98        perf-stat.i.cpu-migrations
    629.71           +11.9%     704.79        perf-stat.i.cycles-between-cache-misses
 1.075e+11            +6.0%   1.14e+11        perf-stat.i.instructions
     41.44            +9.3%      45.31        perf-stat.i.major-faults
     35.20            +8.6%      38.22        perf-stat.i.metric.K/sec
   4518918            +8.5%    4904696        perf-stat.i.minor-faults
   4518960            +8.5%    4904741        perf-stat.i.page-faults
      2.96            +1.5%       3.01        perf-stat.overall.MPKI
      0.96           -20.3%       0.77        perf-stat.overall.cpi
    324.43           -21.5%     254.73        perf-stat.overall.cycles-between-cache-misses
      1.04           +25.4%       1.31        perf-stat.overall.ipc
      5298            -2.2%       5180        perf-stat.overall.path-length
 3.084e+10            +5.8%  3.262e+10        perf-stat.ps.branch-instructions
  13532145            +5.4%   14262259        perf-stat.ps.branch-misses
  3.23e+08            +7.1%  3.459e+08        perf-stat.ps.cache-misses
 3.838e+08            +7.1%   4.11e+08        perf-stat.ps.cache-references
      7352            +2.9%       7568        perf-stat.ps.context-switches
 1.048e+11           -15.9%  8.812e+10        perf-stat.ps.cpu-cycles
    429.91            +2.3%     439.68        perf-stat.ps.cpu-migrations
 1.091e+11            +5.5%  1.151e+11        perf-stat.ps.instructions
     41.18            +9.0%      44.89        perf-stat.ps.major-faults
   4600331            +7.9%    4963902        perf-stat.ps.minor-faults
   4600372            +7.9%    4963947        perf-stat.ps.page-faults
 1.238e+13            -2.2%   1.21e+13        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

