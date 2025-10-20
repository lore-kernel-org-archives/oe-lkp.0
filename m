Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C1264A90
	for <oe-lkp@lists.linux.dev>; Mon, 20 Oct 2025 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949247; cv=fail; b=I+dHC811xeAL33daxOr2HcwCHQ8neEgX9wHrp5ZtX890N3NXFNptecjPYwTIUE/LU+rsaLrAv7dJ2UL9oC1VGyNnQodAadCE2E/FTx8zFlbUnyEiOVYSgd1kLNAQ5XCfKK7/N+gJlOFJGjQUVnhG8cGkW8QQstsMXvj+irIrXJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949247; c=relaxed/simple;
	bh=+bqSSefvqLn6UdCsXwofiKfBGuMRI7LGP5YE3lGXm3U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RuhpvsuL3gC2BIAkSdeJUVzOhKSxd3FY8vKRV4OKZDGbYVllU0R4vfoOEgqOXC4y6eKVNZuVUVhNjKsgs3ntBzKaRtGJu0v7b338EfMAQVXDEX/fCxEMaxWXVoTgLZwncIfsPUU0DYkgLdNC2yBGlbjSSXALrF9YHyc0g3iyjc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc6rUBUJ; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc6rUBUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760949246; x=1792485246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bqSSefvqLn6UdCsXwofiKfBGuMRI7LGP5YE3lGXm3U=;
  b=Zc6rUBUJhw6fq0yWIQYvDHKTK6BoGl43MJFqH0cUKmJHM9NChg9ssux7
   RDN4ePzduOau4biNzyqVOO2KADCaC6VnJ/HDpzt7bUYS64bdIrlMu2ihn
   6n/NLf3tzJO8LkY2eou58djhd1ywne+VGQ00QkejqzmHZsBkkY515vglX
   yeEWDRtA6rdp1j0bMWHF+tPbVS1zcHNBH4ZytqYuuv52rEzoWhhx1hQF9
   iyRuijACV5DFCuM24+GBwn9n7XZW2UAKobPnMsmDD6v64mvdWZNIybYkE
   0WMuJl0xBH14598Fr3xKm97Ud7JAE6naa2Zd/3Yucz21NzbSvmXCr20Fz
   A==;
X-CSE-ConnectionGUID: +v4HvM+/QX6OJoVDBdr+pg==
X-CSE-MsgGUID: X9TK8bD+Tviqg0aLKypnHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63208716"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="63208716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:34:00 -0700
X-CSE-ConnectionGUID: 9xxXh8TTR0KI2FsF0VlbCQ==
X-CSE-MsgGUID: OQkGys4XQB+hcGC7b+XklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183688942"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:34:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 01:33:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 01:33:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 01:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyL2LpSp3ZZKNNOI0MaykPWuVHpRH41NHsuWPgvCKHwYxekJuzKE6NA9q5vuvgKTSrdrhjE+ji+L/U7+iMbLZmpjPs9LOz6KEkzOTdgOHJf+MDfBHoteKVc4XytSxvLxoG2/KLPHDpI0whEUaCYX6fFm7IGACyKzpGRes9LA05SKtZr6wixR8YhnWtq75at0E1703wmb2vUtnUBJN/8uKAiFWPgB9Djg+XAAGJV83G+7XCq9u0fd7GfSiQA0u3CmksHL2v1a8xtSbFGgkccSwPuGB0v1xw6P8yJoNv6srHs+8feD5oNBpgWatmKHiP+nGgGKaYJjUusLNrhy1tvzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WXZJXdiJ0XVSJMqOBCmDxqAZoYrO9KuR9aQXCDQEIc=;
 b=X6v/z/z8hmOCzUYvjeV9eMTBZ3F4pA2PWgBeb2XxYDvq8SjqilxQ0YXDLw0rtqkoh/jfyPVFwpO1LDvcKC/WkC6mpYCwWhigj1y1NG8ch6aoHudqy7IUhXRfKLTwkl8uqCyvb7IjJk/XTc+najid+BlsQqpmKqEK4tZZVr3RKMoT2HJqNkl1q3jx/UiQba+3TiHK9t1bqWQ3ahJpJxLBortWTCAbsMeLQimEegHdSw9I0m2pn/3zXzOrgPQzxVcqxMxp5L60WcPgM3UfGQ6bnH4Jl0BB7TB4dE4hnExebUMhqWXdIT4abYvzHr2LKoPuD/AJ2lI59z5VgC4s5GcWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 08:33:57 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 08:33:57 +0000
