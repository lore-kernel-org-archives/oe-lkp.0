Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725373655E3
	for <oe-lkp@lists.linux.dev>; Wed, 15 Jul 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125495; cv=fail; b=rWgTkPghomzkG1mGP326BDaGkwAOuy9UG25UeIbEBvDtz2PqylsPTqJ09AFwovbM7N6ZJ7LOGZw34kGnGxAUufLWytsd1oYjsIA95FzPNLCAMkY5AF5eo8G1pBEE5olTt4gpqDeTJjrkosdqeDG7/CK8In2HGKZPDrEIhxNHWrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125495; c=relaxed/simple;
	bh=XH1z0Jdp+si3yujjKfq5IcP8ig01L8YK1KDl9UVTFhE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=akMGOegLJsIPqyqjKQVE61i0uG3zlNbc3Qs6MY38bF3M8uU9DOQTG9kcrSTFsJhTndvtHPM8LV03WEB8/JKBEHDbuiClUHNMCc45NYN8GMycgDxWkiUO6TEzCEfsF+fU4eaSp6Ae2n7ldSOjQZhVbQP58Oe53EIkhfXAeeiPiio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSkQycYr; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSkQycYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784125492; x=1815661492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XH1z0Jdp+si3yujjKfq5IcP8ig01L8YK1KDl9UVTFhE=;
  b=aSkQycYrC9zwkwY9IH1qN/zA7ILso5pJkbhRHBaDMAEogQjV6Bk0KhFe
   eYHgNqSs39WP4h9Rx5hXHdiWUqwbVTvxCQrkLgYQKggZbTzYMJkjGLxS9
   ljBGkGMF1Z5fGmlSn+66fk0CrsRx6I9sPNoSC8VCbqHTNoRYcsJnqIC1i
   u/KuveusbRbtpuB9g6wPJ2VZHO3qY2vBQgeezcy58uI8CytWKKZMnF9M4
   eLhnUJCLAZqaZD0o+VbAZCF/jKgucE9E4q343jxmtpm8gtIYT038CRgag
   8veBrMKIHbvclKLy9srtXM4BhEeyaiCtGGwnjISttYNP0tIptceGqLiuO
   A==;
X-CSE-ConnectionGUID: PqD0QpbxQsmA8xlBY6NFPA==
X-CSE-MsgGUID: kM2z+Im/Sxid5WYteU5IEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107560658"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="107560658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:24:50 -0700
X-CSE-ConnectionGUID: RzxEIhV5QuyW306wPIMvoA==
X-CSE-MsgGUID: 4WzeoTynTMaXmT8cOC6cyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="260010284"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:24:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 07:24:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 07:24:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 07:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTVXiKmEVMYMG5h1VM9NsLiKew7tHzepNiGbKLOMK2lbG9Wrtar64feNCIuDA63/k9FzK/SAenrqhtWBUxn7oioyMGrftC1BgsqAf2YW9AZ2DQQijLPc4jqWoChRpKuz3oBh7PwB5Uno2mjUt4LlH6v5xF6xNy3IpCCfI3O/M/Fb1Q4cm0N45hpbq1h5DLU4J24o+ADw/XxKozh5gjHnBp5TnA9z+BmE5p3CIDj47+Sq8E0RDI8qq1J/HtwpVgasCFUxnt29LArNPERqkhFUK9/ry7ayREsSZoTka2w7w25dytnkGI61tEOZPd4gyAYrNBZhGkdP7R6xGXktAFOt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgqJ/pMZ/o2gnVOpfiP9pVsxF4xGcOVgUai6AN1wbOE=;
 b=invndxI0rrsGGt3sngCSDxbFFNmmi+l2mL4cGUNxS5yNvozFbRlzauqRB5dw3UBmcSXgT6x/XoPBCiwpXZ2QQ66oyRV4qRmc2O+7FvZOvUi6abwBoc4xt3Rw91FJEGOKW8affWfmu0PX49wshGjfFHvAwJ4cuNsJIN958a8B9tmMXMCOUzM/Hxxsu5e3ZYSYfAXAi3pNhER0boLJ39/Qv3ahouolp4ENk0wCGVC9nZFbF8k147ty23mf/R0EjQHuM5Ur7YGtZHtitRZKxBZ+GPsdjrGeYP4kxxI1gL8ugRkT1Sqlgv440/tmzJ9kG6s2SVPMSfqfjPJ6fGWI4zl0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CH8PR11MB9483.namprd11.prod.outlook.com (2603:10b6:610:2b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.19; Wed, 15 Jul
 2026 14:24:25 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 14:24:25 +0000
Date: Wed, 15 Jul 2026 22:24:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>, <linux-edac@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linus:master] [x86/mce, EDAC/mce_amd]  bee9f4178b:
 perf-sanity-tests.perf_annotate_basic_tests.fail
