Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A04289367
	for <oe-lkp@lists.linux.dev>; Mon, 25 Aug 2025 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105304; cv=fail; b=Ftuocl0VkpkNTyC7HY1St3KiULIsbFwovJF2fRbyBycCq77BkdQQDtmwz56UD8dgJVDWkxgUCzvK+sMM68BTcnTh5sw1BZTjAr/aCL0tjUHm3UrVRm0wSv4cD35bN/MaBJGXww6KL+AKoX3SZ7KNfiU5mj73MkEkD97OPs+W9KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105304; c=relaxed/simple;
	bh=z2P5bhHOC+JgHS07wF5MySGnpxBStIeLAduyiSRirc0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=I9d7tCB2y9bnvUUGbQc+4I5OTHFPV/YLzXj31Qt3+QGi+E+71ORcwj/Jl3sRys4Qp/MVaUfRYG7kqCPbjxpvXBGfgu6jxTGo3Knco7/VzSwFxHxPSr7PlRNRBE0PaYGb8mCtePuSsj6kt6Prost/Pu2Mf39tpmbnRpUg64RDYQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UulH5DUD; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UulH5DUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756105288; x=1787641288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2P5bhHOC+JgHS07wF5MySGnpxBStIeLAduyiSRirc0=;
  b=UulH5DUDxsa+IyQaX8GQbyCGn19VfDJ0yzDrLwmFzp0+cgZCK2MdLRPA
   ea9f1fb7OMPwV7VHrLIyiDhuKKSJfNN8HmZgfUVHzS+hwTD2cdnJbdVcP
   93AB7ME+4fEmagqmpeZ6R+mY6rCSFowQMQZdUUdLdGcolNK4y1Xndxkn3
   ccD9CzS4Jar+cHJLh4Gz17Q8Pn8YcqYJPae671agPQn9SJpaTOndr99FA
   xgBh5sWKmbsKisQa3hMqMQD7G+AR93lPhJKotHd74xCJ91DkSDVrD+uWz
   OXTs7vrtbo3mGv6RL7aLUbIUtkQb0wFDu4CdGPhX9jkdgIU8pyRH4t5c6
   g==;
X-CSE-ConnectionGUID: 3aKv1h7PSeeqQc0Ash4iBg==
X-CSE-MsgGUID: 4ubEMnUYSVe42hwSJYH4qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75762045"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75762045"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:01:25 -0700
X-CSE-ConnectionGUID: yKVFEwImQ76/KWl3q9hEgg==
X-CSE-MsgGUID: +vypR8t1RGOVs23OcNPS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168721159"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:01:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 00:01:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 00:01:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.60)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 00:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xq8+EBwQQ2vM8wc7OElFmHOHy/V4yShoHoJSThsRD2UyftS8rm2+57JCHPEmcB/AjuxeLx2/zmt48RmkvtHBUPpD/npA8ceZU08zlVGLZ614riSx/wRQ/yJcfHhtYewhK/ruFnzXzo97N4ETcO3AcdnukaFckqQxx5HI98tUwRPX6SwRBL9fc061ulI1jdyFEJTVFY+lROI2iFftAtGEEyDuIOULkuN4uU5pB/u8Es8ybitXRKm9OOTEYAaR5U7mxoj9tlxnjQDNuFxtl+0GkekpvaYImGXVMrUu9TnDf3/8ZHwBEi/VDEFHLW7Im7SS8j0I8ALkqwgANWi0RLZBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOVzKuHbfeH1e3fCvXoxGcoGa8xN8CKGGG3Xds0NKrI=;
 b=bXhaHGlQJF7x3QdpMK7qQMNXiruF1olLQHrrX/ahocLxm5444dlGdeWnOXwxuQXotx+KyvLBVy9dK24gPNTOKer+gvopIVb6CKEeiP4F9Fm8C5xIieGdjALXyls8uiWp7/XpvirUb6KiKz4W6lmfPIihuJdPBgiq3c5Dl0/1nj8Ggg+UO9c6HiIfeOdmETLa+PyMsViB9ye7nepWpf/WsoSFRDGscqym0U+TdeEfj85SuROGYYS/0EfBHS4r6eo7oApql1rR7Je6ut6T//28vlVGLQPj9coqK4oRdsQxnjbdosqem+3VjfbmrlX9x3ZCQ7X3NcQbr+264pyxF7takw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Mon, 25 Aug
 2025 07:01:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 07:01:20 +0000
Date: Mon, 25 Aug 2025 15:01:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, David Hildenbrand
	<david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/mm_init]  8a523d9e6f:
 BUG:sleeping_function_called_from_invalid_context_at_mm/mm_init.c
