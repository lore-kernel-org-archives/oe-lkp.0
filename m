Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5C41E891
	for <oe-lkp@lists.linux.dev>; Tue, 23 Jul 2024 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695510; cv=fail; b=OuvO8t+mnN4nAL0lOQhpkcoAEyd7kKjCzyOgpjoxTQnDHLXeLR9PlHui0lJ45PFoIA/0GeT7ah2bYIKu5S0NUgcVe9GAV84PKRnrUywMbekEEwOmXXx9Em/uHxRQMj12yhgH2BHkK0hHmyDSK1aX3WnzREoU3WVfXDij/hHaMcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695510; c=relaxed/simple;
	bh=VNPC5+YtgHHMd1K/zW5v9CV2RxeXZ7dQcCKpVuvinEE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=A2S/dum0v6vEQ1YZfxmsFY897rhYD6d0K+h3Feh2jX/di2+9ar1U+373S8xFVH1+EPIRJWVBd6HAfrwpQGV4l9eJ48yguAmTPnKXZlwuLQrNdbbbuC70M9sOvIgGef1X7hLRjKmONCF9W4CFZR7/8U/30BQHDCD/90M9cFcqE3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRpUDDG9; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRpUDDG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721695509; x=1753231509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNPC5+YtgHHMd1K/zW5v9CV2RxeXZ7dQcCKpVuvinEE=;
  b=JRpUDDG9nJ9AAmvuURSzo0nmno19BuO5nT/2aehuQgolTK39mgQu8Vsv
   Id6rj/vjh8JUrNecMpU47NKySdyoKYS40/+lGQRRa4y0201Ds8lQe1Lxt
   J7b5541goYEHEQm/gsAPdhycZF4aw+fl2SUfNkj3zOOOTsEczgoUNEMB5
   nteI9I8NwWLzLrEqfEEd0dgypLOqtq8XbI59f4U3fViub0pezrmasVbYj
   of81uqSEwzMwoTxDgZepOJ1sA/5x8Lc9B9YBBHHQ9AQFT7Tctibd5PH1P
   LWq/18oF2pXYSYX3FZgJm+6bTJylgn2/VT5t/hnZcu3cZLo9pU070tAfs
   g==;
X-CSE-ConnectionGUID: OzGHK6QvSqqK2noSFS2AnA==
X-CSE-MsgGUID: b8tpHWlYRySUk2MaYHxjUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30448346"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="30448346"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 17:45:08 -0700
X-CSE-ConnectionGUID: YRFIupbzT5mBJ5kc99vJOw==
X-CSE-MsgGUID: 8Ct3xTZcQXWler8TBF/x1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="51948223"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jul 2024 17:45:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 17:45:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 17:45:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 17:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xw4xxwiDMwpy/yUIHK7VYcgBwfeWUSFCvToYOlERRTu2oQVeK+i+fJvtxwG1v/jmOP1UIknRkrnwdVxb2gZzi4R8fz0S1ofJes+gKnTkC1z3tdaZx7TMsg6v5soN+X7BpaejMx4D7iBjCd57EYSHhEmi1VcdI6eBZgYCWUt18x4y8ejnohd5kr64aIS8MdvpksurN5LI2yLDIfrti42+/gXBE7X70ppa5AIOVkY2qBR4A3FFRfFS59CCcfpj9ibGZ79BlIMZA3G6TA1hzoWNodSZ6QRoBxUgwnEG+pexb4WdGVZdLPDA8A9xwnUqngz1IS6BHdJ4ww+rOf3loHZDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbk7HOxkXXvV1wPiAx/MEijW7E/JV5v17GEv0bP8HkY=;
 b=gbTsHjcgPnGMwgvgv2YZxbI2zCyTnHGcf0wXQd/FCvNo8/qnoS0xc4HAzmJXjerLgpsQB6KPz5o/7xouTa0ECF2gg5MwziI4Z54qVWbn3vh8Z629tuyB2E9SakiIJuunAunVCfk0Ew3w3yVyPGqnbc+dgnIXGHCE7jk/qFTPlajb14YZCtRbUP57M3m0wUm2o5kkH3eC/pF/2+ZGmKEbfnoz6MiTZ+OC5bXcCcr71TqXPakGr0zoGKlO8FXzKqBOhON3yZqS/nPlV9eJ98VwKvaehkNTirlAYmGN4pJ+tn2tdMhFx30E7votKGTBuEHkdm9Ed3qWGpky+1YYrN8u6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 00:45:04 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 00:45:04 +0000