Date: Mon, 20 Oct 2025 16:33:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:rseq/slice-v2] [x86/uaccess]  ca5d17f701:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202510201601.c47d1c7c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0007.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7043cf57-9a6b-4df6-b961-08de0fb3691a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?861w8sVy/ufolkORlkM1T3pRSU40LANkItdUOZTLUrzTKMJb2X2enuj8EmrY?=
 =?us-ascii?Q?zM18muNCjDwBJ6S/iWn/VK/TBB0tHwoaxiYOwbSTHchwRPEt8EUR2ObBBY41?=
 =?us-ascii?Q?s76zL8XelQQ9MsrM/G+O2v4972ZaJq1DtMU36uN4U6noLHL4GCTiQPRfXc3G?=
 =?us-ascii?Q?qioOiwbajgOP0kBDEQDol1hxUEh0RLt4/5iHKiYxy513enYXApWPLidv86BQ?=
 =?us-ascii?Q?sJplhqu+sI+MctfO63QT0Tgg4Kjgvv/TZhgHeAY1OQR6ul/MHqixVgi5gqAR?=
 =?us-ascii?Q?bynYYElS3prC7GZS3KNJPzyIaszaCMD6X/GMq2h4XGPpdtvE7j09/bj4GZ0B?=
 =?us-ascii?Q?oRrHC8vRg4PKBO2H0yy2sFOfrsyiQug3tJSWj04NShMo6rEgh5a2e/VVBI5P?=
 =?us-ascii?Q?xShCcvvfAgWQhEqpMUvCWtlF0Qnm0OAQ8lidAHVpXsqXIYHI7WlhBaqdjvej?=
 =?us-ascii?Q?PkKDNBJlgAT+6QQFMMWXIB541JZMoXF1bhYSlBowhHg2KF7j1O01W/j5XEMu?=
 =?us-ascii?Q?xQAWM53YoBbxMlnIgJpgoohJKGcqy2MCGjcRu6H6pMFVgyAgi0tMlad0TZmy?=
 =?us-ascii?Q?KTwYQPti0wwa2S+bRmkoiv+VH1Oj7iJbuYqKD3vhpsHpv0hu0u4s89mRyK1J?=
 =?us-ascii?Q?PRhE1HYAyosb3+zTmloDL3u+vTVu/bWOxafcnYWVRk/sFOfPmYIyraPR3t4f?=
 =?us-ascii?Q?mB0jLZY/SgcRlQ9CqBeF/Qx34+L1WNXyM8ZcI5/BcvafMHAC0kP0Ces7luAl?=
 =?us-ascii?Q?nwuiY88bwXFLOfnT8y3W5lixiDE4soMNGXoqvoSyHkJMD56b+cl+tumlwR2C?=
 =?us-ascii?Q?asU62d/ybiGMV8yrBsa6zZlNuIpeyKcS0EOpiI9hKvzq1uKagmsZGd3ha2CP?=
 =?us-ascii?Q?p6IdwDxL6ym3qv/6xmUx1d8juMx9PAYAuJkfEVE7YciYkbrFPnC0GO6KCEeG?=
 =?us-ascii?Q?flFVNwP8qoJ+YSF392oLOdHIdB98Kv/Heeold05r9iVoeiVMiF/BWWIBwDwf?=
 =?us-ascii?Q?ofcx4Z5z4VmuucQWc73lSaChXTdmypiNxc9YXlW6qXTcgz/jyabsZplA1q+c?=
 =?us-ascii?Q?nS81G+dnxO7AnrVMC5EeKtzb5hbM1cRY64m70gHPZxqSOD1oxaQtNtV0Bf6v?=
 =?us-ascii?Q?UItS5F0YssNSOXGMAp+tUa3HDR2rD8l2U47fd6rFP3zswhhwKwvokAM73CCu?=
 =?us-ascii?Q?wp6oNfRVmtazms99J/VR2bEEmtnIglIR5FInXbrnbAa8WRhoVrqwbvw80Dgt?=
 =?us-ascii?Q?yWKld/9mkXTHs+fXOCcXcW6QdJ/BdydzJXmLvyDCYCj84istiVx/yE1wMj/N?=
 =?us-ascii?Q?E48JpRm1+jsvXte8vfn28N6hTdnxo3By7ajOKrUqyaMcmyoAyaa9vqvw8r/U?=
 =?us-ascii?Q?QQHsHIgGCt8H2VqPhmdgvFTB7fmIYy0BP2++kBxgZ1Vx/OZJreFteu3H3RBP?=
 =?us-ascii?Q?ToK9fcXYtX5bomeR3hYbNSXOV1n5xSwf2kYP1HajM7gP5laWjvpXOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fcUr7TLJFDCcfCsbO7SCfjoI0QDxl6PH7v59go7itiKj7DehFruByIesP6U8?=
 =?us-ascii?Q?Cnog2Qc2Kq+b2O9Q+U24SnGQ22QcegqDkcxEynl6AY6YTTkBuE6sBJ8phXQS?=
 =?us-ascii?Q?wZqzwi6+K3arY5Yyu2k8Ex+EBxDzQEmzH0Q++op8YVYDjM+y12FFfZyXiN+D?=
 =?us-ascii?Q?x4AoCJopMqVdKXUd4dXBPi1Wsgdc/RVmEw6mBinidQu/ooNyidSbagYNAuvB?=
 =?us-ascii?Q?eZKIvpniXmEygCKsYkT+e0m/6cioRWhYwQM4zJ4L5P+Nx3Rms2FO81qRW9Cg?=
 =?us-ascii?Q?f3PqZsC+arLc9O58oDc3Ec0ZubUuIuJAoqnqvB1L038hvYBnBp/saEWjdusP?=
 =?us-ascii?Q?LBeehjjXTOu05qEWRuAxhPic4RmgMSu9Y8uDzEU3cNFqC7Jf35kjHdGn+GK5?=
 =?us-ascii?Q?rWelbSL9CQ2rautDGDnIZROJ/Gg1w1+gqwoTGhnO9KKwytUel4PCAVVABby7?=
 =?us-ascii?Q?OlEWSUKXv4jJPjXEY3b1XUnCRhXooRBXYSrHVJ9FSZYrJ9mGT4T1SqvOagSk?=
 =?us-ascii?Q?hgNS0T2mrjNUYEK9+oxRxWSxxQsdJd7R2utiS2XBYmT54wqUvyvCiKKACtg8?=
 =?us-ascii?Q?Fm6HIQJw5TGBVKpBPavjYg9Roc+1grxyEgBj1Fxa5yXEFaRxrQj53TeEVx0g?=
 =?us-ascii?Q?lz7cbuOzVmn8f+FlAhq9J7nrZ/H4zyC5cd2EJb5kLUamS2cFoBsdfIGQYBPm?=
 =?us-ascii?Q?1oJMazNVnEyKb3vfKXbhogHuSrwY5LOJGpaQPGzCpPdeu1ZnrWeT4SrrJoac?=
 =?us-ascii?Q?4KGfP0q9EMVy1b8CSBPGKu6XYJs4lMsjziM+Pur9o/RLsi6scYFegW9voGN/?=
 =?us-ascii?Q?MLnizQY1bM4okPUXg3AdgqkQU82UZb9R03TYkof8q+FE0E4lCysGrJwm0dTq?=
 =?us-ascii?Q?Z8NMhUGkQiR4hIvRYlMPpeY8LLBSCNJ7h60iWKk/2bMbulumJl6pOKC6VKpS?=
 =?us-ascii?Q?hg5QcrLVUe1T9jRG6x5R+WZ6dlSaFpEy9OIdSz1f/J1VvJHfnMum6sQwygjF?=
 =?us-ascii?Q?OYw7BCZxd+5RF6NUqPyqAov7eAxy6JtIbMRPFxqai+1rXJL5QAEGSBFJT+9o?=
 =?us-ascii?Q?McVWBsvHIbA8myWpLh9Pi1kGJPQx8WP3AS2WSqpuGNXzNtxmuPjZMfqlTyTs?=
 =?us-ascii?Q?xe77llzgmnsdRIzEDcESScOU4j9k60EQsQCjkqVunileIYL2cTXWAuKQPuGf?=
 =?us-ascii?Q?iEou0KatvQoCU3j3r+KPcnxHYwx9Rpzy7ETzoD4KJ007dSzBp12sblJQhQsT?=
 =?us-ascii?Q?M3fjurqkxiaNPwo48z0hRxRvGO5MFiweyj7gSIq0lvvHbemri37VqCG6kYD7?=
 =?us-ascii?Q?0hyC+1B1KXomqZuRLM6MbFUOXi6ReqE4UiFC1TYeVYDNAv65eopfKvku69nf?=
 =?us-ascii?Q?i3EWQMLYGtRAMUC19ueMWXaTL5floe05+LuszinUAkZLfhK3PDDmwKrsRQZ8?=
 =?us-ascii?Q?wsRRRyTuN+vdeS/1E088SW2gCSDynEEVSbbRLNZaslfAKknRRDDn3tybeMz/?=
 =?us-ascii?Q?tNGylSUzMD7wtRAeMOygBvD6d6qcP3R3eFhK12oAPcR0VjBanPkgKir011zW?=
 =?us-ascii?Q?HuUlEXD/SrjEFYoNPbhZ4w34k4ql+qaFxHqDrldD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7043cf57-9a6b-4df6-b961-08de0fb3691a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 08:33:57.1332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M66X3Rwq/WHSpNuQXPunsLcQVe7itzI3JvnqQdlp9/4a9lbzM30AaWHf3anTz5LCYGEhCmXCFQCPF5V1H5X+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: ca5d17f701a68fca8bf2f0cce176d88fbc3ac18e ("x86/uaccess: Use unsafe wrappers for ASM GOTO")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git rseq/slice-v2

