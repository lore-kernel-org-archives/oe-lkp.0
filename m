Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FA1E0DCB
	for <oe-lkp@lists.linux.dev>; Sat,  4 Oct 2025 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759580452; cv=fail; b=oxcnDJ2sFAEZjoUo8lPFgvF2AB7ZNDyVFy4P4EjJ4hIH0e6rKPt2FMGspPmtp3/Jmt/P1uLIwYnSkgzLf+kwGQFpHAZYWcRafLGiNXiHRVflHpjjMUtOa/TTarHC3C+VNlh/su0pGKBV574M9alccKXEvdtMJwzl/UMO+zZd+t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759580452; c=relaxed/simple;
	bh=4ttGaSm2Iacqb7OGbtmgBrk+AhroEcT3gEY62pl2G4s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=N2BitGcPy+oDFWT7r5+dQ0dDsaMGbJOvcw1XVy5xVRj79iFXvf2gKAXZAq+Dp4TGn9/h7+UbiVXmYHTXVuLjt5FAN5kgXhJFWRxptwzxKF8SEh5FQPyM1R8lN6BUWsz+bU7Dlrv3BobaAbhOX+1GYiBzxGpuHKEeD4XIXWToI9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBCKMGJa; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBCKMGJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759580449; x=1791116449;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=4ttGaSm2Iacqb7OGbtmgBrk+AhroEcT3gEY62pl2G4s=;
  b=EBCKMGJaMT4WlMHqIX8nNrnDoXfss8ph8+VpBgKNYAwQfu8VNfB2WRRw
   V3AkXr7SUY+sMeYSOk40WrZY0PHsIM4acHrtfRjVtziZuKDIg4GHYYxyv
   dsY/PD91Q7qoamFjqf9zr9/1S/SfFUGfpNp3AgyudlsAg+jF28g3ByfNJ
   NFlnIOWBpH8tJ1DUSwB+5cLgIRBzNfS7B6Rv+PKdNDOKliVBad756HuAb
   vkPAiHv2Zf0w9UJL3bo/vv1td3kKv06TGUaFx8pxyfSN26y2OE7YwqILT
   cu73ybVwm6Wm+H94Xyi6l7Owwg3nkUtnx+fNm+4RGj6J0sVrOga0kneN5
   g==;
