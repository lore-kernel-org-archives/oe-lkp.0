Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D0219303
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jun 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405862; cv=fail; b=uKMxyyan31hnR4whlQEafzaxKFu4zT1N3n5QtpLUT2FF1z1+iWhHsHNz6NRc6OVHPyPjx1xsNYcenBhkNf6jrs/+AQcf56wo9lbklVtV5PTndxz+97xDlvY7cGagPg+uxKLNngSyW+8G/JYzO5AQG6d2dClsr0B1xzRDJhW9D8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405862; c=relaxed/simple;
	bh=y73Zq1bWVO1wGl46y9u6qKYCLt+9ZSNsJJWjlcOjJsk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=G8xS4Eh5iTMyXbbG3EW0sdC6uRiUNk9iNguHFpx7OoXbwwaKZQrB2OWeWZdLBxBU6CRA3SkEA20s5VWsb17OwRo0p9KhRV6cUV1bq8CFqW2kqjECxhUwXVOKTdKDmS7Td7xqIIELbs0JfcersN5lmDEZaSn9CS7MgosyEprarjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwpL88qv; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwpL88qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780405860; x=1811941860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y73Zq1bWVO1wGl46y9u6qKYCLt+9ZSNsJJWjlcOjJsk=;
  b=nwpL88qv4XNfm54tjxjPhnGtYaeTyT9naybMORTCT+KkV5p4mWkRSNNa
   dspDLs0NKVNh9blAOfOjNI//yHY3jt9zMH72yBYdvAuy789AEefDBrx4p
   qRrXzqBpUx+0jRk/eBiarSmzfDZCqJpCPbcWr4VwBsQWKMJenUfhy3enz
   2s56Y808Y2DN63reLY91Q2UoaLwRAReDa+wEIt1JqeUa8putckJeBmgyr
   BCBov7TfjiRwgSFa26EU4YI0FbJ2ESjRHkfxz7C25wiXgyO6bAfFhN3+V
   IWqkrZOsJ6ACzWQ0pmDA4g9EgsSIppF7QkioBTpJkiprVyIc39jz5gEY4
   Q==;
X-CSE-ConnectionGUID: WN58W1H4QAOlvR3z+X21RA==
X-CSE-MsgGUID: tWDn8YQUSW+H90NlXs8g8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106635808"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="106635808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 06:10:04 -0700
X-CSE-ConnectionGUID: 0C/x+bd+QdiA2hGV1y5/1g==
X-CSE-MsgGUID: N4RjdAYJTTKYkrcJQPoZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244007944"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 06:10:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 06:10:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 06:10:03 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 06:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1NAt9toMRISTtniDRlD1xn7ubXZmaiBder8DLIKJkUqAJuHyj97i2Vbjastv55SxCqubcOub0ecraMcSZ4oGVqFfAL0726Uib6fKd42l18xkSW0kNajRZQOuuWS5l/68ysgPhAR+vZnl71/+qjhH8dMrQ0At237HfgiAGd74OOm40r1ixAKYRM62d8i8oqQ/EApevlqgqOJtW1g382pWHFuSQFSQxDmtRDnUwvBEPAnPT1vdPc/IHchvS8cDcO9IAUywx+y7AnaH2zQflRer3lbXbvEJqYjG7gZLr7M/MN010GMYMfbNV63pcQsgdGoUP4++lafvACEVT1NCkEWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rBssKwg6vowImK0Ak0sK/b/TQ4oOow2sbXtXA3ODPU=;
 b=SPQAR2ikJxYBwH+A/K20L6hPn2x9W7qV+QfgfrCjBlzG+T3JJtdgISoVec/wEI5V5IaZa4gvP4faS639OeB/6qmgIJ1RaxyYU65BFP6uBRERYZTocQUQ1UF5Hwn+z8txQQ/UD5ecfcFCwfAvbBw7ZNRSPZBzebApIZiX8X5Mu7eGDV4ruy2iSodh6B2UZfxqFWZWSGoMCvCnPAKC++Z+8y1qiG0+8BSYRnM54KL6G3F+jXT6dX9lWlZwKFLCgV202+WZT35RgXNzWfCUEhFiWq/i+vqiklHRvr7MLIa2QsqBRnW4c7WRK1G9gIMS7RB1MRZwcwY6oZoYzYwuuSInxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 13:09:50 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:09:49 +0000
