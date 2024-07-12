Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848CD13DDB8
	for <oe-lkp@lists.linux.dev>; Fri, 12 Jul 2024 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720770552; cv=fail; b=Rn7/vV1ohylVXY4ZRz4DaWab/yIL35pZVYcyjTpISOuDUnfCVCI6TcqwRj8oBCxexQUdY7thslxbiHzncpjIr9OHXQy3160czqkwxvc7pN0Wm3syQPWFA2p0x7JwFtmXairbluNNIKj8NuebJXNk2BJQ2puj103IsAWQji4k02M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720770552; c=relaxed/simple;
	bh=8v3OOy8tGugvkhBn3ewbcSVj9JmqRC+hglaWXEbx9fw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eq/JrzjIB1/uv5u3icrFMGK9pYHxAE0qoSfD6GeZ6EVV8ObKVQ3rYgmyboD9ZTq5RfbF6LnlkCNqIfCS27QEff48XRVge3sdCmgkRtWXTCZTwGYBMLv9PfV9gfewOhGBpsl3ZMxa2ZEcKwy8XZ+8SkYy54ekjHa8zi1KuMFCVtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6Tq36iX; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6Tq36iX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720770551; x=1752306551;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=8v3OOy8tGugvkhBn3ewbcSVj9JmqRC+hglaWXEbx9fw=;
  b=F6Tq36iXyFzdQLAQ00D+aHjp3l2Np12ePNCtXzEuioz0lK4Uev6LeHmb
   j8AHA8WZwMslnSppvFCaffxT6TIndkga9slRjqS528PdI7LrgSMX2FFTM
   KrYC0+cTGltbipcU2IFAThSxS4NFiUt50FPqXfnigdqPZ/egdgeLLKRZ6
   S6mVqCvndk8g9O3fNbfrIGLLIcAHIhYBFsHafrLwwezaA6n1AMzErMb/T
   tcFCLlDGoYaSa/eLl5W5F1J+07RrieNQAym+hAXHbxq0QeEnvFKbGRf5e
   GOYCb8lI33lyqx17ntL0L6oT2fGCmxQVMkvgYp/z8gZHtdhOB6aFgc3Ha
   A==;
X-CSE-ConnectionGUID: pHaoJO/oRaKANlQhgpwBsg==
X-CSE-MsgGUID: tbXnla6OQEirhfXGKXtpxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22070057"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="22070057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 00:49:10 -0700
X-CSE-ConnectionGUID: w0RJRMI0T6y5Ui6A7OgakQ==
X-CSE-MsgGUID: nZKVCHlKQtq5wWBsFo0Tgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48750757"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jul 2024 00:49:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 00:49:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 00:49:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 00:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+hWClnwqtn7P8nwqM2HdnNBdscuKyxLVa2ickkvrxdPA6zWJ2ssFgVkhbCsuz+J+8a5bTsGe12Oau3EgU5yAfEIYGqfdhkMMxedMzFKt1ym9SAvT/sQxnmryboO0qQLqWFxU02RD49z+ei2oVyVNqrsF1SOJRrNnXfMpUQ/sjVuOfBR0LfzQlU3gEb5LqLOtbqFP0O/iqCRLApUJGrNOOSpaJl0km2pFTfIFwkNG3f6Y4qTbBsJ1bkXyJiZw05DX8m+Gq3sh8lvLct51gyl9pyIsn9oTwELYC6dAtas6QS3cSt9adNhwwNuUWPG754XbLC8ElhPuonzWrBj6GjIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS/4FxZCuZzGBaSJi3K0X79als8w4rsOnZM1sv7xivk=;
 b=Gs84p7oOhOShT1IdF6CZKuvR2x9Qavmmen9hx1BASlA2ZtuVyaDJiwoJ/VBf048kOYZZzmfbDMo1TnORupClg7X5YOA+GJcPC6Y5TnsbnU028HKDzGe/5XpetkUdbdRGYGKxgNaGPSUI+nEScLzpA5uO98LYQP4rPLJv1Xx7C9Y83wsRPkuuG1AWkhj6CRA+/3drj2m0Fr855jn+I9tT1KSBARVlvlw9dXMZ6PXJfkmq7KI02KvBMGERs7QVHpJobNGt5A8hNR3ZEWRkxrgiBaqbjV++ZGB0h6kt6a4NviGXx+l2Zm8UJcmLDmm+bt6gyDphcQaL3gftD9sBaQWU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 07:49:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 07:49:07 +0000
