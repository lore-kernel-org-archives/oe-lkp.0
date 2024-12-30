Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72819DF6A
	for <oe-lkp@lists.linux.dev>; Mon, 30 Dec 2024 06:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735540177; cv=fail; b=gFEfSmL97RxSbnj+4yxuvDjrzx9E6PqFXpAZ99xAs26jP0dAz8s64dVfiCrjglqSsXtmWZEOQ43uR9QOdI6LGFHgfUHDZUqcrPP+C2i4idFwDJT1jZESX9m7UNFcEvCh2/Z0POewhj8IX/x5OwRZUTs6mT1Vkdtf5s1EjAvbYns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735540177; c=relaxed/simple;
	bh=zKBdvAqdC3z/GuLFrr6cIMqFT826vcBpGbfIZprtmBE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Pe/LLKzvWgHmRw2U8DT5JyRcIRuoNC1UfDn3f+3EYGRyWNSHPWrC0hAS8l3rzgJAn0XZg/jbIoxtQYqcZIQBPnqM31Db0TxwJyimAOIAh+jPZ8SbE24XQuzzVMEeZzfoC7tPiaUImkuxP977YtRAR8A6LCVdUV9Ev9qMZGW5J28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6BfhXHQ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6BfhXHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735540175; x=1767076175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zKBdvAqdC3z/GuLFrr6cIMqFT826vcBpGbfIZprtmBE=;
  b=b6BfhXHQ8kNq+TYi1CtJb5Y9Eq1PFIyKYZ8DPWBkVGux8cRHxOs69Ga8
   CuYhh2A6x6mV8KA5vTq7neZDF0CFHjAF6H0+/5fFSyD5b0rwUJKwWOf7F
   BzsZy+aTmB9EUl0MQ3U4OZg3bgLlMUIpvZjOABaIJVYAaqDbxCd1t0eHw
   ov15sdkpRdSNvYzUdPUrzZhuEHLNYY7vuAguIn4S1ukCrTLHukX1TBk+D
   mKyy67nH2vG7YuhRtUWKPTMEv8ScguFMadYWQPjXnIeyFTWGdNZsG5pH3
   r/bGpc8k4c9nqRZETPKTyJhyKOGUacTHtJo9Y7h7bD+mkNu/OErGr8QWt
   A==;
X-CSE-ConnectionGUID: g5WZ8bWjRT2xg0s3cSVONA==
X-CSE-MsgGUID: vX9p2wMSQey3UlcGdYlXrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47245086"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="47245086"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 22:29:34 -0800
X-CSE-ConnectionGUID: OL5UWJupRTyIp7lpsF5M4A==
X-CSE-MsgGUID: gQ5lp+ysT72sNQuIw5iLdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123989671"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Dec 2024 22:29:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 29 Dec 2024 22:29:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 29 Dec 2024 22:29:34 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 29 Dec 2024 22:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP1QgdDHjV1nFfw/3wYPFKbXU99XjBAW39RCz0SCkpxLykydxKNryzY4RREQNqnTpVuTv7ofXuzLPNGGSQsEDcvkrSGUkzEIXCD20FricGy9KTJeQDu7boCGjvcvz7ol9lYaAj+kNx3OPkI8apZl/ysB9OM3XeXipDB70UQKZ6/XJS1bPGLSDZEJmDL5nTH13UGD9iNLeCyn5nxUr6CKvD74SXiPB7hopoNQatLI6MGaOyr+lyJO93ffgLGzEPjdjs0pvUhONyWokVJY8OGlLfrYGcaKs+lfkR9eC2tk+gqlhKfWwGF3i0hfvYzOjmwAm6jN8t4Fwx01Lbvh4NygFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfgNCDbUG4h/3oWtsDO4EOL6ooDPLNgxktKwsXRfe8o=;
 b=aQmQEnQKNialTOvvDo7XVmGwQCaOYOuP32Fqc735NN8Lbr4VYCbI9iUZqYx/JS4HvvHlBRZ8cKjd3k5lrvKF0HsjRBuJFKErhzhJoIC2h48peADFUh0P1aKbW6hiU9BE6QgjXiV1CI2GnQjspPaKrpNbNY2LxroVfrJBqudmAQvv+kzPnBdm6jU8sDSrYSU7J7DzAIzhOMgsrcCyRNDCUiucVYervGD1jGa0tB9N2T+tbLM1PoLyxcY3jxGg4pumDXs6Q4dkYArC0OKNsYQGjXK4se/HSl2KG2qVh+U+9mZXYqLJTQCktdidWq8LZ+lwS5T00BC3W0LAJcNP2Bw0wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 06:28:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 06:28:46 +0000
