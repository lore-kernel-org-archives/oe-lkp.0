Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D119A2749C5
	for <oe-lkp@lists.linux.dev>; Fri, 19 Dec 2025 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766125340; cv=fail; b=OZn4PUwfHbDmJm8cavs3UwLLD1PGVc/83MsvIgOl2dQ2CYF/gPQo2lDfluRUY1HcHqKvzQERvlTl5uCa9ITGNLHJsmDY7MtjeAe4CvKdCBIUG+KGC0ARK+89mfG6MkbELQGWAjfrGLFBR86yn/S67UPuTyvbtI96SGzmKFpPqq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766125340; c=relaxed/simple;
	bh=sFII7nsdTAOho9RV803d3JZOEgHWQNboYBOipoel2m0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CqbwwMuXdlOeXmnOkFbZc852ufb46pX5Xf+slSTdUahUuimdHkYD3QDLseOJyYpZCpEk/QwOD9AdFOe2sNhmPZx5Nx1hbDZQHzojbneSUAiea2DmVirIMGuusJ/9oA1LrgfWz3ITRKe5wf3YkcV8/2gChp+NblSUaatSm8MXhgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnaDbRHj; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnaDbRHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766125338; x=1797661338;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=sFII7nsdTAOho9RV803d3JZOEgHWQNboYBOipoel2m0=;
  b=jnaDbRHjV8ZAjkJZYkgL+Al0Z4zHdAyeXy9/qVTLJq4v47FUOK8dkgV4
   CI6GMqmzn1xmPzbDMR3tOBxQlHWM1oQqWSvnzq743YJdeTYLnTJLBnsce
   yAcCQgwRvuEQITWFE1J2ShjoiT8WC67QMpP55wQNeBHX8V8tWUxPIaefm
   JTNkt10WOqbXyNyox0t/6aQSMbCOx6QOult6zfh9LYjvQISOUTALZrNSe
   nM82VgLHdNdfuhV7vqEtcyreY/f8v0c0pPUV+wQgtzsT6JfXJWlqTtZ9y
   SnY8nwZBIvN2ZHV9PVy0TeDe2catJug26zE+pTIizRfqrRziqtTEkMjU/
   w==;
X-CSE-ConnectionGUID: dD1lnBsfTUKA1MTW0VuwqQ==
X-CSE-MsgGUID: 1QixXJslQ2C5IDEeGVSpzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68059085"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68059085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:22:16 -0800
X-CSE-ConnectionGUID: xMJAzOhXQbGEDH64dcHy1w==
X-CSE-MsgGUID: NExnrwQqQ6OMjff//oHCtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229465985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:22:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:22:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 22:22:15 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 22:22:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzbOZnvO8E04IjtWuSBefIBAcirkZ4dPwxEQZnLeWow++jxovy/JeDJemFv4CCtYvC0GWYQitmFGtT6ZCSLLkw3HA6GvV0zcnSwsEMG4hQltR7V0/+cjC7WIvuN05DaXad9kly2BpFz7pOPFY+aVzZjhORW/rXOJk9Nui/ZxxmfUqljw9ne7bamoptaU5gaTW3o0ZdeHrR6NFsJQ/McaZ6e0wpmWfGXzgrGiuiOnwpsJaCVSOUzYeaxh37m6Rijqrv2rcIo0xknNeZWPjQsTBiJL5oOomP1rdmbbfDx35oM7vUv38gVl1x9d4fXlkrggbHCFcr+5l2fWlVeZaGn6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppk15ajK3UvVkycKMkXaLDBkF7CQ8orvmm65pHkBUzI=;
 b=T9Jhdvv30fx7zZokn5og6YxabxvdNsNHGGV4EQlihSf2KU4L/BrGHUNpY/h2MXI3tx71olZ/8UoTOJ/0X21e4ixyaWMMN3DlFrCdKjHen1P0WSwMKptRM52vM8ol7cVM0nDsSnvTQRwzRC/vnuO1ioG/fILUTFm9Mo6nSflenchCy2uxmpkY3HszMVeoJsj+i9r+cIDxsOY8EVsFjnKSfRu6wfIn/fR/f/BSzg24NklzSOFxX5FROrTA41lkKEH6smmI1xekevnYsfB9R40i7tZxSOc3mSgFnxXymP9QP9dtgSx7hCBxKSdOCPxp0ix3sixNrjX6477GMIp1BjqUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 06:22:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:22:12 +0000
