Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C31553B7
	for <oe-lkp@lists.linux.dev>; Wed, 15 May 2024 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783799; cv=fail; b=c2SpnynbFZKMJjFWSxvKZCTUxNKUqifb2hJrO+pYphNdRkuOF8VGimxGshDoKX3FKYnZTkYgxubjuZxHNZyyE6EvalIKdstaga7EbjoshKbh06BqhCv8E0EEFio/3RBq6XjTC81db5R9ZQWa7EghNS0zj2/32id+gxYz3fBciTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783799; c=relaxed/simple;
	bh=jxtUgawjDl8JOV9jQyRFFdYLg+WoSME7900dLwl9CcQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VlDgVXpVgjemhxhyGap6jZecwrCnLV/T7syrY4Vj5LDhipCQgVLcnuaQC7RJuEBXzDmo40eT0M5SDnz9cjYB3a0xZ0X5JidDZxI3hAA1SrMYjsX0FEwW/tn2JPVhTaJ0m2YI3CnPtyerI0hyR6G9i2ARm8s87OPP4pMEv2lsCKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMN/1BM3; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMN/1BM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715783796; x=1747319796;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=jxtUgawjDl8JOV9jQyRFFdYLg+WoSME7900dLwl9CcQ=;
  b=jMN/1BM325nLoiHsYND/r25fjCV5borzOfzuCfTUk19km/gWlByidHWh
   QwigBhcoHBcjx5kPiB2f8bQyutPMsVuEuWCnXnaZLqr7ai56gD+CsESVu
   sFub5tAwuFRPIyfkHdS7HlqempyUtmbmQRH8pq9/YIVwUc0zYbQClLEN9
   F3P4OhBZ1jDLS5boxehH03NGazhmESkPFNSkqnjBn9kVfuYwB4WP3B3/Y
   H3+sL/WbpIHtIB5QsdHNvoKpcyEUr62xG1G4V0zgBiROhRvnE/FkHsSOX
   DS1S+tvfwBfhhy5IpWOq9h3ZyMOkh0qKYRTlxmeeGMDYTPOrK1SnHoWf4
   g==;