Message-ID: <202508251443.f2d9f77f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 525466f6-5296-4195-0252-08dde3a53235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6PbD6ff3aiF5T40xaQyTxZzArgAHRG4Ps99SdFxq1Vq5PaH3qeByPkOZLOCT?=
 =?us-ascii?Q?oF1HMhacyJcoJ2AmCrsZNekWzOiLPaXiDoCTwhGgNgaZXVunRZa8Y3+dhNcM?=
 =?us-ascii?Q?mEDvgmVrcuqo9fMS4wjmKK3UjzTglLLPr9jUuEv6mKPjlZCXZAxa3y/XioiY?=
 =?us-ascii?Q?T0Yy/sm8XJrcuY9ypnosRMulcpXtL5Nic3wRgkcWt5PUv1M5f8QWEFwzpZds?=
 =?us-ascii?Q?gs8kx+xSFIN0PCFaIkwESYp8XKHkcbC80GP6gY9hmOw/T/1uW2m3k2PHL43c?=
 =?us-ascii?Q?SCTJ5j1Or2sevL+gRZ2y4wwCOADrU77kKjyI8c5MupJud8vpr7VK7fO7wU3v?=
 =?us-ascii?Q?m7eu30egK+3KGX8KYpC0aYf+oua67YOmXHqqEhG3mHNJK370UjjI7wZj+xdK?=
 =?us-ascii?Q?3Cj86enWT3J4/fpC1R780PtTvm7aUytdaR8OprcA4IDAs+7JBqsOAzOU6rPA?=
 =?us-ascii?Q?OY+GtBGn0QFO3bHBDFZcsng8A4W4ZTRl3q3pcOg7EpknUR3BCoFYkGfrDOMc?=
 =?us-ascii?Q?EJneBmrGDKyla8rufRexw25z+POxuxxBiYXd2dvdotMXr8bEObXrDf7DLaQg?=
 =?us-ascii?Q?VaxHtIbxYuwFFwUVZpc0ppM8obODJ68tCMpcezaLAI7eV+oNapU7XZyn6uCO?=
 =?us-ascii?Q?j5Ir/iDfgkPAw3dxVHotpAfd1rVO57yNcBvZGVG0mQ+2SvxyA1vU+UFHQ9HI?=
 =?us-ascii?Q?rSenb7Z3DOOwvpPqEw2VQaiYgfdwpcabSwDyPTc7CPq5yD2Go/hDCtdoiQGN?=
 =?us-ascii?Q?CmyzNrvtvRjlRszFFlJGRUKCoLBgSdBQyx9Arv3XlUpGhgh8iJEMIFpz+iiA?=
 =?us-ascii?Q?GC97fMiQ9o6wlj8TskymztTzikeMKuoNaUIKxcICx4q2c0myulYovfFPjpgI?=
 =?us-ascii?Q?KUaYio3SAXFmTx/alUq5eMFPD1TM5k9Q7TorgZDEwMdKLWRAzvX43hPEV3hQ?=
 =?us-ascii?Q?aAxHkJWY9/t10PRWWXvZ5DRQHcNNuv9hLojFftiU8ogDkm30VAeF0ZQWI/ic?=
 =?us-ascii?Q?50/scX9iKk2DPeXz2+PaGEt6KbqUzaIwA1JEt1oyRr9n0Gnm39tw6crbQ//j?=
 =?us-ascii?Q?beu6UTchxTCn1yXe7Xf7QFeqRCgCLClYUgr7vs1EsHcxtF1QttG96ZnCsG4o?=
 =?us-ascii?Q?2cqubHuwTmZrisbgOnRDdI667TWylj6VMwaLC4SZYUkDwcyoNWENzMm2x1RE?=
 =?us-ascii?Q?a7P7ji01OSpvG0GnoI8p4jM5EImVq662KeKuJF4Rn/Gsz8PvizeqRF5PLrES?=
 =?us-ascii?Q?Fyotqf2WYvZBbFVuM/E6xYSmvUD/FSdA5oiByZIr1bRx/nqZOVZlVjm6GTsn?=
 =?us-ascii?Q?cyV4MdLLIMXLLu5e1Dz+cUC0zKZKJv/4aq7WDVTviVl96O81H4WB1n/7ix4Q?=
 =?us-ascii?Q?XH5qE4/aH+Xa4MTzxwIL4FisAlOh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2qNZOYAKN0A7jVEMKJE/fTdtfgXYC4FZfpN7yr9GRw/vbDlCzqIaAf30hmFI?=
 =?us-ascii?Q?r86kdbOOrVR+PExMFbtf6rBKdzm7+yCMW459vz0W0U4AYFkBGrOhLv3bICsP?=
 =?us-ascii?Q?gQ3nqm0dwVPBHavp7m1X5pwJqh5uheASDnj+mZeGjGLPIqLqdSZbHu1r+rcF?=
 =?us-ascii?Q?Cvs///IPp+dfigeLZwfv01qvPBu27FgQKJlgi6dJezqPsB6Uz2tsYLEMFsmh?=
 =?us-ascii?Q?UcoUFszRBGmAHyu5Ru5kKnO+eeab8ACfKQLnNi3QQ4HXz2b6SUoEYLtgatQk?=
 =?us-ascii?Q?d9HrMVdL/IpkK+RQe/DyC28QkJUTIVu+5+ctmlUPZw4tvUcDzOv98nw3eOHv?=
 =?us-ascii?Q?dAwLVNlxFnotT5O0IioFeAGOmzfNFfKaz3gA+vUS/pLod59T71ka/Rs3x/TY?=
 =?us-ascii?Q?99iVgNR38Sc6LB5TDs3F3Ck0cD4R9s78snrKGhT5ow+O+Hs6GxxWRjzRC7XL?=
 =?us-ascii?Q?CiF6/JmKbPK+cKJh4MDDHWBQXW6KEqeG1b0F8Cko20uAFLaow6rR5GScuAPm?=
 =?us-ascii?Q?ogimu3G5D3Ob22C4w3sHrsvypbGBIhadZQJyPXVf7WjPRm6c+maPx/+bYb/1?=
 =?us-ascii?Q?0YZka7/ZLVGySfkkuBR9WTTwDSSWe7A+TZxJB0NJM6Kh3E9po1ZiioMEbiT6?=
 =?us-ascii?Q?vjEkE1xrBh6yl/eESHtbi37K42aM2eHAv60GhjTCP1gkoGP/eHmwIr8yeRde?=
 =?us-ascii?Q?kABc62RKIMBMczza55TnL1RKFOuOW4Stjz3JDkcI958HEcSR6QKRSBijIP2c?=
 =?us-ascii?Q?xj2hHQ0ccAyOedQrjLY15Z9GlUXfrrCc73R2YnoEADRM8JbWwpzHFC4ySSMJ?=
 =?us-ascii?Q?m99pGoRRNtS/XNeU6BOyrc011SDXMqEZBl+UywVpgnLJ03xESrITQcYOdbc0?=
 =?us-ascii?Q?g2oXz2EM0CYzu5k0hbezemHLXXOAwe88IdRibkMCBojVoqXUeZ0cCY2drlwH?=
 =?us-ascii?Q?pHuJzQjllZkUCIMDqTeJdU7hMGwWufzjEqrS7kLPRtIkmfJ6H63YFkyew+ot?=
 =?us-ascii?Q?6ft6C2wMPK+IGff885kXS1+5ef/WbkUTEKApX6CgSphcSTKWV7FAdpisYuNf?=
 =?us-ascii?Q?HKVZ4Sowg84E6GPZuNuBi+jMJsqmlZhIjtb24Al43OI44u1a3QlPm99oU/TX?=
 =?us-ascii?Q?E252wkIGSF5RjAyOOZFDvp7+4F6FINETcWykTrW2qZd1p1gK8HUml8w9GsUP?=
 =?us-ascii?Q?8Ek8OfB0GwyjJ0I1h4pLOB3zVlYe3RLVfHPBdJKh8igXdUqILMBo6IzOB9Jo?=
 =?us-ascii?Q?SfTRN/D8jWxYl7kLfEiOZ2gfdZDi8j5QC3RHsc+c8tJzKl9ThmLrLqGGYkYz?=
 =?us-ascii?Q?9xytbawRlIJRYLXRNvwpdD0M9/YjYPdraT6aiWeBDfkE/M1+nRtu1NnYeO2d?=
 =?us-ascii?Q?SdJdVLfp+/5ERgrtUlgGI5nwelcPO2kAP7z8ylMe6g5QALT+WR1EDMhlzUPR?=
 =?us-ascii?Q?4UW7UQIxQCp+Dh3nw9Fs3S8vGZwXtNUSut3XlvPSivMd4AHwoV31v2HzrUOi?=
 =?us-ascii?Q?iKo399vM2rIH6O+gmgez+XM+Tuo932hoP18tNNrkjyAeizy/BOsXHQLRCI5R?=
 =?us-ascii?Q?bkPfg9trDlnsHhJeWYLAIdqCV+eI1BZoO5Yt4TCFnnkvNMIdOkm66dmQibmt?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 525466f6-5296-4195-0252-08dde3a53235
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 07:01:20.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqVziHYCJKWMVtQxaFqGw3MbQXw/zjBPrP46qJz1VC7r1oBS82/+ehc/Iy/D7Y25mAI1kzKEu2wXD/Oe6sGncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_mm/mm_init.c" on:

commit: 8a523d9e6f30349ad2f8c34d850483db905e976b ("mm/mm_init: use deferred_init_memmap_chunk() in deferred_grow_zone()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 0f4c93f7eb861acab537dbe94441817a270537bf]

in testcase: blktests
version: blktests-x86_64-34a7fc4-1_20250824
with following parameters:

	disk: 1SSD
	test: nvme-group-00



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508251443.f2d9f77f-lkp@intel.com


kern  :err   : [    9.708923] BUG: sleeping function called from invalid context at mm/mm_init.c:2153
kern  :err   : [    9.709485] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
kern  :err   : [    9.709485] preempt_count: 1, expected: 0
kern  :err   : [    9.709485] RCU nest depth: 0, expected: 0
kern  :warn  : [    9.709485] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1-00003-g8a523d9e6f30 #1 PREEMPT(voluntary)
kern  :warn  : [    9.709485] Hardware name: IEIT SYSTEMS NF5180-M8-A0-R0-00/NF5180-M8-A0-R0-00, BIOS 00.14.04 09/23/2024
kern  :warn  : [    9.709485] Call Trace:
kern  :warn  : [    9.709485]  <TASK>
kern :warn : [    9.709485] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1)) 
kern :warn : [    9.709485] __might_resched (kernel/sched/core.c:8958) 
kern :warn : [    9.709485] deferred_init_memmap_chunk (include/linux/sched.h:2070 mm/mm_init.c:2153) 
kern :warn : [    9.709485] ? __pfx_deferred_init_memmap_chunk (mm/mm_init.c:2140) 
kern :warn : [    9.709485] ? __pfx_try_to_claim_block (mm/page_alloc.c:2291) 
kern :warn : [    9.709485] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
kern :warn : [    9.709485] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
kern :warn : [    9.709485] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161) 
kern :warn : [    9.709485] ? rmqueue+0x8f7/0x29d0 
kern :warn : [    9.709485] deferred_grow_zone (mm/mm_init.c:2286) 
kern :warn : [    9.709485] get_page_from_freelist (mm/page_alloc.c:3824) 
kern :warn : [    9.709485] __alloc_frozen_pages_noprof (mm/page_alloc.c:5148) 
kern :warn : [    9.709485] ? __pfx___alloc_frozen_pages_noprof (mm/page_alloc.c:5114) 
kern :warn : [    9.709485] ? __pfx_smp_call_function_many_cond (kernel/smp.c:784) 
kern :warn : [    9.709485] __alloc_pages_noprof (mm/page_alloc.c:5182) 
kern :warn : [    9.709485] dsalloc_pages (arch/x86/events/intel/ds.c:611) 
kern :warn : [    9.709485] ? __asan_memset (mm/kasan/shadow.c:84) 
kern :warn : [    9.709485] reserve_ds_buffers (arch/x86/events/intel/ds.c:631 arch/x86/events/intel/ds.c:789) 
kern :warn : [    9.709485] x86_reserve_hardware (arch/x86/events/core.c:420 arch/x86/events/core.c:409) 
kern :warn : [    9.709485] x86_pmu_event_init (arch/x86/events/core.c:673 arch/x86/events/core.c:2475) 
kern :warn : [    9.709485] ? kmem_cache_alloc_node_noprof (arch/x86/include/asm/jump_label.h:46 include/linux/memcontrol.h:1714 mm/slub.c:2210 mm/slub.c:4190 mm/slub.c:4229 mm/slub.c:4281) 
kern :warn : [    9.709485] perf_try_init_event (kernel/events/core.c:12581) 
kern :warn : [    9.709485] perf_event_alloc (kernel/events/core.c:12680 kernel/events/core.c:12954) 
kern :warn : [    9.709485] ? __pfx_watchdog_overflow_callback (kernel/watchdog_perf.c:107) 
kern :warn : [    9.709485] perf_event_create_kernel_counter (kernel/events/core.c:13779 (discriminator 1)) 
kern :warn : [    9.709485] hardlockup_detector_event_create (kernel/watchdog_perf.c:133 (discriminator 3)) 
kern :warn : [    9.709485] watchdog_hardlockup_probe (kernel/watchdog_perf.c:267) 
kern :warn : [    9.709485] lockup_detector_init (kernel/watchdog.c:1312) 
kern :warn : [    9.709485] kernel_init_freeable (init/main.c:1571) 
kern :warn : [    9.709485] ? __pfx_kernel_init (init/main.c:1461) 
kern :warn : [    9.709485] kernel_init (init/main.c:1471) 
kern :warn : [    9.709485] ? calculate_sigpending (kernel/signal.c:194) 
kern :warn : [    9.709485] ? __pfx_kernel_init (init/main.c:1461) 
kern :warn : [    9.709485] ret_from_fork (arch/x86/kernel/process.c:148) 
kern :warn : [    9.709485] ? __pfx_kernel_init (init/main.c:1461) 
kern :warn : [    9.709485] ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
kern  :warn  : [    9.709485]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250825/202508251443.f2d9f77f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

