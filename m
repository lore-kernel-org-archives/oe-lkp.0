Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00A307491
	for <oe-lkp@lists.linux.dev>; Mon, 24 Nov 2025 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991423; cv=fail; b=o7qZ13x87VrMgdR/ij++YMd3MtcbhAQO/M2Ciu9aeNE5ePDjRiENtNVPiTQSR2OGdj0u0bfVT6CzwqFxZXmGezE3tkBzMKHjKU0aFp7sU3W3rqwh/t9hcd4/DPoCxu9D1n9sQp/7uXrP9cHE/p6rAyDiFt9bhGuu632HMtO2GFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991423; c=relaxed/simple;
	bh=DjkGxun2/6bXQCHFtx+jWYWBgljPEtPufOZYevwGMo0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NfmZQuh8fsrrB9BDP9hSu+2YWKj6dKNztu1HW/m3UWAnAWfMXS1dOjkbkC/Zbbarntrc8n7jD0X3VcVsQE73R5P6SfewtjLgdY1O2mnl7fbWOTx6Jmjq6JekboTfBcGivbR2s3PRCEaz95D83RGIOQaSWPAADzsf+3lpRoyoSn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHEUNQ7+; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHEUNQ7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763991422; x=1795527422;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=DjkGxun2/6bXQCHFtx+jWYWBgljPEtPufOZYevwGMo0=;
  b=nHEUNQ7+7A3p19JU4H4m6cAeiG5ONLWkdS05mRB3gi7awSw7fYp5R8mK
   wq+5ol5DN5vMC+NhXy1aQ9gyvPv4zeRodehiL7fll7hdAZJkCTvLCGAox
   ekG25yt6idg4R2q27Nz86swH4DoB2AzbsL1fXggd7Ieomu2oeDuAZNabm
   rvUwyMYm/K0BB3oZtk4hcYBU+6K1Kg3ur2CMKfA53uGpu72Pl8XvsPI4P
   aTzqV4tWCVjPStEA1qqFN4quXSzGKNkoRIq51Ldo4ySZdrO4/AVnTdhoP
   iquWxe4DVSGAfWYZcnCjHeELl0WkyC6/J77PPeNFT1wlNptSOKaRVOfGs
   A==;
X-CSE-ConnectionGUID: cIyiQUKNQ2axOTM3/QaM/Q==
X-CSE-MsgGUID: niiHRxqzTSOSgRcF/lrJlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66149857"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="66149857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:37:01 -0800
X-CSE-ConnectionGUID: B936nDfUSW+AONoIBidXxg==
X-CSE-MsgGUID: ml+Vs8DbQgurQvJoQVgU3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191485001"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:37:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 05:37:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 05:37:00 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 05:36:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQwrU5O5hUH6VCRsdXi6R/mgZj3H58EQRDMMXl4h8LisI6y3PEFPVAMw5nq6sEoH8h2ca/ptKh3pZp8TX/YVn58xR45Z90mbeMJX+CKfSpOUBi6fXgJ0msEKDNa8NQS+MbFS8t74Mni2dfD1krLpoTTPeNVDM+2+azNlMouyRlvtaloDZRt54CB6f8YtdwtXukq3x1xMoErgUW/bYJH2BEg8SDLm+Rm4dV9UVausLRd+KqIi04ZlvuVwKLcWRhKs9McNJukDhMS6PICOZrX+XEQUo0+W79F/Tu1rShgFvtCbRfrdYs1VjxGai813SXyaHo6CeeL1FpaL1zTSKKT0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D90xFfN+OvzMSo5JpKHcL79Soe+mYAL+vi5o1sz2suY=;
 b=G43bpqqfB07hjg7cznn5beNpDmeo3lNEXY/bPSNtjO1uQMxogk7hc0Yx/2bv4jp7Ny4ts2u8xerKa4UNcJgD86FpIlDQqajngkMLEDfMrlOd/VHfOKOyBzqk08cnU2NE7gpy600yXHC4IfG6ER5r5KbZOaS6RtegC0Wey9+1f0CpXFVmvBKIZGu7pNM7TkanIJypgKuFxegjeh1JdnCFEWxv1fkA99M7LE3GY0CkYRGID6WxSLNRLc9fAZ6XvpIwKJLrt+EjSRF4WL0wTSRoJ1P3ykfgl4wLOZxlLGh1YF5uEMoJixKGtEmzq5nKvQkFB11TRxkoDgnirdvNs5lxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 24 Nov
 2025 13:36:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:36:52 +0000