Date: Mon, 30 Dec 2024 14:28:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:execmem/x86-rox/v8] [modules]  dabed34199:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202412301440.1888e8e1-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: ad79298c-ca11-4cce-c5aa-08dd289b36de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VlMIq6/Irwb9yb3BFSUSA7daCqiYNQsmIuesxAHao0kzJyTanuf4eRyJrh9L?=
 =?us-ascii?Q?QdHXcsu5WT95MWTdPOejX6T5s8fZrzEboiqlVzPPY8f78MkPJK+5/tbhQU2I?=
 =?us-ascii?Q?1PHF9ML9CD/GNbK6KgUiNZeEX7El+kpxf2FNAgRn5DrxUdJX8kJvr0DJ644f?=
 =?us-ascii?Q?UUskU0TRc9f21bmF1KKJe/d3lglO/ifwc4aKnIVrMRViqTqRN+dyMqHUoD0c?=
 =?us-ascii?Q?h3Ebnp9pDl8PUVlETSKRcIVdRXbBNCR4xNjMevgAdHSKl+ZZmjVelRqayiJi?=
 =?us-ascii?Q?HbHXPM2NEcACF+9evaFdz4Xc2ttR+2fm0Ws4t6TAmo/bpgqRYQ75wkWMEPuH?=
 =?us-ascii?Q?xaXLQITbZgdiLzRUi2nRXhMTqXDqoIoq3OHcpZfS2NttkJnkGLqin/HjA6a+?=
 =?us-ascii?Q?hLQKwMRFazRCJZWrBXuI3pDt9adgCvJh+rgHFOsI/DEJ7jQQuOM1uzhlLidW?=
 =?us-ascii?Q?tEHWbUdp3abkZIRZ8JAXuzRLWElv/QLthIOnkXUliaKSU2ldBBUbDOdNzBTy?=
 =?us-ascii?Q?cgX5wS2QeG4BZRSkBbML8fCVn96wz3QCKK7bUszDrMCgOP6SlzY3IaRf7Zmy?=
 =?us-ascii?Q?3AyU8z1XK2qmccYMMUGuoGffTpGGW2bKdeMB4NCjZSOfbZiUhsu3qtm+HUym?=
 =?us-ascii?Q?4JcPNMqwxPk1TcCGWXPC6sM6tyhPKOy4guwn/YHmAi6a+8C82DEwm4kdrLmm?=
 =?us-ascii?Q?p0SiWCQpZgfvrplJJ02MjFZVXju/V8TOlyHwBr6JW5agPb/I0l4q7yQUTTez?=
 =?us-ascii?Q?mIT1LtsIRxyHEjXscRLRJZ3gKgV3UEySMu90ZCIRsuGwkkPRDajERdGBgukk?=
 =?us-ascii?Q?DldqGQzAju7DqzcN1ID+L5NHl2ZGo/gPPrcTjYV8WE/iUYqYrHXZuwVGZ7Sb?=
 =?us-ascii?Q?TSQV/9l3TXDEvdTuJEaRiCNdJvFKnvYQmyxwXijDB8cGlMoh2+HOI0IQM/Pb?=
 =?us-ascii?Q?V4NRnajlZbbs0oeSiXB83jCUbc7kgHCYNBOCkAkrSWr0QP8O05QHrOmAdMP6?=
 =?us-ascii?Q?oC06pHRlJiA0pWjD7mFjMemQ6cMwyvWgbE8StaH9/ZVXibHArRLooi9whvsM?=
 =?us-ascii?Q?1lMVQeuV3riNfrBl8FcMdaQd5y3LjkeNFn9NINNt+3exdjjRyTzjQG8UWcgE?=
 =?us-ascii?Q?QipzkfDJ728R/4WwiH4MppRuEhxi9TCfAtCALFhNOW9QSP90c2P8+aUu1o8o?=
 =?us-ascii?Q?pmwIDbLA7+eH9u5iFVnRceIv1R30p9vjzW4fDNy+BYCkuAZDj10W+w5OA3RU?=
 =?us-ascii?Q?XOvYEjIiVuI2GEwtz5tKEiI3UOJBbE/8LvglVs/s12qU3uzxhHnMQcQ+74ZI?=
 =?us-ascii?Q?hI2lmeQp3+Xt84fsyGZtJ+Ck39JPr6Pg7R5EghzPbkvwhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6SXZ6k9T11hT/rxH0gjzUzPbdHIty9zOkDCcHXXDE4wYnncFbEx2WSsBM6aL?=
 =?us-ascii?Q?khujVDvB5FtdsbGdyLnIq6HzcwXDAxo2NJkGDM0bZHpWs11Z/XtwRKhdih1o?=
 =?us-ascii?Q?GRf3QiGrPvXZRFvAx8qh+bxDo8c+It1CFhXidkwk5BvJkNurTYT+s6FF/yFr?=
 =?us-ascii?Q?DKZaX0LwS1yTugk2dxotx87rFnTP1/hhdv+mlMrf1K7UN9Ho7jWaGaabBzuj?=
 =?us-ascii?Q?UtEiZJaOtGPhuv02K+JJHFRBIcPoK/L9o+GgvWMYuNPGHrlhYAxlBORk4upy?=
 =?us-ascii?Q?Qs+5/AE5urd8hG8DBw/sjmcUVObOiaf+lJhqBoJxqWLcADY9fB1csSpoDqSz?=
 =?us-ascii?Q?gCJzmW3NfegyteACQVlHJLUpMrLQlaP4FHAK92+ZcTTcGyuScP2BlsO6MIk6?=
 =?us-ascii?Q?Fgs/WW2EWjRKKwks1BNfQ3sdwWOh3uHSQ+q2dJrBsnJJk8AhI//Z4nZyIYx1?=
 =?us-ascii?Q?ipE0Yt1O1Hg6pQoc0yurccqftcdENiwtEKW0bdihLWXpK6FIYxN1cRnGSCZA?=
 =?us-ascii?Q?lI/iIEuoWFdGUdBHib4Tnt6C8RyzgD9EfrO5eOFjaqm67rv08kOpTDBOsfVx?=
 =?us-ascii?Q?Oxw6nl9zNKRYX6BORhV8Y7nLLzfSSZtyY5L1mIDqjdtPUhhbyOc7dGV/mMob?=
 =?us-ascii?Q?gIOPUJk8/OcFOIXhYlVC2Tw5zCR2jSPNr0Qlz38NGpEVO0ScMitkYlBzz+QW?=
 =?us-ascii?Q?CqgBBJtx/mJEDfwzOEOkggVh3jzwtSbi74PhYSS1BtmZG69V2/Sz8ROGFZ6A?=
 =?us-ascii?Q?lyKVF507pxu79AsgzF3h5hRyfEcpgUBWZBPOEnV27BjBICHZfSnGx32W1WIS?=
 =?us-ascii?Q?RH3fHXQtr15Eb2mJSnUkMwPeUUvqT9EkInCOCMOB3ApkHgPhq9KykIQvZKui?=
 =?us-ascii?Q?wdjQ0H+bw9zsSZKyV3CVsOshecG2wB3kgmGf/3Lv33kmHd9H1geSdu3IKpia?=
 =?us-ascii?Q?g/pF5KRs7l7auGUrmqjh0YkmoHe6mCdAL3QZMpEkohffGq7jwBQtSmUM0+E6?=
 =?us-ascii?Q?uC8nfDY3A/+y9/8CEpHJVj1I+g3v0x0oN7BKKmfSbjP+NX8xUKeRiYgKyw0m?=
 =?us-ascii?Q?9SjnxuWORO7Knju8kD/mJoVbzhmUB5fLdFBpfbNPEyDUYYi1RFFCyT55hCDT?=
 =?us-ascii?Q?I8GhRgolCQI01HatVSlEpkwvl/v1RBTkn+IMlWLqDHnLmAU3nFLHyq/8KzD6?=
 =?us-ascii?Q?lazExZNARDNCQdCbFuCyZeDAxuROuBDx0oeugRJNdor1biGHaZ69L/6gV6HP?=
 =?us-ascii?Q?BM7jPeDwczILchUlvapGW/jlywX3wrczWZRIVIR/0GamOArwv6aY+wcfb/Qx?=
 =?us-ascii?Q?YXJhkiFLpCAiRaAhYXck2y0ZagqOmg/D2QQehLGwQAUoH5pcBGiyx/kADtCU?=
 =?us-ascii?Q?yWneKmiChp5Et5uSqLEuLcX1dTn0uLGKbSHy6MCl8alUqUEcYwzTf6OSeZPe?=
 =?us-ascii?Q?hxpc5pAEpEzpjh/BdIzpdobA1Uq7ke0BB7ip/NFyMHOvrhL5mmLigKMm8Qvc?=
 =?us-ascii?Q?ejmnvwnc27RgKKBmoX+Ch5M6Oj2TbDv9LH5qldOXaWkf2/OHt/Okrp23DfXp?=
 =?us-ascii?Q?vLOMzHd6nJpt0QZ2zb0q8oWxT4VnIomkQVa6iWb2qHp4E9Vl1Jgzslm86Ca3?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad79298c-ca11-4cce-c5aa-08dd289b36de
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 06:28:46.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHdA4bafqE1DvzDFWBcUWyBqYfzo8n5oxclvnblpkYbH3hMp2EwXL28caRfzPasTwDHjsRQyEIrTLezYbbfQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: dabed3419932a68921de5972b24f6a6b7dfd4866 ("modules: switch to execmem API for remapping as RW and restoring ROX")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git execmem/x86-rox/v8

