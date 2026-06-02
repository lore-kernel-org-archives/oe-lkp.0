Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B023630B9
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jun 2026 02:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368944; cv=fail; b=X0SZ1G3UBUjlgetJwrhWXQkXkLJJZJYIDUpy0b6nMSKMCcxhwXLn/lm1sFFTm50wpUxc9VoDsz4EkVa94CeX3R85aznInqDDC436Eex4QUhGursIFaAy31HotEN4sJpIsm++/Nny6UqXtSJ+1zyrCtoCfhZaFTNwMpDF5loH+4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368944; c=relaxed/simple;
	bh=ZMFH+QYfgb7i4p9NfbSthoGSQ4+0tk8r2P4aRov3lFI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NQTks/NXhGDlcijiWfMLlfaLcALo11g0Eo7myWY456L+0VOyqzWamAoswyezC3l3yJkyv+qqCWdqL6peakv/jzCraGHbvANj62j2wW91lUwytOiZfshN1lUOMDVdSQL2O7dhSgE9IupFAcaD47IHSJknozj4Q1eqwBy3XhYzFb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFFCd0kU; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFFCd0kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780368942; x=1811904942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZMFH+QYfgb7i4p9NfbSthoGSQ4+0tk8r2P4aRov3lFI=;
  b=BFFCd0kUbexN4zM+xE7hIyJYzhN2AE8jftrTNNxwZ6xrxSkEPLEwUra2
   j0Zn3YERQ234OckaWH6CGZd2ZmMwPmOqPZ+HR6bzlQ3idEjcht+94y3T+
   GNHV6Y19wdW50xgL6O1s987z+NPqxg0sIAvWMczEv0hfZInQ/TbA6/8Jh
   Np6DjlvGZ+1S8RUV9uyXAdGi9NIOELFWA1YR2xUAlpL4aVSrLPCASeBOv
   RLbuvED9ipBnXyJs9ClKEvtG26Ssg6jNUu7KhjgM1OOMjilXA4EmB5oYe
   lh3uOD7GOCY6dmvEhpMDzeNQMLC+U41CZ0pU/0WRfs4vuKkUfnzR4oQzH
   Q==;
X-CSE-ConnectionGUID: suZfUdDTR+CHGxih5M8etw==
X-CSE-MsgGUID: E1YAYMU4SFeGWfii6JkXRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83716575"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="83716575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:55:42 -0700
X-CSE-ConnectionGUID: vExvSbvPQWqvlQ7ejfT6Pg==
X-CSE-MsgGUID: jXB+mvX6QV2ecg7QxPGRtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243584942"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:55:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 19:55:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 19:55:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 19:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nh6JqgEo+WPBwpEEchVBmhGwCWNwRjBM1gpxH1M5I3OKJyHHY8pfH5PzcOlMOZkm/mZaR+oXD97OIRjinT4rqZ00eRzWgVyyKgoZuMYCilIa0qcYjuJLGqGem/Yp84IIrYvQpxT2kTPpGQE01I/4GOuMykq3cY1UAH0n3Ni88rWMmeGZlJIhQ6ZqwB/0PRV9zAcTbqf8BCyD8xq5KelK858WrbE9GnowwTsW4Gt1qM4isNljSk7WZluOYiUTLU86T1yd4UXrx+XhRT7zzgrxeyM52TZWXPX8RUXRbvRpOFpKL9ArpRd2CXYBnlUsQz+ZuIXcIaWFJ49j8VcpRbz2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3n0rA0xuKFniAQhi35TALNWG3KHFT08ljWoFSQEFlQ=;
 b=YqqIjkDo1rE3kyJ6AP69ShcSnUBfVjfXLmZ1FgPwioeGDqVKXN4zhWlZJlQ9KwLyVl3XwU3By+gK05wKMzj+NTL/XZs+WEc8qLyeQWo4+zbjKapkZLIs+ej4PIMTCKg7AUwppMxqBMG6OWtuY1nwyR6Y7N18vjAvU8NpU3f4HdA5P/z7GYiIdeFXtehCkgM2Jy56yb5jfwf53PnbikvD3R06CQhd+SCUvj8vz97iH+pEvJWHXJgQFqaxuD8MD5yEAWGLSHMsD2BqlZLsdmMWn888+suo5Ty+zdUIup2QE+ZFeWopVi1GEnu9lGVDbJf617kpylzfiCOeVODy/NS2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 02:55:31 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:31 +0000
