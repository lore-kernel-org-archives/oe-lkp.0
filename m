Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97102D0C72
	for <oe-lkp@lists.linux.dev>; Tue, 25 Nov 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059287; cv=fail; b=ao2jg4yv3E034TvJMWLdrOUgyVnnPs7A/TtooOliJg5DgkRWJ6b6mHUH1GsgFJIzd2gYTOFB8x8+hbfvg2zJUDt+3kSqw3accGqbGBWnSoqtr1Ih4AKQb3tkg4u925lPccZ59pYfhsqd7X3WRCCrHuxNU8hs2JiXRo/FQoGS/lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059287; c=relaxed/simple;
	bh=9jEF++b7fnkrsRC2iTJAfFl0i7Rm/vSe+R9aWZ4FbQQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YYoB2FJYcjtN5UoXkIVv0x6TCapE9FeUWe8XD1RVKhtnTIlBZ1tXXMqknbq9yvmb75NtobWP6z3QQqSdEBWr8O4A1ncuKFR1SWzdZDVqxgbONDF8bGVrqtK7jrfN2Ur2DRvHY+vLao4owgViQo2RlNBVPEl1nV/ILdYBLNh36cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcL8gJgs; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcL8gJgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764059286; x=1795595286;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=9jEF++b7fnkrsRC2iTJAfFl0i7Rm/vSe+R9aWZ4FbQQ=;
  b=lcL8gJgsoODtk7XZo8Ubd6pmLTbAec2t0qQimxsI82MCAeTTSV12eyXD
   RLJc6cZ4MIriWjQKk4/Rl4q08m6fmmRQZNopHpgoPPJ5GT/fOXEAPNQha
   wFvv8Nm+duUfjMYnWGd50B9KWAESSUMwuFZCQzpj+Q/V7uoPBWpcp8/2o
   GSZzW+Tsg+SlxD8XIrf+kdz86ZFVreHgwWZQI9IAJUbRcs3KophiDXplA
   LQPD/HVsr0lpBecE+oAmFlH/MTVS3M+PnnqZJ9pJEvpU2ybUN9xGBCvXX
   epVKHH2J4+Qs345EHFZ2R2dsMn/PDpBSagU7UeeEYN1dPzdD1v6pwcJxe
   w==;
X-CSE-ConnectionGUID: VFIpVBeeT5SMgLY3oS80jg==
X-CSE-MsgGUID: 6cOQrY8wTkO+zygj73tE0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66105116"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66105116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 00:28:05 -0800
X-CSE-ConnectionGUID: Hi4FjkGpTi6zKXAhix+zaQ==
X-CSE-MsgGUID: P6+VkLt0R5K7wFfQ6g2lYA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 00:28:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 00:28:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 00:28:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 00:28:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3rFIjXo2loBRk4wLgtZi9rH2MnRkqPYwL7Yi2eQcRCnA/VhBzuu5pE+/rsOtBycdMnRnwvQvSWCVk6Krf/REgiaNSXzfesIv2C15WzY4WMuQUw9gZJ9zLDALUbr+F0W5ALEkNnlNtdafI2LALS84HKgYNmdJRnv/89/r/a/w5R9pyVy7viBDjrPQhO6ded5Ljqld4HO8GX6rmGp7Yby+FmQkmGdPzyWqr9xTQKpACrxQLvyvIpSyJZ797LqL6N8hr6e6vulgabu7gJMkY7NWt2U8D9baRhMdie3UZIwD0bhJwtHpx8B7po4Y2pqvzviszRjI+6DlpMOm6Urdmj27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/wGbUsDvQ6eGY8wilngqX5+iYIKSPm8W4HqjHt1+ds=;
 b=IJcXUmtO5k4Ea8QfaR/qUrY88sC5M0go30EVhU6zcpC9+5rM14tdl3YyGHoGH6Dy7W4eWOdEUmb3cPXsx2x6+NVDgH+fDjRuv/8OELFM9Qpr3WFrZ/3QYFny57gEZX5YEE7yMaeCbbNJpnyYeO5l9vo6ox5d9bqnYN92p1ah5xBV0p05q4weoyhiGhLGQw2RgaQvniFzjIz1bxp72Lw0JWp19yDDwcqsfvhHAeJ0PPo0nE0rFEs5EWzvhiScqv8G6iPME6X9/BII0x0i4TDiFwQLOhyB2h2MZHYdwps7yG970Wl9rSp8LJQVgoNl+gQ1g6kYTxmpzHG7DDNnvo4ZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 08:28:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 08:28:02 +0000
