Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702C2F4A
	for <oe-lkp@lists.linux.dev>; Wed, 23 Jul 2025 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753250280; cv=fail; b=kr7Fic9RvyWIAmpvJQIL5etMASb4qxbE9ECpKJBiYIbwhrhGdPKD5pS0HCic+mPQJChZbyV7AO7dtS9JEarYZvppFnBP892iocM2WAmeI/JSRHVhjgdvCRusadSeuEp9TSCevkFOZF7FX8a0CkedcsxxaWDvvPz0CGVoZATlHTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753250280; c=relaxed/simple;
	bh=gTfM6IJHw2kin2GWrY2ee4OjQixt/gayOPAn9n5wMdQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=axIY4ZWarMwLUHLXvZI26HVo0tCrZT7VSu1v14vFg3nQPQ3z7Wgbyjsr+3oElzQBYmf2J6dTlnyeqN7cE489C43N4XmBkT3NHMN95OL+HS4Onrfu2ScCHfr6pT/9mlq/o539LVDUhnjBvW9EQLYmDZa3EOHh+XhF352H6J2bSN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4q7emyS; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4q7emyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753250278; x=1784786278;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=gTfM6IJHw2kin2GWrY2ee4OjQixt/gayOPAn9n5wMdQ=;
  b=m4q7emyS3hWO+egFN2u6YF/qXrQquifMzZXua4B34ZOeWsp5IjroYznP
   hNdTH2DtaWmXmyJJVZQBKZseGt5vq28Se5c1CM2A9NeCBe5b9/bTrLxzV
   cHgq7uLjj3rVK3kGiv2iRcSwGgOw6e9dKk/h4yo+suC6kRbDuSEmP7sTH
   +ghdlnTUgJSyUPUYghCx1+WNEShjV6fUvReZU3y0ZScqGDB+rC0hNzmlb
   fQM27QfsrPLGmdKqoS4uzzT0uv5R09d0kJ+AXt+RMwIeSQpBlAvxd0fg8
   WOh/fuGdBvL2c5ES3PvOez+AihtxvNi7f+IvsnKgo5oD80qn4iIJXjWhi
   g==;
X-CSE-ConnectionGUID: jJtN5VNpTmC4HjjqE5Q52g==
X-CSE-MsgGUID: +z3IL4v0TVudczPOcUG8xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55368698"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55368698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 22:57:57 -0700
X-CSE-ConnectionGUID: h4EAdNv9T5ezCn0Vg440ZQ==
X-CSE-MsgGUID: vit3NA5ZTOy+IxN5jGQtpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="190304693"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 22:57:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 22:57:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 22:57:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 22:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBJY/JEgJ/V2DHH7FU4ySzAy15pBfkmrvK/q4nSbQmN1FjB/xXLkk+QuIAT2CA73tMXFH2BbcafPD2er10YAK7x1aglJW5s7BTJnMgCnt3SAGUp//uOjai7W2mcjC+/enGtOw1Y1Q+FFYtHYGT8KMCAUR9FSfiCZOezUHjGy8DgBCBTPQLq2RQgBXrmP0SW3XOe3rW2KTSuESStgzJGCZoB2qx8vx4h7VVHNBpiW7SisbX9VvAwxdlJuwGTt+1GJlTFRWqWaOvqLcyMB9KKul3/jRGWuur8gnv9CTlkVT3PBi/4e62vcALB0lEioY3HbBRqT3gnHlw0uvKZnK3FPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa8fc70X4taigyjFX74HAtOg46eKRiW2+cM6cX19xpg=;
 b=hOxKy2OY7sE1ihwiaHc6rudVVA6TLOLm2VDOYLnECAGNCp8EmVmxA925e+Jaz0ARS8ft1+l+Py4UMZVL2YMRPdGI4v/b82ewv4w/ZMk6G69XgTxoRAUvrdwAeRNd/jtdpsG9HDCiv5zY7ncW/qxWqQSncLx+jjWiRQE2FdXaKAUAZU3vL72diMoRvEPFSXaf6lPD6YC11E5eyKfq0r76toLMdv5Bo8nmND9IfSjWdzxfsczbwTz9ppMLEDvm/Qjk8chHujVLZ2/jblBWflyXc+RrmYLyeDbXM4fJXO5PVX//5QGHJuzkOWy3ZntZ6OJuvVVolwyZVtIScIfjG8shqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 05:57:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 05:57:12 +0000
