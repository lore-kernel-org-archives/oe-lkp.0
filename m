Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CBE1758B
	for <oe-lkp@lists.linux.dev>; Thu, 22 May 2025 02:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879367; cv=fail; b=g/nYtwHW3Bkeiii9KAwQhIaEzl5kpXASQ+E3aSidTQ1nbF+O4hVuPp2JpEnoyst3ddyobmP7nzcAz8NINNSKrQ4XyADl6e0ZMiFmYfTjmVuUUP6lhtrUZHdYVqgVpNTHmuXbCNG6NzxhEtxkFnM4ayialeeKXhueqLYryG3jKfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879367; c=relaxed/simple;
	bh=ayQKZ5c5S2abfk38vwRmm2o3jXOENXCumQAcvVDu8qw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YXYdWmgta5VbV+DU2sQhAfAecvdRmn7cT7mJ9CH7u73oqBm5bUZ+pLpvDPfXnt5R3R4BJTbcOPxsOLcV8KTfzflZf6qqGS77BtdDYBd3CXUUiwHyt1/gjiSMh/ummbwBE2ggnw8jimF8OQlkwBiR5gs1OqnqwFtmg+bCEK4kRow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grt3bXQV; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grt3bXQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747879365; x=1779415365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayQKZ5c5S2abfk38vwRmm2o3jXOENXCumQAcvVDu8qw=;
  b=grt3bXQVztjryFh8rQ97RuVpS2h9fzZsTk8113N9PqddBv76d812B0M/
   Eb3wwKFAJcdzBLgJRgrjQF0biOIH5S5LbBVbFjRmboSMRjhX5KRaO2sXL
   YG8uUukIKdCt7K6p3MfnYujB8GdiI28wefKLQEqDyQzumEd40/ifaeKjz
   o+UyiLFzkMZI5pt98YDoRLfTGkPGhvVkLRuLuib1S7o3PeliTg03lurzO
   U3AfwhRBtxSNTSUFJiT4/X1yXQsOq0xjJgI/9WQFqee45xoPmiXFzUtvv
   ukflu9atS5zho1Br23F7hlJr7Rlpd+M739xRcR7wEtXdoAYDy+cgKDsbR
   w==;
X-CSE-ConnectionGUID: gVlgfzjOR4ivhCDmzLTOkw==
X-CSE-MsgGUID: XcvFU709SfmGDKUvAn4irQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60934011"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60934011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:02:42 -0700
X-CSE-ConnectionGUID: r3kTCsD7RvmltZqOYdXSfQ==
X-CSE-MsgGUID: vcCxO2NCTqyLuUv3e0xpAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145594437"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:02:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 19:02:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 19:02:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 19:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgEZRgk4ea2sNLyTTldqnj7zKxoM7Xlka6+8wIo8BjLK89v3Wv6ECCPY3tzuF/wGHxO0nmO/mIiAIyeaH/wI3Gz7c9+r9gooMXAi4DPG/a3A7Xh3cA0E5mL0NmLcanL/JrqP85ergTDhDUiUilSvxPeZUYNpULbcCyIv2HFMWU5JITvizT5Xg5Cwh+uKtMguDVXgbjvVqPXE5OdV4pPi/WJSunioscQPZdG/6gfAY+ZAoJajRyFVTHbkzuplnQfDfc03WUfVF9KpbD6pnP8y53Y6oGmnlyalGWokznAMv56KkNyut3efkxUywAKqn9WDJSYc6Hm86si7JoRLVD95UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrnB2RktVnNYrFLhZk62exQL/T6ZJmc6mKf5TsN509Y=;
 b=D4oQRZBV/DMcbUxzdXblgbHzq4bfg07XUZ5XEk46j/XSd5nwAZSEYGCw//kqSNBWquGmilEyezXBxG5zN22wUST+en/gG5Kgv4h47s7R7WupKAL3rQnd8J6eS4f5ponXAxUtuJ0Ii30b/xLmezDXazMzH/MsmxHvIfTqFApZbqAGOMtm4+ztnEIlE2iy1VcXhLbfyhH4lU1eZjFIw5L0P6b3MuFACapwAuOv4etDbOPZaFM/DiT/dpkJdPKoCWVwhDEd7p9XPTWWJcViV/F5GQIA/0RJ6ytUSgFJrA2aUrHsb52KDTpdEInmMyqEggr0refURL7WifJrvz+CiIISDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPF2B323C540.namprd11.prod.outlook.com (2603:10b6:f:fc02::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 02:02:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 02:02:22 +0000
