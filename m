Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7A16A380
	for <oe-lkp@lists.linux.dev>; Wed, 29 May 2024 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971503; cv=fail; b=GP9XuILAfimu17MJznEVQ70I/sQLwS1IsyCnv2I5+/Wo9pGZ12Sh5Up/xCSTa9OuZ6YpK891q47tN1fFiR8sr2Zz9JqtYvAauKJ/aQRva/nZRmjlVNKqWjT26nua8vuzmlME2RahQW53A8XNYVDqo0cYEkIjEUSEODVDpbKmzFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971503; c=relaxed/simple;
	bh=wQDgtLm6MHrNMSSx8yHaXNVEspfpV76fkGGn+g6c/IU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uYTnyOWu8d0Lc6p0wmlHPiYR9yaq9PwXBBRRJcjg8O+aTEJXvWRaLb8T6abhkt9rYFHVFMk5KEjfGRoyGLHKSqX/yoRkiSMedHraT89PWigozZxhygWs9XJIgJrQGXA5J5atN0RdVTWIKkcz0l0t8XICSoAqngeAsft4K2FuAwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyl5dAME; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyl5dAME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716971501; x=1748507501;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=wQDgtLm6MHrNMSSx8yHaXNVEspfpV76fkGGn+g6c/IU=;
  b=fyl5dAMEtioMQJ+SnckxA8CLInCoo9i9K6/w5ziXTCZbLCb7BM3V/09Q
   CisHbbJu4TiXQNGKnWRFVovks5IXLYUWW5ssGZMBJduHWIVJU18B1m2PA
   AL5gBIzAd0yfpCpM36w7zRNbzdqkB+hJ8WFLZi89aM83JhjyPLXITSVzf
   WDMps1avpbiB9L+QyNrW0M9jdmF2tJxt2rn+f+3RqwUOaNeTr7ny6OmOZ
   fTtw5suo3m/7hvI1Rj41jkpF1BAGMOP5ce0JAP0LCvjQhjc/PyRLUZywh
   9ZaiOUrNFFrr0yXuYVofbPOHFCmJ3+g5TisJc2WtjYZTbsY8c7KCagZWz
   w==;
X-CSE-ConnectionGUID: LodmsoYMTSajG/9G1wkUug==
X-CSE-MsgGUID: A8Ypwh21RfmY8NCxUrLhMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38747327"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="38747327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 01:31:41 -0700
X-CSE-ConnectionGUID: vNOa77FeQrifm5iTUCXJhg==
X-CSE-MsgGUID: sjm46cqURDWm2yOvniwRGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35335902"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 May 2024 01:31:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:31:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:31:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 01:31:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 01:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5Bjdwnmq2+w8fgq2ugjWoD987JJKMkCgJpXaZqnhsycZsL0BqiHpnFHqSBBf7uInDHDyQKySqffSiff6WSFuUuSdtbB6xul0YjIKcISBHS2x2bzBzxTFYG7vK2sGQGdN8S6eWNB5aU6EL0ytrdHeo7bt3avEvzOVz7+AijvwVxDcLrD3ayywqqbd10jj2ATjo9uJMFxA8Pt3Q69xCRy0y3Y8afYHMhrGL8q3dtq4trAasPZFxJ4EvXTcS4D/jlU5FNGGjdlr6TK7UhoOIP5x3r2XyElMX8Q/kz0YZgWGem87XjieN1Td5sOPkhX9ooHqBRy/Qm7myb+hHYec/AHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9cwiLP2OZFNJdfVzQuXeBcwi5ahl/hc9zxBLrOF3U4=;
 b=LbjDsnLkB+OM+F6XXrwA0syWoRY14z7CWmRPSmf+HBH+6BELg/e2nHAYjTgpMAZXnb0L1dikglV1lIb0RkvffFCXo8ePeyvv8ZiewJrRYIColyF34SbaCHeazp0cmqdJLdBjSCogEuv1ImALJ/Wy0fRo7JVvqdTZxlYWcptzRpAl0zbjE2VW3/AjkWrjiDLlsuBo4r8jqfO+o+6rCRad4qTdV65NCDWJXWCtPdU+cb/O1VOXHVMleNlVko4lcQth8jJIFOKv648Yq8ikErNsEtyt8aF5I6E4x2z/fMDrReqg3ElGC8zExlwGbz1FX0mGuSY3UrGM9Cy2RZNnTUIp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 08:31:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.025; Wed, 29 May 2024
 08:31:36 +0000