Date: Mon, 24 Nov 2025 21:36:44 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mel Gorman <mgorman@techsingularity.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  e837456fdc:
 stress-ng.clock.ops_per_sec 3.4% regression
Message-ID: <202511242155.286a5a75-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL3PR11MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b1f67e-8164-4d31-fd09-08de2b5e86df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rAYHkovZR13nWFmJ/AO247tcudWWf+mHIkmmiuOb8pg7WCj/4iD/LbuqGU?=
 =?iso-8859-1?Q?+FLpZtS2JC8YcxWv3QZmhftOIUa9x25q8Ye/k2RoLYha1F3vEH/fnhXUGp?=
 =?iso-8859-1?Q?j9T3EC57nG40LMKK2vkw0VlHmYOec1usGsSaY1YTRT1hyzvQmvrIm/Gfqm?=
 =?iso-8859-1?Q?p7K5eiCe4l8xk8buf1Io8UF5uwQaGUI0Xc/G8J7KEgA6VNgdowWTe6rwCC?=
 =?iso-8859-1?Q?7s3liY7Jh790UKu7Tf4WufReT1PRiiiPocPURx84E5rVc3a51d9AOVnuxJ?=
 =?iso-8859-1?Q?ptVkIVpxNVQsZbWNx9p7v2GyNxftiyUWnebsGOaA8ZAtYMObUlVe4dADJU?=
 =?iso-8859-1?Q?q4DKjQ/kQ8bhSshMYZU9IYz5Fs7m0bHbcnX6uLCt2kfVvUdqj57x193Lbm?=
 =?iso-8859-1?Q?qcDnY6jPaQsmQ8dChGCIb//4c5i2hRgZyPd6KTW7YHbtjHQJfcpJZO1qJO?=
 =?iso-8859-1?Q?8NFEOsgNpaNPPb02LDK3WlL9al7U2NEz/ZURptuCFPos5xQXZmO6bDjL6A?=
 =?iso-8859-1?Q?ezCWsvgD//eYsLsYcPuj/E24JA5C6jlS2ArKRTXy/sfCDUMkTHN8zlVaNl?=
 =?iso-8859-1?Q?vYrYdv/w6RgyTWAWhLWnRRIYAnnBkVxwORfTHZAfLVM9G8d0U4hx7lvYda?=
 =?iso-8859-1?Q?NkE60c1gB1/IdrxLS0xeavJs+ftpd2uwdEh6uSu8TgSb4BgJAbxVhidkRF?=
 =?iso-8859-1?Q?Ote+mIeOCbTIbS6slkW4AEeDw/wLTBNSreTIKjbCDrgMCm1/MD4nvD+WF4?=
 =?iso-8859-1?Q?1Y2cfjLCXTdP4iyrj4KFwlx7/zzGG8PQkanDpPt9oSo4VQp6qObuBoCDch?=
 =?iso-8859-1?Q?nzcgBE7JoAP0+5ZBjsUWTgXNZ1LHm8cU7WGze8jRm++6d3UxMvzpdRFyFs?=
 =?iso-8859-1?Q?B70eT8VovFI5nxl6gM4ZOMAa/qpuNTos/9zifT9NqStwUHWf/1o01864OY?=
 =?iso-8859-1?Q?GXL5OwFhk2DB+B9KpqycFDeK19JWVCUHeIsxcLkoRZvLUmYmW8Uw1oWVfE?=
 =?iso-8859-1?Q?eFuFXnZg0SFNV72K3a3gdZRbNZLJGK/omDYrgPmOx/cp+FvJF13aXHkNmh?=
 =?iso-8859-1?Q?B7xjFbJ9BM2uhRlbS4PgodRFVgjtqnKMAu6yXqjGACWFVQoiycOSsAu7CD?=
 =?iso-8859-1?Q?0lQbVArOT8QUl86o1yh9F19gt0e5NvRToChHf0F0Sq3z7qVWuc4QVmPMIO?=
 =?iso-8859-1?Q?QjQ5Tg00WSZuXmE1r+AFm3Pyp2Kd7EO3mlfHS8CU/LaiMGc1eVO/wtUA6W?=
 =?iso-8859-1?Q?I6gymkC9iYoFqRodzrvz1+MVXaqXbiO6ROD93SQaURpg55WD1C+ZsE3bJe?=
 =?iso-8859-1?Q?Mmkj2X8z401WlhG5hQNXXUFmZwQCxwPRLEIcXBDnagD0qadGwim2uq0NQa?=
 =?iso-8859-1?Q?aDAdcnn/+hiK99kOqluvyGqmYFMxcr2lReyf9gaHxHppAFy9fgvQr1lrYM?=
 =?iso-8859-1?Q?Afd0UdcL87+H2/comWu9sAzZvfjhUes3tWRykwYy0ga4GarJmwM3TWpElY?=
 =?iso-8859-1?Q?IkL8f/TLttliehALOxAdYgUOG1jkFrCWxJ484yyKJ6bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gNmLLvllEvvGs0uuK+2Hpr2WPjqEZ9c+Rtx9eFghLeav+mreY3dqWpk9ld?=
 =?iso-8859-1?Q?n+0y8urw++5Zqz1uX07UkSfKD8jAUO8CotIm2WZnqFRsnXYgco3erkZ+9o?=
 =?iso-8859-1?Q?C7JjFiy1kUX8vI9LYYc8QwkAGsnVR+9JyADe3ci6T3lu5unQbdaqwqs5YC?=
 =?iso-8859-1?Q?ifopUjgiUiLtRXu9RtusTCOL/SxVeDq1Mf53bW24dGTAlAJFHQAKiE2S2R?=
 =?iso-8859-1?Q?hjo4sALeQHsMye8TO+y5iBgNNDJRjfTbPVYyTTbRuAwWh/Yhh0l0tB/RiR?=
 =?iso-8859-1?Q?TXwosZKiiwc6g19sNez/vjEEoJEOib4C5PjkD3ehDdnT3x/qti0xMBJKiH?=
 =?iso-8859-1?Q?8+cuG6Htj9IVuvVr56OZtBD6mx7+hzcIP9w0AvkbOtSFIlRVj2km0POvJm?=
 =?iso-8859-1?Q?0V4cBebTF7kzRpKue8yZbh82S3cZZ45FiQTw5xq7dvXssCtJ1vEo7JD++1?=
 =?iso-8859-1?Q?gcPoIpwCe/jwreGPA28DbqYdCOdwzxYi9f5eQPxmbqTiZGVE1QXAf/Gf4t?=
 =?iso-8859-1?Q?ty7Xx93SeuXJZm8TadCSpb0IXK2rfjs/Dp+mHawolwPW8iEaKFR+6j40Hr?=
 =?iso-8859-1?Q?8uV2JavgerR9zR3sP0WTduFpMTC1T/qxG72CwDkH8w3c2CHYJGlj2CHdGW?=
 =?iso-8859-1?Q?+t0XJy72bAuzyCPe3vOPjf9NJ1AslGC6O2Uo1y4U1udwlihSu3c3yotXdU?=
 =?iso-8859-1?Q?4lkBJFqR5uNu/kzTtF50NuZaiJsYqgdCIqZ1Zb3tds6WvLjIN1O5tjUxw3?=
 =?iso-8859-1?Q?r76NiDH/VppHB9rvSkN0kIH9HFWFJAwi6MlAh5QQpN5TRnj2a+pls7I0O1?=
 =?iso-8859-1?Q?c8RCLMjripBZpuFyNHC1XxIVzh0qY2/3lktvz7EXvVxefVTXLavXPI10Zp?=
 =?iso-8859-1?Q?B/iSs0surYyx3ZIF1fF+mkJaMIndkNGSm/cKoZVR8jMQFlh/w0WUZMZDqO?=
 =?iso-8859-1?Q?66zZGyjh7j2S4YkYjuxo1zScqXgi5WQaLgAzvaBaJzg96w18p/07L+m0aE?=
 =?iso-8859-1?Q?WUqhqXp/oz9oI+oAAVqbrHeExWPzpC1CBFZBsqfNvY4sXS/DoH27nNJENZ?=
 =?iso-8859-1?Q?2xObDTQWMDcs8kozTZ3zLUpxdeY8ywGZ3mObzrO5d7FaEMDucqyJheTcqc?=
 =?iso-8859-1?Q?L8id0Ij3IBKjwrds18xTRiblYvfaIEMAOTQMmfyJmfop7GsBZNFyOmuSmb?=
 =?iso-8859-1?Q?9CESYFwHnEGWr6k/PIB9z/KwVHvuZABsVXwRTJYM/zXluEcrepbw4ngF19?=
 =?iso-8859-1?Q?eCeu5jy4kli59kj96bs9p06Pyf32jIG5XLD+eKnXvM3TwNHpBEJCPfspct?=
 =?iso-8859-1?Q?L7EPEfLyQmjm4jNgMTGVAX7kAMVu3cbV6Di1P6gjCBz95Bj18d/MxWXP3w?=
 =?iso-8859-1?Q?5tUrqE15Y4UYtijUScc7MQz1TEAxOAVTn4usGormPZaS/s5M/T4RBckgZX?=
 =?iso-8859-1?Q?SweI6/pSi6XwU5twSDaiSW7et6qVfsML78eEZQiphICbCxeYQg9JAD++iE?=
 =?iso-8859-1?Q?uqKEBaf8AajuHq+DW8brKGb+/8GN645YL9oPpTZCPTE49O50/w1f9ORDZq?=
 =?iso-8859-1?Q?d4NbXnrmMrM0sleMn9T7wY5fcMCIm/8UM0laiQ1xnvlxP1UMyMkUutCzqB?=
 =?iso-8859-1?Q?0cuwk4kRkZas6HUsrANwzoWVPDvFg03LXxkgkuzOunBlKE0pJ4DEfpuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b1f67e-8164-4d31-fd09-08de2b5e86df
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 13:36:52.4648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvlzXHXIegC99WHEH2NOKZIHxf6v91NPWWQVReAcfD7v7Inid8adgsWi2PwEzjYdZKFNvBiGHWa9FXa/Fgx8hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6435
X-OriginatorOrg: intel.com



