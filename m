Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92A218E91
	for <oe-lkp@lists.linux.dev>; Mon, 31 Mar 2025 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431554; cv=fail; b=IhpsUMEC1mtbdyeqFQKJ6LS1ThGwegSiUfgCTnY6UNNkq+9aL31rqGzUa2fXh6Lv6u4RWO2v33WX2bn9u6l7DZUmxdbklYqpS16fnnFqLbM2GCY9Fd3hxJ/kIgMpNYa1Dw1o/3AewaVzUIH9iQHS7WY3Hu/zhdl+9RyIMFHqXPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431554; c=relaxed/simple;
	bh=4JKJhYoISm7tJ0eYbPFmv0JfryEb91wVewvy5s+VIns=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eCRCQ2F1m/cLmn9EuzxtKWgUOrQzBqVL1PxN1v6PSAkijPsrERJs3bCqUHbFeGmlwVYAzHBhKJQPCy4npUnOu398K1k5ap9E8gB/euZ5/BeGaLy4GOKE4v62f8F8rMQe25DTV9Sq3FyAtpshSdRse2xjucW58WzI50aLtf8Rstc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPYRZwvQ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPYRZwvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743431552; x=1774967552;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=4JKJhYoISm7tJ0eYbPFmv0JfryEb91wVewvy5s+VIns=;
  b=mPYRZwvQfWP8kH7/klZQWoe8h0OfRXb/sHMgyTGGK4HZH9yph4OxVs+O
   5UHxT8eVKxTBlgIybaWa8tLowi5taXQFTsLVCT0Vcr4X+w6APEBmxYrKf
   xjekmNxKKIt9A+89vdwfSKwivX0RgIDJnoEKjIqhOxRE7E5gPrL2cHd6R
   aOIdVHIHtMlmTUng5Wl4KNWiiXLasEeQdI+0rt4teW1PLE6sJjUA+4v6i
   AgPkCkUkpGVyZaVpSYePMbDfunSYs2wZZJWa8aDzJyBlEG5wqJk2r81Q1
   FOSz3j6A2aLRcWLrA4Q+QT0Wor9RXnKneqcyUhUPZQo0pnHm37mdwg8ZK
   g==;
X-CSE-ConnectionGUID: 8CsDjPKsQ/q3cVW+hz6CLQ==
X-CSE-MsgGUID: Df4mxKJXSe6GGnfw3wviKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44614830"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44614830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:32:31 -0700
X-CSE-ConnectionGUID: sO7cLCBTQaGHh0BrPYCkBw==
X-CSE-MsgGUID: TiGlSIaFS3O3xksHv+/Qyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126568113"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 07:32:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 07:32:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 07:32:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gipi0q4KX3EYc7pA4EyiAcx3L9rcTDYz+wWea2IuPQo7fYdmdPucDNr/WM5KrPchtePc2l3OehD5jugv7rhpDeBrLC+4eVbBdYqXbLhZ3TTLabxKxZnvbtXHFcckbnEXUJdQvs1ERIuQ3jh5+F2kw7CQJA+XnzpmJQdMFMn3j6sVOvp60VPv7U/BAnAswD0q8RzW6BeMiiWgC0MGn/OM3TdhsgH0ci+4E8DsNAcDuzbwcMgm4SFQzGyXFJ5DGripJt8FmgAQUuC9/fH3uxNToSZrEqTUULq3Oft488ZE56s1NQe5w76MTP2iqtYqa+c4L7MDqcFXN8qM1xda5b+7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2ap0/VbZClYOxT2UE+xQnIeBTZ4S31xIfYYhrJG58U=;
 b=wg8r/a4/3WMneDLG5wy/RegpGo57xZerC6dXy2DZkr3EOMFQ9RodYI0IponCSFJz7fSxdnxOUks5TLA+CtDigNRzaW7Y+xQAawVKb/127FYWyebGHN5ucKqEpZnGhcG0dybWLIM5Xkk4Uh6CEyhfP2ebpdPccBairUEY49TyekFq1Bg2X/XrsMmzrfoco9KS28pCrb8xEF9e09vtJCWJQFJFfhX7JqzVqNuBppc/fbCbZQGVg+3z9jC0aH5siYpUujKPGRnhVa3q1D4awTKwpg2YPd2Ali7IYCy16cUhU63iS0iVpf8M0BCyf57p+pC9WwGWX89Ey2ifjXQqtnRiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:32:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:32:18 +0000
