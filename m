Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBD3B38A2
	for <oe-lkp@lists.linux.dev>; Wed, 17 Jun 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708217; cv=fail; b=YdbfaJBecDGl6BcDIPqYUBM3F9QRwtBSo9aRy4O+BPapHKIw6OX5V6zoBNqxa+scH6ufDkqB3W7c5uV4jlWH7Euxj3/FpAMFiutp4ANsmxGbsA4ztc6eLgDBz3JKqycnCJVJyv4zghDlHjp6crCLjoGRZXY+4OF4MElO0VFwRyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708217; c=relaxed/simple;
	bh=Zvul4j2t2kRBWbJg/9M6KHwNH7ZAa2x1Tux3qzQ4fks=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mBwOHbUIZ5sdlANIgjnkXfYEqYDmLOFORvIV2YB3Cm7btz+WEvkUhbWrkMADLtV3uN+tefSX8ARkqtjxSL5UrcFiwiORrBnEpLXZhhli6ikWe3n7uAEDGGfPZbC6ls0bZRlTy31QIZx3PJ8JtOVeO3sOh7smehYPfeAeN1NELJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEdKh46f; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEdKh46f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781708215; x=1813244215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zvul4j2t2kRBWbJg/9M6KHwNH7ZAa2x1Tux3qzQ4fks=;
  b=fEdKh46fbv4a12FNZ/PKUxTloICYatZDCKQWRjOBTduk7x/4O95UjGvg
   n+ZYpLQKrdRgwqt4IYZm7aFk9tbRoQC/DqS+91kiZU5OXOR9vDIkQR5qb
   QcyzXKIgSMMrLSbLXo2fwCbNko5e15UjPUi8biSsnpufCbNsjBj/0e+z7
   wZ6L04JFlxnejrM+uhOi9K6/YdOD8nrhER3xulUa11ChvoLesFR3LzoNu
   0+/PlHmsKAmaccqSJd2z5RsRMReJ60ALgQjbj7w77wWVDF7gQmnhPuvkE
   sBFF9owyvzjVg/gP3RgKfjpDa8yVXfYsQt6+5PLXLhq5V+JJR/WI5tcN1
   g==;
