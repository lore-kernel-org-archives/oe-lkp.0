Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2474413
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722404221; cv=fail; b=KOKYebQYOBYvPZMJTeHRe9/DJlgruf7NiNMbZ4YKzc7b6ckbleqtRcak/PgkOSeMIqrS2ol/+u4IABmMlXGViotnXH8CkHCVh95Y7TvM4/NSqSnQ44HrAwvrvOvjZYccATfFx4ZuUWVrJDwZvaFGAG6bNMIuhR+5SVL+i2MIfY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722404221; c=relaxed/simple;
	bh=aRQSbfch16telvER/eRWHUr2k+d0q3uZeGboQD+kSWA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=l9Wcc1aODwD4WsaHR0o22t0d9RwNgNIi0jYM+ZJLvcjI8yEnNLyv6/spCy3qxGgIdeONaI2pQDPY6TkEabzVI8GBGi9I5L0a0B3QIPGyF0wzJbZCkOGdjh68j2SGARoJpE1AzjIEDD0W6Kps7bYynuyLOGHS0vKy36xJNMjI+Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0CmhWup; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0CmhWup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722404220; x=1753940220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRQSbfch16telvER/eRWHUr2k+d0q3uZeGboQD+kSWA=;
  b=V0CmhWup8BV8kREDLTwL7xOpi5ICawfIP042iAtPHymgl96HIYY/QWBj
   rn0J6SBsTHyjzUUTzH2RX9Nucc4sW32mmeu/BELpScZv5mLNQRhVIb/7f
   k/8sVATp4p4CofniMGHyXL0Rug10IKf0iWg7L6c/1sonxxp8d2TfO2ue7
   4iVWJPFUfZj87ZpzhxwX7t9ZeanHzNk9qnGTLtrQMpVc0FmH8KHVDHZYf
   wqw6CnHJVOELA3Z8RvgNJnk1TLuJDIKUDth3X+1wocLbkiVDyBRbpFVhN
   p9BJCkHdqqiOEWKUO4y0t8W+0nqV0/F7NT1R+5i1V5F4xdl/ecRQlYC7t
   g==;
X-CSE-ConnectionGUID: OceusBb9T7SPb85D9qKBeg==
X-CSE-MsgGUID: qLoVaOVxQMedBP0A20W+oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31652497"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="31652497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 22:36:59 -0700
X-CSE-ConnectionGUID: 0nxYrksAQjS6hP7MupvQcQ==
X-CSE-MsgGUID: 5llFwP8tTkaE1yYNfdJYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54230261"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jul 2024 22:36:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 22:36:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 22:36:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 22:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwwRh72fPT7kR5h7zh5YKxcT/qL064Ysb53GxJFaE1aKMj6WAPIbOrUWcboV9XxF1odyE6MrG48/f5hl+kc9arwpeZTlosbQxr4ILS3dRuPcYQcQFw4qk7uxc7bMtPrKD3/z/BGzB337IeiW6FhcB1rA+kOoG3gDpi4WrvcKOcIwVWe31zYKAWJNaPc3kEbnm0NKFGgi+ll5rseUWTiA5XEUorGOhQ/tq86FTqRngbeALJMU9tR6cqZ9ETs1iBwrsJDiX1gVlhxNBUfUPdPxf4kMET0Ji+33nOlP+VzDj4PBweEsViSM+RxtGcTWmELZ7LEcHQuPnnchE8YFK3p7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDHYU/bDjU26SM9p7TcI/mOQ1d1f27y5iXX5GxSHBmU=;
 b=upKFsfmAIrJ3k1pdC8wdRoryo1Vi0I1K1DPcH/7ysH9AFbHUmO5D3aXtoLmGJN+MpMxBNKEqooVlDEFSkgsDDMaSg/H7PC2hmiDrnZ1oBF03UoF+u2kPNcGsb7h8pLyz7f8S48iFIWHDm2TemflOCHEmipx+UJjbFajykpCCE06CqnadGz6mi13M3LR1O+0GXY7gW7At2Qt79dHaJNE77Xs+YQ716IV5TEgH6IZmXBA5kDAeQWGPRxETkmZu4FA/KsPJf5y/3IZaQgfzpcZh5AEqxXrCNx8ZSBlnq/9718J+hc0oMGmUP+0r03q8nYxUp2k48DJWnsGSOsoJWa0I8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 05:36:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 05:36:52 +0000
