Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEEA224258
	for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611178; cv=fail; b=uubdOpeP+CxcnaiBuSkTmtgY0Pq6XxbnfA8mhlb1SePX4vUgxPHnqnuqqmClHF+sZQT574GhONDNWs+mFN6arKQUR3OE6hGlvrAIpWWbUiODruQzH+FdXOstqkXctqlbhDxa1Ve/BktzV51PekXpyXh/BZ9HOuShtsctKLwm6QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611178; c=relaxed/simple;
	bh=TjKSBddC+OukrfK9jP9PRgXsAE7hNKmduct0valnEy4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uXEjXIuxVBCNMHuH4xMwSyhqZzLwq1zhmlXB5sBmE4jyx82QGOFk6wMnGDS+APuT7wCaultXfRdyWZ8CIGojz36BMQizNnXX5NjAaWq/YNBHSvKWUWG0677Rrci6L2al49qMnxJ0wz8yL+0f4nIGSpWP4Zkf+qalhxordYeAKO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtlQ8eu9; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtlQ8eu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741611177; x=1773147177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjKSBddC+OukrfK9jP9PRgXsAE7hNKmduct0valnEy4=;
  b=YtlQ8eu9BTj4Epbpvk4rAYYXiYavk+S1RKOSIudcgPgTZjCD7kPh8Vux
   wGtYb9/tZ04rgkJryRwouuxvoMJJQagWZSaIKHtDCVd7SQNiWsn/SBRVV
   ECY9WHJ4qNr4fpQ/9k0NBTm9z9TVxqNE54iBprhLXVwhQzChMaLrPtQIw
   FLRYL1dn8Qqqf4B4fkVcHUcbpVGzmrcvSH9ZKXG8CKwbBpLg77QtI1Z8h
   y5MOla5YIS3KmhlJZfWD2mtu66oKUJzAg9p2E3M8HD2tEaTGVdlfT/ebm
   +eQdycAlMOI4O/Ss5sWOMejhS5QWuzYzq5GmtmnW3sN8WhssFCEgwhS9s
   A==;
X-CSE-ConnectionGUID: LkrqTzy8TZ2UikCwrEgAiA==
X-CSE-MsgGUID: OPtdbX5lQ+ywlgD8dPcYyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53983537"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="53983537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:52:57 -0700
X-CSE-ConnectionGUID: mVQE2EUVTE23FZBswUTUUQ==
X-CSE-MsgGUID: Z1O2bwChSEakgUahvwZlCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="120501193"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:52:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 05:52:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 05:52:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 05:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dz53DlOiEJvIzeALyLY1Djxi3ldXBpV1Oo8py+eC6F+ziNl+FJSV03EVsoD90llBUWhY2/UA6/MpaV/KXGKNNDhNehOnyOsyqeIeh0nLuVQ+r62a5wu5zkBXQcEjhqFd42lJbxdmcuBWqji6daeMiYbCMjEbNylFhdqL/GRdu5V4q2nbQoGvc7wCncA5HNXvXmU6tpDXLqlyW3DeegOolrdbbn+ZU5XaNCbbli/27SuD4kJIkVG/NW07TWO4IMFEg7pgNozL7KuDnf5qqVXECszOuFsWjW2lXn1iHz6lj+RzmQwQ0LgyAGaJWFWEUegPHPDQ78h6N5arQo4/oRBLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qSdfvRkDGL6tMYcBkQNPfKVe8MuILzl790oOJnxKu8=;
 b=zKLtn2iWF+uYcy0bdeJXv4kk5mN1EXUDUK4dKajiagAilctEsGC/HtygA1NjtsiWggP+IqkCsZRynOcrY5IXMdNgwk9K5aFsqKljCyVwzqTO7STTOtcGXC0w2fUoE66bq+Xvz1Xycj5/OXptc11II5B5YL8u3Cl4qq7Nib2JpYRogArY9CPwS3utlRmQjHzzWnIk1DRCnyuVpdo/DIIHuuTRUPOR3UiPeNQweHiHcA2ctR/PzYeOy3hyqclcx63Jever2mMJlpeVRlUTQK/rf6FN7vLse7+M/cHrV6TLwMHikE2rSkb4PDz6M+26t0aGjmZGuVK4ytsoe0VGD/yLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:52:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 12:52:12 +0000
