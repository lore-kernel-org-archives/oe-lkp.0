Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51873189B86
	for <oe-lkp@lists.linux.dev>; Mon, 23 Dec 2024 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943560; cv=fail; b=DnFGxcLdQElbaTJqvtfDKNNCJMcWJjEfaFKhdah5VWYt0tlTpMKCPkFS13UziMezgteIjioaittnltt0YTo9m0S09FA73wmqLTj+cNOlkZFex2Hk7k/2rkSWh0D6KEHSJFqliJhwp1h1SxB9dwRlQBOHtiMPBkCtbx1ZU31mc+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943560; c=relaxed/simple;
	bh=U1tqDjA2WilL8WDO/Y2Klddzvdx6wpPc2N01kAiZJoU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LQsAssf7sgWPhpnY3FS7Dw37lcCSDqYbK0MU9BgPqAL4UZBqW3p8N4Bfrks7e6Dh5RZ2JxObRxIVWgY4LMRiAI41mAwLGcS7uMp6Z7ukeosBAsTjT/w5mJxB1m5HoJeGvyYvnOnpPVg19J8ThMYeGcw5WdQKiRX13ZaS9dtgJhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKdmTC9m; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKdmTC9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734943558; x=1766479558;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=U1tqDjA2WilL8WDO/Y2Klddzvdx6wpPc2N01kAiZJoU=;
  b=UKdmTC9mdhmlJb8fopyEpTyZHjqy/AggEhU89N83nYOTezaOUnzB8GkW
   WoeVDU2wqOWbn+dsU1ffObV4AhPH62CD/Fzc7xla3tP2nBbAoTrmzg2ik
   UUAM5bBJ9w7td9CrKzshuySuLyuErjIwxAMpevjQPMci+XRFezSQcJg+z
   6FLG4OwzzYKXY0WG5ccXp3LcOdjGXaw3x6ch0QFSDYJ0icebWC0Cdn2Zb
   C88OvSxrd1ku4XVjFt8R+hJBCn2gdw5posofVFjwcjsF/OUmMlm+ZaoI6
   0KIIAbOZOf8GUO/jsSPR+ogHG/K3xtwH08TC6rUkDFwxOtcaXc4KqdNA9
   Q==;
X-CSE-ConnectionGUID: Tx4vQ1qpQQWrnGFuYgT+6w==
X-CSE-MsgGUID: ZZkSfrQMR4++F9lXofjhhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35114493"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35114493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 00:45:58 -0800
X-CSE-ConnectionGUID: cUKBjOeIRXK4k9M2t4oQzg==
X-CSE-MsgGUID: 0/EZCzv/Q4WzqiKSMEonIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99999092"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 00:45:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 00:45:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 00:45:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 00:45:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVB5gPcTXTDRJ6S64WloTAVTY80f/pbZ3fIGwiBWpLiMP8WSWONLBZ5cHuR0zNvRQLrSlmsiR1eF7g+dJ9z/bCaSgLizO83Fh9corfm/1xT4M65+xQUlHP1398uRJTI/Q+Nv9s3Wu4aUFvCaedgteovk5lIT3ps92pywExnEjuO2TwFrkXA2I7qSUd5Ltgf7uTawAoeGizJXh7n2z06BuuRQdrVkXcqVE68gD3tcq6+3+Xemu35Ajdn6Y2uJxSBnyJxmOPULbLYMxqAgbxURvHli5bJfZD9XVPE2oPfVLLArxGn561r/OaM96j5lLsnZArZQv6N5EidNlMdb9DUxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPiU5ONmnRfh5IP3c4qoJ08jRHxHJCjvFy7eF7YTsNY=;
 b=gYMESqeLnrTat/yCWG2pruRV7QdEhs/u4Cq5Uw97l7SdHyUqlcBBpqHrUiCd5uWaqC6XVbgTnvYNU88j5j+kjpTZnErjI9ZReKIegz+LVRh3t7RwHpTLozFObwReGspcCuNwgXDxw8o2/8ahPIDf6nidhxsICiXnFgBFOOKlvrXdo6IcquF6gFc8oNkJVvmqFh1854l/otZF3fu0P92SpzQqqCVEld8flPPuRpJ1+zyZWpDsTnKKDnDx7u5cZfo8Qxvgi3YdqtfgPf0XjN43YeM3MHZDy3fzIFLizHufE/4PgyQn8LuztdPuD2V1VpDuMzcADZxtozhRFhSNOJOhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 08:44:55 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 08:44:55 +0000
