Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1157E3597B
	for <oe-lkp@lists.linux.dev>; Tue, 23 Dec 2025 04:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465659; cv=fail; b=VBJC0G3PEGN0Kl3O8MEkWmITO6KTE9C9eux3JO9PcuLwt6GqqSJXBcDiU+hap534Gqae7kOloadmri2Z4zSMjcd5jewsVMwsdBg4GbcV/FTtKk6r3MtOXhX2K7+UNDkjZtHP12CIsvCHX607nzZYDXcVUqwuE1wt3rmKVAEREtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465659; c=relaxed/simple;
	bh=XmiofIYhB5emp7X8QqG6osJpsynDWRvg8jsDd67ZY7w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gOMomn6DspISQMIK/DlAvYIWhq6eHsv2YrogsP0m3D+6B0n86BViJb+V10cO4RWtCXIB2bFPJ8ppd2Fh7NIFf7O48iJPjLES+QcigvG4wykq61YwadZddN19QipQpHVrG9TGEZFIavlHQdt8kk0B3VssY15uQTUuHvQV49/BpFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAV4eyWo; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAV4eyWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766465658; x=1798001658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmiofIYhB5emp7X8QqG6osJpsynDWRvg8jsDd67ZY7w=;
  b=LAV4eyWoygi8DnDycP+Fipwv6grlmLHqZvVg7eGvZn7opwCN/Ztndc09
   psch9JhA9WKe1fMGseR4iyFwInc3YVUb3m7pWiVic/wevrzHejrHtXZAo
   WxU0w3aCsYlFxVUH7MqwE6XLJns8pk07YiLqLQ7BtpofjSPTlkM1ce/r6
   PcW/1QQbLKkuHmi3Hs9798s7eH8mTXg/m1grihGJVNWjURtMTRBgXPMmY
   aV8YoMXFcpiZGACbh8+o+G53P9Yxmx6u5Lh25CanIXBKCvyHYHVkrE16b
   i+EKJIXHterLBeFI4nqz5tdgfw/hCwP9bEArNDnX1ssitWXR8FKIhgy+q
   Q==;
X-CSE-ConnectionGUID: +/9+oG9cT+273GjtZ56yuA==
X-CSE-MsgGUID: hvfGgHBDTsW0+BpZqaaJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67511753"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="67511753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:54:17 -0800
X-CSE-ConnectionGUID: 2af6SlysTcO1aVeB4bkFIQ==
X-CSE-MsgGUID: fesOwevkTWSMbtDisG1Atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199719474"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:54:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 20:54:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 20:54:16 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 20:54:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKqTx+QoEogAxnvMr2GaDQHr7fJ9gr+gt5HlblPYPupkMTRcri9OuH6dx8gaNLI891YXtBNskS6+D+LRBSllmJ67IKk5hYKKbaPP7Q4RQnOqvPJJRd8i2wfYuBCv1b29g/TJbAjjsRv8i4x/ew5xiBlEosGw/MLP3dEMuEq3tLBDzKhEWafO4H9tL77ZRYMVeQHIjnzymW7P4qphnsAuHpiZxed0z6X4geETCWy55dyDRZh9rImzGyY7YSYopAlF8a1D+59t5RsCyBAvyy06Vn5lGmuO/csS5Mu10TOBvUN4vlro3/6JQcw4zuIII7Lq8MEjXStjhvl0Lxx1N/svkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C487dw0xFHot7lkUD2WaF6SH54+f5rFlIHMe20q6Qjk=;
 b=KnKfdQSf+Zxut2apav7DjerIWbSS8bfP8gDFKCNrvyLhfetZPQ7fbwPnrnzltxmXTlGf3iNK/sI/58DQGDcpjOaR1101K3SdkGWWqR7hlqmWjqkM+KHERdHA6Ndwqg6og7ivIVT+uGQp6qfWgv7iep5CJfNrmalCsEjFVE1OB9gyHcrgJiPN+qdhwUMjxSxov8L7+zuXfeCsUmBbwu/YqUiEgZXzrZJcJ0LHJk3ljdqM6EJqbdOjXPiLkdVCLPx+5LfPGy9EifnhwHVHqF9P6HXOUBtnKUSI1O6V/APDCAyiPxvXVz36l6I3yXTBRcSxGDye+h29G+kOy9nyvtfbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH3PPF801A91A7D.namprd11.prod.outlook.com (2603:10b6:518:1::d34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 04:54:14 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 04:54:14 +0000
Date: Tue, 23 Dec 2025 12:54:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:hugetlb-init/v0] [dev]  842e0bacb5:
 UBSAN:shift-out-of-bounds_in_mm/mm_init.c
