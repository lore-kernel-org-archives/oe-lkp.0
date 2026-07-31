Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5423EDE6D
	for <oe-lkp@lists.linux.dev>; Fri, 31 Jul 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498453; cv=fail; b=peaDoZYvGWCFHsmZbS5Dt108JzeDySOjemcSMMqhqTd7TO3+6nmVdWytTXYsk9sbNJHgw2PeFonE1qa++u5/Rji3vPZnsm4+sIe1HBFDcH0cO9irjDyy/6ZhvZ2ZaCjDFwR+j3emLSocEUo+ys1qvuQc8M6zegEdbs2sgY7UFAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498453; c=relaxed/simple;
	bh=gi5pXwyHh6esEMivk2MFIxFypO3Jo5bgKFO7vzsg398=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AaH9wXuRXHxrcaQFWBMxp0dCVMj05QbrHpBbIPmlFBE705i05C6wPGqABCdVzJ/5m7b5qCm3SdEjK2SMReWkDSR+wTIQacXIr2hVmBxd0gqO0D5JHCjridbcrk9cjvwVyMD63xr7RpR7rJr/dTWRs6kDiF2FpE87MCV1BdXP5HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUdbDKIM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUdbDKIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785498451; x=1817034451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gi5pXwyHh6esEMivk2MFIxFypO3Jo5bgKFO7vzsg398=;
  b=LUdbDKIM9xVaasGIRaXIEMz3/i9YU/8sYXEchuAsLR89LbcVV5f+r5uN
   EB38HT4s9LMeXIfl78vspZ0PstDi65O1ljHk9PnumCONgp8H62miL6478
   TGUupIvDyU4GBhSy/l0JjcqVbiTHfSFBEfT2ShhScToODZz2H0n+2ohie
   mN3P+OP8cJTJnSVcRBFaFMS7uMhhG/CEAGzArhhNya9kLf+LyJlAhMXEL
   +qiDHSs3MvXx42Aq2xNn3boY0x758atWNXvmnaKygdpsaYPPLP4b1A7pD
   nciR0Y5BujOL/mvgO7cblCPqVi+eglfwdZYcgHPvEY2slo4IySKdqjBkx
   Q==;
X-CSE-ConnectionGUID: eZYKrgKDTmif+RKVpeYE1g==
X-CSE-MsgGUID: Bv951jE9R2OYNP12ySqWlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96782396"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96782396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 04:47:30 -0700
X-CSE-ConnectionGUID: 8gZIfOxJRqC/iV0uIBXAyQ==
X-CSE-MsgGUID: XXG708DIQU2eYdIq+JPhdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="254253194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 04:47:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 04:47:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 04:47:29 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 04:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lcbj0DdXZOEQGabfhCMbDg/JinK0BhOt45Zq58c7Mg5V+PPFc0oXXSYAzhax/xl9J0XQKNGxHMG1MxDIDhooVzbxg0qH/c1bI+s6jqX8/wMWpq2eRED9ytXK395fZnwbJRkMHPQLrWOSdwtdZFAwsHTrvRVM0zc8B51yLJBIiJWYW51SdC2jOJrTuS4+gNsexOAWLQNfPWNIyM3T2L4sMjOeCGNnWTtrgPiyrRuwIk987H21vtgfG3yJNbiZ17G2q51eIZWP+JZSUfUt3BV2EaYtJgfwIBacww+E6JaqQbYO2Mlg+8T21HAi5VdDQeypWq4qiSDNtQLeJzYO5II47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Way4mC+PRM1BGTFw+We9Y37agfqsCVUBAWuudFqIbvU=;
 b=IvG5jfOzKlFFagjkpqWAk+YD4K17EtuAGX9AoEaIO3G9QCtCmgr18N7jiK2RikKYFTD50HhIELJJnMyoQsq/B0/OCQFi5Pszk4B5VHnnR6xIPdYnJl0JZ/re2OTDXfAiAj//e5bIWGim0ghMdcCFM1e7TGu2A8Bivwz/D1r49GuiHYQaKdxOgX95KkMsrHwH9290Com+5M8Bwu2LvvDbIXIfLFW/+wtLa99wOCesfOsLUbSVdafjzoMLMIFQvbsBY78zYpm8UPIX/KaKf+QID2u/lBazGel96MbHd1BMh+6QVxj9XJktu2FVvi4HdXq+FjXfde0rhQqciFelgh613w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 11:47:24 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 11:47:23 +0000
