Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBE199A1
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714459828; cv=fail; b=EyemZ11Wp5OSY2eyZtJyiOdG1cgLlztiMntNOXKVkNblA4vek9wFw4yMn1QhRndFgs3ddkA6LuE1z5NxghReDLO+qMNnXv8+usWjIkQyrYe6tJWUWZFKOlA1Uz15/gmMOo+EnthckQNqR1UkS0sQlATKolkKxMsko1GFBWiLOUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714459828; c=relaxed/simple;
	bh=M13SZ9V3aXXXCvSaLdQMhPnD5lbyyO7AEw9vbW3K1sE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Gt+Ku70EIHnjda8cce49Yh//PITQuDgqWjQnHrKT46HhMDZ926U3Ah6tK/patwXX09JM5f+JqGEDV/RrJo/yUqWncnbMBfH3LsV4wEQlwLyR5nBbsVRzIDDk7ITC9rhSJB2+yrS/N+aFQLtDlCcEWLMFVv4o8vlR8TKaipMtDcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAji0yzd; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAji0yzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714459826; x=1745995826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M13SZ9V3aXXXCvSaLdQMhPnD5lbyyO7AEw9vbW3K1sE=;
  b=VAji0yzd+SJQbztp/QYRH2Lmrok72aYgxAi5npNHIA6CPQhWRSxLs08l
   JYQv9LcNqsqUI/T9sdODqXqhtawRs963REFv7vG1wCEOKTINK1tungddb
   k7TuVxeaiAR0hIqQNP82j6MlCyaKzTN2CuGzK7xknkwES+5/S3YW9o9dM
   Ym4ukHd7oG4/AoO8z2iUCnstKsYAqwdsLZE4yPxBgxN5kWx3vRrDveW9L
   Y61pxOBnQKP9c1fyjtfh4LVstNPZSCYeTkTMbhtEkygqXKqrion9Tb3Hm
   rW1LgIuepF5SIyXDsAva2Ulz99QaT4IEYFv6OhTX2CFDozz8rufntcQ05
   A==;
X-CSE-ConnectionGUID: uMN0CqNASliVegZw9Nm2wg==
X-CSE-MsgGUID: ct94iLH0QSqe2sNpIvbvrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10317313"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10317313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 23:50:26 -0700
X-CSE-ConnectionGUID: hBhl1P7FRr6Suz4eX85lAQ==
X-CSE-MsgGUID: 4qIWS77kRuWPDC+4AKbRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="49556346"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Apr 2024 23:50:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 23:50:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 23:50:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 23:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MniUlk7AOAZJCrzhYbyAcbjqLR83mCVfbpryMNMcJy0yoSN/MvLO8GOOFumsjXSqiOQTGR650LWA7JWmyVBn+/k89YmUiSYFJnnHln5LtUvUfG0djW/oPkJ0xbkOXZj7a77DMjLF8cCG6lOB74+tkPOkNtptlIBicGVIHcmZpsbV/g8w5+INP3Gj5kn+kJJscF/BGPO/eHCASRN0dTBSr6ge4SzL43ZmAibijhEfPb9X5f2wKUj8lZiUXzKOC8Il3eunHQn81ua+2Ch2XaqoaL3Ex6Y9qMOKRMbUrNxX8JQOXu4Bk84LrhO70q2zUcFR8GEqJV+6pR2rylOIjUIJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOl1IE6OdOhYe0ttzQ34SBHq4GI9XX60wCNHrXb5KjY=;
 b=TNx4bWMO7evliomQnp0VgwqknvzVfqiLBJPXX00Y177zZnNLuJ9T1z1+o0XZR6YXljrH7fThcOruDNykNa8BsMq4r8BX1Gv9ADnXfDRP7sSaxohBguPM11Ke+7g9/sRJaMnHw68suycZcCW8lBJUphZq0alFbayZDMGp7Arj5icPXkn+BvyvuTcH7/oJs9Slx3egzz7NDA6wtXo/oxxlSZwcXMmdhye83Xoc6hZHv5i8NlM2d9I73jd37+mxJ7xX6o4za9/MxIAN41MwmueXgsl7s6z4zo2oSAx6KXbl+9yaNO/rdu+Hh+XJf836FkFt6zu1+4cE53N62tANzY6i2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 06:50:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 06:50:17 +0000
Date: Tue, 30 Apr 2024 14:50:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Gary Guo <gary@garyguo.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Boqun Feng
	<boqun.feng@gmail.com>, <oliver.sang@intel.com>