Date: Mon, 31 Mar 2025 22:32:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [anolis-intel-cloud:devel-5.10] [sched/fair]  eb34bf470a:
 hackbench.throughput 14.3% regression
Message-ID: <202503312129.2a8ee063-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0037.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::25) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 88df2e87-ed21-4f94-da08-08dd7060d6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CAzbotP/JVazBakbWcbOREI/9DPKHtdFzpq6bmJIhN+Qn1OAhoeAy6eYwE?=
 =?iso-8859-1?Q?mbSSF3jltqaWxSnJhg9cWocSvO8OPTC/1oxgQr5v130r21g+IRHF1YtuIm?=
 =?iso-8859-1?Q?sUenUaOc4f1kogSvVU6YlfbpotSxlK8LPZaxEKSuyIDHx4G2pMiU9TcZNf?=
 =?iso-8859-1?Q?70I0EBnoAU80zC1Q0qyxtqon9OZiarZ02eiQsomPqXAJZ4GjK2YVQLBKEh?=
 =?iso-8859-1?Q?uKQzZvq0Dg0Dbq6y5YZ6aRZsDqBzPi04/W+Hhdd7aB3pSdYnBMM9AZGS33?=
 =?iso-8859-1?Q?QwbYHpRKoSJ/GBVRSVTmEkLnp9Thkcczy1Qf/tVp4M3UqRfvL8fMdMIAHK?=
 =?iso-8859-1?Q?cNS8EKME6PjW1GlzfIb1eM96hVxcSR7E6HdB08OWDPr7sSFtdxta32XgNA?=
 =?iso-8859-1?Q?gZtD2iyVK+t15jMvyd2mu2MropFTZ82kd1aAFi4fdKqshSt4Cy9ncisRsi?=
 =?iso-8859-1?Q?QaUgM+TvroUxdHbhgxlK84Lh/2hAZUnKGSKtFRrUFCaRB8zk2kityVUdFm?=
 =?iso-8859-1?Q?YvG8ktUkYnCqiNaTR8hwkU+tT62cufQ6tQGLjH/8M90uXH5JqoEnvZmrlZ?=
 =?iso-8859-1?Q?oIvCd+KusMCGqCbNQirzQlFhymDzdYDtVB5PAJV05iCaSoL2lLQ2WVHK54?=
 =?iso-8859-1?Q?WKQQGhxBJIyfV+rTRo+aqxG3SKQ0pw7ze97+ifFYmLK2WfpmnDnE1Jip1A?=
 =?iso-8859-1?Q?7WPzDT89FrIyuRGpMftUs3NztPFxXrTn7FU5bzHEcx4/glSane6xbK2yd6?=
 =?iso-8859-1?Q?UieUq2Az1h/Ekla8BrFDR1Kj5KZS4h4suvxeggif1xTlqXP837Z09SM3Y0?=
 =?iso-8859-1?Q?LzYo01oBGnEmzjsfLmEq3c7e3LsPeFaHwe2JBbV+7335qOldNPgpiF6JrR?=
 =?iso-8859-1?Q?Pfw4rYoL+6hwMuF5bptRD86ovsu4olO10jx7zCriYWFuqqx539DYQgTQpn?=
 =?iso-8859-1?Q?CGAC0Th4WyqU5CIEnQWezEPxm+bLJu/ELT9kelx0kJrAO9ZoL6bnPAR8I0?=
 =?iso-8859-1?Q?iRaFnkcdjL083lME4LjXkY6ByCLNIMRZQ5SAUj6hCg1hUyRXqdyrUUDcvU?=
 =?iso-8859-1?Q?NGrHOYVIG0/ZlytwSw38Lp5vRHtwGUchB/6Lm9uA/IOZ+a/u7qMikNhQnM?=
 =?iso-8859-1?Q?6nWH5XfZoN/k2kiLLK/4zlmFyQdLHs1tdS8qmbERhZ9ZPDbx1XAxiXxJIJ?=
 =?iso-8859-1?Q?CP87TA7mSmU4DqIaSwnMSul3fyMseeMNXnII0b3nIvLxSwoXBG7szIlx7B?=
 =?iso-8859-1?Q?AWgsCRNZ9WSe6Fdnf7dbxyfqV/u4dSfAt+93OdnWciaK9ZIO/R64yeC/8F?=
 =?iso-8859-1?Q?/zATISinMcVqbOldQ5BtqT5KXMg6E25SJqncS1JbLisl3DBCgiMG12EDX4?=
 =?iso-8859-1?Q?L1YbHRqSp3eIYZyrTmWhwnyWw/mtExPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UxMzC4Gpt2wXzvVvmSt0V63JMajkJrlBFczWa9mY4LFWb6l1GXx1dAMn4c?=
 =?iso-8859-1?Q?Q6fSZRGfh6wF6bnTVyhVjUeRllTyYzrttqxNbkW7Crw0d0r8r37tN3jY43?=
 =?iso-8859-1?Q?/I8D5C4aQYAzOOWaLfCiEHwGMz+qK7Wqiz5LbIOiMVbUI2IQtnswX1vkOY?=
 =?iso-8859-1?Q?MBEWj6jN+5L/tg8zqEVhEf2Yn4XuHb8H2YEMkx/TANeGDjRueDO63yum7n?=
 =?iso-8859-1?Q?UgqWHVBDUDQdbDesl5hslvNbSM3hzCecK4LZyyZoh0rX+CdU6OCU8yNhmE?=
 =?iso-8859-1?Q?rSxTGwFYEPCBZypqEoDLqFWpluNhD0gfGb7/GSUKTwtx99cDv51dOsWc2n?=
 =?iso-8859-1?Q?utrXGa1tZrowPyWPBOXYucMxHfIBAcQRDb49Txw2l/DVJCWdpUVjhUNly9?=
 =?iso-8859-1?Q?OJlgZjrfnk46I3yrCzRGxt497as1b6nDGGRfJ1OSSURniDoqbpN4gWGDj8?=
 =?iso-8859-1?Q?GKBj/M5SpoqV3bgQpxccBXZxvrC3d7A83d7vqcvx3KSLKKbb7/tmRv7HDv?=
 =?iso-8859-1?Q?qR7wY6r2RQHbXqYjM4tqFfDbD75g6s2g0a5RhTMLf3wTP67Wo/ozZeQEcc?=
 =?iso-8859-1?Q?eQnLBNqUlrW3GU+lH7Z6Qq5gYLPNTBMV/CFvoKZzvoECzU6ZS/dqgRnb6A?=
 =?iso-8859-1?Q?q87r+9ig88rr+Ndc1TkjS0tRtTLXSg31Qk4nCk8RrOQBI5Fe5mwpQfybLX?=
 =?iso-8859-1?Q?HDVLHpghreqwUAsiue698alcWnz4JrYCUQaK1BL/kshn1qEEK58SGchub/?=
 =?iso-8859-1?Q?skyUcy7lQbNXKvtei1cPghcUvMFtslAeYyA7Bdv10nJ/B8noP1wgUyeHAj?=
 =?iso-8859-1?Q?Thsup9x+XaqTRZh+u/MmKMwNBxWLRgKhZFeCVBluSMHMqQ4tpm3hpe8pnX?=
 =?iso-8859-1?Q?L06Rtm4YIEjYATbAbTAspTsAE0ryxsgb6Mo2ZU5INGGx84BwZp5HUO8rdd?=
 =?iso-8859-1?Q?ma+klmQ4Za6WrNyf6Efkxk2q6XYylugUAVVAHBNReGB4LzztCKTBQJj5Ql?=
 =?iso-8859-1?Q?6cA1lbWLKBJIZIROgkCCYgn+c+OJFumFUk535RzlcdZ9dy/0A6RlSKgLHa?=
 =?iso-8859-1?Q?73sAxcwsTgwaP70qCCyOe+fhiHq+7HAH9iKiX4Dt1dExw24KrMjr86UcnE?=
 =?iso-8859-1?Q?Ho/+fZIHKdhH64m8307iq0wAmVeWgt31HFWEDNIukfwqkyE/3lupObKejh?=
 =?iso-8859-1?Q?QBrKtcEH/5fumImqHJEH54PLOOWPpAq8aHq1PA+zhBvOqR8KNx2rr8vLJP?=
 =?iso-8859-1?Q?xSjqtYVyQ7z7wuU3tJcA3cCG6Sesn+lZVW1Oc52p1imnoA7ne9GBTqK9cw?=
 =?iso-8859-1?Q?F8FZWowovMgXYkm81Z44VPrV0+fRjcwZcYEXljUC96PSYnVSR+1hd5BT1O?=
 =?iso-8859-1?Q?ntjoYAxWWnZWBrcj+kJ2eqgkg9QY9VtwSAkf+aJGqgu7v4t3ea98xK9kkl?=
 =?iso-8859-1?Q?IzKk5slxdUxhNKbiluITo5XxeL+f/Ez/d0uK7l7WkPPnURbO7jhVaI3wRu?=
 =?iso-8859-1?Q?hMcPCR6WzVgggIjIkLsEFChMpJ/Sr/9u6vAq3bEs/4hv7QG9g9w89UTSPa?=
 =?iso-8859-1?Q?FCR21RpyhO+jQRVA7oZJovnAl3Gob7B79NJOv9GzBWNc0pVa3xcOMBs7xn?=
 =?iso-8859-1?Q?DnuDB2PO17zlRvw0Ao3AFIez3xA8wg6wO1VJFGAB8pKRUhxDbLJPBZvw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88df2e87-ed21-4f94-da08-08dd7060d6d0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:32:18.1502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTOG+n84IVPJ0SRLNBdEBIWElXrkBmBdx4U0Z9LtsQW3H/B8AxzS+0BdMWcPycsqZPiOWGMaAEXGLB/qYJsy0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 14.3% regression of hackbench.throughput on:


commit: eb34bf470aa84e3d7594928c150c56888b369e33 ("sched/fair: Bring back select_idle_smt(), but differently")
https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10

testcase: hackbench
config: x86_64-anolis-intel-cloud-devel-5.10
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	nr_threads: 100%
	iterations: 8
	mode: process
	ipc: pipe
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503312129.2a8ee063-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503312129.2a8ee063-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/pipe/8/x86_64-anolis-intel-cloud-devel-5.10/process/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-1ap1/hackbench

commit: 
  80f5f5edac ("sched/fair: Optimize test_idle_cores() for !SMT")
  eb34bf470a ("sched/fair: Bring back select_idle_smt(), but differently")

80f5f5edacb1cccc eb34bf470aa84e3d7594928c150 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      4.55 ±  5%      -0.6        3.92 ±  6%  mpstat.cpu.all.idle%
  65977799            +4.6%   69010684        vmstat.system.cs
   1132850 ±  2%     -18.2%     926883        vmstat.system.in
    278.83 ±  6%     -11.3%     247.38 ±  9%  sched_debug.cpu.nr_uninterruptible.max
   -295.17           -18.9%    -239.29        sched_debug.cpu.nr_uninterruptible.min
    101.50 ±  3%     -19.2%      82.06 ±  4%  sched_debug.cpu.nr_uninterruptible.stddev
   1459169           +11.9%    1633494 ± 19%  proc-vmstat.nr_file_pages
    150994            +1.5%     153239        proc-vmstat.nr_kernel_stack
    630767 ±  2%     +27.6%     805092 ± 39%  proc-vmstat.nr_shmem
 1.099e+08 ±  2%     -23.2%   84388885 ±  2%  proc-vmstat.numa_hit
 1.099e+08 ±  2%     -23.2%   84388885 ±  2%  proc-vmstat.numa_local
 1.105e+08 ±  2%     -23.1%   84933388 ±  2%  proc-vmstat.pgalloc_normal
 1.093e+08 ±  2%     -23.6%   83588849 ±  2%  proc-vmstat.pgfree
   1339787 ±  3%     -14.3%    1148604        hackbench.throughput
   1178940 ±  2%     -10.9%    1050422 ±  2%  hackbench.throughput_avg
   1339787 ±  3%     -14.3%    1148604        hackbench.throughput_best
    976391 ±  4%     -12.1%     858353 ±  6%  hackbench.throughput_worst
    195.13 ±  2%     +12.0%     218.48        hackbench.time.elapsed_time
    195.13 ±  2%     +12.0%     218.48        hackbench.time.elapsed_time.max
 5.959e+09 ±  2%     +19.3%   7.11e+09 ±  2%  hackbench.time.involuntary_context_switches
     40522 ±  2%     +12.4%      45538 ±  2%  hackbench.time.system_time
      4462           +12.2%       5005 ±  2%  hackbench.time.user_time
 7.161e+09           +13.9%  8.155e+09        hackbench.time.voluntary_context_switches
     39.26 ±217%   +2252.7%     923.65 ± 97%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      7752 ±  7%     +13.0%       8762 ± 12%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
    194.31 ±220%    +849.8%       1845 ± 84%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      7752 ±  7%     +13.0%       8762 ± 12%  perf-sched.total_sch_delay.max.ms
     15485 ±  8%     +12.8%      17468 ± 11%  perf-sched.total_wait_and_delay.max.ms
      7748 ±  8%     +13.1%       8765 ± 11%  perf-sched.total_wait_time.max.ms
     15484 ±  8%     +12.8%      17468 ± 11%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
      6659 ±  8%     +18.8%       7908 ±  9%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.15 ± 41%   +2450.5%       3.94 ±134%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_read.new_sync_read.vfs_read
      5.02 ± 61%   +5567.2%     284.51 ±102%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_read.new_sync_read.vfs_read
      7742 ±  8%     +13.1%       8752 ± 11%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
      6659 ±  8%     +18.8%       7908 ±  9%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.03 ±  4%     -14.6%       0.02 ±  4%  perf-stat.i.MPKI
      0.75            +0.0        0.76        perf-stat.i.branch-miss-rate%
 7.963e+08            +2.5%  8.163e+08        perf-stat.i.branch-misses
      0.38 ±  5%      -0.0        0.34 ±  5%  perf-stat.i.cache-miss-rate%
   7820015 ±  3%     -16.3%    6548408 ±  5%  perf-stat.i.cache-misses
 4.094e+09            +1.6%  4.158e+09        perf-stat.i.cache-references
  66817468            +4.5%   69841496        perf-stat.i.context-switches
  14015959           +18.0%   16545810        perf-stat.i.cpu-migrations
    179705 ±  6%     +34.8%     242161 ±  2%  perf-stat.i.cycles-between-cache-misses
    337.28            +6.9%     360.42        perf-stat.i.metric.K/sec
     17632 ±  2%     -11.7%      15578 ±  2%  perf-stat.i.minor-faults
     17691 ±  2%     -11.6%      15634 ±  2%  perf-stat.i.page-faults
      0.58 ± 44%      +0.1        0.72        perf-stat.overall.branch-miss-rate%
      1.15 ± 44%     +22.2%       1.40        perf-stat.overall.cpi
     83187 ± 44%     +43.7%     119539 ±  4%  perf-stat.overall.cycles-between-cache-misses
 6.626e+08 ± 44%     +22.7%  8.132e+08        perf-stat.ps.branch-misses
 3.392e+09 ± 44%     +22.0%  4.138e+09        perf-stat.ps.cache-references
  55705902 ± 44%     +25.0%   69618145        perf-stat.ps.context-switches
  11583377 ± 44%     +41.7%   16416419        perf-stat.ps.cpu-migrations
 9.264e+13 ± 44%     +32.6%  1.229e+14        perf-stat.total.instructions
     28.27            -1.0       27.28        perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     27.27            -0.9       26.41        perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
      1.55 ±  4%      -0.4        1.15 ± 17%  perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.new_sync_write.vfs_write.ksys_write
      2.62 ±  3%      -0.4        2.22 ± 10%  perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_read.vfs_read.ksys_read
      1.65            -0.1        1.51 ±  9%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.pipe_read.new_sync_read
      0.53 ± 44%      +0.5        1.03 ± 12%  perf-profile.calltrace.cycles-pp.available_idle_cpu.id_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
      0.59 ± 44%      +0.6        1.16 ± 12%  perf-profile.calltrace.cycles-pp.id_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      9.32 ±  3%      +1.4       10.71 ±  6%  perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
     11.63 ±  2%      +1.7       13.31 ±  4%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     35.66            +2.9       38.59 ±  3%  perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.85            +3.1       37.97 ±  3%  perf-profile.calltrace.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
     24.62 ±  2%      +3.5       28.11 ±  4%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write
     24.48 ±  2%      +3.5       27.97 ±  4%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
     25.53 ±  2%      +3.6       29.14 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write
     25.99 ±  2%      +3.6       29.63 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.ksys_write
     32.49            -1.7       30.77        perf-profile.children.cycles-pp.ksys_read
     31.32            -1.5       29.78        perf-profile.children.cycles-pp.vfs_read
     28.35            -1.0       27.34        perf-profile.children.cycles-pp.new_sync_read
     27.49            -0.9       26.60        perf-profile.children.cycles-pp.pipe_read
      2.28 ±  9%      -0.6        1.68 ± 16%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      2.03 ±  6%      -0.6        1.46 ± 13%  perf-profile.children.cycles-pp.security_file_permission
      1.43 ±  5%      -0.4        1.02 ± 14%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.64 ±  5%      -0.4        1.26 ± 13%  perf-profile.children.cycles-pp.copy_page_from_iter
      2.72 ±  4%      -0.4        2.36 ±  9%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      1.21 ±  6%      -0.3        0.86 ± 14%  perf-profile.children.cycles-pp.fsnotify
      1.14 ±  6%      -0.3        0.83 ± 12%  perf-profile.children.cycles-pp.apparmor_file_permission
      2.70 ±  3%      -0.3        2.40 ±  5%  perf-profile.children.cycles-pp.copy_page_to_iter
      1.44 ±  2%      -0.2        1.19 ±  7%  perf-profile.children.cycles-pp.__fdget_pos
      0.87 ±  5%      -0.2        0.64 ± 13%  perf-profile.children.cycles-pp.touch_atime
      0.80 ±  6%      -0.2        0.57 ± 13%  perf-profile.children.cycles-pp.current_time
      1.04 ±  4%      -0.2        0.83 ± 14%  perf-profile.children.cycles-pp.copyin
      0.82 ±  4%      -0.2        0.62 ± 12%  perf-profile.children.cycles-pp.file_update_time
      0.66 ±  6%      -0.2        0.48 ± 13%  perf-profile.children.cycles-pp.atime_needs_update
      1.18 ±  2%      -0.2        1.02 ±  6%  perf-profile.children.cycles-pp.__fget_light
      2.30            -0.2        2.13 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.68 ±  4%      -0.2        0.52 ± 10%  perf-profile.children.cycles-pp.__cond_resched
      0.51 ±  6%      -0.1        0.37 ± 12%  perf-profile.children.cycles-pp.aa_file_perm
      0.50 ±  6%      -0.1        0.40 ±  9%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.51 ±  3%      -0.1        0.42 ±  8%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.34 ±  7%      -0.1        0.25 ± 11%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.24 ±  7%      -0.1        0.16 ± 14%  perf-profile.children.cycles-pp.rw_verify_area
      0.23 ±  5%      -0.1        0.16 ± 14%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.27 ±  5%      -0.1        0.21 ± 10%  perf-profile.children.cycles-pp.rcu_all_qs
      0.17 ±  6%      -0.1        0.12 ± 16%  perf-profile.children.cycles-pp.iov_iter_init
      0.56 ±  2%      -0.0        0.52 ±  3%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.17 ±  6%      -0.0        0.13 ± 13%  perf-profile.children.cycles-pp.page_copy_sane
      0.50 ±  2%      -0.0        0.46 ±  3%  perf-profile.children.cycles-pp.sched_clock
      0.18 ±  5%      -0.0        0.14 ± 11%  perf-profile.children.cycles-pp.amd_clear_divider
      0.22 ±  2%      -0.0        0.18 ±  6%  perf-profile.children.cycles-pp.rcu_read_unlock_strict
      0.44 ±  3%      -0.0        0.41 ±  3%  perf-profile.children.cycles-pp.native_sched_clock
      0.13 ±  4%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.__x64_sys_read
      0.15 ±  3%      -0.0        0.12 ±  7%  perf-profile.children.cycles-pp.__x64_sys_write
      0.09 ±  5%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__bitmap_and
      0.05            +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.group_balancer_enabled
      0.16 ±  9%      +0.0        0.20 ±  9%  perf-profile.children.cycles-pp.attach_entity_load_avg
      0.02 ± 99%      +0.1        0.08        perf-profile.children.cycles-pp.cpus_share_cache
      0.45 ±  6%      +0.1        0.59 ± 12%  perf-profile.children.cycles-pp.__cmd_record
      0.45 ±  6%      +0.1        0.59 ± 12%  perf-profile.children.cycles-pp.cmd_record
      0.29 ± 10%      +0.1        0.44 ± 13%  perf-profile.children.cycles-pp.remove_entity_load_avg
      1.08 ±  4%      +0.2        1.26 ±  6%  perf-profile.children.cycles-pp.task_h_load
      0.48 ±  6%      +0.2        0.69 ±  6%  perf-profile.children.cycles-pp._find_next_bit
      1.78 ±  5%      +0.2        2.02 ±  6%  perf-profile.children.cycles-pp.wake_affine
      0.94 ±  9%      +0.3        1.20 ± 10%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.00            +0.3        0.29 ±  6%  perf-profile.children.cycles-pp.cpumask_next
      1.67 ±  8%      +0.4        2.12 ±  9%  perf-profile.children.cycles-pp.set_task_cpu
      4.40 ±  2%      +0.6        5.00 ±  5%  perf-profile.children.cycles-pp.available_idle_cpu
      9.39 ±  3%      +1.7       11.06 ±  6%  perf-profile.children.cycles-pp.select_idle_sibling
     11.70 ±  2%      +1.9       13.63 ±  4%  perf-profile.children.cycles-pp.select_task_rq_fair
     38.66            +2.2       40.87 ±  2%  perf-profile.children.cycles-pp.ksys_write
     37.72            +2.4       40.12 ±  2%  perf-profile.children.cycles-pp.vfs_write
     26.41 ±  2%      +2.7       29.16 ±  2%  perf-profile.children.cycles-pp.autoremove_wake_function
     26.39 ±  2%      +2.8       29.16 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
     27.34 ±  2%      +2.9       30.19 ±  2%  perf-profile.children.cycles-pp.__wake_up_common
     27.92 ±  2%      +2.9       30.78 ±  2%  perf-profile.children.cycles-pp.__wake_up_common_lock
     35.89            +2.9       38.82 ±  3%  perf-profile.children.cycles-pp.new_sync_write
     35.00            +3.1       38.09 ±  3%  perf-profile.children.cycles-pp.pipe_write
      1.39 ±  5%      -0.4        0.99 ± 14%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.68 ±  4%      -0.4        2.32 ±  9%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      1.14 ±  6%      -0.3        0.81 ± 14%  perf-profile.self.cycles-pp.fsnotify
      0.95 ±  6%      -0.3        0.68 ± 14%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.15 ±  4%      -0.2        0.95 ±  6%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.64 ±  5%      -0.2        0.45 ± 14%  perf-profile.self.cycles-pp.vfs_write
      2.27            -0.2        2.10 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.53 ±  6%      -0.2        0.37 ± 15%  perf-profile.self.cycles-pp.security_file_permission
      0.59 ±  6%      -0.2        0.44 ± 12%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.63 ±  4%      -0.1        0.48 ± 10%  perf-profile.self.cycles-pp.new_sync_write
      1.09 ±  2%      -0.1        0.95 ±  5%  perf-profile.self.cycles-pp.__fget_light
      0.48 ±  6%      -0.1        0.34 ± 14%  perf-profile.self.cycles-pp.current_time
      0.47 ±  6%      -0.1        0.34 ± 13%  perf-profile.self.cycles-pp.copy_page_from_iter
      0.40 ±  6%      -0.1        0.29 ± 13%  perf-profile.self.cycles-pp.aa_file_perm
      0.79 ±  2%      -0.1        0.70 ±  4%  perf-profile.self.cycles-pp.new_sync_read
      0.51 ±  3%      -0.1        0.42 ±  7%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.44 ±  4%      -0.1        0.35 ±  9%  perf-profile.self.cycles-pp.do_syscall_64
      0.34 ±  6%      -0.1        0.25 ± 14%  perf-profile.self.cycles-pp.file_update_time
      0.35 ±  4%      -0.1        0.26 ± 10%  perf-profile.self.cycles-pp.__cond_resched
      0.28 ±  6%      -0.1        0.20 ± 13%  perf-profile.self.cycles-pp.ksys_write
      0.25 ±  6%      -0.1        0.17 ± 15%  perf-profile.self.cycles-pp.__fdget_pos
      0.48 ±  3%      -0.1        0.41 ±  6%  perf-profile.self.cycles-pp.ksys_read
      0.28 ±  5%      -0.1        0.21 ± 11%  perf-profile.self.cycles-pp.atime_needs_update
      0.39 ±  6%      -0.1        0.32 ±  8%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.26 ±  7%      -0.1        0.19 ± 11%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.22 ±  5%      -0.1        0.16 ± 12%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.70 ±  2%      -0.1        0.64 ±  4%  perf-profile.self.cycles-pp.copy_page_to_iter
      0.19 ±  7%      -0.1        0.13 ± 16%  perf-profile.self.cycles-pp.rw_verify_area
      0.34 ±  3%      -0.1        0.29 ±  7%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      1.08            -0.1        1.03 ±  2%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.58 ±  4%      -0.0        0.53 ±  5%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.19 ±  4%      -0.0        0.15 ± 10%  perf-profile.self.cycles-pp.rcu_all_qs
      0.15 ±  5%      -0.0        0.10 ± 13%  perf-profile.self.cycles-pp.touch_atime
      0.13 ±  8%      -0.0        0.09 ± 14%  perf-profile.self.cycles-pp.iov_iter_init
      0.68            -0.0        0.64 ±  3%  perf-profile.self.cycles-pp.dequeue_entity
      0.10 ±  7%      -0.0        0.08 ± 13%  perf-profile.self.cycles-pp.page_copy_sane
      0.08 ±  7%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.copyin
      0.08 ±  7%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.copyout
      0.12 ±  4%      -0.0        0.10 ±  6%  perf-profile.self.cycles-pp.rcu_read_unlock_strict
      0.08 ±  4%      -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.__bitmap_and
      0.27 ±  6%      +0.0        0.30 ±  7%  perf-profile.self.cycles-pp.enqueue_task
      0.16 ±  9%      +0.0        0.20 ±  9%  perf-profile.self.cycles-pp.attach_entity_load_avg
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.group_balancer_enabled
      0.31 ±  4%      +0.1        0.36 ±  5%  perf-profile.self.cycles-pp.id_idle_cpu
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.cpus_share_cache
      0.53 ±  5%      +0.1        0.61 ±  6%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.08 ±  7%  perf-profile.self.cycles-pp.cpumask_next
      0.59 ±  8%      +0.1        0.70 ±  8%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.92 ±  4%      +0.1        1.04 ±  5%  perf-profile.self.cycles-pp.__wake_up_common
      0.69 ±  8%      +0.2        0.86 ±  8%  perf-profile.self.cycles-pp.set_task_cpu
      0.38 ±  7%      +0.2        0.55 ±  6%  perf-profile.self.cycles-pp._find_next_bit
      1.07 ±  4%      +0.2        1.24 ±  6%  perf-profile.self.cycles-pp.task_h_load
      2.22 ±  3%      +0.2        2.44 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      4.36 ±  2%      +0.6        4.94 ±  5%  perf-profile.self.cycles-pp.available_idle_cpu
      0.86 ±  3%      +0.9        1.74 ±  4%  perf-profile.self.cycles-pp.select_idle_sibling




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