Date: Tue, 2 Jun 2026 10:55:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Tejun Heo <tj@kernel.org>,
	<linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [workqueue]  21c05ca88a: RIP:__alloc_workqueue
Message-ID: <202606021026.6d6acabf-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KUZPR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::7) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e4aca9-c64b-45ae-c382-08dec0526912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: i2995XLEWl+veiy0dhXrKT0sJbG2MGVWGIEE+5b0gNi6ID83rfL9VoaTQpF24eeiTvQgrybgGfMwMk+Ha59mpMquDB4e4oJ+zDU7itnB9rmQWiT6mgrTD7jCu9lOYOtj2/Ojm95jnCHslUu4m6Uasu97tUJx97HHXL0RoH9gSz35GgIh71UAafgA6FH+/aNDGOvHCOthEcyoO2lHubbVC/wGL+Q57C3KGWUgc4YYh4t/RnwaR9vzFpjyX2PpLJfjyICq0qR2a3jJjljRJLeOL278ITa9UajK0EDhB3bnGY5UZtmmL1vwX6xslpovYjFxx3N3DnR7Em57w/NxGLulWauvRpnXkvknuEd2X5e8qkL2EZKuTeIfftN6plgmExZZj1Lm5wiyDD+N7a/+7j4yCpYlkJD9P6zUBUJgGbFzs20zLArwbXFM1f6BYYuwPrhHQIv0uS4q/BWBJhF9CKOTmM2KoxXG3lf8JNtXeut2GbJTD7W2qgrOSm4g0nfrvEk4oOywx+X6NN/JjiE8mFrOWytOdrNCgv/NSljzHnhEXe/SxC9Na4e/7YRd60pk5a5tU1RYuK1G3SkhxPCDw015njnwz4sohBSfPbvrHe8D/Uj3+QXiwypHePvqcR9YWiv7+mUBOiNcgOrvON+r/riZAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vWvFw/L5QbsWMdLM8Y8SBtfbNEGDevQDuhrGI9gB1o+CxfUwprJVIEvo6LNS?=
 =?us-ascii?Q?ZxiW3wJtVR0L0rtT48Zqv/atWP48ZxBfcWzhckZXkLzYI1B0l3hoLElzVLID?=
 =?us-ascii?Q?5NadiVnclsHiUxKxqH9Z5a6gz7DzQQSHh9DGYxrOgWXnJ8qnZpQFem8gc/Il?=
 =?us-ascii?Q?y88UzZpMVAoCm/SpZPpL3/u0NsplflPmt8idqQuAXp0wy5MXe+D1wmi1W1kq?=
 =?us-ascii?Q?4LyGosb+F03fAp8suJ2CUEABGWvEKzQayz9c6m0lTXdxOG/CsWV3J/YYlelG?=
 =?us-ascii?Q?xLvcymaytgp0uVKCGzuiEyC6ISPpeduoXQJ3aGckxuEHsjN1sEuRQBd6j9c1?=
 =?us-ascii?Q?M6cma3UnUClim6wTvImaE5xNywFhhr5Ojha8DcNxE7RlqfjqWb5AVSlJlYsa?=
 =?us-ascii?Q?IoNQt1Zu3JAbmoiAAsfmvoV1yTOyfO5FYJ2dtPtoHqOs6/B+yCaxhyvL3bAX?=
 =?us-ascii?Q?57COEEbNTs6O8M24XqrIJSCav4hLMCfc+OkMevRK4PqKd5doTvnd3n87zMKr?=
 =?us-ascii?Q?mEZUYJzJKtjv9huontlaVtRHMVszNghDayqfTQuN5l8Qs3sLmdKOzVYUhVVM?=
 =?us-ascii?Q?XtvsyzVStRbp5hRkNIlLji0tgjlbVoFMt4EcnukW8952wDQ4XuLr1dbNrG9x?=
 =?us-ascii?Q?uCARwh1eWzfGIDMj7WaIFepEGChisv7AoG7ZpweZyCyGNQ458o2LZScpoIWi?=
 =?us-ascii?Q?9M9t4rXix5zY1kmlaQ12BKb+E5QpjOkz2mw8s8Aip3s59+jO0aEcaG7oFlGL?=
 =?us-ascii?Q?uuN+72Wb/Q8FNHEJfevKtg9ylQEslVv2Y6S66a84Rla69osCU6LD9yNlytsg?=
 =?us-ascii?Q?v+0qHr4witMW0A54EEwh2hb/MzXof97OKpEeid9kgHpB2woYaW5D4DEiTKYU?=
 =?us-ascii?Q?gNiNCW0oRgrjL0Rlsxi3SNe7IkTeKFrKZyLa4zIqdwaqug6TMPUWtqDsn4sv?=
 =?us-ascii?Q?BfmXkPQUnJyaBrS3afNSrVCD4PTjcbOL4JjLp+9nx9DkG/MiDArcFKZiCT0a?=
 =?us-ascii?Q?UGkFcnNBp3ozbZ7JhuOqQ1aYbw1a+V7f6WDZ0aHnw1gwgJIx4pJCV7H4NN6q?=
 =?us-ascii?Q?g7VuvBLNThG3C2hRLZTyEdXsAJuKgXCujR6jbzJDHgsxkeYgl8PuAmR6rI0u?=
 =?us-ascii?Q?DESejDw8Lfw41saU7fy0NOcgBykkNxtu/inzpCVY98PloPvfHP4QZWwjJOwo?=
 =?us-ascii?Q?o03Mi7MsF7iHV/4TN8lnP2Rw/VoX9DZjTog+dP8LHA+TKqMKsXkV2B0ynFGg?=
 =?us-ascii?Q?IUhCNYiF6lP87S6umeybVJcK7AYmcATAmtiXK9YTgsWv54w/jU2CIVdSQ0Up?=
 =?us-ascii?Q?LDq58jU104JRaf2+YcvjlHU1hpivFZZVxKSWw0PkdZzmbgGe011wuVUeuXq3?=
 =?us-ascii?Q?JbNc/A+ArD4VFfxgFPcUcrzHxmSSY+9qdn0KOSyW3skzzlMD6BmDw9smm/Q1?=
 =?us-ascii?Q?X/nxx7KbDz4yLCwgx6OgVaJCBhBXJVIfcvPTYpkK0kvXhb98r1sKVyMw0R3w?=
 =?us-ascii?Q?L5/YzrSqidR17ICEHGCcqpQWyi4wnFNPEq6RJQnR8qEcPOqKCh+hvC8O1b5a?=
 =?us-ascii?Q?3gJM2TzzoXOXvrGbl1Z1FZ11hbVbEiRdcY+66HzFObfhtvCq7kaLaBXpZQbP?=
 =?us-ascii?Q?yY98o+GLxecMYqcamEK+ZJR/mzpeNYzXHV2sbyFgThk+QL/LoUDd1Onjgk3E?=
 =?us-ascii?Q?Agr5+wW7icRPgnbu3YyWwtvz9cX1yxt+U+fFAc+ibg9iWRN5I3CjcQeYBOdR?=
 =?us-ascii?Q?pWpRiJJMpA=3D=3D?=
