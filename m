Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FF3D994
	for <oe-lkp@lists.linux.dev>; Sun, 12 Jul 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783848353; cv=fail; b=LxbW4guuootzFK6Onka2wySSXr6wGpMjmVPMXRGsm5FRcf7b2+9iDPWcGhdWgMALUnv4eblkiyp5N86Uvld4Le60sbo5YjuzSiGbocPyenFCYATu6rE6wp0+l3BHpM/+gNJ5siAwktaO26OREojOBnHwv7RDTyUwNtzUxLosy+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783848353; c=relaxed/simple;
	bh=PY0g0U85HWmGRd5mSZSQgToHFK/SAawi4IimKB72gVw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cB0L1EBeqQ4OFC6Vck8Xg+K+LqnpUjIMML39M5JscpJMG4a6snpsXGPg4WMSTNB8weJbosAdbx3uqUUTh/e5Wr6XeqIXFOYF5a+go7oPbYwycYdu/BpLxnpydj0C0vKydJWjKVnkxMyWnYaXj7FF8Nx3RifdkLuOWfAeU3AbJXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsWwTJAd; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsWwTJAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783848350; x=1815384350;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=PY0g0U85HWmGRd5mSZSQgToHFK/SAawi4IimKB72gVw=;
  b=nsWwTJAdEi/0B/XY5O+XnHkdWlE4/UFCTkHeQ6xI00mswQffb6FTjz+w
   Ek6fVbDBGF8ilcdidS6KroVZrv6Ix+4/YSMVV10u1uaWhpFyazog6Hoty
   HK6WmCL6f0zu2mbA4E+cS3beu1L/IjohI7xO1XS5h3HVqtzkY9aX89MEA
   O/DCrzRNkdb7NEcAcROsj3faFN1Of8nrITSMNqsHYgKWSI1waG18ZjNZ4
   AZkV6LFV/IbXTN0xT3HHEdhcbeyVniCw6maLxlmqHDzMIK2vMO2Svn+si
   qGzyB94IZt55nqjX5FrD7WJ+9B9RqQ/ATQ3kLbQ5jKKufqITKeCSMua+O
   g==;
X-CSE-ConnectionGUID: gDFG4xBkTfKrcxHM4Qcj2w==
X-CSE-MsgGUID: 3tQlzo8JTv+Pi73oHF7jkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72011858"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="72011858"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:25:49 -0700
X-CSE-ConnectionGUID: yWCUu101TgGLmhPIUwQJkQ==
X-CSE-MsgGUID: AzULy3zHQ+6hHqXbeKKejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260168105"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:25:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 02:25:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 02:25:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 02:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av+4awU6RIEHPWdXsqmyHnPWvTWEnHi215AI5HLZJWwypBzv9VsXyePsziZoJZzpiTcpBf9vvTjCT2mrEVmZPsVqKT3WnkzYWfCJN9wiDEvDLSGIJ2xgeOPAGR4O4uyrgdkcXSw4QpHV5WBgiGkfxgV71ZtsyBJ82GVZLpELPdj8m/vfRVcMmjLDJKpG9+zhJNCvG+oMzuI067cJnWOVOR129jONURB79ohQDLcCWdp6RqufK6uqhrrkLLx0/vM8+0ToLdgyt7kRDwMsr4FARnkcKI9l/BDp8NIRIRCArrhdSV1ZHaZw7sfYh4VOZc/f6YhKK6lt5VIpwKWhsEykeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPUXtw1+iq4oRfGF3ywDsTA12pbsLxpoc6l9sNmGjvU=;
 b=OktP6FWZ18yXszWE1daEMqdCqmwBNbUN8u3aIaR7ciX9K0il2xCJyJ+051oaNTSZ+CESyybok6Yz0Y0gzyupTAWdadcFolRC/KPRj9atD3s7s7r7Eax6G5YQ310TUT75LKkA/mcR2WIcvuHQv5A82GfCssWdSW21ySNeEbR4SkQ77bPI9zL8hx0ZksoOhlFwA+fAkk+z6biGR+9DbDev2T+vLhEgkOajq/HU8FPxr8G+zhY6pjhzkbQbV6OdSvMVRlDuQL9LT9fXmGtfuV6lk776uYPGVQwbP9FSiTx8vPo7mA09Wg2NJg1oSenKYohbTwZXAKP097Rfdk4Tm6bdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sun, 12 Jul
 2026 09:25:40 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 09:25:40 +0000
