Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35E231CA9
	for <oe-lkp@lists.linux.dev>; Mon,  7 Oct 2024 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728292720; cv=fail; b=MCic9f46HX16VgvVHrvgPZ+5vmv+TmyC87RQ4vr+SXFCcHkKLROSJOLRQwDS9L+PIXNDBJAJVffjdZEf1xBaxNjlo/o2GIRnPtTpnpxZ3g9cgRm3F2/CcG2RlwP4yoPZb538NLgTH+1VA4Uj2PG2hh+6Hk0KP4eXopZntVR2fm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728292720; c=relaxed/simple;
	bh=gzwIW6/W6kTC9fERQ/CmAk82U3l+nrlN/dWhS7w4xlc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mL21ZsTHLgvgxukLyE3RnMVvgObQjg6r0FQJqNjJYTeWcl3mkquO0FfqMomscFb2TiTvrIl3mNteoUkEoEj30YmsxtprIZNekMspeqTQW8aCcY3YRRJpgARIz8qADCxT684PqY9GEe5hILPW2omRT7Xal6n1TLQtd3jQCdHKXhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCYyxyIG; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCYyxyIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728292719; x=1759828719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gzwIW6/W6kTC9fERQ/CmAk82U3l+nrlN/dWhS7w4xlc=;
  b=gCYyxyIGZZSVrOcH3zKFK2ZpApULa9AKgDi91LQReEi/wY6Xd/WTOUCo
   rG0BY27cpT3BaOX6A+FDQCIEc0Z0Z8n/DliYT/ffNlj6Aet94CtBdG9Eq
   i45X6bSdvpqkIvolCxns+V+hb8Sg77WIkN/GWlrUy6LuZBq95OCaqTM9G
   amoGO7lyISAdZOjfFo/q0JvuAuULUqRoo1ycysHziJ38qOK13FS+CFjHk
   NzgWhkAFqyOX4Cf/9E2AjUF0rR/IUWFQkiZBDQjrbA59EDx/03NUZhc8j
   oRmJbw7evHwVNOoJf1rJT9jOHP+ZTsP2TABHdzmt65pwvspmZRof2Ucjf
   g==;
X-CSE-ConnectionGUID: 6ODPWgBiQ7uOoCsePks0FA==
X-CSE-MsgGUID: Fia21+x8QD2YrcAPJ/+5YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27244182"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27244182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 02:18:38 -0700
X-CSE-ConnectionGUID: GcSpMjevQVutOx0vTIT5rQ==
X-CSE-MsgGUID: +TubtHUsQKCKsPtsHbK1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="76239499"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 02:18:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 02:18:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 02:18:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 02:18:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 02:18:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2B7/6hVDi3LfC8To2ZlhNbJM1r6FNXAdTLf2nNBQy+nEtMfoWGGhKsZYwMQM8birK+kROILKYCD5KKJ2vFbs4F21MkIk22yMI8vVWEL2aLmyWX0AGs9asWGDZrArn4+u2l6tPUDENrFNj0qE/r9vXF6DQ/hMRxhSWxiWe+bLAWjmujh84HAorPiP1xZYd6qz6qCjxIwf2wo0eSJRACwG+jJLsLbdPI9ArvB7r0FCep2q4xXBbjmskmnE9dsu2eFrVw6hvvivUK8nc63jjfj+aQwfM02f3egkJCeBc//NFx6G6k3aOhCb5SF9AvFcGWnp5k7ZFvGDT6iQ7TssFu2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTP0ro23sHRlT0a4CFaJT0HMYpTsNO5oMCon9xBa8G0=;
 b=CcSMhSgiw5poOlt5LtLqhbW8W5m0S7yeA7uXC0FVyZcXOEH737Ld6iL0TXv6m2fR6Q6a6nkZN/z0DBvKG7vTFoNysDAixob4AsLmQBzACM4eKomNdrmepuvi235LOZOAlK4N1mvbkEEUNhmCrKhqtjHoPCluUUYtBQ75eG3kLgHXV3LH1m7hPRANKhvtkvFGAWPKfjdRNN1dtsvciMEIyBBNMnRZx9jkwgZc67eFnxda0LNevvTtHSSKXlLgzrVbysqfPptnRbik3eKggWy5gQgSK+5XNAc29d75FoWB7JgYRwYrRtGnmrgMJRoirDpCLygDwItKeRT9vLXIhRf+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 09:18:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 09:18:34 +0000