Hello,


we reported an improvement in pts tests (also included in this report). now we
notice a small regression in stress-ng tests. just FYI.


kernel test robot noticed a 3.4% regression of stress-ng.clock.ops_per_sec on:


commit: e837456fdca81899a3c8e47b3fd39e30eae6e291 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 64G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: clock
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | pts: pts.quadray.1.1080p.fps 23.2% improvement                                                |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | need_x=true                                                                                   |
|                  | option_a=5                                                                                    |
|                  | option_b=1080p                                                                                |
|                  | test=quadray-1.0.0                                                                            |
+------------------+-----------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511242155.286a5a75-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251124/202511242155.286a5a75-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp4/clock/stress-ng/60s

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.032e+09 ±  3%     +28.0%  1.321e+09 ±  2%  cpuidle..time
    897841 ±  5%     -15.0%     763285 ±  7%  numa-numastat.node0.local_node
    896471 ±  5%     -14.8%     763770 ±  7%  numa-vmstat.node0.numa_local
     45743            +1.1%      46225        proc-vmstat.nr_kernel_stack
      5.60            +2.0        7.57        mpstat.cpu.all.idle%
      0.77 ±  3%      +0.1        0.90        mpstat.cpu.all.irq%
     59739 ±  2%     -11.1%      53102 ±  4%  perf-c2c.HITM.local
     17302 ±  2%      -9.8%      15614 ±  3%  perf-c2c.HITM.remote
     77041 ±  2%     -10.8%      68716 ±  3%  perf-c2c.HITM.total
   5452857            -3.4%    5269019        stress-ng.clock.ops
     90934            -3.4%      87863        stress-ng.clock.ops_per_sec
     84662           +20.6%     102102 ±  3%  stress-ng.time.involuntary_context_switches
     24199            -2.3%      23648        stress-ng.time.percent_of_cpu_this_job_got
     14530            -2.3%      14199        stress-ng.time.system_time
      0.30 ± 44%      +0.1        0.40        turbostat.C1%
      0.95 ± 44%      +0.4        1.34 ±  3%  turbostat.C1E%
      2.01 ± 44%      +2.2        4.17 ±  3%  turbostat.C6%
      0.36 ± 44%    +121.2%       0.80 ±  4%  turbostat.CPU%c1
      2.07 ± 48%     +62.7%       3.37 ±  2%  turbostat.CPU%c6
     75763           -10.4%      67848        sched_debug.cfs_rq:/.avg_vruntime.avg
     33867 ±  4%     -15.8%      28530 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.min
     75459           -10.4%      67579        sched_debug.cfs_rq:/.zero_vruntime.avg
     33783 ±  4%     -16.3%      28291 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.min
    110597 ± 16%     +41.9%     156958 ± 12%  sched_debug.cpu.max_idle_balance_cost.stddev
    -36.17           -30.4%     -25.17        sched_debug.cpu.nr_uninterruptible.min
     14.46 ±  6%     -20.0%      11.57 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
 4.239e+10            -2.3%   4.14e+10        perf-stat.i.branch-instructions
      0.08            +0.0        0.08        perf-stat.i.branch-miss-rate%
  33247700            +2.5%   34067265        perf-stat.i.branch-misses
     28.18            -0.8       27.42        perf-stat.i.cache-miss-rate%
  90091009            -3.5%   86913480        perf-stat.i.cache-misses
 3.205e+08            -1.0%  3.175e+08        perf-stat.i.cache-references
 8.768e+11            -2.2%  8.572e+11        perf-stat.i.cpu-cycles
      1621            -8.3%       1486        perf-stat.i.cpu-migrations
      9765            +1.6%       9920        perf-stat.i.cycles-between-cache-misses
 2.121e+11            -2.4%   2.07e+11        perf-stat.i.instructions
      0.42            -1.2%       0.42        perf-stat.overall.MPKI
      0.08            +0.0        0.08        perf-stat.overall.branch-miss-rate%
     28.11            -0.7       27.37        perf-stat.overall.cache-miss-rate%
      9732            +1.4%       9867        perf-stat.overall.cycles-between-cache-misses
 4.168e+10            -2.3%   4.07e+10        perf-stat.ps.branch-instructions
  32683973            +2.4%   33483421        perf-stat.ps.branch-misses
  88576640            -3.6%   85423812        perf-stat.ps.cache-misses
 3.151e+08            -0.9%  3.121e+08        perf-stat.ps.cache-references
  8.62e+11            -2.2%  8.429e+11        perf-stat.ps.cpu-cycles
      1594            -8.2%       1463        perf-stat.ps.cpu-migrations
 2.085e+11            -2.4%  2.036e+11        perf-stat.ps.instructions
 1.262e+13            -2.3%  1.233e+13        perf-stat.total.instructions


