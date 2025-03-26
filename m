Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F733F9
	for <oe-lkp@lists.linux.dev>; Wed, 26 Mar 2025 07:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742973379; cv=fail; b=kQde4vTbLEu+TkAHdipkrJQVZfF2/ZqZfWRnIyLJ16/7847yd0W/R4ZGjW2Mh4RS/FEKRJcci1PUhlQWhmhBIORfYvD1dfSKgmuj5h2lbiBtYBk6EcjtIqoz3kVakA/ik4fyZ65ekM4tFNbNRdc7xjoHYCLRyZE2JokDt48AfDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742973379; c=relaxed/simple;
	bh=29SnpCJw0yRTziwRfQa3ZR1wwg81TkWuXrpvGiEZmHs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tlkpyZEJrKOIsaDQtKkrgvWCgljYwy7hZU63/c8VDJ9OTZPpUnD/BUcqJwxjECFgJ6Z+j2zagAqow5f5+a4n2usY2p/D6QndHGr3Eqm+bLwkyAkhp1DVQ3LA1rQElr4RXVXg+XNZwqzJwDIfkNZ0Fq634Dda9q4dVSvdYvjHlPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjIxu/1S; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjIxu/1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742973377; x=1774509377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=29SnpCJw0yRTziwRfQa3ZR1wwg81TkWuXrpvGiEZmHs=;
  b=NjIxu/1SgnBMQqpr74iw9UByI1l5SRXeXo1Y0ZWV5rcuk64Y87hRCaf7
   wNDe3CJ/2tgqo/2GhWhsvRBwysZHESkF52uJtJB0LvqzaqpnzxZSbq243
   a/qXxAA7KUB7gl6wDke2louBp2qtTMFtneuQ7E0W9OqfJQZMUtWo5UU8Q
   CstzzTP9iyjYb1PnCynQwSI5MEiZ/OQtTNGJhRLOhUDgmHa/aTpBw5kWf
   Hrtm9CnYF1RvFAeUPhheOx9qNyhFXuXVBC2kErcDwDTrdUyNUCTnMHKCw
   4IzXVz2g7owMOAjoe/joQQcv59xXsSU62i0qnLexcw6DqJLL8/jvdl8ND
   w==;
X-CSE-ConnectionGUID: 9ekzdoC/SwGv+YqwGRgOXA==
X-CSE-MsgGUID: L80RczreSWaQfAoGd1Z8oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61765763"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="61765763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 00:16:14 -0700
X-CSE-ConnectionGUID: JR9Ywaq2SxyKDDt4hroG9Q==
X-CSE-MsgGUID: b3dDvehOTf6hZl6Dg0xNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="125473756"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 00:16:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 00:16:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 00:16:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 00:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFT+XFyXdbpmjw+xQfgk9nK8PnRnZsgc//NQ8tMfMg18mONur5UXIKLvULXIschjuIyMaVSU0AoO6A/FPLHqWGhKih5uI5HCVhpK4dXPzYYd5aA55kR+kxP5dki0I2aWT2+5fGLldS82KlPjneaeYu6+DGUpm5p0qYwLhodvvyp1k0OYPu6omtqr0HoVir5DkzIFZCcakcJavD0me+uOxOOHqznZ1IPezRPO6v3YtMsXg3QwvIhbdSiO+eSAL3rF6Z6BCut5QX2rBrovcVDZMDnHO+E8/qBeWKHiWODpp7ciHNy6Z6nFjnazo4k35dlbFAP15Xpu+cZUw2WSKsXN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA58P5XmvNBN4CzTq3IFTY6WFDCifcyJLKNyOCqDKts=;
 b=DozxUPQbJIL5WXrU7QRd6mgb1LKIOW3iNHmYhIXYNU9fwptRLV6o5hL2rwEbBnuGAF+3kXtseUCsYnqANzyajzf2867rWg8MdljWl1Q6nry8XWk7IuVMeefcroLd9xwRWHmSJPL2ZCpYbJNTeMox6JQEaEea7AFLioQ1cFoKBn5Oh2tnM+bU/x2djXmXBrcUsUKdnqouzyQiDWIqZpZUJN5xstUwUxYCNCG8GmqV3QkfffRnimnEmAm+o6sHLYNofKCMncK/kvviXiPM9pbFI5pTDnPXrwAW8dYvBr+1xPhbAfz82hX6M06H2KyJGUo6RbnTGzUscJ7aJ75WUux7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 07:15:44 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 07:15:44 +0000
