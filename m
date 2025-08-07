Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5151442F4
	for <oe-lkp@lists.linux.dev>; Thu,  7 Aug 2025 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554169; cv=fail; b=LYN7EsyVUn+sWGfVAJh+YrYrW6h26JrERBv6ckhGsHyvAIXam9Hdbo6xD0icSpLafCQ4ZCQDPym0oOVu0b9pWp+w5RlAI1Rls3BO/7MtphvxzXxk5VKe4NGQYnPeFhkooSRy8obT2poDfk3YZMY/aLDGvrg00f9sD4PiJRwqjz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554169; c=relaxed/simple;
	bh=bakELdbxMDo4I2GtjfTz+Z5xhN9UBDkJoA03i39iGAY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=R/yuCrPqtUJVix9G0yxuvmb+41EVzXZYia8bKV/8CJ00PlApAnGSOHfjLr43Hq+uBcAYQxSC4XVaHdSd5WwaaWEVlj11IcM44W4hualrfrtknUUf0aHWSW8+cvDfA9MDIpwKVIYD6uXkVSNLr43wHWAvNIIKdeqJgjiZxc3yzUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEwadeHX; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEwadeHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754554168; x=1786090168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bakELdbxMDo4I2GtjfTz+Z5xhN9UBDkJoA03i39iGAY=;
  b=WEwadeHXgD+q6iZKEQ45q3qNLYmVHVNIyzg0+5mBZv/m59qbOSXPuxOU
   zo71Xhr4iAZrMJU53gLi6a14XZh00dNbgtpbbAQZS3WPlcLDWn/PTK0RQ
   qeLrXlNlbqZJcaDgVg8GxAqud7koqVPi5S76u5vUq/UUUuXN4+qxrK/kr
   v8TIp7OuF4VEe5isBuj/TfZt+W+/5Nq8FqlxnANXq23iOwVJKB5IpChUs
   JTJXenxWMWongNwGZ2YoZUrUDqHcTz+XyuPxi2RckSVp+nHXmVD2ELFj1
   r8KVv+KGi8h4qDu/OwFDOLMyxThb8iwO/lITNPE0dVO0nCRC1xiElRSLY
   g==;
X-CSE-ConnectionGUID: AvNTea9bQ/qPIEUxgvpNig==
X-CSE-MsgGUID: IXTDpRh0Sz+UaXfuugAiZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56779105"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56779105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:09:27 -0700
X-CSE-ConnectionGUID: OGXy9u2DQ/C3+B54mVE89A==
X-CSE-MsgGUID: ul9lvTX9Ri+7AI78PIvl9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164228298"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:09:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 01:09:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 01:09:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 01:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNL+uz4M3l0m+q4vAMOKzeFihFwKO7Q9mT7FjFotEKgGalvJVZHZN0nfvZjsNBR7HzARFdsJ+mT8YO21K2+eMcH9iv9hBwARagzzh88XtvqFh5sz+/cxQTUo27EKkVq6rYMY6EJGWzdorsOBwqCj7fL8bBjgiYqissZpaKhlLBXX1IUobz0xFv/ImRVyKDjZyGZtBJbss8+Bf3bMqLXHu7pF1Y3S8t29LRqAg3swZx/MXtyK2N7b7Y9m4HMDin11j0h7lJBuo/WO5rNFo5Lg77xqEWnc6ddvsG+nkOY5fa9mqKgV/optyUa2VuYuiQG2zaJJEFREmqQKMRRMQHZjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31J0DsG80mqsXjG/Jr2J0JHAhksEC/TLZFZOH/fFSnc=;
 b=jIzqoqaxxFqz0+sj/82n4iSFWaVzPWfDuPx3Uy2/75zibW+/Fw/xq7Tl91CT8FfjLOMM5N8Q9PGO/TxGn6aTSUzv+jRu/yg+VchpF8Z3dVXezk36Vo69A1CaN11KwCLzlGpPb3L7JkHieTR+KKgFpqJcRToqu2dkuxArwOVp5m9jePv+lBzaZLrYgjP4mid4ApXZ+xN57oi/Jf2/s7+P1CeCbXN30Ejdih7LnS0nRh2BHhzEWe6+0kRF3FejFtYb9aavZWv9xN1W+UaUeq7vhzYNrdwp021ghpWNhI5wzMLsKEbokIh9xs3q17p/lWzssm786K1C0dZ5ya8BwacAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 08:09:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 08:09:23 +0000
