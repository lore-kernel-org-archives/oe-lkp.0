Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF75846F
	for <oe-lkp@lists.linux.dev>; Fri, 31 Oct 2025 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901856; cv=fail; b=UxS7cBWQAWrELnHlef3N0ZJJLcuYLOxdvNLMfgVqjqh/zX16CAQfOAgmqFzStRmtY81FOl0YZTcp3qJ4VqjnpIXk6mOaedCR6Q+l3Y30My9Y0wDcRJFeqDqy2SUzXnx5zgt9EK9sSTOo8b638do1yOidR0jDzfCG2piroFyQeNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901856; c=relaxed/simple;
	bh=6qIb2I3XdbSqD2mq1RJ+0BG+TnZefsbRPxzsgWHm67g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tjkMn3SKvyrw2GbkxDE03BfOr8HfzBJRK0h+sFdOhiz1WDzJSkxjet/NdmqhHWDmzaFrcdSrhR8J5uT0FHIcaUYkjqNZJvC7mp86qraxELUCUIbxl3I4ySVC0GLgdQXO5OafsrMNz4H1sjlbAx2p3/GL4P7maZgKM+cgEy1wW9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsCJJ0Bt; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsCJJ0Bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901853; x=1793437853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qIb2I3XdbSqD2mq1RJ+0BG+TnZefsbRPxzsgWHm67g=;
  b=gsCJJ0BtNQQaNgJ6Wk3gn11WyfJvvTVPjgB5VGx0EYHPRnTVgphiSMrJ
   CDPbzSeef768YHDRqLsz1MhpMDRpDm5xs8tRgE2xOw+i6XbZzls1qjYc1
   /qeNutRmzAaLa1xG/iWDpXB0fd6KC5BpNzg1yAYF8PGTVNld7o6SnhxWK
   yMsJ9CW+UIjuu/1mJ3rjAS/ukWH/CFNqNlYdyKTFXhGOgAcIwTTvT05o3
   jw4j3kLHGaAguoohcX9ta60xcFeA2Z2I2n6Y1e1OzhzEt+M+YkK6zwAbQ
   m5HikTFWZCEZvaky1PnZhSVrQoKHzar3GZerKtbNg99fVJ8L1CgSOITtj
   Q==;
X-CSE-ConnectionGUID: KpVOfQ9MTqShlWvRA8TOtQ==
X-CSE-MsgGUID: X8XDhrMbTb2wLkCAPqrwdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67896870"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67896870"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:10:53 -0700
X-CSE-ConnectionGUID: lrgrVbAfQQC1xqCBcmzELg==
X-CSE-MsgGUID: /heSfwjARAS9qLf+Kfh1pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185459440"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:10:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 02:10:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 02:10:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 02:10:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG2JDGK+PbgXSUONb12tZRNdfs/abVhMF7L7xpAtTX6usDKn/yDWVYyV/hyVtSOF/BpzeMP9Rm//AqjNRghNDyboiRuD2ox9OqxbXq7ocNxuRACbv/Klqlo861pqA2Qg6aheFcrM4Y5cwtEjVtv/QFmDc6BzXgUisd6CZD9lNNNfQXf+SEFHVsinHpWXLBMf/Fl/oKAeNrPc+I2BYaYpDWzfFgJzahZtgD0jpCqmEZtS2doM/Id8oupWYO1c9YcrQZkSyYXRam+oDpPIoaBMFPGovK6ciDT2m5AFjlaZdq/PNiPdcfrUzzvARPELWwqNsbow25lDVWfsYAhtoTrHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvEHR07IF2Xm6byzk/Fus7n/MveskLeVi5rzKvZrz8Q=;
 b=GJ+JxKWBzelffBYFy0+Q+yMoU8azuHD3Jad9o5UQ5YWtv4vosoz0B0mCZmasOs+sXhu9HIGhgp6yAyb8FxJmctF9ZklNACRZviFMQte30lh3J86hzSAgrdFIizXm+dVcTeEyvg6oQXg50L9HsGriFZL83aAuw+JCAsXHyBGrw0zlAvm9BsVwfDwo3Sj7UZf83bGKPmd0VZXzhwlaQuzcVCjpbONP8fX1mnlLYh1ImnGj6VlPrT2TkahG9yuXIVSbR608IJOrZGljy4WZJziYhil8gMbXUXc65Tl1ummfqPOO/uF6M7jk1IMwUawO06dS8mrZXjbQUFB/kXXkmawNcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 09:10:50 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:10:49 +0000