Date: Mon, 7 Oct 2024 17:18:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jann Horn <jannh@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@redhat.com>, Hugh Dickins <hughd@google.com>, "Matthew
 Wilcox" <willy@infradead.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/mremap]  46c1b32792:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202410071657.6db43df2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e67b64-6942-4abe-88d0-08dce6b10461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QEPt4n3OAa4W+UABgAd18btNUjPwSroVkM4pSTTtkowxifdAbYhh0+dQ8QRJ?=
 =?us-ascii?Q?bXGAMoAj7u+FM6IOr7Ch0DXet4+9OiSp9eKvy1soJOOdaM7eWvLxisMCIUnC?=
 =?us-ascii?Q?ZbkrpSGBDs5Hq2/JFGOTaxSHK0Rhyk/rQhF1M2iHprQaNwOKk1Ewvcv7jTKe?=
 =?us-ascii?Q?huG3Yq/USTRVN0m8mHNP8BBdPuXERPKpKgmuVgIYNUuNDV5wYID6CNLav092?=
 =?us-ascii?Q?xn7+LwrSmvR96MlOeRKZnFvSRQ3AnqjzGK2ng9v/i+s1SB33D6YOZWVr6j5V?=
 =?us-ascii?Q?SKeKfrQ3PmWrsBQPAJAxV1FMoiVyRWQJ1DxkSFvtZHqHX/i7XunVPCLRzhxd?=
 =?us-ascii?Q?1+Ry4v9ydu0BJHLPBJw2fKaMQSSE/r/gMo6iSoKD8FGCefMrf3cHHy0LScfI?=
 =?us-ascii?Q?Tpx/CxJglrcIlrUGsmUIilaz69Comuiaz5kczAMOlAjs/qlSWoXA3z18+16m?=
 =?us-ascii?Q?T/d1Y6HlqvS3mkxGY0Y58fLTPfUzwPhvEuoz5FQEgIQUewk6t2fifiWsvWs1?=
 =?us-ascii?Q?A/wOBKyVVNqOqv2QVS4Uj9VnMU5cFwQl2ijVMskLj4MrgKRUfzKpvxEUwbeY?=
 =?us-ascii?Q?xpgF7247C9TTJV5VGzX2fPxQ4vaCtUEUp+pUQNb8cv//DjXNhWh5PtyMSS6Y?=
 =?us-ascii?Q?Y3laB8Nz57bwt+4lSI36Mw394DiGH4JRIh5t4dxYhgtjsqZlij5IBJ6DwOth?=
 =?us-ascii?Q?jL1iPq79qP55MntwkTnCMVQjI6QGzst9Po7oAEIs2pepztdFhOtiAMcwP64F?=
 =?us-ascii?Q?kg6GvRG4O5S2tKG1NRcNm6SGvuT23l9z1QsDe/tD0sL1DVKdAeZWjODU8wqE?=
 =?us-ascii?Q?w60AUngkgXPYVRdubXX8lgEoQ72foE9WgwKFIWSyikdDvXT5+sPZqAY9x7ei?=
 =?us-ascii?Q?8o5gGcmu6+o4ByRRbG6lpNGiudek9Lp+L9uWbM24hM8SFjlBrIb3/ZFlKb/9?=
 =?us-ascii?Q?0KiVRL6EuU8nc557eeLpUMt6InxC9+0WUwX4NJSqyl0SqSuXlQy9haKwczWc?=
 =?us-ascii?Q?QYaVftocIl4trQnunVQEnvNQARnV06mTQZ2U5QVf0TRsPGSwOtv+4N9QUrjI?=
 =?us-ascii?Q?KRPhXIVqCXrcMnhEMtUENQBjwMF5olTnu70eTKErbm2MTJumgFYjK5jhpaiP?=
 =?us-ascii?Q?7KgWZvHMdTWXlTtDwLaI9Ng2PiWlSv+tFbfs5myntIcqnWwlcRC+56drhCDx?=
 =?us-ascii?Q?nvCGS8gwzONJucc7XpmroOPpjxMG6N7rF0dn/YKmJWDdcexkMARdiKIPctK/?=
 =?us-ascii?Q?VTAHFzBj3UmHkooZqOpCM4zTQ+aFxEr0KzaQClE3ZLMCgeZ64KI/il/pTvdV?=
 =?us-ascii?Q?AyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gtsFQkIsN2FBPo/uXftGgm+8O0NvK7WkkoX14cV8RCKTyAI6EDEmPNA/r0O7?=
 =?us-ascii?Q?Xbw2h99rrUyDy7nGa1gCwujeCFLmgdJtk4DiSZYCZcn6a+suPlW7mR93BGSQ?=
 =?us-ascii?Q?Iz6Wu2YmYFVMyMpy+/xLVUi4doGb0rf2AuYy4LbC3iaLcs1UOHvMVChrIOEz?=
 =?us-ascii?Q?8cAiVHdIpaqUiQqhwNcJUxr9SIMBWNnlRj1cjSX8U17YIO5X//leAGlQqDJC?=
 =?us-ascii?Q?XkI1nzwKiZNqcUijIiap9MPA8O/lP+0vpebfpmHbuqVE6KOPWhjBkGSWXNzk?=
 =?us-ascii?Q?9mu0FPrzCKdLozHSbJ93mVhWlg52eIBnXvR9QPEc9FF3dWAwS2cRGWTS7m8S?=
 =?us-ascii?Q?CbVgvokDegE6GZ65FdBmmojipHxKug08psFnFt+x9lzuzHNdN3tljmAZqhu0?=
 =?us-ascii?Q?5zAlG3F5I1jqizL6X34qgXP7k5EKDhVJgPt3DTrLALh4jhekkHBrPVpOTfsd?=
 =?us-ascii?Q?SbAjgLcmvV//nDG2+V6RQbgI2wJogIFHTfNPK4q4typ1s5zvluhX94qLk3L0?=
 =?us-ascii?Q?qXim2QUQjuwt7hNkeLNc8s0QFBbUcJxGSVb30DmXE3GRo9if1goEq3lI8FZR?=
 =?us-ascii?Q?LDIGXAXZzDMVDdyfxZnYnFn4ORrsICEle1pSpms2w8dkSuxvfmdongLk6l26?=
 =?us-ascii?Q?dkzVxzjXI1fhaJAlTBId5vUYDvFRxdVwR4bn7EXjWonCQHdUFeF468pubcKS?=
 =?us-ascii?Q?yNt7Zzk1on4GtCugscaC4WV8g3qih0ODVRUUhyHQKeAbypE8TA0DPI/qzMdf?=
 =?us-ascii?Q?BILbPCoLUX8tyyGL4YSpQLNJMC7ioz8fhZTYNGxsAqnOnuaqXS/TlQ2k5+zq?=
 =?us-ascii?Q?JdxzvSNb7pMYNgOEuZv9Rs4NiYhLpLkk6fT7Rv/sIC29AbKUEP0upU9jx6B2?=
 =?us-ascii?Q?0SNZiZbms+dIIS8F3P2HLlEXL7VaAsfFaoAD/B4O3E+zyVH8C2azyQYmx0NS?=
 =?us-ascii?Q?IeAYnsF/fOOruUgX6ePtzWxGFIM87lkj8mOl7bxTRkDrgyay5nT8AXkmPOrF?=
 =?us-ascii?Q?X4yFY3n1PKCSWL+7xWzKN1Ghpk7NmBEDNJh3/rh0k7RJPDimRSmXLE/bCJOp?=
 =?us-ascii?Q?wR6kcQNIdaB3bRzd98nEupyYnPz7qGjSsMTgu6P6QtAwulH3OKq8N29VjgW8?=
 =?us-ascii?Q?edrv+2OaowQwCi8GyCbjlslmduOFYXcWUXHFsE0T2UP5FVJrLXr6bKrS07YC?=
 =?us-ascii?Q?0qlDhLMudwiQlzbILAEgNh6ZgbBMJ9eV6u+sZeFW1keH0X6pOzoQI7qKKpla?=
 =?us-ascii?Q?JmFrq/CKe34glnb5pxknJyKBZaXNPGypPNLm3roGVxSFoFfmmGjOHOKtOScY?=
 =?us-ascii?Q?TSKSG14+Ezb1pR+Pa5wchfnAhEPx3RJN3GYA12mjB4aD8U/Oajy1n8mP0pYq?=
 =?us-ascii?Q?Guw2lh5R1Rxqwq+3ZRiC2MykzSZ1MnNERpr+/UFwo535IWqydfzrIcdAE0Hx?=
 =?us-ascii?Q?Rz3hllwhnfFtoneCJgLDnDJEFlNanKXuotxeO3ESmhG2yjYYuRgSJ6bOw0Z/?=
 =?us-ascii?Q?2vMeNA/LtmuWD8KKWRswoMQrR/FKX6azc3aeaJW3aKSos0+tfkGVcT1c6uDE?=
 =?us-ascii?Q?wxHPl+BY/BcGasw2pXzc7Hcg+Isqm4yVP+RrlRBtV1ckDk9TucAcbt5seFdS?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e67b64-6942-4abe-88d0-08dce6b10461
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 09:18:34.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HX/CnCaoETCz2NZfWi1ZjLvqcMOoV8+I4y4g53S81s3n/+Xr4VeED5Bgmd/r3iF8R+MuxTAhZi8mdD8m8CZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: 46c1b3279220368b60bfa63d4f66452ca860d03b ("mm/mremap: prevent racing change of old pmd type")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 58ca61c1a866bfdaa5e19fb19a2416764f847d75]

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410071657.6db43df2-lkp@intel.com