Date: Thu, 22 May 2025 10:02:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <oliver.sang@intel.com>
Subject: [rgushchin:bpfoom.1.2] [mm]  efada76077:
 WARNING:at_mm/oom_kill.c:#out_of_memory
Message-ID: <202505220916.c8d76c92-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPF2B323C540:EE_
X-MS-Office365-Filtering-Correlation-Id: b715bc1c-d1d4-4300-b10b-08dd98d4b0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RgJwjPWhnqddmN7Hty+D3vJfGMdjabXSvkjQPzy4B+1FDUIAiRXeSJmYqkkQ?=
 =?us-ascii?Q?3ypTmWRW/dzx2LkAIwVL84wAZAwIrce0hAjm+7vlgGA49Sm0LfJonoW0/0RA?=
 =?us-ascii?Q?GnA8YxWMSlUwOpYbtRLPhoYqNjk019sj6bPTPXa4jN3fJYTNQDhnG4bcEwjO?=
 =?us-ascii?Q?JdT8SzJjIkoE6HnwKwiLj3MlQKFbxPmHrjNrZNz1eO1/7Tj2dFVPvCLtfxnx?=
 =?us-ascii?Q?ak2BFbvVEZq3f1vuqIWRLzoo3aD+rkVKxOrOI+KtnIHruHN2RHK/PbhoX92x?=
 =?us-ascii?Q?9uev56F4TlsCcM+GHrmdpnhz0ZOxWwTV9aCTghp02Cx01+aOvmi4JO6N53UI?=
 =?us-ascii?Q?hZF8+38ZQVnA56YlUl++2y7F2JoSZPzwwf3aLLtC+ktRVq8i8cUAIYpVrU8Y?=
 =?us-ascii?Q?r9DJspX3PIPr0feFU/TyA0nntykDjSihREg7BnMQ+OEVifeLlgf3pVyfgHZo?=
 =?us-ascii?Q?R/Us+KlqgTzx9tzErAreNmlzWhlZErrHI50YmWlXCNblBkbS6Wsk2VzENof3?=
 =?us-ascii?Q?ExZ5vsByoHbWzrTmzw41PYcRZrw5fQmYBzpmZlwvw5WaDjgYPNVEv81gWfSa?=
 =?us-ascii?Q?+GKizNVOiHOy++rtkwIRqXqVFtt0CZenp2mEO5kvqP4NTSst2NegSYusZi87?=
 =?us-ascii?Q?BSvAhjdUT3/gan+dLWAYPeRvvWqjGoOGX8C/+Ei3FBCO5ZTo958Ee8kiuOi9?=
 =?us-ascii?Q?/p7yQWsG4QhXIdLhtivIOgAwYL5cKd5103DupZFqRvsuiDnk+2VmFtMS8Zvm?=
 =?us-ascii?Q?gqfJNJs3ecmjos98eVwWySEBHM2UiU+pL02r6NxVc8ONIaSiT1cuMkj74S6h?=
 =?us-ascii?Q?Lwi5nG/ISD3KOjYFi5onzathGgfBEKObrX4/qxQY5CTWvFRW/rdY/QaP08K/?=
 =?us-ascii?Q?3fVUHsdUJJ+0KRQ454e4PjpnjbDZsRLeZSl03bt4KoU+afN5+FxBOdG1sEZZ?=
 =?us-ascii?Q?E9Tohj6Jf3HNmOxL/kXXcdPVgoVIfQiDU+2dboGbAy3bYAXAnnI2GYdjti6n?=
 =?us-ascii?Q?vjnkf3fQ8Ev61sFlJKoiT0tG+D6eL4nmjE8+Ed8ojxHDqmp0Cm0Fafp0LgIf?=
 =?us-ascii?Q?MNkGOJfUBvCOWBxoZY9yOR036OhVf5HEA10q3IfjHafzbcbVt01GP3leIqJO?=
 =?us-ascii?Q?MO8qBmRSX9vMvO4IBnmxW6GgFI8bxwWjCxdIe7Yp6aiPpCIUoh5bdBwJg8Qy?=
 =?us-ascii?Q?qYFoOL5bXOQLXffnIf0atrgt/Q21AkD5zcnztXXsXpm9crOrnIdJrXmqfbjZ?=
 =?us-ascii?Q?1CsaCzEb2RjOytvz/AI0CGhUMUdZa+DRpXXjZ4M6j8xmLoga3oNah7DovtmW?=
 =?us-ascii?Q?Odb3zytR1cCAQHgXd+NmEcyYF5imYnQ2wh2U7XYuETjln9oDJk5KGtz6g4do?=
 =?us-ascii?Q?2IjyMEK3Jkz3wFm2Foxf6JGhD6Xk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAe/3vtQFzOwecIVePw/97GvZSxt2x2JPoDlXZCYYxtf+nERPu27Ne44twwG?=
 =?us-ascii?Q?xMJCJ/Pq8/RhtcxLfkbXVYWLGyt1BJhptW7ImAfBVdepc25SedHDlMgFJiX3?=
 =?us-ascii?Q?QAzx2l1LTAijU9DypiwzzCmZEEvve75I+lgOIJWjXSvQii5RXnZTd7b+FIel?=
 =?us-ascii?Q?vlCIaLiK1wYiQoaOWoQEueCD7b8xtHz82mDmeQalInnWnjzh5jEnmL6tp9Ul?=
 =?us-ascii?Q?rfFcU1dQsIJd8l6demejHO0a3YnEe/Dzr77eGomKqxNCa4ZBFqxdNOE92Im8?=
 =?us-ascii?Q?j9JxTl0dNVrWl/rOiLnrtFFQOLB94YKBGV1MO2KLvijhy8fTRBYmkFtSzN4K?=
 =?us-ascii?Q?p1rdWpoi3CU/CsdXou3hFQTAcKaDTUHcvlDAqtfad1xGJyEM9RBNiWtQaJ3t?=
 =?us-ascii?Q?VrsmbAim7NTZsQmxXCfzDf36OsA2wn2ncps2H4aSquj1KHzGcrAmTuVDAVb7?=
 =?us-ascii?Q?E3EevOMbwFckCHOmXlR2bMSWR+XpMJ8YQ7SQb3hoPvvTt3YxXsJrA1vef4Xg?=
 =?us-ascii?Q?QKU7VF2kbio0xSbHvpSXEmChRMd/fRommo8qpUqz9e4sWF0jerU1S/8Q0wkD?=
 =?us-ascii?Q?/SH95nIZ/RiaMDxJ4GkCIo+Gy8d4AZeX5/cWYrAPvCej27+vZ15wMEYBnQlO?=
 =?us-ascii?Q?4HnMqokRdn8rzHkYRTcGDkH/9UpCVbkuvSSJ8Lt+hHeWKf19tRst0v6S9jEF?=
 =?us-ascii?Q?EjNGUTZTpikbhXG02Qi2jYJn4Voh1u+YaorTeBjg3DPkLzl8EZ4cRWjnC2Ic?=
 =?us-ascii?Q?CWy9Tjh+i7oXy5p/RpyGu6c40Fd+mf4aoR2VA5n/0+FugXGGbSsDGBemy8My?=
 =?us-ascii?Q?x047OPRVAiKwldUgODGLI6Ykp9DfFd0v58hHnbYFNPPF2TvO8APUkO6La2si?=
 =?us-ascii?Q?VdIiMWyGHJIjlrzl4NgIFgBJXrJHKzbN0ok5BUHemEA4WcCbiL7BQ32S+OPs?=
 =?us-ascii?Q?uRZx8HOLbm0vBap14lXeNclrBxAAUpgDYxFKVAZZJFc+RSCD4x+V4zTprLDI?=
 =?us-ascii?Q?Uo/KeL270kWbud9gcEDBelXACAjyqUltceQqI2ICfXyZF5uCCD0OnXWe4h88?=
 =?us-ascii?Q?UDP6F3t38Xd+KG0lizdzvbP9WTkpEBV38f5k220fNDLWaXOrbGNOduWKTgZI?=
 =?us-ascii?Q?WP77wKJI5itdKnELT9AfHE7gRTvJ4Z2/kt8GvGTCCsYeo1dP9YqAsb4vAMe3?=
 =?us-ascii?Q?88m2Hks6EawUs5wHDNej07OExlnAP4LZ66fXyTSyTqbZQpBYyNMbuoIx15HR?=
 =?us-ascii?Q?sBPWKjMtSAhV6MskQwyTELWlHoWlY2PxIEXxBywQ4BK9eAsfm5b/5NBAAZvG?=
 =?us-ascii?Q?bJn3NRAlH1UXvOKCXCpYgZRWu9pnZCnpJ7plAOn2b3AnPmNRnehF/fokeyn5?=
 =?us-ascii?Q?ZS+/MiMDYaGZnVCqkBbtQEEJXCBr6UGRfRmjDfrKdd5NEHDnoAKoR2b59+bl?=
 =?us-ascii?Q?b6UQdyUhmoD8AXjuGwibhP2amyQqw6lbBTn5mrgv+m/ak87GhLvMSr7fhrQz?=
 =?us-ascii?Q?UTdd1LPI92NyY0dXnrDefrQ6zsIp6VO0E+RCh7M3sVRA7oj7S/7Lc+vHy2Ft?=
 =?us-ascii?Q?o2M1hETprpVblPvt/AAtGB9gx21pgj9k6hdApws7rwFZ6GB/B20GhFmFVOdm?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b715bc1c-d1d4-4300-b10b-08dd98d4b0d6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 02:02:22.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KmfS+LbqlEAuiPbK2XnuMDPSppcWu6QpmKe7IiktTUvj2gHsGW10pBe5K31eXxDKafyrzIT5xNZRgl+uUMBGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2B323C540
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_mm/oom_kill.c:#out_of_memory" on:

commit: efada76077d88c1e913c4cbdeea367c5c3794116 ("mm: oom: introduce enum oom_type")
https://github.com/rgushchin/linux.git bpfoom.1.2

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



config: i386-randconfig-006-20250520
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | a5861bba13 | efada76077 |
+---------------------------------------------+------------+------------+
| WARNING:at_mm/oom_kill.c:#out_of_memory     | 0          | 12         |
| EIP:out_of_memory                           | 0          | 12         |
| WARNING:at_mm/oom_kill.c:#oom_evaluate_task | 0          | 12         |
| EIP:oom_evaluate_task                       | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505220916.c8d76c92-lkp@intel.com


[   44.737536][ T3785] ------------[ cut here ]------------
[ 44.738148][ T3785] WARNING: CPU: 1 PID: 3785 at mm/oom_kill.c:75 out_of_memory (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/oom_kill.c:75 kbuild/obj/consumer/i386-randconfig-006-20250520/mm/oom_kill.c:1118) 
[   44.738865][ T3785] Modules linked in: serio_raw
[   44.739317][ T3785] CPU: 1 UID: 65534 PID: 3785 Comm: trinity-c1 Not tainted 6.15.0-rc3-00066-gefada76077d8 #1 PREEMPTLAZY  582f84c824e065a65f55e068c89a045d2686e28e
[   44.741023][ T3785] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 44.742465][ T3785] EIP: out_of_memory (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/oom_kill.c:75 kbuild/obj/consumer/i386-randconfig-006-20250520/mm/oom_kill.c:1118) 
[ 44.743214][ T3785] Code: 5d c2 00 0f 85 7a ff ff ff c6 05 0f 38 5d c2 01 b9 84 7c fd c1 ba 65 03 00 00 b8 d2 80 fd c1 e8 d6 81 ed ff e9 5a ff ff ff 90 <0f> 0b e9 e5 fc ff ff 8d b4 26 00 00 00 00 66 90 89 d8 e8 49 e4 ff
All code
========
   0:	5d                   	pop    %rbp
   1:	c2 00 0f             	ret    $0xf00
   4:	85 7a ff             	test   %edi,-0x1(%rdx)
   7:	ff                   	(bad)
   8:	ff c6                	inc    %esi
   a:	05 0f 38 5d c2       	add    $0xc25d380f,%eax
   f:	01 b9 84 7c fd c1    	add    %edi,-0x3e02837c(%rcx)
  15:	ba 65 03 00 00       	mov    $0x365,%edx
  1a:	b8 d2 80 fd c1       	mov    $0xc1fd80d2,%eax
  1f:	e8 d6 81 ed ff       	call   0xffffffffffed81fa
  24:	e9 5a ff ff ff       	jmp    0xffffffffffffff83
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 e5 fc ff ff       	jmp    0xfffffffffffffd16
  31:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  38:	66 90                	xchg   %ax,%ax
  3a:	89 d8                	mov    %ebx,%eax
  3c:	e8                   	.byte 0xe8
  3d:	49 e4 ff             	rex.WB in $0xff,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 e5 fc ff ff       	jmp    0xfffffffffffffcec
   7:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   e:	66 90                	xchg   %ax,%ax
  10:	89 d8                	mov    %ebx,%eax
  12:	e8                   	.byte 0xe8
  13:	49 e4 ff             	rex.WB in $0xff,%al