Date: Tue, 25 Nov 2025 16:27:52 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	<oliver.sang@intel.com>
Subject: [tip:core/rseq] [rseq]  e2d4f42271:
 stress-ng.sem.sem_wait_calls_per_sec 2.3% improvement
Message-ID: <202511251654.c89d08f7-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0023.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9ab9a0-4026-4e3b-c9b2-08de2bfc8cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KtmDoOQ2wa7UsA4QmhflPWpVcVa445PY+5dVIQQO/8IdGYQrkmRsR9qEtY?=
 =?iso-8859-1?Q?OSyuuNLQYEXBXXlhpo4VHHBCYdHXxDj9+nyNu8/MrHmacFwGJpzVoTx7XA?=
 =?iso-8859-1?Q?BDPi5d9NNyQ36defH+kv/Jy8IQHfnjnoPUOMnH/DdGxf0fu0RWPlbi55Nl?=
 =?iso-8859-1?Q?UUD0KMb8TdeDFA4Pij9r4UxAip3a5iipXmJrpgLmd/h3/313oKvTBPlc7b?=
 =?iso-8859-1?Q?GEaUNbG8BSjyaXFJ+IfRlP5TuH/1QnTo825Uu1KOncGTxHITi+eeIivVeL?=
 =?iso-8859-1?Q?qAAD/5hkoM/A7ZVAdcAdbBbVv+etzPjOlY09LsMhWToqTrBIPCw5mjK0MF?=
 =?iso-8859-1?Q?CPUzgj9atSnzO3oeVa4ER1SPSL1v31zC+DAdPGUZfFtdBtqItjT7G+jSeK?=
 =?iso-8859-1?Q?TOZWYwfu0TAeWiK+qRzORlodwJOljpgkPJlA84JLBVB/nTYVGzJ409eYzz?=
 =?iso-8859-1?Q?W2Y9ra7+7NiJ5/dklv286OQ34Opin0TBk77RiZyeUdXKzb2gYiojKLhqO6?=
 =?iso-8859-1?Q?Nh3bbp0ZXjJ3pFMnRTpvX/Ot6EBwYAllEpYzCsM7s8OqhREt4WyoxmrOtL?=
 =?iso-8859-1?Q?txlvv4P6MiwKD5op9rVE1VTbvHjKr5AK6jcgJt5UWvWMZjxp2D7MyXYU4O?=
 =?iso-8859-1?Q?Ynyz66S5p2bITbJ29Kjx0DR3ZkRsanf2bX98oRYVsOXqXF+AasqcUMWXW0?=
 =?iso-8859-1?Q?5iwSfwv3CGqmHY9/ejmJvaWuHpMa+53B/QLDccwAE9bllDWx7xum4/M37W?=
 =?iso-8859-1?Q?zNGqmE5d+VCCmh0eDuLLFEzwonSUHbyP159ONTZZnJoQHLzT5KBm1pqzW+?=
 =?iso-8859-1?Q?Gn4YxUgjkH7RCRhln4nZRRlKomQNSDq+n9UuxqYRJRLuF0rcfhK1AjUUwR?=
 =?iso-8859-1?Q?kX8ej5vkh7yVD1L9HPFU1KBYgdwG+kK/zFVv+hpQZaB1VHrurXcPjt8/I8?=
 =?iso-8859-1?Q?ci7ubLHK2KNYRU+D/hmZjevGFgV6Or/W4WxE7oIbBmccr7UEP4VM60Dnei?=
 =?iso-8859-1?Q?nb0WIAgXFb+IkiPSugLr1e6xwRGjYqwWJiwSaEMIs1gkscZVtG5ADpaz4W?=
 =?iso-8859-1?Q?0uYNCCIuhKxDAsmbEYGNgCI+us7zjzhBd/BAR5FmjitPZ557MJmNWCAnfs?=
 =?iso-8859-1?Q?z1iZ9alsElhC/ihQcKoFlzISmLKaCv01bqaSYwxRQ/L/JhpIf3U3vsHqSd?=
 =?iso-8859-1?Q?nXrCqSCZMhrCO+vAwj3mWEkTnN18ZV4BVCAlGJwWQbduj7c8noBozSk7sC?=
 =?iso-8859-1?Q?eMmYS+EWGLzI3bjO4K/RbWUZcMRWojBvJoBueebZKgpSlaFMhsC876P4tC?=
 =?iso-8859-1?Q?r6UnkYIM9JOdX0CHmh/0FsPDHSrgiI3VJpRRAkWCc4lWDYAkxq5hhd8oq0?=
 =?iso-8859-1?Q?vdibkL5rzp8DynKX5dHEM+DDeY5fI//Zott6ajKRmT4pFQEG1vfjp3MyNc?=
 =?iso-8859-1?Q?r29KqltFPUVgskbj19f7y/W1k8ALmZB23fwL1QGu3Fq869T7gaMUiQ+yum?=
 =?iso-8859-1?Q?4UvIvJ/Kdq35zv7viY5p6b3w+1XYCKx6ITYTvZ//Z3hg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YbkJvCyErZPweNnQKZ23LQ8tSaYGOmMxHptilKoMvsaYnxniPIRhYSuab/?=
 =?iso-8859-1?Q?Tk4WPGVviYxyDhVUwnL+76HLamkBsaHbGrRD4HbdSgO9spq7Hhmn0mNWjO?=
 =?iso-8859-1?Q?qf3tAd1I9FMu9QaXQffx8qiQ8JocxMI59SjWDCShwa3a38O9JMnhpDO+11?=
 =?iso-8859-1?Q?AMceFy5XLKlTv6oirB8N2xVvdOd6TUu4QzvFtgAFFS3srQvJkD+Sh6ktyw?=
 =?iso-8859-1?Q?FPW1h0EmBcYgrSjQpkD6P5Ss1Hfy0mYCvNlZj3ysysQIwizXNwFQ9xQu+A?=
 =?iso-8859-1?Q?eBB3+Snc8Pn3i5nI7HsYeIAC1WMGj4yhyg1b9jINEQ9iPK1FEpBobNdROG?=
 =?iso-8859-1?Q?GTuZxKyRcyBa8yTL3XV0gnjxdhBkyzUcAO1zoAa7Z3Nj60MmtuEkdxlvBz?=
 =?iso-8859-1?Q?c0Zxe805xki7CQ433nrMNN23vt2ZWIdGKH4jt9jnxaT7ob3UgpkPY+GBJs?=
 =?iso-8859-1?Q?CRz6fGwhFEfW8mA9Ce+j6x80v8Rf7jDGgJ/CRRTYFpduUIMuIJziHMXZpM?=
 =?iso-8859-1?Q?snUuyqCvHNa1xDQ8RDF8bjc9cVRSeulhAnB4XNjcUGerX73S+tUkhvKbek?=
 =?iso-8859-1?Q?ZIB8KBYK0W9QXhaJ/JnBk9QYOsNLSYMSdljMwxZVaIXVO8joKs32MzZFC0?=
 =?iso-8859-1?Q?Kl0Y03Gr3lnP9Y0R/2ZCQtvRtsBv/NVv79N5tw03fMcmvNx6pblIMcf9vD?=
 =?iso-8859-1?Q?rEysoNCg33NK7Nz1B3lMthUXJHikdVXyLQYCu5779mJMQzWklgwBiv4kT8?=
 =?iso-8859-1?Q?rjtE/Mcb7XtZfd9c5FmIJkmKq8ILQuy9uIbwoot9UvfED6gal1E4D6+dgw?=
 =?iso-8859-1?Q?JmT2/10kSf1L0nCwRwItnMgVI1j0neuHWFjWJ/tTtbJ483EQ+t1WO0lFKk?=
 =?iso-8859-1?Q?egXEQoXLXiNwBB/tEmQOMkIANzvPzRlqHoEODF20i3nCrmt/8hyXar00SR?=
 =?iso-8859-1?Q?OlEh3vXZS2xZsD1XJwj11tVVnux2LZfT75iBIvN1X6Hk1fN/aV2HYsc2lc?=
 =?iso-8859-1?Q?KopCDj/dl1SlReaev1z9bMkQPRKEMuZhdtWqz09XpwRLG79cTqp5Qbw2Qu?=
 =?iso-8859-1?Q?Y5LsgXvFsPf2dMHMMRRwMvo0c2djWULUjmKgmzI5N4V9lefEbCY5hhyoQk?=
 =?iso-8859-1?Q?ItHKLwicQRF0+JZRjO/zK95/1iYDQ1J+hGPl8veLDqnAB4dGGYg8OCi5/s?=
 =?iso-8859-1?Q?OW7vmO+SwQtSfThfppc7+aqT3nS/n029FHlXszYceQwnmp2fYDlOlt7iK5?=
 =?iso-8859-1?Q?x7tqOx3LPb9XZ3sVgiFj3Ye+/++RnDxeTJ74v7j+WL8CZNlrFx0v5BAmwq?=
 =?iso-8859-1?Q?vu5Yzs6bNs/83bQE07JA+LE0b0O2JDPqtXi0WL/gXyddz3ByiDmhdfHcyQ?=
 =?iso-8859-1?Q?eFrESSQi0gzlO49dlZhnKILzP9gIdO2FLkYwgqo94pqciN1ZDjyXPgDmgg?=
 =?iso-8859-1?Q?aGF9PI/ib4IlfsPut54IZbB1GrL3L/vI5NeqXIECTcmlMZw59OO6mEBiPL?=
 =?iso-8859-1?Q?LH4W6/1JBRGyQ3ydiz2WllzB8SVwDLwzqmEXD1671iHyC+O9HY3z5Mp2kX?=
 =?iso-8859-1?Q?QzndkjT4C767Ho8B6elcQD04rdWE7uKubWDHidvUrkDVdp8zYD7n2tRBsa?=
 =?iso-8859-1?Q?Fk4rn7n7QaFLO/d5sEM6Z888bHO6n4NOtnBTfhUP6tYYnmqZNWfRvTxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9ab9a0-4026-4e3b-c9b2-08de2bfc8cc5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:28:02.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRxU3V/FZpZRLNsZB2Klg34y/VkxfmvMAZafXGTPG2f1A8yoNyWy+ZRCm6b8F7lQpyu2SkxqiBIIDNNszx/y/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.3% improvement of stress-ng.sem.sem_wait_calls_per_sec on:


commit: e2d4f42271155045a49b89530f2c06ad8e9f1a1e ("rseq: Rework the TIF_NOTIFY handler")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git core/rseq


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sem
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251125/202511251654.c89d08f7-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/sem/stress-ng/60s

commit: 
  9f6ffd4ceb ("rseq: Separate the signal delivery path")
  e2d4f42271 ("rseq: Rework the TIF_NOTIFY handler")

9f6ffd4cebda8684 e2d4f42271155045a49b89530f2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    796.49 ±  5%     +15.3%     918.13 ± 12%  sched_debug.cpu.curr->pid.stddev
     19498 ±  3%     +18.9%      23177 ±  5%  numa-meminfo.node0.KernelStack
     22517 ±  2%     -15.5%      19034 ±  7%  numa-meminfo.node1.KernelStack
     41569 ± 58%    +192.9%     121756 ± 44%  numa-numastat.node0.other_node
    156472 ± 15%     -51.3%      76228 ± 70%  numa-numastat.node1.other_node
  17079533 ±  7%     -23.7%   13033056 ± 45%  perf-sched.total_wait_and_delay.count.ms
  17079533 ±  7%     -23.7%   13033056 ± 45%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
    385459            +2.3%     394214        stress-ng.sem.sem_timedwait_calls_per_sec
    385418            +2.3%     394172        stress-ng.sem.sem_wait_calls_per_sec
      3947            +2.2%       4035        stress-ng.time.user_time
     19505 ±  3%     +18.8%      23176 ±  5%  numa-vmstat.node0.nr_kernel_stack
     41569 ± 58%    +192.9%     121756 ± 44%  numa-vmstat.node0.numa_other
     22534 ±  2%     -15.5%      19034 ±  7%  numa-vmstat.node1.nr_kernel_stack
    156472 ± 15%     -51.3%      76228 ± 70%  numa-vmstat.node1.numa_other
  1.51e+11            +1.9%  1.538e+11        perf-stat.i.branch-instructions
      0.88            -1.9%       0.87        perf-stat.i.cpi
     81367 ± 10%     +58.9%     129281 ± 30%  perf-stat.i.cycles-between-cache-misses
 6.983e+11            +1.7%  7.105e+11        perf-stat.i.instructions
      1.15            +1.7%       1.17        perf-stat.i.ipc
      0.87            -1.7%       0.85        perf-stat.overall.cpi
      1.16            +1.8%       1.18        perf-stat.overall.ipc
 1.484e+11            +1.9%  1.513e+11        perf-stat.ps.branch-instructions
 6.864e+11            +1.8%  6.986e+11        perf-stat.ps.instructions
 4.197e+13            +2.1%  4.284e+13        perf-stat.total.instructions
      5.09            -2.0        3.14 ±  2%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      6.22            -1.9        4.29 ±  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     58.07            -0.9       57.21        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     58.59            -0.9       57.74        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      2.45            +0.2        2.67 ±  2%  perf-profile.calltrace.cycles-pp.rseq_set_ids_get_csaddr.__rseq_handle_notify_resume.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.50            +0.3        9.76        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield
      9.71            +0.3        9.98        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     18.18            +0.4       18.57        perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.37            +0.4       18.77        perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     25.20            +0.5       25.71        perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      5.12            -2.0        3.16 ±  2%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      6.24            -1.9        4.31 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
     58.27            -0.8       57.44        perf-profile.children.cycles-pp.do_syscall_64
     58.78            -0.8       57.96        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.sem_wait@plt
      1.16 ±  2%      +0.0        1.20 ±  2%  perf-profile.children.cycles-pp.__pick_eevdf
      2.45            +0.2        2.68 ±  2%  perf-profile.children.cycles-pp.rseq_set_ids_get_csaddr
      9.54            +0.3        9.80        perf-profile.children.cycles-pp.pick_next_task_fair
      9.73            +0.3       10.00        perf-profile.children.cycles-pp.__pick_next_task
     18.26            +0.4       18.66        perf-profile.children.cycles-pp.__schedule
     18.39            +0.4       18.80        perf-profile.children.cycles-pp.schedule
     25.22            +0.5       25.73        perf-profile.children.cycles-pp.__x64_sys_sched_yield
      0.58            -0.1        0.48 ±  3%  perf-profile.self.cycles-pp.__rseq_handle_notify_resume
      0.96            +0.0        0.98        perf-profile.self.cycles-pp.update_curr
      2.43            +0.2        2.67 ±  2%  perf-profile.self.cycles-pp.rseq_set_ids_get_csaddr




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

