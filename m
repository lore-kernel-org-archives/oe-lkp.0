Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B16917E0
	for <oe-lkp@lists.linux.dev>; Thu, 26 Dec 2024 02:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735180375; cv=fail; b=ikmKhbHgvXH0z6U5GtXV4nruifJ6wIKUv/Rl3w1lTAhR8BhaGVLrJPGwf8nohScPu9h2t0+iZ8sTeaXwYl2ysMDD0wvW/TESC6bkK/xHpMM35YgY5lvB3+88j5evUlFjRa1Eq0neWz/tu3tn38m+ZRzt/+CSg1vhPmV0QxDp8JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735180375; c=relaxed/simple;
	bh=el72hh1rVbIc2QKh6tcD6g4y08E5lazesL4ALV1OO9o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Syl/gDSxOjJUsOzN2K+MpYuyKtHDi3d63wK5NWACo9jr/EUtW+i3pUEDYd8Dzg39LHHjZz+6ABWvIVoXjAKoQNSjtH/qUE+geN9nH/BY0pXv9TdClD79yJF9CXqA/QXetonPnUzUO6CdBUFbYP3wvJm6XSdptSG1zca6a7FATq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7NNLnsq; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7NNLnsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735180373; x=1766716373;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=el72hh1rVbIc2QKh6tcD6g4y08E5lazesL4ALV1OO9o=;
  b=i7NNLnsq2pTFtmrQUr86P+gF7jFSXnNCFxToENd8CAVclek98pG5fCC7
   vgoEeVTLA3mdi9vgYYIKYUxQt6sPUHFmflSPJi6HoMyEnMvHMzPEvRdHq
   YSpMMzgfdlgqkKhL8Ri0JWDb4Zo1lW1s+wc1VlLBegZxGc9n4v69/Eyfh
   hhxUy4DWtt0UPf3Sz2pdpp56y7fRg/u0AE4/ppZ8S3ZSEipX9pCdlEWMi
   M3oJuIlnM90WBQIXm4ob0yYiSTwlTx9L69xsTo78tmAV0UEAnr+hfOcTo
   /YWZt9JKDfvGHoQdLA99tpcCs5b/Dyo6fnnCi2QtQLd9IHfJBcytpqleJ
   g==;
X-CSE-ConnectionGUID: r1tGC3wVRkCSQx35zdGmMw==
X-CSE-MsgGUID: Qv8Ew8YJRkWUoQnxqnVxyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="23194985"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="23194985"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 18:32:52 -0800
X-CSE-ConnectionGUID: Sy0hMUwMRgWXlj/NcBz/aQ==
X-CSE-MsgGUID: N2u9BJ88Qyid5LGMYqXQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="99666886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Dec 2024 18:32:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Dec 2024 18:32:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 25 Dec 2024 18:32:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 25 Dec 2024 18:32:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQMCSYNiWLHGrUg63yXdzlDtGJVLXKxzeUG9wKik2mfTx2RXblcCgxGcH4PN5A5llXdsKHoqWlr1yMB/JlkO7KNhAw7TTKqW9/cjxWUEPNbsny+G3XhCfEFgWSBiUKflnq1ElKarS3+q1yHcluUS48WQTkiXAaTZvDasYH3cC2oOtgQh0WiPf6D9Tf6ZRmg6DBSJYeoIQ9Szhh+Fn/jcpdcSSPz4ppnHXL1Pye7vPPOzvTxgQDSK5daDEdB19QhswS3ktPJWFR+BtmFvN0bjpinNFcr/9Nb5CHweAKyQdoIUtZsUjJIZgvhdykKsUST+O2d/eu18Cy1/Tf9vFuAZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuNgOT/brEK9761rThdjT5jInHBHcka+KYs6/XB9/OE=;
 b=eq5nYMNttSmo7J5sc6tQaolGsXNwLccFer9inGyzcED1GKEG4PkDgCakeDf+oEalFFy1n2LseXIPTpdFBrct/0/xarEifi+d7xsOIiM4Wtj+LaebOqk7ndNlln4FN8Vfyoxjn6nhsM7+Qc8y52Y4X0bHlwfqTS5O2YJb7SnQ0KnYl13YoAhSwkjVmHAClUA0JDMwOXJkCQdZcUPqy4uV0TMU5xmJcvic5nFR6ZesiGPJFh/q6bEDmrtEVYA3/fsAEWtNxa+dSowwTGeH10rlb1qEth5X2SJqwOWsovLBpXCB69jnhBEBc2etzZOmJqpDONCbbbkuO40YATh0HDgbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 02:32:16 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 02:32:16 +0000
