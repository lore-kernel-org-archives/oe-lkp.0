Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3A51C4A
	for <oe-lkp@lists.linux.dev>; Tue,  5 Nov 2024 02:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730774066; cv=fail; b=lshoR6u+N6vixA3LpDKAfXe19ET53iMvR6vioWlddKgNAW7v3O9tS7UX0d4ryoqrSrDrt3G847iljorDSQ0U75s9a5rI28qFuavdheh2nONYwPClOEAougViZEzY5W2TdCWsry9Z9TwVj3OvFt+M3AQ8RwP/WXEXhRI2SRK27RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730774066; c=relaxed/simple;
	bh=FS0mKVrYRZokgABpgzicLTNumPwyGjGFxOLf74J7ZfM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jX0KqXix+lSPaIjr/YG+HtmNukpfW02oaied6Fp4TBuOPDfL3cFGdg1kpq2sL51395FiYE4kL4TUB/556QmtuGCQWhppgfgUjoLIg4NsfDzwXnz0v5uCfJLovLsKb30Qd+oLEbXUUqaFIcj37h40nosFQxMRzjFt7tnItsW/afQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERpv8MHD; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERpv8MHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730774064; x=1762310064;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=FS0mKVrYRZokgABpgzicLTNumPwyGjGFxOLf74J7ZfM=;
  b=ERpv8MHD3B5DA8N6lfYUwhRJl3P80jbFzLV142ynYzKcfo6cm2STcNZS
   eyd+V33oLUlk8lst6b727AVpMiKxNcQ+KXDMW1bIwOvQWsuB2GMTcSMVt
   DSTGmuGGVnazw454sc9Kim+/Q3IS0xHFpWEe3z+Li0wmu5pAM38uE9wRK
   BH9OVf23LlJuA/f4vcG+aS/bF7d28QK0mEVB/DoPAm+4/V9zOtGCbKFMn
   pX1BkQe5NYGbgrWgYU4tEUUJOZpk2ZKRNaKfWImgLNJ9DxOinvlgCHKJk
   16bx9ei/qeO11GQ6sxzKzHyQDBV59y0YcTUWrtR48W+LDP/bzuJUWv8Ju
   w==;
X-CSE-ConnectionGUID: s9xS7+IcQiST+mk2ox946A==
X-CSE-MsgGUID: lz5XXMhyQAKQiU93N2zlKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30349746"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30349746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:34:24 -0800
X-CSE-ConnectionGUID: c8ltezEASj6aM+mdBZcgTw==
X-CSE-MsgGUID: ZhIr1AFZRS6UyI3lcxaKyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="83509401"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 18:34:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 18:34:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 18:34:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 18:34:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8Zj9oDFBGiJpKZznhXMoVn4E7ZaEr+7b4Cwum+7f7fpyv8D69ahd15+JAVnMN1D5JO9kSbj+Ug7AoaDN2ruSqLwi+owUjwbULvWVvo7gqd5sHtV5W8vVax6OZ1BhKiEqNfJvmbLHCyio/jGXNDSoY4CwQdfH5S+bnUzeiad7ZHWJwB348xHRVPFCHrZPZVw4ofzgkSlIeJFYxV4Lzbolz0oZ/Ix6nT5Rb92VIw2xsz41iCYdzaomgHI69EOZVpEilshaih9CurSPDnSiuc20H/0YFZEFyHYB4Q9VGz1UecJVuGFh5peN3MvbFWAxd7kEJfb8bnlZ+SWC7g4agMWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=136NXle7dz+Pobq0Gcd+SXrqJlxVtVucSMcNkNsynvU=;
 b=jCzDy94gBpZRBU3vFDktLyG742HQXQ2ca1p5ESJT79EtgcFONHR0sgVlbK75NONaGSfD5INiMpiiyXWKHZCh0DD9Rz0Z7aYdKs21+nqb5sn0OpW9Y08Jki5sbBSBPISLzfjLJYdPznnekwRh5qua0h12jp+L+5O6IJrsDT+YvoFj2tZiNAt6tEc/jhnURn8MnTiLdpXSJ2ntSc/XO/6YpMBiq2GI768xjFCfloQj2UeOMbkDOhcjMZsAmDOeOZ/YrqIdJQO+mJW/flROrMrKC65XghJNGe/uKSd0+dDkt2SFA830A/ubf69vGQ7v44wQgFfJtQLO3cRJYlhgJjsjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 02:34:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 02:34:20 +0000