[    4.678777][   T65] WARNING: possible circular locking dependency detected
[    4.678777][   T65] 6.12.0-rc1-00018-g46c1b3279220 #1 Not tainted
[    4.678777][   T65] ------------------------------------------------------
[    4.678777][   T65] modprobe/65 is trying to acquire lock:
[ 4.678777][ T65] ffff9463c2b8e508 (&anon_vma->rwsem){+.+.}-{3:3}, at: vma_prepare (mm/vma.c:182) 
[    4.678777][   T65]
[    4.678777][   T65] but task is already holding lock:
[ 4.678777][ T65] ffff9463c62b4900 (&mapping->i_mmap_rwsem){++++}-{3:3}, at: vma_prepare (mm/vma.c:168) 
[    4.678777][   T65]
[    4.678777][   T65] which lock already depends on the new lock.
[    4.678777][   T65]
[    4.678777][   T65] the existing dependency chain (in reverse order) is:
[    4.678777][   T65]
[    4.678777][   T65] -> #2 (&mapping->i_mmap_rwsem){++++}-{3:3}:
[ 4.678777][ T65] __lock_acquire (kernel/locking/lockdep.c:5202) 
[ 4.678777][ T65] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 4.678777][ T65] down_write (arch/x86/include/asm/preempt.h:79 kernel/locking/rwsem.c:1325 kernel/locking/rwsem.c:1578) 
[ 4.678777][ T65] dma_resv_lockdep (include/linux/fs.h:517 drivers/dma-buf/dma-resv.c:795) 
[ 4.678777][ T65] do_one_initcall (init/main.c:1269) 
[ 4.678777][ T65] do_initcalls (init/main.c:1330 init/main.c:1347) 
[ 4.678777][ T65] kernel_init_freeable (init/main.c:1584) 
[ 4.678777][ T65] kernel_init (init/main.c:1471) 
[ 4.678777][ T65] ret_from_fork (arch/x86/kernel/process.c:147) 
[ 4.678777][ T65] ret_from_fork_asm (arch/x86/entry/entry_64.S:254) 
[    4.678777][   T65]
[    4.678777][   T65] -> #1 (fs_reclaim){+.+.}-{0:0}:
[ 4.678777][ T65] __lock_acquire (kernel/locking/lockdep.c:5202) 
[ 4.678777][ T65] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 4.678777][ T65] fs_reclaim_acquire (mm/page_alloc.c:3835 mm/page_alloc.c:3848) 
[ 4.678777][ T65] __alloc_pages_noprof (include/linux/sched/mm.h:319 mm/page_alloc.c:4493 mm/page_alloc.c:4722) 
[ 4.678777][ T65] alloc_pages_mpol_noprof (mm/mempolicy.c:2267) 
[ 4.678777][ T65] __pud_alloc (include/asm-generic/pgalloc.h:175 include/asm-generic/pgalloc.h:195 mm/memory.c:6300) 
[ 4.678777][ T65] alloc_new_pud+0x158/0x180 
[ 4.678777][ T65] move_page_tables (mm/mremap.c:581) 
[ 4.678777][ T65] relocate_vma_down (mm/mmap.c:2308) 
[ 4.678777][ T65] setup_arg_pages (fs/exec.c:811) 
[ 4.678777][ T65] load_elf_binary (fs/binfmt_elf.c:1177) 
[ 4.678777][ T65] search_binary_handler (fs/exec.c:1752) 
[ 4.678777][ T65] exec_binprm (fs/exec.c:1795) 
[ 4.678777][ T65] bprm_execve (fs/exec.c:1846 fs/exec.c:1821) 
[ 4.678777][ T65] kernel_execve (fs/exec.c:2012) 
[ 4.678777][ T65] call_usermodehelper_exec_async (kernel/umh.c:119) 
[ 4.678777][ T65] ret_from_fork (arch/x86/kernel/process.c:147) 
[ 4.678777][ T65] ret_from_fork_asm (arch/x86/entry/entry_64.S:254) 
[    4.678777][   T65]
[    4.678777][   T65] -> #0 (&anon_vma->rwsem){+.+.}-{3:3}:
[ 4.678777][ T65] check_prev_add (kernel/locking/lockdep.c:3162) 
[ 4.678777][ T65] validate_chain (kernel/locking/lockdep.c:3281 kernel/locking/lockdep.c:3904) 
[ 4.678777][ T65] __lock_acquire (kernel/locking/lockdep.c:5202) 
[ 4.678777][ T65] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 4.678777][ T65] down_write (arch/x86/include/asm/preempt.h:79 kernel/locking/rwsem.c:1325 kernel/locking/rwsem.c:1578) 
[ 4.678777][ T65] vma_prepare (mm/vma.c:182) 
[ 4.678777][ T65] __split_vma (mm/vma.c:422) 
[ 4.678777][ T65] vma_modify (mm/vma.c:1435) 
[ 4.678777][ T65] vma_modify_flags (mm/vma.c:1452) 
[ 4.678777][ T65] mprotect_fixup (mm/mprotect.c:665) 
[ 4.678777][ T65] do_mprotect_pkey (mm/mprotect.c:839) 
[ 4.678777][ T65] __ia32_sys_mprotect (mm/mprotect.c:856) 
[ 4.678777][ T65] do_int80_emulation (arch/x86/entry/common.c:165 arch/x86/entry/common.c:253) 
[ 4.678777][ T65] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[    4.678777][   T65]
[    4.678777][   T65] other info that might help us debug this:
[    4.678777][   T65]
[    4.678777][   T65] Chain exists of:
[    4.678777][   T65]   &anon_vma->rwsem --> fs_reclaim --> &mapping->i_mmap_rwsem
[    4.678777][   T65]
[    4.678777][   T65]  Possible unsafe locking scenario:
[    4.678777][   T65]
[    4.678777][   T65]        CPU0                    CPU1
[    4.678777][   T65]        ----                    ----
[    4.678777][   T65]   lock(&mapping->i_mmap_rwsem);
[    4.678777][   T65]                                lock(fs_reclaim);
[    4.678777][   T65]                                lock(&mapping->i_mmap_rwsem);
[    4.678777][   T65]   lock(&anon_vma->rwsem);
[    4.678777][   T65]
[    4.678777][   T65]  *** DEADLOCK ***
[    4.678777][   T65]
[    4.678777][   T65] 2 locks held by modprobe/65:
[ 4.678777][ T65] #0: ffff9463c0050a70 (&mm->mmap_lock){++++}-{3:3}, at: do_mprotect_pkey (include/linux/mmap_lock.h:122 mm/mprotect.c:740) 
[ 4.678777][ T65] #1: ffff9463c62b4900 (&mapping->i_mmap_rwsem){++++}-{3:3}, at: vma_prepare (mm/vma.c:168) 
[    4.678777][   T65]
[    4.678777][   T65] stack backtrace:
[    4.678777][   T65] CPU: 1 UID: 0 PID: 65 Comm: modprobe Not tainted 6.12.0-rc1-00018-g46c1b3279220 #1
[    4.678777][   T65] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    4.678777][   T65] Call Trace:
[    4.678777][   T65]  <TASK>
[ 4.678777][ T65] dump_stack_lvl (lib/dump_stack.c:123) 
[ 4.678777][ T65] print_circular_bug (kernel/locking/lockdep.c:2077) 
[ 4.678777][ T65] check_noncircular (kernel/locking/lockdep.c:2209) 
[ 4.678777][ T65] check_prev_add (kernel/locking/lockdep.c:3162) 
[ 4.678777][ T65] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 4.678777][ T65] validate_chain (kernel/locking/lockdep.c:3281 kernel/locking/lockdep.c:3904) 
[ 4.678777][ T65] __lock_acquire (kernel/locking/lockdep.c:5202) 
[ 4.678777][ T65] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 4.678777][ T65] ? vma_prepare (mm/vma.c:182) 
[ 4.678777][ T65] down_write (arch/x86/include/asm/preempt.h:79 kernel/locking/rwsem.c:1325 kernel/locking/rwsem.c:1578) 
[ 4.678777][ T65] ? vma_prepare (mm/vma.c:182) 
[ 4.678777][ T65] vma_prepare (mm/vma.c:182) 
[ 4.678777][ T65] __split_vma (mm/vma.c:422) 
[ 4.678777][ T65] vma_modify (mm/vma.c:1435) 
[ 4.678777][ T65] vma_modify_flags (mm/vma.c:1452) 
[ 4.678777][ T65] mprotect_fixup (mm/mprotect.c:665) 
[ 4.678777][ T65] do_mprotect_pkey (mm/mprotect.c:839) 
[ 4.678777][ T65] __ia32_sys_mprotect (mm/mprotect.c:856) 
[ 4.678777][ T65] do_int80_emulation (arch/x86/entry/common.c:165 arch/x86/entry/common.c:253) 
[ 4.678777][ T65] ? page_ext_get (include/linux/rcupdate.h:337 include/linux/rcupdate.h:849 mm/page_ext.c:525) 
[ 4.678777][ T65] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 4.678777][ T65] ? local_clock_noinstr (kernel/sched/clock.c:270 kernel/sched/clock.c:306) 
[ 4.678777][ T65] ? local_clock (arch/x86/include/asm/preempt.h:94 kernel/sched/clock.c:316) 
[ 4.678777][ T65] ? __lock_release+0x13c/0x2c0 
[ 4.678777][ T65] ? page_ext_put (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 mm/page_ext.c:550) 
[ 4.678777][ T65] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 4.678777][ T65] ? local_clock_noinstr (kernel/sched/clock.c:270 kernel/sched/clock.c:306) 
[ 4.678777][ T65] ? local_clock (arch/x86/include/asm/preempt.h:94 kernel/sched/clock.c:316) 
[ 4.678777][ T65] ? __lock_release+0x13c/0x2c0 
[ 4.678777][ T65] ? rcu_read_unlock (include/linux/rcupdate.h:347 (discriminator 9) include/linux/rcupdate.h:880 (discriminator 9)) 
[ 4.678777][ T65] ? rcu_read_unlock (include/linux/rcupdate.h:883 (discriminator 9)) 
[ 4.678777][ T65] ? wp_page_copy (mm/memory.c:3480) 
[ 4.678777][ T65] ? mark_usage (kernel/locking/lockdep.c:4650) 
[ 4.678777][ T65] ? __lock_acquire (kernel/locking/lockdep.c:5202) 
[ 4.678777][ T65] ? __lock_acquire (kernel/locking/lockdep.c:448 kernel/locking/lockdep.c:5190) 
[ 4.678777][ T65] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5827 kernel/locking/lockdep.c:5790) 
[ 4.678777][ T65] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 4.678777][ T65] ? local_clock_noinstr (kernel/sched/clock.c:270 kernel/sched/clock.c:306) 
[ 4.678777][ T65] ? local_clock (arch/x86/include/asm/preempt.h:94 kernel/sched/clock.c:316) 
[ 4.678777][ T65] ? __lock_release+0x13c/0x2c0 
[ 4.678777][ T65] ? __ct_user_exit (kernel/context_tracking.c:627) 
[ 4.678777][ T65] ? vtime_user_exit (include/linux/seqlock.h:429 include/linux/seqlock.h:501 kernel/sched/cputime.c:738) 
[ 4.678777][ T65] ? trace_user_exit+0x10c/0x180 
[ 4.678777][ T65] ? __ct_user_exit (kernel/context_tracking.c:627) 
[ 4.678777][ T65] ? trace_hardirqs_off_finish (include/trace/events/preemptirq.h:36 kernel/trace/trace_preemptirq.c:78) 
[ 4.678777][ T65] ? do_int80_emulation (arch/x86/include/asm/jump_label.h:27 arch/x86/entry/common.c:229) 
[ 4.678777][ T65] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[    4.678777][   T65] RIP: 0023:0xf7f125ed
[ 4.678777][ T65] Code: 8b 7c 24 0c 50 e8 06 00 00 00 89 da 5b 5b 5f c3 8b 04 24 05 77 ec 04 00 8b 00 85 c0 74 06 50 8b 44 24 08 c3 8b 44 24 04 cd 80 <c3> 55 50 8b 6c 24 0c 8b 45 00 8b 6d 04 50 8b 44 24 04 e8 b9 ff ff
All code
========
   0:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
   4:	50                   	push   %rax
   5:	e8 06 00 00 00       	call   0x10
   a:	89 da                	mov    %ebx,%edx
   c:	5b                   	pop    %rbx
   d:	5b                   	pop    %rbx
   e:	5f                   	pop    %rdi
   f:	c3                   	ret
  10:	8b 04 24             	mov    (%rsp),%eax
  13:	05 77 ec 04 00       	add    $0x4ec77,%eax
  18:	8b 00                	mov    (%rax),%eax
  1a:	85 c0                	test   %eax,%eax
  1c:	74 06                	je     0x24
  1e:	50                   	push   %rax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241007/202410071657.6db43df2-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