Date: Thu, 26 Dec 2024 10:32:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <lin.x.wang@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:6.6-velinux] [mm/vmalloc]  eb05ec62b8:
 unixbench.throughput 98.3% improvement
Message-ID: <202412260914.7f69359e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 27fa1ccd-1481-420d-b68c-08dd25558368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4YX0oylmmRn2e/vHfqNkXYU+XQ3tmk4rl2xCfUTGKmrKH7XGh4KW5yV4Kq?=
 =?iso-8859-1?Q?9oVUHSmtWmIECI4iQfh2LUPQsGYv2mIPl08BgurPqJw0sFilaXz6OI4IPd?=
 =?iso-8859-1?Q?vltOIASqxnS1XoNlEbWkQmHt6MQ4cVAE/k6rU/85lR+/dEwpzYgSOUYqBw?=
 =?iso-8859-1?Q?6nxATRZ2t2I0zcL7cXLkwBMjCa+hqruV6XQ8IskQHqq3qALhEYWWX2cyU9?=
 =?iso-8859-1?Q?09C2lNmPIIoKwU8ESWSkDDRKhzxMvD6P4NIycwKxGNz1dgwkCjIFaeJTYT?=
 =?iso-8859-1?Q?ynliUTfGH7oPWxOPeK0h7iu3cO63iR70g/ENBkRUeZVB+bUiv546Qcktic?=
 =?iso-8859-1?Q?p0Dvt+w2mjrf4z/aIxyljMygaPhVez82CobnSAfqxyZKZSEfwYKiz699pG?=
 =?iso-8859-1?Q?QZKShC1OGNLVfo4vJpP1VJ/CTu7C2flg2AAiEsbHb9Scfw/ahYbGJR9kvT?=
 =?iso-8859-1?Q?Y4eqa4OHedMHKckv0KECLWVv/LA/kWxgiuW/ams8d83jnksB19aV0jV530?=
 =?iso-8859-1?Q?t3cxECunfY/OOh5mFDriDD69ZkhkPAJwyRGVT+kv+B8IyYI8YiT03xJmmy?=
 =?iso-8859-1?Q?5ao1qbVgcIgBU8YjV9n8TtlSypLmn0FD+Uw9i3Yz+g2sTfioC9ZxvbIm40?=
 =?iso-8859-1?Q?6oXst0vTOG0A8BGo6H6FP5P1BZ3m3K9Ngvgjk5rJQXSGLEUnQ8e93o4fF+?=
 =?iso-8859-1?Q?gzsDwbieM9x9wPo9nUbYg+QidT75l6qsh0CECp/CAhPcE1surk/aKXs4P/?=
 =?iso-8859-1?Q?rhOGZ7u/HhVUaUZv/UIvwBMtwsApD9iq2q4ju33SP2Z8TVi31vkq1jQlKA?=
 =?iso-8859-1?Q?sYrrJXUVhovpLD0iAT9LmfGIseZ5EJ+xCuyj9JGovgGatzaZ+HfTHUC2IN?=
 =?iso-8859-1?Q?AN0qcZ4RPwOQAT65gwE1OVhU82LHv1zToG+Uae8e8Cmr6OSGYffKM02AEW?=
 =?iso-8859-1?Q?tGXgpdsBWP/u/3heXaYLNCLy2IcQGW9RQ7LCWwbkBf7j7mU1tmIV+I8tKS?=
 =?iso-8859-1?Q?MKy3CSwmyZbZDIqc5PdhEAtLSV0zMVFXHWuaQVWj3eIGEdKfRsjOkLwimv?=
 =?iso-8859-1?Q?oJgxSPYZyoQaBIHgaW74EH8Ap8JeWuAlAEhgKeP9/7KmiSQFm0iOqzmHAP?=
 =?iso-8859-1?Q?OBr3pO77LIKFzR3sW/bshdXyqGCnPwZmVXS0BNw1CP4k8pHFXtoWk5pXHP?=
 =?iso-8859-1?Q?7XOYgBVGNxqmrG6/zzr9CIWDx3Iq5vxSVL0KuB4A39YRC+hZnZlMekhaaR?=
 =?iso-8859-1?Q?i+4UWgOl8/B+Ma7U6l4eHtiHdHxE1zkKSask16pkde0NNSFr8552N8kSUJ?=
 =?iso-8859-1?Q?98WRSF/FDSuaLqDMLdXs7iUJaB8smqY3nyfyXtkYSuVeEO2bBJbwb7as7c?=
 =?iso-8859-1?Q?ukz52kfKA56qGpO8JRFqH9atE91PEnIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q0PHandSuW81dJXv/BCFq4c8b1dQcqKgt8TznaS9Pk7cDQFygDuDMepCEv?=
 =?iso-8859-1?Q?YtrDo6lEtSBHMhWuNzwdYBQm9GktjaHC5naX0MkMzOyHk4Rd4gFIkEZynf?=
 =?iso-8859-1?Q?1fPB5tP7zIyJAkhOltmWAfBfKFAIUkxqvYHPGKKKieYMMmBvG6Fh4UnIu/?=
 =?iso-8859-1?Q?hCRRzlrVVnMHpU3YBPRVaNCxUB3aUm9iUJnhAUafk6RTHOuDD4nAgfccAk?=
 =?iso-8859-1?Q?wvjsKSlPt8khtFsCboPqTLUx0cdIL9/nYGa7rI/4bddHLyqpzCVIrcyGUE?=
 =?iso-8859-1?Q?mqbbWGlH3S/JMyql+eAO/IIPFdcQoW1MdmB+2Y7cJ+NwkCCoZFZ7TGH9Pm?=
 =?iso-8859-1?Q?pxx9c0BgYd4tEz8VGw2UmHgRa346tQYWuZ3KARWSh6rQ/FOs0syrnjuf73?=
 =?iso-8859-1?Q?ZPUQWu4wc70YcqAU/XiYosne5PBdux39m3fO6pW1H/a67j1edUKB9v6Qj/?=
 =?iso-8859-1?Q?hiVsGdfcrNJ80jz2VeOnTxrqY+A7CzfPU5UVjFPyqsOS/CKlXXR04ZXRmA?=
 =?iso-8859-1?Q?Lzz8RFl6XhonxFJuZSVFFuBdFYMt4vHlS1qDhrLHbZWFGcRddTBvfD5mqz?=
 =?iso-8859-1?Q?sWDI1f1JBnSSJMJtuEIe91VCK/BevP36xwJ+B067YSi07Tqk7DEo7N/kQP?=
 =?iso-8859-1?Q?ImsUuGDacqdx6oUPQlvibjfPHHqLGCEPT53lajKpoJJb7U0oWshH+9Blnk?=
 =?iso-8859-1?Q?3G5B753O6DGhRDzVgcypIld8Xtmq4oMVu5z+q/MyI+iP1qq+Ok5kBSD1Qn?=
 =?iso-8859-1?Q?FaLAtiKkYHhcQRftKZW0Ot1YdI89dKJ/aEl68o/keMYzxdM23hoaHD2vvE?=
 =?iso-8859-1?Q?8uPBYhwAu2EGF0f6s4Env2gosIu5JLVsIZ/JXjMJogjw1nS3Lul+gNPCkH?=
 =?iso-8859-1?Q?dpSp0fHpKzK32Y2PRaqv+BkyiBq6f5BRF71AttWvp5rM5poMKiUtRVmbuz?=
 =?iso-8859-1?Q?saWk0aukJgwex7FGUTlSSczosbszG7nWtFaRTpybFkgpY8EdBWaCSUPTh1?=
 =?iso-8859-1?Q?RjYhwG0hXOZviiB1jtUIK2BkO34iY0z+0Z3aJPBXtpcPdcSDtr8EHdXGMy?=
 =?iso-8859-1?Q?NWaKT0A9zEMljy/R1ssFpRR/nD4N2GohA63myLqY0WhVe+1BoJMgg4hyc0?=
 =?iso-8859-1?Q?7vVG2WkVnptK2cFTJ8ivJIepnXAu1WXcDTpQdj2C4fWd2Eah6ip075SkG8?=
 =?iso-8859-1?Q?GRl8AZUXARWLm0cXWavgqla7uKlrooE9pRoIiaj+rjNUV3ODJLvB/XjkcC?=
 =?iso-8859-1?Q?JlilJnyrIQl9fsowht4irfBdQjhaJRaa6ZfzK23n06QTkKEzmSp8SOxV6r?=
 =?iso-8859-1?Q?SjPL/FNsilghMyuYTKoBGzKz47fIdBVo6IB3YC0ScWLtsoppTiCMRys6vu?=
 =?iso-8859-1?Q?WWzhjUp2dmwZ2HeszMdmUDkRh+LCmkZLudfQZEAGaDoqoIF4Mietc4TS/9?=
 =?iso-8859-1?Q?wFYclZmStSYOYTXBgEpDb9Cx2imrar/V/3BRA7GXETMfdLzTMp90xghHVn?=
 =?iso-8859-1?Q?1Mqusy5M/3xTpgGalFtTlxilYI2a6lPO58h3RbqYVst/jxFDF68gWnczTh?=
 =?iso-8859-1?Q?VAd40kerd9EHUC1wYTmRpS7rlwrzBqXbcaye7TY1KSm2YBH78Fkuf14To4?=
 =?iso-8859-1?Q?pPCFuskLjxEH8wYWS4EXcIfDPa+E38Of9LRe/nbepdUpmlvucODZiQ9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fa1ccd-1481-420d-b68c-08dd25558368
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 02:32:16.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OU8DgToTkGmDstjfZ7mXjKxxm0slZeJBoYMQgAtPE/YZTiYtYOMpwXAxoO/eq9R6gcwlUOaNdITHicszBLHAlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 98.3% improvement of unixbench.throughput on:


commit: eb05ec62b852348b1c6b72b8cce4b69bad955aa4 ("mm/vmalloc: fix vmalloc which may return null if called with __GFP_NOFAIL")
https://github.com/bytedance/kernel.git 6.6-velinux

testcase: unixbench
config: x86_64-bytedance-6.6-velinux
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: pipe
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241226/202412260914.7f69359e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-bytedance-6.6-velinux/100%/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-1ap1/pipe/unixbench

commit: 
  6b8e86573f ("mm: /proc/pid/smaps_rollup: avoid skipping vma after getting mmap_lock again")
  eb05ec62b8 ("mm/vmalloc: fix vmalloc which may return null if called with __GFP_NOFAIL")

6b8e86573f99d9e3 eb05ec62b852348b1c6b72b8cce 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1265 ±  6%     -33.7%     839.50 ± 24%  perf-c2c.HITM.local
      5.33          +126.2%      12.06        vmstat.cpu.us
     70.59            -6.8       63.82        mpstat.cpu.all.sys%
      5.35            +6.7       12.08        mpstat.cpu.all.usr%
    201810            -9.3%     182977 ±  6%  proc-vmstat.nr_active_anon
   1111190            -1.9%    1089622        proc-vmstat.nr_file_pages
    215687           -10.0%     194119 ±  5%  proc-vmstat.nr_shmem
    201810            -9.3%     182977 ±  6%  proc-vmstat.nr_zone_active_anon
    187938 ±  5%     -11.3%     166628 ±  7%  proc-vmstat.pgactivate
    204925           +98.3%     406454        unixbench.score
 2.549e+08           +98.3%  5.056e+08        unixbench.throughput
     66958            -9.6%      60562        unixbench.time.system_time
      5016          +127.5%      11414        unixbench.time.user_time
 1.002e+11           +98.5%  1.989e+11        unixbench.workload
      0.13 ±109%    +386.8%       0.62 ± 28%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ± 36%     +60.3%       0.03 ± 21%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.62 ±113%    +400.1%       3.10 ± 29%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.00 ± 52%     +50.3%       3.01 ± 32%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.69 ±  3%     +59.8%      12.29 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     77.83 ± 10%     +84.6%     143.67 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
     81.00 ±  7%     +65.6%     134.17 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
    102.33 ±  3%     +70.7%     174.67 ±  7%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2710           -12.0%       2383 ±  4%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    638.67 ±  3%     -37.7%     397.83 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      7.69 ±  3%     +59.8%      12.29 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
   4340025 ± 15%     +53.3%    6655143 ± 37%  sched_debug.cfs_rq:/.avg_vruntime.min
   4340026 ± 15%     +53.3%    6655147 ± 37%  sched_debug.cfs_rq:/.min_vruntime.min
      0.28 ± 38%    +100.4%       0.57 ± 32%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     38.74 ± 27%     +93.3%      74.88 ± 40%  sched_debug.cfs_rq:/.util_est_enqueued.max
      2.96 ± 31%     +93.4%       5.72 ± 37%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
      8523 ± 18%     +64.1%      13983 ± 36%  sched_debug.cpu.avg_idle.stddev
     61588 ± 15%     +51.2%      93105 ± 36%  sched_debug.cpu.clock.avg
     61596 ± 15%     +51.2%      93114 ± 36%  sched_debug.cpu.clock.max
     61578 ± 15%     +51.2%      93095 ± 36%  sched_debug.cpu.clock.min
     61588 ± 15%     +51.2%      93105 ± 36%  sched_debug.cpu.clock_task.avg
     61596 ± 15%     +51.2%      93114 ± 36%  sched_debug.cpu.clock_task.max
     61578 ± 15%     +51.2%      93095 ± 36%  sched_debug.cpu.clock_task.min
    128.65 ± 71%    +103.1%     261.33 ± 28%  sched_debug.cpu.max_idle_balance_cost.stddev
    618.50 ± 15%     +50.9%     933.39 ± 36%  sched_debug.cpu.next_balance.avg
    618.50 ± 15%     +50.9%     933.39 ± 36%  sched_debug.cpu.next_balance.min
      3.53 ± 63%    +188.3%      10.17 ± 53%  sched_debug.cpu.nr_uninterruptible.max
      0.58 ± 32%     +79.6%       1.04 ± 40%  sched_debug.cpu.nr_uninterruptible.stddev
     61578 ± 15%     +51.2%      93095 ± 36%  sched_debug.cpu_clk
 6.185e+08 ± 15%     +50.9%  9.334e+08 ± 36%  sched_debug.jiffies
     61451 ± 15%     +51.2%      92904 ± 36%  sched_debug.ktime
  8.08e+10           +98.2%  1.602e+11        perf-stat.i.branch-instructions
   3156472           +22.0%    3850060        perf-stat.i.branch-misses
      1.10 ±  2%      +0.5        1.62        perf-stat.i.cache-miss-rate%
    582573            -7.2%     540372 ±  2%  perf-stat.i.cache-misses
  94991558           -69.5%   28949792        perf-stat.i.cache-references
      1.63 ±  2%     -42.6%       0.93 ±  6%  perf-stat.i.cpi
 6.192e+11            -5.8%  5.832e+11        perf-stat.i.cpu-cycles
  20098258 ±  6%     +25.8%   25287969 ±  3%  perf-stat.i.cycles-between-cache-misses
 3.993e+11           +98.3%  7.917e+11        perf-stat.i.instructions
      0.69           +85.6%       1.28        perf-stat.i.ipc
      0.00 ±  2%     -53.4%       0.00        perf-stat.overall.MPKI
      0.00            -0.0        0.00        perf-stat.overall.branch-miss-rate%
      0.62            +1.3        1.88 ±  2%  perf-stat.overall.cache-miss-rate%
      1.55           -52.5%       0.74        perf-stat.overall.cpi
      0.64          +110.5%       1.36        perf-stat.overall.ipc
  8.07e+10           +98.1%  1.598e+11        perf-stat.ps.branch-instructions
   3135723           +22.0%    3826065        perf-stat.ps.branch-misses
    589456            -7.7%     543885        perf-stat.ps.cache-misses
  95119360           -69.5%   28976430        perf-stat.ps.cache-references
 6.184e+11            -5.9%   5.82e+11        perf-stat.ps.cpu-cycles
 3.988e+11           +98.1%    7.9e+11        perf-stat.ps.instructions
 1.576e+14           +98.1%  3.123e+14        perf-stat.total.instructions
     57.64           -47.5       10.14 ±  2%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.pipe_read.vfs_read.ksys_read
     57.90           -47.1       10.76 ±  2%  perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.vfs_read.ksys_read.do_syscall_64
     65.42           -38.7       26.70        perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     67.96           -36.0       31.98        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     69.32           -34.5       34.79        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     71.59           -32.5       39.04        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     72.37           -31.7       40.64        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     77.32           -24.4       52.97        perf-profile.calltrace.cycles-pp.read
      0.85            +0.5        1.34        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.55        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.fsnotify_perm.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      0.82            +0.6        1.40        perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touch_atime.pipe_read.vfs_read
      0.00            +0.6        0.62        perf-profile.calltrace.cycles-pp.__raw_spin_unlock_irq.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.6        0.62        perf-profile.calltrace.cycles-pp.__get_task_ioprio.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.64        perf-profile.calltrace.cycles-pp.__get_task_ioprio.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.42 ± 44%      +0.6        1.06        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +0.6        0.64        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.64            +0.7        1.31        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.63            +0.7        1.31        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.70            +0.8        1.46        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.8        0.76        perf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +0.8        0.76        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      0.00            +0.8        0.77        perf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.78            +0.8        1.57        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +0.8        0.81        perf-profile.calltrace.cycles-pp.main
      0.78            +0.9        1.64        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.9        0.87        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +0.9        0.88        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.88        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.9        0.89        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.89        perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.pipe_write.vfs_write
      0.00            +0.9        0.95        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.80            +1.0        1.75        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.86            +1.0        1.83        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.93            +1.0        1.95        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      1.02            +1.1        2.14        perf-profile.calltrace.cycles-pp.__raw_spin_lock_irqsave.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      1.15            +1.2        2.38        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.pipe_write.vfs_write.ksys_write
      1.48            +1.5        3.01        perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.18            +2.4        4.56        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.38            +2.4        4.82        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read
      2.54            +2.7        5.28        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write
      2.88            +3.0        5.86        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read.ksys_read
      3.27            +3.4        6.67        perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.45            +3.7        7.16        perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write.ksys_write
      4.04            +4.4        8.41        perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.vfs_write.ksys_write.do_syscall_64
      4.84            +5.8       10.62        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      4.42            +6.0       10.43        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
     11.91           +13.0       24.94        perf-profile.calltrace.cycles-pp.pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.14           +15.5       29.66        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     15.48           +16.9       32.42        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     17.65           +19.1       36.79        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     18.42           +20.0       38.39        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     23.77           +26.4       50.16        perf-profile.calltrace.cycles-pp.write
     57.82           -47.3       10.54 ±  2%  perf-profile.children.cycles-pp.atime_needs_update
     57.98           -47.0       10.94 ±  2%  perf-profile.children.cycles-pp.touch_atime
     65.83           -38.2       27.66        perf-profile.children.cycles-pp.pipe_read
     68.18           -35.8       32.43        perf-profile.children.cycles-pp.vfs_read
     69.48           -34.4       35.10        perf-profile.children.cycles-pp.ksys_read
     78.56           -23.3       55.24        perf-profile.children.cycles-pp.read
     89.82           -12.9       76.89        perf-profile.children.cycles-pp.do_syscall_64
     91.01           -11.7       79.34        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.09            +0.0        0.10        perf-profile.children.cycles-pp.scheduler_tick
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      0.26            +0.0        0.29        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.26 ±  2%      +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.27            +0.0        0.30        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.30 ±  2%      +0.0        0.33        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.11            +0.1        0.22 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.08            +0.1        0.21        perf-profile.children.cycles-pp.write@plt
      0.16 ±  2%      +0.2        0.32        perf-profile.children.cycles-pp.__x64_sys_write
      0.14 ±  2%      +0.2        0.31        perf-profile.children.cycles-pp.__x64_sys_read
      0.22            +0.2        0.41        perf-profile.children.cycles-pp.make_vfsuid
      0.19            +0.2        0.38        perf-profile.children.cycles-pp.make_vfsgid
      0.22 ±  2%      +0.2        0.43        perf-profile.children.cycles-pp.amd_clear_divider
      0.20 ±  2%      +0.2        0.40        perf-profile.children.cycles-pp.__wake_up_sync_key
      0.15            +0.2        0.36 ±  2%  perf-profile.children.cycles-pp.read@plt
      0.30            +0.3        0.64        perf-profile.children.cycles-pp.fsnotify_perm
      0.23            +0.3        0.58        perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.32            +0.3        0.66        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.52            +0.4        0.90        perf-profile.children.cycles-pp.fpregs_assert_state_consistent
      0.45            +0.4        0.84        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.35            +0.4        0.76        perf-profile.children.cycles-pp.rcu_all_qs
      0.33 ±  2%      +0.4        0.75        perf-profile.children.cycles-pp.kill_fasync
      0.41            +0.4        0.83 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.39            +0.4        0.83        perf-profile.children.cycles-pp.__wake_up_common
      0.56 ±  3%      +0.5        1.02        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.49            +0.5        1.00        perf-profile.children.cycles-pp.timestamp_truncate
      0.47            +0.6        1.05        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.44            +0.6        1.03        perf-profile.children.cycles-pp.__raw_spin_unlock_irq
      0.58            +0.6        1.19        perf-profile.children.cycles-pp.rw_verify_area
      0.64            +0.6        1.28        perf-profile.children.cycles-pp.security_file_permission
      0.91            +0.7        1.58        perf-profile.children.cycles-pp.current_time
      0.68 ±  4%      +0.7        1.40 ±  2%  perf-profile.children.cycles-pp.main
      0.67            +0.7        1.42        perf-profile.children.cycles-pp.__get_task_ioprio
      1.04            +0.8        1.81        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.68            +0.8        1.46        perf-profile.children.cycles-pp.__cond_resched
      0.83            +0.9        1.74        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.96            +1.0        2.00        perf-profile.children.cycles-pp.__fget_light
      1.10            +1.1        2.23        perf-profile.children.cycles-pp.x64_sys_call
      1.05            +1.2        2.22        perf-profile.children.cycles-pp.__raw_spin_lock_irqsave
      1.34            +1.4        2.78        perf-profile.children.cycles-pp.inode_needs_update_time
      1.29            +1.5        2.74        perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.48            +1.6        3.07        perf-profile.children.cycles-pp.__fdget_pos
      2.04            +1.6        3.68        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.54            +1.7        3.24        perf-profile.children.cycles-pp.mutex_unlock
      1.61            +1.7        3.31        perf-profile.children.cycles-pp.file_update_time
      1.90            +2.1        4.01        perf-profile.children.cycles-pp.mutex_lock
      2.53            +2.6        5.13        perf-profile.children.cycles-pp.copyout
      2.41            +2.6        5.03        perf-profile.children.cycles-pp.__wake_up_common_lock
      2.74            +2.9        5.64        perf-profile.children.cycles-pp.copyin
      1.96            +2.9        4.87        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.98            +3.1        6.06        perf-profile.children.cycles-pp._copy_to_iter
      3.39            +3.5        6.90        perf-profile.children.cycles-pp.copy_page_to_iter
      3.56            +3.8        7.39        perf-profile.children.cycles-pp._copy_from_iter
      4.16            +4.5        8.66        perf-profile.children.cycles-pp.copy_page_from_iter
      5.30            +6.6       11.93        perf-profile.children.cycles-pp.entry_SYSCALL_64
     12.38           +13.5       25.92        perf-profile.children.cycles-pp.pipe_write
     14.48           +15.8       30.27        perf-profile.children.cycles-pp.vfs_write
     15.70           +17.1       32.78        perf-profile.children.cycles-pp.ksys_write
     24.82           +27.9       52.71        perf-profile.children.cycles-pp.write
     56.41           -48.1        8.34 ±  3%  perf-profile.self.cycles-pp.atime_needs_update
      0.07            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.write@plt
      0.00            +0.1        0.10        perf-profile.self.cycles-pp.read@plt
      0.10 ±  4%      +0.1        0.21 ±  2%  perf-profile.self.cycles-pp.__x64_sys_write
      0.09            +0.1        0.21        perf-profile.self.cycles-pp.__x64_sys_read
      0.15 ±  2%      +0.1        0.27        perf-profile.self.cycles-pp.make_vfsgid
      0.13            +0.1        0.25        perf-profile.self.cycles-pp.__wake_up_sync_key
      0.18 ±  2%      +0.1        0.31        perf-profile.self.cycles-pp.make_vfsuid
      0.15 ±  3%      +0.1        0.28        perf-profile.self.cycles-pp.amd_clear_divider
      0.27            +0.2        0.50        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.17 ±  2%      +0.2        0.41        perf-profile.self.cycles-pp.kill_fasync
      0.21 ±  2%      +0.2        0.45        perf-profile.self.cycles-pp.rcu_all_qs
      0.16 ±  3%      +0.2        0.41        perf-profile.self.cycles-pp.touch_atime
      0.24            +0.3        0.49        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.26            +0.3        0.54        perf-profile.self.cycles-pp.fsnotify_perm
      0.19            +0.3        0.49        perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.43            +0.3        0.75        perf-profile.self.cycles-pp.fpregs_assert_state_consistent
      0.28            +0.3        0.60        perf-profile.self.cycles-pp.file_update_time
      0.48 ±  3%      +0.4        0.84 ±  2%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.32            +0.4        0.69        perf-profile.self.cycles-pp.__wake_up_common
      0.50            +0.4        0.89        perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.39            +0.4        0.80        perf-profile.self.cycles-pp.timestamp_truncate
      0.32            +0.4        0.74        perf-profile.self.cycles-pp.__raw_spin_unlock_irq
      0.41            +0.4        0.83 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.43            +0.4        0.87        perf-profile.self.cycles-pp.rw_verify_area
      0.40            +0.5        0.85        perf-profile.self.cycles-pp.__cond_resched
      0.43            +0.5        0.89        perf-profile.self.cycles-pp.copy_page_to_iter
      0.44            +0.5        0.92        perf-profile.self.cycles-pp._copy_to_iter
      0.59            +0.5        1.08        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.61            +0.5        1.10        perf-profile.self.cycles-pp.current_time
      0.53            +0.5        1.07        perf-profile.self.cycles-pp.security_file_permission
      0.52            +0.6        1.08        perf-profile.self.cycles-pp.ksys_write
      0.53            +0.6        1.08        perf-profile.self.cycles-pp.__fdget_pos
      0.47            +0.6        1.05        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.40            +0.6        0.98 ±  2%  perf-profile.self.cycles-pp.main
      0.61            +0.6        1.24        perf-profile.self.cycles-pp.ksys_read
      0.60            +0.7        1.26        perf-profile.self.cycles-pp.__get_task_ioprio
      0.64            +0.7        1.34        perf-profile.self.cycles-pp.inode_needs_update_time
      0.64            +0.7        1.35        perf-profile.self.cycles-pp.copy_page_from_iter
      0.71            +0.7        1.44        perf-profile.self.cycles-pp.__wake_up_common_lock
      0.72            +0.8        1.50        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.85            +0.9        1.72        perf-profile.self.cycles-pp.do_syscall_64
      0.81            +0.9        1.70        perf-profile.self.cycles-pp._copy_from_iter
      0.85            +0.9        1.76        perf-profile.self.cycles-pp.__fget_light
      0.88            +0.9        1.80        perf-profile.self.cycles-pp.x64_sys_call
      0.98            +1.1        2.08        perf-profile.self.cycles-pp.__raw_spin_lock_irqsave
      1.18            +1.3        2.46        perf-profile.self.cycles-pp.mutex_lock
      1.24            +1.3        2.59        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.33            +1.3        2.68        perf-profile.self.cycles-pp.vfs_read
      1.23            +1.4        2.59        perf-profile.self.cycles-pp._raw_spin_lock_irq
      1.30            +1.4        2.73        perf-profile.self.cycles-pp.vfs_write
      1.34            +1.5        2.81        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.45            +1.6        3.03        perf-profile.self.cycles-pp.mutex_unlock
      1.59            +2.0        3.57        perf-profile.self.cycles-pp.pipe_read
      1.84            +2.2        4.00        perf-profile.self.cycles-pp.pipe_write
      2.46            +2.5        4.99        perf-profile.self.cycles-pp.copyout
      2.23            +2.8        5.02        perf-profile.self.cycles-pp.read
      1.91            +2.8        4.74        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.02            +2.8        4.87        perf-profile.self.cycles-pp.write
      2.69            +2.9        5.54        perf-profile.self.cycles-pp.copyin




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