Date: Thu, 7 Aug 2025 16:09:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [davidhildenbrand:vm_normal_page_pud] [mm/huge_memory] f88b128151:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202508071600.24367189-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4a2eac-50c2-4a74-2720-08ddd589b869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f6APwNiyY5NADOOz5R7Pt96IB6+G4UfVj/nB+dXeiDQT0PMBmC5t4XQBaJ8O?=
 =?us-ascii?Q?QprV9uyNwrBfSNhGlSVCytCSzj3bequeDPVFdP6NBtddF9xyjqYDTvsWnDvy?=
 =?us-ascii?Q?Dtg0ZsiqURwbwdNGNaQsBVijUE8ZVRPeyhKbFt6Sk+jiuOEgCwab+D5FbGqd?=
 =?us-ascii?Q?SR7RWLH8C6+k47AbEbcyzxQm5tek5HeclTOdiVTLdCwjJApRQrH3B3O1TFzp?=
 =?us-ascii?Q?Er7yhDSBncQc4AzILXtSdCSttb3CA877+pII99Y+Bk0Olc/X+N0a+3x2Jpus?=
 =?us-ascii?Q?6JM7IlGyh3WEnyuKOSCNPKp7YAfzoX2l9wox9yBwBt32LM1/lpkYmz90b2aa?=
 =?us-ascii?Q?KEwtRCxBWhNYTYBr+DrDPpEkEpqtMNjJ6Ir51lNG9pNth119hMhmPgzvdLgT?=
 =?us-ascii?Q?7LfO9FFm0eU8AsKO1fK7WR8XNWrVszZlXq/ppGj9cIAcEo1+YRYKW6WWEB17?=
 =?us-ascii?Q?IfsCOdUYLjUkbyGR7mdUnZDgaDtK6YkRyozE0riAWD5aOD0cx5EB+AkWs/5M?=
 =?us-ascii?Q?ORGexYbWYjlJmh7IeuklVl5G0vL3RVRxfRHpQ3rm13qEr+3vG7DmfRZ5OL2i?=
 =?us-ascii?Q?NGAS9PJuab2Rt5rsp8OD3vUCHK2CI2wdRmJY3C3cJaaCcZjgxw+XfVpinP2S?=
 =?us-ascii?Q?G+/kCM4O3F6miB9vBlPY7W7uH9ZrPESN5rr91PlkLDVS3JeCzZU7ypHiDGPY?=
 =?us-ascii?Q?DQ8JeWHvS9GkBTqoKsU7+lRIIv0y/lMVcRANBUG8xf2p1u5A3MwsLcNTRcyy?=
 =?us-ascii?Q?UjWJJM+lkHkg58/58/7D2KUKiBaq/n/J7lw1XAsuYQpCLZo2SRDlt6Qt+zmF?=
 =?us-ascii?Q?2pGPd/Z9Y+E2NmY/3tSAGOUhgxoa1olzDJ4+zxjq5PnfXgw4RjE/UVhsigmc?=
 =?us-ascii?Q?0O3J3gN56TEQVJ8Qg31guohrMXdvTURVSWqo3/iFis7nxr1PoDrdghZtKlt4?=
 =?us-ascii?Q?FQaPztUcCeZap5ySAmKYdDK1z37s/lajAbvPEl103A+NprBu9R0d/vb1ZTGv?=
 =?us-ascii?Q?St/RL1b3FK4+LqQj4IrxLUUXzPtlTYTct5o3ynir21olHBwmWhRxdlA20kxq?=
 =?us-ascii?Q?EvStE+S3TrZq6Av0lP/iyGuTHMcnK7onnsNwJz5LZYBxbKx7Khz8SqbLGb1X?=
 =?us-ascii?Q?EHXmuqwVhQT3CCdFD3BdFIfUyPVPIA3tmTxX7qw/koFjBskl3nsH6VyA4fEc?=
 =?us-ascii?Q?Jb4/9bcAVl74xWhqm2B7bpRW13hIZpiMOriBDbLrvMBRGzPUGBKIVrVCaacm?=
 =?us-ascii?Q?fMS6zNUOaS3gHNshz7Q0rEm4E4jvxvviU/sK8GCmP3W4aqTeD/yZ+LzlS9jO?=
 =?us-ascii?Q?fUJF0fjaHUTv293y+LUo4xRCigBYAJ2HGC6kkOzlXXJGEeyXeW391lpZ8y72?=
 =?us-ascii?Q?LTLep18ffuUyLaTBRMkoauckDsiu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UmuKbP3J3N6l3McYL3lt9EDxMeYLxZ+Clnemp4fvjxwYFm0dDS6kkzzHGThp?=
 =?us-ascii?Q?vJoNEBl3ap2FI3b2Y+vKG2Vr2Ag+9sTHenMixgl72QrfsFdMwXt/pWnerpY7?=
 =?us-ascii?Q?sJkfU4y+mR447dixHKA+MZ5JFW9DK86GmIjnydcNbRFAoRSe8a8kOUZ/I8BN?=
 =?us-ascii?Q?kVS8pYvL05H3H7e4pOgnh3QUhtDCUlUl2zmNo9lKLTw+DxT/93XLEeClHlSc?=
 =?us-ascii?Q?HWQrHU5tIfalz17iarfT7TxKHOcTIbiBN8v0J9GnyuxsKqBwAQRrlxqs784j?=
 =?us-ascii?Q?MSl2yDYTwrewvtbT5bUWrRNm1Fo/dq/VX+/WUkJ0X2Dg/wS5vsBjqknPz7RN?=
 =?us-ascii?Q?ngL+fJnEh/egrtt8/8dRz5dxOQIFtQ3GXbXkMg0mkqa5cH2FnWe71jHYKNlk?=
 =?us-ascii?Q?WP12bN3uKtolTz1ghKpr/BEmAO6PrhLOJrkWIhy1MHzYDKRwYpZrAWdBSMQ5?=
 =?us-ascii?Q?09svJm4TngqL7giofC549M6k7Mzzl2UwNWIPyWk5FQffrwAy+Jah2gGvgU3p?=
 =?us-ascii?Q?IXOcbK2UIFX5mjw/UarC/XvvDTORIDvwlQxQeheIejhhzUBMC0VEcqaW6QDC?=
 =?us-ascii?Q?bqBi9Eu/gVBAJOvgPbV42cvj5xHLby1nHaw/WXRRa7jIO/sDRPq/cdKjTL5T?=
 =?us-ascii?Q?2mmDY32deXKAsCTD+T3VBIyczVbILl7D+b/6poPvGq2HA8MLMH9Kg3GB/RpZ?=
 =?us-ascii?Q?Hx4Hjlub+wuy3lHn7Ht2U1KfTRdoR1JDbuMvjI7RQ39Zygn5wH79i/XAyBh/?=
 =?us-ascii?Q?WiZLVufg7pgrSCQTaKNivEZJf8lPSuM9XL7yazp49jj62uCZYjYoJHbE/E4R?=
 =?us-ascii?Q?+lSbClVvJ0feba5B4L+cx2XQBi8CLm0qghK+lyGOISKIvjWVoFNOv0tc5Ish?=
 =?us-ascii?Q?p3PnChM1te+W/NKh7+KqcxCmROKEmySfgAomNN6KVK8ZwMMjr2rFBHVy63NR?=
 =?us-ascii?Q?cywsaq2fB0A9rQBsAxmn2HWuZXrkU6W4UxLgTnwgO/NZwoiwSnKVZgz5QyWO?=
 =?us-ascii?Q?uVF5ktCdidaD/cqljWz8hE4zoPXJ9gYtV1G9+xu0UwdfnB1AqKtf4hsAL6ah?=
 =?us-ascii?Q?uATD5gqz8NHH7Jgnhw0EBzqVQqqtGO8Tw8IbNC9zoYphsc48lksfXeqyawOo?=
 =?us-ascii?Q?qJezemWXuHgCTDOUK3sU/bH6Iq2pt1M2ldNtyGK7BRtajK531cfVtAe/7kq5?=
 =?us-ascii?Q?90JXP9P6F9cYRYpG+nsW1zrBAObXtkngwYG4OeETS2fGo6WsPDfCQdKaQKwH?=
 =?us-ascii?Q?CkIcyjO1Iq/iVveWr2+gdfxbW8kqDatVQi830a3kLDaPGa8LpgeEB3bfmYNu?=
 =?us-ascii?Q?uA1/vVkukH1HLk60hgcI/RxoDA0Ou8D7rZnj9Xu33rl30jeu2b5iG2EiYA+A?=
 =?us-ascii?Q?F3M6HtlKMMcPeBSXQ3dr94H2yusccoDjqecCmTMu1OXjgSHDGAfD3CS5ChEp?=
 =?us-ascii?Q?ITlgP/Utibo8rEp1eKkx18bXg2rCqNHPb8ZH7ky4c8yqh1kBI3AuEuet7UBB?=
 =?us-ascii?Q?gr45e7PEpF65wFBQi1h+T5sG1vyOPGJZuBnSQx7BwDbc6tMr6U1N46Fcgfmo?=
 =?us-ascii?Q?quBoa/inj4rWD6K+uw0d6ZIPhpfgCPaD3Brrjc9M0fQB4HneoWxDaP7GotSL?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4a2eac-50c2-4a74-2720-08ddd589b869
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 08:09:23.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0zwzPTVp9V4qd+ZZi7Gz+52zm4yk29NUxBKVLFU/QOc5MVUmhQc54zhgVfn/lnAy+MdZ6oDLwjTPn2cuG+jAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com


Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: f88b128151dde0b6ba7d08205332bee9a8c1f6e6 ("mm/huge_memory: mark PMD mappings of the huge zero folio special")
https://github.com/davidhildenbrand/linux vm_normal_page_pud

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