Message-ID: <202512231015.99637eb7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH3PPF801A91A7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bad8f6-7c44-4910-ca15-08de41df5219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?03/+rVBrqSTDoknUwFBgIVqR1cm2xL4KOCA0kERL311XD3mhYCJvWOj6Z0Yj?=
 =?us-ascii?Q?MagVMh3j0Gpf/sRvc/xbwrOJoWvG7Id4l6qlKnYyFTcdlCDCmQ6kV30iI/BC?=
 =?us-ascii?Q?t1G9Q5IUmRbAxusL0mELNQmw2M3+9Vv9Ly+e6hxRfDIp0TJoxUhvUM9yL0PX?=
 =?us-ascii?Q?rue5j7POUnE9rlnHaRZ9Wb1MdZ5GEovG825f5JxMoIV9SKlHbtywUjgEFcSq?=
 =?us-ascii?Q?a369E1fwldkss96qhwyIH1DW60cnXXemsuzkP+T/mjCkC724NrcZEDQEUsoP?=
 =?us-ascii?Q?/MH/Im4WT6I+uPlPx3JBVfHQs1/3hUrV6TPG1Hok0COxaKuFdQ+D2AFW4f8o?=
 =?us-ascii?Q?fC7X1NJMaH3JClYeUgoBsp8+D9SkJQuOzhzg4+Q6u+MccWqKRW8IiFg4mtXN?=
 =?us-ascii?Q?R/EJVoZWj5Da9GgSgy6i/VO5grQvIG1GTLXlxFkp3sa4TXgOy4o7FVKCNn8h?=
 =?us-ascii?Q?U/0UshghBkApaqYZ8AiRi3Crx1kgKQURRa+0rHGVSvMYMlXg3aStO+UGkp6q?=
 =?us-ascii?Q?aCi3zyLH5bM1Dm9EhDbpeukALXudbtQCZ64Y5PzUQXY+MffZ/xuRVID7ZWIa?=
 =?us-ascii?Q?SUz2lNjCySfbxFniPq5IYCgMgOBsmiRbTK7at93MJ8jAa5y32LLIvmo03rnk?=
 =?us-ascii?Q?MUSriVJrNiaMnTZVrbisTDHCQdbWMQPrBQcHGn2TpjL2UUGQqKbQbTs1y23z?=
 =?us-ascii?Q?HuPQUVjvoNedVb5Ou4VgdL64oiaPc1aaCjls65RqPAz0dfPRPpTfmgQvEMFa?=
 =?us-ascii?Q?qNi2wcFq0sxaVHmN//t4zQHqaqzSHSOYxeYjNZ0CUVCCzxe9NPTm6rH3DI5J?=
 =?us-ascii?Q?0RUWLELZsr80op3eoHWOI0r81Nu4H5v3tobL+g+szVrtIDzKsc9jz40znwIT?=
 =?us-ascii?Q?krfdL9J0/pe5co7lZgIkshp5QzrzMhA2h6xIqsifaqaGXFfqeZr2rSd/T/wq?=
 =?us-ascii?Q?SU87+4YVuPVVrr3AQ23m4NK18DhU+65kN6iiknprZMZN4DoHUb1wppbPVgkH?=
 =?us-ascii?Q?IPjMk4GsZRt0hbHEqXlR7uJwQdZyw0AXRSrNqL5Ntb8+dm9qGIMBzhptqYol?=
 =?us-ascii?Q?zMLy5WGo0kooQhYaH/sa0yMe9ZdYxLHQI3WCBeN7fDDb4kdC7ncsuS7trT52?=
 =?us-ascii?Q?9caeNeT6Jn0fVIPJYr8UQBSI9HyBQoKUazIKefWQPYlgbJ55sowkudV4kJgN?=
 =?us-ascii?Q?Hm7l3mcbSRurVutzuZ1n5UwpaqS0Y2D0RllnYyzwge+mkCLxQVmiwktsrUTl?=
 =?us-ascii?Q?VzJePB+7ppGxTLM5/rf3BH6uemo5geECJU7MSrod6TUWp71HAbEQtyvyDqd3?=
 =?us-ascii?Q?tMy9bIMVT1cJa3u4Nqq77/9MmNPkE/tJfVVnqa/EHDO+YH1aMiiGRFtMbtp0?=
 =?us-ascii?Q?6wBVrx1jO1GAhzTb3bWik9rRC33bL7TDYwJSrn75SaaUt28xonJLWMlqamkW?=
 =?us-ascii?Q?b5iHvXpyFxWdADZ/Sog1gT5l8mEWYERDrz51xcItmW72dmtTvUQSXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlNQWYE61LiRFkyTwDEcgcuPecagDc/duEhUsTEJoyNtFF32hM3QTFMXI49L?=
 =?us-ascii?Q?GWy2H1SuHVVTzUGmIzVG8AHnRfZiBaWjR3LCvkzGNZKWu1EpfL0BqqmlCJF2?=
 =?us-ascii?Q?cJ//TDml8uyu1f8blFRNW3WSy3FmmehTbpOnUOpm/PRmHolHqxbO5QP0fQUP?=
 =?us-ascii?Q?NL0GlZ1WQaRRpV5728B2+YnfhDO0BIAJ2P9Z0k84pHGI9h+Qok3CZq/b5TGA?=
 =?us-ascii?Q?3zgKz+SOmULdiW+KpTdTpZBKIwqiQQNE+Rvib2BC5/7XXEd1lRrnjY4j1BvW?=
 =?us-ascii?Q?g/+xnoEPSQA7jOVR9JYCVqLD43bIEEFIwS8Ud0ALaKPSz9HnkMADV6ap/Qc2?=
 =?us-ascii?Q?i8sYD/xXcIQ9XXHT3Y24FEisNaoppKsENivlmrzSjQulinx08f3jkYtXDtLu?=
 =?us-ascii?Q?z8LK6C4S8ALuzaU55j457nFlAydQfjCWn/0jM2M3w77HymgtfbORoJVksIxm?=
 =?us-ascii?Q?v7xtpoFXXarjGNN7gCw2h2BOWB/bwze6XapQa8xb/1uk5Juqj0uGnQBz836a?=
 =?us-ascii?Q?zhjUWd4csM2eGlEYB+c9ij+dqsgsYfNNjl7nBYhPIXsjc3VLJjBn4sXzaedW?=
 =?us-ascii?Q?26H0I/r5dPtKrL17vb1BQsccaKGTKmnMd6uH4XPF81ufMfhef/b4dgXBhLK9?=
 =?us-ascii?Q?9n5qPIDuOtf5qcIMXGB2/R8PdrG8hoYA64TsHCN6UOYYAzFa8gygymVlCInx?=
 =?us-ascii?Q?o+N0WB9OU9aVY1t3u5pxD92b4gPwZ4Q9f1pfFo55q9ccWs8ky8CpMRALHmxY?=
 =?us-ascii?Q?YMrD4uXK2yOvirnOxbqSUXdzvialaOOgqm7Q/1jSfRC1kSES03Ttm1VDsG49?=
 =?us-ascii?Q?ykV8QbEUAHn1rksVYwJE6RG5P+30dDyoat8X5isdkf//gT241xmzvm+G3hcm?=
 =?us-ascii?Q?LW1E/B+zT5MXyFmCyPcSldMGV8pTKZGq8PPAYTCBmFmTjxFjYvHTQS+6vyRZ?=
 =?us-ascii?Q?cdsD8MYvZprdqrgRIagg1mLpLoHd9MeEuwnuwe0y7wJ4oljvO6XJcbnb/M+7?=
 =?us-ascii?Q?0QmRaWQ02Sui9B9539orzhU2fEgikMjFmlMGplbOlkWskjqdNz41T6mnmZD9?=
 =?us-ascii?Q?QXAEVD1taGJQ2NDWmqHO2bGGeATQquWNrOdGG1IPU9LIVB4OuJQkS+ksdfmv?=
 =?us-ascii?Q?QJ+1F2FTPu6p1U+hcBEsg5k8tcSG4NJNunNA+MwSj5cQg50HeT3lcq5f7LYi?=
 =?us-ascii?Q?7UW/EUdDc7XTxxOrBSS1PlKHZBowOMDS60Prm0pGbsGqDvgKgMnn9IffK+/2?=
 =?us-ascii?Q?WBHnRStWXo6V9tN2/ZZbOpsA1SMaRG/wEvWfuTkBu54zSUttQboS76vqpxQ6?=
 =?us-ascii?Q?u6UMNzQGA6YDuQDKmsVa/W0BsCj/RSBEq8UQU6qIy6vLCrLlqly+Y/+y+Blg?=
 =?us-ascii?Q?5LtMukxLUAUG+EI+hJvx0rm71gCJE31XprIsVE+KfLmLJWZ0G3SJMbq/rpuC?=
 =?us-ascii?Q?hE2MBCK/JCCxZrJ3ZI/4r6wl05pUD95jtcKOTRygn/KepnE9brb0V3R0RvPr?=
 =?us-ascii?Q?c4Hd7YdER+dhNQzGpdJ8zxAHRkhFhdO3l0P2ppoiNy5TWU5Jj6kHGWsMZNWf?=
 =?us-ascii?Q?GzE/W93GI9t9RZLGOVO7cADQIMsyQ/j5zorb2jrj/nVubGLnmm669V9r0mTJ?=
 =?us-ascii?Q?TrJce89GTdVImFEEU/UAZ+WIt4X4iUaL0SXJ561xoM1w7InSOc2O/XSkJRyo?=
 =?us-ascii?Q?lb1h9U5B3gaQ4Cf5vk7Rr2x88HWjGZsx7ov5lEob+rHCcN3iNRl5ql+5iKaD?=
 =?us-ascii?Q?QQrai9kI0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bad8f6-7c44-4910-ca15-08de41df5219
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 04:54:14.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yt3gEqFRT9hyv7phed0XYpl0JdpzwWwsRibvTh/ydhGeno/juhMDgz1ghC3yXgEaa1h1SNz+fbxfeEFkuY5u/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF801A91A7D
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_mm/mm_init.c" on:

commit: 842e0bacb55a7112f86ff21d520d821f7ab53e24 ("dev: use arch_zone_limits_init in free_area_init")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git hugetlb-init/v0

in testcase: boot

config: x86_64-randconfig-161-20251222
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 5466a334e0 | 842e0bacb5 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 12         | 0          |
| boot_failures                               | 0          | 15         |
| UBSAN:shift-out-of-bounds_in_mm/mm_init.c   | 0          | 15         |
| RIP:per_cpu_ptr_to_phys                     | 0          | 15         |
| BUG:unable_to_handle_page_fault_for_address | 0          | 15         |
| Oops                                        | 0          | 15         |
| RIP:__d_lookup                              | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512231015.99637eb7-lkp@intel.com


[    1.772578][    T0] ------------[ cut here ]------------
[    1.773160][    T0] UBSAN: shift-out-of-bounds in mm/mm_init.c:2450:21
[    1.773928][    T0] shift exponent 18446744073709551615 is too large for 64-bit type 'long unsigned int'
[    1.774628][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc1-00023-g842e0bacb55a #1 PREEMPT(undef)
[    1.775399][    T0] Call Trace:
[    1.775636][    T0]  <TASK>
[    1.775847][    T0]  dump_stack_lvl (lib/dump_stack.c:122)
[    1.776180][    T0]  ubsan_epilogue (lib/ubsan.c:234)
[    1.776499][    T0]  __ubsan_handle_shift_out_of_bounds.cold (lib/ubsan.c:494)
[    1.776998][    T0]  alloc_large_system_hash (mm/mm_init.c:2450 (discriminator 1))
[    1.777401][    T0]  vfs_caches_init_early (fs/dcache.c:3255 fs/dcache.c:3304)
[    1.777793][    T0]  start_kernel (init/main.c:1064)
[    1.778118][    T0]  x86_64_start_reservations (arch/x86/kernel/head64.c:310)
[    1.778513][    T0]  x86_64_start_kernel (arch/x86/kernel/ebda.c:57)
[    1.778883][    T0]  common_startup_64 (arch/x86/kernel/head_64.S:419)
[    1.779234][    T0]  </TASK>
[    1.779447][    T0] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251223/202512231015.99637eb7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

