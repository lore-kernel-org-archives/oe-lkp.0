Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5798F392C2E
	for <oe-lkp@lists.linux.dev>; Wed, 15 Apr 2026 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776237268; cv=fail; b=JskBSYUKAT0tGr1WsGQoUIaDWj2bVneeBR7Okq/wTbjo29hXmYgg/8alvCi4L+XaAzs5t+275ZJ9n3byWT6Nz5+rawU8O/5/b2DAga5HUSGIN94Q41muZFmgpogKgy/H9G/43ytH+JAWWtXi/9NH32RVBMnyhyUh5ZySS34Cx0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776237268; c=relaxed/simple;
	bh=0JT0deTsKIhCEaKGSdNCfXbQwkd/XPyffVvuItazU0s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lJ/1uatnfGzpN6pc/23HY6YPcRnhxp/pfL44cmQaKCW0Yy0/Oj8S3q2iMNI2WUDcNJ02XR5OCxJ++Rv/mB+9Pud/N54P5/SnPqhql+UtIveuRPod0z9iZ0s6+/qj/GFbmthPKvgoLgEWB+9ogZmbRchGtSxkKja787hTm5BJtiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PECk7+ab; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PECk7+ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776237265; x=1807773265;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=0JT0deTsKIhCEaKGSdNCfXbQwkd/XPyffVvuItazU0s=;
  b=PECk7+abTirAYreE/Tts8N/59UK3FglB/FWtx2xfMhyTUOsYkhzBbj5L
   88py1DOxcS08HDLCCQekCXwbpch4CKED0997AMyZYQIUniAoxU2Y4TL7V
   1VVOeKweSSxDIsOvfxeduSZkOlfHpHLAuRgKXhOSbKN7K5O0CvM63p0ui
   1RuY/JPn8o+gJaO2UqmzSLBVb/ASAqKP8TSdqzS9BiwxOj2K2RQxbJ5xx
   TYx2EAeD1l8llCIRvtVsqylwjDMyUzfR80GIyFo71PIgmKvnZ8SasWV5Y
   VOOjtQGfFwcHGkksG3YFZUKcWswqPO19ei6WyLxLUcUIpGURIZqCIc7vJ
   A==;
X-CSE-ConnectionGUID: czcBRXDnQw+k/ZFVIWIUwQ==
X-CSE-MsgGUID: gKNTm/5OQmaJFHsIp0kjeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77178680"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77178680"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 00:14:24 -0700
X-CSE-ConnectionGUID: 0I8THP4ATfiBxb9sw5xThA==
X-CSE-MsgGUID: Zmd4f4GWSnC7j9crS/C7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227154714"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 00:14:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 00:14:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 00:14:22 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 00:14:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfqsLF9RjfaU641CwW+CekR4aTaFogzDZcWcAJdehSNK1p1BqrA7uDeyEv1nGvsszjQqgRyGw63qSBojsH5PuhHYA8ys36DLMZEzfN8bfp8/4NyHtFZc1hnvOXg0Mr7gpDcGnAp5BntSm1ABG+pMNaNmTKaMVyZ4imSklxcMSC7rWda9tlCPc2q1rVdtCjxxjZjjZqhdMtCH8qKK6EtFs7I7s6MlOTgO9elpN4y4WuRa0UPTRy0EyeUAzEMmTI4TugT+YgghD/d87C3aH+G43q2i7M5xIAOMCbx82ii9hijWq1ZK/XoY9rZCBngF9nWhfqKkTLifvPDS+w/U5xvCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MMjLwckBIXK+zXsHcP3Sdko6T6+DhnGQstpH1d5lj8=;
 b=VnunqvAi5F/clTKgXDLEO/TzaJVo0IqA0401P7mcZy1Bwzy1joioIKTe4ZLNbcJuyGBwgx178r3+GJLBauYwI3GKafpOEl2owkHzH4V61+4svVXFtl8qbabUJ0KFWYi4i69SkTH7gPGcyDAO36Lgfo+KpP3/yrvROcfORwWEyzKtlb3PMkwrUx55SCSAUwTsiwP9ECFJ7r8JP2+1UFM0nPeLwvhhfAGe/vxcN6AgSdfdMo0ih+mxCU3kNHYMpg33KJw6bkY3H2iXlCdS8//vTex0myeWI8fara2yu99SMDqDZE0R1yY3UUF70Y1dshRPrFBII4YsR+ClbaPsuu8MXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Wed, 15 Apr
 2026 07:14:19 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 07:14:19 +0000
Date: Wed, 15 Apr 2026 15:14:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <oliver.sang@intel.com>
Subject: [linus:master] [locking/mutex]  25500ba7e7:
 stress-ng.epoll.ops_per_sec 33.4% improvement