X-Exchange-RoutingPolicyChecked: LRAgV5rXZi6wFLXF3/aKMUPlWjpdbFKRDf5tRFcVMy5/AsLENbhIAW81xKKLjnWDxJvebFX8E7CmOTFr+daTR53B/kWgXhhn2ku3s9WG2uUsPPlLjlvmZxWc/lcZmLm9kJO56yCeXJ9HHPG2o2lWIPMoWSyCkiVpbqV7sjjFBISUT1kIBns7OmpidSqW9UdSs7096zMYBmmP2mcy3HbCN9U+DhpdJ5UDWYg/a6Yw3DPK38tHW1AePwZVN7ltQYNx0GIA8lc076A01OL5rs7eDVA4zTnA5PlVU1luMRb0UwPqH3O4yMfJIx3ogusQ4gE/Yiy79QMUTD4m4lPeMzHQsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e4aca9-c64b-45ae-c382-08dec0526912
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:31.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Edmv9zKR9I5I2SSk7e+eYCp+ARw4hAXrBzCUgOjU9JG9Mw40b5+z7kIx20mbtxUarZHRkUSMUmHwuZUrgC45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "RIP:__alloc_workqueue" on:

commit: 21c05ca88a548ca1353cbef189c97d4f03b90692 ("workqueue: Add warnings and ensure one among WQ_PERCPU or WQ_UNBOUND is present")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 7da7f07112610a520567421dd2ffcb51beaefbcc]