Date: Tue, 2 Jun 2026 21:09:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-classmap-fix-3a] [dyndbg]  1aa71b32af:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202606021631.50f520ba-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: a286424e-e60f-442e-0fd0-08dec0a83a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Nxg4xsfooE78ZcDOB61Xn2vxayjyPS4Fu8iPxxib+Ttxi3DnWicIvtUT05TsU+Aw0UNBVLnCRHLmtKP8/0W2NFE1+s2w+rlrCrdr0zI7tBXeFAkpMANu7A7JaNxoYTAIfS3wfwUfg39vDqMqDSJVHZ3KdPy5hQnrdtPfGNm99Xz3OnYCul2Selraou6xnD8EHYa92S1eunSFbKcGf3mwj5rNe2T8IZsToZysI5HfmQLS+OazcgA9kB8MERBjaJ3Q50ucXxSwUxBIRAN6topxCRHw0PW3PKcUE4Fj+A1ddjrB4q60A6YrckNHVCNMkK7qro6H6N9fIHrp87/ChYsYmW/h/MaC9CALvefVmkZopWg9ZkDbuMwRZy7LsxS6sPKrcIXxjTyV7HJ6YQWGt0eJtpCmNaSESCKU++IyyuxAeYxvuE9yg/2ohqlBspngIyObzif5OttY0wSvIGJn5X7rJchPBEtqlvdfwGW9RFT8lc30W+sXp9kJu7W8q2PDgDOX4G9z6HL/MHl4hSkgpZ2rAM138R1P5g2LyxG7irazO7Dy/0+nC5YtxoOFO37RJGnWLSFX6/R2A/yU0pYnkc4dZ2eUr2eyhugqkE/03cy3bxj3X3rIwK/oCxKH/e4ctrHFHGvBuJVNFZVpmtL9Yu+4z58nOGrhet0O5bFi52V6mQRtcU8o1Tl0pI/YieBuokureEpl0XvBaagZB7Sq5+7Buw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RK1nmHX0k60Cygr2M9S9M6T4vhNq112KwDmdM30l4JKSN21uE9N6Sl9tyik+?=
 =?us-ascii?Q?uNKsC1sYP01jjcqCysNN6u1jmazyr9ZTpngmcHxPodY+iWQTa/15KdXCACMp?=
 =?us-ascii?Q?ibZLp7qUr2ntVwlfiRj8kcErBVOlSPn3yCPj8n4PB4bRSDYxJUnb2ZRxjFfh?=
 =?us-ascii?Q?scHyvwJtOhF0kKJ4TfRSZ0nB+Rx0BSvMRVj+myBK5u3ubfhULMCuRfEV2Cs0?=
 =?us-ascii?Q?PXQK4in2cN7IfIoRD97KV0SzZO8Nz0mdAd3KLvEB4KFL6qcbsgLqLC4H42Mi?=
 =?us-ascii?Q?vc25pEb/+3mgBrp78Yoq587iFn18tF9oNwFb8yt9xBL0KhlgkyQSYj55SUO8?=
 =?us-ascii?Q?cQiqtH9x1G5CmxqfBgwXCgE6b95w0USyo1W+CSV1km42oJyrOEja20qyp8TA?=
 =?us-ascii?Q?TYzAXsAk79R8Z8KkaEa+xCZr83DIUzwEhgO4Ep2OKBv/jWa/b/8bqHOA9aL7?=
 =?us-ascii?Q?3FAeH/0ScFfgsBVU6QmfYn9w91g/OoLFWPOxx4hcdm1CzRAmg9ZeZlBV4aT9?=
 =?us-ascii?Q?rjIZrHMVT58u1RSrxgwfBcFz9Vh2Ba+VE1XXw3PuA171gygp8akUGdVBhQzB?=
 =?us-ascii?Q?myaeXOJGy3K3aojk8fXFGxobxYhsmFuQeg1oMGLZ34paSulm+GjGZvXhENlz?=
 =?us-ascii?Q?sECSlxGVbl173SQfEtyw/3sbNe6Tq9Tw3UvVvvyCAZgifa7E7amfkh1GMW9y?=
 =?us-ascii?Q?TBXCzfHJB/08kG4I025w0equBzg61h67RDRVy4/dEuP0JWp7PdGmuKkwcXW+?=
 =?us-ascii?Q?S4dw4or/Tuyfny8DD1DubI9/S4cVuhZ8ZQc1SRXSv6zn+OkBbhp+JKDVcI2i?=
 =?us-ascii?Q?NOiV5euVYiuNiQqIjjJpwa36L1Tc3m0KGcXpU1qgr3sUG5uqD1H70jRCiOrz?=
 =?us-ascii?Q?S1Hl20lxru9fyERY7Y9vPmBChvpF17aKg9ifTZWWo7mYsUcGmUQp7IQVU/na?=
 =?us-ascii?Q?HhQnZu4n0D7KwxROo/L3dx1M2JElENzhi7KpVqz/WLhOWIaQFUiK1f2La4Xr?=
 =?us-ascii?Q?tW5nQFqCwtALdYiBcKl7WkubyrMAVgqDTQ0cKi4w48WDj12yhCPM53OQnMyj?=
 =?us-ascii?Q?2FhDrcqLC39jRRpMv1/Fj/obaOfAtMoK6ZqsHUg/b5f2Bc2XMFs9rZdQc+Pl?=
 =?us-ascii?Q?xJdJ43jGUdMw8Eruwrw3MLo6JXobgZ+Cn+Cvzlwfs1A0sEUfg9zuUQbWOWD1?=
 =?us-ascii?Q?XESKuwj03GVugDPuDiKp118b5A57wEb8/HfEG7dXZMaWulpPZQWN8qA174K9?=
 =?us-ascii?Q?VZY5pp7ezucDxqsUPRH1z6UUDArf5ie4MgYd/b2MkwUU60nkfFVSH3HK7RmU?=
 =?us-ascii?Q?CSiB+3QpMYLtwhSPIQvECKOg7ZGKMAJ2szvDl0RK3TmFtTMVD0L2VqKnR7PN?=
 =?us-ascii?Q?/iYjoXcsYmrkKnYOunuds4VnFI9hMH92pgnQ8VxXiqmPERVvA8pS4C5GQw23?=
 =?us-ascii?Q?mjCkVUEu2v70WDArrpp7PUpu8vvq7Mzddf7biTDSkuXSqL+OB3+L2cnj5XRC?=
 =?us-ascii?Q?SQkcupvtwSlPKb4SC3XxNXgyaqdgVRygF28DEQEP8SigAZVenV4XWOuGQSQp?=
 =?us-ascii?Q?JTLNSN2mdXAEHvFPbjxT8+XR6rxtSp/lynGo3m9+ATSilFvY/yP+nQlViabx?=
 =?us-ascii?Q?AJY19ERw6ACOiz1J733nXxQGd0qJ485KpxF4QeZyujU0YX1k27ql54kHbMyn?=
 =?us-ascii?Q?DZPSHHHZ3O8RMjKYgZ+QFdEHe608F0WzHIZz8oNwBJfDbdenHp6xhhqSMGW6?=
 =?us-ascii?Q?BCX5+IKl4g=3D=3D?=