Date: Fri, 19 Dec 2025 14:21:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Al Viro
	<viro@zeniv.linux.org.uk>, Andreas Larsson <andreas@gaisler.com>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, "Chatre,
 Reinette" <reinette.chatre@intel.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, "Dan
 Williams" <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	"Dave Martin" <dave.martin@arm.com>, Dave Young <dyoung@redhat.com>, "David
 Hildenbrand" <david@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	Dmitriy Vyukov <dvyukov@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, Heiko Carstens
	<hca@linux.ibm.com>, Hugh Dickins <hughd@google.com>, James Morse
	<james.morse@arm.com>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Kevin Tian <kevin.tian@intel.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Liam Howlett
	<liam.howlett@oracle.com>, "Luck, Tony" <tony.luck@intel.com>, Matthew Wilcox
	<willy@infradead.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
	<rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Nicolas Pitre
	<nico@fluxnic.net>, Oscar Salvador <osalvador@suse.de>, Pedro Falcato
	<pfalcato@suse.de>, Robin Murohy <robin.murphy@arm.com>, Sumanth Korikkar
	<sumanthk@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Vishal Verma <vishal.l.verma@intel.com>,
	Vivek Goyal <vgoyal@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, "Will
 Deacon" <will@kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  ab04945f91:  stress-ng.fd-abuse.ops_per_sec
 3.4% improvement