Date: Wed, 23 Jul 2025 13:57:04 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:fuse_passthrough_iops] [fuse]  2d60b5c227:
 WARNING:at_fs/fuse/inode.c:#fuse_evict_inode[fuse]
Message-ID: <202507230715.b4ad8e0b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: e2df74a3-dee9-4e02-2d71-08ddc9adc495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kIGB6Kx2xG5hhRXuitFuhjjJdA4O95/PKHYNCFhodEYJzb4vsmX2t67yU2gY?=
 =?us-ascii?Q?UNvFWY28sxDC2XqBTxsfuadxICNGQi57aUa4oqGW5DHmH3gBxia4tMnbLdYb?=
 =?us-ascii?Q?KlXs5fWUN0KAwlSZPjKXU7wY3oX6utELAo6uWjIKH4fYUw1zDrne6Z5TffoB?=
 =?us-ascii?Q?9eodBQnTEBcOfEqCIf2ZFiiLlHJaAd4a6GFmvQuQsLoIBXfbzPPtGBI+32uz?=
 =?us-ascii?Q?jN6a/KvuA4vyXp3XFM3cw4Vr4byMA4IkB9j4UzxOAvvmMxqoHr+1KzQAiW2n?=
 =?us-ascii?Q?HFNJRAZeY8kf/G64njMNsjUEkOaaDhivtkBzdUTqHmxXdr9k1jwfBGkxzzLZ?=
 =?us-ascii?Q?kGncVDtXM4yeFvpIcuiZfbLksLV4mBJpC9A06vWrzEvz8yd7cyEhR+TXZtNU?=
 =?us-ascii?Q?oPqchQS8VdX52GNnB0ZGl19RzZLlcMkNEV2v8EPUOmgW5vc3BMSwMRJGeC5s?=
 =?us-ascii?Q?G5y1gC++pPwidbzC0ZOcyBYY7wPuKJrmjnujKJg2diFxGV0Juc1G2HG30Q8S?=
 =?us-ascii?Q?joArHi+tYDvfhJRBojAHrL/slnybtPcoR6uCARP7TrCDdoeTYhjd3qgLNxFs?=
 =?us-ascii?Q?HD5xJHk8WBtO0JnDd6Lg3MTmg3v/QIBi0oCaTKJyy//HQhksQb+ElTMV6pTn?=
 =?us-ascii?Q?C1fHXTXiJLq94gpcWCzCnJTg2LF561diS+yV3FX+T026pi647beEWo+e6flb?=
 =?us-ascii?Q?QITspzEC6+RqZKYL/yWwpbYACcnZoHBVipxgw3KEFB1l+RqHu18Sk1nETMiz?=
 =?us-ascii?Q?O39eGQE6aLbF0xqfVDXlJRpJAW42Nl7WYgjvEbpZ7WgXcnm7LMoBF1DaCPUB?=
 =?us-ascii?Q?dHs+KzzKCw+SSRIyf/pcPkt+Qspu8HdwdyVZ+7V7PFKoDe+LA2edmpJ4x8Tg?=
 =?us-ascii?Q?hZE+pj4zgJbeHdNkSK9rM+1VXtGwepykUQERr9A2i9W0bBMIZjtLH8EU0ugK?=
 =?us-ascii?Q?ZJNlrtJXzB2HUv1PPhGNQblEIHEUi2pTEmLCXL3IF2A7NYTmzfVxAjVQRBWt?=
 =?us-ascii?Q?bTA70EbuWnvzEbKznKeuV7vG0kNKW67PVEOo7d44vMeCwltVtu9oBNK3Cn+k?=
 =?us-ascii?Q?GSdK2+9mHSToDzISPVemFKZD006YUMcw5BT30VtxvORLBT+tFV8r/r8/nMei?=
 =?us-ascii?Q?Vsxm3wklarXHAVVNw0yc+aJLIQgmSr7M6lLf1nTLyVujedf9iKogfWk5wOpy?=
 =?us-ascii?Q?5nB8kT1Q28LhDNDeZtTtOq3MMa5q+bZOyO9ZyGM8/B3/RD6yco20glzlHV5/?=
 =?us-ascii?Q?PACSXyQHkpXcuSMjwauTcAS7JSSL0O2rSiXF/KXyiaF0a2mFKDLaHCBprI2s?=
 =?us-ascii?Q?ABb9e7Qc4wC4hzTsbdk1rv3AC2Fac+Ncjq5PNHEwzKbYXCrQjEyGWSJt6kwu?=
 =?us-ascii?Q?OLwA9EfasCHZICjocoHt85Mr/lsZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0ccBp+aKiPmVeiwWQGluMaGvLIidbry4AIDYw9mNtDshwhbKXOv50PYmLzN?=
 =?us-ascii?Q?YVpZB6NxmGEy1U7mfLOl3crZRazpaDw6xEdC0lS2+CrTr9lpBfhaYNuO99+n?=
 =?us-ascii?Q?bRkl/lpjn/0lwEr4Xt6XngKmVaspEjW5/xvdK1IekuS42iKXs2xyfkXB2cbH?=
 =?us-ascii?Q?Ux6EYKW/SovaUPmQfwb0gzLw8qqOt8vOM9UEq7iiaatkaY0kHUyc4DOtbNfx?=
 =?us-ascii?Q?Zdxaw/EUBVG4/bEMXZA2gXs+pOnk1NAle4fLLdxNtd3heXFWc34onv3C4E87?=
 =?us-ascii?Q?CuQd8XKevvLcikWOXnEgMNh3xJE9YD1+ABiLWJ61jeMYb/1Sny9uxvG7zKil?=
 =?us-ascii?Q?QdgFzx/rTEcZraF/qjVo6vjHM+N8Gf7UZQc37IxKpCPgcVwB/V96KvthWQnw?=
 =?us-ascii?Q?wqAFOAW0NkooDiqmBn3fo/RV8tr+0JByCpAjKleQDnT72d3xtrCCDDSzjIOK?=
 =?us-ascii?Q?gtYwS+mRTuQNt9m3dDd+sCU4fVnWiXIxfOxJdyQEfN0n1gGtBI1cPeRD7sfj?=
 =?us-ascii?Q?rsqcdWldgjpdpmMU4dhbUw3yO1zYAbD409vG07g8ydevI1XU2n333YygFHKR?=
 =?us-ascii?Q?ngjJJFKzkt9uNsGn/zvyQNmcViy7U2S8uQITwu56FVIXRjWxR2DSYgYbAjhV?=
 =?us-ascii?Q?qccVBzDGZNL3A2UKt+34JOdehtM5Ndn4mpxLWFgve89nr0QZL31T2MZyipN4?=
 =?us-ascii?Q?64mcylXnpF77pGKlVI0SbVw0RRK2drV7Xerl9MXW/9zQ5r4g55JVazntO4oL?=
 =?us-ascii?Q?CPOTHm7bg5cpeUlbep5gVYLJJO4U3THScWC5d9Pi6o76UiuAKMaI4DL0A3j9?=
 =?us-ascii?Q?wNFlzZYMqaouDS7o+x2kVVveDyXQjUjJ7/u2O5XQQmEfohXgWrJ6IHiDEbYL?=
 =?us-ascii?Q?Qhl0fyB1UZ4858UQFmiCVK5bG4bl7Cjj8YcwcS+BXkBQzBEdqMgleOxclJfV?=
 =?us-ascii?Q?+KeHmqyYUU0NfiZlSpptADFVbtSwWMliDOgbZesDxyEHmUbSg3mmsVRytg2j?=
 =?us-ascii?Q?yZtMwlG6EOvNX9jNyveALG+/PF7sPr95RyD56FEEJiIw1vxjigSrq0KJUI/p?=
 =?us-ascii?Q?J5fBH0nM49PAOC9ReriKtEsSLZFWsyWeHTddoQvVLyM5fYju/3X6ypSvlNUx?=
 =?us-ascii?Q?6cQdM/ZDQhhrZmwBim6Zs3ZJS98xY3LCBIfz/AZY7IzTJmHgXrNyYOHG9/iC?=
 =?us-ascii?Q?u3tMj4mJjUXZp1tmHM1GMboKTQqK1kPDZ9fmcq4ZBPKyzSmTJk+nfcqKxog1?=
 =?us-ascii?Q?YmszrpDsyE56zkY66XuzQrjHKTEaG6y9/K4oAAT0VcqZSAo8kNSUidm8zi8o?=
 =?us-ascii?Q?VWj6KNRmpk5WUGd8lkkCNjdIrw8Tcu8muaEl72kMslhaGWhdHcmWca1WtF7e?=
 =?us-ascii?Q?HNdOB52uqfhHe0kNjfs3p5YwnljD+ebb3/puaU7vw1WDAVi7JMR28wFrPWBz?=
 =?us-ascii?Q?4/OQbPvYHDegs2LZMTtjwM1S8VWPCtPe87SxVKw0GzrA2vqc8bmL4cMnZg+t?=
 =?us-ascii?Q?16ltsLDYCNoUMRMwXHwg6pAFnOWHKR3G/fcKjS7CCH2zzRwsmT3gJhLBFW7d?=
 =?us-ascii?Q?5wbqQMvPSF/VYfFNuF8Vu5ClXFAFVSs368AS4CmnVXttWRKbumzC4DNKSUtx?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2df74a3-dee9-4e02-2d71-08ddc9adc495
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:57:12.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8YlvovBiM+1tQHCos+6fAu13VYhKFQ0OrL5mk5FMgCuXBQwkcMmsdrIO7mcqUUHh8+WaGx9CWHpPpTY5CHNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_fs/fuse/inode.c:#fuse_evict_inode[fus=
e]" on:

commit: 2d60b5c22791353ebb8daff34e33ce12b3c47eaa ("fuse: prepare for readdi=
r passthrough on directories")
https://github.com/amir73il/linux fuse_passthrough_iops

in testcase: kernel-selftests
version: kernel-selftests-x86_64-7ff71e6d9239-1_20250215
with following parameters:

	group: memfd


config: x86_64-rhel-9.4-kselftests
compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GH=
z (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202507230715.b4ad8e0b-lkp@intel.co=
m


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250723/202507230715.b4ad8e0b-lkp@=
intel.com


kern  :warn  : [   72.881113] ------------[ cut here ]------------
kern  :warn  : [   72.881610] WARNING: CPU: 21 PID: 2371 at fs/fuse/inode.c=
:199 fuse_evict_inode+0x4a0/0x600 [fuse]
kern  :warn  : [   72.882455] Modules linked in: netconsole openvswitch nf_=
conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 psample intel_r=
apl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_com=
mon btrfs blake2b_generic xor zstd_compress raid6_pq skx_edac_common nfit s=
d_mod libnvdimm sg snd_hda_codec_realtek x86_pkg_temp_thermal snd_hda_codec=
_generic intel_powerclamp snd_hda_scodec_component amdgpu coretemp snd_soc_=
avs snd_soc_hda_codec snd_hda_ext_core snd_hda_codec_hdmi snd_soc_core snd_=
compress kvm_intel amdxcp gpu_sched drm_panel_backlight_quirks cec snd_hda_=
intel kvm drm_buddy snd_intel_dspcfg drm_ttm_helper snd_intel_sdw_acpi ttm =
snd_hda_codec drm_exec drm_suballoc_helper snd_hda_core irqbypass drm_displ=
ay_helper ghash_clmulni_intel snd_hwdep drm_client_lib rapl snd_pcm ahci in=
tel_cstate drm_kms_helper libahci snd_timer ipmi_devintf ipmi_msghandler nv=
me video ioatdma snd i2c_i801 mei_me crc16 intel_uncore wdat_wdt libata nvm=
e_core i2c_smbus dca soundcore pcspkr mei wmi_bmof mxm_wmi
kern  :warn  : [   72.882695]  intel_wmi_thunderbolt wmi binfmt_misc loop f=
use drm dm_mod ip_tables sch_fq_codel
kern  :warn  : [   72.890801] CPU: 21 UID: 0 PID: 2371 Comm: fusermount Not=
 tainted 6.16.0-rc5-00020-g2d60b5c22791 #1 PREEMPT(voluntary)=20
kern  :warn  : [   72.891778] Hardware name: Gigabyte Technology Co., Ltd. =
X299 UD4 Pro/X299 UD4 Pro-CF, BIOS F8a 04/27/2021
kern  :warn  : [   72.892655] RIP: 0010:fuse_evict_inode+0x4a0/0x600 [fuse]
kern  :warn  : [   72.893207] Code: c1 ea 03 80 3c 02 00 0f 85 22 01 00 00 =
48 c7 83 88 04 00 00 00 00 00 00 e9 01 fd ff ff 48 89 df e8 75 ac 01 00 e9 =
c2 fc ff ff <0f> 0b 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc 0f 0=
b e9
kern  :warn  : [   72.894822] RSP: 0018:ffffc9000438faf8 EFLAGS: 00010206
kern  :warn  : [   72.895342] RAX: 000000004c000300 RBX: ffff888228661500 R=
CX: ffffffffc055a1fd
kern  :warn  : [   72.896010] RDX: 1ffff110450cc36c RSI: 0000000000000008 R=
DI: ffff888228661b60
kern  :warn  : [   72.896683] RBP: 0000000000000000 R08: 0000000000000001 R=
09: ffffed103bfdf25a
kern  :warn  : [   72.897355] R10: ffff8881dfef92d7 R11: ffffffff81e4e18c R=
12: ffff8881dfef9000
kern  :warn  : [   72.898022] R13: ffff888228661b70 R14: ffff8882286616c8 R=
15: ffff888130fd69c0
kern  :warn  : [   72.898694] FS:  00007fa7f80bc740(0000) GS:ffff8887b29570=
00(0000) knlGS:0000000000000000
kern  :warn  : [   72.899444] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
kern  :warn  : [   72.899999] CR2: 00007ffd7b19be58 CR3: 000000089513e005 C=
R4: 00000000003726f0
kern  :warn  : [   72.900671] Call Trace:
kern  :warn  : [   72.900958]  <TASK>
kern  :warn  : [   72.901222]  ? do_raw_spin_unlock+0x54/0x1f0
kern  :warn  : [   72.901664]  evict+0x372/0x7f0
kern  :warn  : [   72.902006]  ? __pfx_evict+0x10/0x10
kern  :warn  : [   72.902392]  ? do_raw_spin_unlock+0x54/0x1f0
kern  :warn  : [   72.902829]  ? _raw_spin_unlock+0x1f/0x40
kern  :warn  : [   72.903249]  ? iput+0x3ec/0x680
kern  :warn  : [   72.903642]  ? _raw_spin_unlock+0x1f/0x40
kern  :warn  : [   72.904059]  __dentry_kill+0x17b/0x500
kern  :warn  : [   72.904461]  dput+0x323/0x680
kern  :warn  : [   72.904842]  shrink_dcache_for_umount+0x138/0x360
kern  :warn  : [   72.905320]  generic_shutdown_super+0x6b/0x370
kern  :warn  : [   72.905789]  kill_anon_super+0x36/0x60
kern  :warn  : [   72.906190]  fuse_kill_sb_anon+0x1b7/0x330 [fuse]
kern  :warn  : [   72.906689]  deactivate_locked_super+0xa1/0x160
kern  :warn  : [   72.907147]  cleanup_mnt+0x1e5/0x3e0
kern  :warn  : [   72.907535]  task_work_run+0x116/0x200
kern  :warn  : [   72.907931]  ? __pfx_task_work_run+0x10/0x10
kern  :warn  : [   72.908372]  ? __x64_sys_umount+0xff/0x120
kern  :warn  : [   72.908794]  ? __pfx___x64_sys_umount+0x10/0x10
kern  :warn  : [   72.909256]  exit_to_user_mode_loop+0x12b/0x130
kern  :warn  : [   72.909716]  do_syscall_64+0x2d9/0x390
kern  :warn  : [   72.910115]  ? lock_release+0xea/0x130
kern  :warn  : [   72.910513]  ? do_user_addr_fault+0x916/0xe30
kern  :warn  : [   72.910960]  ? trace_irq_enable+0xc2/0x100
kern  :warn  : [   72.911473]  ? trace_hardirqs_on_prepare+0x19/0x30
kern  :warn  : [   72.911952]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
kern  :warn  : [   72.912456] RIP: 0033:0x7fa7f81c7af7
kern  :warn  : [   72.912837] Code: 0f 93 0c 00 f7 d8 64 89 01 48 83 c8 ff =
c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 =
00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 d9 92 0c 00 f7 d8 64 89 0=
2 b8
kern  :warn  : [   72.914453] RSP: 002b:00007ffd7b1abe88 EFLAGS: 00000202 O=
RIG_RAX: 00000000000000a6
kern  :warn  : [   72.915163] RAX: 0000000000000000 RBX: 00005562d78a9370 R=
CX: 00007fa7f81c7af7
kern  :warn  : [   72.915830] RDX: 0000000000000000 RSI: 0000000000000008 R=
DI: 00005562d78a93ea
kern  :warn  : [   72.916510] RBP: 0000000000000001 R08: 00005562d78a9360 R=
09: 00005562d78a92c0
kern  :warn  : [   72.917182] R10: 00000000ffffffff R11: 0000000000000202 R=
12: 00007ffd7b1ac448
kern  :warn  : [   72.917849] R13: 00000000ffffffff R14: 0000000000000008 R=
15: 00005562d78a92a0
kern  :warn  : [   72.918526]  </TASK>
kern  :warn  : [   72.918792] irq event stamp: 0
kern  :warn  : [   72.919128] hardirqs last  enabled at (0): [<000000000000=
0000>] 0x0
kern  :warn  : [   72.919730] hardirqs last disabled at (0): [<ffffffff8142=
e1df>] copy_process+0x16cf/0x50d0
kern  :warn  : [   72.920496] softirqs last  enabled at (0): [<ffffffff8142=
e22f>] copy_process+0x171f/0x50d0
kern  :warn  : [   72.921260] softirqs last disabled at (0): [<000000000000=
0000>] 0x0
kern  :warn  : [   72.921857] ---[ end trace 0000000000000000 ]---
kern  :info  : [   73.423845] run_hugetlbfs_t (2390): drop_caches: 3
kern  :warn  : [   74.817570] ------------[ cut here ]------------
kern  :warn  : [   74.818056] WARNING: CPU: 21 PID: 2409 at fs/fuse/inode.c=
:199 fuse_evict_inode+0x4a0/0x600 [fuse]
kern  :warn  : [   74.818913] Modules linked in: netconsole openvswitch nf_=
conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 psample intel_r=
apl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_com=
mon btrfs blake2b_generic xor zstd_compress raid6_pq skx_edac_common nfit s=
d_mod libnvdimm sg snd_hda_codec_realtek x86_pkg_temp_thermal snd_hda_codec=
_generic intel_powerclamp snd_hda_scodec_component amdgpu coretemp snd_soc_=
avs snd_soc_hda_codec snd_hda_ext_core snd_hda_codec_hdmi snd_soc_core snd_=
compress kvm_intel amdxcp gpu_sched drm_panel_backlight_quirks cec snd_hda_=
intel kvm drm_buddy snd_intel_dspcfg drm_ttm_helper snd_intel_sdw_acpi ttm =
snd_hda_codec drm_exec drm_suballoc_helper snd_hda_core irqbypass drm_displ=
ay_helper ghash_clmulni_intel snd_hwdep drm_client_lib rapl snd_pcm ahci in=
tel_cstate drm_kms_helper libahci snd_timer ipmi_devintf ipmi_msghandler nv=
me video ioatdma snd i2c_i801 mei_me crc16 intel_uncore wdat_wdt libata nvm=
e_core i2c_smbus dca soundcore pcspkr mei wmi_bmof mxm_wmi
kern  :warn  : [   74.819103]  intel_wmi_thunderbolt wmi binfmt_misc loop f=
use drm dm_mod ip_tables sch_fq_codel
kern  :warn  : [   74.827199] CPU: 21 UID: 0 PID: 2409 Comm: fusermount Tai=
nted: G        W           6.16.0-rc5-00020-g2d60b5c22791 #1 PREEMPT(volunt=
ary)=20
kern  :warn  : [   74.828299] Tainted: [W]=3DWARN
kern  :warn  : [   74.828630] Hardware name: Gigabyte Technology Co., Ltd. =
X299 UD4 Pro/X299 UD4 Pro-CF, BIOS F8a 04/27/2021
kern  :warn  : [   74.829532] RIP: 0010:fuse_evict_inode+0x4a0/0x600 [fuse]
kern  :warn  : [   74.830096] Code: c1 ea 03 80 3c 02 00 0f 85 22 01 00 00 =
48 c7 83 88 04 00 00 00 00 00 00 e9 01 fd ff ff 48 89 df e8 75 ac 01 00 e9 =
c2 fc ff ff <0f> 0b 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc 0f 0=
b e9
kern  :warn  : [   74.831722] RSP: 0018:ffffc90002517958 EFLAGS: 00010202
kern  :warn  : [   74.832242] RAX: 0000000000002001 RBX: ffff88811114f000 R=
CX: ffffffffc055a1fd
kern  :warn  : [   74.832911] RDX: 1ffff11022229ecc RSI: 0000000000000008 R=
DI: ffff88811114f660
kern  :warn  : [   74.833582] RBP: 0000000000000000 R08: 0000000000000001 R=
09: ffffed103de2da5a
kern  :warn  : [   74.834254] R10: ffff8881ef16d2d7 R11: ffffffff81eb2c87 R=
12: ffff8881ef16d000
kern  :warn  : [   74.834922] R13: ffff88811114f670 R14: ffff88811114f1c8 R=
15: ffff888896d849c0
kern  :warn  : [   74.835594] FS:  00007f19c289d740(0000) GS:ffff8887b29570=
00(0000) knlGS:0000000000000000
kern  :warn  : [   74.836345] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
kern  :warn  : [   74.836900] CR2: 000055d0586b3f9c CR3: 0000000141870005 C=
R4: 00000000003726f0
kern  :warn  : [   74.837572] Call Trace:
kern  :warn  : [   74.837862]  <TASK>
kern  :warn  : [   74.838122]  ? do_raw_spin_unlock+0x54/0x1f0
kern  :warn  : [   74.838568]  evict+0x372/0x7f0
kern  :warn  : [   74.838910]  ? __pfx_evict+0x10/0x10
kern  :warn  : [   74.839296]  ? do_raw_spin_unlock+0x54/0x1f0
kern  :warn  : [   74.839733]  ? _raw_spin_unlock+0x1f/0x40
kern  :warn  : [   74.840148]  ? iput+0x3ec/0x680
kern  :warn  : [   74.840547]  ? _raw_spin_unlock+0x1f/0x40
kern  :warn  : [   74.840963]  __dentry_kill+0x17b/0x500
kern  :warn  : [   74.841363]  dput+0x323/0x680
kern  :warn  : [   74.841743]  shrink_dcache_for_umount+0x138/0x360
kern  :warn  : [   74.842221]  generic_shutdown_super+0x6b/0x370
kern  :warn  : [   74.842673]  kill_anon_super+0x36/0x60
kern  :warn  : [   74.843067]  fuse_kill_sb_anon+0x1b7/0x330 [fuse]
kern  :warn  : [   74.843561]  deactivate_locked_super+0xa1/0x160
kern  :warn  : [   74.844019]  cleanup_mnt+0x1e5/0x3e0
kern  :warn  : [   74.844408]  task_work_run+0x116/0x200
kern  :warn  : [   74.844805]  ? __pfx_task_work_run+0x10/0x10
kern  :warn  : [   74.845246]  ? __x64_sys_umount+0xff/0x120
kern  :warn  : [   74.845668]  ? __pfx___x64_sys_umount+0x10/0x10
kern  :warn  : [   74.846126]  exit_to_user_mode_loop+0x12b/0x130
kern  :warn  : [   74.846591]  do_syscall_64+0x2d9/0x390
kern  :warn  : [   74.846986]  ? __handle_mm_fault+0xa18/0x1180
kern  :warn  : [   74.847437]  ? __pfx_map_id_range_up+0x10/0x10
kern  :warn  : [   74.847891]  ? __pfx___handle_mm_fault+0x10/0x10
kern  :warn  : [   74.848361]  ? from_kuid_munged+0x86/0x110
kern  :warn  : [   74.848783]  ? __pfx_from_kuid_munged+0x10/0x10
kern  :warn  : [   74.849247]  ? trace_irq_enable+0xc2/0x100
kern  :warn  : [   74.849756]  ? do_syscall_64+0x169/0x390
kern  :warn  : [   74.850168]  ? lock_release+0xea/0x130
kern  :warn  : [   74.850562]  ? handle_mm_fault+0x437/0x7a0
kern  :warn  : [   74.850985]  ? lock_release+0xea/0x130
kern  :warn  : [   74.851386]  ? do_user_addr_fault+0x916/0xe30
kern  :warn  : [   74.851832]  ? trace_irq_enable+0xc2/0x100
kern  :warn  : [   74.852345]  ? trace_hardirqs_on_prepare+0x19/0x30
kern  :warn  : [   74.852824]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
kern  :warn  : [   74.853329] RIP: 0033:0x7f19c29a8af7
kern  :warn  : [   74.853710] Code: 0f 93 0c 00 f7 d8 64 89 01 48 83 c8 ff =
c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 =
00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 d9 92 0c 00 f7 d8 64 89 0=
2 b8
kern  :warn  : [   74.855326] RSP: 002b:00007ffc14101e88 EFLAGS: 00000202 O=
RIG_RAX: 00000000000000a6
kern  :warn  : [   74.856034] RAX: 0000000000000000 RBX: 0000556e8665d370 R=
CX: 00007f19c29a8af7
kern  :warn  : [   74.856708] RDX: 0000000000000000 RSI: 0000000000000008 R=
DI: 0000556e8665d3ea
kern  :warn  : [   74.857380] RBP: 0000000000000001 R08: 0000556e8665d360 R=
09: 0000556e8665d2c0
kern  :warn  : [   74.858047] R10: 00000000ffffffff R11: 0000000000000202 R=
12: 00007ffc14102448
kern  :warn  : [   74.858718] R13: 00000000ffffffff R14: 0000000000000008 R=
15: 0000556e8665d2a0
kern  :warn  : [   74.859395]  </TASK>
kern  :warn  : [   74.859661] irq event stamp: 0
kern  :warn  : [   74.859997] hardirqs last  enabled at (0): [<000000000000=
0000>] 0x0
kern  :warn  : [   74.860599] hardirqs last disabled at (0): [<ffffffff8142=
e1df>] copy_process+0x16cf/0x50d0
kern  :warn  : [   74.861366] softirqs last  enabled at (0): [<ffffffff8142=
e22f>] copy_process+0x171f/0x50d0
kern  :warn  : [   74.862125] softirqs last disabled at (0): [<000000000000=
0000>] 0x0
kern  :warn  : [   74.862726] ---[ end trace 0000000000000000 ]---


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

