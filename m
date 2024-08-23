Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999451C694
	for <oe-lkp@lists.linux.dev>; Fri, 23 Aug 2024 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724379725; cv=fail; b=MUbUpDZOtlrayb7Fpqds2LbNgQlC6u1bEmT9us4A0kLr9BrPwSu2VEQLo0cX+uObSxdjBrWdjZq4bWwmOeehkUdgIzoV+RbMpI+lgyuS5/uJl8Ynq+bZRQoJxIfkfpiflnAvGiyjgcm4juUVjt0z3YtdXrYwTre/pAEbgLCf5EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724379725; c=relaxed/simple;
	bh=NvG1P5iEO6AzBqByIGYoc1jCxwTgZxZ0Sf9F5Kp0FSM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rfJEzjSUMREkLIkP12TTgB3nIe/r6RTYPsg8Si/eUlrPOw4XFpfQdJbJwWt1itkfp7hlXQOpTQ6WSGYbJ6iWjuyIypOY3/E08LE4KRIpztNWuP4SODqRBfxEtl66WMZwJt9gR/6YICQsXHN9s/V5+dhhlT07vLW4KXTi84EicAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHFnlmvI; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHFnlmvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724379722; x=1755915722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvG1P5iEO6AzBqByIGYoc1jCxwTgZxZ0Sf9F5Kp0FSM=;
  b=eHFnlmvIrNWvzNTSE4pyx/i76jOdw281D30W8dnEEOWXoif6IpAgSQeK
   RX/ZW52zMIqvAilC6DqcELKZolw1t0COWNCpvGM3tTfql3XKX7yfiXiHO
   WSv7HlK1UJboIEgNx8XdSa3aBu4UFosBg6Ofa3EnTJ4z3OFPeVV9pnPkb
   oQTSYPq/kxBGFmVldXgBXjfouwdvU3BanE5n1C8PBu0P+tujcnwEx5LuS
   3o5K+vwHZjHAuOEj5krjFkh2KCNjGShQedXBvFrJjZrLyyTS7LaG4+cl0
   4eNP5fUBDqbBpY4EiEZGpEOy/aN4CwTsBINDUY4LudshHxut3ZNSTtAx1
   Q==;
X-CSE-ConnectionGUID: Rycv9mnwRvWIiUxfqywy/Q==
X-CSE-MsgGUID: yhIVoQkZR2KWwkDbdem79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22957234"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="22957234"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 19:22:02 -0700
X-CSE-ConnectionGUID: YZkC2sEdTlyG6nclEN8Pcg==
X-CSE-MsgGUID: llH11L3ARimddpTE8r/73g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="62176186"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Aug 2024 19:22:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 19:22:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 19:22:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 19:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv8u4HkNcv13GA0+gM5L0tpG9d+DiYgvgorXEtXmIc7f4+nX80mlzC5x7MMwP30tJvLK6f8kOvIt+0CAxqXK2oHhshGk11bByc6N3BNiXc9TdRItwppzCN/36P+PVGzb/HO0m6+GNHuD1qz6naWwkRC/DjT0OdpANVeTE87MiYx6J0hLu5DX+eaN65whieqiYg05myTK4rpXdapUP3WKSnygaGrSlE9veo/FSsm5pMY/uwfm38+2qBbZGWvLu7MfqK7P4uNl50V3pwjE6drKhE1feUaGY/YuBXO7imM7qCSSxUTCH/VlX4vjNHc8Iw7ElJDvjbxABz3JAlDUHWbqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gScuZOsUHs05CnmncTWPMx9I3mcT7cA3v3ABcVUSHBo=;
 b=f9SeT68j8AmwugvZS+WZecZ7uaFircDRCQArBezSBEGi2edTe/9ZdNdwZhoOuBKRhW+NUdib8IrJVNa+RQqdRWI/I4YbE2d3Qvh0mWQLZiNTDiF7zxwO0RDNyRRX4l53sJKqR3W2/yEYF+11JL0RWneCK9FY5c//QXs78oMJjnbOQV18TIgkKkbGpsoTf0uI5naXIdxP76ioDAihBOQLWsHjHyiq/ussFmNo9MWuOym76aPz7PHp4tmvCFimGtE9d7mxJqUkqFJ/a1aXAcbUUTyoadPLJjifNbedJQPdPFaIpf4VxGqBTw/JoLuoBoQxBSwJSVDDwE1j5VentWqgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 02:21:59 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 02:21:58 +0000
