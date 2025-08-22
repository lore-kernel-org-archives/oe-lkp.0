Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE757C9F
	for <oe-lkp@lists.linux.dev>; Fri, 22 Aug 2025 02:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755831552; cv=fail; b=KcP+hwOY8mfUmHqmHiUQ/f8PRLx7utEhX7VaOmF0nue1HAsFlA8afNkar8b2/QWGrGdHVgLubp0fczkLOoN0IBvGdGnoXbRLLb4bBj9VkoTIyqWzPhFz1KzXO/NK6zzFt3nKkT8R/cWYse6Pkc38IUkYk7re2bY3JKlXv0G9vCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755831552; c=relaxed/simple;
	bh=necKfO8hkKabHDrU0BS2+etFzw+tOVcuCxwr5gdXz4M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IieVoJS7XjqUBJZzTRdAb3TRJqknoD0nUIszq9WP5AOTTxm5B4OcO1u/fwVO55zbXNBvYpTthy2xWEpnH2VIayHrJAbF+9yIX0ngiyP8I9vRUQic3QI5dgITLd+tthjOaGVm5s/IZ725cSDojgWkxvIWGwqFJfmercsdPOsknGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSsu/ss8; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSsu/ss8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755831550; x=1787367550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=necKfO8hkKabHDrU0BS2+etFzw+tOVcuCxwr5gdXz4M=;
  b=NSsu/ss8QOApYdgj3xxJwt2sosBILoVemd7cCfDsybCFs3CTvbvQgliV
   bt/7x6OsIxxaoLG/uJhEaqdAjSK2u3Yw7BbGI3ywy6m9mMmxlCnfX/g17
   59Kxb3pl9VJspVULaoQnVxHdV0VnkXQ5Qhmz+jlxbsKk0cwrmAcaw9HW+
   vebqyX2w0Jj2/pABrW1JF0Jkc07B+6Z8mQ93kGL1la7VsppvsDwh6mdmE
   QWjBFuyddBYkTg7ZvEKMHlEk9NW/6ZPL+0J+xjGpHfbqD3mR9yNczbYvd
   J8qt+rip5gZ6Afv+43Bl9paTXXSKzfNJntNUKSpvbV43uP/6Xm+Hzupkv
   A==;
X-CSE-ConnectionGUID: hZ9IqgVbSEKFipolk+7wjQ==
X-CSE-MsgGUID: wxWUekDGTFW5kpKAt7xX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57847712"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57847712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 19:59:09 -0700
X-CSE-ConnectionGUID: 3po0Xb2SRdS+qhCD23EPHA==
X-CSE-MsgGUID: VFfPpwo4RW6EYZoEHe9gcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168080101"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 19:59:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 19:59:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 19:59:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 19:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFSNKi0I//jRTUmsG/PaZHVReYuPn4DPgqUCGtRyOgrwHgKoHFEP/iAqN8bPsadcdC/DTpgcqpryWW4+AsdnpfOr3oo3iQd9IG8nH12J1dbPB4r8JXKRxZdHA6rhKLNzO4QCNo2BWYIE6LBJzi+3K06X0IwYXGkP5XlrdB/n6vGBKGV43QIUyBOhWHkWLgJWMkuV4xrgVxGRhKZ65zAyqdxigoTait/U2U4BcrfYEFdoCbk/FC+nsT+mQwJrvN+tIfUlXqIu3M+lgI3rXVsGt/XD+7P6ktzPx7SmNPkdC0fGVOcPMAGniObxzDs3baGDXOa6L/DNxqp8I5g9TdXvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VWBKx9nXycF8mQoJn/hBh7XffkUYG7gg/1ZXkB+7TE=;
 b=sA43qkmUOr/Duq2MIMaBmqRGNm31tenhgQfcJCfG/Zt8cTSgnKNGIddnsxSKnLnXMYjsN9BZ07q8T27lbBSXC3ZphkNXU8KmRc1KHvYmA7MzHd1HEDZrd4ik0eFLvA6m9GFlkwHoQths2q9L70c+MIJeCASSVT1FJO/wgXbtMIgo0IvWaiUm4su9olL2KMMxhdiKlHsM8reRulrXhcWdtfhjT8INMD38komUZPrKrP1T1tlu90jkB9EgbuujX7IvW9yxnz1h5nOm1sSkgN0+KcucQ83CtV4v5pK058o6zilbGajbCM2svhjBofE8XFFKYuWOS9V75RFKfoZ8us3LLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ5PPFC295640A5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::852) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 02:59:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 02:59:00 +0000