X-Exchange-RoutingPolicyChecked: JroqIO49/doGONJgGNb1/UD2buVIBZlIr2C7xhnWxKLErpc+u4X/LGgHgxla2ysZcT6Zlw6CGareV4LBFA7ouNbydcNTuHk/ImKtd7E+X2LN4HRYhmhA9US+J2D5Dch7vKuRZJ6gPaL1yz34fNnLE9g5g9M21kO0MC8W10EMYeq5bjCg2ik3b6KExqq+ZweaZ9mHk0hjSi1Vnl0y/J6+wCVCi9tYrEmGxk0vFZ7zKpm+VOFS7faZzpVp6PfnsA9P6cWP2Iy7cpq6PhqavGzh9Ksv5lXSTeIvbslfo04JR1f9cl/W99wYeDtniWlxE0qRT4Og4zdc7Ck74GnlolSviQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a286424e-e60f-442e-0fd0-08dec0a83a0b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:09:49.8307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHka/dbVKxsYe0N4Qw+qTMUN+M2AF6Uecby3nnex8LM/7U8uHHGwIQIbHr/B79VnHtUIHEFNp7pSHcWsZTZ13g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
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

commit: 1aa71b32afe975c5402d381b16b95811b4ed16e4 ("dyndbg: resolve "protection" of class'd pr_debug")
https://github.com/jimc/linux.git dd-classmap-fix-3a