Date: Mon, 10 Mar 2025 20:52:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Liu Ye <liuye@kylinos.cn>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, "Christop
 Hellwig" <hch@infradead.org>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/vmalloc]  ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
Message-ID: <202503101629.7289b1-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: ce59194b-cf2b-499f-77c1-08dd5fd2605a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oj2j4ktuqv+Ofnn1Uv8dnjlBfvcbjklTPoh9JpDzChKhF06e2gj/kc5I3Ni4?=
 =?us-ascii?Q?CigcyEagV777eaUyBEzz2fSUkEA2FCd1JJ11djJiLNpgXhEOdTcyJnSMhHLS?=
 =?us-ascii?Q?FyFGdGTDBVCByfLaLSkjHQ3+sFdXTRtXt1MXrl5WFUFiA1bKtqN7FAsXVkPU?=
 =?us-ascii?Q?LtxmZquurjEeRhyZAKYPH5xlvbHqs926xr+d0YYPRYJLC3QzshqOxppoIP6l?=
 =?us-ascii?Q?IQZefmDjJPskf+XyTI6gAI6b5SLGkVJlpcz1OTXY9PeRwdaY+ZUQAd/j+0/+?=
 =?us-ascii?Q?IIb4+4guDHs6FYmeKNJInvda98lDt+6JNUdYmvFr6mgGO7M7QuRJW/tfZzQ6?=
 =?us-ascii?Q?ZmFPqkuV6ljPrpkyAMpP03ZAhYZCty5ib7R1f9eudjpqRXAB+Zg9DbFuWxGb?=
 =?us-ascii?Q?xsl0fdHJD9W/2gFG9gAsFrb+o2uP/38m83Hy6LbpENqAkB0Yw2XeGEOBZCNX?=
 =?us-ascii?Q?8k815pKVxmpaYRzjsqw6PMnN3DtOPqOLBfmP1o+Kfb5nECcsMf8t3mn8n8Uh?=
 =?us-ascii?Q?BGnfnWVsrejDdAIozpuxJSbHxFWiOoA57tkXVYzaEQyvoDzTNPJMC8JzQZAK?=
 =?us-ascii?Q?9bX07c5KsUTnquX6I6c+7C1G5FjJu2qhA24UR5/dwtcUqNOELmWBLZNKcHbL?=
 =?us-ascii?Q?h3QeMMlOWVo2OWgEy+hufr72hPlDNZ4uk31mRBC+Y3ncHmfPUkg4omjmQCtE?=
 =?us-ascii?Q?0UsIhrjyi5ztlVWnGRtQt6RMqGC8i3eiOI3qRKQjeeJ6sZI49pIU6DCQyvzy?=
 =?us-ascii?Q?o2+GcIAR/7Hk7LhjAWbps7mtmDVyrmUiyU10Y6zIC+2qNN1HfxHZ+Kg+0LL/?=
 =?us-ascii?Q?1vv/AP8rX08D7oGHMSQP4PS5ZZAiXOATQVF7T9WjB+Np0w8nCKGDP8/Xa6SB?=
 =?us-ascii?Q?fVsPVxFmxKbyTJ6i//hhF9okKS8m4ObvaeZxMxTa0BTxkv8RASSwA5Gcrxqp?=
 =?us-ascii?Q?T2h4W4GXXPGxD+gxC3wolC61PIj85w5lLIij+ojh4fOo5jKymTA2Tl7p+6/h?=
 =?us-ascii?Q?RJdjt+5YPww+o0ZuBkf6u9bY8LgSTJVRLFvd3cuR8vhDnesMN43PCXFea8X4?=
 =?us-ascii?Q?sNPLIwsEfngzUt+MIx9XHPJGWWBznKKAuhFqv7Ptm5CM3znOf658L4NS97WB?=
 =?us-ascii?Q?ObZeeDKkD6FKoDaLsNhEjef4Lv2C4Mly6EHCyJDGcYjP9sKwm3JZAROnQh0S?=
 =?us-ascii?Q?DXE6zYJSblxV/TONKCZr2m97WzK+89oMCo7DlqvKZoJjwEvRMvjg7rZ8gAin?=
 =?us-ascii?Q?JWnv+8klDsrY5W86XYlSMX6yCQqUJ/LhWCpHsSHDiDf/c5KWXcSh8Hf1GHXv?=
 =?us-ascii?Q?UkLPrep4ADNzadt6Zh8s7NTy2caCmIuqQrxU076sY/u2gg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sIU+t+0V5zOSe2anpn9xjo+YOhYIWEnuReZ1qiJfaRdtxKY+JuKXjlOCWiAz?=
 =?us-ascii?Q?onI/DyZYi4FnUoASMzOTFT7Hx330rvuGpmXeIKSpJMseFPnm+4S+5nTxDhqo?=
 =?us-ascii?Q?JI9CbZVJZSSz0VKSTTNj/3Rn7sYGPznUVn7c5zfBxzZ7HaxO+E94VO8kFxIA?=
 =?us-ascii?Q?+FnTCj++6Pxy3uyu+bLxI77krKiI8asjDE/z/7hUMXaNi0YOIZzm6BorFC4o?=
 =?us-ascii?Q?ZMXEkb28We2nJvj1Uz4qzgHPTfeHjSKoR1QFodUtk09iTR0REVrPEeDd2fpg?=
 =?us-ascii?Q?2lMR5oHrW/k3SkfSDttPXXdx59oLESf7sEbC6ZeuSp2rEE5aVUgxEnSjMmId?=
 =?us-ascii?Q?6LuMkgQjK/jJf9886/QgVNcvR6/k+pTJa9BSClu4hJuYk3fCjnNtG121kZ6/?=
 =?us-ascii?Q?5qKnYTgnLdB7ALnm5hcn8KyEYKdTxBympYjA6axMAmDhBrURXkVrljmb65nH?=
 =?us-ascii?Q?ojIo29nGxiyOMnBz6W0YYw1xsklaM8UOHJgqeSx4Y/QjX7fgfLMKnJvrSjRg?=
 =?us-ascii?Q?9I81FomvVwORP6VSjErfY0UFRGvcGaJDmY6kasMX5vgZ9N8Kpnfz08ERgUfE?=
 =?us-ascii?Q?RulUGGhct7VOrK5b7SfNgXnJFdlQVph2wnGL9auosobi9/EesG2/rGCvm9MV?=
 =?us-ascii?Q?TJ6r0z5wffX+9p77WV1dtWUcoyJtiEcTdf4afjqepN/vWDdCIWsfZx2+ym4R?=
 =?us-ascii?Q?mak8vkYap+B7M/cWH2ASnUhk5SA4UfMMCO+tLlh3g9pqEkHUOv4uAUrLF3y+?=
 =?us-ascii?Q?pyXzeu6EDmpwpfeXeNnPqDBKc0HUbxQdsPkRqravWT8YFj1L9wwpn9V1sCRZ?=
 =?us-ascii?Q?XxnkdDPdnpOqX0/AFFoqbIoc5XhISn/z21oNTe9sReD89QUcP6RY94mp7ksl?=
 =?us-ascii?Q?TV34mgnnW5A12Ylm1w9j1jVGxeJcRfENWlLTnu7CEe7WWEYx6BjFIMDqSiKQ?=
 =?us-ascii?Q?09W2vbNC4r/wXNHA2Jv6s/iz3vK2AvZOuekg5ySdUvFXYF+v0oTRkv9ba7zT?=
 =?us-ascii?Q?HFgrcGt7R05l7E6lQSZpgu33XNwd9MyB3ckrHjMMkbvg01rdLI9Gb/R1zlln?=
 =?us-ascii?Q?JZrYW2oUU/mkQdJNsd5RKqrUUG985SGACGLjMRiqSE/D9KwkUayyeME6PvU7?=
 =?us-ascii?Q?z2Ioa8BmO8a0PuVQg+xMoc2vquxRHjJxxT+/K65CG5hskhRr/f+Hi6F4WDrq?=
 =?us-ascii?Q?qWEbONCRCNDbAJda5NB2j73gSchBjFjHPdbS5VRkj+u3CYCWLD2CZmSPvHtO?=
 =?us-ascii?Q?F1KDw5PVsUYEaEGnOwRU5Jmi66p2EOZoCDxbje1hCruzL7q0Dh433l+wlzhx?=
 =?us-ascii?Q?oKIT3Jj0QSHRi/PJ9YDvEtsGEju+Zj+cxc+ZG+rtmkSHYEaZ1Jkq7ZUAEnsy?=
 =?us-ascii?Q?iPcxptciHYyi9F110E4TjawkcQWuu3PErF6ebDc2fuEInw0jRkT9qFYksNa+?=
 =?us-ascii?Q?XCX/TPn3vWNW9z86iLUqiVBEX/d9N4mvs0N/RNSm3euWXplXtCeAvystEBBe?=
 =?us-ascii?Q?m94EPmoc+ta0FUbb9DB0XDYOq0OpiYSVs/FHwiJ7Pb9v953/7YxDW06DgCQq?=
 =?us-ascii?Q?vG8egtMhyLFyXR6STlQTpUhHD9T/s+8watHlHiCTTUKi24rmV8G3VMe/k2LS?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce59194b-cf2b-499f-77c1-08dd5fd2605a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:52:12.4892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOOkbvNqSTwFSc2ZrAFQLbWGcXG94dm74yFRY6mA8k/D5Dqwe87dwlQbZ/etA1FMsHJmSvYb20uz+KQLNt08Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/fork.c:#vm_area_init_from" on:

commit: ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_node_range_noprof function")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc57014]

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-02
	nr_groups: 5



config: x86_64-randconfig-101-20250306
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------+------------+------------+
|                                                             | fb8faf4337 | ff6f2b81ea |
+-------------------------------------------------------------+------------+------------+
| boot_successes                                              | 9          | 0          |
| boot_failures                                               | 0          | 6          |
| WARNING:at_kernel/fork.c:#vm_area_init_from                 | 0          | 6          |
| RIP:vm_area_init_from                                       | 0          | 6          |
| BUG:KASAN:slab-use-after-free_in__vmalloc_node_range_noprof | 0          | 5          |
| WARNING:at_mm/vmalloc.c:#remove_vm_area                     | 0          | 5          |
| RIP:remove_vm_area                                          | 0          | 5          |
| kernel_BUG_at_mm/vmalloc.c                                  | 0          | 5          |
| Oops:invalid_opcode:#[##]PREEMPT_KASAN                      | 0          | 5          |
| RIP:__vmalloc_node_range_noprof                             | 0          | 5          |
| Kernel_panic-not_syncing:Fatal_exception                    | 0          | 5          |
+-------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503101629.7289b1-lkp@intel.com


[    8.741254][   T47] ------------[ cut here ]------------
[    8.742176][   T47] memcpy: detected field-spanning write (size 8) of single field "&dest->swap_readahead_info" at kernel/fork.c:477 (size 0)
[ 8.745188][ T47] WARNING: CPU: 0 PID: 47 at kernel/fork.c:477 vm_area_init_from (kernel/fork.c:477 (discriminator 3)) 
[    8.746489][   T47] Modules linked in:
[    8.747050][   T47] CPU: 0 UID: 0 PID: 47 Comm: modprobe Tainted: G                T  6.14.0-rc3-00393-gff6f2b81eaa8 #1
[    8.748545][   T47] Tainted: [T]=RANDSTRUCT
[ 8.749159][ T47] RIP: 0010:vm_area_init_from (kernel/fork.c:477 (discriminator 3)) 
[ 8.750008][ T47] Code: 5b 41 5c 41 5d 41 5e 5d c3 31 c9 48 c7 c2 40 01 84 84 be 08 00 00 00 48 c7 c7 a0 01 84 84 c6 05 97 a0 fd 04 01 e8 7c e9 00 00 <0f> 0b eb c2 e8 53 c2 53 00 eb 96 e8 ac c1 53 00 e9 6c ff ff ff e8
All code
========
   0:	5b                   	pop    %rbx
   1:	41 5c                	pop    %r12
   3:	41 5d                	pop    %r13
   5:	41 5e                	pop    %r14
   7:	5d                   	pop    %rbp
   8:	c3                   	ret
   9:	31 c9                	xor    %ecx,%ecx
   b:	48 c7 c2 40 01 84 84 	mov    $0xffffffff84840140,%rdx
  12:	be 08 00 00 00       	mov    $0x8,%esi
  17:	48 c7 c7 a0 01 84 84 	mov    $0xffffffff848401a0,%rdi
  1e:	c6 05 97 a0 fd 04 01 	movb   $0x1,0x4fda097(%rip)        # 0x4fda0bc
  25:	e8 7c e9 00 00       	call   0xe9a6
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb c2                	jmp    0xfffffffffffffff0
  2e:	e8 53 c2 53 00       	call   0x53c286
  33:	eb 96                	jmp    0xffffffffffffffcb
  35:	e8 ac c1 53 00       	call   0x53c1e6
  3a:	e9 6c ff ff ff       	jmp    0xffffffffffffffab
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb c2                	jmp    0xffffffffffffffc6
   4:	e8 53 c2 53 00       	call   0x53c25c
   9:	eb 96                	jmp    0xffffffffffffffa1
   b:	e8 ac c1 53 00       	call   0x53c1bc
  10:	e9 6c ff ff ff       	jmp    0xffffffffffffff81
  15:	e8                   	.byte 0xe8