in testcase: boot

config: x86_64-randconfig-161-20241227
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | 6a7a9e5b90 | dabed34199 |
+------------------------------------------------+------------+------------+
| boot_successes                                 | 30         | 9          |
| boot_failures                                  | 0          | 21         |
| BUG:unable_to_handle_page_fault_for_address    | 0          | 20         |
| Oops                                           | 0          | 20         |
| RIP:_sub_I_65535_1[fb]                         | 0          | 4          |
| Kernel_panic-not_syncing:Fatal_exception       | 0          | 20         |
| RIP:_sub_I_65535_1[qemu_fw_cfg]                | 0          | 2          |
| RIP:_sub_I_65535_1[psmouse]                    | 0          | 2          |
| RIP:_sub_I_65535_1[rapl]                       | 0          | 2          |
| RIP:_sub_I_65535_1[pcspkr]                     | 0          | 2          |
| RIP:_sub_I_65535_1[sha512_ssse3]               | 0          | 1          |
| RIP:_sub_I_65535_1[sha1_ssse3]                 | 0          | 1          |
| RIP:_sub_I_65535_1[drm_kms_helper]             | 0          | 1          |
| RIP:_sub_I_65535_1[fuse]                       | 0          | 1          |
| IP-Config:Auto-configuration_of_network_failed | 0          | 1          |
| RIP:_sub_I_65535_1[fb_sys_fops]                | 0          | 2          |
| RIP:_sub_I_65535_1[input_leds]                 | 0          | 1          |
| RIP:_sub_I_65535_1[intel_gtt]                  | 0          | 1          |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412301440.1888e8e1-lkp@intel.com