in testcase: boot

config: i386-randconfig-141-20251018
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 8a11b88211 | ca5d17f701 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 12         | 0          |
| boot_failures                               | 0          | 12         |
| BUG:unable_to_handle_page_fault_for_address | 0          | 12         |
| Oops:Oops:#[##]                             | 0          | 12         |
| EIP:copy_to_kernel_nofault                  | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510201601.c47d1c7c-lkp@intel.com


[    0.117637][    T0] BUG: unable to handle page fault for address: ffdab000
[    0.119989][    T0] #PF: supervisor write access in kernel mode
[    0.120741][    T0] #PF: error_code(0x0003) - permissions violation
[    0.121536][    T0] *pde = 0741f067 *pte = 0741d121
[    0.122171][    T0] Oops: Oops: 0003 [#1]
[    0.122685][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G                T   6.18.0-rc1-00003-gca5d17f701a6 #1 PREEMPT(undef)
[    0.124227][    T0] Tainted: [T]=RANDSTRUCT
[    0.124758][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.126055][    T0] EIP: copy_to_kernel_nofault (mm/maccess.c:78 (discriminator 7))
[    0.126746][    T0] Code: 83 f9 03 76 12 8b 36 89 30 83 e9 04 eb ea 66 8b 36 66 89 30 83 e9 02 89 d8 89 d6 29 c8 29 ce 83 f9 01 77 ea 85 c9 74 04 8a 16 <88> 10 e8 d1 fd ff ff 31 c0 eb 11 89 30 eb 03 66 89 30 e8 c1 fd ff
All code
========
   0:	83 f9 03             	cmp    $0x3,%ecx
   3:	76 12                	jbe    0x17
   5:	8b 36                	mov    (%rsi),%esi
   7:	89 30                	mov    %esi,(%rax)
   9:	83 e9 04             	sub    $0x4,%ecx
   c:	eb ea                	jmp    0xfffffffffffffff8
   e:	66 8b 36             	mov    (%rsi),%si
  11:	66 89 30             	mov    %si,(%rax)
  14:	83 e9 02             	sub    $0x2,%ecx
  17:	89 d8                	mov    %ebx,%eax
  19:	89 d6                	mov    %edx,%esi
  1b:	29 c8                	sub    %ecx,%eax
  1d:	29 ce                	sub    %ecx,%esi
  1f:	83 f9 01             	cmp    $0x1,%ecx
  22:	77 ea                	ja     0xe
  24:	85 c9                	test   %ecx,%ecx
  26:	74 04                	je     0x2c
  28:	8a 16                	mov    (%rsi),%dl
  2a:*	88 10                	mov    %dl,(%rax)		<-- trapping instruction
  2c:	e8 d1 fd ff ff       	call   0xfffffffffffffe02
  31:	31 c0                	xor    %eax,%eax
  33:	eb 11                	jmp    0x46
  35:	89 30                	mov    %esi,(%rax)
  37:	eb 03                	jmp    0x3c
  39:	66 89 30             	mov    %si,(%rax)
  3c:	e8                   	.byte 0xe8
  3d:	c1 fd ff             	sar    $0xff,%ebp

Code starting with the faulting instruction
===========================================
   0:	88 10                	mov    %dl,(%rax)
   2:	e8 d1 fd ff ff       	call   0xfffffffffffffdd8
   7:	31 c0                	xor    %eax,%eax
   9:	eb 11                	jmp    0x1c
   b:	89 30                	mov    %esi,(%rax)
   d:	eb 03                	jmp    0x12
   f:	66 89 30             	mov    %si,(%rax)
  12:	e8                   	.byte 0xe8
  13:	c1 fd ff             	sar    $0xff,%ebp
[    0.129208][    T0] EAX: ffdab000 EBX: ffdab001 ECX: 00000001 EDX: 46d95f00
[    0.129871][    T0] ESI: 46d95f77 EDI: 073bf9e0 EBP: 46d95f68 ESP: 46d95f60
[    0.130457][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210002
[    0.131138][    T0] CR0: 80050033 CR2: ffdab000 CR3: 0741c000 CR4: 00000090
[    0.136052][    T0] Call Trace:
[    0.136467][    T0]  ? mem_init (arch/x86/mm/init_32.c:675 (discriminator 2) arch/x86/mm/init_32.c:720 (discriminator 2))
[    0.137012][    T0]  ? mm_core_init (mm/mm_init.c:2708)
[    0.137612][    T0]  ? start_kernel (init/main.c:972)
[    0.138215][    T0]  ? i386_start_kernel (arch/x86/kernel/head32.c:129)
[    0.138833][    T0]  ? startup_32_smp (arch/x86/kernel/head_32.S:293)
[    0.139459][    T0] Modules linked in:
[    0.139843][    T0] CR2: 00000000ffdab000
[    0.140232][    T0] ---[ end trace 0000000000000000 ]---
[    0.140753][    T0] EIP: copy_to_kernel_nofault (mm/maccess.c:78 (discriminator 7))
[    0.141311][    T0] Code: 83 f9 03 76 12 8b 36 89 30 83 e9 04 eb ea 66 8b 36 66 89 30 83 e9 02 89 d8 89 d6 29 c8 29 ce 83 f9 01 77 ea 85 c9 74 04 8a 16 <88> 10 e8 d1 fd ff ff 31 c0 eb 11 89 30 eb 03 66 89 30 e8 c1 fd ff
All code
========
   0:	83 f9 03             	cmp    $0x3,%ecx
   3:	76 12                	jbe    0x17
   5:	8b 36                	mov    (%rsi),%esi
   7:	89 30                	mov    %esi,(%rax)
   9:	83 e9 04             	sub    $0x4,%ecx
   c:	eb ea                	jmp    0xfffffffffffffff8
   e:	66 8b 36             	mov    (%rsi),%si
  11:	66 89 30             	mov    %si,(%rax)
  14:	83 e9 02             	sub    $0x2,%ecx
  17:	89 d8                	mov    %ebx,%eax
  19:	89 d6                	mov    %edx,%esi
  1b:	29 c8                	sub    %ecx,%eax
  1d:	29 ce                	sub    %ecx,%esi
  1f:	83 f9 01             	cmp    $0x1,%ecx
  22:	77 ea                	ja     0xe
  24:	85 c9                	test   %ecx,%ecx
  26:	74 04                	je     0x2c
  28:	8a 16                	mov    (%rsi),%dl
  2a:*	88 10                	mov    %dl,(%rax)		<-- trapping instruction
  2c:	e8 d1 fd ff ff       	call   0xfffffffffffffe02
  31:	31 c0                	xor    %eax,%eax
  33:	eb 11                	jmp    0x46
  35:	89 30                	mov    %esi,(%rax)
  37:	eb 03                	jmp    0x3c
  39:	66 89 30             	mov    %si,(%rax)
  3c:	e8                   	.byte 0xe8
  3d:	c1 fd ff             	sar    $0xff,%ebp

Code starting with the faulting instruction
===========================================
   0:	88 10                	mov    %dl,(%rax)
   2:	e8 d1 fd ff ff       	call   0xfffffffffffffdd8
   7:	31 c0                	xor    %eax,%eax
   9:	eb 11                	jmp    0x1c
   b:	89 30                	mov    %esi,(%rax)
   d:	eb 03                	jmp    0x12
   f:	66 89 30             	mov    %si,(%rax)
  12:	e8                   	.byte 0xe8
  13:	c1 fd ff             	sar    $0xff,%ebp


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251020/202510201601.c47d1c7c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

