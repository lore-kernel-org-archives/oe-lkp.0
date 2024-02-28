Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42AF25542
	for <oe-lkp@lists.linux.dev>; Wed, 28 Feb 2024 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105088; cv=fail; b=WU350/gOv2VG3TPQHRhaspn+PRFasGUjv7k2T5tSgih9AcGLnh9n3Vl+qvxDYuNEVMDA86Z74BxUVklz92+bhS/ZCAG4uXX+6Uak53M2iaevOyi7C4xLZmoEqannLTgzULs336i43nXRnDtNDiJhPtEnTh7lNd+ChGrsc3awpwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105088; c=relaxed/simple;
	bh=/lreg10PwazWQS3ZZFNmMgdBBseMPSBxOpURaWCzcfo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ab56G3amfqpm+1zepbxTfEr2bElUW25MMyjVJtjVXdB8TOrU1wWNUC/F6QiF39t+YeRmvaNGbEe5P/Gmd600jBAO7Xn06+JZTgF1x2mOWR4HwYbgndWbWEofJCLsfa1KtYXPvdDOW/lkG6pVmhadmoO3jouHnZULUQ7c0y7dmlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgcsOLVW; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgcsOLVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709105086; x=1740641086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lreg10PwazWQS3ZZFNmMgdBBseMPSBxOpURaWCzcfo=;
  b=VgcsOLVW+BL8h11nLXStIK7aCaZbgMKbbghqPgJDg8A3MipziJrnHYfa
   kM9RfaeOFcGqCtg41w63TSn4zW8SSlxbNPNKcGZtDZSvs+uIK+2guFLRt
   lRbd9GyLvMGk0iAMZezFLKD/9CXkPXJngXiGTelcEnBSAuFNhNBSXp2Da
   UPmowUGbYU5Pm4KS5jDDVWZrgZ/uAXjlbHGc6PGCUTYt0nMGzDzHkNtB2
   g7l5lDyIYN5hm0801aOXbDCooEX50sLuavjDU7imN7xAE42yJdp3JJXTq
   sPepBw3imE9ly8LTK0PeNA1rX2hXGDHCB5jAlUFNe1q9oo0Zl38bofaFd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6439275"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="6439275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 23:24:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="12050193"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Feb 2024 23:24:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 23:24:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 23:24:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 23:24:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 23:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDipLhDEgbHANPpwXfbgC05Vj789rtKasXklBxpJ1OI0a6ykikt942sfWuEbunxhjBYNfih5bntfrF4eA6nUzl4lf9+O52UhyWemVIbcF1j7Lq64PTOgaM2DE3lHQdpVrmQCyAGpev2YsTC76aN6x3pg5AhCWXRi/R4E1BZSP2dYJIbbxYsUmCRkDsiZ1mjPaqkFaxluo0BqKFLa/Z3BDsMWvmZBSM2XbIlOb2XdtX6sjYd5EKBMLd6u8f9kpliQL+Gaen7K+RnD7qQDFuV7Prx1VMKyTYo4v5pK42DAGVr366jQCge1nxcJbcpELNH98zpwMPT2KJkvDc53soXWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkh4kGlfGCgmq3ABrhTz59aUzP4voUNU/Hv8NyBXdps=;
 b=CXOF2KsVgmOSFOnQ/sqnv0OC3sqwVhhtRDvMRu2DyUlYlsZDbszg3E6MlwK+JtldUWLGXWegGvJWiijKtAnFBma0cQIF7u3pQteGR45aDb6CtqzL/inUOFTdNPG/200j2nZs+nn2X8DjLGAn5+30FrJ4c3qP0VLgIJpjbEEWAHCU8Y885scyq2nK5K4oJo4rmF8Tr8FH8ubDiy3igrHLd7Uh6U9bF8EE9Kz5+DaAerv1/gsB7fuLRCUmYiegc2Ba1bPrQVCWn0viA8dIhBByXirSJTGGcZn98QYkmz/SASXrKQThXqI+Y4boiAAsLjPi1hun/FbkcmlbhJajqGnmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 28 Feb
 2024 07:24:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 07:24:40 +0000