Date: Wed, 31 Jul 2024 13:36:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Muchun Song
	<muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Peter Xu
	<peterx@redhat.com>, <oliver.sang@intel.com>
Subject: [linux-next:pending-fixes] [mm]  e98970a1d2:
 kernel_BUG_at_arch/x86/mm/physaddr.c
Message-ID: <202407311033.939d4064-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb9d96a-1e7e-480d-640d-08dcb122c817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MgjA4S1wdgHx+glXYMvXvthQf1Ablfd2eXa4NgxqxlwvjJC4UPA4FwXCkClV?=
 =?us-ascii?Q?3cvnwKAjVC/SzcBfs4rK6+2upVHmc+oZ3qXCG+57RnvNYntmwjTXYY+5nJgR?=
 =?us-ascii?Q?YinaoWnTfM6OOcoFqsL++jV/dk9dpyjZEAN+bncEc3evkwDm8G6K4h1FkyZx?=
 =?us-ascii?Q?SvQOYH7RebGAgkKaAORkI61mooCIQ85JBurDJ3Noc2m5B4jjWavW+zl/+nrD?=
 =?us-ascii?Q?frQSwtIEzhRgbxxJ9GdUHc5oBGY+gkzFMC5tq5s60EAv93bytm7QOBKcU9xS?=
 =?us-ascii?Q?FJy+Ba+AvIphiSDrn5aaFfZIsnrYX8MbdKsR0ko86kXp+w4uMNg5lVhjRqfO?=
 =?us-ascii?Q?30jR4NluQIcbX+Pr060Tww0T7d/Isvp+Vc19jjJHHtFNSrTXGboYSyBGTN9m?=
 =?us-ascii?Q?j2LiyHpbgwXdpIIxaq1zT9YJtQh07mkTXhmC3JSH3Yw2eir+p8VFPY5/bYYc?=
 =?us-ascii?Q?xpbZBt1b3PBPBVzg5uhBZJMUZ9WfJS1qlfXxsymadlLksvMsBRVntSDM9kmQ?=
 =?us-ascii?Q?1HD4Lqn90Ua4sambnWiKtcoZmP19zdr/5SId+jNVX8ZOZ5RFU1lpiL2MuYpK?=
 =?us-ascii?Q?n8E2JVGQ0V7Sq6J6tNqucHC5/LGnkwi8wDxWLIvjIiydTbQd/RfBspuwV/5D?=
 =?us-ascii?Q?bgRsrdiZV8c7PuXNb1v58uVvPl2nTIBTIXsML+VNy4KlD+8Ir/q1DLObOEl0?=
 =?us-ascii?Q?ozKsDJ963bwbBvs3TmMAFQt6wSi2YRZPtcwHMP6H9wShN4Ok4ZP+IykDj2n9?=
 =?us-ascii?Q?tj1/7TG2Hdsm8wsYaW7QVnjfBHroZSdcpOR/+Rl6HUZLmDTTQjGbi0O35bbL?=
 =?us-ascii?Q?wV7pZze1xFL9GRqH1XYVC7IMs+oGfgu2bixdwxzrYa/qyvaEaDRnsFSL1epA?=
 =?us-ascii?Q?mgRqxxy49QLa8T7HLBQq5MlrYeQdI2H6XOe3lRVL6wJl7cQ116QYfjLLNNOx?=
 =?us-ascii?Q?cadr5DELo4YDLn7brBQ+89fHmOhNKoQuGLV+kYkumAuOpogyt12Vap2rLkGq?=
 =?us-ascii?Q?HfdeCYxwopW3WhQkDge75uWvB1co9kp5hd1i/X3v/bYFkTWIkh9vZDJCMwZs?=
 =?us-ascii?Q?rYWoi8hJ1SRcFeHysMtZTUJdOe6umo1/wzaJeAskLz6HO8M2o5sGVLoQOnnF?=
 =?us-ascii?Q?qS6PBqao2dEJSt7q/vusVF0IqrjrCS5p0D306HI6UE1S9jqikf1KusJCjwzl?=
 =?us-ascii?Q?gDKebdXxpHQYtX816WOCaJlEerwm8OieQHxO6enEdQEoJQQVU6VeIVCoPpIR?=
 =?us-ascii?Q?FOyy27lMpnxIc5BApb9p/bg98ZSz8U3o+znJDS5VretWHIVxPlA+jwilUVZ2?=
 =?us-ascii?Q?Z34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JY+UHrq3LG2yshtaiOJ9A6NvbRKaF6uQ2FCiYXXhfo93cbGgE1ccA/h5D65G?=
 =?us-ascii?Q?oIgp4FzwOhS0qQIlvocra+cB7ngWfx67c6ccTTcYhdfNlPvPWs4aq5lK2KSL?=
 =?us-ascii?Q?C+PyDNCfa49XQZuIene1dTQ9LL4gAM6C0JJl2W4KBT7SDcczD2qABLb4lrG+?=
 =?us-ascii?Q?3by9T7swe028OR49g6UyKDc4lniNjzAoCqZOirZ90Pbf6pW7KpU9ZDxiZ0VB?=
 =?us-ascii?Q?ezOURSrZW/BzRyWnwTe0udxYt7cUtMJG1Yai8o/SS9Sdj7L4hgMj2Yy3tS24?=
 =?us-ascii?Q?aMbhCuGe6BnbFZjdLvZrpoRSJwAKVkyky1rjTFHaBHgbTIZGrrl5N1aeKgj8?=
 =?us-ascii?Q?3kxACXce1FkoL4R7MmzDxU1wa1vPRLJeQsJQfZ6O2lLWAqJQyCIs7oeqDzjv?=
 =?us-ascii?Q?W1l5wXLMPfhXdVLk6Tp0C8nAFqh/ZDBxs47g8ApA2OQ2B9I5Uqz3nkOybuKd?=
 =?us-ascii?Q?fG0Dp+1QiTTI4dUrwE/pz2pThUj0Rj4HykmwMI+oiOaRNosgQdGMDtugS0Sc?=
 =?us-ascii?Q?Aa+2+YQTZeoZu61LJ1W1keZ2zxjGpwkodDqwqSpkfrmFwijpjwXJhVIDiVAs?=
 =?us-ascii?Q?vYIAbTDvl1b5mar0AgNVXWxLquepz2VDCMFzdI3okKpNiljgwX2DsCNdPyy8?=
 =?us-ascii?Q?2afZcpcSZalGIbXKsMz9WSCL7eJNZMmQhBf9Jpcls4Yq1fok5J+468+F+TGw?=
 =?us-ascii?Q?UhbAHPQPfabRrMaamEh81uNInrmBDVj+E7dAM0WB24bExrPDg2ci09JR8DGq?=
 =?us-ascii?Q?l/oPsV93ByjaA5mtVxSGQQLPrT9P5siyvMDFavgkW3QFEvEZQ7CLrXRG6NQE?=
 =?us-ascii?Q?op0OM059CWH69EQTKeIIHucti2scNrAD+p6fsErL3p1KRkI5ThbyQLz4D1QT?=
 =?us-ascii?Q?knqhVqdj46dUiW4o771jasbipg6emj/Z/fPBrX17bLs7cJp+ejbzNxhihI1i?=
 =?us-ascii?Q?FkJ2IWaquFxVfJCHPrKvHzuNvFOfW8qPRobgoc8e9uJ7shWlveg7KndbExz8?=
 =?us-ascii?Q?e+QDmVyLdtxeAN7xesL8LM/4DSzvB1bVjIVNRYExqfHFtDFIfB+cz3X2ZGe2?=
 =?us-ascii?Q?UhSgz0oK3Z4Fo5oT3351RxxJNeck0r3SdEJjsEZGbfW5H+gBdBOcsou1Yjzr?=
 =?us-ascii?Q?NvRDjW8MuwJc9pcnIGktGU+8PCisPHGVv1kAHdSPEXZyb25qJVc9QVXfwtsR?=
 =?us-ascii?Q?X/xqsVwyM1QH5eAxB8SjeoCetse7xlTiNj9lnGUvIKErNai1Yx/pY82OgfQc?=
 =?us-ascii?Q?xQD9zuTQ2f1wO34zbNWTrqZ943yg+ougbhFgSRMBn+8a4iZlbxKVTL8K6ZuC?=
 =?us-ascii?Q?x/bqmmOPRkEtazld3yE6KKprNIFc8bpDJfCqZ64VklYVtiXt/s5buczHvxHT?=
 =?us-ascii?Q?6u6ShHQj4AK2/8bYeWpcUrv3BSifFAs2ultIE81q2M8FINGd62OK1kDZTgKA?=
 =?us-ascii?Q?oIbB4rVcA/Hw4yEuKWQv7tRS45xaaW6DilNI7N9fLIBDKHqNL251gemr1X8P?=
 =?us-ascii?Q?sW0+hyAGgoQtRnsgfk5fJHSEWMpap/XIczTKdzuB0IgxUjO9wyFUPlmdlVND?=
 =?us-ascii?Q?qlJUxHeI/f48T/MiUftDqjEgUvSwBqS8QOGkFJQiugFlFwfJljHaknx8qdn1?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb9d96a-1e7e-480d-640d-08dcb122c817
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 05:36:52.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3h8BUA0BeBYlsvI5oL323QfBPMRraqwsN0y48bn0ppmAnpyH5gsiPPYw2K4ItFGP+ssLfl/1fGYr8qNbDZdLtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/physaddr.c" on:

commit: e98970a1d2d45750526f30a7874206bace63ba42 ("mm: let pte_lockptr() consume a pte_t pointer")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pending-fixes

[test failed on linux-next/master cd19ac2f903276b820f5d0d89de0c896c27036ed]

in testcase: boot

compiler: gcc-13
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | 46d60c4a97 | e98970a1d2 |
+------------------------------------------+------------+------------+
| boot_successes                           | 12         | 0          |
| boot_failures                            | 0          | 12         |
| kernel_BUG_at_arch/x86/mm/physaddr.c     | 0          | 12         |
| Oops:invalid_opcode:#[##]SMP             | 0          | 12         |
| EIP:__phys_addr                          | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407311033.939d4064-lkp@intel.com


[   13.014286][    T0] ------------[ cut here ]------------
[   13.014881][    T0] kernel BUG at arch/x86/mm/physaddr.c:80!
[   13.015533][    T0] Oops: invalid opcode: 0000 [#1] SMP
[   13.016102][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.10.0-12930-ge98970a1d2d4 #1 58ad32fb15e77c9667e58e6d5da033948ebce8ed
[   13.017447][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 13.018582][ T0] EIP: __phys_addr (arch/x86/mm/physaddr.c:80 (discriminator 1)) 
[ 13.019088][ T0] Code: 26 00 e8 b7 3f 29 00 84 c0 74 b9 0f 0b b8 64 26 f2 c1 e8 83 c0 50 00 8d 76 00 0f 0b b8 4c 26 f2 c1 e8 74 c0 50 00 8d 74 26 00 <0f> 0b b8 58 26 f2 c1 e8 64 c0 50 00 e8 c7 5f ff ff 3d ff ff ff bf
All code
========
   0:	26 00 e8             	es add %ch,%al
   3:	b7 3f                	mov    $0x3f,%bh
   5:	29 00                	sub    %eax,(%rax)
   7:	84 c0                	test   %al,%al
   9:	74 b9                	je     0xffffffffffffffc4
   b:	0f 0b                	ud2
   d:	b8 64 26 f2 c1       	mov    $0xc1f22664,%eax
  12:	e8 83 c0 50 00       	call   0x50c09a
  17:	8d 76 00             	lea    0x0(%rsi),%esi
  1a:	0f 0b                	ud2
  1c:	b8 4c 26 f2 c1       	mov    $0xc1f2264c,%eax
  21:	e8 74 c0 50 00       	call   0x50c09a
  26:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 58 26 f2 c1       	mov    $0xc1f22658,%eax
  31:	e8 64 c0 50 00       	call   0x50c09a
  36:	e8 c7 5f ff ff       	call   0xffffffffffff6002
  3b:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 58 26 f2 c1       	mov    $0xc1f22658,%eax
   7:	e8 64 c0 50 00       	call   0x50c070
   c:	e8 c7 5f ff ff       	call   0xffffffffffff5fd8
  11:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax
[   13.021187][    T0] EAX: 0002e7fe EBX: fffba000 ECX: 00000000 EDX: 0003ffba
[   13.021956][    T0] ESI: 3ffba000 EDI: e9baa000 EBP: c1eeff4c ESP: c1eeff44
[   13.022730][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210087
[   13.023572][    T0] CR0: 80050033 CR2: ffcb2000 CR3: 02637000 CR4: 00000090
[   13.024314][    T0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   13.025060][    T0] DR6: fffe0ff0 DR7: 00000400
[   13.025558][    T0] Call Trace:
[ 13.025911][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:479 arch/x86/kernel/dumpstack.c:465) 
[ 13.026374][ T0] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 13.026765][ T0] ? do_trap (arch/x86/kernel/traps.c:114 arch/x86/kernel/traps.c:155) 
[ 13.027223][ T0] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:176) 
[ 13.027709][ T0] ? __phys_addr (arch/x86/mm/physaddr.c:80 (discriminator 1)) 
[ 13.028176][ T0] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 13.028645][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:267) 
[ 13.029139][ T0] ? __phys_addr (arch/x86/mm/physaddr.c:80 (discriminator 1)) 
[ 13.029599][ T0] ? handle_exception (arch/x86/entry/entry_32.S:1054) 
[ 13.030133][ T0] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 13.030628][ T0] ? __phys_addr (arch/x86/mm/physaddr.c:80 (discriminator 1)) 
[ 13.031092][ T0] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 13.031539][ T0] ? __phys_addr (arch/x86/mm/physaddr.c:80 (discriminator 1)) 
[ 13.031993][ T0] __pte_offset_map_lock (include/linux/mm.h:2838 (discriminator 1) include/linux/mm.h:2921 (discriminator 1) mm/pgtable-generic.c:374 (discriminator 1)) 
[ 13.032532][ T0] __get_locked_pte (mm/memory.c:1989) 
[ 13.033034][ T0] poking_init (include/linux/mm.h:2709 arch/x86/mm/init.c:841) 
[ 13.033489][ T0] start_kernel (init/main.c:964) 
[ 13.034007][ T0] i386_start_kernel (??:?) 
[ 13.034528][ T0] startup_32_smp (arch/x86/kernel/head_32.S:292) 
[   13.035053][    T0] Modules linked in:
[   13.035469][    T0] ---[ end trace 0000000000000000 ]---
[ 13.036094][ T0] EIP: __phys_addr (arch/x86/mm/physaddr.c:80 (discriminator 1)) 
[ 13.036617][ T0] Code: 26 00 e8 b7 3f 29 00 84 c0 74 b9 0f 0b b8 64 26 f2 c1 e8 83 c0 50 00 8d 76 00 0f 0b b8 4c 26 f2 c1 e8 74 c0 50 00 8d 74 26 00 <0f> 0b b8 58 26 f2 c1 e8 64 c0 50 00 e8 c7 5f ff ff 3d ff ff ff bf
All code
========
   0:	26 00 e8             	es add %ch,%al
   3:	b7 3f                	mov    $0x3f,%bh
   5:	29 00                	sub    %eax,(%rax)
   7:	84 c0                	test   %al,%al
   9:	74 b9                	je     0xffffffffffffffc4
   b:	0f 0b                	ud2
   d:	b8 64 26 f2 c1       	mov    $0xc1f22664,%eax
  12:	e8 83 c0 50 00       	call   0x50c09a
  17:	8d 76 00             	lea    0x0(%rsi),%esi
  1a:	0f 0b                	ud2
  1c:	b8 4c 26 f2 c1       	mov    $0xc1f2264c,%eax
  21:	e8 74 c0 50 00       	call   0x50c09a
  26:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 58 26 f2 c1       	mov    $0xc1f22658,%eax
  31:	e8 64 c0 50 00       	call   0x50c09a
  36:	e8 c7 5f ff ff       	call   0xffffffffffff6002
  3b:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 58 26 f2 c1       	mov    $0xc1f22658,%eax
   7:	e8 64 c0 50 00       	call   0x50c070
   c:	e8 c7 5f ff ff       	call   0xffffffffffff5fd8
  11:	3d ff ff ff bf       	cmp    $0xbfffffff,%eax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240731/202407311033.939d4064-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