in testcase: xfstests
version: xfstests-x86_64-cac9fe2b-1_20260518
with following parameters:

	disk: 4HDD
	fs: btrfs
	test: generic-169



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606021026.6d6acabf-lkp@intel.com


[    3.050774][    T1] ------------[ cut here ]------------
[    3.064584][    T1] workqueue: thermal_events is using neither WQ_PERCPU or WQ_UNBOUND. Setting WQ_PERCPU.
[    3.074470][    T1] WARNING: kernel/workqueue.c:5837 at __alloc_workqueue+0x9cf/0xcb0, CPU#3: swapper/0/1
[    3.084471][    T1] Modules linked in:
[    3.087449][    T1] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S                  7.1.0-rc2+ #1 PREEMPT(lazy)
[    3.098472][    T1] Tainted: [S]=CPU_OUT_OF_SPEC
[    3.103448][    T1] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.2.8 01/26/2016
[    3.111467][    T1] RIP: 0010:__alloc_workqueue (workqueue.c:5837 (discriminator 1))
[    3.117449][    T1] Code: 31 ed e9 bc fd ff ff 80 3d d3 b1 24 05 00 0f 84 e5 9c c6 ff f7 c3 02 01 00 00 0f 85 bd f6 ff ff 48 8d 3d 21 e1 2b 05 4c 89 fe <67> 48 0f b9 3a 80 cf 01 e9 a6 f6 ff ff 41 be 08 00 00 00 41 bd 00
All code
========
   0:	31 ed                	xor    %ebp,%ebp
   2:	e9 bc fd ff ff       	jmp    0xfffffffffffffdc3
   7:	80 3d d3 b1 24 05 00 	cmpb   $0x0,0x524b1d3(%rip)        # 0x524b1e1
   e:	0f 84 e5 9c c6 ff    	je     0xffffffffffc69cf9
  14:	f7 c3 02 01 00 00    	test   $0x102,%ebx
  1a:	0f 85 bd f6 ff ff    	jne    0xfffffffffffff6dd
  20:	48 8d 3d 21 e1 2b 05 	lea    0x52be121(%rip),%rdi        # 0x52be148
  27:	4c 89 fe             	mov    %r15,%rsi
  2a:*	67 48 0f b9 3a       	ud1    (%edx),%rdi		<-- trapping instruction
  2f:	80 cf 01             	or     $0x1,%bh
  32:	e9 a6 f6 ff ff       	jmp    0xfffffffffffff6dd
  37:	41 be 08 00 00 00    	mov    $0x8,%r14d
  3d:	41                   	rex.B
  3e:	bd                   	.byte 0xbd
	...

Code starting with the faulting instruction
===========================================
   0:	67 48 0f b9 3a       	ud1    (%edx),%rdi
   5:	80 cf 01             	or     $0x1,%bh
   8:	e9 a6 f6 ff ff       	jmp    0xfffffffffffff6b3
   d:	41 be 08 00 00 00    	mov    $0x8,%r14d
  13:	41                   	rex.B
  14:	bd                   	.byte 0xbd
	...
