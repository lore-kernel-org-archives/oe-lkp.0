Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1091FBC9B
	for <oe-lkp@lists.linux.dev>; Tue, 12 Nov 2024 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731421948; cv=fail; b=S3ZMnGLiIx1+tuJg9D6yeMuL8dAjyATsM13mebJx/gkfeHaYVi4WoIb0+dSdQojd0xZ8ShIXxJjzaMnGoXmtK0o0gjv20rKE1MB0KbWNAYfk15h+kv2+hs4RhY2re5QkTSBqB9y8x48Y/HpcRcplICgnpAJ45NgC4V4y37TOZxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731421948; c=relaxed/simple;
	bh=fJerlmAKUh2rhhv36ipRf5NsywbfmzMuotxkp0VJzAI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=f12so/nnchdYzcYqzbgcAPlS54tlcG3mhnhMC46FWr9a2p9ZRSHBb2q+LAynB1iYIMTDjgs4eqGCJU2eUtjUS+zdRrBmkEbJrAXJPPB1N3/dBL9IAfAcqL81Vv0gBAafSfwe9UvUqFAub84bOOHQ4KX/IaRrUeDw6bH5lNvSuZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRhpBFvE; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRhpBFvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731421945; x=1762957945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJerlmAKUh2rhhv36ipRf5NsywbfmzMuotxkp0VJzAI=;
  b=iRhpBFvELD5S/dv+wrUdLrbH+ggxtl2VVcOr72jQjUIcUw+yULnl1r34
   ryM+WhEqdN5TQRUvGE2G7Ul+jfLRJ9rAao05w5z3rJVdzlKwc6pNCZaMR
   D5c7KjRX0CASCJ6KGe4KmhgGabDF1Ytu/6kRGHZfoF/T9JFMB8aeQVmZR
   wUNJY+ShTo0FyY3lsbnpFcwhGmZvmZvdG63nyQOby1bWTTWRQMiIa7rpr
   uj4XpX/SXaf++jA5ZbYNWejxKSHzVkQ/MqKBDwnK/1EJNsnXVX9xpUow2
   dcqLdN8FhSQq5cYrQqO6dZl1VJXW3KJCBQjj0HXLr/xK2s3zceAuCsNCp
   g==;
X-CSE-ConnectionGUID: T5xT+gaHQj6zA8SduBq6/Q==
X-CSE-MsgGUID: i7NwaivrTHyFOW7SWR/xQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35046062"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="35046062"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 06:32:25 -0800
X-CSE-ConnectionGUID: XlkN/Yz7QJmR7zpnQpgqrQ==
X-CSE-MsgGUID: aDzgAaMtRPqzPEQkJZX6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="92570186"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2024 06:32:24 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 06:32:24 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 06:32:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 06:32:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYkJiPaUo/tR2/vBbI4e0yhkzu7DN8WGIEtpzaeKZmqR3vvS9aQIDDLCEJHxolKOqTdPOAfzklRrVWOCrnVaGI9Ro2eYm6EH9xFa/WbxUc7F53b5TFJXIOWmt37QRDGkS4dUfe3Pd4NQ18DAX6+q9Ztcfs/+0BCKG+ebkhFeMNw+rVzxGL9F0IKsHmTpk9vLfewj4BY9uExR/6ghnz7/X2chZUDsUGiN9rriuq5VGjN/bUCCZrA2cC7cUGKroeiw4S0bOZj4T/9fj5iVYkdLf6Qt4YHg42IRANyMhEdBcJs4ekW5w0xNYXPHuiAfO2gSZdr+WP/1QrYNirdd+R1h2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p7Qc00kNtVffzUWsNSkyfnFZSmaA/RH5GZYL9Q0/pE=;
 b=wLuFGpIkaZHJrW2kN7YNUrLrHG8PGURUK/tqGD20g/jY+3zvMUZhRNVYlqAiGPrWoqljj6RmlWQKNcKJpysmj6sotHcTD4MU4WPy6aSQWuQKoM/g+3atMDE88K8+GE+EPrKme/u1NkQCGdyCpfeDjIBnanY8zhSO/kJdWFvbqqQ+Ac0HDJXsly5e/8A2nvavE10tqOtmNaP8BsDjHSPMSbjdLdXSiWo0Ftu8It8b1+sXkOM/Ma09JWqwYPj1NkbVCJH3941BNA6LaeMr4hntNwyONYSpAk9fbEnLJB0pJaYPBebCfN5/XZAemQ9B82iXwAoihSSRxB7QAo90soDpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 14:32:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 14:32:20 +0000