Date: Fri, 12 Jul 2024 15:48:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Miguel Ojeda
	<ojeda@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	<oliver.sang@intel.com>
Subject: [rust:pr/1087] [rust]  6571afed2e:
 BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entry_offset:#)
Message-ID: <202407121521.4ff1afdd-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ae2729-ccb4-4126-cb2c-08dca2471bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UM0ODJASdnE9uiXzgNVHDhXt3pGLPs02SrhhgaIJs5FK9xcN0+8pTx0d4Jx7?=
 =?us-ascii?Q?rYYiplXXh/sfCkGcItkbwQQ9Z2NrV8Xt3lPrjdC52KyM+ytKbqpmxkbr8keO?=
 =?us-ascii?Q?DXhKI+oqVOgNd/Wg/YHusJM8G5bxMoGWhglDNMUu02ec1YyXo3TeEYdIItUN?=
 =?us-ascii?Q?Q6HdOiRCIdiArnsT2JotuUPdAhtMyNRUYe8FPmhwgCnOlheBTNq3EKg+cpQW?=
 =?us-ascii?Q?8GSsU+Kf2pmt8Uf/53W9ZTsPfbb/6U6fzu6SHiHmc0D9JdGhYXGuvBsrMWQe?=
 =?us-ascii?Q?g0zG5Y14Z3tPRXY9kVHL4v0/yQHN3QDN9SC7r2HKLN0OkPpmOkBaCJNCZtWG?=
 =?us-ascii?Q?FH7A/cc97ByrBYwOaQAueHajoIyeVckYv+pv3KLNpMTNif+4I1uGbsiW9lAb?=
 =?us-ascii?Q?OCviv189uc63jn9qrzWTWwPQOryOqZBIV5Y62TRdJcWm9VFpqIvJ5scVSitl?=
 =?us-ascii?Q?yMNyV2QYqSEJHjWPrNkYT9XkDciM/oDIPgDIe7SnkIBw9dESiDfXtQ3qP1s7?=
 =?us-ascii?Q?8BP87jt7ZbvhakawZLhX0xXOjDojw5iEjMcbfzLL5PtiOAAITTC/hoFDjv/3?=
 =?us-ascii?Q?tkRwGxPvVLMGJlh17sOMYnWI4gTNBtquLbEfpVa/a+u36vfquXdd0TBQzYYx?=
 =?us-ascii?Q?QXedam0nH2u5cJdEzxd5CgV75oAwVzJKizanHHpgt3e8e9KReyvCR8FJFgvU?=
 =?us-ascii?Q?1GRvcrNT9mg290O0nNQkCb63Xxb7ErOAp7Ls2q2TQpYzWyCUehZ9mfJ9QO0N?=
 =?us-ascii?Q?y1MnfIEpMu6X4by3yVreJMSdW6UodaBNfXs+a3b19IrVhkCGDIS6w2YD1MNe?=
 =?us-ascii?Q?52y2o0aznXNXm/8L04ij6dXyggLriL4WBgwqi9k54KXsmyOt6SWYSuJc2epx?=
 =?us-ascii?Q?vN1Bi0KrIwzO2cpvh2GccDOh+2RFRmXWJzfpz/mzR79fWuS0uY7MFHRs/57u?=
 =?us-ascii?Q?RqjsPcFP+RQoc6Dif/YTMgXv5b1K1eR3zNwuqVZnBpxok3H9jZPxv7TbtQ4F?=
 =?us-ascii?Q?Zt7aRGNHFslBpatLNVcmpKp7DbPJ3FNHLac95DD3tsCxw1ztmYka3i6AxVG/?=
 =?us-ascii?Q?FtuQ8dhrH5LvkiWqmoJs4msTUpuxb5ySHKoPWhCY3Ke5gHLFap6J08nkJRgX?=
 =?us-ascii?Q?KK6RU7fu0RURBPlmb8pxWQAhhtdsTRuJNuaK+KGa+oq3PkX/PEboDs73NxxN?=
 =?us-ascii?Q?A7KOQIeomiV+t4KL8AkqYRTd5APGPN1Q6yE/lX/OrxtsovE+XgpYaOAyGsjr?=
 =?us-ascii?Q?BRmSe6zHICkLSiuftpSiOcaUa90VQSWSSolxC4HVwqMiUZ7UQMBedlD10sqF?=
 =?us-ascii?Q?OX8+1QqzmdpRHZBWZIwjfMoz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jcf5JrI976nkr6NWAMW1Y0CZVY/YECAll995L9vi+WM3WZ7a819dTsaO67k5?=
 =?us-ascii?Q?mxN5GKE+beBm3UzRPvOs0gWyFC8SSHaC9XVNUxijzkOTefAR90edi8eoDxlB?=
 =?us-ascii?Q?TWLvNz8l3f4KC7cUih0tq3tYEdxb0ePZPIw5qLK8H1BREBmE266bp/2jXm0d?=
 =?us-ascii?Q?lAJmXAS5I5uGRKUduBXesGQLYRVWEkpOcHvhnJRtJXgyKmHkV7zomzjvlPjh?=
 =?us-ascii?Q?Mu2G+QUw/G/WmKYJyvP+PXIrmXIbsAH+Y93K9Bnj/BcZjlIN4E1OowkP01i5?=
 =?us-ascii?Q?nf7Ju9NOPCdZJuxCdApCNqcefG30l5uGA4M2exLWFzxspI+fVcoA5ZOefoDR?=
 =?us-ascii?Q?gHtmTmShjmAlLx1veh2X9QP0KLa/vxnE9YzK+TxMqWEsa6mjjzh1ard3pLJ5?=
 =?us-ascii?Q?23lDsduLmF1cyjNwOHcuHqtH8A9f9QvZ6F9uZnfpX+GLFi3w6V3GKsFnOioh?=
 =?us-ascii?Q?KrSYvH2umPHf/y1EHlPb/H/KbZvyrSW6tSIYVL+jXwDLVG+i8E1ITgM4ESdh?=
 =?us-ascii?Q?gQuW8bmt5dNvXnHC6dOJeUQ4LjKh1aCBXFl8C1dltKPZwJTt3gos10MCXaus?=
 =?us-ascii?Q?/JlUjtkouAhMgmciMgsZpITqMFDiRUWZtxAWUUpaRDMRF7NvWTA1ZW1C8Epf?=
 =?us-ascii?Q?d2rLWCiw6T4KKqE6HwS7XE/c+6AMZ9SFHPOJsxgfq0wN2ohQFCGj03HHn+Tq?=
 =?us-ascii?Q?f5tgw64d8nQuUoKhPM66yn8F0dOo7/1utX3qFLNRRrU4GOJJvklAik91RJrt?=
 =?us-ascii?Q?R6oyi4Axa1k3EvFPJSJBdgcRLZ9XK9DmgEsOACMCAjxbcku65W6qmChY5gRA?=
 =?us-ascii?Q?Ucq8FdITdA+7JOmydYSCINY8067KDDWzo1/4OrDJNmNFtSX0Rpny+g2mXznx?=
 =?us-ascii?Q?5emaoj4z5piUBbQpZFhUAQGnJ6KDyoO7iQ9jgrRcfFe68J7nB0p69EPZaGxV?=
 =?us-ascii?Q?2o/pXSLKqRbbIf7ltCbPM1Ch+h2/UA7B2fi1SLLaoSKmiPKvWkED7lraNupn?=
 =?us-ascii?Q?MhtFFXtF07sVlUKod4XLVRjV3G7Zq/yC92lap6KfuaP7ba+h/biOQSQc+fHQ?=
 =?us-ascii?Q?3CRyvbohVtlEm9EvYyBNqc6NBx3XgqTLzxPcb4FJmRfEUjBelxbKpTerVnuP?=
 =?us-ascii?Q?eIRIHFrFu0pQ2Gme00opwNtnXwkSd07UVLSLganQ67Znn8WJ9dNS9R3kavDn?=
 =?us-ascii?Q?bi4QNCthrkaKixd41NVt/trQRUjLwCswjibxrRexNN46iR6d4d76cvw4SxKK?=
 =?us-ascii?Q?VXbh/VLx7rLT5PoaYdp0drdhBghYn0QWucvB2W7vPET2WCDJl43lUpUcjel4?=
 =?us-ascii?Q?fuumwi8owUX2gYS2h5IR79Ks6y0QDZ5wjjgpEGXiZtGzsPgewyOPmAnuic52?=
 =?us-ascii?Q?J1Py0a0oSZLNon4kXI0xabwum3bLNKdudNhldLIsjLRjCo4/84zleRliheNk?=
 =?us-ascii?Q?P8R1TpwPx9gn48aqHDriRKACEYbFmbJxmiGpkL2T/SM/GuUzE1yiWAnJ7Ry6?=
 =?us-ascii?Q?Qv0M5gDsSG2g2mwUELrjfnvULkFF5JFWGJhAuId+Glg+kNC9+MQp8eVWmdOQ?=
 =?us-ascii?Q?47mi2g6qVnck9Aw0CQ8BDtN1ADovNdJY+etIMIFbdjg3wSayYwSP1ru81P1m?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ae2729-ccb4-4126-cb2c-08dca2471bb9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 07:49:07.4310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaAQJGB7Vx7JT5u6iD8gaClBx2RTIK0+Utd8/e5iUH8mxWAcD/zgYDcsK9sn5INeGZCPg3XUuhBCkGgG1YMCAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_failed_in_early-boot_stage,last_print=