[    3.136504][    T1] RSP: 0000:ffffc9000002fb00 EFLAGS: 00010246
[    3.142449][    T1] RAX: 000000000000000e RBX: 0000000000000080 RCX: 1ffff92000005f4c
[    3.150468][    T1] RDX: 0000000000000006 RSI: ffff88810df4ecb8 RDI: ffffffff8686adc0
[    3.158466][    T1] RBP: ffff88810df4ec00 R08: ffffffff84c3942e R09: ffffc9000002fb88
[    3.166466][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    3.174467][    T1] R13: ffffffff84c39420 R14: ffffc9000002fb88 R15: ffff88810df4ecb8
[    3.182467][    T1] FS:  0000000000000000(0000) GS:ffff88868c84b000(0000) knlGS:0000000000000000
[    3.191469][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.197451][    T1] CR2: 0000000000000000 CR3: 0000000756870001 CR4: 00000000003706f0
[    3.205467][    T1] Call Trace:
[    3.208444][    T1]  <TASK>
[    3.211443][    T1]  ? __pfx_mutex_unlock (x86/include/asm/atomic64_64.h:15)
[    3.216448][    T1]  ? __pfx_mutex_lock (locking/mutex.c:1114 (discriminator 1))
[    3.221448][    T1]  alloc_workqueue_noprof (workqueue.c:5932 workqueue.c:5948)
[    3.226448][    T1]  ? __pfx_alloc_workqueue_noprof (workqueue.c:5671 (discriminator 1))
[    3.232449][    T1]  ? __pfx_genl_register_family (netlink/genetlink.c:548 (discriminator 1))
[    3.238450][    T1]  ? add_device_randomness (linux/spinlock.h:408 char/random.c:936)
[    3.243447][    T1]  ? __pfx_thermal_init (usercopy_64.c:?)
[    3.248447][    T1]  thermal_init (thermal/thermal_core.c:1892 (discriminator 2))
[    3.252447][    T1]  ? __pfx_thermal_init (usercopy_64.c:?)
[    3.257447][    T1]  do_one_initcall (main.c:1392)
[    3.262447][    T1]  ? __pfx_do_one_initcall (trace/events/initcall.h:10)
[    3.267448][    T1]  ? parse_one (params.c:132)
[    3.271446][    T1]  ? kasan_save_track (kasan/common.c:78)
[    3.276447][    T1]  ? __kasan_kmalloc (kasan/common.c:398 kasan/common.c:415)
[    3.281447][    T1]  ? __kmalloc_noprof (linux/kasan.h:263 slub.c:5295 slub.c:5307)
[    3.286447][    T1]  do_initcalls (main.c:1454 (discriminator 1) main.c:1470 (discriminator 1))
[    3.290447][    T1]  kernel_init_freeable (main.c:1490 main.c:1703)
[    3.295448][    T1]  ? __pfx_kernel_init_freeable (main.c:1671)
[    3.301449][    T1]  ? __pfx_schedule_timeout (??:?)
[    3.306449][    T1]  ? __pfx__raw_spin_lock_irq (locking/spinlock.c:183)
[    3.312448][    T1]  ? __pfx_kernel_init (main.c:762)
[    3.317447][    T1]  ? __pfx_kernel_init (main.c:762)
[    3.322447][    T1]  kernel_init (main.c:1593)
[    3.326446][    T1]  ? __pfx_kernel_init (main.c:762)
[    3.331447][    T1]  ret_from_fork (x86/kernel/process.c:158)
[    3.335447][    T1]  ? __pfx_ret_from_fork (x86/include/asm/entry-common.h:54)
[    3.340448][    T1]  ? switch_fpu (linux/instrumented.h:82 asm-generic/bitops/instrumented-non-atomic.h:141 linux/thread_info.h:133 linux/sched.h:2066 x86/include/asm/fpu/sched.h:34)
[    3.345447][    T1]  ? __switch_to (x86/kernel/process_64.c:403 x86/kernel/process_64.c:663)
[    3.349446][    T1]  ? __switch_to_asm (x86/entry/entry_64.S:206)
[    3.354447][    T1]  ? __pfx_kernel_init (main.c:762)
[    3.359448][    T1]  ret_from_fork_asm (x86/entry/entry_64.S:245)
[    3.364448][    T1]  </TASK>
[    3.367466][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260602/202606021026.6d6acabf-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