Date: Sun, 12 Jul 2026 17:25:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	John Stultz <jstultz@google.com>, Juri Lelli <juri.lelli@redhat.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/deadline]  14a8570564:
 stress-ng.mmaprandom.ops_per_sec 18.9% improvement
Message-ID: <202607101604.5b29f080-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: f280a2d2-d8c6-459f-daea-08dedff78a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|6133799003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 7Mbnf8M6XP8nt97DTP8bt4RiNS0uiwen7w2r6HQTz33FYbiyyfwA4S4ZmX+OQfWJL69IWtUVRVGeADRV+zNwZvrcOwlEOFbvkgGPRFgqX8pHhHT4U8Yl7HcEjVlkTNBRM4ZDLXzCiwBX3G+DgpNgMv7tiKJ5dFdA7GK8L5sx1rqoGfZT5xQqQ0mvbqk7iNXWWWA1Q5xczYTto54ki2KeVYLmdFA16I9YOabkefx+QGYuSJuTyiHpOTYXlMM/wAsjZS0oc1BQtKFNLkLfbmZE3PqjLFDflmaykJ7LN6noRaEdTjv0XdWoFRNudedgVSwQR+E/CyW4uKXh9OltugOhM/gEhRIL2qEEmswVxV5n2eXpz/9HkIvY2jA2tuyGTZmT/sE6ACXLv1plKvZTFOU4J/1Uhe3hZ7gaYBp4VRXyoBkdeceHUyUmyZmdDlVMUITKMaabTYpwAn4VJiO4Zs0knwfdO9PhDheHoDn08fiO6VI4pSP4W346pRaw4gwEskEFNzushhabU83maiPknHdKmq0JQ8njzjNQT0ofn4xAnHDKMQA9tp0X4yxlUM4ArCIVwCXRzItRVf1pQdf++FJfNhBdaVNmiypiiz7IdkWIjit3GwjhRGyI2Nrppg9/plYv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(6133799003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TBrhUyd4xDAfyIeFhBZGeTKsQyUlbkiZdEszmIrX52G3gJmGt48ssFqVCC?=
 =?iso-8859-1?Q?A/jM8eAfWN0na8/r5VnFNIId7sJKewoGdf/nH+pRwXOBRPbKcS+0XvOgqL?=
 =?iso-8859-1?Q?xLGMAKBp9jQvemLP8NIt+0FSqzIlQslOMmfahMF3xMO8Cd0ZJ2CJDhDYCg?=
 =?iso-8859-1?Q?3BtUkxKwFLFdSJRpuFCi9aKjDJl2l27JBvYgE40/E3adlYAXBDxQYP0S6i?=
 =?iso-8859-1?Q?M5bCLzHRvalh15JkEth4kTt+kBFE/wUFfWaHo1awzEJ6WeNeQeVpXTp94i?=
 =?iso-8859-1?Q?d126Uwh7smnEprZ4R4+JpuRUrKLjKkUR/fwhneb2TEJ7I5WJhY+uUlcMYb?=
 =?iso-8859-1?Q?74+JQ3l1pniMFQ4z6JSBbyVi//Tr03w9oSYsMNl+bQ09w9mBFsH+it/FGU?=
 =?iso-8859-1?Q?BVtQRl+GFRz0SoWF9/gpEvOYbX8s6qF6Wf+agJkuIxO0I1etqnZc6G0hVN?=
 =?iso-8859-1?Q?iKvPdHmHpZLFSiIodagLY53+mc9gMkmXznELCdwcb36uWlMIBK9/gx/gsw?=
 =?iso-8859-1?Q?L3lQSDT5ndneEyE66EH+NHbYsDOtTzcDTx2eRyBaNsSyaHdvyFd2TQJibI?=
 =?iso-8859-1?Q?3rGpVMQ5HrO8wFIchrPuTfeeLMBzGQCDrhprnfP3UvOLyU5+HkYsYL1kBP?=
 =?iso-8859-1?Q?gwDVOuuRB12vqbEwmYH2v3iYLn9+wwiKqGr0uEkT2hBAi6gc+RtYSJXzcY?=
 =?iso-8859-1?Q?g1kjLNo7g+WS9TtMohzDiE6PDayQiPgtDaqKvJN5dOCjci8In0iAvYcBFt?=
 =?iso-8859-1?Q?KxD2uLgWxw5XS7se89aqO5dg4BH4ibFAo/Lv5I6RXjRjd+6Vbhebf03gYq?=
 =?iso-8859-1?Q?UfPM3bfx5Oe4d6oxSHs6ow4th8QcSbgvs2cCIPO+B15t11frHCoVLw0aei?=
 =?iso-8859-1?Q?lwwwwKpQsVItYuHmd6XH3nslkc0qYAMBpasQLPjUsVbDPMlgEnUx6xkpVe?=
 =?iso-8859-1?Q?pJhpOaIr9M39weKVIP35DTsrPcluL8btEM0IpUUAZUGMuDB6w0xnrpmSYk?=
 =?iso-8859-1?Q?mdT46UOQ3cqqhUYFY8sCXSR7vhFKOkPJRblP7d7FIWDllEuYlTPRINm+Vb?=
 =?iso-8859-1?Q?vXNE+NLWNiwhhubC3CTuPlcBzzM32c3y0apojV19zzQSNPRbLANZefBdgV?=
 =?iso-8859-1?Q?gTsJZAP1qXc/ZEvrE7ChDahNcR2BHDHkeOmVAFvkolXWZ8FEjVA68UsTuC?=
 =?iso-8859-1?Q?zBGC5BMhYIMdSvMgXYshM2zalUeWFayl88Yc/76MjLeDBb3UgxgG2XBBpj?=
 =?iso-8859-1?Q?8f23d5Wh/ZAk/7XVA1+duP39RChuILOPKEn9O/gwn9Wj2eGiMpPqFna1kh?=
 =?iso-8859-1?Q?3wOzA/TYhRvyrQWvz+llegbNeexJtk43nf18wUr+5WCJmceXOw2N5JgmIm?=
 =?iso-8859-1?Q?VHgWRqskXi9RpA5o2XNq/juf4NivsiQboEqNwK/NITG1a+pXbp3CwScxBP?=
 =?iso-8859-1?Q?LrFDP+vEtpiscKPyy3otAmgEq4B4foG8txj38xCvgP1OdWd9Pwr+vfVJSC?=
 =?iso-8859-1?Q?BGF0zy4uYpWXO1GbiHpAonATjuz9GBQPGASLIpSujx4RvxteQ8H4u3Bc6v?=
 =?iso-8859-1?Q?dPS9FjTs9JYf1RuSmgJ14ZK6JYjWiqt3FUK8C7zx3M37n+79sYejw+DGaN?=
 =?iso-8859-1?Q?8arZ6olMMMtY0s1lulJl7SqJtt2ppvULtcM7VKcdg6+j39kBSTQu7y5o8+?=
 =?iso-8859-1?Q?eUKMOEMzPBK4y5WsG/0SOVWYsetEKaBEyZ52hrzbb7VT5RPi5H8RCXBklM?=
 =?iso-8859-1?Q?olZrQYzd1RWl1YrzLx/JzSIeCa+upOS14CKYnOgY/2nXUeRXXalD1wE+e+?=
 =?iso-8859-1?Q?yu8vl7Qsew=3D=3D?=
X-Exchange-RoutingPolicyChecked: fDe66IQXP3g/XEAAJ77rEQWDoS9yVW0YBqDxLXxp8aWEQmsRpuyt+kqTluVz+4MgfGhzXQGmcf/mRy0zoP9xHYrSx0aRWZopILa73asndHOWPI4wPkjQoDpdRLCIPDtPFp0+pKT/MW5Lrs9wSGwZeEOb3SnoIY/dQr5ColaqogJFoxUi/UXuF0D+/5qEwO7aiUyeDlcYMV6UYUgDE1WwIXizsQ4ukTUKsxTOcz2xmeYYl3vTu34eWY1H4yJua7H8448wQMPlaeLfUBXFzITk06Y/ce0xwV8UVmAKX8G/wL1f41gJkbjMk2UYPM3v4IQmFzADb8mwjDo2Q9y/dfKc3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f280a2d2-d8c6-459f-daea-08dedff78a36
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 09:25:40.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5RCCEAoHUOE3uzKpC/d2WizS/v47A/1mDI7895u/yskoUgh+F7dzFiQOzx+P5j0H+q9KxdPnFRSnmUf9PKn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 18.9% improvement of stress-ng.mmaprandom.ops_per_sec on:


commit: 14a857056466be9d3d907a94e92a704ac1be149b ("sched/deadline: Use revised wakeup rule for dl_server")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mmaprandom
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260710/202607101604.5b29f080-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmaprandom/stress-ng/60s

commit: 
  v7.0-rc7
  sched-urgent-2026-04-12

        v7.0-rc7     sched-urgent-2026-04-12 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      7.42 ±  6%     +13.7%       8.44 ±  4%  stress-ng.mmaprandom.munmap_lo/hi_addr_ops/sec
 3.268e+08 ±  3%     +18.8%  3.884e+08 ±  3%  stress-ng.mmaprandom.ops
   5266977 ±  3%     +18.9%    6261751 ±  3%  stress-ng.mmaprandom.ops_per_sec
    502294 ±  4%     +18.9%     597382 ±  5%  stress-ng.time.involuntary_context_switches
  42134946 ±  4%     +15.8%   48772691 ±  3%  stress-ng.time.minor_page_faults
     11559 ±  2%     +23.9%      14321        stress-ng.time.percent_of_cpu_this_job_got
      7227           +23.2%       8905        stress-ng.time.system_time
   1834057 ±  3%     +18.6%    2175623 ±  3%  stress-ng.time.voluntary_context_switches
    109.70 ± 52%    +161.8%     287.20 ± 30%  perf-c2c.DRAM.local
     10.88 ± 12%     -24.7%       8.19 ± 11%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.shmdt
 5.149e+09 ±  4%     -33.2%  3.441e+09 ± 16%  cpuidle..time
   3590818 ±  4%     +13.6%    4079292 ±  2%  cpuidle..usage
     89858 ±  4%     +12.6%     101156 ±  3%  perf-stat.i.context-switches
     78474 ±  4%     +19.4%      93707 ±  4%  perf-stat.ps.context-switches
     40.88 ±  3%     -18.9       21.97 ± 51%  turbostat.C1%
     40.77 ±  3%     -46.5%      21.83 ± 51%  turbostat.CPU%c1
     41.69 ±  2%     -32.1%      28.32 ± 10%  vmstat.cpu.id
    114.21 ±  3%     +17.4%     134.07 ±  5%  vmstat.procs.r
     75991 ±  4%     +17.6%      89367 ±  4%  vmstat.system.cs
    931.70 ± 15%     -21.5%     731.03 ±  6%  meminfo.Inactive
    931.70 ± 15%     -21.5%     731.03 ±  6%  meminfo.Inactive(file)
      3323 ± 17%     -92.7%     241.56 ± 41%  meminfo.ShmemHugePages
      3167 ± 17%     -93.0%     223.03 ± 46%  meminfo.ShmemPmdMapped
      1958 ± 28%     -94.4%     109.27 ± 64%  numa-meminfo.node0.ShmemHugePages
      1883 ± 27%     -95.2%      90.32 ± 80%  numa-meminfo.node0.ShmemPmdMapped
      1464 ± 25%     -90.2%     143.09 ± 73%  numa-meminfo.node1.ShmemHugePages
      1380 ± 26%     -90.7%     127.76 ± 65%  numa-meminfo.node1.ShmemPmdMapped
  29299405 ±  3%     +16.7%   34179169 ±  3%  numa-numastat.node0.local_node
  29397753 ±  3%     +16.7%   34300051 ±  3%  numa-numastat.node0.numa_hit
  29074958 ±  3%     +17.0%   34029990 ±  3%  numa-numastat.node1.local_node
  29175702 ±  3%     +16.9%   34110422 ±  3%  numa-numastat.node1.numa_hit
  29398448 ±  3%     +16.7%   34299565 ±  3%  numa-vmstat.node0.numa_hit
  29300100 ±  3%     +16.7%   34178683 ±  3%  numa-vmstat.node0.numa_local
  29175972 ±  3%     +16.9%   34110183 ±  3%  numa-vmstat.node1.numa_hit
  29075150 ±  3%     +17.0%   34029751 ±  3%  numa-vmstat.node1.numa_local
     40.14 ±  2%     -14.1       26.05 ± 11%  mpstat.cpu.all.idle%
      0.33 ±  4%      +0.1        0.39 ±  6%  mpstat.cpu.all.irq%
      0.26 ±  6%      +0.1        0.32 ±  3%  mpstat.cpu.all.soft%
     57.71 ±  2%     +13.8       71.52 ±  4%  mpstat.cpu.all.sys%
     87.62 ±  6%     +12.6%      98.66        mpstat.max_utilization_pct
     22227           +17.6%      26146        sched_debug.cfs_rq:/.avg_vruntime.avg
     82637 ± 12%     -26.0%      61123 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.max
     18397           +16.4%      21416 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.min
      6674 ±  7%     -26.8%       4887 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.stddev
    829.95 ± 16%     +37.0%       1136 ±  9%  sched_debug.cfs_rq:/.util_est.max
     22226           +17.6%      26146        sched_debug.cfs_rq:/.zero_vruntime.avg
     82637 ± 12%     -26.0%      61123 ± 15%  sched_debug.cfs_rq:/.zero_vruntime.max
     18397           +16.4%      21416 ±  5%  sched_debug.cfs_rq:/.zero_vruntime.min
      6674 ±  7%     -26.8%       4887 ±  8%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    142314 ± 12%     +56.2%     222249 ± 11%  sched_debug.cpu.avg_idle.stddev
     14910 ±  3%     +15.0%      17153 ±  2%  sched_debug.cpu.nr_switches.avg
  58577011 ±  3%     +16.8%   68413496 ±  3%  proc-vmstat.numa_hit
  58377918 ±  3%     +16.8%   68212181 ±  3%  proc-vmstat.numa_local
   3081605 ±  2%     +19.3%    3677408 ±  3%  proc-vmstat.pgactivate
  69802610 ±  3%     +17.2%   81798112 ±  3%  proc-vmstat.pgalloc_normal
   6196217 ±  2%     +19.9%    7429815 ±  3%  proc-vmstat.pgdeactivate
  42798950 ±  4%     +15.5%   49451147 ±  3%  proc-vmstat.pgfault
  68727309 ±  3%     +17.4%   80696135 ±  3%  proc-vmstat.pgfree
    627355 ±  3%     +19.7%     750783 ±  3%  proc-vmstat.pglazyfree
      4638 ±  3%     +20.0%       5565 ±  4%  proc-vmstat.thp_collapse_alloc
     15260 ±  2%     +19.2%      18197 ±  3%  proc-vmstat.thp_fault_alloc
      2729 ±  3%     +20.6%       3292 ±  4%  proc-vmstat.thp_file_mapped
      1214 ±  3%     +20.9%       1468 ±  3%  proc-vmstat.thp_split_page
      1214 ±  3%     +20.9%       1468 ±  3%  proc-vmstat.thp_swpout_fallback
  38553874 ±  3%     +18.6%   45724835 ±  3%  proc-vmstat.unevictable_pgs_culled
  38620357 ±  3%     +18.6%   45806796 ±  3%  proc-vmstat.unevictable_pgs_mlocked
  37844607 ±  3%     +18.6%   44877490 ±  3%  proc-vmstat.unevictable_pgs_munlocked
  37775054 ±  3%     +18.6%   44792535 ±  3%  proc-vmstat.unevictable_pgs_rescued
    775098 ±  4%     +19.8%     928721 ±  4%  proc-vmstat.unevictable_pgs_stranded




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