Date: Fri, 31 Jul 2026 19:47:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:bitmap_param] [bitmap]  0ee65b4b68:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202607311010.9c97983e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: f06cdd4b-a36e-41a8-95e2-08deeef97c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: wHDfghBgWVMAx/TrOy2DvOHAf2Wvz5jJ7ggYZjwx2PryTYdad6dUAW7yOQ4O36cKbkJoEEdx1S3htoBdubYrGTgwFUDzgbFGta8ylboLsUvxUxeoADmMjMac0Bzw3PUULaodl4AdUVOGWTpjX+dF/qRWolLRi+wxC6UkcxtocuLHavusPfCtrp/KVvDAacSMM+Xcb81eJuRtoS+nQltCpgk/PfwP+zEVN7268PjHlattTSYdbYq9mrLSDumACDA7DKGUXN4vbDTXDfUR8scghSROMGNu3rxqRJIhyAprRQ2+TnI8LZDOshNgl5SlvHzDAoCCPvuLpDVcEqNLIFDELV40WayV0amDbGVNcCdWfh4+iGLdY5Nc9d2S893+69d0ELs7eUCdLY21abyU6DL7C+R5EuA2QWc6Pa5Fd1xaF87hM73XEA22A+1xD4YwWs7mSDz7qj2c/eb1PKrnTnJgTaxyRS1l93kHsKvwwenoerccHs9lBFRJ+5MfCbCBaCFMvojt1r604OSG+KZ8enzjDbmJh/njMhOkB1UInZ12dzigogdQYaQkVKV00hHkq7wdab9/wwLiJwX3tX11y3V/S3U8JyR350RRHtXhoziMJX0hPSO0MX22/4AcRdtK41/B/iz1Ey/vX0DzraKa9y9Q0Vs3PMjttvbwK2Blk0aa8I4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7F49OZZbNjSKgjtRKtsUtht5gO81WyTn7M2de9d2UhSJiuiZQJjW0dAulZ5l?=
 =?us-ascii?Q?QSxaEqir2XkTunm0KBvDXCWWBV5NLcL0hETbBpOzeNFbtBkYIRtdPDJLFLM/?=
 =?us-ascii?Q?nOmE09ay9w3Xa4QNFOBCd8kNsupp3HdpYIY7h8cfSSpl0N5slPA5a3v5A32X?=
 =?us-ascii?Q?Opf21bwib7Yt5uW9hbjNHIK1T5JkfG2kUNse8qhdnB8zDyUStPjFykLeDUlk?=
 =?us-ascii?Q?Oi012bA2mzX61c5gIuh8EvD8ZSOeMJtXffviYLpG9o/nwlUldSa4SZpZfN7R?=
 =?us-ascii?Q?35ipsSB49TfNghr6pOVMBpk26emhAqlE87nwSQ2gEscmc2i+h7nhDVeDOwtS?=
 =?us-ascii?Q?AorenxiJhe7zBA2yxRC25gSVykx1nxwKT7PLZ7+V2Rm+eLEtYkRVHXGa+QXS?=
 =?us-ascii?Q?f/7wmbSCR0x9zjEESR4YKEbGYVgj10NO/Vdrdszn8MgTLIXIBc1sYGbRH6Ra?=
 =?us-ascii?Q?jtKV+JPJhq8E/WbXO5twPXkjZKeZadWhlzdGqwIRQ57/s3SjLRbHAkxgQILk?=
 =?us-ascii?Q?nczcKapFTt3CQmGoK0mG+2aY+Ui4PGHl/Oigpyvc2almhJ7nHLhQ+6Bt2S4Q?=
 =?us-ascii?Q?0sIt3mLOOmbJEle+1w83Ku9Cq237ofaSdD5lmZ6f/pyEhm9vqPSQgdrNKrgP?=
 =?us-ascii?Q?0ElfkmjLaj98hMTjMJIhQUmzigZhtujO8Ua4tfeowqMaOI3YDMqCRiSVi4fj?=
 =?us-ascii?Q?pJN+D30VbAdnqs8/7BitzwtwdsRrkLf2qYjZLBhUKx9F2OzfHpUv9XgiVTCm?=
 =?us-ascii?Q?/MwYkzjk/lsxfsK2XBSyJyjHAu9lTCv/nJw/u3hIBHrWUYw7psRVEpyDGbLk?=
 =?us-ascii?Q?ZzCvkpG+CmaGHeglZ3a4FzTYk9EitJcsglVSnbNT4H4YrNL5CjoKaOtAZ+ng?=
 =?us-ascii?Q?Y5gMFkHYFZBaAw11ZaJAKK/CGTJwIiYhM44yCDNpJqW+jX1RNPRnaHkNdKhz?=
 =?us-ascii?Q?ILz8xLB/dGZ6pjpAfWt15KKwrH2Np0e2p3sMjFZkfXY1BWk/oghhL3uZcdVb?=
 =?us-ascii?Q?b84huAKUd4FS7LydTnL3rCARfXcT7gRhdhzv6bdgwlOgkvKU3qB5/htwYCd3?=
 =?us-ascii?Q?QfbtmFUPeliBSrAihlpC9zZc/bjWtHYaNegYk+cEvTxl+8Wl8Sr1lfwIfajf?=
 =?us-ascii?Q?EczTtvm2bBC2e/1kjmHax6bXbo0o5LMDFjhGk6FXLEzy8VoZb3p+tvtphZvk?=
 =?us-ascii?Q?wNist8dnnj1mOIZxOsQvpItupg76+2Ffm7bFNtPk7tB4iKH8sYzYQdKvBfc2?=
 =?us-ascii?Q?BpZeBC2Fq25BJCKYXL1tZEBJVg0WYp+GrF18aFpqXpYXMNdTLmZMAQ9Uax4M?=
 =?us-ascii?Q?mR8H2CBiZwxJrWJdFM0LtSg+8Sa8cAp1r9Nbeyx2BCAF0oknHf1AczgqLelH?=
 =?us-ascii?Q?RONv4/Fjt0RBQ6RMngocAsXQvd7GMAjI+YJp1G/hwCBOc54WZZFiehEhlXet?=
 =?us-ascii?Q?7yFidFB/JKeq0BYhfnXk1WVEEzu90xcH6hs2F15mNbvK+Ln85g7tjaESCSlc?=
 =?us-ascii?Q?Aq2CHyOCzShgV08rwA7oMO0P10vwk+MxZxFJv6ImoFZQL751wo2u3pcz/asL?=
 =?us-ascii?Q?m8W2VXRk6c5YHei7I/ct571lbhThmaCZfmk5zPXSvpJQb5Fw3Aw9mW4PiFSO?=
 =?us-ascii?Q?GwJDiZnuQ7Gl1Du5YW5ebUxEpJe2mOtUbzVxz1DTg6hf0AlDJbBjxWd/ijei?=
 =?us-ascii?Q?9EKuV5Gh1MoNoqwzEjG4r3K+lU99C/4u31MRnY/J58eq2FPcVDdQfxQpHcOB?=
 =?us-ascii?Q?e0rNNY5GYQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: M1B880lH8bkNMTnE6BobvZQawAtR9zufzdeS0dXy5un0SJml1G+xRsk6Y9o1Xk008mpIziRrQGsFakun299cgqSxr/sWtRZcF/szZn9TIiG4efRx/3TgAqD6CaRHiyEd5cH52OUJ5F9A+Lnudwt9rr4aDqLHWtnaQwql/R/A1WREGJuwGaqviXhFcF3nM6JO+OTnb3E3PdHy0+SVy88g0ElIlcM49cRfNMzgzWP/bwwta60oCppkfO6nOyCwTu1C2qI8Mx59wYoXXRC2LBdSvIznv+Al2GM0nwwwf82R4mjnCGIa/6vHlACh4qYZszwLdRY7nQ47Auk8yy0QbN89zQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f06cdd4b-a36e-41a8-95e2-08deeef97c40
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:47:23.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/zwb/ySQTUuE+u9b6fXrFfEoR/TKuGwjdi8Z522gBTNS4oL3b/8yXtdWfZEbAXuh8v1/a0iQq9mYbV4ZkhP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
X-OriginatorOrg: intel.com



Hello,


we didn't get too much useful information from dmesg, but seems the issue is
quite persistent with high rate and always clean on parent, so still report out
FYI.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb/boot/quantal-i386-core-20190426.cgz/x86_64-randconfig-072-20260723/gcc-14/1

bf7e3686b708683e 0ee65b4b686fb78bda2320d6a70
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :496         50%         249:496   dmesg.BUG:unable_to_handle_page_fault_for_address



kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 0ee65b4b686fb78bda2320d6a7002332c41d7537 ("bitmap: use unsigned long for bit indices and sizes")
https://github.com/norov/linux bitmap_param

in testcase: boot

config: x86_64-randconfig-072-20260723
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607311010.9c97983e-lkp@intel.com



[  128.056595][    C0] BUG: unable to handle page fault for address: fffffffffffffff8
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260731/202607311010.9c97983e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

