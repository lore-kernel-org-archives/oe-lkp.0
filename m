Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD0433CE
	for <oe-lkp@lists.linux.dev>; Mon, 26 Feb 2024 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708958877; cv=fail; b=i1LnpmpPWFoXLoe+RyEmR/pjBNN0hIPT2W+4iTlKJVLRThPd6oZ9jPXdsI5AgulG/O5nzYustXkKznbRQSqrSsOIjn7Les9y8aIveMPNM+DzLtJeUe06Uj/YfVN1kgjLmViqEgLayYe1UzPNU4v750WuKwS56cyltOGniET8y2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708958877; c=relaxed/simple;
	bh=GbaavdAFA0GD/D8fjk5j9FB0lGm6M8GtHpyHyr1CK8M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ApInLjIFTHerv6pF4xpnV22kNTMLtCQvwDcFbLLxLNM8gu5VHdm9bKARifoBkuZXGjAzKDM5WReRvnkBXG0/17uPc+jN+2ymOnfDRXBIksocmxge+zI6rMGw0huIB7BLmJ9igGJsiXV2XJGbA5lPuvTKH9RisH95hZzVKmLV+u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBA4mh8Q; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBA4mh8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708958875; x=1740494875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GbaavdAFA0GD/D8fjk5j9FB0lGm6M8GtHpyHyr1CK8M=;
  b=jBA4mh8QIX2qIqerbzyR1GbOZFppAVjeSJNXXCsFLnReaA77FfWiiDfX
   ynodv3PMOl4VafXS1+g9p43+YrgnhDm5LtblCuOEM1EwxhVe2371JmW0z
   pCIqH1YCJ4PK3lp2LD6XmiZQaZ8F+OEXRq6wFmVbKH6ZBo2HrhchVz7Ey
   HFjPv53GZnC+OLXrAgEMfoqMYtY7DsV3dmvlcYQAx+YGZWuBd74eKf+5v
   mOSsV3kIkvZ2fxwHh8yp5UTJnGb0QU1r7XMcsAF2k55fv5xeez/VqF5yB
   uNgnlLAF7WsN1c9Cx+kahK9TmJYKOi80viyJhLX9iOwjQwMPYEIGoP+kx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20790720"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20790720"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 06:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6613969"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Feb 2024 06:47:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 06:47:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 06:47:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 06:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnVqs3ImxIwfwx4bZaH5g5xO5vfMjN+55t4pywIXsZ47vOJLxfAEK8J7ZJgmlT63DYJGVRsMKncDnqft8ZJ8ccXq/EJ2VbCE17W9dY+MyUBmB4HOSgyrkp1XekyWfa2xJnXxIAdsw9kmJu7ztLceZVLl6DMLgqjU2YpS0v6f40a++yHKSmtWlwuXPMMR531E4l3jB+IKAz6NOggD9QUJPQw3Hd3LlaWh6RBBGW16eGLqdAPmMrnZsPlIhzJWw9DI9jt2VZwjx8I/aSX5KjZUQdgsmP6K+fIGMhmAZ9W7gOMgknn5mWsvc/EWCmdYErrV5b5VrECRBwY/cs27jFy0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0N69Y1Ln7C3Dn/NWQKJ3xlR45wTQQ8m1bpcMPDDHFo=;
 b=QJ7gN1DnWieWKYrReyc8vQzY5GPUY9kz1uVI40f0O4Gf5feK7tJWPxphLnN89g47TGu38oWktpL+nwNlklKPt6Orm5c/2rHgiqSDZRtmMP4g/2Dj822wZBSzyqr01L2ytKlr05v/ajmDDvzo7AbI/v5L/EFP3hyHqrceuvjN+tcpkNto1YR+RFDdIMY6Jrz6ztLuEuF59jllMfUTQGktOSvwhpO18BNK1rb9UaOUZIMIEGhnR+zvS1Lfu4xRW95NwVhZe+7l3OCqQDUH2VfmJbcYnB7WEO0BmJK/YqLIFgr2q9cLiO14hkMoCLvhaOYcV5QeTMUjAUXb5Vos+pqf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.20; Mon, 26 Feb
 2024 14:47:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.009; Mon, 26 Feb 2024
 14:47:35 +0000