Date: Fri, 22 Aug 2025 10:58:51 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <oliver.sang@intel.com>
Subject: [rgushchin:bpfoom.1] [mm]  3bd653416c: WARNING:suspicious_RCU_usage
Message-ID: <202508221000.dd8b9ca9-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0148.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::28) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ5PPFC295640A5:EE_
X-MS-Office365-Filtering-Correlation-Id: 1685a330-6329-461f-099a-08dde127d81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rpk5fzUM5ezUx6ewxbcFvzirD8mOGYfzkgIoOljkMV+/YpG2TaG8fNSM0wzJ?=
 =?us-ascii?Q?zGZJu464QJMPsxI3xlF+Y4OLtZU4P/kN5hVsGOLojacxh6kCnGpNlS5O9Pg9?=
 =?us-ascii?Q?oblST4KHde+O3jtqasAfCGYBxk3evORMmLbUsK9qCfBgCmX/ZDkZ5bSEnkVU?=
 =?us-ascii?Q?6I8UsCPP2+mI9UXjUdtIVuWLkVWw0yUPpF6i/46nacpJO4QHi3K/J4GPFcVF?=
 =?us-ascii?Q?42xeyAm+oPr3suTSpBiIoUMSNjpXGG0sDTErBFnAh04GHNNfxNaAXWLCUO1a?=
 =?us-ascii?Q?S/voJG7C0iI6Wxdb/2K6h9C9DlcTaV5tnRXRrGI6QrNOf6evRKCW5KbT0AWm?=
 =?us-ascii?Q?d0OFrWQw7YPs6kpEp2q1MYti8EH1q8983uhUYbTErpmusX2GKOngvKn3OYl1?=
 =?us-ascii?Q?PdWRnSHDcmuk5eFKa9Lj4lYSvlum+u4bQ4B9qjWJGzD2aLHwXiZEiwiP5syc?=
 =?us-ascii?Q?wRhhXHNG/OUyDmhH0vwOwUARogMPI3gxM+BVEgjjwWe3LMLgUcw8CrYStrSK?=
 =?us-ascii?Q?inK4q4AjWGVgcT1Lss4aEKLqrr2UaCafnRAN2uE2P8MMXDXLVC7tfbOt/7x0?=
 =?us-ascii?Q?X/4yL3uqP5nPZq3kuwUdi4FzsnjN/DM1CSo9Da18LFSXqIvvVVcsg4YI+8GV?=
 =?us-ascii?Q?ij4qG6l+wqThg3EPQ+zuUWn+nPxHwRPBKcltKaUqiS23CgyLzruAc6vo+eKd?=
 =?us-ascii?Q?CMeoscXGeBdU+XhOpxeHVfVd4SpbmQKwxhuFkhNLHp49g6uzfZ4mJh27NS5G?=
 =?us-ascii?Q?JuiX86E6buL0f2/IE+oxNrrLQPsrarz232jole4wrvIZA8AkFy5Kdf92qS0Y?=
 =?us-ascii?Q?ik4TsyhWweOfPEjcUk9XeIZHuhD+YY+G8jZcDHak7awalJ/uj3IUNwxXJ2T/?=
 =?us-ascii?Q?q7P9SMKN3ao0vlIc8SRrXegs2YXfreH3byo48dJ38sj1uN2bxmt94rYKdR3v?=
 =?us-ascii?Q?WGW3lm2H4j1DViUEJtvn9k4Gknb9oKUDdX4rSvwHcZsY0sRUFuTmCtZHBj/I?=
 =?us-ascii?Q?QykwcqcxnuymaeUHsKMob6k4JSiFbuZJCkQX8mNTMAYeMJdbij5ZC8SHemte?=
 =?us-ascii?Q?SJRFwoXZZnxI8bnQ8VVJ+AgyQ5IF1im5sghCfnkOPpaazDZFBmeRlTCIwKr1?=
 =?us-ascii?Q?rqzZWPxSlTW29ZOUwK8tKo9xcMfaRPAy0eJEJUGODovkVgLEF7EmQLMGeT0b?=
 =?us-ascii?Q?9JwRLU/m8rH6cV0C1U+o4O6KJTwfahHhLgiPhgMsxEv4mpNlGeVJdBsYR5HR?=
 =?us-ascii?Q?BB3KHY4UGCfUil2Xtyal5qLpTYx8DCECyMDylitZ37Lps1MyLz5iORc7SACM?=
 =?us-ascii?Q?18PLos4LODjbwgZCRyCRCVw+SZFpHO89csf3YfS38DsVFqk37B1h5MZNQvlz?=
 =?us-ascii?Q?0Dn8swi1+QtdYBhfvwpdxAcwVeCJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5WP6dyotnUes45aCBYnWgCi+w7oWJY5WlWaPxSNMvNfwzkfEr8UjrBmHZ4X?=
 =?us-ascii?Q?rpV0zRXoMXKDURtFEckiPBQG09BXDpdr5VJxCxEc8IFmhG33BsImswYzQteR?=
 =?us-ascii?Q?AjSKXr6M8ir40DQGuqKZhe5aifwxl1kd2p25rLx/mRLS7dSdAp0Qql4WDOfW?=
 =?us-ascii?Q?TP86NJalcvqF8GOscQmjB4dTD+1ICH6Lmnxyug08yrN85q8Ds7TQ62sLv0qJ?=
 =?us-ascii?Q?l90/ZxrAcWxn2GRZWQ2u0YmC4KGG9IE43DTS35ki8+sGsYj13Lepz1I0b5El?=
 =?us-ascii?Q?XLG0pQd/v0O1uW3q1JR4gDbKCnBdC966Yk3tnyerOAF6msXwjQ6bkgcmpMkT?=
 =?us-ascii?Q?6KBCOHnRrxcCvFwOOXOxQckUCLYd+aU92RROK25bEfCt0pDI5G2XoKU3Pw6X?=
 =?us-ascii?Q?y/bXPY+ncZNcV6d2oI1y70FiLTtLxl2hNRziH6VLxzwK/G8RE8iizAJw5mXE?=
 =?us-ascii?Q?/VEFlhmGFSjGWacGDavueYi9ruqvR00/6aDKA6Qt7E7Eeyf5MgBIpMc8VhHt?=
 =?us-ascii?Q?ADhOpZ1dbwVrlI7mMNGYnEqXW5KeFzQApx7jW1254hLxDgBBB5F3cHleYXPH?=
 =?us-ascii?Q?mbOJ+P5aAWOgHw4e1PP8XncqeZlgp0NeRpl9/f/kj0hClWswGKAdjyKXodtg?=
 =?us-ascii?Q?Q2RcudLKSKsz7yKbfkp+6oAPIRluSE5RCdOZjJz+UnhAntOB6yMuG8mExV0O?=
 =?us-ascii?Q?a+j2eQOzFRMUIFQGCH6nUQIMzpMkRnN63ctGIWkFPR2VelcS6siKZzLCkVJQ?=
 =?us-ascii?Q?dRDBmlTuA0bFqfJKtELOT/NKI5PUd0k/qGAL22PYOYgDnQjNl+1N7Wzwt8W3?=
 =?us-ascii?Q?Xc2uc8F7twfbzRea/IXRO7L3q1xnrD6NkqVNm+ymzAZEPkGHcCpL+GBVZkhR?=
 =?us-ascii?Q?G0OfR9llQl9fGC6P8JJnrBh8P5ul85UTas+5UO7aw76tznRoftj1+bfDyiBy?=
 =?us-ascii?Q?r/4YXr3/YDrFvBI8EEoMx4/jXPlDTTPUVQww93gj1TnCYTkzskA0666/CUm3?=
 =?us-ascii?Q?alK3DABKJUdbKm0bAlePRv4rpb8JW8+XO/Dvgy9n9OGp3ni/jbqivQzzreVQ?=
 =?us-ascii?Q?DRXgQSnbtVQoPk8XIMlJap9a5dtxUMbH7TPXeO8Y3Eue2LBa5IPPxFxbFd/f?=
 =?us-ascii?Q?XeeJp+mH2k+V93fPDeV4SF0qlhiKj8ibOvimFilF+e63xRr/Ax1XsAxbPsbK?=
 =?us-ascii?Q?AIm5EEiLArwVX1q15nCXShbnnB5I6pTeMdKnIab9TELonDIVJ4xlV7xSK0ef?=
 =?us-ascii?Q?J89zZGt7vcRis/yOeg1MeovcTKVyqYE6VYzYfVl3rPDlPNt/MSMi5AK/WIh1?=
 =?us-ascii?Q?vcJhQIHvmDVGyD2kgHp5/tPD7j7MH1H5LZqCKdL3iM6iyn1NVr9JkhA8LtZG?=
 =?us-ascii?Q?n3U5LY1WmJhmSCcJu8ypTzmXlrXBBYLUS77lz2+Z96fVkX7lR8aCTdY8047+?=
 =?us-ascii?Q?/8lJZcFWveLK8/YAfjsmgX5QKTrfAyuU+odojVCfuWCB0CmYfLwP5MFhRVWg?=
 =?us-ascii?Q?AHRYlDHbOlcYxzdpllEbO7Bbpnk2qXXqADNO+Q/zP/LyY2TaHXDI/AVWyMYT?=
 =?us-ascii?Q?KQmBBqJfsoZPui4y+8GFqHfqcsB2g2f1S6MnbiIW6kmuzwuAZurzcEAJmuK7?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1685a330-6329-461f-099a-08dde127d81f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 02:59:00.3601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC0IdmoLvxlgf62Uj4xfjYnV82qQPGHaqzely4+vAjfC9GRkCFQwSvsDyt6esHVFMt4JmfkN8OrOy4ll2QQumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC295640A5
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 3bd653416c3eacb6e0160c6909e934b8d720c028 ("mm: introduce bpf struct ops for OOM handling")
https://github.com/rgushchin/linux.git bpfoom.1