Date: Mon, 23 Dec 2024 16:44:44 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yu Zhao <yuzhao@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Kairui Song
	<kasong@tencent.com>, Kalesh Singh <kaleshsingh@google.com>,
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, Yu Zhao <yuzhao@google.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection
Message-ID: <202412231601.f1eb8f84-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241207221522.2250311-7-yuzhao@google.com>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: d484005e-e98a-4be6-689d-08dd232e1322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Se7utgOszOfT6r9IrGrGqJrEqpLxEz7Na7p+PKk9Iu6qZsQblstMwu0pms?=
 =?iso-8859-1?Q?iGCiD+l+L87qWzbSwCSGfQNq/s5C6reuced9wHGLX42Ym/2jzB/qdD7EW4?=
 =?iso-8859-1?Q?uRtDIPrqW93miG81LfVwK635OYQinFEPf19J2Ns3HiYoXAJccIPjf5zMGN?=
 =?iso-8859-1?Q?+3sE0kJRbH2/ZVWUJ4wW0J2bCudSlmQHAWHTa2WSWZ43fdi4PccrB6kB3/?=
 =?iso-8859-1?Q?UYWEokCJK/bDCiXRNa9F4Csc6+tkyE53miD9vzB+pJxlNCljdHdCC1/3BX?=
 =?iso-8859-1?Q?t9ARHNE4/Fp6iFRFa5hOk9liFXg9P00J9CAgRt3iMNrzTRWRrx8hnYreCF?=
 =?iso-8859-1?Q?WMdXEsXNjwTbwqwVVx6Dr/ALHAjY47PTGJtfeM0WtNufnvUjRsRQkYIYmh?=
 =?iso-8859-1?Q?dNSQ45UeUScqhkOwhngG3nkgO/WRMZeNm7CMnOjXX0N6DWKG+MXUVu6XXR?=
 =?iso-8859-1?Q?NZrfULlh6wm4q++8c8aSVH/ePh5zBfHmAq/3osMmQJamEfU5Fvxmq9VUn+?=
 =?iso-8859-1?Q?E3RmYCA5qNqdJFONRm0G5Gxmesyk+VFFZ8nBPkuSmUeOJNi55vszK6VoPD?=
 =?iso-8859-1?Q?2sONIaQSuAfr+Sn5RoWZuV96CWZxi1HFC/oSvsdGYfwTtJngGJui5kpZsK?=
 =?iso-8859-1?Q?d3b9HKGRL0NTRjFcMpsns2DExNnqWDBKeFDHvcqBEfznAN3qgPymJ68C7F?=
 =?iso-8859-1?Q?23cu4UxUNdb1GpDjt9q3uflqoKkwe+dezQIJRWF1ZCc0h0hRVfiADedy+K?=
 =?iso-8859-1?Q?K44kEZ1eNiLEIRTDT1JemYSGTBtZQ8AO26Cc6McOaDX/htKpsO+dsJMM5/?=
 =?iso-8859-1?Q?b1MTVdAD+v2UuzC0xNuVJLb30HI9KK4TcvzDp7L0AN/Wzkv+681xBRqxKz?=
 =?iso-8859-1?Q?Mw95bBkrpvGPrNt8kn/G/O8SkNu2rUCFwIvMaqqlu3vH2GAKuOlopTt7yv?=
 =?iso-8859-1?Q?uNy5qU1B0jQ6re3s693ABim85Xjsp88u3044hlBXhXP+wG1pO70YyjW/sZ?=
 =?iso-8859-1?Q?ORokCKMKLEmg4/h5o+yy86HIVB6zmsnSHUU9LOAw6o+XyhjSlcDDnFS3ZX?=
 =?iso-8859-1?Q?JcNs0t23326MtLpco74JPNNi/r08ZsrHq0lop/B+14Ay28KMQqEDIP+aU6?=
 =?iso-8859-1?Q?GVo0jEH0wZtjBqf2ruz+jBGmYI4CQfKDuN0lnDWbYatm7zoZqK5YsmcPr5?=
 =?iso-8859-1?Q?6Pf8HQEODMiPXzOKJ4D/ffiGh4ucyeEf22fx5XxRn8xL8Ez61dy5piXoEp?=
 =?iso-8859-1?Q?jpLymohX0dESNm+E2ZRLMqpMO9NuV7R5uvrrrxRBbU+TA218JoWoMo+leZ?=
 =?iso-8859-1?Q?rtIXxQ9BihfUAqluIuylzClq3xEFWSIAmgBXoMhjFIT2JWPyDM2cp1h9pi?=
 =?iso-8859-1?Q?wtMDjVvRYl4/BUthzCMznUat4M0RsxmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c+KXFadx3MVofz0Zxo43va2+Syw492xqcxRZqffp53Ns1t1TvT0FoxzrWg?=
 =?iso-8859-1?Q?4JJ4Erhool7oGagGeFv6AMGjmf7hX6PKLuQ/TqAg1IxpPugN7jHXVRDjGL?=
 =?iso-8859-1?Q?PQdThjnESXK0R9jTjzx12pT5+R6EbPemslRhJNxBd4rpe3/w18BV1q5AdW?=
 =?iso-8859-1?Q?QC0IrxHQnVU+OkimZrtNUGhndP5+TxxauiZY8QfASuA4hQi9JtoQ8K+Auq?=
 =?iso-8859-1?Q?bmk892k49Ai87DH50/Kc/dFaXKAY2siuDuTFr+yxDhsO326ijhScNQWEMa?=
 =?iso-8859-1?Q?Lo1J0xpt2JBF+7ub819rrsru22Ar9NQAG7sJvH/ar1X/7lPoj29Dg6XYEC?=
 =?iso-8859-1?Q?YW7F6my8KoOH4y6Wnt4sN3AOkn0XYAW9fC+Q+CKXWBdYyFaZSuqzUPh0AA?=
 =?iso-8859-1?Q?FX9AVSxrhm98cIAYXni0BvlQ3esRzc4vCbx95ApdDKPXU/Dfm9t3cBnp26?=
 =?iso-8859-1?Q?OcAGgZWKonFdiOGhreKk12RVv6LaJcuermRsjR3wTCPMtUGhHw/+XKqYj0?=
 =?iso-8859-1?Q?8+Go8tXZYnzIt+3VJHU0EFdDk31ptd/OjA64PCGhV1UBZEiI51T2h4gpCw?=
 =?iso-8859-1?Q?iFpJinHUfw7ybJ0Hxq1GY66vDr/SP+Ednr/ZN3dj5n0MzWqbb6Y922by1J?=
 =?iso-8859-1?Q?fj9twDh4R/Ft17u8gkva5GsT28WuxPzcm7DE0OCdPLNSD2IHYEp24SYZZc?=
 =?iso-8859-1?Q?mB1VYTjgZ7SsMnB1s75rfnZuA7EyZz6LDNJxWhvySka1CBMyey1X9CDfzo?=
 =?iso-8859-1?Q?l3aBB8bNDQCur4Uv8Szs5d0/cZ6Dk3dNjdJR1h+m81bekccfbEc9yH0uyQ?=
 =?iso-8859-1?Q?vYD0z1xubFasW5uoKpgZlnmkQ7gkTWWzFRq3SFgkVgVtFVC+jwH7iqim6N?=
 =?iso-8859-1?Q?R9wC6zK5qvzADwYR78UWbAprYjjtjPwv/SIJzdwZjlmJ/cDHhEpj+zi2s+?=
 =?iso-8859-1?Q?WCdQomWns5DDGUachaeQJFieAfLE8t6BuSHaDZoVqpGQLbKl02QhM3DgQ0?=
 =?iso-8859-1?Q?8a1rTqzYtvSrD0QxCZIyNRS8X1GW7nWUm5uoCdXbSv9aO3NYc8lBOkEKMT?=
 =?iso-8859-1?Q?olXug6guE9eyHBosSvT1fa5sjOJJP04uldMY+WbKBQqK4pgEO4ae4RuifG?=
 =?iso-8859-1?Q?z6Xy7fDVE01mCiWcmjvlgsKay+n5TozvnVHcukoU983w520giCyGeALubB?=
 =?iso-8859-1?Q?On8/RDvSnv74J2E1iqQBl7TRnoFTc3ms0SBy4XZWs1Gx/KmfFqBtG5l9kV?=
 =?iso-8859-1?Q?PY3LURQfaTRUfR2lNzlKftpU5GmG6BXBucohPiPXz51tz1ab2H8mNZV5Ds?=
 =?iso-8859-1?Q?XbjGUu77CW6ibmEQDJIRc5+LEjDIbO0u62w+mBOqqWdCTAx3923WMn+psv?=
 =?iso-8859-1?Q?cQYWmNkZho8qULoVi8QtwoXyCRRXx83g3+8LRuTsxOpUb8Th7fZA+ns0qM?=
 =?iso-8859-1?Q?k4OPr0Rt1DzucxwH/Ek2bFJRMFM1tRcci7rpR2UIEpkR9n6FMg/Eiwla4/?=
 =?iso-8859-1?Q?138XtFrIwDzMYg5RxLM04sGzKFMppcKF9qiIcVFx41pvxQiwbyhswQqGtn?=
 =?iso-8859-1?Q?reyt3vhC42qNwH+sko1LY5Lk7FpzeXk2anP4hjQFu+T2zihHqgImatj495?=
 =?iso-8859-1?Q?DUKzA4HgPwGOl5UeBZGsC0rEA6I0j5oPJPD3x6IAOUQ2iEPtq2jTknfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d484005e-e98a-4be6-689d-08dd232e1322
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 08:44:55.4715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+icTsQqwksPEj/w3e4cyfhtLfRxgqE4X4QPSshfgtYZPCdjFbeNBURrqQ8Wq2PDC2RNLRs7RwSfGrE9IVYXmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.7% regression of will-it-scale.per_process_ops on:


commit: 3b7734aa8458b62ecbfd785ca7918e831565006e ("[PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection")
url: https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-mglru-clean-up-workingset/20241208-061714
base: v6.13-rc1
patch link: https://lore.kernel.org/all/20241207221522.2250311-7-yuzhao@google.com/
patch subject: [PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 104 threads 2 sockets (Skylake) with 192G memory
parameters:

	nr_task: 100%
	mode: process
	test: pread2
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412231601.f1eb8f84-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241223/202412231601.f1eb8f84-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/pread2/will-it-scale

commit: 
  4a202aca7c ("mm/mglru: rework refault detection")
  3b7734aa84 ("mm/mglru: rework workingset protection")

4a202aca7c7d9f99 3b7734aa8458b62ecbfd785ca79 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1.03 ±  3%      -0.1        0.92 ±  5%  mpstat.cpu.all.usr%
      0.29 ± 14%     +20.8%       0.35 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.02 ± 21%     +50.7%       1.54 ± 23%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 50%     -66.9%       0.00 ± 82%  perf-stat.i.major-faults
      0.01 ± 50%     -73.6%       0.00 ±112%  perf-stat.ps.major-faults
    335982           -60.7%     132060 ± 15%  proc-vmstat.nr_active_anon
    335982           -60.7%     132060 ± 15%  proc-vmstat.nr_zone_active_anon
   1343709           -60.7%     528460 ± 15%  meminfo.Active
   1343709           -60.7%     528460 ± 15%  meminfo.Active(anon)
    259.96        +3.2e+05%     821511 ± 11%  meminfo.Inactive
   1401961            -5.7%    1321692 ±  2%  will-it-scale.104.processes
     13479            -5.7%      12708 ±  2%  will-it-scale.per_process_ops
   1401961            -5.7%    1321692 ±  2%  will-it-scale.workload
    138691 ± 43%     -75.8%      33574 ± 55%  numa-vmstat.node0.nr_active_anon
    138691 ± 43%     -75.8%      33574 ± 55%  numa-vmstat.node0.nr_zone_active_anon
    197311 ± 30%     -50.1%      98494 ± 18%  numa-vmstat.node1.nr_active_anon
    197311 ± 30%     -50.1%      98494 ± 18%  numa-vmstat.node1.nr_zone_active_anon
    554600 ± 43%     -75.8%     134360 ± 55%  numa-meminfo.node0.Active
    554600 ± 43%     -75.8%     134360 ± 55%  numa-meminfo.node0.Active(anon)
    173.31 ± 70%  +1.4e+05%     247821 ± 50%  numa-meminfo.node0.Inactive
    789291 ± 30%     -50.1%     394029 ± 18%  numa-meminfo.node1.Active
    789291 ± 30%     -50.1%     394029 ± 18%  numa-meminfo.node1.Active(anon)
     86.66 ±141%  +6.6e+05%     573998 ± 27%  numa-meminfo.node1.Inactive
     38.95            -0.9       38.09        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.folio_wait_bit_common.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read
     38.83            -0.9       37.97        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_wait_bit_common.shmem_get_folio_gfp.shmem_file_read_iter
     39.70            -0.8       38.86        perf-profile.calltrace.cycles-pp.folio_wait_bit_common.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read.__x64_sys_pread64
     41.03            -0.8       40.26        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read.__x64_sys_pread64.do_syscall_64
      0.91            +0.0        0.95        perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read.__x64_sys_pread64
     53.14            +0.5       53.66        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_wake_bit.shmem_file_read_iter.vfs_read
     53.24            +0.5       53.76        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_wake_bit.shmem_file_read_iter.vfs_read.__x64_sys_pread64
     53.84            +0.5       54.38        perf-profile.calltrace.cycles-pp.folio_wake_bit.shmem_file_read_iter.vfs_read.__x64_sys_pread64.do_syscall_64
     38.96            -0.9       38.09        perf-profile.children.cycles-pp._raw_spin_lock_irq
     39.71            -0.8       38.87        perf-profile.children.cycles-pp.folio_wait_bit_common
     41.04            -0.8       40.26        perf-profile.children.cycles-pp.shmem_get_folio_gfp
     92.00            -0.3       91.67        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.22            -0.0        0.18 ±  3%  perf-profile.children.cycles-pp._copy_to_iter
      0.22 ±  2%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.copy_page_to_iter
      0.20 ±  2%      -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.91            +0.0        0.96        perf-profile.children.cycles-pp.filemap_get_entry
      0.00            +0.3        0.35        perf-profile.children.cycles-pp.folio_mark_accessed
     53.27            +0.5       53.80        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     53.86            +0.5       54.40        perf-profile.children.cycles-pp.folio_wake_bit
     92.00            -0.3       91.67        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.19            -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.41            +0.0        0.44        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.37 ±  2%      +0.0        0.40        perf-profile.self.cycles-pp.folio_wait_bit_common
      0.90            +0.0        0.94        perf-profile.self.cycles-pp.filemap_get_entry
      0.61            +0.1        0.68        perf-profile.self.cycles-pp.shmem_file_read_iter
      0.00            +0.3        0.34 ±  2%  perf-profile.self.cycles-pp.folio_mark_accessed




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