X-CSE-ConnectionGUID: BudLvBzeRQiKT5/JCzfDNw==
X-CSE-MsgGUID: r7pJNA0DSnus6posP/3Edg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37216940"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="37216940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 07:36:35 -0700
X-CSE-ConnectionGUID: 0g834L+QQL+h8DLFZWrWPQ==
X-CSE-MsgGUID: S5CrXzIGQ5ao+eUzAJtmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31664140"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 May 2024 07:36:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 07:36:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 07:36:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 07:36:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vptq3yaxRsf+S+h/xpKDK4paCeZ2/bF2vrRdq6DEZZn4p48J8OBCG8TCja76rUhWzs3x6ys2ea035knqP3xLtYWKoLwCia+qrarIvQkWYgyW4EZpGXtogb2K3wRDyCwLZYAkkBoxECCFZ/WVUnrxQdAJmy+hEUFOe4abN+kv3pqEvLf91KefjsRl9zv7X1+lBpIYOgvneYG5QGekxoPA0nfv7sAQm8uORo9K+N3qo0KJY2QGPncyMU2huuPw27ebznmiT0rND3HEjAI8Ca5UFIIF1H2GVIsGcJwavIsZIV9NAnu0ZO5kUcnpDnxTWMURMx/2Ooibek7KBBi+TZJBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjqvMjM8mJPaxAWb28dU/O4GkOLbe8oqPbAj5jNuMUg=;
 b=cMWwG/IIqGxjAnXJvOqXjT5Ll7oCtOlBmo8XlHlqXfdG0+Jy9kMzdery7no+iCb+kGZqW1I13MkxXN+QJV2wpobItTPeH1DtX4YQFGyl8E8vjuqUy3JJl9Zr3D+y+5qR0yu+oaXsZE0gliyzrUS5cQ7bdNUeUVKA47ntrOSGTRTXwWIyCMByFPVQzVPldVfClsgG9AEYDMf8n/S/J0ouLQx6sTDzZWMK3DyoGrMj6MVqm50IT3juJjTdytHzGyGmG8VS7Ezg2SWK0WeazhctP+4qUoq5rtUkLvQd2ZG9dejAXcGK+spdSD9W6cpq5tqnHk6B21tw3RJlB4F6wW+rPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7795.namprd11.prod.outlook.com (2603:10b6:610:120::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 15 May
 2024 14:36:25 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 14:36:24 +0000
Date: Wed, 15 May 2024 22:36:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [sched/fair]  3a2d8d42ad:
 stress-ng.epoll.ops_per_sec 4.2% improvement
Message-ID: <202405151605.d7fbf241-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b9c2d9-eaa7-4c18-1d75-08dc74ec6577
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|921011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ONndUCcp36VfojhBZ5oydsMmn7K7OPizDMeCGuFfXO6PaaBN2Aezn/wwt1?=
 =?iso-8859-1?Q?HF5LHb+8dfKMjeRD4vuoDz0TRlNHN7IWE1rAHmER39A2aqZkW5OsG6yt1N?=
 =?iso-8859-1?Q?fgEj6IYRcq367EGIYP/SSYWHAqhKG0WZzH1LKX7wuaqySi7kZuu8EYfLk8?=
 =?iso-8859-1?Q?3FoDF8QA6lnSAVG8boQ1U05khKF9BUOHRoOgLlSOxKvS3UjOGsSOn25qt2?=
 =?iso-8859-1?Q?z42dPkrKrXUa6fVFBKeQKS2fCud/nYWwPDL7n5mQxIUz/dlPFBhx38lDYQ?=
 =?iso-8859-1?Q?wkLR0pwMh4A4QsuS+KmDdxX7SDwLRK7qYMTshvq9MmVEdw7FpHEHdK1Qv6?=
 =?iso-8859-1?Q?vSwk47C8MdST2H1k6hL4p1pKDZAut+UIYt++BU0GtUcibpuLq5IJIU3Udj?=
 =?iso-8859-1?Q?bHBYdS5VcqRrXoJnjCj6mcjWXDbfohXBQRyKy3/Bvxk2dwDslyzOkuHsqk?=
 =?iso-8859-1?Q?mH7njU/a4xlIUwNVB1nOrqIvjXUVqc3f48bA9+feoK2Bo5r8Nn+RO6siOW?=
 =?iso-8859-1?Q?mzuD4BopoOyYlzvBEr/jGNxmH1Y9rh2+gAyVE+FgKAKSz52HKF1Zn2k5Rl?=
 =?iso-8859-1?Q?yw+kzrmcX7hxKRpwIx1jMHCWM9d1i5QkGbWek9PAWkz+IWp1cdjThy0wWg?=
 =?iso-8859-1?Q?AtqQMuIu6wfZ285/5SIM3388+e47cfApqVf9VQ4l5C3BqiO6+60iQlQgrL?=
 =?iso-8859-1?Q?4vz7czwAR18jhGf62E6ir0wNeCmiBUH+T2k32TYmUp/wNj11O9RWLQEfm5?=
 =?iso-8859-1?Q?2662PFPU263/wO1HsYflQimsUYgyx3bGZ+7UNwR0H4nqXk833rLBPMYrfG?=
 =?iso-8859-1?Q?KE16G7Q5//CYLDvo9K/8IlQmpKLegbkkYblpTdtqBTl2mSPpTXQBZvrHq0?=
 =?iso-8859-1?Q?R6tJptdj/bbGcZS3CcLqJ66bS7F5jd+tXQJEOmfEtoV5HQrNs8OR5tkLqn?=
 =?iso-8859-1?Q?N5gwf5wvnWnZ0L9VPDxhivjJUru6IK9Xv3HnK+8NipS2WRpr1QAON7Rzph?=
 =?iso-8859-1?Q?od+erNGfvIDFxUaCHNHOdUmSL80qPUtc5HrQfr0Xnhmg5xGS6nkruq8AdG?=
 =?iso-8859-1?Q?E160z0eRMhsCIZrHBsvjwIEotchKLOH1I4RI383TTtO9nWjioiCYmIeYYZ?=
 =?iso-8859-1?Q?GLvw9oNad/W2ryIsCiBYorWQJ80EJiqPIR08N0in16wc+TZhnlI2wF+zKA?=
 =?iso-8859-1?Q?Z/+fSc4wBBq7orVyhX1YEjwg8VamP5wn/XGAVeDuQlsKGGWUuXhYu/H8jW?=
 =?iso-8859-1?Q?GORweYkZLUHVRoe4jlO5kWl+X6+6U3yPgJGHc4T2CuDPRFPaBlbmRjbExZ?=
 =?iso-8859-1?Q?TstJPveqlvuo/ep4TGTovesPWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SCNzr+40Fbq0is+GXujqT2JROjgyv30AgItzqv/KKqmbaoUrIv7NAcNt+/?=
 =?iso-8859-1?Q?akK/hrx2MHIj9E3B24XPFgObTkNyAnIvtRSwmr32Yp6udogYZWl11jBIgV?=
 =?iso-8859-1?Q?+PdweNXyRXxbnDpRqD5p/98ofw4Z2xJNkW4OkAJDYWfaY6/6v3OnwtGCVv?=
 =?iso-8859-1?Q?D4rrRCEj4fOhJF6fEs8LwjY/EnYrHQQ/ZLp7El/cGAXqtLjpO11o9BBsA4?=
 =?iso-8859-1?Q?TcNLrX1i35Re3UmqJjou5eH7ZUBtx1Zh53fCW9r2EJ7/QnftX2a4LrPXJf?=
 =?iso-8859-1?Q?W0VUHv8W/6w3nciH8plB80z31TSIBL1KAmcHGjJyHGA/DdcIzqFE8WXzti?=
 =?iso-8859-1?Q?VaiIGMskdenDnhT93RbuQvafaO7P0Ntd4/yFhpsm+ePBkTpnPgS8nnB/md?=
 =?iso-8859-1?Q?jK71IeWHjNJ4TNHqdsJf92d8AJlR+omZBHp8De4QyGHWDr6xKGXqequljx?=
 =?iso-8859-1?Q?39FNQzsYSQZ+Pm8PiXXrj57v0XLBzbt8+6pJMQviZrCzC0h+P6B0EuO6yJ?=
 =?iso-8859-1?Q?Dy+parKpyP5TJ7KIiUPA+GVkbJpNULSTKczl0V7K8orIf/FkrA6/eRpR2/?=
 =?iso-8859-1?Q?TxyzDfTCDcsS/Vm8Onu0w5yFq2GICVLQpkOKTHKv5MINCarLcmtKtS4tjR?=
 =?iso-8859-1?Q?j4rA+RBZHYUuVQIImil95YErr5pYE4ITd1pRDthGEEmbfOoiyRrwwQwSHU?=
 =?iso-8859-1?Q?lVsLGM9xbZa9bOlk1aNp5YyXjYDhQ4d/UOKdcd8oQV47EK2lw/u8af9LpX?=
 =?iso-8859-1?Q?qtZe10T5sprU2Jxww5P1eEU55UL9xRbkHS/D40meN2MvsyTx7HWh58XZP5?=
 =?iso-8859-1?Q?gJoEsDjUjXJAcFx166poKOO8QNPlkhqIlniEG1gSEdDhnQViWSgV6BBtnb?=
 =?iso-8859-1?Q?UmrkHFPG8ScicE4COkxKl5q6fNRmpow4ZAxNyEf3mEElS6NdyiwlvLhlHy?=
 =?iso-8859-1?Q?vr5UnBcvo+1Zx/I58+2qpBdttvz8xdTk3u4iOOjAWEbMQkL/gOM9Wd+lAL?=
 =?iso-8859-1?Q?XKpG1Ohixd4R5HTTLdwU4UO8BM9URcuT/wBV4zU3rsmah3O5mqw2+/gVWO?=
 =?iso-8859-1?Q?USN915Vo4GIF+61SuodqI8LlTpuCtTSHOt9nSNEFNbyLXAayB3VjscVcXc?=
 =?iso-8859-1?Q?iqjCVlCqWcVhWlyEakLuVfUslKPy2DozYAVsS/haJE3jcJWLGH/90pcTku?=
 =?iso-8859-1?Q?VQqlkB5m2Xlx3BB0A7ssmdsqQ3m+sg82Z62atzA8yoIWScOEERonFbtj4u?=
 =?iso-8859-1?Q?9jmEOLO9B4J+y0u1+1ztVQJhB240a8RMbNw0HaZ3kQls7PccGfjLeBGNqs?=
 =?iso-8859-1?Q?MqFPGhvL059/w6gqFFXWXwSbryKpddLgwo+alqsNO80YJZVs5AZGLrlDto?=
 =?iso-8859-1?Q?HxLB7gY9hsm9CxuOIRnWeZN58zga34TNEY5pUiNl34+0upmuRmmc6IXrf/?=
 =?iso-8859-1?Q?TmKigDK3TkU+bvEQsSM2wAC00f1TGAzJjTH7OdpTIzwQP2niPXSRNx6cQh?=
 =?iso-8859-1?Q?AxZYmH7JHUVA6qaN7+EM9bVpOYExkcEcTEZuIL2Wrkg8MCGfX5sb92HP8v?=
 =?iso-8859-1?Q?E29MS8MYHlGEMg3x02ohN1y64QcHP/bg6vQSxSicNoA41QQsQ5ARmqWsRq?=
 =?iso-8859-1?Q?YtXQCQjHYbGHaloEuh1lGMsTEuWwQtwheK/yqqzm4F5N1J8jWqXTb4fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b9c2d9-eaa7-4c18-1d75-08dc74ec6577
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 14:36:24.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62pPH2jFgPWZSiplS9nSJbvZYdfGpnpa+26J9UV5XYY2YG0EPfiWWbrfo+CgEBuGxlpfy2bYEssS46SE0ZVw0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7795
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.2% improvement of stress-ng.epoll.ops_per_sec on:


commit: 3a2d8d42adb98706e9fe140e9c1ebfc4ba90bad0 ("sched/fair: Scan cluster before scanning LLC in wake-up path")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: stress-ng
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: epoll
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240515/202405151605.d7fbf241-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/epoll/stress-ng/60s

commit: 
  6fb4bc3509 ("sched: Add cpus_share_resources API")
  3a2d8d42ad ("sched/fair: Scan cluster before scanning LLC in wake-up path")

6fb4bc3509b0d89c 3a2d8d42adb98706e9fe140e9c1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    213326 ±  3%      +7.5%     229305 ±  3%  numa-meminfo.node3.SUnreclaim
      2924 ± 10%     +18.4%       3463 ±  7%  perf-c2c.DRAM.local
  60869589            +4.2%   63409443        stress-ng.epoll.ops
   1014157            +4.2%    1056467        stress-ng.epoll.ops_per_sec
 2.157e+08            +5.3%   2.27e+08        perf-stat.i.cache-misses
 4.776e+08            +4.2%  4.975e+08        perf-stat.i.cache-references
      3366            -4.5%       3215        perf-stat.i.cycles-between-cache-misses
      7.04           -11.0%       6.27 ± 33%  perf-stat.overall.cpi
      3396           -14.5%       2904 ± 33%  perf-stat.overall.cycles-between-cache-misses
     65775            +1.7%      66871        proc-vmstat.nr_slab_reclaimable
    237226            +3.8%     246162        proc-vmstat.nr_slab_unreclaimable
  67492491            +4.0%   70180175        proc-vmstat.numa_hit
  67093858            +4.0%   69780459        proc-vmstat.numa_local
  89776477            +3.6%   92975869        proc-vmstat.pgalloc_normal
  88484264            +3.6%   91626258        proc-vmstat.pgfree
     45.54            -0.3       45.29        perf-profile.calltrace.cycles-pp.__x64_sys_timer_delete.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_delete
     45.56            -0.3       45.31        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_delete
     45.47            -0.3       45.22        perf-profile.calltrace.cycles-pp.posix_timer_unhash_and_free.__x64_sys_timer_delete.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_delete
     45.56            -0.3       45.30        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_delete
     45.59            -0.3       45.33        perf-profile.calltrace.cycles-pp.timer_delete
     45.28            -0.2       45.03        perf-profile.calltrace.cycles-pp._raw_spin_lock.posix_timer_unhash_and_free.__x64_sys_timer_delete.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.20            -0.2       44.96        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.posix_timer_unhash_and_free.__x64_sys_timer_delete.do_syscall_64
     45.61            -0.2       45.40        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
     45.64            -0.2       45.44        perf-profile.calltrace.cycles-pp.timer_create
     45.29            -0.2       45.08        perf-profile.calltrace.cycles-pp._raw_spin_lock.do_timer_create.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.59            -0.2       45.39        perf-profile.calltrace.cycles-pp.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
     45.61            -0.2       45.41        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_create
     45.58            -0.2       45.37        perf-profile.calltrace.cycles-pp.do_timer_create.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      0.86            +0.0        0.88        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.connect
      0.82            +0.0        0.84        perf-profile.calltrace.cycles-pp.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe.connect
      0.76            +0.0        0.78        perf-profile.calltrace.cycles-pp.unix_stream_connect.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.82            +0.0        0.84        perf-profile.calltrace.cycles-pp.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe.connect
      0.67            +0.0        0.71 ±  2%  perf-profile.calltrace.cycles-pp.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.57 ±  2%      +0.1        0.62 ±  2%  perf-profile.calltrace.cycles-pp.kfree_skb_reason.unix_release_sock.unix_release.__sock_release.sock_close
      0.94 ±  2%      +0.1        1.00 ±  2%  perf-profile.calltrace.cycles-pp.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      0.94 ±  2%      +0.1        1.00 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      0.95 ±  2%      +0.1        1.01 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__socket
      0.95 ±  2%      +0.1        1.01 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      0.97 ±  2%      +0.1        1.04 ±  2%  perf-profile.calltrace.cycles-pp.__socket
      0.88 ±  2%      +0.1        0.95 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe.accept
      0.84 ±  3%      +0.1        0.92 ±  3%  perf-profile.calltrace.cycles-pp.do_accept.__sys_accept4.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.87 ±  2%      +0.1        0.95 ±  3%  perf-profile.calltrace.cycles-pp.__sys_accept4.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe.accept
      0.94 ±  2%      +0.1        1.02 ±  3%  perf-profile.calltrace.cycles-pp.accept
      0.92 ±  2%      +0.1        1.00 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.accept
      0.93 ±  2%      +0.1        1.01 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.accept
      1.37            +0.1        1.48        perf-profile.calltrace.cycles-pp.unix_release_sock.unix_release.__sock_release.sock_close.__fput
      1.40            +0.1        1.52        perf-profile.calltrace.cycles-pp.__sock_release.sock_close.__fput.__x64_sys_close.do_syscall_64
      1.38            +0.1        1.49        perf-profile.calltrace.cycles-pp.unix_release.__sock_release.sock_close.__fput.__x64_sys_close
      1.40            +0.1        1.52        perf-profile.calltrace.cycles-pp.sock_close.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.10 ±  2%      +0.2        2.27 ±  2%  perf-profile.calltrace.cycles-pp.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      2.21 ±  2%      +0.2        2.39 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      2.20 ±  2%      +0.2        2.38 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      2.25 ±  2%      +0.2        2.43 ±  2%  perf-profile.calltrace.cycles-pp.__close
      2.18 ±  2%      +0.2        2.36 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
     90.45            -0.4       90.00        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     91.14            -0.4       90.70        perf-profile.children.cycles-pp._raw_spin_lock
     45.47            -0.3       45.22        perf-profile.children.cycles-pp.posix_timer_unhash_and_free
     45.54            -0.2       45.29        perf-profile.children.cycles-pp.__x64_sys_timer_delete
     45.59            -0.2       45.34        perf-profile.children.cycles-pp.timer_delete
     45.65            -0.2       45.44        perf-profile.children.cycles-pp.timer_create
     45.59            -0.2       45.39        perf-profile.children.cycles-pp.__x64_sys_timer_create
     45.58            -0.2       45.37        perf-profile.children.cycles-pp.do_timer_create
      0.10            +0.0        0.11        perf-profile.children.cycles-pp.consume_skb
      0.11 ±  4%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.ep_item_poll
      0.10 ±  3%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.sock_poll
      0.26            +0.0        0.28        perf-profile.children.cycles-pp.skb_release_data
      0.15 ±  3%      +0.0        0.16        perf-profile.children.cycles-pp.unix_sock_destructor
      0.16 ±  2%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.__slab_free
      0.32            +0.0        0.34        perf-profile.children.cycles-pp.unix_create
      0.82            +0.0        0.84        perf-profile.children.cycles-pp.__sys_connect
      0.76            +0.0        0.78        perf-profile.children.cycles-pp.unix_stream_connect
      0.82            +0.0        0.84        perf-profile.children.cycles-pp.__x64_sys_connect
      0.36            +0.0        0.39        perf-profile.children.cycles-pp.sk_alloc
      0.63            +0.0        0.67        perf-profile.children.cycles-pp.unix_create1
      0.27 ±  6%      +0.0        0.31 ±  6%  perf-profile.children.cycles-pp.security_file_free
      0.34 ±  5%      +0.0        0.38 ±  5%  perf-profile.children.cycles-pp.init_file
      0.31 ±  3%      +0.0        0.34 ±  4%  perf-profile.children.cycles-pp.unix_accept
      0.44 ±  4%      +0.0        0.48 ±  4%  perf-profile.children.cycles-pp.alloc_file
      0.43 ±  4%      +0.0        0.47 ±  4%  perf-profile.children.cycles-pp.alloc_empty_file
      0.59 ±  3%      +0.0        0.64 ±  3%  perf-profile.children.cycles-pp.sock_alloc_file
      0.34 ±  3%      +0.0        0.38 ±  3%  perf-profile.children.cycles-pp.unix_destruct_scm
      0.67            +0.0        0.71 ±  2%  perf-profile.children.cycles-pp.__sock_create
      0.38 ±  2%      +0.0        0.43 ±  3%  perf-profile.children.cycles-pp.skb_release_head_state
      0.59 ±  3%      +0.0        0.63 ±  3%  perf-profile.children.cycles-pp.alloc_file_pseudo
      0.57 ±  2%      +0.1        0.62 ±  2%  perf-profile.children.cycles-pp.kfree_skb_reason
      0.98            +0.1        1.04 ±  2%  perf-profile.children.cycles-pp.__socket
      0.94 ±  2%      +0.1        1.00 ±  2%  perf-profile.children.cycles-pp.__sys_socket
      0.94 ±  2%      +0.1        1.00 ±  2%  perf-profile.children.cycles-pp.__x64_sys_socket
      0.61 ±  3%      +0.1        0.69 ±  3%  perf-profile.children.cycles-pp.__sk_destruct
      0.84 ±  3%      +0.1        0.92 ±  3%  perf-profile.children.cycles-pp.do_accept
      0.87 ±  2%      +0.1        0.95 ±  3%  perf-profile.children.cycles-pp.__sys_accept4
      0.96 ±  2%      +0.1        1.03 ±  3%  perf-profile.children.cycles-pp.accept
      0.88 ±  2%      +0.1        0.95 ±  3%  perf-profile.children.cycles-pp.__x64_sys_accept
      1.37            +0.1        1.49        perf-profile.children.cycles-pp.unix_release_sock
      1.38            +0.1        1.50        perf-profile.children.cycles-pp.unix_release
      1.41            +0.1        1.52        perf-profile.children.cycles-pp.__sock_release
      1.41            +0.1        1.52        perf-profile.children.cycles-pp.sock_close
      2.13 ±  2%      +0.2        2.31 ±  2%  perf-profile.children.cycles-pp.__fput
      2.27 ±  2%      +0.2        2.45 ±  2%  perf-profile.children.cycles-pp.__close
      2.19 ±  2%      +0.2        2.37 ±  2%  perf-profile.children.cycles-pp.__x64_sys_close
     90.17            -0.4       89.73        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.12 ±  3%      +0.0        0.14        perf-profile.self.cycles-pp.unix_sock_destructor
      0.12            +0.0        0.14        perf-profile.self.cycles-pp.sk_alloc




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