Date: Tue, 12 Nov 2024 22:32:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [freescale-fslc:pr/562] [mm]  31df8bc4d3:
 UBSAN:signed-integer-overflow_in_include/linux/atomic-arch-fallback.h
Message-ID: <202411122156.5144de50-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f80696f-526e-4188-32c7-08dd0326d0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZZq9lTC2JSV3JsO8iC8qtSwbGMkVjlYXuz1L8VaudlLCXUxDxLL3vUB0fsZy?=
 =?us-ascii?Q?glAy926dIFUnbmaJPy1/yoR0WrMqqTciVcx5Dsgj/iARromNQlhcilOrKx+T?=
 =?us-ascii?Q?LLRlM3JUS2T3SGm+firIEVM7owBzO+WSu2EUT213ySEDkLFZ7b/v5Owln+Jv?=
 =?us-ascii?Q?lK15KjnjeIp9mlb3tVl/Ub1X9i1TkZKyz483PMXX0d/6VqiINz3rpR7PG7Yi?=
 =?us-ascii?Q?YSiOMx4vH2FEGWaa1MZ1/Q+s8A17DaGbEeKTBZQ2JX/gwIvuMtxQOzWgewsW?=
 =?us-ascii?Q?O5Si3t/XPbZrducfDRVAft3tuxzbXAn8ZzrQJVex0QQIJQaGvfVezw/GQk45?=
 =?us-ascii?Q?Cdxv3JX4XudmhH2S3FvGS1K/+1VhaI1Irv9/exUOcrRrbrp22pAd2fZSSZ1m?=
 =?us-ascii?Q?yovGWk/QzAY3C7UiFy/IMZciCAs8aH6BZtCmgobOizYgDpHVFD0QPX8dPsEe?=
 =?us-ascii?Q?5YL5wUpAbxbE+zgsikr0yS19cacsSdjhI+OVt+GEzkSpcS//tf97cYVOWPP6?=
 =?us-ascii?Q?aMcR9CMYbDbg2/+vFcEyLVmUHX3dslUnjQJuD2CJBvwLcKr0bvJl8zxLT8DJ?=
 =?us-ascii?Q?dUbk5DurgjlKw5NyxtYjhUbkRu2QqG5Iu0/alWYRHE9bv8BumIgt2Mi1GknF?=
 =?us-ascii?Q?Bx7sMeSbyzFpyvDoOUnOl4VDT8u1NqQhIJkqZFyUi0uh07w0NCet/vNyV0kV?=
 =?us-ascii?Q?7j45hZZCLSz9RYBDiq55Irx3ab0CH53CWGmC1dCxSwexAXlGK1K+mm2noRUS?=
 =?us-ascii?Q?1tRV+EnmxDsRp/jVMwtqwPYSt0jM4II6Dg9H98wdkxR/PA3GKSze1iKYYt/j?=
 =?us-ascii?Q?m5e+eAlGjMfyBO5p4nHeyA9UR49O26Ae2KDebLvjPC3VAwosVDemuUTzsbGj?=
 =?us-ascii?Q?5FWfBqYizyFMhSxr7pjXkzWE1bpVdZMCpeYCPWrd1oogdzyr/lgDHyXOxbm+?=
 =?us-ascii?Q?Xo4veiaxvoBNl2iGvIq6/7A9jGMgu/dfEUpU2jK+5DFkOIYuXeFS9cF+2CAq?=
 =?us-ascii?Q?IKYIOfrWElHb3YMzxlyOfct42lHdMFtYpB+3aUUiWPAESyJgSkGWtc7p4g5P?=
 =?us-ascii?Q?ys5Q3ZSRh89AXxJRum/uQ+/G27T6O+9ocrxVys6CZMVMlwiicKpte32xUU2f?=
 =?us-ascii?Q?GPVCIGsZsxMEJzLzMjMNvrVpUMqHIkx0T2g8uIMSd+javashH1zfaUAfr/l7?=
 =?us-ascii?Q?TTTKGzxnKDCzAIraKFKTnbb6S9kcvw9elhnSqzM9Wkr8XnUMq2G04dijt+L8?=
 =?us-ascii?Q?SolMu0yfCLxVjzLZ+UR3de5JCuQT3dzeu2Z+73Wu0EqPO29zxteDvL0Gny8j?=
 =?us-ascii?Q?zlbL7inTdiFNYqiiJI191BIw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nsiViljqAepFYN92dW/Kan2tlEN6kbJ1pzKehrVBiSHbyRmfRIQJGDL/nZfH?=
 =?us-ascii?Q?vwouzmoi60WcWgD6L2+YBKy/m0BMUock3OSeX4hn4DxgAiR+84m2Kg1U1Sak?=
 =?us-ascii?Q?1BXPHAC65HYvtBOYxouNQQwqAvdKQJC9zQ1Ys9ZhNSU1z2oxllQd+closx9O?=
 =?us-ascii?Q?IHScscCTaHRRrT0LIAMMVDpIGpLejb9Yeeh77IelhYIjNVM88M3ZwDWqTWhA?=
 =?us-ascii?Q?rI7YgkyOXGvB22f5kttqUZviAjtjWWnRaiYuXTKIug4gqEn1nmjbocWPhuET?=
 =?us-ascii?Q?N1Bl3Xyu4FqGWfCFHRkv/LcvSzvNj+TQpDqbFLTDGWrBPxj33ueblA8sY4Vy?=
 =?us-ascii?Q?fG+QgcbTrkCg409VzttYiCVK9rucGuEZg6X28uJY22MhV9FcpFwZdXaG7fxp?=
 =?us-ascii?Q?Cec47dZD4ITt8QqraDR15WyyUorPlHq6Rb7lsCNT1Lur/V3Atnm+TeLY3zq/?=
 =?us-ascii?Q?XlSugeTvYNy2bQ0bo48/DIIaySOy5bqKrKJQM62a3vURXxg96qhlC07Htgmm?=
 =?us-ascii?Q?GZekAAcFtEaW4bi2fAShNNq73SSwXJPuzGh4nlIZvz4SJyfR4nrgmBarp5Xs?=
 =?us-ascii?Q?x4D4Zzrh0+L6RtQvZk4O0kfhG8YATslikPjqFclSs6/kYJB6dwFCWdMxxNJP?=
 =?us-ascii?Q?vQF4s7s2lkpPUYJ1ymnqVja28dB+4kKVAk/MJuN9FObokddWiltiIZgdSMRJ?=
 =?us-ascii?Q?U9sVUvkbfLDuFRmSC4G0dm9dh6OcTCFgJ9/Pb2gmeOFmTZaOWZpPIpTT8Xgh?=
 =?us-ascii?Q?a4HDnSkEky9mvnnOeXtVa1pUW4Dvz3OQ6f6cBZ6UMUSuy+fRkzU3sGxnNwBR?=
 =?us-ascii?Q?4m89i3vr/hyarPTDvt1KdFHjBCklqOJbGV7jhzpJyQvXlBgxyACi6h/D6TMF?=
 =?us-ascii?Q?bL4f5xH5nrxFChOwqygluVAAtBTSZ8o9lzCH/NcYawnbPDt+ufKIwVmxWlwy?=
 =?us-ascii?Q?cp01p6LK+VdMTaNZyGosOVcprZ0rnqOmyaNkJisHVCLcV3QMYLLUUvvMOxrK?=
 =?us-ascii?Q?w+UCSqENckbW2QSujwjfRESyW92yS6uoP1RSUStZ4IyLiqUUI8iv/XrOTWHN?=
 =?us-ascii?Q?3iDyEnMq1otwJ2T/lKV0ClMLK3Nmk0ubrCOQePgEsaUdvvF0kD2jeXWrBrCm?=
 =?us-ascii?Q?E/vmTs9qJpPDlv4puqlYju8iMOFx52nxwjfNvSQBohwtJFFgjlC1RGcrODNy?=
 =?us-ascii?Q?VCS487zuUFSn56AxU237iP9Zl45z6yU75sWUez25MDBX7hISAP7bJwcOjeCA?=
 =?us-ascii?Q?Ssm8XUE5jq27cnUen7gYSUii4p5vNhpcqOKDEbX1WQMTQ5jq/Ok/VvUvFXl9?=
 =?us-ascii?Q?Sn5jEPdeN8jgNEweE0uIV//Y6PtWCj4t9GBgXjYpXBrUq9/0yqjOLKPoctpx?=
 =?us-ascii?Q?/WyNB/PXBGlJriWrr5T9D1465uIBVNQycyxXv33HeAaiQIlcCl8K/jqkntZw?=
 =?us-ascii?Q?y3aQOQPV0QdI8ZJxE0oBuOQ3lFkrG2z+Vw0hk/V7WFd3LvdtQLYh1olUprYq?=
 =?us-ascii?Q?gAsGQ4y8ri/opBLkS8BzRThYjNdnTE7VINBdFsaNfEX72dfuiM9ugDSKCIuK?=
 =?us-ascii?Q?hI+0V3B7UFh3pWjHqmFz2VeOtIvYKvf5bK4OTTAjvsHG3wOa1ZdfzquxF3LM?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f80696f-526e-4188-32c7-08dd0326d0f2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 14:32:20.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7mGWKNu7H0upYLniub6CTq9gwhFN831GVoj1GEu/5HLN4FfgzFOP3t8sybkaOk5xklxdztJt/SUrQUtWhaXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:signed-integer-overflow_in_include/linux/atomic-arch-fallback.h" on:

commit: 31df8bc4d3feca9f9c6b2cd06fd64a111ae1a0e6 ("mm: memcontrol: slab: fix obtain a reference to a freeing memcg")
https://github.com/Freescale/linux-fslc pr/562

in testcase: boot

config: i386-randconfig-011-20241105
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------------------------+------------+------------+
|                                                                       | 2e95bc6cfe | 31df8bc4d3 |
+-----------------------------------------------------------------------+------------+------------+
| UBSAN:null-ptr-deref_in_drivers/acpi/acpica/tbfadt.c                  | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_mm/memcontrol.c                    | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_net/core/net_namespace.c           | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_include/net/netns/generic.h        | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_drivers/acpi/pci_link.c            | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_include/linux/memcontrol.h         | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_net/ipv4/fib_trie.c                | 6          | 6          |
| UBSAN:array-index-out-of-bounds_in_mm/mmu_gather.c                    | 6          | 6          |
| UBSAN:signed-integer-overflow_in_include/linux/atomic-arch-fallback.h | 0          | 6          |
+-----------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411122156.5144de50-lkp@intel.com


[  OK  ] Finished Helper to synchronize boot up for ifupdown.
Starting Raise network interfaces...
[   12.786427][    C0] ================================================================================
[   12.787953][    C0] UBSAN: signed-integer-overflow in include/linux/atomic-arch-fallback.h:1093:45
[   12.789450][    C0] 2147483647 + 1 cannot be represented in type 'int'
[   12.790363][    C0] CPU: 0 PID: 194 Comm: ifup Not tainted 5.10.36-00517-g31df8bc4d3fe #1
[   12.791536][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   12.792961][    C0] Call Trace:
[   12.793478][    C0]  <SOFTIRQ>
[ 12.794000][ C0] dump_stack (arch/x86/include/asm/atomic.h:41 include/asm-generic/atomic-instrumented.h:46 lib/dump_stack.c:121) 
[ 12.794622][ C0] ? handle_overflow (lib/ubsan.c:183) 
[ 12.795336][ C0] handle_overflow (lib/ubsan.c:149 lib/ubsan.c:189) 
[ 12.796024][ C0] ? lock_acquire (kernel/locking/lockdep.c:5444) 
[ 12.796725][ C0] ? memcg_free_shrinker_map_rcu (include/linux/rcupdate.h:255) 
[ 12.797534][ C0] ? memcg_free_shrinker_map_rcu (include/linux/rcupdate.h:255) 
[ 12.798340][ C0] __ubsan_handle_add_overflow (lib/ubsan.c:196) 
[ 12.799140][ C0] percpu_ref_tryget (include/linux/atomic-arch-fallback.h:1093 include/linux/atomic-arch-fallback.h:1113 include/asm-generic/atomic-instrumented.h:789 include/asm-generic/atomic-long.h:985 include/linux/percpu-refcount.h:247 include/linux/percpu-refcount.h:266) 
[ 12.799861][ C0] drain_obj_stock (mm/memcontrol.c:3170) 
[ 12.800557][ C0] refill_obj_stock (mm/memcontrol.c:3227) 
[ 12.801271][ C0] obj_cgroup_uncharge (mm/memcontrol.c:3275) 
[ 12.801984][ C0] memcg_slab_free_hook (mm/slab.h:383) 
[ 12.802733][ C0] ? sock_free_inode (net/socket.c:275) 
[ 12.803439][ C0] kmem_cache_free (mm/slub.c:3095) 
[ 12.804136][ C0] sock_free_inode (net/socket.c:275) 
[ 12.804824][ C0] i_callback (fs/inode.c:226) 
[ 12.805450][ C0] rcu_core (kernel/rcu/tree.c:2486) 
[ 12.806085][ C0] rcu_core_si (kernel/rcu/tree.c:2733) 
[ 12.806707][ C0] __do_softirq (kernel/softirq.c:298 include/linux/jump_label.h:200 include/trace/events/irq.h:142 kernel/softirq.c:299) 
[ 12.807369][ C0] ? do_softirq_own_stack (arch/x86/kernel/irq_32.c:59 arch/x86/kernel/irq_32.c:148) 
[ 12.808086][ C0] ? __entry_text_end (kernel/softirq.c:256) 
[ 12.808765][ C0] do_softirq_own_stack (arch/x86/kernel/irq_32.c:59 arch/x86/kernel/irq_32.c:148) 
[   12.809481][    C0]  </SOFTIRQ>
[ 12.809996][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1095) 
[ 12.810833][ C0] __irq_exit_rcu (kernel/softirq.c:395 kernel/softirq.c:423) 
[ 12.811527][ C0] irq_exit_rcu (kernel/softirq.c:437) 
[ 12.812160][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1095) 
[ 12.812988][ C0] handle_exception (arch/x86/entry/entry_32.S:1172) 
[ 12.813702][ C0] EIP: _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:84 include/linux/spinlock_api_smp.h:161 kernel/locking/spinlock.c:191) 
[ 12.814549][ C0] Code: 89 d6 8b 55 c0 10 e8 eb c0 10 e8 eb f8 e8 44 83 f8 e8 44 83 00 02 00 00 00 02 00 00 b4 5a ff 89 b4 5a ff 89 f4 9d 64 ff f4 9d <64> ff c2 83 c4 04 c2 83 c4 04 66 90 55 89 66 90 55 89 04 89 c6 83
All code
========
   0:	89 d6                	mov    %edx,%esi
   2:	8b 55 c0             	mov    -0x40(%rbp),%edx
   5:	10 e8                	adc    %ch,%al
   7:	eb c0                	jmp    0xffffffffffffffc9
   9:	10 e8                	adc    %ch,%al
   b:	eb f8                	jmp    0x5
   d:	e8 44 83 f8 e8       	call   0xffffffffe8f88356
  12:	44 83 00 02          	rex.R addl $0x2,(%rax)
  16:	00 00                	add    %al,(%rax)
  18:	00 02                	add    %al,(%rdx)
  1a:	00 00                	add    %al,(%rax)
  1c:	b4 5a                	mov    $0x5a,%ah
  1e:	ff 89 b4 5a ff 89    	decl   -0x7600a54c(%rcx)
  24:	f4                   	hlt
  25:	9d                   	popf
  26:	64 ff f4             	fs push %rsp
  29:	9d                   	popf
  2a:*	64 ff c2             	fs inc %edx		<-- trapping instruction
  2d:	83 c4 04             	add    $0x4,%esp
  30:	c2 83 c4             	ret    $0xc483
  33:	04 66                	add    $0x66,%al
  35:	90                   	nop
  36:	55                   	push   %rbp
  37:	89 66 90             	mov    %esp,-0x70(%rsi)
  3a:	55                   	push   %rbp
  3b:	89 04 89             	mov    %eax,(%rcx,%rcx,4)
  3e:	c6                   	.byte 0xc6
  3f:	83                   	.byte 0x83

