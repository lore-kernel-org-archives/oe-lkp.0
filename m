Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB8E573
	for <oe-lkp@lists.linux.dev>; Thu, 12 Feb 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909135; cv=fail; b=PurTmRfYsBSiDzKJ5/+9cQM4v0HXAzN6CI0ap6UiDk0qih9jHKsB52VXbfNFbOoT3CrZKMYWOVgnO9dbMf+xsTvuwWifNgaBUq0SuezmUOvMOHQ/VobdBGV9zws9BTSxJrptz3qa+K3ZTdPOLV42BSHLG6NBatUxfjh6zQB0vSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909135; c=relaxed/simple;
	bh=7wmMi5n9wPsGkg+Qbm+wYbyD6IgZcSq4DbLsmMXx9F8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Xgkm/+KTLTVo1qEZjCt+0QCmd+6REs2tNmx2pSngKmk2u9dbIVtnnb3XPviqGaFFIUSVMB+V0CseGmt6SeiA+eLWqLMqq6sa3xA+uRGUZqZfPLudUaNl3qcA0zIFas3tWSZrt9eIlgyXWmuyLnYuVyHv5PGEraAnwzT5GjhrIBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFass1FM; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFass1FM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770909133; x=1802445133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wmMi5n9wPsGkg+Qbm+wYbyD6IgZcSq4DbLsmMXx9F8=;
  b=iFass1FMoOAhVFjCYVXNUGojRUNZsyE6bE2Dt65+fjrfuui5gSRB2eht
   kOAyBZaVPwGvq8cVq5cHWE21vAIy2VOeOuxJoZlN94nZGGgLS0WH1yNrA
   VWd78n+S4JYHY//CZvb/jQgl9ua/eDefiz4QB67ZGrKaw56ukDNDh2ctL
   M84csx/xg/l+TIMWCGJVZ8FTWvtS/GEycR8srko8/6vO1PF7o55xAKXzH
   OJLCKSvfnwm43WtfwD6hWUqML9sbSpF9bPmfc3kEJ9arV99069ImlpmZm
   0VgUEYAUn2r3BpIpoedXGfMQFGVhE2fB83eS5sQUZE2515X2sJZa2YgGX
   Q==;
X-CSE-ConnectionGUID: A5n94SnLT6SaSc80FeS1Zw==
X-CSE-MsgGUID: FXAa0G6YQtKU2pWCGsNy/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75925028"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="75925028"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 07:12:12 -0800
X-CSE-ConnectionGUID: ix64DR02QSWt7qJC38fn9w==
X-CSE-MsgGUID: pqgBdHukQ1eQfwLdF6eLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="217587190"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 07:12:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 07:12:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 07:12:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 07:12:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/YBDxxSA4ay8dS3XD0OpTLHEh2sN0oWNNCRIuvU6YpDF1OdL8HbWyiSV3S0EvvRp4UzWIqf5W/btmZNSvFDLVM9NnBzXyMwYl6iDHFB9KyzAK+eoN0SefsvMG7mSEBxqTue1CrF6q3gpVYw5NffsBdbQBBSluURpyVv/crGsMQT2CJXfXmcGWO7ZLIKhnAw/kfoU4jrMA/FdgmCEQtmOO/rs6hI94pnZqFpN2k+sztIfIIXalGvPCW8Dma3+btYwggvlTEYcXyvECPhfMFeviaHgsoHEaGy1b0S2py26NN74ZA5BqP23ELklnuDtc3w9bCXk9VU7pBaPJOYYOU2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r2V4AVsE47+tg3yZ5m51dQOR5rASrpEMIwMsqLI3j0=;
 b=aHWlTqdgwqdj1WddDcedDhXQoyvv5Qygq3cyAVZEi9aTxrhZgLi3s+Rc02IBFizzeeODv53Er+Dx/Eg2COyop/Adv8JDrjq/ho7pjQKxkoKXYOAiK46nyskXqrZNo7gTt8QrxXE3xA6ZFv1h0Z3BIBjs8EEC0F54prLCIGr39cG/5OUd8EVWuvF/6Nger3Xb4QhzFBQe77c3CG+t2fVVRpXlF2qSMSC+VGpGysGdPzTkWpSfAppIDjkbaXYvgzJ/BZ/Dc+a4vN8EUbddP0YgFU7B52ih36OOnFOmShY43qWIq5GNAR3YliWNf9pnHeywmGbNmd0dzNnJba80ifn7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 15:12:08 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 15:12:08 +0000
