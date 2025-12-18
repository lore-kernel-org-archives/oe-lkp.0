Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB62DECC2
	for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 05:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766034012; cv=fail; b=gCnMmCUsWGkN+KffWUuYyF3p4eXDidFTcpIS1iQ8zJnxcvfZafbvp1ZP7DeO5W9yOXUWxJwwlnF5C5SQqaPg1F07+L1wUjHcCFW3AzeQ27ncrMa22NuzojH1+s8gCIQkkRUApSo9eOm/Blthr8jNw/+8Yq8IdFQQdNoS2/Jb2qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766034012; c=relaxed/simple;
	bh=QxwCP1Rix1LD7uxpCVPRwerXSaTl3TM90Qdf+93SRI8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Nm8UqEpsQtqgbngR5ChbbG1TSUMuGCtWVrmS7xmFdyEJPfZrrwBvuAnuvIDmFypkyk6VzOrN6tkR1k2bwCpRiPgfMA4qKR94SMgFC5GVkxtpbodIAB/4grzZqr0wC36q1s+J/LU4ALEvtoEub5wbRyRWcjWY/0zfiVt5ZoylDnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdP7bkRx; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdP7bkRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766034011; x=1797570011;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=QxwCP1Rix1LD7uxpCVPRwerXSaTl3TM90Qdf+93SRI8=;
  b=UdP7bkRxxLoA/9Hfi80dbMIOyN7yj3YcgczZNdeTmw6HR2faBw2lduXb
   eCaTd2MGdXInN6ZRUtuTtis0xuWjrivKZun0YbS3HXLxEuecO2C2AeAlE
   o+0zZg2Fn9yxBaBwVsTjLmZBFkcC1KfZj0eVUvu9+gAX9+L4QE1RzYEQR
   7LVSPKVEr7RYf+2lUHvWWqEY/iaLwwlUoLcq+FMd3Sn7tIALzsoKJzZz3
   VmjQw4RLl7fIEBJS3ryeKvAPbKM2bUKt4wppdeUNWPYxvTf/xwin7exFR
   n8wsbLHEHeS0y5njLb0O8E4Kn4bM1VTgdlN8mQd2A2AB658jCB1H5Geko
   g==;
X-CSE-ConnectionGUID: NzKUQucUTd6hOZjVVldexw==
X-CSE-MsgGUID: 0cU5y2DsTMuk/1RXv5TKtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67873732"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67873732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:00:10 -0800
X-CSE-ConnectionGUID: nz6bl34KS5u48BPhhgKqgg==
X-CSE-MsgGUID: Uv/b+LStTpSjPGPrqCoyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="197746666"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:00:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 21:00:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 21:00:08 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 21:00:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMOkjI7D1acb7aiJKEY4eshf99ipZrYrJEmo/z/dsPr6fM2Y0yt9Lzi2PU7VRGF1lvfZfPAoyig1MbjrgFFDMfStFDBtdmiXheqfnqVdDmnJHxpysuOFQGp1t8SJxN0qw8TipMuqewltkDXVx3I+yHKSA1D/A6KYIBfT9OXRKqk1oaZ9vh6xlqiY+f8dM7niv0LcS0eSL9QBn1wtJ5hJpp4W7LJJMp21vfO9scw0WaSW6cvYLlVvIE4MPwIH3dAhbEo40KBYUbJ1f9aceR1i/lZNRVuRaauwdUUMatRX2JjEK4WJS53eeB867Lb9OKp3UIxBTWy15jIctNt4xvrIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dTOXP3DrfjgeSdiBUWR95Q6aWE+gM1obehY6ZSjmxc=;
 b=GfEN/4BD258u4gdDPk7WEr2KH2HajVoSVYZuQ4HfCpFUEFPUilCOKP1FqA1vMRUEgaunx3qn+0D9HYC8s/GjLeZJOyVMD1shBn5wM7Xh/OxyGBxQbaKtOy/YRbhHf9g0n3kMy7q6qOu4N7ATlhe/mY+wIj3K/nkh2bkD8gsXhmA+KuW+L8UZkT9kGInaY8slJgKHZvU5kByQdtRRqP25mmnopsbb9Pg3oKE+AAL3csMb/3it0OsYc/0GxPVlBDuj0f3gn23FDR+eD/kAR+7XNDxFdv8YrHXAMGkdmbgixBqpi1u5zKkJjw7+/TmzsrdqfCF4kfOfmL2jd2qFysIEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 05:00:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:00:05 +0000