Date: Fri, 23 Aug 2024 10:21:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/posix] [signal]  fcbc96276c:
 WARNING:at_kernel/signal.c:#__send_signal_locked
Message-ID: <202408231026.8488f706-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: f361cc87-f60e-4d2d-4d6e-08dcc31a5daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HoMnqZFYaKZN81g2hM8a12Zoc3REwo36FTOPE9gPKmLU+4I7/Ad45+jD6cVS?=
 =?us-ascii?Q?GYaec0cHv4O8fqJEFabSiAAUzZqRAeEv4XuCs/Z7LfSurXgfhvNNMdSmqqng?=
 =?us-ascii?Q?JjutoYtQ4qJnRQQNETBXp1mC5KFE8IOtWHWo/Ntp1YIPuGoSDHdPwpaW458k?=
 =?us-ascii?Q?Cqs/dixzKJJDaL1+UAKffI6rW0HRwkXWItYcOT6uJJ0OeoQgREon6DQvD5d/?=
 =?us-ascii?Q?1u2JcnVSdZ33KICMF3zD/M8F9EnxGkvO6WUsExbFw3tpQ7+uj/3L0JMSrmhk?=
 =?us-ascii?Q?zTBKEq9L+Ojxk2JE1x6NjCNnCm9vA62EA4eXFhzSDZUrmOQ73WkVIprV9a6E?=
 =?us-ascii?Q?n7Pog9A07erywVWiUu4UXq/9qNpDPzZxjBIroGy7pieMicPh4Sre2Zl9YHah?=
 =?us-ascii?Q?i1C5kNeQw1IsP7M1xKhNHZ6LqYhKGlE0f15jIHnnBKugJ4zqdUc3V88rajYD?=
 =?us-ascii?Q?pQv7kmUv7bQsEBQ2ttXUA14mV0AHUsE4nH63vv7X0DG99gf5y3p5AgBHqXX2?=
 =?us-ascii?Q?/+uxrUR2jfeP3FLQs0bKvaqLj8OJHJDPz+cmHkOAu18UwAahBNrOaxgt/siJ?=
 =?us-ascii?Q?8UHI/gjONkSWCqMDjg5w44trUwTE+RArJCAtLAWRSNyYxpimVnRKaU9rF9+d?=
 =?us-ascii?Q?r2gAbMPeMFCPsm2nAYf0d/wa1c0yWYqmONkgdeQDZ8T0bpNbOiXQdAEdwU5C?=
 =?us-ascii?Q?0KKRY+1kEMl5qf9QzYAadmDbsAWR2rT9sxf3q4wJYROObHGwCW3ndF0rtpUx?=
 =?us-ascii?Q?0Zq4MERj96kxcB14n09yhWqNA4Q+d6DjXWaFnG/XJobOy+fpzLaqqPB/PNgS?=
 =?us-ascii?Q?GjBK4T/mfT2yMSrjyf7odUDpspqEktdbDjZSNiDDM3C1a+8b1oWV4lOm1xJm?=
 =?us-ascii?Q?xqDsE1berp6gXvxJ+LTOT/STBeARW7zFp8T0yaTtvOYNZp6OToapitqAUNYL?=
 =?us-ascii?Q?m7DABtwqrg/0P3QhmgJk9NVIkOOiWGSfHG818LKrF/SZOe2EjX8nSNvyojld?=
 =?us-ascii?Q?OKa1eqjJor0QL3pbAd8Vx2PQ0EZrUEFZNsmfPuFwR1bLozP8iRknk/DXRDAd?=
 =?us-ascii?Q?iZryLwF1LGxiIi0G+OMrq2Kxyt+c6zkiIMI2TZBQlhUhLKNsTG2tadY+Llmn?=
 =?us-ascii?Q?D26B1/hmRMn4CYGOD+HHwb/UELC+EifodppqFRmvHpZCXTkIcR6dE623Bwj+?=
 =?us-ascii?Q?jEOXX/JmH6yDfh3C4g9c0N31Yfy6JeH+IEidMVmOpi1ax2WLMF+Ew5LF88Fz?=
 =?us-ascii?Q?U66UbpWivTmlaUphS+Z8YLnNpPvkXjHmBTbyvrXqBTHFpA3GAYQtRrihm2yQ?=
 =?us-ascii?Q?bpgPyGxLerKI37wN3zaEgz7T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?222x2cpzHYHK8mer6IUg98c3Ir3cUKeHuxzgEdgnDrweL/diBRvIB7P+3RVW?=
 =?us-ascii?Q?GcWy4Sf3fGOljTMvXbX/O7YraHDtEjm4uzUa/yXL6Ma8i1HgnQGOjkJbqaPR?=
 =?us-ascii?Q?M3nAPbWuS42TKywsRHnn5yOgPDMs5EkiFHxNbHGngS6QYHccwZDjqW8ym+7U?=
 =?us-ascii?Q?LHYjqMR7zFzX8ZoREpK0KCNJScwLiBHyJmKzy2QmGIZHnJw+OTVyaOv7A5d7?=
 =?us-ascii?Q?7d+9AtkBX23VzZ9DQyhDlLQEzGrAPvmKwSeCrgs9h0kQYgBcTlKijZgS08OF?=
 =?us-ascii?Q?In4rLP25QIQ4qiREcadtDit37VFhDrKQeBA60KDkKiah/FXxnioNkH+4Xke9?=
 =?us-ascii?Q?++f+oAXXuFbPLpybTsW7TpFYjJUNb4PLQIffXuVVMAyvOcaQuIGx3op8uHfX?=
 =?us-ascii?Q?mdK94LKQ4b2stPWNg+vCHb+QWzNHTxvxVHpNc8y6YgW6Q2b08bh86TPcu9k3?=
 =?us-ascii?Q?MOlAFrgOVA5RqZ/Uhv5aTm/LPHtXfjyYe/IZOvLJLbQKmZsQnJE+jSGtiJfW?=
 =?us-ascii?Q?lZS4iuifGPp8ytpoK6xRLjGW6VHo1PKSV9Y6f1zCZKr4bSO0XX5nP7WOKXfD?=
 =?us-ascii?Q?0K2yXIUQH4CxPaVdL2h4pxWhXFmexf1Jb2KbCkJ6elhimDoiIN4qUeP4YKt4?=
 =?us-ascii?Q?eXgJYERxWovbGB7/ysZ0uu9g1Mz93/FjBXNgdYkzHeN1c24q+ym3YqxSDNrk?=
 =?us-ascii?Q?AWY53Dcpr3dqoS0xMYSIX/GuWRZK/MR6MNI54Ag9RFuzVRLXAeH82Qiyhi6l?=
 =?us-ascii?Q?/+LFXL1pyDXxADW4Az7tYwEPWeonj4zyMlKshbR2HU0f+Y6ZeCQf3EdLzKUt?=
 =?us-ascii?Q?Vfzg6oCfyZvRuZwDRlbR0HMLjzdSmRDEYO3gn99y2ozhkPRtIYnB+uIDPFr/?=
 =?us-ascii?Q?X0j04eFtGKdOqmQgaPnBngixzitutoQw7kg5cpEVDmiKWREK1ClVfGpSaOrq?=
 =?us-ascii?Q?NjJ7bcd3pcvn5AXh/I/t3fHz/kBFU1/CBIcKJR0YeiQ42hbWE0i9UdULP8BD?=
 =?us-ascii?Q?QRfjMaEBR/DJh0Tk/1lTEFir6BVDIe+t9wv0UDh2LPIfrpdn0M67v50kHu/t?=
 =?us-ascii?Q?+JBrWiU91U9KKH465kLaRDEmEDTrghxtAlehXon1Vq7TRFuaX2ZsGtY47tjQ?=
 =?us-ascii?Q?h53vFtkfce9W8NM3tXrnhzRW3NXX7iq8wMZM0gWbq63Vlt3AnliT8m4PFCKX?=
 =?us-ascii?Q?ylK/I3jQTw8oLvfX92mRmaEKCXe8DC8epKl33ZQwNHFBjhw6Gg1Eui7TuceH?=
 =?us-ascii?Q?y0FgKag6+IBpsLnwz3NaucVWp3PNtuz291S8twLaWcBucN1FPsydrx3RUSbw?=
 =?us-ascii?Q?K647Hcym+hIhKYuaSPOwNiI/DTEu7sk1kdFxF8iORxDGDlpRV8/eM3dHASlU?=
 =?us-ascii?Q?Q5Nmla0SK1BymfT6OqsB+/meb9E7RcKiVipkmoyIoh403BsKkkxkmfW7NfQE?=
 =?us-ascii?Q?glNxM3M3X6wueZAIxwud/PRRUG/gTUKGbzTKHpsYlX8OsfHAU/yam16jCSBX?=
 =?us-ascii?Q?Sy9ZMPr2mhX+kFmW0KayQMrzU2ejrUHOqKeOzZ9CmakSU5EcYf7sCoNCiqx5?=
 =?us-ascii?Q?6eWKqew7wdGFP85wD7I/g+wxtKLa/d49TpgWnerBCl+fGr5pO3Rd9KWejyiX?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f361cc87-f60e-4d2d-4d6e-08dcc31a5daa
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 02:21:58.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58uWJQ3tTTCnVD6+jc+sqvnDkIwfTVfUTObGS6VBRwtRVy4+mZQH2oyBvkxB7YfQpcs7NkIymBhDP11fRKppSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
X-OriginatorOrg: intel.com