Date: Fri, 31 Oct 2025 17:10:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:block-with-mmio-v3] [block]  9a4caff96c:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202510311657.c2d98d1-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGAP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::33)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: f3810936-3d47-486e-3c18-08de185d6263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T7KUiBgWb82hcySE6t5KoAWZlF4fcmkJ1mtXLxjfNNZgwnQwlTNmkA3spZ6C?=
 =?us-ascii?Q?dTkhrVyNtWq7/FbLIbbZ+X7HEgyKwXUrQrfLvoLT0zXooKafc5jHJexkCsNl?=
 =?us-ascii?Q?gTI6KVYR11lhxmyrqj6YLgd7lPV5QwMfdYbTHCDdjnsIoQ06Cskvnl3/JY1X?=
 =?us-ascii?Q?QpdViG3WMeibwnIYCY6DetxuA+C78II3jdfyqUt2b/AlHga89mKCSUwvfoBI?=
 =?us-ascii?Q?zNFp2Jw+N4pPsGomNij8RgnmD8ED5v0WFsg8grdfdABBgNex++VkwJ6o7Of3?=
 =?us-ascii?Q?a9O+JYM/G0QM/fpA/3JbV+Knwmd4D1Evw4SthINo/Ot+co5WV6knnoH+ICLq?=
 =?us-ascii?Q?a+ckjqm2USRRrVpuJ4MOhOCCs4SDUf08h+xvs4mP7e24GDTtpOtue9UTcyI5?=
 =?us-ascii?Q?+tN8m3MU4WwBQCsT5casYGdc/dP9ULj2HNAyePG2WeB+mNGCE4HBJMO4nF71?=
 =?us-ascii?Q?5EqMPCJr3esGwIGVcxBhXaohWmXgU8lZxHb3+qBAFRYxyGnxHjmAK9FrmAJY?=
 =?us-ascii?Q?3ErP/h70BvLGe7WeoiTUvUL5y2DdPtOXrYt03KTF6YAYW2p5n+qTmi+3P98s?=
 =?us-ascii?Q?Ffv86B6wu+1+3pXkU41ZkU7Lqac86Sozu1SXYyrPiiY4pEceJAOjHPxtt5KU?=
 =?us-ascii?Q?kYAwG+XsL9RBqoekoz6jHlpbGyKXOhvkgBM2g9UKuwmYz9kEiCBVOqaagBAu?=
 =?us-ascii?Q?YTP3qrurFLtTzJ26Gm7Qh07jWvRggnEwLXJn9OpJqgVp6d0s5gJttzjjSd9h?=
 =?us-ascii?Q?HibZap/fALYi+TTE8GaFIJYkHRVak2A2lW/ZtwELJSukTlIinXwyDKpcUhaO?=
 =?us-ascii?Q?MJOfvJ0UIbPomClolyJgz0ZdtQqIf6sDFX7TQDAxQ3FIkOhoWhHN8FzMPWsk?=
 =?us-ascii?Q?ATRUBHIStFzGZN7NRfLemXKwBWiwgvXboZLJQ5DMuTcYEwucPi7+nKXvCQN5?=
 =?us-ascii?Q?P0pfGR3szPhzcwktKmH4gfiPaBBWHvy8pG8Ou7taU2fekzXMszkAGzWutkcu?=
 =?us-ascii?Q?HH1EjThVnlZVltdIkWaGhlA9MyIYGulxFpMm1v03CB6NKzpblwXZp59jijRJ?=
 =?us-ascii?Q?mKPIonrmWWfsbpLV5Om4AR341AIT7csBgHQNyqCnSFITK/yIcnF66N4Hd+tk?=
 =?us-ascii?Q?6e9ARqDRGM8RGDaeLkiJ1jXHAsi338b75eSBzaMVnxKk1Eq8MHuFn9iCndor?=
 =?us-ascii?Q?2yVQfe9DCE0YyHiwVRY6JElhlfuJVb2GzwfqY6EgOvFtkTVM0LT+HxjlHCzV?=
 =?us-ascii?Q?KdDTyYFr7CIIbWS9Td33a3lnJrJwIN1qsOk6FTYX2bjSiBlT+tHcjIkR1xoq?=
 =?us-ascii?Q?hkgKrgOcvFNFMaNHvKpzhqpOicXQUhpu4gnDgBbBLP+JM7Z5xOZqtbIEq0ye?=
 =?us-ascii?Q?DRclGEL3IPLP/yoeWUuin9rf3PPIBqvjg6+QB1hZUJbcrTKL609jCtvHAlm7?=
 =?us-ascii?Q?Hh19GGZ74Q6NnH+I6z1SayLLIXZKT7mBSMZrlQPWx9MzyaJWzBgbKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RamcJ2snfrE7VUHG41W//W3w5KDLYNbcZFNo8ljiDCVrfyJOgag+iCd3pwOj?=
 =?us-ascii?Q?qPfvC6GcbWrzmIH4J8ycr4znJYiyvm/CvzwJu7e97cqKnO/fqoeVY8zWiNYf?=
 =?us-ascii?Q?8Z3uAI+069Qw81soRjD/Y1w61xe8afryKZHr+kY+glPrVEAricR9iacnMQEU?=
 =?us-ascii?Q?2n9O6i6qpNjmo/0tJp1erQ4QTBTE41S0evhdhAuf8R+GI6i61+8uHazW8w5M?=
 =?us-ascii?Q?hlKxFyyXQ5Yp/guThZ0h+Km3otTSlyA+OxBQw9eb0rPqw/tvM1i/aDhM2AjA?=
 =?us-ascii?Q?XLfKfgFO+KACnm4Lw/W2mbURnznG/+u6px/XBrSM3u0O+y8FxwMWp7VuODGt?=
 =?us-ascii?Q?PXo06Vuc+YU+88O69d+bXFZEoQ+2Ag9u17ZGway8V1cqflb3NhV8F8XAaPiU?=
 =?us-ascii?Q?Jos9gjmwEtP78tNa037nwmTeWQB5mBoGsnOnNE2kE6HE1aUl0IRZfPQX+oQ+?=
 =?us-ascii?Q?M4nAO9Xw+ZhD6r1e+01xVoLohidxXxXdZXE0uFA8ZDsEn1FiClUccrgCSMLE?=
 =?us-ascii?Q?cYbS1FuYJga/33mj2nnppq3CnuVn+TNiYMsk/FFelE27Tk+ddm4Z9p+QN2pN?=
 =?us-ascii?Q?mTsGLGblO9q/hEHksijtTqQ0zsfPJzO74DB6JUVXSSuMl+25484AtWR5b58O?=
 =?us-ascii?Q?bqw2ZnHJ62hgJ5gVZ/GxridEn8pOvtaNyx1b3/5HduF3JRsYweMIJ/4PM1Tx?=
 =?us-ascii?Q?gRYuLruGCXCCq4+eUPi1CTX1av/XKzHW5hf3+CiQe8F+c6eWhdIAC/FdIGzE?=
 =?us-ascii?Q?XJxe3Yuqo+e2iNs/ExcVqnmaYnyIo2+QvQi/vJLz76drY4Pc0ADOcAOi/MCl?=
 =?us-ascii?Q?n+UBOcx3qCGRth49OEDe25W8Gr0FhZy+FiOgOHGnEI7O8xJ8h9rvltqN0mmN?=
 =?us-ascii?Q?OnODRhcspI9n5eoSOfUBVb6gG7ukB2yjfywAEOnXGoXO3F25hMpZJAPcjG/P?=
 =?us-ascii?Q?CVefTE2B+ov3l4RU/SrfcWE4jri7Nqc9fq+UGUA0NNLx5+/ALZSFEym1lzNK?=
 =?us-ascii?Q?jfp3m5HhiLlbeFMifi9NiCrC2Zl1j76ZKuIMROPBeup4clE1aHczIcwX8XjW?=
 =?us-ascii?Q?GZddvSgKd+c2Spx7KfnMVtOKNz6UMcUo93/SxAeIHPvMbcpaZqp50Lo9un6W?=
 =?us-ascii?Q?2nROMTCWo1L1Nksmu3Jk3j1BqM5St5cyqU0IwEf/CElLSy8PZKFgK276gA/y?=
 =?us-ascii?Q?TJdJmKMlcqmHrS2sk071mKacSVOjkfhEhnru0+fkv6zy+FCL571uBPTRCPu2?=
 =?us-ascii?Q?lUd7Xa9uBgiyls7DNw9Ia+rN23OqAfj+Dd42X/G29J1NoEW8aXkh70klTEdR?=
 =?us-ascii?Q?tDPlXXoL2k8awaZpz12OHyCBuhkqyryARQlcOeOapalWVSWqxLaM7jcWY3iO?=
 =?us-ascii?Q?aKyuU1MigX2hAfwvGy6+1TdZ2CVM2/A+KRByCnRKBZKvfg3tITcEANOyKk2r?=
 =?us-ascii?Q?w0ZGkJkteWVTneTR9l+XkymYOz6L6ki1Nl+YGhC6ao8gRjnKVjMheIwkA6BH?=
 =?us-ascii?Q?0eG6pJtqzZplowujKdmWtOG8UsI5BdNMYD56smlxAfsfoFZHMSoTrOqng2eN?=
 =?us-ascii?Q?PG76NrAohLTlluuMVSfpMzcobseGzLezywpclJh5lQEoi+bD2JLCOPqTOKBC?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3810936-3d47-486e-3c18-08de185d6263
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:10:49.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beboPsTR0BQuyTVfPTrFr+b45F6Soui18B+WtO40a0v/Xa+e+WryD5g51qSgO0Y8jN3AR6+OOgZJqRJ6GrtSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 9a4caff96c25ffb7fe2c88bb9f79defe31865264 ("block-dma: properly take MMIO path")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git block-with-mmio-v3