Date: Wed, 28 Feb 2024 15:24:33 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-xfs:xfs-zoned-zwp] [xfs]  6998648bf0: modprobe: ERROR: could
 not insert 'xfs'
Message-ID: <202402281423.1b82ee17-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 324cef18-7716-48c7-773f-08dc382e53d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwiqSOarLJy7miNXoUCiHHso6GM78PY0P0iCGW0ys43xsBNSm1wuRgFiW1gzGoGw3pnnhlNNe1nt6YKwI0I0IKYHmzx03PTrVkjBB9F8SIv6Q4RFoT7ZyUwsOkdVv7Umu76kV9HjzQdR8TCVt2o7dqlLOGugzln3XkELptUwDHEHphfWi3fUodGXfEGUT3bU4lFAnlAVQxNZD0cXsXCMvcfdDyHF/y2nhxo8t/B5UBq8exVjPlBmxVWCefrcdy/LAoHnxu+uputrbFkrCH0ftciFShR8Eh/k1bC6prOoseyI060cRMQbpcUxdYIHjegRNAC4VBEU3/IkQXIiyapGd8IxZ9pX2gVzSVdKF2toGW4THeozKWmqA6jndS2xpoXJOPMVupHBpwNW9bm2MdMsyMzb0fgeEG5eOJrMemA41kNG48m9LcOcarNWB3xrFol9nJbBZsbamEvtfsiuf5habxEGRyUhzZfZbbBY8PPqvf8J4rOq2Mqim0FMGFaEsBB4bJP+HJLHMSUVADbdaFq0v3iN9jqbhXbQ6a0DCP1EIaIPLgP6y0+thyLUkcmJilwK2wwZNiqxTZbK/J2bcXu7gmznSFevM6WAR3EVXJihNbUlHlqz1dK3TQSXN+PQuszf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9sVjiGw/wE5Ady3eQu0gVP2rKTMXqoxDDIS0+b+PGNtIbbfTU8zubdTQNTLf?=
 =?us-ascii?Q?LLjPL5S4tyuvcw3pldZttTYja3sNT6EjaiiIwiwNL3+lAK59lcFGjpFWRa+3?=
 =?us-ascii?Q?9FA6JVWl0RgWdN9gN2/sUPplzPoveRyuxk4alZmD/zBT/sq6k0GWIzfGl4Wi?=
 =?us-ascii?Q?2AXYybikWudP6f5X0S7Qsh/qt/YuwiyweFZyCYZn9pMKiWnZiwbwpSPMiZW3?=
 =?us-ascii?Q?qaEzpqMx9MU5SSkbu80ZAqnIHX7CPnHvDvLYiYtWOPhYipt1vyHY2RA27mvg?=
 =?us-ascii?Q?UKQ2aYgp0mG+UHHVq2FERJ91otUpdeKsid0hkyR8W0pvL9vV32WCT5ELQVb7?=
 =?us-ascii?Q?CKXI/03iwhQAaIxuvRKlGWWyxbOJ7EM7xRfM11/Cp/A+OeEJ34h7utQoASc4?=
 =?us-ascii?Q?aUXU1cG4jrTQWnNOmm5kAxbaANOgXd5mixoEKnUeiP1zDHZEtEngNzWQBDR1?=
 =?us-ascii?Q?TYLZ2dR7RW3cxCWTWbDKnXvd5Upx5r9Xci/KCf+6mPY+iZzdLml2wBRypZ/j?=
 =?us-ascii?Q?8/66di+piaFzVVJ50HMbHKl3IibOT/wBQp3EJ7kWowkhAtqThwWbm47nUItH?=
 =?us-ascii?Q?nhdJFZfjzcLGNOsOIEq/o8P50FdH9arTrzn1Xpu2u8MzRJp1aLYmlRRsJ1JE?=
 =?us-ascii?Q?4zZuz0hiScXVdhNluhjY3l0nHDYph751qsw/U2U9fS1aicikx+38MKd0xywE?=
 =?us-ascii?Q?/009zMX3/poUqE8tVBDQ7ml/IBUST1aQ0QFovo80NuCoIng9eh3IlCr9a6pL?=
 =?us-ascii?Q?myEnzCb77lf4oKf9S0GSKUMdk4PBRk4lxvGQnGQcJ+8LLzmzK2pop7PvZaNZ?=
 =?us-ascii?Q?THfBDtPBW99kIhL44pN7e1bpM5PcZl1lUDDot3Me9vIV0VDuj9qPcwILZRuw?=
 =?us-ascii?Q?oTIJefEa3V/veFymGMTLHo3HwTG856Ad67zJdN+t4Gk45XcwxxneBsZT3PyM?=
 =?us-ascii?Q?QkOZJvxgwKTmEjUkW3m7O5y+gqvc9z3aOgePR6+XQtw4gT5S4mElsjpCow3W?=
 =?us-ascii?Q?kBaFXqkuBa+euqhxiWitgl/ZIbBgPofu8C9WkZDbI7XwuN+70GYic28m79Iq?=
 =?us-ascii?Q?y8VY9niVeM9EgpxVKqsAAs65pyPYeW5yrAViMQyP4eLmb+roSIUfRh/3C6As?=
 =?us-ascii?Q?4Ornk0+DE9Bd2Jh4AOmCd9i1LT+GqIP5vPAYmRJDg3ROZcxNCEsq2RMBvPkA?=
 =?us-ascii?Q?CqfACOFfW2QVXCXumuymA0p/lSNf8aPD38RFtxcpt1qmuqAZB+z63Z6PXSLx?=
 =?us-ascii?Q?3hJmbOHaaMuT7x0V4lNnsoZ/m0LQtTufQQ8NggArRZ63LJRfoAFZ7RgbtXoi?=
 =?us-ascii?Q?OeOVbfXI0QDTuUnLHvqNTEGBhDhR7cmhUUyA+vGCWl/DP0GZE9nClv+rXv/9?=
 =?us-ascii?Q?FrkjrXl60ZWwxTok7k1pBqf40YZMMbOY/m1KWiIA2ckOpSmbvFEh346buH3a?=
 =?us-ascii?Q?HuV/U+v6XkhkSDyZI9lCzDDng6N6Hqwz28HVNmzeQEWz6FAL49jAPzZxElWe?=
 =?us-ascii?Q?HtQj3UUJ2vTVUdrjUGbYAZsXJn/UuA7b+/3zzFtm9psdNIOjZ8jGJDXEcSco?=
 =?us-ascii?Q?ivCrTGXDLPneoElYR0y5fW9ZL6N6JABURh7NChdqsawWQrut7Iatc/JTZR2E?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 324cef18-7716-48c7-773f-08dc382e53d8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 07:24:40.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+VEkuwMFy8O3iU/4RRmnBCqmLN36TZNFR10vkhYVWSzlgSBtq/5aUUJMAncopQuhN+NxjQMbTEiIPzxLhQCCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
X-OriginatorOrg: intel.com



Hello,

we noticed this is "this is early prototype code", so below report is just FYI
what we observed in our tests.


kernel test robot noticed "modprobe: ERROR: could not insert 'xfs'" on:

commit: 6998648bf0e3fce2d2d3e0f5e092dbd64712cf1c ("xfs: support zoned RT devices")
git://git.infradead.org/users/hch/xfs xfs-zoned-zwp

in testcase: xfstests
version: xfstests-x86_64-c46ca4d1-1_20240205
with following parameters:

	disk: 4HDD
	fs: xfs
	test: generic-group-46



compiler: gcc-12
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402281423.1b82ee17-oliver.sang@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240228/202402281423.1b82ee17-oliver.sang@intel.com


[   59.112427][ T1261] xfs: Unknown symbol bio_add_folio_nofail (err -2)

...

[   63.929952][  T315] modprobe: ERROR: could not insert 'xfs': Unknown symbol in module, or unknown parameter (see dmesg)
[   63.929971][  T315] 
[   63.943962][  T315] mount: /fs/sda1: unknown filesystem type 'xfs'.
[   63.943977][  T315] 



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

