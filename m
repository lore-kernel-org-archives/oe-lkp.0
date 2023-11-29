Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4C30327
	for <oe-lkp@lists.linux.dev>; Wed, 29 Nov 2023 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV3XojU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701267294; x=1732803294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ea9o2XPuJcDCRUbY6ESo6dY5iRMG4DeRCf8SegATGGk=;
  b=HV3XojU9M+7hbzPVjsD75F15FpQ3pxDJ67sYaxUBaPjN3uWSxRf6YfGb
   3haYn+BJDTFphMkDxPrEX5B1MCC+68lwTpLowvLXvXf+gXvyUPuB8+QNo
   GMl9c5oLHBMKF0fBojibngl/KEAEo8mC3ZVfyjWTrKNO4/GF8GwEqtf2t
   vJDak2AFd1NNUNQzadJzYt5E3N58KytAzqQzH8rt22gxmcdICSIqnAPo0
   WmhsXuYFIH+bpU9ulb3TYZdc3qgAZe25aGJsEa+s0NTCVg8e16bavpx43
   UTTrhYiLdD8gD7KYNNsM4tONthxezFleV0Q/H+GDWxgBCpSZYIcqjcVQp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="153657"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="153657"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912867978"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912867978"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Nov 2023 06:14:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 06:14:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 06:14:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 06:14:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 06:14:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDiWFzXJhgGF08kWaXg9dCReheve4Kf1lGoVdqPVJhQwhsboXWIQRLriG0JxKLjEFvlpxXltDLlzRO1reNwqVWxN1GzNXLnULoU9PYLzFYkf6puk/S5MqEhvdGZOfozJ5UyEi8F0VtarTYEBE0s/6281UiwJNcFLjJhTJRo0UntObM7JO1CcTnwtwf0W0ruEVZKHR7z0pMLO4Q5GZQTdwdU9MJAa1lUjYLymhMONtrDR4dIPOhOibmQcSJ5Ej5kiGcDldOm60LNajPcHqj0BiIPjScdHH9xorPuSWsUtz3bIOMGhA2jYuBJjqaV7fPfKwaK4PFBRwF0A6wfmCDLx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF5UQ2k6rgX8ahlAjTuols6w5vQ69ggV84Gck0WTr0Y=;
 b=Pe9dLUy1h7cye7PM4GH1S8484Tu2GWuEJ0uPk0JkbwQXvQHF7XE41C6oGV3AgH+SwnCaCMrq4xjUShIaD5gdHKMJboFzAZaLba2YXj0MdjZPrZ2n+Uu2kOUMs4HAe7XXD0SxUjfhmJQ/Xop07ffEl3v3evPX72A/Z6fIs7buAGIQv2hk2ibjpLDBck3tNOVt8QmvyM1nez8tfnMQ8cph84mYppTLd3UCPipe2umGdEePc4VkiK8xsmE5nkUtfLgJHdbDaVPfl9sBxWkK++OIob98eLlWIRr4MuTeMC7MgzagIPohrqolVOvq2u/qrg4JnUXCYZfAnI8K/HUNaoldBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 14:14:48 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 14:14:48 +0000
Date: Wed, 29 Nov 2023 22:14:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [djwong-xfs:file-force-align] [xfs]  c5940f0987: xfs: Unknown symbol
 security_file_permission (err -2)