Message-ID: <202607152207.cf7fc71e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0028.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::17) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CH8PR11MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff74412-bd7d-487d-d059-08dee27cc566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|3023799007|18002099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: XlPQ7eFgkCX5CH01G6QT0EF2f/VqvUAhLDfPwcopdxr6xxJDY/Uspf7bGU+GkixGpSaqQHNJZE61iftR+bLsz56jQ8jUiEVjBl48KHebmnsgyVyIUE4wNTgYXbXG2DHt32L9RLnd/eysWdukU3995xgvBB0BFcRDFDbSO5i3Lo0ScbYd9VgO+ICEiEHCJuMpBPgnyKiuYFD7c7anvbXU19JDIeqmI8/3JPlVdISJ88nXfVHX6g06MDyiWb7Xg5dkBDC4SBnNrNLAva8RcWPZebHTNm75nNKCTrvG6PPz0TE00nu8IBcOVnpn4V0uPY6y9jH2uCIuejmVbUy5+3Eq9Fk4IhjdrrLohk7+ftwufs1kJaXm8lz4FQtr5jZb7PepHXe9yf9nt16T94N0/F2pN8V2AnHDu4p7nujKLiIPdv7WXAiSaeYE5VOq465HrJS+hCop6cytHpllaGOsrHRDgIsQ7iU+AzovbsFVSChcfxI+miJulZ5OOT19lQ+MSv9cTNITXrunc7XkusQS2HVnAD+Rfp0pTFRMn9VHRj4zz7ykOO3A+DU8oUhLmnqHJHTLVEnurATDG5f2tj5Fwp2A1y4qTJ6x0H8G2FS1ZQZNDrwg4JBHDZabWu/B9D9ay9dq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(18002099003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WOoXPHgwOGlAnwIVP7Iw2U7OAN7Ft5NPLZGKTlDKmV0gCgKEQtPOvKBbXQgI?=
 =?us-ascii?Q?QX+d2XNGnYEGGdMnuBiksGf0Km+POGWJ+kVOD/40Z9Iss8+Qds3y0qioesyj?=
 =?us-ascii?Q?rLE8YB9AVIXLidAtD9kiUJCNik4qOGbmNeufc7QU9rVpsdsrJz/l1aPCkEWJ?=
 =?us-ascii?Q?OHJozlOHR3ouQaKlIK7XslgfswhCBfFv/QWZ4qqNDxnJu9EMj6x6DdN5AwHk?=
 =?us-ascii?Q?V8FdIg9nErIsnlMGxzR14ZW1CY9nsP/OrXK4ANifnN2Jd59nr9IMYlBnTg3W?=
 =?us-ascii?Q?YP8up0RrGk9KO9muK9xNt9Y+G3IV6dDPQh4a8gQjWvYzgSsY8iFxI/qKuTOy?=
 =?us-ascii?Q?JHMX72btpJt7vCV6gng4ZnE5Brkr0buK2Vd4Y2/jF2mpLf9Xf+UGYcmUHk/W?=
 =?us-ascii?Q?+yHEjxWia9HRsZsWUp/AurDGhyodGWdSdbdlqzLE8XbBzA4sBKGpE15uboFB?=
 =?us-ascii?Q?fR3av/+I1XDw1QpmMbYbkOyM9VuQ863JqZCh5TsWTHIjR8zprphoptnGCQSz?=
 =?us-ascii?Q?QafBZR0DuuDV8mo1hG7EkJOYZXJ8rVEgFcweyoDrvkqQhLZS6tny7I/B+iQC?=
 =?us-ascii?Q?TeefofiZrjiib/Tss8sd9ffti4V3OmTByjXCVxaybuU8+wHzB4YN1+TKxEt6?=
 =?us-ascii?Q?jH+ylOmoXUpZrEvAoeRRGZ/pL3vYHYk+KbI+zcuzcbs6z7SuZUj2WtMyRoUO?=
 =?us-ascii?Q?ZduaDvT1VpnE1PAjg8v53pw2nwEBU8zrPtbxRu/Da/R0pJR+yq/DJbZhEQ0B?=
 =?us-ascii?Q?S5CQO2zVk3bQkKYJrsEzcUDQqAFLoQSV2X07TwgWTADmlQoS3/zLGuBJrWln?=
 =?us-ascii?Q?py1WSu8ONENOMuNK1UUMzePdXEsDMwXjEeXrwMaX7GEdgy/jtxPzdgmwaps2?=
 =?us-ascii?Q?ukxNMrp1t2mWCJOF6RsxeAUhoSDJD+bSF+uYhKKijBg5UdWG7u3dhy3LF5th?=
 =?us-ascii?Q?FxlpNJWsALLbUWQLbweIKXI7hXkKdV8TUfR/fNFd/8cXKfY3hK8gG2HXqg7W?=
 =?us-ascii?Q?LTzBiPWpRpvW5U5T4e5Ov77gqkjuAv25cZSB7BgusH30pQ67U5ihQLYa3uM1?=
 =?us-ascii?Q?XQbdLT/uIejm3Hls9+LmMcHadDh1AHtdaJwPKIwpo/NFes0V2RYycpicNgR7?=
 =?us-ascii?Q?GDyGXGzED3Ogr5O9O14R1MMo4kfO/UcrI0yRLbwDVIg/BOJgBMNl/pk0mbE2?=
 =?us-ascii?Q?NuvbiuVMzlvOwbmKIoEfD1lwrTemayUW/VWG/HpnTEWrzCpnR5+aVSArZC06?=
 =?us-ascii?Q?Kt87+neyeOnOwPAmw8YhBVaQwYYmNqsYvcFOqzS3VTLVcD2gBV8RpBHCRTCJ?=
 =?us-ascii?Q?mzkeTsmisiSlVDf8m+r9smCPukNIxZ+QtSaEWVwgJT+UOrM3Wkxx86hcXiv8?=
 =?us-ascii?Q?gi2jN9s2o4vHGXwVjY45LpfeYy8R+xGQdkOc4AiXrVo0N+8AcQ9iOpSUC2YP?=
 =?us-ascii?Q?Y0fLG1UVXdUO7XX7zNRwaN9ar4Z+1lgcvwiaJxWBnvWqmuFybmn02FHKJOpJ?=
 =?us-ascii?Q?WGJNtU93D2rmWB10+QnrgYQKJIktA0AydFCxrgw3R8kMv7cfYzBTYy1+j4OK?=
 =?us-ascii?Q?nCV811WZTegLW6wbBVx4LArxMJLRsO9lA22Whko5jNB19TmY+MI7W4ZqhiqQ?=
 =?us-ascii?Q?x7Z8UIYeKoJlfS2j6i+g1e0caT9oL/+VPg8cLYIA/ls5Teyqkq1UUq4Oz6Vb?=
 =?us-ascii?Q?aYLdmCcS2SgTRZAgBJyS70sNtqRcz5XHzoKIJAqbD6P9zLlrlpzkrQFW8ex2?=
 =?us-ascii?Q?w5dRwCRXcw=3D=3D?=
X-Exchange-RoutingPolicyChecked: cR73bws70eRWATRO0wxGq/sKNG9RQgpGBfYfMqh9w/ku59FKQw9iNJFhJhauVJ1SN00xjoAwI7hTUnLBEfg+KzvH200qx23vHwckGhQy5pK66SyB6UyMGwwhGAhd9PpNWfmw1nkaclfPdPMOFxkZqhy4miS6PT6OZUkMda6QGY2WBO/ouYXe46QsACuPxJkpvXWVOFmod31w4lZqSjX2vkQhA5DGmTlInpN/wIM7vEXEzKCUwCVvI/oJ81Yiisf0TqT4JrutN2stijguVU3aaHIWrPxLFAK5fdHAdhCYTZj+YyqL8qZNamNyieWrD/5wErXtAz/BkATtQGYdQJtifw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff74412-bd7d-487d-d059-08dee27cc566
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:24:25.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //bGO3l7DVNpIbP8EJuOrMmnK0PEcatcuQyz548uzHK1HuvAFcwgsvCuGxZyK2FPF4LRqk22IhCEEP+bQrjhjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9483
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "perf-sanity-tests.perf_annotate_basic_tests.fail" on:

commit: bee9f4178b4a3fec70414c82ddc4bceff182f2ba ("x86/mce, EDAC/mce_amd: Reorder SMCA bank type enums")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: perf-sanity-tests
version: 
with following parameters:

	perf_compiler: gcc
	group: group-02



config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607152207.cf7fc71e-lkp@intel.com


2026-07-12 20:21:29 sudo ASAN_OPTIONS=fast_unwind_on_malloc=0 /usr/src/linux-perf-x86_64-rhel-9.4-bpf-bee9f4178b4a3fec70414c82ddc4bceff182f2ba/tools/perf/perf test 78 -v
 78: perf annotate basic tests                                       : Running (1 active)
--- start ---
test child forked, pid 12788
 16277bb-16278ce l noploop
perf does have symbol 'noploop'
Basic perf annotate test
Basic annotate [Failed: missing target symbol]
Pipe perf annotate test
Pipe annotate [Failed: missing target symbol]
---- end(-1) ----
 78: perf annotate basic tests                                       : FAILED!



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260715/202607152207.cf7fc71e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