in testcase: boot

config: i386-randconfig-011-20250530
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606021631.50f520ba-lkp@intel.com



[    0.646324][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    0.647608][    T1] #PF: supervisor read access in kernel mode
[    0.647608][    T1] #PF: error_code(0x0000) - not-present page
[    0.647608][    T1] *pde = 00000000
[    0.647608][    T1] Oops: Oops: 0000 [#1]
[    0.647608][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc4-00035-g1aa71b32afe9 #1 PREEMPT(full)
[    0.647608][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.647608][    T1] EIP: strcmp (x86/lib/string_32.c:97)
[    0.647608][    T1] Code: 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d e9 ff a7 01 00 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d e9 cf a7
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
   d:	e9 ff a7 01 00       	jmp    0x1a811
  12:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  19:	00 
  1a:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
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
  3d:	e9                   	.byte 0xe9
  3e:	cf                   	iret
  3f:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)

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
  13:	e9                   	.byte 0xe9
  14:	cf                   	iret
  15:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
[    0.647608][    T1] EAX: 00000000 EBX: 45489340 ECX: 00000000 EDX: 43a5414a
[    0.647608][    T1] ESI: 00000000 EDI: 43a5414a EBP: 454a3e90 ESP: 454a3e88
[    0.647608][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010217
[    0.647608][    T1] CR0: 80050033 CR2: 00000000 CR3: 0440b000 CR4: 000006d0
[    0.647608][    T1] Call Trace:
[    0.647608][    T1]  ? ddebug_add_module (dynamic_debug.c:1479 (discriminator 13))
[    0.647608][    T1]  ? blocking_notifier_chain_register (notifier.c:265 notifier.c:282)
[    0.647608][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:1646)
[    0.647608][    T1]  ? dynamic_debug_init (dynamic_debug.c:1693)
[    0.647608][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:1646)
[    0.647608][    T1]  ? do_one_initcall (main.c:1392)
[    0.647608][    T1]  ? __register_sysctl_init (proc/proc_sysctl.c:1436 proc/proc_sysctl.c:1465)
[    0.647608][    T1]  ? init_mm_internals (vmstat.c:2298)
[    0.647608][    T1]  ? kernel_init_freeable (main.c:1499 (discriminator 1) main.c:1692 (discriminator 1))
[    0.647608][    T1]  ? rest_init (main.c:762)
[    0.647608][    T1]  ? kernel_init (main.c:1593)
[    0.647608][    T1]  ? ret_from_fork (x86/kernel/process.c:158)
[    0.647608][    T1]  ? rest_init (main.c:762)
[    0.647608][    T1]  ? ret_from_fork_asm (x86/entry/entry_32.S:736)
[    0.647608][    T1]  ? entry_INT80_32 (x86/entry/entry_32.S:940)
[    0.647608][    T1] Modules linked in:
[    0.647608][    T1] CR2: 0000000000000000
[    0.647608][    T1] ---[ end trace 0000000000000000 ]---
[    0.647608][    T1] EIP: strcmp (x86/lib/string_32.c:97)
[    0.647608][    T1] Code: 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d e9 ff a7 01 00 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d e9 cf a7
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
   d:	e9 ff a7 01 00       	jmp    0x1a811
  12:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  19:	00 
  1a:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
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
  3d:	e9                   	.byte 0xe9
  3e:	cf                   	iret
  3f:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)

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
  13:	e9                   	.byte 0xe9
  14:	cf                   	iret
  15:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260602/202606021631.50f520ba-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