k:Booting_the_kernel(entry_offset:#)" on:

commit: 6571afed2eaed5219bd3ef94d2a06780b1cc52d9 ("rust: Enable KASAN suppo=
rt")
https://github.com/Rust-for-Linux/linux pr/1087

in testcase: boot

compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------------=
------------+------------+------------+
|                                                                          =
            | cbee22782e | 6571afed2e |
+--------------------------------------------------------------------------=
------------+------------+------------+
| boot_successes                                                           =
            | 56         | 0          |
| boot_failures                                                            =
            | 0          | 58         |
| BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entr=
y_offset:#) | 0          | 58         |
+--------------------------------------------------------------------------=
------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407121521.4ff1afdd-oliver.sang@=
intel.com


trampoline_32bit: 0x0000000000000000

Decompressing Linux... Parsing ELF... done.
Booting the kernel (entry_offset: 0x0000000000000000).
convert early boot stage from reboot-without-warning to failed
BUG: kernel failed in early-boot stage, last printk: Booting the kernel (en=
try_offset: 0x0000000000000000).
Linux version 6.10.0-rc1-00002-g6571afed2eae #1
Command line: ip=3D::::vm-meta-247::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/re=
sult/boot/1/vm-snb/debian-12-x86_64-20240206.cgz/x86_64-randconfig-102-2024=
0710/gcc-11/6571afed2eaed5219bd3ef94d2a06780b1cc52d9/21 BOOT_IMAGE=3D/pkg/l=
inux/x86_64-randconfig-102-20240710/gcc-11/6571afed2eaed5219bd3ef94d2a06780=
b1cc52d9/vmlinuz-6.10.0-rc1-00002-g6571afed2eae branch=3Drust/pr/1087 job=
=3D/lkp/jobs/scheduled/vm-meta-247/boot-1-debian-12-x86_64-20240206.cgz-x86=
_64-randconfig-102-20240710-6571afed2eae-20240711-10591-q3qmxj-15.yaml user=
=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-102-20240710 commit=3D6571=
afed2eaed5219bd3ef94d2a06780b1cc52d9 nmi_watchdog=3D0 intremap=3Dposted_msi=
 vmalloc=3D256M initramfs_async=3D0 page_owner=3Don carrier_timeout=3D60 ma=
x_uptime=3D600 LKP_SERVER=3Dinternal-lkp-server selinux=3D0 debug apic=3Dde=
bug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=
=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpan=
ic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 sy=
stemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,11=
5200 console=3DttyS0,115200 vga=3Dnormal rw rcuperf.shutdown=3D0 rcuscale.s=
hutdown=3D0 refscale.shutdown=3D0 watchdog_thresh=3D240 audit=3D0 kunit.ena=
ble=3D0 ia32_emulation=3Don riscv_isa_fallback=3D1

Kboot worker: lkp-worker44
Elapsed time: 60


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240712/202407121521.4ff1afdd-oliv=
er.sang@intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

