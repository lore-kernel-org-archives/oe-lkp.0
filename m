Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C772A8D7
	for <oe-lkp@lists.linux.dev>; Sun,  6 Oct 2024 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728223902; cv=fail; b=OgJPgUr2H/Daqxk9BeW9ujNxAnTzH0bxNeiwygakBvK0yeptATajbOGngxqHwary+pz5T9OGYScqDyFqKIXIi8mSXOIDeWhnvq2lbkbVY5b4qMsiBfzaIYGCQnkr4RUjc39cRSKkbLyHHVHjsm/4kfwlbLgqknQ5GdjNBDPv/y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728223902; c=relaxed/simple;
	bh=QF7GLGUk1D0qkEUupkdQJ2cyNv09Vs/bD2PgB30Q/gY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kDxs94q4bCwoF6Hitmk6nPOkoxbMTxdX80qFAT0WzmNIdxT/oGqUScfWE03PR1SCeaxUnEEY6HvSVcNv65VdUoIGPFa5rCXtnOVJlYLF2yZN5DKKBKhncYASuDNODeQB8z3Imd/Nb3F+Exf9t8f7uyXkZsA2sKjHaDmRlfxnZkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9aF/cCY; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9aF/cCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728223901; x=1759759901;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=QF7GLGUk1D0qkEUupkdQJ2cyNv09Vs/bD2PgB30Q/gY=;
  b=E9aF/cCYEavWGbL1fuSaq21g/q3yUiNUlnFqTcA7tvv7lRK+1/qIrnTr
   kmyzHQze4eFT64DDtn8DFN+EOPhoxoZWR5Y2vGB36cwB3/PFEwo18Q3Du
   xkxwsWa93FTeSHY2xilEfJC/XlQxE9x3x+rEyCBNOlwuD+DSp36dwKH5R
   unmOvE1miEHmmiyKteprKMAMUIMnjCu1q9C3qLddYb6tdfOZ/8foTp7Kf
   eWFysHW2RhvD4Lxq1DPVbbaQbse/R181h2QXaYN4fOd9cOx9AlE5/yhTp
   J/KwGXD5b0J+iLM3blGIvinphzscpLZeHZFgxHZHMDlffsPcU6n1UNmkJ
   A==;
X-CSE-ConnectionGUID: C7IV7TQrRia6O2meUUNWKw==
X-CSE-MsgGUID: SFD/RVsHTHOH90mfAlmYJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="49912617"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="49912617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 07:11:41 -0700
X-CSE-ConnectionGUID: DhwACtXMS36iyqg+OfUsfg==
X-CSE-MsgGUID: XsYqUfJ+QoacqKTZruXKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="74781913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2024 07:11:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 07:11:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 07:11:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 6 Oct 2024 07:11:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 6 Oct 2024 07:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQo9YdkFMNOSvWGc4I0uqeIuOGTKkNK6GFyNbFD8wKBcorYzpdFDR7MRhGtH98VPK4HprarsgUsZSRDD3yDCnTszRDddD7J7pbuT9KHMBC0esV77aLTx/zEAL2jf3ct5Oz0hDiTavGxeUI24n6yckLdebo1hRoTqagPqgt5ocYQlTS/qG1issxZE87kG3RmP2gI12gr26+rqDFSl+q72SDRDI3TDOzqvDvfKg0QEjkPSfi1vzI5XdPDEfcLaS3Jn4BOTqFxWLSp/ouxvraTGjgDfyLQIi9Z2VpWxiLtkZp9nIr1aKNEE73r5x7Pp6y34fMjlkch/n2n6ZCTjsjaGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCPfKGa5SGaEE93mSodRQEN9sHgoRG28d4Du0kb1srU=;
 b=a3/eCljgAM/OfccPi9OkD+3fe2Pr807Rl0SxGb8hlpb1RcvH4eKU45Grd9aZIN/9kwX7xvzbYd64b5NOrJc7X7sR8gfJq/4JnyOz2pDL2/Y1yDy5W901ig855PZJWeSPjOL4vPOdONO7uwu1Va792sNZ3GONr8BSm9JNs2RmX12p93JUmEUVWv5MJF4LrxHyursC3ulrcD0wT/+k6omqMFhOu0SOkJl3q2Vos4Jvuut1H4Pb9yq7PDzHjpQppDSm0rR+ziXUJOETpKzDpdms/+Yw+fTeQ6ABNah13I/4oJ1Nk/iJv3EoFS2KdYJ65o79jcuiiVeNhrPHsF1g+hvnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Sun, 6 Oct
 2024 14:11:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8026.019; Sun, 6 Oct 2024
 14:11:37 +0000
