Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3FA446BF
	for <oe-lkp@lists.linux.dev>; Mon, 11 Mar 2024 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710169424; cv=fail; b=W4SJtEJzWZrXQV6r8n1yokjSqO2HguGNUWHeCuLn7iBDaCSed1z49jv3vgfZ72KebEML8MCLKKMkfKFMpbLsrRHwe9gUvf7wgcW/TmwQtRcC0ncE1fgjMAB24RGK5t4ngfFLD4nUOrW6rWrpLDXVMXN+ZK1h2Jq5gPTOpyl0iHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710169424; c=relaxed/simple;
	bh=g+4eIkyZVASk8BEwoH413jIhKAM883P9MmhcmEpkYrQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jiPVmbzZAt0VI+415QqDYJjYx8uUb1m/8XuoPOwRgFiccjEc1NCybP+MceMMgOFbuOeGC0XpwN+w/dJBYSD3TVQQsy6yYSFUUtVwmMPIWnaM19RbAeTLSpScucbbSCnGXWrEjTr8c6ih58rZH33HyjSxA9qtf0ouZpsZmQWsL0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOLMTxUo; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOLMTxUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710169417; x=1741705417;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=g+4eIkyZVASk8BEwoH413jIhKAM883P9MmhcmEpkYrQ=;
  b=SOLMTxUoUx6c/zxNL1XIZAArk0xgMZ7aHp3pOe5DKRE+7+K9y/O5+Z1W
   cIerj0qaa090Xi/6heAwRP3Q1dqRgQInjsWiApyDDEmnRU9384oe5a6bu
   YpL4pAZBJJygs2Q6Bk6VhNRW0AifrcvthH1Y0hpUb6vTDyGrfcnXWCrLE
   Ji1dAlRnc+ideKmzgrFmkrqphtLMDDZWfX2bt+OFC6t4ao2WePvfu1CcA
   9ZAveeKqIsqhDbQLrGennSnshwWfjky9hL8x96Kw7Dy2i9bhmJftKR2Kt
   UP9esKB6PxGvWQJPHfkbZFX7AnmUoL2QGzD3avgbtQ1zX5h730avqqDZO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15975221"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15975221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 08:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="42108665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Mar 2024 08:03:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 08:03:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 08:03:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 08:03:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtxVJlsz1t7iNGPLTAOxm8O5rqvfKJvtjmWDGxNBQKm6wSRwOis8pWSv91y0JumsBcHClnuWW2uM/pplkjOMLpkMzYAgrR1MEMzkpEUwXcqTqXS373CjdZQ0Ia1drA7tauDq0SuGi38nX0xmqxPnkGvjYyRFTRUSkGfRDA2uXz3wQH2KpBR40dxpCEGgLucfclTZzb/hmfUBU6WH5l5PsTNKr0dT2Q70i81w+n+8vKh1tvEwlqV+ERq1WVOB8jAtYyVZ4VI+oGAvHR8PpeCmWJSf5WXTLTlPAn+r1sPWqGRwpwOV1wDEf1eKxIoneh2xQSLaM8Gz5S+4LMaltPVpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFbrANXu1SrVHHuCdGkOytCpQuIEYX7vsyAKAnp9rDY=;
 b=nb/LLJMFUa+96DKqximo6FWFg9MdTMK2xkLUmyrYgX85nIRez5/H4mmgcu2xYaqEKhZ7suQv8kuWok4aI7NrwwxCSj/6V/z1X4OmBlUeJdjzzQJs9bjLMQluOrxDKUOuaJCMsrEzeE+a/KaB/oocrFAiMgL9GcP4E3HLWSYGBx3rSQhF0BCE/MEqrz2s51M5xohmWUH7QTHejMZuEzCY2IgtnceYVnPg9/CTkyYWWPRqvvv/L21UZ/W/SZjM1oTt8eWFs6Jbrs5ZnyFWDZl7kDpJJ9f+lCDRfIi6utrAIydXrRdW94ROu/OI/XvcGVSWtnAg5GsJ/sq3CbzzQzR3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Mon, 11 Mar
 2024 15:03:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7362.019; Mon, 11 Mar 2024
 15:03:12 +0000
Date: Mon, 11 Mar 2024 23:03:04 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [djwong-xfs:twf-hoist] [xfs]  eacb32cc55:  aim7.jobs-per-min -66.2%
 regression
Message-ID: <202403112240.76647647-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::36)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0ba267-faaa-473a-cb4d-08dc41dc5e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tDGnPmzmQ1ijtJuCU735nOfoYmxmTxr3W8kQVnASRJ7AqFZ05BGz1ZyjSmgG4VxjlOD1VDl4JeJl2WHzmaDvnl/EgrD75fTo0mAANQSwa9J4tPFUcDTQ5jfBoQ6RGxTRjP+pDg5h3HNkaT403LIbocnh0lGNurVJav/udyN0mKomDQT2BvlIomZ+cgiZWJlO8x2NJaOMevNGX2kNTHofs79NlkE8eOk9vn4p39eHbsAkuI6rQpCQoY022BpbIA/PqBFvliFWIwVcHQt9SCJwCyByeuBrosq+6AXING7XpZcIVZcvAJ1ETn6NbmMkAK5XYGomlkF4J7gbdsMPavp93ooM6j/VBrXGKfYmrif5Kluds8zyg/Xt+YL1k8sDkkyAaIUgM1yQaRLTfT4juXVn09TvTtQFFmlMnFpo3GoM/c5n2+qx1uD2wcpcDbpqd1Q488hmfK3xW4uDd2AyF513rWrNsyBSreH1B6f2K/u6F5pf468dVy4BqEngtv+HMRqKfmKhnThgbvMczUEPARCtNZQ0W++gMRa1FXWZYFhS7DxaoCrbHg1IJLPViQComt2NdHSlqsyLoY4Xi157tp1AGDj0ce5ZzUVPbhm4Y1Wss2vOhrWzitvSDen2VqvCg6a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qcAOOQUirezIiJFFFUiLE2p59HjxqSW7aVMC8ZYW4h0kSyiOU+royE4Omq?=
 =?iso-8859-1?Q?aYF3zfPBu2xcyYD0eIvN6xjGS8AA9+2jKqPLfbu/acixStbope32t7I9iX?=
 =?iso-8859-1?Q?ilAzNKjxse8SQrDtdbKDSSUsgEPXbiTvRIqerDrTb/dL4KwZ5o8xdah3eu?=
 =?iso-8859-1?Q?XkWsoYMeKyEqqbOQuPNDAOrwAn4530puBhCmZIoekuPHHOD59JMm+hIfRj?=
 =?iso-8859-1?Q?rOJ12M1Sp3IDW2lYZvOh7Q/nk8zdrYzzjWaYzYYaXEcnv0I7ZglxCJOMNo?=
 =?iso-8859-1?Q?k8x19v/1CnbkasbULrkJB6UI/igRUsaBbcDTGSbqNCns8FYMxiEtqqWB4z?=
 =?iso-8859-1?Q?h0I+GPodwrkTcDRdZ/3XuBZ3xktpOHvlNghAU5DwFrzBx3K3yHM+n8n9Kd?=
 =?iso-8859-1?Q?atsB4vKreCghJjX7VYRCKGSZ399fuVoJ+pMVtwHZhjNnW5/+e85f3bUK/0?=
 =?iso-8859-1?Q?fYvmnyXgs9cBzrzU7gc2h1iPPMhDkb2RCInlgH4vpZhi0wneBqerutWaos?=
 =?iso-8859-1?Q?gNof1yL0DgxWvLAXFBIaVjqHA3D3sPOYvsQl46tZjNPbAyhRL8g/HuOHV7?=
 =?iso-8859-1?Q?B0939Lib2ijDx/5+eDc+MyoF6Nf1lBHW+HeWlTJFXE1kfDBV6Q1SodVnNc?=
 =?iso-8859-1?Q?VwD6kO4x85A6kiFx3djab/ehVAljLvbwiWcCWAaljrYcg1FQTqpN5By+Db?=
 =?iso-8859-1?Q?U41axGqe0c48amZ/XIEeD+2KZDr8aMMWOTxDbztaW37qy4KAzmdCtqv4D7?=
 =?iso-8859-1?Q?fVewJ+DI5BS2o63DZ19ds5E7noBTsPbxTIPwS+MqYHm9VI0IS8eJ5vG4ly?=
 =?iso-8859-1?Q?hLyCm5c04xZ3ER0o/C/grqMNSLq+NTaDO9zKwBzcDT4qPzSrHN2K5Aznm9?=
 =?iso-8859-1?Q?tjaQojHgAeLJfe5yiGG40apyZAPK5FwinjRVKrApP2bBNCdC6eFv1Z3YqQ?=
 =?iso-8859-1?Q?ZYRR1h4BvvrOWHH2czZ3A52eFdX7q2aLl+JkKJv5CGPLExBrFzsaDWDfDl?=
 =?iso-8859-1?Q?3c8OuFkCK1apdnkYwo1QDkLv144ONTyGYdH0aaw8rEeldSG+oU1C7Lj2e6?=
 =?iso-8859-1?Q?crFECXovy/Cc2DKyi1OjuQEvhX7sI/2iMvUZRU+GHZI9rfMxoAjqP2I9Ia?=
 =?iso-8859-1?Q?Zn45WLRoTp9sao9SSZiT2oqPjvGjqM1/fPMO2xh8BOPPQ4XRtEe1pRJFOl?=
 =?iso-8859-1?Q?4HZAAuLs42tR61a+CnoT8E13xvLh9BOVbt0H+U61iFs1iXLt9VerW2ZEdD?=
 =?iso-8859-1?Q?ag3yzCTFsz3fXi4EYvr/Xa0jKtnAR/g8T6msXBAfWUyKozHVM+fd8/M//Y?=
 =?iso-8859-1?Q?jZlgjuRczRDaR5K3fNDCToKoQLItBjmwMpA9kAq7JU6Tf9VFfOzdzsDPOe?=
 =?iso-8859-1?Q?3bbrR6ROleHv2CO4aVcQjtb7Vy0kkhaCdDhywjkOK8Kn3Y7OQHZpCl9KYr?=
 =?iso-8859-1?Q?E+M0wYJA97/0wNU/9p7c0VKdZFgGfEHtmYgkSNaJEovI0hv1wuI13F/Cr1?=
 =?iso-8859-1?Q?ySZczcVnpBfY+B90o0/jlCErBa3292JdMVjDdX2gxBts0VxqyWwazltb+5?=
 =?iso-8859-1?Q?TOlX/JaxPSRgiP1RS8+wtfbVcKoZcOIRzcYENNOdH91LO572xiQqkTefVs?=
 =?iso-8859-1?Q?RybJSazHO1dFLLN5S/cBmgNTrhKXObSOLy0VcgMga/bz0LfgaKhItjTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0ba267-faaa-473a-cb4d-08dc41dc5e58
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 15:03:12.0604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/SNBbXfj2QlINeYmtRe5F7kMSAhTZVaQEia2rPGa9l+jtNYohRO2qLKW63ZkP/KyHfiAV+3aA020qVnFUH2iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
X-OriginatorOrg: intel.com



Hello,


we noticed by this commit we had below config diff comparing to parent after
building:

@@ -6357,6 +6357,7 @@ CONFIG_XFS_SUPPORT_ASCII_CI=y
 CONFIG_XFS_QUOTA=y
 CONFIG_XFS_POSIX_ACL=y
 CONFIG_XFS_RT=y
+CONFIG_XFS_TIME_STATS=y
 CONFIG_XFS_DRAIN_INTENTS=y
 CONFIG_XFS_LIVE_HOOKS=y
 CONFIG_XFS_MEMORY_BUFS=y
@@ -7055,6 +7056,7 @@ CONFIG_GENERIC_NET_UTILS=y
 CONFIG_CORDIC=m
 # CONFIG_PRIME_NUMBERS is not set
 CONFIG_RATIONAL=y
+CONFIG_MEAN_AND_VARIANCE=m
 CONFIG_GENERIC_PCI_IOMAP=y
 CONFIG_GENERIC_IOMAP=y
 CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
@@ -7189,6 +7191,7 @@ CONFIG_SBITMAP=y

 CONFIG_ASN1_ENCODER=y
 CONFIG_FIRMWARE_TABLE=y
+CONFIG_TIME_STATS=m

 #
 # Kernel hacking

not sure if below performance is expected by this commit.


kernel test robot noticed a -66.2% regression of aim7.jobs-per-min on:


commit: eacb32cc553342496b6bcd4412731ceb81eaca02 ("xfs: present wait time statistics")
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git twf-hoist