Date: Thu, 18 Dec 2025 12:59:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds
	<torvalds@linux-foundation.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>, "Shrikanth
 Hegde" <sshegde@linux.ibm.com>, Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  089d84203a:
 pts.schbench.32.usec,_99.9th_latency_percentile 52.4% regression
Message-ID: <202512181208.753b9f6e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: eca3e42b-acac-420b-ffce-08de3df24ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xqZvOUHi0sw8j0QoH+HoA67ckQ5V6CTe3hK079xB8cgLJ3bjYr1GTMsEge?=
 =?iso-8859-1?Q?7kjKaiZOz6svJGCs5YOGnzMbpP0nGzg4unYAdt3SDKVkDqSFIf8WtD2jkr?=
 =?iso-8859-1?Q?dmJnRSHBpnlp9hNj+QZWu12KKZHi8Jed4rGq4K1upLdPlNWmcXmcl9M8/M?=
 =?iso-8859-1?Q?zuUNiqAH2gECl87MLxEw+PnzVdL1+lRPrmCun2y/SIpNe3bNkPIFvtcaFU?=
 =?iso-8859-1?Q?5XAeItQt6NGU8k89nAxs8+vYC2INK6GgR0LvnIOPUa1zrKcOeLUxGDizG+?=
 =?iso-8859-1?Q?MziKsgVIyGDl/G6MTE5f6O2ZH34BU/DWPq2zHx1tDLTZ3eoniKRBZSpI7B?=
 =?iso-8859-1?Q?I69JZgW3ktaUKJ+q1/axTdKRDDihV84WrVTCtsz5hQOoNUaPkktzM7a7D4?=
 =?iso-8859-1?Q?Pd0ccGuT9oeYRfuUrbeN+xtXgluYa6TyO3pePimNXJ+xjAWPW1py+E9pIX?=
 =?iso-8859-1?Q?HCQHLfiDuw9E8VIf/TaBH5FwENAVxiH6qDMX5Xt6QUJLDSIpaq+6NUEB1B?=
 =?iso-8859-1?Q?A8AEvtdY7x80FYYPyAC+uw8v56Fft94EYVIPAZ47M80Nt6nxvhT9aF87Md?=
 =?iso-8859-1?Q?380W3p6fLLP0sOFacuiCfGxQ8Abt+Iru4kFl1didRd4iIKu4rt4BoclZbC?=
 =?iso-8859-1?Q?goo0QweBRBI15M4s87lUDuZNEi5ulDUXs8yoIxtEyuEUgDkmOBf6UZbydT?=
 =?iso-8859-1?Q?Gix7xvvGdsWVjPhmsB2BT9fZ6xVBl/0pFBvlXjt5RrqrOXYfuY/wkYn0Fi?=
 =?iso-8859-1?Q?wnEpUYDkPhwJ6/JPU1MaFRgv/raw6lIK7HGfdKgTiVflkQuxwrQdKWiWar?=
 =?iso-8859-1?Q?7U+EuCHM1qJS/Gg6vUqnB4v2+JaYYYcpUT3O5qlhRJcCgJ6zMuhD29pXGA?=
 =?iso-8859-1?Q?UwzMolkPSyXbkGyMyN5CXfeV41p/tw5VYsHBh+0dfE3sowC4gHpi9vgfTo?=
 =?iso-8859-1?Q?z7FquUZYgXdiMCJ6HaX7rqqaOtdpesKBEnaswQWrlPBAeGyCdWJH9kqYkO?=
 =?iso-8859-1?Q?0ynNO4YFpRlvzrygXjc5ylgvJ8Td7lj6xz56STVf5K/3PWxAtowMaBn9cI?=
 =?iso-8859-1?Q?WlzYqpl6rlyFJnt1VcFNjarUbvHQOg2kzdr5NsppX4X/zI6vIWZ0L7cTv6?=
 =?iso-8859-1?Q?HzVREYDub3BzxCOIWrIeaK3hz4OvMJg8hcS3/I8/3qjj80lEl0EOngJ4j5?=
 =?iso-8859-1?Q?wNNPKGCyYgZrNNpkH9YDH0ZDdhjxU++VS7HJvJ3a2cM30PXxOYYZzhfZya?=
 =?iso-8859-1?Q?WvrZgivFd9QwBDAbJvqCxIpwM3rfUTQpmz7fVDFqqE/ZcTLoRqawTqKn45?=
 =?iso-8859-1?Q?j0V1eDPE26jmrDKYIB7kOFbkqDzboILXiqL91jyvg7BAyWGCfzMuIylvDU?=
 =?iso-8859-1?Q?C0fybcuELA7y+SQis3aI1TYN/CmYShYGFxT0s+HwrfTXSXUzzAlrqZ7XXG?=
 =?iso-8859-1?Q?xmGG248wYx8fjduAg2W+7DxQIuKKdxHqrkfGsb9mqdG9+I6EUBWaVeYcOd?=
 =?iso-8859-1?Q?xCkkPot6QJUqCFtpeA3I/BRiZMLd29xSDmZmsGBvC6Lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A+1DxJ/aTd3Jn5M1zU6hRWXMn92JrGegQ+4abhBLo5SZECrySQzYbU+2/E?=
 =?iso-8859-1?Q?wXFFcSellyaWtiaG0+cD8a5TCCtmx5n0u7gDe0JJxfrBthBWSiDZkXGYbt?=
 =?iso-8859-1?Q?ApgJUUEGykSkzhVyjM+xl/f2FsZdkRGnttAiVvy5mcKnRk2bMj3IX57HUA?=
 =?iso-8859-1?Q?57/7f6HFyhHmZvB/U6+3sL78h/zXADmtPmf52Tyl1i0HzlIXlBR0Bkuxh2?=
 =?iso-8859-1?Q?6Dtn4dBRfI993dNtcDuCja0xVfW9h8bPjKGwEhOlRl724gX2dK9F5/gUVd?=
 =?iso-8859-1?Q?1ItMKLQoJLLPXL3nzFhMi7oXoD2ohfqjTkIWQS9N3uTAacfYwwbDkgBdcR?=
 =?iso-8859-1?Q?THNwC5u+oOVN53kopPENPhUyoVX2TH8BNoiGYy7QTe9wzrgCgOwldb53I7?=
 =?iso-8859-1?Q?p860xRGa0R7P4UfcT7G7OA37LtkvjktMRRAmJyIZjMy9qUB1vtdq4ryS89?=
 =?iso-8859-1?Q?uKuqrst8ban41CQzvSsUtc1+MUsma4dyrfU+1V6VCyBckIgjP8KRWNPwFy?=
 =?iso-8859-1?Q?4BJWtdkM2PxEWe9jf3fjs4TXD07kLUhyWMSDGk9SVr8yGVGoH8GirjeM9H?=
 =?iso-8859-1?Q?7YmpGMPiCGyTBleDxzvWoGv+w6DfnNsgn2cXdsMZz2JP4PxhAo4BvZmzEe?=
 =?iso-8859-1?Q?DmJcL9B5qQc1uGq1rBSSxD5mN/Oo1ZQMHjpS3lNeWIN+VTbnFpnEZvS/2u?=
 =?iso-8859-1?Q?nWD8js8x8imGBceyn57/XhLHhzHgk7wRW8ChcFJ3yCE2QuwKzJfJvRsYci?=
 =?iso-8859-1?Q?6b3aAjqY3ysbvn7CAo8CFKu/r5GMcp0zH4rpkr+HLTJv3bmp6nQ6gEBVdy?=
 =?iso-8859-1?Q?PvzC6iEXPfFCh0Tjf+GjYCMF+sFyiMl0EAGZCaAuM6n1kFUlEmxq0R52mD?=
 =?iso-8859-1?Q?0mjaWzh4u5r0nBBeb0sYSmJ7lFk5rOtWKhFMAEli+TzqojOY9xGOLIIH/4?=
 =?iso-8859-1?Q?NKGHsUAJHsaIwKbl04NopYGE0tGVQDQRPxFJQM43a2eZR1I7kRNFTRdJz4?=
 =?iso-8859-1?Q?QoCEB8IPRRM4u3WS7JrWG7VScQFpswWUp6cR9SdBOMq7TALisom9lDEeBA?=
 =?iso-8859-1?Q?NN4GwFTjvk/fh0f17os69aO8VBf8uDVcWQXGVXA6JGAzNmjoVC32NuZumu?=
 =?iso-8859-1?Q?Rh9RGVQ95Sc7TF6+DyW+qaRIZzFmdeOC2KRkGexIMe4A4yKuO3liKUuKoC?=
 =?iso-8859-1?Q?cI0YPYLlbTEvKfuI6+33rBdbTmn3ziBA+UqrDs0OA4tDJ0hhZOQ/0S46J7?=
 =?iso-8859-1?Q?DQ2cKpjtQ6fNmnV/AIvQfjt1dMsTwINUDSylwY6QlKld4QcHcGVNZMOxjC?=
 =?iso-8859-1?Q?Tux3/CEeg3JQ6RAnK5ips8WrVCJZzKXKkVjLfLOpacsFJKJZl5v/2j4kNA?=
 =?iso-8859-1?Q?+pCccingtJ80WsVsGlityJdIqz3HvvKZHUcx96pvgzdMvtEHrDl3GJ8zpo?=
 =?iso-8859-1?Q?o8clAc6rZdTXJ8Sb4MaZa9IpbFl35pwAbQhu/psYdzvtKIm1qGtvQ49fHj?=
 =?iso-8859-1?Q?GQzxI1ZZ5ZuKqPh0TY4byIDxsSGApgfHF7E6F3UFDCemCwedNzV1kH3Mjn?=
 =?iso-8859-1?Q?q0KlBM9NgOFUIuSPxxIVlnnuYTqetbYBnqbIOhVXe9mCeV031qgtoKRc9l?=
 =?iso-8859-1?Q?rAi7NoN0CuqFqoCIiDSEoqYXAUZE5/84K6Mtj9e9qnLcJrkrftYAsDBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eca3e42b-acac-420b-ffce-08de3df24ef1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:00:05.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoLroBumN8aSt10o17A6DXxC7XUw84nnL9bd+Rqr2WyprFzYTpG4JebL5lLMRysKktpgYDUvsbc7OVM/26vWQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 52.4% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:


commit: 089d84203ad42bc8fd6dbf41683e162ac6e848cd ("sched/fair: Fold the sched_avg update")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: pts
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
parameters:

	test: schbench-1.1.0
	option_a: 32
	option_b: 2
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | pts: pts.stress-ng.Semaphores.bogo_ops_s 17.0% improvement                                    |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | option_a=Semaphores                                                                           |
|                  | test=stress-ng-1.11.0                                                                         |
+------------------+-----------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512181208.753b9f6e-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251218/202512181208.753b9f6e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/32/2/debian-12-x86_64-phoronix/lkp-csl-2sp7/schbench-1.1.0/pts

commit: 
  38a68b982d ("<linux/compiler_types.h>: Add the __signed_scalar_typeof() helper")
  089d84203a ("sched/fair: Fold the sched_avg update")

38a68b982dd0b10e 089d84203ad42bc8fd6dbf41683 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     22925            -8.7%      20922        vmstat.system.cs
      9350 ±  3%     +66.2%      15536        pts.schbench.32.usec,_50.0th_latency_percentile
     15508 ±  2%     +68.7%      26163        pts.schbench.32.usec,_75.0th_latency_percentile
     21587 ±  2%     +66.3%      35891        pts.schbench.32.usec,_90.0th_latency_percentile
     45209 ±  8%     +52.4%      68896 ±  2%  pts.schbench.32.usec,_99.9th_latency_percentile
    836593           -13.5%     723826        pts.time.involuntary_context_switches
    263006            -5.9%     247368        pts.time.voluntary_context_switches
     19.44 ±  9%      -1.9       17.56 ± 10%  perf-stat.i.cache-miss-rate%
     23851           -10.1%      21445        perf-stat.i.context-switches
      2482 ±  3%     +55.0%       3848        perf-stat.i.cpu-migrations
     58297 ±  6%     +22.2%      71251 ±  5%  perf-stat.i.cycles-between-cache-misses
      4.28            +1.9%       4.37        perf-stat.i.major-faults
    459621 ±  4%     -10.2%     412737 ±  6%  perf-stat.i.node-load-misses
     59.21 ±  2%      -3.7       55.48 ±  3%  perf-stat.i.node-store-miss-rate%
     23548            -9.1%      21411        perf-stat.ps.context-switches
      2453 ±  3%     +57.1%       3853        perf-stat.ps.cpu-migrations
    451933 ±  4%     -10.2%     405766 ±  6%  perf-stat.ps.node-load-misses
      3.80 ±101%      -2.4        1.37 ±158%  perf-profile.calltrace.cycles-pp.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      3.80 ±101%      -2.4        1.37 ±158%  perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write
      3.80 ±101%      -2.4        1.37 ±158%  perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      5.04 ± 89%      -2.2        2.88 ±136%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.04 ± 89%      -2.2        2.88 ±136%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      5.04 ± 89%      -2.2        2.88 ±136%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.04 ± 89%      -2.2        2.88 ±136%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.80 ±101%      -2.4        1.37 ±158%  perf-profile.children.cycles-pp.shmem_alloc_and_add_folio
      3.80 ±101%      -2.4        1.37 ±158%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      3.80 ±101%      -2.4        1.37 ±158%  perf-profile.children.cycles-pp.shmem_write_begin
      5.04 ± 89%      -2.2        2.88 ±136%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      5.04 ± 89%      -2.2        2.88 ±136%  perf-profile.children.cycles-pp.x64_sys_call
      3398 ± 14%     +45.6%       4947 ± 16%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     10.87 ± 38%    +268.9%      40.11 ± 40%  sched_debug.cfs_rq:/.load_avg.avg
    195.51 ±  8%     -32.1%     132.77 ± 19%  sched_debug.cfs_rq:/.runnable_avg.avg
    195.49 ±  8%     -32.1%     132.67 ± 19%  sched_debug.cfs_rq:/.util_avg.avg
     16931 ± 18%     +59.7%      27048 ± 19%  sched_debug.cfs_rq:/.zero_vruntime.max
      2742 ± 11%     +48.8%       4080 ±  9%  sched_debug.cfs_rq:/.zero_vruntime.stddev
      9.71 ± 10%   +1542.6%     159.44 ± 41%  sched_debug.cfs_rq:/system.slice.load_avg.avg
     49.20 ± 29%   +1273.6%     675.80 ± 24%  sched_debug.cfs_rq:/system.slice.load_avg.max
     10.96 ±  9%   +1016.0%     122.30 ± 26%  sched_debug.cfs_rq:/system.slice.load_avg.stddev
    230.81 ±  9%     -33.2%     154.14 ± 20%  sched_debug.cfs_rq:/system.slice.runnable_avg.avg
      8.42 ± 49%     -55.9%       3.71 ± 14%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.avg
    180.50 ± 57%     -79.6%      36.90 ± 46%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.max
     22.27 ± 48%     -71.5%       6.34 ± 22%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.stddev
    230.83 ±  9%     -33.3%     153.85 ± 20%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.avg
    230.83 ±  9%     -33.4%     153.79 ± 20%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.avg
      3241 ± 31%     -81.3%     607.00 ± 25%  sched_debug.cfs_rq:/system.slice.se->load.weight.min
      1893 ± 40%    +627.5%      13772 ± 35%  sched_debug.cfs_rq:/system.slice.tg_load_avg.avg
      2803 ± 30%    +556.7%      18406 ± 25%  sched_debug.cfs_rq:/system.slice.tg_load_avg.max
      1715 ± 44%    +604.5%      12086 ± 37%  sched_debug.cfs_rq:/system.slice.tg_load_avg.min
    231.68 ± 59%    +643.9%       1723 ± 29%  sched_debug.cfs_rq:/system.slice.tg_load_avg.stddev
     22.27 ± 41%    +641.4%     165.13 ± 38%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.avg
    230.81 ±  9%     -33.2%     154.07 ± 20%  sched_debug.cfs_rq:/system.slice.util_avg.avg
      0.03 ± 33%     -51.4%       0.02 ± 24%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      0.00 ± 31%    +569.0%       0.03 ± 27%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      0.24 ± 18%     +43.3%       0.34 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
      0.24 ± 17%     +40.8%       0.34 ±  5%  perf-sched.sch_delay.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.01 ± 13%    +313.3%       0.04 ± 25%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
     25.39 ± 24%    +103.1%      51.58 ± 35%  perf-sched.sch_delay.max.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     42.11 ± 55%    +115.8%      90.86 ± 40%  perf-sched.sch_delay.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
     36.90 ±  8%    +134.0%      86.33 ± 35%  perf-sched.sch_delay.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     29.57 ± 17%     +94.8%      57.62 ± 46%  perf-sched.sch_delay.max.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
     27.31 ± 18%     +98.5%      54.21 ± 49%  perf-sched.sch_delay.max.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      1.28 ± 54%    +617.0%       9.21 ± 82%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      0.15 ± 15%     +30.9%       0.20 ±  5%  perf-sched.total_sch_delay.average.ms
     24.08 ±  3%     +12.1%      27.00        perf-sched.total_wait_and_delay.average.ms
     23.93 ±  3%     +12.0%      26.80        perf-sched.total_wait_time.average.ms
     12.02 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.86 ±  9%     -33.9%       5.86 ±  3%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      9.27 ±  6%     +37.9%      12.79 ±  5%  perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     23.08 ±  2%     +19.1%      27.49 ±  2%  perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
     23.25 ±  2%     +18.7%      27.60        perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     24.82 ± 11%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown]
     24.47 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
     27.22 ±  7%     +14.8%      31.24 ±  2%  perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
     27.68 ±  7%     +14.5%      31.70 ±  2%  perf-sched.wait_and_delay.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    561.21           +15.2%     646.76        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1151 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      9330 ± 12%     +85.2%      17277 ±  3%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
     49629 ±  5%     -15.4%      41983 ±  3%  perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
     48187 ±  5%     -15.4%      40747 ±  3%  perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      4019 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_call_function_single.[unknown]
      3792 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
     10992 ±  4%      -9.9%       9903 ±  2%  perf-sched.wait_and_delay.count.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
    183.81 ±149%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    150.43 ±  9%     +39.7%     210.17 ±  4%  perf-sched.wait_and_delay.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
    138.97 ±  7%     +48.9%     206.98 ±  6%  perf-sched.wait_and_delay.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    120.74 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown]
    117.76 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
      1.04 ± 31%     -71.6%       0.29 ± 44%  perf-sched.wait_time.avg.ms.__cond_resched.dput.part.0.__fput
      8.83 ±  8%     -33.9%       5.84 ±  3%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      9.27 ±  6%     +37.7%      12.76 ±  5%  perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     22.84 ±  2%     +18.9%      27.15 ±  2%  perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
     23.01           +18.5%      27.26        perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     27.09 ±  7%     +14.7%      31.07 ±  2%  perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown]
     27.55 ±  7%     +14.5%      31.53 ±  2%  perf-sched.wait_time.avg.ms.irqentry_exit.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    561.20           +15.2%     646.75        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    131.24 ±  9%     +37.8%     180.91 ±  6%  perf-sched.wait_time.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
    128.37 ±  7%     +41.2%     181.24 ±  7%  perf-sched.wait_time.max.ms.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    115.53 ±  7%     +17.9%     136.21 ±  7%  perf-sched.wait_time.max.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown]
    112.57 ±  5%     +47.8%     166.40 ± 67%  perf-sched.wait_time.max.ms.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
      7.69 ± 33%   +6561.5%     512.09 ±234%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part