Date: Tue, 5 Nov 2024 10:34:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ke Sun <sunke@kylinos.cn>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<maple-tree@lists.infradead.org>, <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Ke
 Sun" <sunke@kylinos.cn>, <oliver.sang@intel.com>
Subject: Re: [PATCH] maple_tree: use KMEM_CACHE to create maple_node caches
Message-ID: <202411051011.b1d218e6-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241104061617.450907-1-sunke@kylinos.cn>
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: e91649f3-2969-46b3-1a8a-08dcfd4259cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sPyHxqLAWciZ4JWngGWgMR8nLR19kvA1nbDrfc5N95EWJ58h0qDKG/HVtPDt?=
 =?us-ascii?Q?HhDiC2jLxpAMLjrK5LQZGSIpCmP/rBxRNuuctkBXs1J7+jjM+tr6c0bfejTl?=
 =?us-ascii?Q?Hmxjq1qIACjv4H213ArSMys7Yr9iEjKmoCiRkCnbRUuK2lDrlUOT655RsiUD?=
 =?us-ascii?Q?Ppg5+JlnnlR92jEOqoQLUksl3AeZ9iwqGZsPj5DjayP0F50+ug112AxUJ+kV?=
 =?us-ascii?Q?WDMam6scQc+kcGTOKpRKDUPVfI+tGhoe0Yq7QVu3MVIm/5de5Ux5goXaP8+4?=
 =?us-ascii?Q?jk0RPQX4sOXJqBo+snRZCuOIHs32hL1J4ohpwGIgP2DCBg1VX4zBHW08Vfoj?=
 =?us-ascii?Q?tbgLN+ozjin96wwb1ZCxJDIMf2fM5PYEhhF95IN/Ezm3OGOKtyjF+bh93Riz?=
 =?us-ascii?Q?ZQn8wfsUQY/GwGQTKu5dKMZassVFGCpTCP0Au0HEily59MJy7nyqmvzGlQDT?=
 =?us-ascii?Q?2JvpE+cKaKfrfEeTbDHmsyaZesUx8lYvN6SnEKFjBVg5kLFutzEti/NH0q5Z?=
 =?us-ascii?Q?UoLdvFhAGrYbyNfHr+lYqbBTRay43LXUPUbUYaxUwf1iZ5XkMC0mRep/OkIl?=
 =?us-ascii?Q?uqqVf/JVqTRs++CIKDk/y4BAcrC4ZLFVyS3w4/OQAfIDm2uLJtVV6v3WCfL3?=
 =?us-ascii?Q?7l/Pd5XelX8s4ls74gqnp0CCrdkrXWm8hRL5koMfphS4Ww4mPZd2rRsju3JR?=
 =?us-ascii?Q?2tTdIAvJJZ5RMCde9eSt0Q5G3kKj8f+blVeeKjOcIko3NrpVPRbp5evK0yLS?=
 =?us-ascii?Q?u7EUn2pxBvmoVEngCV7iRTybRmd6wS5MT15z7gqfRG0SjWJA6ITEroZUGWA4?=
 =?us-ascii?Q?XIFmod41Pge3IkkyAGXlTp+DapmEbGVYLKhLOk7ResHwpzIrlVrUuPcWerHr?=
 =?us-ascii?Q?T8HIZT83AOoIKgLt227j92YTM/TIfAgMWxt4U0F9ucb5br7PZxRAb9eC/o6q?=
 =?us-ascii?Q?0H096T2jHJuygwmmpfe+qukmaLLy4ngnjrM35s2SDAUbSi3Lt7ohAxl5hPth?=
 =?us-ascii?Q?OJmOldZFO6MKv/t1obhVOH2nA8JmsQVEPJ+8ZXQwYSdzIBoPsX4TIHgvWAmA?=
 =?us-ascii?Q?BMUzeDlivrKd/kKYwhqQ1YmHo6wiUFF+WtH4vLuhWOROJRGaZyP9NDgvBwGN?=
 =?us-ascii?Q?rY8WVFjfeQERq5gLIUreqZ2ChHJmthqU4yPCs+/DX+1RTUPmZISawEGkyx8h?=
 =?us-ascii?Q?45mG06NHKfKSsLQl1ke5UgYaglVcAE0oaBbu30LDM9HWWPDXzPUqzPgqP0+9?=
 =?us-ascii?Q?tFZTpQeCPy3mjd9BR4PD18ot5WSII0D1JBZEz1dUIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Sc9ZyCDlmYQQnd1YkQrn9zCxJ1s0iYsIgTatc5UGiVAFfn32fJ4yvaXgRRH?=
 =?us-ascii?Q?5qky8nE6smA+QiMrTD6DB2WriCc9Xu0qEn78xPSKgxM7th7O1UESfXXf8yBV?=
 =?us-ascii?Q?woPXI6KzOQ1C4pD40rwxPtJp3Ba+bU0NqgEDGtMo0CaWUt13B4c5/suDMuKr?=
 =?us-ascii?Q?CfTDNwPJ6x68Dv4cQA/AUNuvaS1XSQcf6WTRMG+Z3mwQkJjoJCNdUFMqmr1X?=
 =?us-ascii?Q?zKbTUK6yqefF8gDhHw708PMwHccYsJkxzjv5z7nXXSlqE0R3u1ntwttmYrur?=
 =?us-ascii?Q?+CreyvejHOZowdbTFe5HlKmGAwu8o2uoep7ilOag8s1zkwqg/ivth/VOJllJ?=
 =?us-ascii?Q?XIqnz5eqUaUXxf3aCrRjkGFAyi+HUO8hrqEkVEAf+a5kd84K+u8g4kjKqj96?=
 =?us-ascii?Q?JFdhn36iCe1LYHTkiDElAA6lvD6fXPzAnw1LVpb1fEeDA7hZ52ccmEEPitY/?=
 =?us-ascii?Q?5tCyNABoZ+8PdApEN6OKkJyXvFUExeEPvdisVv5hZHhPubx0nnWKPDr6pZUj?=
 =?us-ascii?Q?s2cEN029PCsdyQBPCL1IpQCMNzY6793OkJLuqpYLR7vbEgupwjjW8ypF4ykA?=
 =?us-ascii?Q?ZZvXIp6Ft4J8vdw9JJKm5T5l+WPeKduexKSV5CwTtOZTH6uK29S5LjpEw2dQ?=
 =?us-ascii?Q?jyOTngxIxft4EGzde+8CyxnibIqkyMZsaDpS7nlAWtnVqcGuKvEXR3kWrid7?=
 =?us-ascii?Q?jJBk39iBPGDYYPbq0Y8p3AxnDMDfVXk2hSqqCw58Z2WFyAXYYClh+q0On+ku?=
 =?us-ascii?Q?2B6NPymS+vx0SuqOr4bfvL+UVvTMFKg1B4Bc3duJqHzwP1lyudjZjzEwRJy/?=
 =?us-ascii?Q?GpnfuRlK7p4JbYJGz57cCNQutjwlefxAUjsADGo0nN3mARVz8n8Qw7MDcul/?=
 =?us-ascii?Q?Owhwl2ZHV4Dle38mb1D5d8/h1uemPCcklTiG2Ubvlq54EnfzNL9uaMmIUhwM?=
 =?us-ascii?Q?90mM8plIkIXh3VGUWI4rzSN70gFH4erjLSefZHnqxdVIa8KgGKTpbSOMTmbK?=
 =?us-ascii?Q?x52J/1I6y4F5h36vrj1lM9om9fiA8UliFouFXe14JrO7CJ25q+BPM/aMc0Om?=
 =?us-ascii?Q?qcPoAeeHAPib3WIWY/qeO4N7Fw8uVWw3ai2nHDNBdxIkWND3C24oHDGAfaRl?=
 =?us-ascii?Q?23HxVsxc+1cvZd6hPb0q7t3XUdEcB4yDPDALH+teeKRT+MdCKhMFT1as5fFw?=
 =?us-ascii?Q?yaWAypfmO2Jy3oINsixBjPs564fPm5OYfCs3QLBfT/Ul54n4yUY9teGSjONO?=
 =?us-ascii?Q?MAIDx3n0g3mb+cOMR4Mz0JLkU0gMBiNJJR06n7hyXhT72ckTTaQvz8IrlnjD?=
 =?us-ascii?Q?hvZA4Lj2L/tJX39RY3z1z2PHqXfC0ZjdppXBA36qS7ftGsiMOEnjfPzPxHGP?=
 =?us-ascii?Q?K6xXablS983N3wy5IcmWrAYeb+f4vNTzBP+pPXYcBBzIUL+EorrWM9bMxooI?=
 =?us-ascii?Q?p4/dECKQmCBpvNvUkeCO2C3gNEhx+KtvlHcZpaCj0YqwwmPQgvaaJbIymqRZ?=
 =?us-ascii?Q?i2rvZOzquiCAcHsYUVMuFbXdSfCTF30u3JXHWg2Ql5bV7q1PMP/mU7DkXWJU?=
 =?us-ascii?Q?993vs5zi5oBJ2oDBhfVhCmTSHu+n/5gYMWtgr0eVS1edBuIwvc92iPeEy8Jl?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e91649f3-2969-46b3-1a8a-08dcfd4259cd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 02:34:19.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02BgJCndkyruHK3O+1bykmgXsmcsVNwl1hoISDpwO0LNJ1ggX66S6Kdy7SS9gf5US9XKKjRtVqphSI+yQbeqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com