Subject: [nbdd0121:thin-lto]  b0a98f58bf:
 WARNING:at_arch/x86/kernel/cpu/bugs.c:#__warn_thunk
Message-ID: <202404301415.c99f265e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH0PR11MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8adea0-c396-4296-3b97-08dc68e1cbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5dq19OB3i/++WAkdAymnu0ZcD0ft/VVrmg/HsN8yanJNugbigx5M1Idg6zfj?=
 =?us-ascii?Q?Vhf8I3h/wUR/PiKjcesargXFoegd7I8PekUwitb69OKV5vDVYx/fBcns+NUe?=
 =?us-ascii?Q?1emGTYzljdtkvR/DIbpaOV1/boj5R038Tu+jfZayqN6vnx+Pz2bwIER0mJl6?=
 =?us-ascii?Q?bRjokvTjtmWNki+lUvUBp/g1U6lmPrAqZdOs0VFcYqqxsOMu99fsU1rf+RBU?=
 =?us-ascii?Q?v9ZlM6apG6ARmKmCh0/ceDkg/bfZ/62QPfoSH915rnnid+kPTfhWCfwOsY/l?=
 =?us-ascii?Q?wACGpteojrQNTxnRJh5Mg9L+63zFKcObziV1HvF16Erbn3V7qXUQKRywXDvl?=
 =?us-ascii?Q?ucRCDC3mz+CQTIGI+kiY/W85vm/hMMzcsRidQIYfWPDJrlsWh3yknU27cwIQ?=
 =?us-ascii?Q?AqW+Kauglb7zCn/SbObicdh03s30X7CQ9w488v/K0LYfCDPs25oYj0OpiPbO?=
 =?us-ascii?Q?XXXgcxU0KGYEAszxTjKSpw811RantEk6Mb4CZajSdocvgfhTF3aZONG2puh9?=
 =?us-ascii?Q?t32DYlRSi2ExtCSAXouGZ6CDmxRAp1G9vDyYovtVuVC4fHgnLD8y+6nuYL52?=
 =?us-ascii?Q?eEbC/oKBa65wJ/Ownf4n5i9dpYa9/5j6ByFLpGr745HI0ndLyi8HvDYFoZwt?=
 =?us-ascii?Q?M4o8TIhf+HnZg7PIzl9e9zIM5ojV3npJOvt5LJpvoKKFwJ5RH28dTRg+V1/o?=
 =?us-ascii?Q?6FquMutcB0Sb2XovI+C+zr/aa7zyn1wC+PEtXLiJGi9WG8Gva7i0cwi7GAzR?=
 =?us-ascii?Q?tPl2N77TEGE8TngCHqOFUigVsB6+x5TPspMwhFUmQCMfdUJomtl84AeQplxF?=
 =?us-ascii?Q?T5rkhaSwprUal4tZjxhm5KsS60NDjU3MMPLJRi4D0H+73cKpP6hdM2A2/6ab?=
 =?us-ascii?Q?aS1PrKekkZ2CWhPkL7KkZ3bn9ubKB3kEoYcevb4G1OiApEbfWoY0y+dYwZjS?=
 =?us-ascii?Q?26g4TuhukM02b0AeFaGgbYvkimQnnD5wC0jjZNqzCsj8/3OHfqxNTGsvtZ9e?=
 =?us-ascii?Q?xZwBDNDNFkplWReBTxIFs5ve0GLH7RnhnKLG++vDEfMCaf1brsqoZjVc1JTK?=
 =?us-ascii?Q?EpTorqEXgYIQi+3d0ri5QjDjuQuqq3WVdetDF2It9Rw6zP1Rm48DomcCy/QN?=
 =?us-ascii?Q?Fmrc0E/hvzH14U27ZQoS8HJRSzxC532l+26beouKoKzdDhMwUWYO1xAjU1aa?=
 =?us-ascii?Q?3hd74/ju5QU1DfdnDde5a7bDI0Clmo5fEj8dZuQSaFYxmp1nI++YMAfc/FM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SF6pLBMlyzfre0euh+8U6UA3lGuZx8xwF1yaReNxzSepG8xqKKjb7WKq9GGh?=
 =?us-ascii?Q?dLS0DQXLX3RIOyE5WpCrWazlJiOSPYdkIC+ljvuSzBU/Fa2VXuyZmu+x6Kf+?=
 =?us-ascii?Q?eRm+2KF7HUTMprjhxD3bw5moS0cQ92VrFC328egG5woPyPE7X4Uos35SHwG8?=
 =?us-ascii?Q?D3puBfoyfg0ml0oZ20B0rBaO9+8nPnVo8l5z7DVy6I8zVNQjn0mDZAbkPOEj?=
 =?us-ascii?Q?8zBAeM76/lghs3syvzd243da99dLjHnUHaqU8ZeHpjZehx6SxWySN5AnDY9l?=
 =?us-ascii?Q?2wBYiGjynkEJdf6hg7xEnOo5O5oZfrMA2/cuZfudQx0Sxz9rqrMzPlHWaCKu?=
 =?us-ascii?Q?O3RQqkFn+LdxTy7SaGkTKdbsakWW3dfivXDY8WYrhyGsnntVSWRY6bTxxmG/?=
 =?us-ascii?Q?jeaFC9jyQz1aToz7dmqq35l+TjzVFoh9reqBoGKWZNPGjOYs335JBCeHo0Tv?=
 =?us-ascii?Q?MugZvorRynWnKEodQPQHqVmewEb4HC0f/feSerDfgRuSR+Vd01nGLDz36kvz?=
 =?us-ascii?Q?NSlJ+fJuZPTQ0htqnQsxyJFY51EUWiTe7d2eSgbVx+snwqRzHg9GO1IlrINb?=
 =?us-ascii?Q?g+XO8ffuLB8cD6XFe6upimXuATFS7notSLSc+ujLOCi42RyGNlXT+/Ba28UQ?=
 =?us-ascii?Q?g5MF5H3yz5hcRZ9sQR7cwi6Egu8ABd2jtD0MeF1CWMoD849DTGrU3FrLUdIB?=
 =?us-ascii?Q?ePtPEJolmpSA9Wm/ZRovt61SBp39Vm9DWVfcLDD6yI/N9p6KBDgNznzu+Nlm?=
 =?us-ascii?Q?hGNXgMLOjFxDvArvSdZHjOgTCZ3DNJHiZGT7K8cwKlArLo7YstvCJFNx9+aD?=
 =?us-ascii?Q?V3+UCVpxFE0vB8oEfwgt9VnrFeTOn0pPG1mTFm+FbJ81gJGooJKv8xJK/14c?=
 =?us-ascii?Q?sO79A6c0/DjhMFg3ZCtXdW4CpnVN5OdW8d0QrwBBlVAiA4SypfWJEHwdYtz8?=
 =?us-ascii?Q?zHZFB/w0RVxdUJc+kw43RHpenJ243WDVcBp5DyyccJtdpd9Oxnpkmx44lWna?=
 =?us-ascii?Q?cYawVyTfXnEmg6ClcBcNcHoPXozfgJ0395b7tXa/s6UH+oCCv+dW13l24sXo?=
 =?us-ascii?Q?RY3IdR8ckKAmn5SuodgAC/JMJ555U5shLv+DW+kmkBy/0Rv11WXFrrvPUU3D?=
 =?us-ascii?Q?YWKollb3bxj+0UoPqcBw/+FP93kkJ23Oj7eIp+oO9wJLhguogCSQ794mQrps?=
 =?us-ascii?Q?q1jclDy1ODbakac9GjJlNZ5F3dDte+dp9Wo3Y9p3rDWtKttPvTiTPn5w3gzA?=
 =?us-ascii?Q?rpvqgKIGqBrGNDONuh7Vl6U9xf9WNc7mf3fQGw5GKd83scISc9DztbdOjMFk?=
 =?us-ascii?Q?TH8MJXvznG542lO0ZaW18ZIzhWJ8vA3GGjJlTbQcH4RhYnxfLSGIaPZca9SI?=
 =?us-ascii?Q?PHCxKpBmnhkTCbWkIJm8SGbzz6ZFfP8TqbapZmOxz3RSP5pKuVd4A8JyeCHp?=
 =?us-ascii?Q?a8gGHX0I0LHMJvjiF7oo74FRDe79+zk6Z8cMep8ES8AduzWaTxlFO9uCNOXp?=
 =?us-ascii?Q?zN0AcGiZDeTO76hcx10PYFkL3fBIfL9khNgBWLuKwfwo2TOEOzeAMNL3ElIS?=
 =?us-ascii?Q?gLqoZUj2ijLBZX7yFy8KExR1n5ejasQBYfqw+H/MijLgEFTMJxv4oj1tMkUO?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8adea0-c396-4296-3b97-08dc68e1cbae
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 06:50:17.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ksu/9J+h92ujU+G1vK7XqcF9sWxux50qu6fzn04hqIyeBv07luhadXR+Y1a7eyy7NsqiFqOhkdwPr20OZjYt5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
X-OriginatorOrg: intel.com