in testcase: trinity
version: 
with following parameters:

	runtime: 600s


config: x86_64-randconfig-003-20250820
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508221000.dd8b9ca9-lkp@intel.com


[  136.039711][T22479] WARNING: suspicious RCU usage
[  136.040023][T22479] 6.16.0-00002-g3bd653416c3e #1 Not tainted
[  136.040397][T22479] -----------------------------
[  136.040707][T22479] mm/bpf_oom.c:32 RCU-list traversed without holding the required lock!!
[  136.041238][T22479]
[  136.041238][T22479] other info that might help us debug this:
[  136.041238][T22479]
[  136.041929][T22479]
[  136.041929][T22479] rcu_scheduler_active = 2, debug_locks = 1
[  136.042488][T22479] 2 locks held by trinity-c6/22479:
[136.042852][T22479] #0: ffffffff83e609f0 (oom_lock){+.+.}-{4:4}, at: __alloc_pages_may_oom (mm/page_alloc.c:3785) 
[136.043565][T22479] #1: ffffffff83e84b30 (bpf_oom_srcu){.+.+}-{0:0}, at: bpf_handle_oom (include/linux/srcu.h:161 include/linux/srcu.h:253 mm/bpf_oom.c:31) 
[  136.044255][T22479]
[  136.044255][T22479] stack backtrace:
[  136.044696][T22479] CPU: 1 UID: 65534 PID: 22479 Comm: trinity-c6 Not tainted 6.16.0-00002-g3bd653416c3e #1 PREEMPTLAZY
[  136.044700][T22479] Call Trace:
[  136.044705][T22479]  <TASK>
[136.044709][T22479] dump_stack_lvl (lib/dump_stack.c:123) 
[136.044717][T22479] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6872) 
[136.044727][T22479] bpf_handle_oom (mm/bpf_oom.c:32 (discriminator 7)) 
[136.044736][T22479] out_of_memory (mm/oom_kill.c:1179) 
[136.044744][T22479] __alloc_pages_may_oom (mm/page_alloc.c:3836) 
[136.044758][T22479] __alloc_pages_slowpath+0x3bf/0x800 
[136.044774][T22479] __alloc_frozen_pages_noprof (mm/page_alloc.c:4972) 
[136.044788][T22479] allocate_slab (mm/internal.h:807 mm/slub.c:2451 mm/slub.c:2627) 
[136.044797][T22479] __slab_alloc_node+0x159/0x340 
[136.044808][T22479] slab_alloc_node+0x8a/0x1c0 
[136.044817][T22479] kmem_cache_alloc_node_noprof (mm/slub.c:4251) 
[136.044823][T22479] dup_task_struct (kernel/fork.c:183 kernel/fork.c:869) 
[136.044833][T22479] copy_process (kernel/fork.c:1999) 
[136.044837][T22479] ? rcu_read_lock_any_held (kernel/rcu/update.c:386) 
[136.044853][T22479] kernel_clone (kernel/fork.c:2599) 
[136.044871][T22479] __do_compat_sys_ia32_clone (arch/x86/kernel/sys_ia32.c:254) 
[136.044891][T22479] do_int80_emulation (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:172) 
[136.044900][T22479] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[  136.044904][T22479] RIP: 0023:0xf7fd9589
[ 136.044909][T22479] Code: 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 0f 1f 40 00 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:*	55                   	push   %rbp		<-- trapping instruction
  24:	0f 1f 40 00          	nopl   0x0(%rax)
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

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
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[  136.044912][T22479] RSP: 002b:00000000ffa570a0 EFLAGS: 00000246 ORIG_RAX: 0000000000000078
[  136.044914][T22479] RAX: ffffffffffffffda RBX: 0000000001200011 RCX: 0000000000000000
[  136.044916][T22479] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000008ad48e8
[  136.044918][T22479] RBP: 00000000ffa570d8 R08: 0000000000000000 R09: 0000000000000000
[  136.044919][T22479] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  136.044920][T22479] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  136.044939][T22479]  </TASK>
[  136.066620][T22479] trinity-c6 invoked oom-killer: gfp_mask=0x40cc0(GFP_KERNEL|__GFP_COMP), order=1, oom_score_adj=500
[  136.066620][T22479] oom_policy=default
[  136.068155][T22479] COMPACTION is disabled!!!
[  136.068470][T22479] CPU: 1 UID: 65534 PID: 22479 Comm: trinity-c6 Not tainted 6.16.0-00002-g3bd653416c3e #1 PREEMPTLAZY
[  136.068474][T22479] Call Trace:
[  136.068476][T22479]  <TASK>
[136.068479][T22479] dump_stack_lvl (lib/dump_stack.c:123) 
[136.068486][T22479] dump_header (mm/oom_kill.c:75 (discriminator 1) mm/oom_kill.c:479 (discriminator 1)) 
[136.068493][T22479] oom_kill_process (mm/oom_kill.c:460 mm/oom_kill.c:1052) 
[136.068500][T22479] out_of_memory (mm/oom_kill.c:1198 (discriminator 4)) 
[136.068504][T22479] __alloc_pages_may_oom (mm/page_alloc.c:3836) 
[136.068520][T22479] __alloc_pages_slowpath+0x3bf/0x800 
[136.068534][T22479] __alloc_frozen_pages_noprof (mm/page_alloc.c:4972) 
[136.068546][T22479] allocate_slab (mm/internal.h:807 mm/slub.c:2451 mm/slub.c:2627) 
[136.068553][T22479] __slab_alloc_node+0x159/0x340 
[136.068564][T22479] slab_alloc_node+0x8a/0x1c0 
[136.068571][T22479] kmem_cache_alloc_node_noprof (mm/slub.c:4251) 
[136.068576][T22479] dup_task_struct (kernel/fork.c:183 kernel/fork.c:869) 
[136.068584][T22479] copy_process (kernel/fork.c:1999) 
[136.068588][T22479] ? rcu_read_lock_any_held (kernel/rcu/update.c:386) 
[136.068602][T22479] kernel_clone (kernel/fork.c:2599) 
[136.068618][T22479] __do_compat_sys_ia32_clone (arch/x86/kernel/sys_ia32.c:254) 
[136.068635][T22479] do_int80_emulation (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:172) 
[136.068644][T22479] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[  136.068647][T22479] RIP: 0023:0xf7fd9589
[ 136.068652][T22479] Code: 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 0f 1f 40 00 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:*	55                   	push   %rbp		<-- trapping instruction
  24:	0f 1f 40 00          	nopl   0x0(%rax)
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250822/202508221000.dd8b9ca9-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