Hello,


we noticed Matthew Wilcox NACKed this patch in
https://lore.kernel.org/all/ZyjLpXKx5qcLYQ3S@casper.infradead.org/

we send below report FYI in case it could supply some useful information to
you. just ignore otherwise. thanks


kernel test robot noticed "BUG:KASAN:slab-out-of-bounds_in_mas_store_gfp" on:

commit: 6fa40fae6ea5ad7990555fa7460739ee44088111 ("[PATCH] maple_tree: use KMEM_CACHE to create maple_node caches")
url: https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/maple_tree-use-KMEM_CACHE-to-create-maple_node-caches/20241104-141720
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link: https://lore.kernel.org/all/20241104061617.450907-1-sunke@kylinos.cn/
patch subject: [PATCH] maple_tree: use KMEM_CACHE to create maple_node caches

in testcase: boot

config: x86_64-rhel-8.3-kselftests
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------------------+------------+------------+
|                                                                                              | d61ee4ec5d | 6fa40fae6e |
+----------------------------------------------------------------------------------------------+------------+------------+
| boot_successes                                                                               | 18         | 0          |
| boot_failures                                                                                | 0          | 18         |
| BUG:KASAN:slab-out-of-bounds_in_mas_store_gfp                                                | 0          | 14         |
| Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN_PTI | 0          | 18         |
| KASAN:null-ptr-deref_in_range[#-#]                                                           | 0          | 18         |
| RIP:mas_wr_store_type                                                                        | 0          | 11         |
| Kernel_panic-not_syncing:Fatal_exception                                                     | 0          | 18         |
| BUG:KASAN:slab-out-of-bounds_in_mas_put_in_tree                                              | 0          | 4          |
| RIP:mas_put_in_tree                                                                          | 0          | 4          |
| RIP:mas_ascend                                                                               | 0          | 3          |
+----------------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411051011.b1d218e6-oliver.sang@intel.com


[ 3.482690][ T0] BUG: KASAN: slab-out-of-bounds in mas_store_gfp (lib/maple_tree.c:546 lib/maple_tree.c:578 lib/maple_tree.c:1368 lib/maple_tree.c:4132 lib/maple_tree.c:4266 lib/maple_tree.c:5477) 
[    3.483624][    T0] Read of size 8 at addr ffff88810028b600 by task swapper/0/0
[    3.484595][    T0]
[    3.484906][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.0-rc5-00131-g6fa40fae6ea5 #1
[    3.486154][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    3.487534][    T0] Call Trace:
[    3.487952][    T0]  <TASK>
[ 3.488337][ T0] dump_stack_lvl (lib/dump_stack.c:124) 
[ 3.488949][ T0] print_address_description+0x2c/0x3a0 
[ 3.489867][ T0] ? mas_store_gfp (lib/maple_tree.c:546 lib/maple_tree.c:578 lib/maple_tree.c:1368 lib/maple_tree.c:4132 lib/maple_tree.c:4266 lib/maple_tree.c:5477) 
[ 3.490508][ T0] print_report (mm/kasan/report.c:489) 
[ 3.491108][ T0] ? kasan_addr_to_slab (mm/kasan/common.c:37) 
[ 3.491762][ T0] ? mas_store_gfp (lib/maple_tree.c:546 lib/maple_tree.c:578 lib/maple_tree.c:1368 lib/maple_tree.c:4132 lib/maple_tree.c:4266 lib/maple_tree.c:5477) 
[ 3.492391][ T0] kasan_report (mm/kasan/report.c:603) 
[ 3.492999][ T0] ? mas_store_gfp (lib/maple_tree.c:546 lib/maple_tree.c:578 lib/maple_tree.c:1368 lib/maple_tree.c:4132 lib/maple_tree.c:4266 lib/maple_tree.c:5477) 
[ 3.493672][ T0] mas_store_gfp (lib/maple_tree.c:546 lib/maple_tree.c:578 lib/maple_tree.c:1368 lib/maple_tree.c:4132 lib/maple_tree.c:4266 lib/maple_tree.c:5477) 
[ 3.494258][ T0] ? __pfx_mas_store_gfp (lib/maple_tree.c:5470) 
[ 3.494930][ T0] ? init_desc (kernel/irq/irqdesc.c:213) 
[ 3.495526][ T0] early_irq_init (kernel/irq/irqdesc.c:174 kernel/irq/irqdesc.c:585) 
[ 3.496148][ T0] ? __pfx_early_irq_init (kernel/irq/irqdesc.c:563) 
[ 3.496833][ T0] ? __trace_define_field (include/linux/list.h:150 include/linux/list.h:169 kernel/trace/trace_events.c:138) 
[ 3.497557][ T0] start_kernel (init/main.c:1008) 
[ 3.498161][ T0] x86_64_start_reservations (arch/x86/kernel/head64.c:495) 
[ 3.498918][ T0] x86_64_start_kernel (arch/x86/kernel/head64.c:437 (discriminator 17)) 
[ 3.499599][ T0] common_startup_64 (arch/x86/kernel/head_64.S:414) 
[    3.500276][    T0]  </TASK>
[    3.500684][    T0]
[    3.500996][    T0] The buggy address belongs to the object at ffff88810028b500
[    3.500996][    T0]  which belongs to the cache maple_node of size 256
[    3.502884][    T0] The buggy address is located 0 bytes to the right of
[    3.502884][    T0]  allocated 256-byte region [ffff88810028b500, ffff88810028b600)
[    3.504826][    T0]
[    3.505139][    T0] The buggy address belongs to the physical page:
[    3.506009][    T0] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10028b
[    3.507141][    T0] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
[    3.508110][    T0] page_type: f5(slab)
[    3.508638][    T0] raw: 0017ffffc0000000 ffff88810004fdc0 dead000000000122 0000000000000000
[    3.509777][    T0] raw: 0000000000000000 00000000800c000c 00000001f5000000 0000000000000000
[    3.510920][    T0] page dumped because: kasan: bad access detected
[    3.511773][    T0]
[    3.512072][    T0] Memory state around the buggy address:
[    3.512839][    T0]  ffff88810028b500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[    3.513930][    T0]  ffff88810028b580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[    3.514979][    T0] >ffff88810028b600: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
[    3.516054][    T0]                    ^
[    3.516582][    T0]  ffff88810028b680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    3.517681][    T0]  ffff88810028b700: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
[    3.518763][    T0] ==================================================================
[    3.519871][    T0] Disabling lock debugging due to kernel taint
[    3.520761][    T0] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
[    3.522464][    T0] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[    3.523522][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G    B              6.12.0-rc5-00131-g6fa40fae6ea5 #1
[    3.524900][    T0] Tainted: [B]=BAD_PAGE
[    3.525438][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 3.526808][ T0] RIP: 0010:mas_wr_store_type (lib/maple_tree.c:795 lib/maple_tree.c:808 lib/maple_tree.c:3526 lib/maple_tree.c:4198) 
[ 3.527581][ T0] Code: 00 0f 85 a9 0e 00 00 4d 8b 75 00 e8 3a d0 0a 00 85 c0 0f 85 33 02 00 00 44 0f b6 74 24 20 4a 8d 6c f5 00 48 89 e8 48 c1 e8 03 <42> 80 3c 20 00 0f 85 6e 0e 00 00 49 8d 7f 48 4c 8b 75 00 48 89 f8
All code
========
   0:	00 0f                	add    %cl,(%rdi)
   2:	85 a9 0e 00 00 4d    	test   %ebp,0x4d00000e(%rcx)
   8:	8b 75 00             	mov    0x0(%rbp),%esi
   b:	e8 3a d0 0a 00       	callq  0xad04a
  10:	85 c0                	test   %eax,%eax
  12:	0f 85 33 02 00 00    	jne    0x24b
  18:	44 0f b6 74 24 20    	movzbl 0x20(%rsp),%r14d
  1e:	4a 8d 6c f5 00       	lea    0x0(%rbp,%r14,8),%rbp
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)		<-- trapping instruction
  2f:	0f 85 6e 0e 00 00    	jne    0xea3
  35:	49 8d 7f 48          	lea    0x48(%r15),%rdi
  39:	4c 8b 75 00          	mov    0x0(%rbp),%r14
  3d:	48 89 f8             	mov    %rdi,%rax

Code starting with the faulting instruction
===========================================
   0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
   5:	0f 85 6e 0e 00 00    	jne    0xe79
   b:	49 8d 7f 48          	lea    0x48(%r15),%rdi
   f:	4c 8b 75 00          	mov    0x0(%rbp),%r14
  13:	48 89 f8             	mov    %rdi,%rax
[    3.530219][    T0] RSP: 0000:ffffffffa8a07bf8 EFLAGS: 00010046
[    3.531055][    T0] RAX: 0000000000000000 RBX: ffffffffa8a07e8d RCX: 1ffffffff5140faa
[    3.532126][    T0] RDX: 0000000000000005 RSI: 0000000000000002 RDI: ffffffffa8a07e60
[    3.533193][    T0] RBP: 0000000000000000 R08: 0000000000000001 R09: 1ffffffff5140fcc
[    3.534285][    T0] R10: 0000000000000000 R11: ffffffffa8a07d40 R12: dffffc0000000000
[    3.535366][    T0] R13: ffffffffa8a07e50 R14: 0000000000000000 R15: ffffffffa8a07d38
[    3.536432][    T0] FS:  0000000000000000(0000) GS:ffff8883aee00000(0000) knlGS:0000000000000000
[    3.537616][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.538481][    T0] CR2: ffff88843ffff000 CR3: 00000000aec7e000 CR4: 00000000000000b0
[    3.539544][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.540540][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.541553][    T0] Call Trace:
[    3.541978][    T0]  <TASK>
[ 3.542348][ T0] ? die_addr (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:460) 
[ 3.542896][ T0] ? exc_general_protection (arch/x86/kernel/traps.c:751 arch/x86/kernel/traps.c:693) 
[ 3.543641][ T0] ? asm_exc_general_protection (arch/x86/include/asm/idtentry.h:617) 
[ 3.544411][ T0] ? mas_wr_store_type (lib/maple_tree.c:795 lib/maple_tree.c:808 lib/maple_tree.c:3526 lib/maple_tree.c:4198) 
[ 3.545114][ T0] ? mas_wr_store_type (lib/maple_tree.c:795 lib/maple_tree.c:808 lib/maple_tree.c:3526 lib/maple_tree.c:4198) 
[ 3.545833][ T0] mas_store_gfp (lib/maple_tree.c:212 lib/maple_tree.c:4145 lib/maple_tree.c:4268 lib/maple_tree.c:5477) 
[ 3.546457][ T0] ? __pfx_mas_store_gfp (lib/maple_tree.c:5470) 
[ 3.547141][ T0] ? init_desc (kernel/irq/irqdesc.c:213) 
[ 3.547738][ T0] early_irq_init (kernel/irq/irqdesc.c:174 kernel/irq/irqdesc.c:585) 
[ 3.548380][ T0] ? __pfx_early_irq_init (kernel/irq/irqdesc.c:563) 
[ 3.549074][ T0] ? __trace_define_field (include/linux/list.h:150 include/linux/list.h:169 kernel/trace/trace_events.c:138) 
[ 3.549825][ T0] start_kernel (init/main.c:1008) 
[ 3.550392][ T0] x86_64_start_reservations (arch/x86/kernel/head64.c:495) 
[ 3.551107][ T0] x86_64_start_kernel (arch/x86/kernel/head64.c:437 (discriminator 17)) 
[ 3.551765][ T0] common_startup_64 (arch/x86/kernel/head_64.S:414) 
[    3.552417][    T0]  </TASK>
[    3.552804][    T0] Modules linked in:
[    3.553314][    T0] ---[ end trace 0000000000000000 ]---
[ 3.554036][ T0] RIP: 0010:mas_wr_store_type (lib/maple_tree.c:795 lib/maple_tree.c:808 lib/maple_tree.c:3526 lib/maple_tree.c:4198) 
[ 3.554798][ T0] Code: 00 0f 85 a9 0e 00 00 4d 8b 75 00 e8 3a d0 0a 00 85 c0 0f 85 33 02 00 00 44 0f b6 74 24 20 4a 8d 6c f5 00 48 89 e8 48 c1 e8 03 <42> 80 3c 20 00 0f 85 6e 0e 00 00 49 8d 7f 48 4c 8b 75 00 48 89 f8
All code
========
   0:	00 0f                	add    %cl,(%rdi)
   2:	85 a9 0e 00 00 4d    	test   %ebp,0x4d00000e(%rcx)
   8:	8b 75 00             	mov    0x0(%rbp),%esi
   b:	e8 3a d0 0a 00       	callq  0xad04a
  10:	85 c0                	test   %eax,%eax
  12:	0f 85 33 02 00 00    	jne    0x24b
  18:	44 0f b6 74 24 20    	movzbl 0x20(%rsp),%r14d
  1e:	4a 8d 6c f5 00       	lea    0x0(%rbp,%r14,8),%rbp
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)		<-- trapping instruction
  2f:	0f 85 6e 0e 00 00    	jne    0xea3
  35:	49 8d 7f 48          	lea    0x48(%r15),%rdi
  39:	4c 8b 75 00          	mov    0x0(%rbp),%r14
  3d:	48 89 f8             	mov    %rdi,%rax

Code starting with the faulting instruction
===========================================
   0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
   5:	0f 85 6e 0e 00 00    	jne    0xe79
   b:	49 8d 7f 48          	lea    0x48(%r15),%rdi
   f:	4c 8b 75 00          	mov    0x0(%rbp),%r14
  13:	48 89 f8             	mov    %rdi,%rax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241105/202411051011.b1d218e6-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