Date: Thu, 12 Feb 2026 23:12:00 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:work.xattr.socket] [kernfs]  3631352a7a:
 BUG:sleeping_function_called_from_invalid_context_at_kernel/workqueue.c
Message-ID: <202602122354.69217204-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: f11da349-6f8e-4768-d016-08de6a4916eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QDoq4l3HQ07Ne3ogacGNguwnhtXWjVAXDJS39O7SVixbxLJCYPneo+rQDJ2C?=
 =?us-ascii?Q?EWd4917LuP/apjX3WA5MuVnR6HEYEnedHBZVTXoq03dV2nkCbUfoCpfjBtId?=
 =?us-ascii?Q?xGf2sVmyAWNUWwj2mf0nU3Xai9bHyaaWw3gsHmwBT49uoZHmRd8ZQSxtQzAb?=
 =?us-ascii?Q?Y3F5aPeDd+RH28Ttiaj2Jt8CNmxj9tOQml0UzpUwE2pbxzBwO7AN18zgvHLi?=
 =?us-ascii?Q?uXlCMboGrhshknM7PxYDvxoLgO/Yx9VxTHZZVFqgZ1838ab0SDveZO9mVy76?=
 =?us-ascii?Q?G5O2FRNGdGyoQ5gf/wZZKDBob4sRmGiR4tl4dG6rqs6y/jYjzIG+ma7QsZ4r?=
 =?us-ascii?Q?/S++Q01f8MfozXelacI1E0Zh48KwA0cjANnmBzu9ZIPos0gMmnSMzE7F7GtZ?=
 =?us-ascii?Q?eXsgAkDyhry6EOohz42FpiZ8nt0fHWqnPboR6xx7zy3I6b6s+Rmx4hj/9U/c?=
 =?us-ascii?Q?YH+vYWKroOBKNJW3qD1UbeXUsBsKIVMgtfT6MSBhD6jFsKhzc4tkgDk9B0cp?=
 =?us-ascii?Q?wnip7elInqRPFccos3bNfXIEX5b5Rj9nu0Q1Gsl347/D955pG+PLbjSMacbB?=
 =?us-ascii?Q?8LYMCEp4s/6vvhsXRyRr+0hu4u10KGINhgetyT2OTc0nTOFUkVWVsjMY6kxU?=
 =?us-ascii?Q?TfZWCnHVHXUasZC70UXW8BrZsTjQjuqXk/I+GGsO0iRcToXllzLt7dzgCXnE?=
 =?us-ascii?Q?WJtIGE/hleapFpZpUOBe7VOL8CMFhi5inOnCDjQsK8b0OojcilIuEzL5S6XJ?=
 =?us-ascii?Q?pvC1aDmKqYq076zkuZpe+zgiblyjYe+1WSiqQNKeALCq12yMoogl+CpM3XEg?=
 =?us-ascii?Q?iLBn16z65HHaXNwiI4g5W4x1Fic0fyKQQSD5fjiKj0ENAki6x1vGnqxAPH2V?=
 =?us-ascii?Q?pQGlYGnXa+2fGcJ1+zI614ImBRfG576ljEMw7DrOYNnZSn5ThRR+zBV1/+HD?=
 =?us-ascii?Q?0LVcvjMxP35uKtWTh1Emmlf2QI196WJ0FjJpJ0t5LgfSUKM7yR5dHBrvvZrd?=
 =?us-ascii?Q?aeucrVnYngKEvwUyzNbLoGgCXU2yDTJE+3GV+ENENnQ8101FIBrXD5pNeJCE?=
 =?us-ascii?Q?ZOCiBL+qiyKP8EAK/230265Py0vAGKWoJDR4nD7xPeIWqU2KUHmzkLffN5kW?=
 =?us-ascii?Q?W3Qk16ti7R4wRLIns0qJp2A/KKJWNwmwDO700+wfY4OlFfIdOmML8W4xNd4K?=
 =?us-ascii?Q?r0Ti8z9CaPWxkIIOSELS17iUs8qZ5jWaCvS/aIw9UEj13Y73He+yn+Dl/yKO?=
 =?us-ascii?Q?Po9hNdROip/81v1rbRzSRDEmnNMVmngzDhO19LXprPVU0O0e4b3KEp3u3QRi?=
 =?us-ascii?Q?2wdYdgAoUjXDQKnhwU6dtoxPjoetdEQa7jAcT3PFYRM3evsBGyCydFOko1Q5?=
 =?us-ascii?Q?1UNoKWB82jvBnMJDd8OTR0Yh4eWQoHH7l6IGTOgLQoYWOadup7MtWfL44CI+?=
 =?us-ascii?Q?T2Ny4pSgJqChl0OmDecRAYs+OLiPCEFfQLPEGB2ZigccLP8XaK0WNwDkxvx/?=
 =?us-ascii?Q?tpfRjH6qEha5ZVlG7VRDikvDj7HD5uJOK+83nR50FD9gL/O8BydhHQ9OUiq2?=
 =?us-ascii?Q?HWFNbqbPyOYuJzBtXnmbCYkZ0rBBrSuG9JFLaJo2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlxMx7B9epa3gv7X6Zt8vQVR6WU4Ih7NPVeofLBkfYwAZ8abRc9wZBo/egUE?=
 =?us-ascii?Q?ThDLZPUY8GgAFnZQ++0oXO+orLuCRsFEcFuIao6fLTpgzheqIcKHPyByUupF?=
 =?us-ascii?Q?zQjJw4DFyW5+eh40/h3DvhmLDQOTJASg2cO4DCo+mSkn3kWSZ9kf3jpe1AIA?=
 =?us-ascii?Q?kKSmSA2K/ivRNKkEIy1uMlKt1bF6vnqBSuwaFXw9uTrEuQbD4d2AU9Kxh/f7?=
 =?us-ascii?Q?VjjdQsDIm0WdyCbKbYn+CY+u9lPSgeFGabdJNeO8AmupW3xsD68qALB2UmLL?=
 =?us-ascii?Q?jUaC4uijOjaBdTHrbEspKpJWHXBLPg5+UZA5XKxiUAb/HWJNXWP7Z08BpnB3?=
 =?us-ascii?Q?pVgu/20vJOxktM0Bu5Y1bR23qnaFanHZumXWb50kiEICza63VSiQU/4NLGRq?=
 =?us-ascii?Q?IKr37ffLMYMlYy9wYPuXbPi+D8KWUxz62e0H8UXo191hY9zw/UBgeos1qVD7?=
 =?us-ascii?Q?5bT7O8Dz5DtVQFzXh0U1Jpv9RWDkyK4EvJLjhZkZLj7a5xTv+dA5GkhwkTGo?=
 =?us-ascii?Q?Uz5aVXCTEpBwTntUe0x75ZCGuTHhHqyUSl3zygIwA5fTROS3NSW9cuwmDFIm?=
 =?us-ascii?Q?tnI+j4s2jEOe1/vAt5wqj1j+WgRIivodY8lBEkCWh1Pd3JJViHW2yZ3D1yme?=
 =?us-ascii?Q?OZLvMCd+vBSFCrgJP2buGkyszIhXTsB8Vkw1WNvTj+LWM9xBbRSy4COZ7cDc?=
 =?us-ascii?Q?wZ0t/Z6RaGehvjD3wuOylqnQ5a5K1LSYN4/9RQ/Jrsq7+3xiqaEFmZXe76Ih?=
 =?us-ascii?Q?OSTIEeRb3XebOoQOGRgrfjJZWV+ipa3/rBbglIoUejzCcYZk4f39ulfqsPHj?=
 =?us-ascii?Q?/bqPaoT6WZA5O8WJ9RHXtg85yj/BVEduQ9pJ8vPejShF/HDCpHYehC34kLCQ?=
 =?us-ascii?Q?ZNKYWRvos2JBvlcEk46Sym3RiDrtOIse/U6oh8U3G7e2UYYlFcrosP1Ec7t+?=
 =?us-ascii?Q?Lc7Uu71E6gyQOVr6xcisXhR5FsYIZM8qu0xP0l+zvUJjITb6YRIBrg1ZpkgC?=
 =?us-ascii?Q?OIsqk9LK4wpeaUxFjnN65e5oP+z0kCLgvxp0TL+DIh/3uHew4azrVYyMiC3i?=
 =?us-ascii?Q?pZt+FifRs6fEde+PIBOEJfMmgZkvKqxtkJHt4oXh5kvGXoTUscssHlciO+/S?=
 =?us-ascii?Q?1zaQpvqkPDGGNt8edDwPub1P3o/KyEoO2dKhUOZWe1NaVIFxNMbaJzcT/k62?=
 =?us-ascii?Q?BHrVp3hlgFTNGTVv6cUGYBzNsiHRD9est46LH2cFA8PQqJXmoIyGJR8GZTtB?=
 =?us-ascii?Q?w5XJN4IxiShoAd6REbQ7mNfmYQ88n/2ixwM94dhWzfUNkgOBHRmf0Ls+H6Qw?=
 =?us-ascii?Q?c2La1g7R8fmpBX9FTUZdcZEDjDb6tVkT7+88IN7Afrldw5S6wJad5CCIYeAx?=
 =?us-ascii?Q?DvoQyBmIeUhEPIATgDyglQI4jUphdJ4RwSz4dewQUJb/rSEQ/U2UzQrgDP5a?=
 =?us-ascii?Q?CjA8WJkhOXVPKgwDYy9oEyNIoGjq0HzuAhBZQ8i6ZOtihAaNHeSwrc7tIEmk?=
 =?us-ascii?Q?rP9VyXtzEPmYlmpu/ApHJqFkJAd4J4l5XS0AGm3H7/VeC8og70LjMiRmsFzm?=
 =?us-ascii?Q?EacPtEawp75b5wAUHY/sdsJA9wSEb+D7s1z3hQs9UQZZujVi2pOpmIfig5l5?=
 =?us-ascii?Q?f+4Kg8B6oL99+WIYiTiiwObEyjir+yoUMRnL47gWXeq1DCE6hZttIOoOchA+?=
 =?us-ascii?Q?yy4qcFbWuIL4Y33Q4NiqrMHTfKJFpM6Siaw+Ak1E81UIAO1V0G1l+lbsEamD?=
 =?us-ascii?Q?+Ju0jq1gtg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f11da349-6f8e-4768-d016-08de6a4916eb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:12:08.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv0PNO0eoHzGZl/71Yf0lzG6dj4LnQimczYkxkD9+okasf2HasJnS2ukA9fP5Ha7mnqkc0VxjKLjIv5ab5jrog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_kernel/workqueue.c" on:

commit: 3631352a7a1d5666723822eb421dd039b3b8ea8e ("kernfs: adapt to rhashtable-based simple_xattrs with lazy allocation")
https://github.com/brauner/linux.git work.xattr.socket

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------------------+------------+------------+
|                                                                         | 2115f2915b | 3631352a7a |
+-------------------------------------------------------------------------+------------+------------+
| BUG:sleeping_function_called_from_invalid_context_at_kernel/workqueue.c | 0          | 6          |
+-------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602122354.69217204-lkp@intel.com



[   39.161797][    C0] BUG: sleeping function called from invalid context at kernel/workqueue.c:4390
[   39.164598][    C0] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 110, name: udevadm
[   39.167222][    C0] preempt_count: 100, expected: 0
[   39.168816][    C0] RCU nest depth: 0, expected: 0
[   39.170370][    C0] CPU: 0 UID: 0 PID: 110 Comm: udevadm Not tainted 6.19.0-01456-g3631352a7a1d #1 PREEMPT(voluntary)
[   39.170375][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   39.170378][    C0] Call Trace:
[   39.170398][    C0]  <IRQ>
[   39.170403][    C0]  dump_stack_lvl (lib/dump_stack.c:123)
[   39.170427][    C0]  __might_resched (kernel/sched/core.c:8830)
[   39.170497][    C0]  __cancel_work_sync (include/linux/kernel.h:61 kernel/workqueue.c:4390)
[   39.170503][    C0]  ? simple_xattrs_free (fs/xattr.c:1747)
[   39.170506][    C0]  rhashtable_free_and_destroy (lib/rhashtable.c:1153)
[   39.170515][    C0]  ? kfree (mm/slub.c:?)
[   39.170521][    C0]  ? kernfs_put (fs/kernfs/dir.c:544)
[   39.170525][    C0]  kernfs_free_rcu (fs/kernfs/dir.c:553)
[   39.170533][    C0]  rcu_do_batch (arch/x86/include/asm/preempt.h:27 kernel/rcu/tree.c:2624)
[   39.170543][    C0]  rcu_core (kernel/rcu/tree.c:2871)
[   39.170546][    C0]  handle_softirqs (arch/x86/include/asm/jump_label.h:37 include/trace/events/irq.h:142 kernel/softirq.c:623)
[   39.170555][    C0]  __irq_exit_rcu (arch/x86/include/asm/jump_label.h:37 kernel/softirq.c:725)
[   39.170559][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1056)
[   39.170570][    C0]  </IRQ>
[   39.170572][    C0]  <TASK>
[   39.170573][    C0]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
[   39.170581][    C0] RIP: 0010:__d_lookup (fs/dcache.c:2418)
[   39.170587][    C0] Code: 00 00 00 00 00 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00 00 <55> 41 57 41 56 41 55 41 54 53 48 89 f3 49 89 fe 44 8b 2e 49 bf 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 00                	add    %al,(%rax)
   4:	00 66 66             	add    %ah,0x66(%rsi)
   7:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   e:	84 00 00 00 00 00 
  14:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1b:	0f 1f 84 00 00 00 00 
  22:	00 
  23:	66 90                	xchg   %ax,%ax
  25:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  2a:*	55                   	push   %rbp		<-- trapping instruction
  2b:	41 57                	push   %r15
  2d:	41 56                	push   %r14
  2f:	41 55                	push   %r13
  31:	41 54                	push   %r12
  33:	53                   	push   %rbx
  34:	48 89 f3             	mov    %rsi,%rbx
  37:	49 89 fe             	mov    %rdi,%r14
  3a:	44 8b 2e             	mov    (%rsi),%r13d
  3d:	49                   	rex.WB
  3e:	bf                   	.byte 0xbf
	...