X-CSE-ConnectionGUID: YO1lXYPgS4icaB5j4qzI+A==
X-CSE-MsgGUID: MkbLKG3cSSWOVPECcIttsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61797594"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61797594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 05:20:48 -0700
X-CSE-ConnectionGUID: Qq1AI366Q0KNcVj4/04s0A==
X-CSE-MsgGUID: JzmTlJcyQPGbiIgGEZDWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; 
   d="scan'208";a="179926849"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 05:20:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 05:20:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 05:20:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 05:20:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyuJZME4zIiWH9b1kP1XsAUVpddWpzZeki6eauAsZBdO1QTdP1RtAwmhMKdd7GHXqVx8kF2RBZR0WMSKZ8943y06c6deNTcHqijEtudSa+NxX8i9K9tlwsh0c9zVjtF/g05SeGXa4+cUarQbqVLoaZH2zp/2AKMhYzehxHfpWYnuhNEukPX/UrBp5ZGJy68th45CrveOhnFjE9YXkUxC9UibmNGblJOZqJ3/tRLCZfDZ6kwfVDT3hU6A8NSrrysY8FThwRqPyN+/w9fzKjJxtLHbg2AYt+RIW81N6QI+CbazKQLGWGWgbLzlHivbe4FTjJiOI9KpgFJyTwCaeCV8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi1mEg0hE9GGg3Dy7+0zoyEXBlvq2RTmXNOg9umSV+4=;
 b=dYCqYsw0ez2yZfx4ko4H1r5U4660K+zGdgj1I/OR8PNhRn3BNF+KJLTf4ZVfqO2fR6xFfJeJWroOjnWMMrtUqtN+IrR8cPh3li4+WqNYVIHJdzqiXvNe+uONp3XB0SR2KrgHFCUTn3IWN3upvvOuGxPFUqVFjKQnUymz6rTu5r9rS7sT5HhiMIoNkU0qUeIcYEbxozsfYHB46eWMSvefdp08utgpL1lwSS7dbmxwkqPDcJXaYEE2qzbsiHvIk8F5wqT1Y/InwG7lEyIUQ0OoxAGHagKwidoQ0/qqL+En/4kob8rylX65/lI+lEuvRh4LrA+pJh94mEe2/vGSoAOyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA4PR11MB9300.namprd11.prod.outlook.com (2603:10b6:208:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 4 Oct
 2025 12:20:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9182.017; Sat, 4 Oct 2025
 12:20:43 +0000
Date: Sat, 4 Oct 2025 20:20:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <steven@liquorix.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [zen:6.17/zen-sauce] [ZEN]  d228052440:  stress-ng.brk.ops_per_sec
 98.6% improvement
Message-ID: <202510042029.26f1826b-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA4PR11MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c7cba0-5e59-45ff-04ac-08de03407047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QIG640Vx4qJl0IcPspsODF4vg9+7qaqzNEB2To9jACeq5+T1OArIt8ST/J?=
 =?iso-8859-1?Q?AvCdbzbbova3PuXoSUC0u/DCIeOEllQYaxGJSAkAgvFTQycNerrPteR+PJ?=
 =?iso-8859-1?Q?2IUHm5YhyySX3HSI3z2Z9jOlZUd81EqNKCHP8mCAm9d0feMP07ee6OuI2M?=
 =?iso-8859-1?Q?HkOid7OvZ9OfRnk0lfqIrT1gmy2xWfp/X8s+zPh1kOcgSvEwATDQDCAZJk?=
 =?iso-8859-1?Q?vWPS81tKoY39JglVpOrpZYb+X9Fok1v3jSFbsUvL08uDK80uNzuGkvfdcg?=
 =?iso-8859-1?Q?dUm3X2ne/+K1bV0SGpyl5Bqn8gx04TYP3IogLp1WEnl0+Zy5eKX4PvXPqL?=
 =?iso-8859-1?Q?L/1MnfglsAeuE2LXoY+ntWWMXrAcxrplMSEOOVzGz18SdNCiUEXxhYe7+m?=
 =?iso-8859-1?Q?GR4BLWHDC16Dlt/xo5miFcWaRbEfBAAvp+W23DBrJn1W3W6SxN/rXVLcov?=
 =?iso-8859-1?Q?R5TB3SwYtcmIBRHBISJS0qZJ5y3fWqKiySlhEMrP6//5xWAqYh/K9t6b7o?=
 =?iso-8859-1?Q?musHICekAhqs0moEjTzJ0Nb0baaF+ayMlKFHd3CWairGn2yWm5o70zCJRS?=
 =?iso-8859-1?Q?NIpZIY6v+qr2CX4yF4o9uWqPuHMhtv6kQop0gmVDYcHQdpqtsFqSK87e8u?=
 =?iso-8859-1?Q?PznKPOIQiVKa6wtkVwvsy1Zgu/SzW+Z2CO0b+aFWa98Zu33Tv6yz/EwoDH?=
 =?iso-8859-1?Q?/mpgCzgwwG0JVvScu8MePu+jH09f+o7Z30Q1YoOSxmUCyfKt+U6R3RG9Aw?=
 =?iso-8859-1?Q?xTj0Ok4CuLH9p7iiJJZgik2YDzWyoj5bk2h/fbyjFFYvLJ3pV8RC6kX+UR?=
 =?iso-8859-1?Q?qfcTNWAPAcrtT0JZQ06bChgUS4FlOnyxtym1vjxq2wwdWXvYTXgnerPrah?=
 =?iso-8859-1?Q?ZGcm4AuJJvTyBGa76Lm5bY0DzyS5IGzRy2/MUdrc+ZRWyWSAmomGPUuw2r?=
 =?iso-8859-1?Q?biu4P6/WhNmBTmwhJrqQQR5c3SnhGXqs+ip0n4H8GtgdE1fx3MY0pIkEzF?=
 =?iso-8859-1?Q?UMC7Hog6CpITWUeUv/aFbjRUHsF4ggF5BoWsgmE/A+41MrBEV4XU596hby?=
 =?iso-8859-1?Q?oSHiA8C+gQdvgfv9OnNiPUciI7QwK5tBFMH4M+TzLYS65FApvQ1bXvpIiz?=
 =?iso-8859-1?Q?cCe05Mld65I4XcZv3msgMuunq0Um3OG4+AAXvHo9Vu1aACNmpaSyBGxIWL?=
 =?iso-8859-1?Q?w40raBFftAwamytqpKl2gJDc9Kwd7Ez6sHeTOrbeEXWLKm41SAreJw+9f1?=
 =?iso-8859-1?Q?XkAeVn88pWdyzSkfRJsbS0zlaQWzolW9lm7/wPixn2SyOy+ynGLQTCOeL5?=
 =?iso-8859-1?Q?FvYxH5lsftHPTlvOqG7cH2wYPL2/J4Lk2myWy3isweCUHCtbFmJHNY73ld?=
 =?iso-8859-1?Q?zfkxNfcGws/amWplh9Ec+s2lIpejWvHBsFU/Z6qXiIWEZYORvBxNPOsfYM?=
 =?iso-8859-1?Q?1Ltuho0oTmJ8vrakGDoagyAOir69E06NsT6C0M5jGJxjojFTagAc+SAfTD?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j25xyzyZuuaq5ghTMUYUut8Bvpnvsr5YKol/VGf8wP0ft2lfpLc+YRK9qX?=
 =?iso-8859-1?Q?zATzwDpsA+OD/LtxqYp6+9NFQzy2Hly2Ae0HRdC0E2o995RARb5UK0EXWF?=
 =?iso-8859-1?Q?uLOogswb2+itIQP+2hTx1rlrzaSR0botqaMRYw6wtr/q1W3CKr5dwj4txx?=
 =?iso-8859-1?Q?fyQNvxq5sBA6SEjWzsdctA+zzXhrgDlA9qT3JwyLFXluSrbTeVaXgpuUey?=
 =?iso-8859-1?Q?sP9HS7FWUxXDthYPFT06QV1oxkC4sVCEcGtHKqvkLL+x9FzaAjzF7TOJRC?=
 =?iso-8859-1?Q?uUXyNfuPpmM2Uz1C26VyOmkX2KR2nQECdPnQiS89ntaOHA6285ze8gfyHP?=
 =?iso-8859-1?Q?DsKQBkUuAhL6ShCu7DJfl+7ZxxpYNhEAPR6Pn+8AJTFrZtww2pXYDnG471?=
 =?iso-8859-1?Q?IpXnqX1t/nJCp1UJuufuwMWK01wITvh5BGWB789amkpat1eJN9LOZKDTcz?=
 =?iso-8859-1?Q?SM2oZQ2a2eQCUHAMCZUQ62ziENYCoh66vgoetF72oJavMn1Gjkfma9Sk2b?=
 =?iso-8859-1?Q?ls52/12idrKiqySsjfZb/8NaFSJNHMfyVOYODXIDYje6V+3v3WXpl8w6Re?=
 =?iso-8859-1?Q?OFlQ8X2VKCS8qS0+7Qw5AMR19IdMJfaEqB4gtJVkhJjp//txt0rliRHFj/?=
 =?iso-8859-1?Q?LP+O6kH02EqLjbV72hW8jjHV/wD5mr2J4xtdSSmd9Vaxadgqh4qWva7lv5?=
 =?iso-8859-1?Q?tJFkF/o6BEIZg11+91/guUAZttmqU5yVfqcnrkStshK2alzsta5Vfb0AES?=
 =?iso-8859-1?Q?jcfKfHo42iyd9eIqZEiWfgKI1MiI6qnQqoSQijjl4t99DOvRcKGmRgHTGw?=
 =?iso-8859-1?Q?WNg4oBvmJFMwMgaX43odvp02Pw4rdseZqKzvPIjgFwz0B0KEwYT4nSFLgl?=
 =?iso-8859-1?Q?mzPSx5eB1LsDOx8E2EKWeavRqx22FsdT9B9Fyf3mRtiHBC3Y54gG57JWX6?=
 =?iso-8859-1?Q?7HtvTHa089QQ4v7keRRQFcR3OZZy6OcAp52A8o6938KPKF4lSZ7IqZO+Cm?=
 =?iso-8859-1?Q?OuFQxseL5Cw9cq2PXxXFLAo/cAptM4cT7xUHvEGzYPgLkqVUzniKobTODR?=
 =?iso-8859-1?Q?h1kqPSUnixNrmkmdzeEbmrTu16krPDIh20RXhSGDCqEq1GEoWskfHJI+t1?=
 =?iso-8859-1?Q?kqXFGJ/rjktUXwwKJcIAWpMAXxjAuB4Kr7r5tZhGdM4FKg161eRKViurP4?=
 =?iso-8859-1?Q?XoiygMXYbWzmCio6M9G/CyXVGjl/Cg1e2SPVUbH5ncHkuUZ+449nO7EjKY?=
 =?iso-8859-1?Q?e5Gkk4MjlnsRD3/Dd4OW4XQCVprBbh6rMt/L5W59rSG/55LvWWZ9MjSypl?=
 =?iso-8859-1?Q?booexQ8k7B91iCcg6E9rigHoEEcwUdU+m0o7osSrbRiSwuPSz0T/h+aGyJ?=
 =?iso-8859-1?Q?uGaDbFiXpxP5fGQyJJVb+iv86st0ZfDvWNkNuSZggC88Q/Gx4/rao3LalB?=
 =?iso-8859-1?Q?3WnS9lTTmcM8WwoFLC03IczjHtXnygOW9pIcx+RmCGAP37SdC+UJc7qVpm?=
 =?iso-8859-1?Q?qB8iVyz4yGX2TBPIfeNOaJ7pyKI5owVeZVodZWF0DuLliTL6YXkHqplXNC?=
 =?iso-8859-1?Q?vEBPJbwwsyw0O+owU+R+iIRLfarGAMeKU6Y+sh1qmLejXbJ1vkZhnNN0Uw?=
 =?iso-8859-1?Q?rVUbH5ywLPtMiY7SMBG2cTXxIpUs/Wz2m1ArL5Y6yLoh6uCwBYcqV+gQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c7cba0-5e59-45ff-04ac-08de03407047
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 12:20:43.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG8fLVZSGFo/vw9UY90+7op023io192dSezhD7IpnYDkOJUO1W4Z7Kb+VVYtsEs/xwlvHJttQt0ooZs4xbgiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9300
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 98.6% improvement of stress-ng.brk.ops_per_sec on:


commit: d228052440e803d92954523748bd16be3b859d45 ("ZEN: Set default max map count to (INT_MAX - 5)")
https://github.com/zen-kernel/zen-kernel 6.17/zen-sauce

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 104 threads 2 sockets (Skylake) with 192G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: brk
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251004/202510042029.26f1826b-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-skl-fpga01/brk/stress-ng/60s

commit: 
  7d39cd3c81 ("ZEN: drm/amdgpu/pm: Allow override of min_power_limit with ignore_min_pcap")
  d228052440 ("ZEN: Set default max map count to (INT_MAX - 5)")

7d39cd3c8140be85 d228052440e803d92954523748b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      7495           -42.7%       4292        uptime.idle
 3.392e+09           -94.0%  2.031e+08 ±  7%  cpuidle..time
   3636297           -94.1%     215560 ±  7%  cpuidle..usage
  24357257           +98.1%   48259413        numa-numastat.node0.local_node
  24406210           +97.9%   48299256        numa-numastat.node0.numa_hit
  24333323           +98.1%   48206035        numa-numastat.node1.local_node
  24393861           +97.8%   48261607        numa-numastat.node1.numa_hit
     51.70           -48.8        2.86 ±  2%  mpstat.cpu.all.idle%
      1.98            -0.7        1.25        mpstat.cpu.all.irq%
      0.16 ±  2%      +0.4        0.52 ± 32%  mpstat.cpu.all.soft%
     42.16           +45.7       87.91        mpstat.cpu.all.sys%
      4.00            +3.5        7.46        mpstat.cpu.all.usr%
     68.67 ± 19%   +5708.3%       3988 ± 11%  perf-c2c.DRAM.local
    153.67 ± 11%   +5493.7%       8595 ±  6%  perf-c2c.DRAM.remote
    507.50 ± 12%   +2278.5%      12070 ±  6%  perf-c2c.HITM.local
    110.50 ± 16%   +6017.6%       6760 ±  7%  perf-c2c.HITM.remote
    618.00 ± 11%   +2947.1%      18830 ±  6%  perf-c2c.HITM.total
      5589            +2.0%       5703        stress-ng.brk.nanosecs_per_sbrk_page_shrink
  61244719           +98.9%  1.218e+08        stress-ng.brk.ops
    997986           +98.6%    1982059        stress-ng.brk.ops_per_sec
   1311586           +34.1%    1759305        stress-ng.time.maximum_resident_set_size
  95306718           +98.9%  1.896e+08        stress-ng.time.minor_page_faults
      4740          +109.1%       9909        stress-ng.time.percent_of_cpu_this_job_got
      2723          +109.3%       5702        stress-ng.time.system_time
    200.73          +101.6%     404.60        stress-ng.time.user_time
     61490           -98.6%     862.33 ±  6%  stress-ng.time.voluntary_context_switches
  99900358           -26.7%   73177583        meminfo.Active
  99900342           -26.7%   73177567        meminfo.Active(anon)
  99706156           -27.1%   72677209        meminfo.AnonPages
 1.033e+08           +44.1%  1.488e+08        meminfo.Committed_AS
    110824           +58.7%     175933 ±  4%  meminfo.Mapped
  85564320           +31.3%  1.123e+08        meminfo.MemAvailable
  86384016           +31.0%  1.131e+08        meminfo.MemFree
 1.103e+08           -24.3%   83563133        meminfo.Memused
    261474           -23.2%     200718        meminfo.PageTables
   2217830           -18.3%    1810877        meminfo.SUnreclaim
    163996          +150.3%     410404 ±  2%  meminfo.Shmem
   2321095           -17.5%    1914813        meminfo.Slab
  1.14e+08           +16.5%  1.328e+08        meminfo.max_used_kB
  50275477           -27.3%   36563427        numa-meminfo.node0.Active
  50275469           -27.3%   36563416        numa-meminfo.node0.Active(anon)
  50253678           -27.4%   36469760        numa-meminfo.node0.AnonPages
  68566257           +29.6%   88860663        numa-meminfo.node0.AnonPages.max
  40714036 ±  3%     +34.0%   54552102 ±  2%  numa-meminfo.node0.MemFree
  56965479 ±  2%     -24.3%   43127413 ±  3%  numa-meminfo.node0.MemUsed
    135861 ±  3%     -24.9%     101983 ±  5%  numa-meminfo.node0.PageTables
   1084732 ± 10%     -18.9%     879737 ± 12%  numa-meminfo.node0.SUnreclaim
   1139855 ±  9%     -18.4%     930433 ± 10%  numa-meminfo.node0.Slab
  50136315           -27.0%   36606317        numa-meminfo.node1.Active
  50136306           -27.0%   36606311        numa-meminfo.node1.Active(anon)
  49960326           -27.5%   36197391        numa-meminfo.node1.AnonPages
  68245951           +30.4%   88977258        numa-meminfo.node1.AnonPages.max
  45137195 ±  3%     +29.8%   58592152 ±  2%  numa-meminfo.node1.MemFree
  53894784 ±  3%     -25.0%   40439827 ±  3%  numa-meminfo.node1.MemUsed
    127430 ±  3%     -21.5%     100048 ±  4%  numa-meminfo.node1.PageTables
    156031          +131.6%     361384 ± 15%  numa-meminfo.node1.Shmem
  25051604           -27.1%   18252820        proc-vmstat.nr_active_anon
  25002744           -27.5%   18125895        proc-vmstat.nr_anon_pages
   2126668           +32.0%    2806426        proc-vmstat.nr_dirty_background_threshold
   4258537           +32.0%    5619714        proc-vmstat.nr_dirty_threshold
    953866            +6.5%    1016217        proc-vmstat.nr_file_pages
  21516144           +31.6%   28323387        proc-vmstat.nr_free_pages
  21268917           +21.4%   25829390 ±  5%  proc-vmstat.nr_free_pages_blocks
     27989 ±  2%     +59.2%      44569 ±  3%  proc-vmstat.nr_mapped
     65763           -22.9%      50728        proc-vmstat.nr_page_table_pages
     40762          +152.9%     103109 ±  2%  proc-vmstat.nr_shmem
    556554           -17.9%     456759        proc-vmstat.nr_slab_unreclaimable
  25051604           -27.1%   18252809        proc-vmstat.nr_zone_active_anon
  48803021           +97.9%   96565074        proc-vmstat.numa_hit
  48693531           +98.1%   96469659        proc-vmstat.numa_local
  49195388           +97.8%   97301165        proc-vmstat.pgalloc_normal
  95675886           +98.6%    1.9e+08        proc-vmstat.pgfault
  48496384          +100.5%   97227011        proc-vmstat.pgfree
      1331          +103.1%       2703        turbostat.Avg_MHz
     48.91           +47.9       96.81        turbostat.Busy%
      2728            +2.6%       2799        turbostat.Bzy_MHz
      0.05 ± 14%      -0.0        0.03 ± 13%  turbostat.C1%
      0.65 ±  2%      -0.6        0.05        turbostat.C1E%
     50.90           -47.8        3.12 ±  6%  turbostat.C6%
     40.84           -92.8%       2.96 ±  5%  turbostat.CPU%c1
     10.24 ±  2%     -97.8%       0.23 ± 22%  turbostat.CPU%c6
     38.50 ±  2%     +20.3%      46.33 ±  2%  turbostat.CoreTmp
   7222798           +62.7%   11751732        turbostat.IRQ
    267021 ±  3%    +860.6%    2565050 ±  2%  turbostat.NMI
      4.27 ±  2%     -95.7%       0.18 ± 25%  turbostat.Pkg%pc2
      0.80 ±  9%    -100.0%       0.00        turbostat.Pkg%pc6
     38.67 ±  2%     +22.0%      47.17        turbostat.PkgTmp
    246.34           +32.1%     325.39        turbostat.PkgWatt
     27.29           +30.3%      35.55        turbostat.RAMWatt
      1366 ± 20%     +75.6%       2400        turbostat.UncMHz
  12524871           -27.6%    9063873        numa-vmstat.node0.nr_active_anon
  12520583           -27.8%    9039761        numa-vmstat.node0.nr_anon_pages
  10226734 ±  3%     +34.1%   13712354 ±  2%  numa-vmstat.node0.nr_free_pages
  10111852 ±  3%     +26.4%   12784321 ±  7%  numa-vmstat.node0.nr_free_pages_blocks
     33574 ±  3%     -23.7%      25608 ±  4%  numa-vmstat.node0.nr_page_table_pages
    268373 ± 10%     -18.0%     219995 ± 12%  numa-vmstat.node0.nr_slab_unreclaimable
  12524861           -27.6%    9063869        numa-vmstat.node0.nr_zone_active_anon
  24406252           +97.9%   48299252        numa-vmstat.node0.numa_hit
  24357314           +98.1%   48259417        numa-vmstat.node0.numa_local
  12489641           -27.4%    9069755        numa-vmstat.node1.nr_active_anon
  12447291           -28.0%    8967012        numa-vmstat.node1.nr_anon_pages
  11333336 ±  3%     +29.9%   14726096 ±  2%  numa-vmstat.node1.nr_free_pages
  11226792 ±  3%     +17.3%   13164737 ±  6%  numa-vmstat.node1.nr_free_pages_blocks
     31471 ±  3%     -20.2%      25123 ±  5%  numa-vmstat.node1.nr_page_table_pages
     39062          +134.0%      91397 ± 16%  numa-vmstat.node1.nr_shmem
  12489633           -27.4%    9069747        numa-vmstat.node1.nr_zone_active_anon
  24393703           +97.9%   48263104        numa-vmstat.node1.numa_hit
  24333188           +98.1%   48207532        numa-vmstat.node1.numa_local
      2.87 ±  2%     -12.7%       2.51 ±  2%  perf-stat.i.MPKI
 4.717e+09           +91.2%   9.02e+09        perf-stat.i.branch-instructions
      5.67            -4.2        1.46        perf-stat.i.branch-miss-rate%
  95858898           +35.9%  1.303e+08        perf-stat.i.branch-misses
     28.79           +22.8       51.58        perf-stat.i.cache-miss-rate%
  57867931 ±  2%     +92.4%  1.114e+08 ±  2%  perf-stat.i.cache-misses
 1.438e+08 ±  2%     +49.6%  2.152e+08 ±  3%  perf-stat.i.cache-references
      5.06           +26.7%       6.41        perf-stat.i.cpi
 1.374e+11          +106.7%  2.841e+11        perf-stat.i.cpu-cycles
    179.99            +7.8%     193.95        perf-stat.i.cpu-migrations
      1983           +29.0%       2559 ±  2%  perf-stat.i.cycles-between-cache-misses
 2.313e+10           +91.1%  4.422e+10        perf-stat.i.instructions
      0.30           -46.6%       0.16        perf-stat.i.ipc
      0.02 ± 91%    +362.1%       0.09 ± 64%  perf-stat.i.major-faults
     29.57          +100.7%      59.35        perf-stat.i.metric.K/sec
   1541784          +100.2%    3085963        perf-stat.i.minor-faults
   1541784          +100.2%    3085963        perf-stat.i.page-faults
      2.03            -0.8        1.20 ± 44%  perf-stat.overall.branch-miss-rate%
      0.17           -22.6%       0.13 ± 44%  perf-stat.overall.ipc
   1029324 ± 70%    +212.8%    3219632        sched_debug.cfs_rq:/.avg_vruntime.avg
   1086594 ± 67%    +203.7%    3300240        sched_debug.cfs_rq:/.avg_vruntime.max
    974810 ± 70%    +163.1%    2564386        sched_debug.cfs_rq:/.avg_vruntime.min
     17849 ± 44%    +382.4%      86102 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.11 ± 49%    +433.6%       0.60        sched_debug.cfs_rq:/.h_nr_queued.avg
      1.00           +83.3%       1.83 ± 12%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.11 ± 47%    +436.2%       0.59 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      1.00           +66.7%       1.67 ± 14%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.23 ±223%  +9.1e+06%      20561 ± 70%  sched_debug.cfs_rq:/.left_deadline.avg
     23.52 ±223%  +9.1e+06%    2137809 ± 70%  sched_debug.cfs_rq:/.left_deadline.max
      2.30 ±223%  +9.1e+06%     208640 ± 70%  sched_debug.cfs_rq:/.left_deadline.stddev
      0.06 ±223%  +3.3e+07%      20561 ± 70%  sched_debug.cfs_rq:/.left_vruntime.avg
      6.45 ±223%  +3.3e+07%    2137766 ± 70%  sched_debug.cfs_rq:/.left_vruntime.max
      0.63 ±223%  +3.3e+07%     208635 ± 70%  sched_debug.cfs_rq:/.left_vruntime.stddev
      5919 ± 36%     +94.9%      11536 ± 24%  sched_debug.cfs_rq:/.load.avg
      1079 ± 15%     -46.5%     577.25 ± 10%  sched_debug.cfs_rq:/.load_avg.max
    200.72 ± 25%     -35.0%     130.47 ± 13%  sched_debug.cfs_rq:/.load_avg.stddev
   1029324 ± 70%    +212.8%    3219632        sched_debug.cfs_rq:/.min_vruntime.avg
   1086594 ± 67%    +203.7%    3300240        sched_debug.cfs_rq:/.min_vruntime.max
    974810 ± 70%    +163.1%    2564386        sched_debug.cfs_rq:/.min_vruntime.min
     17849 ± 44%    +382.4%      86102 ±  5%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.11 ± 47%    +426.1%       0.58        sched_debug.cfs_rq:/.nr_queued.avg
      0.06 ±223%  +3.3e+07%      20561 ± 70%  sched_debug.cfs_rq:/.right_vruntime.avg
      6.45 ±223%  +3.3e+07%    2137766 ± 70%  sched_debug.cfs_rq:/.right_vruntime.max
      0.63 ±223%  +3.3e+07%     208635 ± 70%  sched_debug.cfs_rq:/.right_vruntime.stddev
    196.19 ± 35%    +238.6%     664.23        sched_debug.cfs_rq:/.runnable_avg.avg
      1003 ± 12%     +56.0%       1564 ± 10%  sched_debug.cfs_rq:/.runnable_avg.max
    196.07 ± 35%    +233.2%     653.33        sched_debug.cfs_rq:/.util_avg.avg
     23.83 ± 52%   +1395.5%     356.42 ± 53%  sched_debug.cfs_rq:/.util_est.avg
    707.83 ± 31%     +65.3%       1170 ± 14%  sched_debug.cfs_rq:/.util_est.max
     97.63 ± 37%    +129.2%     223.75 ± 14%  sched_debug.cfs_rq:/.util_est.stddev
    610138 ±  7%     -20.2%     487050 ± 15%  sched_debug.cpu.avg_idle.stddev
      3.95 ± 13%     +86.5%       7.36 ± 13%  sched_debug.cpu.clock.stddev
    601.27 ± 46%    +600.9%       4214        sched_debug.cpu.curr->pid.avg
      1686 ± 22%     -30.2%       1177 ±  7%  sched_debug.cpu.curr->pid.stddev
    803240 ±  8%     -16.8%     668273 ±  3%  sched_debug.cpu.max_idle_balance_cost.avg
    321105 ±  6%     -25.1%     240348 ±  5%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 32%     +65.5%       0.00 ± 13%  sched_debug.cpu.next_balance.stddev
      0.11 ± 48%    +463.6%       0.60 ±  2%  sched_debug.cpu.nr_running.avg
      1.00           +83.3%       1.83 ± 12%  sched_debug.cpu.nr_running.max
     94.86           -94.9        0.00        perf-profile.calltrace.cycles-pp.common_startup_64
     93.35           -93.3        0.00        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     93.35           -93.3        0.00        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     93.27           -93.3        0.00        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     92.31           -92.3        0.00        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     87.61           -87.6        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     87.40           -87.4        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     62.50 ±  3%     -62.5        0.00        perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     22.71 ±  6%     -22.7        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     19.79 ±  6%     -19.8        0.00        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
     13.41 ±  5%     -13.4        0.00        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
     13.22 ±  5%     -13.2        0.00        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
     10.75 ±  5%     -10.8        0.00        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      6.25 ±  7%      -6.3        0.00        perf-profile.calltrace.cycles-pp.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      5.20 ±  7%      -5.2        0.00        perf-profile.calltrace.cycles-pp.update_process_times.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.65 ±  2%  perf-profile.calltrace.cycles-pp.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00            +0.7        0.70        perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      0.00            +0.7        0.71 ±  6%  perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.72 ±  2%  perf-profile.calltrace.cycles-pp.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.73 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.00            +0.8        0.76 ±  8%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
      0.00            +0.9        0.85 ±  7%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy.__handle_mm_fault
      0.00            +0.9        0.88 ±  7%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy.__handle_mm_fault.handle_mm_fault
      0.00            +0.9        0.92 ±  6%  perf-profile.calltrace.cycles-pp.vma_alloc_folio_noprof.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +1.0        1.01 ± 40%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.folios_put_refs.free_pages_and_swap_cache
      0.00            +1.0        1.05 ±  4%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.00            +1.1        1.07 ±  4%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.1        1.09 ±  4%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +1.1        1.09 ± 37%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_unref_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      0.00            +1.1        1.09 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +1.1        1.10 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +1.1        1.13 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +1.2        1.20 ± 34%  perf-profile.calltrace.cycles-pp.free_unref_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu
      0.00            +1.3        1.26 ±  4%  perf-profile.calltrace.cycles-pp.__munmap
      0.00            +1.3        1.33        perf-profile.calltrace.cycles-pp.__irqentry_text_end.stress_brk_child
      0.00            +1.3        1.34        perf-profile.calltrace.cycles-pp.commit_merge.vma_merge_existing_range.vma_modify.vma_modify_flags.madvise_vma_behavior
      0.00            +1.5        1.45 ± 29%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      0.00            +1.5        1.46 ± 29%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      0.00            +1.5        1.47 ± 29%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +1.5        1.47 ± 29%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +1.5        1.48 ± 29%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +1.7        1.69        perf-profile.calltrace.cycles-pp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.00            +1.8        1.77        perf-profile.calltrace.cycles-pp.vma_merge_existing_range.vma_modify.vma_modify_flags.madvise_vma_behavior.madvise_do_behavior
      0.00            +1.8        1.78        perf-profile.calltrace.cycles-pp.vma_modify.vma_modify_flags.madvise_vma_behavior.madvise_do_behavior.do_madvise
      0.00            +1.8        1.80        perf-profile.calltrace.cycles-pp.vma_modify_flags.madvise_vma_behavior.madvise_do_behavior.do_madvise.__x64_sys_madvise
      0.00            +1.9        1.87        perf-profile.calltrace.cycles-pp.madvise_vma_behavior.madvise_do_behavior.do_madvise.__x64_sys_madvise.do_syscall_64
      0.00            +2.2        2.16        perf-profile.calltrace.cycles-pp.madvise_do_behavior.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.3        2.27        perf-profile.calltrace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      0.00            +2.3        2.29        perf-profile.calltrace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      0.00            +2.4        2.36        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      0.00            +2.4        2.42 ±  6%  perf-profile.calltrace.cycles-pp.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.00            +2.6        2.59        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise
      0.00            +2.7        2.75 ±  5%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +2.9        2.92        perf-profile.calltrace.cycles-pp.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.00            +3.0        2.98 ±  5%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_brk_child
      0.00            +3.0        2.99        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.00            +3.2        3.22        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.brk
      0.00            +3.5        3.53 ±  4%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_brk_child
      0.00            +3.6        3.56 ±  4%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_brk_child
      0.00            +3.9        3.86 ±  4%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_brk_child
      0.00            +4.0        4.03        perf-profile.calltrace.cycles-pp.__madvise
      0.00            +4.8        4.77        perf-profile.calltrace.cycles-pp.brk
      0.00            +6.0        6.00 ±  2%  perf-profile.calltrace.cycles-pp.stress_brk_child
      0.00           +12.5       12.48 ±  7%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.si_swapinfo.do_sysinfo.__x64_sys_sysinfo
      0.00           +12.9       12.89 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock.si_swapinfo.do_sysinfo.__x64_sys_sysinfo.do_syscall_64
      0.00           +12.9       12.91 ±  7%  perf-profile.calltrace.cycles-pp.si_swapinfo.do_sysinfo.__x64_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +17.0       17.00 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
      0.00           +17.0       17.02 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache
      0.00           +17.0       17.02 ±  5%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      0.00           +17.3       17.33 ±  5%  perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu
      0.00           +19.2       19.17 ±  2%  perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range
      0.00           +19.2       19.23 ±  2%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      0.00           +19.2       19.23 ±  2%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range
      0.00           +19.2       19.23 ±  2%  perf-profile.calltrace.cycles-pp.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00           +19.7       19.67 ±  2%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.vms_complete_munmap_vmas
      0.00           +19.7       19.69 ±  2%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.00           +19.7       19.72 ±  2%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.00           +19.8       19.81 ±  2%  perf-profile.calltrace.cycles-pp.unmap_vmas.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.00           +20.4       20.37 ±  2%  perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +21.4       21.42 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +21.4       21.44 ±  2%  perf-profile.calltrace.cycles-pp.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +21.4       21.45 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +21.5       21.51 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +21.7       21.75 ±  2%  perf-profile.calltrace.cycles-pp.syscall
      0.00           +44.6       44.63 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.nr_blockdev_pages.si_meminfo.do_sysinfo
      0.00           +45.0       45.03 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.nr_blockdev_pages.si_meminfo.do_sysinfo.__x64_sys_sysinfo
      0.00           +45.2       45.17 ±  2%  perf-profile.calltrace.cycles-pp.nr_blockdev_pages.si_meminfo.do_sysinfo.__x64_sys_sysinfo.do_syscall_64
      0.00           +45.2       45.20 ±  2%  perf-profile.calltrace.cycles-pp.si_meminfo.do_sysinfo.__x64_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +58.3       58.30        perf-profile.calltrace.cycles-pp.do_sysinfo.__x64_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sysinfo
      0.00           +58.5       58.49        perf-profile.calltrace.cycles-pp.__x64_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sysinfo
      0.00           +58.6       58.59        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sysinfo
      0.00           +58.9       58.89        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sysinfo
      0.00           +60.1       60.15        perf-profile.calltrace.cycles-pp.sysinfo
     94.86           -94.9        0.00        perf-profile.children.cycles-pp.common_startup_64
     94.86           -94.9        0.00        perf-profile.children.cycles-pp.cpu_startup_entry
     94.86           -94.9        0.00        perf-profile.children.cycles-pp.do_idle
     93.88           -93.9        0.00        perf-profile.children.cycles-pp.cpuidle_idle_call
     93.35           -93.3        0.00        perf-profile.children.cycles-pp.start_secondary
     88.87           -88.9        0.00        perf-profile.children.cycles-pp.cpuidle_enter
     88.70           -88.7        0.00        perf-profile.children.cycles-pp.cpuidle_enter_state
     62.69 ±  3%     -62.7        0.00        perf-profile.children.cycles-pp.intel_idle_ibrs
     21.94 ±  6%     -20.6        1.29 ± 39%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     20.28 ±  6%     -19.0        1.23 ± 41%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     13.76 ±  5%     -13.3        0.44 ±  8%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     13.60 ±  5%     -13.2        0.44 ±  8%  perf-profile.children.cycles-pp.hrtimer_interrupt
     11.15 ±  5%     -10.8        0.36 ± 12%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      6.46 ±  7%      -6.2        0.27 ± 17%  perf-profile.children.cycles-pp.tick_nohz_handler
      5.40 ±  7%      -5.2        0.24 ± 14%  perf-profile.children.cycles-pp.update_process_times
      3.58 ± 11%      -2.8        0.76 ± 66%  perf-profile.children.cycles-pp.__irq_exit_rcu
      2.94 ±  6%      -2.8        0.14 ±  8%  perf-profile.children.cycles-pp.sched_tick
      2.23 ±  7%      -2.2        0.03 ±100%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      1.94 ± 19%      -1.9        0.03 ±100%  perf-profile.children.cycles-pp.ktime_get
      1.20 ± 16%      -1.1        0.08 ± 26%  perf-profile.children.cycles-pp.console_flush_all
      1.20 ± 16%      -1.1        0.08 ± 26%  perf-profile.children.cycles-pp.console_unlock
      1.20 ± 16%      -1.1        0.09 ± 29%  perf-profile.children.cycles-pp.vprintk_emit
      1.16 ± 16%      -1.1        0.08 ± 24%  perf-profile.children.cycles-pp.serial8250_console_write
      1.12 ± 16%      -1.0        0.08 ± 27%  perf-profile.children.cycles-pp.wait_for_lsr
      0.93 ± 10%      -0.9        0.05 ±  7%  perf-profile.children.cycles-pp.read_tsc
      0.88 ± 17%      -0.8        0.08 ± 26%  perf-profile.children.cycles-pp.worker_thread
      3.02 ± 11%      -0.8        2.23 ± 12%  perf-profile.children.cycles-pp.handle_softirqs
      0.80 ± 13%      -0.8        0.04 ± 75%  perf-profile.children.cycles-pp.io_serial_in
      0.84 ± 17%      -0.8        0.08 ± 26%  perf-profile.children.cycles-pp.process_one_work
      0.78 ±  6%      -0.7        0.05 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.commit_tail
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.drm_fb_memcpy
      0.76 ± 16%      -0.7        0.07 ± 30%  perf-profile.children.cycles-pp.memcpy_toio
      0.52 ± 21%      -0.4        0.10 ± 19%  perf-profile.children.cycles-pp.ksys_write
      0.52 ± 21%      -0.4        0.10 ± 19%  perf-profile.children.cycles-pp.vfs_write
      0.48 ± 24%      -0.4        0.08 ± 27%  perf-profile.children.cycles-pp.devkmsg_emit
      0.48 ± 24%      -0.4        0.08 ± 27%  perf-profile.children.cycles-pp.devkmsg_write.cold
      0.40 ± 15%      -0.4        0.03 ±100%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.43 ±  9%      -0.4        0.07 ±  5%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.61 ± 10%      -0.3        0.31 ±  2%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.12 ±  6%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__mod_zone_page_state
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.perf_output_begin
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.count_memcg_events
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.mas_prev
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.uncharge_folio
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.remove_vma
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.vm_area_free
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.__get_unmapped_area
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.uncharge_batch
      0.02 ±142%      +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.do_anonymous_page
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.mas_topiary_replace
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.stress_low_memory
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.vm_area_dup
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.__folio_mod_stat
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.ktime_get_with_offset
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.rcu_all_qs
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.up_write
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.check_brk_limits
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.1        0.08 ±  7%  perf-profile.children.cycles-pp.kfree
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.clock_gettime
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.mas_leaf_max_gap
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.down_write
      0.00            +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.00            +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.mas_push_data
      0.00            +0.1        0.10 ±  6%  perf-profile.children.cycles-pp.mas_next_setup
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.folio_add_new_anon_rmap
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.00            +0.1        0.11        perf-profile.children.cycles-pp.lru_add
      0.00            +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.12        perf-profile.children.cycles-pp.down_write_killable
      0.01 ±223%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.1        0.12 ± 11%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.1        0.13 ±  7%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
      0.00            +0.1        0.13 ±  3%  perf-profile.children.cycles-pp.mas_prev_slot
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.00            +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.mas_next_range
      0.00            +0.1        0.14 ± 15%  perf-profile.children.cycles-pp.mas_destroy
      0.00            +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.mas_pop_node
      0.04 ± 71%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.memcpy_orig
      0.00            +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.00            +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.mas_next_slot
      0.00            +0.2        0.15 ± 16%  perf-profile.children.cycles-pp.get_partial_node
      0.00            +0.2        0.15 ± 37%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.00            +0.2        0.16 ± 18%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
      0.00            +0.2        0.16 ± 16%  perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      0.00            +0.2        0.16 ±  3%  perf-profile.children.cycles-pp.vm_area_alloc
      0.00            +0.2        0.16 ±  2%  perf-profile.children.cycles-pp.__vma_start_write
      0.00            +0.2        0.16 ± 16%  perf-profile.children.cycles-pp.kmem_cache_alloc_bulk_noprof
      0.00            +0.2        0.16 ±  4%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.01 ±223%      +0.2        0.17 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.2        0.16 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.2        0.17 ±  4%  perf-profile.children.cycles-pp.mas_update_gap
      0.00            +0.2        0.17 ±  2%  perf-profile.children.cycles-pp.__perf_sw_event
      0.00            +0.2        0.18 ± 30%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.00            +0.2        0.18 ±  5%  perf-profile.children.cycles-pp._copy_to_user
      0.00            +0.2        0.19 ± 12%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.00            +0.2        0.19 ±  7%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.00            +0.2        0.19 ±  3%  perf-profile.children.cycles-pp.__call_rcu_common
      0.00            +0.2        0.20 ±  3%  perf-profile.children.cycles-pp.find_vma_prev
      0.00            +0.2        0.20 ±  3%  perf-profile.children.cycles-pp.anon_vma_clone
      0.00            +0.2        0.21 ± 26%  perf-profile.children.cycles-pp.rmqueue_pcplist
      0.00            +0.2        0.22 ± 24%  perf-profile.children.cycles-pp.rmqueue
      0.00            +0.2        0.24        perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.2        0.24 ±  3%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.00            +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.try_charge_memcg
      0.00            +0.2        0.25 ± 35%  perf-profile.children.cycles-pp.__put_partials
      0.00            +0.3        0.25 ± 13%  perf-profile.children.cycles-pp.___slab_alloc
      0.00            +0.3        0.25        perf-profile.children.cycles-pp.mas_split
      0.00            +0.3        0.26        perf-profile.children.cycles-pp.mas_wr_store_type
      0.01 ±223%      +0.3        0.26        perf-profile.children.cycles-pp.sync_regs
      0.00            +0.3        0.26 ±  6%  perf-profile.children.cycles-pp.charge_memcg
      0.00            +0.3        0.28        perf-profile.children.cycles-pp.mas_wr_bnode
      0.00            +0.3        0.29 ±  5%  perf-profile.children.cycles-pp.lru_gen_del_folio
      0.00            +0.3        0.30        perf-profile.children.cycles-pp.unlink_anon_vmas
      0.00            +0.3        0.31 ±  5%  perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      0.01 ±223%      +0.3        0.34 ±  2%  perf-profile.children.cycles-pp.perf_iterate_sb
      0.00            +0.3        0.33 ± 66%  perf-profile.children.cycles-pp.__mt_destroy
      0.00            +0.3        0.33 ± 66%  perf-profile.children.cycles-pp.mt_destroy_walk
      0.00            +0.3        0.34 ±  2%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.06 ± 50%      +0.3        0.40        perf-profile.children.cycles-pp.mas_find
      0.03 ±106%      +0.3        0.38 ± 26%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.02 ±141%      +0.4        0.39 ±  4%  perf-profile.children.cycles-pp.zap_present_ptes
      0.00            +0.4        0.37        perf-profile.children.cycles-pp.native_flush_tlb_one_user
      0.00            +0.4        0.38        perf-profile.children.cycles-pp.free_pgtables
      0.00            +0.4        0.38 ±  2%  perf-profile.children.cycles-pp.mas_preallocate
      0.00            +0.4        0.38 ± 19%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.00            +0.4        0.40 ± 24%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      0.00            +0.4        0.41 ±  3%  perf-profile.children.cycles-pp.__slab_free
      0.00            +0.4        0.41 ±  2%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.00            +0.4        0.43        perf-profile.children.cycles-pp.ptep_clear_flush
      0.26 ± 18%      +0.4        0.70        perf-profile.children.cycles-pp.error_entry
      0.00            +0.4        0.45        perf-profile.children.cycles-pp.flush_tlb_func
      0.07 ± 23%      +0.5        0.52        perf-profile.children.cycles-pp.perf_event_mmap_event
      0.04 ± 45%      +0.5        0.51 ±  3%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.5        0.46 ±  7%  perf-profile.children.cycles-pp.mas_alloc_nodes
      0.07 ± 25%      +0.5        0.55        perf-profile.children.cycles-pp.perf_event_mmap
      0.00            +0.5        0.50        perf-profile.children.cycles-pp.clear_page_erms
      0.00            +0.5        0.50 ±  4%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.00            +0.5        0.51        perf-profile.children.cycles-pp.prep_new_page
      0.02 ±141%      +0.5        0.53        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.00            +0.5        0.53 ±  4%  perf-profile.children.cycles-pp.vma_prepare
      0.10 ± 17%      +0.5        0.63        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.02 ±141%      +0.6        0.59        perf-profile.children.cycles-pp.mas_store_prealloc
      0.08 ± 26%      +0.6        0.69 ±  3%  perf-profile.children.cycles-pp.mas_walk
      0.02 ±142%      +0.7        0.68 ±  2%  perf-profile.children.cycles-pp.vma_complete
      0.01 ±223%      +0.8        0.78 ±  8%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.04 ± 71%      +0.8        0.83        perf-profile.children.cycles-pp.mas_wr_node_store
      0.05 ± 47%      +0.8        0.87 ±  7%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.05 ± 49%      +0.8        0.90 ±  6%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.04 ± 71%      +0.9        0.93 ±  7%  perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      0.03 ±103%      +0.9        0.94        perf-profile.children.cycles-pp.__split_vma
      0.00            +1.0        0.96 ± 38%  perf-profile.children.cycles-pp.mt_free_walk
      0.02 ±141%      +1.0        0.99 ± 11%  perf-profile.children.cycles-pp.kmem_cache_free
      0.08 ± 16%      +1.0        1.09 ±  4%  perf-profile.children.cycles-pp.__vm_munmap
      0.08 ± 22%      +1.0        1.09 ±  4%  perf-profile.children.cycles-pp.__x64_sys_munmap
      0.06 ± 14%      +1.0        1.07 ±  4%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.16 ± 16%      +1.1        1.26 ±  4%  perf-profile.children.cycles-pp.__munmap
      0.17 ± 15%      +1.2        1.34        perf-profile.children.cycles-pp.__irqentry_text_end
      0.16 ±  5%      +1.2        1.36        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.00            +1.3        1.26 ± 34%  perf-profile.children.cycles-pp.free_unref_folios
      0.20 ± 12%      +1.3        1.46        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.07 ± 20%      +1.3        1.34        perf-profile.children.cycles-pp.commit_merge
      0.03 ±102%      +1.3        1.34 ±  3%  perf-profile.children.cycles-pp.mas_store_gfp
      0.00            +1.3        1.31 ± 21%  perf-profile.children.cycles-pp.kmem_cache_free_bulk
      0.06 ± 47%      +1.4        1.48 ± 29%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +1.5        1.47 ± 29%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.10 ± 32%      +1.6        1.70        perf-profile.children.cycles-pp.do_brk_flags
      0.10 ± 22%      +1.7        1.78        perf-profile.children.cycles-pp.vma_modify
      0.09 ± 22%      +1.7        1.77        perf-profile.children.cycles-pp.vma_merge_existing_range
      0.10 ± 21%      +1.7        1.80        perf-profile.children.cycles-pp.vma_modify_flags
      0.05 ± 53%      +1.7        1.76 ±  3%  perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      0.00            +1.7        1.73 ± 13%  perf-profile.children.cycles-pp.__free_frozen_pages
      0.09 ± 25%      +1.8        1.87        perf-profile.children.cycles-pp.madvise_vma_behavior
      0.34 ± 15%      +1.9        2.21 ± 12%  perf-profile.children.cycles-pp.rcu_core
      0.11 ± 26%      +2.1        2.17        perf-profile.children.cycles-pp.madvise_do_behavior
      0.12 ± 24%      +2.2        2.28        perf-profile.children.cycles-pp.do_madvise
      0.12 ± 24%      +2.2        2.29        perf-profile.children.cycles-pp.__x64_sys_madvise
      0.01 ±223%      +2.2        2.20 ± 12%  perf-profile.children.cycles-pp.rcu_do_batch
      0.14 ± 28%      +2.3        2.43 ±  6%  perf-profile.children.cycles-pp.wp_page_copy
      0.32 ± 12%      +2.4        2.76 ±  5%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.35 ± 11%      +2.6        2.99 ±  5%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +2.8        2.78 ± 21%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.00            +2.8        2.85 ± 20%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.42 ± 13%      +3.1        3.54 ±  4%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.42 ± 13%      +3.2        3.57 ±  4%  perf-profile.children.cycles-pp.exc_page_fault
      0.21 ± 21%      +3.9        4.06        perf-profile.children.cycles-pp.__madvise
      0.49 ± 10%      +4.0        4.52 ±  3%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.26 ± 18%      +4.5        4.79        perf-profile.children.cycles-pp.brk
      0.35 ± 14%      +6.2        6.60 ±  2%  perf-profile.children.cycles-pp.stress_brk_child
      0.00           +12.9       12.91 ±  7%  perf-profile.children.cycles-pp.si_swapinfo
      0.01 ±223%     +17.3       17.33 ±  4%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      0.00           +17.6       17.60 ±  4%  perf-profile.children.cycles-pp.__page_cache_release
      0.00           +19.2       19.23 ±  2%  perf-profile.children.cycles-pp.tlb_flush_mmu
      0.00           +19.5       19.46 ±  2%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.00           +19.5       19.47 ±  2%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.00           +19.6       19.55 ±  3%  perf-profile.children.cycles-pp.folios_put_refs
      0.04 ± 72%     +19.7       19.76 ±  2%  perf-profile.children.cycles-pp.zap_pte_range
      0.06 ± 13%     +19.7       19.79 ±  2%  perf-profile.children.cycles-pp.zap_pmd_range
      0.47 ± 10%     +19.8       20.25 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.06 ± 15%     +19.8       19.84 ±  2%  perf-profile.children.cycles-pp.unmap_page_range
      0.06 ± 13%     +19.9       19.95 ±  2%  perf-profile.children.cycles-pp.unmap_vmas
      0.00           +21.0       20.99 ±  2%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      0.00           +21.8       21.75 ±  2%  perf-profile.children.cycles-pp.syscall
      0.07 ± 55%     +23.1       23.20 ±  2%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.18 ± 26%     +24.2       24.36 ±  2%  perf-profile.children.cycles-pp.__do_sys_brk
      0.00           +45.2       45.17 ±  2%  perf-profile.children.cycles-pp.nr_blockdev_pages
      0.00           +45.2       45.20 ±  2%  perf-profile.children.cycles-pp.si_meminfo
      0.70 ±  3%     +57.3       58.01        perf-profile.children.cycles-pp._raw_spin_lock
      0.01 ±223%     +58.3       58.30        perf-profile.children.cycles-pp.do_sysinfo
      0.01 ±223%     +58.5       58.50        perf-profile.children.cycles-pp.__x64_sys_sysinfo
      0.12 ± 12%     +60.1       60.19        perf-profile.children.cycles-pp.sysinfo
      0.02 ±141%     +77.3       77.34        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      2.22 ±  5%     +84.4       86.64        perf-profile.children.cycles-pp.do_syscall_64
      2.32 ±  6%     +85.2       87.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     62.62 ±  3%     -62.6        0.00        perf-profile.self.cycles-pp.intel_idle_ibrs
      0.91 ± 11%      -0.9        0.05 ±  7%  perf-profile.self.cycles-pp.read_tsc
      0.80 ± 13%      -0.8        0.04 ± 75%  perf-profile.self.cycles-pp.io_serial_in
      0.75 ±  7%      -0.7        0.05        perf-profile.self.cycles-pp.native_sched_clock
      0.60 ± 15%      -0.5        0.07 ± 30%  perf-profile.self.cycles-pp.memcpy_toio
      0.42 ±  8%      -0.4        0.03 ± 70%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.61 ± 11%      -0.3        0.31 ±  2%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.26 ± 23%      -0.2        0.02 ± 99%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__mod_zone_page_state
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.flush_tlb_mm_range
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.lru_gen_add_folio
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.perf_output_begin
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.remove_vma
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.rmqueue_bulk
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.__kmem_cache_alloc_bulk
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.down_write_killable
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.sysinfo
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.uncharge_folio
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.mas_topiary_replace
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__page_cache_release
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.asm_exc_page_fault
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.clock_gettime
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.flush_tlb_func
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.free_frozen_page_commit
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.mas_find
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.stress_low_memory
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.perf_event_mmap_event
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.unmap_vmas
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.down_write
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.mas_store_prealloc
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.1        0.07 ±  9%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.up_write
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.mas_preallocate
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__do_sys_brk
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.do_brk_flags
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.wp_page_copy
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.vma_merge_existing_range
      0.69 ±  3%      +0.1        0.77        perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.zap_pte_range
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.__cond_resched
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.do_sysinfo
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.handle_mm_fault
      0.00            +0.1        0.10 ±  7%  perf-profile.self.cycles-pp.folios_put_refs
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.mas_update_gap
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.perf_iterate_sb
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.mas_next_slot
      0.01 ±223%      +0.1        0.11 ±  3%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.mas_prev_slot
      0.00            +0.1        0.11 ±  5%  perf-profile.self.cycles-pp.mod_memcg_lruvec_state
      0.00            +0.1        0.11 ±  6%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.mas_store_gfp
      0.00            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.free_unref_folios
      0.00            +0.1        0.12 ±  9%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.1        0.13 ±  5%  perf-profile.self.cycles-pp.nr_blockdev_pages
      0.00            +0.1        0.13 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.1        0.14 ±  2%  perf-profile.self.cycles-pp.mas_pop_node
      0.00            +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.__call_rcu_common
      0.03 ±100%      +0.1        0.17 ±  3%  perf-profile.self.cycles-pp.memcpy_orig
      0.00            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.00            +0.2        0.15        perf-profile.self.cycles-pp.zap_present_ptes
      0.00            +0.2        0.15 ±  2%  perf-profile.self.cycles-pp.__vma_start_write
      0.00            +0.2        0.16 ±  6%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.00            +0.2        0.19        perf-profile.self.cycles-pp.lru_gen_del_folio
      0.00            +0.2        0.21 ±  2%  perf-profile.self.cycles-pp.mas_wr_node_store
      0.00            +0.2        0.21 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.2        0.22        perf-profile.self.cycles-pp.__free_one_page
      0.00            +0.2        0.22 ±  2%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.2        0.23 ±  6%  perf-profile.self.cycles-pp.try_charge_memcg
      0.00            +0.3        0.25        perf-profile.self.cycles-pp.mas_wr_store_type
      0.01 ±223%      +0.3        0.26        perf-profile.self.cycles-pp.sync_regs
      0.00            +0.3        0.31 ±  6%  perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      0.00            +0.4        0.37 ±  2%  perf-profile.self.cycles-pp.native_flush_tlb_one_user
      0.00            +0.4        0.38 ±  2%  perf-profile.self.cycles-pp.__slab_free
      0.25 ± 18%      +0.4        0.70        perf-profile.self.cycles-pp.error_entry
      0.09 ± 18%      +0.5        0.56        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.00            +0.5        0.49        perf-profile.self.cycles-pp.clear_page_erms
      0.00            +0.5        0.50 ±  4%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.07 ± 52%      +0.6        0.68 ±  3%  perf-profile.self.cycles-pp.mas_walk
      0.01 ±223%      +0.7        0.74        perf-profile.self.cycles-pp.stress_brk_child
      0.10 ± 20%      +0.8        0.86        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.17 ± 15%      +1.2        1.34        perf-profile.self.cycles-pp.__irqentry_text_end
      0.16 ±  6%      +1.2        1.36        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.19 ± 12%      +1.3        1.46        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.02 ±141%     +76.8       76.86        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