Code starting with the faulting instruction
===========================================
   0:	64 ff c2             	fs inc %edx
   3:	83 c4 04             	add    $0x4,%esp
   6:	c2 83 c4             	ret    $0xc483
   9:	04 66                	add    $0x66,%al
   b:	90                   	nop
   c:	55                   	push   %rbp
   d:	89 66 90             	mov    %esp,-0x70(%rsi)
  10:	55                   	push   %rbp
  11:	89 04 89             	mov    %eax,(%rcx,%rcx,4)
  14:	c6                   	.byte 0xc6
  15:	83                   	.byte 0x83
[   12.817126][    C0] EAX: 000020b9 EBX: c3a88040 ECX: 00000000 EDX: 00000000
[   12.818119][    C0] ESI: 00200206 EDI: c30b65f8 EBP: ecdb3e88 ESP: ecdb3e7c
[   12.819126][    C0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00200206
[ 12.820214][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1095) 
[ 12.821044][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1095) 
[ 12.821853][ C0] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:84 include/linux/spinlock_api_smp.h:161 kernel/locking/spinlock.c:191) 
[ 12.822674][ C0] debug_check_no_obj_freed (lib/debugobjects.c:997) 
[ 12.823470][ C0] slab_free_freelist_hook (mm/slub.c:1533 mm/slub.c:1574) 
[ 12.824257][ C0] ? putname (fs/namei.c:260) 
[ 12.824893][ C0] kmem_cache_free (mm/slub.c:3139) 
[ 12.825584][ C0] putname (fs/namei.c:260) 
[ 12.826185][ C0] do_execveat_common (fs/exec.c:1922) 
[ 12.826886][ C0] ? getname_flags (fs/namei.c:149) 
[ 12.827536][ C0] __ia32_sys_execve (fs/exec.c:2054) 
[ 12.828185][ C0] __do_fast_syscall_32 (arch/x86/entry/common.c:77 arch/x86/entry/common.c:140) 
[ 12.828908][ C0] do_fast_syscall_32 (arch/x86/entry/common.c:165) 
[ 12.829624][ C0] do_SYSENTER_32 (arch/x86/entry/common.c:208) 
[ 12.830296][ C0] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:953) 
[   12.830974][    C0] EIP: 0xb7fba0b0
[ 12.831528][ C0] Code: Unable to access opcode bytes at RIP 0xb7fba086.

Code starting with the faulting instruction
===========================================


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241112/202411122156.5144de50-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