X-CSE-ConnectionGUID: oVjP3wsASf2xIhs0hhRSrQ==
X-CSE-MsgGUID: /1CPE+QtSL+bDU4YJZMSmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93877780"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="93877780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 07:56:54 -0700
X-CSE-ConnectionGUID: QTgIfSV+TRqeg/y+BGgl1w==
X-CSE-MsgGUID: hAOvEOTZQDmNykH/+W2bSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="243722425"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 07:56:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 07:56:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 07:56:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 07:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5ILK40/xvlJ1ueMuSZ4VxTkNpsgqt30U3GzxKxmqvWDfiuxvBSWn3NgPAuigRyi+iNCmcJWuN32jGu1JXIsrCXNrwXYshZDyZddW2uU9FeqGivqhV9nSQX+fUYsFNu4WmV8bIudNbGR+j/9pRlkVd0Q1cspDtYZBUwdXmw74Hdp+Bp0O+EgjgbFZKhWL3bflJPIjZWR8kVR4EuoEUj0ftmK94ywSvRp7ZLH7Zvgd5uRJw2ioxt05caKT3stVP28XYQWgvp8YSiaxGsvH+q/cxwu2JThOnRnO3M8bYJ4ktrDWJTn9ZByUsNYFZ0Fa22Xe+otbhVWeZftCXf2sdTfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m0/eSUqrKalpFg7b+wYkAASefxF5B5GPqR4Y6dfdxc=;
 b=Xxcsu6a1GEJNnHqblKf8WqbZNFj7MqHVGuAfjn+gCINZu5P35hhRDJ0QvdRDR4sDMmy60GLXiQhi2gJ23MTHiUrO/m7T8TMxtBcziMaQmcY7FEEygRrykyTyT/ZT0W/3fsW5H/d4C9a8YQooqueNDfaR0fNSq66RHiWIXzPiwvt+emvSW8gABIy83LvyZfTeWPrfB0ekQ4fwUvdzgvDaKiqRr+j1qVz/DbpnXFKR/FMI8qLz3igr+/RbQEQDSPA0vzOHa/oe22zEam5ErTHfz2GfqayB07ml2Gi7B1IF2r3HQNmlGIqW3miqHl4v+ZJlrWpfxujXZhfiXedtwSJRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SA1PR11MB6847.namprd11.prod.outlook.com (2603:10b6:806:29e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 14:56:42 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 14:56:42 +0000
Date: Wed, 17 Jun 2026 22:56:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-rust-parse] [dyndbg]  ccfcff60ec:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202606172227.34266a1f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KUZPR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:d10:30::19) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SA1PR11MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: e9684c9f-2ff9-4b63-5cad-08decc80a489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|3023799007|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: D7i9TW6qbigTxgmckLSTDeKQJJexhAMKNZKGMTZ0MTTAcZ/OyXIeb187lnAnGbNkUBLbI0UCoNkVPTPIRCZU3kt2XzoZm4zIdARo6gn1+mKKKLr44tOaS/eTkj1RaV9m376rOuEV9c2AkYwyVm0e10PtXidculFSZbHraRdIkZ4Tc0lmiutLJXAVD52ZPwFO8qFN1hA0J41CIyNyXwOqkrN3dxpEKgws7pKTqYKX5+Y3k+VZ0FBI5Dd8bmJPZm8++BC2CMgnkndk4EHJ6fhbpIJISVYqY3lnVZWM1PqRZSFnxYOl+AOSIKO/MiPTmZfRjZNpxkxePh+T23CKNIljK7BAolYJHWjmjc6kbRBwNjMisoAGnN+Fmc7oLGkt/4BPwW50sdazlHWtbbbXA8A3iuo5iyhvYu8sx7ptPlFxAdOt5I29puIEh1/3ndh0hiXbJVip5t4qeIpRXGAQDBJafkBWmOUq8dIK4Ns2O1ZVcOvKhGQovLuhgIvfsnpuWMqzZ91ZGr5lvyh8Xqf3K63IS2WxENbfolaVDH6v+dQtpMwnULyWYyWghA9hy00Q0LVxcmnSgslzKfsQFBE1RgNPmiilsRUCJggnFakjdM/Cb3sSHlg1oEVkp5edsOXjJtynJJaU3tgFUBKPqnz3f52ojd6raxHdYjVTUIc7PpRXUW3Hys9YPVnG3sP+6Y73jU3J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(3023799007)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wt2Fljq+rGO3F4kXDUsuqrE1stL4Yj1+vSgu6INU0KQp/ueQ69tREM8TfyZx?=
 =?us-ascii?Q?npkhgqzWC47uGcwrwA5aaTs3mM//Xz58lN9XeE2zT3urZG/VpKxCoF3D+XB/?=
 =?us-ascii?Q?xCSU00Tj8J4GVrziE/fHVzsI/8dxlkHKDjQ3rvrO8kb88GM8cEHAS7uoUAoW?=
 =?us-ascii?Q?kTBlePqt6kZol6TOIksgfBkXkE5uYJVn0y6XU3rX5gRAdkHKHfBv6VEGOM7D?=
 =?us-ascii?Q?AkhJDSMXQt/8DZEUjU31UxwfoNZKydp40VBH1zXL4mcJ1VKB9UwTjyVGz+8Z?=
 =?us-ascii?Q?Aq09ci4j6u1iwglFM97H/3vnm8mZkRlIYHqDHsJBqSExeUg/KvXrqSQ4nTxN?=
 =?us-ascii?Q?pcrc3Yq6q/pfv1GJDKnNkN9vtFbyJJImLvGdh0I7lwwAZ1IEm2zOtLDv6PUI?=
 =?us-ascii?Q?LKr1nn9sd5BS7Ysdc/RtxTB/kKqajIgnh6A8g9tIETDgbqSZV22rUjd76RvU?=
 =?us-ascii?Q?wvliJE9TOWHcWp3qs4d9h6ZMBqcfCXqZxRVw2PcjuoLBiJkhJHE0sN1IWCpC?=
 =?us-ascii?Q?81wFsR1DG4h7W+AczK13RDjQLjlsyeXhVtNTFnZVgFqbvmz0tRncZHvmwsE6?=
 =?us-ascii?Q?VowKuSC3mvzQnFRDOKKMqk8DIHuppgbkt6Ekhnv250fEXiDbELpqLtgJjJb4?=
 =?us-ascii?Q?6fX24jz1u+GWfPNmaxiCmzdEijIb6WUmzqAG03SMJ9HZ1fDOxL5bR3wdIWc+?=
 =?us-ascii?Q?GqMOZftWUZQhyirfZL97K/y+thHAqx7tep3GaulEOG7Y+7U51obIlUmZx6bF?=
 =?us-ascii?Q?h3jezrD4un0+PqA1yYE1XlPtlD6AG0V3IL/4ZYqeeGA4Ba4tM/VnJgHPzTHy?=
 =?us-ascii?Q?BzgtP5Tx7tMTRvnPnoZXXm9yhDnxfX8j262AYpth95FchSm0JuAkP/qhvX61?=
 =?us-ascii?Q?ziRWDyH9lla0DtbwlR+sax2A8MZnr2qF8cXNymqWTb8a+/BgT6Jz5VyQ51/b?=
 =?us-ascii?Q?HisJuqWwUd2twJK3PfL0sNuvJ+Tv8UjpV2mYnnzZCKlQPQxQiws6D+b3LRa2?=
 =?us-ascii?Q?/XaB0CxQxPxoPzLUMZFAlssC/9J9BUdugvPGbKp/s3rx7HDSS72PAlGs6aAI?=
 =?us-ascii?Q?0hySSuDlvccjJzkul3YSe2C1wdiP4PYRxi6Oi92VHCWnX3Y1lPgArOhhYF+t?=
 =?us-ascii?Q?eT+tmWf8V/dG59uadLEueMkJv9jtSJZTXmZ7EPcoSF5y4c469BVVav6mufE7?=
 =?us-ascii?Q?h09qCgYvYXFroNuCV/sT94UAOh6dt84MnPbwLL92FNQYDbuAf+jf16yrBH9G?=
 =?us-ascii?Q?6/eMdDq2XEiIzzSVxKGCWWBPMseab40SzUdBFCrqdZTyjU1h572yogvUzDEr?=
 =?us-ascii?Q?mTGqfGIZP6BIBe1rdshsJC7Qtf72qKkxzEzjiMTWNSCh9bSVbf6gtHInN/4X?=
 =?us-ascii?Q?A1p7bPzh9aaA53e0t10dPAa3t4Tkn0H1vDGC/Czz8nkucxdAb3c/ES6A4Cms?=
 =?us-ascii?Q?nShoAbhoSKkZcttsYy8zu3lZb07TQhwEoTWGEI9mxKFlcwYkSuoO7RRqT8Vl?=
 =?us-ascii?Q?pe32RkaVH5Gej+S6Gdy1pVGRkFNPOid7iBuWilvLK4DVlhyGrAvcwuYrjuul?=
 =?us-ascii?Q?6TCS35CmVJWsaGAb7fr+R4b2NXN6qIwa5siKMvBPVPn3zvNCIF2VVWuESTKY?=
 =?us-ascii?Q?vEyyYlYLy00zehV9H5Kb+G5DmiooilIcP9PVkjGe3Gp9tMF9F3wZul/q5gz8?=
 =?us-ascii?Q?DoZdy1kyw7u92wGbNg9TUxORhxEpqHQnJl+GiC6uUVen4rlYd4yky44uFPm3?=
 =?us-ascii?Q?AV/339lx5g=3D=3D?=