testcase: aim7
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	disk: 1BRD_48G
	fs: xfs
	test: disk_cp
	load: 3000
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | aim7: aim7.jobs-per-min -78.5% regression                                                      |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory     |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | disk=1BRD_48G                                                                                  |
|                  | fs=xfs                                                                                         |
|                  | load=3000                                                                                      |
|                  | test=disk_rr                                                                                   |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | aim7: aim7.jobs-per-min -88.7% regression                                                      |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory     |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | disk=1BRD_48G                                                                                  |
|                  | fs=xfs                                                                                         |
|                  | load=3000                                                                                      |
|                  | test=disk_rw                                                                                   |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fxmark: fxmark.ssd_xfs_MRDM_18_bufferedio.works/sec -39.0% regression                          |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | directio=bufferedio                                                                            |
|                  | disk=1SSD                                                                                      |
|                  | fstype=xfs                                                                                     |
|                  | media=ssd                                                                                      |
|                  | test=MRDM                                                                                      |
|                  | thread_nr=18                                                                                   |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fxmark: fxmark.ssd_xfs_MRDL_4_directio.works/sec -77.8% regression                             |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | directio=directio                                                                              |
|                  | disk=1SSD                                                                                      |
|                  | fstype=xfs                                                                                     |
|                  | media=ssd                                                                                      |
|                  | test=MRDL                                                                                      |
|                  | thread_nr=4                                                                                    |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fxmark: fxmark.ssd_xfs_MRDM_18_directio.works/sec -39.9% regression                            |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | directio=directio                                                                              |
|                  | disk=1SSD                                                                                      |
|                  | fstype=xfs                                                                                     |
|                  | media=ssd                                                                                      |
|                  | test=MRDM                                                                                      |
|                  | thread_nr=18                                                                                   |
+------------------+------------------------------------------------------------------------------------------------+
| testcase: change | fxmark: fxmark.ssd_xfs_DWOL_54_bufferedio.works/sec -98.1% regression                          |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                                   |
|                  | directio=bufferedio                                                                            |
|                  | disk=1SSD                                                                                      |
|                  | fstype=xfs                                                                                     |
|                  | media=ssd                                                                                      |
|                  | test=DWOL                                                                                      |
|                  | thread_nr=54                                                                                   |
+------------------+------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403112240.76647647-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240311/202403112240.76647647-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/disk_cp/aim7

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    108.39          +102.7%     219.75 ±  2%  uptime.boot
 5.551e+09           +18.4%  6.573e+09        cpuidle..time
   4358360           +31.3%    5722587        cpuidle..usage
     74.40           -58.3%      30.99 ±  2%  iostat.cpu.idle
     24.60 ±  5%    +179.0%      68.63        iostat.cpu.system
      1.00 ±  2%     -62.0%       0.38 ±  3%  iostat.cpu.user
      1.17 ± 76%  +38128.6%     446.00 ± 44%  perf-c2c.DRAM.local
     33.17 ± 26%  +75689.4%      25136 ±  2%  perf-c2c.DRAM.remote
     23.50 ± 27%  +1.3e+05%      29864        perf-c2c.HITM.local
      9.17 ± 45%  +2.1e+05%      19232        perf-c2c.HITM.remote
     32.67 ± 29%  +1.5e+05%      49097        perf-c2c.HITM.total
     73.70           -43.4       30.29 ±  3%  mpstat.cpu.all.idle%
      0.24            -0.1        0.18        mpstat.cpu.all.irq%
      0.07            -0.0        0.03 ±  2%  mpstat.cpu.all.soft%
     24.97 ±  5%     +44.2       69.13        mpstat.cpu.all.sys%
      1.02            -0.6        0.38 ±  2%  mpstat.cpu.all.usr%
     40.06 ±  5%     +98.0%      79.34        mpstat.max_utilization_pct
     74.40           -58.4%      30.97 ±  2%  vmstat.cpu.id
     24.59 ±  5%    +179.2%      68.64        vmstat.cpu.sy
    675.07 ± 34%     -72.8%     183.65 ± 25%  vmstat.io.bo
     33.37 ±  3%    +169.1%      89.79        vmstat.procs.r
     38074           -63.3%      13985 ±  3%  vmstat.system.cs
    146690 ±  2%     +15.8%     169857        vmstat.system.in
    319672 ±  2%     -66.2%     107944 ±  2%  aim7.jobs-per-min
     56.52 ±  2%    +195.6%     167.06 ±  2%  aim7.time.elapsed_time
     56.52 ±  2%    +195.6%     167.06 ±  2%  aim7.time.elapsed_time.max
     53433 ±  3%    +234.5%     178712 ±  4%  aim7.time.involuntary_context_switches
    173447           +58.9%     275545        aim7.time.minor_page_faults
      1774 ±  8%    +736.0%      14835 ±  3%  aim7.time.system_time
    436983 ±  2%      -8.4%     400397        aim7.time.voluntary_context_switches
    161434 ±  6%    +334.7%     701682        meminfo.Active
    160535 ±  6%    +336.4%     700635        meminfo.Active(anon)
    898.81           +16.4%       1046        meminfo.Active(file)
     53545 ±  7%    +173.4%     146396 ±  2%  meminfo.AnonHugePages
   3325452           +17.1%    3893986        meminfo.Cached
   3289242           +17.5%    3863384        meminfo.Committed_AS
   8390656 ±  9%     +18.5%    9942016 ±  8%  meminfo.DirectMap2M
     10412 ± 13%    +274.9%      39039 ±  3%  meminfo.Dirty
     10126 ± 12%    +273.9%      37864 ±  3%  meminfo.Inactive(file)
     79835 ±  4%     -18.0%      65431 ±  3%  meminfo.Mapped
    195727 ±  6%    +275.7%     735414        meminfo.Shmem
      4146 ± 43%   +3331.3%     142286 ± 35%  numa-meminfo.node0.Active
      3247 ± 55%   +4253.5%     141399 ± 36%  numa-meminfo.node0.Active(anon)
      5111 ±  5%    +284.1%      19633 ±  3%  numa-meminfo.node0.Dirty
    126016 ± 78%    +185.8%     360206 ± 21%  numa-meminfo.node0.FilePages
      5231 ±  4%    +266.7%      19183 ±  3%  numa-meminfo.node0.Inactive(file)
     18385 ±  8%     -26.3%      13550 ±  9%  numa-meminfo.node0.Mapped
      7383 ± 26%   +1917.7%     148983 ± 35%  numa-meminfo.node0.Shmem
    157308 ±  6%    +255.7%     559478 ±  9%  numa-meminfo.node1.Active
    157308 ±  6%    +255.6%     559319 ±  9%  numa-meminfo.node1.Active(anon)
    333038 ±  7%     +57.3%     524000 ± 28%  numa-meminfo.node1.AnonPages
    385725 ±  9%     +48.5%     572940 ± 25%  numa-meminfo.node1.AnonPages.max
      5039 ±  6%    +282.9%      19298 ±  3%  numa-meminfo.node1.Dirty
    368785 ±  6%     +54.5%     569811 ± 26%  numa-meminfo.node1.Inactive
    364110 ±  6%     +51.4%     551238 ± 27%  numa-meminfo.node1.Inactive(anon)
      4674 ±  5%    +297.3%      18573 ±  3%  numa-meminfo.node1.Inactive(file)
     61846 ±  3%     -15.5%      52229 ±  4%  numa-meminfo.node1.Mapped
    188500 ±  6%    +211.2%     586633 ±  9%  numa-meminfo.node1.Shmem
    813.07 ± 55%   +4245.0%      35327 ± 36%  numa-vmstat.node0.nr_active_anon
      1425 ± 14%    +243.2%       4892 ±  2%  numa-vmstat.node0.nr_dirty
     31655 ± 78%    +184.4%      90040 ± 21%  numa-vmstat.node0.nr_file_pages
      1433 ± 12%    +233.9%       4786        numa-vmstat.node0.nr_inactive_file
      4677 ±  8%     -24.7%       3523 ±  8%  numa-vmstat.node0.nr_mapped
      1846 ± 26%   +1916.9%      37245 ± 35%  numa-vmstat.node0.nr_shmem
    813.07 ± 55%   +4245.0%      35327 ± 36%  numa-vmstat.node0.nr_zone_active_anon
      1431 ± 12%    +234.4%       4787        numa-vmstat.node0.nr_zone_inactive_file
      1425 ± 14%    +243.2%       4893 ±  2%  numa-vmstat.node0.nr_zone_write_pending
     39337 ±  6%    +255.2%     139725 ±  9%  numa-vmstat.node1.nr_active_anon
     83253 ±  7%     +57.4%     131028 ± 28%  numa-vmstat.node1.nr_anon_pages
      1232 ± 12%    +292.6%       4838 ±  2%  numa-vmstat.node1.nr_dirty
     91058 ±  6%     +51.4%     137886 ± 27%  numa-vmstat.node1.nr_inactive_anon
      1151 ± 13%    +304.0%       4652 ±  2%  numa-vmstat.node1.nr_inactive_file
     15815 ±  3%     -15.8%      13314 ±  5%  numa-vmstat.node1.nr_mapped
     47170 ±  6%    +210.8%     146602 ±  9%  numa-vmstat.node1.nr_shmem
     39337 ±  6%    +255.2%     139725 ±  9%  numa-vmstat.node1.nr_zone_active_anon
     91057 ±  6%     +51.4%     137886 ± 27%  numa-vmstat.node1.nr_zone_inactive_anon
      1152 ± 13%    +303.9%       4653 ±  2%  numa-vmstat.node1.nr_zone_inactive_file
      1236 ± 11%    +291.2%       4838 ±  2%  numa-vmstat.node1.nr_zone_write_pending
     40142 ±  6%    +336.3%     175139        proc-vmstat.nr_active_anon
      2513 ± 13%    +285.4%       9689 ±  2%  proc-vmstat.nr_dirty
    831402           +17.1%     973470        proc-vmstat.nr_file_pages
      2441 ± 12%    +285.8%       9418 ±  2%  proc-vmstat.nr_inactive_file
     69493            +2.0%      70915        proc-vmstat.nr_kernel_stack
     20344 ±  4%     -17.7%      16735 ±  4%  proc-vmstat.nr_mapped
     48995 ±  6%    +275.3%     183884        proc-vmstat.nr_shmem
     36752            +3.8%      38146        proc-vmstat.nr_slab_reclaimable
     92049            +1.9%      93797        proc-vmstat.nr_slab_unreclaimable
     40142 ±  6%    +336.3%     175139        proc-vmstat.nr_zone_active_anon
      2441 ± 12%    +285.8%       9418 ±  2%  proc-vmstat.nr_zone_inactive_file
      2514 ± 13%    +285.4%       9689 ±  2%  proc-vmstat.nr_zone_write_pending
     19089 ± 46%    +335.3%      83099 ±  7%  proc-vmstat.numa_hint_faults
      6990 ± 46%    +253.6%      24719 ± 16%  proc-vmstat.numa_hint_faults_local
    134151            +1.3%     135903        proc-vmstat.numa_other
     20210 ± 51%    +155.8%      51698 ± 11%  proc-vmstat.numa_pages_migrated
     82751 ±  4%     +80.9%     149676 ±  2%  proc-vmstat.pgactivate
    541420 ±  2%     +74.6%     945466        proc-vmstat.pgfault
     20210 ± 51%    +155.8%      51698 ± 11%  proc-vmstat.pgmigrate_success
     19901 ±  6%    +286.8%      76986 ±  4%  proc-vmstat.pgreuse
      1613            +6.0%       1710        proc-vmstat.unevictable_pgs_culled
      1.42           +25.8%       1.79 ±  2%  perf-stat.i.MPKI
 7.299e+09 ±  2%      -6.4%   6.83e+09        perf-stat.i.branch-instructions
      1.49            -0.8        0.64 ±  3%  perf-stat.i.branch-miss-rate%
  44541839           -48.5%   22959002 ±  3%  perf-stat.i.branch-misses
     18.21            +9.8       28.04        perf-stat.i.cache-miss-rate%
  61025158            -5.9%   57408775 ±  3%  perf-stat.i.cache-misses
 3.149e+08 ±  2%     -37.2%  1.978e+08        perf-stat.i.cache-references
     38871           -63.9%      14030 ±  3%  perf-stat.i.context-switches
      2.05 ±  7%    +251.1%       7.19        perf-stat.i.cpi
 8.576e+10 ±  5%    +169.9%  2.314e+11        perf-stat.i.cpu-cycles
      1308 ±  3%      +8.5%       1419        perf-stat.i.cpu-migrations
      1645 ±  4%    +140.5%       3958 ±  4%  perf-stat.i.cycles-between-cache-misses
 3.692e+10 ±  2%     -17.1%   3.06e+10        perf-stat.i.instructions
      0.63 ±  4%     -65.0%       0.22 ±  2%  perf-stat.i.ipc
     12.95 ± 42%     -69.0%       4.01 ± 61%  perf-stat.i.major-faults
      8505           -37.7%       5295        perf-stat.i.minor-faults
      8518           -37.8%       5299        perf-stat.i.page-faults
      1.66           +13.3%       1.88 ±  3%  perf-stat.overall.MPKI
      0.60            -0.3        0.33 ±  2%  perf-stat.overall.branch-miss-rate%
     19.38            +9.6       28.99        perf-stat.overall.cache-miss-rate%
      2.33 ±  7%    +224.6%       7.56        perf-stat.overall.cpi
      1405 ±  6%    +186.9%       4033 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.43 ±  7%     -69.3%       0.13        perf-stat.overall.ipc
 7.207e+09            -5.5%  6.808e+09        perf-stat.ps.branch-instructions
  43291321           -47.5%   22711270 ±  3%  perf-stat.ps.branch-misses
 3.116e+08           -36.6%  1.975e+08 ±  2%  perf-stat.ps.cache-references
     38344           -63.6%      13959 ±  3%  perf-stat.ps.context-switches
    125758            +1.2%     127229        perf-stat.ps.cpu-clock
 8.483e+10 ±  5%    +171.9%  2.306e+11        perf-stat.ps.cpu-cycles
      1294 ±  3%      +9.2%       1413        perf-stat.ps.cpu-migrations
 3.646e+10           -16.3%   3.05e+10        perf-stat.ps.instructions
     12.63 ± 41%     -69.9%       3.80 ± 61%  perf-stat.ps.major-faults
      8238 ±  2%     -36.3%       5244        perf-stat.ps.minor-faults
      8251           -36.4%       5248        perf-stat.ps.page-faults
    125759            +1.2%     127229        perf-stat.ps.task-clock
 2.098e+12          +144.4%  5.127e+12 ±  2%  perf-stat.total.instructions
     60724 ±213%   +5951.6%    3674801 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
    114098 ±127%   +3234.6%    3804798 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.max
     49147 ±223%   +6666.0%    3325321 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.min
      9287 ± 82%    +402.9%      46708 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.10 ± 21%    +483.2%       0.56 ±  5%  sched_debug.cfs_rq:/.h_nr_running.avg
      0.29 ± 12%     +35.8%       0.40 ±  6%  sched_debug.cfs_rq:/.h_nr_running.stddev
     60724 ±213%   +5951.6%    3674801 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
    114098 ±127%   +3234.6%    3804798 ±  2%  sched_debug.cfs_rq:/.min_vruntime.max
     49147 ±223%   +6666.0%    3325321 ±  2%  sched_debug.cfs_rq:/.min_vruntime.min
      9287 ± 82%    +402.9%      46708 ±  7%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.10 ± 21%    +474.1%       0.55 ±  5%  sched_debug.cfs_rq:/.nr_running.avg
      0.29 ± 12%     +31.1%       0.38 ±  6%  sched_debug.cfs_rq:/.nr_running.stddev
    538.50 ±  3%     -66.6%     179.83 ±  7%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     95.13 ± 27%     -67.9%      30.54 ± 23%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    538.50 ±  3%     -66.6%     179.72 ±  6%  sched_debug.cfs_rq:/.removed.util_avg.max
     95.13 ± 27%     -67.9%      30.53 ± 23%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    241.32 ± 21%    +138.3%     575.17 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
    240.10 ± 21%    +134.5%     562.97 ±  2%  sched_debug.cfs_rq:/.util_avg.avg
     14.27 ± 15%   +2240.2%     333.84 ±  6%  sched_debug.cfs_rq:/.util_est.avg
    535.00 ±  8%     +84.8%     988.89 ± 13%  sched_debug.cfs_rq:/.util_est.max
     80.41 ± 10%    +183.4%     227.90 ±  7%  sched_debug.cfs_rq:/.util_est.stddev
     47908 ±201%    +769.1%     416347 ± 15%  sched_debug.cpu.avg_idle.min
    199653 ± 14%     -43.5%     112758 ±  8%  sched_debug.cpu.avg_idle.stddev
     56473 ± 18%     +99.1%     112426        sched_debug.cpu.clock.avg
     56479 ± 18%     +99.1%     112467        sched_debug.cpu.clock.max
     56465 ± 18%     +99.0%     112381        sched_debug.cpu.clock.min
      3.29 ±  5%    +640.5%      24.36 ±  3%  sched_debug.cpu.clock.stddev
     56312 ± 18%     +99.2%     112158        sched_debug.cpu.clock_task.avg
     56453 ± 18%     +99.0%     112333        sched_debug.cpu.clock_task.max
     47566 ± 21%    +117.0%     103239        sched_debug.cpu.clock_task.min
    276.10 ± 21%    +944.3%       2883 ±  7%  sched_debug.cpu.curr->pid.avg
      3643 ± 27%     +99.7%       7277        sched_debug.cpu.curr->pid.max
    880.86 ±  6%    +119.7%       1935 ±  6%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 13%    +109.3%       0.00 ±  4%  sched_debug.cpu.next_balance.stddev
      0.10 ± 24%    +481.3%       0.55 ±  5%  sched_debug.cpu.nr_running.avg
      0.29 ± 14%     +37.6%       0.40 ±  6%  sched_debug.cpu.nr_running.stddev
     14194 ± 65%    +137.2%      33663 ± 25%  sched_debug.cpu.nr_switches.max
      1930 ± 35%     +72.4%       3328 ± 19%  sched_debug.cpu.nr_switches.stddev
      0.01 ± 58%  +1.7e+05%      15.16        sched_debug.cpu.nr_uninterruptible.avg
     26.92 ± 15%    +153.5%      68.22 ± 21%  sched_debug.cpu.nr_uninterruptible.max
      6.58 ± 26%    +169.3%      17.73 ± 20%  sched_debug.cpu.nr_uninterruptible.stddev
     56468 ± 18%     +99.0%     112382        sched_debug.cpu_clk
     55236 ± 18%    +101.2%     111149        sched_debug.ktime
      0.00 ± 23%     -56.7%       0.00 ± 97%  sched_debug.rt_rq:.rt_time.avg
      0.21 ± 23%     -56.7%       0.09 ± 97%  sched_debug.rt_rq:.rt_time.max
      0.02 ± 23%     -56.7%       0.01 ± 97%  sched_debug.rt_rq:.rt_time.stddev
     57389 ± 18%     +97.5%     113316        sched_debug.sched_clk
     65.84 ±  2%     -64.5        1.34 ±  7%  perf-profile.calltrace.cycles-pp.read
     64.92 ±  2%     -63.7        1.24 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     64.80 ±  2%     -63.6        1.23 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     64.30 ±  2%     -63.1        1.19 ±  8%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     63.51 ±  2%     -62.4        1.14 ±  8%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     62.07 ±  2%     -61.0        1.04 ±  8%  perf-profile.calltrace.cycles-pp.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     61.90 ±  2%     -60.9        1.01 ±  9%  perf-profile.calltrace.cycles-pp.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64
     29.82 ±  3%     -29.2        0.66 ± 12%  perf-profile.calltrace.cycles-pp.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     25.30           -25.3        0.00        perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     25.21           -25.2        0.00        perf-profile.calltrace.cycles-pp.down_read.xfs_ilock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     23.01 ±  3%     -23.0        0.00        perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     22.94 ±  3%     -22.9        0.00        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_read.xfs_file_buffered_read.xfs_file_read_iter
     13.72 ±  3%     -12.5        1.24 ±  3%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      7.44 ±  3%      -6.8        0.64 ±  3%  perf-profile.calltrace.cycles-pp.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      6.63 ± 10%      -6.6        0.00        perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
      6.55 ± 10%      -6.5        0.00        perf-profile.calltrace.cycles-pp.up_read.xfs_iunlock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
      3.97 ±  9%      -2.6        1.36 ±  4%  perf-profile.calltrace.cycles-pp.unlink
      3.96 ±  9%      -2.6        1.36 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      3.96 ±  9%      -2.6        1.36 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      3.91 ±  9%      -2.6        1.35 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      3.90 ±  9%      -2.6        1.34 ±  4%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      3.58 ± 10%      -2.4        1.22 ±  4%  perf-profile.calltrace.cycles-pp.down_write.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.58 ± 10%      -2.4        1.22 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.do_unlinkat.__x64_sys_unlink.do_syscall_64
      3.48 ± 10%      -2.3        1.19 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.do_unlinkat.__x64_sys_unlink
      2.97 ± 10%      -2.0        0.94 ±  6%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.do_unlinkat
      1.59 ± 10%      -0.8        0.83        perf-profile.calltrace.cycles-pp.creat64
      1.58 ± 10%      -0.8        0.82        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      1.58 ± 10%      -0.8        0.82        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
      1.55 ± 10%      -0.7        0.82        perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      1.55 ± 10%      -0.7        0.82        perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      1.54 ± 10%      -0.7        0.82        perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.54 ± 10%      -0.7        0.82        perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64
      1.52 ± 10%      -0.7        0.82        perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      1.05 ± 11%      -0.5        0.52 ±  2%  perf-profile.calltrace.cycles-pp.down_write.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      1.05 ± 11%      -0.5        0.52 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.open_last_lookups.path_openat.do_filp_open
      0.48 ± 45%      +1.2        1.68 ±  9%  perf-profile.calltrace.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.48 ± 45%      +1.2        1.70 ±  9%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      0.39 ± 71%      +1.3        1.68 ±  9%  perf-profile.calltrace.cycles-pp.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified
      0.00            +1.6        1.57 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve
      0.00            +1.6        1.59 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc
      0.00            +1.6        1.62 ± 10%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time
      2.23 ±  2%      +3.5        5.74 ±  2%  perf-profile.calltrace.cycles-pp.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      0.00            +3.7        3.72 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified
      0.00            +3.7        3.74 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.00            +3.8        3.77 ±  6%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      1.56 ±  4%      +4.1        5.67 ±  2%  perf-profile.calltrace.cycles-pp.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write
      1.23 ±  8%      +4.4        5.62 ±  2%  perf-profile.calltrace.cycles-pp.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write
     23.86 ±  3%     +71.8       95.66        perf-profile.calltrace.cycles-pp.write
     17.39 ±  4%     +72.0       89.43        perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
     23.06 ±  3%     +72.5       95.54        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     22.96 ±  3%     +72.6       95.53        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     22.63 ±  3%     +72.9       95.48        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     22.28 ±  3%     +73.2       95.44        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     21.19 ±  3%     +74.1       95.30        perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.27 ±  5%     +84.9       88.14        perf-profile.calltrace.cycles-pp.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      2.26 ±  6%     +85.8       88.03        perf-profile.calltrace.cycles-pp.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      0.00           +86.4       86.42        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin
      0.00           +86.7       86.66        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter
      0.49 ± 45%     +87.0       87.48        perf-profile.calltrace.cycles-pp.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.00           +87.2       87.16        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write
     66.11 ±  2%     -64.7        1.38 ±  7%  perf-profile.children.cycles-pp.read
     64.34 ±  2%     -63.1        1.20 ±  8%  perf-profile.children.cycles-pp.ksys_read
     63.54 ±  2%     -62.4        1.15 ±  8%  perf-profile.children.cycles-pp.vfs_read
     62.08 ±  2%     -61.0        1.04 ±  8%  perf-profile.children.cycles-pp.xfs_file_read_iter
     61.93 ±  2%     -60.9        1.01 ±  8%  perf-profile.children.cycles-pp.xfs_file_buffered_read
     29.86 ±  3%     -29.2        0.67 ± 12%  perf-profile.children.cycles-pp.filemap_read
     26.60           -26.2        0.44 ±  4%  perf-profile.children.cycles-pp.xfs_ilock
     25.28           -25.0        0.27 ±  6%  perf-profile.children.cycles-pp.down_read
     23.02 ±  3%     -22.8        0.19 ±  6%  perf-profile.children.cycles-pp.touch_atime
     22.99 ±  3%     -22.8        0.19 ±  6%  perf-profile.children.cycles-pp.atime_needs_update
     13.77 ±  3%     -12.5        1.24 ±  3%  perf-profile.children.cycles-pp.iomap_write_iter
      7.59 ±  8%      -7.4        0.23 ±  3%  perf-profile.children.cycles-pp.xfs_iunlock
      7.51 ±  3%      -6.9        0.64 ±  3%  perf-profile.children.cycles-pp.iomap_write_begin
      6.59 ± 10%      -6.5        0.05        perf-profile.children.cycles-pp.up_read
      4.71 ± 11%      -4.5        0.25 ± 26%  perf-profile.children.cycles-pp.filemap_get_pages
      4.34 ±  2%      -4.0        0.38 ±  4%  perf-profile.children.cycles-pp.__filemap_get_folio
      5.74 ±  7%      -3.9        1.82 ±  3%  perf-profile.children.cycles-pp.down_write
      3.57 ±  2%      -3.3        0.28 ±  4%  perf-profile.children.cycles-pp.iomap_write_end
      4.63 ± 10%      -2.9        1.75 ±  3%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      3.98 ±  9%      -2.6        1.36 ±  4%  perf-profile.children.cycles-pp.unlink
      4.20 ± 10%      -2.6        1.59 ±  4%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      3.91 ±  9%      -2.6        1.35 ±  4%  perf-profile.children.cycles-pp.__x64_sys_unlink
      3.90 ±  9%      -2.6        1.35 ±  4%  perf-profile.children.cycles-pp.do_unlinkat
      3.59 ± 11%      -2.3        1.27 ±  4%  perf-profile.children.cycles-pp.osq_lock
      2.47 ±  6%      -2.3        0.22 ±  3%  perf-profile.children.cycles-pp.__iomap_write_begin
      2.46 ±  6%      -2.2        0.23 ± 28%  perf-profile.children.cycles-pp.filemap_get_read_batch
      2.25 ±  2%      -2.1        0.19 ±  4%  perf-profile.children.cycles-pp.filemap_add_folio
      1.81 ±  6%      -1.7        0.14 ±  4%  perf-profile.children.cycles-pp.iomap_set_range_uptodate
      1.82 ±  9%      -1.6        0.24 ±  6%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.82 ±  9%      -1.6        0.24 ±  6%  perf-profile.children.cycles-pp.do_idle
      1.82 ±  9%      -1.6        0.24 ±  6%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      1.80 ±  9%      -1.6        0.24 ±  5%  perf-profile.children.cycles-pp.start_secondary
      1.74 ±  9%      -1.5        0.24 ±  6%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.68 ±  6%      -1.5        0.18 ±  3%  perf-profile.children.cycles-pp.__close
      1.67 ±  6%      -1.5        0.18 ±  3%  perf-profile.children.cycles-pp.__x64_sys_close
      1.66 ±  6%      -1.5        0.18 ±  3%  perf-profile.children.cycles-pp.__fput
      1.65 ±  6%      -1.5        0.18 ±  3%  perf-profile.children.cycles-pp.dput
      1.64 ±  6%      -1.5        0.18 ±  3%  perf-profile.children.cycles-pp.__dentry_kill
      1.61 ±  6%      -1.4        0.17 ±  5%  perf-profile.children.cycles-pp.evict
      1.60 ±  6%      -1.4        0.17 ±  3%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      1.83 ±  7%      -1.4        0.41 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.64 ±  9%      -1.4        0.22 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter
      1.63 ±  9%      -1.4        0.22 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.52 ±  2%      -1.4        0.14 ±  4%  perf-profile.children.cycles-pp.__filemap_add_folio
      1.60 ±  9%      -1.4        0.22 ±  6%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.59 ±  9%      -1.4        0.21 ±  5%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.30 ±  4%      -1.2        0.10 ±  4%  perf-profile.children.cycles-pp.filemap_dirty_folio
      1.32 ±  8%      -1.2        0.15 ±  4%  perf-profile.children.cycles-pp.zero_user_segments
      1.29 ±  8%      -1.1        0.15 ±  3%  perf-profile.children.cycles-pp.memset_orig
      1.22 ±  7%      -0.9        0.28 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.04 ±  9%      -0.9        0.12 ±  4%  perf-profile.children.cycles-pp.copy_page_to_iter
      1.07 ±  3%      -0.9        0.16 ±  8%  perf-profile.children.cycles-pp.__xfs_trans_commit
      0.96 ±  3%      -0.9        0.11 ±  5%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.96 ±  3%      -0.8        0.12 ±  7%  perf-profile.children.cycles-pp.xlog_cil_commit
      0.94 ±  9%      -0.8        0.11 ±  4%  perf-profile.children.cycles-pp._copy_to_iter
      0.89 ±  7%      -0.8        0.11 ±  3%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      1.61 ± 10%      -0.8        0.83        perf-profile.children.cycles-pp.do_sys_openat2
      1.60 ± 10%      -0.8        0.83        perf-profile.children.cycles-pp.creat64
      1.58 ± 10%      -0.8        0.82        perf-profile.children.cycles-pp.do_filp_open
      1.58 ± 10%      -0.8        0.82        perf-profile.children.cycles-pp.path_openat
      1.55 ± 10%      -0.7        0.82        perf-profile.children.cycles-pp.__x64_sys_creat
      0.80            -0.7        0.07 ±  7%  perf-profile.children.cycles-pp.folio_alloc
      1.52 ± 11%      -0.7        0.82        perf-profile.children.cycles-pp.open_last_lookups
      0.80 ±  5%      -0.7        0.13 ±  2%  perf-profile.children.cycles-pp.up_write
      0.71            -0.6        0.06 ±  7%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.69 ±  5%      -0.6        0.06 ±  9%  perf-profile.children.cycles-pp.folio_add_lru
      0.71 ± 10%      -0.6        0.10 ±  5%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.82 ±  7%      -0.6        0.22 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.65            -0.6        0.06 ±  8%  perf-profile.children.cycles-pp.__alloc_pages
      0.66 ±  3%      -0.6        0.07 ±  7%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.80 ±  7%      -0.6        0.21 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.67 ±  4%      -0.6        0.08 ±  8%  perf-profile.children.cycles-pp.rw_verify_area
      0.64 ±  9%      -0.6        0.07 ±  5%  perf-profile.children.cycles-pp.__fdget_pos
      0.62 ±  6%      -0.6        0.06        perf-profile.children.cycles-pp.__folio_mark_dirty
      0.62 ±  6%      -0.6        0.07 ±  7%  perf-profile.children.cycles-pp.filemap_get_entry
      0.61 ±  5%      -0.6        0.06 ±  6%  perf-profile.children.cycles-pp.release_pages
      0.60 ±  8%      -0.5        0.08        perf-profile.children.cycles-pp.xas_load
      0.56 ±  5%      -0.5        0.05 ±  7%  perf-profile.children.cycles-pp.__folio_batch_release
      0.54 ±  6%      -0.5        0.04 ± 44%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.53 ±  7%      -0.5        0.07        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.52 ±  9%      -0.4        0.07 ±  5%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50 ±  6%      -0.4        0.06 ±  6%  perf-profile.children.cycles-pp.security_file_permission
      0.48 ±  7%      -0.4        0.06 ±  6%  perf-profile.children.cycles-pp.fault_in_readable
      0.47 ±  9%      -0.4        0.06 ±  9%  perf-profile.children.cycles-pp.iomap_iter_advance
      0.47 ±  9%      -0.4        0.06 ±  6%  perf-profile.children.cycles-pp.__cond_resched
      0.66 ± 10%      -0.4        0.26        perf-profile.children.cycles-pp.kthread
      0.66 ± 10%      -0.4        0.26        perf-profile.children.cycles-pp.ret_from_fork
      0.66 ± 10%      -0.4        0.26        perf-profile.children.cycles-pp.ret_from_fork_asm
      0.64 ± 11%      -0.4        0.25        perf-profile.children.cycles-pp.worker_thread
      0.82 ±  8%      -0.4        0.44        perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.54 ±  6%      -0.4        0.16 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.40 ±  8%      -0.4        0.02 ± 99%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      0.42 ±  6%      -0.4        0.05        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.44 ±  8%      -0.4        0.07 ±  5%  perf-profile.children.cycles-pp.__schedule
      0.60 ± 11%      -0.4        0.24        perf-profile.children.cycles-pp.process_one_work
      0.39 ±  6%      -0.4        0.02 ± 99%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.50 ±  6%      -0.4        0.15        perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.37 ±  6%      -0.3        0.02 ± 99%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.57 ± 10%      -0.3        0.23 ±  2%  perf-profile.children.cycles-pp.xfs_inodegc_worker
      0.56 ± 10%      -0.3        0.23 ±  2%  perf-profile.children.cycles-pp.xfs_inactive
      0.37 ±  4%      -0.3        0.05        perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.39 ±  9%      -0.3        0.07 ±  5%  perf-profile.children.cycles-pp.schedule
      0.44 ±  7%      -0.3        0.13 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.44 ±  6%      -0.3        0.14 ±  3%  perf-profile.children.cycles-pp.tick_sched_handle
      0.35 ±  8%      -0.3        0.07 ±  7%  perf-profile.children.cycles-pp.load_balance
      0.33 ±  8%      -0.3        0.06        perf-profile.children.cycles-pp.pick_next_task_fair
      0.32 ±  8%      -0.3        0.06 ±  6%  perf-profile.children.cycles-pp.newidle_balance
      0.32 ±  9%      -0.2        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      0.30 ±  9%      -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.find_busiest_group
      0.30 ±  9%      -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.28 ±  9%      -0.2        0.05        perf-profile.children.cycles-pp.update_sg_lb_stats
      0.32 ±  5%      -0.2        0.11        perf-profile.children.cycles-pp.scheduler_tick
      0.27 ±  9%      -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.xfs_buf_read_map
      0.35 ± 11%      -0.2        0.14 ±  3%  perf-profile.children.cycles-pp.xfs_inactive_ifree
      0.26 ±  9%      -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.xfs_buf_get_map
      0.23 ± 10%      -0.2        0.04 ± 44%  perf-profile.children.cycles-pp.xfs_buf_lookup
      0.23 ±  9%      -0.2        0.06 ±  9%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.26 ±  7%      -0.2        0.10        perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.43 ±  8%      -0.1        0.28        perf-profile.children.cycles-pp.lookup_open
      0.26 ±  7%      -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.vfs_unlink
      0.34 ±  8%      -0.1        0.20        perf-profile.children.cycles-pp.xfs_generic_create
      0.22 ± 11%      -0.1        0.08        perf-profile.children.cycles-pp.xfs_inactive_truncate
      0.25 ±  8%      -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.xfs_remove
      0.25 ±  8%      -0.1        0.12 ±  3%  perf-profile.children.cycles-pp.xfs_vn_unlink
      0.32 ±  9%      -0.1        0.19 ±  2%  perf-profile.children.cycles-pp.xfs_create
      0.17 ±  5%      -0.1        0.06        perf-profile.children.cycles-pp.task_tick_fair
      0.07 ±  7%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.main
      0.07 ±  7%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.run_builtin
      0.06 ± 11%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_vn_lookup
      0.06 ±  8%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_lookup
      0.06 ±  9%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_dir_lookup
      0.00            +0.1        0.07 ±  8%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.xfs_ilock_data_map_shared
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_iget
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_iget_cache_hit
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.xfs_icreate
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_lock_two_inodes
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.mean_and_variance_weighted_update
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.xfs_trans_alloc_dir
      0.00            +0.3        0.30 ±  2%  perf-profile.children.cycles-pp.time_stats_update_one
      0.66 ±  7%      +1.1        1.73 ±  9%  perf-profile.children.cycles-pp.xfs_trans_reserve
      0.67 ±  7%      +1.1        1.75 ±  9%  perf-profile.children.cycles-pp.xfs_trans_alloc
      0.64 ±  8%      +1.1        1.73 ±  9%  perf-profile.children.cycles-pp.xfs_log_reserve
      2.29 ±  2%      +3.5        5.75 ±  2%  perf-profile.children.cycles-pp.xfs_file_write_checks
     95.39            +3.8       99.21        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     95.22            +4.0       99.19        perf-profile.children.cycles-pp.do_syscall_64
      1.59 ±  4%      +4.1        5.67 ±  2%  perf-profile.children.cycles-pp.kiocb_modified
      1.23 ±  8%      +4.4        5.62 ±  2%  perf-profile.children.cycles-pp.xfs_vn_update_time
     24.16 ±  3%     +71.6       95.72        perf-profile.children.cycles-pp.write
     17.42 ±  4%     +72.0       89.43        perf-profile.children.cycles-pp.iomap_file_buffered_write
     22.70 ±  3%     +72.8       95.52        perf-profile.children.cycles-pp.ksys_write
     22.35 ±  3%     +73.1       95.48        perf-profile.children.cycles-pp.vfs_write
     21.23 ±  3%     +74.1       95.30        perf-profile.children.cycles-pp.xfs_file_buffered_write
      3.32 ±  5%     +84.8       88.15        perf-profile.children.cycles-pp.iomap_iter
      2.34 ±  6%     +85.7       88.05        perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      0.61 ±  7%     +86.9       87.51        perf-profile.children.cycles-pp.xfs_ilock_for_iomap
      0.26 ±  7%     +91.9       92.17        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.51 ±  3%     +92.0       92.47        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00           +93.0       93.01        perf-profile.children.cycles-pp.__time_stats_update
     25.09           -24.8        0.26 ±  6%  perf-profile.self.cycles-pp.down_read
     22.67 ±  3%     -22.5        0.16 ±  6%  perf-profile.self.cycles-pp.atime_needs_update
      6.55 ± 10%      -6.5        0.05        perf-profile.self.cycles-pp.up_read
      3.55 ± 11%      -2.3        1.27 ±  4%  perf-profile.self.cycles-pp.osq_lock
      2.22 ±  7%      -2.0        0.20 ± 32%  perf-profile.self.cycles-pp.filemap_get_read_batch
      1.78 ±  6%      -1.6        0.14 ±  2%  perf-profile.self.cycles-pp.iomap_set_range_uptodate
      1.28 ±  8%      -1.1        0.15 ±  3%  perf-profile.self.cycles-pp.memset_orig
      1.05 ± 14%      -1.0        0.05 ±  8%  perf-profile.self.cycles-pp.vfs_read
      1.02 ±  6%      -0.9        0.10 ±  4%  perf-profile.self.cycles-pp.filemap_read
      0.95 ±  5%      -0.9        0.06 ±  6%  perf-profile.self.cycles-pp.down_write
      0.95 ±  2%      -0.8        0.11 ±  6%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.93 ±  9%      -0.8        0.11 ±  3%  perf-profile.self.cycles-pp._copy_to_iter
      0.73 ±  3%      -0.7        0.04 ± 44%  perf-profile.self.cycles-pp.iomap_write_end
      0.73 ±  8%      -0.6        0.10 ±  4%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.72 ±  5%      -0.6        0.12 ±  4%  perf-profile.self.cycles-pp.up_write
      0.62 ±  9%      -0.6        0.06 ±  7%  perf-profile.self.cycles-pp.__fdget_pos
      0.55 ±  7%      -0.5        0.07 ±  9%  perf-profile.self.cycles-pp.vfs_write
      0.50 ±  8%      -0.4        0.07        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.47 ±  6%      -0.4        0.06 ±  6%  perf-profile.self.cycles-pp.fault_in_readable
      0.46 ±  8%      -0.4        0.06 ±  6%  perf-profile.self.cycles-pp.iomap_iter_advance
      0.81 ±  8%      -0.4        0.44        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.41 ± 10%      -0.4        0.05        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.47 ±  8%      -0.3        0.21 ±  3%  perf-profile.self.cycles-pp.xfs_buffered_write_iomap_begin
      0.28 ± 10%      -0.2        0.06        perf-profile.self.cycles-pp.xfs_iunlock
      0.26 ±  7%      -0.2        0.10        perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.12 ±  9%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.xfs_ilock_for_iomap
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.mean_and_variance_weighted_update
      0.00            +0.2        0.22 ±  2%  perf-profile.self.cycles-pp.time_stats_update_one
      0.00            +0.3        0.26        perf-profile.self.cycles-pp.__time_stats_update
      0.26 ±  7%     +91.9       92.16        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/disk_rr/aim7

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 4.022e+09          +286.9%  1.556e+10        cpuidle..time
   3109334          +191.8%    9073047        cpuidle..usage
     87.82 ±  2%    +147.7%     217.51        uptime.boot
     10014 ±  3%    +114.5%      21478        uptime.idle
     82.91           -12.4%      72.59        iostat.cpu.idle
     15.48           +74.5%      27.01 ±  2%  iostat.cpu.system
      1.60           -75.4%       0.39 ±  2%  iostat.cpu.user
     82.92           -12.5%      72.55        vmstat.cpu.id
     20.62 ±  8%     +76.7%      36.43 ±  3%  vmstat.procs.r
     58002           -73.3%      15496 ±  2%  vmstat.system.cs
    145812           -25.1%     109180        vmstat.system.in
      1.83 ± 58%  +21609.1%     398.00 ±  9%  perf-c2c.DRAM.local
     37.33 ± 12%  +63336.6%      23683        perf-c2c.DRAM.remote
     24.50 ± 24%  +68055.1%      16698 ±  2%  perf-c2c.HITM.local
      9.50 ± 20%  +1.1e+05%      10837 ±  3%  perf-c2c.HITM.remote
     34.00 ± 21%  +80887.7%      27535 ±  2%  perf-c2c.HITM.total
     82.10            -9.8       72.28        mpstat.cpu.all.idle%
      0.23 ±  2%      -0.1        0.14        mpstat.cpu.all.irq%
      0.09            -0.0        0.06        mpstat.cpu.all.soft%
     15.95           +11.2       27.12 ±  2%  mpstat.cpu.all.sys%
      1.63            -1.2        0.39 ±  2%  mpstat.cpu.all.usr%
     28.68 ± 14%    +210.6%      89.09 ±  2%  mpstat.max_utilization_pct
    506286           -78.5%     108634 ±  2%  aim7.jobs-per-min
     35.74          +364.4%     165.95 ±  2%  aim7.time.elapsed_time
     35.74          +364.4%     165.95 ±  2%  aim7.time.elapsed_time.max
     52012 ±  4%    +286.3%     200918        aim7.time.involuntary_context_switches
    972.83 ± 17%     -55.8%     429.83 ± 64%  aim7.time.major_page_faults
    175190           +25.4%     219689 ±  4%  aim7.time.minor_page_faults
    659.89          +769.8%       5739 ±  4%  aim7.time.system_time
    485573            +2.9%     499583        aim7.time.voluntary_context_switches
     40533          +659.1%     307702        meminfo.Active
     36956          +730.5%     306930        meminfo.Active(anon)
      3577 ±  4%     -78.4%     771.31 ± 21%  meminfo.Active(file)
     41804          +245.2%     144289        meminfo.AnonHugePages
   4204470           +20.7%    5074474        meminfo.Cached
   3123403           +10.9%    3464843        meminfo.Committed_AS
   1000298           +63.6%    1636831        meminfo.Dirty
   1842596           +33.4%    2457188        meminfo.Inactive
   1002406           +63.5%    1639021        meminfo.Inactive(file)
    141036           +10.5%     155843        meminfo.KReclaimable
     96676           -58.1%      40484        meminfo.Mapped
    141036           +10.5%     155843        meminfo.SReclaimable
     85961          +270.0%     318017        meminfo.Shmem
      5516 ± 34%    +562.1%      36526 ± 29%  numa-meminfo.node0.Active
      3861 ± 43%    +834.2%      36069 ± 29%  numa-meminfo.node0.Active(anon)
      1655 ± 16%     -72.4%     457.02 ± 19%  numa-meminfo.node0.Active(file)
    428365 ± 13%     -51.9%     205980 ± 70%  numa-meminfo.node0.AnonPages
    499321           +64.0%     819091        numa-meminfo.node0.Dirty
   1395085 ± 81%    +100.5%    2797772 ± 45%  numa-meminfo.node0.FilePages
    430360 ± 13%     -51.8%     207258 ± 70%  numa-meminfo.node0.Inactive(anon)
    500717           +63.8%     820179        numa-meminfo.node0.Inactive(file)
     53923 ± 37%     +51.1%      81464 ± 23%  numa-meminfo.node0.KReclaimable
     53923 ± 37%     +51.1%      81464 ± 23%  numa-meminfo.node0.SReclaimable
      9148 ± 18%    +342.5%      40479 ± 25%  numa-meminfo.node0.Shmem
     34935 ±  5%    +676.5%     271264 ±  3%  numa-meminfo.node1.Active
     33127 ±  5%    +717.7%     270893 ±  3%  numa-meminfo.node1.Active(anon)
      1807 ± 12%     -79.5%     370.48 ± 27%  numa-meminfo.node1.Active(file)
     20785 ± 82%    +593.8%     144199 ±  2%  numa-meminfo.node1.AnonHugePages
    366276 ± 15%     +65.0%     604188 ± 24%  numa-meminfo.node1.AnonPages
    406028 ± 14%     +64.5%     668110 ± 23%  numa-meminfo.node1.AnonPages.max
    501405           +63.0%     817411        numa-meminfo.node1.Dirty
    912965 ±  6%     +56.5%    1429144 ± 10%  numa-meminfo.node1.Inactive
    502134           +63.0%     818311        numa-meminfo.node1.Inactive(file)
     63618 ± 16%     -69.2%      19592 ± 65%  numa-meminfo.node1.Mapped
     77868 ±  2%    +256.5%     277598 ±  3%  numa-meminfo.node1.Shmem
      9255          +729.0%      76720        proc-vmstat.nr_active_anon
    858.16 ±  5%     -76.8%     199.08 ± 20%  proc-vmstat.nr_active_file
    198626            +2.0%     202558        proc-vmstat.nr_anon_pages
    250401           +63.4%     409075        proc-vmstat.nr_dirty
   1051898           +20.6%    1268433        proc-vmstat.nr_file_pages
    210445            -2.8%     204541        proc-vmstat.nr_inactive_anon
    250890           +63.2%     409553        proc-vmstat.nr_inactive_file
     68034            +4.8%      71287        proc-vmstat.nr_kernel_stack
     24977           -58.2%      10429        proc-vmstat.nr_mapped
     21943          +262.3%      79501        proc-vmstat.nr_shmem
     35260           +10.5%      38957        proc-vmstat.nr_slab_reclaimable
     90842            +4.2%      94700        proc-vmstat.nr_slab_unreclaimable
      9255          +729.0%      76720        proc-vmstat.nr_zone_active_anon
    858.71 ±  5%     -76.8%     199.08 ± 20%  proc-vmstat.nr_zone_active_file
    210445            -2.8%     204541        proc-vmstat.nr_zone_inactive_anon
    250890           +63.2%     409553        proc-vmstat.nr_zone_inactive_file
    250401           +63.4%     409074        proc-vmstat.nr_zone_write_pending
     10416 ± 46%    +430.9%      55301 ± 16%  proc-vmstat.numa_hint_faults
      3192 ± 32%    +840.3%      30016 ± 15%  proc-vmstat.numa_hint_faults_local
     10396 ± 83%    +155.9%      26605 ± 23%  proc-vmstat.numa_pages_migrated
    510354           +68.3%     858737 ±  2%  proc-vmstat.pgfault
     10396 ± 83%    +155.9%      26605 ± 23%  proc-vmstat.pgmigrate_success
     19583 ±  8%    +167.5%      52381 ±  7%  proc-vmstat.pgreuse
      1586           +16.9%       1854 ± 17%  proc-vmstat.unevictable_pgs_culled
    961.29 ± 45%    +838.0%       9017 ± 29%  numa-vmstat.node0.nr_active_anon
    472.89 ±  6%     -78.4%     102.25 ± 12%  numa-vmstat.node0.nr_active_file
    107153 ± 13%     -51.9%      51488 ± 70%  numa-vmstat.node0.nr_anon_pages
    125564           +62.9%     204492        numa-vmstat.node0.nr_dirty
    349504 ± 81%    +100.0%     699145 ± 45%  numa-vmstat.node0.nr_file_pages
    107650 ± 13%     -51.9%      51811 ± 70%  numa-vmstat.node0.nr_inactive_anon
    125899           +62.6%     204765        numa-vmstat.node0.nr_inactive_file
      2281 ± 20%    +343.6%      10122 ± 25%  numa-vmstat.node0.nr_shmem
     13480 ± 37%     +51.0%      20361 ± 23%  numa-vmstat.node0.nr_slab_reclaimable
    961.29 ± 45%    +838.0%       9017 ± 29%  numa-vmstat.node0.nr_zone_active_anon
    477.37 ±  6%     -78.5%     102.51 ± 11%  numa-vmstat.node0.nr_zone_active_file
    107650 ± 13%     -51.9%      51811 ± 70%  numa-vmstat.node0.nr_zone_inactive_anon
    125894           +62.6%     204760        numa-vmstat.node0.nr_zone_inactive_file
    125567           +62.9%     204491        numa-vmstat.node0.nr_zone_write_pending
      8176 ±  4%    +728.2%      67717 ±  3%  numa-vmstat.node1.nr_active_anon
    460.58 ± 11%     -78.6%      98.78 ± 18%  numa-vmstat.node1.nr_active_file
     91619 ± 15%     +64.8%     151031 ± 24%  numa-vmstat.node1.nr_anon_pages
    125690 ±  2%     +62.5%     204264        numa-vmstat.node1.nr_dirty
    125860 ±  2%     +62.5%     204466        numa-vmstat.node1.nr_inactive_file
     16188 ± 16%     -69.0%       5022 ± 64%  numa-vmstat.node1.nr_mapped
     19539 ±  4%    +255.2%      69408 ±  3%  numa-vmstat.node1.nr_shmem
      8176 ±  4%    +728.2%      67717 ±  3%  numa-vmstat.node1.nr_zone_active_anon
    460.57 ± 12%     -78.9%      97.40 ± 19%  numa-vmstat.node1.nr_zone_active_file
    125874 ±  2%     +62.4%     204467        numa-vmstat.node1.nr_zone_inactive_file
    125698 ±  2%     +62.5%     204265        numa-vmstat.node1.nr_zone_write_pending
      1.58           +66.2%       2.62        perf-stat.i.MPKI
 1.192e+10           -62.6%  4.464e+09        perf-stat.i.branch-instructions
      2.01 ±  2%      -1.3        0.74        perf-stat.i.branch-miss-rate%
  58629431           -63.5%   21406096        perf-stat.i.branch-misses
     23.08            +9.9       33.03        perf-stat.i.cache-miss-rate%
 1.258e+08           -54.0%   57816617        perf-stat.i.cache-misses
 4.603e+08           -63.4%  1.683e+08        perf-stat.i.cache-references
     59744           -73.9%      15587 ±  2%  perf-stat.i.context-switches
      0.85          +387.0%       4.13 ±  2%  perf-stat.i.cpi
 5.441e+10           +68.7%  9.177e+10 ±  2%  perf-stat.i.cpu-cycles
      1378           -49.0%     703.77 ±  2%  perf-stat.i.cpu-migrations
      1117 ±  2%     +50.2%       1678 ±  3%  perf-stat.i.cycles-between-cache-misses
 6.012e+10           -64.7%  2.119e+10        perf-stat.i.instructions
      1.21           -74.0%       0.31 ±  2%  perf-stat.i.ipc
     27.27 ± 21%     -89.9%       2.74 ± 63%  perf-stat.i.major-faults
     12030 ±  4%     -60.0%       4812        perf-stat.i.minor-faults
     12057 ±  4%     -60.1%       4815        perf-stat.i.page-faults
      2.10           +29.9%       2.72        perf-stat.overall.MPKI
     27.33            +7.0       34.33        perf-stat.overall.cache-miss-rate%
      0.91          +379.0%       4.35 ±  2%  perf-stat.overall.cpi
    432.97          +269.0%       1597 ±  3%  perf-stat.overall.cycles-between-cache-misses
      1.10           -79.1%       0.23 ±  2%  perf-stat.overall.ipc
 1.176e+10           -62.1%  4.453e+09        perf-stat.ps.branch-instructions
  56420555           -62.4%   21214593        perf-stat.ps.branch-misses
 1.243e+08           -53.7%   57567703        perf-stat.ps.cache-misses
 4.548e+08           -63.1%  1.677e+08        perf-stat.ps.cache-references
     58873           -73.7%      15483 ±  2%  perf-stat.ps.context-switches
    124508            +2.2%     127224        perf-stat.ps.cpu-clock
 5.382e+10           +70.8%  9.192e+10 ±  2%  perf-stat.ps.cpu-cycles
      1365           -48.6%     702.29 ±  2%  perf-stat.ps.cpu-migrations
 5.928e+10           -64.3%  2.114e+10        perf-stat.ps.instructions
     26.56 ± 16%     -90.1%       2.64 ± 63%  perf-stat.ps.major-faults
     11533 ±  3%     -58.8%       4748        perf-stat.ps.minor-faults
     11560 ±  3%     -58.9%       4751        perf-stat.ps.page-faults
    124508            +2.2%     127224        perf-stat.ps.task-clock
 2.183e+12           +61.8%  3.531e+12        perf-stat.total.instructions
      2663 ± 13%  +26943.0%     720263 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
     45242 ± 25%   +1760.4%     841668 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
     71.13 ± 23%    +9e+05%     643242 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
      5502 ± 22%    +443.6%      29912 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.12 ± 15%     +82.1%       0.22 ± 12%  sched_debug.cfs_rq:/.h_nr_running.avg
     23.29 ±200%  +17896.2%       4191 ± 48%  sched_debug.cfs_rq:/.left_deadline.avg
      2507 ±196%  +14707.5%     371229 ± 46%  sched_debug.cfs_rq:/.left_deadline.max
    222.70 ±196%  +16997.2%      38075 ± 43%  sched_debug.cfs_rq:/.left_deadline.stddev
     22.79 ±202%  +18296.2%       4191 ± 48%  sched_debug.cfs_rq:/.left_vruntime.avg
      2443 ±198%  +15094.3%     371219 ± 46%  sched_debug.cfs_rq:/.left_vruntime.max
    217.10 ±198%  +17437.7%      38074 ± 43%  sched_debug.cfs_rq:/.left_vruntime.stddev
      2663 ± 13%  +26940.2%     720263 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
     45242 ± 25%   +1760.4%     841668 ±  5%  sched_debug.cfs_rq:/.min_vruntime.max
     71.13 ± 23%    +9e+05%     643242 ±  4%  sched_debug.cfs_rq:/.min_vruntime.min
      5503 ± 22%    +443.5%      29912 ±  7%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.12 ± 15%     +82.1%       0.22 ± 12%  sched_debug.cfs_rq:/.nr_running.avg
     48.11 ± 38%     -77.3%      10.91 ± 29%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1024           -66.7%     341.33        sched_debug.cfs_rq:/.removed.load_avg.max
    209.92 ± 17%     -72.0%      58.79 ± 14%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     21.13 ± 40%     -77.0%       4.86 ± 35%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    544.33 ±  6%     -68.1%     173.67        sched_debug.cfs_rq:/.removed.runnable_avg.max
     96.69 ± 20%     -72.1%      26.99 ± 19%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     21.13 ± 40%     -77.0%       4.86 ± 35%  sched_debug.cfs_rq:/.removed.util_avg.avg
    544.17 ±  6%     -68.1%     173.56        sched_debug.cfs_rq:/.removed.util_avg.max
     96.68 ± 20%     -72.1%      26.99 ± 19%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     22.79 ±202%  +18296.2%       4191 ± 48%  sched_debug.cfs_rq:/.right_vruntime.avg
      2443 ±198%  +15094.3%     371219 ± 46%  sched_debug.cfs_rq:/.right_vruntime.max
    217.10 ±198%  +17437.7%      38074 ± 43%  sched_debug.cfs_rq:/.right_vruntime.stddev
      1255 ± 12%     -23.3%     962.56 ±  7%  sched_debug.cfs_rq:/.runnable_avg.max
    295.14 ±  5%     -31.6%     201.94 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
      1254 ± 13%     -23.7%     957.44 ±  8%  sched_debug.cfs_rq:/.util_avg.max
    294.47 ±  5%     -32.4%     199.11 ±  4%  sched_debug.cfs_rq:/.util_avg.stddev
     15.58 ± 33%    +226.6%      50.87 ± 14%  sched_debug.cfs_rq:/.util_est.avg
     81.45 ± 17%     +35.8%     110.58 ±  9%  sched_debug.cfs_rq:/.util_est.stddev
      4357 ± 20%   +8859.1%     390390 ± 11%  sched_debug.cpu.avg_idle.min
    201773 ±  4%     -47.9%     105067 ±  5%  sched_debug.cpu.avg_idle.stddev
     51582 ±  4%    +115.5%     111173        sched_debug.cpu.clock.avg
     51588 ±  4%    +115.6%     111208        sched_debug.cpu.clock.max
     51573 ±  4%    +115.5%     111134        sched_debug.cpu.clock.min
      3.41 ±  6%    +506.1%      20.68 ±  4%  sched_debug.cpu.clock.stddev
     51437 ±  4%    +115.6%     110910        sched_debug.cpu.clock_task.avg
     51577 ±  4%    +115.4%     111093        sched_debug.cpu.clock_task.max
     42597 ±  5%    +137.8%     101306        sched_debug.cpu.clock_task.min
    337.29 ± 17%    +215.0%       1062 ± 15%  sched_debug.cpu.curr->pid.avg
      3182          +129.2%       7293        sched_debug.cpu.curr->pid.max
    948.04 ±  8%    +107.8%       1969 ±  7%  sched_debug.cpu.curr->pid.stddev
      0.00 ±  9%     +97.3%       0.00 ± 23%  sched_debug.cpu.next_balance.stddev
      0.12 ± 15%     +78.3%       0.21 ± 12%  sched_debug.cpu.nr_running.avg
      1059 ±  4%    +676.6%       8226 ±  2%  sched_debug.cpu.nr_switches.avg
     10400 ± 25%    +265.0%      37961 ± 24%  sched_debug.cpu.nr_switches.max
    140.83 ± 16%   +4023.2%       5806 ±  4%  sched_debug.cpu.nr_switches.min
      1551 ±  9%    +147.3%       3836 ± 20%  sched_debug.cpu.nr_switches.stddev
      0.01 ± 57%    +2e+05%      15.55        sched_debug.cpu.nr_uninterruptible.avg
     30.00 ± 39%    +139.6%      71.89 ± 23%  sched_debug.cpu.nr_uninterruptible.max
      5.83 ± 18%    +163.9%      15.38 ±  5%  sched_debug.cpu.nr_uninterruptible.stddev
     51577 ±  4%    +115.5%     111135        sched_debug.cpu_clk
     50345 ±  4%    +118.3%     109903        sched_debug.ktime
     52458 ±  4%    +113.8%     112137        sched_debug.sched_clk
     27.37           -24.5        2.89 ±  3%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
     25.61           -22.5        3.10 ±  3%  perf-profile.calltrace.cycles-pp.read
     23.22           -20.4        2.85 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     22.95           -20.1        2.81 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     22.06           -19.4        2.71 ±  3%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     21.25           -18.6        2.60 ±  3%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     19.10           -16.8        2.34 ±  3%  perf-profile.calltrace.cycles-pp.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.71           -16.4        2.29 ±  3%  perf-profile.calltrace.cycles-pp.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64
     17.15           -15.0        2.10 ±  3%  perf-profile.calltrace.cycles-pp.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     14.90           -13.4        1.49 ±  3%  perf-profile.calltrace.cycles-pp.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      9.47            -8.6        0.85 ±  3%  perf-profile.calltrace.cycles-pp.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      7.08            -6.3        0.82 ±  5%  perf-profile.calltrace.cycles-pp.__close
      7.07            -6.3        0.82 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      7.07            -6.3        0.82 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      7.05            -6.2        0.81 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      7.02            -6.2        0.81 ±  5%  perf-profile.calltrace.cycles-pp.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      6.85            -6.2        0.66 ±  6%  perf-profile.calltrace.cycles-pp.dput.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.83            -6.2        0.66 ±  6%  perf-profile.calltrace.cycles-pp.__dentry_kill.dput.__fput.__x64_sys_close.do_syscall_64
      6.12            -6.1        0.00        perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
      6.75            -6.1        0.65 ±  7%  perf-profile.calltrace.cycles-pp.evict.__dentry_kill.dput.__fput.__x64_sys_close
      6.71            -6.1        0.64 ±  6%  perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.evict.__dentry_kill.dput.__fput
      6.54            -5.9        0.63 ±  6%  perf-profile.calltrace.cycles-pp.folio_mark_accessed.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
      6.18            -5.5        0.72 ±  2%  perf-profile.calltrace.cycles-pp.iomap_write_end.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      5.36            -4.7        0.64 ±  4%  perf-profile.calltrace.cycles-pp.unlink
      5.33            -4.7        0.64 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      5.33            -4.7        0.64 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      5.27            -4.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      5.26            -4.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      5.33            -4.6        0.71 ±  4%  perf-profile.calltrace.cycles-pp.copy_page_to_iter.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
      5.10            -4.4        0.68 ±  4%  perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.filemap_read.xfs_file_buffered_read.xfs_file_read_iter
      4.66            -4.2        0.43 ± 44%  perf-profile.calltrace.cycles-pp.llseek
      4.64            -4.1        0.56 ±  3%  perf-profile.calltrace.cycles-pp.__iomap_write_begin.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      3.30            -2.5        0.84 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      3.55            -2.4        1.17 ±  2%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      3.55            -2.4        1.17 ±  2%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      3.54            -2.4        1.17 ±  2%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      3.58            -2.4        1.23 ±  2%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      5.33            -2.3        3.08 ±  2%  perf-profile.calltrace.cycles-pp.creat64
      5.31            -2.2        3.07 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      5.31            -2.2        3.07 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
      3.35            -2.2        1.14 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      5.24            -2.2        3.06 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      5.24            -2.2        3.06 ±  2%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      5.20            -2.1        3.06 ±  2%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.20            -2.1        3.06 ±  2%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64
      3.14            -2.1        1.06 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      5.12            -2.1        3.04 ±  2%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      3.13            -2.1        1.06 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      3.08            -2.0        1.04 ±  2%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      3.96            -1.3        2.68 ±  2%  perf-profile.calltrace.cycles-pp.down_write.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      1.92 ±  3%      -1.3        0.65        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      3.96            -1.3        2.68 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.open_last_lookups.path_openat.do_filp_open
      3.39            -0.8        2.54 ±  2%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.open_last_lookups.path_openat
      2.77 ±  2%      -0.5        2.28 ±  3%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.open_last_lookups
      2.57            -0.3        2.30 ±  4%  perf-profile.calltrace.cycles-pp.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      0.60            +0.2        0.76        perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.00            +0.6        0.62 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve
      0.00            +0.6        0.64 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc
      0.00            +0.6        0.65 ±  2%  perf-profile.calltrace.cycles-pp.up_write.xfs_iunlock.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write
      0.00            +0.7        0.66 ±  9%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time
      0.00            +0.7        0.72 ±  8%  perf-profile.calltrace.cycles-pp.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified
      0.00            +0.7        0.72 ±  8%  perf-profile.calltrace.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.00            +0.7        0.74 ±  8%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      0.00            +0.7        0.74 ±  5%  perf-profile.calltrace.cycles-pp.time_stats_update_one.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter
      1.12            +1.0        2.12 ±  5%  perf-profile.calltrace.cycles-pp.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write
      0.00            +1.1        1.11 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified
      0.00            +1.1        1.12 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.00            +1.2        1.15 ±  4%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      0.00            +2.0        2.02 ±  5%  perf-profile.calltrace.cycles-pp.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write
     45.91           +43.8       89.74        perf-profile.calltrace.cycles-pp.write
     44.09           +45.5       89.54        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     43.82           +45.7       89.51        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     42.92           +46.5       89.41        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     42.04           +47.2       89.29        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     39.30           +49.7       88.97        perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.70           +51.7       86.42        perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      6.41           +77.0       83.42        perf-profile.calltrace.cycles-pp.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      4.52           +78.7       83.18        perf-profile.calltrace.cycles-pp.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      0.00           +79.2       79.22        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin
      0.00           +79.8       79.81        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter
      1.09 ±  2%     +80.7       81.79        perf-profile.calltrace.cycles-pp.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.00           +81.2       81.22        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write
     27.50           -24.6        2.90 ±  3%  perf-profile.children.cycles-pp.iomap_write_iter
     25.82           -22.6        3.19 ±  3%  perf-profile.children.cycles-pp.read
     22.14           -19.4        2.72 ±  4%  perf-profile.children.cycles-pp.ksys_read
     21.31           -18.7        2.61 ±  3%  perf-profile.children.cycles-pp.vfs_read
     19.13           -16.8        2.35 ±  3%  perf-profile.children.cycles-pp.xfs_file_read_iter
     18.80           -16.5        2.30 ±  3%  perf-profile.children.cycles-pp.xfs_file_buffered_read
     17.26           -15.2        2.11 ±  4%  perf-profile.children.cycles-pp.filemap_read
     14.99           -13.5        1.50 ±  3%  perf-profile.children.cycles-pp.iomap_write_begin
      9.57            -8.7        0.86 ±  3%  perf-profile.children.cycles-pp.__filemap_get_folio
      7.72            -7.2        0.48 ±  7%  perf-profile.children.cycles-pp.folio_batch_move_lru
      7.55            -7.2        0.34 ± 15%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      7.08            -6.3        0.82 ±  5%  perf-profile.children.cycles-pp.__close
      7.05            -6.2        0.81 ±  5%  perf-profile.children.cycles-pp.__x64_sys_close
      9.50            -6.2        3.29        perf-profile.children.cycles-pp.down_write
      7.02            -6.2        0.81 ±  5%  perf-profile.children.cycles-pp.__fput
      6.87            -6.2        0.67 ±  6%  perf-profile.children.cycles-pp.dput
      6.83            -6.2        0.66 ±  6%  perf-profile.children.cycles-pp.__dentry_kill
      6.75            -6.1        0.65 ±  7%  perf-profile.children.cycles-pp.evict
      6.72            -6.1        0.65 ±  6%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      6.57            -5.9        0.64 ±  6%  perf-profile.children.cycles-pp.folio_mark_accessed
      6.13            -5.7        0.44 ±  3%  perf-profile.children.cycles-pp.filemap_add_folio
      6.27            -5.5        0.73 ±  3%  perf-profile.children.cycles-pp.iomap_write_end
      8.38            -5.2        3.14        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      5.38            -4.7        0.64 ±  4%  perf-profile.children.cycles-pp.unlink
      5.36            -4.6        0.72 ±  4%  perf-profile.children.cycles-pp.copy_page_to_iter
      5.27            -4.6        0.62 ±  4%  perf-profile.children.cycles-pp.__x64_sys_unlink
      5.26            -4.6        0.62 ±  4%  perf-profile.children.cycles-pp.do_unlinkat
      5.12            -4.4        0.69 ±  4%  perf-profile.children.cycles-pp._copy_to_iter
      7.25            -4.4        2.84 ±  2%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      4.70            -4.1        0.56 ±  3%  perf-profile.children.cycles-pp.__iomap_write_begin
      4.71            -4.1        0.60 ±  2%  perf-profile.children.cycles-pp.llseek
      4.22            -3.9        0.35 ±  8%  perf-profile.children.cycles-pp.folio_activate
      4.13            -3.8        0.34 ± 10%  perf-profile.children.cycles-pp.__folio_batch_release
      4.08            -3.7        0.34 ±  9%  perf-profile.children.cycles-pp.release_pages
      6.03 ±  2%      -3.5        2.53 ±  2%  perf-profile.children.cycles-pp.osq_lock
      3.44            -3.3        0.14 ±  5%  perf-profile.children.cycles-pp.folio_add_lru
      3.51            -3.1        0.44 ±  3%  perf-profile.children.cycles-pp.iomap_set_range_uptodate
      2.99            -2.6        0.36 ±  4%  perf-profile.children.cycles-pp.zero_user_segments
      2.90            -2.6        0.35 ±  3%  perf-profile.children.cycles-pp.memset_orig
      2.76            -2.4        0.36 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      3.55            -2.4        1.17 ±  2%  perf-profile.children.cycles-pp.start_secondary
      2.65            -2.4        0.30 ±  3%  perf-profile.children.cycles-pp.__filemap_add_folio
      3.58            -2.4        1.23 ±  2%  perf-profile.children.cycles-pp.do_idle
      3.58            -2.4        1.23 ±  2%  perf-profile.children.cycles-pp.cpu_startup_entry
      3.58            -2.4        1.23 ±  2%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      5.35            -2.3        3.08 ±  2%  perf-profile.children.cycles-pp.creat64
      5.35            -2.3        3.08 ±  2%  perf-profile.children.cycles-pp.do_sys_openat2
      2.48            -2.3        0.21 ±  5%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      2.48            -2.2        0.25 ±  4%  perf-profile.children.cycles-pp.filemap_dirty_folio
      5.28            -2.2        3.07 ±  2%  perf-profile.children.cycles-pp.do_filp_open
      5.28            -2.2        3.07 ±  2%  perf-profile.children.cycles-pp.path_openat
      5.24            -2.2        3.06 ±  2%  perf-profile.children.cycles-pp.__x64_sys_creat
      3.38            -2.2        1.20 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
      2.40            -2.1        0.31 ±  4%  perf-profile.children.cycles-pp.filemap_get_pages
      5.12            -2.1        3.04 ±  2%  perf-profile.children.cycles-pp.open_last_lookups
      3.18            -2.1        1.12 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter
      3.16            -2.0        1.12 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
      3.17            -2.0        1.17 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      3.11            -2.0        1.10 ±  2%  perf-profile.children.cycles-pp.acpi_idle_enter
      3.10            -2.0        1.10 ±  2%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.98 ±  3%      -1.8        0.17 ±  5%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      2.06            -1.8        0.27 ±  3%  perf-profile.children.cycles-pp.filemap_get_read_batch
      2.26            -1.8        0.49 ±  3%  perf-profile.children.cycles-pp.xfs_ilock
      1.98            -1.7        0.25 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
      1.90            -1.7        0.25 ±  4%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.87            -1.6        0.22 ±  3%  perf-profile.children.cycles-pp.workingset_activation
      1.80            -1.6        0.24 ±  4%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      1.68            -1.5        0.19 ±  4%  perf-profile.children.cycles-pp.rw_verify_area
      1.56            -1.4        0.15 ±  3%  perf-profile.children.cycles-pp.__folio_mark_dirty
      2.16 ±  3%      -1.4        0.75 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.49            -1.3        0.18 ±  4%  perf-profile.children.cycles-pp.xas_load
      1.51 ±  2%      -1.3        0.21 ±  3%  perf-profile.children.cycles-pp.__xfs_trans_commit
      1.46            -1.3        0.18 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.76            -1.3        0.49        perf-profile.children.cycles-pp.rwsem_spin_on_owner
      1.37            -1.2        0.16 ±  4%  perf-profile.children.cycles-pp.workingset_age_nonresident
      1.63            -1.2        0.46 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
      1.63            -1.2        0.46 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
      1.63            -1.2        0.46 ±  2%  perf-profile.children.cycles-pp.kthread
      1.60            -1.2        0.44 ±  2%  perf-profile.children.cycles-pp.worker_thread
      1.31 ±  2%      -1.1        0.18 ±  3%  perf-profile.children.cycles-pp.xlog_cil_commit
      1.25 ±  4%      -1.1        0.13 ±  5%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      1.26            -1.1        0.15 ±  4%  perf-profile.children.cycles-pp.folio_alloc
      1.18 ±  2%      -1.1        0.10 ±  3%  perf-profile.children.cycles-pp.folio_account_dirtied
      1.23            -1.1        0.15 ±  4%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      1.49            -1.1        0.41 ±  3%  perf-profile.children.cycles-pp.process_one_work
      1.20            -1.1        0.14 ±  4%  perf-profile.children.cycles-pp.security_file_permission
      1.45            -1.1        0.39 ±  2%  perf-profile.children.cycles-pp.xfs_inodegc_worker
      1.42            -1.0        0.38 ±  3%  perf-profile.children.cycles-pp.xfs_inactive
      1.20            -1.0        0.17 ±  4%  perf-profile.children.cycles-pp.disk_rr
      1.18            -1.0        0.15 ±  2%  perf-profile.children.cycles-pp.ksys_lseek
      1.17            -1.0        0.15 ±  6%  perf-profile.children.cycles-pp.alloc_pages_mpol
      1.14            -1.0        0.13 ±  5%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      1.11            -1.0        0.13 ±  3%  perf-profile.children.cycles-pp.folio_activate_fn
      1.06 ±  4%      -1.0        0.08 ±  5%  perf-profile.children.cycles-pp.balance_dirty_pages
      1.11            -1.0        0.14 ±  3%  perf-profile.children.cycles-pp.iomap_iter_advance
      1.10            -1.0        0.13 ±  5%  perf-profile.children.cycles-pp.filemap_get_entry
      1.92            -1.0        0.95        perf-profile.children.cycles-pp.xfs_iunlock
      1.10            -1.0        0.14 ±  5%  perf-profile.children.cycles-pp.__cond_resched
      1.10            -1.0        0.14 ±  3%  perf-profile.children.cycles-pp.fault_in_readable
      1.18            -1.0        0.23 ±  4%  perf-profile.children.cycles-pp.touch_atime
      1.15            -0.9        0.22 ±  4%  perf-profile.children.cycles-pp.__schedule
      0.99 ±  4%      -0.9        0.08 ±  6%  perf-profile.children.cycles-pp.mem_cgroup_wb_stats
      1.01            -0.9        0.12 ±  4%  perf-profile.children.cycles-pp.__folio_cancel_dirty
      1.01            -0.9        0.13 ±  5%  perf-profile.children.cycles-pp.__alloc_pages
      0.94 ±  5%      -0.9        0.08 ±  6%  perf-profile.children.cycles-pp.cgroup_rstat_flush
      0.97            -0.8        0.12 ±  6%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      1.02            -0.8        0.19 ±  5%  perf-profile.children.cycles-pp.schedule
      0.90            -0.8        0.10 ±  3%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.89            -0.8        0.10 ±  4%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      1.26 ±  4%      -0.8        0.51 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.85            -0.7        0.10 ±  4%  perf-profile.children.cycles-pp.atime_needs_update
      1.23 ±  4%      -0.7        0.49 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.82 ±  2%      -0.7        0.09 ±  7%  perf-profile.children.cycles-pp.folio_account_cleaned
      1.06            -0.7        0.35        perf-profile.children.cycles-pp.lookup_open
      0.92            -0.7        0.23 ±  2%  perf-profile.children.cycles-pp.xfs_inactive_ifree
      0.86            -0.7        0.17 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.83            -0.7        0.16 ±  5%  perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      0.77            -0.7        0.10 ±  6%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.82            -0.7        0.17 ±  5%  perf-profile.children.cycles-pp.newidle_balance
      0.85            -0.6        0.21 ±  4%  perf-profile.children.cycles-pp.load_balance
      0.72            -0.6        0.09 ±  6%  perf-profile.children.cycles-pp.xas_descend
      0.72            -0.6        0.09 ±  7%  perf-profile.children.cycles-pp.xas_store
      0.69 ±  4%      -0.6        0.07 ±  5%  perf-profile.children.cycles-pp.cgroup_rstat_flush_locked
      0.85            -0.6        0.25        perf-profile.children.cycles-pp.xfs_generic_create
      0.66 ±  3%      -0.6        0.07 ±  8%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.65            -0.6        0.08 ±  6%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.82            -0.6        0.24 ±  2%  perf-profile.children.cycles-pp.xfs_create
      0.74 ±  2%      -0.6        0.18 ±  4%  perf-profile.children.cycles-pp.find_busiest_group
      0.73            -0.6        0.17 ±  4%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.64            -0.5        0.09 ±  5%  perf-profile.children.cycles-pp.xfs_ifree
      0.70            -0.5        0.16 ±  4%  perf-profile.children.cycles-pp.vfs_unlink
      0.60 ±  2%      -0.5        0.06 ±  6%  perf-profile.children.cycles-pp.lru_add_fn
      0.62            -0.5        0.08 ±  5%  perf-profile.children.cycles-pp.xfs_inode_uninit
      0.68            -0.5        0.15 ±  4%  perf-profile.children.cycles-pp.xfs_buf_read_map
      0.68            -0.5        0.15 ±  4%  perf-profile.children.cycles-pp.xfs_remove
      0.68            -0.5        0.15 ±  4%  perf-profile.children.cycles-pp.xfs_vn_unlink
      0.66            -0.5        0.15 ±  4%  perf-profile.children.cycles-pp.xfs_buf_get_map
      0.83            -0.5        0.32 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.67 ±  2%      -0.5        0.16 ±  4%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.60            -0.5        0.08 ±  5%  perf-profile.children.cycles-pp.xfs_difree
      0.58 ±  2%      -0.5        0.08        perf-profile.children.cycles-pp.down_read
      0.56            -0.5        0.07 ± 10%  perf-profile.children.cycles-pp.inode_needs_update_time
      0.56            -0.5        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_break_layouts
      0.60            -0.5        0.11 ±  6%  perf-profile.children.cycles-pp.xfs_buf_lookup
      0.57            -0.5        0.08 ±  5%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.56            -0.5        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_read_agi
      0.76            -0.5        0.29        perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.54            -0.5        0.07 ±  7%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.51            -0.5        0.06 ±  6%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.70            -0.4        0.26 ±  2%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.52            -0.4        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_ialloc_read_agi
      0.51            -0.4        0.07 ±  7%  perf-profile.children.cycles-pp.xlog_cil_insert_format_items
      0.49 ±  2%      -0.4        0.06 ±  6%  perf-profile.children.cycles-pp.task_work_run
      0.48 ±  2%      -0.4        0.06 ±  6%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.49            -0.4        0.06        perf-profile.children.cycles-pp.folio_unlock
      0.48            -0.4        0.06 ±  9%  perf-profile.children.cycles-pp.__count_memcg_events
      0.67            -0.4        0.24 ±  3%  perf-profile.children.cycles-pp.__do_softirq
      0.47            -0.4        0.05 ±  8%  perf-profile.children.cycles-pp.mem_cgroup_commit_charge
      0.66            -0.4        0.24 ±  2%  perf-profile.children.cycles-pp.tick_sched_handle
      0.46            -0.4        0.05        perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.47 ±  2%      -0.4        0.06 ±  8%  perf-profile.children.cycles-pp.generic_write_checks
      0.47            -0.4        0.06        perf-profile.children.cycles-pp.down
      0.65            -0.4        0.24 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.47 ±  2%      -0.4        0.06 ±  7%  perf-profile.children.cycles-pp.xfs_is_always_cow_inode
      0.49            -0.4        0.09 ±  5%  perf-profile.children.cycles-pp.xfs_buf_find_lock
      0.50            -0.4        0.10 ±  6%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      2.70            -0.4        2.31 ±  4%  perf-profile.children.cycles-pp.xfs_file_write_checks
      0.48            -0.4        0.09 ±  5%  perf-profile.children.cycles-pp.xfs_buf_lock
      0.42            -0.4        0.04 ± 44%  perf-profile.children.cycles-pp.rcu_all_qs
      0.50 ±  2%      -0.4        0.12 ±  3%  perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.42            -0.4        0.06 ±  9%  perf-profile.children.cycles-pp.up_read
      0.42            -0.4        0.06 ±  8%  perf-profile.children.cycles-pp.__down
      0.41            -0.4        0.05        perf-profile.children.cycles-pp.xas_start
      0.42            -0.4        0.06 ±  8%  perf-profile.children.cycles-pp.___down_common
      0.42            -0.4        0.07 ±  7%  perf-profile.children.cycles-pp.schedule_timeout
      0.50 ±  2%      -0.3        0.15 ±  4%  perf-profile.children.cycles-pp.xfs_inactive_truncate
      0.36 ±  2%      -0.3        0.03 ± 70%  perf-profile.children.cycles-pp.find_lock_entries
      0.36 ±  2%      -0.3        0.02 ± 99%  perf-profile.children.cycles-pp.current_time
      0.38 ±  2%      -0.3        0.05        perf-profile.children.cycles-pp.xfs_file_write_iter
      0.37            -0.3        0.05 ±  7%  perf-profile.children.cycles-pp.xfs_bmbt_to_iomap
      0.49            -0.3        0.18 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.39            -0.3        0.11 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock
      0.45 ± 10%      -0.3        0.18 ±  5%  perf-profile.children.cycles-pp.ktime_get
      0.43            -0.3        0.17 ±  4%  perf-profile.children.cycles-pp.scheduler_tick
      0.96            -0.2        0.72 ±  2%  perf-profile.children.cycles-pp.up_write
      0.29            -0.2        0.05 ±  8%  perf-profile.children.cycles-pp.xfs_dir_remove_child
      0.24 ±  2%      -0.2        0.06 ±  8%  perf-profile.children.cycles-pp.xfs_da3_node_lookup_int
      0.30 ± 14%      -0.2        0.12 ±  5%  perf-profile.children.cycles-pp.clockevents_program_event
      0.24 ±  2%      -0.2        0.06 ±  7%  perf-profile.children.cycles-pp.xfs_da_read_buf
      0.17 ±  6%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.18 ±  3%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.15 ±  8%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.tick_irq_enter
      0.16 ±  3%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.rebalance_domains
      0.24 ±  2%      -0.1        0.14 ±  3%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.14 ±  4%      -0.1        0.06        perf-profile.children.cycles-pp.update_load_avg
      0.14 ±  3%      -0.1        0.09        perf-profile.children.cycles-pp.xfs_vn_lookup
      0.14 ±  3%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.xfs_lookup
      0.13 ±  2%      -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.xfs_dir_lookup
      0.11 ±  3%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_free_eofblocks
      0.08 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.__update_blocked_fair
      0.14 ±  3%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.update_blocked_averages
      0.07 ± 10%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.08 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.xfs_icreate
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.xfs_iget
      0.03 ± 70%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.xfs_trans_alloc_dir
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.start_kernel
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.xfs_lock_two_inodes
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.xfs_can_free_eofblocks
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.xfs_iget_cache_hit
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.xfs_ilock_data_map_shared
      0.00            +0.1        0.12 ±  6%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.06            +0.1        0.19 ±  4%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.2        0.20 ±  4%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.2        0.20 ±  6%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.2        0.21 ±  5%  perf-profile.children.cycles-pp.mean_and_variance_weighted_update
      0.47 ±  3%      +0.4        0.85 ±  7%  perf-profile.children.cycles-pp.xfs_trans_alloc
      0.44 ±  4%      +0.4        0.84 ±  7%  perf-profile.children.cycles-pp.xfs_trans_reserve
      0.42 ±  4%      +0.4        0.83 ±  7%  perf-profile.children.cycles-pp.xfs_log_reserve
      0.00            +0.8        0.80 ±  4%  perf-profile.children.cycles-pp.time_stats_update_one
      1.18            +1.0        2.13 ±  5%  perf-profile.children.cycles-pp.kiocb_modified
      0.59 ±  5%      +1.6        2.14 ±  5%  perf-profile.children.cycles-pp.xfs_vn_update_time
     87.44            +9.8       97.29        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     86.83           +10.4       97.21        perf-profile.children.cycles-pp.do_syscall_64
     46.10           +43.8       89.86        perf-profile.children.cycles-pp.write
     43.02           +46.4       89.44        perf-profile.children.cycles-pp.ksys_write
     42.16           +47.2       89.33        perf-profile.children.cycles-pp.vfs_write
     39.41           +49.6       88.98        perf-profile.children.cycles-pp.xfs_file_buffered_write
     34.77           +51.7       86.42        perf-profile.children.cycles-pp.iomap_file_buffered_write
      7.68           +74.2       81.93        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      8.03           +74.6       82.65        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      6.53           +76.9       83.44        perf-profile.children.cycles-pp.iomap_iter
      4.74           +78.5       83.22        perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      1.17 ±  2%     +80.7       81.83        perf-profile.children.cycles-pp.xfs_ilock_for_iomap
      0.00           +83.7       83.74        perf-profile.children.cycles-pp.__time_stats_update
      5.06            -4.4        0.68 ±  4%  perf-profile.self.cycles-pp._copy_to_iter
      5.93 ±  2%      -3.4        2.52 ±  2%  perf-profile.self.cycles-pp.osq_lock
      3.45            -3.0        0.43 ±  3%  perf-profile.self.cycles-pp.iomap_set_range_uptodate
      2.87            -2.5        0.34 ±  4%  perf-profile.self.cycles-pp.memset_orig
      1.90            -1.7        0.24 ±  3%  perf-profile.self.cycles-pp.__fdget_pos
      1.84            -1.6        0.24 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.77            -1.5        0.23 ±  3%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      1.65            -1.4        0.21 ±  3%  perf-profile.self.cycles-pp.filemap_read
      1.42            -1.3        0.15 ±  3%  perf-profile.self.cycles-pp.vfs_write
      1.74            -1.2        0.49        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      1.42            -1.2        0.18 ±  5%  perf-profile.self.cycles-pp.filemap_get_read_batch
      1.36            -1.2        0.16 ±  5%  perf-profile.self.cycles-pp.workingset_age_nonresident
      1.21            -1.1        0.14 ±  4%  perf-profile.self.cycles-pp.vfs_read
      1.20            -1.0        0.15 ±  4%  perf-profile.self.cycles-pp.do_syscall_64
      1.07            -0.9        0.13 ±  4%  perf-profile.self.cycles-pp.iomap_iter_advance
      1.07            -0.9        0.13 ±  3%  perf-profile.self.cycles-pp.fault_in_readable
      1.03 ±  5%      -0.9        0.10 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      1.06            -0.9        0.14 ±  2%  perf-profile.self.cycles-pp.disk_rr
      0.98 ±  2%      -0.9        0.08 ±  8%  perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      1.15 ±  2%      -0.9        0.29        perf-profile.self.cycles-pp.xfs_buffered_write_iomap_begin
      1.30            -0.8        0.46 ±  2%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.90 ±  3%      -0.8        0.06 ±  9%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.88            -0.8        0.11 ±  6%  perf-profile.self.cycles-pp.iomap_write_end
      0.82            -0.7        0.10 ±  7%  perf-profile.self.cycles-pp.__filemap_get_folio
      0.78            -0.7        0.11 ±  4%  perf-profile.self.cycles-pp.write
      0.76            -0.7        0.09        perf-profile.self.cycles-pp.iomap_file_buffered_write
      0.77            -0.7        0.10 ±  3%  perf-profile.self.cycles-pp.llseek
      0.77            -0.7        0.12 ±  4%  perf-profile.self.cycles-pp.down_write
      0.75            -0.7        0.10 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.72            -0.6        0.09 ±  4%  perf-profile.self.cycles-pp.iomap_write_iter
      0.72            -0.6        0.09 ±  5%  perf-profile.self.cycles-pp.read
      0.68            -0.6        0.09 ±  5%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.66            -0.6        0.08 ±  5%  perf-profile.self.cycles-pp.__cond_resched
      0.64            -0.6        0.08 ±  4%  perf-profile.self.cycles-pp.xas_descend
      0.64 ±  2%      -0.6        0.08 ±  5%  perf-profile.self.cycles-pp.xfs_ilock
      0.62            -0.6        0.07 ±  6%  perf-profile.self.cycles-pp.release_pages
      0.59            -0.5        0.07 ±  5%  perf-profile.self.cycles-pp.folio_activate_fn
      0.60            -0.5        0.08 ±  6%  perf-profile.self.cycles-pp.xfs_file_buffered_write
      0.59            -0.5        0.06 ±  7%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.58 ±  2%      -0.5        0.06 ±  7%  perf-profile.self.cycles-pp.iomap_write_begin
      0.55            -0.5        0.06 ±  6%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.56            -0.5        0.07        perf-profile.self.cycles-pp.filemap_get_entry
      0.69            -0.5        0.20 ±  4%  perf-profile.self.cycles-pp.xfs_iunlock
      0.54 ±  4%      -0.5        0.06 ±  9%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.54 ±  2%      -0.5        0.06 ±  6%  perf-profile.self.cycles-pp.__iomap_write_begin
      0.53 ±  2%      -0.5        0.06 ±  7%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.52            -0.5        0.06 ±  6%  perf-profile.self.cycles-pp.iomap_iter
      0.50 ±  2%      -0.4        0.06        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.50            -0.4        0.06 ±  6%  perf-profile.self.cycles-pp.xas_load
      0.49 ±  2%      -0.4        0.06 ±  9%  perf-profile.self.cycles-pp.workingset_activation
      0.48            -0.4        0.06        perf-profile.self.cycles-pp.filemap_dirty_folio
      0.47            -0.4        0.05 ±  7%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.48 ±  2%      -0.4        0.06 ±  7%  perf-profile.self.cycles-pp.folio_mark_accessed
      0.47 ±  2%      -0.4        0.05 ±  8%  perf-profile.self.cycles-pp.rw_verify_area
      0.46            -0.4        0.06 ±  6%  perf-profile.self.cycles-pp.folio_unlock
      0.44 ±  2%      -0.4        0.04 ± 44%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.39            -0.4        0.02 ± 99%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.42 ±  2%      -0.4        0.06        perf-profile.self.cycles-pp.down_read
      0.48 ±  3%      -0.4        0.12 ±  3%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.40            -0.4        0.04 ± 44%  perf-profile.self.cycles-pp.xfs_file_write_checks
      0.40            -0.4        0.04 ± 45%  perf-profile.self.cycles-pp.up_read
      0.38            -0.3        0.03 ± 70%  perf-profile.self.cycles-pp.atime_needs_update
      0.46 ±  2%      -0.3        0.12 ±  3%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.38            -0.3        0.04 ± 44%  perf-profile.self.cycles-pp.xas_store
      0.36 ±  3%      -0.3        0.05 ±  7%  perf-profile.self.cycles-pp.xfs_is_always_cow_inode
      0.35            -0.3        0.05        perf-profile.self.cycles-pp.xfs_bmbt_to_iomap
      0.34 ±  4%      -0.3        0.05        perf-profile.self.cycles-pp.xfs_file_read_iter
      0.42 ± 11%      -0.3        0.17 ±  6%  perf-profile.self.cycles-pp.ktime_get
      0.36            -0.3        0.11 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock
      0.28 ±  3%      -0.2        0.07        perf-profile.self.cycles-pp.xfs_ilock_for_iomap
      0.78            -0.1        0.68 ±  2%  perf-profile.self.cycles-pp.up_write
      0.63            +0.1        0.73 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.06            +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.2        0.20 ±  5%  perf-profile.self.cycles-pp.mean_and_variance_weighted_update
      0.00            +0.6        0.60 ±  5%  perf-profile.self.cycles-pp.time_stats_update_one
      0.00            +0.7        0.69 ±  2%  perf-profile.self.cycles-pp.__time_stats_update
      7.68           +74.2       81.93        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/disk_rw/aim7

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 4.092e+09           +56.1%  6.388e+09 ± 21%  cpuidle..time
     89.56 ±  3%    +322.7%     378.57        uptime.boot
     10178 ±  3%     +25.6%      12785 ± 10%  uptime.idle
     82.27           -80.8%      15.82 ± 23%  iostat.cpu.idle
     16.13          +420.3%      83.93 ±  4%  iostat.cpu.system
      1.59           -84.6%       0.25        iostat.cpu.user
      3.17 ± 28%   +6500.0%     209.00 ±  6%  perf-c2c.DRAM.local
     38.00 ± 19%  +62325.4%      23721        perf-c2c.DRAM.remote
     30.33 ± 22%  +90835.2%      27583        perf-c2c.HITM.local
      6.83 ± 29%  +2.6e+05%      18029        perf-c2c.HITM.remote
     37.17 ± 20%  +1.2e+05%      45612        perf-c2c.HITM.total
     82.24           -80.8%      15.80 ± 23%  vmstat.cpu.id
     16.15          +419.9%      83.94 ±  4%  vmstat.cpu.sy
     21.85 ±  7%    +462.3%     122.84 ± 10%  vmstat.procs.r
     58000           -83.0%       9838 ± 11%  vmstat.system.cs
    147400            +4.1%     153458        vmstat.system.in
     81.46           -66.1       15.36 ± 24%  mpstat.cpu.all.idle%
      0.25 ±  3%      -0.1        0.15        mpstat.cpu.all.irq%
      0.10            -0.1        0.02 ± 15%  mpstat.cpu.all.soft%
     16.57           +67.7       84.23 ±  4%  mpstat.cpu.all.sys%
      1.62            -1.4        0.24        mpstat.cpu.all.usr%
     28.64 ±  3%    +249.0%      99.97        mpstat.max_utilization_pct
    491457           -88.7%      55715 ±  2%  aim7.jobs-per-min
     36.81          +778.6%     323.40 ±  2%  aim7.time.elapsed_time
     36.81          +778.6%     323.40 ±  2%  aim7.time.elapsed_time.max
     46646 ±  4%   +3038.8%    1464149 ± 43%  aim7.time.involuntary_context_switches
    948.00 ± 16%     -65.4%     327.83 ± 54%  aim7.time.major_page_faults
    174670           +59.5%     278569 ±  3%  aim7.time.minor_page_faults
    713.96         +4799.5%      34980 ±  6%  aim7.time.system_time
     38.75           +25.3%      48.54        aim7.time.user_time
    497817           -39.8%     299645 ± 18%  aim7.time.voluntary_context_switches
     39532 ±  2%   +2281.0%     941267 ±  2%  meminfo.Active
     39452 ±  2%   +2285.6%     941187 ±  2%  meminfo.Active(anon)
     42754 ±  8%    +449.8%     235082 ± 24%  meminfo.AnonHugePages
   4216054           +30.3%    5493552        meminfo.Cached
   3144630           +28.6%    4045028        meminfo.Committed_AS
   1003816           +39.5%    1400732        meminfo.Dirty
   1856110           +20.9%    2243634        meminfo.Inactive
   1007177           +39.5%    1405244        meminfo.Inactive(file)
    141074           +13.1%     159548        meminfo.KReclaimable
    108107 ±  2%     -49.9%      54174 ±  6%  meminfo.Mapped
    141074           +13.1%     159548        meminfo.SReclaimable
     93866 ±  2%    +932.5%     969158 ±  2%  meminfo.Shmem
   8717280           +11.4%    9712081 ±  2%  meminfo.max_used_kB
      5319 ± 28%   +2726.0%     150325 ± 49%  numa-meminfo.node0.Active
      5239 ± 28%   +2767.7%     150245 ± 49%  numa-meminfo.node0.Active(anon)
    510121 ±  3%     +37.7%     702606        numa-meminfo.node0.Dirty
    512156 ±  3%     +37.8%     705662        numa-meminfo.node0.Inactive(file)
    205841 ± 25%     +26.1%     259615 ±  6%  numa-meminfo.node0.SUnreclaim
     10668 ± 16%   +1370.5%     156879 ± 48%  numa-meminfo.node0.Shmem
     34264 ±  7%   +2209.4%     791285 ± 10%  numa-meminfo.node1.Active
     34264 ±  7%   +2209.4%     791285 ± 10%  numa-meminfo.node1.Active(anon)
     39664 ± 22%    +412.2%     203165 ± 33%  numa-meminfo.node1.AnonHugePages
    493715 ±  2%     +41.4%     697996        numa-meminfo.node1.Dirty
    495139 ±  2%     +41.3%     699479        numa-meminfo.node1.Inactive(file)
     72700 ± 14%     -43.4%      41137 ± 26%  numa-meminfo.node1.Mapped
     45256 ±131%     -94.3%       2597 ± 15%  numa-meminfo.node1.PageTables
     84096 ±  4%    +865.9%     812326 ± 10%  numa-meminfo.node1.Shmem
      1320 ± 28%   +2744.0%      37568 ± 49%  numa-vmstat.node0.nr_active_anon
    127287 ±  3%     +37.9%     175532        numa-vmstat.node0.nr_dirty
    127777 ±  3%     +38.0%     176272        numa-vmstat.node0.nr_inactive_file
      2683 ± 16%   +1361.6%      39218 ± 48%  numa-vmstat.node0.nr_shmem
     51429 ± 25%     +26.2%      64886 ±  6%  numa-vmstat.node0.nr_slab_unreclaimable
      1320 ± 28%   +2744.0%      37568 ± 49%  numa-vmstat.node0.nr_zone_active_anon
    127766 ±  3%     +38.0%     176272        numa-vmstat.node0.nr_zone_inactive_file
    127273 ±  3%     +37.9%     175532        numa-vmstat.node0.nr_zone_write_pending
      8585 ±  7%   +2204.2%     197814 ± 10%  numa-vmstat.node1.nr_active_anon
     19.37 ± 23%    +412.1%      99.20 ± 33%  numa-vmstat.node1.nr_anon_transparent_hugepages
    122933 ±  2%     +41.8%     174349        numa-vmstat.node1.nr_dirty
    123307 ±  2%     +41.7%     174673        numa-vmstat.node1.nr_inactive_file
     18781 ± 13%     -44.3%      10468 ± 27%  numa-vmstat.node1.nr_mapped
     11299 ±131%     -94.3%     649.55 ± 15%  numa-vmstat.node1.nr_page_table_pages
     21618 ±  3%    +839.5%     203091 ± 10%  numa-vmstat.node1.nr_shmem
      8585 ±  7%   +2204.2%     197814 ± 10%  numa-vmstat.node1.nr_zone_active_anon
    123307 ±  2%     +41.7%     174673        numa-vmstat.node1.nr_zone_inactive_file
    122937 ±  2%     +41.8%     174350        numa-vmstat.node1.nr_zone_write_pending
      9882 ±  2%   +2282.1%     235403 ±  2%  proc-vmstat.nr_active_anon
    199413            +2.0%     203340        proc-vmstat.nr_anon_pages
     20.80 ±  8%    +452.2%     114.87 ± 24%  proc-vmstat.nr_anon_transparent_hugepages
    250598           +39.6%     349822        proc-vmstat.nr_dirty
   1054061           +30.3%    1373091        proc-vmstat.nr_file_pages
    212518            -1.4%     209456        proc-vmstat.nr_inactive_anon
    251461           +39.6%     350977        proc-vmstat.nr_inactive_file
     68209            +2.1%      69671        proc-vmstat.nr_kernel_stack
     27785 ±  2%     -50.9%      13639 ±  6%  proc-vmstat.nr_mapped
     23849 ±  2%    +916.0%     242311 ±  2%  proc-vmstat.nr_shmem
     35265           +13.1%      39882        proc-vmstat.nr_slab_reclaimable
     90827            +4.7%      95061        proc-vmstat.nr_slab_unreclaimable
      9882 ±  2%   +2282.1%     235403 ±  2%  proc-vmstat.nr_zone_active_anon
    212518            -1.4%     209456        proc-vmstat.nr_zone_inactive_anon
    251460           +39.6%     350977        proc-vmstat.nr_zone_inactive_file
    250598           +39.6%     349824        proc-vmstat.nr_zone_write_pending
     20152 ± 16%    +354.2%      91526 ±  9%  proc-vmstat.numa_hint_faults
     11027 ± 24%    +181.3%      31016 ± 10%  proc-vmstat.numa_hint_faults_local
    134138            +1.1%     135631        proc-vmstat.numa_other
     10519 ± 60%    +409.8%      53631 ± 22%  proc-vmstat.numa_pages_migrated
     26727 ±  2%    +551.7%     174180 ±  9%  proc-vmstat.pgactivate
  77903322            +1.1%   78778278        proc-vmstat.pgalloc_normal
    520430          +153.9%    1321137        proc-vmstat.pgfault
  77544961            +1.0%   78338147        proc-vmstat.pgfree
     10519 ± 60%    +409.8%      53631 ± 22%  proc-vmstat.pgmigrate_success
     18267 ± 11%    +396.2%      90639 ±  5%  proc-vmstat.pgreuse
      1.29           +22.4%       1.58 ±  2%  perf-stat.i.MPKI
 1.378e+10           -50.4%  6.836e+09 ±  2%  perf-stat.i.branch-instructions
      1.92 ±  4%      -1.5        0.37 ±  3%  perf-stat.i.branch-miss-rate%
  55160833           -73.8%   14453891 ±  2%  perf-stat.i.branch-misses
     23.93           +11.4       35.30        perf-stat.i.cache-miss-rate%
 1.166e+08           -59.0%   47763711        perf-stat.i.cache-misses
 4.074e+08           -67.4%  1.329e+08        perf-stat.i.cache-references
     58692           -83.2%       9857 ± 11%  perf-stat.i.context-switches
      0.78         +1082.1%       9.26 ±  2%  perf-stat.i.cpi
 5.656e+10          +397.6%  2.814e+11 ±  4%  perf-stat.i.cpu-cycles
      1507 ±  2%     -39.8%     907.28 ±  9%  perf-stat.i.cpu-migrations
      1188 ±  9%    +387.8%       5797 ±  5%  perf-stat.i.cycles-between-cache-misses
 6.918e+10           -57.2%  2.958e+10        perf-stat.i.instructions
      1.29           -88.3%       0.15 ±  2%  perf-stat.i.ipc
     26.74 ± 16%     -96.0%       1.07 ± 55%  perf-stat.i.major-faults
     12211           -68.3%       3871        perf-stat.i.minor-faults
     12238           -68.4%       3872        perf-stat.i.page-faults
      0.39            -0.2        0.21 ±  4%  perf-stat.overall.branch-miss-rate%
     28.60            +7.3       35.90        perf-stat.overall.cache-miss-rate%
      0.82         +1060.1%       9.50 ±  2%  perf-stat.overall.cpi
    485.33         +1113.9%       5891 ±  5%  perf-stat.overall.cycles-between-cache-misses
      1.22           -91.4%       0.11 ±  2%  perf-stat.overall.ipc
 1.365e+10           -50.0%  6.825e+09 ±  2%  perf-stat.ps.branch-instructions
  52868687           -72.7%   14449111 ±  2%  perf-stat.ps.branch-misses
 1.156e+08           -58.8%   47686827        perf-stat.ps.cache-misses
 4.043e+08           -67.1%  1.328e+08        perf-stat.ps.cache-references
     58046           -83.1%       9815 ± 11%  perf-stat.ps.context-switches
    124590            +2.4%     127598        perf-stat.ps.cpu-clock
 5.612e+10          +400.3%  2.808e+11 ±  4%  perf-stat.ps.cpu-cycles
      1493 ±  2%     -39.4%     905.34 ±  9%  perf-stat.ps.cpu-migrations
  6.85e+10           -56.9%  2.953e+10        perf-stat.ps.instructions
     25.26 ± 16%     -95.9%       1.04 ± 54%  perf-stat.ps.major-faults
     11556           -66.5%       3867        perf-stat.ps.minor-faults
     11581           -66.6%       3868        perf-stat.ps.page-faults
    124590            +2.4%     127598        perf-stat.ps.task-clock
 2.588e+12          +270.4%  9.585e+12 ±  4%  perf-stat.total.instructions
      2685 ± 10%  +5.6e+05%   15041909 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.avg
     46128 ± 28%  +33525.5%   15510760 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.max
     66.88 ± 34%  +2.1e+07%   14078207 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.min
      5569 ± 19%   +3338.4%     191488 ± 27%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.12 ±  9%    +555.4%       0.79 ±  8%  sched_debug.cfs_rq:/.h_nr_running.avg
      0.33 ±  6%     +30.5%       0.43 ±  4%  sched_debug.cfs_rq:/.h_nr_running.stddev
      4835 ± 83%    +123.5%      10807 ± 23%  sched_debug.cfs_rq:/.load.avg
      1673 ± 82%     -87.0%     217.07 ± 54%  sched_debug.cfs_rq:/.load_avg.avg
      2685 ± 10%  +5.6e+05%   15041909 ± 11%  sched_debug.cfs_rq:/.min_vruntime.avg
     46128 ± 28%  +33525.5%   15510760 ± 12%  sched_debug.cfs_rq:/.min_vruntime.max
     66.88 ± 34%  +2.1e+07%   14078207 ± 12%  sched_debug.cfs_rq:/.min_vruntime.min
      5569 ± 19%   +3338.4%     191488 ± 27%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.12 ±  9%    +502.5%       0.72 ±  3%  sched_debug.cfs_rq:/.nr_running.avg
     26.53 ± 42%     -86.2%       3.67 ± 44%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    532.83 ±  3%     -83.2%      89.72 ±  8%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    106.34 ± 22%     -84.9%      16.10 ± 24%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     26.53 ± 42%     -86.2%       3.67 ± 44%  sched_debug.cfs_rq:/.removed.util_avg.avg
    532.83 ±  3%     -83.2%      89.44 ±  9%  sched_debug.cfs_rq:/.removed.util_avg.max
    106.34 ± 22%     -84.9%      16.08 ± 25%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    268.22 ±  7%    +198.9%     801.70 ±  9%  sched_debug.cfs_rq:/.runnable_avg.avg
    266.99 ±  7%    +174.7%     733.53 ±  4%  sched_debug.cfs_rq:/.util_avg.avg
    306.90 ±  9%     -18.0%     251.75 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
     16.67 ± 15%   +4066.8%     694.53 ± 11%  sched_debug.cfs_rq:/.util_est.avg
    519.33 ±  6%    +262.4%       1882 ± 14%  sched_debug.cfs_rq:/.util_est.max
     84.40 ±  9%    +332.6%     365.14 ±  6%  sched_debug.cfs_rq:/.util_est.stddev
    861301           +11.4%     959063        sched_debug.cpu.avg_idle.avg
      4140 ±  6%  +13041.4%     544165 ± 10%  sched_debug.cpu.avg_idle.min
    214548 ±  4%     -62.3%      80963 ±  6%  sched_debug.cpu.avg_idle.stddev
     52341 ±  5%    +291.7%     205031        sched_debug.cpu.clock.avg
     52347 ±  5%    +291.8%     205082        sched_debug.cpu.clock.max
     52332 ±  5%    +291.7%     204974        sched_debug.cpu.clock.min
      3.24 ±  4%    +836.0%      30.32 ±  7%  sched_debug.cpu.clock.stddev
     52196 ±  5%    +292.0%     204629        sched_debug.cpu.clock_task.avg
     52335 ±  5%    +291.3%     204814        sched_debug.cpu.clock_task.max
     43435 ±  6%    +350.5%     195667        sched_debug.cpu.clock_task.min
    340.16 ± 11%   +1060.6%       3948 ±  5%  sched_debug.cpu.curr->pid.avg
      3184          +210.6%       9891 ±  3%  sched_debug.cpu.curr->pid.max
    953.47 ±  5%    +101.5%       1921 ± 10%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 10%    +137.2%       0.00 ±  6%  sched_debug.cpu.next_balance.stddev
      0.12 ± 12%    +568.3%       0.78 ±  9%  sched_debug.cpu.nr_running.avg
      0.33 ±  7%     +32.0%       0.43 ±  4%  sched_debug.cpu.nr_running.stddev
      1078 ±  3%   +1119.6%      13149 ± 10%  sched_debug.cpu.nr_switches.avg
     11461 ± 21%    +304.3%      46341 ± 19%  sched_debug.cpu.nr_switches.max
    124.50 ±  5%   +8251.1%      10397 ± 12%  sched_debug.cpu.nr_switches.min
      1719 ±  9%    +149.6%       4292 ± 20%  sched_debug.cpu.nr_switches.stddev
      0.01 ± 70%  +1.7e+05%      17.66        sched_debug.cpu.nr_uninterruptible.avg
     26.33 ± 17%    +285.3%     101.47 ± 16%  sched_debug.cpu.nr_uninterruptible.max
    -18.67          +125.6%     -42.11        sched_debug.cpu.nr_uninterruptible.min
      5.47 ±  7%    +368.8%      25.66 ± 15%  sched_debug.cpu.nr_uninterruptible.stddev
     52336 ±  5%    +291.6%     204973        sched_debug.cpu_clk
     51103 ±  5%    +298.7%     203741        sched_debug.ktime
     53300 ±  5%    +286.3%     205885        sched_debug.sched_clk
     38.98           -38.1        0.86 ±  3%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
     15.89           -15.9        0.00        perf-profile.calltrace.cycles-pp.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
     12.47           -12.5        0.00        perf-profile.calltrace.cycles-pp.iomap_write_end.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      9.50            -9.5        0.00        perf-profile.calltrace.cycles-pp.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      7.45            -7.4        0.00        perf-profile.calltrace.cycles-pp.iomap_set_range_uptodate.iomap_write_end.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      6.23 ±  5%      -6.2        0.00        perf-profile.calltrace.cycles-pp.creat64
      6.21 ±  5%      -6.2        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
      6.20 ±  5%      -6.2        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      6.14 ±  5%      -6.1        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      6.14 ±  5%      -6.1        0.00        perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      6.10 ±  6%      -6.1        0.00        perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.10 ±  6%      -6.1        0.00        perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64
      6.03 ±  6%      -6.0        0.00        perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      5.72 ±  6%      -5.7        0.00        perf-profile.calltrace.cycles-pp.unlink
      5.69 ±  6%      -5.7        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      5.69 ±  6%      -5.7        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      5.64 ±  6%      -5.6        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      5.63 ±  6%      -5.6        0.00        perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.00            +1.5        1.49        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve
      0.00            +1.5        1.51        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc
      0.00            +1.5        1.53        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time
      0.00            +1.6        1.59        perf-profile.calltrace.cycles-pp.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified
      0.00            +1.6        1.60        perf-profile.calltrace.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.00            +1.6        1.62        perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      4.84            +1.9        6.76 ±  3%  perf-profile.calltrace.cycles-pp.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      2.09 ±  2%      +4.6        6.70 ±  3%  perf-profile.calltrace.cycles-pp.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write
      0.00            +4.8        4.85 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified
      0.00            +4.9        4.86 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.00            +4.9        4.89 ±  4%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      0.58 ±  5%      +6.1        6.66 ±  3%  perf-profile.calltrace.cycles-pp.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write
     74.04           +25.0       99.07        perf-profile.calltrace.cycles-pp.write
     70.25           +28.7       98.98        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     69.76           +29.2       98.97        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     68.04           +30.9       98.93        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     66.43           +32.5       98.89        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     61.26           +37.5       98.77        perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     52.58           +39.3       91.92        perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
     11.86           +79.2       91.02        perf-profile.calltrace.cycles-pp.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      8.24           +82.7       90.93        perf-profile.calltrace.cycles-pp.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      2.02           +88.5       90.51        perf-profile.calltrace.cycles-pp.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.00           +89.7       89.67        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin
      0.00           +89.8       89.83        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter
      0.00           +90.2       90.23        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write
     39.24           -38.4        0.86 ±  3%  perf-profile.children.cycles-pp.iomap_write_iter
     16.07           -15.7        0.36 ±  4%  perf-profile.children.cycles-pp.iomap_write_begin
     12.63           -12.4        0.26 ±  2%  perf-profile.children.cycles-pp.iomap_write_end
     11.91 ±  6%     -11.7        0.23 ± 12%  perf-profile.children.cycles-pp.down_write
      9.80 ±  7%      -9.6        0.17 ± 15%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      9.66            -9.4        0.23 ±  3%  perf-profile.children.cycles-pp.__filemap_get_folio
      8.78 ±  8%      -8.6        0.16 ± 13%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      8.38            -8.2        0.16 ±  3%  perf-profile.children.cycles-pp.iomap_set_range_uptodate
      7.70 ±  9%      -7.6        0.09 ± 19%  perf-profile.children.cycles-pp.osq_lock
      6.25 ±  5%      -6.0        0.25 ±  6%  perf-profile.children.cycles-pp.do_sys_openat2
      6.24 ±  5%      -6.0        0.25 ±  6%  perf-profile.children.cycles-pp.creat64
      6.19 ±  5%      -5.9        0.25 ±  6%  perf-profile.children.cycles-pp.do_filp_open
      6.18 ±  5%      -5.9        0.25 ±  5%  perf-profile.children.cycles-pp.path_openat
      6.14 ±  5%      -5.9        0.25 ±  6%  perf-profile.children.cycles-pp.__x64_sys_creat
      6.03 ±  6%      -5.8        0.24 ±  6%  perf-profile.children.cycles-pp.open_last_lookups
      5.74 ±  6%      -5.6        0.15 ±  8%  perf-profile.children.cycles-pp.unlink
      5.64 ±  6%      -5.5        0.15 ±  8%  perf-profile.children.cycles-pp.__x64_sys_unlink
      5.63 ±  6%      -5.5        0.15 ±  8%  perf-profile.children.cycles-pp.do_unlinkat
      5.00            -4.9        0.10 ±  5%  perf-profile.children.cycles-pp.__iomap_write_begin
      4.35            -4.3        0.10 ±  5%  perf-profile.children.cycles-pp.llseek
      3.96            -3.8        0.17 ±  2%  perf-profile.children.cycles-pp.__close
      3.94            -3.8        0.16 ±  3%  perf-profile.children.cycles-pp.__x64_sys_close
      3.91            -3.7        0.16 ±  3%  perf-profile.children.cycles-pp.__fput
      3.77            -3.7        0.07 ±  6%  perf-profile.children.cycles-pp.dput
      3.74            -3.7        0.07 ±  6%  perf-profile.children.cycles-pp.__dentry_kill
      3.66            -3.6        0.07 ±  5%  perf-profile.children.cycles-pp.evict
      3.64            -3.6        0.07 ±  5%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      3.50            -3.4        0.08 ±  6%  perf-profile.children.cycles-pp.filemap_add_folio
      3.44 ±  2%      -3.4        0.07 ±  9%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      3.34            -3.2        0.09 ±  5%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      3.08            -2.9        0.21 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.96            -2.8        0.14 ±  5%  perf-profile.children.cycles-pp.xfs_ilock
      2.87            -2.8        0.06 ±  9%  perf-profile.children.cycles-pp.zero_user_segments
      2.88            -2.8        0.07        perf-profile.children.cycles-pp.filemap_get_entry
      2.81            -2.8        0.06 ±  6%  perf-profile.children.cycles-pp.filemap_dirty_folio
      2.79            -2.7        0.06 ±  6%  perf-profile.children.cycles-pp.memset_orig
      2.49            -2.4        0.06 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      2.45            -2.4        0.08 ± 12%  perf-profile.children.cycles-pp.xfs_iunlock
      2.32            -2.3        0.06 ±  6%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      2.28            -2.2        0.06 ±  8%  perf-profile.children.cycles-pp.__filemap_add_folio
      2.11            -2.1        0.05        perf-profile.children.cycles-pp.iomap_iter_advance
      2.06            -2.0        0.05 ±  7%  perf-profile.children.cycles-pp.fault_in_readable
      2.13 ±  2%      -2.0        0.17 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.74            -1.7        0.02 ± 99%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.52            -1.5        0.07 ± 13%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      1.50 ±  2%      -1.4        0.14 ± 11%  perf-profile.children.cycles-pp.kthread
      1.50 ±  2%      -1.4        0.14 ± 11%  perf-profile.children.cycles-pp.ret_from_fork
      1.50 ±  2%      -1.4        0.14 ± 11%  perf-profile.children.cycles-pp.ret_from_fork_asm
      1.47 ±  2%      -1.3        0.14 ± 12%  perf-profile.children.cycles-pp.worker_thread
      1.42 ±  3%      -1.3        0.12 ±  3%  perf-profile.children.cycles-pp.__xfs_trans_commit
      1.37 ±  2%      -1.2        0.14 ± 10%  perf-profile.children.cycles-pp.process_one_work
      1.33 ±  2%      -1.2        0.11        perf-profile.children.cycles-pp.xfs_inodegc_worker
      1.31 ±  2%      -1.2        0.11        perf-profile.children.cycles-pp.xfs_inactive
      1.28 ±  2%      -1.1        0.15 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.23 ±  3%      -1.1        0.10        perf-profile.children.cycles-pp.xlog_cil_commit
      1.25 ±  2%      -1.1        0.14 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.00            -0.8        0.16        perf-profile.children.cycles-pp.lookup_open
      0.92            -0.8        0.10        perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.84 ±  2%      -0.8        0.06        perf-profile.children.cycles-pp.xfs_inactive_ifree
      0.88            -0.8        0.11 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.82            -0.7        0.10 ±  4%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.79            -0.7        0.11        perf-profile.children.cycles-pp.xfs_generic_create
      0.76            -0.6        0.11        perf-profile.children.cycles-pp.xfs_create
      0.72            -0.6        0.10 ±  3%  perf-profile.children.cycles-pp.tick_sched_handle
      0.71            -0.6        0.10 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.64            -0.6        0.06 ±  6%  perf-profile.children.cycles-pp.vfs_unlink
      0.62            -0.6        0.06        perf-profile.children.cycles-pp.xfs_remove
      0.62            -0.6        0.06 ±  6%  perf-profile.children.cycles-pp.xfs_vn_unlink
      0.46 ±  2%      -0.4        0.05        perf-profile.children.cycles-pp.xfs_inactive_truncate
      0.47            -0.4        0.08 ±  4%  perf-profile.children.cycles-pp.scheduler_tick
      0.21 ±  4%      -0.2        0.05        perf-profile.children.cycles-pp.task_tick_fair
      0.14 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.xfs_vn_lookup
      0.13 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.xfs_lookup
      0.12 ±  4%      -0.1        0.05        perf-profile.children.cycles-pp.xfs_dir_lookup
      0.10 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.xfs_free_eofblocks
      0.12 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.xfs_release
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.mean_and_variance_weighted_update
      0.00            +0.2        0.25 ±  2%  perf-profile.children.cycles-pp.time_stats_update_one
      0.45 ±  4%      +1.2        1.64        perf-profile.children.cycles-pp.xfs_trans_alloc
      0.42 ±  3%      +1.2        1.62        perf-profile.children.cycles-pp.xfs_trans_reserve
      0.39 ±  4%      +1.2        1.61        perf-profile.children.cycles-pp.xfs_log_reserve
      5.10            +1.7        6.77 ±  3%  perf-profile.children.cycles-pp.xfs_file_write_checks
      2.21 ±  2%      +4.5        6.70 ±  3%  perf-profile.children.cycles-pp.kiocb_modified
      0.58 ±  5%      +6.1        6.66 ±  3%  perf-profile.children.cycles-pp.xfs_vn_update_time
     88.41           +11.2       99.65        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     87.83           +11.8       99.64        perf-profile.children.cycles-pp.do_syscall_64
     74.36           +24.8       99.13        perf-profile.children.cycles-pp.write
     68.20           +30.8       98.96        perf-profile.children.cycles-pp.ksys_write
     66.63           +32.3       98.92        perf-profile.children.cycles-pp.vfs_write
     61.46           +37.3       98.78        perf-profile.children.cycles-pp.xfs_file_buffered_write
     52.72           +39.2       91.92        perf-profile.children.cycles-pp.iomap_file_buffered_write
     12.07           +79.0       91.03        perf-profile.children.cycles-pp.iomap_iter
      8.66           +82.3       90.95        perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      2.18           +88.4       90.55        perf-profile.children.cycles-pp.xfs_ilock_for_iomap
      0.90 ±  2%     +95.7       96.58        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.65 ±  2%     +95.7       96.36        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00           +97.0       97.02        perf-profile.children.cycles-pp.__time_stats_update
      8.27            -8.1        0.16 ±  3%  perf-profile.self.cycles-pp.iomap_set_range_uptodate
      7.57 ±  9%      -7.5        0.09 ± 19%  perf-profile.self.cycles-pp.osq_lock
      3.28            -3.2        0.09 ±  5%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      2.77            -2.7        0.06 ±  6%  perf-profile.self.cycles-pp.memset_orig
      2.67            -2.6        0.06 ±  9%  perf-profile.self.cycles-pp.vfs_write
      2.03            -2.0        0.04 ± 44%  perf-profile.self.cycles-pp.iomap_iter_advance
      2.00            -2.0        0.04 ± 44%  perf-profile.self.cycles-pp.fault_in_readable
      2.12            -1.9        0.18 ±  4%  perf-profile.self.cycles-pp.xfs_buffered_write_iomap_begin
      1.69            -1.7        0.02 ± 99%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.50            -1.4        0.06 ±  7%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.88 ±  2%      -0.8        0.10 ±  3%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.52 ±  2%      -0.5        0.06 ±  6%  perf-profile.self.cycles-pp.xfs_ilock_for_iomap
      0.45 ±  2%      -0.2        0.22 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.mean_and_variance_weighted_update
      0.00            +0.2        0.18 ±  4%  perf-profile.self.cycles-pp.time_stats_update_one
      0.00            +0.2        0.21 ±  3%  perf-profile.self.cycles-pp.__time_stats_update
      0.64 ±  2%     +95.7       96.36        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase/thread_nr:
  gcc-12/performance/bufferedio/1SSD/xfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MRDM/fxmark/18

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.72            -0.2        0.49 ±  4%  mpstat.cpu.all.usr%
    130035 ±  9%     -21.4%     102208 ± 23%  numa-meminfo.node1.SUnreclaim
     32512 ±  9%     -21.4%      25556 ± 23%  numa-vmstat.node1.nr_slab_unreclaimable
      0.08 ±143%     -87.1%       0.01 ± 73%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
     60568 ± 10%     -41.6%      35398 ± 11%  turbostat.POLL
   3021562           -10.8%    2694935 ±  3%  meminfo.KReclaimable
   3021562           -10.8%    2694935 ±  3%  meminfo.SReclaimable
     24629           -10.8%      21974 ±  3%  vmstat.io.bo
     26873 ±  2%     -12.2%      23585 ±  4%  vmstat.system.cs
    111867 ±  3%     -11.2%      99343        sched_debug.cpu.nr_switches.avg
    468160 ±  8%     -18.4%     381917 ±  6%  sched_debug.cpu.nr_switches.max
     96264 ±  9%     -17.1%      79801 ±  6%  sched_debug.cpu.nr_switches.stddev
     13.28           -40.3%       7.93 ±  5%  fxmark.ssd_xfs_MRDM_18_bufferedio.user_sec
      1.47           -40.3%       0.88 ±  5%  fxmark.ssd_xfs_MRDM_18_bufferedio.user_util
 4.476e+08           -39.0%  2.728e+08 ±  3%  fxmark.ssd_xfs_MRDM_18_bufferedio.works
   8952400           -39.0%    5456929 ±  3%  fxmark.ssd_xfs_MRDM_18_bufferedio.works/sec
    755303           -10.8%     673770 ±  3%  proc-vmstat.nr_slab_reclaimable
     76184            -1.7%      74884        proc-vmstat.nr_slab_unreclaimable
   1634297            -4.6%    1559025        proc-vmstat.numa_hit
   1500937            -5.0%    1425733        proc-vmstat.numa_local
   2847649            -5.9%    2680074        proc-vmstat.pgalloc_normal
   2772462            -5.7%    2614732        proc-vmstat.pgfree
   3620160            -8.9%    3299175        proc-vmstat.pgpgout
  48293239            -7.5%   44664801 ±  5%  perf-stat.i.branch-instructions
     26937 ±  2%     -12.4%      23585 ±  4%  perf-stat.i.context-switches
  53014632            -6.9%   49367688 ±  5%  perf-stat.i.dTLB-loads
  17975906            -6.4%   16824039 ±  5%  perf-stat.i.dTLB-stores
 2.386e+08            -7.4%  2.211e+08 ±  5%  perf-stat.i.instructions
     14.26            -3.7%      13.73 ±  2%  perf-stat.i.metric.K/sec
      0.95            -6.8%       0.89 ±  5%  perf-stat.i.metric.M/sec
     10071 ±  8%     -13.5%       8707 ±  7%  perf-stat.i.node-stores
  48002301 ±  2%      -7.6%   44344423 ±  5%  perf-stat.ps.branch-instructions
     27015 ±  2%     -12.4%      23660 ±  4%  perf-stat.ps.context-switches
  52705638            -7.0%   49022925 ±  5%  perf-stat.ps.dTLB-loads
  17882324            -6.5%   16719436 ±  5%  perf-stat.ps.dTLB-stores
 2.372e+08            -7.5%  2.195e+08 ±  5%  perf-stat.ps.instructions
     10008 ±  8%     -13.6%       8648 ±  7%  perf-stat.ps.node-stores
     22.94 ± 12%     -21.6        1.38 ±  6%  perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
     22.82 ± 12%     -21.5        1.30 ±  6%  perf-profile.calltrace.cycles-pp.up_read.xfs_iunlock.xfs_readdir.iterate_dir.__x64_sys_getdents64
     20.80 ± 14%     -20.8        0.00        perf-profile.calltrace.cycles-pp.down_read.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
     19.35 ± 15%     -18.6        0.79 ± 19%  perf-profile.calltrace.cycles-pp.down_read_killable.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.54 ± 15%     -16.5        0.08 ±223%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.iterate_dir.__x64_sys_getdents64.do_syscall_64
     16.62 ± 15%     -16.4        0.18 ±141%  perf-profile.calltrace.cycles-pp.touch_atime.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.42 ±  8%      -5.4        0.00        perf-profile.calltrace.cycles-pp.up_read.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.12 ± 18%      -5.1        0.00        perf-profile.calltrace.cycles-pp.xfs_ifork_zapped.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      2.54 ± 10%      -0.9        1.63 ±  4%  perf-profile.calltrace.cycles-pp.xfs_dir2_leaf_getdents.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      0.00            +0.8        0.83 ±  9%  perf-profile.calltrace.cycles-pp.down_read.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
     97.98            +1.0       98.96        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.getdents64
     97.79            +1.1       98.86        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
      0.00            +1.3        1.30 ±  7%  perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
     97.32            +1.3       98.62        perf-profile.calltrace.cycles-pp.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
      0.00            +1.9        1.90 ±  3%  perf-profile.calltrace.cycles-pp.time_stats_update_one.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
     95.87            +2.0       97.88        perf-profile.calltrace.cycles-pp.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
     53.85 ± 11%     +42.3       96.18        perf-profile.calltrace.cycles-pp.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.98 ± 14%     +70.2       91.19        perf-profile.calltrace.cycles-pp.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      0.00           +85.3       85.26        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir
      0.00           +86.5       86.47        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
      0.00           +89.7       89.69        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
     28.26 ±  8%     -26.8        1.49 ±  6%  perf-profile.children.cycles-pp.up_read
     22.97 ± 12%     -21.6        1.39 ±  6%  perf-profile.children.cycles-pp.xfs_iunlock
     20.83 ± 14%     -20.0        0.84 ±  9%  perf-profile.children.cycles-pp.down_read
     19.38 ± 15%     -18.6        0.80 ± 19%  perf-profile.children.cycles-pp.down_read_killable
     16.65 ± 15%     -16.2        0.43 ± 21%  perf-profile.children.cycles-pp.touch_atime
     16.60 ± 15%     -16.2        0.40 ± 21%  perf-profile.children.cycles-pp.atime_needs_update
      5.14 ± 18%      -4.8        0.34 ± 12%  perf-profile.children.cycles-pp.xfs_ifork_zapped
      2.56 ±  9%      -0.9        1.65 ±  4%  perf-profile.children.cycles-pp.xfs_dir2_leaf_getdents
      0.92 ±  3%      -0.4        0.48 ±  5%  perf-profile.children.cycles-pp.__fdget_pos
      0.54            -0.3        0.23 ± 20%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.63 ±  4%      -0.3        0.33 ±  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.49 ±  2%      -0.2        0.26 ±  7%  perf-profile.children.cycles-pp.readdir64_r
      0.41 ±  4%      -0.2        0.22 ±  5%  perf-profile.children.cycles-pp.mutex_lock
      0.31 ±  3%      -0.2        0.16 ± 10%  perf-profile.children.cycles-pp.security_file_permission
      0.29 ±  2%      -0.1        0.14 ± 10%  perf-profile.children.cycles-pp.mutex_unlock
      0.31 ±  3%      -0.1        0.16 ±  6%  perf-profile.children.cycles-pp.__cond_resched
      0.24 ±  4%      -0.1        0.12 ±  5%  perf-profile.children.cycles-pp.current_time
      0.25 ±  3%      -0.1        0.13 ± 10%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.21 ±  3%      -0.1        0.11 ± 10%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.10 ±  7%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.13 ±  3%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.rcu_all_qs
      0.10 ±  6%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.aa_file_perm
      0.08 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
     99.42            +0.2       99.65        perf-profile.children.cycles-pp.getdents64
      0.00            +0.3        0.34 ±  6%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.4        0.39 ±  6%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.4        0.42 ±  6%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.5        0.51 ±  8%  perf-profile.children.cycles-pp.mean_and_variance_weighted_update
     98.06            +1.0       99.03        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     97.92            +1.0       98.96        perf-profile.children.cycles-pp.do_syscall_64
      0.14 ±  3%      +1.2        1.32 ±  7%  perf-profile.children.cycles-pp.xfs_ilock
     97.39            +1.3       98.66        perf-profile.children.cycles-pp.__x64_sys_getdents64
      0.00            +1.9        1.93 ±  3%  perf-profile.children.cycles-pp.time_stats_update_one
     95.96            +2.0       97.93        perf-profile.children.cycles-pp.iterate_dir
     53.94 ± 11%     +42.3       96.23        perf-profile.children.cycles-pp.xfs_readdir
     21.01 ± 13%     +70.2       91.22        perf-profile.children.cycles-pp.xfs_ilock_data_map_shared
      0.00           +85.3       85.27        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00           +86.5       86.49        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00           +89.7       89.73        perf-profile.children.cycles-pp.__time_stats_update
     28.21 ±  8%     -26.7        1.47 ±  6%  perf-profile.self.cycles-pp.up_read
     20.70 ± 14%     -19.9        0.79 ± 10%  perf-profile.self.cycles-pp.down_read
     19.25 ± 15%     -18.5        0.74 ± 20%  perf-profile.self.cycles-pp.down_read_killable
     16.26 ± 15%     -16.0        0.24 ± 37%  perf-profile.self.cycles-pp.atime_needs_update
      5.12 ± 18%      -4.8        0.34 ± 12%  perf-profile.self.cycles-pp.xfs_ifork_zapped
      1.52 ± 16%      -0.7        0.78 ±  5%  perf-profile.self.cycles-pp.xfs_dir2_leaf_getdents
      0.67 ±  2%      -0.3        0.35 ±  4%  perf-profile.self.cycles-pp.xfs_readdir
      0.53            -0.3        0.22 ± 20%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50 ±  5%      -0.3        0.25 ±  8%  perf-profile.self.cycles-pp.getdents64
      0.52 ±  4%      -0.3        0.27 ±  7%  perf-profile.self.cycles-pp.__fdget_pos
      0.46 ±  3%      -0.2        0.25 ±  6%  perf-profile.self.cycles-pp.readdir64_r
      0.29 ±  5%      -0.1        0.14 ±  9%  perf-profile.self.cycles-pp.do_syscall_64
      0.27            -0.1        0.14 ± 10%  perf-profile.self.cycles-pp.mutex_unlock
      0.29 ±  5%      -0.1        0.15 ±  6%  perf-profile.self.cycles-pp.mutex_lock
      0.24 ±  8%      -0.1        0.12 ±  5%  perf-profile.self.cycles-pp.__x64_sys_getdents64
      0.26 ±  3%      -0.1        0.13 ±  7%  perf-profile.self.cycles-pp.iterate_dir
      0.20 ±  5%      -0.1        0.11 ±  8%  perf-profile.self.cycles-pp.xfs_bmap_last_extent
      0.19 ±  3%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__cond_resched
      0.17 ±  5%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.current_time
      0.18 ±  4%      -0.1        0.10 ± 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.16 ±  4%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.10 ±  7%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.22 ±  8%      -0.1        0.15 ±  4%  perf-profile.self.cycles-pp.xfs_dir2_leaf_readbuf
      0.09 ±  4%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.aa_file_perm
      0.13 ±  6%      -0.1        0.07 ± 11%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.12 ±  4%      -0.1        0.06 ± 13%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.13 ± 10%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.xfs_iunlock
      0.13 ±  2%      -0.1        0.08 ± 10%  perf-profile.self.cycles-pp.xfs_ilock
      0.08 ±  5%      -0.0        0.05        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.20 ±  6%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.xfs_bmap_last_offset
      0.15 ±  6%      +0.0        0.18 ±  7%  perf-profile.self.cycles-pp.xfs_dir2_isblock
      0.00            +0.3        0.32 ±  6%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.5        0.49 ±  8%  perf-profile.self.cycles-pp.mean_and_variance_weighted_update
      0.00            +1.2        1.22 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +1.3        1.30 ±  3%  perf-profile.self.cycles-pp.__time_stats_update
      0.00            +1.4        1.43 ±  6%  perf-profile.self.cycles-pp.time_stats_update_one
      0.00           +85.3       85.26        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase/thread_nr:
  gcc-12/performance/directio/1SSD/xfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MRDL/fxmark/4

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1723975 ±  2%     -23.9%    1311571        cpuidle..usage
   3662221           -25.1%    2743157 ±  3%  numa-numastat.node0.local_node
   3744047           -24.9%    2812332 ±  3%  numa-numastat.node0.numa_hit
    231.00 ±  9%     -49.6%     116.50 ± 13%  perf-c2c.DRAM.local
    105.67 ±  6%    +700.5%     845.83 ± 13%  perf-c2c.HITM.local
     33.95 ±  2%     -12.2%      29.81        iostat.cpu.idle
     57.47           +13.0%      64.95        iostat.cpu.system
      4.86           -64.5%       1.73 ±  5%  iostat.cpu.user
     33.09 ±  2%      -4.2       28.94        mpstat.cpu.all.idle%
      0.86            -0.2        0.64 ±  4%  mpstat.cpu.all.soft%
     56.06            +7.8       63.87        mpstat.cpu.all.sys%
      4.92            -3.2        1.74 ±  5%  mpstat.cpu.all.usr%
   2864831 ±  2%     -29.0%    2034962 ±  4%  numa-vmstat.node0.nr_slab_reclaimable
     81544 ±  9%     -21.6%      63892 ±  5%  numa-vmstat.node0.nr_slab_unreclaimable
   3743733           -24.9%    2812617 ±  3%  numa-vmstat.node0.numa_hit
   3661917           -25.1%    2743443 ±  3%  numa-vmstat.node0.numa_local
  11449352           -28.9%    8146085 ±  4%  numa-meminfo.node0.KReclaimable
  19416949 ±  6%     -23.3%   14885538 ±  7%  numa-meminfo.node0.MemUsed
  11449352           -28.9%    8146085 ±  4%  numa-meminfo.node0.SReclaimable
    326039 ±  9%     -21.6%     255663 ±  5%  numa-meminfo.node0.SUnreclaim
  11775391 ±  2%     -28.6%    8401749 ±  4%  numa-meminfo.node0.Slab
     92824 ±  2%     -29.0%      65900 ±  4%  vmstat.io.bo
  14364104           -23.2%   11035980 ±  3%  vmstat.memory.cache
      0.29 ±  5%     -20.8%       0.23 ±  8%  vmstat.procs.b
     10486 ±  2%     -53.5%       4873 ±  5%  vmstat.system.cs
     13976            -3.7%      13454        vmstat.system.in
  11477494 ±  2%     -28.9%    8164752 ±  4%  meminfo.KReclaimable
  20764067           -22.9%   16005871 ±  3%  meminfo.Memused
  11477494 ±  2%     -28.9%    8164752 ±  4%  meminfo.SReclaimable
    436124           -14.4%     373502 ±  2%  meminfo.SUnreclaim
  11913618           -28.3%    8538254 ±  4%  meminfo.Slab
  23134924           -23.3%   17748439 ±  3%  meminfo.max_used_kB
    136500 ±  7%     -86.0%      19068 ± 21%  turbostat.C1
      0.01            -0.0        0.00        turbostat.C1%
    322742 ±  6%     -75.6%      78887 ±  8%  turbostat.C1E
      0.26 ±  4%      -0.1        0.19 ±  3%  turbostat.C1E%
      0.62           -52.5%       0.30 ±  4%  turbostat.IPC
     24402 ± 11%     -72.8%       6631 ±  9%  turbostat.POLL
     33.84           -62.6%      12.66 ± 54%  turbostat.Pkg%pc2
     47.05            -1.3%      46.44        turbostat.RAMWatt
    173.95           +11.1%     193.21        fxmark.ssd_xfs_MRDL_4_directio.sys_sec
     86.92           +11.1%      96.54        fxmark.ssd_xfs_MRDL_4_directio.sys_util
     25.32           -76.1%       6.06 ±  4%  fxmark.ssd_xfs_MRDL_4_directio.user_sec
     12.65           -76.1%       3.03 ±  4%  fxmark.ssd_xfs_MRDL_4_directio.user_util
 8.749e+08           -77.8%  1.946e+08 ±  4%  fxmark.ssd_xfs_MRDL_4_directio.works
  17497044           -77.8%    3891628 ±  4%  fxmark.ssd_xfs_MRDL_4_directio.works/sec
     21466 ±  5%     -16.3%      17966 ± 11%  fxmark.time.involuntary_context_switches
     65.83 ±  2%      +6.1%      69.83        fxmark.time.percent_of_cpu_this_job_got
     97.95            +7.8%     105.58        fxmark.time.system_time
     86078 ±  6%     -93.0%       6001 ± 41%  fxmark.time.voluntary_context_switches
     10340 ±  2%     -55.5%       4598 ±  5%  perf-stat.i.context-switches
      0.09 ±  2%      +9.4%       0.10 ± 10%  perf-stat.i.cpi
     69.59           -15.8%      58.60        perf-stat.i.cpu-migrations
      0.03 ±  2%      +0.0        0.03 ± 12%  perf-stat.i.dTLB-load-miss-rate%
    156462 ±  2%      +5.5%     165050 ±  2%  perf-stat.i.dTLB-load-misses
      0.01            +0.0        0.01 ± 10%  perf-stat.i.dTLB-store-miss-rate%
      2.21 ±  2%      +0.1        2.34 ±  2%  perf-stat.i.node-load-miss-rate%
     10272 ±  2%     -55.5%       4566 ±  5%  perf-stat.ps.context-switches
     69.21           -15.8%      58.29        perf-stat.ps.cpu-migrations
    157254 ±  2%      +5.5%     165912 ±  2%  perf-stat.ps.dTLB-load-misses
     92433            +1.0%      93337        proc-vmstat.nr_anon_pages
   2752726            +4.3%    2871524        proc-vmstat.nr_dirty_background_threshold
   5512183            +4.3%    5750069        proc-vmstat.nr_dirty_threshold
  27721727            +4.3%   28911448        proc-vmstat.nr_free_pages
     93894            +1.1%      94927        proc-vmstat.nr_inactive_anon
   2871541           -28.9%    2042995 ±  4%  proc-vmstat.nr_slab_reclaimable
    109042           -14.3%      93417 ±  2%  proc-vmstat.nr_slab_unreclaimable
     93894            +1.1%      94927        proc-vmstat.nr_zone_inactive_anon
   3962264           -22.7%    3063301 ±  2%  proc-vmstat.numa_hit
   3828849           -23.5%    2928624 ±  2%  proc-vmstat.numa_local
   8143997           -25.0%    6111379 ±  3%  proc-vmstat.pgalloc_normal
   8115157           -25.0%    6086423 ±  3%  proc-vmstat.pgfree
  15033507           -31.1%   10353219 ±  4%  proc-vmstat.pgpgout
    133109 ±  4%     +13.9%     151595 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
    146323 ±  4%     +14.7%     167760 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
    125246 ±  5%     +14.9%     143936 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.min
    133109 ±  4%     +13.9%     151595 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
    146323 ±  4%     +14.7%     167760 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
    125247 ±  5%     +14.9%     143936 ±  3%  sched_debug.cfs_rq:/.min_vruntime.min
    391.28 ± 36%     +60.6%     628.44 ± 11%  sched_debug.cfs_rq:/.util_est.min
    226.82 ± 18%     -34.7%     148.21 ± 28%  sched_debug.cfs_rq:/.util_est.stddev
      0.77 ± 16%     -28.2%       0.55 ± 13%  sched_debug.cpu.nr_running.stddev
    193017 ±  2%     -58.5%      80137 ±  6%  sched_debug.cpu.nr_switches.avg
    337313 ±  3%     -44.7%     186423 ±  4%  sched_debug.cpu.nr_switches.max
    143865 ±  3%     -70.1%      43034 ±  9%  sched_debug.cpu.nr_switches.min
     76395 ±  7%     -26.9%      55870 ±  4%  sched_debug.cpu.nr_switches.stddev
     56.72 ± 16%     -71.5%      16.17 ± 28%  sched_debug.cpu.nr_uninterruptible.max
     39.09 ± 12%     -47.9%      20.35 ± 15%  sched_debug.cpu.nr_uninterruptible.stddev
     13.00 ±  3%     -10.4        2.57 ±  6%  perf-profile.calltrace.cycles-pp.xfs_dir2_leaf_readbuf.xfs_dir2_leaf_getdents.xfs_readdir.iterate_dir.__x64_sys_getdents64
     15.65 ±  3%     -10.0        5.68 ±  5%  perf-profile.calltrace.cycles-pp.xfs_dir2_leaf_getdents.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
     10.96 ±  2%      -8.6        2.31 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.getdents64
     14.76 ±  2%      -8.3        6.46 ±  5%  perf-profile.calltrace.cycles-pp.xfs_dir2_isblock.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
     13.28 ±  2%      -7.8        5.48 ±  6%  perf-profile.calltrace.cycles-pp.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir.iterate_dir.__x64_sys_getdents64
      8.70 ±  6%      -7.0        1.68 ±  8%  perf-profile.calltrace.cycles-pp.xfs_iext_lookup_extent.xfs_dir2_leaf_readbuf.xfs_dir2_leaf_getdents.xfs_readdir.iterate_dir
     11.50 ±  2%      -6.9        4.57 ±  7%  perf-profile.calltrace.cycles-pp.xfs_bmap_last_extent.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir.iterate_dir
      8.57            -6.8        1.78 ±  4%  perf-profile.calltrace.cycles-pp.__fdget_pos.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
      7.40 ±  2%      -5.6        1.83 ±  6%  perf-profile.calltrace.cycles-pp.xfs_iext_last.xfs_bmap_last_extent.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir
      5.33 ±  2%      -4.2        1.10 ±  3%  perf-profile.calltrace.cycles-pp.touch_atime.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.60 ±  2%      -3.7        0.94 ±  4%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.iterate_dir.__x64_sys_getdents64.do_syscall_64
      4.34 ±  3%      -3.4        0.94 ±  4%  perf-profile.calltrace.cycles-pp.readdir64_r
      3.92 ±  4%      -3.1        0.86 ±  9%  perf-profile.calltrace.cycles-pp.down_read_killable.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.75 ±  2%      -3.0        0.76 ±  4%  perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.77 ±  2%      -2.9        0.83 ±  9%  perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      2.90 ± 13%      -2.3        0.60 ± 11%  perf-profile.calltrace.cycles-pp.security_file_permission.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.56 ±  3%      -2.1        0.48 ± 45%  perf-profile.calltrace.cycles-pp.up_read.xfs_iunlock.xfs_readdir.iterate_dir.__x64_sys_getdents64
      2.62 ±  2%      -2.1        0.56 ±  7%  perf-profile.calltrace.cycles-pp.up_read.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.24 ±  2%      -2.0        0.26 ±100%  perf-profile.calltrace.cycles-pp.mutex_unlock.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
      1.59 ±  7%      -1.1        0.44 ± 44%  perf-profile.calltrace.cycles-pp.xfs_iext_get_extent.xfs_bmap_last_extent.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir
      0.00            +0.6        0.63 ±  6%  perf-profile.calltrace.cycles-pp.down_read.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
      0.82 ±  2%      +1.0        1.82 ± 12%  perf-profile.calltrace.cycles-pp.xfs_iread_extents.xfs_bmap_last_extent.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir
      0.00            +1.0        1.03 ±  7%  perf-profile.calltrace.cycles-pp.native_sched_clock.local_clock_noinstr.local_clock.xfs_ilock.xfs_ilock_data_map_shared
      0.00            +1.2        1.20 ±  7%  perf-profile.calltrace.cycles-pp.local_clock_noinstr.local_clock.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir
      0.00            +1.3        1.27 ±  7%  perf-profile.calltrace.cycles-pp.local_clock.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
      0.77 ± 17%      +1.4        2.15 ±  6%  perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
      0.00            +1.9        1.85 ± 15%  perf-profile.calltrace.cycles-pp.mean_and_variance_weighted_update.time_stats_update_one.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir
     93.48            +4.9       98.35        perf-profile.calltrace.cycles-pp.getdents64
      0.00            +7.2        7.19 ±  3%  perf-profile.calltrace.cycles-pp.time_stats_update_one.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
     82.33           +13.6       95.91        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.getdents64
     80.40           +15.1       95.51        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
     75.96           +18.6       94.58        perf-profile.calltrace.cycles-pp.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
     62.35           +29.4       91.71        perf-profile.calltrace.cycles-pp.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
     44.29           +43.6       87.85        perf-profile.calltrace.cycles-pp.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +54.6       54.61        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir
      0.00           +58.3       58.26        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
      3.29 ±  6%     +70.2       73.50        perf-profile.calltrace.cycles-pp.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      0.00           +70.8       70.85        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
     13.50 ±  3%     -10.8        2.68 ±  5%  perf-profile.children.cycles-pp.xfs_dir2_leaf_readbuf
     15.90 ±  3%     -10.2        5.72 ±  5%  perf-profile.children.cycles-pp.xfs_dir2_leaf_getdents
     15.02 ±  2%      -8.5        6.50 ±  5%  perf-profile.children.cycles-pp.xfs_dir2_isblock
     13.64 ±  2%      -8.1        5.55 ±  6%  perf-profile.children.cycles-pp.xfs_bmap_last_offset
     11.86 ±  2%      -7.2        4.66 ±  7%  perf-profile.children.cycles-pp.xfs_bmap_last_extent
      8.83 ±  6%      -7.1        1.70 ±  8%  perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      8.97            -7.1        1.86 ±  4%  perf-profile.children.cycles-pp.__fdget_pos
      7.52 ±  2%      -5.7        1.86 ±  6%  perf-profile.children.cycles-pp.xfs_iext_last
      6.38            -5.0        1.34 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      5.58 ±  2%      -4.4        1.16 ±  3%  perf-profile.children.cycles-pp.touch_atime
      5.42            -4.2        1.17 ±  7%  perf-profile.children.cycles-pp.up_read
      5.09 ±  3%      -4.0        1.05 ±  4%  perf-profile.children.cycles-pp.atime_needs_update
      4.85 ±  3%      -3.8        1.04 ±  4%  perf-profile.children.cycles-pp.readdir64_r
      4.17 ±  3%      -3.3        0.92 ±  9%  perf-profile.children.cycles-pp.down_read_killable
      4.02 ±  2%      -3.2        0.82 ±  4%  perf-profile.children.cycles-pp.mutex_lock
      4.03 ±  2%      -3.2        0.88 ±  8%  perf-profile.children.cycles-pp.xfs_iunlock
      3.64 ±  3%      -2.8        0.80 ±  6%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.18 ± 12%      -2.5        0.67 ± 11%  perf-profile.children.cycles-pp.security_file_permission
      2.56 ± 12%      -2.0        0.53 ± 10%  perf-profile.children.cycles-pp.apparmor_file_permission
      2.62 ±  4%      -2.0        0.63 ±  6%  perf-profile.children.cycles-pp.__cond_resched
      2.35 ±  2%      -1.8        0.52 ±  9%  perf-profile.children.cycles-pp.mutex_unlock
      2.26            -1.8        0.46 ±  3%  perf-profile.children.cycles-pp.current_time
      2.08            -1.6        0.45 ± 10%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.22 ±  6%      -1.5        0.67 ±  6%  perf-profile.children.cycles-pp.down_read
      1.70 ±  6%      -1.1        0.55 ±  4%  perf-profile.children.cycles-pp.xfs_iext_get_extent
      1.03 ±  8%      -0.8        0.19 ± 10%  perf-profile.children.cycles-pp.aa_file_perm
      0.99 ±  2%      -0.8        0.22 ± 10%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.01 ±  4%      -0.8        0.24 ±  5%  perf-profile.children.cycles-pp.rcu_all_qs
      0.92 ±  2%      -0.7        0.21 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.66 ±  3%      -0.5        0.13 ± 10%  perf-profile.children.cycles-pp.xfs_ifork_zapped
      0.65 ±  3%      -0.5        0.13 ±  6%  perf-profile.children.cycles-pp.xfs_file_readdir
      0.63 ±  5%      -0.5        0.13 ± 14%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.61 ±  5%      -0.5        0.13 ± 10%  perf-profile.children.cycles-pp.main_work
      2.66            -0.4        2.24 ±  9%  perf-profile.children.cycles-pp.xfs_iread_extents
      0.51 ±  3%      -0.4        0.10 ± 10%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.52 ±  5%      -0.4        0.11 ± 14%  perf-profile.children.cycles-pp.xfs_isilocked
      0.49 ±  6%      -0.4        0.10 ±  8%  perf-profile.children.cycles-pp.make_vfsgid
      0.48 ±  6%      -0.4        0.10 ± 21%  perf-profile.children.cycles-pp.make_vfsuid
      0.40 ±  2%      -0.3        0.08 ± 17%  perf-profile.children.cycles-pp.amd_clear_divider
      0.28 ±  4%      -0.2        0.08 ± 16%  perf-profile.children.cycles-pp.readdir_r@plt
      0.23 ± 11%      -0.2        0.03 ±102%  perf-profile.children.cycles-pp.__f_unlock_pos
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.mean_and_variance_weighted_get_mean
      0.00            +0.2        0.19 ± 15%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +1.1        1.07 ±  6%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +1.3        1.29 ±  6%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.90 ± 15%      +1.3        2.22 ±  6%  perf-profile.children.cycles-pp.xfs_ilock
      0.00            +1.4        1.36 ±  6%  perf-profile.children.cycles-pp.local_clock
      0.00            +1.9        1.91 ± 15%  perf-profile.children.cycles-pp.mean_and_variance_weighted_update
     94.78            +3.8       98.60        perf-profile.children.cycles-pp.getdents64
      0.00            +7.3        7.28 ±  3%  perf-profile.children.cycles-pp.time_stats_update_one
     82.66           +13.5       96.16        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     81.23           +14.6       95.87        perf-profile.children.cycles-pp.do_syscall_64
     76.58           +18.1       94.71        perf-profile.children.cycles-pp.__x64_sys_getdents64
     63.21           +28.7       91.89        perf-profile.children.cycles-pp.iterate_dir
     45.04           +43.0       88.05        perf-profile.children.cycles-pp.xfs_readdir
      0.00           +54.6       54.64        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00           +58.3       58.32        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      3.46 ±  6%     +70.1       73.54        perf-profile.children.cycles-pp.xfs_ilock_data_map_shared
      0.00           +71.0       70.98        perf-profile.children.cycles-pp.__time_stats_update
      8.56 ±  6%      -6.9        1.65 ±  8%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      7.45 ±  2%      -5.6        1.82 ±  6%  perf-profile.self.cycles-pp.xfs_iext_last
      5.96            -4.6        1.30 ±  5%  perf-profile.self.cycles-pp.xfs_readdir
      5.16            -4.0        1.12 ±  7%  perf-profile.self.cycles-pp.up_read
      5.07            -4.0        1.06 ±  8%  perf-profile.self.cycles-pp.__fdget_pos
      4.85 ±  2%      -3.8        1.04 ±  8%  perf-profile.self.cycles-pp.getdents64
      4.67 ±  2%      -3.7        1.00 ±  4%  perf-profile.self.cycles-pp.readdir64_r
      3.53 ±  3%      -2.8        0.78 ±  6%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.14            -2.5        0.64 ±  6%  perf-profile.self.cycles-pp.xfs_dir2_leaf_readbuf
      3.14 ±  3%      -2.4        0.70 ± 12%  perf-profile.self.cycles-pp.down_read_killable
      2.87 ±  2%      -2.3        0.57 ±  5%  perf-profile.self.cycles-pp.mutex_lock
      2.74 ±  3%      -2.2        0.58 ±  5%  perf-profile.self.cycles-pp.do_syscall_64
      2.49 ±  2%      -2.0        0.53 ±  7%  perf-profile.self.cycles-pp.iterate_dir
      2.21 ±  7%      -1.7        0.46 ± 11%  perf-profile.self.cycles-pp.__x64_sys_getdents64
      2.22 ±  2%      -1.7        0.49 ±  8%  perf-profile.self.cycles-pp.mutex_unlock
      2.10 ±  5%      -1.7        0.44 ±  4%  perf-profile.self.cycles-pp.atime_needs_update
      1.79 ±  2%      -1.4        0.37 ±  8%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.75 ±  3%      -1.3        0.43 ± 11%  perf-profile.self.cycles-pp.xfs_bmap_last_extent
      1.62            -1.3        0.33 ±  3%  perf-profile.self.cycles-pp.current_time
      1.66 ±  4%      -1.3        0.38 ±  6%  perf-profile.self.cycles-pp.__cond_resched
      1.54 ±  3%      -1.2        0.32 ± 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.38 ± 18%      -1.1        0.30 ± 15%  perf-profile.self.cycles-pp.apparmor_file_permission
      1.56 ±  9%      -1.1        0.49 ±  8%  perf-profile.self.cycles-pp.down_read
      1.34 ±  3%      -1.1        0.28 ±  6%  perf-profile.self.cycles-pp.xfs_iunlock
      1.56 ±  7%      -1.0        0.53 ±  5%  perf-profile.self.cycles-pp.xfs_iext_get_extent
      1.89 ±  2%      -1.0        0.91 ±  9%  perf-profile.self.cycles-pp.xfs_bmap_last_offset
      1.15            -0.9        0.24 ± 12%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.99 ±  2%      -0.8        0.21 ± 10%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.92 ± 11%      -0.7        0.17 ±  9%  perf-profile.self.cycles-pp.aa_file_perm
      0.92 ±  3%      -0.7        0.21 ±  6%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.84 ± 15%      -0.6        0.22 ± 15%  perf-profile.self.cycles-pp.xfs_ilock
      0.76 ± 13%      -0.6        0.17 ± 13%  perf-profile.self.cycles-pp.security_file_permission
      1.51 ± 10%      -0.6        0.94 ±  4%  perf-profile.self.cycles-pp.xfs_dir2_isblock
      0.66 ±  4%      -0.5        0.17 ±  6%  perf-profile.self.cycles-pp.rcu_all_qs
      0.52 ±  2%      -0.4        0.10 ± 10%  perf-profile.self.cycles-pp.xfs_ifork_zapped
      0.50 ±  6%      -0.4        0.10 ± 13%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.50 ±  4%      -0.4        0.11 ± 10%  perf-profile.self.cycles-pp.touch_atime
      0.40 ±  5%      -0.3        0.08 ±  6%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.40 ±  7%      -0.3        0.08 ± 11%  perf-profile.self.cycles-pp.xfs_isilocked
      0.39 ±  4%      -0.3        0.08 ± 16%  perf-profile.self.cycles-pp.xfs_file_readdir
      0.40 ±  9%      -0.3        0.10 ± 14%  perf-profile.self.cycles-pp.xfs_ilock_data_map_shared
      0.37 ±  6%      -0.3        0.08 ± 17%  perf-profile.self.cycles-pp.make_vfsuid
      0.36 ±  6%      -0.3        0.07 ± 10%  perf-profile.self.cycles-pp.make_vfsgid
      0.36 ±  5%      -0.3        0.08 ± 13%  perf-profile.self.cycles-pp.main_work
      0.26 ±  3%      -0.2        0.04 ± 75%  perf-profile.self.cycles-pp.amd_clear_divider
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.sched_clock_noinstr
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.local_clock
      0.00            +0.1        0.09 ±  7%  perf-profile.self.cycles-pp.mean_and_variance_weighted_get_mean
      0.00            +0.2        0.16 ± 17%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.2        0.16 ± 12%  perf-profile.self.cycles-pp.local_clock_noinstr
      2.41 ±  4%      +0.6        3.04 ±  9%  perf-profile.self.cycles-pp.xfs_dir2_leaf_getdents
      0.00            +1.0        1.02 ±  7%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +1.8        1.84 ± 15%  perf-profile.self.cycles-pp.mean_and_variance_weighted_update
      0.00            +3.7        3.68 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +5.3        5.33 ±  5%  perf-profile.self.cycles-pp.__time_stats_update
      0.00            +5.4        5.41 ±  6%  perf-profile.self.cycles-pp.time_stats_update_one
      0.00           +54.6       54.61        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase/thread_nr:
  gcc-12/performance/directio/1SSD/xfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/MRDM/fxmark/18

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.71            -0.2        0.49 ±  3%  mpstat.cpu.all.usr%
    746408            -8.8%     681016        numa-vmstat.node0.nr_slab_reclaimable
   2986839            -8.8%    2724869        numa-meminfo.node0.KReclaimable
   2986839            -8.8%    2724869        numa-meminfo.node0.SReclaimable
     24725            -9.1%      22474        vmstat.io.bo
     26976 ±  2%     -11.7%      23822 ±  3%  vmstat.system.cs
     27023 ±  2%     -11.9%      23819 ±  3%  perf-stat.i.context-switches
      2.58 ±  2%      -0.2        2.43 ±  4%  perf-stat.i.node-load-miss-rate%
     27122 ±  2%     -11.9%      23897 ±  3%  perf-stat.ps.context-switches
     13.31           -41.6%       7.78 ±  3%  fxmark.ssd_xfs_MRDM_18_directio.user_sec
      1.48           -41.6%       0.86 ±  3%  fxmark.ssd_xfs_MRDM_18_directio.user_util
 4.484e+08           -39.9%  2.694e+08 ±  3%  fxmark.ssd_xfs_MRDM_18_directio.works
   8968572           -39.9%    5387033 ±  3%  fxmark.ssd_xfs_MRDM_18_directio.works/sec
    132653 ±  6%     -19.1%     107342 ± 10%  turbostat.C1
   1744751 ±  2%      -9.0%    1587377 ±  3%  turbostat.C1E
     57030 ±  6%     -36.8%      36060 ±  8%  turbostat.POLL
     60.33            -6.4%      56.50 ±  3%  turbostat.PkgTmp
    373.90 ±169%     -93.6%      24.07 ±101%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
     32.17 ± 30%     -59.6%      13.00 ± 84%  perf-sched.wait_and_delay.count.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
      1024 ± 64%     -77.0%     235.34 ±112%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
    373.72 ±169%     -94.4%      20.88 ±113%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
      7.32 ± 69%   +6821.3%     506.49 ± 97%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1022 ± 64%     -77.1%     233.78 ±112%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_killable.__kthread_create_on_node
    758714            -9.0%     690051        proc-vmstat.nr_slab_reclaimable
     76373            -1.5%      75262        proc-vmstat.nr_slab_unreclaimable
   1637725            -5.2%    1553110        proc-vmstat.numa_hit
   1502959            -5.5%    1419696        proc-vmstat.numa_local
   2850414            -6.1%    2676416        proc-vmstat.pgalloc_normal
   2771928            -5.9%    2607971        proc-vmstat.pgfree
   3609605            -8.5%    3302858        proc-vmstat.pgpgout
      1073 ±223%    +315.7%       4460 ±109%  sched_debug.cfs_rq:/.left_deadline.avg
     19352 ±222%    +226.6%      63207 ± 98%  sched_debug.cfs_rq:/.left_deadline.max
      4427 ±223%    +254.4%      15691 ±100%  sched_debug.cfs_rq:/.left_deadline.stddev
      1072 ±223%    +315.7%       4460 ±109%  sched_debug.cfs_rq:/.left_vruntime.avg
     19339 ±223%    +226.7%      63184 ± 98%  sched_debug.cfs_rq:/.left_vruntime.max
      4425 ±223%    +254.5%      15689 ±100%  sched_debug.cfs_rq:/.left_vruntime.stddev
    220636 ± 72%   +4652.2%   10485088 ±134%  sched_debug.cfs_rq:/.load.max
     34889 ± 77%   +6694.7%    2370641 ±136%  sched_debug.cfs_rq:/.load.stddev
      1072 ±223%    +315.7%       4460 ±109%  sched_debug.cfs_rq:/.right_vruntime.avg
     19339 ±223%    +226.7%      63184 ± 98%  sched_debug.cfs_rq:/.right_vruntime.max
      4425 ±223%    +254.5%      15689 ±100%  sched_debug.cfs_rq:/.right_vruntime.stddev
    113555 ±  2%     -12.2%      99730 ±  3%  sched_debug.cpu.nr_switches.avg
    446947 ± 11%     -14.7%     381267 ± 10%  sched_debug.cpu.nr_switches.max
     22.90 ± 14%     -22.1        0.77 ± 17%  perf-profile.calltrace.cycles-pp.down_read_killable.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.52 ± 14%     -19.5        0.00        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.iterate_dir.__x64_sys_getdents64.do_syscall_64
     19.60 ± 14%     -19.5        0.09 ±223%  perf-profile.calltrace.cycles-pp.touch_atime.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.69 ± 16%     -18.3        1.39 ± 11%  perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
     19.57 ± 16%     -18.2        1.32 ± 11%  perf-profile.calltrace.cycles-pp.up_read.xfs_iunlock.xfs_readdir.iterate_dir.__x64_sys_getdents64
     17.59 ± 17%     -17.6        0.00        perf-profile.calltrace.cycles-pp.down_read.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
      5.86 ±  5%      -5.9        0.00        perf-profile.calltrace.cycles-pp.up_read.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.43 ±  7%      -0.8        1.59 ±  5%  perf-profile.calltrace.cycles-pp.xfs_dir2_leaf_getdents.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      1.52 ±  6%      -0.4        1.09 ± 11%  perf-profile.calltrace.cycles-pp.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir.iterate_dir.__x64_sys_getdents64
      1.34 ±  7%      -0.4        0.91 ± 13%  perf-profile.calltrace.cycles-pp.xfs_bmap_last_extent.xfs_bmap_last_offset.xfs_dir2_isblock.xfs_readdir.iterate_dir
      1.68 ±  4%      -0.4        1.27 ±  9%  perf-profile.calltrace.cycles-pp.xfs_dir2_isblock.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      0.00            +0.8        0.84 ± 10%  perf-profile.calltrace.cycles-pp.down_read.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
     97.95            +1.0       98.98        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.getdents64
     97.76            +1.1       98.88        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
      0.00            +1.3        1.30 ±  8%  perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
     97.30            +1.3       98.64        perf-profile.calltrace.cycles-pp.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
      0.00            +1.9        1.91 ±  3%  perf-profile.calltrace.cycles-pp.time_stats_update_one.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
     95.85            +2.1       97.93        perf-profile.calltrace.cycles-pp.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe.getdents64
     46.84 ± 13%     +49.4       96.26        perf-profile.calltrace.cycles-pp.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.78 ± 17%     +73.6       91.35        perf-profile.calltrace.cycles-pp.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64.do_syscall_64
      0.00           +85.4       85.45        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir
      0.00           +86.6       86.62        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir
      0.00           +89.9       89.86        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_data_map_shared.xfs_readdir.iterate_dir.__x64_sys_getdents64
     25.46 ± 11%     -24.0        1.50 ± 11%  perf-profile.children.cycles-pp.up_read
     22.93 ± 14%     -22.2        0.78 ± 17%  perf-profile.children.cycles-pp.down_read_killable
     19.63 ± 14%     -19.2        0.42 ± 16%  perf-profile.children.cycles-pp.touch_atime
     19.58 ± 14%     -19.2        0.39 ± 17%  perf-profile.children.cycles-pp.atime_needs_update
     19.72 ± 16%     -18.3        1.40 ± 11%  perf-profile.children.cycles-pp.xfs_iunlock
     17.62 ± 17%     -16.8        0.85 ± 10%  perf-profile.children.cycles-pp.down_read
      4.59 ± 12%      -4.3        0.33 ± 16%  perf-profile.children.cycles-pp.xfs_ifork_zapped
      2.45 ±  7%      -0.8        1.60 ±  5%  perf-profile.children.cycles-pp.xfs_dir2_leaf_getdents
      0.92 ±  2%      -0.5        0.45 ±  4%  perf-profile.children.cycles-pp.__fdget_pos
      1.39 ±  7%      -0.5        0.93 ± 13%  perf-profile.children.cycles-pp.xfs_bmap_last_extent
      1.56 ±  5%      -0.5        1.11 ± 11%  perf-profile.children.cycles-pp.xfs_bmap_last_offset
      1.70 ±  4%      -0.4        1.28 ±  9%  perf-profile.children.cycles-pp.xfs_dir2_isblock
      0.85 ± 12%      -0.4        0.47 ± 21%  perf-profile.children.cycles-pp.xfs_iext_last
      0.64            -0.3        0.32 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.53            -0.3        0.22 ± 21%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50 ±  2%      -0.2        0.25 ±  4%  perf-profile.children.cycles-pp.readdir64_r
      0.40            -0.2        0.20 ±  5%  perf-profile.children.cycles-pp.mutex_lock
      0.32 ±  3%      -0.2        0.16 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      0.29 ±  4%      -0.1        0.14 ±  8%  perf-profile.children.cycles-pp.mutex_unlock
      0.31 ±  6%      -0.1        0.17 ±  7%  perf-profile.children.cycles-pp.security_file_permission
      0.24 ±  3%      -0.1        0.12 ±  5%  perf-profile.children.cycles-pp.current_time
      0.25 ±  6%      -0.1        0.14 ±  9%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.21 ±  6%      -0.1        0.11 ±  6%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.11 ±  3%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.12 ±  5%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.rcu_all_qs
      0.10 ±  8%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.10 ±  6%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.aa_file_perm
      0.16 ±  5%      -0.0        0.13 ±  8%  perf-profile.children.cycles-pp.xfs_iext_get_extent
     99.40            +0.2       99.65        perf-profile.children.cycles-pp.getdents64
      0.00            +0.3        0.33 ±  6%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.4        0.38 ±  6%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.4        0.41 ±  6%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.5        0.49 ±  9%  perf-profile.children.cycles-pp.mean_and_variance_weighted_update
     98.03            +1.0       99.04        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     97.89            +1.1       98.97        perf-profile.children.cycles-pp.do_syscall_64
      0.14 ±  4%      +1.2        1.32 ±  8%  perf-profile.children.cycles-pp.xfs_ilock
     97.37            +1.3       98.68        perf-profile.children.cycles-pp.__x64_sys_getdents64
      0.00            +1.9        1.93 ±  3%  perf-profile.children.cycles-pp.time_stats_update_one
     95.94            +2.0       97.98        perf-profile.children.cycles-pp.iterate_dir
     46.93 ± 13%     +49.4       96.30        perf-profile.children.cycles-pp.xfs_readdir
     17.80 ± 17%     +73.6       91.37        perf-profile.children.cycles-pp.xfs_ilock_data_map_shared
      0.00           +85.5       85.46        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00           +86.6       86.64        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00           +89.9       89.90        perf-profile.children.cycles-pp.__time_stats_update
     25.41 ± 11%     -23.9        1.48 ± 11%  perf-profile.self.cycles-pp.up_read
     22.80 ± 14%     -22.1        0.73 ± 19%  perf-profile.self.cycles-pp.down_read_killable
     19.23 ± 14%     -19.0        0.24 ± 28%  perf-profile.self.cycles-pp.atime_needs_update
     17.50 ± 17%     -16.7        0.80 ± 11%  perf-profile.self.cycles-pp.down_read
      4.58 ± 12%      -4.3        0.32 ± 15%  perf-profile.self.cycles-pp.xfs_ifork_zapped
      1.48 ± 20%      -0.7        0.80 ±  6%  perf-profile.self.cycles-pp.xfs_dir2_leaf_getdents
      0.83 ± 12%      -0.4        0.46 ± 22%  perf-profile.self.cycles-pp.xfs_iext_last
      0.66 ±  3%      -0.3        0.33 ±  6%  perf-profile.self.cycles-pp.xfs_readdir
      0.52            -0.3        0.22 ± 20%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.52 ±  4%      -0.3        0.26 ±  6%  perf-profile.self.cycles-pp.__fdget_pos
      0.50 ±  2%      -0.2        0.25 ±  7%  perf-profile.self.cycles-pp.getdents64
      0.48            -0.2        0.24 ±  4%  perf-profile.self.cycles-pp.readdir64_r
      0.29 ±  3%      -0.2        0.14 ±  6%  perf-profile.self.cycles-pp.mutex_lock
      0.29 ±  3%      -0.1        0.14 ±  9%  perf-profile.self.cycles-pp.do_syscall_64
      0.27 ±  5%      -0.1        0.13 ± 11%  perf-profile.self.cycles-pp.mutex_unlock
      0.26 ±  4%      -0.1        0.13 ±  7%  perf-profile.self.cycles-pp.iterate_dir
      0.24 ±  4%      -0.1        0.12 ±  5%  perf-profile.self.cycles-pp.__x64_sys_getdents64
      0.20 ±  3%      -0.1        0.10 ±  7%  perf-profile.self.cycles-pp.xfs_bmap_last_extent
      0.20 ±  2%      -0.1        0.10        perf-profile.self.cycles-pp.__cond_resched
      0.18 ±  4%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.current_time
      0.18 ±  3%      -0.1        0.09 ± 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.16 ±  3%      -0.1        0.08 ± 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.11 ±  3%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.23 ±  5%      -0.1        0.16 ±  3%  perf-profile.self.cycles-pp.xfs_dir2_leaf_readbuf
      0.14 ±  6%      -0.1        0.08 ± 10%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.14 ±  9%      -0.1        0.08 ± 12%  perf-profile.self.cycles-pp.xfs_iunlock
      0.12 ± 10%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.09 ±  5%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.09 ±  6%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.aa_file_perm
      0.13 ±  5%      -0.0        0.08 ±  8%  perf-profile.self.cycles-pp.xfs_ilock
      0.15 ±  4%      -0.0        0.12 ±  6%  perf-profile.self.cycles-pp.xfs_iext_get_extent
      0.00            +0.3        0.31 ±  6%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.5        0.48 ± 10%  perf-profile.self.cycles-pp.mean_and_variance_weighted_update
      0.00            +1.2        1.18 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +1.3        1.31 ±  2%  perf-profile.self.cycles-pp.__time_stats_update
      0.00            +1.5        1.45 ±  6%  perf-profile.self.cycles-pp.time_stats_update_one
      0.00           +85.4       85.45        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