Hello,


we noticed WARN_ON_ONCE added in this commit hit in our tests. below detail
reports FYI.


kernel test robot noticed "WARNING:at_kernel/signal.c:#__send_signal_locked" on:

commit: fcbc96276c22a1d146eaac0cff24b8149c2d967a ("signal: Get rid of resched_timer logic")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/posix

in testcase: kernel-selftests
version: kernel-selftests-x86_64-977d51cf-1_20240508
with following parameters:

	group: group-02



compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408231026.8488f706-oliver.sang@intel.com


kern  :warn  : [  548.450445] ------------[ cut here ]------------
kern :warn : [  548.451218] WARNING: CPU: 13 PID: 12384 at kernel/signal.c:1004 __send_signal_locked (kernel/signal.c:1004) 
kern  :warn  : [  548.452135] Modules linked in: ramoops reed_solomon nfc rfkill netconsole openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 psample intel_rapl_msr intel_rapl_common skx_edac_common nfit libnvdimm x86_pkg_temp_thermal intel_powerclamp btrfs coretemp kvm_intel blake2b_generic xor zstd_compress kvm raid6_pq crct10dif_pclmul crc32_pclmul libcrc32c crc32c_intel ghash_clmulni_intel sha512_ssse3 rapl intel_cstate ahci nvme mei_me libahci ipmi_devintf ipmi_msghandler intel_uncore wmi_bmof mxm_wmi intel_wmi_thunderbolt wdat_wdt libata nvme_core mei i2c_i801 ioatdma i2c_smbus dca wmi binfmt_misc loop fuse drm dm_mod ip_tables sch_fq_codel
kern  :warn  : [  548.457355] CPU: 13 UID: 0 PID: 12384 Comm: peeksiginfo Tainted: G S                 6.11.0-rc1-00028-gfcbc96276c22 #1
kern  :warn  : [  548.458418] Tainted: [S]=CPU_OUT_OF_SPEC
kern  :warn  : [  548.458902] Hardware name: Gigabyte Technology Co., Ltd. X299 UD4 Pro/X299 UD4 Pro-CF, BIOS F8a 04/27/2021
kern :warn : [  548.460122] RIP: 0010:__send_signal_locked (kernel/signal.c:1004) 
kern :warn : [ 548.460718] Code: 7c 24 08 49 89 f0 49 d3 e8 41 83 e0 01 49 83 fa 3f 0f 87 44 82 bd 02 45 85 c0 74 18 41 b8 02 00 00 00 45 31 f6 e9 32 ff ff ff <0f> 0b 45 31 f6 e9 3d ff ff ff 83 fd 09 0f 84 16 01 00 00 48 b8 00
All code
========
   0:	7c 24                	jl     0x26
   2:	08 49 89             	or     %cl,-0x77(%rcx)
   5:	f0 49 d3 e8          	lock shr %cl,%r8
   9:	41 83 e0 01          	and    $0x1,%r8d
   d:	49 83 fa 3f          	cmp    $0x3f,%r10
  11:	0f 87 44 82 bd 02    	ja     0x2bd825b
  17:	45 85 c0             	test   %r8d,%r8d
  1a:	74 18                	je     0x34
  1c:	41 b8 02 00 00 00    	mov    $0x2,%r8d
  22:	45 31 f6             	xor    %r14d,%r14d
  25:	e9 32 ff ff ff       	jmpq   0xffffffffffffff5c
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	45 31 f6             	xor    %r14d,%r14d
  2f:	e9 3d ff ff ff       	jmpq   0xffffffffffffff71
  34:	83 fd 09             	cmp    $0x9,%ebp
  37:	0f 84 16 01 00 00    	je     0x153
  3d:	48                   	rex.W
  3e:	b8                   	.byte 0xb8
	...

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	45 31 f6             	xor    %r14d,%r14d
   5:	e9 3d ff ff ff       	jmpq   0xffffffffffffff47
   a:	83 fd 09             	cmp    $0x9,%ebp
   d:	0f 84 16 01 00 00    	je     0x129
  13:	48                   	rex.W
  14:	b8                   	.byte 0xb8
	...