Message-ID: <202604151504.904bca26-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 3571e97f-c843-47dd-5c61-08de9abe9c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: BslxRvzHDpQnmg1MxA06rKof4F9oy8jNQOFWvky56Z8357mox/ekWQry+EoU3ffHb8EBN8qro8UaDfDFUC32VcL8NgPOlvGJZS7wobsxhoacj71yy8UzY14kWYs46NVKIMY+M1NpwSuv9+sl2Y4m/SYSQL2a4Vdm/OmIH1yjzefBWsCX7ZxfwzOYrnYByl/Yqu8iDGfmWDdStFkod4/gDU8zd84nMD8p84trXCCP5z2/Sh4NlGXgFQRgMFQ+XIGM30eAAQq02HgYPliesVOzjwNRrjB/BWN4aPeiK+xl3QPkTH7UNmwUGWAKsQ4fVA7zHrvE6RFL9N9+Os5jZ+Di2f3gIpJKHoHyh087Jj2K9gPG0/afBCjH+DnmehOiAORfQknhA6J2lfU7gV8FkNk+UrJekOWNgI++SzzP0pIkwOOJPXso5lcL+p9dOPNa7Yy5IFvPC7ain5XlbWbDoG5/A7lMp76m9oQj1fuRBwVHMisY4/BcmlhyUgGAyoX+MdrtHRymIh8+HRAt6gaTaAG5GSjmPcapPf41iyUoVQQOMhLhYq1vCwbNjZMkf7FMzg0y9uixo9jroQ0T7o5Mi9sNqbl3Gb8NRD+BDlvrnHMKqdKhyif68oDitWy+5DnjFOtqstUL59lg2tvsWp3MXXvMo4+DG0mG1pb2bqakR57g+RAjhegeccx/48GXENjxufKS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xRBoTLqnry3vJIjpnvgqnOAS+IdXqQzwp5pc4raIUd9a46Ks6MCqHpdNNT?=
 =?iso-8859-1?Q?fg0TMBCMsdnPplJWpLGhUlq9PhWwrJVZ92kxIrGzD8362NUK7yhqGsQk7l?=
 =?iso-8859-1?Q?/t3dVmPlnqpQlPj1nkWKWiPqWmxG749sM7rqvrkqCaiSTx15kqMmlquv0W?=
 =?iso-8859-1?Q?EU0UAGPJBfMtlJe/nTqaY8lttXnW/zU8fPR6Gmk1oDJHvygAirc3Jx5XtU?=
 =?iso-8859-1?Q?epJqAanCvWmZ+v1TGQCTFNjWhmTfSqbcXfnmiQHTy2GVoRSfXAvkP0yfjY?=
 =?iso-8859-1?Q?/K6xdGs8rv/yBlWTEVCy8Ph8iVQT/7wpkW0OkKBGoqdbekjax+vhbmyuYk?=
 =?iso-8859-1?Q?TV+hEOGKEx5v3+9Jo0mWm/CuVZylTvvu7Zvpm+CC2QdWqZRMCNolXX2CHn?=
 =?iso-8859-1?Q?oiZuWWSsdxunFRQWT1ipd3zFB0hoOHS4oXyJXXuqX2zvP8BbrPICO6s1Dn?=
 =?iso-8859-1?Q?HWjx4R5FrfBbJF5EgWYzpyYAf4WqHtshLe0BFNVbCJpJajx8NGLjEHBoDT?=
 =?iso-8859-1?Q?g0hn9YKvUNnQvPNCenQR09eq7tPmgQUZm4g+1tlvKrlx09pbuihl7bGgwa?=
 =?iso-8859-1?Q?KabTjoPH9XR8JQU5tXM7Lgdn9uN4hQURv0tDq8dEjfVZXE3UcUM6ekaZmt?=
 =?iso-8859-1?Q?Nth8abygYG2XLfcSPZR0JKtOfBiUgs2CMx1AMBFU3WsKe1ZdaNr+PR53PI?=
 =?iso-8859-1?Q?nJ77CK/ITzkhhFOCUCZ2qPGi4bCtDpbPUNOba8Krix0UerDT8rwvprg6h6?=
 =?iso-8859-1?Q?XN8Xvaegy3Wmq/HpNaE7YDyNYfK9EFfespq3nonpcDeNOLL+PPy7wJpn0s?=
 =?iso-8859-1?Q?6oR6KOXaJJPeGHM4cYCqKi2PXRvkd+hT5Kc9cHGZPpW3HsKJgMBcWWTA9H?=
 =?iso-8859-1?Q?dMMZrFG/37CfQ/BhLZwoYJ6rHS6vSa5pKLZumSFxKYi4NheBdsaxFYVZk9?=
 =?iso-8859-1?Q?r4WfvlUVNytCaLy5HyGTg18KnGrys0nCmGXRrfEbt4K6Uyn+sYfUxE9UEs?=
 =?iso-8859-1?Q?VgeuTYvo27gQNxWtjc7WMh+grRhLOOaLMgPppBpGtGEdUYP0waDVFFZ4ym?=
 =?iso-8859-1?Q?JbSubpKgXMG5uFnM4rggu7WaKEtqlNMsz0FnNpYBEy9r0gJWOWzUI53o+u?=
 =?iso-8859-1?Q?/SWsiPTQ4QTDyJJ5NcNH4eujnGeMw/iyO/UbuHAIpGJ8fd533oIq7Lv0Rc?=
 =?iso-8859-1?Q?pqNo7q1xQRVuJNpgiZRiLEktZrpfFKRG+E/2rZfEtZR0Dk1QUqhMb1Q9FT?=
 =?iso-8859-1?Q?yvrK0OGybiglCGY/fYC+8hUH29n31C7PtXOldosBwbo4kjP8lyTv+0qpu1?=
 =?iso-8859-1?Q?Uk2Cg41aqIKwRCFVEjIkbYZcDps53zSMXCODoMGjmJnEp2BXzIYvweR3L3?=
 =?iso-8859-1?Q?xrw11M40SoFZzsZIk05/QRqiSS7hJsjJwzkwYJwjH+9Xisk+AQvIuU0UkN?=
 =?iso-8859-1?Q?kQ0KcUzImUMwJdnFHzGD7ciAxRJ0FBIsG4IqOWoYy5DYRRai3ulu2H1Puu?=
 =?iso-8859-1?Q?yNh/xiF9pWXvDvPcatezZMuS/PIFEw0tD6zkPhcsuCVYf750ibicRNmzEd?=
 =?iso-8859-1?Q?02+DYhk/XLAUjJDx+Q75tNQGbAkx36OrUt6S8hgT4tZy9WM5K6DZsxIjuV?=
 =?iso-8859-1?Q?DQpi4eZZ+ZntBd4/4AQYmxCu10nBYCttd1Vqv0WkXP14qG9q1JaiYaMxhC?=
 =?iso-8859-1?Q?yCiFYS09zyukskKwwql8PKj7VMZAuz8dGwweN9AX4vVLm+quHeTffWu/QT?=
 =?iso-8859-1?Q?wI8FlasCjl0e1h19FjP2WjtNfOditJeLWybrNmWr73vwFTMl8Dju5xuf4n?=
 =?iso-8859-1?Q?HcRE75qU8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: prtgoshEABQAo+Vou/KK+tKeiwxrirrh0ycGdnqjsr59ApYXBFbhkkaZmpSr33FGvs/xMIQmwtezeB09BsrexxntGHitz+3Fv01kugSMDM3c5kewQxIU3JWro9NUFS+vzyanWDeGsgM2P1J88HepyQqCXTLkKIBbyLFbD3eg2Yj+9mwhLUQtoOTrwbZFDrPaXlEt0VZpmv7idIBiyIf7cF5uBYEv9BdO7aWiq93JNu6EbIKz/ecAEREIy8zexih3cMvogTpSzNTOHphk2n7en0KeCheYwIcmrFSDPkIr4wpu07Av42lUcGziumfBqbWUcSvAXQEoLpM4NZewqZEW0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3571e97f-c843-47dd-5c61-08de9abe9c1f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:14:19.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHASyrIsBtOgzxyRyoJcZa/8uxzX7uDnknTIW31vPY6RuaupQXerrPgTARkoXQrUu/B7VSky4rj5FOsEG0Vo0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 33.4% improvement of stress-ng.epoll.ops_per_sec on:


commit: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe ("locking/mutex: Remove the list_head from struct mutex")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: epoll
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260415/202604151504.904bca26-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/epoll/stress-ng/60s

commit: 
  b9bdd4b684 ("locking/semaphore: Remove the list_head from struct semaphore")
  25500ba7e7 ("locking/mutex: Remove the list_head from struct mutex")