config: x86_64-kexec
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 10dad5703c | f88b128151 |
+---------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address | 0          | 15         |
| Oops                                        | 0          | 15         |
| RIP:pgtable_trans_huge_withdraw             | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508071600.24367189-lkp@intel.com


[   21.150662][ T6837] BUG: kernel NULL pointer dereference, address: 0000000000000008
[   21.151683][ T6837] #PF: supervisor read access in kernel mode
[   21.152397][ T6837] #PF: error_code(0x0000) - not-present page
[   21.153123][ T6837] PGD 0 P4D 0
[   21.153581][ T6837] Oops: Oops: 0000 [#1] SMP PTI
[   21.154184][ T6837] CPU: 0 UID: 65534 PID: 6837 Comm: trinity-subchil Not tainted 6.16.0-rc5-00474-gf88b128151dd #1 PREEMPT(voluntary)
[   21.155572][ T6837] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 21.156778][ T6837] RIP: 0010:pgtable_trans_huge_withdraw (mm/pgtable-generic.c:188) 
[ 21.157555][ T6837] Code: 52 01 eb 07 48 2b 3d 73 50 2f 01 48 01 cf 48 c1 ef 0c 48 c1 e7 06 83 7c 3a 28 00 0f 84 81 00 00 00 48 8b 44 3a 10 4c 8d 40 08 <4c> 8b 48 08 4d 8d 51 f8 45 31 db 4d 39 c1 4d 0f 45 da 4c 89 5c 3a
All code
========
   0:	52                   	push   %rdx
   1:	01 eb                	add    %ebp,%ebx
   3:	07                   	(bad)
   4:	48 2b 3d 73 50 2f 01 	sub    0x12f5073(%rip),%rdi        # 0x12f507e
   b:	48 01 cf             	add    %rcx,%rdi
   e:	48 c1 ef 0c          	shr    $0xc,%rdi
  12:	48 c1 e7 06          	shl    $0x6,%rdi
  16:	83 7c 3a 28 00       	cmpl   $0x0,0x28(%rdx,%rdi,1)
  1b:	0f 84 81 00 00 00    	je     0xa2
  21:	48 8b 44 3a 10       	mov    0x10(%rdx,%rdi,1),%rax
  26:	4c 8d 40 08          	lea    0x8(%rax),%r8
  2a:*	4c 8b 48 08          	mov    0x8(%rax),%r9		<-- trapping instruction
  2e:	4d 8d 51 f8          	lea    -0x8(%r9),%r10
  32:	45 31 db             	xor    %r11d,%r11d
  35:	4d 39 c1             	cmp    %r8,%r9
  38:	4d 0f 45 da          	cmovne %r10,%r11
  3c:	4c                   	rex.WR
  3d:	89                   	.byte 0x89
  3e:	5c                   	pop    %rsp
  3f:	3a                   	.byte 0x3a