Date: Tue, 23 Jul 2024 08:44:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Alex Shi <alexs@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [alexshi:mmunstable3] [mm/memory]  f6ba7ce983:
 kernel_BUG_at_mm/page_alloc.c
Message-ID: <202407221640.f6e43164-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 110c420c-ee89-4fb8-165d-08dcaab0b10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bKtWkaroldmS8RgQxRjMATGLlBpwUH+l3Di5tzihxBZV8iMvUDEBPJPm+SM1?=
 =?us-ascii?Q?f+yymy/7tOHzStSWF7Q3ELRAYpdKxQTWw5qZoT2vfKsbtr0hjjq9/74bVr94?=
 =?us-ascii?Q?b/OyY7lKoT/dVYzXKPJ2BxjJcoEL4eYj5G1Oc0azsgacxAdCjl6HD3GDZ3Pp?=
 =?us-ascii?Q?6HzYThHN/O405DqHU/NEk3fwoZAZim3GtCMK7E7CMKPSbaRleniDKH9rYH0m?=
 =?us-ascii?Q?fZkIX8nsA5kbcytcDIOX0lGndO4xVh+B+vSVSMrBrYTaWVi8N1ZmgySJ38C2?=
 =?us-ascii?Q?tSQmEL6ICDo3ajvB+08QhiOFwk5jky6yq6GDlL3qA9U0dIA+EbMkFSmXdbKK?=
 =?us-ascii?Q?IIfPHvIB9AcCXZRgbMbBqZISHi628aw/yOhwB/7Fw129d7L37yhUqUzhJs63?=
 =?us-ascii?Q?O1cicIwPZ2Ac5dAQZPV8TY3TQWpmxYV/Vji++3+RaARF9zxowDIhTvOS0EtS?=
 =?us-ascii?Q?WD+ujAqLIbZganBzUKjoAHTSasWbwI0/0YqzlQz1uCXU0m96kh22nW0uHEI6?=
 =?us-ascii?Q?yVXKCiUOaqiwX+sWTRijCHdtRbZu+WyrHqK133JuY1HLkVZHYwVUnYB7QFk1?=
 =?us-ascii?Q?drbLQ952PYkBOpC9RlZjCII8w+rcHkG18cGOzrqJV/vxXj5PKWQibCQSOOQL?=
 =?us-ascii?Q?u8tQZ277A40Yg8SIWSh4LRQwUoKjxP6BRtlZlTYbB0itixf+14buzJDrA4rV?=
 =?us-ascii?Q?otCZhzypG2UKqfwrTapQ1hClx5/VgYEqwDjCp28D8vKIxMui3jFqncLa4J/c?=
 =?us-ascii?Q?7I7EJBerW9fUTSLe20b/PLK7FQf/ZXOZPJazx9xy65k8t6nWtUqVCxuk1xhG?=
 =?us-ascii?Q?LRsfecg2SV8TUF+E2XOhjNCh0brFa7DW25J4Y8kO+Ttgo4XAq69QaF2Gs9JI?=
 =?us-ascii?Q?zpqj44Xc6+yXI5T5lvn5r/2DR12MCo9XSsj8Af5pc/U19EN3yZxuk5XdgLlH?=
 =?us-ascii?Q?N4kQNFA6SwoqdwHWws4/evLWOlgIBXzvM+4PQFC0lM+RuOAtYw2kChS28EKo?=
 =?us-ascii?Q?UqfQIQtV2auANVA4Kh432yFlF5Nt/kNkNDyAEtKBIFSQg7p9C32WapNGdTb3?=
 =?us-ascii?Q?K35vUv8uvGOAmgDw+lnsI0inqFEu/UFsuoWyyUAKVpZpTYaxq1r/pfBqpAZc?=
 =?us-ascii?Q?4N5hjVpy5SpQt5aROwE1TOQ4LYz52eyNAgCdDlZxdQlrRZh3tuBKDNqrkXkX?=
 =?us-ascii?Q?AYJ6o0Qu/+d5E56YkVfxuo8a09i+AvCaTL7DoDIPUb1dFw5umuOfqCxkn+l6?=
 =?us-ascii?Q?hmU7aaMogTf79tZ/DhkLBqdIeREmtFrxgPSLvMRzqpP7OW93nqTeN/TTIbtu?=
 =?us-ascii?Q?ZXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?44PU0h2HT7v1DcqIwM4wHmYF+tT3NzQkwEM9UZkcxUevpSB73Y5qp0ZwJzjd?=
 =?us-ascii?Q?px8MkPlPhj1WrpjEVdqdy/ac6VGa+I2VhYrH0IbXHJ3YvwugkurGnfwb2gcG?=
 =?us-ascii?Q?Xj4NdLQtQKNlPK5z7iTVtRwpSUYVDTZOzj86WhKl5/H9FbvjstpWs5IyvYoZ?=
 =?us-ascii?Q?kjE4DuvT5kIszf2xu0JKxeCfSziway1+4QQJZT2fdM5tiq08E3CTTbqznITm?=
 =?us-ascii?Q?jISD+sL431vjiFUrzeSK47F2ljrhTtVwpKF4rBUms78HVYTgApcKW0hXxGic?=
 =?us-ascii?Q?lbsqr4c9IwljjxtVLlxCUbitsiSiLF5iGb96BvbhINK6J9o/U97+UDH6+RSH?=
 =?us-ascii?Q?31tHBBJGeSRxwdfjb5ujnieHHGW/lFPfB8fpVtk68ZAw6QoYdO9GP9nwI2S9?=
 =?us-ascii?Q?WBv3AhAko9GIBXgSjMXSfW24qrPPzyYRrBN2KBSoqzgs21BDUJbHK9Nb5gfD?=
 =?us-ascii?Q?D3zN2NG4s7Dez6NtzOU3N8uVEqG/hMVlM7JBllCAuwGl3wTe3XCt53lmDY6z?=
 =?us-ascii?Q?HoWCGNPDe26D+uQc0oPAMb4Yi0YP4pbTTBONE1nmMxVUVqzcQ0lUXmWkp+fj?=
 =?us-ascii?Q?7R2nv3oQO2YuFQVLckQ0XgNkHpoR0E4GMKRnKdYQyVDJBs63Dxfjvk38wr4h?=
 =?us-ascii?Q?Sxdr7Ilalh0b9WtJWiwaM7o+X3F66t1AzewkNQO3m+DzWbVah7kNeVeCSecY?=
 =?us-ascii?Q?ruzvEZin/N30Vl2vs+uIfoDT1bVgGU6jly5TfBLfULvSqapIOMV1zeAN2sDA?=
 =?us-ascii?Q?38M7Sxgk1HPsKN7z0sWtOsoSksay5exG/c+1+t4U5Xa/47WbL9blrr03X3xc?=
 =?us-ascii?Q?b8ss8cGMUHas3zX/W1GhKaJF7RY6iMV1fzwcl8VGfcqgUqoWmqQ65Q4E6tFN?=
 =?us-ascii?Q?nc2d0jVQ/kJfl4rjkzq/Kahn00BgD1EGLBIULmeXK5KcNYMYpaAGk2mPUE5u?=
 =?us-ascii?Q?v+A+uGSPsZqEDZkEfGNG6lRPZRIe/Kc/9rVgESMLiV2GLVby1VDoMh5eiIWb?=
 =?us-ascii?Q?9rKIh3ySE8P+PMR023H3YGAk9KScGxu9hM8Go/c5Y9ntOYVJ1P/1pIRZPi+q?=
 =?us-ascii?Q?e/uw9fvuAvKG+6TRmEAR3ol8+Tm3k55ezRSDYB1JnsdkYrpc84g8yGdk1a0m?=
 =?us-ascii?Q?LApuBXyLOad6jYGYG4lgVTtR3Eu0BrjQ61BEaf9oOjX76JC+uAbXgeTtT97a?=
 =?us-ascii?Q?vqyNawHUbNT/7mAZvQ0ejwgdR1A78nKBBxVp7dYeKzGkrk5UTCdE8MSmbo3h?=
 =?us-ascii?Q?9YQNcdontx/zjde9G+6YM7HamO6qDuvnxfRaVwFBQJ/oqzmzLpmQKGfYQNRF?=
 =?us-ascii?Q?kWamy1/OQgoSLOmP2LgMwnzUnF8Xt1zEGztoi3jPQOAXdcChlSHgoRZMLyMf?=
 =?us-ascii?Q?pW8F/pEVjMcwfQLsl67MjeNq0nj3GZdXXHaGMBmZDGeYxcFOPtj1zsWeHFVz?=
 =?us-ascii?Q?41sbikgvsc5kNfw9KiPtF48NnN4hRkaxb0O9jjL1xsDdl0H9XLCbV/LhFoYn?=
 =?us-ascii?Q?mgx0kFnI1zbbh/04L3arwMf+0deDQR8XEStYrzromVHpSM1kcbzNbUV6Zk31?=
 =?us-ascii?Q?VNHcUMjxZYLPnolb5Kj8dmPVN+kUgbsSs6HTOl4fYEpQLnOPvFXV1TVae2Cl?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 110c420c-ee89-4fb8-165d-08dcaab0b10f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 00:45:04.4378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wV1/53mW17tTg26WSYh0+qUS2jSmvIlDso5jIAcCukXbWQpNELzLAg9HdqTb2nlJSL4mFfQquIUXaqenlQGHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_mm/page_alloc.c" on:

commit: f6ba7ce983a499c1f4c6066fdf135e5a2b464054 ("mm/memory: use ptdesc in __pte_alloc")
https://github.com/alexshi/linux.git mmunstable3

in testcase: boot

compiler: gcc-7
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | c9df20367f | f6ba7ce983 |
+------------------------------------------+------------+------------+
| boot_successes                           | 12         | 0          |
| boot_failures                            | 0          | 12         |
| kernel_BUG_at_mm/page_alloc.c            | 0          | 12         |
| Oops:invalid_opcode:#[##]                | 0          | 12         |
| EIP:free_pcppages_bulk                   | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407221640.f6e43164-oliver.sang@intel.com


[    0.272173][    T0] ------------[ cut here ]------------
[    0.272588][    T0] kernel BUG at mm/page_alloc.c:779!
[    0.273141][    T0] Oops: invalid opcode: 0000 [#1]
[    0.273523][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.10.0-rc6-00470-gf6ba7ce983a4 #1
[    0.274190][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.274992][ T0] EIP: free_pcppages_bulk (mm/page_alloc.c:779 mm/page_alloc.c:1187) 
[ 0.275402][ T0] Code: c4 83 e8 01 85 f8 0f 85 3d 05 00 00 8b 7d d0 8b 55 c0 89 f8 e8 a8 d2 ff ff 85 c0 74 2c 8b 45 c0 ba a4 8f 7d c3 e8 3f 39 fd ff <0f> 0b 8d 74 26 00 90 c7 45 c4 00 02 00 00 c7 45 bc 09 00 00 00 e9
All code
========
   0:	c4 83 e8 01          	(bad)  
   4:	85 f8                	test   %edi,%eax
   6:	0f 85 3d 05 00 00    	jne    0x549
   c:	8b 7d d0             	mov    -0x30(%rbp),%edi
   f:	8b 55 c0             	mov    -0x40(%rbp),%edx
  12:	89 f8                	mov    %edi,%eax
  14:	e8 a8 d2 ff ff       	callq  0xffffffffffffd2c1
  19:	85 c0                	test   %eax,%eax
  1b:	74 2c                	je     0x49
  1d:	8b 45 c0             	mov    -0x40(%rbp),%eax
  20:	ba a4 8f 7d c3       	mov    $0xc37d8fa4,%edx
  25:	e8 3f 39 fd ff       	callq  0xfffffffffffd3969
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  30:	90                   	nop
  31:	c7 45 c4 00 02 00 00 	movl   $0x200,-0x3c(%rbp)
  38:	c7 45 bc 09 00 00 00 	movl   $0x9,-0x44(%rbp)
  3f:	e9                   	.byte 0xe9

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
   6:	90                   	nop
   7:	c7 45 c4 00 02 00 00 	movl   $0x200,-0x3c(%rbp)
   e:	c7 45 bc 09 00 00 00 	movl   $0x9,-0x44(%rbp)
  15:	e9                   	.byte 0xe9
[    0.276922][    T0] EAX: 00200046 EBX: eced6484 ECX: 00000002 EDX: 1ab6f52b
[    0.277466][    T0] ESI: 00000098 EDI: c4023700 EBP: c3a23eb8 ESP: c3a23e54
[    0.278008][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210002
[    0.278592][    T0] CR0: 80050033 CR2: ffbff000 CR3: 04244000 CR4: 000000b0
[    0.279136][    T0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.279681][    T0] DR6: fffe0ff0 DR7: 00000400
[    0.280032][    T0] Call Trace:
[ 0.280277][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 0.280597][ T0] ? __die_body (arch/x86/kernel/dumpstack.c:421) 
[ 0.280922][ T0] ? die (arch/x86/kernel/dumpstack.c:448) 
[ 0.281205][ T0] ? do_trap (arch/x86/kernel/traps.c:114 arch/x86/kernel/traps.c:155) 
[ 0.281520][ T0] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:176) 
[ 0.281866][ T0] ? free_pcppages_bulk (mm/page_alloc.c:779 mm/page_alloc.c:1187) 
[ 0.282264][ T0] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 0.282612][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:267) 
[ 0.282967][ T0] ? free_pcppages_bulk (mm/page_alloc.c:779 mm/page_alloc.c:1187) 
[ 0.283362][ T0] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 0.283745][ T0] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 0.284086][ T0] ? free_pcppages_bulk (mm/page_alloc.c:779 mm/page_alloc.c:1187) 
[ 0.284481][ T0] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 0.284822][ T0] ? free_pcppages_bulk (mm/page_alloc.c:779 mm/page_alloc.c:1187) 
[ 0.285228][ T0] free_unref_page_commit (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 mm/page_alloc.c:2621) 
[ 0.285637][ T0] free_unref_page (include/linux/spinlock.h:391 mm/page_alloc.c:2668) 
[ 0.285999][ T0] __free_pages (mm/page_alloc.c:4831) 
[ 0.286326][ T0] __pte_alloc (mm/memory.c:455) 
[ 0.286646][ T0] __get_locked_pte (mm/memory.c:1989 (discriminator 2)) 
[ 0.287000][ T0] poking_init (arch/x86/mm/init.c:842) 
[ 0.287321][ T0] ? mm_core_init (mm/mm_init.c:2695) 
[ 0.287669][ T0] start_kernel (init/main.c:964) 
[ 0.288011][ T0] ? load_ucode_bsp (arch/x86/kernel/cpu/microcode/core.c:135) 
[ 0.288373][ T0] i386_start_kernel (??:?) 
[ 0.288734][ T0] startup_32_smp (arch/x86/kernel/head_32.S:292) 
[    0.289094][    T0] Modules linked in:
[    0.289389][    T0] ---[ end trace 0000000000000000 ]---
[ 0.289910][ T0] EIP: free_pcppages_bulk (mm/page_alloc.c:779 mm/page_alloc.c:1187) 
[ 0.290491][ T0] Code: c4 83 e8 01 85 f8 0f 85 3d 05 00 00 8b 7d d0 8b 55 c0 89 f8 e8 a8 d2 ff ff 85 c0 74 2c 8b 45 c0 ba a4 8f 7d c3 e8 3f 39 fd ff <0f> 0b 8d 74 26 00 90 c7 45 c4 00 02 00 00 c7 45 bc 09 00 00 00 e9
All code
========
   0:	c4 83 e8 01          	(bad)  
   4:	85 f8                	test   %edi,%eax
   6:	0f 85 3d 05 00 00    	jne    0x549
   c:	8b 7d d0             	mov    -0x30(%rbp),%edi
   f:	8b 55 c0             	mov    -0x40(%rbp),%edx
  12:	89 f8                	mov    %edi,%eax
  14:	e8 a8 d2 ff ff       	callq  0xffffffffffffd2c1
  19:	85 c0                	test   %eax,%eax
  1b:	74 2c                	je     0x49
  1d:	8b 45 c0             	mov    -0x40(%rbp),%eax
  20:	ba a4 8f 7d c3       	mov    $0xc37d8fa4,%edx
  25:	e8 3f 39 fd ff       	callq  0xfffffffffffd3969
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  30:	90                   	nop
  31:	c7 45 c4 00 02 00 00 	movl   $0x200,-0x3c(%rbp)
  38:	c7 45 bc 09 00 00 00 	movl   $0x9,-0x44(%rbp)
  3f:	e9                   	.byte 0xe9

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
   6:	90                   	nop
   7:	c7 45 c4 00 02 00 00 	movl   $0x200,-0x3c(%rbp)
   e:	c7 45 bc 09 00 00 00 	movl   $0x9,-0x44(%rbp)
  15:	e9                   	.byte 0xe9


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240722/202407221640.f6e43164-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