b9bdd4b6840454ef 25500ba7e77ce9d3d9b5a1929d4 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.479e+08           +33.4%  1.973e+08        stress-ng.epoll.ops
   2465965           +33.4%    3288822        stress-ng.epoll.ops_per_sec
  73211693 ±  7%     -23.8%   55766682 ±  5%  stress-ng.time.involuntary_context_switches
     97052 ±  6%     +22.2%     118623 ±  3%  stress-ng.time.minor_page_faults
    289.53 ±  3%     +13.4%     328.37        stress-ng.time.user_time
  56759140           -34.2%   37353068 ±  4%  stress-ng.time.voluntary_context_switches
     18403 ±  9%     -28.8%      13098 ± 25%  perf-c2c.HITM.remote
      0.32 ±  9%      +0.1        0.46 ±  8%  mpstat.cpu.all.soft%
      2.34 ±  2%      +0.3        2.59        mpstat.cpu.all.usr%
  10319504            +5.8%   10919056        turbostat.NMI
    635.33            +2.6%     652.16        turbostat.PkgWatt
     22.38            +6.0%      23.72        turbostat.RAMWatt
  11909616            -6.1%   11177957        vmstat.memory.cache
    400.06 ±  2%     -10.0%     360.23 ±  2%  vmstat.procs.r
   2055397 ±  4%     -27.9%    1482342 ±  4%  vmstat.system.cs
    571786            +3.8%     593254        vmstat.system.in
      0.99 ±  3%     +37.0%       1.36 ±  3%  perf-stat.i.MPKI
      0.27            +0.1        0.33        perf-stat.i.branch-miss-rate%
 1.212e+08           +19.9%  1.454e+08        perf-stat.i.branch-misses
 2.212e+08 ±  3%     +37.6%  3.042e+08        perf-stat.i.cache-misses
 7.409e+08 ±  4%     +38.9%  1.029e+09        perf-stat.i.cache-references
   2206584 ±  4%     -26.8%    1615046 ±  4%  perf-stat.i.context-switches
    858.45           +28.3%       1101        perf-stat.i.cpu-migrations
      3386 ±  3%     -26.9%       2474 ±  2%  perf-stat.i.cycles-between-cache-misses
     12.44 ±  3%     -28.4%       8.90 ±  4%  perf-stat.i.metric.K/sec
    976089           -31.4%     669743 ±  3%  perf-stat.i.page-faults
      0.98 ±  3%     +38.5%       1.35 ±  3%  perf-stat.overall.MPKI
      0.27            +0.1        0.33        perf-stat.overall.branch-miss-rate%
      3378 ±  3%     -27.0%       2466 ±  2%  perf-stat.overall.cycles-between-cache-misses
 1.156e+08           +20.1%  1.388e+08        perf-stat.ps.branch-misses
 2.107e+08 ±  3%     +37.8%  2.905e+08 ±  2%  perf-stat.ps.cache-misses
 7.112e+08 ±  4%     +39.0%  9.887e+08        perf-stat.ps.cache-references
   2113175 ±  4%     -27.2%    1538005 ±  5%  perf-stat.ps.context-switches
    805.10           +29.3%       1041        perf-stat.ps.cpu-migrations
    941009           -31.6%     644007 ±  4%  perf-stat.ps.page-faults
     57.07 ±  7%     -16.5       40.62 ±  7%  perf-profile.calltrace.cycles-pp.osq_lock.__mutex_lock.do_epoll_ctl.__x64_sys_epoll_ctl.do_syscall_64
     57.42 ±  7%     -16.4       40.97 ±  7%  perf-profile.calltrace.cycles-pp.__mutex_lock.do_epoll_ctl.__x64_sys_epoll_ctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
     59.13 ±  7%     -15.7       43.40 ±  7%  perf-profile.calltrace.cycles-pp.do_epoll_ctl.__x64_sys_epoll_ctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.epoll_ctl
     59.33 ±  7%     -15.6       43.75 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_epoll_ctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.epoll_ctl
     59.52 ±  7%     -15.5       43.99 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.epoll_ctl
     59.56 ±  7%     -15.5       44.04 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.epoll_ctl
     59.84 ±  7%     -15.5       44.38 ±  7%  perf-profile.calltrace.cycles-pp.epoll_ctl
      6.47 ± 15%      -6.5        0.00        perf-profile.calltrace.cycles-pp.unix_schedule_gc.unix_release_sock.unix_release.__sock_release.sock_close
      0.61 ±  5%      +0.2        0.83 ±  4%  perf-profile.calltrace.cycles-pp.unix_find_bsd.unix_stream_connect.__sys_connect.__x64_sys_connect.do_syscall_64
      0.36 ± 70%      +0.2        0.59 ±  9%  perf-profile.calltrace.cycles-pp.alloc_pages_noprof.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.__sys_sendto
      0.73 ± 11%      +0.2        0.97 ±  9%  perf-profile.calltrace.cycles-pp.sock_alloc.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64
      0.92 ± 10%      +0.3        1.19 ±  8%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      0.70 ±  3%      +0.3        0.98 ±  4%  perf-profile.calltrace.cycles-pp.ep_insert.do_epoll_ctl.__x64_sys_epoll_ctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.88 ± 10%      +0.3        1.16 ±  9%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.__sys_sendto.__x64_sys_sendto
      0.65 ± 10%      +0.3        0.96 ±  9%  perf-profile.calltrace.cycles-pp.alloc_inode.sock_alloc.__sock_create.__sys_socket.__x64_sys_socket
      0.54 ±  4%      +0.3        0.85 ±  5%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.27 ±100%      +0.3        0.58 ±  8%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.55 ±  4%      +0.3        0.86 ±  5%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      0.55 ±  4%      +0.3        0.86 ±  5%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      0.55 ±  4%      +0.3        0.86 ±  5%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.47 ± 45%      +0.4        0.84 ±  3%  perf-profile.calltrace.cycles-pp.sock_alloc_file.do_accept.__sys_accept4.__x64_sys_accept.do_syscall_64
      0.44 ± 44%      +0.4        0.82 ±  5%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      0.44 ± 44%      +0.4        0.83 ±  5%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.44 ± 44%      +0.4        0.83 ±  5%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.17 ±141%      +0.4        0.56 ±  9%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.alloc_skb_with_frags.sock_alloc_send_pskb
      0.37 ± 70%      +0.4        0.76 ±  3%  perf-profile.calltrace.cycles-pp.alloc_file_pseudo.sock_alloc_file.do_accept.__sys_accept4.__x64_sys_accept
      0.58 ±  4%      +0.4        1.01 ±  6%  perf-profile.calltrace.cycles-pp.skb_release_data.sk_skb_reason_drop.unix_release_sock.unix_release.__sock_release
      0.34 ± 70%      +0.5        0.80 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      0.26 ±100%      +0.5        0.74 ±  3%  perf-profile.calltrace.cycles-pp.timer_delete
      0.92 ± 14%      +0.5        1.43 ±  9%  perf-profile.calltrace.cycles-pp.unix_accept.do_accept.__sys_accept4.__x64_sys_accept.do_syscall_64
      0.54            +0.5        1.08 ±  3%  perf-profile.calltrace.cycles-pp.__dentry_kill.finish_dput.__fput.__x64_sys_close.do_syscall_64
      0.00            +0.5        0.54 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_release_sock.unix_release.__sock_release.sock_close
      0.57            +0.5        1.12 ±  2%  perf-profile.calltrace.cycles-pp.finish_dput.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.54 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.09 ±223%      +0.6        0.64 ±  4%  perf-profile.calltrace.cycles-pp.timer_settime
      0.00            +0.6        0.57 ±  8%  perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67 ±  2%      +0.6        1.24 ±  6%  perf-profile.calltrace.cycles-pp.do_timer_create.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      0.76 ±  3%      +0.6        1.33 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      0.76 ±  3%      +0.6        1.33 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_create
      0.00            +0.6        0.57 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +0.6        0.58 ±  8%  perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.71 ±  2%      +0.6        1.29 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      0.00            +0.6        0.58 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_settime
      0.82 ±  2%      +0.6        1.43 ±  5%  perf-profile.calltrace.cycles-pp.timer_create
      0.00            +0.6        0.65 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_delete.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_delete
      0.00            +0.7        0.68 ±  4%  perf-profile.calltrace.cycles-pp.eventpoll_release_file.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.69 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_delete
      0.00            +0.7        0.70 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_delete
      0.00            +0.7        0.70 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.00            +0.7        0.71 ± 17%  perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.__sys_sendto
      0.00            +0.8        0.75 ± 17%  perf-profile.calltrace.cycles-pp.copy_page_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.__sys_sendto.__x64_sys_sendto
      0.00            +0.8        0.78 ± 16%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      0.59 ±  8%      +0.8        1.37 ±  9%  perf-profile.calltrace.cycles-pp.sock_alloc.do_accept.__sys_accept4.__x64_sys_accept.do_syscall_64
      0.00            +0.8        0.80 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.00            +0.8        0.81 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.00            +0.8        0.82 ± 12%  perf-profile.calltrace.cycles-pp.inode_init_always_gfp.alloc_inode.sock_alloc.do_accept.__sys_accept4
      0.49 ± 45%      +0.8        1.32 ±  9%  perf-profile.calltrace.cycles-pp.alloc_inode.sock_alloc.do_accept.__sys_accept4.__x64_sys_accept
      0.00            +0.9        0.90 ±  4%  perf-profile.calltrace.cycles-pp.__sched_yield
      1.73 ±  8%      +0.9        2.68 ± 10%  perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.79 ±  8%      +0.9        2.73 ± 10%  perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.78 ±  7%      +0.9        2.72 ± 10%  perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.36 ± 11%      +1.6        3.95 ±  7%  perf-profile.calltrace.cycles-pp.do_accept.__sys_accept4.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.44 ± 10%      +1.7        4.09 ±  7%  perf-profile.calltrace.cycles-pp.__sys_accept4.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.45 ± 11%      +1.7        4.12 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.46 ± 14%      +2.2        5.67 ±  5%  perf-profile.calltrace.cycles-pp.unix_sock_destructor.__sk_destruct.unix_release_sock.unix_release.__sock_release
      2.89 ± 15%      +2.4        5.25 ±  5%  perf-profile.calltrace.cycles-pp.unix_sock_destructor.__sk_destruct.unix_destruct_scm.skb_release_head_state.sk_skb_reason_drop
      3.72 ± 14%      +2.4        6.18 ±  5%  perf-profile.calltrace.cycles-pp.__sk_destruct.unix_release_sock.unix_release.__sock_release.sock_close
      3.19 ± 14%      +2.6        5.82 ±  5%  perf-profile.calltrace.cycles-pp.__sk_destruct.unix_destruct_scm.skb_release_head_state.sk_skb_reason_drop.unix_release_sock
      3.30 ± 14%      +2.7        5.97 ±  5%  perf-profile.calltrace.cycles-pp.skb_release_head_state.sk_skb_reason_drop.unix_release_sock.unix_release.__sock_release
      3.28 ± 14%      +2.7        5.96 ±  5%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.sk_skb_reason_drop.unix_release_sock.unix_release
      3.89 ± 12%      +3.1        7.04 ±  5%  perf-profile.calltrace.cycles-pp.sk_skb_reason_drop.unix_release_sock.unix_release.__sock_release.sock_close
      4.80 ± 13%      +4.0        8.78 ±  6%  perf-profile.calltrace.cycles-pp.unix_create1.unix_stream_connect.__sys_connect.__x64_sys_connect.do_syscall_64
      4.76 ± 14%      +4.1        8.90 ±  5%  perf-profile.calltrace.cycles-pp.unix_create1.unix_create.__sock_create.__sys_socket.__x64_sys_socket
      4.95 ± 14%      +4.3        9.26 ±  6%  perf-profile.calltrace.cycles-pp.unix_create.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64
      5.72 ± 14%      +4.6       10.29 ±  6%  perf-profile.calltrace.cycles-pp.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.32 ± 12%      +4.7       10.99 ±  6%  perf-profile.calltrace.cycles-pp.unix_stream_connect.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.42 ± 12%      +4.7       11.10 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.40 ± 12%      +4.7       11.09 ±  6%  perf-profile.calltrace.cycles-pp.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.13 ± 13%      +4.8       10.88 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      6.12 ± 13%      +4.8       10.87 ±  6%  perf-profile.calltrace.cycles-pp.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      6.17 ± 13%      +4.8       10.92 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      6.17 ± 13%      +4.8       10.93 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__socket
      6.24 ± 13%      +4.8       11.01 ±  6%  perf-profile.calltrace.cycles-pp.__socket
     29.23 ± 11%      +8.6       37.86 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.29 ± 11%      +8.6       37.93 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     57.09 ±  7%     -16.5       40.64 ±  7%  perf-profile.children.cycles-pp.osq_lock
     57.42 ±  7%     -16.4       40.97 ±  7%  perf-profile.children.cycles-pp.__mutex_lock
     59.14 ±  7%     -15.7       43.42 ±  7%  perf-profile.children.cycles-pp.do_epoll_ctl
     59.34 ±  7%     -15.6       43.76 ±  7%  perf-profile.children.cycles-pp.__x64_sys_epoll_ctl
     60.02 ±  7%     -15.4       44.60 ±  7%  perf-profile.children.cycles-pp.epoll_ctl
      6.49 ± 15%      -6.3        0.15 ±  9%  perf-profile.children.cycles-pp.unix_schedule_gc
     97.30            -0.7       96.64        perf-profile.children.cycles-pp.do_syscall_64
     97.40            -0.6       96.77        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.97            -0.2        0.82 ±  3%  perf-profile.children.cycles-pp.do_epoll_wait
      0.95            -0.2        0.80 ±  3%  perf-profile.children.cycles-pp.ep_poll
      0.37            -0.1        0.25 ±  4%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.48            -0.1        0.40 ±  2%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      0.54            -0.1        0.45 ±  2%  perf-profile.children.cycles-pp.do_epoll_pwait
      0.32            -0.1        0.25 ±  2%  perf-profile.children.cycles-pp.syscall
      0.28 ±  2%      -0.1        0.21 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.21 ±  2%      -0.1        0.15        perf-profile.children.cycles-pp.asm_exc_page_fault
      0.35            -0.1        0.30 ±  3%  perf-profile.children.cycles-pp.__x64_sys_epoll_pwait
      0.24            -0.1        0.19 ±  2%  perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.18 ±  2%      -0.0        0.13 ±  4%  perf-profile.children.cycles-pp.ep_autoremove_wake_function
      0.26            -0.0        0.21 ±  3%  perf-profile.children.cycles-pp.__x64_sys_epoll_pwait2
      0.14 ±  2%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.__wake_up_sync
      0.18 ±  2%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.try_to_wake_up
      0.22 ±  2%      -0.0        0.19        perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.12 ±  4%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.__sys_recvfrom
      0.12 ±  4%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.__x64_sys_recvfrom
      0.10 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.unix_stream_read_generic
      0.10 ±  4%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.unix_stream_recvmsg
      0.11 ±  6%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.sock_recvmsg
      0.10 ±  5%      -0.0        0.07 ±  7%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.12 ±  6%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.unix_getname
      0.14 ±  3%      -0.0        0.11        perf-profile.children.cycles-pp.ep_loop_check_proc
      0.16 ±  3%      -0.0        0.13        perf-profile.children.cycles-pp.mutex_unlock
      0.08 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.read_tsc
      0.09 ±  7%      -0.0        0.07        perf-profile.children.cycles-pp._copy_to_user
      0.10 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp.ttwu_do_activate
      0.11 ± 12%      -0.0        0.09 ± 10%  perf-profile.children.cycles-pp.ktime_get
      0.10 ±  4%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.try_to_block_task
      0.10 ±  5%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.exc_page_fault
      0.10 ±  3%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.08 ±  6%      -0.0        0.06        perf-profile.children.cycles-pp.enqueue_task
      0.09            -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.dequeue_entities
      0.08 ±  6%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.task_work_run
      0.07            -0.0        0.06        perf-profile.children.cycles-pp.enqueue_task_fair
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.enqueue_entity
      0.07 ± 10%      +0.0        0.09 ±  7%  perf-profile.children.cycles-pp.xa_load
      0.05            +0.0        0.07        perf-profile.children.cycles-pp._raw_spin_trylock
      0.04 ± 44%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__hrtimer_setup
      0.09 ±  5%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.move_addr_to_user
      0.06 ±  9%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.06 ±  7%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.put_pid
      0.15 ±  8%      +0.0        0.17 ±  3%  perf-profile.children.cycles-pp.link_path_walk
      0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.06 ±  7%      +0.0        0.09        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.07 ± 11%      +0.0        0.10 ±  6%  perf-profile.children.cycles-pp.try_charge_memcg
      0.03 ± 70%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.inode_permission
      0.05 ±  7%      +0.0        0.08        perf-profile.children.cycles-pp.lockref_put_return
      0.34            +0.0        0.37        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.05            +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.add_wait_queue
      0.13            +0.0        0.16        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.07 ± 18%      +0.0        0.10 ±  7%  perf-profile.children.cycles-pp.switch_hrtimer_base
      0.06 ± 11%      +0.0        0.10 ±  6%  perf-profile.children.cycles-pp.complete_walk
      0.03 ± 70%      +0.0        0.07        perf-profile.children.cycles-pp.down_write
      0.09 ± 14%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.07 ± 12%      +0.0        0.11 ±  5%  perf-profile.children.cycles-pp.common_hrtimer_arm
      0.02 ± 99%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.07 ±  5%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.iput
      0.08 ±  6%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.i_callback
      0.10 ±  3%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.__pi_memset
      0.11 ± 17%      +0.0        0.15 ± 14%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
      0.05            +0.0        0.10 ±  8%  perf-profile.children.cycles-pp.barn_replace_full_sheaf
      0.18 ± 12%      +0.0        0.22 ±  3%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.12 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__call_rcu_common
      0.10 ±  4%      +0.0        0.14 ± 10%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.04 ± 44%      +0.0        0.09        perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__d_lookup_rcu
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.do_getname_kernel
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.fput
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.remove_wait_queue
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.truncate_inode_pages_final
      0.09 ± 24%      +0.1        0.14 ± 12%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.refill_stock
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.skb_free_datagram
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.try_to_unlazy
      0.12 ±  3%      +0.1        0.17 ±  4%  perf-profile.children.cycles-pp.d_instantiate
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.05            +0.1        0.11 ± 11%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.update_curr_dl_se
      0.09 ±  4%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.barn_replace_empty_sheaf
      0.07 ±  5%      +0.1        0.13 ± 16%  perf-profile.children.cycles-pp.cgroup_sk_alloc
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.clear_inode
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.skb_queue_purge_reason
      0.05            +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.common_timer_del
      0.06 ±  8%      +0.1        0.12 ± 12%  perf-profile.children.cycles-pp.lock_timer
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.path_put
      0.08 ±  6%      +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.kvfree_call_rcu
      0.12 ±  3%      +0.1        0.19 ±  4%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.13            +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.ep_ptable_queue_proc
      0.10 ±  6%      +0.1        0.17 ±  4%  perf-profile.children.cycles-pp.posix_timer_delete
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp._raw_spin_unlock_irq
      0.12 ±  3%      +0.1        0.19 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.07 ±  8%  perf-profile.children.cycles-pp.filp_flush
      0.28 ±  2%      +0.1        0.35        perf-profile.children.cycles-pp.ep_poll_callback
      0.11 ±  4%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp._raw_spin_unlock
      0.10 ±  3%      +0.1        0.17        perf-profile.children.cycles-pp.dput
      0.01 ±223%      +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.06 ±  7%      +0.1        0.14 ± 15%  perf-profile.children.cycles-pp.file_close_fd
      0.12 ±  4%      +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.skb_dequeue
      0.08 ±  6%      +0.1        0.15 ± 13%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.11 ±  8%      +0.1        0.19 ±  8%  perf-profile.children.cycles-pp.init_file
      0.16 ±  8%      +0.1        0.24 ±  8%  perf-profile.children.cycles-pp.__rcu_free_sheaf_prepare
      0.21 ±  2%      +0.1        0.29 ±  7%  perf-profile.children.cycles-pp.mutex_lock
      0.29 ±  8%      +0.1        0.37 ±  3%  perf-profile.children.cycles-pp.filename_lookup
      0.24 ±  6%      +0.1        0.32 ±  4%  perf-profile.children.cycles-pp.__d_alloc
      0.02 ±141%      +0.1        0.10 ± 16%  perf-profile.children.cycles-pp.do_softirq
      0.28 ±  8%      +0.1        0.36 ±  3%  perf-profile.children.cycles-pp.path_lookupat
      0.05            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.13            +0.1        0.22 ±  4%  perf-profile.children.cycles-pp.kfree
      0.00            +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.cpuacct_charge
      0.05            +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.rb_erase
      0.12 ±  3%      +0.1        0.21 ±  3%  perf-profile.children.cycles-pp.dec_rlimit_put_ucounts
      0.24 ±  6%      +0.1        0.33 ±  4%  perf-profile.children.cycles-pp.d_alloc_pseudo
      0.16 ±  6%      +0.1        0.24 ±  7%  perf-profile.children.cycles-pp.update_se
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__kfree_rcu_sheaf
      0.33            +0.1        0.42        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.27 ±  2%      +0.1        0.36 ±  6%  perf-profile.children.cycles-pp._copy_from_user
      0.49 ± 13%      +0.1        0.59 ±  9%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.12 ±  9%      +0.1        0.21 ± 17%  perf-profile.children.cycles-pp.__init_rwsem
      0.50 ± 13%      +0.1        0.59 ±  8%  perf-profile.children.cycles-pp.alloc_pages_noprof
      0.34 ±  6%      +0.1        0.44 ±  3%  perf-profile.children.cycles-pp.kern_path
      0.07 ± 13%      +0.1        0.17 ± 21%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.18 ±  2%      +0.1        0.28 ±  3%  perf-profile.children.cycles-pp.unix_poll
      0.13 ± 10%      +0.1        0.23 ± 10%  perf-profile.children.cycles-pp.__slab_free
      0.46 ± 12%      +0.1        0.56 ±  9%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.04 ± 44%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.update_rq_clock
      0.52 ±  6%      +0.1        0.63 ±  9%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.24 ± 14%      +0.1        0.34 ±  4%  perf-profile.children.cycles-pp.common_timer_set
      0.03 ± 70%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.20 ±  7%      +0.1        0.31 ±  8%  perf-profile.children.cycles-pp.rcu_free_sheaf
      0.09 ± 10%      +0.1        0.20 ± 18%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.__skb_try_recv_from_queue
      0.00            +0.1        0.11 ± 11%  perf-profile.children.cycles-pp.setfl
      0.17 ±  2%      +0.1        0.28 ±  8%  perf-profile.children.cycles-pp.alloc_fd
      0.26 ±  9%      +0.1        0.37 ± 11%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.50            +0.1        0.60        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.21 ±  4%      +0.1        0.32 ±  6%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      0.19 ±  4%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.__wake_up
      0.28 ± 10%      +0.1        0.39 ± 14%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.15 ± 10%      +0.1        0.26 ± 15%  perf-profile.children.cycles-pp.__free_frozen_pages
      0.13            +0.1        0.25 ±  2%  perf-profile.children.cycles-pp.evict
      0.00            +0.1        0.12 ±  5%  perf-profile.children.cycles-pp.unix_dgram_peer_wake_disconnect
      0.11 ±  7%      +0.1        0.23 ± 12%  perf-profile.children.cycles-pp.sheaf_flush_unused
      0.17 ± 10%      +0.1        0.29 ± 13%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller_noprof
      0.00            +0.1        0.12 ±  8%  perf-profile.children.cycles-pp.do_sched_yield
      0.31 ±  3%      +0.1        0.44 ±  2%  perf-profile.children.cycles-pp.sock_def_readable
      0.09 ±  4%      +0.1        0.22 ± 23%  perf-profile.children.cycles-pp.sock_init_data
      0.17            +0.1        0.30 ±  2%  perf-profile.children.cycles-pp.posix_timer_unhash_and_free
      0.26 ±  3%      +0.1        0.39 ±  2%  perf-profile.children.cycles-pp.__wake_up_sync_key
      0.15 ± 24%      +0.1        0.28 ± 27%  perf-profile.children.cycles-pp.handle_internal_command
      0.15 ± 24%      +0.1        0.28 ± 27%  perf-profile.children.cycles-pp.main
      0.15 ± 24%      +0.1        0.28 ± 27%  perf-profile.children.cycles-pp.run_builtin
      0.00            +0.1        0.13 ± 12%  perf-profile.children.cycles-pp.native_sched_clock
      0.14 ± 25%      +0.1        0.27 ± 28%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.13 ± 25%      +0.1        0.26 ± 30%  perf-profile.children.cycles-pp.perf_mmap__push
      0.08 ± 10%      +0.1        0.21 ±  9%  perf-profile.children.cycles-pp.unix_write_space
      0.00            +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.sched_clock
      0.12 ±  5%      +0.1        0.26 ± 11%  perf-profile.children.cycles-pp.rmqueue
      0.23 ±  4%      +0.1        0.37 ±  4%  perf-profile.children.cycles-pp.sock_poll
      0.28 ± 12%      +0.1        0.42 ±  6%  perf-profile.children.cycles-pp.do_timer_settime
      0.27 ± 10%      +0.1        0.41 ±  7%  perf-profile.children.cycles-pp.sock_wfree
      0.15 ±  7%      +0.1        0.29 ± 14%  perf-profile.children.cycles-pp.__kmem_cache_free_bulk
      0.06 ± 11%      +0.1        0.21 ± 14%  perf-profile.children.cycles-pp.do_fcntl
      0.24 ±  5%      +0.1        0.39 ±  5%  perf-profile.children.cycles-pp.alloc_empty_file
      0.33 ±  3%      +0.1        0.48 ±  4%  perf-profile.children.cycles-pp.ep_item_poll
      0.20 ±  5%      +0.2        0.35 ±  6%  perf-profile.children.cycles-pp.update_curr
      0.60 ±  7%      +0.2        0.75 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.40 ± 12%      +0.2        0.55 ±  5%  perf-profile.children.cycles-pp.__x64_sys_timer_settime
      0.32 ±  3%      +0.2        0.48 ±  3%  perf-profile.children.cycles-pp.__wake_up_common
      0.14 ±  8%      +0.2        0.30 ±  7%  perf-profile.children.cycles-pp.pick_task_fair
      0.16 ±  3%      +0.2        0.33 ±  8%  perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
      0.19            +0.2        0.35 ±  5%  perf-profile.children.cycles-pp.posix_timer_add_at
      0.07 ± 17%      +0.2        0.24 ± 37%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.26 ±  4%      +0.2        0.43 ±  6%  perf-profile.children.cycles-pp.__pick_next_task
      0.24 ±  3%      +0.2        0.42 ±  6%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.32 ±  5%      +0.2        0.49 ±  5%  perf-profile.children.cycles-pp.sk_prot_alloc
      0.10 ± 10%      +0.2        0.27 ± 12%  perf-profile.children.cycles-pp.__x64_sys_fcntl
      0.19 ±  5%      +0.2        0.37 ± 10%  perf-profile.children.cycles-pp.__pcs_replace_full_main
      0.16 ±  8%      +0.2        0.34 ± 18%  perf-profile.children.cycles-pp.sock_init_data_uid
      0.30 ±  3%      +0.2        0.49 ±  7%  perf-profile.children.cycles-pp.sock_wmalloc
      0.19 ±  9%      +0.2        0.38 ±  5%  perf-profile.children.cycles-pp.x64_sys_call
      0.32 ±  7%      +0.2        0.51 ± 10%  perf-profile.children.cycles-pp.kmalloc_reserve
      0.48 ± 10%      +0.2        0.67 ±  4%  perf-profile.children.cycles-pp.timer_settime
      0.72 ±  2%      +0.2        0.92 ±  4%  perf-profile.children.cycles-pp.__schedule
      0.73 ±  2%      +0.2        0.93 ±  4%  perf-profile.children.cycles-pp.schedule
      0.14 ±  2%      +0.2        0.34 ±  4%  perf-profile.children.cycles-pp.__destroy_inode
      0.31 ±  4%      +0.2        0.51 ±  7%  perf-profile.children.cycles-pp.__refill_objects_node
      0.24 ±  5%      +0.2        0.45 ±  8%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.17            +0.2        0.38 ±  7%  perf-profile.children.cycles-pp.sig_get_ucounts
      0.14 ±  3%      +0.2        0.36 ±  2%  perf-profile.children.cycles-pp.destroy_inode
      0.33 ±  5%      +0.2        0.54 ±  8%  perf-profile.children.cycles-pp.refill_objects
      0.62 ±  6%      +0.2        0.84 ±  4%  perf-profile.children.cycles-pp.unix_find_bsd
      0.18 ±  2%      +0.2        0.40 ±  7%  perf-profile.children.cycles-pp.posixtimer_init_sigqueue
      0.32 ±  9%      +0.2        0.56 ± 14%  perf-profile.children.cycles-pp.__account_obj_stock
      0.53 ±  9%      +0.2        0.76 ±  8%  perf-profile.children.cycles-pp.obj_cgroup_charge_account
      0.10 ±  6%      +0.2        0.34 ± 15%  perf-profile.children.cycles-pp.map_id_range_down
      0.30 ±  6%      +0.2        0.54 ±  6%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.35            +0.2        0.60 ±  4%  perf-profile.children.cycles-pp.__ep_remove
      0.30 ±  7%      +0.2        0.54 ±  6%  perf-profile.children.cycles-pp.__folio_put
      0.40 ±  7%      +0.2        0.64 ±  9%  perf-profile.children.cycles-pp.refill_obj_stock
      0.17 ± 13%      +0.2        0.42 ± 19%  perf-profile.children.cycles-pp.evm_inode_alloc_security
      0.52 ±  5%      +0.3        0.78 ±  2%  perf-profile.children.cycles-pp.timer_delete
      0.04 ± 71%      +0.3        0.30 ± 11%  perf-profile.children.cycles-pp.__skb_recv_datagram
      0.00            +0.3        0.27 ± 11%  perf-profile.children.cycles-pp.__skb_try_recv_datagram
      0.12 ±  6%      +0.3        0.39 ± 15%  perf-profile.children.cycles-pp.make_kuid
      0.92 ± 10%      +0.3        1.19 ±  9%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.31 ± 37%      +0.3        0.59 ± 14%  perf-profile.children.cycles-pp.get_max_files
      0.43 ±  3%      +0.3        0.71 ±  9%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.71 ±  3%      +0.3        0.99 ±  4%  perf-profile.children.cycles-pp.ep_insert
      0.06 ±  8%      +0.3        0.34 ± 11%  perf-profile.children.cycles-pp.skb_recv_datagram
      0.88 ± 10%      +0.3        1.16 ±  9%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.43 ±  4%      +0.3        0.72 ±  7%  perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.53 ±  3%      +0.3        0.83 ±  5%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.54 ±  4%      +0.3        0.85 ±  5%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.34 ±  3%      +0.3        0.65 ±  3%  perf-profile.children.cycles-pp.__x64_sys_timer_delete
      0.55 ±  4%      +0.3        0.86 ±  5%  perf-profile.children.cycles-pp.kthread
      0.55 ±  4%      +0.3        0.86 ±  5%  perf-profile.children.cycles-pp.ret_from_fork
      0.55 ±  4%      +0.3        0.86 ±  5%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.51 ±  5%      +0.3        0.83 ±  6%  perf-profile.children.cycles-pp.sk_alloc
      0.76 ±  7%      +0.3        1.08 ±  3%  perf-profile.children.cycles-pp.alloc_file_pseudo
      0.36            +0.3        0.69 ±  4%  perf-profile.children.cycles-pp.eventpoll_release_file
      0.59 ±  6%      +0.3        0.92 ±  8%  perf-profile.children.cycles-pp.__alloc_skb
      0.58 ± 11%      +0.4        0.94 ±  6%  perf-profile.children.cycles-pp.sock_alloc_inode
      0.79 ±  7%      +0.4        1.16 ±  2%  perf-profile.children.cycles-pp.sock_alloc_file
      0.34 ±  9%      +0.4        0.71 ± 13%  perf-profile.children.cycles-pp.security_inode_alloc
      0.75 ±  9%      +0.4        1.12 ±  6%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.33 ±  8%      +0.4        0.71 ± 17%  perf-profile.children.cycles-pp._copy_from_iter
      0.73 ±  5%      +0.4        1.13 ±  6%  perf-profile.children.cycles-pp.skb_release_data
      0.30 ±  4%      +0.4        0.70 ±  8%  perf-profile.children.cycles-pp.__x64_sys_sched_yield
      0.34 ±  7%      +0.4        0.75 ± 17%  perf-profile.children.cycles-pp.copy_page_from_iter
      0.35 ±  6%      +0.4        0.79 ± 16%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.78 ±  6%      +0.5        1.24 ±  7%  perf-profile.children.cycles-pp.rcu_do_batch
      0.81 ±  6%      +0.5        1.27 ±  7%  perf-profile.children.cycles-pp.rcu_core
      0.84 ±  6%      +0.5        1.31 ±  7%  perf-profile.children.cycles-pp.handle_softirqs
      0.43 ±  2%      +0.5        0.94 ±  4%  perf-profile.children.cycles-pp.__sched_yield
      0.94 ± 14%      +0.5        1.45 ±  9%  perf-profile.children.cycles-pp.unix_accept
      0.97 ±  3%      +0.5        1.48 ±  5%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.59            +0.5        1.12 ±  2%  perf-profile.children.cycles-pp.__dentry_kill
      0.62            +0.5        1.16 ±  2%  perf-profile.children.cycles-pp.finish_dput
      1.02 ±  7%      +0.6        1.58 ±  8%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.68 ±  2%      +0.6        1.25 ±  6%  perf-profile.children.cycles-pp.do_timer_create
      1.15 ±  8%      +0.6        1.72 ±  7%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.71 ±  2%      +0.6        1.29 ±  5%  perf-profile.children.cycles-pp.__x64_sys_timer_create
      0.85 ±  2%      +0.6        1.46 ±  5%  perf-profile.children.cycles-pp.timer_create
      0.62 ±  8%      +0.7        1.33 ± 12%  perf-profile.children.cycles-pp.inode_init_always_gfp
      1.33 ±  6%      +0.8        2.08 ±  8%  perf-profile.children.cycles-pp.kmem_cache_free
      1.79 ±  7%      +0.9        2.73 ± 10%  perf-profile.children.cycles-pp.__x64_sys_sendto
      1.74 ±  8%      +0.9        2.68 ± 10%  perf-profile.children.cycles-pp.unix_stream_sendmsg
      1.78 ±  8%      +1.0        2.73 ± 10%  perf-profile.children.cycles-pp.__sys_sendto
      1.32 ± 10%      +1.0        2.35 ±  9%  perf-profile.children.cycles-pp.sock_alloc
      1.22 ±  9%      +1.1        2.28 ±  9%  perf-profile.children.cycles-pp.alloc_inode
      1.89 ±  2%      +1.1        2.95 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock
      2.36 ± 11%      +1.6        3.96 ±  7%  perf-profile.children.cycles-pp.do_accept
      2.44 ± 10%      +1.7        4.10 ±  7%  perf-profile.children.cycles-pp.__sys_accept4
      2.45 ± 11%      +1.7        4.12 ±  7%  perf-profile.children.cycles-pp.__x64_sys_accept
      3.30 ± 14%      +2.7        5.97 ±  5%  perf-profile.children.cycles-pp.unix_destruct_scm
      3.55 ± 14%      +2.8        6.34 ±  5%  perf-profile.children.cycles-pp.skb_release_head_state
      3.89 ± 12%      +3.2        7.04 ±  5%  perf-profile.children.cycles-pp.sk_skb_reason_drop
      4.96 ± 14%      +4.3        9.27 ±  6%  perf-profile.children.cycles-pp.unix_create
      5.73 ± 14%      +4.6       10.30 ±  6%  perf-profile.children.cycles-pp.__sock_create
      6.36 ± 14%      +4.6       10.95 ±  5%  perf-profile.children.cycles-pp.unix_sock_destructor
      6.32 ± 12%      +4.7       11.00 ±  6%  perf-profile.children.cycles-pp.unix_stream_connect
      6.42 ± 12%      +4.7       11.10 ±  6%  perf-profile.children.cycles-pp.__x64_sys_connect
      6.40 ± 12%      +4.7       11.10 ±  6%  perf-profile.children.cycles-pp.__sys_connect
      6.13 ± 13%      +4.8       10.88 ±  6%  perf-profile.children.cycles-pp.__x64_sys_socket
      6.12 ± 13%      +4.8       10.88 ±  6%  perf-profile.children.cycles-pp.__sys_socket
      6.27 ± 13%      +4.8       11.05 ±  6%  perf-profile.children.cycles-pp.__socket
      6.93 ± 14%      +5.1       12.01 ±  5%  perf-profile.children.cycles-pp.__sk_destruct
      9.90 ± 14%      +8.4       18.31 ±  6%  perf-profile.children.cycles-pp.unix_create1
     56.82 ±  7%     -16.4       40.42 ±  7%  perf-profile.self.cycles-pp.osq_lock
      6.44 ± 15%      -6.3        0.15 ± 11%  perf-profile.self.cycles-pp.unix_schedule_gc
      0.36 ±  6%      -0.0        0.32        perf-profile.self.cycles-pp.do_syscall_64
      0.22 ±  2%      -0.0        0.19        perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.11 ±  7%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.unix_getname
      0.09 ±  4%      -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.13            -0.0        0.10        perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.07            -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.read_tsc
      0.15            -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.mutex_unlock
      0.09 ±  7%      -0.0        0.07        perf-profile.self.cycles-pp._copy_to_user
      0.05            +0.0        0.06        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.09            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.04 ± 44%      +0.0        0.06        perf-profile.self.cycles-pp.__hrtimer_setup
      0.04 ± 44%      +0.0        0.06        perf-profile.self.cycles-pp.ep_item_poll
      0.06 ±  8%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.try_charge_memcg
      0.05            +0.0        0.07        perf-profile.self.cycles-pp._raw_spin_trylock
      0.06 ±  6%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.put_pid
      0.07 ±  5%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.11            +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.08 ±  6%      +0.0        0.10        perf-profile.self.cycles-pp.__call_rcu_common
      0.08 ±  6%      +0.0        0.10        perf-profile.self.cycles-pp.__pi_memset
      0.03 ± 70%      +0.0        0.06        perf-profile.self.cycles-pp._raw_write_lock_bh
      0.05            +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.lockref_put_return
      0.11 ±  3%      +0.0        0.14        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.05 ±  8%      +0.0        0.08 ±  8%  perf-profile.self.cycles-pp.sock_poll
      0.08 ± 22%      +0.0        0.11 ±  8%  perf-profile.self.cycles-pp.file_init_path
      0.06            +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.unix_poll
      0.14 ± 13%      +0.0        0.18 ±  6%  perf-profile.self.cycles-pp.ep_insert
      0.03 ± 70%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.down_write
      0.08 ±  6%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp._raw_spin_unlock
      0.18 ±  2%      +0.0        0.22 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.09            +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.__alloc_skb
      0.07 ±  6%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.__slab_free
      0.07 ±  6%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.i_callback
      0.07            +0.0        0.11 ±  5%  perf-profile.self.cycles-pp.__mutex_lock
      0.03 ± 70%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.kfree
      0.06 ±  7%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.barn_replace_empty_sheaf
      0.10 ±  4%      +0.0        0.14 ± 10%  perf-profile.self.cycles-pp.skb_set_owner_w
      0.02 ± 99%      +0.0        0.07        perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.02 ±141%      +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.22            +0.0        0.27        perf-profile.self.cycles-pp.epoll_ctl
      0.06 ± 13%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.skb_dequeue
      0.26            +0.0        0.31        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.09 ±  4%      +0.1        0.14 ±  7%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__d_lookup_rcu
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__x64_sys_fcntl
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.evict
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.timer_create
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.timer_settime
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.truncate_inode_pages_final
      0.07            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.init_file
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.__kmem_cache_free_bulk
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.ep_send_events
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.get_nohz_timer_target
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.skb_free_datagram
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.update_curr_dl_se
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.update_se
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__destroy_inode
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.iput
      0.22 ± 11%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.obj_cgroup_charge_account
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.sig_get_ucounts
      0.07            +0.1        0.13 ± 13%  perf-profile.self.cycles-pp.cgroup_sk_alloc
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.sk_skb_reason_drop
      0.07 ±  6%      +0.1        0.13 ± 17%  perf-profile.self.cycles-pp.sk_alloc
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__ep_remove
      0.07 ±  6%      +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.do_timer_create
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__free_one_page
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.rmqueue
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.setfl
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.dput
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.skb_queue_purge_reason
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.move_addr_to_user
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.sock_alloc_file
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.unix_create
      0.12 ±  4%      +0.1        0.18 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.06 ±  7%      +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.__fput
      0.12 ±  4%      +0.1        0.19 ±  4%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.barn_replace_full_sheaf
      0.21 ±  2%      +0.1        0.28 ±  7%  perf-profile.self.cycles-pp.mutex_lock
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.unix_dgram_peer_wake_disconnect
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__kfree_rcu_sheaf
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.__wake_up
      0.00            +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.cpuacct_charge
      0.18 ±  5%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.refill_obj_stock
      0.10 ±  9%      +0.1        0.18 ±  9%  perf-profile.self.cycles-pp.kmem_cache_alloc_lru_noprof
      0.12            +0.1        0.21 ±  3%  perf-profile.self.cycles-pp.dec_rlimit_put_ucounts
      0.32            +0.1        0.42        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.03 ± 70%      +0.1        0.12 ±  7%  perf-profile.self.cycles-pp.__wake_up_common
      0.12 ±  9%      +0.1        0.21 ± 10%  perf-profile.self.cycles-pp.inode_init_always_gfp
      0.00            +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.posix_timer_add_at
      0.26 ±  2%      +0.1        0.35 ±  6%  perf-profile.self.cycles-pp._copy_from_user
      0.00            +0.1        0.10 ± 19%  perf-profile.self.cycles-pp.unix_find_bsd
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__x64_sys_epoll_ctl
      0.11 ±  7%      +0.1        0.21 ± 18%  perf-profile.self.cycles-pp.__init_rwsem
      0.00            +0.1        0.10 ± 20%  perf-profile.self.cycles-pp.do_fcntl
      0.03 ± 70%      +0.1        0.13 ±  7%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.1        0.11 ± 12%  perf-profile.self.cycles-pp.__skb_try_recv_from_queue
      0.32 ±  4%      +0.1        0.43 ±  6%  perf-profile.self.cycles-pp.kmem_cache_free
      0.06 ± 11%      +0.1        0.17 ±  5%  perf-profile.self.cycles-pp.ep_poll_callback
      0.07 ±  7%      +0.1        0.18 ± 21%  perf-profile.self.cycles-pp.make_kuid
      0.25 ±  3%      +0.1        0.36 ±  5%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.1        0.12 ± 16%  perf-profile.self.cycles-pp.__skb_try_recv_datagram
      0.08 ± 10%      +0.1        0.20 ± 10%  perf-profile.self.cycles-pp.unix_write_space
      0.00            +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.native_sched_clock
      0.16 ±  3%      +0.2        0.32 ±  7%  perf-profile.self.cycles-pp.inc_rlimit_get_ucounts
      0.36            +0.2        0.52 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.07 ± 17%      +0.2        0.24 ± 37%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.06 ± 13%      +0.2        0.22 ± 11%  perf-profile.self.cycles-pp.map_id_range_down
      0.21 ±  9%      +0.2        0.38 ± 17%  perf-profile.self.cycles-pp.__account_obj_stock
      0.14 ±  8%      +0.2        0.32 ± 18%  perf-profile.self.cycles-pp.sock_init_data_uid
      0.29 ±  4%      +0.2        0.47 ±  7%  perf-profile.self.cycles-pp.__refill_objects_node
      0.17 ± 10%      +0.2        0.36 ±  5%  perf-profile.self.cycles-pp.x64_sys_call
      0.22 ±  5%      +0.2        0.41 ±  8%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.16 ± 13%      +0.2        0.40 ± 18%  perf-profile.self.cycles-pp.evm_inode_alloc_security
      0.22 ± 19%      +0.3        0.48 ±  5%  perf-profile.self.cycles-pp.__sk_destruct
      0.38 ±  2%      +0.3        0.67 ±  4%  perf-profile.self.cycles-pp.unix_release_sock
      0.52 ±  5%      +0.3        0.81 ±  5%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.66 ±  8%      +0.3        1.00 ±  8%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.33 ±  7%      +0.4        0.71 ± 18%  perf-profile.self.cycles-pp._copy_from_iter
      0.49            +0.4        0.90 ±  3%  perf-profile.self.cycles-pp.do_epoll_ctl
      1.82 ±  2%      +1.0        2.81 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock
      6.30 ± 14%      +4.5       10.80 ±  5%  perf-profile.self.cycles-pp.unix_sock_destructor
      8.69 ± 16%      +7.6       16.26 ±  5%  perf-profile.self.cycles-pp.unix_create1




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