[    8.752623][   T47] RSP: 0000:ffffc9000033f5e0 EFLAGS: 00010286
[    8.757589][   T47] RAX: 0000000000000000 RBX: ffff88812aef5e00 RCX: 1ffffffff0a96ea4
[    8.758688][   T47] RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000001
[    8.759767][   T47] RBP: ffffc9000033f600 R08: 0000000000000000 R09: fffffbfff0a96ea4
[    8.760832][   T47] R10: 0000000000000003 R11: 0000000000000001 R12: 0000000000000000
[    8.761924][   T47] R13: ffff88812aef5e60 R14: ffff88812aef5360 R15: ffffffff848ba400
[    8.762997][   T47] FS:  0000000000000000(0000) GS:ffffffff85478000(0000) knlGS:0000000000000000
[    8.764185][   T47] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.765087][   T47] CR2: ffff88843ffff000 CR3: 000000012aef4000 CR4: 00000000000406b0
[    8.766162][   T47] Call Trace:
[    8.766606][   T47]  <TASK>
[ 8.767019][ T47] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 8.767608][ T47] ? __warn (kernel/panic.c:748) 
[ 8.768241][ T47] ? vm_area_init_from (kernel/fork.c:477 (discriminator 3)) 
[ 8.769012][ T47] ? vm_area_init_from (kernel/fork.c:477 (discriminator 3)) 
[ 8.769752][ T47] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 8.770418][ T47] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 8.771056][ T47] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 8.771726][ T47] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 8.772478][ T47] ? vm_area_init_from (kernel/fork.c:477 (discriminator 3)) 
[ 8.773223][ T47] vm_area_dup (include/linux/list.h:37 kernel/fork.c:499) 
[ 8.773752][ T47] __split_vma (mm/vma.c:477) 
[ 8.774165][ T47] ? commit_merge (mm/vma.c:463) 
[ 8.774582][ T47] ? __kasan_check_read (mm/kasan/shadow.c:32) 
[ 8.775053][ T47] ? validate_chain (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/locking/lockdep.c:230 kernel/locking/lockdep.c:3818 kernel/locking/lockdep.c:3874) 
[ 8.775484][ T47] vms_gather_munmap_vmas (mm/vma.c:1283) 
[ 8.775959][ T47] ? check_prev_add (kernel/locking/lockdep.c:3862) 
[ 8.776378][ T47] ? mark_lock (arch/x86/include/asm/bitops.h:227 (discriminator 3) arch/x86/include/asm/bitops.h:239 (discriminator 3) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 3) kernel/locking/lockdep.c:230 (discriminator 3) kernel/locking/lockdep.c:4729 (discriminator 3)) 
[ 8.776749][ T47] do_vmi_align_munmap (mm/vma.c:1450) 
[ 8.777198][ T47] ? vma_shrink (mm/vma.c:1441) 
[ 8.777627][ T47] ? lock_acquire (kernel/locking/lockdep.c:469 kernel/locking/lockdep.c:5853) 
[ 8.778059][ T47] ? mas_walk (lib/maple_tree.c:3636 lib/maple_tree.c:4942) 
[ 8.778451][ T47] do_vmi_munmap (mm/vma.c:1507) 
[ 8.778877][ T47] __vm_munmap (mm/vma.c:2969) 
[ 8.779252][ T47] ? expand_downwards (mm/vma.c:2960) 
[ 8.779671][ T47] ? vm_mmap_pgoff (mm/util.c:579) 
[ 8.780092][ T47] ? get_random_u64 (drivers/char/random.c:554 (discriminator 13)) 
[ 8.780507][ T47] vm_munmap (mm/mmap.c:1078) 
[ 8.780842][ T47] elf_load (include/linux/pid.h:231 fs/binfmt_elf.c:395 fs/binfmt_elf.c:414) 
[ 8.781205][ T47] load_elf_binary (include/linux/instrumented.h:68 include/asm-generic/bitops/instrumented-non-atomic.h:141 include/linux/thread_info.h:126 arch/x86/include/asm/elf.h:310 fs/binfmt_elf.c:1125) 
[ 8.781652][ T47] ? load_elf_interp+0xa70/0xa70 
[ 8.782161][ T47] ? exec_binprm (fs/exec.c:1775 fs/exec.c:1807) 
[ 8.782556][ T47] exec_binprm (fs/exec.c:1777 fs/exec.c:1807) 
[ 8.783104][ T47] ? check_unsafe_exec (fs/exec.c:1791) 
[ 8.783535][ T47] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:94 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
[ 8.783980][ T47] ? check_unsafe_exec (fs/exec.c:1637) 
[ 8.784412][ T47] bprm_execve (fs/exec.c:1859) 
[ 8.784782][ T47] kernel_execve (fs/exec.c:2026) 
[ 8.785177][ T47] call_usermodehelper_exec_async (kernel/umh.c:113) 
[ 8.785697][ T47] ? umh_complete (kernel/umh.c:64) 
[ 8.786102][ T47] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 8.786473][ T47] ? umh_complete (kernel/umh.c:64) 
[ 8.786867][ T47] ret_from_fork_asm (arch/x86/entry/entry_64.S:254) 
[    8.787278][   T47]  </TASK>
[    8.787532][   T47] irq event stamp: 955
[ 8.787877][ T47] hardirqs last enabled at (965): __up_console_sem (arch/x86/include/asm/irqflags.h:26 (discriminator 1) arch/x86/include/asm/irqflags.h:87 (discriminator 1) arch/x86/include/asm/irqflags.h:147 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1)) 
[ 8.788658][ T47] hardirqs last disabled at (972): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1)) 
[ 8.789442][ T47] softirqs last enabled at (470): handle_softirqs (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:408 kernel/softirq.c:589) 
[ 8.790243][ T47] softirqs last disabled at (461): irq_exit_rcu (kernel/softirq.c:596 kernel/softirq.c:435 kernel/softirq.c:662 kernel/softirq.c:678) 
[    8.790996][   T47] ---[ end trace 0000000000000000 ]---
[    8.796795][   T47] modprobe (47) used greatest stack depth: 25392 bytes left



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250310/202503101629.7289b1-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