Message-ID: <202512181616.16b76cde-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 504da2aa-7c51-48f4-d3f4-08de3ec6f21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0FHgoSRzNrLEhMk5o5W7O5c7gNplIydk06kmrqw9uJBcfZn+qx4xJX7InM?=
 =?iso-8859-1?Q?OkRPuOlFV1yaxuhwmYtc/OCGMH+dhSFP79lpiF2SAoLcwqvmLt3O6UORsl?=
 =?iso-8859-1?Q?mwJy7rk7r8VESHC/rxYEIh3qNOlBVUT9wYS2+42juMpDOKYJpFBawwRsui?=
 =?iso-8859-1?Q?0xXxvZ6sameEuwXuNLstcY9taw1QiHYZFU4lHQR0GYln8nWhedpRSG0RBI?=
 =?iso-8859-1?Q?8PrRRwnu0DdKGUQVyMjmcPYVipXIQG6YbweaYuUdACLBlid8jUHXerRa3I?=
 =?iso-8859-1?Q?544Hw5EPRz33OeKhrbHvferiGviXWYTP5VdmfLOUGI+MB57befFX920DlN?=
 =?iso-8859-1?Q?J9NISrUvmxoTRn7HvBKeTN3SFsmow33gU4YG+CBIj416vSYxWqRZ7vWz52?=
 =?iso-8859-1?Q?tyXjeL+rAK2kZCF/vUgGvM/4EW+hYMw5N8j1TGjjfMSn04OsSv16dDSygj?=
 =?iso-8859-1?Q?Z//q/M+Nack3nI83/GblfceWIHepzT2NsvTWXZgopN8I/yvAL5HE2/ey8m?=
 =?iso-8859-1?Q?O9acBsfryjzhuZlIDORuAQ82U/0CMibgk6kSOkvt+JfqQ46BF6iZYFhYX4?=
 =?iso-8859-1?Q?8ljHyJmkDT7tih2fj/kOxlLEagL7sICc/vABe8Sqyra/UavGOEyio8pCuN?=
 =?iso-8859-1?Q?poxoEST8ilmI2vhenvKaCMGpxNqyeD9iayi7BE9FPOEdy7CT8Zy7um4yB0?=
 =?iso-8859-1?Q?8F5ZO1bufWN/KTUQOMAQC3MTAKzWh5FgvOLKOs9UiHivlLWx71wnlQWgsc?=
 =?iso-8859-1?Q?LIiWGqJBA+dLoCSo5UQaoDhE353MhO32n/W3RVwbTNvZ5HJWbJF6DTg53u?=
 =?iso-8859-1?Q?gLL1tmuJk5SQJB6yx0wHebGdH6a4pdNS7sRieO9fvM/cuOXyb7k/Dii0GU?=
 =?iso-8859-1?Q?xMQLc9Lp1zMzf4R5lmsZ+OB+pjjWD2ZGDwtL8nkFjhAo2vAT1RVAgvEqS9?=
 =?iso-8859-1?Q?h4LsHHBm/t+wFNiKacABxv6HGK6o86gDYAZXEIs49JQakd5VOnKM9fV4G8?=
 =?iso-8859-1?Q?QfNb3BdH6+OYBqqGC/cMGwo3Ie/h2Ib3G+5SFQyDQx9NSiaSxV4CnCZq7m?=
 =?iso-8859-1?Q?PzJy5L95nMeMTehM5S1up057KaPVxTwFJQr0lHGVjJRJKOA/qRklnNSe1H?=
 =?iso-8859-1?Q?irP3H4HemYKfuETp7HYhjIGOjX2QtulCjVZN4BCZxuYJBFy3vt/b204Dcf?=
 =?iso-8859-1?Q?g1ELcZZWVaA0XNoT68l9dEfVgRNv50p4UFllVHroqeP89N3HIA01snq0m9?=
 =?iso-8859-1?Q?EZ6dzjU2VaLi2yMSbysJ5mGIuEJTqtCuCWbfcChOYyvCS5B5vYK4i5n6Z/?=
 =?iso-8859-1?Q?Z3zbuBQiRVposNlzSUJA6OzY9jn8xpRjcHsfjTQL+KdohmGhByGUi6PKKu?=
 =?iso-8859-1?Q?6S+1znEutrWMc3GWs5Spcz+tGC5GneHKnCAsqGYwYm1xp+/qqWHZQzx/zD?=
 =?iso-8859-1?Q?nft2pzCdFiEhGyi/9N8IAHPxe1mCsN/Fa8Adx5TvNe5y2PBXV9nO+MKYeU?=
 =?iso-8859-1?Q?/qpTU8UXMZUhT9vYuyLXsZIa69n9kCKT8EidcuDaH2vw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B3qyyWuSLs3DaM5i346L08ChQEMCB5xO3isXFLdKTZFvPMCk0BTB9jZfan?=
 =?iso-8859-1?Q?n1t07D0sHyjPKHqblvY+grX20y8LjO9cvFWCfuHl9cwiz7f6v5hAhSYXLi?=
 =?iso-8859-1?Q?G2SK0LMJxckvaPS/bwWJbV7ibtOZhMyvpiGimQimReM/9kHvXH9SDbmhIB?=
 =?iso-8859-1?Q?w/TlYI+pzdn9QnZdMDENeteRzFYMEIHxWPnE1exb5TnyVbA94eKzKftirR?=
 =?iso-8859-1?Q?tCUO+7ZKWXGUQqAP33ir1N+ZW53dQ4FMDoQEBBZAeAF8ZQEiFDpTGPibnh?=
 =?iso-8859-1?Q?JOjMTvEA2LdBqB7Rhn34+zSNUgVoX6GaBWmLFjSFtRLL9xwKHTdnaIkxkk?=
 =?iso-8859-1?Q?/KyLdESiwuW/BXBSTmPbAc3b023FmNYImc/20Bee5vUBuUHqCWBgAzVOdE?=
 =?iso-8859-1?Q?+YjXmNpnnYD6+lNXhc8GFfZurMRglU4FiUyA4Q+EHwO5cQHuaY136E+8AG?=
 =?iso-8859-1?Q?dK/TkPZgcoFxFbBBQbFxiBmkZqSpeezr5m2EHfZ/x+l450Asjzab0xVnkt?=
 =?iso-8859-1?Q?n3gxrTzhCPFaDebA36ARCQ3cdLWW03V0h6jCaZiB65DP3LMcPYGUZ2VCDo?=
 =?iso-8859-1?Q?bmXTiSoPiI7GPNTNPMnbxrWP1S9Yr1yNLph9+eHHL8f6NFqaDvTp1MfKW1?=
 =?iso-8859-1?Q?O9vQAdll0Ol2VnCYwu7NzR2VTc4hUnl1a+PSVRCsK7e+BsF8ZAHSU8ygXc?=
 =?iso-8859-1?Q?MRJFAQ4f8CPrGSexwZULGHvrtBa9ULlKBplmglgRAdT56D8enGSbZwJ44b?=
 =?iso-8859-1?Q?uDvbzH0wKhAKUpAs1VlV7CELO1ET7wOgtVAwPaCKJjeg0MtXN5yAzOacV3?=
 =?iso-8859-1?Q?xcUCeWLndhtgNAq7VAPY3ebz0OUgkhD4BY6Y+ZQj5o/3PWHXASKR3hq7M0?=
 =?iso-8859-1?Q?PGCUCO8T6Zjy+k5bZ4eiWftesFgpvXuJfDjQmm9SUIHTDjyraWMKJVvgmE?=
 =?iso-8859-1?Q?dJXZbZYtRqY2IYLEq1DZAmaaKJ9DPT9eiz7elwdIJdmcrr9UY96mdtmQdh?=
 =?iso-8859-1?Q?8t9h+VVV6Yj/uzgdZVCKFN2Tg29qacd15tWQyj1x6Wa2Jt63Sqtrv1DHCe?=
 =?iso-8859-1?Q?4k3w355JkfMik9XBgHFZ0SCJU1xGMG1q4CfU1xsLfFAphAM9KsvVRwbdFd?=
 =?iso-8859-1?Q?tGai/xtfCwZ5CDXpvKSG7NFYwjtUw1Lc3EVTdWraegmLtWg8DAotLY46HL?=
 =?iso-8859-1?Q?dEGqVonaBfuJ/dwjRem/NrWn+x9zM9wtb+h1l+ABX/NGz1XP7U8DQwfVbE?=
 =?iso-8859-1?Q?sXXgxxG8Of85D417XMdhirpEcWABmPrck9JVnF6o+MvYIiRZrlR9DxN3k9?=
 =?iso-8859-1?Q?SanSQWunyrmpcP2CTgIrofGE0sVtsQ5zamC6zPsfirbjeRlt+igwh08dac?=
 =?iso-8859-1?Q?IFlFuAqIBfR6fZi+UyUvZXgYLbuBi7a+TS2F1hjcZA89S9GoLEIa05wX08?=
 =?iso-8859-1?Q?TSkQNYjIRagOLGF6NgBmxwmtCJZVBioItLMwH18SQQpyHdtt2Dy6PRxEPm?=
 =?iso-8859-1?Q?Vudw9ToD2TEZDW0+ZkHvIQ+rGh67CFFqVOQO5ZheywETDB3Hf/9mOTyUzF?=
 =?iso-8859-1?Q?mICkgoRdf8K8tbWkIKyHb+0ndJJc32UWfvasBX0RWSsOKqOFfnIwbHtpuW?=
 =?iso-8859-1?Q?owVGLfZqsW7NDQucxjoL5xNLWkBtIO48AlsELTYzQenZqWzHtaCSlJfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 504da2aa-7c51-48f4-d3f4-08de3ec6f21f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:22:12.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swR1ZfE75OU+kC7mgsTom4XUA6OLCKTBIDXZj/RecMttqAoGlG6Jns5NAR0a1TQJ0efkuaeWPM8BuiWpLV+vig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.4% improvement of stress-ng.fd-abuse.ops_per_sec on:


commit: ab04945f91bcad1668af57bbb575771e794aea8d ("mm: update mem char driver to use mmap_prepare")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: fd-abuse
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251218/202512181616.16b76cde-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/fd-abuse/stress-ng/60s

commit: 
  89646d9c74 ("mm: add shmem_zero_setup_desc()")
  ab04945f91 ("mm: update mem char driver to use mmap_prepare")

89646d9c748c0902 ab04945f91bcad1668af57bbb57 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     19.28            +2.8%      19.82        turbostat.RAMWatt
   2438603 ±  3%     -13.5%    2109471 ±  7%  numa-numastat.node1.local_node
   2517328 ±  4%     -11.9%    2217162 ±  5%  numa-numastat.node1.numa_hit
     72858 ±  6%     +91.5%     139519 ±  3%  proc-vmstat.nr_slab_reclaimable
    339884          +107.0%     703398        proc-vmstat.nr_slab_unreclaimable
  20261925 ±  2%     -25.3%   15142663        proc-vmstat.pgalloc_normal
  18968240 ±  2%     -31.6%   12978914 ±  2%  proc-vmstat.pgfree
 3.706e+09            +3.4%  3.833e+09        stress-ng.fd-abuse.ops
  61777966            +3.4%   63895149        stress-ng.fd-abuse.ops_per_sec
    285.34            +4.4%     297.95        stress-ng.time.user_time
     16701            +2.7%      17144        stress-ng.time.voluntary_context_switches
   8804549           +61.4%   14208934        meminfo.Committed_AS
    291574 ±  6%     +91.1%     557114 ±  3%  meminfo.KReclaimable
  12991379 ±  3%     +16.6%   15149678 ±  2%  meminfo.Memused
    291574 ±  6%     +91.1%     557114 ±  3%  meminfo.SReclaimable
   1353499          +107.7%    2811130        meminfo.SUnreclaim
   1645073          +104.7%    3368244        meminfo.Slab
  13335448 ±  3%     +15.9%   15450436 ±  2%  meminfo.max_used_kB
     17516 ± 34%     +97.4%      34572 ±  6%  numa-vmstat.node0.nr_slab_reclaimable
     88462 ±  6%    +102.5%     179171 ±  2%  numa-vmstat.node0.nr_slab_unreclaimable
     66.79 ± 54%    +106.9%     138.19 ± 33%  numa-vmstat.node1.nr_anon_transparent_hugepages
     16982 ± 18%     +94.3%      32997 ± 19%  numa-vmstat.node1.nr_slab_reclaimable
     81860 ±  3%    +113.2%     174536 ±  2%  numa-vmstat.node1.nr_slab_unreclaimable
   2521117 ±  4%     -12.0%    2218931 ±  5%  numa-vmstat.node1.numa_hit
   2442392 ±  3%     -13.6%    2111240 ±  7%  numa-vmstat.node1.numa_local
     19931 ± 28%     +90.9%      38056 ±  7%  numa-vmstat.node2.nr_slab_reclaimable
     86088 ±  5%     +99.7%     171897        numa-vmstat.node2.nr_slab_unreclaimable
     18146 ± 12%     +82.8%      33181 ± 13%  numa-vmstat.node3.nr_slab_reclaimable
     83060 ±  4%    +111.5%     175660 ±  2%  numa-vmstat.node3.nr_slab_unreclaimable
 2.679e+10            +1.5%  2.718e+10        perf-stat.i.branch-instructions
     43.06            +0.9       44.01        perf-stat.i.cache-miss-rate%
  88883420            +5.0%   93333404        perf-stat.i.cache-misses
      6.01            -1.2%       5.94        perf-stat.i.cpi
      8654            -5.3%       8192        perf-stat.i.cycles-between-cache-misses
 1.211e+11            +1.6%   1.23e+11        perf-stat.i.instructions
      0.73            +3.5%       0.76        perf-stat.overall.MPKI
     42.85            +0.9       43.75        perf-stat.overall.cache-miss-rate%
      6.03            -1.3%       5.95        perf-stat.overall.cpi
      8266            -4.7%       7879        perf-stat.overall.cycles-between-cache-misses
      0.17            +1.3%       0.17        perf-stat.overall.ipc
 2.635e+10            +1.4%  2.673e+10        perf-stat.ps.branch-instructions
  86986582            +5.1%   91435274        perf-stat.ps.cache-misses
  2.03e+08            +2.9%   2.09e+08        perf-stat.ps.cache-references
 1.191e+11            +1.6%   1.21e+11        perf-stat.ps.instructions
 7.248e+12            +1.6%  7.363e+12        perf-stat.total.instructions
     70689 ± 34%     +96.6%     138955 ±  6%  numa-meminfo.node0.KReclaimable
     70689 ± 34%     +96.6%     138955 ±  6%  numa-meminfo.node0.SReclaimable
    356946 ±  6%    +101.3%     718428 ±  3%  numa-meminfo.node0.SUnreclaim
    427635 ± 10%    +100.5%     857383 ±  2%  numa-meminfo.node0.Slab
    139096 ± 54%    +104.6%     284523 ± 33%  numa-meminfo.node1.AnonHugePages
     68643 ± 18%     +93.3%     132663 ± 19%  numa-meminfo.node1.KReclaimable
   2076019 ±  6%     +57.0%    3258377 ± 43%  numa-meminfo.node1.MemUsed
     68643 ± 18%     +93.3%     132663 ± 19%  numa-meminfo.node1.SReclaimable
    330581 ±  3%    +111.7%     699874 ±  2%  numa-meminfo.node1.SUnreclaim
    399224 ±  3%    +108.5%     832538 ±  4%  numa-meminfo.node1.Slab
     80254 ± 27%     +90.6%     152941 ±  7%  numa-meminfo.node2.KReclaimable
     80254 ± 27%     +90.6%     152941 ±  7%  numa-meminfo.node2.SReclaimable
    347619 ±  4%     +98.2%     689115        numa-meminfo.node2.SUnreclaim
    427873 ±  7%     +96.8%     842056        numa-meminfo.node2.Slab
     73141 ± 11%     +82.0%     133137 ± 13%  numa-meminfo.node3.KReclaimable
   3108062 ± 11%     +41.5%    4398558 ± 26%  numa-meminfo.node3.MemUsed
     73141 ± 11%     +82.0%     133137 ± 13%  numa-meminfo.node3.SReclaimable
    335184 ±  5%    +110.2%     704492 ±  2%  numa-meminfo.node3.SUnreclaim
    408326 ±  5%    +105.1%     837630 ±  3%  numa-meminfo.node3.Slab
      5.23            -1.9        3.31        perf-profile.calltrace.cycles-pp.stress_fd_lseek
     46.32            -1.3       45.05        perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup
     46.38            -1.3       45.12        perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     46.32            -1.3       45.06        perf-profile.calltrace.cycles-pp.dput.__fput.task_work_run.exit_to_user_mode_loop.do_syscall_64
     46.34            -1.3       45.08        perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.44            -1.3       45.18        perf-profile.calltrace.cycles-pp.new_inode.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup.__mmap_new_vma
     46.54            -1.3       45.28        perf-profile.calltrace.cycles-pp.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup.__mmap_new_vma.__mmap_region
     46.30            -1.3       45.04        perf-profile.calltrace.cycles-pp.__dentry_kill.dput.__fput.task_work_run.exit_to_user_mode_loop
     46.14            -1.3       44.88        perf-profile.calltrace.cycles-pp.evict.__dentry_kill.dput.__fput.task_work_run
     45.84            -1.2       44.60        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.evict.__dentry_kill.dput
     45.99            -1.2       44.74        perf-profile.calltrace.cycles-pp._raw_spin_lock.evict.__dentry_kill.dput.__fput
      0.67            +0.0        0.70        perf-profile.calltrace.cycles-pp.llseek
      2.40            +0.0        2.44        perf-profile.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      2.38            +0.0        2.43        perf-profile.calltrace.cycles-pp.__mmap_region.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      2.54            +0.1        2.60        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.75 ±  2%      +0.1        0.81        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.58            +0.1        2.64        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      0.77 ±  2%      +0.1        0.83        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.56            +0.1        2.62        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      1.02            +0.1        1.09        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_fd_lseek
      1.06            +0.1        1.14        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_fd_lseek
     44.33            +0.8       45.15        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     46.28            +0.8       47.11        perf-profile.calltrace.cycles-pp._raw_spin_lock.inode_sb_list_add.new_inode.__shmem_get_inode.__shmem_file_setup
     46.20            +0.8       47.04        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.inode_sb_list_add.new_inode.__shmem_get_inode
     44.63            +0.8       45.47        perf-profile.calltrace.cycles-pp.shmem_zero_setup.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
     44.62            +0.8       45.47        perf-profile.calltrace.cycles-pp.__shmem_file_setup.shmem_zero_setup.__mmap_new_vma.__mmap_region.do_mmap
     44.66            +0.8       45.51        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     44.66            +0.8       45.51        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     44.69            +0.8       45.53        perf-profile.calltrace.cycles-pp.__munmap
     44.78            +0.9       45.63        perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
     44.98            +0.9       45.84        perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.11            +0.9       45.97        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     45.09            +0.9       45.96        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     47.74            +0.9       48.66        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     47.74            +0.9       48.67        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
     47.80            +0.9       48.73        perf-profile.calltrace.cycles-pp.__mmap
      0.00            +2.1        2.11        perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup_desc
      0.00            +2.1        2.12        perf-profile.calltrace.cycles-pp.new_inode.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup_desc.__mmap_region
      0.00            +2.1        2.12        perf-profile.calltrace.cycles-pp.__shmem_get_inode.__shmem_file_setup.shmem_zero_setup_desc.__mmap_region.mmap_region
      0.00            +2.1        2.13        perf-profile.calltrace.cycles-pp.__shmem_file_setup.shmem_zero_setup_desc.__mmap_region.mmap_region.do_mmap
      0.00            +2.1        2.13        perf-profile.calltrace.cycles-pp.shmem_zero_setup_desc.__mmap_region.mmap_region.do_mmap.vm_mmap_pgoff
      5.24            -1.9        3.32        perf-profile.children.cycles-pp.stress_fd_lseek
     46.39            -1.3       45.13        perf-profile.children.cycles-pp.task_work_run
     46.73            -1.3       45.47        perf-profile.children.cycles-pp.shmem_zero_setup
     46.30            -1.3       45.04        perf-profile.children.cycles-pp.__dentry_kill
     46.48            -1.3       45.22        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     46.36            -1.3       45.11        perf-profile.children.cycles-pp.dput
     46.14            -1.3       44.88        perf-profile.children.cycles-pp.evict
     46.44            -1.2       45.20        perf-profile.children.cycles-pp.__fput
     47.02            -1.2       45.78        perf-profile.children.cycles-pp.__mmap_new_vma
     46.96            -1.2       45.72        perf-profile.children.cycles-pp.__munmap
     92.11            -0.4       91.71        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     92.39            -0.4       91.99        perf-profile.children.cycles-pp._raw_spin_lock
     97.69            -0.1       97.58        perf-profile.children.cycles-pp.do_syscall_64
     97.82            -0.1       97.71        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.__destroy_inode
      0.11            +0.0        0.12        perf-profile.children.cycles-pp.kthread
      0.11            +0.0        0.12        perf-profile.children.cycles-pp.ret_from_fork
      0.11            +0.0        0.12        perf-profile.children.cycles-pp.ret_from_fork_asm
      0.13            +0.0        0.14        perf-profile.children.cycles-pp.__fstat64
      0.17            +0.0        0.18        perf-profile.children.cycles-pp.__x64_sys_pselect6
      0.16            +0.0        0.17        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.08            +0.0        0.09        perf-profile.children.cycles-pp.generic_perform_write
      0.13            +0.0        0.14        perf-profile.children.cycles-pp.inet_listen
      0.13            +0.0        0.14        perf-profile.children.cycles-pp.mas_store_gfp
      0.08            +0.0        0.09        perf-profile.children.cycles-pp.mas_store_prealloc
      0.11 ±  3%      +0.0        0.12        perf-profile.children.cycles-pp.generic_file_write_iter
      0.14 ±  2%      +0.0        0.15        perf-profile.children.cycles-pp.mas_wr_node_store
      0.15            +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.perf_event_mmap_event
      0.38            +0.0        0.39        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.21            +0.0        0.22        perf-profile.children.cycles-pp.__x64_sys_fcntl
      0.08 ±  5%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.do_iter_readv_writev
      0.10            +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.21            +0.0        0.23 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.10            +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.13            +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.handle_softirqs
      0.12 ±  3%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.rcu_core
      0.12            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.alloc_inode
      0.12            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.rcu_do_batch
      0.67            +0.0        0.69        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.46            +0.0        0.48        perf-profile.children.cycles-pp.do_vmi_munmap
      0.44            +0.0        0.46        perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.48            +0.0        0.51        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.47            +0.0        0.50        perf-profile.children.cycles-pp.__vm_munmap
      0.47            +0.0        0.50        perf-profile.children.cycles-pp.__x64_sys_munmap
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.inode_init_always_gfp
      0.31 ±  4%      +0.0        0.34 ±  4%  perf-profile.children.cycles-pp.do_filp_open
      0.31 ±  5%      +0.0        0.34 ±  4%  perf-profile.children.cycles-pp.path_openat
      0.37 ±  4%      +0.0        0.40 ±  3%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.37 ±  4%      +0.0        0.40 ±  3%  perf-profile.children.cycles-pp.do_sys_openat2
      0.85            +0.0        0.89        perf-profile.children.cycles-pp.llseek
      2.40            +0.0        2.44        perf-profile.children.cycles-pp.mmap_region
      2.59            +0.1        2.64        perf-profile.children.cycles-pp.ksys_mmap_pgoff
     46.32            +0.8       47.16        perf-profile.children.cycles-pp.inode_sb_list_add
     46.44            +0.9       47.30        perf-profile.children.cycles-pp.new_inode
     46.54            +0.9       47.40        perf-profile.children.cycles-pp.__shmem_get_inode
     46.73            +0.9       47.60        perf-profile.children.cycles-pp.__shmem_file_setup
     47.37            +0.9       48.28        perf-profile.children.cycles-pp.__mmap_region
     47.64            +0.9       48.56        perf-profile.children.cycles-pp.do_mmap
     47.68            +0.9       48.60        perf-profile.children.cycles-pp.vm_mmap_pgoff
     47.83            +0.9       48.76        perf-profile.children.cycles-pp.__mmap
      0.00            +2.1        2.13        perf-profile.children.cycles-pp.shmem_zero_setup_desc
     91.71            -0.4       91.31        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.22            +0.0        0.23        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.30            +0.0        0.31        perf-profile.self.cycles-pp.do_syscall_64
      0.35            +0.0        0.36        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.47            +0.0        0.50        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