Message-ID: <202311291542.e86b7c16-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c2a4c1-eed4-432c-0646-08dbf0e58b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJypveiEEY37DiUCIA8X3OK/Jrtwc0ILMmHN8xFYb2c2xyRjXZVILRXCB0PGPAoIMG1/+eki1mL/IehpAq3nhmcp0nfKYATlIgvGbusOtYCwIjpOYt/5QFKHS8L1Bx0WzCII+gtJsDskBYJ44InnWNtq8GY8B7i3Gm+AGt5OA1COffhAb6Jj6aghmbzar43hpsanaEEX2QUJ8OEUdbxGIVLtAuP4MXh0V2n9+0ZzxNg7UU0i1XQd+7TkpsIJqC9NhembA9wH0ML+hSsMgNZrjm0cF8rm7KkNldc6PzbSRICSAZESCubm1d5HFisnLJuc54wU5d7sfPIdqNQ2nwWpYgIXZsqKYvrq42HGRFj4eQNkDnOllh5jvRrpKAinnGs/Cin+oeP5zuDvZ4NqLzdrgQw8b6uPoZlg6iURmLxa/dpo9opJoI8z45GwfPKPrZU/Em4JbP/IbsBPkfIXX9Pi08bggMmHMUyqtleulkjFGjkUEA0IUHhRdNDOSXZvfM9TeFn9zk13MblLy2vXE9VyZ6/2hDzWoI30+L1VrkfNlXeAbR//aSsBgOG2TJjBnXn+7x8o7vadleVDR5iLb+xGQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(4001150100001)(2906002)(6666004)(15650500001)(86362001)(5660300002)(83380400001)(66556008)(6916009)(66946007)(8936002)(6486002)(8676002)(966005)(4326008)(6512007)(107886003)(2616005)(66476007)(316002)(1076003)(6506007)(26005)(36756003)(82960400001)(478600001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uyMA+am/Ava60va+4LTeYGND8VRiEP2kdx3CmQc6Zlv4tYWanzikQHgITYok?=
 =?us-ascii?Q?YuGrUIZpkQ1TyHFOBExcJYHs0i9R+uItRWyGNWJmMH68K50NY9gc9XY2/PM3?=
 =?us-ascii?Q?i1HjYdSzf7NZvGVsNkFi5ODV4Wj+TzdQls12kok8d9QA7tweVrYVMIwm24hN?=
 =?us-ascii?Q?Xczcq7/YpATivuZjRIFalHhfHJVXX4dyNoxkJKK52zVy4Qj/hb9i64CN2o2s?=
 =?us-ascii?Q?nQr3wGRqipm4YHsxlvQzEJmQsgbJP7tuyfDkAVK8nr/fJnEs4QBBBnK6BiRD?=
 =?us-ascii?Q?sN8xqYouMkJfNWnK2t//njrMfmFTOwRpnr347tAiz4WSn9BZ9/QxCrVgFKn2?=
 =?us-ascii?Q?MY9f7X8hY1DlQFhrq9DXtpIbSCm/mZ/F7w+1LrzWZzzLgNI3F94EHqSpYe80?=
 =?us-ascii?Q?IOuh/lkD/u4ogrhw2kH2fvsyNLMBBGTxDMlQIBV82lchlBckfeRDZG/ov922?=
 =?us-ascii?Q?xeLEJyyZwpzZmXI5BEFSwwd9ZNB9VIkYSR3D5qtmO9MuCOzjlf6uL86RwSZ8?=
 =?us-ascii?Q?vbCz1SYS7Ixe8fOqHEpMzdsKfeuc2Ln4U+nwuwG9oXn6T60FKXn1pqMGPeM0?=
 =?us-ascii?Q?JstmAcGqmIt7mbkbKjJaUEfGcgexoxxe1mbsvHjjs7De1ZdxEGX+C1ezttU1?=
 =?us-ascii?Q?dDIcZkgmG3X+wlkGYF4eXrMD9NIL48CF+ArKNW/HYcYP9N4rg9nwpuf2iPun?=
 =?us-ascii?Q?A31XpCy12EVCRrcLpGURylG8oEb8oRZRs3QhCySXbRkjNAL9aHNyiAurgvAt?=
 =?us-ascii?Q?1BI/22Tb2KnlyOBYHyVxAEijOwSewX+hrE0PjGfuiYSAYmPcvIkbab6S4u+3?=
 =?us-ascii?Q?CEFeeMOqL/pr9srr+WfPZ0bXC0pQl9yH1QH3DtOkWZdN+RvaL5nNzh9wTWmi?=
 =?us-ascii?Q?+zB9e8sfJfTlRa0q0Tcu5ptrRuW7EqqAJJk3o3PN2r8pG6lEyVW9yAficC1K?=
 =?us-ascii?Q?ZRZ3F5NJgGXmwrD1AWTmOrJj/7SVtgYQJNWishM2L8wHZ9O15JbNl7VMZ9W9?=
 =?us-ascii?Q?STr/AH0TKRafdXU/zUGoT+slHjt/DtY4CEf8SucjPmB20hONfetap++jmlLd?=
 =?us-ascii?Q?Qn+Q580NUN9PrCtA04FiivRnVrMZIR8o4YBsJJZErHDyV70yzqt7GoEsO2Aj?=
 =?us-ascii?Q?h5hrmf9mKOhJ2wUtrn9B3uceTC2AP4f4ja54sJ4/jCj16G6IgEdpCP4TEfoK?=
 =?us-ascii?Q?95pXiJ39fda0/cLkn/XkJjcnAN46Sc2eHdGTK+CuXy1SXLu9A+31mXesRIAr?=
 =?us-ascii?Q?pZbqrmM1TSMu04F8a5YPzIKUYTudwWIvQuOlopKvEvYDg+kEliRpR2ew98FC?=
 =?us-ascii?Q?n7c9/0dia8kN8LLoplwctFnPSI03L7f6ExRHHrN1n4edEZ4PB+CFf+uJub7Y?=
 =?us-ascii?Q?tMMTGUTYhb+Lw820mZPyFggs0XRJymF/yAYnG4muBeugxg4EXDobEY4sHWGl?=
 =?us-ascii?Q?craJRU1bmze7QI3NfVbRYMk4g6muqBQXXjQ4GNBseF7wCC/B8fC6L3lzrpPR?=
 =?us-ascii?Q?/Iqe5iOwFdVxJYyxy6JRrmEZtZJzGzkITBPmdecNPuuEtUtZrZWCFa+M0K3K?=
 =?us-ascii?Q?QtOZ5a+vJ0qKRJ7no5qgjtci2gRe9ZNLn3h3ooO1r8pmmitJY5VnS/IfPowq?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c2a4c1-eed4-432c-0646-08dbf0e58b54
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 14:14:47.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do5CHhpmuMas4NCX0STcPKUgFPtmDzznRHBLyAT+xzbiDqInwp+0LnKeHL/xYLn4ZD2/gb0Ie01pwWrdQ19Clg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "xfs: Unknown symbol security_file_permission (err -2)" on:

commit: c5940f09879d6a6d317724679da4d67439e3fb26 ("xfs: add an ioctl to map free space into a file")
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git file-force-align

in testcase: filebench
version: filebench-x86_64-22620e6-1_20221010
with following parameters:

	disk: 1HDD
	fs: xfs
	fs2: cifs
	test: createfiles.f
	cpufreq_governor: performance



compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311291542.e86b7c16-oliver.sang@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231129/202311291542.e86b7c16-oliver.sang@intel.com



[   41.462104][ T1427] 2023-11-29 00:12:04 wipefs -a --force /dev/sdd1
[   41.462106][ T1427] 
[   41.472151][ T1427] /dev/sdd1: 4 bytes were erased at offset 0x00000000 (xfs): 58 46 53 42
[   41.472153][ T1427] 
[   41.484000][ T1427] 2023-11-29 00:12:05 mkfs -t xfs -f -mreflink=0 /dev/sdd1
[   41.484001][ T1427] 
[   41.494897][ T1427] meta-data=/dev/sdd1              isize=512    agcount=4, agsize=13107200 blks
[   41.494898][ T1427] 
[   41.509248][ T1427]          =                       sectsz=4096  attr=2, projid32bit=1
[   41.509251][ T1427] 
[   41.521420][ T1427]          =                       crc=1        finobt=1, sparse=1, rmapbt=0
[   41.521422][ T1427] 
[   41.534610][ T1427]          =                       reflink=0    bigtime=0
[   41.534612][ T1427] 
[   41.540877][ T3864] xfs: Unknown symbol security_file_permission (err -2)
[   41.542655][ T1427] data     =                       bsize=4096   blocks=52428800, imaxpct=25
[   41.551565][ T1427] 
[   41.563630][ T1427]          =                       sunit=0      swidth=0 blks
[   41.563632][ T1427] 
[   41.574623][ T1427] naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
[   41.574624][ T1427] 
[   41.586165][ T1427] log      =internal log           bsize=4096   blocks=25600, version=2
[   41.586166][ T1427] 
[   41.598109][ T1427]          =                       sectsz=4096  sunit=1 blks, lazy-count=1
[   41.598110][ T1427] 
[   41.610176][ T1427] realtime =none                   extsz=4096   blocks=0, rtextents=0
[   41.610177][ T1427] 
[   41.621225][ T1427] Discarding blocks...Done.
[   41.621226][ T1427] 
[   41.628803][ T1427] 2023-11-29 00:12:06 mkdir -p /fs/sdd1
[   41.628805][ T1427] 
[   41.637326][ T1427] 2023-11-29 00:12:06 modprobe xfs
[   41.637327][ T1427] 
[   41.670860][ T1427] 2023-11-29 00:12:07 mount -t xfs -o inode64 /dev/sdd1 /fs/sdd1
[   41.670862][ T1427] 
[   41.694551][ T3875] xfs: Unknown symbol security_file_permission (err -2)
[   42.754449][ T1427] /usr/bin/wget -q --timeout=3600 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-icl-2sp6/filebench-performance-1HDD-xfs-cifs-createfiles.f-debian-11.1-x86_64-20220510.cgz-c5940f09879d-20231129-91225-usfqyb-3.yaml&job_state=post_run -O /dev/null
[   42.754452][ T1427] 
[   44.990514][ T1429] modprobe: ERROR: could not insert 'xfs': Unknown symbol in module, or unknown parameter (see dmesg)
[   44.990518][ T1429] 
[   45.013307][ T1429] mount: /fs/sdd1: unknown filesystem type 'xfs'.
[   45.013309][ T1429] 


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