Date: Wed, 26 Mar 2025 15:15:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:irq/msi] [PCI/MSI]  a8be37c8af:
 BUG:KASAN:null-ptr-deref_in_msi_domain_first_desc
Message-ID: <202503261445.60275df-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0216.apcprd04.prod.outlook.com
 (2603:1096:4:187::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a5d674-ab34-461a-4656-08dd6c3605fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?obeFA1smmVgqeynUz3rXeO6PDc6JURPN2RaKTzmxYnq1S/VZM2ARphwG7mB8?=
 =?us-ascii?Q?hUZ2fjfJGfkcj3lRzOgU+3Wtic0tCZ4yhCXRNNi+VCZOQyFT36geg0Cb3Xqk?=
 =?us-ascii?Q?5+o3BQho9UQ4b0WBSmwpPdoF2o22RTBzcI4ACnHdTS08OILHu7cPHjQzRZ6b?=
 =?us-ascii?Q?NNtTisVON2zieOxXEzx/zdCEVGkO3a28dFloSaRQ7fqtl8X6MLOYLum6Z0O3?=
 =?us-ascii?Q?HEvg5utm5c9V31CrLncI+Dv4/FaZo1lU5grPx4WhLbt6ng1Ke/vcKgic2yg3?=
 =?us-ascii?Q?cd+asPY1zKW55we8ROr7AB0uyYluOm2RU6terAyoo632G9CGSgYjf82DtgZv?=
 =?us-ascii?Q?Q81F1IJR1dXLkjeEEx6SqjWO/lI5Eb+NNsJRjUftxOTpxGdJu8FVofDNsa/e?=
 =?us-ascii?Q?OBpUUY4ia6ytGU5kPBL9LKf5yZpFcclgz/Nr8rS+7bdRDnjUD2DPmE81TGZE?=
 =?us-ascii?Q?ewkr5SRVi91AZs4jz7q58eDSUzpQcw1yT8wNIBCcV661jXeVka14ew6tOtdX?=
 =?us-ascii?Q?eebnnJhdRrtLTktnwggG8wZyWYlMJpKLn+CZQjoOFYNHcaRXjLlG1kI50aYw?=
 =?us-ascii?Q?uTHxYqQY6d1SI/uZ3u6STFKts16OED5fcZ3jYktLDOLQ6pS/xG1ux75PGtTl?=
 =?us-ascii?Q?z9LQ+CWOrmRyfPIX/mswjO5ncJUQtVSa40x6P3Nas42688KSHSnchTb3eRLu?=
 =?us-ascii?Q?03q86EpmejaYB/qEham0GBlVOygMKbdaayKKg3cLCpz5QxttpTm5OgexjAt3?=
 =?us-ascii?Q?kZUAtzbrlfhry9fhG7drXKsWII36G5JnPbIe3vxAezwZKaBkEGvTXzrckjYP?=
 =?us-ascii?Q?EEqzmDWGKPi8uDUCKtI1XWPQ6Ak6uWroRXGSCbqNdl7ylHf/ZBrfoUY8n0rz?=
 =?us-ascii?Q?f+aF+D+WY4AZKiAwBJBcFJ5+j3e3qKZCcKvmKFJ5b+PIgMg8U56X34WtjgyH?=
 =?us-ascii?Q?F9UT9zVWDS6gUCZddA55jM+LEapJpkHgaghpcAOfuJq8enPSbFefeQQG5QTM?=
 =?us-ascii?Q?9QVOKoWJ+HBR1+7bc9R9eKHcv4WGl4K9SFz/redIluxazeCDx0ZCTfvpNlZ1?=
 =?us-ascii?Q?Mml43jeSwarDkA74FVXPXp5q6xOwtXWjfqJ0Ycv9CaHCPTvOP8emsxfgaMq3?=
 =?us-ascii?Q?LDh7QkONHrf0xFG99A1s+v/zucKfaKDOzHo36l0SaUG7uxkD5X5x/O7BwugD?=
 =?us-ascii?Q?AWS4JtF6NS7ujub3MQgwDcTU10ICKoAmrrIeL8FR7L5xJvYtaxy1sSltOTYO?=
 =?us-ascii?Q?wyEk6diS5V/qJ8XWBlPGYvDwpHEt2jHL/FjgYj7LmHY9qD0MVOyT9CYsCoRG?=
 =?us-ascii?Q?s1/FJ+prEO2Ig+/tGUiOON8hACSgZ6E+skf2UGLPBpTYyOLf8+7HKpp9xqNX?=
 =?us-ascii?Q?50d45Q0uBoQEpnaRKkUAaFrZyEA6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C4fg+9sDym5K/f1UmD1sugOVkEzfzw8+vncBPAEswYFUtWetgDYy7pfVJsRv?=
 =?us-ascii?Q?9uamdRPLiXfjwkqv7xPRQ/jFisaOtK1hGogbvI+d3j6SSWdqz9sXQb/6u58r?=
 =?us-ascii?Q?3B2cAIVldLV0ypAu0dyb1fiUiUXaohIhfpCB36vvyEyRHsdA+Bx2OVCZvf0y?=
 =?us-ascii?Q?cw0YykSmBN0wTHjY//Oi8sIlyQ6+w4LV+1KArnFgvLXP/6uC1HhIrQ44jSE9?=
 =?us-ascii?Q?ifNA3HCy50r2o91bJabIJOl+THYzJcAC3HbRMncfqp5bqMCKHpytXsl781pJ?=
 =?us-ascii?Q?S+q6qeC/Nje2WsgoB7QtZqgG7VkVneHjgr+oKmocFRnxBwIy0Z4D/Y7hcC/U?=
 =?us-ascii?Q?1ONdxqTnGRxt8iOShDAcTiR0HbcbFybSJttml/SZ1wHSoS5nomHOLqJeDlKn?=
 =?us-ascii?Q?mD9nDXmGIhsUMB5EzT++jtS0KDAi1IWsZwUUunTXWwBvwOxTt/NTwGc/r15F?=
 =?us-ascii?Q?2bSfZ22tV1cjAZHqx0fd4D0Oh/f79x2nGkhKuKj9ICtA4S1GUyNHxH0y7QoB?=
 =?us-ascii?Q?LxNdEG5rQjV43zPX8IcBJpBRkthJODz463Y3AA2VXhSTWxCSvHpfqBZfwj7G?=
 =?us-ascii?Q?MAD4JuVznQXhhqgoStxbKJmIL7rf2JTyDvwxqx/eiHVwaXe/JP3hPCqtujUs?=
 =?us-ascii?Q?xoewgBkU0icht9r5QeEtC5nuZjuhXEYU23PTE3XtnPbw/BG9Pn3/bkD+GFvX?=
 =?us-ascii?Q?zUdUDVSjiR1fojI0copTpb0g97wJvBWYE6DZATxaSnMOaA5sKndJ66PGpST8?=
 =?us-ascii?Q?SlciOOM+CKPCus/KT6fBjoLbP0kJ79RyetzAKZG+81ZfAnbGxCpKkfyWITr2?=
 =?us-ascii?Q?SpMSEx0So7FAwjB3XhJhxElvoUgKcGDeGqlUwqadgkI+zHIj0a6T0OQ6mdui?=
 =?us-ascii?Q?OBv/qJy9lBNa544jqkaCz8rmAkzOgqfu0z79E0ZY3L6oHl4yBi+c+PmmSbiz?=
 =?us-ascii?Q?N0kfc5xdfoJZDfS3l/N3ujPdrxRWiI9xRsNmUOuh7nj43qMoD1Uc+SU+xlWb?=
 =?us-ascii?Q?s8oQgdCoYaQL7djmvzHEGjAdfslR2H5Ex8Mm57lyOzEmB0vnsYlrlNxwlyHE?=
 =?us-ascii?Q?gd0ECi1Pe79fIN7IqxOkNwXsrSDnxbudWgYFD3Xbp5AXFCiAtX+UU4DnXB/5?=
 =?us-ascii?Q?7smjZ/za48XaczaJSxJOSx7hAhbvUE4XeLp8h6GKFfIROgKUDW9vIiIqeWvG?=
 =?us-ascii?Q?hAU7W5ySPhldUN4zsFXjufe6AcKZYYPffKNEhnYI15a3l+hwOuQH5vlwhFQr?=
 =?us-ascii?Q?I2UmBjb+ZBYs6rHvzDdgPG8K2HNdJ26P7uvRdOkAcpPamMDnzDYlBnmsItLZ?=
 =?us-ascii?Q?EyPTA2cNNHN0vGTbtexvHiA6WpPqwI9UQ6s6aisR4PnwducpZKwrLsneKyHl?=
 =?us-ascii?Q?DtiqTY5zKlhDf0X4NYhuCAN168AxAeAZiHKs848k1mmchLP7c3War3oYh0QH?=
 =?us-ascii?Q?QsEwxo5iNg/KEbJ86Pbn8+QPbJhLbBFJPVPoBi/74T0TNG6bZ9tc2REhQ1/n?=
 =?us-ascii?Q?NTTg0iALLMRu4sZh0lWxWkdk/ku+KWDNi0qTo4mdKkiHKXXQbULhq/VjLlrT?=
 =?us-ascii?Q?3ElM8Dyo9+5NFuJYzAhnvfv+0R7qnmGeDaTxDWHf8FNXpGeF+nXSNp3ifcat?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a5d674-ab34-461a-4656-08dd6c3605fa
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 07:15:44.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3VuAJdE2NlEI22CUFSW0MStEKvktJZ23eaTZuHhXy1BLMnRqMewTA0KSz24lkp5y+xdmAsgJUaiqvn8rzSGTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:null-ptr-deref_in_msi_domain_first_desc" on:

commit: a8be37c8af2b8bf23f9f61bcf200a0a0f5a5c60d ("PCI/MSI: Switch msix_capability_init() to guard(msi_desc_lock)")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git irq/msi

in testcase: perf-fuzzer
version: perf-fuzzer-x86_64-a052241-1_20241227
with following parameters:

	runtime: 1h



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503261445.60275df-lkp@intel.com


[ 8.193820][ T1] BUG: KASAN: null-ptr-deref in msi_domain_first_desc (kernel/irq/msi.c:391) 
[    8.193820][    T1] Read of size 8 at addr 0000000000000440 by task swapper/0/1
[    8.193820][    T1]
[    8.193820][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc4-00011-ga8be37c8af2b #1
[    8.193820][    T1] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[    8.193820][    T1] Call Trace:
[    8.193820][    T1]  <TASK>
[ 8.193820][ T1] dump_stack_lvl (lib/dump_stack.c:124) 
[ 8.193820][ T1] kasan_report (mm/kasan/report.c:636) 
[ 8.193820][ T1] ? msi_domain_first_desc (kernel/irq/msi.c:391) 
[ 8.193820][ T1] msi_domain_first_desc (kernel/irq/msi.c:391) 
[ 8.193820][ T1] __pci_enable_msix_range (drivers/pci/msi/msi.c:647 drivers/pci/msi/msi.c:687 drivers/pci/msi/msi.c:698 drivers/pci/msi/msi.c:738 drivers/pci/msi/msi.c:844) 
[ 8.193820][ T1] ? __pfx___pci_enable_msix_range (drivers/pci/msi/msi.c:791) 
[ 8.193820][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:716) 
[ 8.193820][ T1] ? __kmalloc_cache_noprof (include/trace/events/kmem.h:54 mm/slub.c:4323) 
[ 8.193820][ T1] e1000e_set_interrupt_capability (drivers/net/ethernet/intel/e1000e/netdev.c:2067) 
[ 8.193820][ T1] e1000_sw_init (include/linux/slab.h:901 include/linux/slab.h:1037 drivers/net/ethernet/intel/e1000e/netdev.c:2633 drivers/net/ethernet/intel/e1000e/netdev.c:4448) 
[ 8.193820][ T1] e1000_probe (include/linux/dma-mapping.h:502 drivers/net/ethernet/intel/e1000/e1000_main.c:1001) 
[ 8.193820][ T1] ? __pfx_e1000_probe (drivers/net/ethernet/intel/e1000/e1000_main.c:921) 
[ 8.193820][ T1] ? hlock_conflict (kernel/locking/lockdep.c:234 kernel/locking/lockdep.c:223 kernel/locking/lockdep.c:2033) 
[ 8.193820][ T1] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4349 kernel/locking/lockdep.c:4408) 
[ 8.193820][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 8.193820][ T1] ? __pfx_e1000_probe (drivers/net/ethernet/intel/e1000/e1000_main.c:921) 
[ 8.193820][ T1] local_pci_probe (drivers/pci/pci-driver.c:325) 
[ 8.193820][ T1] pci_call_probe (drivers/pci/pci-driver.c:392) 
[ 8.193820][ T1] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352) 
[ 8.193820][ T1] ? pci_match_device (drivers/pci/pci-driver.c:159) 
[ 8.193820][ T1] ? pci_match_device (drivers/pci/pci-driver.c:166) 
[ 8.193820][ T1] pci_device_probe (drivers/pci/pci-driver.c:452) 
[ 8.193820][ T1] ? driver_sysfs_add (drivers/base/dd.c:451) 
[ 8.193820][ T1] really_probe (drivers/base/dd.c:581 drivers/base/dd.c:658) 
[ 8.193820][ T1] __driver_probe_device (drivers/base/dd.c:800) 
[ 8.193820][ T1] driver_probe_device (drivers/base/dd.c:831) 
[ 8.193820][ T1] __driver_attach (drivers/base/dd.c:1217) 
[ 8.193820][ T1] ? __pfx___driver_attach (drivers/base/dd.c:1157) 
[ 8.193820][ T1] bus_for_each_dev (drivers/base/bus.c:369) 
[ 8.193820][ T1] ? __pfx_bus_for_each_dev (drivers/base/bus.c:358) 
[ 8.193820][ T1] ? bus_add_driver (drivers/base/bus.c:677) 
[ 8.193820][ T1] bus_add_driver (drivers/base/bus.c:679) 
[ 8.193820][ T1] driver_register (drivers/base/driver.c:250) 
[ 8.193820][ T1] ? __pfx_e1000_init_module (drivers/net/ethernet/intel/e1000/e1000_main.c:218) 
[ 8.193820][ T1] do_one_initcall (init/main.c:1257) 
[ 8.193820][ T1] ? __pfx_do_one_initcall (init/main.c:1248) 
[ 8.193820][ T1] ? parse_one (kernel/params.c:139) 
[ 8.193820][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:716) 
[ 8.193820][ T1] ? __kmalloc_noprof (include/trace/events/kmem.h:54 mm/slub.c:4295 mm/slub.c:4306) 
[ 8.193820][ T1] ? do_initcalls (init/main.c:1329) 
[ 8.193820][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:716) 
[ 8.193820][ T1] do_initcalls (init/main.c:1318 init/main.c:1335) 
[ 8.193820][ T1] kernel_init_freeable (init/main.c:1572) 
[ 8.193820][ T1] ? __pfx_kernel_init (init/main.c:1449) 
[ 8.193820][ T1] kernel_init (init/main.c:1459) 
[ 8.193820][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 8.193820][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 8.193820][ T1] ? __pfx_kernel_init (init/main.c:1449) 
[ 8.193820][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[    8.193820][    T1]  </TASK>
[    8.193820][    T1] ==================================================================
[    8.490086][    T1] Disabling lock debugging due to kernel taint
[    8.496129][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000440
[    8.501846][    T1] #PF: supervisor read access in kernel mode
[    8.508881][    T1] #PF: error_code(0x0000) - not-present page
[    8.514834][    T1] PGD 0 P4D 0
[    8.517840][    T1] Oops: Oops: 0000 [#1] PREEMPT SMP KASAN PTI
[    8.523827][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Tainted: G    B              6.14.0-rc4-00011-ga8be37c8af2b #1
[    8.533874][    T1] Tainted: [B]=BAD_PAGE
[    8.538874][    T1] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[ 8.546850][ T1] RIP: 0010:msi_domain_first_desc (kernel/irq/msi.c:391) 
[ 8.550850][ T1] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 41 89 d4 55 89 f5 53 48 89 fb 48 81 c7 78 03 00 00 e8 a3 78 44 00 <48> 8b 9b 78 03 00 00 48 85 db 74 58 85 ed 75 54 48 c7 c7 14 70 71
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  12:	41 54                	push   %r12
  14:	41 89 d4             	mov    %edx,%r12d
  17:	55                   	push   %rbp
  18:	89 f5                	mov    %esi,%ebp
  1a:	53                   	push   %rbx
  1b:	48 89 fb             	mov    %rdi,%rbx
  1e:	48 81 c7 78 03 00 00 	add    $0x378,%rdi
  25:	e8 a3 78 44 00       	call   0x4478cd
  2a:*	48 8b 9b 78 03 00 00 	mov    0x378(%rbx),%rbx		<-- trapping instruction
  31:	48 85 db             	test   %rbx,%rbx
  34:	74 58                	je     0x8e
  36:	85 ed                	test   %ebp,%ebp
  38:	75 54                	jne    0x8e
  3a:	48                   	rex.W
  3b:	c7                   	.byte 0xc7
  3c:	c7                   	(bad)
  3d:	14 70                	adc    $0x70,%al
  3f:	71                   	.byte 0x71

Code starting with the faulting instruction
===========================================
   0:	48 8b 9b 78 03 00 00 	mov    0x378(%rbx),%rbx
   7:	48 85 db             	test   %rbx,%rbx
   a:	74 58                	je     0x64
   c:	85 ed                	test   %ebp,%ebp
   e:	75 54                	jne    0x64
  10:	48                   	rex.W
  11:	c7                   	.byte 0xc7
  12:	c7                   	(bad)
  13:	14 70                	adc    $0x70,%al
  15:	71                   	.byte 0x71
[    8.570843][    T1] RSP: 0000:ffff888100c1f7a8 EFLAGS: 00010282
[    8.577865][    T1] RAX: 0000000000000001 RBX: 00000000000000c8 RCX: ffffffff81344a16
[    8.586005][    T1] RDX: fffffbfff0cf9041 RSI: 0000000000000008 RDI: ffffffff867c8200
[    8.591849][    T1] RBP: 0000000000000000 R08: 0000000000000001 R09: fffffbfff0cf9040
[    8.601846][    T1] R10: ffffffff867c8207 R11: 0000000000000001 R12: 0000000000000000
[    8.608847][    T1] R13: ffff888103b8e06e R14: 0000000000000000 R15: ffff888103b8e0c8
[    8.616848][    T1] FS:  0000000000000000(0000) GS:ffff888361b00000(0000) knlGS:0000000000000000
[    8.625856][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.631844][    T1] CR2: 0000000000000440 CR3: 000000041a46e001 CR4: 00000000001706f0
[    8.640869][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    8.647845][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    8.656854][    T1] Call Trace:
[    8.659849][    T1]  <TASK>
[ 8.661844][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 8.665870][ T1] ? page_fault_oops (arch/x86/mm/fault.c:714) 
[ 8.670865][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
[ 8.675874][ T1] ? asm_exc_page_fault (arch/x86/include/asm/idtentry.h:574) 
[ 8.680845][ T1] ? add_taint (arch/x86/include/asm/bitops.h:60 include/asm-generic/bitops/instrumented-atomic.h:29 kernel/panic.c:605) 
[ 8.684842][ T1] ? msi_domain_first_desc (kernel/irq/msi.c:391) 
[ 8.689846][ T1] ? msi_domain_first_desc (kernel/irq/msi.c:391) 
[ 8.694839][ T1] __pci_enable_msix_range (drivers/pci/msi/msi.c:647 drivers/pci/msi/msi.c:687 drivers/pci/msi/msi.c:698 drivers/pci/msi/msi.c:738 drivers/pci/msi/msi.c:844) 
[ 8.699849][ T1] ? __pfx___pci_enable_msix_range (drivers/pci/msi/msi.c:791) 
[ 8.703895][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:716) 
[ 8.709843][ T1] ? __kmalloc_cache_noprof (include/trace/events/kmem.h:54 mm/slub.c:4323) 
[ 8.714844][ T1] e1000e_set_interrupt_capability (drivers/net/ethernet/intel/e1000e/netdev.c:2067) 
[ 8.721874][ T1] e1000_sw_init (include/linux/slab.h:901 include/linux/slab.h:1037 drivers/net/ethernet/intel/e1000e/netdev.c:2633 drivers/net/ethernet/intel/e1000e/netdev.c:4448) 
[ 8.726846][ T1] e1000_probe (include/linux/dma-mapping.h:502 drivers/net/ethernet/intel/e1000/e1000_main.c:1001) 
[ 8.730845][ T1] ? __pfx_e1000_probe (drivers/net/ethernet/intel/e1000/e1000_main.c:921) 
[ 8.734883][ T1] ? hlock_conflict (kernel/locking/lockdep.c:234 kernel/locking/lockdep.c:223 kernel/locking/lockdep.c:2033) 
[ 8.740848][ T1] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4349 kernel/locking/lockdep.c:4408) 
[ 8.745845][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 8.750839][ T1] ? __pfx_e1000_probe (drivers/net/ethernet/intel/e1000/e1000_main.c:921) 
[ 8.756845][ T1] local_pci_probe (drivers/pci/pci-driver.c:325) 
[ 8.760842][ T1] pci_call_probe (drivers/pci/pci-driver.c:392) 
[ 8.764880][ T1] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352) 
[ 8.770845][ T1] ? pci_match_device (drivers/pci/pci-driver.c:159) 
[ 8.774845][ T1] ? pci_match_device (drivers/pci/pci-driver.c:166) 
[ 8.780843][ T1] pci_device_probe (drivers/pci/pci-driver.c:452) 
[ 8.782886][ T1] ? driver_sysfs_add (drivers/base/dd.c:451) 
[ 8.788844][ T1] really_probe (drivers/base/dd.c:581 drivers/base/dd.c:658) 
[ 8.794875][ T1] __driver_probe_device (drivers/base/dd.c:800) 
[ 8.799888][ T1] driver_probe_device (drivers/base/dd.c:831) 
[ 8.804882][ T1] __driver_attach (drivers/base/dd.c:1217) 
[ 8.808838][ T1] ? __pfx___driver_attach (drivers/base/dd.c:1157) 
[ 8.814884][ T1] bus_for_each_dev (drivers/base/bus.c:369) 
[ 8.818845][ T1] ? __pfx_bus_for_each_dev (drivers/base/bus.c:358) 
[ 8.823864][ T1] ? bus_add_driver (drivers/base/bus.c:677) 
[ 8.828881][ T1] bus_add_driver (drivers/base/bus.c:679) 
[ 8.833867][ T1] driver_register (drivers/base/driver.c:250) 
[ 8.838867][ T1] ? __pfx_e1000_init_module (drivers/net/ethernet/intel/e1000/e1000_main.c:218) 
[ 8.843898][ T1] do_one_initcall (init/main.c:1257) 
[ 8.848877][ T1] ? __pfx_do_one_initcall (init/main.c:1248) 
[ 8.853866][ T1] ? parse_one (kernel/params.c:139) 
[ 8.857844][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:716) 
[ 8.862895][ T1] ? __kmalloc_noprof (include/trace/events/kmem.h:54 mm/slub.c:4295 mm/slub.c:4306) 
[ 8.868070][ T1] ? do_initcalls (init/main.c:1329) 
[ 8.871843][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:716) 
[ 8.876854][ T1] do_initcalls (init/main.c:1318 init/main.c:1335) 
[ 8.878854][ T1] kernel_init_freeable (init/main.c:1572) 
[ 8.884842][ T1] ? __pfx_kernel_init (init/main.c:1449) 
[ 8.888842][ T1] kernel_init (init/main.c:1459) 
[ 8.894852][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 8.899841][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 8.903847][ T1] ? __pfx_kernel_init (init/main.c:1449) 
[ 8.908854][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[    8.913840][    T1]  </TASK>
[    8.916855][    T1] Modules linked in:
[    8.920848][    T1] CR2: 0000000000000440
[    8.924853][    T1] ---[ end trace 0000000000000000 ]---
[ 8.927853][ T1] RIP: 0010:msi_domain_first_desc (kernel/irq/msi.c:391) 
[ 8.935890][ T1] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 41 89 d4 55 89 f5 53 48 89 fb 48 81 c7 78 03 00 00 e8 a3 78 44 00 <48> 8b 9b 78 03 00 00 48 85 db 74 58 85 ed 75 54 48 c7 c7 14 70 71
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  12:	41 54                	push   %r12
  14:	41 89 d4             	mov    %edx,%r12d
  17:	55                   	push   %rbp
  18:	89 f5                	mov    %esi,%ebp
  1a:	53                   	push   %rbx
  1b:	48 89 fb             	mov    %rdi,%rbx
  1e:	48 81 c7 78 03 00 00 	add    $0x378,%rdi


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250326/202503261445.60275df-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