[   44.749813][ T3785] EAX: 00000000 EBX: c61a7b50 ECX: 00000000 EDX: 00000000
[   44.752642][ T3785] ESI: c61a7b50 EDI: 00000003 EBP: c61a7afc ESP: c61a7af0
[   44.755257][ T3785] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010246
[   44.757972][ T3785] CR0: 80050033 CR2: 00000004 CR3: 049c2000 CR4: 000406d0
[   44.760505][ T3785] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   44.762967][ T3785] DR6: fffe0ff0 DR7: 00000400
[   44.764918][ T3785] Call Trace:
[ 44.766121][ T3785] __alloc_pages_slowpath+0x8f9/0xc90 
[ 44.769160][ T3785] ? find_held_lock (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/locking/lockdep.c:5348) 
[ 44.770986][ T3785] __alloc_frozen_pages_noprof (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/page_alloc.c:4984) 
[ 44.773128][ T3785] __folio_alloc_noprof (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/page_alloc.c:5006 kbuild/obj/consumer/i386-randconfig-006-20250520/mm/page_alloc.c:5015) 
[ 44.775082][ T3785] shmem_alloc_and_add_folio (kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/gfp.h:295 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/gfp.h:330 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/gfp.h:335 kbuild/obj/consumer/i386-randconfig-006-20250520/mm/shmem.c:1854 kbuild/obj/consumer/i386-randconfig-006-20250520/mm/shmem.c:1893) 
[ 44.776952][ T3785] shmem_get_folio_gfp (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/shmem.c:2533) 
[ 44.777747][ T3785] shmem_fallocate (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/shmem.c:3749) 
[ 44.778515][ T3785] ? lock_acquire (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/locking/lockdep.c:472 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/locking/lockdep.c:5868) 
[ 44.779215][ T3785] ? ksys_fallocate (kbuild/obj/consumer/i386-randconfig-006-20250520/fs/open.c:362) 
[ 44.779939][ T3785] ? kvm_sched_clock_read (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/kernel/kvmclock.c:91) 
[ 44.780722][ T3785] vfs_fallocate (kbuild/obj/consumer/i386-randconfig-006-20250520/fs/open.c:338) 
[ 44.781440][ T3785] ksys_fallocate (kbuild/obj/consumer/i386-randconfig-006-20250520/fs/open.c:362) 
[ 44.782151][ T3785] ? ksys_fallocate (kbuild/obj/consumer/i386-randconfig-006-20250520/fs/open.c:362) 
[ 44.782889][ T3785] __ia32_sys_ia32_fallocate (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/kernel/sys_ia32.c:119) 
[ 44.783740][ T3785] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:50) 
[ 44.784439][ T3785] do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:83 kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:259) 
[ 44.785189][ T3785] ? __lock_release+0x146/0x330 
[ 44.786008][ T3785] ? __task_pid_nr_ns (kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/rcupdate.h:341 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/rcupdate.h:871 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/pid.c:522) 
[ 44.786799][ T3785] ? syscall_exit_to_user_mode (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/entry/common.c:221) 
[ 44.787629][ T3785] ? do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:263) 
[ 44.788412][ T3785] ? lock_acquire (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/locking/lockdep.c:472 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/locking/lockdep.c:5868) 
[ 44.789114][ T3785] ? __task_pid_nr_ns (kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/rcupdate.h:331 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/rcupdate.h:841 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/pid.c:518) 
[ 44.789873][ T3785] ? find_held_lock (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/locking/lockdep.c:5348) 
[ 44.790598][ T3785] ? local_clock (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/include/asm/preempt.h:95 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/sched/clock.c:316) 
[ 44.791289][ T3785] ? __lock_release+0x146/0x330 
[ 44.792096][ T3785] ? __task_pid_nr_ns (kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/rcupdate.h:341 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/rcupdate.h:871 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/pid.c:522) 
[ 44.792839][ T3785] ? syscall_exit_to_user_mode (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/entry/common.c:221) 
[ 44.793651][ T3785] ? do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:263) 
[ 44.794438][ T3785] ? __might_fault (kbuild/obj/consumer/i386-randconfig-006-20250520/mm/memory.c:7151) 
[ 44.795154][ T3785] ? _copy_to_user (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/include/asm/uaccess_32.h:20 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/uaccess.h:197 kbuild/obj/consumer/i386-randconfig-006-20250520/lib/usercopy.c:26) 
[ 44.795878][ T3785] ? put_old_timespec32 (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/time/time.c:937 kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/time/time.c:973) 
[ 44.796693][ T3785] ? syscall_exit_to_user_mode (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/entry/common.c:221) 
[ 44.797511][ T3785] ? do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:263) 
[ 44.798282][ T3785] ? __f_unlock_pos (kbuild/obj/consumer/i386-randconfig-006-20250520/fs/file.c:1221) 
[ 44.798981][ T3785] ? ksys_read (kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/file.h:62 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/file.h:80 kbuild/obj/consumer/i386-randconfig-006-20250520/include/linux/file.h:85 kbuild/obj/consumer/i386-randconfig-006-20250520/fs/read_write.c:704) 
[ 44.799659][ T3785] ? syscall_exit_to_user_mode (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/entry/common.c:221) 
[ 44.804638][ T3785] ? do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:263) 
[ 44.805425][ T3785] ? do_int80_syscall_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/syscall_32.c:263) 
[ 44.806247][ T3785] ? irqentry_exit (kbuild/obj/consumer/i386-randconfig-006-20250520/kernel/entry/common.c:367) 
[ 44.806948][ T3785] ? exc_page_fault (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/mm/fault.c:1542) 
[ 44.807684][ T3785] entry_INT80_32 (kbuild/obj/consumer/i386-randconfig-006-20250520/arch/x86/entry/entry_32.S:945) 
[   44.808382][ T3785] EIP: 0x8097522
[ 44.809224][ T3785] Code: 89 c8 c3 90 8d 74 26 00 85 c0 c7 01 01 00 00 00 75 d8 a1 cc 3c ad 08 eb d1 66 90 66 90 66 90 66 90 66 90 66 90 66 90 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 10 a3 f4 3c ad 08 85
All code
========
   0:	89 c8                	mov    %ecx,%eax
   2:	c3                   	ret
   3:	90                   	nop
   4:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
   8:	85 c0                	test   %eax,%eax
   a:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
  10:	75 d8                	jne    0xffffffffffffffea
  12:	a1 cc 3c ad 08 eb d1 	movabs 0x9066d1eb08ad3ccc,%eax
  19:	66 90 
  1b:	66 90                	xchg   %ax,%ax
  1d:	66 90                	xchg   %ax,%ax
  1f:	66 90                	xchg   %ax,%ax
  21:	66 90                	xchg   %ax,%ax
  23:	66 90                	xchg   %ax,%ax
  25:	66 90                	xchg   %ax,%ax
  27:	90                   	nop
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  31:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
  38:	8b 10                	mov    (%rax),%edx
  3a:	a3                   	.byte 0xa3
  3b:	f4                   	hlt
  3c:	3c ad                	cmp    $0xad,%al
  3e:	08                   	.byte 0x8
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   7:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
   e:	8b 10                	mov    (%rax),%edx
  10:	a3                   	.byte 0xa3
  11:	f4                   	hlt
  12:	3c ad                	cmp    $0xad,%al
  14:	08                   	.byte 0x8
  15:	85                   	.byte 0x85


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250522/202505220916.c8d76c92-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