[  111.221665][  T123] BUG: unable to handle page fault for address: ffffffffa014d4c8
[  111.222351][  T123] #PF: supervisor instruction fetch in kernel mode
[  111.222908][  T123] #PF: error_code(0x0011) - permissions violation
[  111.223470][  T123] PGD 40c3067 P4D 40c3067 PUD 40c4063 PMD 122325063 PTE 800000015194d163
[  111.224267][  T123] Oops: Oops: 0011 [#1] PREEMPT KASAN
[  111.224747][  T123] CPU: 0 UID: 0 PID: 123 Comm: systemd-udevd Tainted: G                T  6.13.0-rc3-00006-gdabed3419932 #1 be760d6cffe1d430d3b268a66fea25ceb7b58953
[  111.226009][  T123] Tainted: [T]=RANDSTRUCT
[  111.226427][  T123] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 111.227340][ T123] RIP: 0010:_sub_I_65535_1 (scripts/module-common.c:19) fb_sys_fops
[ 111.227905][ T123] Code: 5d 00 48 85 db 48 89 d8 75 03 49 63 c4 5a 5b 5d 41 5c 41 5d 41 5e 41 5f c3 be 07 00 00 00 48 c7 c7 60 40 40 a0 e9 6b 16 37 e1 <be> 07 00 00 00 48 c7 c7 60 40 40 a0 e9 79 16 37 e1 00 00 00 00 00
All code
========
   0:	5d                   	pop    %rbp
   1:	00 48 85             	add    %cl,-0x7b(%rax)
   4:	db 48 89             	fisttpl -0x77(%rax)
   7:	d8 75 03             	fdivs  0x3(%rbp)
   a:	49 63 c4             	movslq %r12d,%rax
   d:	5a                   	pop    %rdx
   e:	5b                   	pop    %rbx
   f:	5d                   	pop    %rbp
  10:	41 5c                	pop    %r12
  12:	41 5d                	pop    %r13
  14:	41 5e                	pop    %r14
  16:	41 5f                	pop    %r15
  18:	c3                   	ret
  19:	be 07 00 00 00       	mov    $0x7,%esi
  1e:	48 c7 c7 60 40 40 a0 	mov    $0xffffffffa0404060,%rdi
  25:	e9 6b 16 37 e1       	jmp    0xffffffffe1371695
  2a:*	be 07 00 00 00       	mov    $0x7,%esi		<-- trapping instruction
  2f:	48 c7 c7 60 40 40 a0 	mov    $0xffffffffa0404060,%rdi
  36:	e9 79 16 37 e1       	jmp    0xffffffffe13716b4
  3b:	00 00                	add    %al,(%rax)
  3d:	00 00                	add    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	be 07 00 00 00       	mov    $0x7,%esi
   5:	48 c7 c7 60 40 40 a0 	mov    $0xffffffffa0404060,%rdi
   c:	e9 79 16 37 e1       	jmp    0xffffffffe137168a
  11:	00 00                	add    %al,(%rax)
  13:	00 00                	add    %al,(%rax)
	...