kern  :warn  : [  548.462464] RSP: 0018:ffffc90002eefce8 EFLAGS: 00010046
kern  :warn  : [  548.463057] RAX: 0000000000000000 RBX: ffff888869510000 RCX: 0000000000000000
kern  :warn  : [  548.463818] RDX: 1ffff920005ddfd2 RSI: ffff88811882ae58 RDI: ffffc90002eefe90
kern  :warn  : [  548.464580] RBP: 0000000000000022 R08: 0000000000000001 R09: ffff8882172b3b00
kern  :warn  : [  548.465340] R10: ffffffff8787dc57 R11: 0000000000000040 R12: ffffc90002eefe88
kern  :warn  : [  548.466100] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
kern  :warn  : [  548.466861] FS:  00007f8dae5ae740(0000) GS:ffff888805a80000(0000) knlGS:0000000000000000
kern  :warn  : [  548.467701] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [  548.468334] CR2: 000055db79b8a028 CR3: 000000016e65c003 CR4: 00000000003706f0
kern  :warn  : [  548.469094] DR0: 0000560cd2b382a8 DR1: 0000000000000000 DR2: 0000000000000000
kern  :warn  : [  548.469856] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
kern  :warn  : [  548.470615] Call Trace:
kern  :warn  : [  548.470970]  <TASK>
kern :warn : [  548.471298] ? __warn (kernel/panic.c:735) 
kern :warn : [  548.471722] ? __send_signal_locked (kernel/signal.c:1004) 
kern :warn : [  548.472262] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
kern :warn : [  548.472723] ? handle_bug (arch/x86/kernel/traps.c:239) 
kern :warn : [  548.473167] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
kern :warn : [  548.473638] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
kern :warn : [  548.474151] ? __send_signal_locked (kernel/signal.c:1004) 
kern :warn : [  548.474689] ? __send_signal_locked (kernel/signal.c:1002 (discriminator 1)) 
kern :warn : [  548.475226] ? send_signal_locked (kernel/signal.c:1117 kernel/signal.c:1150) 
kern :warn : [  548.475733] ? __lock_task_sighand (kernel/signal.c:1343) 
kern :warn : [  548.476263] group_send_sig_info (include/linux/sched/signal.h:753 kernel/signal.c:1225 kernel/signal.c:1374) 
kern :warn : [  548.476775] ? __pfx_group_send_sig_info (kernel/signal.c:1366) 
kern :warn : [  548.477328] ? lock_is_held_type (kernel/locking/lockdep.c:5500 kernel/locking/lockdep.c:5831) 
kern :warn : [  548.477834] ? kill_pid_info_type (kernel/signal.c:1406) 
kern :warn : [  548.478340] kill_pid_info_type (kernel/signal.c:1414) 
kern :warn : [  548.478836] kill_proc_info (kernel/signal.c:1428 kernel/signal.c:1435) 
kern :warn : [  548.479302] __x64_sys_rt_sigqueueinfo (kernel/signal.c:4047 kernel/signal.c:4040 kernel/signal.c:4040) 
kern :warn : [  548.479860] ? __pfx___x64_sys_rt_sigqueueinfo (kernel/signal.c:4040) 
kern :warn : [  548.480455] ? do_user_addr_fault (include/linux/rcupdate.h:336 include/linux/rcupdate.h:869 include/linux/mm.h:715 arch/x86/mm/fault.c:1340) 
kern :warn : [  548.480976] ? do_user_addr_fault (include/linux/rcupdate.h:871 include/linux/mm.h:715 arch/x86/mm/fault.c:1340) 
kern :warn : [  548.481497] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :warn : [  548.481955] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :warn  : [  548.482527] RIP: 0033:0x7f8dae6b2719
kern :warn : [ 548.482981] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
kern  :warn  : [  548.484728] RSP: 002b:00007ffc4ad94ec8 EFLAGS: 00000202 ORIG_RAX: 0000000000000081
kern  :warn  : [  548.485527] RAX: ffffffffffffffda RBX: 00007ffc4ad95128 RCX: 00007f8dae6b2719
kern  :warn  : [  548.486288] RDX: 00007ffc4ad94f80 RSI: 0000000000000022 RDI: 0000000000003061
kern  :warn  : [  548.487049] RBP: 00007ffc4ad94ee0 R08: 00007f8dae7ac6a0 R09: 00007ffc4ad94f80
kern  :warn  : [  548.487808] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
kern  :warn  : [  548.488568] R13: 00007ffc4ad95138 R14: 000055db79b89dd8 R15: 00007f8dae7da020
kern  :warn  : [  548.489340]  </TASK>
kern  :warn  : [  548.489674] irq event stamp: 17074
kern :warn : [  548.490112] hardirqs last enabled at (17073): do_syscall_64 (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 include/linux/entry-common.h:197 arch/x86/entry/common.c:79) 
kern :warn : [  548.490984] hardirqs last disabled at (17074): _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108 kernel/locking/spinlock.c:162) 
kern :warn : [  548.491917] softirqs last enabled at (16992): fpu_clone (include/linux/bottom_half.h:33 arch/x86/include/asm/fpu/api.h:80 arch/x86/kernel/fpu/core.c:634) 
kern :warn : [  548.492766] softirqs last disabled at (16990): fpu_clone (arch/x86/include/asm/current.h:49 arch/x86/kernel/fpu/core.c:631) 
kern  :warn  : [  548.493614] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240823/202408231026.8488f706-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