hi, Gary Guo,

we noticed this is a 'WIP' patch, but not sure if the report could supply any
useful information while you working on it. so just report. if no value, you
could just ignore it. and you could let us know if you don't want us to test
this thin-lto branch further. Thanks!

below are details.


Hello,

kernel test robot noticed "WARNING:at_arch/x86/kernel/cpu/bugs.c:#__warn_thunk" on:

commit: b0a98f58bf741dea8f63918b49d7284a8813529a ("WIP")
https://github.com/nbdd0121/linux thin-lto

in testcase: boot

compiler: clang-17
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------+------------+------------+
|                                                     | 8ccee0cffe | b0a98f58bf |
+-----------------------------------------------------+------------+------------+
| WARNING:at_arch/x86/kernel/cpu/bugs.c:#__warn_thunk | 0          | 12         |
| RIP:__warn_thunk                                    | 0          | 12         |
+-----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404301415.c99f265e-oliver.sang@intel.com


[   10.955420][    T1] ------------[ cut here ]------------
[   10.957286][    T1] Unpatched return thunk in use. This should not happen!
[ 10.958546][ T1] WARNING: CPU: 1 PID: 1 at arch/x86/kernel/cpu/bugs.c:2935 __warn_thunk (arch/x86/kernel/cpu/bugs.c:2935) 
[   10.961253][    T1] Modules linked in:
[   10.962024][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-00040-gb0a98f58bf74 #1
[   10.963648][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 10.965496][ T1] RIP: 0010:__warn_thunk (arch/x86/kernel/cpu/bugs.c:2935) 
[ 10.966458][ T1] Code: 90 90 90 0f 1f 44 00 00 80 3d b7 39 f0 01 00 74 06 c3 cc cc cc cc cc c6 05 a8 39 f0 01 01 48 c7 c7 e0 0b 7c 82 e8 89 d9 0a 00 <0f> 0b c3 cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   8:	80 3d b7 39 f0 01 00 	cmpb   $0x0,0x1f039b7(%rip)        # 0x1f039c6
   f:	74 06                	je     0x17
  11:	c3                   	retq   
  12:	cc                   	int3   
  13:	cc                   	int3   
  14:	cc                   	int3   
  15:	cc                   	int3   
  16:	cc                   	int3   
  17:	c6 05 a8 39 f0 01 01 	movb   $0x1,0x1f039a8(%rip)        # 0x1f039c6
  1e:	48 c7 c7 e0 0b 7c 82 	mov    $0xffffffff827c0be0,%rdi
  25:	e8 89 d9 0a 00       	callq  0xad9b3
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	c3                   	retq   
  2d:	cc                   	int3   
  2e:	cc                   	int3   
  2f:	cc                   	int3   
  30:	cc                   	int3   
  31:	cc                   	int3   
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
   0:	0f 0b                	ud2    
   2:	c3                   	retq   
   3:	cc                   	int3   
   4:	cc                   	int3   
   5:	cc                   	int3   
   6:	cc                   	int3   
   7:	cc                   	int3   
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
[   10.969630][    T1] RSP: 0000:ffffb7f3c00135f8 EFLAGS: 00010246
[   10.970643][    T1] RAX: 4fecddd0f0d72700 RBX: ffffb7f3c0013660 RCX: ffffffff82a52410
[   10.971991][    T1] RDX: 0000000000000002 RSI: 00000000ffff7fff RDI: ffffffff82b12820
[   10.973378][    T1] RBP: ffffb7f3c0013648 R08: 0000000000007fff R09: ffffffff82a52820
[   10.974754][    T1] R10: 0000000000017ffd R11: 0000000000000004 R12: ffffffff82a0a0f8
[   10.976149][    T1] R13: 0000000000000000 R14: ffff8aa9e43ca180 R15: 0000000000000000
[   10.977562][    T1] FS:  0000000000000000(0000) GS:ffff8aacefd00000(0000) knlGS:0000000000000000
[   10.979154][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.980286][    T1] CR2: 0000000000000000 CR3: 00000003f981a000 CR4: 00000000000406f0
[   10.981739][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   10.983221][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   10.984710][    T1] Call Trace:
[   10.986395][    T1]  <TASK>
[ 10.987024][ T1] ? __warn (kernel/panic.c:240 kernel/panic.c:694) 
[ 10.987821][ T1] ? __warn_thunk (arch/x86/kernel/cpu/bugs.c:2935) 
[ 10.988675][ T1] ? report_bug (lib/bug.c:? lib/bug.c:219) 
[ 10.989549][ T1] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 10.990399][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:260) 
[ 10.991293][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 10.992220][ T1] ? __warn_thunk (arch/x86/kernel/cpu/bugs.c:2935) 
[ 10.993086][ T1] ? __warn_thunk (arch/x86/kernel/cpu/bugs.c:2935) 
[ 10.993962][ T1] warn_thunk_thunk (arch/x86/entry/entry.S:48) 
[ 10.994828][ T1] _RNvXCs2QyWO3yttfn_10rust_printNtB2_9RustPrintNtCschHAZg3Q02y_6kernel6Module4init (samples/rust/rust_print.rs:34 samples/rust/rust_print.rs:70) 
[ 10.997733][ T1] ? _RNvXsq_NtNtCschHAZg3Q02y_6kernel4sync3arcINtB5_3ArclENtNtCsaLd0RqVoAA2_4core3fmt7Display3fmtCs2QyWO3yttfn_10rust_print (rust/kernel/sync/arc.rs:783) 
[ 11.000098][ T1] ? info_print_prefix (kernel/printk/printk.c:1341 kernel/printk/printk.c:1358) 
[ 11.001066][ T1] ? _prb_read_valid (kernel/printk/printk_ringbuffer.c:2146) 
[ 11.002003][ T1] ? prb_read_valid (kernel/printk/printk_ringbuffer.c:2182) 
[ 11.002894][ T1] ? prb_read_valid (kernel/printk/printk_ringbuffer.c:2182) 
[ 11.003780][ T1] ? _RNvXs_Cs2QyWO3yttfn_10rust_printNtB4_9RustPrintNtNtNtCsaLd0RqVoAA2_4core3ops4drop4Drop4drop (samples/rust/rust_print.rs:8) 
[ 11.009628][ T1] ? __rust_print_init (samples/rust/rust_print.rs:8 samples/rust/rust_print.rs:8) 
[ 11.010475][ T1] ? add_device_randomness (drivers/char/random.c:926) 
[ 11.011323][ T1] ? _RNvXsN_NtCsaLd0RqVoAA2_4core3fmtRlNtB5_5Debug3fmtCsfhon98HOB6q_12rust_minimal (samples/rust/rust_minimal.rs:7) 
[ 11.012937][ T1] ? _RNvXs_Cs2QyWO3yttfn_10rust_printNtB4_9RustPrintNtNtNtCsaLd0RqVoAA2_4core3ops4drop4Drop4drop (samples/rust/rust_print.rs:8) 
[ 11.014778][ T1] ? do_one_initcall (init/main.c:1238) 
[ 11.015685][ T1] ? crng_fast_key_erasure (include/linux/string.h:353 drivers/char/random.c:309) 
[ 11.016630][ T1] ? crng_make_state (include/linux/spinlock.h:406 drivers/char/random.c:342) 
[ 11.020605][ T1] ? get_random_u32 (include/linux/string.h:353 drivers/char/random.c:404 drivers/char/random.c:532) 
[ 11.021414][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1043) 
[ 11.022358][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1043) 
[ 11.023396][ T1] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 11.024489][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1043) 
[ 11.025538][ T1] ? parameq (kernel/params.c:99) 
[ 11.026339][ T1] ? __pfx_ignore_unknown_bootoption (init/main.c:1284) 
[ 11.027455][ T1] ? parse_args (kernel/params.c:153 kernel/params.c:186) 
[ 11.028293][ T1] ? do_initcall_level (init/main.c:1299) 
[ 11.029227][ T1] ? do_initcalls (init/main.c:1313) 
[ 11.030104][ T1] ? kernel_init_freeable (init/main.c:1550) 
[ 11.031108][ T1] ? __pfx_kernel_init (init/main.c:1429) 
[ 11.032042][ T1] ? kernel_init (init/main.c:1439) 
[ 11.032929][ T1] ? ret_from_fork (arch/x86/kernel/process.c:153) 
[ 11.033788][ T1] ? __pfx_kernel_init (init/main.c:1429) 
[ 11.034707][ T1] ? ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[   11.035653][    T1]  </TASK>
[   11.036288][    T1] ---[ end trace 0000000000000000 ]---
[   11.037336][    T1] rust_print: [samples/rust/rust_print.rs:34] c = "hello, world"
[   11.039003][    T1] rust_print: "hello, world"



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240430/202404301415.c99f265e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