[  111.229483][  T123] RSP: 0018:ffffc9000131fa28 EFLAGS: 00210202
[  111.230009][  T123] RAX: ffffffffa0408000 RBX: ffffffffa0404240 RCX: 0000000000000001
[  111.230724][  T123] RDX: 1ffffffff4081000 RSI: 00000000033000aa RDI: ffff8881000f5798
[  111.231510][  T123] RBP: ffff8881000f5780 R08: 0000000000000000 R09: ffff8883adbc41c0
[  111.232688][  T123] R10: ffffc9000131f7d8 R11: 0000000044cfc41c R12: 0000000000004000
[  111.233871][  T123] R13: 0000000000001000 R14: 0000000000000001 R15: dffffc0000000000
[  111.235059][  T123] FS:  0000000000000000(0000) GS:ffffffff840f3000(0063) knlGS:00000000f794fb00
[  111.236330][  T123] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  111.237286][  T123] CR2: ffffffffa014d4c8 CR3: 0000000157dad000 CR4: 00000000000406f0
[  111.238490][  T123] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  111.239688][  T123] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  111.240875][  T123] Call Trace:
[  111.241467][  T123]  <TASK>
[ 111.241996][ T123] ? __die_body (arch/x86/kernel/dumpstack.c:421)
[ 111.242696][ T123] ? _sub_D_65535_0 (drivers/video/fbdev/core/fb_sys_fops.c:18) fb_sys_fops
[ 111.244067][ T123] ? page_fault_oops (arch/x86/mm/fault.c:710)
[ 111.244870][ T123] ? show_fault_oops (arch/x86/mm/fault.c:643)
[ 111.245708][ T123] ? preempt_count_sub (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:5886)
[ 111.246492][ T123] ? fixup_exception (arch/x86/mm/extable.c:321)
[ 111.247267][ T123] ? _sub_D_65535_0 (drivers/video/fbdev/core/fb_sys_fops.c:18) fb_sys_fops
[ 111.248716][ T123] ? _sub_D_65535_0 (drivers/video/fbdev/core/fb_sys_fops.c:18) fb_sys_fops
[ 111.250147][ T123] ? exc_page_fault (arch/x86/mm/fault.c:1479 arch/x86/mm/fault.c:1539)
[ 111.250915][ T123] ? asm_exc_page_fault (arch/x86/include/asm/idtentry.h:623)
[ 111.251767][ T123] ? _sub_D_65535_0 (drivers/video/fbdev/core/fb_sys_fops.c:18) fb_sys_fops
[ 111.253215][ T123] do_init_module (kernel/module/main.c:2788 kernel/module/main.c:2862)
[ 111.254038][ T123] init_module_from_file (kernel/module/main.c:3519)
[ 111.254912][ T123] ? __ia32_sys_init_module (kernel/module/main.c:3495)
[ 111.255784][ T123] ? idempotent_init_module (kernel/module/main.c:3530)
[ 111.256700][ T123] ? __lock_release+0x10e/0x386
[ 111.257622][ T123] ? tracer_preempt_on (kernel/trace/trace_irqsoff.c:661)
[ 111.258504][ T123] idempotent_init_module (kernel/module/main.c:3531)
[ 111.259420][ T123] ? init_module_from_file (kernel/module/main.c:3523)
[ 111.260296][ T123] __do_sys_finit_module (include/linux/file.h:62 include/linux/file.h:83 kernel/module/main.c:3554)
[ 111.261141][ T123] __do_fast_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:386)
[ 111.261992][ T123] do_fast_syscall_32 (arch/x86/entry/common.c:411)
[ 111.262816][ T123] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127)
[  111.263888][  T123] RIP: 0023:0xf7fb6579
[ 111.264657][ T123] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
All code
========
   0:	b8 01 10 06 03       	mov    $0x3061001,%eax
   5:	74 b4                	je     0xffffffffffffffbb
   7:	01 10                	add    %edx,(%rax)
   9:	07                   	(bad)
   a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   e:	10 08                	adc    %cl,(%rax)
  10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241230/202412301440.1888e8e1-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