Code starting with the faulting instruction
===========================================
   0:	4c 8b 48 08          	mov    0x8(%rax),%r9
   4:	4d 8d 51 f8          	lea    -0x8(%r9),%r10
   8:	45 31 db             	xor    %r11d,%r11d
   b:	4d 39 c1             	cmp    %r8,%r9
   e:	4d 0f 45 da          	cmovne %r10,%r11
  12:	4c                   	rex.WR
  13:	89                   	.byte 0x89
  14:	5c                   	pop    %rsp
  15:	3a                   	.byte 0x3a
[   21.159714][ T6837] RSP: 0000:ffffc900008afad8 EFLAGS: 00010202
[   21.160436][ T6837] RAX: 0000000000000000 RBX: ffff88816002d400 RCX: ffff8881e3b0d000
[   21.161394][ T6837] RDX: ffffea0000000000 RSI: ffff888163b0dff0 RDI: 00000000058ec340
[   21.162349][ T6837] RBP: ffffea00058ec368 R08: 0000000000000008 R09: 00000000ffc00000
[   21.163306][ T6837] R10: ffffc900008afd98 R11: 0000000000000000 R12: ffff8881638e36c0
[   21.164254][ T6837] R13: ffff888163b0dff0 R14: ffffffffffffffff R15: 8000000168000285
[   21.165217][ T6837] FS:  0000000000000000(0000) GS:ffff8884ac421000(0000) knlGS:0000000000000000
[   21.166267][ T6837] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   21.167042][ T6837] CR2: 0000000000000008 CR3: 0000000002a30000 CR4: 00000000000406f0
[   21.168005][ T6837] Call Trace:
[   21.169754][ T6837]  <TASK>
[ 21.170186][ T6837] zap_deposited_table (mm/huge_memory.c:2148) 
[ 21.170803][ T6837] zap_huge_pmd (include/linux/spinlock.h:391 mm/huge_memory.c:?) 
[ 21.171359][ T6837] unmap_page_range (mm/memory.c:1787) 
[ 21.171968][ T6837] ? perf_event_set_state (kernel/events/core.c:?) 
[ 21.172615][ T6837] unmap_vmas (mm/memory.c:1968) 
[ 21.173161][ T6837] exit_mmap (mm/mmap.c:1280) 
[ 21.173698][ T6837] __mmput (kernel/fork.c:1125) 
[ 21.174859][ T6837] exit_mm (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/thread_info.h:126 kernel/exit.c:582) 
[ 21.175398][ T6837] do_exit (kernel/exit.c:954) 
[ 21.175925][ T6837] do_group_exit (kernel/exit.c:1105) 
[ 21.176483][ T6837] __ia32_sys_exit_group (kernel/exit.c:1116) 
[ 21.177126][ T6837] ia32_sys_call (??:?) 
[ 21.177723][ T6837] do_int80_emulation (arch/x86/entry/syscall_32.c:?) 
[ 21.178337][ T6837] ? arch_exit_to_user_mode_prepare (arch/x86/include/asm/entry-common.h:?) 
[ 21.179060][ T6837] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[   21.179668][ T6837] RIP: 0023:0xf7f89092
[ 21.180191][ T6837] Code: Unable to access opcode bytes at 0xf7f89068.