in testcase: fsmark
version: fsmark-x86_64-2628be5-1_20251009
with following parameters:

	disk: 1BRD_48G
	iterations: 4
	nr_threads: 10%
	fs: ext4
	filesize: 9B
	test_size: 16G
	sync_method: NoSync
	nr_directories: 16d
	nr_files_per_directory: 256fpd
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz (Cascade Lake) with 176G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510311657.c2d98d1-lkp@intel.com


[  992.561688][ T1368] INFO: task (udev-worker):1740 blocked for more than 491 seconds.
[  992.569476][ T1368]       Tainted: G S                  6.18.0-rc1-00003-g9a4caff96c25 #1
[  992.577673][ T1368]       Blocked by coredump.
[  992.582126][ T1368] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  992.590661][ T1368] task:(udev-worker)   state:D stack:0     pid:1740  tgid:1740  ppid:1733   task_flags:0x40054c flags:0x00080003
[  992.602425][ T1368] Call Trace:
[  992.605578][ T1368]  <TASK>
[  992.608387][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[  992.612594][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[  992.616446][ T1368]  io_schedule (kernel/sched/core.c:7846 (discriminator 1) kernel/sched/core.c:7872 (discriminator 1))
[  992.620556][ T1368]  folio_wait_bit_common (mm/filemap.c:1319)
[  992.625714][ T1368]  ? find_get_entries (mm/filemap.c:2068 mm/filemap.c:2123)
[  992.630530][ T1368]  ? __pfx_wake_page_function (mm/filemap.c:1141)
[  992.635952][ T1368]  truncate_inode_pages_range (include/linux/pagemap.h:1141 mm/truncate.c:433)
[  992.641544][ T1368]  blkdev_flush_mapping (block/bdev.c:49 block/bdev.c:66 block/bdev.c:713)
[  992.646444][ T1368]  bdev_release (block/bdev.c:719 block/bdev.c:1144)
[  992.650818][ T1368]  blkdev_release (block/fops.c:711)
[  992.655188][ T1368]  __fput (fs/file_table.c:469 (discriminator 1))
[  992.658954][ T1368]  task_work_run (include/linux/sched.h:2092 kernel/task_work.c:229)
[  992.663237][ T1368]  do_exit (kernel/exit.c:967)
[  992.667171][ T1368]  do_group_exit (kernel/exit.c:1089)
[  992.671454][ T1368]  get_signal (kernel/signal.c:3034)
[  992.675656][ T1368]  arch_do_signal_or_restart (arch/x86/include/asm/current.h:23 arch/x86/kernel/signal.c:258 arch/x86/kernel/signal.c:339)
[  992.681072][ T1368]  exit_to_user_mode_loop (kernel/entry/common.c:42)
[  992.686221][ T1368]  do_syscall_64 (include/linux/irq-entry-common.h:225 include/linux/entry-common.h:175 include/linux/entry-common.h:210 arch/x86/entry/syscall_64.c:100)
[  992.690679][ T1368]  ? __x64_sys_mprotect (mm/mprotect.c:1011 (discriminator 1) mm/mprotect.c:1008 (discriminator 1) mm/mprotect.c:1008 (discriminator 1))
[  992.695572][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  992.700111][ T1368]  ? __x64_sys_mprotect (mm/mprotect.c:1011 (discriminator 1) mm/mprotect.c:1008 (discriminator 1) mm/mprotect.c:1008 (discriminator 1))
[  992.705001][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  992.709540][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  992.714085][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  992.718625][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  992.724382][ T1368] RIP: 0033:0x7f791bdd2687
[  992.728660][ T1368] RSP: 002b:00007ffc047ddce0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[  992.736932][ T1368] RAX: 0000000000009000 RBX: 00007f791b2f5980 RCX: 00007f791bdd2687
[  992.744783][ T1368] RDX: 0000000000040000 RSI: 00007f791a3fe000 RDI: 0000000000000016
[  992.752618][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  992.760452][ T1368] R10: 0000000000000000 R11: 0000000000000202 R12: 000055cb203abcf0
[  992.768286][ T1368] R13: 0000000000000000 R14: 000055cb203abd50 R15: 000055cb203f74c8
[  992.776124][ T1368]  </TASK>
[  992.779035][ T1368] INFO: task (udev-worker):1865 blocked for more than 491 seconds.
[  992.786835][ T1368]       Tainted: G S                  6.18.0-rc1-00003-g9a4caff96c25 #1
[  992.795017][ T1368] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  992.803546][ T1368] task:(udev-worker)   state:D stack:0     pid:1865  tgid:1865  ppid:1733   task_flags:0x400140 flags:0x00080003
[  992.815684][ T1368] Call Trace:
[  992.819025][ T1368]  <TASK>
[  992.822008][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[  992.826351][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[  992.830343][ T1368]  schedule_preempt_disabled (kernel/sched/core.c:7085)
[  992.835808][ T1368]  rwsem_down_write_slowpath (arch/x86/include/asm/jump_label.h:36 kernel/locking/rwsem.c:1187)
[  992.841439][ T1368]  down_write (kernel/locking/rwsem.c:1592)
[  992.845593][ T1368]  blkdev_llseek (include/linux/fs.h:1099 (discriminator 2) block/fops.c:612 (discriminator 2))
[  992.850004][ T1368]  __x64_sys_lseek (fs/read_write.c:389 fs/read_write.c:402 fs/read_write.c:412 fs/read_write.c:410 fs/read_write.c:410)
[  992.854589][ T1368]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
[  992.859086][ T1368]  ? do_user_addr_fault (arch/x86/mm/fault.c:1337)
[  992.864282][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  992.868959][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  992.873629][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  992.879517][ T1368] RIP: 0033:0x7f791be46637
[  992.883925][ T1368] RSP: 002b:00007ffc047ddd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000008
[  992.892326][ T1368] RAX: ffffffffffffffda RBX: 0000000000000200 RCX: 00007f791be46637
[  992.900294][ T1368] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000006f
[  992.908274][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffc047ddd90
[  992.916250][ T1368] R10: 0000000000000000 R11: 0000000000000246 R12: 000055cb203abcf0
[  992.924222][ T1368] R13: 0000000000000000 R14: 000055cb203abd50 R15: 000055cb203abd50
[  992.932199][ T1368]  </TASK>
[  992.935386][ T1368] INFO: task (udev-worker):1865 <writer> blocked on an rw-semaphore likely owned by task blkid:6562 <reader>
[  992.947058][ T1368] task:blkid           state:D stack:0     pid:6562  tgid:6562  ppid:2143   task_flags:0x400000 flags:0x00080001
[  992.959091][ T1368] Call Trace:
[  992.962398][ T1368]  <TASK>
[  992.965361][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[  992.969712][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[  992.973715][ T1368]  io_schedule (kernel/sched/core.c:7846 (discriminator 1) kernel/sched/core.c:7872 (discriminator 1))
[  992.977970][ T1368]  folio_wait_bit_common (mm/filemap.c:1319)
[  992.983278][ T1368]  ? __pfx_wake_page_function (mm/filemap.c:1141)
[  992.988841][ T1368]  filemap_update_page (mm/filemap.c:2511)
[  992.993973][ T1368]  filemap_get_pages (mm/filemap.c:2661)
[  992.998930][ T1368]  filemap_read (mm/filemap.c:2748)
[  993.003363][ T1368]  blkdev_read_iter (include/linux/fs.h:1005 block/fops.c:860)
[  993.008145][ T1368]  ? rw_verify_area (fs/read_write.c:473)
[  993.012923][ T1368]  vfs_read (fs/read_write.c:491 fs/read_write.c:572)
[  993.017100][ T1368]  ksys_read (fs/read_write.c:715)
[  993.021189][ T1368]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
[  993.025712][ T1368]  ? arch_get_unmapped_area_topdown (arch/x86/kernel/sys_x86_64.c:227)
[  993.031961][ T1368]  ? do_mmap (mm/mmap.c:558)
[  993.036215][ T1368]  ? vm_mmap_pgoff (mm/util.c:585)
[  993.040987][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  993.045674][ T1368]  ? __x64_sys_mprotect (mm/mprotect.c:1011 (discriminator 1) mm/mprotect.c:1008 (discriminator 1) mm/mprotect.c:1008 (discriminator 1))
[  993.050707][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  993.055381][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  993.060050][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  993.064721][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  993.070610][ T1368] RIP: 0033:0x7efc7b383687
[  993.075030][ T1368] RSP: 002b:00007ffc29204100 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[  993.083440][ T1368] RAX: ffffffffffffffda RBX: 00007efc7b2f1740 RCX: 00007efc7b383687
[  993.091412][ T1368] RDX: 0000000000040000 RSI: 00007efc7b233000 RDI: 0000000000000006
[  993.099386][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  993.107362][ T1368] R10: 0000000000000000 R11: 0000000000000202 R12: 000055bfdadf9f40
[  993.115336][ T1368] R13: 0000000000000000 R14: 000055bfdadf9fa0 R15: 000055bfdadfa568
[  993.123309][ T1368]  </TASK>
[  993.126360][ T1368] INFO: task (udev-worker):2032 blocked for more than 492 seconds.
[  993.134315][ T1368]       Tainted: G S                  6.18.0-rc1-00003-g9a4caff96c25 #1
[  993.142693][ T1368]       Blocked by coredump.
[  993.147326][ T1368] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  993.156047][ T1368] task:(udev-worker)   state:D stack:0     pid:2032  tgid:2032  ppid:1733   task_flags:0x40054c flags:0x00080003
[  993.168115][ T1368] Call Trace:
[  993.171491][ T1368]  <TASK>
[  993.174489][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[  993.178872][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[  993.182904][ T1368]  io_schedule (kernel/sched/core.c:7846 (discriminator 1) kernel/sched/core.c:7872 (discriminator 1))
[  993.187200][ T1368]  folio_wait_bit_common (mm/filemap.c:1319)
[  993.192526][ T1368]  ? find_get_entries (mm/filemap.c:2068 mm/filemap.c:2123)
[  993.197500][ T1368]  ? __pfx_wake_page_function (mm/filemap.c:1141)
[  993.203084][ T1368]  truncate_inode_pages_range (include/linux/pagemap.h:1141 mm/truncate.c:433)
[  993.208839][ T1368]  blkdev_flush_mapping (block/bdev.c:49 block/bdev.c:66 block/bdev.c:713)
[  993.213907][ T1368]  bdev_release (block/bdev.c:719 block/bdev.c:1144)
[  993.218448][ T1368]  blkdev_release (block/fops.c:711)
[  993.222988][ T1368]  __fput (fs/file_table.c:469 (discriminator 1))
[  993.226915][ T1368]  task_work_run (include/linux/sched.h:2092 kernel/task_work.c:229)
[  993.231362][ T1368]  do_exit (kernel/exit.c:967)
[  993.235463][ T1368]  do_group_exit (kernel/exit.c:1089)
[  993.239922][ T1368]  get_signal (kernel/signal.c:3034)
[  993.244294][ T1368]  arch_do_signal_or_restart (arch/x86/include/asm/current.h:23 arch/x86/kernel/signal.c:258 arch/x86/kernel/signal.c:339)
[  993.249896][ T1368]  exit_to_user_mode_loop (kernel/entry/common.c:42)
[  993.255222][ T1368]  do_syscall_64 (include/linux/irq-entry-common.h:225 include/linux/entry-common.h:175 include/linux/entry-common.h:210 arch/x86/entry/syscall_64.c:100)
[  993.259847][ T1368]  ? __cond_resched (kernel/sched/core.c:7477)
[  993.264558][ T1368]  ? blkdev_llseek (block/fops.c:615)
[  993.269180][ T1368]  ? __x64_sys_lseek (fs/read_write.c:389 fs/read_write.c:402 fs/read_write.c:412 fs/read_write.c:410 fs/read_write.c:410)
[  993.273980][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[  993.278696][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  993.283415][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[  993.288116][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[  993.294047][ T1368] RIP: 0033:0x7f791bdd2687
[  993.298496][ T1368] RSP: 002b:00007ffc047ddce0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[  993.306944][ T1368] RAX: 0000000000009000 RBX: 00007f791b2f5980 RCX: 00007f791bdd2687
[  993.314961][ T1368] RDX: 0000000000040000 RSI: 00007f791a3fe000 RDI: 000000000000010d
[  993.323181][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  993.331201][ T1368] R10: 0000000000000000 R11: 0000000000000202 R12: 000055cb203abcf0
[  993.339222][ T1368] R13: 0000000000000000 R14: 000055cb203abd50 R15: 000055cb204e13d8
[  993.347249][ T1368]  </TASK>
[ 1484.081577][ T1368] INFO: task (udev-worker):1740 blocked for more than 983 seconds.
[ 1484.089563][ T1368]       Tainted: G S                  6.18.0-rc1-00003-g9a4caff96c25 #1
[ 1484.097956][ T1368]       Blocked by coredump.
[ 1484.102636][ T1368] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1484.111388][ T1368] task:(udev-worker)   state:D stack:0     pid:1740  tgid:1740  ppid:1733   task_flags:0x40054c flags:0x00080003
[ 1484.123530][ T1368] Call Trace:
[ 1484.126897][ T1368]  <TASK>
[ 1484.129878][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[ 1484.134298][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[ 1484.138361][ T1368]  io_schedule (kernel/sched/core.c:7846 (discriminator 1) kernel/sched/core.c:7872 (discriminator 1))
[ 1484.142669][ T1368]  folio_wait_bit_common (mm/filemap.c:1319)
[ 1484.148019][ T1368]  ? find_get_entries (mm/filemap.c:2068 mm/filemap.c:2123)
[ 1484.153023][ T1368]  ? __pfx_wake_page_function (mm/filemap.c:1141)
[ 1484.158641][ T1368]  truncate_inode_pages_range (include/linux/pagemap.h:1141 mm/truncate.c:433)
[ 1484.164406][ T1368]  blkdev_flush_mapping (block/bdev.c:49 block/bdev.c:66 block/bdev.c:713)
[ 1484.169469][ T1368]  bdev_release (block/bdev.c:719 block/bdev.c:1144)
[ 1484.174022][ T1368]  blkdev_release (block/fops.c:711)
[ 1484.178581][ T1368]  __fput (fs/file_table.c:469 (discriminator 1))
[ 1484.182523][ T1368]  task_work_run (include/linux/sched.h:2092 kernel/task_work.c:229)
[ 1484.186979][ T1368]  do_exit (kernel/exit.c:967)
[ 1484.191091][ T1368]  do_group_exit (kernel/exit.c:1089)
[ 1484.195552][ T1368]  get_signal (kernel/signal.c:3034)
[ 1484.199933][ T1368]  arch_do_signal_or_restart (arch/x86/include/asm/current.h:23 arch/x86/kernel/signal.c:258 arch/x86/kernel/signal.c:339)
[ 1484.205529][ T1368]  exit_to_user_mode_loop (kernel/entry/common.c:42)
[ 1484.210858][ T1368]  do_syscall_64 (include/linux/irq-entry-common.h:225 include/linux/entry-common.h:175 include/linux/entry-common.h:210 arch/x86/entry/syscall_64.c:100)
[ 1484.215483][ T1368]  ? __x64_sys_mprotect (mm/mprotect.c:1011 (discriminator 1) mm/mprotect.c:1008 (discriminator 1) mm/mprotect.c:1008 (discriminator 1))
[ 1484.220551][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[ 1484.225285][ T1368]  ? __x64_sys_mprotect (mm/mprotect.c:1011 (discriminator 1) mm/mprotect.c:1008 (discriminator 1) mm/mprotect.c:1008 (discriminator 1))
[ 1484.230362][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[ 1484.235075][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.239792][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.244512][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[ 1484.250442][ T1368] RIP: 0033:0x7f791bdd2687
[ 1484.254895][ T1368] RSP: 002b:00007ffc047ddce0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[ 1484.263347][ T1368] RAX: 0000000000009000 RBX: 00007f791b2f5980 RCX: 00007f791bdd2687
[ 1484.271373][ T1368] RDX: 0000000000040000 RSI: 00007f791a3fe000 RDI: 0000000000000016
[ 1484.279414][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[ 1484.287433][ T1368] R10: 0000000000000000 R11: 0000000000000202 R12: 000055cb203abcf0
[ 1484.295472][ T1368] R13: 0000000000000000 R14: 000055cb203abd50 R15: 000055cb203f74c8
[ 1484.303512][ T1368]  </TASK>
[ 1484.306562][ T1368] INFO: task (udev-worker):1865 blocked for more than 983 seconds.
[ 1484.314949][ T1368]       Tainted: G S                  6.18.0-rc1-00003-g9a4caff96c25 #1
[ 1484.323606][ T1368] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1484.332598][ T1368] task:(udev-worker)   state:D stack:0     pid:1865  tgid:1865  ppid:1733   task_flags:0x400140 flags:0x00080003
[ 1484.344655][ T1368] Call Trace:
[ 1484.347958][ T1368]  <TASK>
[ 1484.350891][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[ 1484.355217][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[ 1484.359193][ T1368]  schedule_preempt_disabled (kernel/sched/core.c:7085)
[ 1484.364642][ T1368]  rwsem_down_write_slowpath (arch/x86/include/asm/jump_label.h:36 kernel/locking/rwsem.c:1187)
[ 1484.370256][ T1368]  down_write (kernel/locking/rwsem.c:1592)
[ 1484.374391][ T1368]  blkdev_llseek (include/linux/fs.h:1099 (discriminator 2) block/fops.c:612 (discriminator 2))
[ 1484.378788][ T1368]  __x64_sys_lseek (fs/read_write.c:389 fs/read_write.c:402 fs/read_write.c:412 fs/read_write.c:410 fs/read_write.c:410)
[ 1484.383364][ T1368]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
[ 1484.387851][ T1368]  ? do_user_addr_fault (arch/x86/mm/fault.c:1337)
[ 1484.393027][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.397691][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.402350][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[ 1484.408224][ T1368] RIP: 0033:0x7f791be46637
[ 1484.412619][ T1368] RSP: 002b:00007ffc047ddd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000008
[ 1484.421005][ T1368] RAX: ffffffffffffffda RBX: 0000000000000200 RCX: 00007f791be46637
[ 1484.428963][ T1368] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000006f
[ 1484.436921][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffc047ddd90
[ 1484.444875][ T1368] R10: 0000000000000000 R11: 0000000000000246 R12: 000055cb203abcf0
[ 1484.452833][ T1368] R13: 0000000000000000 R14: 000055cb203abd50 R15: 000055cb203abd50
[ 1484.460790][ T1368]  </TASK>
[ 1484.463917][ T1368] INFO: task (udev-worker):1865 <writer> blocked on an rw-semaphore likely owned by task blkid:6562 <reader>
[ 1484.475571][ T1368] task:blkid           state:D stack:0     pid:6562  tgid:6562  ppid:2143   task_flags:0x400000 flags:0x00080001
[ 1484.487586][ T1368] Call Trace:
[ 1484.490877][ T1368]  <TASK>
[ 1484.493822][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[ 1484.498158][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[ 1484.502144][ T1368]  io_schedule (kernel/sched/core.c:7846 (discriminator 1) kernel/sched/core.c:7872 (discriminator 1))
[ 1484.506388][ T1368]  folio_wait_bit_common (mm/filemap.c:1319)
[ 1484.511676][ T1368]  ? __pfx_wake_page_function (mm/filemap.c:1141)
[ 1484.517231][ T1368]  filemap_update_page (mm/filemap.c:2511)
[ 1484.522350][ T1368]  filemap_get_pages (mm/filemap.c:2661)
[ 1484.527288][ T1368]  filemap_read (mm/filemap.c:2748)
[ 1484.531708][ T1368]  blkdev_read_iter (include/linux/fs.h:1005 block/fops.c:860)
[ 1484.536471][ T1368]  ? rw_verify_area (fs/read_write.c:473)
[ 1484.541242][ T1368]  vfs_read (fs/read_write.c:491 fs/read_write.c:572)
[ 1484.545415][ T1368]  ksys_read (fs/read_write.c:715)
[ 1484.549485][ T1368]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
[ 1484.553982][ T1368]  ? arch_get_unmapped_area_topdown (arch/x86/kernel/sys_x86_64.c:227)
[ 1484.560217][ T1368]  ? do_mmap (mm/mmap.c:558)
[ 1484.564459][ T1368]  ? vm_mmap_pgoff (mm/util.c:585)
[ 1484.569219][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[ 1484.573883][ T1368]  ? __x64_sys_mprotect (mm/mprotect.c:1011 (discriminator 1) mm/mprotect.c:1008 (discriminator 1) mm/mprotect.c:1008 (discriminator 1))
[ 1484.578901][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[ 1484.583556][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.588220][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.592880][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[ 1484.598750][ T1368] RIP: 0033:0x7efc7b383687
[ 1484.603154][ T1368] RSP: 002b:00007ffc29204100 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[ 1484.611548][ T1368] RAX: ffffffffffffffda RBX: 00007efc7b2f1740 RCX: 00007efc7b383687
[ 1484.619502][ T1368] RDX: 0000000000040000 RSI: 00007efc7b233000 RDI: 0000000000000006
[ 1484.627459][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[ 1484.635418][ T1368] R10: 0000000000000000 R11: 0000000000000202 R12: 000055bfdadf9f40
[ 1484.643384][ T1368] R13: 0000000000000000 R14: 000055bfdadf9fa0 R15: 000055bfdadfa568
[ 1484.651367][ T1368]  </TASK>
[ 1484.654459][ T1368] INFO: task (udev-worker):2032 blocked for more than 983 seconds.
[ 1484.662409][ T1368]       Tainted: G S                  6.18.0-rc1-00003-g9a4caff96c25 #1
[ 1484.670801][ T1368]       Blocked by coredump.
[ 1484.675464][ T1368] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1484.684212][ T1368] task:(udev-worker)   state:D stack:0     pid:2032  tgid:2032  ppid:1733   task_flags:0x40054c flags:0x00080003
[ 1484.696278][ T1368] Call Trace:
[ 1484.699633][ T1368]  <TASK>
[ 1484.702649][ T1368]  __schedule (kernel/sched/core.c:5325 kernel/sched/core.c:6929)
[ 1484.707056][ T1368]  schedule (arch/x86/include/asm/bitops.h:202 arch/x86/include/asm/bitops.h:232 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2217 kernel/sched/core.c:7013 kernel/sched/core.c:7026)
[ 1484.711248][ T1368]  io_schedule (kernel/sched/core.c:7846 (discriminator 1) kernel/sched/core.c:7872 (discriminator 1))
[ 1484.715676][ T1368]  folio_wait_bit_common (mm/filemap.c:1319)
[ 1484.721032][ T1368]  ? find_get_entries (mm/filemap.c:2068 mm/filemap.c:2123)
[ 1484.726038][ T1368]  ? __pfx_wake_page_function (mm/filemap.c:1141)
[ 1484.731629][ T1368]  truncate_inode_pages_range (include/linux/pagemap.h:1141 mm/truncate.c:433)
[ 1484.737403][ T1368]  blkdev_flush_mapping (block/bdev.c:49 block/bdev.c:66 block/bdev.c:713)
[ 1484.742491][ T1368]  bdev_release (block/bdev.c:719 block/bdev.c:1144)
[ 1484.747051][ T1368]  blkdev_release (block/fops.c:711)
[ 1484.751617][ T1368]  __fput (fs/file_table.c:469 (discriminator 1))
[ 1484.755574][ T1368]  task_work_run (include/linux/sched.h:2092 kernel/task_work.c:229)
[ 1484.760046][ T1368]  do_exit (kernel/exit.c:967)
[ 1484.764160][ T1368]  do_group_exit (kernel/exit.c:1089)
[ 1484.768627][ T1368]  get_signal (kernel/signal.c:3034)
[ 1484.773015][ T1368]  arch_do_signal_or_restart (arch/x86/include/asm/current.h:23 arch/x86/kernel/signal.c:258 arch/x86/kernel/signal.c:339)
[ 1484.778615][ T1368]  exit_to_user_mode_loop (kernel/entry/common.c:42)
[ 1484.783961][ T1368]  do_syscall_64 (include/linux/irq-entry-common.h:225 include/linux/entry-common.h:175 include/linux/entry-common.h:210 arch/x86/entry/syscall_64.c:100)
[ 1484.788612][ T1368]  ? __cond_resched (kernel/sched/core.c:7477)
[ 1484.793347][ T1368]  ? blkdev_llseek (block/fops.c:615)
[ 1484.797996][ T1368]  ? __x64_sys_lseek (fs/read_write.c:389 fs/read_write.c:402 fs/read_write.c:412 fs/read_write.c:410 fs/read_write.c:410)
[ 1484.802823][ T1368]  ? do_syscall_64 (arch/x86/include/asm/jump_label.h:36 include/linux/context_tracking_state.h:108 include/linux/context_tracking.h:41 include/linux/irq-entry-common.h:261 include/linux/entry-common.h:212 arch/x86/entry/syscall_64.c:100)
[ 1484.807556][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.812294][ T1368]  ? clear_bhb_loop (arch/x86/entry/entry_64.S:1548)
[ 1484.817026][ T1368]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[ 1484.822970][ T1368] RIP: 0033:0x7f791bdd2687
[ 1484.827455][ T1368] RSP: 002b:00007ffc047ddce0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
[ 1484.835923][ T1368] RAX: 0000000000009000 RBX: 00007f791b2f5980 RCX: 00007f791bdd2687
[ 1484.843955][ T1368] RDX: 0000000000040000 RSI: 00007f791a3fe000 RDI: 000000000000010d
[ 1484.851995][ T1368] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[ 1484.860031][ T1368] R10: 0000000000000000 R11: 0000000000000202 R12: 000055cb203abcf0
[ 1484.868079][ T1368] R13: 0000000000000000 R14: 000055cb203abd50 R15: 000055cb204e13d8
[ 1484.876130][ T1368]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251031/202510311657.c2d98d1-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