***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/true/5/1080p/debian-12-x86_64-phoronix/lkp-csl-2sp7/quadray-1.0.0/pts

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  15179434 ± 18%     +51.8%   23046485 ± 15%  meminfo.DirectMap2M
      0.37            +0.0        0.41        mpstat.cpu.all.sys%
   1055135 ± 31%     -53.4%     492047 ± 91%  numa-meminfo.node0.Shmem
    263798 ± 31%     -53.4%     122995 ± 91%  numa-vmstat.node0.nr_shmem
     21104            +9.2%      23039        vmstat.system.cs
    371194            +1.8%     378021        proc-vmstat.nr_shmem
      4628            +2.9%       4762        proc-vmstat.numa_huge_pte_updates
     18161 ±  6%     +22.2%      22195 ± 11%  sched_debug.cfs_rq:/system.slice.avg_vruntime.stddev
     18051 ±  6%     +22.4%      22090 ± 11%  sched_debug.cfs_rq:/system.slice.zero_vruntime.stddev
     16231           +11.2%      18053        sched_debug.cpu.nr_switches.avg
      6.26 ± 10%     -19.7%       5.03 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
     39.69 ±  2%     +23.2%      48.89        pts.quadray.1.1080p.fps
      3245            +2.4%       3323        pts.time.percent_of_cpu_this_job_got
     39.97 ±  2%     +14.1%      45.62        pts.time.system_time
      4456            +2.2%       4555        pts.time.user_time
   1290701            +9.9%    1419060        pts.time.voluntary_context_switches
  6.13e+09            +2.8%  6.299e+09        perf-stat.i.branch-instructions
     21517            +9.0%      23449        perf-stat.i.context-switches
 6.949e+10            +2.3%  7.108e+10        perf-stat.i.cpu-cycles
    203.07            +7.8%     218.95        perf-stat.i.cpu-migrations
      8980 ±  2%      -7.8%       8279        perf-stat.i.cycles-between-cache-misses
 2.515e+10            +2.9%  2.589e+10        perf-stat.i.dTLB-loads
  8.21e+09            +2.7%  8.429e+09        perf-stat.i.dTLB-stores
 6.904e+10            +2.9%  7.102e+10        perf-stat.i.instructions
      0.72            +2.3%       0.74        perf-stat.i.metric.GHz
    514.91 ±  2%      -9.4%     466.42 ±  5%  perf-stat.i.metric.K/sec
    412.78            +2.9%     424.58        perf-stat.i.metric.M/sec
    372305 ±  2%     +20.8%     449603 ±  5%  perf-stat.i.node-store-misses
      1.81            -0.0        1.77        perf-stat.overall.branch-miss-rate%
     57.23 ±  2%      +4.3       61.51 ±  3%  perf-stat.overall.node-store-miss-rate%
 6.085e+09            +2.8%  6.254e+09        perf-stat.ps.branch-instructions
     21348            +9.0%      23273        perf-stat.ps.context-switches
   6.9e+10            +2.3%  7.059e+10        perf-stat.ps.cpu-cycles
    201.61            +7.8%     217.38        perf-stat.ps.cpu-migrations
 2.498e+10            +2.9%  2.571e+10        perf-stat.ps.dTLB-loads
 8.154e+09            +2.7%  8.373e+09        perf-stat.ps.dTLB-stores
 6.855e+10            +2.9%  7.053e+10        perf-stat.ps.instructions
    369608 ±  2%     +20.8%     446351 ±  5%  perf-stat.ps.node-store-misses
 9.519e+12            +3.0%  9.803e+12        perf-stat.total.instructions
      0.00 ±223%   +1490.9%       0.03 ±109%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±  9%     -94.7%       0.00 ±111%  perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.06 ± 21%     -86.5%       0.01 ± 17%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.12 ± 31%     -89.2%       0.01 ± 68%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.06 ± 67%     -67.6%       0.02 ± 40%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.03 ±  2%     -36.3%       0.02 ±  3%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      0.21 ± 12%     -87.8%       0.03 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.05 ± 14%     -78.5%       0.01 ± 14%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      0.03 ± 43%     -70.0%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.22 ± 56%     -94.6%       0.01 ± 41%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
      0.02 ± 27%     -54.8%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ±223%   +3636.4%       0.07 ±169%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.11 ± 92%     -98.3%       0.02 ± 11%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.06 ±  6%     -98.4%       0.03 ± 15%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      3.22 ±  4%     -63.6%       1.17 ± 98%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.67 ±129%    +808.5%       6.12 ± 52%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%   +4066.7%       0.04 ±153%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.02 ± 32%    +715.6%       0.12 ±149%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      2.22 ± 14%     -43.5%       1.25 ± 30%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      1.84 ± 48%     -91.5%       0.16 ±169%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      1.68 ± 55%     -94.8%       0.09 ±164%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
      0.35 ±130%     -93.5%       0.02 ± 25%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      1.34 ± 35%     -97.2%       0.04 ± 48%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.03 ±  3%     -37.6%       0.02 ±  3%  perf-sched.total_sch_delay.average.ms
      8.33 ±  4%     -18.9%       6.76 ±  3%  perf-sched.total_wait_and_delay.average.ms
    162856           +20.3%     195924        perf-sched.total_wait_and_delay.count.ms
      8.30 ±  4%     -18.8%       6.74 ±  3%  perf-sched.total_wait_time.average.ms
    213.84 ± 51%     -87.7%      26.25 ± 77%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     15.84 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    800.53           -15.3%     677.82 ± 13%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2.37 ±  2%     -21.9%       1.85        perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.38 ±  9%     -51.8%       0.67 ± 42%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     38.24 ±  7%     -12.2%      33.58 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     61.60 ±  3%     -24.2%      46.70 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     13.33 ± 24%    +217.5%      42.33 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.33 ±141%   +5300.0%      18.00 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    196.50 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    152066 ±  2%     +19.5%     181763        perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
      1290 ±  6%     +27.7%       1647 ± 12%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    272.83           +16.9%     319.00 ±  2%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    238.33 ±  4%     +24.8%     297.33        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      2356 ± 47%     -66.5%     788.64 ± 92%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     44.95 ±147%   +2131.0%       1002 ± 69%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     59.34 ± 41%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.01 ±146%  +30486.1%       1.84 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
    213.84 ± 51%     -87.7%      26.25 ± 77%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     15.82 ±  2%     -96.0%       0.63 ± 66%  perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    800.27           -15.3%     677.81 ± 13%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.61 ±  5%     +15.0%       0.70 ±  7%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.34 ±  2%     -21.8%       1.83        perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.05 ±  2%    +199.9%       3.15        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.11 ± 17%   +1066.9%       1.23 ± 12%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.47 ± 38%    +148.3%       1.17 ± 30%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     38.23 ±  7%     -12.2%      33.58 ±  7%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     61.57 ±  3%     -24.2%      46.69 ±  2%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.00 ± 49%   +5108.3%       0.10 ± 73%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.01 ±142%  +28030.6%       2.30 ± 23%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      2356 ± 47%     -66.5%     788.64 ± 92%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     45.07 ±146%   +2125.3%       1002 ± 69%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     11.69 ±  6%     -17.3%       9.67 ±  9%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
    237.73 ±143%    +561.4%       1572 ± 61%  perf-sched.wait_time.max.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      3.69 ±  4%   +1614.4%      63.33 ± 48%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      3.90 ± 26%    +959.8%      41.38 ±100%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.04 ± 50%   +5947.9%       2.19 ± 52%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