Code starting with the faulting instruction
===========================================
[   21.180982][ T6837] RSP: 002b:00000000fffe2f18 EFLAGS: 00000292 ORIG_RAX: 00000000000000fc
[   21.181980][ T6837] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000fffe2ec2
[   21.182935][ T6837] RDX: 0000000000000000 RSI: 000000000000000b RDI: 0000000000000000
[   21.183884][ T6837] RBP: 00000000f732f000 R08: 0000000000000000 R09: 0000000000000000
[   21.184854][ T6837] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   21.185806][ T6837] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   21.186779][ T6837]  </TASK>
[   21.187196][ T6837] Modules linked in: can_bcm can_raw can cn scsi_transport_iscsi ipmi_msghandler sr_mod cdrom sg ata_generic fuse
[   21.188570][ T6837] CR2: 0000000000000008
[   21.189109][ T6837] ---[ end trace 0000000000000000 ]---
[ 21.189767][ T6837] RIP: 0010:pgtable_trans_huge_withdraw (mm/pgtable-generic.c:188) 
[ 21.190523][ T6837] Code: 52 01 eb 07 48 2b 3d 73 50 2f 01 48 01 cf 48 c1 ef 0c 48 c1 e7 06 83 7c 3a 28 00 0f 84 81 00 00 00 48 8b 44 3a 10 4c 8d 40 08 <4c> 8b 48 08 4d 8d 51 f8 45 31 db 4d 39 c1 4d 0f 45 da 4c 89 5c 3a
All code
========
   0:	52                   	push   %rdx
   1:	01 eb                	add    %ebp,%ebx
   3:	07                   	(bad)
   4:	48 2b 3d 73 50 2f 01 	sub    0x12f5073(%rip),%rdi        # 0x12f507e
   b:	48 01 cf             	add    %rcx,%rdi
   e:	48 c1 ef 0c          	shr    $0xc,%rdi
  12:	48 c1 e7 06          	shl    $0x6,%rdi
  16:	83 7c 3a 28 00       	cmpl   $0x0,0x28(%rdx,%rdi,1)
  1b:	0f 84 81 00 00 00    	je     0xa2
  21:	48 8b 44 3a 10       	mov    0x10(%rdx,%rdi,1),%rax
  26:	4c 8d 40 08          	lea    0x8(%rax),%r8
  2a:*	4c 8b 48 08          	mov    0x8(%rax),%r9		<-- trapping instruction
  2e:	4d 8d 51 f8          	lea    -0x8(%r9),%r10
  32:	45 31 db             	xor    %r11d,%r11d
  35:	4d 39 c1             	cmp    %r8,%r9
  38:	4d 0f 45 da          	cmovne %r10,%r11
  3c:	4c                   	rex.WR
  3d:	89                   	.byte 0x89
  3e:	5c                   	pop    %rsp
  3f:	3a                   	.byte 0x3a

Code starting with the faulting instruction
===========================================
   0:	4c 8b 48 08          	mov    0x8(%rax),%r9
   4:	4d 8d 51 f8          	lea    -0x8(%r9),%r10
   8:	45 31 db             	xor    %r11d,%r11d
   b:	4d 39 c1             	cmp    %r8,%r9
   e:	4d 0f 45 da          	cmovne %r10,%r11
  12:	4c                   	rex.WR
  13:	89                   	.byte 0x89
  14:	5c                   	pop    %rsp
  15:	3a                   	.byte 0x3a


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250807/202508071600.24367189-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