***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/Semaphores/debian-12-x86_64-phoronix/lkp-csl-2sp7/stress-ng-1.11.0/pts

commit: 
  38a68b982d ("<linux/compiler_types.h>: Add the __signed_scalar_typeof() helper")
  089d84203a ("sched/fair: Fold the sched_avg update")

38a68b982dd0b10e 089d84203ad42bc8fd6dbf41683 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.94 ± 12%      +0.1        1.05 ± 11%  mpstat.cpu.all.irq%
  22175775 ±  2%     -29.7%   15587298 ±  2%  vmstat.system.cs
  43933492           +17.0%   51381109        pts.stress-ng.Semaphores.bogo_ops_s
 1.201e+09           -29.9%  8.415e+08 ±  2%  pts.time.involuntary_context_switches
      2047            -2.8%       1990        pts.time.system_time
    774.22            +6.9%     827.70        pts.time.user_time
     18302 ± 19%    +182.0%      51617 ± 19%  pts.time.voluntary_context_switches
 1.385e+08            +9.9%  1.522e+08        perf-stat.i.branch-misses
  23793135 ±  2%     -29.7%   16716565 ±  2%  perf-stat.i.context-switches
    165.66 ±  4%     +49.0%     246.91        perf-stat.i.cpu-migrations
 2.678e+10            -3.7%   2.58e+10        perf-stat.i.dTLB-loads
 1.557e+10            -3.4%  1.504e+10        perf-stat.i.dTLB-stores
  21025195           +24.2%   26111221 ±  2%  perf-stat.i.iTLB-load-misses
 1.017e+11            -2.9%  9.874e+10        perf-stat.i.instructions
     32500 ± 30%     -51.7%      15693 ± 10%  perf-stat.i.instructions-per-iTLB-miss
    686.98            -2.6%     668.88        perf-stat.i.metric.M/sec
      0.59            +0.1        0.65        perf-stat.overall.branch-miss-rate%
      1.50            +3.9%       1.56        perf-stat.overall.cpi
      4831 ±  2%     -21.8%       3780 ±  2%  perf-stat.overall.instructions-per-iTLB-miss
      0.67            -3.8%       0.64        perf-stat.overall.ipc
 1.358e+08            +9.9%  1.493e+08        perf-stat.ps.branch-misses
  23332701 ±  2%     -29.7%   16391899 ±  2%  perf-stat.ps.context-switches
    162.46 ±  4%     +49.1%     242.15        perf-stat.ps.cpu-migrations
 2.627e+10            -3.7%   2.53e+10        perf-stat.ps.dTLB-loads
 1.527e+10            -3.4%  1.475e+10        perf-stat.ps.dTLB-stores
  20659015           +24.1%   25643823 ±  2%  perf-stat.ps.iTLB-load-misses
 9.977e+10            -2.9%  9.686e+10        perf-stat.ps.instructions
 5.136e+12            -3.2%  4.973e+12        perf-stat.total.instructions
      6.19 ±141%    +614.4%      44.23 ± 67%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      3.01 ±222%    +936.1%      31.16 ± 92%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.75 ± 67%     -89.4%       0.50 ± 88%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      0.01 ± 14%     +25.7%       0.01 ± 19%  perf-sched.sch_delay.avg.ms.irq_wait_for_interrupt.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     27.62 ±134%     -97.8%       0.60 ±219%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      4.19 ±217%    +514.4%      25.74 ±112%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
    122.79 ± 13%    +312.2%     506.13 ± 32%  perf-sched.sch_delay.max.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      2181 ± 41%     -38.5%       1340 ± 35%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read.do_syscall_64
      2680 ± 41%     -62.5%       1004 ± 99%  perf-sched.sch_delay.max.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
    333.74 ±141%    +199.8%       1000        perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    167.85 ±223%    +598.7%       1172 ± 76%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    245.85 ±130%     -97.6%       5.86 ±222%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.05 ±  5%     +52.0%       0.08 ±  2%  perf-sched.total_wait_and_delay.average.ms
  20881143 ±  3%     -32.1%   14170213 ±  2%  perf-sched.total_wait_and_delay.count.ms
      0.05 ±  4%     +52.8%       0.08 ±  3%  perf-sched.total_wait_time.average.ms
      0.02 ±  3%     +56.0%       0.04 ±  2%  perf-sched.wait_and_delay.avg.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      9.51 ±209%    +745.8%      80.40 ± 54%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     30.35 ± 50%     -71.3%       8.70 ± 28%  perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
  20874873 ±  3%     -32.2%   14163492 ±  2%  perf-sched.wait_and_delay.count.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
    165.00 ± 90%    +378.6%     789.67 ± 30%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
    382.50 ± 28%     +91.8%     733.67 ± 12%  perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
    503.33 ± 49%    +105.4%       1033 ± 24%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
     85.17 ± 24%     +85.3%     157.83 ± 28%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread.ret_from_fork
    514.37 ± 18%    +192.2%       1502 ± 24%  perf-sched.wait_and_delay.max.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      5701 ± 19%     -32.4%       3852 ± 23%  perf-sched.wait_and_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read.do_syscall_64
      5530 ± 34%     -45.5%       3015 ± 47%  perf-sched.wait_and_delay.max.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 ± 18%    +230.2%       0.05 ± 86%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.02 ±  3%     +55.3%       0.04 ±  2%  perf-sched.wait_time.avg.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      0.01 ± 18%     +56.3%       0.02 ± 26%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     25.61 ± 50%     -68.0%       8.20 ± 26%  perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
    489.21 ± 21%    +171.2%       1326 ± 28%  perf-sched.wait_time.max.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown].[unknown]
      1185 ± 26%     -15.6%       1000        perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.02 ± 20%    +300.7%       0.10 ± 98%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1281 ± 10%     +37.3%       1759 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.avg
      3255 ± 16%     +39.8%       4549 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     10.24 ± 50%    +266.8%      37.54 ± 44%  sched_debug.cfs_rq:/.load_avg.avg
      1086 ± 13%     +41.4%       1536 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.avg
     16641 ± 20%     +71.5%      28532 ± 16%  sched_debug.cfs_rq:/.zero_vruntime.max
      2628 ±  7%     +55.5%       4088 ±  8%  sched_debug.cfs_rq:/.zero_vruntime.stddev
      9.57 ± 13%   +1560.4%     158.98 ± 43%  sched_debug.cfs_rq:/system.slice.load_avg.avg
     54.00 ±  7%   +1167.0%     684.17 ± 40%  sched_debug.cfs_rq:/system.slice.load_avg.max
     10.89 ± 10%   +1043.2%     124.50 ± 39%  sched_debug.cfs_rq:/system.slice.load_avg.stddev
      3621 ± 24%     -82.5%     633.83 ± 25%  sched_debug.cfs_rq:/system.slice.se->load.weight.min
      1382 ± 10%     +38.3%       1912 ± 11%  sched_debug.cfs_rq:/system.slice.se->vruntime.avg
      3453 ± 15%     +39.3%       4812 ± 10%  sched_debug.cfs_rq:/system.slice.se->vruntime.stddev
      1411 ± 54%    +818.0%      12960 ± 38%  sched_debug.cfs_rq:/system.slice.tg_load_avg.avg
      1983 ± 44%    +699.0%      15847 ± 40%  sched_debug.cfs_rq:/system.slice.tg_load_avg.max
      1244 ± 59%    +823.7%      11495 ± 38%  sched_debug.cfs_rq:/system.slice.tg_load_avg.min
     18.22 ± 45%    +791.4%     162.37 ± 41%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.avg
      0.39 ± 40%    +163.4%       1.02 ± 17%  sched_debug.cfs_rq:/system.slice/containerd.service.load_avg.avg
      1.83 ± 37%    +118.2%       4.00 ± 25%  sched_debug.cfs_rq:/system.slice/containerd.service.load_avg.max
      0.70 ± 33%    +111.6%       1.48 ± 17%  sched_debug.cfs_rq:/system.slice/containerd.service.load_avg.stddev
      0.44 ± 28%    +146.7%       1.09 ± 16%  sched_debug.cfs_rq:/system.slice/containerd.service.runnable_avg.avg
      2.00 ± 28%    +108.3%       4.17 ± 25%  sched_debug.cfs_rq:/system.slice/containerd.service.runnable_avg.max
      0.77 ± 23%    +105.5%       1.57 ± 19%  sched_debug.cfs_rq:/system.slice/containerd.service.runnable_avg.stddev
      0.29 ± 53%    +224.9%       0.94 ± 12%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.load_avg.avg
      0.63 ± 54%    +119.4%       1.38 ± 28%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.load_avg.stddev
      0.44 ± 28%    +135.1%       1.04 ± 18%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.runnable_avg.avg
      2.00 ± 28%    +100.0%       4.00 ± 25%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.runnable_avg.max
      0.77 ± 23%     +95.4%       1.50 ± 18%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.runnable_avg.stddev
      0.44 ± 28%    +135.1%       1.04 ± 18%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.util_avg.avg
      2.00 ± 28%    +100.0%       4.00 ± 25%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.util_avg.max
      0.77 ± 23%     +95.4%       1.50 ± 18%  sched_debug.cfs_rq:/system.slice/containerd.service.se->avg.util_avg.stddev
      2.50 ± 47%    +133.5%       5.83 ± 28%  sched_debug.cfs_rq:/system.slice/containerd.service.tg_load_avg.avg
      3.00 ± 50%    +105.6%       6.17 ± 28%  sched_debug.cfs_rq:/system.slice/containerd.service.tg_load_avg.max
      2.17 ± 49%    +161.5%       5.67 ± 29%  sched_debug.cfs_rq:/system.slice/containerd.service.tg_load_avg.min
      0.39 ± 40%    +163.4%       1.02 ± 17%  sched_debug.cfs_rq:/system.slice/containerd.service.tg_load_avg_contrib.avg
      1.83 ± 37%    +118.2%       4.00 ± 25%  sched_debug.cfs_rq:/system.slice/containerd.service.tg_load_avg_contrib.max
      0.70 ± 33%    +111.6%       1.48 ± 17%  sched_debug.cfs_rq:/system.slice/containerd.service.tg_load_avg_contrib.stddev
      0.44 ± 28%    +146.7%       1.09 ± 16%  sched_debug.cfs_rq:/system.slice/containerd.service.util_avg.avg
      2.00 ± 28%    +108.3%       4.17 ± 25%  sched_debug.cfs_rq:/system.slice/containerd.service.util_avg.max
      0.77 ± 23%    +105.5%       1.57 ± 19%  sched_debug.cfs_rq:/system.slice/containerd.service.util_avg.stddev
      7.74 ±  3%     -39.7%       4.67 ± 35%  sched_debug.cpu.clock.stddev
      1495 ±  4%      +8.4%       1620 ±  5%  sched_debug.cpu.nr_switches.avg





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