Date: Wed, 29 May 2024 16:31:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [sched]  ca7d96bf43:
 stress-ng.sem-sysv.ops_per_sec 83.4% improvement
Message-ID: <202405291640.2385e260-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:820::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: abbdb145-cc6c-4056-a104-08dc7fb9c112
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|921011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?w0BrrKYD+LesFbtyHy7l2pFODcoBpg31vJSHn8usbfP6x/36uJn7TOejSd?=
 =?iso-8859-1?Q?hJm3txa9n3MJw76CPCcDXjluxuAJ1bOVF0boInuOpAk1V4UCIP+QSPFEpK?=
 =?iso-8859-1?Q?UoOXQRNpc0nUsA62Mg3DsGQS5gdavn508gegTwNihmIbOso2b+xtOpeCZr?=
 =?iso-8859-1?Q?odthQtLqX7vCtVWWPpEoGRcn3PclO8d7TxtBUwe+ztF95ovGvRTzhyOLNW?=
 =?iso-8859-1?Q?Dbt1r5QHmSaNqFy1fvLXwtDF/FOeuGuHcEWVveRCzHt2LsD6ntZI0FSTQP?=
 =?iso-8859-1?Q?96oBzPoa3x7/dKQ1B8rsZ87d7IAkWpMvdzZC0BUqqq1WSTLPX204vePdKl?=
 =?iso-8859-1?Q?XDIdWMAf7o8PhRvN1haYnFWzcNTOcqsaCwDJ7KncByQKJImgxdk/NuW/XT?=
 =?iso-8859-1?Q?/dog3trnXzIiu70PnQ+yAo3nCXjsKHZKtiAZb/7idCY6yR4kN4VU8xYjl2?=
 =?iso-8859-1?Q?TDM2WImnEMP5pMDfhWCxWrR8aqcrmRoqK0V0vQEaMwE3lTs1vqAL0YVSYa?=
 =?iso-8859-1?Q?QZ9OoC2/skgarct/6Mi9tjK7A/tLJYjujqUbrx8broync4v9dDrvnHW3LG?=
 =?iso-8859-1?Q?8Q898xaPbcdJsYUwHTbsu4eTsjoTQklTZMbXgnpAiJh847b5FBDyT1G178?=
 =?iso-8859-1?Q?i7avnxBPETtEiG8bHp1RXBduHXnQWYMnZqlBVEbGW+aVicObPUViZuFfYy?=
 =?iso-8859-1?Q?HsRdI748Em66Rs03oxzigcqxtnCi+R5Bgd+qVAYKEUYMo5oyXujuSKB8Nc?=
 =?iso-8859-1?Q?iLZELWLu8w/rRj+F/eG9jktLe42AoMdmivCOT559jNQVJxcvhzK+aRc4Q2?=
 =?iso-8859-1?Q?N43YfvvaO7U0ujRs6IvsCxqDs7uGNvwZK3uqDsxAg2JegmhPnFzgzKi5n9?=
 =?iso-8859-1?Q?b7S/7+4OQFHN9Us5dGGP0RVXWCsk5X3n8OsA4kvj5WSmAUe8rMAhQ1DNtU?=
 =?iso-8859-1?Q?LGy7MhPOxBblJ+z8XeEF6MJBPuPcN/K2dlXWgxb1Qo1EXsAqWrATGn0rxl?=
 =?iso-8859-1?Q?DVDKNFljIT6vzI93s3kucCyCcsQ1KLdSOZ+JwL0mzBaqQZTPH7bmbbf+HO?=
 =?iso-8859-1?Q?aUpDxqXo1byvBmSeUpg6VeT0/mqmsDDagGrEaDiLv6m+MaGQ3XGToWlk+e?=
 =?iso-8859-1?Q?054bJAgV1OJgmnxhqeWVTlxFc1sZmA5BB9JpwfzTgX3bEyt7l/OcnvA2Pf?=
 =?iso-8859-1?Q?pZ//NToecDtBPefzkLifjKjdERy2uI074XFPLJcxHChiP41eJJ8rb5BqNI?=
 =?iso-8859-1?Q?t1a2iv2iohltvq4eH7u8LxoichEzPJOY/TRsh/5dLa8O62nvL0i8xSGf8o?=
 =?iso-8859-1?Q?bWVaLMNk8RxwryrxXx0vsvu9qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PVOjfVgY+O7eOGlYhZHyK+1rmN0i4ZDb2EbbIs5dp52w4n1Qm/Kg1Q+8iJ?=
 =?iso-8859-1?Q?M0g7LMkmU5x278gVNHXsp1K482AGavEPrIFZLvsUkbD9g3m+cwXNGluts8?=
 =?iso-8859-1?Q?ynBO0uQqQwq6zwMg2uS2RB/StHYlSLojf/Jd0CnQpGtsvErOOt00mc2W1q?=
 =?iso-8859-1?Q?2cmYTiyd3aeOVWVHtvOGvdpsg7j1hSgQD6zc3yh6ttUczkDF/7gkosw2Fz?=
 =?iso-8859-1?Q?m5r3TiL1+6j5y52D6xRePyJmDzMB9XJ2Q1Q7cZp8/ZYXZPYtvjDfu6vW3P?=
 =?iso-8859-1?Q?0qIWInEYLsHkMS9F21r3ahzvkcccr3veR5RrWnseziheBi0Ws8+gMs1ZWf?=
 =?iso-8859-1?Q?Z88gFH+EcV9Wqpiqzam7T/9BFbhq+0A7uCnF5D/kxDDAJP1FX5YRPRufra?=
 =?iso-8859-1?Q?XVtjPOaFtd8HGOPQU+Z8OHVtn5li48e2tCYyFwylOfAGnBGnrTGyzWFz8u?=
 =?iso-8859-1?Q?XrM//B1PTZL3QPJ6U5uMXCESIrf8/gZhMllhNo29vuO3XEHgSxLsR5vvP7?=
 =?iso-8859-1?Q?5UO92MdUb+wv+fiS+n4WO0N4miLxwYaLDoKaTMEyb2rfv15XFZF7zY0Qlg?=
 =?iso-8859-1?Q?XKmbQVlhMuax8AsfbE97t2qKqaCwPIPPMJn/Mv0yuQwmH9Toa/8xec0LBA?=
 =?iso-8859-1?Q?ykDaBgSTLW1OTdZF5r/3sE3UABe7wpcEvLzdUK+QjzPgBhLFPHAkAJsX+b?=
 =?iso-8859-1?Q?hcZnWLsmy2N4C2LxqOd54vih4HaSxAVf/wk+d/ueyX88aDMj2x7ZZ7Gz91?=
 =?iso-8859-1?Q?q0YYSGAFSUn6YJnW/+Y5YU6DPssVxBPSWcqlATZL7gDkJxM/c2I26nkqGW?=
 =?iso-8859-1?Q?43DoFUaXrQ44zF2cV/z6CNFDkgCvc+GgvrmEzehuJNViO4RLyz4Wd+WBAw?=
 =?iso-8859-1?Q?E52wqTxDv5C86g3okH/JW0/d5E/xh5ZXfo2MueV1sFBC5Oby0uaQxDPP8Q?=
 =?iso-8859-1?Q?h6lY/rs8CGbkhBQj9jEN0FJOKEQlFT/bVvv3tiklozMz6FmVEo0fGZbcmw?=
 =?iso-8859-1?Q?uqSS162Hn3xA3juUVrck/zqWZs/tdlkBW6jQ8Si0FAywygqC1vZ9/3uorM?=
 =?iso-8859-1?Q?NVGQw56EZecqJiCdriX9fdjyuFXThvPNJbv/gMSXooF/0fyoFrxi65YDE+?=
 =?iso-8859-1?Q?vwGwogfV5FvPqS+3AAHQzb/c/nyHObS/1fiMDCqvE0SKZzLTSzAaGqC76A?=
 =?iso-8859-1?Q?xTtAzj+/oAPSPOCcU4RDp+TrUNv8DsDyTCasoI/UFuNVsqJT5tAw2uwo04?=
 =?iso-8859-1?Q?sY5yiCZ4hQ4tECJICx2OcSxnFGQ/ug2BG8al214q4fXwKVx0OBEofGXoU2?=
 =?iso-8859-1?Q?u3rVHFNIHbd2/ZRY99+Fdkl9zhTZhLZ+1onwfkZD5EUcsprG82NvQWYg+K?=
 =?iso-8859-1?Q?WHaAGj43aAAgWMiWt39b+djTmeujtXAl7ReCqe3Mi0ZWOt1B5cQfEYGQjQ?=
 =?iso-8859-1?Q?axgNKkxaYfxf6IpObyYmzyGTY4UwrpYJb6GptAjhAN9wv2Trmp6PFx6ESZ?=
 =?iso-8859-1?Q?4EXt9F90W5j05J2/B/hEWW9g1q+Lp5qoTKSik4766gqzamk9C18UDxPdNs?=
 =?iso-8859-1?Q?/VPO11Ahw2u6saNynUzXn56sjGLlBmBBv2sXlkyxmw/xcwU4gVzoqKaY3H?=
 =?iso-8859-1?Q?OthdphSHcx/uP4/U2FrTXTMdofDMCpGswDjkfLHNi5I50P+MxQVx2Imw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abbdb145-cc6c-4056-a104-08dc7fb9c112
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 08:31:36.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cd2mFDrdQlrHMxEz2a6dreMpWI+a1O1anYv4lHThFEm7h/dVpJwVXSj4hh6fRrYQ5qdzACQ47wNAG7CqEWoW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 83.4% improvement of stress-ng.sem-sysv.ops_per_sec on:


commit: ca7d96bf433b0e21401219449c24dca631d6f146 ("sched: adaptive default skew_tick value")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: stress-ng
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sem-sysv
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240529/202405291640.2385e260-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sem-sysv/stress-ng/60s

commit: 
  e9e86dfba8 ("ipc/msg: increase defaults for shmmall, shmmax, msgmax and msgmnb")
  ca7d96bf43 ("sched: adaptive default skew_tick value")

e9e86dfba8ec72dd ca7d96bf433b0e21401219449c2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1696853 ±  2%     +64.4%    2789146        cpuidle..usage
     16002 ± 89%   +2748.2%     455781 ±131%  numa-meminfo.node0.Mapped
      4003 ± 89%   +2744.8%     113880 ±131%  numa-vmstat.node0.nr_mapped
     26742            -4.2%      25614        proc-vmstat.numa_pte_updates
      0.07 ± 14%      -0.0        0.04        mpstat.cpu.all.irq%
      0.00 ± 24%      -0.0        0.00 ± 41%  mpstat.cpu.all.soft%
     15567 ± 12%     +78.9%      27845        vmstat.system.cs
     29128 ± 13%     +45.2%      42297 ±  2%  vmstat.system.in
      4040           -16.7%       3367        perf-c2c.DRAM.remote
    454.83 ±  7%    +153.0%       1150 ±  7%  perf-c2c.HITM.local
    947.67           +93.2%       1830 ±  2%  perf-c2c.HITM.remote
      1402 ±  2%    +112.6%       2981 ±  2%  perf-c2c.HITM.total
      0.00 ±106%    +721.3%       0.00 ± 11%  sched_debug.cpu.next_balance.stddev
    708.20 ± 13%     +72.3%       1220 ± 12%  sched_debug.cpu.nr_switches.avg
      5112 ± 20%     +33.2%       6810 ± 16%  sched_debug.cpu.nr_switches.max
    724.57 ± 13%     +56.8%       1136 ± 16%  sched_debug.cpu.nr_switches.stddev
    439717           +83.4%     806333        stress-ng.sem-sysv.ops
      7328           +83.4%      13438        stress-ng.sem-sysv.ops_per_sec
     11.50 ±  4%     +23.2%      14.17 ±  2%  stress-ng.time.percent_of_cpu_this_job_got
    442120           +82.9%     808592        stress-ng.time.voluntary_context_switches
 6.251e+08 ± 13%      +9.4%  6.839e+08        perf-stat.i.branch-instructions
     15876 ± 12%     +83.9%      29203        perf-stat.i.context-switches
    154.95 ±  6%     +14.4%     177.29 ±  7%  perf-stat.i.cycles-between-cache-misses
 3.066e+09 ± 13%      +9.4%  3.356e+09        perf-stat.i.instructions
      0.64 ±  2%      +3.6%       0.66        perf-stat.i.ipc
      1.17            -4.4%       1.11        perf-stat.overall.cpi
      0.86            +4.5%       0.90        perf-stat.overall.ipc
 6.131e+08 ± 12%      +9.2%  6.698e+08        perf-stat.ps.branch-instructions
     15612 ± 12%     +82.0%      28407        perf-stat.ps.context-switches
 3.007e+09 ± 13%      +9.3%  3.287e+09        perf-stat.ps.instructions
      2.58 ±  7%      -0.3        2.26 ±  5%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.74 ±  6%      -0.3        2.43 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.21 ± 10%      -0.2        0.97 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.19 ± 10%      -0.2        0.96 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.88 ±  5%      -0.1        0.78 ±  6%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.98 ±  7%      +0.1        1.10 ±  6%  perf-profile.calltrace.cycles-pp.update_blocked_averages._nohz_idle_balance.do_idle.cpu_startup_entry.start_secondary
      5.74 ±  3%      +0.5        6.22 ±  3%  perf-profile.calltrace.cycles-pp.schedule.schedule_hrtimeout_range_clock.__do_semtimedop.do_semtimedop.__x64_sys_semtimedop
      5.66 ±  3%      +0.5        6.14 ±  3%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.__do_semtimedop.do_semtimedop
      3.58 ±  8%      -0.7        2.88 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.87 ±  8%      -0.7        3.21 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.63 ± 14%      -0.5        1.16 ±  6%  perf-profile.children.cycles-pp.__do_softirq
      1.66 ± 14%      -0.5        1.20 ±  6%  perf-profile.children.cycles-pp.irq_exit_rcu
      3.04 ±  3%      -0.3        2.72 ±  4%  perf-profile.children.cycles-pp._nohz_idle_balance
      1.55 ±  6%      -0.3        1.29 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.57 ±  6%      -0.3        1.31 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.36 ±  3%      -0.2        2.16 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock
      0.23 ± 21%      -0.2        0.04 ±100%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.61 ±  7%      -0.2        0.42 ± 11%  perf-profile.children.cycles-pp.rebalance_domains
      1.06 ±  8%      -0.2        0.88 ±  3%  perf-profile.children.cycles-pp.tick_sched_timer
      1.25 ±  8%      -0.2        1.06 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.75 ±  5%      -0.1        0.68 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.13 ± 13%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.wait4
      0.18 ± 16%      +0.1        0.24 ± 12%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.25 ± 25%      +0.1        0.34 ±  7%  perf-profile.children.cycles-pp.account_idle_ticks
      7.59 ±  3%      +0.5        8.07 ±  2%  perf-profile.children.cycles-pp.schedule
      0.18 ± 18%      +0.1        0.24 ± 11%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.24 ± 25%      +0.1        0.33 ±  6%  perf-profile.self.cycles-pp.account_idle_ticks




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