Date: Mon, 26 Feb 2024 22:47:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Atish Patra <Atish.Patra@wdc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Atish Patra
	<Atish.Patra@wdc.com>, <oliver.sang@intel.com>
Subject: [atishp04:counter_delegation_rfc] [tools/perf]  8c248155fb:
 perf-sanity-tests.PMU_event_table_sanity.fail
Message-ID: <202402262254.5bb566d3-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf037c6-7279-4cd0-2f49-08dc36d9de74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5SoGdceSM6xvkGHlbiKkAyS1E0gC3ohdpfJe6Ppt5e54pqWma0++dBxsPm4N3qXD0mukhO7YYEw4YHHNczMDgWRvDDneGA+JVhlPspn13SG57e6PSRbx/1kPQPIGqYnLVyu2wtSEmbX+AVMxeluMiZbIJaxPmIrWpK8waQNhOu5gnbv/vh1HHjCuU9AD5vrCyCLD1QsZ7oR80KoQPWiRJpQFtz+D8LLtiYyLWNgFviRv1o7xkDgFeAXPjcrS1j41NQf5IYPE9BDrsO5bxyEE4dzpSYsszWb8v2jx0B+rylTaX0JbY+8pYGwKEcTbqhny39Zn8UaOXWeUO4Fq/WWu/FOev7L87+N14y9MQcOmwdZZhhbUE59vOXiKZYE5ymGXjnq23O+72UM0HUu58ezn88UeDDtmJVljPxCYSH0iIObfAIgaqgq5CZaUOcqgoYF7B1x0KdXgQQ9TLA2o/VknPMI1RjiAK3JgBRjVw33G3+tSnj59F0/oUGn8diyez4XuxxBWqXbATZYxKr2V+fyPdC/Znk5cYTa6lLpyOrUfhPpfSvejm/3wm+MUuoM4cV1oaKsLq+kINYsb10PWN27WFVKLZ1sVBUQSo1yDWfeti1ktnCweTGeT66tDvKU06m7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aRZfLmH1xIX4YJNKpFKu9Q3UZjMaDFx7K1zu7QXiddB+Z0gz+I34O4CTgAF4?=
 =?us-ascii?Q?T8jCsglt45nzTMAFKOKdoK96QkokcBzEeoBkxk/A9ku0KWyo8q7HCj344Xyq?=
 =?us-ascii?Q?SE8X0pVxonGr9Vh6omvJo9Lt25R7FrfzEuod4llLVdVvHpboBXZKHIIGNZPD?=
 =?us-ascii?Q?CUXMgKzAG/bcvKH4mz6MyNnqOyW3GCrp3QyV668cVIA5K2V9XNnL9quiZTJv?=
 =?us-ascii?Q?VgpWgT35ss9zwQk/WwzcVxWZ1xrZExSjAC6xZaScx9TatnuEWleXzJ/23TH8?=
 =?us-ascii?Q?mOOegP+kg9sEOAfb0ZqXFp8gSIF+rYg6V89bM5+6rtGt6ztT/ofjLfn45V7y?=
 =?us-ascii?Q?QqsHbv+sI3MZpQ+yjfF/76RrGYh8uET55OUGexLseRgOpihIO8BUFzjWQMdp?=
 =?us-ascii?Q?d3PEn+u1sOD5fli5+f47GBwPE7D0gMGEZ/41YBBhXgP2A7RRibOgtQvox6Yg?=
 =?us-ascii?Q?kIX9tDq5dRbskOy0fSEC1U2/yIsVpTak4/Wn/KeaVozSWLfsDEugIYGREc5o?=
 =?us-ascii?Q?pyYemgrzTSUSdvmOa1YMy/DorMLzfCy+Zhov6keKDHxyN0hESZ4bIbEzsvzS?=
 =?us-ascii?Q?S+VDL8P0t6Hfy3gq4iwo3Wyd5RAfTt0Cj00R/wLUkmCP3mTmEBnn9uFcEdOl?=
 =?us-ascii?Q?84KLpm9tIYumxlCvNnVETfFYT7NY1p7feB6XbNO/+oXF0c1ZXvconZI4CK24?=
 =?us-ascii?Q?Fu1Rft2pljMWsCclHFQORfUg6ao4KGpgyYRSvxycKnPMJxAVOLyVcwucDvjJ?=
 =?us-ascii?Q?cizy/PMNYeBvSdNxpk2A1XWc5BHHhB0mgVBjOimEh/XUbxtiIVFs+YSifvCC?=
 =?us-ascii?Q?xMz0NOesG8Rc/GWs7hgSzcMMbcM6bi+LSdkMJBC61oekM6H1uwMjZDb/zVnQ?=
 =?us-ascii?Q?CuZpi9yYDnxzEnJDptVfbgiv03+w9FCaCPj+Vqc8bnsLqX+6o3qUqq4XVMLH?=
 =?us-ascii?Q?wlVD/O3gyn76yRYbyAsv364mEcKyE9iuOl3tWhXmiE4ivreTCtkaCXjX0gKE?=
 =?us-ascii?Q?d+3tt8zZeLQwR3ir767KdAY7oYX4MTJkTdEdSOZLU04scN507iPlnMY9bA0U?=
 =?us-ascii?Q?PAgaQ494kx33rO+X/M8MLStc6qNROAZSyir0ato1YX1o/y3da3Skev4Qu5ve?=
 =?us-ascii?Q?5KUo2OVPX5VUmWN8ey1Ji6teL0P3UhY4zciD9A2sZtb1HhUcyzC8Aps4juU0?=
 =?us-ascii?Q?8HsZJqCtezgRsgsGqiIzhQHQS5oMvZMG2bksng2QTDu8QjUupRrds8Fvn1ny?=
 =?us-ascii?Q?8ymAlnyoCyY9SwGLGs9ysawvotlCREaPOC26zwyeuhgeMyq5b8MOsEuQF8Ik?=
 =?us-ascii?Q?olalRbGOGGlmU7OaoZvhznyAb+21JbURRdFbl5GOq9tWX02OOGXAwIkOmeIa?=
 =?us-ascii?Q?HWATtonT6WBxBdcycxSX0JmQ7+VO9bOGrfSuKfWIJFmKyS//nvZ5FX2Vm+9Z?=
 =?us-ascii?Q?9lmGPOQxNsnwKR4OxpGSh5+/HosmLiwmGA1dHL7/0sjP6XAwvPXLbkkq8SFa?=
 =?us-ascii?Q?cSPIbfMA2ZarQ2W+O3k+B6uA/6x4PaWfKp5gXgWkIXhUeWiHsRFXkyruM8xc?=
 =?us-ascii?Q?KsL4XnQI3kRgws7zPSEjJbXwRfL9owi5a/Tuf2Up4QX/XtsaCpTIdIyeCzbL?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf037c6-7279-4cd0-2f49-08dc36d9de74
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:47:35.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEcrLUWx65lT3Nyz+foSZI6EMW4hfab/NN3gZ6BDiQd6CyNRcaxhG0lTTvqm8M3a8oze7nLOhRg3Yl9ckvV8xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "perf-sanity-tests.PMU_event_table_sanity.fail" on:

commit: 8c248155fb236f02a39ae1af6f89eee44bee05ae ("tools/perf: Pass the Counter constraint values in the pmu events")
https://github.com/atishp04/linux counter_delegation_rfc

in testcase: perf-sanity-tests
version: perf-x86_64-00c7b5f4ddc5-1_20230402
with following parameters:

	perf_compiler: clang



compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402262254.5bb566d3-oliver.sang@intel.com


besides, we also observed perf-sanity-tests.PMU_event_map_aliases.fail.

1e3a2a416cf758f5 8c248155fb236f02a39ae1af6f8
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     perf-sanity-tests.PMU_event_map_aliases.fail
           :6          100%           6:6     perf-sanity-tests.PMU_event_table_sanity.fail



 10: PMU events                                                      :
 10.1: PMU event table sanity                                        : FAILED!
 10.2: PMU event map aliases                                         : FAILED!
 10.3: Parsing of PMU event table metrics                            : Ok
 10.4: Parsing of PMU event table metrics with fake PMUs             : Ok
 10.5: Parsing of metric thresholds with fake PMUs                   : Ok



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240226/202402262254.5bb566d3-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