Code starting with the faulting instruction
===========================================
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	41 55                	push   %r13
   7:	41 54                	push   %r12
   9:	53                   	push   %rbx
   a:	48 89 f3             	mov    %rsi,%rbx
   d:	49 89 fe             	mov    %rdi,%r14
  10:	44 8b 2e             	mov    (%rsi),%r13d
  13:	49                   	rex.WB
  14:	bf                   	.byte 0xbf
	...
[   39.170590][    C0] RSP: 0018:ffffce2d404db9a0 EFLAGS: 00000246
[   39.170594][    C0] RAX: ffff88920147dd98 RBX: ffffce2d404dbaf8 RCX: 0000000000000006
[   39.170595][    C0] RDX: 0000000000000000 RSI: ffffce2d404dbaf8 RDI: ffff88920ef9c780
[   39.170597][    C0] RBP: 0000000000000100 R08: 0000002800000001 R09: ffffffff90435034
[   39.170599][    C0] R10: 0000000000000000 R11: ffffffff8df80580 R12: ffff88926f3a0000
[   39.170601][    C0] R13: ffff889333fb16c0 R14: ffffce2d404dbae8 R15: ffff88920ef9c780
[   39.170603][    C0]  ? kernfs_evict_inode (fs/kernfs/inode.c:282)
[   39.170612][    C0]  lookup_fast (fs/namei.c:1875)
[   39.170617][    C0]  path_lookupat (include/linux/err.h:78 fs/namei.c:2276 fs/namei.c:2780 fs/namei.c:2804)
[   39.170620][    C0]  do_o_path (fs/namei.c:4802)
[   39.170623][    C0]  ? alloc_empty_file (fs/file_table.c:258)
[   39.170628][    C0]  path_openat (fs/namei.c:4824)
[   39.170632][    C0]  ? kernfs_iop_permission (fs/kernfs/inode.c:299)
[   39.170635][    C0]  do_file_open (fs/namei.c:4860)
[   39.170659][    C0]  ? kernfs_iop_getattr (fs/kernfs/inode.c:202)
[   39.170662][    C0]  ? kmem_cache_alloc_noprof (include/linux/kernel.h:?)
[   39.170665][    C0]  ? do_getname (fs/namei.c:183)
[   39.170667][    C0]  ? __check_object_size (mm/usercopy.c:198)
[   39.170674][    C0]  ? strncpy_from_user (arch/x86/include/asm/uaccess_64.h:70 lib/strncpy_from_user.c:129)
[   39.170680][    C0]  do_sys_openat2 (include/linux/err.h:78 include/linux/file.h:177 fs/open.c:1366)
[   39.170689][    C0]  __x64_sys_openat (fs/open.c:1383)
[   39.170692][    C0]  do_syscall_64 (arch/x86/entry/syscall_64.c:?)
[   39.170703][    C0]  ? __memcg_slab_free_hook (include/linux/mm.h:2516)
[   39.170708][    C0]  ? __x64_sys_close (fs/open.c:1511)
[   39.170711][    C0]  ? kmem_cache_free (mm/slub.c:?)
[   39.170714][    C0]  ? __x64_sys_close (fs/open.c:1511)
[   39.170717][    C0]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:196 arch/x86/entry/syscall_64.c:100)
[   39.170720][    C0]  ? do_sys_openat2 (fs/open.c:1367)
[   39.170722][    C0]  ? __x64_sys_openat (fs/open.c:1383)
[   39.170725][    C0]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:196 arch/x86/entry/syscall_64.c:100)
[   39.170731][    C0]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:196 arch/x86/entry/syscall_64.c:100)
[   39.170735][    C0]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:131)
[   39.170740][    C0] RIP: 0033:0x7fbfe837a687
[   39.170745][    C0] Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
All code
========
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	4c 89 df             	mov    %r11,%rdi
   6:	e8 58 b3 00 00       	call   0xb363
   b:	8b 93 08 03 00 00    	mov    0x308(%rbx),%edx
  11:	59                   	pop    %rcx
  12:	5e                   	pop    %rsi
  13:	48 83 f8 fc          	cmp    $0xfffffffffffffffc,%rax
  17:	74 1a                	je     0x33
  19:	5b                   	pop    %rbx
  1a:	c3                   	ret
  1b:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  22:	00 
  23:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  28:	0f 05                	syscall
  2a:*	5b                   	pop    %rbx		<-- trapping instruction
  2b:	c3                   	ret
  2c:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  33:	83 e2 39             	and    $0x39,%edx
  36:	83 fa 08             	cmp    $0x8,%edx
  39:	75 de                	jne    0x19
  3b:	e8 23 ff ff ff       	call   0xffffffffffffff63

Code starting with the faulting instruction
===========================================
   0:	5b                   	pop    %rbx
   1:	c3                   	ret
   2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   9:	83 e2 39             	and    $0x39,%edx
   c:	83 fa 08             	cmp    $0x8,%edx
   f:	75 de                	jne    0xffffffffffffffef
  11:	e8 23 ff ff ff       	call   0xffffffffffffff39


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260212/202602122354.69217204-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