Date: Sun, 6 Oct 2024 22:11:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Alex Shi <alexs@kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH 4/5] mm: Add PageAnonNotKsm()
Message-ID: <202410062122.193c5b0e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241002152533.1350629-5-willy@infradead.org>
X-ClientProxiedBy: SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) To
 LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 98557c06-6f02-4014-de8b-08dce610ca62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/EFG47WvKQ2nHPC9JF/VDJ4j+8izbpRdw8FR17vXZdRVwx8ACnL4HKvpjX+a?=
 =?us-ascii?Q?M1YeTy2mlNn5LInP63lH3WUcBPtaORVX8ek6F88C4CzoRPbSKg5JcqtP62f1?=
 =?us-ascii?Q?BPvZyNb07NDtZLX0XkJ/jqoRdkoFO5LQ0eAhF5pT912uzvuAqjXoAm+wMsSW?=
 =?us-ascii?Q?NxVhFJ3Sl/+fe50Nd3Cc2ZYQd5OEPR3xVfgGwjQrAFgp+R6eBBcCZQahac3R?=
 =?us-ascii?Q?zdFY426GK2Pxj3ZPC3gSHF9K4GVXq4zvJUh24JDjMMefGWez/ci8eBuM2MVv?=
 =?us-ascii?Q?EvRFla7aExYv2r6ivJ0DtHdmSyX2nDOg45rBPQ9FsMakh1aler236yl9Klzd?=
 =?us-ascii?Q?BsV1ewG7dSEVOFQyMonFoPwcYF+/cNV7Dx1uorbBr1Uv0IrjJjioTq0PH6Rd?=
 =?us-ascii?Q?SIICPieUG9+441TgnWE9Moq4SqPTowxGuMleXuUHiSmjhaCOrPyWzdSiWgZK?=
 =?us-ascii?Q?8cUFXd3Bvra7SYWeZX3a0x6KpcKeVT5bKJTUArixuoo1UmvJ2/vImJp1CxDD?=
 =?us-ascii?Q?zNWJAEjXZQkJypuyWsI2QfdiOkQLd+mwDXIXTSPJ971GJk/AfdqC0uy1xce4?=
 =?us-ascii?Q?kgURtgfHSsHuK+aszY0NLT/a9Y/Jz2hDpmKoTGG4RuK3TjdfYt+I2VtQUR8Q?=
 =?us-ascii?Q?gstIeBYm+LbjKkzUf1XkpUEZoxpNt8RiFIk630uvromt6YsPX/147R5+AVvD?=
 =?us-ascii?Q?LpLgoWv3e3PiVrSdHFZFIS3c+cooJWcDNrJHNv6UJrfhPrq/g+yz7N9EM4A2?=
 =?us-ascii?Q?ggxJHYMew+JQOGW26dgXO2zc4JQMF2QXIcrkHjwbSNX0RwQ1wbdmtd3IyNZy?=
 =?us-ascii?Q?2FP3p9tC8LPs4O09S8eAlcDqoI6YZ+3A56DLLsAOcSZK9yh1z2Yei7dlLu78?=
 =?us-ascii?Q?YrHraA4H1x4j0a58hSEcDYO1hXE4NA1UO1HkhxXQQkSlBjWhIRJiGlicaVi1?=
 =?us-ascii?Q?CtKhQ4E2UinSTmMr0CyF727EZfIti4qPyTC/mTKksh7tkFs/954SO7LU6Fwf?=
 =?us-ascii?Q?AWLoQ/SUjjyUm1aAn34wgl/50YbnY6EbYLI1bIcgGiLv/9lRn0a94eniKZ0o?=
 =?us-ascii?Q?5Sa78Skfmy3iyMjz/lV/9t/n5ItDrbpuiAYFQcm78+PGpokVCUSTJyB5wFIv?=
 =?us-ascii?Q?j3WZema+5QYtR1layEg32RZ8EVNTCAJauIhmV3Tsm4tbbzus4/lauxxmFc5P?=
 =?us-ascii?Q?Zu3bzvg3GeUjccmCAQXBlAVOg07tjWuLGkfxLJm+m0CsU7NhEjuphxJ9vh4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Qq6ymnuJylIQ8VjnMR2j66EeRyqGl/fmN5+8Jgsx4PhlcI92MifRUvlx+76?=
 =?us-ascii?Q?NIZtxearso7+vrM6JArRP6xQ5YNnml7yGsIyqyXSQCpH3mrRojLSx8iyvNDZ?=
 =?us-ascii?Q?Ru7I6a+KSL2ia08HsXB5unwoJnOtQVLBPyQZZYqVGtb9uzoPMSVqiSqFtwqc?=
 =?us-ascii?Q?tTF/FJD6WcduIvBQ7le2y2vBcova7Cx4vGiMxmU751nWT4towDESFx6TPn7A?=
 =?us-ascii?Q?caxSDNMZ7IOGoZ1Aqtpw0Fwh4509CcfQybGWa4OsG4RmRrJt75biNtAGOUe1?=
 =?us-ascii?Q?kYbH1oqHAKZ4q5jxeFawM4f7+VuzuXZldkpDEk2+8+FRdbISBGMZoM+P76Ul?=
 =?us-ascii?Q?bzG/kBDMEgw5ldQJIfE1pPC0/XA1yZt3EW4ftlpX3s9yM6AT/5blhPX8WDjV?=
 =?us-ascii?Q?KszZgpMjTyzhnKuq++XfeOkOBnoWGomwE/+UARl6VmkfhJW9wjMfyfwb6ASd?=
 =?us-ascii?Q?wsyUurE+ww4p7f9Ub64Fs2YmfwNNi2fdg2Gf9o7VhTjApcWUsd7jvu+Zak29?=
 =?us-ascii?Q?V7MYak+zY802mgN9IWVdL3RmGK90AHtdrf7brekJ8vU3KxBBwspVk++BJ9lL?=
 =?us-ascii?Q?+gMo6U5wb4e4RVcB+/CR2CYejq2Gcul35OGopf4UhrcwCVEJzT1W/h4DG74s?=
 =?us-ascii?Q?pYBeyHLfOZxnXOohPOGbW6EFYQLICeCLtcfc9Yd942mlrFqn860Ujiobgezz?=
 =?us-ascii?Q?GzG0HkvZlnuKvBU8EXk4noWnT+KjB7faAZLuHkpmo91yKqZkFxPCsUlhP1ME?=
 =?us-ascii?Q?ucAOe2SXN1hTf/dTwrCJcVOHeOV9V4mj/an1s/leOh7iaVkc83emH9PKn6YU?=
 =?us-ascii?Q?Yra3pdgZFwYZkjnMd52VeVsqFie6jrWpizhuRWbzYvGjezse6ZHRCV3Ayvrp?=
 =?us-ascii?Q?KoGp84DrEcUjfVrnMsozG4rHq4mepI4d+7GfQejMXJ08OdpJo38CrB188yWY?=
 =?us-ascii?Q?9EBLrhAg3ccJFA6EM9I0WyF0LHizfUuZETuSFJpAwdAbAL0mBQN0jXZQHhNc?=
 =?us-ascii?Q?JRB48LJ6VKlnSMd5zEDsJO9pQDpoJhpuZ4W4RtUL7h8cGIEqxFnA13aSFJnU?=
 =?us-ascii?Q?eFjP0v0TpLjEBSGIdIoYlRS9GhJ0Y2FARsEOXuflQLRqFsClskzom9Bdkho0?=
 =?us-ascii?Q?ByYBhqOQ0c9ZmTKbcuOsXMScsWIRWHlQzLeJOaPrUHvzVeFLNMyB+9Z0KAC3?=
 =?us-ascii?Q?d+AUOekZlDp3ZZzkw/V/CayHT9haEXEcXHqn2yI0H2IFoG3SHoEKUDlU886b?=
 =?us-ascii?Q?iyiqMOSCHHYIzzSahgoqkw++A4fag0StDvxGVdI/D9LnerV5wQfv+wL1872q?=
 =?us-ascii?Q?6gslbdaBqLt0f11Qwgvp+NaRac6fXDzFDw3Cy9m3ZrN3zArsfb3DztT+iwNd?=
 =?us-ascii?Q?53KJrf7ar6EnC/ziJq42IBXR/Uu8NJtxgtgUu4TS2/m3phjSZNTWO6Fijkdp?=
 =?us-ascii?Q?ATvgKhYtbjl5lLchcwJbqki0MQ/IU4o7hU0moJLQzIfIvxLJRWFJW7H3eTtg?=
 =?us-ascii?Q?AYGCkOFxw8mXbXqjaM8l2A3PNQscPgt6loryhLR/v1KIzE1QRh5HHwiuO9IS?=
 =?us-ascii?Q?5ozXKpXZ5x9eC8vAC0K2gKi3MnAuHSJZeHO7IBJfpmvHPh2fC1pQMAF9bMC5?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98557c06-6f02-4014-de8b-08dce610ca62
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 14:11:37.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9MbubhdDpJYW5zkkccsld41obIQCI+tjxA8SDz6IU/JbTxT33vsyADFQqlZ0Bp+7pmW7cXUMEjLBO6fvLfrYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h" on:

commit: 3e721b4c4250773f06818e43821a30108775a59b ("[PATCH 4/5] mm: Add PageAnonNotKsm()")
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/ksm-Use-a-folio-in-try_to_merge_one_page/20241002-232657
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20241002152533.1350629-5-willy@infradead.org/
patch subject: [PATCH 4/5] mm: Add PageAnonNotKsm()

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | 3e3e3b90a7 | 3e721b4c42 |
+------------------------------------------+------------+------------+
| boot_successes                           | 6          | 0          |
| boot_failures                            | 0          | 6          |
| kernel_BUG_at_include/linux/page-flags.h | 0          | 6          |
| Oops:invalid_opcode:#[##]SMP             | 0          | 6          |
| RIP:folio_add_new_anon_rmap              | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 6          |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410062122.193c5b0e-oliver.sang@intel.com


[  219.772371][   T65] ------------[ cut here ]------------
[  219.783937][   T65] kernel BUG at include/linux/page-flags.h:1139!
[  219.798558][   T65] Oops: invalid opcode: 0000 [#1] SMP
[  219.800949][   T65] CPU: 1 UID: 0 PID: 65 Comm: kworker/u10:1 Tainted: G                T  6.12.0-rc1-00097-g3e721b4c4250 #1
[  219.800949][   T65] Tainted: [T]=RANDSTRUCT
[ 219.800949][ T65] RIP: 0010:folio_add_new_anon_rmap (include/linux/page-flags.h:1139) 
[ 219.800949][ T65] Code: 40 ec ff 48 89 df 48 c7 c6 1a 3c 7b 90 e8 78 58 fc ff 90 0f 0b e8 40 d9 e7 ff 4c 89 ff 48 c7 c6 ef 26 78 90 e8 61 58 fc ff 90 <0f> 0b e8 29 d9 e7 ff 4c 89 ff 48 c7 c6 d9 61 68 90 e8 4a 58 fc ff
All code
========
   0:	40 ec                	rex in (%dx),%al
   2:	ff 48 89             	decl   -0x77(%rax)
   5:	df 48 c7             	fisttps -0x39(%rax)
   8:	c6                   	(bad)
   9:	1a 3c 7b             	sbb    (%rbx,%rdi,2),%bh
   c:	90                   	nop
   d:	e8 78 58 fc ff       	call   0xfffffffffffc588a
  12:	90                   	nop
  13:	0f 0b                	ud2
  15:	e8 40 d9 e7 ff       	call   0xffffffffffe7d95a
  1a:	4c 89 ff             	mov    %r15,%rdi
  1d:	48 c7 c6 ef 26 78 90 	mov    $0xffffffff907826ef,%rsi
  24:	e8 61 58 fc ff       	call   0xfffffffffffc588a
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e8 29 d9 e7 ff       	call   0xffffffffffe7d95a
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	48 c7 c6 d9 61 68 90 	mov    $0xffffffff906861d9,%rsi
  3b:	e8 4a 58 fc ff       	call   0xfffffffffffc588a

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e8 29 d9 e7 ff       	call   0xffffffffffe7d930
   7:	4c 89 ff             	mov    %r15,%rdi
   a:	48 c7 c6 d9 61 68 90 	mov    $0xffffffff906861d9,%rsi
  11:	e8 4a 58 fc ff       	call   0xfffffffffffc5860
[  219.800949][   T65] RSP: 0000:ffff90094044fae8 EFLAGS: 00010246
[  219.800949][   T65] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
[  219.800949][   T65] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  219.800949][   T65] RBP: ffff90094044fb28 R08: 0000000000000000 R09: 0000000000000000
[  219.800949][   T65] R10: 0000000000000000 R11: 0000000000000000 R12: ffff900940107000
[  219.800949][   T65] R13: 00000007fffffffe R14: 0000000000000000 R15: fffff9dd10bf0ec0
[  219.800949][   T65] FS:  0000000000000000(0000) GS:ffff900c2fd00000(0000) knlGS:0000000000000000
[  219.800949][   T65] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  219.800949][   T65] CR2: 0000000000000000 CR3: 00000000a1a37000 CR4: 00000000000006b0
[  219.800949][   T65] Call Trace:
[  219.800949][   T65]  <TASK>
[ 219.800949][ T65] ? __die_body (arch/x86/kernel/dumpstack.c:421) 
[ 219.800949][ T65] ? die (arch/x86/kernel/dumpstack.c:?) 
[ 219.800949][ T65] ? do_trap (arch/x86/kernel/traps.c:171 arch/x86/kernel/traps.c:197) 
[ 219.800949][ T65] ? do_error_trap (arch/x86/kernel/traps.c:217) 
[ 219.800949][ T65] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139) 
[ 219.800949][ T65] ? handle_invalid_op (arch/x86/kernel/traps.c:254) 
[ 219.800949][ T65] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139) 
[ 219.800949][ T65] ? exc_invalid_op (arch/x86/kernel/traps.c:315) 
[ 219.800949][ T65] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 219.800949][ T65] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139) 
[ 219.800949][ T65] ? folio_add_new_anon_rmap (include/linux/page-flags.h:1139) 
[ 219.800949][ T65] handle_pte_fault (mm/memory.c:4842) 
[ 219.800949][ T65] ? ftrace_likely_update (kernel/trace/trace_branch.c:?) 
[ 219.800949][ T65] handle_mm_fault (mm/memory.c:?) 
[ 219.800949][ T65] ? handle_mm_fault (arch/x86/include/asm/current.h:49 mm/memory.c:6062) 
[ 219.800949][ T65] __get_user_pages (mm/gup.c:1189) 
[ 219.800949][ T65] ? ftrace_likely_update (kernel/trace/trace_branch.c:?) 
[ 219.800949][ T65] ? is_valid_gup_args (mm/gup.c:2546) 
[ 219.800949][ T65] get_user_pages_remote (mm/gup.c:?) 
[ 219.800949][ T65] get_arg_page (fs/exec.c:225) 
[ 219.800949][ T65] copy_string_kernel (fs/exec.c:685) 
[ 219.800949][ T65] ? __cond_resched (kernel/sched/core.c:?) 
[ 219.800949][ T65] kernel_execve (fs/exec.c:2000) 
[ 219.800949][ T65] call_usermodehelper_exec_async (kernel/umh.c:110) 
[ 219.800949][ T65] ? __cfi_call_usermodehelper_exec_async (kernel/umh.c:65) 
[ 219.800949][ T65] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 219.800949][ T65] ? __cfi_call_usermodehelper_exec_async (kernel/umh.c:65) 
[ 219.800949][ T65] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[  219.800949][   T65]  </TASK>
[  219.800949][   T65] Modules linked in:
[  220.299454][   T65] ---[ end trace 0000000000000000 ]---
[ 220.310211][ T65] RIP: 0010:folio_add_new_anon_rmap (include/linux/page-flags.h:1139) 
[ 220.322429][ T65] Code: 40 ec ff 48 89 df 48 c7 c6 1a 3c 7b 90 e8 78 58 fc ff 90 0f 0b e8 40 d9 e7 ff 4c 89 ff 48 c7 c6 ef 26 78 90 e8 61 58 fc ff 90 <0f> 0b e8 29 d9 e7 ff 4c 89 ff 48 c7 c6 d9 61 68 90 e8 4a 58 fc ff
All code
========
   0:	40 ec                	rex in (%dx),%al
   2:	ff 48 89             	decl   -0x77(%rax)
   5:	df 48 c7             	fisttps -0x39(%rax)
   8:	c6                   	(bad)
   9:	1a 3c 7b             	sbb    (%rbx,%rdi,2),%bh
   c:	90                   	nop
   d:	e8 78 58 fc ff       	call   0xfffffffffffc588a
  12:	90                   	nop
  13:	0f 0b                	ud2
  15:	e8 40 d9 e7 ff       	call   0xffffffffffe7d95a
  1a:	4c 89 ff             	mov    %r15,%rdi
  1d:	48 c7 c6 ef 26 78 90 	mov    $0xffffffff907826ef,%rsi
  24:	e8 61 58 fc ff       	call   0xfffffffffffc588a
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e8 29 d9 e7 ff       	call   0xffffffffffe7d95a
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	48 c7 c6 d9 61 68 90 	mov    $0xffffffff906861d9,%rsi
  3b:	e8 4a 58 fc ff       	call   0xfffffffffffc588a

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e8 29 d9 e7 ff       	call   0xffffffffffe7d930
   7:	4c 89 ff             	mov    %r15,%rdi
   a:	48 c7 c6 d9 61 68 90 	mov    $0xffffffff906861d9,%rsi
  11:	e8 4a 58 fc ff       	call   0xfffffffffffc5860


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241006/202410062122.193c5b0e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