X-Exchange-RoutingPolicyChecked: TdRT9SJmmxxG3YpSnK0XMb0+NTbWVpDh7rA/eT4mO8T66mZC8Pa8ARptToi/nQBMDXvhstlz2YBXg7YD8fqN4O583K3K0LgK+czmAJ7H+Fjr81qbLDfjXEX5Ypl6oSuA7OoiU+KyTw5dcUZQP8mjPixGkSlb0HxOViZr5nvQXrvh//cXyxKnuyMEL/FYSdfGR+D0FSWvFXuRiZSxIxPHNfJ3eQCd4Y9I9e8DSO4VJZOjZsf06bN2CgZfI2LSDk9ndw7kUlfxKsyWSRIgfoP3QnzbOk28yuQ0x8pzU10BlCBgER2895mPo1SKe1ZMHMh/D3VLkR9OjAgv997agKgT9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9684c9f-2ff9-4b63-5cad-08decc80a489
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:56:42.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWZMII7qpaJolQOlMxPKb+2WRyJHlT2/knkb8Xv6Z7Q1T2n3wfOi1WBCScFDVvE+A4FqpP+cRcvmrQxUdgnXVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6847
X-OriginatorOrg: intel.com


hi, Jim Cromie,

for this change, we reported
"[jimc:dd-shrink] [dyndbg]  1663ffb9c1: BUG:kernel_NULL_pointer_dereference,address"
in
https://lore.kernel.org/all/202601211325.7e1f336-lkp@intel.com/

at that time, we understood that you've already fixed it by a separate patch.

now we found the similar issue in another branch, we are not sure if this branch
is still active. so report out what we observe in our tests just FYI.



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: ccfcff60ec48f9294257908cb027b3e29c8f7462 ("dyndbg: resolve "protection" of class'd pr_debug")
https://github.com/jimc/linux.git dd-rust-parse