=========================================================================================
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_group/test/testcase/thread_nr:
  gcc-12/performance/bufferedio/1SSD/xfs/x86_64-rhel-8.3/ssd/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/DWOL/fxmark/54

commit: 
  57c9d40720 ("time_stats: Kill TIME_STATS_HAVE_QUANTILES")
  eacb32cc55 ("xfs: present wait time statistics")

57c9d4072054333b eacb32cc553342496b6bcd44127 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3.61 ±  2%      -3.4        0.26 ±  2%  mpstat.cpu.all.usr%
     54.21 ±  2%      +8.8%      59.01        iostat.cpu.system
      3.54 ±  2%     -92.5%       0.27 ±  2%  iostat.cpu.user
      1195 ±  2%      +7.6%       1286 ±  2%  vmstat.io.bo
     72779            -4.0%      69873        vmstat.system.in
     16872 ±  7%     -33.2%      11273 ±  6%  numa-meminfo.node0.Active
     16869 ±  7%     -33.2%      11268 ±  6%  numa-meminfo.node0.Active(anon)
     23914 ±  5%     -27.3%      17388 ±  6%  numa-meminfo.node0.Shmem
      4217 ±  7%     -33.2%       2817 ±  6%  numa-vmstat.node0.nr_active_anon
      5979 ±  5%     -27.3%       4347 ±  6%  numa-vmstat.node0.nr_shmem
      4217 ±  7%     -33.2%       2817 ±  6%  numa-vmstat.node0.nr_zone_active_anon
      3.17 ± 49%    +863.2%      30.50 ± 23%  perf-c2c.DRAM.local
     21.50 ± 18%  +30876.0%       6659        perf-c2c.DRAM.remote
     42.17 ± 15%  +21792.5%       9231 ±  3%  perf-c2c.HITM.local
     17.17 ± 25%  +33079.6%       5695 ±  2%  perf-c2c.HITM.remote
     59.33 ± 13%  +25058.1%      14927 ±  3%  perf-c2c.HITM.total
      1737            +4.5%       1815 ±  2%  perf-stat.i.context-switches
    515.02 ±  5%     +12.9%     581.35 ±  7%  perf-stat.i.cycles-between-cache-misses
      0.26 ±  4%     -10.6%       0.24 ±  8%  perf-stat.overall.MPKI
      4854 ±  5%     +14.1%       5540 ± 10%  perf-stat.overall.cycles-between-cache-misses
      1721            +4.5%       1797 ±  2%  perf-stat.ps.context-switches
      3129            +2.6%       3210        turbostat.Bzy_MHz
      5.84 ±125%     -99.1%       0.05        turbostat.IPC
     55.14 ±  3%     -55.1        0.00        turbostat.PKG_%
     67.67 ±  3%      -9.9%      61.00 ±  2%  turbostat.PkgTmp
    348.45           -18.5%     284.12        turbostat.PkgWatt
     45.75            +2.3%      46.80        turbostat.RAMWatt
      1.47           +27.3%       1.87 ± 14%  fxmark.ssd_xfs_DWOL_54_bufferedio.idle_sec
      0.05           +27.3%       0.07 ± 14%  fxmark.ssd_xfs_DWOL_54_bufferedio.idle_util
     14.54 ±  3%     -11.8%      12.83        fxmark.ssd_xfs_DWOL_54_bufferedio.irq_sec
      0.54 ±  3%     -11.8%       0.47        fxmark.ssd_xfs_DWOL_54_bufferedio.irq_util
    163.32           -97.3%       4.35 ±  4%  fxmark.ssd_xfs_DWOL_54_bufferedio.user_sec
      6.04           -97.3%       0.16 ±  4%  fxmark.ssd_xfs_DWOL_54_bufferedio.user_util
 5.931e+09           -98.1%  1.136e+08 ±  4%  fxmark.ssd_xfs_DWOL_54_bufferedio.works
 1.186e+08           -98.1%    2271986 ±  4%  fxmark.ssd_xfs_DWOL_54_bufferedio.works/sec
     14.28 ± 19%      -6.4        7.91 ± 33%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     14.28 ± 19%      -6.4        7.91 ± 33%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     14.28 ± 19%      -6.4        7.91 ± 33%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     14.28 ± 19%      -6.1        8.15 ± 31%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     14.28 ± 19%      -6.4        7.91 ± 33%  perf-profile.children.cycles-pp.start_secondary
     14.28 ± 19%      -6.1        8.15 ± 31%  perf-profile.children.cycles-pp.cpu_startup_entry
     14.28 ± 19%      -6.1        8.15 ± 31%  perf-profile.children.cycles-pp.do_idle
     14.28 ± 19%      -6.1        8.15 ± 31%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.03 ± 57%    +137.1%       0.08 ± 36%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±141%   +7030.0%       0.12 ± 66%  perf-sched.sch_delay.max.ms.__cond_resched.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
      2.01 ± 75%     -91.5%       0.17 ±215%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     54.01 ± 36%     +56.0%      84.25 ± 21%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     14.51 ± 71%     -61.4%       5.60 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    392.17 ± 81%    +541.9%       2517 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
    470.67 ± 44%     +89.3%     890.83 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    475.56 ± 10%     -37.1%     299.00 ± 22%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ±223%   +2600.0%       0.02 ± 25%  perf-sched.wait_time.avg.ms.__cond_resched.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages
     53.98 ± 36%     +56.0%      84.23 ± 21%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.42 ± 22%     -66.8%       1.13 ± 16%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±147%    +937.5%       0.01 ± 43%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.xfs_ilock
     14.50 ± 71%     -61.4%       5.60 ±  4%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ±215%    +845.9%       0.65 ± 40%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xlog_cil_commit.__xfs_trans_commit.xfs_vn_update_time
      0.00 ±223%   +2600.0%       0.02 ± 25%  perf-sched.wait_time.max.ms.__cond_resched.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages
      0.00 ±147%   +2350.0%       0.03 ± 37%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.xfs_ilock
    475.51 ± 10%     -37.1%     298.99 ± 22%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