in testcase: boot

config: i386-randconfig-015-20260616
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606172227.34266a1f-lkp@intel.com



[    2.060784][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    2.064447][    T1] #PF: supervisor read access in kernel mode
[    2.064447][    T1] #PF: error_code(0x0000) - not-present page
[    2.064447][    T1] *pde = 00000000
[    2.064447][    T1] Oops: Oops: 0000 [#1] SMP
[    2.064447][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc7-00035-gccfcff60ec48 #1 PREEMPT(lazy)  4e5eb1741e72fd9e4b9a514cfdc887aab03908af
[    2.064447][    T1] EIP: strcmp+0x9/0x40
[    2.064447][    T1] Code: 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d c3 8d 76 00 2e 8d b4 26 00 00 00 00 2e 8d b4 26 00 00 00 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 8d 76
All code
========
   0:	84 c0                	test   %al,%al
   2:	75 f7                	jne    0xfffffffffffffffb
   4:	31 c0                	xor    %eax,%eax
   6:	aa                   	stos   %al,%es:(%rdi)
   7:	89 d8                	mov    %ebx,%eax
   9:	5b                   	pop    %rbx
   a:	5e                   	pop    %rsi
   b:	5f                   	pop    %rdi
   c:	5d                   	pop    %rbp
   d:	c3                   	ret
   e:	8d 76 00             	lea    0x0(%rsi),%esi
  11:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  18:	00 
  19:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  20:	00 
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	c3                   	ret
  3e:	8d                   	.byte 0x8d
  3f:	76                   	.byte 0x76

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	c3                   	ret
  14:	8d                   	.byte 0x8d
  15:	76                   	.byte 0x76
[    2.064447][    T1] EAX: 00000000 EBX: c5c15680 ECX: 00000000 EDX: c45bc35a
[    2.064447][    T1] ESI: 00000000 EDI: c45bc35a EBP: c5d2fe88 ESP: c5d2fe80
[    2.064447][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010203
[    2.064447][    T1] CR0: 80050033 CR2: 00000000 CR3: 05289000 CR4: 00040690
[    2.064447][    T1] Call Trace:
[    2.064447][    T1]  ddebug_add_module+0xbb/0x380
[    2.064447][    T1]  ? blocking_notifier_chain_register+0x2e/0x80
[    2.064447][    T1]  ? dynamic_debug_init_control+0x74/0x74
[    2.064447][    T1]  dynamic_debug_init+0xf2/0x208
[    2.064447][    T1]  ? dynamic_debug_init_control+0x74/0x74
[    2.064447][    T1]  do_one_initcall+0x59/0x3c0
[    2.064447][    T1]  ? __register_sysctl_table+0x101/0x140
[    2.064447][    T1]  ? rest_init+0x180/0x180
[    2.064447][    T1]  kernel_init_freeable+0x8f/0x114
[    2.064447][    T1]  kernel_init+0x12/0x100
[    2.064447][    T1]  ret_from_fork+0x228/0x2c0
[    2.064447][    T1]  ? rest_init+0x180/0x180
[    2.064447][    T1]  ret_from_fork_asm+0x12/0x18
[    2.064447][    T1]  entry_INT80_32+0x10d/0x10d
[    2.064447][    T1] Modules linked in:
[    2.064447][    T1] CR2: 0000000000000000
[    2.064447][    T1] ---[ end trace 0000000000000000 ]---
[    2.064447][    T1] EIP: strcmp+0x9/0x40
[    2.064447][    T1] Code: 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d c3 8d 76 00 2e 8d b4 26 00 00 00 00 2e 8d b4 26 00 00 00 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 8d 76
All code
========
   0:	84 c0                	test   %al,%al
   2:	75 f7                	jne    0xfffffffffffffffb
   4:	31 c0                	xor    %eax,%eax
   6:	aa                   	stos   %al,%es:(%rdi)
   7:	89 d8                	mov    %ebx,%eax
   9:	5b                   	pop    %rbx
   a:	5e                   	pop    %rsi
   b:	5f                   	pop    %rdi
   c:	5d                   	pop    %rbp
   d:	c3                   	ret
   e:	8d 76 00             	lea    0x0(%rsi),%esi
  11:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  18:	00 
  19:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  20:	00 
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	c3                   	ret
  3e:	8d                   	.byte 0x8d
  3f:	76                   	.byte 0x76

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	c3                   	ret
  14:	8d                   	.byte 0x8d
  15:	76                   	.byte 0x76


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260617/202606172227.34266a1f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

